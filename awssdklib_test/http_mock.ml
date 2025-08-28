open Base
open Smaws_Lib

module type HttpMock_intf = sig
  open Http
  include Http.Client_intf

  type request = {
    uri : Uri.t;
    headers : (string * string) list;
    body : input_body option;
    method_ : Http.method_;
  }

  type response_record = { status : int; headers : (string * string) list; body : string }

  val make : unit -> t
  val mock_response : ?headers:headers -> ?status:int -> body:string -> unit -> unit
  val mock_error : Http.http_failure -> unit
  val last_request : unit -> request
  val all_requests : unit -> request list
  val last_response : unit -> response_record option
  val all_responses : unit -> response_record list
  val clear_state : unit -> unit
  val request_count : unit -> int
  val response_count : unit -> int

  val verify_request :
    request ->
    expected_method:string ->
    expected_uri:string ->
    ?expected_headers:(string * string) list ->
    ?expected_body:string ->
    unit ->
    (unit, string) Result.t

  val verify_response :
    response_record ->
    expected_status:int ->
    ?expected_headers:(string * string) list ->
    ?expected_body:string ->
    unit ->
    (unit, string) Result.t
end

let create_http_mock () =
  let module HttpMock = struct
    type t = unit
    type input_body = Smaws_Lib.Http.input_body

    let make () = ()

    module Response = struct
      type t = { status_ : int; headers_ : (string * string) list }

      let status x = x.status_
      let headers x = x.headers_
    end

    module Body = struct
      type t = string

      let to_string x = x
      let drain _ = ()
    end

    type request = {
      uri : Uri.t;
      headers : (string * string) list;
      body : input_body option;
      method_ : Http.method_;
    }
    (** A saved request from calling {!request} against the mock *)

    type response_record = { status : int; headers : (string * string) list; body : string }
    (** A record of responses that were sent *)

    let requests = ref []
    let responses = Stdlib.Queue.create ()
    let sent_responses = ref []

    let mock_response ?(headers = []) ?(status = 200) ~body () =
      let response : Response.t = { headers_ = headers; status_ = status } in
      let body = body in
      Stdlib.Queue.push (Ok (response, body)) responses

    let mock_error error = Stdlib.Queue.push (Error error) responses

    let request ~method_ ~uri ?headers ?body http =
      let req = { body; headers = Option.value headers ~default:[]; uri; method_ } in
      requests := req :: !requests;
      match Stdlib.Queue.take responses with
      | Ok (response, body) as result ->
          let response_record =
            { status = Response.status response; headers = Response.headers response; body }
          in
          sent_responses := response_record :: !sent_responses;
          result
      | Error _ as error -> error

    let last_request () =
      match !requests with [] -> failwith "No requests recorded" | req :: _ -> req

    let all_requests () = List.rev !requests
    let last_response () = match !sent_responses with [] -> None | resp :: _ -> Some resp
    let all_responses () = List.rev !sent_responses

    let clear_state () =
      requests := [];
      Stdlib.Queue.clear responses;
      sent_responses := []

    let request_count () = List.length !requests
    let response_count () = List.length !sent_responses

    let verify_request request ~expected_method ~expected_uri ?expected_headers ?expected_body () =
      (* Verify method *)
      let method_result =
        if String.equal (Http.string_of_method request.method_) expected_method then Ok ()
        else
          Error
            (Printf.sprintf "Method mismatch: expected %s, got %s" expected_method
               (Http.string_of_method request.method_))
      in
      (* Verify URI *)
      let uri_result =
        if String.equal (Uri.to_string request.uri) expected_uri then Ok ()
        else
          Error
            (Printf.sprintf "URI mismatch: expected %s, got %s" expected_uri
               (Uri.to_string request.uri))
      in
      (* Verify headers if provided *)
      let headers_result =
        match expected_headers with
        | None -> Ok ()
        | Some expected ->
            List.fold expected ~init:(Ok ()) ~f:(fun acc (key, expected_value) ->
                match acc with
                | Error _ as e -> e
                | Ok () -> (
                    match List.Assoc.find request.headers key ~equal:String.equal with
                    | Some actual_value when String.equal actual_value expected_value -> Ok ()
                    | Some actual_value ->
                        Error
                          (Printf.sprintf "Header %s mismatch: expected %s, got %s" key
                             expected_value actual_value)
                    | None -> Error (Printf.sprintf "Missing header: %s" key)))
      in
      (* Verify body if provided *)
      let body_result =
        match expected_body with
        | None -> Ok ()
        | Some expected -> (
            match request.body with
            | None ->
                if String.is_empty expected then Ok ()
                else Error (Printf.sprintf "Body mismatch: expected %s, got None" expected)
            | Some actual_body ->
                let actual_str =
                  match actual_body with
                  | `None -> ""
                  | `String s -> s
                  | `Form _ -> "<form data>" (* TODO: properly serialize form data if needed *)
                in
                if String.equal actual_str expected then Ok ()
                else Error (Printf.sprintf "Body mismatch: expected %s, got %s" expected actual_str)
            )
      in
      (* Combine all results *)
      match (method_result, uri_result, headers_result, body_result) with
      | Ok (), Ok (), Ok (), Ok () -> Ok ()
      | Error e, _, _, _ -> Error e
      | _, Error e, _, _ -> Error e
      | _, _, Error e, _ -> Error e
      | _, _, _, Error e -> Error e

    let verify_response response ~expected_status ?expected_headers ?expected_body () =
      (* Verify status *)
      let status_result =
        if Int.equal response.status expected_status then Ok ()
        else
          Error
            (Printf.sprintf "Status mismatch: expected %d, got %d" expected_status response.status)
      in
      (* Verify headers if provided *)
      let headers_result =
        match expected_headers with
        | None -> Ok ()
        | Some expected ->
            List.fold expected ~init:(Ok ()) ~f:(fun acc (key, expected_value) ->
                match acc with
                | Error _ as e -> e
                | Ok () -> (
                    match List.Assoc.find response.headers key ~equal:String.equal with
                    | Some actual_value when String.equal actual_value expected_value -> Ok ()
                    | Some actual_value ->
                        Error
                          (Printf.sprintf "Response header %s mismatch: expected %s, got %s" key
                             expected_value actual_value)
                    | None -> Error (Printf.sprintf "Missing response header: %s" key)))
      in
      (* Verify body if provided *)
      let body_result =
        match expected_body with
        | None -> Ok ()
        | Some expected ->
            if String.equal response.body expected then Ok ()
            else
              Error
                (Printf.sprintf "Response body mismatch: expected %s, got %s" expected response.body)
      in
      (* Combine all results *)
      match (status_result, headers_result, body_result) with
      | Ok (), Ok (), Ok () -> Ok ()
      | Error e, _, _ -> Error e
      | _, Error e, _ -> Error e
      | _, _, Error e -> Error e
  end in
  (module HttpMock : HttpMock_intf)
