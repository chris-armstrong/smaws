open Alcotest
open Smaws_Test_Support_Lib
open Query

let aws_query_date_time_with_negative_offset () =
  Eio.Switch.run ~name:"AwsQueryDateTimeWithNegativeOffset" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<DatetimeOffsetsResponse xmlns=\"https://example.com/\">\n\
         \    <DatetimeOffsetsResult>\n\
         \        <datetime>2019-12-16T22:48:18-01:00</datetime>\n\
         \    </DatetimeOffsetsResult>\n\
          </DatetimeOffsetsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "text/xml") ]
    ();
  let response = DatetimeOffsets.request ctx () in
  match response with
  | Ok result ->
      let expected =
        ({ datetime = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.)) }
          : Types.datetime_offsets_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_datetime_offsets_output
           Types.equal_datetime_offsets_output)
        "expected output" expected result
  | Error error -> failwith (DatetimeOffsets.error_to_string error)

let aws_query_date_time_with_positive_offset () =
  Eio.Switch.run ~name:"AwsQueryDateTimeWithPositiveOffset" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<DatetimeOffsetsResponse xmlns=\"https://example.com/\">\n\
         \    <DatetimeOffsetsResult>\n\
         \        <datetime>2019-12-17T00:48:18+01:00</datetime>\n\
         \    </DatetimeOffsetsResult>\n\
          </DatetimeOffsetsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "text/xml") ]
    ();
  let response = DatetimeOffsets.request ctx () in
  match response with
  | Ok result ->
      let expected =
        ({ datetime = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.)) }
          : Types.datetime_offsets_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_datetime_offsets_output
           Types.equal_datetime_offsets_output)
        "expected output" expected result
  | Error error -> failwith (DatetimeOffsets.error_to_string error)

let datetime_offsets_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.query#DatetimeOffsets",
    [
      ("AwsQueryDateTimeWithNegativeOffset", `Quick, aws_query_date_time_with_negative_offset);
      ("AwsQueryDateTimeWithPositiveOffset", `Quick, aws_query_date_time_with_positive_offset);
    ] )

let query_empty_input_and_empty_output () =
  Eio.Switch.run ~name:"QueryEmptyInputAndEmptyOutput" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.empty_input_and_empty_output_input = () in
  Mock.mock_response ~status:200 ~headers:[] ();
  let _response = EmptyInputAndEmptyOutput.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_form_testable "expected request body value"
      (Some "Action=EmptyInputAndEmptyOutput&Version=2020-01-08")
      (request.body
      |> Option.map (function
        | `Form x -> Uri.encoded_of_query x
        | `String x -> x
        | `Compressed (x, _) -> x
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/x-www-form-urlencoded") ]
      request.headers
  in
  ()

let query_empty_input_and_empty_output () =
  Eio.Switch.run ~name:"QueryEmptyInputAndEmptyOutput" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:None ~status:200 ~headers:[] ();
  let response = EmptyInputAndEmptyOutput.request ctx () in
  match response with
  | Ok result ->
      let expected = (() : Types.empty_input_and_empty_output_output) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_empty_input_and_empty_output_output
           Types.equal_empty_input_and_empty_output_output)
        "expected output" expected result
  | Error error -> failwith (EmptyInputAndEmptyOutput.error_to_string error)

let empty_input_and_empty_output_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.query#EmptyInputAndEmptyOutput",
    [
      ("QueryEmptyInputAndEmptyOutput", `Quick, query_empty_input_and_empty_output);
      ("QueryEmptyInputAndEmptyOutput", `Quick, query_empty_input_and_empty_output);
    ] )

let aws_query_endpoint_trait () =
  Eio.Switch.run ~name:"AwsQueryEndpointTrait" @@ fun sw ->
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
  Mock.mock_response ~status:200 ~headers:[] ();
  let _response = EndpointOperation.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_form_testable "expected request body value"
      (Some "Action=EndpointOperation&Version=2020-01-08")
      (request.body
      |> Option.map (function
        | `Form x -> Uri.encoded_of_query x
        | `String x -> x
        | `Compressed (x, _) -> x
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/x-www-form-urlencoded") ]
      request.headers
  in
  ()

let endpoint_operation_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.query#EndpointOperation",
    [ ("AwsQueryEndpointTrait", `Quick, aws_query_endpoint_trait) ] )

let aws_query_endpoint_trait_with_host_label () =
  Eio.Switch.run ~name:"AwsQueryEndpointTraitWithHostLabel" @@ fun sw ->
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
  Mock.mock_response ~status:200 ~headers:[] ();
  let _response = EndpointWithHostLabelOperation.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_form_testable "expected request body value"
      (Some "Action=EndpointWithHostLabelOperation&Version=2020-01-08&label=bar")
      (request.body
      |> Option.map (function
        | `Form x -> Uri.encoded_of_query x
        | `String x -> x
        | `Compressed (x, _) -> x
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/x-www-form-urlencoded") ]
      request.headers
  in
  ()

let endpoint_with_host_label_operation_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.query#EndpointWithHostLabelOperation",
    [ ("AwsQueryEndpointTraitWithHostLabel", `Quick, aws_query_endpoint_trait_with_host_label) ] )

let query_query_flattened_xml_map () =
  Eio.Switch.run ~name:"QueryQueryFlattenedXmlMap" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<FlattenedXmlMapResponse xmlns=\"https://example.com/\">\n\
         \    <FlattenedXmlMapResult>\n\
         \        <myMap>\n\
         \            <key>foo</key>\n\
         \            <value>Foo</value>\n\
         \        </myMap>\n\
         \        <myMap>\n\
         \            <key>baz</key>\n\
         \            <value>Baz</value>\n\
         \        </myMap>\n\
         \    </FlattenedXmlMapResult>\n\
          </FlattenedXmlMapResponse>")
    ~status:200
    ~headers:[ ("Content-Type", "text/xml") ]
    ();
  let response = FlattenedXmlMap.request ctx () in
  match response with
  | Ok result ->
      let expected =
        ({ my_map = Some [ ("foo", FOO); ("baz", BAZ) ] } : Types.flattened_xml_map_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_flattened_xml_map_output
           Types.equal_flattened_xml_map_output)
        "expected output" expected result
  | Error error -> failwith (FlattenedXmlMap.error_to_string error)

let flattened_xml_map_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.query#FlattenedXmlMap",
    [ ("QueryQueryFlattenedXmlMap", `Quick, query_query_flattened_xml_map) ] )

let query_query_flattened_xml_map_with_xml_name () =
  Eio.Switch.run ~name:"QueryQueryFlattenedXmlMapWithXmlName" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<FlattenedXmlMapWithXmlNameResponse xmlns=\"https://example.com/\">\n\
         \    <FlattenedXmlMapWithXmlNameResult>\n\
         \        <KVP>\n\
         \            <K>a</K>\n\
         \            <V>A</V>\n\
         \        </KVP>\n\
         \        <KVP>\n\
         \            <K>b</K>\n\
         \            <V>B</V>\n\
         \        </KVP>\n\
         \    </FlattenedXmlMapWithXmlNameResult>\n\
          </FlattenedXmlMapWithXmlNameResponse>")
    ~status:200
    ~headers:[ ("Content-Type", "text/xml") ]
    ();
  let response = FlattenedXmlMapWithXmlName.request ctx () in
  match response with
  | Ok result ->
      let expected =
        ({ my_map = Some [ ("a", "A"); ("b", "B") ] }
          : Types.flattened_xml_map_with_xml_name_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_flattened_xml_map_with_xml_name_output
           Types.equal_flattened_xml_map_with_xml_name_output)
        "expected output" expected result
  | Error error -> failwith (FlattenedXmlMapWithXmlName.error_to_string error)

let flattened_xml_map_with_xml_name_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.query#FlattenedXmlMapWithXmlName",
    [
      ("QueryQueryFlattenedXmlMapWithXmlName", `Quick, query_query_flattened_xml_map_with_xml_name);
    ] )

let query_query_flattened_xml_map_with_xml_namespace () =
  Eio.Switch.run ~name:"QueryQueryFlattenedXmlMapWithXmlNamespace" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<FlattenedXmlMapWithXmlNamespaceResponse xmlns=\"https://example.com/\">\n\
         \    <FlattenedXmlMapWithXmlNamespaceResult>\n\
         \        <KVP xmlns=\"https://the-member.example.com\">\n\
         \            <K xmlns=\"https://the-key.example.com\">a</K>\n\
         \            <V xmlns=\"https://the-value.example.com\">A</V>\n\
         \        </KVP>\n\
         \        <KVP xmlns=\"https://the-member.example.com\">\n\
         \            <K xmlns=\"https://the-key.example.com\">b</K>\n\
         \            <V xmlns=\"https://the-value.example.com\">B</V>\n\
         \        </KVP>\n\
         \    </FlattenedXmlMapWithXmlNamespaceResult>\n\
          </FlattenedXmlMapWithXmlNamespaceResponse>")
    ~status:200
    ~headers:[ ("Content-Type", "text/xml") ]
    ();
  let response = FlattenedXmlMapWithXmlNamespace.request ctx () in
  match response with
  | Ok result ->
      let expected =
        ({ my_map = Some [ ("a", "A"); ("b", "B") ] }
          : Types.flattened_xml_map_with_xml_namespace_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_flattened_xml_map_with_xml_namespace_output
           Types.equal_flattened_xml_map_with_xml_namespace_output)
        "expected output" expected result
  | Error error -> failwith (FlattenedXmlMapWithXmlNamespace.error_to_string error)

let flattened_xml_map_with_xml_namespace_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.query#FlattenedXmlMapWithXmlNamespace",
    [
      ( "QueryQueryFlattenedXmlMapWithXmlNamespace",
        `Quick,
        query_query_flattened_xml_map_with_xml_namespace );
    ] )

let aws_query_date_time_with_fractional_seconds () =
  Eio.Switch.run ~name:"AwsQueryDateTimeWithFractionalSeconds" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<FractionalSecondsResponse xmlns=\"https://example.com/\">\n\
         \    <FractionalSecondsResult>\n\
         \        <datetime>2000-01-02T20:34:56.123Z</datetime>\n\
         \    </FractionalSecondsResult>\n\
          </FractionalSecondsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "text/xml") ]
    ();
  let response = FractionalSeconds.request ctx () in
  match response with
  | Ok result ->
      let expected =
        ({
           datetime =
             Some
               (Smaws_Lib.CoreTypes.Timestamp.truncate ~frac_s:6
                  (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 946845296.123)));
         }
          : Types.fractional_seconds_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_fractional_seconds_output
           Types.equal_fractional_seconds_output)
        "expected output" expected result
  | Error error -> failwith (FractionalSeconds.error_to_string error)

