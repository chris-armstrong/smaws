open Alcotest
open Smaws_Test_Support_Lib
open Query
let datetime_offsets_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#DatetimeOffsets", [])
let query_empty_input_and_empty_output () =
  (Eio.Switch.run ~name:"QueryEmptyInputAndEmptyOutput") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Types.empty_input_and_empty_output_input = () in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = EmptyInputAndEmptyOutput.request ctx input in
          let request = Mock.last_request () in
          let () =
            check Alcotest_http.input_body_form_testable
              "expected request body value"
              (Some "Action=EmptyInputAndEmptyOutput&Version=2020-01-08")
              (request.body |>
                 (Option.map
                    (function
                     | `Form x -> Uri.encoded_of_query x
                     | `String x -> x
                     | `Compressed (x, _) -> x
                     | `None -> ""))) in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [("Content-Type", "application/x-www-form-urlencoded")]
              request.headers in
          ()))
let empty_input_and_empty_output_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#EmptyInputAndEmptyOutput",
    [("QueryEmptyInputAndEmptyOutput", `Quick,
       query_empty_input_and_empty_output)])
let aws_query_endpoint_trait () =
  (Eio.Switch.run ~name:"AwsQueryEndpointTrait") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config =
           {
             Config.dummy with
             endpoint =
               (Some
                  {
                    uri = (Some ("//example.com" |> Uri.of_string));
                    headers = None
                  })
           } in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Smaws_Lib.Smithy_api.Types.unit_ = () in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = EndpointOperation.request ctx input in
          let request = Mock.last_request () in
          let () =
            check Alcotest_http.input_body_form_testable
              "expected request body value"
              (Some "Action=EndpointOperation&Version=2020-01-08")
              (request.body |>
                 (Option.map
                    (function
                     | `Form x -> Uri.encoded_of_query x
                     | `String x -> x
                     | `Compressed (x, _) -> x
                     | `None -> ""))) in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [("Content-Type", "application/x-www-form-urlencoded")]
              request.headers in
          ()))
let endpoint_operation_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#EndpointOperation",
    [("AwsQueryEndpointTrait", `Quick, aws_query_endpoint_trait)])
let aws_query_endpoint_trait_with_host_label () =
  (Eio.Switch.run ~name:"AwsQueryEndpointTraitWithHostLabel") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config =
           {
             Config.dummy with
             endpoint =
               (Some
                  {
                    uri = (Some ("//example.com" |> Uri.of_string));
                    headers = None
                  })
           } in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Types.host_label_input = { label = "bar" } in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = EndpointWithHostLabelOperation.request ctx input in
          let request = Mock.last_request () in
          let () =
            check Alcotest_http.input_body_form_testable
              "expected request body value"
              (Some
                 "Action=EndpointWithHostLabelOperation&Version=2020-01-08&label=bar")
              (request.body |>
                 (Option.map
                    (function
                     | `Form x -> Uri.encoded_of_query x
                     | `String x -> x
                     | `Compressed (x, _) -> x
                     | `None -> ""))) in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [("Content-Type", "application/x-www-form-urlencoded")]
              request.headers in
          ()))
let endpoint_with_host_label_operation_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#EndpointWithHostLabelOperation",
    [("AwsQueryEndpointTraitWithHostLabel", `Quick,
       aws_query_endpoint_trait_with_host_label)])
let flattened_xml_map_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#FlattenedXmlMap", [])
let flattened_xml_map_with_xml_name_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#FlattenedXmlMapWithXmlName", [])
let flattened_xml_map_with_xml_namespace_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#FlattenedXmlMapWithXmlNamespace", [])
let fractional_seconds_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#FractionalSeconds", [])
let greeting_with_errors_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#GreetingWithErrors", [])
let query_host_with_path () =
  (Eio.Switch.run ~name:"QueryHostWithPath") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config =
           {
             Config.dummy with
             endpoint =
               (Some
                  {
                    uri = (Some ("//example.com/custom" |> Uri.of_string));
                    headers = None
                  })
           } in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Smaws_Lib.Smithy_api.Types.unit_ = () in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = HostWithPathOperation.request ctx input in
          let request = Mock.last_request () in
          let () =
            check Alcotest_http.input_body_form_testable
              "expected request body value"
              (Some "Action=HostWithPathOperation&Version=2020-01-08")
              (request.body |>
                 (Option.map
                    (function
                     | `Form x -> Uri.encoded_of_query x
                     | `String x -> x
                     | `Compressed (x, _) -> x
                     | `None -> ""))) in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/custom/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [] request.headers in
          ()))
let host_with_path_operation_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#HostWithPathOperation",
    [("QueryHostWithPath", `Quick, query_host_with_path)])
let ignores_wrapping_xml_name_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#IgnoresWrappingXmlName", [])
let nested_structures () =
  (Eio.Switch.run ~name:"NestedStructures") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Types.nested_structures_input =
           {
             nested =
               (Some
                  {
                    recursive_arg =
                      (Some
                         {
                           recursive_arg = None;
                           other_arg = None;
                           string_arg = (Some "baz")
                         });
                    other_arg = (Some true);
                    string_arg = (Some "foo")
                  })
           } in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = NestedStructures.request ctx input in
          let request = Mock.last_request () in
          let () =
            check Alcotest_http.input_body_form_testable
              "expected request body value"
              (Some
                 "Action=NestedStructures&Version=2020-01-08&Nested.StringArg=foo&Nested.OtherArg=true&Nested.RecursiveArg.StringArg=baz")
              (request.body |>
                 (Option.map
                    (function
                     | `Form x -> Uri.encoded_of_query x
                     | `String x -> x
                     | `Compressed (x, _) -> x
                     | `None -> ""))) in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [("Content-Type", "application/x-www-form-urlencoded")]
              request.headers in
          ()))
