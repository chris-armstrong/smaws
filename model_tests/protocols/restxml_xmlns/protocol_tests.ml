open Alcotest
open Smaws_Test_Support_Lib
open Restxml_xmlns

let xml_namespace_simple_scalar_properties () =
  Eio.Switch.run ~name:"XmlNamespaceSimpleScalarProperties" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.simple_scalar_properties_request =
    {
      foo = Some "Foo";
      string_value = Some "string";
      true_boolean_value = Some true;
      false_boolean_value = Some false;
      byte_value = Some 1;
      short_value = Some 2;
      integer_value = Some 3;
      long_value = Some (Smaws_Lib.CoreTypes.Int64.of_int 4);
      float_value = Some 5.5;
      nested = Some { attr_field = Some "nestedAttrValue" };
      double_value = Some 6.5;
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = SimpleScalarProperties.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<SimpleScalarPropertiesRequest xmlns=\"https://example.com\">\n\
         \    <stringValue>string</stringValue>\n\
         \    <trueBooleanValue>true</trueBooleanValue>\n\
         \    <falseBooleanValue>false</falseBooleanValue>\n\
         \    <byteValue>1</byteValue>\n\
         \    <shortValue>2</shortValue>\n\
         \    <integerValue>3</integerValue>\n\
         \    <longValue>4</longValue>\n\
         \    <floatValue>5.5</floatValue>\n\
         \    <DoubleDribble>6.5</DoubleDribble>\n\
         \    <Nested xmlns:xsi=\"https://example.com\" xsi:someName=\"nestedAttrValue\"></Nested>\n\
          </SimpleScalarPropertiesRequest>\n")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/SimpleScalarProperties")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml"); ("X-Foo", "Foo") ]
      request.headers
  in
  ()

let xml_namespace_simple_scalar_properties () =
  Eio.Switch.run ~name:"XmlNamespaceSimpleScalarProperties" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<SimpleScalarPropertiesResponse xmlns=\"https://example.com\">\n\
         \    <stringValue>string</stringValue>\n\
         \    <trueBooleanValue>true</trueBooleanValue>\n\
         \    <falseBooleanValue>false</falseBooleanValue>\n\
         \    <byteValue>1</byteValue>\n\
         \    <shortValue>2</shortValue>\n\
         \    <integerValue>3</integerValue>\n\
         \    <longValue>4</longValue>\n\
         \    <floatValue>5.5</floatValue>\n\
         \    <DoubleDribble>6.5</DoubleDribble>\n\
         \    <Nested xmlns:xsi=\"https://example.com\" xsi:someName=\"nestedAttrValue\"></Nested>\n\
          </SimpleScalarPropertiesResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml"); ("X-Foo", "Foo") ]
    ();
  let response =
    SimpleScalarProperties.request ctx
      {
        foo = None;
        string_value = None;
        true_boolean_value = None;
        false_boolean_value = None;
        byte_value = None;
        short_value = None;
        integer_value = None;
        long_value = None;
        float_value = None;
        nested = None;
        double_value = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           foo = Some "Foo";
           string_value = Some "string";
           true_boolean_value = Some true;
           false_boolean_value = Some false;
           byte_value = Some 1;
           short_value = Some 2;
           integer_value = Some 3;
           long_value = Some (Smaws_Lib.CoreTypes.Int64.of_int 4);
           float_value = Some 5.5;
           nested = Some { attr_field = Some "nestedAttrValue" };
           double_value = Some 6.5;
         }
          : Types.simple_scalar_properties_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_simple_scalar_properties_response
           Types.equal_simple_scalar_properties_response)
        "expected output" expected result
  | Error error -> failwith (SimpleScalarProperties.error_to_string error)

let simple_scalar_properties_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml.xmlns#SimpleScalarProperties",
    [
      ("XmlNamespaceSimpleScalarProperties", `Quick, xml_namespace_simple_scalar_properties);
      ("XmlNamespaceSimpleScalarProperties", `Quick, xml_namespace_simple_scalar_properties);
    ] )

let () =
  Eio_main.run @@ fun env ->
  Alcotest.run "aws.protocoltests.restxml.xmlns" [ simple_scalar_properties_test_suite ]