let fractional_seconds_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.query#FractionalSeconds",
    [
      ("AwsQueryDateTimeWithFractionalSeconds", `Quick, aws_query_date_time_with_fractional_seconds);
    ] )

let query_greeting_with_errors () =
  Eio.Switch.run ~name:"QueryGreetingWithErrors" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<GreetingWithErrorsResponse xmlns=\"https://example.com/\">\n\
         \    <GreetingWithErrorsResult>\n\
         \        <greeting>Hello</greeting>\n\
         \    </GreetingWithErrorsResult>\n\
          </GreetingWithErrorsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "text/xml") ]
    ();
  let response = GreetingWithErrors.request ctx () in
  match response with
  | Ok result ->
      let expected = ({ greeting = Some "Hello" } : Types.greeting_with_errors_output) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_greeting_with_errors_output
           Types.equal_greeting_with_errors_output)
        "expected output" expected result
  | Error error -> failwith (GreetingWithErrors.error_to_string error)

let query_complex_error () =
  Eio.Switch.run ~name:"QueryComplexError" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<ErrorResponse>\n\
         \   <Error>\n\
         \      <Type>Sender</Type>\n\
         \      <Code>ComplexError</Code>\n\
         \      <TopLevel>Top level</TopLevel>\n\
         \      <Nested>\n\
         \          <Foo>bar</Foo>\n\
         \      </Nested>\n\
         \   </Error>\n\
         \   <RequestId>foo-id</RequestId>\n\
          </ErrorResponse>\n")
    ~status:400
    ~headers:[ ("Content-Type", "text/xml") ]
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

let query_customized_error () =
  Eio.Switch.run ~name:"QueryCustomizedError" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<ErrorResponse>\n\
         \   <Error>\n\
         \      <Type>Sender</Type>\n\
         \      <Code>Customized</Code>\n\
         \      <Message>Hi</Message>\n\
         \   </Error>\n\
         \   <RequestId>foo-id</RequestId>\n\
          </ErrorResponse>\n")
    ~status:402
    ~headers:[ ("Content-Type", "text/xml") ]
    ();
  let response = GreetingWithErrors.request ctx () in
  match response with
  | Error (`CustomCodeError e) ->
      let expected = ({ message = Some "Hi" } : Types.custom_code_error) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_custom_code_error Types.equal_custom_code_error)
        "expected error" expected e
  | Error other -> failwith (GreetingWithErrors.error_to_string other)
  | Ok _ -> failwith "expected an error response, got Ok"

let query_invalid_greeting_error () =
  Eio.Switch.run ~name:"QueryInvalidGreetingError" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<ErrorResponse>\n\
         \   <Error>\n\
         \      <Type>Sender</Type>\n\
         \      <Code>InvalidGreeting</Code>\n\
         \      <Message>Hi</Message>\n\
         \   </Error>\n\
         \   <RequestId>foo-id</RequestId>\n\
          </ErrorResponse>\n")
    ~status:400
    ~headers:[ ("Content-Type", "text/xml") ]
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
  ( "aws.protocoltests.query#GreetingWithErrors",
    [
      ("QueryGreetingWithErrors", `Quick, query_greeting_with_errors);
      ("QueryComplexError", `Quick, query_complex_error);
      ("QueryCustomizedError", `Quick, query_customized_error);
      ("QueryInvalidGreetingError", `Quick, query_invalid_greeting_error);
    ] )

let query_host_with_path () =
  Eio.Switch.run ~name:"QueryHostWithPath" @@ fun sw ->
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
  Mock.mock_response ~status:200 ~headers:[] ();
  let _response = HostWithPathOperation.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_form_testable "expected request body value"
      (Some "Action=HostWithPathOperation&Version=2020-01-08")
      (request.body
      |> Option.map (function
        | `Form x -> Uri.encoded_of_query x
        | `String x -> x
        | `Compressed (x, _) -> x
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/custom/") request.uri
  in
  let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
  ()

let host_with_path_operation_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.query#HostWithPathOperation",
    [ ("QueryHostWithPath", `Quick, query_host_with_path) ] )

let query_ignores_wrapping_xml_name () =
  Eio.Switch.run ~name:"QueryIgnoresWrappingXmlName" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<IgnoresWrappingXmlNameResponse xmlns=\"https://example.com/\">\n\
         \    <IgnoresWrappingXmlNameResult>\n\
         \        <foo>bar</foo>\n\
         \    </IgnoresWrappingXmlNameResult>\n\
          </IgnoresWrappingXmlNameResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "text/xml") ]
    ();
  let response = IgnoresWrappingXmlName.request ctx () in
  match response with
  | Ok result ->
      let expected = ({ foo = Some "bar" } : Types.ignores_wrapping_xml_name_output) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_ignores_wrapping_xml_name_output
           Types.equal_ignores_wrapping_xml_name_output)
        "expected output" expected result
  | Error error -> failwith (IgnoresWrappingXmlName.error_to_string error)