let nested_structures_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#NestedStructures",
    [("NestedStructures", `Quick, nested_structures)])
let query_no_input_and_no_output () =
  (Eio.Switch.run ~name:"QueryNoInputAndNoOutput") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Smaws_Lib.Smithy_api.Types.unit_ = () in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = NoInputAndNoOutput.request ctx input in
          let request = Mock.last_request () in
          let () =
            check Alcotest_http.input_body_form_testable
              "expected request body value"
              (Some "Action=NoInputAndNoOutput&Version=2020-01-08")
              (request.body |>
                 (Option.map
                    (function
                     | `Form x -> Uri.encoded_of_query x
                     | `String x -> x
                     | `Compressed (x, _) -> x
                     | `None -> ""))) in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [("Content-Type", "application/x-www-form-urlencoded")]
              request.headers in
          ()))
let no_input_and_no_output_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#NoInputAndNoOutput",
    [("QueryNoInputAndNoOutput", `Quick, query_no_input_and_no_output)])
let query_no_input_and_output () =
  (Eio.Switch.run ~name:"QueryNoInputAndOutput") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Types.no_input_and_output_input = () in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = NoInputAndOutput.request ctx input in
          let request = Mock.last_request () in
          let () =
            check Alcotest_http.input_body_form_testable
              "expected request body value"
              (Some "Action=NoInputAndOutput&Version=2020-01-08")
              (request.body |>
                 (Option.map
                    (function
                     | `Form x -> Uri.encoded_of_query x
                     | `String x -> x
                     | `Compressed (x, _) -> x
                     | `None -> ""))) in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [("Content-Type", "application/x-www-form-urlencoded")]
              request.headers in
          ()))
