(* module type S = sig *)
(*   type http *)
(*   type json_type = Yojson.Basic.t *)
(**)
(*   type error = *)
(*     [ AwsErrors.t *)
(*     | `HttpError of Http.http_failure *)
(*     | `JsonParseError of Json.DeserializeHelpers.jsonParseError ] *)
(**)
(*   val request : *)
(*     shape_name:string -> *)
(*     service:Service.descriptor -> *)
(*     config:Config.t -> *)
(*     http:http -> *)
(*     input:json_type -> *)
(*     output_deserializer:(json_type -> string list -> 'res) -> *)
(*     error_deserializer: *)
(*       (json_type -> *)
(*       string list -> *)
(*       ([> `HttpError of Http.http_failure *)
(*        | `JsonParseError of Json.DeserializeHelpers.jsonParseError ] *)
(*        as *)
(*        'error)) -> *)
(*     ('res, 'error) result *)
(**)
(*   val error_deserializer : *)
(*     (json_type -> string list -> string * string -> 'a) -> json_type -> string list -> 'a *)
(**)
(*   module Errors : sig *)
(*     type 'a handler = json_type -> string list -> string * string -> 'a *)
(**)
(*     val default_deserializer : *)
(*       json_type -> string list -> string * string -> AwsErrors.aws_service_error *)
(**)
(*     val default_handler : json_type -> string list -> string * string -> [> AwsErrors.t ] *)
(*   end *)
(* end *)

type json_type = Yojson.Basic.t

let json_to_string = Yojson.Basic.to_string
let json_of_string = Yojson.Basic.from_string

let normalize_error_name s =
  let without_uri = match String.index_opt s ':' with Some i -> String.sub s 0 i | None -> s in
  match String.split_on_char '#' without_uri with _ :: name :: _ -> name | _ -> without_uri

let find_header ~name headers =
  List.find_map
    (fun (k, v) -> if String.equal (String.lowercase_ascii k) name then Some v else None)
    headers

let error_name_from_headers headers =
  Option.map normalize_error_name (find_header ~name:"x-amzn-errortype" headers)

let rec assoc_find key = function
  | [] -> None
  | (k, v) :: _ when String.equal k key -> Some v
  | _ :: rest -> assoc_find key rest

let error_name_from_body body_json =
  match body_json with
  | `Assoc fields -> (
      match assoc_find "__type" fields with
      | Some (`String s) -> Some (normalize_error_name s)
      | _ ->
          Option.map normalize_error_name
            (match assoc_find "code" fields with Some (`String s) -> Some s | _ -> None))
  | _ -> None

let ensure_error_type ~(headers : Http.headers) (body_json : json_type) : json_type =
  let name_from_headers = error_name_from_headers headers in
  let name_from_body = error_name_from_body body_json in
  let name = match name_from_headers with Some n -> Some n | None -> name_from_body in
  match name with
  | Some name -> (
      match body_json with
      | `Assoc fields -> `Assoc (("__type", `String name) :: List.remove_assoc "__type" fields)
      | _ -> `Assoc [ ("__type", `String name) ])
  | None -> body_json

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

type error =
  [ AwsErrors.t
  | `HttpError of Http.http_failure
  | `JsonParseError of Json.DeserializeHelpers.jsonParseError ]

let error_to_string = function
  | `HttpError e -> Fmt.str "%a" Http.pp_http_failure e
  | `JsonParseError e -> Fmt.str "%a" Json.DeserializeHelpers.pp_jsonParseError e
  | `AWSServiceError e -> Fmt.str "%a" AwsErrors.pp_aws_service_error e

let pp_error fmt e = Fmt.pf fmt "%s" (error_to_string e)

let request_with_metadata (type http_t) ~(shape_name : string) ~(service : Service.descriptor)
    ~(context : http_t Context.t) ~(input : json_type)
    ~(output_deserializer : json_type -> string list -> 'res)
    ~(error_deserializer : json_type -> string list -> 'error) =
  let open Json.DeserializeHelpers in
  let ( let* ) = Result.bind in
  let ( let+ ) res map = Result.map map res in
  let config = Context.config context in
  let uri = Service.makeUri ~config ~service in
  let body = json_to_string input in
  let service_version =
    match service.protocol with
    | Service.AwsJson_1_0 -> "application/x-amz-json-1.0"
    | Service.AwsJson_1_1 -> "application/x-amz-json-1.1"
    | _ -> failwith "Unsupported service protocol"
  in
  let headers = [ ("Content-Type", service_version); ("X-Amz-Target", shape_name) ] in
  let auth = config.resolveAuth () in
  let region = config.resolveRegion () in
  let headers = Sign.sign_request_v4 ~config ~service ~uri ~method_:`POST ~headers ~body in
  let module Http = (val Context.http_type context : Http.Client with type t = http_t) in
  let http = Context.http context in
  match Http.request ~method_:`POST ~headers ~body:(`String body) ~uri http with
  | Ok (response, body) -> begin
      let response_headers = Http.Response.headers response in
      let request_id =
        let find ~f headers =
          List.find_map
            (fun (k, v) -> if f (String.lowercase_ascii k) then Some v else None)
            headers
        in
        match find ~f:(String.equal "x-amzn-requestid") response_headers with
        | Some _ as v -> v
        | None -> find ~f:(String.equal "x-amz-request-id") response_headers
      in
      let body = body |> Http.Body.to_string in

      let body_res =
        match body with
        | Some body when not (String.equal (String.trim body) "") ->
            Fmt.pr "Response body: %s" body;

            body |> json_of_string ~fname:(Fmt.str "%s.%s" service.endpointPrefix shape_name)
        | _ -> `Assoc []
      in

      match response |> Http.Response.status with
      | x when x >= 200 && x < 300 ->
          (deserialize_res output_deserializer) body_res
          |> Result.map (fun result -> { Response.response = result; metadata = { request_id } })
          |> Result.map_error (fun e -> `JsonParseError e)
      | _ -> (
          let error_body = ensure_error_type ~headers:response_headers body_res in
          match (deserialize_res error_deserializer) error_body with
          | Ok error -> Error error
          | Error error -> Error (`JsonParseError error))
    end
  | Error error -> Error (`HttpError error)

let request (type http_t) ~(shape_name : string) ~(service : Service.descriptor)
    ~(context : http_t Context.t) ~(input : json_type)
    ~(output_deserializer : json_type -> string list -> 'res)
    ~(error_deserializer : json_type -> string list -> 'error) =
  request_with_metadata ~shape_name ~service ~context ~input ~output_deserializer
    ~error_deserializer
  |> Result.map (fun { Response.response; _ } -> response)

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
