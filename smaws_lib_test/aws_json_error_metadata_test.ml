(** Regression test: AWS JSON error responses carry the request id from [x-amzn-requestid] (or
    [x-amz-request-id]) in the error tuple metadata. *)

let config : Smaws_Lib.Config.t =
  {
    resolveAuth =
      (fun () -> { access_key_id = "hello"; secret_access_key = "world"; session_token = None });
    resolveRegion = (fun () -> "us-east-1");
    endpoint = None;
  }

let run env =
  let open Smaws_Lib in
  let open Model_tests_protocols.Json in
  Eio.Switch.run ~name:"smaws-json-error-metadata-test" @@ fun sw ->
  let module Mock = (val Smaws_Test_Support_Lib.Http_mock.create_http_mock ()) in
  let http_type = (module Mock : Http.Client with type t = Mock.t) in
  let ctx = Context.make ~config ~http_type () in
  Mock.mock_response ~status:400
    ~headers:[ ("x-amzn-requestid", "req-json-1") ]
    ~body:({|{"__type": "com.amazonaws.jsonprotocol#InvalidGreeting", "message": "boom"}|} : string)
    ();
  match GreetingWithErrors.request_with_metadata ctx () with
  | Ok _ -> Alcotest.fail "expected an error response"
  | Error (error, metadata) -> (
      Alcotest.(check (option string))
        "request_id from x-amzn-requestid header" (Some "req-json-1") metadata.Response.request_id;
      (* The exact variant depends on the generated error model; just ensure
         it is an AWS service error so the test remains focused on metadata. *)
      match error with
      | `AWSServiceError { _type = { name = "InvalidGreeting"; _ }; message } ->
          Alcotest.(check (option string)) "error message" (Some "boom") message
      | `InvalidGreeting _ -> Alcotest.(check bool) "specific error variant present" true true
      | _ -> Alcotest.fail "unexpected error variant")

let () = Eio_main.run run
