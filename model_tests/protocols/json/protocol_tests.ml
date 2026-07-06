open Alcotest
open Smaws_Test_Support_Lib
open Json

let content_type_parameters_test_suite : unit Alcotest.test =
  ("aws.protocoltests.json#ContentTypeParameters", [])

let datetime_offsets_test_suite : unit Alcotest.test = ("aws.protocoltests.json#DatetimeOffsets", [])

let sends_requests_to_slash () =
  Eio.Switch.run ~name:"sends_requests_to_slash" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Smaws_Lib.Smithy_api.Types.unit_ = () in
  Mock.mock_response ?body:None ~status:200 ~headers:[ ("Content-Type", "application/json") ] ();
  let response = EmptyOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () = () in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.EmptyOperation");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (EmptyOperation.error_to_string error)

let includes_x_amz_target_and_content_type () =
  Eio.Switch.run ~name:"includes_x_amz_target_and_content_type" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Smaws_Lib.Smithy_api.Types.unit_ = () in
  Mock.mock_response ?body:None ~status:200 ~headers:[ ("Content-Type", "application/json") ] ();
  let response = EmptyOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () = () in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.EmptyOperation");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (EmptyOperation.error_to_string error)

let json_1_1_client_sends_empty_payload_for_no_input_shape () =
  Eio.Switch.run ~name:"json_1_1_client_sends_empty_payload_for_no_input_shape" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Smaws_Lib.Smithy_api.Types.unit_ = () in
  Mock.mock_response ?body:(Some "{}") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = EmptyOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string "{}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.EmptyOperation");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (EmptyOperation.error_to_string error)

let json_1_1_service_responds_with_no_payload () =
  Eio.Switch.run ~name:"json_1_1_service_responds_with_no_payload" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response = EmptyOperation.request ctx () in
  match response with
  | Ok result ->
      let expected = () in
      check Alcotest.unit "expected output" expected result
  | Error error -> failwith (EmptyOperation.error_to_string error)

let empty_operation_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.json#EmptyOperation",
    [
      ("sends_requests_to_slash", `Quick, sends_requests_to_slash);
      ("includes_x_amz_target_and_content_type", `Quick, includes_x_amz_target_and_content_type);
      ( "json_1_1_client_sends_empty_payload_for_no_input_shape",
        `Quick,
        json_1_1_client_sends_empty_payload_for_no_input_shape );
      ( "json_1_1_service_responds_with_no_payload",
        `Quick,
        json_1_1_service_responds_with_no_payload );
    ] )

let aws_json11_endpoint_trait () =
  Eio.Switch.run ~name:"AwsJson11EndpointTrait" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config =
    {
      Config.dummy with
      endpoint = Some { uri = Some ("//example.com" |> Uri.of_string); headers = None };
    }
  in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Smaws_Lib.Smithy_api.Types.unit_ = () in
  Mock.mock_response ?body:(Some "{}") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = EndpointOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string "{}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.EndpointOperation");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (EndpointOperation.error_to_string error)

let endpoint_operation_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.json#EndpointOperation",
    [ ("AwsJson11EndpointTrait", `Quick, aws_json11_endpoint_trait) ] )

let aws_json11_endpoint_trait_with_host_label () =
  Eio.Switch.run ~name:"AwsJson11EndpointTraitWithHostLabel" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config =
    {
      Config.dummy with
      endpoint = Some { uri = Some ("//example.com" |> Uri.of_string); headers = None };
    }
  in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.host_label_input = { label = "bar" } in
  Mock.mock_response ?body:(Some "{\"label\": \"bar\"}") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = EndpointWithHostLabelOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string "{\"label\": \"bar\"}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.EndpointWithHostLabelOperation");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (EndpointWithHostLabelOperation.error_to_string error)

let endpoint_with_host_label_operation_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.json#EndpointWithHostLabelOperation",
    [ ("AwsJson11EndpointTraitWithHostLabel", `Quick, aws_json11_endpoint_trait_with_host_label) ]
  )

let fractional_seconds_test_suite : unit Alcotest.test =
  ("aws.protocoltests.json#FractionalSeconds", [])

let aws_json11_complex_error () =
  Eio.Switch.run ~name:"AwsJson11ComplexError" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "{\n\
         \    \"__type\": \"ComplexError\",\n\
         \    \"TopLevel\": \"Top level\",\n\
         \    \"Nested\": {\n\
         \        \"Foo\": \"bar\"\n\
         \    }\n\
          }")
    ~status:400
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response = GreetingWithErrors.request ctx () in
  match response with
  | Error (`ComplexError e) ->
      let expected =
        ({ nested = Some { foo = Some "bar" }; top_level = Some "Top level" } : Types.complex_error)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_complex_error Types.equal_complex_error)
        "expected error" expected e
  | Error other -> failwith (GreetingWithErrors.error_to_string other)
  | Ok _ -> failwith "expected an error response, got Ok"

let aws_json11_empty_complex_error () =
  Eio.Switch.run ~name:"AwsJson11EmptyComplexError" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "{\n    \"__type\": \"ComplexError\"\n}") ~status:400
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response = GreetingWithErrors.request ctx () in
  match response with
  | Error (`ComplexError e) ->
      let expected = ({ nested = None; top_level = None } : Types.complex_error) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_complex_error Types.equal_complex_error)
        "expected error" expected e
  | Error other -> failwith (GreetingWithErrors.error_to_string other)
  | Ok _ -> failwith "expected an error response, got Ok"

let aws_json11_foo_error_using_x_amzn_error_type () =
  Eio.Switch.run ~name:"AwsJson11FooErrorUsingXAmznErrorType" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:None ~status:500 ~headers:[ ("X-Amzn-Errortype", "FooError") ] ();
  let response = GreetingWithErrors.request ctx () in
  match response with
  | Error (`FooError e) ->
      let expected = (() : Types.foo_error) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_foo_error Types.equal_foo_error)
        "expected error" expected e
  | Error other -> failwith (GreetingWithErrors.error_to_string other)
  | Ok _ -> failwith "expected an error response, got Ok"

let aws_json11_foo_error_using_x_amzn_error_type_with_uri () =
  Eio.Switch.run ~name:"AwsJson11FooErrorUsingXAmznErrorTypeWithUri" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:None ~status:500
    ~headers:
      [
        ("X-Amzn-Errortype", "FooError:http://internal.amazon.com/coral/com.amazon.coral.validate/");
      ]
    ();
  let response = GreetingWithErrors.request ctx () in
  match response with
  | Error (`FooError e) ->
      let expected = (() : Types.foo_error) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_foo_error Types.equal_foo_error)
        "expected error" expected e
  | Error other -> failwith (GreetingWithErrors.error_to_string other)
  | Ok _ -> failwith "expected an error response, got Ok"

let aws_json11_foo_error_using_x_amzn_error_type_with_uri_and_namespace () =
  Eio.Switch.run ~name:"AwsJson11FooErrorUsingXAmznErrorTypeWithUriAndNamespace" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:None ~status:500
    ~headers:
      [
        ( "X-Amzn-Errortype",
          "aws.protocoltests.json#FooError:http://internal.amazon.com/coral/com.amazon.coral.validate/"
        );
      ]
    ();
  let response = GreetingWithErrors.request ctx () in
  match response with
  | Error (`FooError e) ->
      let expected = (() : Types.foo_error) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_foo_error Types.equal_foo_error)
        "expected error" expected e
  | Error other -> failwith (GreetingWithErrors.error_to_string other)
  | Ok _ -> failwith "expected an error response, got Ok"

let aws_json11_foo_error_using_code () =
  Eio.Switch.run ~name:"AwsJson11FooErrorUsingCode" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "{\n    \"code\": \"FooError\"\n}") ~status:500
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response = GreetingWithErrors.request ctx () in
  match response with
  | Error (`FooError e) ->
      let expected = (() : Types.foo_error) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_foo_error Types.equal_foo_error)
        "expected error" expected e
  | Error other -> failwith (GreetingWithErrors.error_to_string other)
  | Ok _ -> failwith "expected an error response, got Ok"

let aws_json11_foo_error_using_code_and_namespace () =
  Eio.Switch.run ~name:"AwsJson11FooErrorUsingCodeAndNamespace" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "{\n    \"code\": \"aws.protocoltests.json#FooError\"\n}")
    ~status:500
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response = GreetingWithErrors.request ctx () in
  match response with
  | Error (`FooError e) ->
      let expected = (() : Types.foo_error) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_foo_error Types.equal_foo_error)
        "expected error" expected e
  | Error other -> failwith (GreetingWithErrors.error_to_string other)
  | Ok _ -> failwith "expected an error response, got Ok"

let aws_json11_foo_error_using_code_uri_and_namespace () =
  Eio.Switch.run ~name:"AwsJson11FooErrorUsingCodeUriAndNamespace" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "{\n\
         \    \"code\": \
          \"aws.protocoltests.json#FooError:http://internal.amazon.com/coral/com.amazon.coral.validate/\"\n\
          }")
    ~status:500
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response = GreetingWithErrors.request ctx () in
  match response with
  | Error (`FooError e) ->
      let expected = (() : Types.foo_error) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_foo_error Types.equal_foo_error)
        "expected error" expected e
  | Error other -> failwith (GreetingWithErrors.error_to_string other)
  | Ok _ -> failwith "expected an error response, got Ok"

let aws_json11_foo_error_with_dunder_type () =
  Eio.Switch.run ~name:"AwsJson11FooErrorWithDunderType" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "{\n    \"__type\": \"FooError\"\n}") ~status:500
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response = GreetingWithErrors.request ctx () in
  match response with
  | Error (`FooError e) ->
      let expected = (() : Types.foo_error) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_foo_error Types.equal_foo_error)
        "expected error" expected e
  | Error other -> failwith (GreetingWithErrors.error_to_string other)
  | Ok _ -> failwith "expected an error response, got Ok"

let aws_json11_foo_error_with_dunder_type_and_namespace () =
  Eio.Switch.run ~name:"AwsJson11FooErrorWithDunderTypeAndNamespace" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "{\n    \"__type\": \"aws.protocoltests.json#FooError\"\n}")
    ~status:500
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response = GreetingWithErrors.request ctx () in
  match response with
  | Error (`FooError e) ->
      let expected = (() : Types.foo_error) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_foo_error Types.equal_foo_error)
        "expected error" expected e
  | Error other -> failwith (GreetingWithErrors.error_to_string other)
  | Ok _ -> failwith "expected an error response, got Ok"

let aws_json11_foo_error_with_dunder_type_and_different_namespace () =
  Eio.Switch.run ~name:"AwsJson11FooErrorWithDunderTypeAndDifferentNamespace" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "{\n    \"__type\": \"aws.different.namespace#FooError\"\n}")
    ~status:500
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response = GreetingWithErrors.request ctx () in
  match response with
  | Error (`FooError e) ->
      let expected = (() : Types.foo_error) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_foo_error Types.equal_foo_error)
        "expected error" expected e
  | Error other -> failwith (GreetingWithErrors.error_to_string other)
  | Ok _ -> failwith "expected an error response, got Ok"

let aws_json11_foo_error_with_dunder_type_uri_and_namespace () =
  Eio.Switch.run ~name:"AwsJson11FooErrorWithDunderTypeUriAndNamespace" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "{\n\
         \    \"__type\": \
          \"aws.protocoltests.json#FooError:http://internal.amazon.com/coral/com.amazon.coral.validate/\"\n\
          }")
    ~status:500
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response = GreetingWithErrors.request ctx () in
  match response with
  | Error (`FooError e) ->
      let expected = (() : Types.foo_error) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_foo_error Types.equal_foo_error)
        "expected error" expected e
  | Error other -> failwith (GreetingWithErrors.error_to_string other)
  | Ok _ -> failwith "expected an error response, got Ok"

let aws_json11_foo_error_with_nested_type_property () =
  Eio.Switch.run ~name:"AwsJson11FooErrorWithNestedTypeProperty" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "{\n\
         \    \"__type\": \"aws.protocoltests.json#FooError\",\n\
         \    \"ErrorDetails\": [\n\
         \      {\n\
         \          \"__type\": \"com.amazon.internal#ErrorDetails\",\n\
         \          \"reason\": \"Some reason\"\n\
         \      }\n\
         \    ]\n\
          }")
    ~status:500
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response = GreetingWithErrors.request ctx () in
  match response with
  | Error (`FooError e) ->
      let expected = (() : Types.foo_error) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_foo_error Types.equal_foo_error)
        "expected error" expected e
  | Error other -> failwith (GreetingWithErrors.error_to_string other)
  | Ok _ -> failwith "expected an error response, got Ok"

let aws_json11_invalid_greeting_error () =
  Eio.Switch.run ~name:"AwsJson11InvalidGreetingError" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:(Some "{\n    \"__type\": \"InvalidGreeting\",\n    \"Message\": \"Hi\"\n}") ~status:400
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response = GreetingWithErrors.request ctx () in
  match response with
  | Error (`InvalidGreeting e) ->
      let expected = ({ message = Some "Hi" } : Types.invalid_greeting) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_invalid_greeting Types.equal_invalid_greeting)
        "expected error" expected e
  | Error other -> failwith (GreetingWithErrors.error_to_string other)
  | Ok _ -> failwith "expected an error response, got Ok"

let greeting_with_errors_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.json#GreetingWithErrors",
    [
      ("AwsJson11ComplexError", `Quick, aws_json11_complex_error);
      ("AwsJson11EmptyComplexError", `Quick, aws_json11_empty_complex_error);
      ("AwsJson11FooErrorUsingXAmznErrorType", `Quick, aws_json11_foo_error_using_x_amzn_error_type);
      ( "AwsJson11FooErrorUsingXAmznErrorTypeWithUri",
        `Quick,
        aws_json11_foo_error_using_x_amzn_error_type_with_uri );
      ( "AwsJson11FooErrorUsingXAmznErrorTypeWithUriAndNamespace",
        `Quick,
        aws_json11_foo_error_using_x_amzn_error_type_with_uri_and_namespace );
      ("AwsJson11FooErrorUsingCode", `Quick, aws_json11_foo_error_using_code);
      ( "AwsJson11FooErrorUsingCodeAndNamespace",
        `Quick,
        aws_json11_foo_error_using_code_and_namespace );
      ( "AwsJson11FooErrorUsingCodeUriAndNamespace",
        `Quick,
        aws_json11_foo_error_using_code_uri_and_namespace );
      ("AwsJson11FooErrorWithDunderType", `Quick, aws_json11_foo_error_with_dunder_type);
      ( "AwsJson11FooErrorWithDunderTypeAndNamespace",
        `Quick,
        aws_json11_foo_error_with_dunder_type_and_namespace );
      ( "AwsJson11FooErrorWithDunderTypeAndDifferentNamespace",
        `Quick,
        aws_json11_foo_error_with_dunder_type_and_different_namespace );
      ( "AwsJson11FooErrorWithDunderTypeUriAndNamespace",
        `Quick,
        aws_json11_foo_error_with_dunder_type_uri_and_namespace );
      ( "AwsJson11FooErrorWithNestedTypeProperty",
        `Quick,
        aws_json11_foo_error_with_nested_type_property );
      ("AwsJson11InvalidGreetingError", `Quick, aws_json11_invalid_greeting_error);
    ] )

let aws_json11_host_with_path () =
  Eio.Switch.run ~name:"AwsJson11HostWithPath" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config =
    {
      Config.dummy with
      endpoint = Some { uri = Some ("//example.com/custom" |> Uri.of_string); headers = None };
    }
  in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Smaws_Lib.Smithy_api.Types.unit_ = () in
  Mock.mock_response ?body:(Some "{}") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = HostWithPathOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string "{}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/custom/")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.HostWithPathOperation");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (HostWithPathOperation.error_to_string error)

