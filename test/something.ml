let config : Smaws_Lib.Config.t =
  {
    resolveAuth =
      (fun () -> { access_key_id = "hello"; secret_access_key = "world"; session_token = None });
    resolveRegion = (fun () -> "us-east-1");
  }

module Alcotest_Smithy = struct end

let run env =
  let open Smaws_Lib in
  let open Smaws_Test_Support_Lib.Alcotest_http in
  let open Model_tests_protocols.Json in
  Eio.Switch.run ~name:"smaws-test" @@ fun sw ->
  let module Mock = (val Smaws_Test_Support_Lib.Http_mock.create_http_mock ()) in
  let http_type = (module Mock : Http.Client with type t = Mock.t) in
  let ctx = Context.make ~config ~http_type () in
  let input : Types.content_type_parameters_input = { value = Some 5 } in
  Mock.mock_response ~body:"{}" ~status:200 ~headers:[ ("Content-Type", "application/json") ] ();
  let response = ContentTypeParameters.request ctx input in
  match response with
  | Ok resp ->
      Alcotest.check
        (Alcotest.testable Types.pp_content_type_parameters_output
           Types.equal_content_type_parameters_output)
        "expected response value" () resp;
      let request = Mock.last_request () in
      Alcotest.check input_body_testable "expected response transformation"
        (Some (`String "{\"value\":5}"))
        request.body;
      Alcotest.check headers_testable "expected request headers"
        [
          ("Content-Type", "application/x-amz-json-1.1; charset=utf-8");
          ("X-Amz-Target", "JsonProtocol.ContentTypeParameters");
        ]
        request.headers;
      Alcotest.check method_testable "expected request method" `POST request.method_;
      Alcotest.check uri_testable "expected request uri" (Uri.make ~path:"/" ()) request.uri;
      print_endline "Success!"
  | Error error -> Eio.Std.traceln "Error: %s\n" (Protocols.AwsJson.error_to_string error)

let () = Eio_main.run run