let no_input_and_output_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#NoInputAndOutput",
    [("QueryNoInputAndOutput", `Quick, query_no_input_and_output)])
let sdk_applied_content_encoding_aws_query () =
  (Eio.Switch.run ~name:"SDKAppliedContentEncoding_awsQuery") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Types.put_with_content_encoding_input =
           {
             data =
               (Some
                  "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\n");
             encoding = None
           } in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = PutWithContentEncoding.request ctx input in
          let request = Mock.last_request () in
          let () = () in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [("Content-Encoding", "gzip")] request.headers in
          ()))
let sdk_appends_gzip_and_ignores_http_provided_encoding_aws_query () =
  (Eio.Switch.run
     ~name:"SDKAppendsGzipAndIgnoresHttpProvidedEncoding_awsQuery")
    @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Types.put_with_content_encoding_input =
           {
             data =
               (Some
                  "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\n");
             encoding = (Some "custom")
           } in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = PutWithContentEncoding.request ctx input in
          let request = Mock.last_request () in
          let () = () in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [("Content-Encoding", "gzip")] request.headers in
          ()))
let put_with_content_encoding_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#PutWithContentEncoding",
    [("SDKAppliedContentEncoding_awsQuery", `Quick,
       sdk_applied_content_encoding_aws_query);
    ("SDKAppendsGzipAndIgnoresHttpProvidedEncoding_awsQuery", `Quick,
      sdk_appends_gzip_and_ignores_http_provided_encoding_aws_query)])
let query_protocol_idempotency_token_auto_fill () =
  (Eio.Switch.run ~name:"QueryProtocolIdempotencyTokenAutoFill") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Types.query_idempotency_token_auto_fill_input =
           { token = None } in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = QueryIdempotencyTokenAutoFill.request ctx input in
          let request = Mock.last_request () in
          let () =
            check Alcotest_http.input_body_form_testable
              "expected request body value"
              (Some
                 "Action=QueryIdempotencyTokenAutoFill&Version=2020-01-08&token=00000000-0000-4000-8000-000000000000")
              (request.body |>
                 (Option.map
                    (function
                     | `Form x -> Uri.encoded_of_query x
                     | `String x -> x
                     | `Compressed (x, _) -> x
                     | `None -> ""))) in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [("Content-Type", "application/x-www-form-urlencoded")]
              request.headers in
          ()))
let query_protocol_idempotency_token_auto_fill_is_set () =
  (Eio.Switch.run ~name:"QueryProtocolIdempotencyTokenAutoFillIsSet") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Types.query_idempotency_token_auto_fill_input =
           { token = (Some "00000000-0000-4000-8000-000000000123") } in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = QueryIdempotencyTokenAutoFill.request ctx input in
          let request = Mock.last_request () in
          let () =
            check Alcotest_http.input_body_form_testable
              "expected request body value"
              (Some
                 "Action=QueryIdempotencyTokenAutoFill&Version=2020-01-08&token=00000000-0000-4000-8000-000000000123")
              (request.body |>
                 (Option.map
                    (function
                     | `Form x -> Uri.encoded_of_query x
                     | `String x -> x
                     | `Compressed (x, _) -> x
                     | `None -> ""))) in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [("Content-Type", "application/x-www-form-urlencoded")]
              request.headers in
          ()))
let query_idempotency_token_auto_fill_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#QueryIdempotencyTokenAutoFill",
    [("QueryProtocolIdempotencyTokenAutoFill", `Quick,
       query_protocol_idempotency_token_auto_fill);
    ("QueryProtocolIdempotencyTokenAutoFillIsSet", `Quick,
      query_protocol_idempotency_token_auto_fill_is_set)])
let query_lists () =
  (Eio.Switch.run ~name:"QueryLists") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Types.query_lists_input =
           {
             nested_with_list = None;
             flattened_list_arg_with_xml_name = None;
             list_arg_with_xml_name_member = None;
             flattened_list_arg = None;
             complex_list_arg =
               (Some [{ hi = (Some "hello") }; { hi = (Some "hola") }]);
             list_arg = (Some ["foo"; "bar"; "baz"])
           } in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = QueryLists.request ctx input in
          let request = Mock.last_request () in
          let () =
            check Alcotest_http.input_body_form_testable
              "expected request body value"
              (Some
                 "Action=QueryLists&Version=2020-01-08&ListArg.member.1=foo&ListArg.member.2=bar&ListArg.member.3=baz&ComplexListArg.member.1.hi=hello&ComplexListArg.member.2.hi=hola")
              (request.body |>
                 (Option.map
                    (function
                     | `Form x -> Uri.encoded_of_query x
                     | `String x -> x
                     | `Compressed (x, _) -> x
                     | `None -> ""))) in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [("Content-Type", "application/x-www-form-urlencoded")]
              request.headers in
          ()))
let empty_query_lists () =
  (Eio.Switch.run ~name:"EmptyQueryLists") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Types.query_lists_input =
           {
             nested_with_list = None;
             flattened_list_arg_with_xml_name = None;
             list_arg_with_xml_name_member = None;
             flattened_list_arg = None;
             complex_list_arg = None;
             list_arg = (Some [])
           } in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = QueryLists.request ctx input in
          let request = Mock.last_request () in
          let () =
            check Alcotest_http.input_body_form_testable
              "expected request body value"
              (Some "Action=QueryLists&Version=2020-01-08&ListArg=")
              (request.body |>
                 (Option.map
                    (function
                     | `Form x -> Uri.encoded_of_query x
                     | `String x -> x
                     | `Compressed (x, _) -> x
                     | `None -> ""))) in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [("Content-Type", "application/x-www-form-urlencoded")]
              request.headers in
          ()))
let flattened_query_lists () =
  (Eio.Switch.run ~name:"FlattenedQueryLists") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Types.query_lists_input =
           {
             nested_with_list = None;
             flattened_list_arg_with_xml_name = None;
             list_arg_with_xml_name_member = None;
             flattened_list_arg = (Some ["A"; "B"]);
             complex_list_arg = None;
             list_arg = None
           } in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = QueryLists.request ctx input in
          let request = Mock.last_request () in
          let () =
            check Alcotest_http.input_body_form_testable
              "expected request body value"
              (Some
                 "Action=QueryLists&Version=2020-01-08&FlattenedListArg.1=A&FlattenedListArg.2=B")
              (request.body |>
                 (Option.map
                    (function
                     | `Form x -> Uri.encoded_of_query x
                     | `String x -> x
                     | `Compressed (x, _) -> x
                     | `None -> ""))) in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [("Content-Type", "application/x-www-form-urlencoded")]
              request.headers in
          ()))
let query_list_arg_with_xml_name_member () =
  (Eio.Switch.run ~name:"QueryListArgWithXmlNameMember") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Types.query_lists_input =
           {
             nested_with_list = None;
             flattened_list_arg_with_xml_name = None;
             list_arg_with_xml_name_member = (Some ["A"; "B"]);
             flattened_list_arg = None;
             complex_list_arg = None;
             list_arg = None
           } in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = QueryLists.request ctx input in
          let request = Mock.last_request () in
          let () =
            check Alcotest_http.input_body_form_testable
              "expected request body value"
              (Some
                 "Action=QueryLists&Version=2020-01-08&ListArgWithXmlNameMember.item.1=A&ListArgWithXmlNameMember.item.2=B")
              (request.body |>
                 (Option.map
                    (function
                     | `Form x -> Uri.encoded_of_query x
                     | `String x -> x
                     | `Compressed (x, _) -> x
                     | `None -> ""))) in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [("Content-Type", "application/x-www-form-urlencoded")]
              request.headers in
          ()))
let query_flattened_list_arg_with_xml_name () =
  (Eio.Switch.run ~name:"QueryFlattenedListArgWithXmlName") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Types.query_lists_input =
           {
             nested_with_list = None;
             flattened_list_arg_with_xml_name = (Some ["A"; "B"]);
             list_arg_with_xml_name_member = None;
             flattened_list_arg = None;
             complex_list_arg = None;
             list_arg = None
           } in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = QueryLists.request ctx input in
          let request = Mock.last_request () in
          let () =
            check Alcotest_http.input_body_form_testable
              "expected request body value"
              (Some "Action=QueryLists&Version=2020-01-08&Hi.1=A&Hi.2=B")
              (request.body |>
                 (Option.map
                    (function
                     | `Form x -> Uri.encoded_of_query x
                     | `String x -> x
                     | `Compressed (x, _) -> x
                     | `None -> ""))) in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [("Content-Type", "application/x-www-form-urlencoded")]
              request.headers in
          ()))
let query_nested_struct_with_list () =
  (Eio.Switch.run ~name:"QueryNestedStructWithList") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Types.query_lists_input =
           {
             nested_with_list = (Some { list_arg = (Some ["A"; "B"]) });
             flattened_list_arg_with_xml_name = None;
             list_arg_with_xml_name_member = None;
             flattened_list_arg = None;
             complex_list_arg = None;
             list_arg = None
           } in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = QueryLists.request ctx input in
          let request = Mock.last_request () in
          let () =
            check Alcotest_http.input_body_form_testable
              "expected request body value"
              (Some
                 "Action=QueryLists&Version=2020-01-08&NestedWithList.ListArg.member.1=A&NestedWithList.ListArg.member.2=B")
              (request.body |>
                 (Option.map
                    (function
                     | `Form x -> Uri.encoded_of_query x
                     | `String x -> x
                     | `Compressed (x, _) -> x
                     | `None -> ""))) in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [("Content-Type", "application/x-www-form-urlencoded")]
              request.headers in
          ()))
let query_lists_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#QueryLists",
    [("QueryLists", `Quick, query_lists);
    ("EmptyQueryLists", `Quick, empty_query_lists);
    ("FlattenedQueryLists", `Quick, flattened_query_lists);
    ("QueryListArgWithXmlNameMember", `Quick,
      query_list_arg_with_xml_name_member);
    ("QueryFlattenedListArgWithXmlName", `Quick,
      query_flattened_list_arg_with_xml_name);
    ("QueryNestedStructWithList", `Quick, query_nested_struct_with_list)])
let query_simple_query_maps () =
  (Eio.Switch.run ~name:"QuerySimpleQueryMaps") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Types.query_maps_input =
           {
             nested_struct_with_map = None;
             map_of_lists = None;
             flattened_map_with_xml_name = None;
             flattened_map = None;
             map_with_xml_member_name = None;
             complex_map_arg = None;
             renamed_map_arg = None;
             map_arg = (Some [("bar", "Bar"); ("foo", "Foo")])
           } in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = QueryMaps.request ctx input in
          let request = Mock.last_request () in
          let () =
            check Alcotest_http.input_body_form_testable
              "expected request body value"
              (Some
                 "Action=QueryMaps&Version=2020-01-08&MapArg.entry.1.key=bar&MapArg.entry.1.value=Bar&MapArg.entry.2.key=foo&MapArg.entry.2.value=Foo")
              (request.body |>
                 (Option.map
                    (function
                     | `Form x -> Uri.encoded_of_query x
                     | `String x -> x
                     | `Compressed (x, _) -> x
                     | `None -> ""))) in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [("Content-Type", "application/x-www-form-urlencoded")]
              request.headers in
          ()))
let query_simple_query_maps_with_xml_name () =
  (Eio.Switch.run ~name:"QuerySimpleQueryMapsWithXmlName") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Types.query_maps_input =
           {
             nested_struct_with_map = None;
             map_of_lists = None;
             flattened_map_with_xml_name = None;
             flattened_map = None;
             map_with_xml_member_name = None;
             complex_map_arg = None;
             renamed_map_arg = (Some [("foo", "Foo")]);
             map_arg = None
           } in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = QueryMaps.request ctx input in
          let request = Mock.last_request () in
          let () =
            check Alcotest_http.input_body_form_testable
              "expected request body value"
              (Some
                 "Action=QueryMaps&Version=2020-01-08&Foo.entry.1.key=foo&Foo.entry.1.value=Foo")
              (request.body |>
                 (Option.map
                    (function
                     | `Form x -> Uri.encoded_of_query x
                     | `String x -> x
                     | `Compressed (x, _) -> x
                     | `None -> ""))) in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [("Content-Type", "application/x-www-form-urlencoded")]
              request.headers in
          ()))
let query_complex_query_maps () =
  (Eio.Switch.run ~name:"QueryComplexQueryMaps") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Types.query_maps_input =
           {
             nested_struct_with_map = None;
             map_of_lists = None;
             flattened_map_with_xml_name = None;
             flattened_map = None;
             map_with_xml_member_name = None;
             complex_map_arg =
               (Some
                  [("bar", { hi = (Some "Bar") });
                  ("foo", { hi = (Some "Foo") })]);
             renamed_map_arg = None;
             map_arg = None
           } in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = QueryMaps.request ctx input in
          let request = Mock.last_request () in
          let () =
            check Alcotest_http.input_body_form_testable
              "expected request body value"
              (Some
                 "Action=QueryMaps&Version=2020-01-08&ComplexMapArg.entry.1.key=bar&ComplexMapArg.entry.1.value.hi=Bar&ComplexMapArg.entry.2.key=foo&ComplexMapArg.entry.2.value.hi=Foo")
              (request.body |>
                 (Option.map
                    (function
                     | `Form x -> Uri.encoded_of_query x
                     | `String x -> x
                     | `Compressed (x, _) -> x
                     | `None -> ""))) in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [("Content-Type", "application/x-www-form-urlencoded")]
              request.headers in
          ()))
let query_empty_query_maps () =
  (Eio.Switch.run ~name:"QueryEmptyQueryMaps") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Types.query_maps_input =
           {
             nested_struct_with_map = None;
             map_of_lists = None;
             flattened_map_with_xml_name = None;
             flattened_map = None;
             map_with_xml_member_name = None;
             complex_map_arg = None;
             renamed_map_arg = None;
             map_arg = (Some [])
           } in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = QueryMaps.request ctx input in
          let request = Mock.last_request () in
          let () =
            check Alcotest_http.input_body_form_testable
              "expected request body value"
              (Some "Action=QueryMaps&Version=2020-01-08")
              (request.body |>
                 (Option.map
                    (function
                     | `Form x -> Uri.encoded_of_query x
                     | `String x -> x
                     | `Compressed (x, _) -> x
                     | `None -> ""))) in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [("Content-Type", "application/x-www-form-urlencoded")]
              request.headers in
          ()))
let query_query_map_with_member_xml_name () =
  (Eio.Switch.run ~name:"QueryQueryMapWithMemberXmlName") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Types.query_maps_input =
           {
             nested_struct_with_map = None;
             map_of_lists = None;
             flattened_map_with_xml_name = None;
             flattened_map = None;
             map_with_xml_member_name =
               (Some [("bar", "Bar"); ("foo", "Foo")]);
             complex_map_arg = None;
             renamed_map_arg = None;
             map_arg = None
           } in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = QueryMaps.request ctx input in
          let request = Mock.last_request () in
          let () =
            check Alcotest_http.input_body_form_testable
              "expected request body value"
              (Some
                 "Action=QueryMaps&Version=2020-01-08&MapWithXmlMemberName.entry.1.K=bar&MapWithXmlMemberName.entry.1.V=Bar&MapWithXmlMemberName.entry.2.K=foo&MapWithXmlMemberName.entry.2.V=Foo")
              (request.body |>
                 (Option.map
                    (function
                     | `Form x -> Uri.encoded_of_query x
                     | `String x -> x
                     | `Compressed (x, _) -> x
                     | `None -> ""))) in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [("Content-Type", "application/x-www-form-urlencoded")]
              request.headers in
          ()))
let query_flattened_query_maps () =
  (Eio.Switch.run ~name:"QueryFlattenedQueryMaps") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Types.query_maps_input =
           {
             nested_struct_with_map = None;
             map_of_lists = None;
             flattened_map_with_xml_name = None;
             flattened_map = (Some [("bar", "Bar"); ("foo", "Foo")]);
             map_with_xml_member_name = None;
             complex_map_arg = None;
             renamed_map_arg = None;
             map_arg = None
           } in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = QueryMaps.request ctx input in
          let request = Mock.last_request () in
          let () =
            check Alcotest_http.input_body_form_testable
              "expected request body value"
              (Some
                 "Action=QueryMaps&Version=2020-01-08&FlattenedMap.1.key=bar&FlattenedMap.1.value=Bar&FlattenedMap.2.key=foo&FlattenedMap.2.value=Foo")
              (request.body |>
                 (Option.map
                    (function
                     | `Form x -> Uri.encoded_of_query x
                     | `String x -> x
                     | `Compressed (x, _) -> x
                     | `None -> ""))) in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [("Content-Type", "application/x-www-form-urlencoded")]
              request.headers in
          ()))
let query_flattened_query_maps_with_xml_name () =
  (Eio.Switch.run ~name:"QueryFlattenedQueryMapsWithXmlName") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Types.query_maps_input =
           {
             nested_struct_with_map = None;
             map_of_lists = None;
             flattened_map_with_xml_name =
               (Some [("bar", "Bar"); ("foo", "Foo")]);
             flattened_map = None;
             map_with_xml_member_name = None;
             complex_map_arg = None;
             renamed_map_arg = None;
             map_arg = None
           } in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = QueryMaps.request ctx input in
          let request = Mock.last_request () in
          let () =
            check Alcotest_http.input_body_form_testable
              "expected request body value"
              (Some
                 "Action=QueryMaps&Version=2020-01-08&Hi.1.K=bar&Hi.1.V=Bar&Hi.2.K=foo&Hi.2.V=Foo")
              (request.body |>
                 (Option.map
                    (function
                     | `Form x -> Uri.encoded_of_query x
                     | `String x -> x
                     | `Compressed (x, _) -> x
                     | `None -> ""))) in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [("Content-Type", "application/x-www-form-urlencoded")]
              request.headers in
          ()))
let query_query_map_of_lists () =
  (Eio.Switch.run ~name:"QueryQueryMapOfLists") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Types.query_maps_input =
           {
             nested_struct_with_map = None;
             map_of_lists = (Some [("bar", ["C"; "D"]); ("foo", ["A"; "B"])]);
             flattened_map_with_xml_name = None;
             flattened_map = None;
             map_with_xml_member_name = None;
             complex_map_arg = None;
             renamed_map_arg = None;
             map_arg = None
           } in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = QueryMaps.request ctx input in
          let request = Mock.last_request () in
          let () =
            check Alcotest_http.input_body_form_testable
              "expected request body value"
              (Some
                 "Action=QueryMaps&Version=2020-01-08&MapOfLists.entry.1.key=bar&MapOfLists.entry.1.value.member.1=C&MapOfLists.entry.1.value.member.2=D&MapOfLists.entry.2.key=foo&MapOfLists.entry.2.value.member.1=A&MapOfLists.entry.2.value.member.2=B")
              (request.body |>
                 (Option.map
                    (function
                     | `Form x -> Uri.encoded_of_query x
                     | `String x -> x
                     | `Compressed (x, _) -> x
                     | `None -> ""))) in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [("Content-Type", "application/x-www-form-urlencoded")]
              request.headers in
          ()))
let query_nested_struct_with_map () =
  (Eio.Switch.run ~name:"QueryNestedStructWithMap") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Types.query_maps_input =
           {
             nested_struct_with_map =
               (Some { map_arg = (Some [("bar", "Bar"); ("foo", "Foo")]) });
             map_of_lists = None;
             flattened_map_with_xml_name = None;
             flattened_map = None;
             map_with_xml_member_name = None;
             complex_map_arg = None;
             renamed_map_arg = None;
             map_arg = None
           } in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = QueryMaps.request ctx input in
          let request = Mock.last_request () in
          let () =
            check Alcotest_http.input_body_form_testable
              "expected request body value"
              (Some
                 "Action=QueryMaps&Version=2020-01-08&NestedStructWithMap.MapArg.entry.1.key=bar&NestedStructWithMap.MapArg.entry.1.value=Bar&NestedStructWithMap.MapArg.entry.2.key=foo&NestedStructWithMap.MapArg.entry.2.value=Foo")
              (request.body |>
                 (Option.map
                    (function
                     | `Form x -> Uri.encoded_of_query x
                     | `String x -> x
                     | `Compressed (x, _) -> x
                     | `None -> ""))) in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [("Content-Type", "application/x-www-form-urlencoded")]
              request.headers in
          ()))
let query_maps_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#QueryMaps",
    [("QuerySimpleQueryMaps", `Quick, query_simple_query_maps);
    ("QuerySimpleQueryMapsWithXmlName", `Quick,
      query_simple_query_maps_with_xml_name);
    ("QueryComplexQueryMaps", `Quick, query_complex_query_maps);
    ("QueryEmptyQueryMaps", `Quick, query_empty_query_maps);
    ("QueryQueryMapWithMemberXmlName", `Quick,
      query_query_map_with_member_xml_name);
    ("QueryFlattenedQueryMaps", `Quick, query_flattened_query_maps);
    ("QueryFlattenedQueryMapsWithXmlName", `Quick,
      query_flattened_query_maps_with_xml_name);
    ("QueryQueryMapOfLists", `Quick, query_query_map_of_lists);
    ("QueryNestedStructWithMap", `Quick, query_nested_struct_with_map)])