let host_with_path_operation_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.json#HostWithPathOperation",
    [ ("AwsJson11HostWithPath", `Quick, aws_json11_host_with_path) ] )

let aws_json11_enums () =
  Eio.Switch.run ~name:"AwsJson11Enums" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.json_enums_input_output =
    {
      foo_enum_map = Some [ ("hi", FOO); ("zero", ZERO) ];
      foo_enum_set = Some [ FOO; ZERO ];
      foo_enum_list = Some [ FOO; ZERO ];
      foo_enum3 = Some ONE;
      foo_enum2 = Some ZERO;
      foo_enum1 = Some FOO;
    }
  in
  Mock.mock_response
    ?body:
      (Some
         "{\n\
         \    \"fooEnum1\": \"Foo\",\n\
         \    \"fooEnum2\": \"0\",\n\
         \    \"fooEnum3\": \"1\",\n\
         \    \"fooEnumList\": [\n\
         \        \"Foo\",\n\
         \        \"0\"\n\
         \    ],\n\
         \    \"fooEnumSet\": [\n\
         \        \"Foo\",\n\
         \        \"0\"\n\
         \    ],\n\
         \    \"fooEnumMap\": {\n\
         \        \"hi\": \"Foo\",\n\
         \        \"zero\": \"0\"\n\
         \    }\n\
          }")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = JsonEnums.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "{\n\
                \    \"fooEnum1\": \"Foo\",\n\
                \    \"fooEnum2\": \"0\",\n\
                \    \"fooEnum3\": \"1\",\n\
                \    \"fooEnumList\": [\n\
                \        \"Foo\",\n\
                \        \"0\"\n\
                \    ],\n\
                \    \"fooEnumSet\": [\n\
                \        \"Foo\",\n\
                \        \"0\"\n\
                \    ],\n\
                \    \"fooEnumMap\": {\n\
                \        \"hi\": \"Foo\",\n\
                \        \"zero\": \"0\"\n\
                \    }\n\
                 }"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.JsonEnums");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (JsonEnums.error_to_string error)

let aws_json11_enums () =
  Eio.Switch.run ~name:"AwsJson11Enums" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "{\n\
         \    \"fooEnum1\": \"Foo\",\n\
         \    \"fooEnum2\": \"0\",\n\
         \    \"fooEnum3\": \"1\",\n\
         \    \"fooEnumList\": [\n\
         \        \"Foo\",\n\
         \        \"0\"\n\
         \    ],\n\
         \    \"fooEnumSet\": [\n\
         \        \"Foo\",\n\
         \        \"0\"\n\
         \    ],\n\
         \    \"fooEnumMap\": {\n\
         \        \"hi\": \"Foo\",\n\
         \        \"zero\": \"0\"\n\
         \    }\n\
          }")
    ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response =
    JsonEnums.request ctx
      {
        foo_enum_map = None;
        foo_enum_set = None;
        foo_enum_list = None;
        foo_enum3 = None;
        foo_enum2 = None;
        foo_enum1 = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           foo_enum_map = Some [ ("hi", FOO); ("zero", ZERO) ];
           foo_enum_set = Some [ FOO; ZERO ];
           foo_enum_list = Some [ FOO; ZERO ];
           foo_enum3 = Some ONE;
           foo_enum2 = Some ZERO;
           foo_enum1 = Some FOO;
         }
          : Types.json_enums_input_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_json_enums_input_output
           Types.equal_json_enums_input_output)
        "expected output" expected result
  | Error error -> failwith (JsonEnums.error_to_string error)

let json_enums_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.json#JsonEnums",
    [ ("AwsJson11Enums", `Quick, aws_json11_enums); ("AwsJson11Enums", `Quick, aws_json11_enums) ]
  )

let aws_json11_int_enums () =
  Eio.Switch.run ~name:"AwsJson11IntEnums" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.json_int_enums_input_output =
    {
      int_enum_map = Some [ ("a", A); ("b", B) ];
      int_enum_set = Some [ A; B ];
      int_enum_list = Some [ A; B ];
      int_enum3 = Some C;
      int_enum2 = Some B;
      int_enum1 = Some A;
    }
  in
  Mock.mock_response
    ?body:
      (Some
         "{\n\
         \    \"intEnum1\": 1,\n\
         \    \"intEnum2\": 2,\n\
         \    \"intEnum3\": 3,\n\
         \    \"intEnumList\": [\n\
         \        1,\n\
         \        2\n\
         \    ],\n\
         \    \"intEnumSet\": [\n\
         \        1,\n\
         \        2\n\
         \    ],\n\
         \    \"intEnumMap\": {\n\
         \        \"a\": 1,\n\
         \        \"b\": 2\n\
         \    }\n\
          }")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = JsonIntEnums.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "{\n\
                \    \"intEnum1\": 1,\n\
                \    \"intEnum2\": 2,\n\
                \    \"intEnum3\": 3,\n\
                \    \"intEnumList\": [\n\
                \        1,\n\
                \        2\n\
                \    ],\n\
                \    \"intEnumSet\": [\n\
                \        1,\n\
                \        2\n\
                \    ],\n\
                \    \"intEnumMap\": {\n\
                \        \"a\": 1,\n\
                \        \"b\": 2\n\
                \    }\n\
                 }"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.JsonIntEnums");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (JsonIntEnums.error_to_string error)

let aws_json11_int_enums () =
  Eio.Switch.run ~name:"AwsJson11IntEnums" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "{\n\
         \    \"intEnum1\": 1,\n\
         \    \"intEnum2\": 2,\n\
         \    \"intEnum3\": 3,\n\
         \    \"intEnumList\": [\n\
         \        1,\n\
         \        2\n\
         \    ],\n\
         \    \"intEnumSet\": [\n\
         \        1,\n\
         \        2\n\
         \    ],\n\
         \    \"intEnumMap\": {\n\
         \        \"a\": 1,\n\
         \        \"b\": 2\n\
         \    }\n\
          }")
    ~status:200
    ~headers:
      [
        ("X-Amz-Target", "JsonProtocol.JsonIntEnums"); ("Content-Type", "application/x-amz-json-1.1");
      ]
    ();
  let response =
    JsonIntEnums.request ctx
      {
        int_enum_map = None;
        int_enum_set = None;
        int_enum_list = None;
        int_enum3 = None;
        int_enum2 = None;
        int_enum1 = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           int_enum_map = Some [ ("a", A); ("b", B) ];
           int_enum_set = Some [ A; B ];
           int_enum_list = Some [ A; B ];
           int_enum3 = Some C;
           int_enum2 = Some B;
           int_enum1 = Some A;
         }
          : Types.json_int_enums_input_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_json_int_enums_input_output
           Types.equal_json_int_enums_input_output)
        "expected output" expected result
  | Error error -> failwith (JsonIntEnums.error_to_string error)

let json_int_enums_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.json#JsonIntEnums",
    [
      ("AwsJson11IntEnums", `Quick, aws_json11_int_enums);
      ("AwsJson11IntEnums", `Quick, aws_json11_int_enums);
    ] )

let aws_json11_serialize_string_union_value () =
  Eio.Switch.run ~name:"AwsJson11SerializeStringUnionValue" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.union_input_output = { contents = Some (StringValue "foo") } in
  Mock.mock_response
    ?body:(Some "{\n    \"contents\": {\n        \"stringValue\": \"foo\"\n    }\n}") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = JsonUnions.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "{\n    \"contents\": {\n        \"stringValue\": \"foo\"\n    }\n}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.JsonUnions");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (JsonUnions.error_to_string error)

let aws_json11_serialize_boolean_union_value () =
  Eio.Switch.run ~name:"AwsJson11SerializeBooleanUnionValue" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.union_input_output = { contents = Some (BooleanValue true) } in
  Mock.mock_response ?body:(Some "{\n    \"contents\": {\n        \"booleanValue\": true\n    }\n}")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = JsonUnions.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "{\n    \"contents\": {\n        \"booleanValue\": true\n    }\n}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.JsonUnions");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (JsonUnions.error_to_string error)

let aws_json11_serialize_number_union_value () =
  Eio.Switch.run ~name:"AwsJson11SerializeNumberUnionValue" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.union_input_output = { contents = Some (NumberValue 1) } in
  Mock.mock_response ?body:(Some "{\n    \"contents\": {\n        \"numberValue\": 1\n    }\n}")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = JsonUnions.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "{\n    \"contents\": {\n        \"numberValue\": 1\n    }\n}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.JsonUnions");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (JsonUnions.error_to_string error)

let aws_json11_serialize_blob_union_value () =
  Eio.Switch.run ~name:"AwsJson11SerializeBlobUnionValue" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.union_input_output =
    { contents = Some (BlobValue (Smaws_Lib.CoreTypes.Blob.of_string "foo")) }
  in
  Mock.mock_response
    ?body:(Some "{\n    \"contents\": {\n        \"blobValue\": \"Zm9v\"\n    }\n}") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = JsonUnions.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "{\n    \"contents\": {\n        \"blobValue\": \"Zm9v\"\n    }\n}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.JsonUnions");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (JsonUnions.error_to_string error)

let aws_json11_serialize_timestamp_union_value () =
  Eio.Switch.run ~name:"AwsJson11SerializeTimestampUnionValue" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.union_input_output =
    {
      contents =
        Some (TimestampValue (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1398796238.)));
    }
  in
  Mock.mock_response
    ?body:(Some "{\n    \"contents\": {\n        \"timestampValue\": 1398796238\n    }\n}")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = JsonUnions.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "{\n    \"contents\": {\n        \"timestampValue\": 1398796238\n    }\n}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.JsonUnions");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (JsonUnions.error_to_string error)

let aws_json11_serialize_enum_union_value () =
  Eio.Switch.run ~name:"AwsJson11SerializeEnumUnionValue" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.union_input_output = { contents = Some (EnumValue FOO) } in
  Mock.mock_response ?body:(Some "{\n    \"contents\": {\n        \"enumValue\": \"Foo\"\n    }\n}")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = JsonUnions.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "{\n    \"contents\": {\n        \"enumValue\": \"Foo\"\n    }\n}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.JsonUnions");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (JsonUnions.error_to_string error)

let aws_json11_serialize_list_union_value () =
  Eio.Switch.run ~name:"AwsJson11SerializeListUnionValue" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.union_input_output = { contents = Some (ListValue [ "foo"; "bar" ]) } in
  Mock.mock_response
    ?body:(Some "{\n    \"contents\": {\n        \"listValue\": [\"foo\", \"bar\"]\n    }\n}")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = JsonUnions.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "{\n    \"contents\": {\n        \"listValue\": [\"foo\", \"bar\"]\n    }\n}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.JsonUnions");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (JsonUnions.error_to_string error)

let aws_json11_serialize_map_union_value () =
  Eio.Switch.run ~name:"AwsJson11SerializeMapUnionValue" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.union_input_output =
    { contents = Some (MapValue [ ("foo", "bar"); ("spam", "eggs") ]) }
  in
  Mock.mock_response
    ?body:
      (Some
         "{\n\
         \    \"contents\": {\n\
         \        \"mapValue\": {\n\
         \            \"foo\": \"bar\",\n\
         \            \"spam\": \"eggs\"\n\
         \        }\n\
         \    }\n\
          }")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = JsonUnions.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "{\n\
                \    \"contents\": {\n\
                \        \"mapValue\": {\n\
                \            \"foo\": \"bar\",\n\
                \            \"spam\": \"eggs\"\n\
                \        }\n\
                \    }\n\
                 }"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.JsonUnions");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (JsonUnions.error_to_string error)

let aws_json11_serialize_structure_union_value () =
  Eio.Switch.run ~name:"AwsJson11SerializeStructureUnionValue" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.union_input_output =
    { contents = Some (StructureValue { hi = Some "hello" }) }
  in
  Mock.mock_response
    ?body:
      (Some
         "{\n\
         \    \"contents\": {\n\
         \        \"structureValue\": {\n\
         \            \"hi\": \"hello\"\n\
         \        }\n\
         \    }\n\
          }")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = JsonUnions.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "{\n\
                \    \"contents\": {\n\
                \        \"structureValue\": {\n\
                \            \"hi\": \"hello\"\n\
                \        }\n\
                \    }\n\
                 }"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.JsonUnions");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (JsonUnions.error_to_string error)

let aws_json11_deserialize_string_union_value () =
  Eio.Switch.run ~name:"AwsJson11DeserializeStringUnionValue" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:(Some "{\n    \"contents\": {\n        \"stringValue\": \"foo\"\n    }\n}") ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response = JsonUnions.request ctx { contents = None } in
  match response with
  | Ok result ->
      let expected = ({ contents = Some (StringValue "foo") } : Types.union_input_output) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_union_input_output Types.equal_union_input_output)
        "expected output" expected result
  | Error error -> failwith (JsonUnions.error_to_string error)

let aws_json11_deserialize_boolean_union_value () =
  Eio.Switch.run ~name:"AwsJson11DeserializeBooleanUnionValue" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "{\n    \"contents\": {\n        \"booleanValue\": true\n    }\n}")
    ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response = JsonUnions.request ctx { contents = None } in
  match response with
  | Ok result ->
      let expected = ({ contents = Some (BooleanValue true) } : Types.union_input_output) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_union_input_output Types.equal_union_input_output)
        "expected output" expected result
  | Error error -> failwith (JsonUnions.error_to_string error)

let aws_json11_deserialize_number_union_value () =
  Eio.Switch.run ~name:"AwsJson11DeserializeNumberUnionValue" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "{\n    \"contents\": {\n        \"numberValue\": 1\n    }\n}")
    ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response = JsonUnions.request ctx { contents = None } in
  match response with
  | Ok result ->
      let expected = ({ contents = Some (NumberValue 1) } : Types.union_input_output) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_union_input_output Types.equal_union_input_output)
        "expected output" expected result
  | Error error -> failwith (JsonUnions.error_to_string error)

let aws_json11_deserialize_blob_union_value () =
  Eio.Switch.run ~name:"AwsJson11DeserializeBlobUnionValue" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:(Some "{\n    \"contents\": {\n        \"blobValue\": \"Zm9v\"\n    }\n}") ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response = JsonUnions.request ctx { contents = None } in
  match response with
  | Ok result ->
      let expected =
        ({ contents = Some (BlobValue (Smaws_Lib.CoreTypes.Blob.of_string "foo")) }
          : Types.union_input_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_union_input_output Types.equal_union_input_output)
        "expected output" expected result
  | Error error -> failwith (JsonUnions.error_to_string error)

let aws_json11_deserialize_timestamp_union_value () =
  Eio.Switch.run ~name:"AwsJson11DeserializeTimestampUnionValue" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:(Some "{\n    \"contents\": {\n        \"timestampValue\": 1398796238\n    }\n}")
    ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response = JsonUnions.request ctx { contents = None } in
  match response with
  | Ok result ->
      let expected =
        ({
           contents =
             Some
               (TimestampValue (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1398796238.)));
         }
          : Types.union_input_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_union_input_output Types.equal_union_input_output)
        "expected output" expected result
  | Error error -> failwith (JsonUnions.error_to_string error)

let aws_json11_deserialize_enum_union_value () =
  Eio.Switch.run ~name:"AwsJson11DeserializeEnumUnionValue" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "{\n    \"contents\": {\n        \"enumValue\": \"Foo\"\n    }\n}")
    ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response = JsonUnions.request ctx { contents = None } in
  match response with
  | Ok result ->
      let expected = ({ contents = Some (EnumValue FOO) } : Types.union_input_output) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_union_input_output Types.equal_union_input_output)
        "expected output" expected result
  | Error error -> failwith (JsonUnions.error_to_string error)

let aws_json11_deserialize_list_union_value () =
  Eio.Switch.run ~name:"AwsJson11DeserializeListUnionValue" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:(Some "{\n    \"contents\": {\n        \"listValue\": [\"foo\", \"bar\"]\n    }\n}")
    ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response = JsonUnions.request ctx { contents = None } in
  match response with
  | Ok result ->
      let expected =
        ({ contents = Some (ListValue [ "foo"; "bar" ]) } : Types.union_input_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_union_input_output Types.equal_union_input_output)
        "expected output" expected result
  | Error error -> failwith (JsonUnions.error_to_string error)

let aws_json11_deserialize_map_union_value () =
  Eio.Switch.run ~name:"AwsJson11DeserializeMapUnionValue" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "{\n\
         \    \"contents\": {\n\
         \        \"mapValue\": {\n\
         \            \"foo\": \"bar\",\n\
         \            \"spam\": \"eggs\"\n\
         \        }\n\
         \    }\n\
          }")
    ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response = JsonUnions.request ctx { contents = None } in
  match response with
  | Ok result ->
      let expected =
        ({ contents = Some (MapValue [ ("foo", "bar"); ("spam", "eggs") ]) }
          : Types.union_input_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_union_input_output Types.equal_union_input_output)
        "expected output" expected result
  | Error error -> failwith (JsonUnions.error_to_string error)

let aws_json11_deserialize_structure_union_value () =
  Eio.Switch.run ~name:"AwsJson11DeserializeStructureUnionValue" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "{\n\
         \    \"contents\": {\n\
         \        \"structureValue\": {\n\
         \            \"hi\": \"hello\"\n\
         \        }\n\
         \    }\n\
          }")
    ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response = JsonUnions.request ctx { contents = None } in
  match response with
  | Ok result ->
      let expected =
        ({ contents = Some (StructureValue { hi = Some "hello" }) } : Types.union_input_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_union_input_output Types.equal_union_input_output)
        "expected output" expected result
  | Error error -> failwith (JsonUnions.error_to_string error)

let json_unions_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.json#JsonUnions",
    [
      ("AwsJson11SerializeStringUnionValue", `Quick, aws_json11_serialize_string_union_value);
      ("AwsJson11SerializeBooleanUnionValue", `Quick, aws_json11_serialize_boolean_union_value);
      ("AwsJson11SerializeNumberUnionValue", `Quick, aws_json11_serialize_number_union_value);
      ("AwsJson11SerializeBlobUnionValue", `Quick, aws_json11_serialize_blob_union_value);
      ("AwsJson11SerializeTimestampUnionValue", `Quick, aws_json11_serialize_timestamp_union_value);
      ("AwsJson11SerializeEnumUnionValue", `Quick, aws_json11_serialize_enum_union_value);
      ("AwsJson11SerializeListUnionValue", `Quick, aws_json11_serialize_list_union_value);
      ("AwsJson11SerializeMapUnionValue", `Quick, aws_json11_serialize_map_union_value);
      ("AwsJson11SerializeStructureUnionValue", `Quick, aws_json11_serialize_structure_union_value);
      ("AwsJson11DeserializeStringUnionValue", `Quick, aws_json11_deserialize_string_union_value);
      ("AwsJson11DeserializeBooleanUnionValue", `Quick, aws_json11_deserialize_boolean_union_value);
      ("AwsJson11DeserializeNumberUnionValue", `Quick, aws_json11_deserialize_number_union_value);
      ("AwsJson11DeserializeBlobUnionValue", `Quick, aws_json11_deserialize_blob_union_value);
      ( "AwsJson11DeserializeTimestampUnionValue",
        `Quick,
        aws_json11_deserialize_timestamp_union_value );
      ("AwsJson11DeserializeEnumUnionValue", `Quick, aws_json11_deserialize_enum_union_value);
      ("AwsJson11DeserializeListUnionValue", `Quick, aws_json11_deserialize_list_union_value);
      ("AwsJson11DeserializeMapUnionValue", `Quick, aws_json11_deserialize_map_union_value);
      ( "AwsJson11DeserializeStructureUnionValue",
        `Quick,
        aws_json11_deserialize_structure_union_value );
    ] )

let serializes_string_shapes () =
  Eio.Switch.run ~name:"serializes_string_shapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.kitchen_sink =
    {
      unix_timestamp = None;
      timestamp = None;
      struct_with_json_name = None;
      string_ = Some "abc xyz";
      simple_struct = None;
      recursive_struct = None;
      recursive_map = None;
      recursive_list = None;
      map_of_structs = None;
      map_of_strings = None;
      map_of_maps = None;
      map_of_lists_of_strings = None;
      long = None;
      list_of_structs = None;
      list_of_strings = None;
      list_of_maps_of_strings = None;
      list_of_lists = None;
      json_value = None;
      iso8601_timestamp = None;
      integer = None;
      httpdate_timestamp = None;
      float_ = None;
      empty_struct = None;
      double = None;
      boolean_ = None;
      blob = None;
    }
  in
  Mock.mock_response ?body:(Some "{\"String\":\"abc xyz\"}") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = KitchenSinkOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string "{\"String\":\"abc xyz\"}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let serializes_string_shapes_with_jsonvalue_trait () =
  Eio.Switch.run ~name:"serializes_string_shapes_with_jsonvalue_trait" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.kitchen_sink =
    {
      unix_timestamp = None;
      timestamp = None;
      struct_with_json_name = None;
      string_ = None;
      simple_struct = None;
      recursive_struct = None;
      recursive_map = None;
      recursive_list = None;
      map_of_structs = None;
      map_of_strings = None;
      map_of_maps = None;
      map_of_lists_of_strings = None;
      long = None;
      list_of_structs = None;
      list_of_strings = None;
      list_of_maps_of_strings = None;
      list_of_lists = None;
      json_value =
        Some
          "{\"string\":\"value\",\"number\":1234.5,\"boolTrue\":true,\"boolFalse\":false,\"array\":[1,2,3,4],\"object\":{\"key\":\"value\"},\"null\":null}";
      iso8601_timestamp = None;
      integer = None;
      httpdate_timestamp = None;
      float_ = None;
      empty_struct = None;
      double = None;
      boolean_ = None;
      blob = None;
    }
  in
  Mock.mock_response
    ?body:
      (Some
         "{\"JsonValue\":\"{\\\"string\\\":\\\"value\\\",\\\"number\\\":1234.5,\\\"boolTrue\\\":true,\\\"boolFalse\\\":false,\\\"array\\\":[1,2,3,4],\\\"object\\\":{\\\"key\\\":\\\"value\\\"},\\\"null\\\":null}\"}")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = KitchenSinkOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "{\"JsonValue\":\"{\\\"string\\\":\\\"value\\\",\\\"number\\\":1234.5,\\\"boolTrue\\\":true,\\\"boolFalse\\\":false,\\\"array\\\":[1,2,3,4],\\\"object\\\":{\\\"key\\\":\\\"value\\\"},\\\"null\\\":null}\"}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let serializes_integer_shapes () =
  Eio.Switch.run ~name:"serializes_integer_shapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.kitchen_sink =
    {
      unix_timestamp = None;
      timestamp = None;
      struct_with_json_name = None;
      string_ = None;
      simple_struct = None;
      recursive_struct = None;
      recursive_map = None;
      recursive_list = None;
      map_of_structs = None;
      map_of_strings = None;
      map_of_maps = None;
      map_of_lists_of_strings = None;
      long = None;
      list_of_structs = None;
      list_of_strings = None;
      list_of_maps_of_strings = None;
      list_of_lists = None;
      json_value = None;
      iso8601_timestamp = None;
      integer = Some 1234;
      httpdate_timestamp = None;
      float_ = None;
      empty_struct = None;
      double = None;
      boolean_ = None;
      blob = None;
    }
  in
  Mock.mock_response ?body:(Some "{\"Integer\":1234}") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = KitchenSinkOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string "{\"Integer\":1234}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let serializes_long_shapes () =
  Eio.Switch.run ~name:"serializes_long_shapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.kitchen_sink =
    {
      unix_timestamp = None;
      timestamp = None;
      struct_with_json_name = None;
      string_ = None;
      simple_struct = None;
      recursive_struct = None;
      recursive_map = None;
      recursive_list = None;
      map_of_structs = None;
      map_of_strings = None;
      map_of_maps = None;
      map_of_lists_of_strings = None;
      long = Some (Smaws_Lib.CoreTypes.Int64.of_int 999999999999);
      list_of_structs = None;
      list_of_strings = None;
      list_of_maps_of_strings = None;
      list_of_lists = None;
      json_value = None;
      iso8601_timestamp = None;
      integer = None;
      httpdate_timestamp = None;
      float_ = None;
      empty_struct = None;
      double = None;
      boolean_ = None;
      blob = None;
    }
  in
  Mock.mock_response ?body:(Some "{\"Long\":999999999999}") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = KitchenSinkOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string "{\"Long\":999999999999}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let serializes_float_shapes () =
  Eio.Switch.run ~name:"serializes_float_shapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.kitchen_sink =
    {
      unix_timestamp = None;
      timestamp = None;
      struct_with_json_name = None;
      string_ = None;
      simple_struct = None;
      recursive_struct = None;
      recursive_map = None;
      recursive_list = None;
      map_of_structs = None;
      map_of_strings = None;
      map_of_maps = None;
      map_of_lists_of_strings = None;
      long = None;
      list_of_structs = None;
      list_of_strings = None;
      list_of_maps_of_strings = None;
      list_of_lists = None;
      json_value = None;
      iso8601_timestamp = None;
      integer = None;
      httpdate_timestamp = None;
      float_ = Some 1234.5;
      empty_struct = None;
      double = None;
      boolean_ = None;
      blob = None;
    }
  in
  Mock.mock_response ?body:(Some "{\"Float\":1234.5}") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = KitchenSinkOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string "{\"Float\":1234.5}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let serializes_double_shapes () =
  Eio.Switch.run ~name:"serializes_double_shapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.kitchen_sink =
    {
      unix_timestamp = None;
      timestamp = None;
      struct_with_json_name = None;
      string_ = None;
      simple_struct = None;
      recursive_struct = None;
      recursive_map = None;
      recursive_list = None;
      map_of_structs = None;
      map_of_strings = None;
      map_of_maps = None;
      map_of_lists_of_strings = None;
      long = None;
      list_of_structs = None;
      list_of_strings = None;
      list_of_maps_of_strings = None;
      list_of_lists = None;
      json_value = None;
      iso8601_timestamp = None;
      integer = None;
      httpdate_timestamp = None;
      float_ = None;
      empty_struct = None;
      double = Some 1234.5;
      boolean_ = None;
      blob = None;
    }
  in
  Mock.mock_response ?body:(Some "{\"Double\":1234.5}") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = KitchenSinkOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string "{\"Double\":1234.5}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let serializes_blob_shapes () =
  Eio.Switch.run ~name:"serializes_blob_shapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.kitchen_sink =
    {
      unix_timestamp = None;
      timestamp = None;
      struct_with_json_name = None;
      string_ = None;
      simple_struct = None;
      recursive_struct = None;
      recursive_map = None;
      recursive_list = None;
      map_of_structs = None;
      map_of_strings = None;
      map_of_maps = None;
      map_of_lists_of_strings = None;
      long = None;
      list_of_structs = None;
      list_of_strings = None;
      list_of_maps_of_strings = None;
      list_of_lists = None;
      json_value = None;
      iso8601_timestamp = None;
      integer = None;
      httpdate_timestamp = None;
      float_ = None;
      empty_struct = None;
      double = None;
      boolean_ = None;
      blob = Some (Smaws_Lib.CoreTypes.Blob.of_string "binary-value");
    }
  in
  Mock.mock_response ?body:(Some "{\"Blob\":\"YmluYXJ5LXZhbHVl\"}") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = KitchenSinkOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string "{\"Blob\":\"YmluYXJ5LXZhbHVl\"}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let serializes_boolean_shapes_true () =
  Eio.Switch.run ~name:"serializes_boolean_shapes_true" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.kitchen_sink =
    {
      unix_timestamp = None;
      timestamp = None;
      struct_with_json_name = None;
      string_ = None;
      simple_struct = None;
      recursive_struct = None;
      recursive_map = None;
      recursive_list = None;
      map_of_structs = None;
      map_of_strings = None;
      map_of_maps = None;
      map_of_lists_of_strings = None;
      long = None;
      list_of_structs = None;
      list_of_strings = None;
      list_of_maps_of_strings = None;
      list_of_lists = None;
      json_value = None;
      iso8601_timestamp = None;
      integer = None;
      httpdate_timestamp = None;
      float_ = None;
      empty_struct = None;
      double = None;
      boolean_ = Some true;
      blob = None;
    }
  in
  Mock.mock_response ?body:(Some "{\"Boolean\":true}") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = KitchenSinkOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string "{\"Boolean\":true}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let serializes_boolean_shapes_false () =
  Eio.Switch.run ~name:"serializes_boolean_shapes_false" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.kitchen_sink =
    {
      unix_timestamp = None;
      timestamp = None;
      struct_with_json_name = None;
      string_ = None;
      simple_struct = None;
      recursive_struct = None;
      recursive_map = None;
      recursive_list = None;
      map_of_structs = None;
      map_of_strings = None;
      map_of_maps = None;
      map_of_lists_of_strings = None;
      long = None;
      list_of_structs = None;
      list_of_strings = None;
      list_of_maps_of_strings = None;
      list_of_lists = None;
      json_value = None;
      iso8601_timestamp = None;
      integer = None;
      httpdate_timestamp = None;
      float_ = None;
      empty_struct = None;
      double = None;
      boolean_ = Some false;
      blob = None;
    }
  in
  Mock.mock_response ?body:(Some "{\"Boolean\":false}") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = KitchenSinkOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string "{\"Boolean\":false}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let serializes_timestamp_shapes () =
  Eio.Switch.run ~name:"serializes_timestamp_shapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.kitchen_sink =
    {
      unix_timestamp = None;
      timestamp = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 946845296.));
      struct_with_json_name = None;
      string_ = None;
      simple_struct = None;
      recursive_struct = None;
      recursive_map = None;
      recursive_list = None;
      map_of_structs = None;
      map_of_strings = None;
      map_of_maps = None;
      map_of_lists_of_strings = None;
      long = None;
      list_of_structs = None;
      list_of_strings = None;
      list_of_maps_of_strings = None;
      list_of_lists = None;
      json_value = None;
      iso8601_timestamp = None;
      integer = None;
      httpdate_timestamp = None;
      float_ = None;
      empty_struct = None;
      double = None;
      boolean_ = None;
      blob = None;
    }
  in
  Mock.mock_response ?body:(Some "{\"Timestamp\":946845296}") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = KitchenSinkOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string "{\"Timestamp\":946845296}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let serializes_timestamp_shapes_with_iso8601_timestampformat () =
  Eio.Switch.run ~name:"serializes_timestamp_shapes_with_iso8601_timestampformat" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.kitchen_sink =
    {
      unix_timestamp = None;
      timestamp = None;
      struct_with_json_name = None;
      string_ = None;
      simple_struct = None;
      recursive_struct = None;
      recursive_map = None;
      recursive_list = None;
      map_of_structs = None;
      map_of_strings = None;
      map_of_maps = None;
      map_of_lists_of_strings = None;
      long = None;
      list_of_structs = None;
      list_of_strings = None;
      list_of_maps_of_strings = None;
      list_of_lists = None;
      json_value = None;
      iso8601_timestamp = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 946845296.));
      integer = None;
      httpdate_timestamp = None;
      float_ = None;
      empty_struct = None;
      double = None;
      boolean_ = None;
      blob = None;
    }
  in
  Mock.mock_response ?body:(Some "{\"Iso8601Timestamp\":\"2000-01-02T20:34:56Z\"}") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = KitchenSinkOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string "{\"Iso8601Timestamp\":\"2000-01-02T20:34:56Z\"}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let serializes_timestamp_shapes_with_httpdate_timestampformat () =
  Eio.Switch.run ~name:"serializes_timestamp_shapes_with_httpdate_timestampformat" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.kitchen_sink =
    {
      unix_timestamp = None;
      timestamp = None;
      struct_with_json_name = None;
      string_ = None;
      simple_struct = None;
      recursive_struct = None;
      recursive_map = None;
      recursive_list = None;
      map_of_structs = None;
      map_of_strings = None;
      map_of_maps = None;
      map_of_lists_of_strings = None;
      long = None;
      list_of_structs = None;
      list_of_strings = None;
      list_of_maps_of_strings = None;
      list_of_lists = None;
      json_value = None;
      iso8601_timestamp = None;
      integer = None;
      httpdate_timestamp = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 946845296.));
      float_ = None;
      empty_struct = None;
      double = None;
      boolean_ = None;
      blob = None;
    }
  in
  Mock.mock_response ?body:(Some "{\"HttpdateTimestamp\":\"Sun, 02 Jan 2000 20:34:56 GMT\"}")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = KitchenSinkOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string "{\"HttpdateTimestamp\":\"Sun, 02 Jan 2000 20:34:56 GMT\"}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let serializes_timestamp_shapes_with_unixtimestamp_timestampformat () =
  Eio.Switch.run ~name:"serializes_timestamp_shapes_with_unixtimestamp_timestampformat" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.kitchen_sink =
    {
      unix_timestamp = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 946845296.));
      timestamp = None;
      struct_with_json_name = None;
      string_ = None;
      simple_struct = None;
      recursive_struct = None;
      recursive_map = None;
      recursive_list = None;
      map_of_structs = None;
      map_of_strings = None;
      map_of_maps = None;
      map_of_lists_of_strings = None;
      long = None;
      list_of_structs = None;
      list_of_strings = None;
      list_of_maps_of_strings = None;
      list_of_lists = None;
      json_value = None;
      iso8601_timestamp = None;
      integer = None;
      httpdate_timestamp = None;
      float_ = None;
      empty_struct = None;
      double = None;
      boolean_ = None;
      blob = None;
    }
  in
  Mock.mock_response ?body:(Some "{\"UnixTimestamp\":946845296}") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = KitchenSinkOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string "{\"UnixTimestamp\":946845296}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let serializes_list_shapes () =
  Eio.Switch.run ~name:"serializes_list_shapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.kitchen_sink =
    {
      unix_timestamp = None;
      timestamp = None;
      struct_with_json_name = None;
      string_ = None;
      simple_struct = None;
      recursive_struct = None;
      recursive_map = None;
      recursive_list = None;
      map_of_structs = None;
      map_of_strings = None;
      map_of_maps = None;
      map_of_lists_of_strings = None;
      long = None;
      list_of_structs = None;
      list_of_strings = Some [ "abc"; "mno"; "xyz" ];
      list_of_maps_of_strings = None;
      list_of_lists = None;
      json_value = None;
      iso8601_timestamp = None;
      integer = None;
      httpdate_timestamp = None;
      float_ = None;
      empty_struct = None;
      double = None;
      boolean_ = None;
      blob = None;
    }
  in
  Mock.mock_response ?body:(Some "{\"ListOfStrings\":[\"abc\",\"mno\",\"xyz\"]}") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = KitchenSinkOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string "{\"ListOfStrings\":[\"abc\",\"mno\",\"xyz\"]}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let serializes_empty_list_shapes () =
  Eio.Switch.run ~name:"serializes_empty_list_shapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.kitchen_sink =
    {
      unix_timestamp = None;
      timestamp = None;
      struct_with_json_name = None;
      string_ = None;
      simple_struct = None;
      recursive_struct = None;
      recursive_map = None;
      recursive_list = None;
      map_of_structs = None;
      map_of_strings = None;
      map_of_maps = None;
      map_of_lists_of_strings = None;
      long = None;
      list_of_structs = None;
      list_of_strings = Some [];
      list_of_maps_of_strings = None;
      list_of_lists = None;
      json_value = None;
      iso8601_timestamp = None;
      integer = None;
      httpdate_timestamp = None;
      float_ = None;
      empty_struct = None;
      double = None;
      boolean_ = None;
      blob = None;
    }
  in
  Mock.mock_response ?body:(Some "{\"ListOfStrings\":[]}") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = KitchenSinkOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string "{\"ListOfStrings\":[]}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let serializes_list_of_map_shapes () =
  Eio.Switch.run ~name:"serializes_list_of_map_shapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.kitchen_sink =
    {
      unix_timestamp = None;
      timestamp = None;
      struct_with_json_name = None;
      string_ = None;
      simple_struct = None;
      recursive_struct = None;
      recursive_map = None;
      recursive_list = None;
      map_of_structs = None;
      map_of_strings = None;
      map_of_maps = None;
      map_of_lists_of_strings = None;
      long = None;
      list_of_structs = None;
      list_of_strings = None;
      list_of_maps_of_strings = Some [ [ ("foo", "bar") ]; [ ("abc", "xyz") ]; [ ("red", "blue") ] ];
      list_of_lists = None;
      json_value = None;
      iso8601_timestamp = None;
      integer = None;
      httpdate_timestamp = None;
      float_ = None;
      empty_struct = None;
      double = None;
      boolean_ = None;
      blob = None;
    }
  in
  Mock.mock_response
    ?body:
      (Some "{\"ListOfMapsOfStrings\":[{\"foo\":\"bar\"},{\"abc\":\"xyz\"},{\"red\":\"blue\"}]}")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = KitchenSinkOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "{\"ListOfMapsOfStrings\":[{\"foo\":\"bar\"},{\"abc\":\"xyz\"},{\"red\":\"blue\"}]}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let serializes_list_of_structure_shapes () =
  Eio.Switch.run ~name:"serializes_list_of_structure_shapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.kitchen_sink =
    {
      unix_timestamp = None;
      timestamp = None;
      struct_with_json_name = None;
      string_ = None;
      simple_struct = None;
      recursive_struct = None;
      recursive_map = None;
      recursive_list = None;
      map_of_structs = None;
      map_of_strings = None;
      map_of_maps = None;
      map_of_lists_of_strings = None;
      long = None;
      list_of_structs =
        Some [ { value = Some "abc" }; { value = Some "mno" }; { value = Some "xyz" } ];
      list_of_strings = None;
      list_of_maps_of_strings = None;
      list_of_lists = None;
      json_value = None;
      iso8601_timestamp = None;
      integer = None;
      httpdate_timestamp = None;
      float_ = None;
      empty_struct = None;
      double = None;
      boolean_ = None;
      blob = None;
    }
  in
  Mock.mock_response
    ?body:(Some "{\"ListOfStructs\":[{\"Value\":\"abc\"},{\"Value\":\"mno\"},{\"Value\":\"xyz\"}]}")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = KitchenSinkOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "{\"ListOfStructs\":[{\"Value\":\"abc\"},{\"Value\":\"mno\"},{\"Value\":\"xyz\"}]}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let serializes_list_of_recursive_structure_shapes () =
  Eio.Switch.run ~name:"serializes_list_of_recursive_structure_shapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.kitchen_sink =
    {
      unix_timestamp = None;
      timestamp = None;
      struct_with_json_name = None;
      string_ = None;
      simple_struct = None;
      recursive_struct = None;
      recursive_map = None;
      recursive_list =
        Some
          [
            {
              unix_timestamp = None;
              timestamp = None;
              struct_with_json_name = None;
              string_ = None;
              simple_struct = None;
              recursive_struct = None;
              recursive_map = None;
              recursive_list =
                Some
                  [
                    {
                      unix_timestamp = None;
                      timestamp = None;
                      struct_with_json_name = None;
                      string_ = None;
                      simple_struct = None;
                      recursive_struct = None;
                      recursive_map = None;
                      recursive_list =
                        Some
                          [
                            {
                              unix_timestamp = None;
                              timestamp = None;
                              struct_with_json_name = None;
                              string_ = None;
                              simple_struct = None;
                              recursive_struct = None;
                              recursive_map = None;
                              recursive_list = None;
                              map_of_structs = None;
                              map_of_strings = None;
                              map_of_maps = None;
                              map_of_lists_of_strings = None;
                              long = None;
                              list_of_structs = None;
                              list_of_strings = None;
                              list_of_maps_of_strings = None;
                              list_of_lists = None;
                              json_value = None;
                              iso8601_timestamp = None;
                              integer = Some 123;
                              httpdate_timestamp = None;
                              float_ = None;
                              empty_struct = None;
                              double = None;
                              boolean_ = None;
                              blob = None;
                            };
                          ];
                      map_of_structs = None;
                      map_of_strings = None;
                      map_of_maps = None;
                      map_of_lists_of_strings = None;
                      long = None;
                      list_of_structs = None;
                      list_of_strings = None;
                      list_of_maps_of_strings = None;
                      list_of_lists = None;
                      json_value = None;
                      iso8601_timestamp = None;
                      integer = None;
                      httpdate_timestamp = None;
                      float_ = None;
                      empty_struct = None;
                      double = None;
                      boolean_ = None;
                      blob = None;
                    };
                  ];
              map_of_structs = None;
              map_of_strings = None;
              map_of_maps = None;
              map_of_lists_of_strings = None;
              long = None;
              list_of_structs = None;
              list_of_strings = None;
              list_of_maps_of_strings = None;
              list_of_lists = None;
              json_value = None;
              iso8601_timestamp = None;
              integer = None;
              httpdate_timestamp = None;
              float_ = None;
              empty_struct = None;
              double = None;
              boolean_ = None;
              blob = None;
            };
          ];
      map_of_structs = None;
      map_of_strings = None;
      map_of_maps = None;
      map_of_lists_of_strings = None;
      long = None;
      list_of_structs = None;
      list_of_strings = None;
      list_of_maps_of_strings = None;
      list_of_lists = None;
      json_value = None;
      iso8601_timestamp = None;
      integer = None;
      httpdate_timestamp = None;
      float_ = None;
      empty_struct = None;
      double = None;
      boolean_ = None;
      blob = None;
    }
  in
  Mock.mock_response
    ?body:
      (Some "{\"RecursiveList\":[{\"RecursiveList\":[{\"RecursiveList\":[{\"Integer\":123}]}]}]}")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = KitchenSinkOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "{\"RecursiveList\":[{\"RecursiveList\":[{\"RecursiveList\":[{\"Integer\":123}]}]}]}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let serializes_map_shapes () =
  Eio.Switch.run ~name:"serializes_map_shapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.kitchen_sink =
    {
      unix_timestamp = None;
      timestamp = None;
      struct_with_json_name = None;
      string_ = None;
      simple_struct = None;
      recursive_struct = None;
      recursive_map = None;
      recursive_list = None;
      map_of_structs = None;
      map_of_strings = Some [ ("abc", "xyz"); ("mno", "hjk") ];
      map_of_maps = None;
      map_of_lists_of_strings = None;
      long = None;
      list_of_structs = None;
      list_of_strings = None;
      list_of_maps_of_strings = None;
      list_of_lists = None;
      json_value = None;
      iso8601_timestamp = None;
      integer = None;
      httpdate_timestamp = None;
      float_ = None;
      empty_struct = None;
      double = None;
      boolean_ = None;
      blob = None;
    }
  in
  Mock.mock_response ?body:(Some "{\"MapOfStrings\":{\"abc\":\"xyz\",\"mno\":\"hjk\"}}") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = KitchenSinkOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string "{\"MapOfStrings\":{\"abc\":\"xyz\",\"mno\":\"hjk\"}}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let serializes_empty_map_shapes () =
  Eio.Switch.run ~name:"serializes_empty_map_shapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.kitchen_sink =
    {
      unix_timestamp = None;
      timestamp = None;
      struct_with_json_name = None;
      string_ = None;
      simple_struct = None;
      recursive_struct = None;
      recursive_map = None;
      recursive_list = None;
      map_of_structs = None;
      map_of_strings = Some [];
      map_of_maps = None;
      map_of_lists_of_strings = None;
      long = None;
      list_of_structs = None;
      list_of_strings = None;
      list_of_maps_of_strings = None;
      list_of_lists = None;
      json_value = None;
      iso8601_timestamp = None;
      integer = None;
      httpdate_timestamp = None;
      float_ = None;
      empty_struct = None;
      double = None;
      boolean_ = None;
      blob = None;
    }
  in
  Mock.mock_response ?body:(Some "{\"MapOfStrings\":{}}") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = KitchenSinkOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string "{\"MapOfStrings\":{}}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let serializes_map_of_list_shapes () =
  Eio.Switch.run ~name:"serializes_map_of_list_shapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.kitchen_sink =
    {
      unix_timestamp = None;
      timestamp = None;
      struct_with_json_name = None;
      string_ = None;
      simple_struct = None;
      recursive_struct = None;
      recursive_map = None;
      recursive_list = None;
      map_of_structs = None;
      map_of_strings = None;
      map_of_maps = None;
      map_of_lists_of_strings = Some [ ("abc", [ "abc"; "xyz" ]); ("mno", [ "xyz"; "abc" ]) ];
      long = None;
      list_of_structs = None;
      list_of_strings = None;
      list_of_maps_of_strings = None;
      list_of_lists = None;
      json_value = None;
      iso8601_timestamp = None;
      integer = None;
      httpdate_timestamp = None;
      float_ = None;
      empty_struct = None;
      double = None;
      boolean_ = None;
      blob = None;
    }
  in
  Mock.mock_response
    ?body:(Some "{\"MapOfListsOfStrings\":{\"abc\":[\"abc\",\"xyz\"],\"mno\":[\"xyz\",\"abc\"]}}")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = KitchenSinkOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "{\"MapOfListsOfStrings\":{\"abc\":[\"abc\",\"xyz\"],\"mno\":[\"xyz\",\"abc\"]}}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let serializes_map_of_structure_shapes () =
  Eio.Switch.run ~name:"serializes_map_of_structure_shapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.kitchen_sink =
    {
      unix_timestamp = None;
      timestamp = None;
      struct_with_json_name = None;
      string_ = None;
      simple_struct = None;
      recursive_struct = None;
      recursive_map = None;
      recursive_list = None;
      map_of_structs =
        Some [ ("key1", { value = Some "value-1" }); ("key2", { value = Some "value-2" }) ];
      map_of_strings = None;
      map_of_maps = None;
      map_of_lists_of_strings = None;
      long = None;
      list_of_structs = None;
      list_of_strings = None;
      list_of_maps_of_strings = None;
      list_of_lists = None;
      json_value = None;
      iso8601_timestamp = None;
      integer = None;
      httpdate_timestamp = None;
      float_ = None;
      empty_struct = None;
      double = None;
      boolean_ = None;
      blob = None;
    }
  in
  Mock.mock_response
    ?body:
      (Some "{\"MapOfStructs\":{\"key1\":{\"Value\":\"value-1\"},\"key2\":{\"Value\":\"value-2\"}}}")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = KitchenSinkOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "{\"MapOfStructs\":{\"key1\":{\"Value\":\"value-1\"},\"key2\":{\"Value\":\"value-2\"}}}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let serializes_map_of_recursive_structure_shapes () =
  Eio.Switch.run ~name:"serializes_map_of_recursive_structure_shapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.kitchen_sink =
    {
      unix_timestamp = None;
      timestamp = None;
      struct_with_json_name = None;
      string_ = None;
      simple_struct = None;
      recursive_struct = None;
      recursive_map =
        Some
          [
            ( "key1",
              {
                unix_timestamp = None;
                timestamp = None;
                struct_with_json_name = None;
                string_ = None;
                simple_struct = None;
                recursive_struct = None;
                recursive_map =
                  Some
                    [
                      ( "key2",
                        {
                          unix_timestamp = None;
                          timestamp = None;
                          struct_with_json_name = None;
                          string_ = None;
                          simple_struct = None;
                          recursive_struct = None;
                          recursive_map =
                            Some
                              [
                                ( "key3",
                                  {
                                    unix_timestamp = None;
                                    timestamp = None;
                                    struct_with_json_name = None;
                                    string_ = None;
                                    simple_struct = None;
                                    recursive_struct = None;
                                    recursive_map = None;
                                    recursive_list = None;
                                    map_of_structs = None;
                                    map_of_strings = None;
                                    map_of_maps = None;
                                    map_of_lists_of_strings = None;
                                    long = None;
                                    list_of_structs = None;
                                    list_of_strings = None;
                                    list_of_maps_of_strings = None;
                                    list_of_lists = None;
                                    json_value = None;
                                    iso8601_timestamp = None;
                                    integer = None;
                                    httpdate_timestamp = None;
                                    float_ = None;
                                    empty_struct = None;
                                    double = None;
                                    boolean_ = Some false;
                                    blob = None;
                                  } );
                              ];
                          recursive_list = None;
                          map_of_structs = None;
                          map_of_strings = None;
                          map_of_maps = None;
                          map_of_lists_of_strings = None;
                          long = None;
                          list_of_structs = None;
                          list_of_strings = None;
                          list_of_maps_of_strings = None;
                          list_of_lists = None;
                          json_value = None;
                          iso8601_timestamp = None;
                          integer = None;
                          httpdate_timestamp = None;
                          float_ = None;
                          empty_struct = None;
                          double = None;
                          boolean_ = None;
                          blob = None;
                        } );
                    ];
                recursive_list = None;
                map_of_structs = None;
                map_of_strings = None;
                map_of_maps = None;
                map_of_lists_of_strings = None;
                long = None;
                list_of_structs = None;
                list_of_strings = None;
                list_of_maps_of_strings = None;
                list_of_lists = None;
                json_value = None;
                iso8601_timestamp = None;
                integer = None;
                httpdate_timestamp = None;
                float_ = None;
                empty_struct = None;
                double = None;
                boolean_ = None;
                blob = None;
              } );
          ];
      recursive_list = None;
      map_of_structs = None;
      map_of_strings = None;
      map_of_maps = None;
      map_of_lists_of_strings = None;
      long = None;
      list_of_structs = None;
      list_of_strings = None;
      list_of_maps_of_strings = None;
      list_of_lists = None;
      json_value = None;
      iso8601_timestamp = None;
      integer = None;
      httpdate_timestamp = None;
      float_ = None;
      empty_struct = None;
      double = None;
      boolean_ = None;
      blob = None;
    }
  in
  Mock.mock_response
    ?body:
      (Some
         "{\"RecursiveMap\":{\"key1\":{\"RecursiveMap\":{\"key2\":{\"RecursiveMap\":{\"key3\":{\"Boolean\":false}}}}}}}")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = KitchenSinkOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "{\"RecursiveMap\":{\"key1\":{\"RecursiveMap\":{\"key2\":{\"RecursiveMap\":{\"key3\":{\"Boolean\":false}}}}}}}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let serializes_structure_shapes () =
  Eio.Switch.run ~name:"serializes_structure_shapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.kitchen_sink =
    {
      unix_timestamp = None;
      timestamp = None;
      struct_with_json_name = None;
      string_ = None;
      simple_struct = Some { value = Some "abc" };
      recursive_struct = None;
      recursive_map = None;
      recursive_list = None;
      map_of_structs = None;
      map_of_strings = None;
      map_of_maps = None;
      map_of_lists_of_strings = None;
      long = None;
      list_of_structs = None;
      list_of_strings = None;
      list_of_maps_of_strings = None;
      list_of_lists = None;
      json_value = None;
      iso8601_timestamp = None;
      integer = None;
      httpdate_timestamp = None;
      float_ = None;
      empty_struct = None;
      double = None;
      boolean_ = None;
      blob = None;
    }
  in
  Mock.mock_response ?body:(Some "{\"SimpleStruct\":{\"Value\":\"abc\"}}") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = KitchenSinkOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string "{\"SimpleStruct\":{\"Value\":\"abc\"}}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let serializes_structure_members_with_locationname_traits () =
  Eio.Switch.run ~name:"serializes_structure_members_with_locationname_traits" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.kitchen_sink =
    {
      unix_timestamp = None;
      timestamp = None;
      struct_with_json_name = Some { value = Some "some-value" };
      string_ = None;
      simple_struct = None;
      recursive_struct = None;
      recursive_map = None;
      recursive_list = None;
      map_of_structs = None;
      map_of_strings = None;
      map_of_maps = None;
      map_of_lists_of_strings = None;
      long = None;
      list_of_structs = None;
      list_of_strings = None;
      list_of_maps_of_strings = None;
      list_of_lists = None;
      json_value = None;
      iso8601_timestamp = None;
      integer = None;
      httpdate_timestamp = None;
      float_ = None;
      empty_struct = None;
      double = None;
      boolean_ = None;
      blob = None;
    }
  in
  Mock.mock_response ?body:(Some "{\"StructWithJsonName\":{\"Value\":\"some-value\"}}") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = KitchenSinkOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string "{\"StructWithJsonName\":{\"Value\":\"some-value\"}}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let serializes_empty_structure_shapes () =
  Eio.Switch.run ~name:"serializes_empty_structure_shapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.kitchen_sink =
    {
      unix_timestamp = None;
      timestamp = None;
      struct_with_json_name = None;
      string_ = None;
      simple_struct = Some { value = None };
      recursive_struct = None;
      recursive_map = None;
      recursive_list = None;
      map_of_structs = None;
      map_of_strings = None;
      map_of_maps = None;
      map_of_lists_of_strings = None;
      long = None;
      list_of_structs = None;
      list_of_strings = None;
      list_of_maps_of_strings = None;
      list_of_lists = None;
      json_value = None;
      iso8601_timestamp = None;
      integer = None;
      httpdate_timestamp = None;
      float_ = None;
      empty_struct = None;
      double = None;
      boolean_ = None;
      blob = None;
    }
  in
  Mock.mock_response ?body:(Some "{\"SimpleStruct\":{}}") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = KitchenSinkOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string "{\"SimpleStruct\":{}}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let serializes_structure_which_have_no_members () =
  Eio.Switch.run ~name:"serializes_structure_which_have_no_members" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.kitchen_sink =
    {
      unix_timestamp = None;
      timestamp = None;
      struct_with_json_name = None;
      string_ = None;
      simple_struct = None;
      recursive_struct = None;
      recursive_map = None;
      recursive_list = None;
      map_of_structs = None;
      map_of_strings = None;
      map_of_maps = None;
      map_of_lists_of_strings = None;
      long = None;
      list_of_structs = None;
      list_of_strings = None;
      list_of_maps_of_strings = None;
      list_of_lists = None;
      json_value = None;
      iso8601_timestamp = None;
      integer = None;
      httpdate_timestamp = None;
      float_ = None;
      empty_struct = Some ();
      double = None;
      boolean_ = None;
      blob = None;
    }
  in
  Mock.mock_response ?body:(Some "{\"EmptyStruct\":{}}") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = KitchenSinkOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string "{\"EmptyStruct\":{}}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let serializes_recursive_structure_shapes () =
  Eio.Switch.run ~name:"serializes_recursive_structure_shapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.kitchen_sink =
    {
      unix_timestamp = None;
      timestamp = None;
      struct_with_json_name = None;
      string_ = Some "top-value";
      simple_struct = None;
      recursive_struct =
        Some
          {
            unix_timestamp = None;
            timestamp = None;
            struct_with_json_name = None;
            string_ = Some "nested-value";
            simple_struct = None;
            recursive_struct = None;
            recursive_map = None;
            recursive_list =
              Some
                [
                  {
                    unix_timestamp = None;
                    timestamp = None;
                    struct_with_json_name = None;
                    string_ = Some "string-only";
                    simple_struct = None;
                    recursive_struct = None;
                    recursive_map = None;
                    recursive_list = None;
                    map_of_structs = None;
                    map_of_strings = None;
                    map_of_maps = None;
                    map_of_lists_of_strings = None;
                    long = None;
                    list_of_structs = None;
                    list_of_strings = None;
                    list_of_maps_of_strings = None;
                    list_of_lists = None;
                    json_value = None;
                    iso8601_timestamp = None;
                    integer = None;
                    httpdate_timestamp = None;
                    float_ = None;
                    empty_struct = None;
                    double = None;
                    boolean_ = None;
                    blob = None;
                  };
                  {
                    unix_timestamp = None;
                    timestamp = None;
                    struct_with_json_name = None;
                    string_ = None;
                    simple_struct = None;
                    recursive_struct =
                      Some
                        {
                          unix_timestamp = None;
                          timestamp = None;
                          struct_with_json_name = None;
                          string_ = None;
                          simple_struct = None;
                          recursive_struct = None;
                          recursive_map = None;
                          recursive_list = None;
                          map_of_structs = None;
                          map_of_strings = Some [ ("color", "red"); ("size", "large") ];
                          map_of_maps = None;
                          map_of_lists_of_strings = None;
                          long = None;
                          list_of_structs = None;
                          list_of_strings = None;
                          list_of_maps_of_strings = None;
                          list_of_lists = None;
                          json_value = None;
                          iso8601_timestamp = None;
                          integer = None;
                          httpdate_timestamp = None;
                          float_ = None;
                          empty_struct = None;
                          double = None;
                          boolean_ = None;
                          blob = None;
                        };
                    recursive_map = None;
                    recursive_list = None;
                    map_of_structs = None;
                    map_of_strings = None;
                    map_of_maps = None;
                    map_of_lists_of_strings = None;
                    long = None;
                    list_of_structs = None;
                    list_of_strings = None;
                    list_of_maps_of_strings = None;
                    list_of_lists = None;
                    json_value = None;
                    iso8601_timestamp = None;
                    integer = None;
                    httpdate_timestamp = None;
                    float_ = None;
                    empty_struct = None;
                    double = None;
                    boolean_ = None;
                    blob = None;
                  };
                ];
            map_of_structs = None;
            map_of_strings = None;
            map_of_maps = None;
            map_of_lists_of_strings = None;
            long = None;
            list_of_structs = None;
            list_of_strings = None;
            list_of_maps_of_strings = None;
            list_of_lists = None;
            json_value = None;
            iso8601_timestamp = None;
            integer = None;
            httpdate_timestamp = None;
            float_ = None;
            empty_struct = None;
            double = None;
            boolean_ = Some true;
            blob = None;
          };
      recursive_map = None;
      recursive_list = None;
      map_of_structs = None;
      map_of_strings = None;
      map_of_maps = None;
      map_of_lists_of_strings = None;
      long = None;
      list_of_structs = None;
      list_of_strings = None;
      list_of_maps_of_strings = None;
      list_of_lists = None;
      json_value = None;
      iso8601_timestamp = None;
      integer = None;
      httpdate_timestamp = None;
      float_ = None;
      empty_struct = None;
      double = None;
      boolean_ = Some false;
      blob = None;
    }
  in
  Mock.mock_response
    ?body:
      (Some
         "{\"String\":\"top-value\",\"Boolean\":false,\"RecursiveStruct\":{\"String\":\"nested-value\",\"Boolean\":true,\"RecursiveList\":[{\"String\":\"string-only\"},{\"RecursiveStruct\":{\"MapOfStrings\":{\"color\":\"red\",\"size\":\"large\"}}}]}}")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = KitchenSinkOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "{\"String\":\"top-value\",\"Boolean\":false,\"RecursiveStruct\":{\"String\":\"nested-value\",\"Boolean\":true,\"RecursiveList\":[{\"String\":\"string-only\"},{\"RecursiveStruct\":{\"MapOfStrings\":{\"color\":\"red\",\"size\":\"large\"}}}]}}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let parses_operations_with_empty_json_bodies () =
  Eio.Switch.run ~name:"parses_operations_with_empty_json_bodies" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "{}") ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response =
    KitchenSinkOperation.request ctx
      {
        unix_timestamp = None;
        timestamp = None;
        struct_with_json_name = None;
        string_ = None;
        simple_struct = None;
        recursive_struct = None;
        recursive_map = None;
        recursive_list = None;
        map_of_structs = None;
        map_of_strings = None;
        map_of_maps = None;
        map_of_lists_of_strings = None;
        long = None;
        list_of_structs = None;
        list_of_strings = None;
        list_of_maps_of_strings = None;
        list_of_lists = None;
        json_value = None;
        iso8601_timestamp = None;
        integer = None;
        httpdate_timestamp = None;
        float_ = None;
        empty_struct = None;
        double = None;
        boolean_ = None;
        blob = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           unix_timestamp = None;
           timestamp = None;
           struct_with_json_name = None;
           string_ = None;
           simple_struct = None;
           recursive_struct = None;
           recursive_map = None;
           recursive_list = None;
           map_of_structs = None;
           map_of_strings = None;
           map_of_maps = None;
           map_of_lists_of_strings = None;
           long = None;
           list_of_structs = None;
           list_of_strings = None;
           list_of_maps_of_strings = None;
           list_of_lists = None;
           json_value = None;
           iso8601_timestamp = None;
           integer = None;
           httpdate_timestamp = None;
           float_ = None;
           empty_struct = None;
           double = None;
           boolean_ = None;
           blob = None;
         }
          : Types.kitchen_sink)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_kitchen_sink Types.equal_kitchen_sink)
        "expected output" expected result
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let parses_string_shapes () =
  Eio.Switch.run ~name:"parses_string_shapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "{\"String\":\"string-value\"}") ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response =
    KitchenSinkOperation.request ctx
      {
        unix_timestamp = None;
        timestamp = None;
        struct_with_json_name = None;
        string_ = None;
        simple_struct = None;
        recursive_struct = None;
        recursive_map = None;
        recursive_list = None;
        map_of_structs = None;
        map_of_strings = None;
        map_of_maps = None;
        map_of_lists_of_strings = None;
        long = None;
        list_of_structs = None;
        list_of_strings = None;
        list_of_maps_of_strings = None;
        list_of_lists = None;
        json_value = None;
        iso8601_timestamp = None;
        integer = None;
        httpdate_timestamp = None;
        float_ = None;
        empty_struct = None;
        double = None;
        boolean_ = None;
        blob = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           unix_timestamp = None;
           timestamp = None;
           struct_with_json_name = None;
           string_ = Some "string-value";
           simple_struct = None;
           recursive_struct = None;
           recursive_map = None;
           recursive_list = None;
           map_of_structs = None;
           map_of_strings = None;
           map_of_maps = None;
           map_of_lists_of_strings = None;
           long = None;
           list_of_structs = None;
           list_of_strings = None;
           list_of_maps_of_strings = None;
           list_of_lists = None;
           json_value = None;
           iso8601_timestamp = None;
           integer = None;
           httpdate_timestamp = None;
           float_ = None;
           empty_struct = None;
           double = None;
           boolean_ = None;
           blob = None;
         }
          : Types.kitchen_sink)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_kitchen_sink Types.equal_kitchen_sink)
        "expected output" expected result
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let parses_integer_shapes () =
  Eio.Switch.run ~name:"parses_integer_shapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "{\"Integer\":1234}") ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response =
    KitchenSinkOperation.request ctx
      {
        unix_timestamp = None;
        timestamp = None;
        struct_with_json_name = None;
        string_ = None;
        simple_struct = None;
        recursive_struct = None;
        recursive_map = None;
        recursive_list = None;
        map_of_structs = None;
        map_of_strings = None;
        map_of_maps = None;
        map_of_lists_of_strings = None;
        long = None;
        list_of_structs = None;
        list_of_strings = None;
        list_of_maps_of_strings = None;
        list_of_lists = None;
        json_value = None;
        iso8601_timestamp = None;
        integer = None;
        httpdate_timestamp = None;
        float_ = None;
        empty_struct = None;
        double = None;
        boolean_ = None;
        blob = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           unix_timestamp = None;
           timestamp = None;
           struct_with_json_name = None;
           string_ = None;
           simple_struct = None;
           recursive_struct = None;
           recursive_map = None;
           recursive_list = None;
           map_of_structs = None;
           map_of_strings = None;
           map_of_maps = None;
           map_of_lists_of_strings = None;
           long = None;
           list_of_structs = None;
           list_of_strings = None;
           list_of_maps_of_strings = None;
           list_of_lists = None;
           json_value = None;
           iso8601_timestamp = None;
           integer = Some 1234;
           httpdate_timestamp = None;
           float_ = None;
           empty_struct = None;
           double = None;
           boolean_ = None;
           blob = None;
         }
          : Types.kitchen_sink)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_kitchen_sink Types.equal_kitchen_sink)
        "expected output" expected result
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let parses_long_shapes () =
  Eio.Switch.run ~name:"parses_long_shapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "{\"Long\":1234567890123456789}") ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response =
    KitchenSinkOperation.request ctx
      {
        unix_timestamp = None;
        timestamp = None;
        struct_with_json_name = None;
        string_ = None;
        simple_struct = None;
        recursive_struct = None;
        recursive_map = None;
        recursive_list = None;
        map_of_structs = None;
        map_of_strings = None;
        map_of_maps = None;
        map_of_lists_of_strings = None;
        long = None;
        list_of_structs = None;
        list_of_strings = None;
        list_of_maps_of_strings = None;
        list_of_lists = None;
        json_value = None;
        iso8601_timestamp = None;
        integer = None;
        httpdate_timestamp = None;
        float_ = None;
        empty_struct = None;
        double = None;
        boolean_ = None;
        blob = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           unix_timestamp = None;
           timestamp = None;
           struct_with_json_name = None;
           string_ = None;
           simple_struct = None;
           recursive_struct = None;
           recursive_map = None;
           recursive_list = None;
           map_of_structs = None;
           map_of_strings = None;
           map_of_maps = None;
           map_of_lists_of_strings = None;
           long = Some (Smaws_Lib.CoreTypes.Int64.of_int 1234567890123456789);
           list_of_structs = None;
           list_of_strings = None;
           list_of_maps_of_strings = None;
           list_of_lists = None;
           json_value = None;
           iso8601_timestamp = None;
           integer = None;
           httpdate_timestamp = None;
           float_ = None;
           empty_struct = None;
           double = None;
           boolean_ = None;
           blob = None;
         }
          : Types.kitchen_sink)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_kitchen_sink Types.equal_kitchen_sink)
        "expected output" expected result
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let parses_float_shapes () =
  Eio.Switch.run ~name:"parses_float_shapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "{\"Float\":1234.5}") ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response =
    KitchenSinkOperation.request ctx
      {
        unix_timestamp = None;
        timestamp = None;
        struct_with_json_name = None;
        string_ = None;
        simple_struct = None;
        recursive_struct = None;
        recursive_map = None;
        recursive_list = None;
        map_of_structs = None;
        map_of_strings = None;
        map_of_maps = None;
        map_of_lists_of_strings = None;
        long = None;
        list_of_structs = None;
        list_of_strings = None;
        list_of_maps_of_strings = None;
        list_of_lists = None;
        json_value = None;
        iso8601_timestamp = None;
        integer = None;
        httpdate_timestamp = None;
        float_ = None;
        empty_struct = None;
        double = None;
        boolean_ = None;
        blob = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           unix_timestamp = None;
           timestamp = None;
           struct_with_json_name = None;
           string_ = None;
           simple_struct = None;
           recursive_struct = None;
           recursive_map = None;
           recursive_list = None;
           map_of_structs = None;
           map_of_strings = None;
           map_of_maps = None;
           map_of_lists_of_strings = None;
           long = None;
           list_of_structs = None;
           list_of_strings = None;
           list_of_maps_of_strings = None;
           list_of_lists = None;
           json_value = None;
           iso8601_timestamp = None;
           integer = None;
           httpdate_timestamp = None;
           float_ = Some 1234.5;
           empty_struct = None;
           double = None;
           boolean_ = None;
           blob = None;
         }
          : Types.kitchen_sink)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_kitchen_sink Types.equal_kitchen_sink)
        "expected output" expected result
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let parses_double_shapes () =
  Eio.Switch.run ~name:"parses_double_shapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "{\"Double\":123456789.12345679}") ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response =
    KitchenSinkOperation.request ctx
      {
        unix_timestamp = None;
        timestamp = None;
        struct_with_json_name = None;
        string_ = None;
        simple_struct = None;
        recursive_struct = None;
        recursive_map = None;
        recursive_list = None;
        map_of_structs = None;
        map_of_strings = None;
        map_of_maps = None;
        map_of_lists_of_strings = None;
        long = None;
        list_of_structs = None;
        list_of_strings = None;
        list_of_maps_of_strings = None;
        list_of_lists = None;
        json_value = None;
        iso8601_timestamp = None;
        integer = None;
        httpdate_timestamp = None;
        float_ = None;
        empty_struct = None;
        double = None;
        boolean_ = None;
        blob = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           unix_timestamp = None;
           timestamp = None;
           struct_with_json_name = None;
           string_ = None;
           simple_struct = None;
           recursive_struct = None;
           recursive_map = None;
           recursive_list = None;
           map_of_structs = None;
           map_of_strings = None;
           map_of_maps = None;
           map_of_lists_of_strings = None;
           long = None;
           list_of_structs = None;
           list_of_strings = None;
           list_of_maps_of_strings = None;
           list_of_lists = None;
           json_value = None;
           iso8601_timestamp = None;
           integer = None;
           httpdate_timestamp = None;
           float_ = None;
           empty_struct = None;
           double = Some 123456789.12345679;
           boolean_ = None;
           blob = None;
         }
          : Types.kitchen_sink)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_kitchen_sink Types.equal_kitchen_sink)
        "expected output" expected result
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let parses_boolean_shapes_true () =
  Eio.Switch.run ~name:"parses_boolean_shapes_true" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "{\"Boolean\":true}") ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response =
    KitchenSinkOperation.request ctx
      {
        unix_timestamp = None;
        timestamp = None;
        struct_with_json_name = None;
        string_ = None;
        simple_struct = None;
        recursive_struct = None;
        recursive_map = None;
        recursive_list = None;
        map_of_structs = None;
        map_of_strings = None;
        map_of_maps = None;
        map_of_lists_of_strings = None;
        long = None;
        list_of_structs = None;
        list_of_strings = None;
        list_of_maps_of_strings = None;
        list_of_lists = None;
        json_value = None;
        iso8601_timestamp = None;
        integer = None;
        httpdate_timestamp = None;
        float_ = None;
        empty_struct = None;
        double = None;
        boolean_ = None;
        blob = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           unix_timestamp = None;
           timestamp = None;
           struct_with_json_name = None;
           string_ = None;
           simple_struct = None;
           recursive_struct = None;
           recursive_map = None;
           recursive_list = None;
           map_of_structs = None;
           map_of_strings = None;
           map_of_maps = None;
           map_of_lists_of_strings = None;
           long = None;
           list_of_structs = None;
           list_of_strings = None;
           list_of_maps_of_strings = None;
           list_of_lists = None;
           json_value = None;
           iso8601_timestamp = None;
           integer = None;
           httpdate_timestamp = None;
           float_ = None;
           empty_struct = None;
           double = None;
           boolean_ = Some true;
           blob = None;
         }
          : Types.kitchen_sink)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_kitchen_sink Types.equal_kitchen_sink)
        "expected output" expected result
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let parses_boolean_false () =
  Eio.Switch.run ~name:"parses_boolean_false" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "{\"Boolean\":false}") ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response =
    KitchenSinkOperation.request ctx
      {
        unix_timestamp = None;
        timestamp = None;
        struct_with_json_name = None;
        string_ = None;
        simple_struct = None;
        recursive_struct = None;
        recursive_map = None;
        recursive_list = None;
        map_of_structs = None;
        map_of_strings = None;
        map_of_maps = None;
        map_of_lists_of_strings = None;
        long = None;
        list_of_structs = None;
        list_of_strings = None;
        list_of_maps_of_strings = None;
        list_of_lists = None;
        json_value = None;
        iso8601_timestamp = None;
        integer = None;
        httpdate_timestamp = None;
        float_ = None;
        empty_struct = None;
        double = None;
        boolean_ = None;
        blob = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           unix_timestamp = None;
           timestamp = None;
           struct_with_json_name = None;
           string_ = None;
           simple_struct = None;
           recursive_struct = None;
           recursive_map = None;
           recursive_list = None;
           map_of_structs = None;
           map_of_strings = None;
           map_of_maps = None;
           map_of_lists_of_strings = None;
           long = None;
           list_of_structs = None;
           list_of_strings = None;
           list_of_maps_of_strings = None;
           list_of_lists = None;
           json_value = None;
           iso8601_timestamp = None;
           integer = None;
           httpdate_timestamp = None;
           float_ = None;
           empty_struct = None;
           double = None;
           boolean_ = Some false;
           blob = None;
         }
          : Types.kitchen_sink)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_kitchen_sink Types.equal_kitchen_sink)
        "expected output" expected result
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let parses_blob_shapes () =
  Eio.Switch.run ~name:"parses_blob_shapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "{\"Blob\":\"YmluYXJ5LXZhbHVl\"}") ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response =
    KitchenSinkOperation.request ctx
      {
        unix_timestamp = None;
        timestamp = None;
        struct_with_json_name = None;
        string_ = None;
        simple_struct = None;
        recursive_struct = None;
        recursive_map = None;
        recursive_list = None;
        map_of_structs = None;
        map_of_strings = None;
        map_of_maps = None;
        map_of_lists_of_strings = None;
        long = None;
        list_of_structs = None;
        list_of_strings = None;
        list_of_maps_of_strings = None;
        list_of_lists = None;
        json_value = None;
        iso8601_timestamp = None;
        integer = None;
        httpdate_timestamp = None;
        float_ = None;
        empty_struct = None;
        double = None;
        boolean_ = None;
        blob = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           unix_timestamp = None;
           timestamp = None;
           struct_with_json_name = None;
           string_ = None;
           simple_struct = None;
           recursive_struct = None;
           recursive_map = None;
           recursive_list = None;
           map_of_structs = None;
           map_of_strings = None;
           map_of_maps = None;
           map_of_lists_of_strings = None;
           long = None;
           list_of_structs = None;
           list_of_strings = None;
           list_of_maps_of_strings = None;
           list_of_lists = None;
           json_value = None;
           iso8601_timestamp = None;
           integer = None;
           httpdate_timestamp = None;
           float_ = None;
           empty_struct = None;
           double = None;
           boolean_ = None;
           blob = Some (Smaws_Lib.CoreTypes.Blob.of_string "binary-value");
         }
          : Types.kitchen_sink)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_kitchen_sink Types.equal_kitchen_sink)
        "expected output" expected result
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let parses_timestamp_shapes () =
  Eio.Switch.run ~name:"parses_timestamp_shapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "{\"Timestamp\":946845296}") ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response =
    KitchenSinkOperation.request ctx
      {
        unix_timestamp = None;
        timestamp = None;
        struct_with_json_name = None;
        string_ = None;
        simple_struct = None;
        recursive_struct = None;
        recursive_map = None;
        recursive_list = None;
        map_of_structs = None;
        map_of_strings = None;
        map_of_maps = None;
        map_of_lists_of_strings = None;
        long = None;
        list_of_structs = None;
        list_of_strings = None;
        list_of_maps_of_strings = None;
        list_of_lists = None;
        json_value = None;
        iso8601_timestamp = None;
        integer = None;
        httpdate_timestamp = None;
        float_ = None;
        empty_struct = None;
        double = None;
        boolean_ = None;
        blob = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           unix_timestamp = None;
           timestamp = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 946845296.));
           struct_with_json_name = None;
           string_ = None;
           simple_struct = None;
           recursive_struct = None;
           recursive_map = None;
           recursive_list = None;
           map_of_structs = None;
           map_of_strings = None;
           map_of_maps = None;
           map_of_lists_of_strings = None;
           long = None;
           list_of_structs = None;
           list_of_strings = None;
           list_of_maps_of_strings = None;
           list_of_lists = None;
           json_value = None;
           iso8601_timestamp = None;
           integer = None;
           httpdate_timestamp = None;
           float_ = None;
           empty_struct = None;
           double = None;
           boolean_ = None;
           blob = None;
         }
          : Types.kitchen_sink)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_kitchen_sink Types.equal_kitchen_sink)
        "expected output" expected result
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let parses_iso8601_timestamps () =
  Eio.Switch.run ~name:"parses_iso8601_timestamps" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "{\"Iso8601Timestamp\":\"2000-01-02T20:34:56Z\"}") ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response =
    KitchenSinkOperation.request ctx
      {
        unix_timestamp = None;
        timestamp = None;
        struct_with_json_name = None;
        string_ = None;
        simple_struct = None;
        recursive_struct = None;
        recursive_map = None;
        recursive_list = None;
        map_of_structs = None;
        map_of_strings = None;
        map_of_maps = None;
        map_of_lists_of_strings = None;
        long = None;
        list_of_structs = None;
        list_of_strings = None;
        list_of_maps_of_strings = None;
        list_of_lists = None;
        json_value = None;
        iso8601_timestamp = None;
        integer = None;
        httpdate_timestamp = None;
        float_ = None;
        empty_struct = None;
        double = None;
        boolean_ = None;
        blob = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           unix_timestamp = None;
           timestamp = None;
           struct_with_json_name = None;
           string_ = None;
           simple_struct = None;
           recursive_struct = None;
           recursive_map = None;
           recursive_list = None;
           map_of_structs = None;
           map_of_strings = None;
           map_of_maps = None;
           map_of_lists_of_strings = None;
           long = None;
           list_of_structs = None;
           list_of_strings = None;
           list_of_maps_of_strings = None;
           list_of_lists = None;
           json_value = None;
           iso8601_timestamp =
             Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 946845296.));
           integer = None;
           httpdate_timestamp = None;
           float_ = None;
           empty_struct = None;
           double = None;
           boolean_ = None;
           blob = None;
         }
          : Types.kitchen_sink)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_kitchen_sink Types.equal_kitchen_sink)
        "expected output" expected result
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let parses_httpdate_timestamps () =
  Eio.Switch.run ~name:"parses_httpdate_timestamps" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "{\"HttpdateTimestamp\":\"Sun, 02 Jan 2000 20:34:56 GMT\"}")
    ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response =
    KitchenSinkOperation.request ctx
      {
        unix_timestamp = None;
        timestamp = None;
        struct_with_json_name = None;
        string_ = None;
        simple_struct = None;
        recursive_struct = None;
        recursive_map = None;
        recursive_list = None;
        map_of_structs = None;
        map_of_strings = None;
        map_of_maps = None;
        map_of_lists_of_strings = None;
        long = None;
        list_of_structs = None;
        list_of_strings = None;
        list_of_maps_of_strings = None;
        list_of_lists = None;
        json_value = None;
        iso8601_timestamp = None;
        integer = None;
        httpdate_timestamp = None;
        float_ = None;
        empty_struct = None;
        double = None;
        boolean_ = None;
        blob = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           unix_timestamp = None;
           timestamp = None;
           struct_with_json_name = None;
           string_ = None;
           simple_struct = None;
           recursive_struct = None;
           recursive_map = None;
           recursive_list = None;
           map_of_structs = None;
           map_of_strings = None;
           map_of_maps = None;
           map_of_lists_of_strings = None;
           long = None;
           list_of_structs = None;
           list_of_strings = None;
           list_of_maps_of_strings = None;
           list_of_lists = None;
           json_value = None;
           iso8601_timestamp = None;
           integer = None;
           httpdate_timestamp =
             Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 946845296.));
           float_ = None;
           empty_struct = None;
           double = None;
           boolean_ = None;
           blob = None;
         }
          : Types.kitchen_sink)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_kitchen_sink Types.equal_kitchen_sink)
        "expected output" expected result
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let parses_list_shapes () =
  Eio.Switch.run ~name:"parses_list_shapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "{\"ListOfStrings\":[\"abc\",\"mno\",\"xyz\"]}") ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response =
    KitchenSinkOperation.request ctx
      {
        unix_timestamp = None;
        timestamp = None;
        struct_with_json_name = None;
        string_ = None;
        simple_struct = None;
        recursive_struct = None;
        recursive_map = None;
        recursive_list = None;
        map_of_structs = None;
        map_of_strings = None;
        map_of_maps = None;
        map_of_lists_of_strings = None;
        long = None;
        list_of_structs = None;
        list_of_strings = None;
        list_of_maps_of_strings = None;
        list_of_lists = None;
        json_value = None;
        iso8601_timestamp = None;
        integer = None;
        httpdate_timestamp = None;
        float_ = None;
        empty_struct = None;
        double = None;
        boolean_ = None;
        blob = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           unix_timestamp = None;
           timestamp = None;
           struct_with_json_name = None;
           string_ = None;
           simple_struct = None;
           recursive_struct = None;
           recursive_map = None;
           recursive_list = None;
           map_of_structs = None;
           map_of_strings = None;
           map_of_maps = None;
           map_of_lists_of_strings = None;
           long = None;
           list_of_structs = None;
           list_of_strings = Some [ "abc"; "mno"; "xyz" ];
           list_of_maps_of_strings = None;
           list_of_lists = None;
           json_value = None;
           iso8601_timestamp = None;
           integer = None;
           httpdate_timestamp = None;
           float_ = None;
           empty_struct = None;
           double = None;
           boolean_ = None;
           blob = None;
         }
          : Types.kitchen_sink)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_kitchen_sink Types.equal_kitchen_sink)
        "expected output" expected result
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let parses_list_of_map_shapes () =
  Eio.Switch.run ~name:"parses_list_of_map_shapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:(Some "{\"ListOfMapsOfStrings\":[{\"size\":\"large\"},{\"color\":\"red\"}]}")
    ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response =
    KitchenSinkOperation.request ctx
      {
        unix_timestamp = None;
        timestamp = None;
        struct_with_json_name = None;
        string_ = None;
        simple_struct = None;
        recursive_struct = None;
        recursive_map = None;
        recursive_list = None;
        map_of_structs = None;
        map_of_strings = None;
        map_of_maps = None;
        map_of_lists_of_strings = None;
        long = None;
        list_of_structs = None;
        list_of_strings = None;
        list_of_maps_of_strings = None;
        list_of_lists = None;
        json_value = None;
        iso8601_timestamp = None;
        integer = None;
        httpdate_timestamp = None;
        float_ = None;
        empty_struct = None;
        double = None;
        boolean_ = None;
        blob = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           unix_timestamp = None;
           timestamp = None;
           struct_with_json_name = None;
           string_ = None;
           simple_struct = None;
           recursive_struct = None;
           recursive_map = None;
           recursive_list = None;
           map_of_structs = None;
           map_of_strings = None;
           map_of_maps = None;
           map_of_lists_of_strings = None;
           long = None;
           list_of_structs = None;
           list_of_strings = None;
           list_of_maps_of_strings = Some [ [ ("size", "large") ]; [ ("color", "red") ] ];
           list_of_lists = None;
           json_value = None;
           iso8601_timestamp = None;
           integer = None;
           httpdate_timestamp = None;
           float_ = None;
           empty_struct = None;
           double = None;
           boolean_ = None;
           blob = None;
         }
          : Types.kitchen_sink)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_kitchen_sink Types.equal_kitchen_sink)
        "expected output" expected result
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let parses_list_of_list_shapes () =
  Eio.Switch.run ~name:"parses_list_of_list_shapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:(Some "{\"ListOfLists\":[[\"abc\",\"mno\",\"xyz\"],[\"hjk\",\"qrs\",\"tuv\"]]}")
    ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response =
    KitchenSinkOperation.request ctx
      {
        unix_timestamp = None;
        timestamp = None;
        struct_with_json_name = None;
        string_ = None;
        simple_struct = None;
        recursive_struct = None;
        recursive_map = None;
        recursive_list = None;
        map_of_structs = None;
        map_of_strings = None;
        map_of_maps = None;
        map_of_lists_of_strings = None;
        long = None;
        list_of_structs = None;
        list_of_strings = None;
        list_of_maps_of_strings = None;
        list_of_lists = None;
        json_value = None;
        iso8601_timestamp = None;
        integer = None;
        httpdate_timestamp = None;
        float_ = None;
        empty_struct = None;
        double = None;
        boolean_ = None;
        blob = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           unix_timestamp = None;
           timestamp = None;
           struct_with_json_name = None;
           string_ = None;
           simple_struct = None;
           recursive_struct = None;
           recursive_map = None;
           recursive_list = None;
           map_of_structs = None;
           map_of_strings = None;
           map_of_maps = None;
           map_of_lists_of_strings = None;
           long = None;
           list_of_structs = None;
           list_of_strings = None;
           list_of_maps_of_strings = None;
           list_of_lists = Some [ [ "abc"; "mno"; "xyz" ]; [ "hjk"; "qrs"; "tuv" ] ];
           json_value = None;
           iso8601_timestamp = None;
           integer = None;
           httpdate_timestamp = None;
           float_ = None;
           empty_struct = None;
           double = None;
           boolean_ = None;
           blob = None;
         }
          : Types.kitchen_sink)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_kitchen_sink Types.equal_kitchen_sink)
        "expected output" expected result
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let parses_list_of_structure_shapes () =
  Eio.Switch.run ~name:"parses_list_of_structure_shapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:(Some "{\"ListOfStructs\":[{\"Value\":\"value-1\"},{\"Value\":\"value-2\"}]}")
    ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response =
    KitchenSinkOperation.request ctx
      {
        unix_timestamp = None;
        timestamp = None;
        struct_with_json_name = None;
        string_ = None;
        simple_struct = None;
        recursive_struct = None;
        recursive_map = None;
        recursive_list = None;
        map_of_structs = None;
        map_of_strings = None;
        map_of_maps = None;
        map_of_lists_of_strings = None;
        long = None;
        list_of_structs = None;
        list_of_strings = None;
        list_of_maps_of_strings = None;
        list_of_lists = None;
        json_value = None;
        iso8601_timestamp = None;
        integer = None;
        httpdate_timestamp = None;
        float_ = None;
        empty_struct = None;
        double = None;
        boolean_ = None;
        blob = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           unix_timestamp = None;
           timestamp = None;
           struct_with_json_name = None;
           string_ = None;
           simple_struct = None;
           recursive_struct = None;
           recursive_map = None;
           recursive_list = None;
           map_of_structs = None;
           map_of_strings = None;
           map_of_maps = None;
           map_of_lists_of_strings = None;
           long = None;
           list_of_structs = Some [ { value = Some "value-1" }; { value = Some "value-2" } ];
           list_of_strings = None;
           list_of_maps_of_strings = None;
           list_of_lists = None;
           json_value = None;
           iso8601_timestamp = None;
           integer = None;
           httpdate_timestamp = None;
           float_ = None;
           empty_struct = None;
           double = None;
           boolean_ = None;
           blob = None;
         }
          : Types.kitchen_sink)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_kitchen_sink Types.equal_kitchen_sink)
        "expected output" expected result
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let parses_list_of_recursive_structure_shapes () =
  Eio.Switch.run ~name:"parses_list_of_recursive_structure_shapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "{\"RecursiveList\":[{\"RecursiveList\":[{\"RecursiveList\":[{\"String\":\"value\"}]}]}]}")
    ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response =
    KitchenSinkOperation.request ctx
      {
        unix_timestamp = None;
        timestamp = None;
        struct_with_json_name = None;
        string_ = None;
        simple_struct = None;
        recursive_struct = None;
        recursive_map = None;
        recursive_list = None;
        map_of_structs = None;
        map_of_strings = None;
        map_of_maps = None;
        map_of_lists_of_strings = None;
        long = None;
        list_of_structs = None;
        list_of_strings = None;
        list_of_maps_of_strings = None;
        list_of_lists = None;
        json_value = None;
        iso8601_timestamp = None;
        integer = None;
        httpdate_timestamp = None;
        float_ = None;
        empty_struct = None;
        double = None;
        boolean_ = None;
        blob = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           unix_timestamp = None;
           timestamp = None;
           struct_with_json_name = None;
           string_ = None;
           simple_struct = None;
           recursive_struct = None;
           recursive_map = None;
           recursive_list =
             Some
               [
                 {
                   unix_timestamp = None;
                   timestamp = None;
                   struct_with_json_name = None;
                   string_ = None;
                   simple_struct = None;
                   recursive_struct = None;
                   recursive_map = None;
                   recursive_list =
                     Some
                       [
                         {
                           unix_timestamp = None;
                           timestamp = None;
                           struct_with_json_name = None;
                           string_ = None;
                           simple_struct = None;
                           recursive_struct = None;
                           recursive_map = None;
                           recursive_list =
                             Some
                               [
                                 {
                                   unix_timestamp = None;
                                   timestamp = None;
                                   struct_with_json_name = None;
                                   string_ = Some "value";
                                   simple_struct = None;
                                   recursive_struct = None;
                                   recursive_map = None;
                                   recursive_list = None;
                                   map_of_structs = None;
                                   map_of_strings = None;
                                   map_of_maps = None;
                                   map_of_lists_of_strings = None;
                                   long = None;
                                   list_of_structs = None;
                                   list_of_strings = None;
                                   list_of_maps_of_strings = None;
                                   list_of_lists = None;
                                   json_value = None;
                                   iso8601_timestamp = None;
                                   integer = None;
                                   httpdate_timestamp = None;
                                   float_ = None;
                                   empty_struct = None;
                                   double = None;
                                   boolean_ = None;
                                   blob = None;
                                 };
                               ];
                           map_of_structs = None;
                           map_of_strings = None;
                           map_of_maps = None;
                           map_of_lists_of_strings = None;
                           long = None;
                           list_of_structs = None;
                           list_of_strings = None;
                           list_of_maps_of_strings = None;
                           list_of_lists = None;
                           json_value = None;
                           iso8601_timestamp = None;
                           integer = None;
                           httpdate_timestamp = None;
                           float_ = None;
                           empty_struct = None;
                           double = None;
                           boolean_ = None;
                           blob = None;
                         };
                       ];
                   map_of_structs = None;
                   map_of_strings = None;
                   map_of_maps = None;
                   map_of_lists_of_strings = None;
                   long = None;
                   list_of_structs = None;
                   list_of_strings = None;
                   list_of_maps_of_strings = None;
                   list_of_lists = None;
                   json_value = None;
                   iso8601_timestamp = None;
                   integer = None;
                   httpdate_timestamp = None;
                   float_ = None;
                   empty_struct = None;
                   double = None;
                   boolean_ = None;
                   blob = None;
                 };
               ];
           map_of_structs = None;
           map_of_strings = None;
           map_of_maps = None;
           map_of_lists_of_strings = None;
           long = None;
           list_of_structs = None;
           list_of_strings = None;
           list_of_maps_of_strings = None;
           list_of_lists = None;
           json_value = None;
           iso8601_timestamp = None;
           integer = None;
           httpdate_timestamp = None;
           float_ = None;
           empty_struct = None;
           double = None;
           boolean_ = None;
           blob = None;
         }
          : Types.kitchen_sink)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_kitchen_sink Types.equal_kitchen_sink)
        "expected output" expected result
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let parses_map_shapes () =
  Eio.Switch.run ~name:"parses_map_shapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "{\"MapOfStrings\":{\"size\":\"large\",\"color\":\"red\"}}")
    ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response =
    KitchenSinkOperation.request ctx
      {
        unix_timestamp = None;
        timestamp = None;
        struct_with_json_name = None;
        string_ = None;
        simple_struct = None;
        recursive_struct = None;
        recursive_map = None;
        recursive_list = None;
        map_of_structs = None;
        map_of_strings = None;
        map_of_maps = None;
        map_of_lists_of_strings = None;
        long = None;
        list_of_structs = None;
        list_of_strings = None;
        list_of_maps_of_strings = None;
        list_of_lists = None;
        json_value = None;
        iso8601_timestamp = None;
        integer = None;
        httpdate_timestamp = None;
        float_ = None;
        empty_struct = None;
        double = None;
        boolean_ = None;
        blob = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           unix_timestamp = None;
           timestamp = None;
           struct_with_json_name = None;
           string_ = None;
           simple_struct = None;
           recursive_struct = None;
           recursive_map = None;
           recursive_list = None;
           map_of_structs = None;
           map_of_strings = Some [ ("size", "large"); ("color", "red") ];
           map_of_maps = None;
           map_of_lists_of_strings = None;
           long = None;
           list_of_structs = None;
           list_of_strings = None;
           list_of_maps_of_strings = None;
           list_of_lists = None;
           json_value = None;
           iso8601_timestamp = None;
           integer = None;
           httpdate_timestamp = None;
           float_ = None;
           empty_struct = None;
           double = None;
           boolean_ = None;
           blob = None;
         }
          : Types.kitchen_sink)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_kitchen_sink Types.equal_kitchen_sink)
        "expected output" expected result
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let parses_map_of_list_shapes () =
  Eio.Switch.run ~name:"parses_map_of_list_shapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "{\"MapOfListsOfStrings\":{\"sizes\":[\"large\",\"small\"],\"colors\":[\"red\",\"green\"]}}")
    ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response =
    KitchenSinkOperation.request ctx
      {
        unix_timestamp = None;
        timestamp = None;
        struct_with_json_name = None;
        string_ = None;
        simple_struct = None;
        recursive_struct = None;
        recursive_map = None;
        recursive_list = None;
        map_of_structs = None;
        map_of_strings = None;
        map_of_maps = None;
        map_of_lists_of_strings = None;
        long = None;
        list_of_structs = None;
        list_of_strings = None;
        list_of_maps_of_strings = None;
        list_of_lists = None;
        json_value = None;
        iso8601_timestamp = None;
        integer = None;
        httpdate_timestamp = None;
        float_ = None;
        empty_struct = None;
        double = None;
        boolean_ = None;
        blob = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           unix_timestamp = None;
           timestamp = None;
           struct_with_json_name = None;
           string_ = None;
           simple_struct = None;
           recursive_struct = None;
           recursive_map = None;
           recursive_list = None;
           map_of_structs = None;
           map_of_strings = None;
           map_of_maps = None;
           map_of_lists_of_strings =
             Some [ ("sizes", [ "large"; "small" ]); ("colors", [ "red"; "green" ]) ];
           long = None;
           list_of_structs = None;
           list_of_strings = None;
           list_of_maps_of_strings = None;
           list_of_lists = None;
           json_value = None;
           iso8601_timestamp = None;
           integer = None;
           httpdate_timestamp = None;
           float_ = None;
           empty_struct = None;
           double = None;
           boolean_ = None;
           blob = None;
         }
          : Types.kitchen_sink)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_kitchen_sink Types.equal_kitchen_sink)
        "expected output" expected result
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let parses_map_of_map_shapes () =
  Eio.Switch.run ~name:"parses_map_of_map_shapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "{\"MapOfMaps\":{\"sizes\":{\"large\":\"L\",\"medium\":\"M\"},\"colors\":{\"red\":\"R\",\"blue\":\"B\"}}}")
    ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response =
    KitchenSinkOperation.request ctx
      {
        unix_timestamp = None;
        timestamp = None;
        struct_with_json_name = None;
        string_ = None;
        simple_struct = None;
        recursive_struct = None;
        recursive_map = None;
        recursive_list = None;
        map_of_structs = None;
        map_of_strings = None;
        map_of_maps = None;
        map_of_lists_of_strings = None;
        long = None;
        list_of_structs = None;
        list_of_strings = None;
        list_of_maps_of_strings = None;
        list_of_lists = None;
        json_value = None;
        iso8601_timestamp = None;
        integer = None;
        httpdate_timestamp = None;
        float_ = None;
        empty_struct = None;
        double = None;
        boolean_ = None;
        blob = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           unix_timestamp = None;
           timestamp = None;
           struct_with_json_name = None;
           string_ = None;
           simple_struct = None;
           recursive_struct = None;
           recursive_map = None;
           recursive_list = None;
           map_of_structs = None;
           map_of_strings = None;
           map_of_maps =
             Some
               [
                 ("sizes", [ ("large", "L"); ("medium", "M") ]);
                 ("colors", [ ("red", "R"); ("blue", "B") ]);
               ];
           map_of_lists_of_strings = None;
           long = None;
           list_of_structs = None;
           list_of_strings = None;
           list_of_maps_of_strings = None;
           list_of_lists = None;
           json_value = None;
           iso8601_timestamp = None;
           integer = None;
           httpdate_timestamp = None;
           float_ = None;
           empty_struct = None;
           double = None;
           boolean_ = None;
           blob = None;
         }
          : Types.kitchen_sink)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_kitchen_sink Types.equal_kitchen_sink)
        "expected output" expected result
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let parses_map_of_structure_shapes () =
  Eio.Switch.run ~name:"parses_map_of_structure_shapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:(Some "{\"MapOfStructs\":{\"size\":{\"Value\":\"small\"},\"color\":{\"Value\":\"red\"}}}")
    ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response =
    KitchenSinkOperation.request ctx
      {
        unix_timestamp = None;
        timestamp = None;
        struct_with_json_name = None;
        string_ = None;
        simple_struct = None;
        recursive_struct = None;
        recursive_map = None;
        recursive_list = None;
        map_of_structs = None;
        map_of_strings = None;
        map_of_maps = None;
        map_of_lists_of_strings = None;
        long = None;
        list_of_structs = None;
        list_of_strings = None;
        list_of_maps_of_strings = None;
        list_of_lists = None;
        json_value = None;
        iso8601_timestamp = None;
        integer = None;
        httpdate_timestamp = None;
        float_ = None;
        empty_struct = None;
        double = None;
        boolean_ = None;
        blob = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           unix_timestamp = None;
           timestamp = None;
           struct_with_json_name = None;
           string_ = None;
           simple_struct = None;
           recursive_struct = None;
           recursive_map = None;
           recursive_list = None;
           map_of_structs =
             Some [ ("size", { value = Some "small" }); ("color", { value = Some "red" }) ];
           map_of_strings = None;
           map_of_maps = None;
           map_of_lists_of_strings = None;
           long = None;
           list_of_structs = None;
           list_of_strings = None;
           list_of_maps_of_strings = None;
           list_of_lists = None;
           json_value = None;
           iso8601_timestamp = None;
           integer = None;
           httpdate_timestamp = None;
           float_ = None;
           empty_struct = None;
           double = None;
           boolean_ = None;
           blob = None;
         }
          : Types.kitchen_sink)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_kitchen_sink Types.equal_kitchen_sink)
        "expected output" expected result
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let parses_map_of_recursive_structure_shapes () =
  Eio.Switch.run ~name:"parses_map_of_recursive_structure_shapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "{\"RecursiveMap\":{\"key-1\":{\"RecursiveMap\":{\"key-2\":{\"RecursiveMap\":{\"key-3\":{\"String\":\"value\"}}}}}}}")
    ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response =
    KitchenSinkOperation.request ctx
      {
        unix_timestamp = None;
        timestamp = None;
        struct_with_json_name = None;
        string_ = None;
        simple_struct = None;
        recursive_struct = None;
        recursive_map = None;
        recursive_list = None;
        map_of_structs = None;
        map_of_strings = None;
        map_of_maps = None;
        map_of_lists_of_strings = None;
        long = None;
        list_of_structs = None;
        list_of_strings = None;
        list_of_maps_of_strings = None;
        list_of_lists = None;
        json_value = None;
        iso8601_timestamp = None;
        integer = None;
        httpdate_timestamp = None;
        float_ = None;
        empty_struct = None;
        double = None;
        boolean_ = None;
        blob = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           unix_timestamp = None;
           timestamp = None;
           struct_with_json_name = None;
           string_ = None;
           simple_struct = None;
           recursive_struct = None;
           recursive_map =
             Some
               [
                 ( "key-1",
                   {
                     unix_timestamp = None;
                     timestamp = None;
                     struct_with_json_name = None;
                     string_ = None;
                     simple_struct = None;
                     recursive_struct = None;
                     recursive_map =
                       Some
                         [
                           ( "key-2",
                             {
                               unix_timestamp = None;
                               timestamp = None;
                               struct_with_json_name = None;
                               string_ = None;
                               simple_struct = None;
                               recursive_struct = None;
                               recursive_map =
                                 Some
                                   [
                                     ( "key-3",
                                       {
                                         unix_timestamp = None;
                                         timestamp = None;
                                         struct_with_json_name = None;
                                         string_ = Some "value";
                                         simple_struct = None;
                                         recursive_struct = None;
                                         recursive_map = None;
                                         recursive_list = None;
                                         map_of_structs = None;
                                         map_of_strings = None;
                                         map_of_maps = None;
                                         map_of_lists_of_strings = None;
                                         long = None;
                                         list_of_structs = None;
                                         list_of_strings = None;
                                         list_of_maps_of_strings = None;
                                         list_of_lists = None;
                                         json_value = None;
                                         iso8601_timestamp = None;
                                         integer = None;
                                         httpdate_timestamp = None;
                                         float_ = None;
                                         empty_struct = None;
                                         double = None;
                                         boolean_ = None;
                                         blob = None;
                                       } );
                                   ];
                               recursive_list = None;
                               map_of_structs = None;
                               map_of_strings = None;
                               map_of_maps = None;
                               map_of_lists_of_strings = None;
                               long = None;
                               list_of_structs = None;
                               list_of_strings = None;
                               list_of_maps_of_strings = None;
                               list_of_lists = None;
                               json_value = None;
                               iso8601_timestamp = None;
                               integer = None;
                               httpdate_timestamp = None;
                               float_ = None;
                               empty_struct = None;
                               double = None;
                               boolean_ = None;
                               blob = None;
                             } );
                         ];
                     recursive_list = None;
                     map_of_structs = None;
                     map_of_strings = None;
                     map_of_maps = None;
                     map_of_lists_of_strings = None;
                     long = None;
                     list_of_structs = None;
                     list_of_strings = None;
                     list_of_maps_of_strings = None;
                     list_of_lists = None;
                     json_value = None;
                     iso8601_timestamp = None;
                     integer = None;
                     httpdate_timestamp = None;
                     float_ = None;
                     empty_struct = None;
                     double = None;
                     boolean_ = None;
                     blob = None;
                   } );
               ];
           recursive_list = None;
           map_of_structs = None;
           map_of_strings = None;
           map_of_maps = None;
           map_of_lists_of_strings = None;
           long = None;
           list_of_structs = None;
           list_of_strings = None;
           list_of_maps_of_strings = None;
           list_of_lists = None;
           json_value = None;
           iso8601_timestamp = None;
           integer = None;
           httpdate_timestamp = None;
           float_ = None;
           empty_struct = None;
           double = None;
           boolean_ = None;
           blob = None;
         }
          : Types.kitchen_sink)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_kitchen_sink Types.equal_kitchen_sink)
        "expected output" expected result
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let parses_the_request_id_from_the_response () =
  Eio.Switch.run ~name:"parses_the_request_id_from_the_response" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "{}") ~status:200
    ~headers:
      [
        ("Content-Type", "application/x-amz-json-1.1");
        ("X-Amzn-Requestid", "amazon-uniq-request-id");
      ]
    ();
  let response =
    KitchenSinkOperation.request ctx
      {
        unix_timestamp = None;
        timestamp = None;
        struct_with_json_name = None;
        string_ = None;
        simple_struct = None;
        recursive_struct = None;
        recursive_map = None;
        recursive_list = None;
        map_of_structs = None;
        map_of_strings = None;
        map_of_maps = None;
        map_of_lists_of_strings = None;
        long = None;
        list_of_structs = None;
        list_of_strings = None;
        list_of_maps_of_strings = None;
        list_of_lists = None;
        json_value = None;
        iso8601_timestamp = None;
        integer = None;
        httpdate_timestamp = None;
        float_ = None;
        empty_struct = None;
        double = None;
        boolean_ = None;
        blob = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           unix_timestamp = None;
           timestamp = None;
           struct_with_json_name = None;
           string_ = None;
           simple_struct = None;
           recursive_struct = None;
           recursive_map = None;
           recursive_list = None;
           map_of_structs = None;
           map_of_strings = None;
           map_of_maps = None;
           map_of_lists_of_strings = None;
           long = None;
           list_of_structs = None;
           list_of_strings = None;
           list_of_maps_of_strings = None;
           list_of_lists = None;
           json_value = None;
           iso8601_timestamp = None;
           integer = None;
           httpdate_timestamp = None;
           float_ = None;
           empty_struct = None;
           double = None;
           boolean_ = None;
           blob = None;
         }
          : Types.kitchen_sink)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_kitchen_sink Types.equal_kitchen_sink)
        "expected output" expected result
  | Error error -> failwith (KitchenSinkOperation.error_to_string error)

let kitchen_sink_operation_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.json#KitchenSinkOperation",
    [
      ("serializes_string_shapes", `Quick, serializes_string_shapes);
      ( "serializes_string_shapes_with_jsonvalue_trait",
        `Quick,
        serializes_string_shapes_with_jsonvalue_trait );
      ("serializes_integer_shapes", `Quick, serializes_integer_shapes);
      ("serializes_long_shapes", `Quick, serializes_long_shapes);
      ("serializes_float_shapes", `Quick, serializes_float_shapes);
      ("serializes_double_shapes", `Quick, serializes_double_shapes);
      ("serializes_blob_shapes", `Quick, serializes_blob_shapes);
      ("serializes_boolean_shapes_true", `Quick, serializes_boolean_shapes_true);
      ("serializes_boolean_shapes_false", `Quick, serializes_boolean_shapes_false);
      ("serializes_timestamp_shapes", `Quick, serializes_timestamp_shapes);
      ( "serializes_timestamp_shapes_with_iso8601_timestampformat",
        `Quick,
        serializes_timestamp_shapes_with_iso8601_timestampformat );
      ( "serializes_timestamp_shapes_with_httpdate_timestampformat",
        `Quick,
        serializes_timestamp_shapes_with_httpdate_timestampformat );
      ( "serializes_timestamp_shapes_with_unixtimestamp_timestampformat",
        `Quick,
        serializes_timestamp_shapes_with_unixtimestamp_timestampformat );
      ("serializes_list_shapes", `Quick, serializes_list_shapes);
      ("serializes_empty_list_shapes", `Quick, serializes_empty_list_shapes);
      ("serializes_list_of_map_shapes", `Quick, serializes_list_of_map_shapes);
      ("serializes_list_of_structure_shapes", `Quick, serializes_list_of_structure_shapes);
      ( "serializes_list_of_recursive_structure_shapes",
        `Quick,
        serializes_list_of_recursive_structure_shapes );
      ("serializes_map_shapes", `Quick, serializes_map_shapes);
      ("serializes_empty_map_shapes", `Quick, serializes_empty_map_shapes);
      ("serializes_map_of_list_shapes", `Quick, serializes_map_of_list_shapes);
      ("serializes_map_of_structure_shapes", `Quick, serializes_map_of_structure_shapes);
      ( "serializes_map_of_recursive_structure_shapes",
        `Quick,
        serializes_map_of_recursive_structure_shapes );
      ("serializes_structure_shapes", `Quick, serializes_structure_shapes);
      ( "serializes_structure_members_with_locationname_traits",
        `Quick,
        serializes_structure_members_with_locationname_traits );
      ("serializes_empty_structure_shapes", `Quick, serializes_empty_structure_shapes);
      ( "serializes_structure_which_have_no_members",
        `Quick,
        serializes_structure_which_have_no_members );
      ("serializes_recursive_structure_shapes", `Quick, serializes_recursive_structure_shapes);
      ("parses_operations_with_empty_json_bodies", `Quick, parses_operations_with_empty_json_bodies);
      ("parses_string_shapes", `Quick, parses_string_shapes);
      ("parses_integer_shapes", `Quick, parses_integer_shapes);
      ("parses_long_shapes", `Quick, parses_long_shapes);
      ("parses_float_shapes", `Quick, parses_float_shapes);
      ("parses_double_shapes", `Quick, parses_double_shapes);
      ("parses_boolean_shapes_true", `Quick, parses_boolean_shapes_true);
      ("parses_boolean_false", `Quick, parses_boolean_false);
      ("parses_blob_shapes", `Quick, parses_blob_shapes);
      ("parses_timestamp_shapes", `Quick, parses_timestamp_shapes);
      ("parses_iso8601_timestamps", `Quick, parses_iso8601_timestamps);
      ("parses_httpdate_timestamps", `Quick, parses_httpdate_timestamps);
      ("parses_list_shapes", `Quick, parses_list_shapes);
      ("parses_list_of_map_shapes", `Quick, parses_list_of_map_shapes);
      ("parses_list_of_list_shapes", `Quick, parses_list_of_list_shapes);
      ("parses_list_of_structure_shapes", `Quick, parses_list_of_structure_shapes);
      ( "parses_list_of_recursive_structure_shapes",
        `Quick,
        parses_list_of_recursive_structure_shapes );
      ("parses_map_shapes", `Quick, parses_map_shapes);
      ("parses_map_of_list_shapes", `Quick, parses_map_of_list_shapes);
      ("parses_map_of_map_shapes", `Quick, parses_map_of_map_shapes);
      ("parses_map_of_structure_shapes", `Quick, parses_map_of_structure_shapes);
      ("parses_map_of_recursive_structure_shapes", `Quick, parses_map_of_recursive_structure_shapes);
      ("parses_the_request_id_from_the_response", `Quick, parses_the_request_id_from_the_response);
    ] )

