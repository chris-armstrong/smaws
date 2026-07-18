module Log =
  (val Logs.src_log (Logs.Src.create "Smaws_Lib.RestXml" ~doc:"AWS REST XML Protocol") : Logs.LOG)

module Error = struct
  type errorType = Sender | Receiver
  type t = { errorType : errorType; code : string; message : string option }
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

module Errors = struct
  let default_handler (error : Error.t) =
    `AWSServiceError
      AwsErrors.{ message = error.message; _type = { namespace = ""; name = error.code } }
end

module Serialize = struct
  let timestamp_iso_to_string (v : Ptime.t) =
    let s = Ptime.to_rfc3339 ~tz_offset_s:0 v in
    let len = String.length s in
    if len >= 6 && String.sub s (len - 6) 6 = "+00:00" then String.sub s 0 (len - 6) ^ "Z" else s

  let timestamp_epoch_to_string (v : Ptime.t) =
    let posix = Ptime.to_float_s v in
    if Float.is_integer posix then string_of_int (int_of_float posix) else string_of_float posix

  let timestamp_httpdate_to_string (v : Ptime.t) =
    let weekday_of_int = function
      | 0 -> "Sun"
      | 1 -> "Mon"
      | 2 -> "Tue"
      | 3 -> "Wed"
      | 4 -> "Thu"
      | 5 -> "Fri"
      | _ -> "Sat"
    in
    let month_of_int = function
      | 1 -> "Jan"
      | 2 -> "Feb"
      | 3 -> "Mar"
      | 4 -> "Apr"
      | 5 -> "May"
      | 6 -> "Jun"
      | 7 -> "Jul"
      | 8 -> "Aug"
      | 9 -> "Sep"
      | 10 -> "Oct"
      | 11 -> "Nov"
      | _ -> "Dec"
    in
    let (year, month, day), ((hour, min, sec), _) = Ptime.to_date_time v in
    let dow =
      Ptime.weekday ~tz_offset_s:0 v |> function
      | `Sun -> 0
      | `Mon -> 1
      | `Tue -> 2
      | `Wed -> 3
      | `Thu -> 4
      | `Fri -> 5
      | `Sat -> 6
    in
    Printf.sprintf "%s, %02d %s %04d %02d:%02d:%02d GMT" (weekday_of_int dow) day
      (month_of_int month) year hour min sec
end

(** Parse the default restXml error envelope:
    <ErrorResponse><Error><Type>...</Type><Code>...</Code><Message>...</Message>...
    </Error><RequestId>...</RequestId></ErrorResponse> Returns (Error.t, request_id option). *)
