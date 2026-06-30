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
let put_with_content_encoding_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#PutWithContentEncoding", [])
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
    [("QueryProtocolIdempotencyTokenAutoFillIsSet", `Quick,
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