let aws_json11_structures_dont_serialize_null_values () =
  Eio.Switch.run ~name:"AwsJson11StructuresDontSerializeNullValues" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.null_operation_input_output = { string_ = None } in
  Mock.mock_response ?body:(Some "{}") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = NullOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string "{}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.NullOperation");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (NullOperation.error_to_string error)

let aws_json11_servers_dont_serialize_null_structure_values () =
  Eio.Switch.run ~name:"AwsJson11ServersDontSerializeNullStructureValues" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "{}") ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response = NullOperation.request ctx { string_ = None } in
  match response with
  | Ok result ->
      let expected = ({ string_ = None } : Types.null_operation_input_output) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_null_operation_input_output
           Types.equal_null_operation_input_output)
        "expected output" expected result
  | Error error -> failwith (NullOperation.error_to_string error)

let null_operation_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.json#NullOperation",
    [
      ( "AwsJson11StructuresDontSerializeNullValues",
        `Quick,
        aws_json11_structures_dont_serialize_null_values );
      ( "AwsJson11ServersDontSerializeNullStructureValues",
        `Quick,
        aws_json11_servers_dont_serialize_null_structure_values );
    ] )

let can_call_operation_with_no_input_or_output () =
  Eio.Switch.run ~name:"can_call_operation_with_no_input_or_output" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.operation_with_optional_input_output_input = { value = None } in
  Mock.mock_response ?body:(Some "{}") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = OperationWithOptionalInputOutput.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string "{}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.OperationWithOptionalInputOutput");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (OperationWithOptionalInputOutput.error_to_string error)

