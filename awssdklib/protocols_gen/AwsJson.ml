module type S = sig
  type http
  type json_type = Yojson.Basic.t

  type error =
    [ AwsErrors.t
    | `HttpError of Http.http_failure
    | `JsonParseError of Json.DeserializeHelpers.jsonParseError ]

  val request :
    shape_name:string ->
    service:Service.descriptor ->
    config:Config.t ->
    http:http ->
    input:json_type ->
    output_deserializer:(json_type -> string list -> 'res) ->
    error_deserializer:
      (json_type ->
      string list ->
      ([> `HttpError of Http.http_failure
       | `JsonParseError of Json.DeserializeHelpers.jsonParseError ]
       as
       'error)) ->
    ('res, 'error) result

  val error_deserializer :
    (json_type -> string list -> string * string -> 'a) -> json_type -> string list -> 'a

  module Errors : sig
    type 'a handler = json_type -> string list -> string * string -> 'a

    val default_deserializer :
      json_type -> string list -> string * string -> AwsErrors.aws_service_error

    val default_handler : json_type -> string list -> string * string -> [> AwsErrors.t ]
  end
end

(* Common definitions used by both functor and first-class module implementations *)
let json_to_string = Yojson.Basic.to_string
let json_of_string = Yojson.Basic.from_string

type json_type = Yojson.Basic.t

type error =
  [ AwsErrors.t
  | `HttpError of Http.http_failure
  | `JsonParseError of Json.DeserializeHelpers.jsonParseError ]

module Errors = struct
  open AwsErrors

  type 'a handler = Json.DeserializeHelpers.t -> string list -> string * string -> 'a

  let default_deserializer tree path _type =
    let open Json.DeserializeHelpers in
    let obj = assoc_of_yojson tree path in
    let message = option_of_yojson (value_for_key string_of_yojson "message") obj path in
    { message; _type }

  let default_handler (tree : Json.DeserializeHelpers.t) (path : string list)
      ((namespace, name) : string * string) : [> t ] =
    `AWSServiceError (default_deserializer tree path { namespace; name })
end

(* First-class module implementation for HTTP client substitution *)
let request_with_http_module (type http_client) 
    ~(http_module : (module Http.Client_intf with type t = http_client))
    ~(http : http_client)
    ~(shape_name : string) 
    ~(service : Service.descriptor) 
    ~(config : Config.t)
    ~(input : json_type) 
    ~(output_deserializer : json_type -> string list -> 'res) 
    ~(error_deserializer : json_type -> string list -> 'error) =
  let module Http_module = (val http_module) in
  let open Json.DeserializeHelpers in
  let ( let* ) = Result.bind in
  let ( let+ ) res map = Result.map map res in
  let uri = Service.makeUri ~config ~service in
  let body = json_to_string input in
  let headers =
    [ ("Content-Type", "application/x-amz-json-1.0"); ("X-Amz-Target", shape_name) ]
  in
  let auth = config.resolveAuth () in
  let region = config.resolveRegion () in
  let headers = Sign.sign_request_v4 ~config ~service ~uri ~method_:`POST ~headers ~body in
  match Http_module.request ~method_:`POST ~headers ~body:(`String body) ~uri http with
  | Ok (response, body) -> begin
      let body = body |> Http_module.Body.to_string in
      Fmt.pr "Response body: %s" body;
      let body_res =
        body |> json_of_string ~fname:(Fmt.str "%s.%s" service.endpointPrefix shape_name)
      in

      match response |> Http_module.Response.status with
      | x when x >= 200 && x < 300 ->
          (deserialize_res output_deserializer) body_res
          |> Result.map_error (fun e -> `JsonParseError e)
      | _ -> (
          match (deserialize_res error_deserializer) body_res with
          | Ok error -> Error error
          | Error error -> Error (`JsonParseError error))
    end
  | Error error -> Error (`HttpError error)

let error_deserializer handler tree path =
  let _obj = Json.DeserializeHelpers.assoc_of_yojson tree path in
  let _type =
    Json.DeserializeHelpers.value_for_key Json.DeserializeHelpers.string_of_yojson "__type" _obj
      path
  in
  let typepair =
    match String.split_on_char '#' _type with
    | namespace :: name :: _ -> (namespace, name)
    | _ -> ("", _type)
  in
  handler tree path typepair

(* Backward compatible functor implementation - now uses first-class module internally *)
module Make (Http_module : Http.Client_intf) = struct
  type http = Http_module.t
  type json_type = Yojson.Basic.t

  let json_to_string = json_to_string
  let json_of_string = json_of_string

  module Errors = Errors
  
  type error =
    [ AwsErrors.t
    | `HttpError of Http.http_failure
    | `JsonParseError of Json.DeserializeHelpers.jsonParseError ]

  let request ~(shape_name : string) ~(service : Service.descriptor) ~(config : Config.t)
      ~(input : json_type) ~(output_deserializer : json_type -> string list -> 'res) ~http
      ~(error_deserializer : json_type -> string list -> 'error) =
    let http_module = (module Http_module : Http.Client_intf with type t = Http_module.t) in
    request_with_http_module ~http_module ~http ~shape_name ~service ~config ~input
      ~output_deserializer ~error_deserializer

  let error_deserializer = error_deserializer
end
