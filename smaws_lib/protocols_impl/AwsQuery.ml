module Log =
  (val Logs.src_log (Logs.Src.create "Smaws_Lib.AwsQuery" ~doc:"AWS Query Protocol") : Logs.LOG)

module Error = struct
  type errorType = Sender | Receiver
  type t = { errorType : errorType; code : string }
end

type error =
  [ `HttpError of Http.http_failure
  | `XmlParseError of string
  | `AWSServiceError of AwsErrors.aws_service_error ]

let error_to_string = function
  | `HttpError e -> Fmt.str "%a" Http.pp_http_failure e
  | `XmlParseError s -> Fmt.str "XmlParseError: %s" s
  | `AWSServiceError e -> Fmt.str "%a" AwsErrors.pp_aws_service_error e

let pp_error fmt e = Fmt.pf fmt "%s" (error_to_string e)

module Serialize = struct
  let join_path path = String.concat "." path
  let string_field path v = [ (join_path path, [ v ]) ]
  let int_field path v = string_field path (string_of_int v)
  let bool_field path v = string_field path (string_of_bool v)
  let float_field path v = string_field path (Printf.sprintf "%g" v)
  let blob_field path v = string_field path (Base64.encode_exn (Bytes.to_string v))

  let timestamp_iso_field path (v : Ptime.t) =
    let s = Ptime.to_rfc3339 ~tz_offset_s:0 v in
    let len = String.length s in
    let normalized =
      if len >= 6 && String.sub s (len - 6) 6 = "+00:00" then
        String.sub s 0 (len - 6) ^ "Z"
      else s
    in
    string_field path normalized

  let timestamp_epoch_field path (v : Ptime.t) =
    let posix = Ptime.to_float_s v in
    let s =
      if Float.is_integer posix then string_of_int (int_of_float posix)
      else Printf.sprintf "%g" posix
    in
    string_field path s

  let list_to_query member_tag item_f path = function
    | [] -> [ (join_path path, [ "" ]) ]
    | items ->
        let i = ref 0 in
        List.concat_map
          (fun item ->
            incr i;
            item_f (path @ [ member_tag; string_of_int !i ]) item)
          items

  let flattened_list_to_query item_f path = function
    | [] -> []
    | items ->
        let i = ref 0 in
        List.concat_map
          (fun item ->
            incr i;
            item_f (path @ [ string_of_int !i ]) item)
          items

  let map_to_query key_tag value_tag key_f value_f path entries =
    let i = ref 0 in
    List.concat_map
      (fun (k, v) ->
        incr i;
        let ep = path @ [ "entry"; string_of_int !i ] in
        key_f (ep @ [ key_tag ]) k @ value_f (ep @ [ value_tag ]) v)
      entries

  let flattened_map_to_query key_tag value_tag key_f value_f path entries =
    let i = ref 0 in
    List.concat_map
      (fun (k, v) ->
        incr i;
        let ep = path @ [ string_of_int !i ] in
        key_f (ep @ [ key_tag ]) k @ value_f (ep @ [ value_tag ]) v)
      entries
end

module Errors = struct
  let default_handler (error : Error.t) =
    `AWSServiceError
      AwsErrors.
        {
          message = None;
          _type = { namespace = ""; name = error.code };
        }
end

module Response = struct
  exception Unparseable of string * string

  let parse_xml_ok_response ~(action : string) ~(xmlNamespace : string) ~(body : string)
      ~resultParser =
    let open Xml.Parse in
    let xmlSource = source_with_encoding ~src:body ~encoding:None in
    Read.dtd xmlSource;
    Read.sequence xmlSource (action ^ "Response") ~ns:xmlNamespace
      (fun _ _ ->
        Read.sequence xmlSource (action ^ "Result") (fun i _ -> resultParser i) ())
      ()

  let parse_xml_error_response ~(body : string) =
    let open Xml.Parse in
    let xmlSource = source_with_encoding ~src:body ~encoding:None in
    Read.dtd xmlSource;
    try
      Read.sequence xmlSource "ErrorResponse"
        (fun _ _ ->
          Read.sequence xmlSource "Error"
            (fun i _ ->
              let type_ = Read.element i "Type" () in
              let code = Read.element i "Code" () in
              let errorType =
                match type_ with
                | "Sender" -> Error.Sender
                | "Receiver" -> Error.Receiver
                | _ -> raise (Unparseable ("Unknown Error type (expected Sender/Receiver)", body))
              in
              Error.{ errorType; code })
            ())
        ()
    with
    | Xml.Parse.XmlParse _ -> raise (Unparseable ("xmlm error", body))
    | Xml.Parse.XmlUnexpectedConstruct (_, _, _) -> raise (Unparseable ("construct error", body))
end

let error_deserializer handler (error : Error.t) = handler error

let request (type http_t) ~(action : string) ~(xmlNamespace : string)
    ~(service : Service.descriptor) ~(context : http_t Context.t)
    ~(fields : (string * string list) list)
    ~(output_deserializer : Xmlm.input -> 'out)
    ~(error_deserializer : Error.t -> 'err) =
  let config = Context.config context in
  let uri = Service.makeUri ~config ~service in
  let body_values = ("Action", [ action ]) :: ("Version", [ service.version ]) :: fields in
  let body = Uri.encoded_of_query body_values in
  let headers = [ ("Content-Type", "application/x-www-form-urlencoded") ] in
  let headers = Sign.sign_request_v4 ~config ~service ~uri ~method_:`POST ~headers ~body in
  let module Http = (val Context.http_type context : Http.Client with type t = http_t) in
  let http = Context.http context in
  Logs.debug (fun m -> m "Action %s on %s\n" action (Uri.to_string uri));
  Logs.debug (fun m -> m "Sending body %s\n" body);
  match Http.request ~method_:`POST ~headers ~body:(`String body) ~uri http with
  | Ok (response, body) -> begin
      let status = Http.Response.status response in
      let body = match Http.Body.to_string body with Some body -> body | None -> "" in
      match status with
      | x when x >= 200 && x < 300 -> (
          try
            Ok
              (Response.parse_xml_ok_response ~action ~xmlNamespace ~body
                 ~resultParser:output_deserializer)
          with
          | Response.Unparseable (msg, _) -> Error (`XmlParseError msg)
          | Xml.Parse.XmlParse e -> Error (`XmlParseError (Xmlm.error_message e))
          | Xml.Parse.XmlUnexpectedConstruct (_, _, _) -> Error (`XmlParseError "unexpected XML construct"))
      | _ -> (
          try
            let error = Response.parse_xml_error_response ~body in
            Error (error_deserializer error)
          with
          | Response.Unparseable (msg, _) -> Error (`XmlParseError msg)
          | Xml.Parse.XmlParse e -> Error (`XmlParseError (Xmlm.error_message e))
          | Xml.Parse.XmlUnexpectedConstruct (_, _, _) ->
              Error (`XmlParseError "unexpected XML construct"))
    end
  | Error http_failure -> Error (`HttpError http_failure)