let can_call_operation_with_optional_input () =
  Eio.Switch.run ~name:"can_call_operation_with_optional_input" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.operation_with_optional_input_output_input = { value = Some "Hi" } in
  Mock.mock_response ?body:(Some "{\"Value\":\"Hi\"}") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = OperationWithOptionalInputOutput.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string "{\"Value\":\"Hi\"}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.OperationWithOptionalInputOutput");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (OperationWithOptionalInputOutput.error_to_string error)

let operation_with_optional_input_output_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.json#OperationWithOptionalInputOutput",
    [
      ( "can_call_operation_with_no_input_or_output",
        `Quick,
        can_call_operation_with_no_input_or_output );
      ("can_call_operation_with_optional_input", `Quick, can_call_operation_with_optional_input);
    ] )

let put_and_get_inline_documents_input () =
  Eio.Switch.run ~name:"PutAndGetInlineDocumentsInput" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.put_and_get_inline_documents_input_output =
    { inline_document = Some (Smaws_Lib.CoreTypes.Document.from_string "{ \"foo\": \"bar\" }") }
  in
  Mock.mock_response ?body:(Some "{\n    \"inlineDocument\": {\"foo\": \"bar\"}\n}") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = PutAndGetInlineDocuments.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string "{\n    \"inlineDocument\": {\"foo\": \"bar\"}\n}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.PutAndGetInlineDocuments");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (PutAndGetInlineDocuments.error_to_string error)