let parse_error_envelope ~body =
  let open Xml.Parse in
  run (fun () ->
      let xmlSource = source_with_encoding ~src:body ~encoding:None in
      Read.dtd xmlSource;
      Read.sequence xmlSource "ErrorResponse"
        (fun _ _ ->
          let error =
            Read.sequence xmlSource "Error"
              (fun i _ ->
                let r_type = ref None in
                let r_code = ref None in
                let r_message = ref None in
                Structure.scanSequence i [ "Type"; "Code"; "Message" ] (fun tag _ ->
                    match tag with
                    | "Type" -> r_type := Some (Read.element i "Type" ())
                    | "Code" -> r_code := Some (Read.element i "Code" ())
                    | "Message" -> r_message := Some (Read.element i "Message" ())
                    | _ -> Read.skip_element i);
                let errorType =
                  match !r_type with
                  | Some "Sender" -> Error.Sender
                  | Some "Receiver" -> Error.Receiver
                  | _ -> raise (Failure "missing or unknown Error/Type")
                in
                let code =
                  match !r_code with Some c -> c | None -> raise (Failure "missing Error/Code")
                in
                Error.{ errorType; code; message = !r_message })
              ()
          in
          let request_id =
            match Xmlm.peek xmlSource with
            | `El_start el when tag_equal "RequestId" None el ->
                Some (Read.element xmlSource "RequestId" ())
            | _ -> None
          in
          Read.skip_to_end xmlSource;
          (error, request_id))
        ())

(** Parse the noErrorWrapping error envelope (S3 style):
    <Error><Type>...</Type><Code>...</Code>...<RequestId>...</RequestId></Error> The root element is
    <Error> directly, with Type, Code, Message, and RequestId as direct children. *)
let parse_error_envelope_nowrapping ~body =
  let open Xml.Parse in
  run (fun () ->
      let xmlSource = source_with_encoding ~src:body ~encoding:None in
      Read.dtd xmlSource;
      Read.sequence xmlSource "Error"
        (fun i _ ->
          let r_type = ref None in
          let r_code = ref None in
          let r_message = ref None in
          let r_request_id = ref None in
          Structure.scanSequence i [ "Type"; "Code"; "Message"; "RequestId" ] (fun tag _ ->
              match tag with
              | "Type" -> r_type := Some (Read.element i "Type" ())
              | "Code" -> r_code := Some (Read.element i "Code" ())
              | "Message" -> r_message := Some (Read.element i "Message" ())
              | "RequestId" -> r_request_id := Some (Read.element i "RequestId" ())
              | _ -> Read.skip_element i);
          let errorType =
            match !r_type with
            | Some "Sender" -> Error.Sender
            | Some "Receiver" -> Error.Receiver
            | _ -> raise (Failure "missing or unknown Error/Type")
          in
          let code =
            match !r_code with Some c -> c | None -> raise (Failure "missing Error/Code")
          in
          (Error.{ errorType; code; message = !r_message }, !r_request_id))
        ())

(** Re-parse a restXml error response body and run [structParser] positioned inside <Error>, so
    generated error deserialisers can recover the error-shape members that <Error> carries alongside
    <Type>/<Code>/<Message>. *)
let parse_error_struct ~body ~structParser =
  let open Xml.Parse in
  run (fun () ->
      let xmlSource = source_with_encoding ~src:body ~encoding:None in
      Read.dtd xmlSource;
      Read.sequence xmlSource "ErrorResponse"
        (fun _ _ ->
          let result = Read.sequence xmlSource "Error" (fun i _ -> structParser i) () in
          Read.skip_to_end xmlSource;
          result)
        ())

let request (type http_t) ~(shape_name : string) ~(service : Service.descriptor)
    ~(context : http_t Context.t) ~(method_ : Http.method_) ~(uri : Uri.t)
    ~(query : (string * string list) list) ~(headers : (string * string) list)
    ~(body : (string * string) option) ~(output_deserializer : Xmlm.input -> 'out)
    ~(error_deserializer : Error.t -> body:string -> 'err) =
  let config = Context.config context in
  (* Build the full URI with query parameters *)
  let uri =
    if query = [] then uri
    else (
      let existing_query = Uri.query uri in
      Uri.with_query uri (existing_query @ query))
  in
  (* Build the body and content type *)
  let input_body, content_type =
    match body with
    | Some (ct, body_str) -> (`String body_str, ct)
    | None -> (`None, "application/xml")
  in
  let all_headers = ("Content-Type", content_type) :: headers in
  let all_headers =
    Sign.sign_request_v4 ~config ~service ~uri ~method_ ~headers:all_headers
      ~body:(match input_body with `String s -> s | _ -> "")
  in
  let module Http = (val Context.http_type context : Http.Client with type t = http_t) in
  let http = Context.http context in
  Logs.debug (fun m -> m "Sending request to %s\n" (Uri.to_string uri));
  (match input_body with `String s -> Logs.debug (fun m -> m "Sending body %s\n" s) | _ -> ());
  match Http.request ~method_ ~headers:all_headers ~body:input_body ~uri http with
  | Ok (response, response_body) -> begin
      let status = Http.Response.status response in
      let body_str = match Http.Body.to_string response_body with Some b -> b | None -> "" in
      match status with
      | x when x >= 200 && x < 300 -> (
          let open Xml.Parse in
          match
            run (fun () ->
                let xmlSource = source_with_encoding ~src:body_str ~encoding:None in
                Read.dtd xmlSource;
                let result = output_deserializer xmlSource in
                Read.skip_to_end xmlSource;
                result)
          with
          | Ok r -> Ok r
          | Error (XmlParseError msg) -> Error (`XmlParseError msg))
      | _ ->
          begin match parse_error_envelope ~body:body_str with
          | Ok (error, _request_id) -> Error (error_deserializer error ~body:body_str)
          | Error (Xml.Parse.XmlParseError msg) -> Error (`XmlParseError msg)
          end
    end
  | Error http_failure -> Error (`HttpError http_failure)