let query_timestamps_input () =
  (Eio.Switch.run ~name:"QueryTimestampsInput") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Types.query_timestamps_input =
           {
             epoch_target =
               (Some
                  (Option.get
                     (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1422172800.)));
             epoch_member =
               (Some
                  (Option.get
                     (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1422172800.)));
             normal_format =
               (Some
                  (Option.get
                     (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1422172800.)))
           } in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = QueryTimestamps.request ctx input in
          let request = Mock.last_request () in
          let () =
            check Alcotest_http.input_body_form_testable
              "expected request body value"
              (Some
                 "Action=QueryTimestamps&Version=2020-01-08&normalFormat=2015-01-25T08%3A00%3A00Z&epochMember=1422172800&epochTarget=1422172800")
              (request.body |>
                 (Option.map
                    (function
                     | `Form x -> Uri.encoded_of_query x
                     | `String x -> x
                     | `Compressed (x, _) -> x
                     | `None -> ""))) in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [("Content-Type", "application/x-www-form-urlencoded")]
              request.headers in
          ()))
let query_timestamps_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#QueryTimestamps",
    [("QueryTimestampsInput", `Quick, query_timestamps_input)])
let recursive_xml_shapes_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#RecursiveXmlShapes", [])
let query_simple_input_params_strings () =
  (Eio.Switch.run ~name:"QuerySimpleInputParamsStrings") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Types.simple_input_params_input =
           {
             integer_enum = None;
             foo_enum = None;
             qux = None;
             boo = None;
             float_value = None;
             bam = None;
             baz = None;
             bar = (Some "val2");
             foo = (Some "val1")
           } in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = SimpleInputParams.request ctx input in
          let request = Mock.last_request () in
          let () =
            check Alcotest_http.input_body_form_testable
              "expected request body value"
              (Some
                 "Action=SimpleInputParams&Version=2020-01-08&Foo=val1&Bar=val2")
              (request.body |>
                 (Option.map
                    (function
                     | `Form x -> Uri.encoded_of_query x
                     | `String x -> x
                     | `Compressed (x, _) -> x
                     | `None -> ""))) in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [("Content-Type", "application/x-www-form-urlencoded")]
              request.headers in
          ()))
let query_simple_input_params_string_and_boolean_true () =
  (Eio.Switch.run ~name:"QuerySimpleInputParamsStringAndBooleanTrue") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Types.simple_input_params_input =
           {
             integer_enum = None;
             foo_enum = None;
             qux = None;
             boo = None;
             float_value = None;
             bam = None;
             baz = (Some true);
             bar = None;
             foo = (Some "val1")
           } in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = SimpleInputParams.request ctx input in
          let request = Mock.last_request () in
          let () =
            check Alcotest_http.input_body_form_testable
              "expected request body value"
              (Some
                 "Action=SimpleInputParams&Version=2020-01-08&Foo=val1&Baz=true")
              (request.body |>
                 (Option.map
                    (function
                     | `Form x -> Uri.encoded_of_query x
                     | `String x -> x
                     | `Compressed (x, _) -> x
                     | `None -> ""))) in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [("Content-Type", "application/x-www-form-urlencoded")]
              request.headers in
          ()))
let query_simple_input_params_strings_and_boolean_false () =
  (Eio.Switch.run ~name:"QuerySimpleInputParamsStringsAndBooleanFalse") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Types.simple_input_params_input =
           {
             integer_enum = None;
             foo_enum = None;
             qux = None;
             boo = None;
             float_value = None;
             bam = None;
             baz = (Some false);
             bar = None;
             foo = None
           } in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = SimpleInputParams.request ctx input in
          let request = Mock.last_request () in
          let () =
            check Alcotest_http.input_body_form_testable
              "expected request body value"
              (Some "Action=SimpleInputParams&Version=2020-01-08&Baz=false")
              (request.body |>
                 (Option.map
                    (function
                     | `Form x -> Uri.encoded_of_query x
                     | `String x -> x
                     | `Compressed (x, _) -> x
                     | `None -> ""))) in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [("Content-Type", "application/x-www-form-urlencoded")]
              request.headers in
          ()))
let query_simple_input_params_integer () =
  (Eio.Switch.run ~name:"QuerySimpleInputParamsInteger") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Types.simple_input_params_input =
           {
             integer_enum = None;
             foo_enum = None;
             qux = None;
             boo = None;
             float_value = None;
             bam = (Some 10);
             baz = None;
             bar = None;
             foo = None
           } in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = SimpleInputParams.request ctx input in
          let request = Mock.last_request () in
          let () =
            check Alcotest_http.input_body_form_testable
              "expected request body value"
              (Some "Action=SimpleInputParams&Version=2020-01-08&Bam=10")
              (request.body |>
                 (Option.map
                    (function
                     | `Form x -> Uri.encoded_of_query x
                     | `String x -> x
                     | `Compressed (x, _) -> x
                     | `None -> ""))) in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [("Content-Type", "application/x-www-form-urlencoded")]
              request.headers in
          ()))
let query_simple_input_params_float () =
  (Eio.Switch.run ~name:"QuerySimpleInputParamsFloat") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Types.simple_input_params_input =
           {
             integer_enum = None;
             foo_enum = None;
             qux = None;
             boo = (Some 10.8);
             float_value = None;
             bam = None;
             baz = None;
             bar = None;
             foo = None
           } in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = SimpleInputParams.request ctx input in
          let request = Mock.last_request () in
          let () =
            check Alcotest_http.input_body_form_testable
              "expected request body value"
              (Some "Action=SimpleInputParams&Version=2020-01-08&Boo=10.8")
              (request.body |>
                 (Option.map
                    (function
                     | `Form x -> Uri.encoded_of_query x
                     | `String x -> x
                     | `Compressed (x, _) -> x
                     | `None -> ""))) in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [("Content-Type", "application/x-www-form-urlencoded")]
              request.headers in
          ()))
let query_simple_input_params_blob () =
  (Eio.Switch.run ~name:"QuerySimpleInputParamsBlob") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Types.simple_input_params_input =
           {
             integer_enum = None;
             foo_enum = None;
             qux = (Some (Smaws_Lib.CoreTypes.Blob.of_string "value"));
             boo = None;
             float_value = None;
             bam = None;
             baz = None;
             bar = None;
             foo = None
           } in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = SimpleInputParams.request ctx input in
          let request = Mock.last_request () in
          let () =
            check Alcotest_http.input_body_form_testable
              "expected request body value"
              (Some
                 "Action=SimpleInputParams&Version=2020-01-08&Qux=dmFsdWU%3D")
              (request.body |>
                 (Option.map
                    (function
                     | `Form x -> Uri.encoded_of_query x
                     | `String x -> x
                     | `Compressed (x, _) -> x
                     | `None -> ""))) in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [("Content-Type", "application/x-www-form-urlencoded")]
              request.headers in
          ()))
let query_enums () =
  (Eio.Switch.run ~name:"QueryEnums") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Types.simple_input_params_input =
           {
             integer_enum = None;
             foo_enum = (Some FOO);
             qux = None;
             boo = None;
             float_value = None;
             bam = None;
             baz = None;
             bar = None;
             foo = None
           } in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = SimpleInputParams.request ctx input in
          let request = Mock.last_request () in
          let () =
            check Alcotest_http.input_body_form_testable
              "expected request body value"
              (Some "Action=SimpleInputParams&Version=2020-01-08&FooEnum=Foo")
              (request.body |>
                 (Option.map
                    (function
                     | `Form x -> Uri.encoded_of_query x
                     | `String x -> x
                     | `Compressed (x, _) -> x
                     | `None -> ""))) in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [("Content-Type", "application/x-www-form-urlencoded")]
              request.headers in
          ()))
let query_int_enums () =
  (Eio.Switch.run ~name:"QueryIntEnums") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Types.simple_input_params_input =
           {
             integer_enum = (Some A);
             foo_enum = None;
             qux = None;
             boo = None;
             float_value = None;
             bam = None;
             baz = None;
             bar = None;
             foo = None
           } in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = SimpleInputParams.request ctx input in
          let request = Mock.last_request () in
          let () =
            check Alcotest_http.input_body_form_testable
              "expected request body value"
              (Some
                 "Action=SimpleInputParams&Version=2020-01-08&IntegerEnum=1")
              (request.body |>
                 (Option.map
                    (function
                     | `Form x -> Uri.encoded_of_query x
                     | `String x -> x
                     | `Compressed (x, _) -> x
                     | `None -> ""))) in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [("Content-Type", "application/x-www-form-urlencoded")]
              request.headers in
          ()))
let aws_query_supports_na_n_float_inputs () =
  (Eio.Switch.run ~name:"AwsQuerySupportsNaNFloatInputs") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Types.simple_input_params_input =
           {
             integer_enum = None;
             foo_enum = None;
             qux = None;
             boo = (Some Float.nan);
             float_value = (Some Float.nan);
             bam = None;
             baz = None;
             bar = None;
             foo = None
           } in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = SimpleInputParams.request ctx input in
          let request = Mock.last_request () in
          let () =
            check Alcotest_http.input_body_form_testable
              "expected request body value"
              (Some
                 "Action=SimpleInputParams&Version=2020-01-08&FloatValue=NaN&Boo=NaN")
              (request.body |>
                 (Option.map
                    (function
                     | `Form x -> Uri.encoded_of_query x
                     | `String x -> x
                     | `Compressed (x, _) -> x
                     | `None -> ""))) in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [("Content-Type", "application/x-www-form-urlencoded")]
              request.headers in
          ()))
let aws_query_supports_infinity_float_inputs () =
  (Eio.Switch.run ~name:"AwsQuerySupportsInfinityFloatInputs") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Types.simple_input_params_input =
           {
             integer_enum = None;
             foo_enum = None;
             qux = None;
             boo = (Some Float.infinity);
             float_value = (Some Float.infinity);
             bam = None;
             baz = None;
             bar = None;
             foo = None
           } in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = SimpleInputParams.request ctx input in
          let request = Mock.last_request () in
          let () =
            check Alcotest_http.input_body_form_testable
              "expected request body value"
              (Some
                 "Action=SimpleInputParams&Version=2020-01-08&FloatValue=Infinity&Boo=Infinity")
              (request.body |>
                 (Option.map
                    (function
                     | `Form x -> Uri.encoded_of_query x
                     | `String x -> x
                     | `Compressed (x, _) -> x
                     | `None -> ""))) in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [("Content-Type", "application/x-www-form-urlencoded")]
              request.headers in
          ()))
let aws_query_supports_negative_infinity_float_inputs () =
  (Eio.Switch.run ~name:"AwsQuerySupportsNegativeInfinityFloatInputs") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let input : Types.simple_input_params_input =
           {
             integer_enum = None;
             foo_enum = None;
             qux = None;
             boo = (Some Float.neg_infinity);
             float_value = (Some Float.neg_infinity);
             bam = None;
             baz = None;
             bar = None;
             foo = None
           } in
         Mock.mock_response ~status:200 ~headers:[] ();
         (let _response = SimpleInputParams.request ctx input in
          let request = Mock.last_request () in
          let () =
            check Alcotest_http.input_body_form_testable
              "expected request body value"
              (Some
                 "Action=SimpleInputParams&Version=2020-01-08&FloatValue=-Infinity&Boo=-Infinity")
              (request.body |>
                 (Option.map
                    (function
                     | `Form x -> Uri.encoded_of_query x
                     | `String x -> x
                     | `Compressed (x, _) -> x
                     | `None -> ""))) in
          let () =
            check Alcotest_http.method_testable "expected request method"
              `POST request.method_ in
          let () =
            check Alcotest_http.uri_testable "expected request uri"
              (Uri.of_string "/") request.uri in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [("Content-Type", "application/x-www-form-urlencoded")]
              request.headers in
          ()))