let put_and_get_inline_documents_input () =
  Eio.Switch.run ~name:"PutAndGetInlineDocumentsInput" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "{\n    \"inlineDocument\": {\"foo\": \"bar\"}\n}") ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response = PutAndGetInlineDocuments.request ctx { inline_document = None } in
  match response with
  | Ok result ->
      let expected =
        ({
           inline_document = Some (Smaws_Lib.CoreTypes.Document.from_string "{ \"foo\": \"bar\" }");
         }
          : Types.put_and_get_inline_documents_input_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_put_and_get_inline_documents_input_output
           Types.equal_put_and_get_inline_documents_input_output)
        "expected output" expected result
  | Error error -> failwith (PutAndGetInlineDocuments.error_to_string error)

let put_and_get_inline_documents_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.json#PutAndGetInlineDocuments",
    [
      ("PutAndGetInlineDocumentsInput", `Quick, put_and_get_inline_documents_input);
      ("PutAndGetInlineDocumentsInput", `Quick, put_and_get_inline_documents_input);
    ] )

let put_with_content_encoding_test_suite : unit Alcotest.test =
  ("aws.protocoltests.json#PutWithContentEncoding", [])

let aws_json11_supports_na_n_float_inputs () =
  Eio.Switch.run ~name:"AwsJson11SupportsNaNFloatInputs" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.simple_scalar_properties_input_output =
    { double_value = Some Float.nan; float_value = Some Float.nan }
  in
  Mock.mock_response ?body:(Some "{\n    \"floatValue\": \"NaN\",\n    \"doubleValue\": \"NaN\"\n}")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = SimpleScalarProperties.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "{\n    \"floatValue\": \"NaN\",\n    \"doubleValue\": \"NaN\"\n}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.SimpleScalarProperties");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (SimpleScalarProperties.error_to_string error)