let ignores_wrapping_xml_name_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.query#IgnoresWrappingXmlName",
    [ ("QueryIgnoresWrappingXmlName", `Quick, query_ignores_wrapping_xml_name) ] )

let nested_structures () =
  Eio.Switch.run ~name:"NestedStructures" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.nested_structures_input =
    {
      nested =
        Some
          {
            recursive_arg = Some { recursive_arg = None; other_arg = None; string_arg = Some "baz" };
            other_arg = Some true;
            string_arg = Some "foo";
          };
    }
  in
  Mock.mock_response ~status:200 ~headers:[] ();
  let _response = NestedStructures.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_form_testable "expected request body value"
      (Some
         "Action=NestedStructures&Version=2020-01-08&Nested.StringArg=foo&Nested.OtherArg=true&Nested.RecursiveArg.StringArg=baz")
      (request.body
      |> Option.map (function
        | `Form x -> Uri.encoded_of_query x
        | `String x -> x
        | `Compressed (x, _) -> x
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/x-www-form-urlencoded") ]
      request.headers
  in
  ()

let nested_structures_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#NestedStructures", [ ("NestedStructures", `Quick, nested_structures) ])

let query_no_input_and_no_output () =
  Eio.Switch.run ~name:"QueryNoInputAndNoOutput" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Smaws_Lib.Smithy_api.Types.unit_ = () in
  Mock.mock_response ~status:200 ~headers:[] ();
  let _response = NoInputAndNoOutput.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_form_testable "expected request body value"
      (Some "Action=NoInputAndNoOutput&Version=2020-01-08")
      (request.body
      |> Option.map (function
        | `Form x -> Uri.encoded_of_query x
        | `String x -> x
        | `Compressed (x, _) -> x
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/x-www-form-urlencoded") ]
      request.headers
  in
  ()

let query_no_input_and_no_output () =
  Eio.Switch.run ~name:"QueryNoInputAndNoOutput" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:None ~status:200 ~headers:[] ();
  let response = NoInputAndNoOutput.request ctx () in
  match response with
  | Ok result ->
      let expected = () in
      check Alcotest.unit "expected output" expected result
  | Error error -> failwith (NoInputAndNoOutput.error_to_string error)

let query_no_input_and_no_output_with_response_metadata () =
  Eio.Switch.run ~name:"QueryNoInputAndNoOutputWithResponseMetadata" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<NoInputAndNoOutputResponse>\n\
         \    <ResponseMetadata>\n\
         \        <RequestId>abc-123</RequestId>\n\
         \    </ResponseMetadata>\n\
          </NoInputAndNoOutputResponse>\n")
    ~status:200 ~headers:[] ();
  let response = NoInputAndNoOutput.request ctx () in
  match response with
  | Ok result ->
      let expected = () in
      check Alcotest.unit "expected output" expected result
  | Error error -> failwith (NoInputAndNoOutput.error_to_string error)

let no_input_and_no_output_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.query#NoInputAndNoOutput",
    [
      ("QueryNoInputAndNoOutput", `Quick, query_no_input_and_no_output);
      ("QueryNoInputAndNoOutput", `Quick, query_no_input_and_no_output);
      ("QueryNoInputAndNoOutputWithResponseMetadata", `Quick, fun () -> Alcotest.skip ());
    ] )

let query_no_input_and_output () =
  Eio.Switch.run ~name:"QueryNoInputAndOutput" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.no_input_and_output_input = () in
  Mock.mock_response ~status:200 ~headers:[] ();
  let _response = NoInputAndOutput.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_form_testable "expected request body value"
      (Some "Action=NoInputAndOutput&Version=2020-01-08")
      (request.body
      |> Option.map (function
        | `Form x -> Uri.encoded_of_query x
        | `String x -> x
        | `Compressed (x, _) -> x
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/x-www-form-urlencoded") ]
      request.headers
  in
  ()

let query_no_input_and_output () =
  Eio.Switch.run ~name:"QueryNoInputAndOutput" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:None ~status:200 ~headers:[] ();
  let response = NoInputAndOutput.request ctx () in
  match response with
  | Ok result ->
      let expected = (() : Types.no_input_and_output_output) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_no_input_and_output_output
           Types.equal_no_input_and_output_output)
        "expected output" expected result
  | Error error -> failwith (NoInputAndOutput.error_to_string error)

let no_input_and_output_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.query#NoInputAndOutput",
    [
      ("QueryNoInputAndOutput", `Quick, query_no_input_and_output);
      ("QueryNoInputAndOutput", `Quick, query_no_input_and_output);
    ] )

let put_with_content_encoding_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#PutWithContentEncoding", [])

let query_protocol_idempotency_token_auto_fill_is_set () =
  Eio.Switch.run ~name:"QueryProtocolIdempotencyTokenAutoFillIsSet" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.query_idempotency_token_auto_fill_input =
    { token = Some "00000000-0000-4000-8000-000000000123" }
  in
  Mock.mock_response ~status:200 ~headers:[] ();
  let _response = QueryIdempotencyTokenAutoFill.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_form_testable "expected request body value"
      (Some
         "Action=QueryIdempotencyTokenAutoFill&Version=2020-01-08&token=00000000-0000-4000-8000-000000000123")
      (request.body
      |> Option.map (function
        | `Form x -> Uri.encoded_of_query x
        | `String x -> x
        | `Compressed (x, _) -> x
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/x-www-form-urlencoded") ]
      request.headers
  in
  ()

let query_idempotency_token_auto_fill_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.query#QueryIdempotencyTokenAutoFill",
    [
      ( "QueryProtocolIdempotencyTokenAutoFillIsSet",
        `Quick,
        query_protocol_idempotency_token_auto_fill_is_set );
    ] )

let query_lists () =
  Eio.Switch.run ~name:"QueryLists" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.query_lists_input =
    {
      nested_with_list = None;
      flattened_list_arg_with_xml_name = None;
      list_arg_with_xml_name_member = None;
      flattened_list_arg = None;
      complex_list_arg = Some [ { hi = Some "hello" }; { hi = Some "hola" } ];
      list_arg = Some [ "foo"; "bar"; "baz" ];
    }
  in
  Mock.mock_response ~status:200 ~headers:[] ();
  let _response = QueryLists.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_form_testable "expected request body value"
      (Some
         "Action=QueryLists&Version=2020-01-08&ListArg.member.1=foo&ListArg.member.2=bar&ListArg.member.3=baz&ComplexListArg.member.1.hi=hello&ComplexListArg.member.2.hi=hola")
      (request.body
      |> Option.map (function
        | `Form x -> Uri.encoded_of_query x
        | `String x -> x
        | `Compressed (x, _) -> x
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/x-www-form-urlencoded") ]
      request.headers
  in
  ()

let empty_query_lists () =
  Eio.Switch.run ~name:"EmptyQueryLists" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.query_lists_input =
    {
      nested_with_list = None;
      flattened_list_arg_with_xml_name = None;
      list_arg_with_xml_name_member = None;
      flattened_list_arg = None;
      complex_list_arg = None;
      list_arg = Some [];
    }
  in
  Mock.mock_response ~status:200 ~headers:[] ();
  let _response = QueryLists.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_form_testable "expected request body value"
      (Some "Action=QueryLists&Version=2020-01-08&ListArg=")
      (request.body
      |> Option.map (function
        | `Form x -> Uri.encoded_of_query x
        | `String x -> x
        | `Compressed (x, _) -> x
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/x-www-form-urlencoded") ]
      request.headers
  in
  ()

let flattened_query_lists () =
  Eio.Switch.run ~name:"FlattenedQueryLists" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.query_lists_input =
    {
      nested_with_list = None;
      flattened_list_arg_with_xml_name = None;
      list_arg_with_xml_name_member = None;
      flattened_list_arg = Some [ "A"; "B" ];
      complex_list_arg = None;
      list_arg = None;
    }
  in
  Mock.mock_response ~status:200 ~headers:[] ();
  let _response = QueryLists.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_form_testable "expected request body value"
      (Some "Action=QueryLists&Version=2020-01-08&FlattenedListArg.1=A&FlattenedListArg.2=B")
      (request.body
      |> Option.map (function
        | `Form x -> Uri.encoded_of_query x
        | `String x -> x
        | `Compressed (x, _) -> x
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/x-www-form-urlencoded") ]
      request.headers
  in
  ()

let query_list_arg_with_xml_name_member () =
  Eio.Switch.run ~name:"QueryListArgWithXmlNameMember" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.query_lists_input =
    {
      nested_with_list = None;
      flattened_list_arg_with_xml_name = None;
      list_arg_with_xml_name_member = Some [ "A"; "B" ];
      flattened_list_arg = None;
      complex_list_arg = None;
      list_arg = None;
    }
  in
  Mock.mock_response ~status:200 ~headers:[] ();
  let _response = QueryLists.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_form_testable "expected request body value"
      (Some
         "Action=QueryLists&Version=2020-01-08&ListArgWithXmlNameMember.item.1=A&ListArgWithXmlNameMember.item.2=B")
      (request.body
      |> Option.map (function
        | `Form x -> Uri.encoded_of_query x
        | `String x -> x
        | `Compressed (x, _) -> x
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/x-www-form-urlencoded") ]
      request.headers
  in
  ()

let query_flattened_list_arg_with_xml_name () =
  Eio.Switch.run ~name:"QueryFlattenedListArgWithXmlName" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.query_lists_input =
    {
      nested_with_list = None;
      flattened_list_arg_with_xml_name = Some [ "A"; "B" ];
      list_arg_with_xml_name_member = None;
      flattened_list_arg = None;
      complex_list_arg = None;
      list_arg = None;
    }
  in
  Mock.mock_response ~status:200 ~headers:[] ();
  let _response = QueryLists.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_form_testable "expected request body value"
      (Some "Action=QueryLists&Version=2020-01-08&Hi.1=A&Hi.2=B")
      (request.body
      |> Option.map (function
        | `Form x -> Uri.encoded_of_query x
        | `String x -> x
        | `Compressed (x, _) -> x
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/x-www-form-urlencoded") ]
      request.headers
  in
  ()

let query_nested_struct_with_list () =
  Eio.Switch.run ~name:"QueryNestedStructWithList" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.query_lists_input =
    {
      nested_with_list = Some { list_arg = Some [ "A"; "B" ] };
      flattened_list_arg_with_xml_name = None;
      list_arg_with_xml_name_member = None;
      flattened_list_arg = None;
      complex_list_arg = None;
      list_arg = None;
    }
  in
  Mock.mock_response ~status:200 ~headers:[] ();
  let _response = QueryLists.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_form_testable "expected request body value"
      (Some
         "Action=QueryLists&Version=2020-01-08&NestedWithList.ListArg.member.1=A&NestedWithList.ListArg.member.2=B")
      (request.body
      |> Option.map (function
        | `Form x -> Uri.encoded_of_query x
        | `String x -> x
        | `Compressed (x, _) -> x
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/x-www-form-urlencoded") ]
      request.headers
  in
  ()

let query_lists_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.query#QueryLists",
    [
      ("QueryLists", `Quick, query_lists);
      ("EmptyQueryLists", `Quick, empty_query_lists);
      ("FlattenedQueryLists", `Quick, flattened_query_lists);
      ("QueryListArgWithXmlNameMember", `Quick, query_list_arg_with_xml_name_member);
      ("QueryFlattenedListArgWithXmlName", `Quick, query_flattened_list_arg_with_xml_name);
      ("QueryNestedStructWithList", `Quick, query_nested_struct_with_list);
    ] )

let query_simple_query_maps () =
  Eio.Switch.run ~name:"QuerySimpleQueryMaps" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
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
      map_arg = Some [ ("bar", "Bar"); ("foo", "Foo") ];
    }
  in
  Mock.mock_response ~status:200 ~headers:[] ();
  let _response = QueryMaps.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_form_testable "expected request body value"
      (Some
         "Action=QueryMaps&Version=2020-01-08&MapArg.entry.1.key=bar&MapArg.entry.1.value=Bar&MapArg.entry.2.key=foo&MapArg.entry.2.value=Foo")
      (request.body
      |> Option.map (function
        | `Form x -> Uri.encoded_of_query x
        | `String x -> x
        | `Compressed (x, _) -> x
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/x-www-form-urlencoded") ]
      request.headers
  in
  ()

let query_simple_query_maps_with_xml_name () =
  Eio.Switch.run ~name:"QuerySimpleQueryMapsWithXmlName" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
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
      renamed_map_arg = Some [ ("foo", "Foo") ];
      map_arg = None;
    }
  in
  Mock.mock_response ~status:200 ~headers:[] ();
  let _response = QueryMaps.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_form_testable "expected request body value"
      (Some "Action=QueryMaps&Version=2020-01-08&Foo.entry.1.key=foo&Foo.entry.1.value=Foo")
      (request.body
      |> Option.map (function
        | `Form x -> Uri.encoded_of_query x
        | `String x -> x
        | `Compressed (x, _) -> x
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/x-www-form-urlencoded") ]
      request.headers
  in
  ()

let query_complex_query_maps () =
  Eio.Switch.run ~name:"QueryComplexQueryMaps" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.query_maps_input =
    {
      nested_struct_with_map = None;
      map_of_lists = None;
      flattened_map_with_xml_name = None;
      flattened_map = None;
      map_with_xml_member_name = None;
      complex_map_arg = Some [ ("bar", { hi = Some "Bar" }); ("foo", { hi = Some "Foo" }) ];
      renamed_map_arg = None;
      map_arg = None;
    }
  in
  Mock.mock_response ~status:200 ~headers:[] ();
  let _response = QueryMaps.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_form_testable "expected request body value"
      (Some
         "Action=QueryMaps&Version=2020-01-08&ComplexMapArg.entry.1.key=bar&ComplexMapArg.entry.1.value.hi=Bar&ComplexMapArg.entry.2.key=foo&ComplexMapArg.entry.2.value.hi=Foo")
      (request.body
      |> Option.map (function
        | `Form x -> Uri.encoded_of_query x
        | `String x -> x
        | `Compressed (x, _) -> x
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/x-www-form-urlencoded") ]
      request.headers
  in
  ()

let query_empty_query_maps () =
  Eio.Switch.run ~name:"QueryEmptyQueryMaps" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
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
      map_arg = Some [];
    }
  in
  Mock.mock_response ~status:200 ~headers:[] ();
  let _response = QueryMaps.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_form_testable "expected request body value"
      (Some "Action=QueryMaps&Version=2020-01-08")
      (request.body
      |> Option.map (function
        | `Form x -> Uri.encoded_of_query x
        | `String x -> x
        | `Compressed (x, _) -> x
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/x-www-form-urlencoded") ]
      request.headers
  in
  ()

let query_query_map_with_member_xml_name () =
  Eio.Switch.run ~name:"QueryQueryMapWithMemberXmlName" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.query_maps_input =
    {
      nested_struct_with_map = None;
      map_of_lists = None;
      flattened_map_with_xml_name = None;
      flattened_map = None;
      map_with_xml_member_name = Some [ ("bar", "Bar"); ("foo", "Foo") ];
      complex_map_arg = None;
      renamed_map_arg = None;
      map_arg = None;
    }
  in
  Mock.mock_response ~status:200 ~headers:[] ();
  let _response = QueryMaps.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_form_testable "expected request body value"
      (Some
         "Action=QueryMaps&Version=2020-01-08&MapWithXmlMemberName.entry.1.K=bar&MapWithXmlMemberName.entry.1.V=Bar&MapWithXmlMemberName.entry.2.K=foo&MapWithXmlMemberName.entry.2.V=Foo")
      (request.body
      |> Option.map (function
        | `Form x -> Uri.encoded_of_query x
        | `String x -> x
        | `Compressed (x, _) -> x
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/x-www-form-urlencoded") ]
      request.headers
  in
  ()

let query_flattened_query_maps () =
  Eio.Switch.run ~name:"QueryFlattenedQueryMaps" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.query_maps_input =
    {
      nested_struct_with_map = None;
      map_of_lists = None;
      flattened_map_with_xml_name = None;
      flattened_map = Some [ ("bar", "Bar"); ("foo", "Foo") ];
      map_with_xml_member_name = None;
      complex_map_arg = None;
      renamed_map_arg = None;
      map_arg = None;
    }
  in
  Mock.mock_response ~status:200 ~headers:[] ();
  let _response = QueryMaps.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_form_testable "expected request body value"
      (Some
         "Action=QueryMaps&Version=2020-01-08&FlattenedMap.1.key=bar&FlattenedMap.1.value=Bar&FlattenedMap.2.key=foo&FlattenedMap.2.value=Foo")
      (request.body
      |> Option.map (function
        | `Form x -> Uri.encoded_of_query x
        | `String x -> x
        | `Compressed (x, _) -> x
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/x-www-form-urlencoded") ]
      request.headers
  in
  ()

let query_flattened_query_maps_with_xml_name () =
  Eio.Switch.run ~name:"QueryFlattenedQueryMapsWithXmlName" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.query_maps_input =
    {
      nested_struct_with_map = None;
      map_of_lists = None;
      flattened_map_with_xml_name = Some [ ("bar", "Bar"); ("foo", "Foo") ];
      flattened_map = None;
      map_with_xml_member_name = None;
      complex_map_arg = None;
      renamed_map_arg = None;
      map_arg = None;
    }
  in
  Mock.mock_response ~status:200 ~headers:[] ();
  let _response = QueryMaps.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_form_testable "expected request body value"
      (Some "Action=QueryMaps&Version=2020-01-08&Hi.1.K=bar&Hi.1.V=Bar&Hi.2.K=foo&Hi.2.V=Foo")
      (request.body
      |> Option.map (function
        | `Form x -> Uri.encoded_of_query x
        | `String x -> x
        | `Compressed (x, _) -> x
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/x-www-form-urlencoded") ]
      request.headers
  in
  ()

let query_query_map_of_lists () =
  Eio.Switch.run ~name:"QueryQueryMapOfLists" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.query_maps_input =
    {
      nested_struct_with_map = None;
      map_of_lists = Some [ ("bar", [ "C"; "D" ]); ("foo", [ "A"; "B" ]) ];
      flattened_map_with_xml_name = None;
      flattened_map = None;
      map_with_xml_member_name = None;
      complex_map_arg = None;
      renamed_map_arg = None;
      map_arg = None;
    }
  in
  Mock.mock_response ~status:200 ~headers:[] ();
  let _response = QueryMaps.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_form_testable "expected request body value"
      (Some
         "Action=QueryMaps&Version=2020-01-08&MapOfLists.entry.1.key=bar&MapOfLists.entry.1.value.member.1=C&MapOfLists.entry.1.value.member.2=D&MapOfLists.entry.2.key=foo&MapOfLists.entry.2.value.member.1=A&MapOfLists.entry.2.value.member.2=B")
      (request.body
      |> Option.map (function
        | `Form x -> Uri.encoded_of_query x
        | `String x -> x
        | `Compressed (x, _) -> x
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/x-www-form-urlencoded") ]
      request.headers
  in
  ()

let query_nested_struct_with_map () =
  Eio.Switch.run ~name:"QueryNestedStructWithMap" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.query_maps_input =
    {
      nested_struct_with_map = Some { map_arg = Some [ ("bar", "Bar"); ("foo", "Foo") ] };
      map_of_lists = None;
      flattened_map_with_xml_name = None;
      flattened_map = None;
      map_with_xml_member_name = None;
      complex_map_arg = None;
      renamed_map_arg = None;
      map_arg = None;
    }
  in
  Mock.mock_response ~status:200 ~headers:[] ();
  let _response = QueryMaps.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_form_testable "expected request body value"
      (Some
         "Action=QueryMaps&Version=2020-01-08&NestedStructWithMap.MapArg.entry.1.key=bar&NestedStructWithMap.MapArg.entry.1.value=Bar&NestedStructWithMap.MapArg.entry.2.key=foo&NestedStructWithMap.MapArg.entry.2.value=Foo")
      (request.body
      |> Option.map (function
        | `Form x -> Uri.encoded_of_query x
        | `String x -> x
        | `Compressed (x, _) -> x
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/x-www-form-urlencoded") ]
      request.headers
  in
  ()

let query_maps_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.query#QueryMaps",
    [
      ("QuerySimpleQueryMaps", `Quick, query_simple_query_maps);
      ("QuerySimpleQueryMapsWithXmlName", `Quick, query_simple_query_maps_with_xml_name);
      ("QueryComplexQueryMaps", `Quick, query_complex_query_maps);
      ("QueryEmptyQueryMaps", `Quick, query_empty_query_maps);
      ("QueryQueryMapWithMemberXmlName", `Quick, query_query_map_with_member_xml_name);
      ("QueryFlattenedQueryMaps", `Quick, query_flattened_query_maps);
      ("QueryFlattenedQueryMapsWithXmlName", `Quick, query_flattened_query_maps_with_xml_name);
      ("QueryQueryMapOfLists", `Quick, query_query_map_of_lists);
      ("QueryNestedStructWithMap", `Quick, query_nested_struct_with_map);
    ] )

let query_timestamps_input () =
  Eio.Switch.run ~name:"QueryTimestampsInput" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.query_timestamps_input =
    {
      epoch_target = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1422172800.));
      epoch_member = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1422172800.));
      normal_format = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1422172800.));
    }
  in
  Mock.mock_response ~status:200 ~headers:[] ();
  let _response = QueryTimestamps.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_form_testable "expected request body value"
      (Some
         "Action=QueryTimestamps&Version=2020-01-08&normalFormat=2015-01-25T08%3A00%3A00Z&epochMember=1422172800&epochTarget=1422172800")
      (request.body
      |> Option.map (function
        | `Form x -> Uri.encoded_of_query x
        | `String x -> x
        | `Compressed (x, _) -> x
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/x-www-form-urlencoded") ]
      request.headers
  in
  ()

let query_timestamps_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.query#QueryTimestamps",
    [ ("QueryTimestampsInput", `Quick, query_timestamps_input) ] )

let query_recursive_shapes () =
  Eio.Switch.run ~name:"QueryRecursiveShapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<RecursiveXmlShapesResponse xmlns=\"https://example.com/\">\n\
         \    <RecursiveXmlShapesResult>\n\
         \        <nested>\n\
         \            <foo>Foo1</foo>\n\
         \            <nested>\n\
         \                <bar>Bar1</bar>\n\
         \                <recursiveMember>\n\
         \                    <foo>Foo2</foo>\n\
         \                    <nested>\n\
         \                        <bar>Bar2</bar>\n\
         \                    </nested>\n\
         \                </recursiveMember>\n\
         \            </nested>\n\
         \        </nested>\n\
         \    </RecursiveXmlShapesResult>\n\
          </RecursiveXmlShapesResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "text/xml") ]
    ();
  let response = RecursiveXmlShapes.request ctx () in
  match response with
  | Ok result ->
      let expected =
        ({
           nested =
             Some
               {
                 nested =
                   Some
                     {
                       recursive_member =
                         Some
                           {
                             nested = Some { recursive_member = None; bar = Some "Bar2" };
                             foo = Some "Foo2";
                           };
                       bar = Some "Bar1";
                     };
                 foo = Some "Foo1";
               };
         }
          : Types.recursive_xml_shapes_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_recursive_xml_shapes_output
           Types.equal_recursive_xml_shapes_output)
        "expected output" expected result
  | Error error -> failwith (RecursiveXmlShapes.error_to_string error)

let recursive_xml_shapes_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.query#RecursiveXmlShapes",
    [ ("QueryRecursiveShapes", `Quick, query_recursive_shapes) ] )

let query_simple_input_params_strings () =
  Eio.Switch.run ~name:"QuerySimpleInputParamsStrings" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
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
      bar = Some "val2";
      foo = Some "val1";
    }
  in
  Mock.mock_response ~status:200 ~headers:[] ();
  let _response = SimpleInputParams.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_form_testable "expected request body value"
      (Some "Action=SimpleInputParams&Version=2020-01-08&Foo=val1&Bar=val2")
      (request.body
      |> Option.map (function
        | `Form x -> Uri.encoded_of_query x
        | `String x -> x
        | `Compressed (x, _) -> x
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/x-www-form-urlencoded") ]
      request.headers
  in
  ()

let query_simple_input_params_string_and_boolean_true () =
  Eio.Switch.run ~name:"QuerySimpleInputParamsStringAndBooleanTrue" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
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
      baz = Some true;
      bar = None;
      foo = Some "val1";
    }
  in
  Mock.mock_response ~status:200 ~headers:[] ();
  let _response = SimpleInputParams.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_form_testable "expected request body value"
      (Some "Action=SimpleInputParams&Version=2020-01-08&Foo=val1&Baz=true")
      (request.body
      |> Option.map (function
        | `Form x -> Uri.encoded_of_query x
        | `String x -> x
        | `Compressed (x, _) -> x
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/x-www-form-urlencoded") ]
      request.headers
  in
  ()

let query_simple_input_params_strings_and_boolean_false () =
  Eio.Switch.run ~name:"QuerySimpleInputParamsStringsAndBooleanFalse" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
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
      baz = Some false;
      bar = None;
      foo = None;
    }
  in
  Mock.mock_response ~status:200 ~headers:[] ();
  let _response = SimpleInputParams.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_form_testable "expected request body value"
      (Some "Action=SimpleInputParams&Version=2020-01-08&Baz=false")
      (request.body
      |> Option.map (function
        | `Form x -> Uri.encoded_of_query x
        | `String x -> x
        | `Compressed (x, _) -> x
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/x-www-form-urlencoded") ]
      request.headers
  in
  ()

let query_simple_input_params_integer () =
  Eio.Switch.run ~name:"QuerySimpleInputParamsInteger" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.simple_input_params_input =
    {
      integer_enum = None;
      foo_enum = None;
      qux = None;
      boo = None;
      float_value = None;
      bam = Some 10;
      baz = None;
      bar = None;
      foo = None;
    }
  in
  Mock.mock_response ~status:200 ~headers:[] ();
  let _response = SimpleInputParams.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_form_testable "expected request body value"
      (Some "Action=SimpleInputParams&Version=2020-01-08&Bam=10")
      (request.body
      |> Option.map (function
        | `Form x -> Uri.encoded_of_query x
        | `String x -> x
        | `Compressed (x, _) -> x
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/x-www-form-urlencoded") ]
      request.headers
  in
  ()

let query_simple_input_params_float () =
  Eio.Switch.run ~name:"QuerySimpleInputParamsFloat" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.simple_input_params_input =
    {
      integer_enum = None;
      foo_enum = None;
      qux = None;
      boo = Some 10.8;
      float_value = None;
      bam = None;
      baz = None;
      bar = None;
      foo = None;
    }
  in
  Mock.mock_response ~status:200 ~headers:[] ();
  let _response = SimpleInputParams.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_form_testable "expected request body value"
      (Some "Action=SimpleInputParams&Version=2020-01-08&Boo=10.8")
      (request.body
      |> Option.map (function
        | `Form x -> Uri.encoded_of_query x
        | `String x -> x
        | `Compressed (x, _) -> x
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/x-www-form-urlencoded") ]
      request.headers
  in
  ()

let query_simple_input_params_blob () =
  Eio.Switch.run ~name:"QuerySimpleInputParamsBlob" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.simple_input_params_input =
    {
      integer_enum = None;
      foo_enum = None;
      qux = Some (Smaws_Lib.CoreTypes.Blob.of_string "value");
      boo = None;
      float_value = None;
      bam = None;
      baz = None;
      bar = None;
      foo = None;
    }
  in
  Mock.mock_response ~status:200 ~headers:[] ();
  let _response = SimpleInputParams.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_form_testable "expected request body value"
      (Some "Action=SimpleInputParams&Version=2020-01-08&Qux=dmFsdWU%3D")
      (request.body
      |> Option.map (function
        | `Form x -> Uri.encoded_of_query x
        | `String x -> x
        | `Compressed (x, _) -> x
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/x-www-form-urlencoded") ]
      request.headers
  in
  ()

let query_enums () =
  Eio.Switch.run ~name:"QueryEnums" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.simple_input_params_input =
    {
      integer_enum = None;
      foo_enum = Some FOO;
      qux = None;
      boo = None;
      float_value = None;
      bam = None;
      baz = None;
      bar = None;
      foo = None;
    }
  in
  Mock.mock_response ~status:200 ~headers:[] ();
  let _response = SimpleInputParams.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_form_testable "expected request body value"
      (Some "Action=SimpleInputParams&Version=2020-01-08&FooEnum=Foo")
      (request.body
      |> Option.map (function
        | `Form x -> Uri.encoded_of_query x
        | `String x -> x
        | `Compressed (x, _) -> x
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/x-www-form-urlencoded") ]
      request.headers
  in
  ()

let query_int_enums () =
  Eio.Switch.run ~name:"QueryIntEnums" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.simple_input_params_input =
    {
      integer_enum = Some A;
      foo_enum = None;
      qux = None;
      boo = None;
      float_value = None;
      bam = None;
      baz = None;
      bar = None;
      foo = None;
    }
  in
  Mock.mock_response ~status:200 ~headers:[] ();
  let _response = SimpleInputParams.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_form_testable "expected request body value"
      (Some "Action=SimpleInputParams&Version=2020-01-08&IntegerEnum=1")
      (request.body
      |> Option.map (function
        | `Form x -> Uri.encoded_of_query x
        | `String x -> x
        | `Compressed (x, _) -> x
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/x-www-form-urlencoded") ]
      request.headers
  in
  ()

let aws_query_supports_na_n_float_inputs () =
  Eio.Switch.run ~name:"AwsQuerySupportsNaNFloatInputs" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.simple_input_params_input =
    {
      integer_enum = None;
      foo_enum = None;
      qux = None;
      boo = Some Float.nan;
      float_value = Some Float.nan;
      bam = None;
      baz = None;
      bar = None;
      foo = None;
    }
  in
  Mock.mock_response ~status:200 ~headers:[] ();
  let _response = SimpleInputParams.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_form_testable "expected request body value"
      (Some "Action=SimpleInputParams&Version=2020-01-08&FloatValue=NaN&Boo=NaN")
      (request.body
      |> Option.map (function
        | `Form x -> Uri.encoded_of_query x
        | `String x -> x
        | `Compressed (x, _) -> x
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/x-www-form-urlencoded") ]
      request.headers
  in
  ()

let aws_query_supports_infinity_float_inputs () =
  Eio.Switch.run ~name:"AwsQuerySupportsInfinityFloatInputs" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.simple_input_params_input =
    {
      integer_enum = None;
      foo_enum = None;
      qux = None;
      boo = Some Float.infinity;
      float_value = Some Float.infinity;
      bam = None;
      baz = None;
      bar = None;
      foo = None;
    }
  in
  Mock.mock_response ~status:200 ~headers:[] ();
  let _response = SimpleInputParams.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_form_testable "expected request body value"
      (Some "Action=SimpleInputParams&Version=2020-01-08&FloatValue=Infinity&Boo=Infinity")
      (request.body
      |> Option.map (function
        | `Form x -> Uri.encoded_of_query x
        | `String x -> x
        | `Compressed (x, _) -> x
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/x-www-form-urlencoded") ]
      request.headers
  in
  ()

let aws_query_supports_negative_infinity_float_inputs () =
  Eio.Switch.run ~name:"AwsQuerySupportsNegativeInfinityFloatInputs" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.simple_input_params_input =
    {
      integer_enum = None;
      foo_enum = None;
      qux = None;
      boo = Some Float.neg_infinity;
      float_value = Some Float.neg_infinity;
      bam = None;
      baz = None;
      bar = None;
      foo = None;
    }
  in
  Mock.mock_response ~status:200 ~headers:[] ();
  let _response = SimpleInputParams.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_form_testable "expected request body value"
      (Some "Action=SimpleInputParams&Version=2020-01-08&FloatValue=-Infinity&Boo=-Infinity")
      (request.body
      |> Option.map (function
        | `Form x -> Uri.encoded_of_query x
        | `String x -> x
        | `Compressed (x, _) -> x
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/") request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/x-www-form-urlencoded") ]
      request.headers
  in
  ()

let simple_input_params_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.query#SimpleInputParams",
    [
      ("QuerySimpleInputParamsStrings", `Quick, query_simple_input_params_strings);
      ( "QuerySimpleInputParamsStringAndBooleanTrue",
        `Quick,
        query_simple_input_params_string_and_boolean_true );
      ( "QuerySimpleInputParamsStringsAndBooleanFalse",
        `Quick,
        query_simple_input_params_strings_and_boolean_false );
      ("QuerySimpleInputParamsInteger", `Quick, query_simple_input_params_integer);
      ("QuerySimpleInputParamsFloat", `Quick, query_simple_input_params_float);
      ("QuerySimpleInputParamsBlob", `Quick, query_simple_input_params_blob);
      ("QueryEnums", `Quick, query_enums);
      ("QueryIntEnums", `Quick, query_int_enums);
      ("AwsQuerySupportsNaNFloatInputs", `Quick, aws_query_supports_na_n_float_inputs);
      ("AwsQuerySupportsInfinityFloatInputs", `Quick, aws_query_supports_infinity_float_inputs);
      ( "AwsQuerySupportsNegativeInfinityFloatInputs",
        `Quick,
        aws_query_supports_negative_infinity_float_inputs );
    ] )

let query_simple_scalar_properties () =
  Eio.Switch.run ~name:"QuerySimpleScalarProperties" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<SimpleScalarXmlPropertiesResponse xmlns=\"https://example.com/\">\n\
         \    <SimpleScalarXmlPropertiesResult>\n\
         \        <stringValue>string</stringValue>\n\
         \        <emptyStringValue/>\n\
         \        <trueBooleanValue>true</trueBooleanValue>\n\
         \        <falseBooleanValue>false</falseBooleanValue>\n\
         \        <byteValue>1</byteValue>\n\
         \        <shortValue>2</shortValue>\n\
         \        <integerValue>3</integerValue>\n\
         \        <longValue>4</longValue>\n\
         \        <floatValue>5.5</floatValue>\n\
         \        <DoubleDribble>6.5</DoubleDribble>\n\
         \    </SimpleScalarXmlPropertiesResult>\n\
          </SimpleScalarXmlPropertiesResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "text/xml") ]
    ();
  let response = SimpleScalarXmlProperties.request ctx () in
  match response with
  | Ok result ->
      let expected =
        ({
           double_value = Some 6.5;
           float_value = Some 5.5;
           long_value = Some 4;
           integer_value = Some 3;
           short_value = Some 2;
           byte_value = Some 1;
           false_boolean_value = Some false;
           true_boolean_value = Some true;
           empty_string_value = Some "";
           string_value = Some "string";
         }
          : Types.simple_scalar_xml_properties_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_simple_scalar_xml_properties_output
           Types.equal_simple_scalar_xml_properties_output)
        "expected output" expected result
  | Error error -> failwith (SimpleScalarXmlProperties.error_to_string error)

let aws_query_supports_na_n_float_outputs () =
  Eio.Switch.run ~name:"AwsQuerySupportsNaNFloatOutputs" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<SimpleScalarXmlPropertiesResponse xmlns=\"https://example.com/\">\n\
         \    <SimpleScalarXmlPropertiesResult>\n\
         \        <floatValue>NaN</floatValue>\n\
         \        <DoubleDribble>NaN</DoubleDribble>\n\
         \    </SimpleScalarXmlPropertiesResult>\n\
          </SimpleScalarXmlPropertiesResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "text/xml") ]
    ();
  let response = SimpleScalarXmlProperties.request ctx () in
  match response with
  | Ok result ->
      let expected =
        ({
           double_value = Some Float.nan;
           float_value = Some Float.nan;
           long_value = None;
           integer_value = None;
           short_value = None;
           byte_value = None;
           false_boolean_value = None;
           true_boolean_value = None;
           empty_string_value = None;
           string_value = None;
         }
          : Types.simple_scalar_xml_properties_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_simple_scalar_xml_properties_output
           Types.equal_simple_scalar_xml_properties_output)
        "expected output" expected result
  | Error error -> failwith (SimpleScalarXmlProperties.error_to_string error)

let aws_query_supports_infinity_float_outputs () =
  Eio.Switch.run ~name:"AwsQuerySupportsInfinityFloatOutputs" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<SimpleScalarXmlPropertiesResponse xmlns=\"https://example.com/\">\n\
         \    <SimpleScalarXmlPropertiesResult>\n\
         \        <floatValue>Infinity</floatValue>\n\
         \        <DoubleDribble>Infinity</DoubleDribble>\n\
         \    </SimpleScalarXmlPropertiesResult>\n\
          </SimpleScalarXmlPropertiesResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "text/xml") ]
    ();
  let response = SimpleScalarXmlProperties.request ctx () in
  match response with
  | Ok result ->
      let expected =
        ({
           double_value = Some Float.infinity;
           float_value = Some Float.infinity;
           long_value = None;
           integer_value = None;
           short_value = None;
           byte_value = None;
           false_boolean_value = None;
           true_boolean_value = None;
           empty_string_value = None;
           string_value = None;
         }
          : Types.simple_scalar_xml_properties_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_simple_scalar_xml_properties_output
           Types.equal_simple_scalar_xml_properties_output)
        "expected output" expected result
  | Error error -> failwith (SimpleScalarXmlProperties.error_to_string error)

let aws_query_supports_negative_infinity_float_outputs () =
  Eio.Switch.run ~name:"AwsQuerySupportsNegativeInfinityFloatOutputs" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<SimpleScalarXmlPropertiesResponse xmlns=\"https://example.com/\">\n\
         \    <SimpleScalarXmlPropertiesResult>\n\
         \        <floatValue>-Infinity</floatValue>\n\
         \        <DoubleDribble>-Infinity</DoubleDribble>\n\
         \    </SimpleScalarXmlPropertiesResult>\n\
          </SimpleScalarXmlPropertiesResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "text/xml") ]
    ();
  let response = SimpleScalarXmlProperties.request ctx () in
  match response with
  | Ok result ->
      let expected =
        ({
           double_value = Some Float.neg_infinity;
           float_value = Some Float.neg_infinity;
           long_value = None;
           integer_value = None;
           short_value = None;
           byte_value = None;
           false_boolean_value = None;
           true_boolean_value = None;
           empty_string_value = None;
           string_value = None;
         }
          : Types.simple_scalar_xml_properties_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_simple_scalar_xml_properties_output
           Types.equal_simple_scalar_xml_properties_output)
        "expected output" expected result
  | Error error -> failwith (SimpleScalarXmlProperties.error_to_string error)

let simple_scalar_xml_properties_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.query#SimpleScalarXmlProperties",
    [
      ("QuerySimpleScalarProperties", `Quick, query_simple_scalar_properties);
      ("AwsQuerySupportsNaNFloatOutputs", `Quick, aws_query_supports_na_n_float_outputs);
      ("AwsQuerySupportsInfinityFloatOutputs", `Quick, aws_query_supports_infinity_float_outputs);
      ( "AwsQuerySupportsNegativeInfinityFloatOutputs",
        `Quick,
        aws_query_supports_negative_infinity_float_outputs );
    ] )

let query_xml_blobs () =
  Eio.Switch.run ~name:"QueryXmlBlobs" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlBlobsResponse xmlns=\"https://example.com/\">\n\
         \    <XmlBlobsResult>\n\
         \        <data>dmFsdWU=</data>\n\
         \    </XmlBlobsResult>\n\
          </XmlBlobsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "text/xml") ]
    ();
  let response = XmlBlobs.request ctx () in
  match response with
  | Ok result ->
      let expected =
        ({ data = Some (Smaws_Lib.CoreTypes.Blob.of_string "value") } : Types.xml_blobs_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_blobs_output Types.equal_xml_blobs_output)
        "expected output" expected result
  | Error error -> failwith (XmlBlobs.error_to_string error)

let xml_blobs_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#XmlBlobs", [ ("QueryXmlBlobs", `Quick, query_xml_blobs) ])

let query_xml_empty_blobs () =
  Eio.Switch.run ~name:"QueryXmlEmptyBlobs" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlEmptyBlobsResponse xmlns=\"https://example.com/\">\n\
         \    <XmlEmptyBlobsResult>\n\
         \        <data></data>\n\
         \    </XmlEmptyBlobsResult>\n\
          </XmlEmptyBlobsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "text/xml") ]
    ();
  let response = XmlEmptyBlobs.request ctx () in
  match response with
  | Ok result ->
      let expected =
        ({ data = Some (Smaws_Lib.CoreTypes.Blob.of_string "") } : Types.xml_blobs_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_blobs_output Types.equal_xml_blobs_output)
        "expected output" expected result
  | Error error -> failwith (XmlEmptyBlobs.error_to_string error)

let query_xml_empty_self_closed_blobs () =
  Eio.Switch.run ~name:"QueryXmlEmptySelfClosedBlobs" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlEmptyBlobsResponse xmlns=\"https://example.com/\">\n\
         \    <XmlEmptyBlobsResult>\n\
         \        <data/>\n\
         \    </XmlEmptyBlobsResult>\n\
          </XmlEmptyBlobsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "text/xml") ]
    ();
  let response = XmlEmptyBlobs.request ctx () in
  match response with
  | Ok result ->
      let expected =
        ({ data = Some (Smaws_Lib.CoreTypes.Blob.of_string "") } : Types.xml_blobs_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_blobs_output Types.equal_xml_blobs_output)
        "expected output" expected result
  | Error error -> failwith (XmlEmptyBlobs.error_to_string error)

let xml_empty_blobs_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.query#XmlEmptyBlobs",
    [
      ("QueryXmlEmptyBlobs", `Quick, query_xml_empty_blobs);
      ("QueryXmlEmptySelfClosedBlobs", `Quick, query_xml_empty_self_closed_blobs);
    ] )

let query_xml_empty_lists () =
  Eio.Switch.run ~name:"QueryXmlEmptyLists" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlEmptyListsResponse xmlns=\"https://example.com/\">\n\
         \    <XmlEmptyListsResult>\n\
         \        <stringList/>\n\
         \        <stringSet></stringSet>\n\
         \    </XmlEmptyListsResult>\n\
          </XmlEmptyListsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "text/xml") ]
    ();
  let response = XmlEmptyLists.request ctx () in
  match response with
  | Ok result ->
      let expected =
        ({
           structure_list = None;
           flattened_list_with_namespace = None;
           flattened_list_with_member_namespace = None;
           flattened_list2 = None;
           flattened_list = None;
           renamed_list_members = None;
           nested_string_list = None;
           int_enum_list = None;
           enum_list = None;
           timestamp_list = None;
           boolean_list = None;
           integer_list = None;
           string_set = Some [];
           string_list = Some [];
         }
          : Types.xml_lists_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_lists_output Types.equal_xml_lists_output)
        "expected output" expected result
  | Error error -> failwith (XmlEmptyLists.error_to_string error)

let xml_empty_lists_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.query#XmlEmptyLists",
    [ ("QueryXmlEmptyLists", `Quick, query_xml_empty_lists) ] )

let query_xml_empty_maps () =
  Eio.Switch.run ~name:"QueryXmlEmptyMaps" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlEmptyMapsResponse xmlns=\"https://example.com/\">\n\
         \    <XmlEmptyMapsResult>\n\
         \        <myMap>\n\
         \        </myMap>\n\
         \    </XmlEmptyMapsResult>\n\
          </XmlEmptyMapsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "text/xml") ]
    ();
  let response = XmlEmptyMaps.request ctx () in
  match response with
  | Ok result ->
      let expected = ({ my_map = Some [] } : Types.xml_maps_output) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_maps_output Types.equal_xml_maps_output)
        "expected output" expected result
  | Error error -> failwith (XmlEmptyMaps.error_to_string error)

let query_xml_empty_self_closed_maps () =
  Eio.Switch.run ~name:"QueryXmlEmptySelfClosedMaps" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlEmptyMapsResponse xmlns=\"https://example.com/\">\n\
         \    <XmlEmptyMapsResult>\n\
         \        <myMap/>\n\
         \    </XmlEmptyMapsResult>\n\
          </XmlEmptyMapsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "text/xml") ]
    ();
  let response = XmlEmptyMaps.request ctx () in
  match response with
  | Ok result ->
      let expected = ({ my_map = Some [] } : Types.xml_maps_output) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_maps_output Types.equal_xml_maps_output)
        "expected output" expected result
  | Error error -> failwith (XmlEmptyMaps.error_to_string error)

let xml_empty_maps_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.query#XmlEmptyMaps",
    [
      ("QueryXmlEmptyMaps", `Quick, query_xml_empty_maps);
      ("QueryXmlEmptySelfClosedMaps", `Quick, query_xml_empty_self_closed_maps);
    ] )

let query_xml_enums () =
  Eio.Switch.run ~name:"QueryXmlEnums" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlEnumsResponse xmlns=\"https://example.com/\">\n\
         \    <XmlEnumsResult>\n\
         \        <fooEnum1>Foo</fooEnum1>\n\
         \        <fooEnum2>0</fooEnum2>\n\
         \        <fooEnum3>1</fooEnum3>\n\
         \        <fooEnumList>\n\
         \            <member>Foo</member>\n\
         \            <member>0</member>\n\
         \        </fooEnumList>\n\
         \        <fooEnumSet>\n\
         \            <member>Foo</member>\n\
         \            <member>0</member>\n\
         \        </fooEnumSet>\n\
         \        <fooEnumMap>\n\
         \            <entry>\n\
         \                <key>hi</key>\n\
         \                <value>Foo</value>\n\
         \            </entry>\n\
         \            <entry>\n\
         \                <key>zero</key>\n\
         \                <value>0</value>\n\
         \            </entry>\n\
         \        </fooEnumMap>\n\
         \    </XmlEnumsResult>\n\
          </XmlEnumsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "text/xml") ]
    ();
  let response = XmlEnums.request ctx () in
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
          : Types.xml_enums_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_enums_output Types.equal_xml_enums_output)
        "expected output" expected result
  | Error error -> failwith (XmlEnums.error_to_string error)

let xml_enums_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#XmlEnums", [ ("QueryXmlEnums", `Quick, query_xml_enums) ])

let query_xml_int_enums () =
  Eio.Switch.run ~name:"QueryXmlIntEnums" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlIntEnumsResponse xmlns=\"https://example.com/\">\n\
         \    <XmlIntEnumsResult>\n\
         \        <intEnum1>1</intEnum1>\n\
         \        <intEnum2>2</intEnum2>\n\
         \        <intEnum3>3</intEnum3>\n\
         \        <intEnumList>\n\
         \            <member>1</member>\n\
         \            <member>2</member>\n\
         \        </intEnumList>\n\
         \        <intEnumSet>\n\
         \            <member>1</member>\n\
         \            <member>2</member>\n\
         \        </intEnumSet>\n\
         \        <intEnumMap>\n\
         \            <entry>\n\
         \                <key>a</key>\n\
         \                <value>1</value>\n\
         \            </entry>\n\
         \            <entry>\n\
         \                <key>b</key>\n\
         \                <value>2</value>\n\
         \            </entry>\n\
         \        </intEnumMap>\n\
         \    </XmlIntEnumsResult>\n\
          </XmlIntEnumsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "text/xml") ]
    ();
  let response = XmlIntEnums.request ctx () in
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
          : Types.xml_int_enums_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_int_enums_output
           Types.equal_xml_int_enums_output)
        "expected output" expected result
  | Error error -> failwith (XmlIntEnums.error_to_string error)

let xml_int_enums_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#XmlIntEnums", [ ("QueryXmlIntEnums", `Quick, query_xml_int_enums) ])

let query_xml_lists () =
  Eio.Switch.run ~name:"QueryXmlLists" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlListsResponse xmlns=\"https://example.com/\">\n\
         \    <XmlListsResult>\n\
         \        <stringList>\n\
         \            <member>foo</member>\n\
         \            <member>bar</member>\n\
         \        </stringList>\n\
         \        <stringSet>\n\
         \            <member>foo</member>\n\
         \            <member>bar</member>\n\
         \        </stringSet>\n\
         \        <integerList>\n\
         \            <member>1</member>\n\
         \            <member>2</member>\n\
         \        </integerList>\n\
         \        <booleanList>\n\
         \            <member>true</member>\n\
         \            <member>false</member>\n\
         \        </booleanList>\n\
         \        <timestampList>\n\
         \            <member>2014-04-29T18:30:38Z</member>\n\
         \            <member>2014-04-29T18:30:38Z</member>\n\
         \        </timestampList>\n\
         \        <enumList>\n\
         \            <member>Foo</member>\n\
         \            <member>0</member>\n\
         \        </enumList>\n\
         \        <intEnumList>\n\
         \            <member>1</member>\n\
         \            <member>2</member>\n\
         \        </intEnumList>\n\
         \        <nestedStringList>\n\
         \            <member>\n\
         \                <member>foo</member>\n\
         \                <member>bar</member>\n\
         \            </member>\n\
         \            <member>\n\
         \                <member>baz</member>\n\
         \                <member>qux</member>\n\
         \            </member>\n\
         \        </nestedStringList>\n\
         \        <renamed>\n\
         \            <item>foo</item>\n\
         \            <item>bar</item>\n\
         \        </renamed>\n\
         \        <flattenedList>hi</flattenedList>\n\
         \        <flattenedList>bye</flattenedList>\n\
         \        <customName>yep</customName>\n\
         \        <customName>nope</customName>\n\
         \        <flattenedListWithMemberNamespace \
          xmlns=\"https://xml-member.example.com\">a</flattenedListWithMemberNamespace>\n\
         \        <flattenedListWithMemberNamespace \
          xmlns=\"https://xml-member.example.com\">b</flattenedListWithMemberNamespace>\n\
         \        <flattenedListWithNamespace>a</flattenedListWithNamespace>\n\
         \        <flattenedListWithNamespace>b</flattenedListWithNamespace>\n\
         \        <myStructureList>\n\
         \            <item>\n\
         \                <value>1</value>\n\
         \                <other>2</other>\n\
         \            </item>\n\
         \            <item>\n\
         \                <value>3</value>\n\
         \                <other>4</other>\n\
         \            </item>\n\
         \        </myStructureList>\n\
         \    </XmlListsResult>\n\
          </XmlListsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "text/xml") ]
    ();
  let response = XmlLists.request ctx () in
  match response with
  | Ok result ->
      let expected =
        ({
           structure_list = Some [ { b = Some "2"; a = Some "1" }; { b = Some "4"; a = Some "3" } ];
           flattened_list_with_namespace = Some [ "a"; "b" ];
           flattened_list_with_member_namespace = Some [ "a"; "b" ];
           flattened_list2 = Some [ "yep"; "nope" ];
           flattened_list = Some [ "hi"; "bye" ];
           renamed_list_members = Some [ "foo"; "bar" ];
           nested_string_list = Some [ [ "foo"; "bar" ]; [ "baz"; "qux" ] ];
           int_enum_list = Some [ A; B ];
           enum_list = Some [ FOO; ZERO ];
           timestamp_list =
             Some
               [
                 Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1398796238.);
                 Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1398796238.);
               ];
           boolean_list = Some [ true; false ];
           integer_list = Some [ 1; 2 ];
           string_set = Some [ "foo"; "bar" ];
           string_list = Some [ "foo"; "bar" ];
         }
          : Types.xml_lists_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_lists_output Types.equal_xml_lists_output)
        "expected output" expected result
  | Error error -> failwith (XmlLists.error_to_string error)

let xml_lists_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#XmlLists", [ ("QueryXmlLists", `Quick, query_xml_lists) ])

let query_xml_maps () =
  Eio.Switch.run ~name:"QueryXmlMaps" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlMapsResponse xmlns=\"https://example.com/\">\n\
         \    <XmlMapsResult>\n\
         \        <myMap>\n\
         \            <entry>\n\
         \                <key>foo</key>\n\
         \                <value>\n\
         \                    <hi>there</hi>\n\
         \                </value>\n\
         \            </entry>\n\
         \            <entry>\n\
         \                <key>baz</key>\n\
         \                <value>\n\
         \                    <hi>bye</hi>\n\
         \                </value>\n\
         \            </entry>\n\
         \        </myMap>\n\
         \    </XmlMapsResult>\n\
          </XmlMapsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "text/xml") ]
    ();
  let response = XmlMaps.request ctx () in
  match response with
  | Ok result ->
      let expected =
        ({ my_map = Some [ ("foo", { hi = Some "there" }); ("baz", { hi = Some "bye" }) ] }
          : Types.xml_maps_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_maps_output Types.equal_xml_maps_output)
        "expected output" expected result
  | Error error -> failwith (XmlMaps.error_to_string error)

let xml_maps_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#XmlMaps", [ ("QueryXmlMaps", `Quick, query_xml_maps) ])

let query_query_xml_maps_xml_name () =
  Eio.Switch.run ~name:"QueryQueryXmlMapsXmlName" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlMapsXmlNameResponse xmlns=\"https://example.com/\">\n\
         \    <XmlMapsXmlNameResult>\n\
         \        <myMap>\n\
         \            <entry>\n\
         \                <Attribute>foo</Attribute>\n\
         \                <Setting>\n\
         \                    <hi>there</hi>\n\
         \                </Setting>\n\
         \            </entry>\n\
         \            <entry>\n\
         \                <Attribute>baz</Attribute>\n\
         \                <Setting>\n\
         \                    <hi>bye</hi>\n\
         \                </Setting>\n\
         \            </entry>\n\
         \        </myMap>\n\
         \    </XmlMapsXmlNameResult>\n\
          </XmlMapsXmlNameResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "text/xml") ]
    ();
  let response = XmlMapsXmlName.request ctx () in
  match response with
  | Ok result ->
      let expected =
        ({ my_map = Some [ ("foo", { hi = Some "there" }); ("baz", { hi = Some "bye" }) ] }
          : Types.xml_maps_xml_name_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_maps_xml_name_output
           Types.equal_xml_maps_xml_name_output)
        "expected output" expected result
  | Error error -> failwith (XmlMapsXmlName.error_to_string error)

let xml_maps_xml_name_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.query#XmlMapsXmlName",
    [ ("QueryQueryXmlMapsXmlName", `Quick, query_query_xml_maps_xml_name) ] )

let query_xml_namespaces () =
  Eio.Switch.run ~name:"QueryXmlNamespaces" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlNamespacesResponse xmlns=\"https://example.com/\">\n\
         \    <XmlNamespacesResult>\n\
         \        <nested>\n\
         \            <foo xmlns:baz=\"http://baz.com\">Foo</foo>\n\
         \            <values xmlns=\"http://qux.com\">\n\
         \                <member xmlns=\"http://bux.com\">Bar</member>\n\
         \                <member xmlns=\"http://bux.com\">Baz</member>\n\
         \            </values>\n\
         \        </nested>\n\
         \    </XmlNamespacesResult>\n\
          </XmlNamespacesResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "text/xml") ]
    ();
  let response = XmlNamespaces.request ctx () in
  match response with
  | Ok result ->
      let expected =
        ({ nested = Some { values = Some [ "Bar"; "Baz" ]; foo = Some "Foo" } }
          : Types.xml_namespaces_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_namespaces_output
           Types.equal_xml_namespaces_output)
        "expected output" expected result
  | Error error -> failwith (XmlNamespaces.error_to_string error)

let xml_namespaces_test_suite : unit Alcotest.test =
  ("aws.protocoltests.query#XmlNamespaces", [ ("QueryXmlNamespaces", `Quick, query_xml_namespaces) ])

let query_xml_timestamps () =
  Eio.Switch.run ~name:"QueryXmlTimestamps" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlTimestampsResponse xmlns=\"https://example.com/\">\n\
         \    <XmlTimestampsResult>\n\
         \        <normal>2014-04-29T18:30:38Z</normal>\n\
         \    </XmlTimestampsResult>\n\
          </XmlTimestampsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "text/xml") ]
    ();
  let response = XmlTimestamps.request ctx () in
  match response with
  | Ok result ->
      let expected =
        ({
           http_date_on_target = None;
           http_date = None;
           epoch_seconds_on_target = None;
           epoch_seconds = None;
           date_time_on_target = None;
           date_time = None;
           normal = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1398796238.));
         }
          : Types.xml_timestamps_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_timestamps_output
           Types.equal_xml_timestamps_output)
        "expected output" expected result
  | Error error -> failwith (XmlTimestamps.error_to_string error)

let query_xml_timestamps_with_date_time_format () =
  Eio.Switch.run ~name:"QueryXmlTimestampsWithDateTimeFormat" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlTimestampsResponse xmlns=\"https://example.com/\">\n\
         \    <XmlTimestampsResult>\n\
         \        <dateTime>2014-04-29T18:30:38Z</dateTime>\n\
         \    </XmlTimestampsResult>\n\
          </XmlTimestampsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "text/xml") ]
    ();
  let response = XmlTimestamps.request ctx () in
  match response with
  | Ok result ->
      let expected =
        ({
           http_date_on_target = None;
           http_date = None;
           epoch_seconds_on_target = None;
           epoch_seconds = None;
           date_time_on_target = None;
           date_time = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1398796238.));
           normal = None;
         }
          : Types.xml_timestamps_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_timestamps_output
           Types.equal_xml_timestamps_output)
        "expected output" expected result
  | Error error -> failwith (XmlTimestamps.error_to_string error)

let query_xml_timestamps_with_date_time_on_target_format () =
  Eio.Switch.run ~name:"QueryXmlTimestampsWithDateTimeOnTargetFormat" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlTimestampsResponse xmlns=\"https://example.com/\">\n\
         \    <XmlTimestampsResult>\n\
         \        <dateTimeOnTarget>2014-04-29T18:30:38Z</dateTimeOnTarget>\n\
         \    </XmlTimestampsResult>\n\
          </XmlTimestampsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "text/xml") ]
    ();
  let response = XmlTimestamps.request ctx () in
  match response with
  | Ok result ->
      let expected =
        ({
           http_date_on_target = None;
           http_date = None;
           epoch_seconds_on_target = None;
           epoch_seconds = None;
           date_time_on_target =
             Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1398796238.));
           date_time = None;
           normal = None;
         }
          : Types.xml_timestamps_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_timestamps_output
           Types.equal_xml_timestamps_output)
        "expected output" expected result
  | Error error -> failwith (XmlTimestamps.error_to_string error)

let query_xml_timestamps_with_epoch_seconds_format () =
  Eio.Switch.run ~name:"QueryXmlTimestampsWithEpochSecondsFormat" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlTimestampsResponse xmlns=\"https://example.com/\">\n\
         \    <XmlTimestampsResult>\n\
         \        <epochSeconds>1398796238</epochSeconds>\n\
         \    </XmlTimestampsResult>\n\
          </XmlTimestampsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "text/xml") ]
    ();
  let response = XmlTimestamps.request ctx () in
  match response with
  | Ok result ->
      let expected =
        ({
           http_date_on_target = None;
           http_date = None;
           epoch_seconds_on_target = None;
           epoch_seconds = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1398796238.));
           date_time_on_target = None;
           date_time = None;
           normal = None;
         }
          : Types.xml_timestamps_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_timestamps_output
           Types.equal_xml_timestamps_output)
        "expected output" expected result
  | Error error -> failwith (XmlTimestamps.error_to_string error)

let query_xml_timestamps_with_epoch_seconds_on_target_format () =
  Eio.Switch.run ~name:"QueryXmlTimestampsWithEpochSecondsOnTargetFormat" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlTimestampsResponse xmlns=\"https://example.com/\">\n\
         \    <XmlTimestampsResult>\n\
         \        <epochSecondsOnTarget>1398796238</epochSecondsOnTarget>\n\
         \    </XmlTimestampsResult>\n\
          </XmlTimestampsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "text/xml") ]
    ();
  let response = XmlTimestamps.request ctx () in
  match response with
  | Ok result ->
      let expected =
        ({
           http_date_on_target = None;
           http_date = None;
           epoch_seconds_on_target =
             Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1398796238.));
           epoch_seconds = None;
           date_time_on_target = None;
           date_time = None;
           normal = None;
         }
          : Types.xml_timestamps_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_timestamps_output
           Types.equal_xml_timestamps_output)
        "expected output" expected result
  | Error error -> failwith (XmlTimestamps.error_to_string error)

let query_xml_timestamps_with_http_date_format () =
  Eio.Switch.run ~name:"QueryXmlTimestampsWithHttpDateFormat" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlTimestampsResponse xmlns=\"https://example.com/\">\n\
         \    <XmlTimestampsResult>\n\
         \        <httpDate>Tue, 29 Apr 2014 18:30:38 GMT</httpDate>\n\
         \    </XmlTimestampsResult>\n\
          </XmlTimestampsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "text/xml") ]
    ();
  let response = XmlTimestamps.request ctx () in
  match response with
  | Ok result ->
      let expected =
        ({
           http_date_on_target = None;
           http_date = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1398796238.));
           epoch_seconds_on_target = None;
           epoch_seconds = None;
           date_time_on_target = None;
           date_time = None;
           normal = None;
         }
          : Types.xml_timestamps_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_timestamps_output
           Types.equal_xml_timestamps_output)
        "expected output" expected result
  | Error error -> failwith (XmlTimestamps.error_to_string error)

let query_xml_timestamps_with_http_date_on_target_format () =
  Eio.Switch.run ~name:"QueryXmlTimestampsWithHttpDateOnTargetFormat" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlTimestampsResponse xmlns=\"https://example.com/\">\n\
         \    <XmlTimestampsResult>\n\
         \        <httpDateOnTarget>Tue, 29 Apr 2014 18:30:38 GMT</httpDateOnTarget>\n\
         \    </XmlTimestampsResult>\n\
          </XmlTimestampsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "text/xml") ]
    ();
  let response = XmlTimestamps.request ctx () in
  match response with
  | Ok result ->
      let expected =
        ({
           http_date_on_target =
             Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1398796238.));
           http_date = None;
           epoch_seconds_on_target = None;
           epoch_seconds = None;
           date_time_on_target = None;
           date_time = None;
           normal = None;
         }
          : Types.xml_timestamps_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_timestamps_output
           Types.equal_xml_timestamps_output)
        "expected output" expected result
  | Error error -> failwith (XmlTimestamps.error_to_string error)

let xml_timestamps_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.query#XmlTimestamps",
    [
      ("QueryXmlTimestamps", `Quick, query_xml_timestamps);
      ("QueryXmlTimestampsWithDateTimeFormat", `Quick, query_xml_timestamps_with_date_time_format);
      ( "QueryXmlTimestampsWithDateTimeOnTargetFormat",
        `Quick,
        query_xml_timestamps_with_date_time_on_target_format );
      ( "QueryXmlTimestampsWithEpochSecondsFormat",
        `Quick,
        query_xml_timestamps_with_epoch_seconds_format );
      ( "QueryXmlTimestampsWithEpochSecondsOnTargetFormat",
        `Quick,
        query_xml_timestamps_with_epoch_seconds_on_target_format );
      ("QueryXmlTimestampsWithHttpDateFormat", `Quick, query_xml_timestamps_with_http_date_format);
      ( "QueryXmlTimestampsWithHttpDateOnTargetFormat",
        `Quick,
        query_xml_timestamps_with_http_date_on_target_format );
    ] )

let () =
  Eio_main.run @@ fun env ->
  Alcotest.run "aws.protocoltests.query"
    [
      datetime_offsets_test_suite;
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
      xml_timestamps_test_suite;
    ]