let simple_input_params_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#SimpleInputParams",
    [("QuerySimpleInputParamsStrings", `Quick,
       query_simple_input_params_strings);
    ("QuerySimpleInputParamsStringAndBooleanTrue", `Quick,
      query_simple_input_params_string_and_boolean_true);
    ("QuerySimpleInputParamsStringsAndBooleanFalse", `Quick,
      query_simple_input_params_strings_and_boolean_false);
    ("QuerySimpleInputParamsInteger", `Quick,
      query_simple_input_params_integer);
    ("QuerySimpleInputParamsFloat", `Quick, query_simple_input_params_float);
    ("QuerySimpleInputParamsBlob", `Quick, query_simple_input_params_blob);
    ("QueryEnums", `Quick, query_enums);
    ("QueryIntEnums", `Quick, query_int_enums);
    ("AwsQuerySupportsNaNFloatInputs", `Quick,
      aws_query_supports_na_n_float_inputs);
    ("AwsQuerySupportsInfinityFloatInputs", `Quick,
      aws_query_supports_infinity_float_inputs);
    ("AwsQuerySupportsNegativeInfinityFloatInputs", `Quick,
      aws_query_supports_negative_infinity_float_inputs)])
let simple_scalar_xml_properties_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#SimpleScalarXmlProperties", [])
let xml_blobs_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#XmlBlobs", [])
let xml_empty_blobs_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#XmlEmptyBlobs", [])
let xml_empty_lists_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#XmlEmptyLists", [])
let xml_empty_maps_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#XmlEmptyMaps", [])
let xml_enums_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#XmlEnums", [])
let xml_int_enums_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#XmlIntEnums", [])
let xml_lists_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#XmlLists", [])
let xml_maps_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#XmlMaps", [])
let xml_maps_xml_name_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#XmlMapsXmlName", [])
let xml_namespaces_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#XmlNamespaces", [])
let xml_timestamps_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#XmlTimestamps", [])
let () =
  Eio_main.run @@
    (fun env ->
       Alcotest.run "aws.protocoltests.query"
         [datetime_offsets_test_suite;
         empty_input_and_empty_output_test_suite;
         endpoint_operation_test_suite;
         endpoint_with_host_label_operation_test_suite;
         flattened_xml_map_test_suite;
         flattened_xml_map_with_xml_name_test_suite;
         flattened_xml_map_with_xml_namespace_test_suite;
         fractional_seconds_test_suite;
         greeting_with_errors_test_suite;
         host_with_path_operation_test_suite;
         ignores_wrapping_xml_name_test_suite;
         nested_structures_test_suite;
         no_input_and_no_output_test_suite;
         no_input_and_output_test_suite;
         put_with_content_encoding_test_suite;
         query_idempotency_token_auto_fill_test_suite;
         query_lists_test_suite;
         query_maps_test_suite;
         query_timestamps_test_suite;
         recursive_xml_shapes_test_suite;
         simple_input_params_test_suite;
         simple_scalar_xml_properties_test_suite;
         xml_blobs_test_suite;
         xml_empty_blobs_test_suite;
         xml_empty_lists_test_suite;
         xml_empty_maps_test_suite;
         xml_enums_test_suite;
         xml_int_enums_test_suite;
         xml_lists_test_suite;
         xml_maps_test_suite;
         xml_maps_xml_name_test_suite;
         xml_namespaces_test_suite;
         xml_timestamps_test_suite])