let aws_json11_supports_infinity_float_inputs () =
  Eio.Switch.run ~name:"AwsJson11SupportsInfinityFloatInputs" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.simple_scalar_properties_input_output =
    { double_value = Some Float.infinity; float_value = Some Float.infinity }
  in
  Mock.mock_response
    ?body:(Some "{\n    \"floatValue\": \"Infinity\",\n    \"doubleValue\": \"Infinity\"\n}")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = SimpleScalarProperties.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "{\n    \"floatValue\": \"Infinity\",\n    \"doubleValue\": \"Infinity\"\n}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.SimpleScalarProperties");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (SimpleScalarProperties.error_to_string error)

let aws_json11_supports_negative_infinity_float_inputs () =
  Eio.Switch.run ~name:"AwsJson11SupportsNegativeInfinityFloatInputs" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.simple_scalar_properties_input_output =
    { double_value = Some Float.neg_infinity; float_value = Some Float.neg_infinity }
  in
  Mock.mock_response
    ?body:(Some "{\n    \"floatValue\": \"-Infinity\",\n    \"doubleValue\": \"-Infinity\"\n}")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = SimpleScalarProperties.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "{\n    \"floatValue\": \"-Infinity\",\n    \"doubleValue\": \"-Infinity\"\n}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.SimpleScalarProperties");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (SimpleScalarProperties.error_to_string error)

