module Log =
  (val Logs.src_log (Logs.Src.create "Smaws_Lib.AwsQuery" ~doc:"AWS Query Protocol") : Logs.LOG)

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

module Serialize = struct
  let join_path path = String.concat "." path
  let string_field path v = [ (join_path path, [ v ]) ]
  let int_field path v = string_field path (string_of_int v)
  let bool_field path v = string_field path (string_of_bool v)

  (* Shortest round-trip-safe decimal representation of a float. Starts at the
     6-sig-fig default of %g (so common values like 10.8 emit "10.8", matching
     the smithy fixtures) and increases precision until [Float.of_string] of the
     output equals the input, capping at %.17g (the round-trip bound for IEEE
     doubles). %g's lossy 6-sig-fig truncation silently corrupted high-precision
     doubles such as 1.234567890123456789 -> "1.23457". *)
  let float_to_string v =
    let rec loop p =
      if p > 17 then Printf.sprintf "%.17g" v
      else
        let s = Printf.sprintf "%.*g" p v in
        if Float.equal (Float.of_string s) v then s else loop (p + 1)
    in
    loop 6

  let float_field path v =
    let s =
      if Float.is_nan v then "NaN"
      else if Float.is_infinite v then if v > 0.0 then "Infinity" else "-Infinity"
      else float_to_string v
    in
    string_field path s

  let blob_field path v = string_field path (Base64.encode_exn (Bytes.to_string v))

  let timestamp_iso_field path (v : Ptime.t) =
    let s = Ptime.to_rfc3339 ~tz_offset_s:0 v in
    let len = String.length s in
    let normalized =
      if len >= 6 && String.sub s (len - 6) 6 = "+00:00" then String.sub s 0 (len - 6) ^ "Z" else s
    in
    string_field path normalized

  let timestamp_epoch_field path (v : Ptime.t) =
    let posix = Ptime.to_float_s v in
    let s =
      if Float.is_integer posix then string_of_int (int_of_float posix)
      else float_to_string posix
    in
    string_field path s

  let timestamp_httpdate_field path (v : Ptime.t) =
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
    let s =
      Printf.sprintf "%s, %02d %s %04d %02d:%02d:%02d GMT" (weekday_of_int dow) day
        (month_of_int month) year hour min sec
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

module Deserialize = struct
  let timestamp_iso_of_string s =
    let ts, _, _ = Result.get_ok (Ptime.of_rfc3339 s) in
    ts

  let timestamp_epoch_of_string s =
    match Ptime.of_float_s (float_of_string s) with
    | Some t -> t
    | None -> failwith ("invalid epoch timestamp: " ^ s)

  let timestamp_httpdate_of_string s =
    Scanf.sscanf s "%s@, %d %s %d %d:%d:%d GMT"
      (fun _weekday day month_str year hour minute second ->
        let month =
          match month_str with
          | "Jan" -> 1
          | "Feb" -> 2
          | "Mar" -> 3
          | "Apr" -> 4
          | "May" -> 5
          | "Jun" -> 6
          | "Jul" -> 7
          | "Aug" -> 8
          | "Sep" -> 9
          | "Oct" -> 10
          | "Nov" -> 11
          | _ -> 12
        in
        match Ptime.of_date_time ((year, month, day), ((hour, minute, second), 0)) with
        | Some t -> t
        | None -> failwith ("invalid http-date: " ^ s))

  let int_of_string s = Stdlib.int_of_string s
  let bool_of_string s = Stdlib.bool_of_string s
  let float_of_string s = Stdlib.float_of_string s
  let blob_of_string s = Bytes.of_string (Base64.decode_exn s)
end

module Errors = struct
  let default_handler (error : Error.t) =
    `AWSServiceError
      AwsErrors.{ message = error.message; _type = { namespace = ""; name = error.code } }
end

module Response = struct
  exception Unparseable of string * string

  let parse_xml_ok_response ~(action : string) ~(xmlNamespace : string) ~(body : string)
      ~resultParser =
    let open Xml.Parse in
    let effective_body =
      if String.length body = 0 then
        Printf.sprintf "<%sResponse xmlns=\"%s\"><%sResult/></%sResponse>" action xmlNamespace
          action action
      else body
    in
    let xmlSource = source_with_encoding ~src:effective_body ~encoding:None in
    Read.dtd xmlSource;
    Read.sequence xmlSource (action ^ "Response") ~ns:xmlNamespace
      (fun _ _ ->
        let result = Read.sequence xmlSource (action ^ "Result") (fun i _ -> resultParser i) () in
        (* Skip trailing siblings such as <ResponseMetadata> mandated by the
           awsQuery protocol before the response end tag. *)
        Read.skip_to_end xmlSource;
        result)
      ()

  let parse_xml_error_response ~(body : string) =
    let open Xml.Parse in
    let xmlSource = source_with_encoding ~src:body ~encoding:None in
    Read.dtd xmlSource;
    try
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
                  | _ -> raise (Unparseable ("missing or unknown Error/Type", body))
                in
                let code =
                  match !r_code with
                  | Some c -> c
                  | None -> raise (Unparseable ("missing Error/Code", body))
                in
                Error.{ errorType; code; message = !r_message })
              ()
          in
          (* Skip trailing siblings (e.g. <RequestId>) before </ErrorResponse>. *)
          Read.skip_to_end xmlSource;
          error)
        ()
    with
    | Xml.Parse.XmlParse _ -> raise (Unparseable ("xmlm error", body))
    | Xml.Parse.XmlUnexpectedConstruct (_, _, _) -> raise (Unparseable ("construct error", body))

  (* Re-parse an awsQuery error response body and run [structParser] positioned
     inside <Error>, so generated error deserialisers can recover the
     error-shape members that <Error> carries alongside <Type>/<Code>/<Message>.
     The struct reader's scanSequence skips the protocol metadata tags it does
     not recognise. Trailing <RequestId> siblings are skipped before
     </ErrorResponse>. *)
  let parse_error_struct ~(body : string) ~structParser =
    let open Xml.Parse in
    let xmlSource = source_with_encoding ~src:body ~encoding:None in
    Read.dtd xmlSource;
    try
      Read.sequence xmlSource "ErrorResponse"
        (fun _ _ ->
          let result = Read.sequence xmlSource "Error" (fun i _ -> structParser i) () in
          Read.skip_to_end xmlSource;
          result)
        ()
    with
    | Xml.Parse.XmlParse _ -> raise (Unparseable ("xmlm error", body))
    | Xml.Parse.XmlUnexpectedConstruct (_, _, _) -> raise (Unparseable ("construct error", body))
end

let error_deserializer handler (error : Error.t) ~body:_ = handler error

let request (type http_t) ~(action : string) ~(xmlNamespace : string)
    ~(service : Service.descriptor) ~(context : http_t Context.t)
    ~(fields : (string * string list) list) ~(output_deserializer : Xmlm.input -> 'out)
    ~(error_deserializer : Error.t -> body:string -> 'err) =
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
          | Xml.Parse.XmlUnexpectedConstruct (_, _, _) ->
              Error (`XmlParseError "unexpected XML construct"))
      | _ -> (
          try
            let error = Response.parse_xml_error_response ~body in
            Error (error_deserializer error ~body)
          with
          | Response.Unparseable (msg, _) -> Error (`XmlParseError msg)
          | Xml.Parse.XmlParse e -> Error (`XmlParseError (Xmlm.error_message e))
          | Xml.Parse.XmlUnexpectedConstruct (_, _, _) ->
              Error (`XmlParseError "unexpected XML construct"))
    end
  | Error http_failure -> Error (`HttpError http_failure)