let aws_json11_supports_na_n_float_inputs () =
  Eio.Switch.run ~name:"AwsJson11SupportsNaNFloatInputs" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "{\n    \"floatValue\": \"NaN\",\n    \"doubleValue\": \"NaN\"\n}")
    ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response = SimpleScalarProperties.request ctx { double_value = None; float_value = None } in
  match response with
  | Ok result ->
      let expected =
        ({ double_value = Some Float.nan; float_value = Some Float.nan }
          : Types.simple_scalar_properties_input_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_simple_scalar_properties_input_output
           Types.equal_simple_scalar_properties_input_output)
        "expected output" expected result
  | Error error -> failwith (SimpleScalarProperties.error_to_string error)

let aws_json11_supports_infinity_float_inputs () =
  Eio.Switch.run ~name:"AwsJson11SupportsInfinityFloatInputs" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:(Some "{\n    \"floatValue\": \"Infinity\",\n    \"doubleValue\": \"Infinity\"\n}")
    ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response = SimpleScalarProperties.request ctx { double_value = None; float_value = None } in
  match response with
  | Ok result ->
      let expected =
        ({ double_value = Some Float.infinity; float_value = Some Float.infinity }
          : Types.simple_scalar_properties_input_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_simple_scalar_properties_input_output
           Types.equal_simple_scalar_properties_input_output)
        "expected output" expected result
  | Error error -> failwith (SimpleScalarProperties.error_to_string error)

let aws_json11_supports_negative_infinity_float_inputs () =
  Eio.Switch.run ~name:"AwsJson11SupportsNegativeInfinityFloatInputs" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:(Some "{\n    \"floatValue\": \"-Infinity\",\n    \"doubleValue\": \"-Infinity\"\n}")
    ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response = SimpleScalarProperties.request ctx { double_value = None; float_value = None } in
  match response with
  | Ok result ->
      let expected =
        ({ double_value = Some Float.neg_infinity; float_value = Some Float.neg_infinity }
          : Types.simple_scalar_properties_input_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_simple_scalar_properties_input_output
           Types.equal_simple_scalar_properties_input_output)
        "expected output" expected result
  | Error error -> failwith (SimpleScalarProperties.error_to_string error)

let simple_scalar_properties_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.json#SimpleScalarProperties",
    [
      ("AwsJson11SupportsNaNFloatInputs", `Quick, aws_json11_supports_na_n_float_inputs);
      ("AwsJson11SupportsInfinityFloatInputs", `Quick, aws_json11_supports_infinity_float_inputs);
      ( "AwsJson11SupportsNegativeInfinityFloatInputs",
        `Quick,
        aws_json11_supports_negative_infinity_float_inputs );
      ("AwsJson11SupportsNaNFloatInputs", `Quick, aws_json11_supports_na_n_float_inputs);
      ("AwsJson11SupportsInfinityFloatInputs", `Quick, aws_json11_supports_infinity_float_inputs);
      ( "AwsJson11SupportsNegativeInfinityFloatInputs",
        `Quick,
        aws_json11_supports_negative_infinity_float_inputs );
    ] )

let aws_json11_sparse_maps_serialize_null_values () =
  Eio.Switch.run ~name:"AwsJson11SparseMapsSerializeNullValues" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.sparse_nulls_operation_input_output =
    {
      sparse_string_map = Some [ ("foo", Smaws_Lib.CoreTypes.Nullable.Null) ];
      sparse_string_list = None;
    }
  in
  Mock.mock_response ?body:(Some "{\n    \"sparseStringMap\": {\n        \"foo\": null\n    }\n}")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = SparseNullsOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "{\n    \"sparseStringMap\": {\n        \"foo\": null\n    }\n}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.SparseNullsOperation");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (SparseNullsOperation.error_to_string error)

let aws_json11_sparse_lists_serialize_null () =
  Eio.Switch.run ~name:"AwsJson11SparseListsSerializeNull" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.sparse_nulls_operation_input_output =
    { sparse_string_map = None; sparse_string_list = Some [ Smaws_Lib.CoreTypes.Nullable.Null ] }
  in
  Mock.mock_response ?body:(Some "{\n    \"sparseStringList\": [\n        null\n    ]\n}")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = SparseNullsOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string "{\n    \"sparseStringList\": [\n        null\n    ]\n}"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-Amz-Target", "JsonProtocol.SparseNullsOperation");
            ("Content-Type", "application/x-amz-json-1.1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (SparseNullsOperation.error_to_string error)

let aws_json11_sparse_maps_deserialize_null_values () =
  Eio.Switch.run ~name:"AwsJson11SparseMapsDeserializeNullValues" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "{\n    \"sparseStringMap\": {\n        \"foo\": null\n    }\n}")
    ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response =
    SparseNullsOperation.request ctx { sparse_string_map = None; sparse_string_list = None }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           sparse_string_map = Some [ ("foo", Smaws_Lib.CoreTypes.Nullable.Null) ];
           sparse_string_list = None;
         }
          : Types.sparse_nulls_operation_input_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_sparse_nulls_operation_input_output
           Types.equal_sparse_nulls_operation_input_output)
        "expected output" expected result
  | Error error -> failwith (SparseNullsOperation.error_to_string error)

let aws_json11_sparse_lists_deserialize_null () =
  Eio.Switch.run ~name:"AwsJson11SparseListsDeserializeNull" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "{\n    \"sparseStringList\": [\n        null\n    ]\n}")
    ~status:200
    ~headers:[ ("Content-Type", "application/x-amz-json-1.1") ]
    ();
  let response =
    SparseNullsOperation.request ctx { sparse_string_map = None; sparse_string_list = None }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           sparse_string_map = None;
           sparse_string_list = Some [ Smaws_Lib.CoreTypes.Nullable.Null ];
         }
          : Types.sparse_nulls_operation_input_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_sparse_nulls_operation_input_output
           Types.equal_sparse_nulls_operation_input_output)
        "expected output" expected result
  | Error error -> failwith (SparseNullsOperation.error_to_string error)

let sparse_nulls_operation_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.json#SparseNullsOperation",
    [
      ( "AwsJson11SparseMapsSerializeNullValues",
        `Quick,
        aws_json11_sparse_maps_serialize_null_values );
      ("AwsJson11SparseListsSerializeNull", `Quick, aws_json11_sparse_lists_serialize_null);
      ( "AwsJson11SparseMapsDeserializeNullValues",
        `Quick,
        aws_json11_sparse_maps_deserialize_null_values );
      ("AwsJson11SparseListsDeserializeNull", `Quick, aws_json11_sparse_lists_deserialize_null);
    ] )

let () =
  Eio_main.run @@ fun env ->
  Alcotest.run "aws.protocoltests.json"
    [
      content_type_parameters_test_suite;
      datetime_offsets_test_suite;
      empty_operation_test_suite;
      endpoint_operation_test_suite;
      endpoint_with_host_label_operation_test_suite;
      fractional_seconds_test_suite;
      greeting_with_errors_test_suite;
      host_with_path_operation_test_suite;
      json_enums_test_suite;
      json_int_enums_test_suite;
      json_unions_test_suite;
      kitchen_sink_operation_test_suite;
      null_operation_test_suite;
      operation_with_optional_input_output_test_suite;
      put_and_get_inline_documents_test_suite;
      put_with_content_encoding_test_suite;
      simple_scalar_properties_test_suite;
      sparse_nulls_operation_test_suite;
    ]
