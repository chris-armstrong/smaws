open Alcotest
open Smaws_Test_Support_Lib
open Restxml

let simple_scalar_properties () =
  Eio.Switch.run ~name:"SimpleScalarProperties" @@ fun sw ->
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
      double_value = Some 6.5;
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = SimpleScalarProperties.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<SimpleScalarPropertiesRequest>\n\
         \    <stringValue>string</stringValue>\n\
         \    <trueBooleanValue>true</trueBooleanValue>\n\
         \    <falseBooleanValue>false</falseBooleanValue>\n\
         \    <byteValue>1</byteValue>\n\
         \    <shortValue>2</shortValue>\n\
         \    <integerValue>3</integerValue>\n\
         \    <longValue>4</longValue>\n\
         \    <floatValue>5.5</floatValue>\n\
         \    <DoubleDribble>6.5</DoubleDribble>\n\
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

let simple_scalar_properties_with_escaped_character () =
  Eio.Switch.run ~name:"SimpleScalarPropertiesWithEscapedCharacter" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.simple_scalar_properties_request =
    {
      foo = Some "Foo";
      string_value = Some "<string>";
      true_boolean_value = None;
      false_boolean_value = None;
      byte_value = None;
      short_value = None;
      integer_value = None;
      long_value = None;
      float_value = None;
      double_value = None;
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = SimpleScalarProperties.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<SimpleScalarPropertiesRequest>\n\
         \    <stringValue>&lt;string&gt;</stringValue>\n\
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

let simple_scalar_properties_with_white_space () =
  Eio.Switch.run ~name:"SimpleScalarPropertiesWithWhiteSpace" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.simple_scalar_properties_request =
    {
      foo = Some "Foo";
      string_value = Some "  string with white    space  ";
      true_boolean_value = None;
      false_boolean_value = None;
      byte_value = None;
      short_value = None;
      integer_value = None;
      long_value = None;
      float_value = None;
      double_value = None;
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = SimpleScalarProperties.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<SimpleScalarPropertiesRequest>\n\
         \    <stringValue>  string with white    space  </stringValue>\n\
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

let simple_scalar_properties_pure_white_space () =
  Eio.Switch.run ~name:"SimpleScalarPropertiesPureWhiteSpace" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.simple_scalar_properties_request =
    {
      foo = Some "Foo";
      string_value = Some "   ";
      true_boolean_value = None;
      false_boolean_value = None;
      byte_value = None;
      short_value = None;
      integer_value = None;
      long_value = None;
      float_value = None;
      double_value = None;
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = SimpleScalarProperties.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<SimpleScalarPropertiesRequest>\n\
         \    <stringValue>   </stringValue>\n\
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

let rest_xml_supports_na_n_float_inputs () =
  Eio.Switch.run ~name:"RestXmlSupportsNaNFloatInputs" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.simple_scalar_properties_request =
    {
      foo = None;
      string_value = None;
      true_boolean_value = None;
      false_boolean_value = None;
      byte_value = None;
      short_value = None;
      integer_value = None;
      long_value = None;
      float_value = Some Float.nan;
      double_value = Some Float.nan;
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = SimpleScalarProperties.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<SimpleScalarPropertiesRequest>\n\
         \    <floatValue>NaN</floatValue>\n\
         \    <DoubleDribble>NaN</DoubleDribble>\n\
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
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let rest_xml_supports_infinity_float_inputs () =
  Eio.Switch.run ~name:"RestXmlSupportsInfinityFloatInputs" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.simple_scalar_properties_request =
    {
      foo = None;
      string_value = None;
      true_boolean_value = None;
      false_boolean_value = None;
      byte_value = None;
      short_value = None;
      integer_value = None;
      long_value = None;
      float_value = Some Float.infinity;
      double_value = Some Float.infinity;
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = SimpleScalarProperties.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<SimpleScalarPropertiesRequest>\n\
         \    <floatValue>Infinity</floatValue>\n\
         \    <DoubleDribble>Infinity</DoubleDribble>\n\
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
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let rest_xml_supports_negative_infinity_float_inputs () =
  Eio.Switch.run ~name:"RestXmlSupportsNegativeInfinityFloatInputs" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.simple_scalar_properties_request =
    {
      foo = None;
      string_value = None;
      true_boolean_value = None;
      false_boolean_value = None;
      byte_value = None;
      short_value = None;
      integer_value = None;
      long_value = None;
      float_value = Some Float.neg_infinity;
      double_value = Some Float.neg_infinity;
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = SimpleScalarProperties.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<SimpleScalarPropertiesRequest>\n\
         \    <floatValue>-Infinity</floatValue>\n\
         \    <DoubleDribble>-Infinity</DoubleDribble>\n\
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
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let simple_scalar_properties () =
  Eio.Switch.run ~name:"SimpleScalarProperties" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<SimpleScalarPropertiesResponse>\n\
         \    <stringValue>string</stringValue>\n\
         \    <trueBooleanValue>true</trueBooleanValue>\n\
         \    <falseBooleanValue>false</falseBooleanValue>\n\
         \    <byteValue>1</byteValue>\n\
         \    <shortValue>2</shortValue>\n\
         \    <integerValue>3</integerValue>\n\
         \    <longValue>4</longValue>\n\
         \    <floatValue>5.5</floatValue>\n\
         \    <DoubleDribble>6.5</DoubleDribble>\n\
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
           double_value = Some 6.5;
         }
          : Types.simple_scalar_properties_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_simple_scalar_properties_response
           Types.equal_simple_scalar_properties_response)
        "expected output" expected result
  | Error error -> failwith (SimpleScalarProperties.error_to_string error)

let simple_scalar_properties_complex_escapes () =
  Eio.Switch.run ~name:"SimpleScalarPropertiesComplexEscapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<SimpleScalarPropertiesResponse>\n\
         \    <stringValue>escaped data: &amp;lt;&#xD;&#10;</stringValue>\n\
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
        double_value = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           foo = Some "Foo";
           string_value = Some "escaped data: &lt;\r\n";
           true_boolean_value = None;
           false_boolean_value = None;
           byte_value = None;
           short_value = None;
           integer_value = None;
           long_value = None;
           float_value = None;
           double_value = None;
         }
          : Types.simple_scalar_properties_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_simple_scalar_properties_response
           Types.equal_simple_scalar_properties_response)
        "expected output" expected result
  | Error error -> failwith (SimpleScalarProperties.error_to_string error)

let simple_scalar_properties_with_escaped_character () =
  Eio.Switch.run ~name:"SimpleScalarPropertiesWithEscapedCharacter" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<SimpleScalarPropertiesResponse>\n\
         \    <stringValue>&lt;string&gt;</stringValue>\n\
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
        double_value = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           foo = Some "Foo";
           string_value = Some "<string>";
           true_boolean_value = None;
           false_boolean_value = None;
           byte_value = None;
           short_value = None;
           integer_value = None;
           long_value = None;
           float_value = None;
           double_value = None;
         }
          : Types.simple_scalar_properties_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_simple_scalar_properties_response
           Types.equal_simple_scalar_properties_response)
        "expected output" expected result
  | Error error -> failwith (SimpleScalarProperties.error_to_string error)

let simple_scalar_properties_with_xml_preamble () =
  Eio.Switch.run ~name:"SimpleScalarPropertiesWithXMLPreamble" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<?xml version = \"1.0\" encoding = \"UTF-8\"?>\n\
          <SimpleScalarPropertiesResponse>\n\
         \    <![CDATA[characters representing CDATA]]>\n\
         \    <stringValue>string</stringValue>\n\
         \    <!--xml comment-->\n\
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
        double_value = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           foo = Some "Foo";
           string_value = Some "string";
           true_boolean_value = None;
           false_boolean_value = None;
           byte_value = None;
           short_value = None;
           integer_value = None;
           long_value = None;
           float_value = None;
           double_value = None;
         }
          : Types.simple_scalar_properties_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_simple_scalar_properties_response
           Types.equal_simple_scalar_properties_response)
        "expected output" expected result
  | Error error -> failwith (SimpleScalarProperties.error_to_string error)

let simple_scalar_properties_with_white_space () =
  Eio.Switch.run ~name:"SimpleScalarPropertiesWithWhiteSpace" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<?xml version = \"1.0\" encoding = \"UTF-8\"?>\n\
          <SimpleScalarPropertiesResponse>\n\
         \    <stringValue> string with white    space </stringValue>\n\
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
        double_value = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           foo = Some "Foo";
           string_value = Some " string with white    space ";
           true_boolean_value = None;
           false_boolean_value = None;
           byte_value = None;
           short_value = None;
           integer_value = None;
           long_value = None;
           float_value = None;
           double_value = None;
         }
          : Types.simple_scalar_properties_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_simple_scalar_properties_response
           Types.equal_simple_scalar_properties_response)
        "expected output" expected result
  | Error error -> failwith (SimpleScalarProperties.error_to_string error)

let simple_scalar_properties_pure_white_space () =
  Eio.Switch.run ~name:"SimpleScalarPropertiesPureWhiteSpace" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<?xml version = \"1.0\" encoding = \"UTF-8\"?>\n\
          <SimpleScalarPropertiesResponse>\n\
         \    <stringValue>  </stringValue>\n\
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
        double_value = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           foo = Some "Foo";
           string_value = Some "  ";
           true_boolean_value = None;
           false_boolean_value = None;
           byte_value = None;
           short_value = None;
           integer_value = None;
           long_value = None;
           float_value = None;
           double_value = None;
         }
          : Types.simple_scalar_properties_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_simple_scalar_properties_response
           Types.equal_simple_scalar_properties_response)
        "expected output" expected result
  | Error error -> failwith (SimpleScalarProperties.error_to_string error)

let rest_xml_supports_na_n_float_outputs () =
  Eio.Switch.run ~name:"RestXmlSupportsNaNFloatOutputs" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<SimpleScalarPropertiesResponse>\n\
         \    <floatValue>NaN</floatValue>\n\
         \    <DoubleDribble>NaN</DoubleDribble>\n\
          </SimpleScalarPropertiesResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
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
        double_value = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           foo = None;
           string_value = None;
           true_boolean_value = None;
           false_boolean_value = None;
           byte_value = None;
           short_value = None;
           integer_value = None;
           long_value = None;
           float_value = Some Float.nan;
           double_value = Some Float.nan;
         }
          : Types.simple_scalar_properties_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_simple_scalar_properties_response
           Types.equal_simple_scalar_properties_response)
        "expected output" expected result
  | Error error -> failwith (SimpleScalarProperties.error_to_string error)

let rest_xml_supports_infinity_float_outputs () =
  Eio.Switch.run ~name:"RestXmlSupportsInfinityFloatOutputs" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<SimpleScalarPropertiesResponse>\n\
         \    <floatValue>Infinity</floatValue>\n\
         \    <DoubleDribble>Infinity</DoubleDribble>\n\
          </SimpleScalarPropertiesResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
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
        double_value = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           foo = None;
           string_value = None;
           true_boolean_value = None;
           false_boolean_value = None;
           byte_value = None;
           short_value = None;
           integer_value = None;
           long_value = None;
           float_value = Some Float.infinity;
           double_value = Some Float.infinity;
         }
          : Types.simple_scalar_properties_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_simple_scalar_properties_response
           Types.equal_simple_scalar_properties_response)
        "expected output" expected result
  | Error error -> failwith (SimpleScalarProperties.error_to_string error)

let rest_xml_supports_negative_infinity_float_outputs () =
  Eio.Switch.run ~name:"RestXmlSupportsNegativeInfinityFloatOutputs" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<SimpleScalarPropertiesResponse>\n\
         \    <floatValue>-Infinity</floatValue>\n\
         \    <DoubleDribble>-Infinity</DoubleDribble>\n\
          </SimpleScalarPropertiesResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
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
        double_value = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           foo = None;
           string_value = None;
           true_boolean_value = None;
           false_boolean_value = None;
           byte_value = None;
           short_value = None;
           integer_value = None;
           long_value = None;
           float_value = Some Float.neg_infinity;
           double_value = Some Float.neg_infinity;
         }
          : Types.simple_scalar_properties_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_simple_scalar_properties_response
           Types.equal_simple_scalar_properties_response)
        "expected output" expected result
  | Error error -> failwith (SimpleScalarProperties.error_to_string error)

let simple_scalar_properties_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#SimpleScalarProperties",
    [
      ("SimpleScalarProperties", `Quick, simple_scalar_properties);
      ( "SimpleScalarPropertiesWithEscapedCharacter",
        `Quick,
        simple_scalar_properties_with_escaped_character );
      ("SimpleScalarPropertiesWithWhiteSpace", `Quick, simple_scalar_properties_with_white_space);
      ("SimpleScalarPropertiesPureWhiteSpace", `Quick, simple_scalar_properties_pure_white_space);
      ("RestXmlSupportsNaNFloatInputs", `Quick, rest_xml_supports_na_n_float_inputs);
      ("RestXmlSupportsInfinityFloatInputs", `Quick, rest_xml_supports_infinity_float_inputs);
      ( "RestXmlSupportsNegativeInfinityFloatInputs",
        `Quick,
        rest_xml_supports_negative_infinity_float_inputs );
      ("SimpleScalarProperties", `Quick, simple_scalar_properties);
      ("SimpleScalarPropertiesComplexEscapes", `Quick, simple_scalar_properties_complex_escapes);
      ( "SimpleScalarPropertiesWithEscapedCharacter",
        `Quick,
        simple_scalar_properties_with_escaped_character );
      ("SimpleScalarPropertiesWithXMLPreamble", `Quick, simple_scalar_properties_with_xml_preamble);
      ("SimpleScalarPropertiesWithWhiteSpace", `Quick, simple_scalar_properties_with_white_space);
      ("SimpleScalarPropertiesPureWhiteSpace", `Quick, simple_scalar_properties_pure_white_space);
      ("RestXmlSupportsNaNFloatOutputs", `Quick, rest_xml_supports_na_n_float_outputs);
      ("RestXmlSupportsInfinityFloatOutputs", `Quick, rest_xml_supports_infinity_float_outputs);
      ( "RestXmlSupportsNegativeInfinityFloatOutputs",
        `Quick,
        rest_xml_supports_negative_infinity_float_outputs );
    ] )

let timestamp_format_headers () =
  Eio.Switch.run ~name:"TimestampFormatHeaders" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.timestamp_format_headers_i_o =
    {
      member_epoch_seconds =
        Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.));
      member_http_date = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.));
      member_date_time = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.));
      default_format = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.));
      target_epoch_seconds =
        Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.));
      target_http_date = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.));
      target_date_time = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.));
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = TimestampFormatHeaders.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/TimestampFormatHeaders")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [
        ("X-memberEpochSeconds", "1576540098");
        ("X-memberHttpDate", "Mon, 16 Dec 2019 23:48:18 GMT");
        ("X-memberDateTime", "2019-12-16T23:48:18Z");
        ("X-defaultFormat", "Mon, 16 Dec 2019 23:48:18 GMT");
        ("X-targetEpochSeconds", "1576540098");
        ("X-targetHttpDate", "Mon, 16 Dec 2019 23:48:18 GMT");
        ("X-targetDateTime", "2019-12-16T23:48:18Z");
      ]
      request.headers
  in
  ()

let timestamp_format_headers () =
  Eio.Switch.run ~name:"TimestampFormatHeaders" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:
      [
        ("X-memberEpochSeconds", "1576540098");
        ("X-memberHttpDate", "Mon, 16 Dec 2019 23:48:18 GMT");
        ("X-memberDateTime", "2019-12-16T23:48:18Z");
        ("X-defaultFormat", "Mon, 16 Dec 2019 23:48:18 GMT");
        ("X-targetEpochSeconds", "1576540098");
        ("X-targetHttpDate", "Mon, 16 Dec 2019 23:48:18 GMT");
        ("X-targetDateTime", "2019-12-16T23:48:18Z");
      ]
    ();
  let response =
    TimestampFormatHeaders.request ctx
      {
        member_epoch_seconds = None;
        member_http_date = None;
        member_date_time = None;
        default_format = None;
        target_epoch_seconds = None;
        target_http_date = None;
        target_date_time = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           member_epoch_seconds =
             Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.));
           member_http_date =
             Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.));
           member_date_time =
             Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.));
           default_format = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.));
           target_epoch_seconds =
             Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.));
           target_http_date =
             Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.));
           target_date_time =
             Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.));
         }
          : Types.timestamp_format_headers_i_o)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_timestamp_format_headers_i_o
           Types.equal_timestamp_format_headers_i_o)
        "expected output" expected result
  | Error error -> failwith (TimestampFormatHeaders.error_to_string error)

let timestamp_format_headers_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#TimestampFormatHeaders",
    [
      ("TimestampFormatHeaders", `Quick, timestamp_format_headers);
      ("TimestampFormatHeaders", `Quick, timestamp_format_headers);
    ] )

let xml_attributes () =
  Eio.Switch.run ~name:"XmlAttributes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_attributes_request = { foo = Some "hi"; attr = Some "test" } in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = XmlAttributes.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some "<XmlAttributesRequest test=\"test\">\n    <foo>hi</foo>\n</XmlAttributesRequest>\n")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri" (Uri.of_string "/XmlAttributes")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let xml_attributes_with_escaping () =
  Eio.Switch.run ~name:"XmlAttributesWithEscaping" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_attributes_request = { foo = Some "hi"; attr = Some "<test&mock>" } in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = XmlAttributes.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<XmlAttributesRequest test=\"&lt;test&amp;mock&gt;\">\n\
         \    <foo>hi</foo>\n\
          </XmlAttributesRequest>\n")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri" (Uri.of_string "/XmlAttributes")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let xml_attributes () =
  Eio.Switch.run ~name:"XmlAttributes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some "<XmlAttributesResponse test=\"test\">\n    <foo>hi</foo>\n</XmlAttributesResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response = XmlAttributes.request ctx { foo = None; attr = None } in
  match response with
  | Ok result ->
      let expected = ({ foo = Some "hi"; attr = Some "test" } : Types.xml_attributes_response) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_attributes_response
           Types.equal_xml_attributes_response)
        "expected output" expected result
  | Error error -> failwith (XmlAttributes.error_to_string error)

let xml_attributes_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#XmlAttributes",
    [
      ("XmlAttributes", `Quick, xml_attributes);
      ("XmlAttributesWithEscaping", `Quick, xml_attributes_with_escaping);
      ("XmlAttributes", `Quick, xml_attributes);
    ] )

let xml_attributes_in_middle () =
  Eio.Switch.run ~name:"XmlAttributesInMiddle" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_attributes_in_middle_request =
    { payload = Some { foo = Some "Foo"; attr = Some "attributeValue"; baz = Some "Baz" } }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = XmlAttributesInMiddle.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<XmlAttributesInMiddlePayloadRequest test=\"attributeValue\">\n\
         \    <foo>Foo</foo>\n\
         \    <baz>Baz</baz>\n\
          </XmlAttributesInMiddlePayloadRequest>\n")
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
      (Uri.of_string "/XmlAttributesInMiddle")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let xml_attributes_in_middle () =
  Eio.Switch.run ~name:"XmlAttributesInMiddle" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlAttributesInMiddlePayloadResponse test=\"attributeValue\">\n\
         \    <foo>Foo</foo>\n\
         \    <baz>Baz</baz>\n\
          </XmlAttributesInMiddlePayloadResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response = XmlAttributesInMiddle.request ctx { payload = None } in
  match response with
  | Ok result ->
      let expected =
        ({ payload = Some { foo = Some "Foo"; attr = Some "attributeValue"; baz = Some "Baz" } }
          : Types.xml_attributes_in_middle_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_attributes_in_middle_response
           Types.equal_xml_attributes_in_middle_response)
        "expected output" expected result
  | Error error -> failwith (XmlAttributesInMiddle.error_to_string error)

let xml_attributes_in_middle_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#XmlAttributesInMiddle",
    [
      ("XmlAttributesInMiddle", `Quick, xml_attributes_in_middle);
      ("XmlAttributesInMiddle", `Quick, xml_attributes_in_middle);
    ] )

let xml_attributes_on_payload () =
  Eio.Switch.run ~name:"XmlAttributesOnPayload" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_attributes_on_payload_request =
    { payload = Some { foo = Some "hi"; attr = Some "test" } }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = XmlAttributesOnPayload.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<XmlAttributesPayloadRequest test=\"test\">\n\
         \    <foo>hi</foo>\n\
          </XmlAttributesPayloadRequest>\n")
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
      (Uri.of_string "/XmlAttributesOnPayload")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let xml_attributes_on_payload () =
  Eio.Switch.run ~name:"XmlAttributesOnPayload" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlAttributesPayloadResponse test=\"test\">\n\
         \    <foo>hi</foo>\n\
          </XmlAttributesPayloadResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response = XmlAttributesOnPayload.request ctx { payload = None } in
  match response with
  | Ok result ->
      let expected =
        ({ payload = Some { foo = Some "hi"; attr = Some "test" } }
          : Types.xml_attributes_on_payload_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_attributes_on_payload_response
           Types.equal_xml_attributes_on_payload_response)
        "expected output" expected result
  | Error error -> failwith (XmlAttributesOnPayload.error_to_string error)

let xml_attributes_on_payload_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#XmlAttributesOnPayload",
    [
      ("XmlAttributesOnPayload", `Quick, xml_attributes_on_payload);
      ("XmlAttributesOnPayload", `Quick, xml_attributes_on_payload);
    ] )

let xml_blobs () =
  Eio.Switch.run ~name:"XmlBlobs" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_blobs_request =
    { data = Some (Smaws_Lib.CoreTypes.Blob.of_string "value") }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = XmlBlobs.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some "<XmlBlobsRequest>\n    <data>dmFsdWU=</data>\n</XmlBlobsRequest>\n")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri" (Uri.of_string "/XmlBlobs")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let xml_blobs () =
  Eio.Switch.run ~name:"XmlBlobs" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:(Some "<XmlBlobsResponse>\n    <data>dmFsdWU=</data>\n</XmlBlobsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response = XmlBlobs.request ctx { data = None } in
  match response with
  | Ok result ->
      let expected =
        ({ data = Some (Smaws_Lib.CoreTypes.Blob.of_string "value") } : Types.xml_blobs_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_blobs_response Types.equal_xml_blobs_response)
        "expected output" expected result
  | Error error -> failwith (XmlBlobs.error_to_string error)

let xml_blobs_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#XmlBlobs",
    [ ("XmlBlobs", `Quick, xml_blobs); ("XmlBlobs", `Quick, xml_blobs) ] )

let xml_empty_blobs () =
  Eio.Switch.run ~name:"XmlEmptyBlobs" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:(Some "<XmlEmptyBlobsResponse>\n    <data></data>\n</XmlEmptyBlobsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response = XmlEmptyBlobs.request ctx { data = None } in
  match response with
  | Ok result ->
      let expected =
        ({ data = Some (Smaws_Lib.CoreTypes.Blob.of_string "") } : Types.xml_empty_blobs_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_empty_blobs_response
           Types.equal_xml_empty_blobs_response)
        "expected output" expected result
  | Error error -> failwith (XmlEmptyBlobs.error_to_string error)

let xml_empty_self_closed_blobs () =
  Eio.Switch.run ~name:"XmlEmptySelfClosedBlobs" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "<XmlEmptyBlobsResponse>\n    <data/>\n</XmlEmptyBlobsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response = XmlEmptyBlobs.request ctx { data = None } in
  match response with
  | Ok result ->
      let expected =
        ({ data = Some (Smaws_Lib.CoreTypes.Blob.of_string "") } : Types.xml_empty_blobs_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_empty_blobs_response
           Types.equal_xml_empty_blobs_response)
        "expected output" expected result
  | Error error -> failwith (XmlEmptyBlobs.error_to_string error)

let xml_empty_blobs_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#XmlEmptyBlobs",
    [
      ("XmlEmptyBlobs", `Quick, xml_empty_blobs);
      ("XmlEmptySelfClosedBlobs", `Quick, xml_empty_self_closed_blobs);
    ] )

let xml_empty_lists () =
  Eio.Switch.run ~name:"XmlEmptyLists" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_empty_lists_request =
    {
      string_list = Some [];
      string_set = Some [];
      integer_list = None;
      boolean_list = None;
      timestamp_list = None;
      enum_list = None;
      int_enum_list = None;
      nested_string_list = None;
      renamed_list_members = None;
      flattened_list = None;
      flattened_list2 = None;
      flattened_list_with_member_namespace = None;
      flattened_list_with_namespace = None;
      structure_list = None;
      flattened_structure_list = None;
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = XmlEmptyLists.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<XmlEmptyListsRequest>\n\
         \        <stringList></stringList>\n\
         \        <stringSet></stringSet>\n\
          </XmlEmptyListsRequest>\n")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri" (Uri.of_string "/XmlEmptyLists")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let xml_empty_lists () =
  Eio.Switch.run ~name:"XmlEmptyLists" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlEmptyListsResponse>\n\
         \        <stringList/>\n\
         \        <stringSet></stringSet>\n\
          </XmlEmptyListsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response =
    XmlEmptyLists.request ctx
      {
        string_list = None;
        string_set = None;
        integer_list = None;
        boolean_list = None;
        timestamp_list = None;
        enum_list = None;
        int_enum_list = None;
        nested_string_list = None;
        renamed_list_members = None;
        flattened_list = None;
        flattened_list2 = None;
        flattened_list_with_member_namespace = None;
        flattened_list_with_namespace = None;
        structure_list = None;
        flattened_structure_list = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           string_list = Some [];
           string_set = Some [];
           integer_list = None;
           boolean_list = None;
           timestamp_list = None;
           enum_list = None;
           int_enum_list = None;
           nested_string_list = None;
           renamed_list_members = None;
           flattened_list = None;
           flattened_list2 = None;
           flattened_list_with_member_namespace = None;
           flattened_list_with_namespace = None;
           structure_list = None;
           flattened_structure_list = None;
         }
          : Types.xml_empty_lists_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_empty_lists_response
           Types.equal_xml_empty_lists_response)
        "expected output" expected result
  | Error error -> failwith (XmlEmptyLists.error_to_string error)

let xml_empty_lists_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#XmlEmptyLists",
    [ ("XmlEmptyLists", `Quick, xml_empty_lists); ("XmlEmptyLists", `Quick, xml_empty_lists) ] )

let xml_empty_maps () =
  Eio.Switch.run ~name:"XmlEmptyMaps" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_empty_maps_request = { my_map = Some [] } in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = XmlEmptyMaps.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some "<XmlEmptyMapsRequest>\n    <myMap></myMap>\n</XmlEmptyMapsRequest>\n")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri" (Uri.of_string "/XmlEmptyMaps")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let xml_empty_maps () =
  Eio.Switch.run ~name:"XmlEmptyMaps" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:(Some "<XmlEmptyMapsResponse>\n    <myMap></myMap>\n</XmlEmptyMapsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response = XmlEmptyMaps.request ctx { my_map = None } in
  match response with
  | Ok result ->
      let expected = ({ my_map = Some [] } : Types.xml_empty_maps_response) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_empty_maps_response
           Types.equal_xml_empty_maps_response)
        "expected output" expected result
  | Error error -> failwith (XmlEmptyMaps.error_to_string error)

let xml_empty_self_closed_maps () =
  Eio.Switch.run ~name:"XmlEmptySelfClosedMaps" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "<XmlEmptyMapsResponse>\n    <myMap/>\n</XmlEmptyMapsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response = XmlEmptyMaps.request ctx { my_map = None } in
  match response with
  | Ok result ->
      let expected = ({ my_map = Some [] } : Types.xml_empty_maps_response) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_empty_maps_response
           Types.equal_xml_empty_maps_response)
        "expected output" expected result
  | Error error -> failwith (XmlEmptyMaps.error_to_string error)

let xml_empty_maps_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#XmlEmptyMaps",
    [
      ("XmlEmptyMaps", `Quick, xml_empty_maps);
      ("XmlEmptyMaps", `Quick, xml_empty_maps);
      ("XmlEmptySelfClosedMaps", `Quick, xml_empty_self_closed_maps);
    ] )

let xml_empty_strings () =
  Eio.Switch.run ~name:"XmlEmptyStrings" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_empty_strings_request = { empty_string = Some "" } in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = XmlEmptyStrings.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some "<XmlEmptyStringsRequest>\n    <emptyString></emptyString>\n</XmlEmptyStringsRequest>\n")
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
      (Uri.of_string "/XmlEmptyStrings")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let xml_empty_strings () =
  Eio.Switch.run ~name:"XmlEmptyStrings" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlEmptyStringsResponse>\n    <emptyString></emptyString>\n</XmlEmptyStringsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response = XmlEmptyStrings.request ctx { empty_string = None } in
  match response with
  | Ok result ->
      let expected = ({ empty_string = Some "" } : Types.xml_empty_strings_response) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_empty_strings_response
           Types.equal_xml_empty_strings_response)
        "expected output" expected result
  | Error error -> failwith (XmlEmptyStrings.error_to_string error)

let xml_empty_self_closed_strings () =
  Eio.Switch.run ~name:"XmlEmptySelfClosedStrings" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:(Some "<XmlEmptyStringsResponse>\n    <emptyString/>\n</XmlEmptyStringsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response = XmlEmptyStrings.request ctx { empty_string = None } in
  match response with
  | Ok result ->
      let expected = ({ empty_string = Some "" } : Types.xml_empty_strings_response) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_empty_strings_response
           Types.equal_xml_empty_strings_response)
        "expected output" expected result
  | Error error -> failwith (XmlEmptyStrings.error_to_string error)

let xml_empty_strings_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#XmlEmptyStrings",
    [
      ("XmlEmptyStrings", `Quick, xml_empty_strings);
      ("XmlEmptyStrings", `Quick, xml_empty_strings);
      ("XmlEmptySelfClosedStrings", `Quick, xml_empty_self_closed_strings);
    ] )

let xml_enums () =
  Eio.Switch.run ~name:"XmlEnums" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_enums_request =
    {
      foo_enum1 = Some FOO;
      foo_enum2 = Some ZERO;
      foo_enum3 = Some ONE;
      foo_enum_list = Some [ FOO; ZERO ];
      foo_enum_set = Some [ FOO; ZERO ];
      foo_enum_map = Some [ ("hi", FOO); ("zero", ZERO) ];
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = XmlEnums.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<XmlEnumsRequest>\n\
         \    <fooEnum1>Foo</fooEnum1>\n\
         \    <fooEnum2>0</fooEnum2>\n\
         \    <fooEnum3>1</fooEnum3>\n\
         \    <fooEnumList>\n\
         \        <member>Foo</member>\n\
         \        <member>0</member>\n\
         \    </fooEnumList>\n\
         \    <fooEnumSet>\n\
         \        <member>Foo</member>\n\
         \        <member>0</member>\n\
         \    </fooEnumSet>\n\
         \    <fooEnumMap>\n\
         \        <entry>\n\
         \            <key>hi</key>\n\
         \            <value>Foo</value>\n\
         \        </entry>\n\
         \        <entry>\n\
         \            <key>zero</key>\n\
         \            <value>0</value>\n\
         \        </entry>\n\
         \    </fooEnumMap>\n\
          </XmlEnumsRequest>\n")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri" (Uri.of_string "/XmlEnums")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let xml_enums () =
  Eio.Switch.run ~name:"XmlEnums" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlEnumsResponse>\n\
         \    <fooEnum1>Foo</fooEnum1>\n\
         \    <fooEnum2>0</fooEnum2>\n\
         \    <fooEnum3>1</fooEnum3>\n\
         \    <fooEnumList>\n\
         \        <member>Foo</member>\n\
         \        <member>0</member>\n\
         \    </fooEnumList>\n\
         \    <fooEnumSet>\n\
         \        <member>Foo</member>\n\
         \        <member>0</member>\n\
         \    </fooEnumSet>\n\
         \    <fooEnumMap>\n\
         \        <entry>\n\
         \            <key>hi</key>\n\
         \            <value>Foo</value>\n\
         \        </entry>\n\
         \        <entry>\n\
         \            <key>zero</key>\n\
         \            <value>0</value>\n\
         \        </entry>\n\
         \    </fooEnumMap>\n\
          </XmlEnumsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response =
    XmlEnums.request ctx
      {
        foo_enum1 = None;
        foo_enum2 = None;
        foo_enum3 = None;
        foo_enum_list = None;
        foo_enum_set = None;
        foo_enum_map = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           foo_enum1 = Some FOO;
           foo_enum2 = Some ZERO;
           foo_enum3 = Some ONE;
           foo_enum_list = Some [ FOO; ZERO ];
           foo_enum_set = Some [ FOO; ZERO ];
           foo_enum_map = Some [ ("hi", FOO); ("zero", ZERO) ];
         }
          : Types.xml_enums_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_enums_response Types.equal_xml_enums_response)
        "expected output" expected result
  | Error error -> failwith (XmlEnums.error_to_string error)

let xml_enums_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#XmlEnums",
    [ ("XmlEnums", `Quick, xml_enums); ("XmlEnums", `Quick, xml_enums) ] )

let xml_int_enums () =
  Eio.Switch.run ~name:"XmlIntEnums" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_int_enums_request =
    {
      int_enum1 = Some A;
      int_enum2 = Some B;
      int_enum3 = Some C;
      int_enum_list = Some [ A; B ];
      int_enum_set = Some [ A; B ];
      int_enum_map = Some [ ("a", A); ("b", B) ];
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = XmlIntEnums.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<XmlIntEnumsRequest>\n\
         \    <intEnum1>1</intEnum1>\n\
         \    <intEnum2>2</intEnum2>\n\
         \    <intEnum3>3</intEnum3>\n\
         \    <intEnumList>\n\
         \        <member>1</member>\n\
         \        <member>2</member>\n\
         \    </intEnumList>\n\
         \    <intEnumSet>\n\
         \        <member>1</member>\n\
         \        <member>2</member>\n\
         \    </intEnumSet>\n\
         \    <intEnumMap>\n\
         \        <entry>\n\
         \            <key>a</key>\n\
         \            <value>1</value>\n\
         \        </entry>\n\
         \        <entry>\n\
         \            <key>b</key>\n\
         \            <value>2</value>\n\
         \        </entry>\n\
         \    </intEnumMap>\n\
          </XmlIntEnumsRequest>\n")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri" (Uri.of_string "/XmlIntEnums")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let xml_int_enums () =
  Eio.Switch.run ~name:"XmlIntEnums" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlIntEnumsResponse>\n\
         \    <intEnum1>1</intEnum1>\n\
         \    <intEnum2>2</intEnum2>\n\
         \    <intEnum3>3</intEnum3>\n\
         \    <intEnumList>\n\
         \        <member>1</member>\n\
         \        <member>2</member>\n\
         \    </intEnumList>\n\
         \    <intEnumSet>\n\
         \        <member>1</member>\n\
         \        <member>2</member>\n\
         \    </intEnumSet>\n\
         \    <intEnumMap>\n\
         \        <entry>\n\
         \            <key>a</key>\n\
         \            <value>1</value>\n\
         \        </entry>\n\
         \        <entry>\n\
         \            <key>b</key>\n\
         \            <value>2</value>\n\
         \        </entry>\n\
         \    </intEnumMap>\n\
          </XmlIntEnumsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response =
    XmlIntEnums.request ctx
      {
        int_enum1 = None;
        int_enum2 = None;
        int_enum3 = None;
        int_enum_list = None;
        int_enum_set = None;
        int_enum_map = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           int_enum1 = Some A;
           int_enum2 = Some B;
           int_enum3 = Some C;
           int_enum_list = Some [ A; B ];
           int_enum_set = Some [ A; B ];
           int_enum_map = Some [ ("a", A); ("b", B) ];
         }
          : Types.xml_int_enums_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_int_enums_response
           Types.equal_xml_int_enums_response)
        "expected output" expected result
  | Error error -> failwith (XmlIntEnums.error_to_string error)

let xml_int_enums_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#XmlIntEnums",
    [ ("XmlIntEnums", `Quick, xml_int_enums); ("XmlIntEnums", `Quick, xml_int_enums) ] )

let xml_lists () =
  Eio.Switch.run ~name:"XmlLists" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_lists_request =
    {
      string_list = Some [ "foo"; "bar" ];
      string_set = Some [ "foo"; "bar" ];
      integer_list = Some [ 1; 2 ];
      boolean_list = Some [ true; false ];
      timestamp_list =
        Some
          [
            Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1398796238.);
            Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1398796238.);
          ];
      enum_list = Some [ FOO; ZERO ];
      int_enum_list = Some [ A; B ];
      nested_string_list = Some [ [ "foo"; "bar" ]; [ "baz"; "qux" ] ];
      renamed_list_members = Some [ "foo"; "bar" ];
      flattened_list = Some [ "hi"; "bye" ];
      flattened_list2 = Some [ "yep"; "nope" ];
      flattened_list_with_member_namespace = None;
      flattened_list_with_namespace = None;
      structure_list = Some [ { a = Some "1"; b = Some "2" }; { a = Some "3"; b = Some "4" } ];
      flattened_structure_list =
        Some [ { a = Some "5"; b = Some "6" }; { a = Some "7"; b = Some "8" } ];
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = XmlLists.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<XmlListsRequest>\n\
         \    <stringList>\n\
         \        <member>foo</member>\n\
         \        <member>bar</member>\n\
         \    </stringList>\n\
         \    <stringSet>\n\
         \        <member>foo</member>\n\
         \        <member>bar</member>\n\
         \    </stringSet>\n\
         \    <integerList>\n\
         \        <member>1</member>\n\
         \        <member>2</member>\n\
         \    </integerList>\n\
         \    <booleanList>\n\
         \        <member>true</member>\n\
         \        <member>false</member>\n\
         \    </booleanList>\n\
         \    <timestampList>\n\
         \        <member>2014-04-29T18:30:38Z</member>\n\
         \        <member>2014-04-29T18:30:38Z</member>\n\
         \    </timestampList>\n\
         \    <enumList>\n\
         \        <member>Foo</member>\n\
         \        <member>0</member>\n\
         \    </enumList>\n\
         \    <intEnumList>\n\
         \        <member>1</member>\n\
         \        <member>2</member>\n\
         \    </intEnumList>\n\
         \    <nestedStringList>\n\
         \        <member>\n\
         \            <member>foo</member>\n\
         \            <member>bar</member>\n\
         \        </member>\n\
         \        <member>\n\
         \            <member>baz</member>\n\
         \            <member>qux</member>\n\
         \        </member>\n\
         \    </nestedStringList>\n\
         \    <renamed>\n\
         \        <item>foo</item>\n\
         \        <item>bar</item>\n\
         \    </renamed>\n\
         \    <flattenedList>hi</flattenedList>\n\
         \    <flattenedList>bye</flattenedList>\n\
         \    <customName>yep</customName>\n\
         \    <customName>nope</customName>\n\
         \    <myStructureList>\n\
         \        <item>\n\
         \            <value>1</value>\n\
         \            <other>2</other>\n\
         \        </item>\n\
         \        <item>\n\
         \            <value>3</value>\n\
         \            <other>4</other>\n\
         \        </item>\n\
         \    </myStructureList>\n\
         \    <flattenedStructureList>\n\
         \        <value>5</value>\n\
         \        <other>6</other>\n\
         \    </flattenedStructureList>\n\
         \    <flattenedStructureList>\n\
         \        <value>7</value>\n\
         \        <other>8</other>\n\
         \    </flattenedStructureList>\n\
          </XmlListsRequest>\n")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri" (Uri.of_string "/XmlLists")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let xml_lists () =
  Eio.Switch.run ~name:"XmlLists" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlListsResponse>\n\
         \    <stringList>\n\
         \        <member>foo</member>\n\
         \        <member>bar</member>\n\
         \    </stringList>\n\
         \    <stringSet>\n\
         \        <member>foo</member>\n\
         \        <member>bar</member>\n\
         \    </stringSet>\n\
         \    <integerList>\n\
         \        <member>1</member>\n\
         \        <member>2</member>\n\
         \    </integerList>\n\
         \    <booleanList>\n\
         \        <member>true</member>\n\
         \        <member>false</member>\n\
         \    </booleanList>\n\
         \    <timestampList>\n\
         \        <member>2014-04-29T18:30:38Z</member>\n\
         \        <member>2014-04-29T18:30:38Z</member>\n\
         \    </timestampList>\n\
         \    <enumList>\n\
         \        <member>Foo</member>\n\
         \        <member>0</member>\n\
         \    </enumList>\n\
         \    <intEnumList>\n\
         \        <member>1</member>\n\
         \        <member>2</member>\n\
         \    </intEnumList>\n\
         \    <nestedStringList>\n\
         \        <member>\n\
         \            <member>foo</member>\n\
         \            <member>bar</member>\n\
         \        </member>\n\
         \        <member>\n\
         \            <member>baz</member>\n\
         \            <member>qux</member>\n\
         \        </member>\n\
         \    </nestedStringList>\n\
         \    <renamed>\n\
         \        <item>foo</item>\n\
         \        <item>bar</item>\n\
         \    </renamed>\n\
         \    <flattenedList>hi</flattenedList>\n\
         \    <flattenedList>bye</flattenedList>\n\
         \    <customName>yep</customName>\n\
         \    <customName>nope</customName>\n\
         \    <flattenedListWithMemberNamespace \
          xmlns=\"https://xml-member.example.com\">a</flattenedListWithMemberNamespace>\n\
         \    <flattenedListWithMemberNamespace \
          xmlns=\"https://xml-member.example.com\">b</flattenedListWithMemberNamespace>\n\
         \    <flattenedListWithNamespace>a</flattenedListWithNamespace>\n\
         \    <flattenedListWithNamespace>b</flattenedListWithNamespace>\n\
         \    <myStructureList>\n\
         \        <item>\n\
         \            <value>1</value>\n\
         \            <other>2</other>\n\
         \        </item>\n\
         \        <item>\n\
         \            <value>3</value>\n\
         \            <other>4</other>\n\
         \        </item>\n\
         \    </myStructureList>\n\
         \    <flattenedStructureList>\n\
         \        <value>5</value>\n\
         \        <other>6</other>\n\
         \    </flattenedStructureList>\n\
         \    <flattenedStructureList>\n\
         \        <value>7</value>\n\
         \        <other>8</other>\n\
         \    </flattenedStructureList>\n\
          </XmlListsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response =
    XmlLists.request ctx
      {
        string_list = None;
        string_set = None;
        integer_list = None;
        boolean_list = None;
        timestamp_list = None;
        enum_list = None;
        int_enum_list = None;
        nested_string_list = None;
        renamed_list_members = None;
        flattened_list = None;
        flattened_list2 = None;
        flattened_list_with_member_namespace = None;
        flattened_list_with_namespace = None;
        structure_list = None;
        flattened_structure_list = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           string_list = Some [ "foo"; "bar" ];
           string_set = Some [ "foo"; "bar" ];
           integer_list = Some [ 1; 2 ];
           boolean_list = Some [ true; false ];
           timestamp_list =
             Some
               [
                 Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1398796238.);
                 Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1398796238.);
               ];
           enum_list = Some [ FOO; ZERO ];
           int_enum_list = Some [ A; B ];
           nested_string_list = Some [ [ "foo"; "bar" ]; [ "baz"; "qux" ] ];
           renamed_list_members = Some [ "foo"; "bar" ];
           flattened_list = Some [ "hi"; "bye" ];
           flattened_list2 = Some [ "yep"; "nope" ];
           flattened_list_with_member_namespace = Some [ "a"; "b" ];
           flattened_list_with_namespace = Some [ "a"; "b" ];
           structure_list = Some [ { a = Some "1"; b = Some "2" }; { a = Some "3"; b = Some "4" } ];
           flattened_structure_list =
             Some [ { a = Some "5"; b = Some "6" }; { a = Some "7"; b = Some "8" } ];
         }
          : Types.xml_lists_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_lists_response Types.equal_xml_lists_response)
        "expected output" expected result
  | Error error -> failwith (XmlLists.error_to_string error)

let xml_lists_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#XmlLists",
    [ ("XmlLists", `Quick, xml_lists); ("XmlLists", `Quick, xml_lists) ] )

let xml_maps () =
  Eio.Switch.run ~name:"XmlMaps" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_maps_request =
    { my_map = Some [ ("foo", { hi = Some "there" }); ("baz", { hi = Some "bye" }) ] }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = XmlMaps.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<XmlMapsRequest>\n\
         \    <myMap>\n\
         \        <entry>\n\
         \            <key>foo</key>\n\
         \            <value>\n\
         \                <hi>there</hi>\n\
         \            </value>\n\
         \        </entry>\n\
         \        <entry>\n\
         \            <key>baz</key>\n\
         \            <value>\n\
         \                <hi>bye</hi>\n\
         \            </value>\n\
         \        </entry>\n\
         \    </myMap>\n\
          </XmlMapsRequest>\n")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri" (Uri.of_string "/XmlMaps")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let xml_maps () =
  Eio.Switch.run ~name:"XmlMaps" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlMapsResponse>\n\
         \    <myMap>\n\
         \        <entry>\n\
         \            <key>foo</key>\n\
         \            <value>\n\
         \                <hi>there</hi>\n\
         \            </value>\n\
         \        </entry>\n\
         \        <entry>\n\
         \            <key>baz</key>\n\
         \            <value>\n\
         \                <hi>bye</hi>\n\
         \            </value>\n\
         \        </entry>\n\
         \    </myMap>\n\
          </XmlMapsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response = XmlMaps.request ctx { my_map = None } in
  match response with
  | Ok result ->
      let expected =
        ({ my_map = Some [ ("foo", { hi = Some "there" }); ("baz", { hi = Some "bye" }) ] }
          : Types.xml_maps_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_maps_response Types.equal_xml_maps_response)
        "expected output" expected result
  | Error error -> failwith (XmlMaps.error_to_string error)

let xml_maps_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#XmlMaps",
    [ ("XmlMaps", `Quick, xml_maps); ("XmlMaps", `Quick, xml_maps) ] )

let xml_maps_xml_name () =
  Eio.Switch.run ~name:"XmlMapsXmlName" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_maps_xml_name_request =
    { my_map = Some [ ("foo", { hi = Some "there" }); ("baz", { hi = Some "bye" }) ] }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = XmlMapsXmlName.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<XmlMapsXmlNameRequest>\n\
         \    <myMap>\n\
         \        <entry>\n\
         \            <Attribute>foo</Attribute>\n\
         \            <Setting>\n\
         \                <hi>there</hi>\n\
         \            </Setting>\n\
         \        </entry>\n\
         \        <entry>\n\
         \            <Attribute>baz</Attribute>\n\
         \            <Setting>\n\
         \                <hi>bye</hi>\n\
         \            </Setting>\n\
         \        </entry>\n\
         \    </myMap>\n\
          </XmlMapsXmlNameRequest>\n")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/XmlMapsXmlName") request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let xml_maps_xml_name () =
  Eio.Switch.run ~name:"XmlMapsXmlName" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlMapsXmlNameResponse>\n\
         \    <myMap>\n\
         \        <entry>\n\
         \            <Attribute>foo</Attribute>\n\
         \            <Setting>\n\
         \                <hi>there</hi>\n\
         \            </Setting>\n\
         \        </entry>\n\
         \        <entry>\n\
         \            <Attribute>baz</Attribute>\n\
         \            <Setting>\n\
         \                <hi>bye</hi>\n\
         \            </Setting>\n\
         \        </entry>\n\
         \    </myMap>\n\
          </XmlMapsXmlNameResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response = XmlMapsXmlName.request ctx { my_map = None } in
  match response with
  | Ok result ->
      let expected =
        ({ my_map = Some [ ("foo", { hi = Some "there" }); ("baz", { hi = Some "bye" }) ] }
          : Types.xml_maps_xml_name_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_maps_xml_name_response
           Types.equal_xml_maps_xml_name_response)
        "expected output" expected result
  | Error error -> failwith (XmlMapsXmlName.error_to_string error)

let xml_maps_xml_name_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#XmlMapsXmlName",
    [ ("XmlMapsXmlName", `Quick, xml_maps_xml_name); ("XmlMapsXmlName", `Quick, xml_maps_xml_name) ]
  )

let rest_xml_xml_map_with_xml_namespace () =
  Eio.Switch.run ~name:"RestXmlXmlMapWithXmlNamespace" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_map_with_xml_namespace_request =
    { my_map = Some [ ("a", "A"); ("b", "B") ] }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = XmlMapWithXmlNamespace.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<XmlMapWithXmlNamespaceRequest>\n\
         \    <KVP xmlns=\"https://the-member.example.com\">\n\
         \        <entry>\n\
         \            <K xmlns=\"https://the-key.example.com\">a</K>\n\
         \            <V xmlns=\"https://the-value.example.com\">A</V>\n\
         \        </entry>\n\
         \        <entry>\n\
         \            <K xmlns=\"https://the-key.example.com\">b</K>\n\
         \            <V xmlns=\"https://the-value.example.com\">B</V>\n\
         \        </entry>\n\
         \    </KVP>\n\
          </XmlMapWithXmlNamespaceRequest>")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/XmlMapWithXmlNamespace")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let rest_xml_xml_map_with_xml_namespace () =
  Eio.Switch.run ~name:"RestXmlXmlMapWithXmlNamespace" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlMapWithXmlNamespaceResponse>\n\
         \    <KVP xmlns=\"https://the-member.example.com\">\n\
         \        <entry>\n\
         \            <K xmlns=\"https://the-key.example.com\">a</K>\n\
         \            <V xmlns=\"https://the-value.example.com\">A</V>\n\
         \        </entry>\n\
         \        <entry>\n\
         \            <K xmlns=\"https://the-key.example.com\">b</K>\n\
         \            <V xmlns=\"https://the-value.example.com\">B</V>\n\
         \        </entry>\n\
         \    </KVP>\n\
          </XmlMapWithXmlNamespaceResponse>")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response = XmlMapWithXmlNamespace.request ctx { my_map = None } in
  match response with
  | Ok result ->
      let expected =
        ({ my_map = Some [ ("a", "A"); ("b", "B") ] } : Types.xml_map_with_xml_namespace_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_map_with_xml_namespace_response
           Types.equal_xml_map_with_xml_namespace_response)
        "expected output" expected result
  | Error error -> failwith (XmlMapWithXmlNamespace.error_to_string error)

let xml_map_with_xml_namespace_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#XmlMapWithXmlNamespace",
    [
      ("RestXmlXmlMapWithXmlNamespace", `Quick, rest_xml_xml_map_with_xml_namespace);
      ("RestXmlXmlMapWithXmlNamespace", `Quick, rest_xml_xml_map_with_xml_namespace);
    ] )

let xml_namespaces () =
  Eio.Switch.run ~name:"XmlNamespaces" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_namespaces_request =
    { nested = Some { foo = Some "Foo"; values = Some [ "Bar"; "Baz" ] } }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = XmlNamespaces.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<XmlNamespacesRequest xmlns=\"http://foo.com\">\n\
         \    <nested>\n\
         \        <foo xmlns:baz=\"http://baz.com\">Foo</foo>\n\
         \        <values xmlns=\"http://qux.com\">\n\
         \            <member xmlns=\"http://bux.com\">Bar</member>\n\
         \            <member xmlns=\"http://bux.com\">Baz</member>\n\
         \        </values>\n\
         \    </nested>\n\
          </XmlNamespacesRequest>\n")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri" (Uri.of_string "/XmlNamespaces")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let xml_namespaces () =
  Eio.Switch.run ~name:"XmlNamespaces" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlNamespacesResponse xmlns=\"http://foo.com\">\n\
         \    <nested>\n\
         \        <foo xmlns:baz=\"http://baz.com\">Foo</foo>\n\
         \        <values xmlns=\"http://qux.com\">\n\
         \            <member xmlns=\"http://bux.com\">Bar</member>\n\
         \            <member xmlns=\"http://bux.com\">Baz</member>\n\
         \        </values>\n\
         \    </nested>\n\
          </XmlNamespacesResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response = XmlNamespaces.request ctx { nested = None } in
  match response with
  | Ok result ->
      let expected =
        ({ nested = Some { foo = Some "Foo"; values = Some [ "Bar"; "Baz" ] } }
          : Types.xml_namespaces_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_namespaces_response
           Types.equal_xml_namespaces_response)
        "expected output" expected result
  | Error error -> failwith (XmlNamespaces.error_to_string error)

let xml_namespaces_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#XmlNamespaces",
    [ ("XmlNamespaces", `Quick, xml_namespaces); ("XmlNamespaces", `Quick, xml_namespaces) ] )

let xml_timestamps () =
  Eio.Switch.run ~name:"XmlTimestamps" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_timestamps_request =
    {
      normal = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1398796238.));
      date_time = None;
      date_time_on_target = None;
      epoch_seconds = None;
      epoch_seconds_on_target = None;
      http_date = None;
      http_date_on_target = None;
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = XmlTimestamps.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<XmlTimestampsRequest>\n\
         \    <normal>2014-04-29T18:30:38Z</normal>\n\
          </XmlTimestampsRequest>\n")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri" (Uri.of_string "/XmlTimestamps")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let xml_timestamps_with_date_time_format () =
  Eio.Switch.run ~name:"XmlTimestampsWithDateTimeFormat" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_timestamps_request =
    {
      normal = None;
      date_time = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1398796238.));
      date_time_on_target = None;
      epoch_seconds = None;
      epoch_seconds_on_target = None;
      http_date = None;
      http_date_on_target = None;
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = XmlTimestamps.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<XmlTimestampsRequest>\n\
         \    <dateTime>2014-04-29T18:30:38Z</dateTime>\n\
          </XmlTimestampsRequest>\n")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri" (Uri.of_string "/XmlTimestamps")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let xml_timestamps_with_date_time_on_target_format () =
  Eio.Switch.run ~name:"XmlTimestampsWithDateTimeOnTargetFormat" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_timestamps_request =
    {
      normal = None;
      date_time = None;
      date_time_on_target = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1398796238.));
      epoch_seconds = None;
      epoch_seconds_on_target = None;
      http_date = None;
      http_date_on_target = None;
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = XmlTimestamps.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<XmlTimestampsRequest>\n\
         \    <dateTimeOnTarget>2014-04-29T18:30:38Z</dateTimeOnTarget>\n\
          </XmlTimestampsRequest>\n")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri" (Uri.of_string "/XmlTimestamps")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let xml_timestamps_with_epoch_seconds_format () =
  Eio.Switch.run ~name:"XmlTimestampsWithEpochSecondsFormat" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_timestamps_request =
    {
      normal = None;
      date_time = None;
      date_time_on_target = None;
      epoch_seconds = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1398796238.));
      epoch_seconds_on_target = None;
      http_date = None;
      http_date_on_target = None;
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = XmlTimestamps.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<XmlTimestampsRequest>\n\
         \    <epochSeconds>1398796238</epochSeconds>\n\
          </XmlTimestampsRequest>\n")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri" (Uri.of_string "/XmlTimestamps")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let xml_timestamps_with_epoch_seconds_on_target_format () =
  Eio.Switch.run ~name:"XmlTimestampsWithEpochSecondsOnTargetFormat" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_timestamps_request =
    {
      normal = None;
      date_time = None;
      date_time_on_target = None;
      epoch_seconds = None;
      epoch_seconds_on_target =
        Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1398796238.));
      http_date = None;
      http_date_on_target = None;
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = XmlTimestamps.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<XmlTimestampsRequest>\n\
         \    <epochSecondsOnTarget>1398796238</epochSecondsOnTarget>\n\
          </XmlTimestampsRequest>\n")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri" (Uri.of_string "/XmlTimestamps")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let xml_timestamps_with_http_date_format () =
  Eio.Switch.run ~name:"XmlTimestampsWithHttpDateFormat" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_timestamps_request =
    {
      normal = None;
      date_time = None;
      date_time_on_target = None;
      epoch_seconds = None;
      epoch_seconds_on_target = None;
      http_date = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1398796238.));
      http_date_on_target = None;
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = XmlTimestamps.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<XmlTimestampsRequest>\n\
         \    <httpDate>Tue, 29 Apr 2014 18:30:38 GMT</httpDate>\n\
          </XmlTimestampsRequest>\n")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri" (Uri.of_string "/XmlTimestamps")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let xml_timestamps_with_http_date_on_target_format () =
  Eio.Switch.run ~name:"XmlTimestampsWithHttpDateOnTargetFormat" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_timestamps_request =
    {
      normal = None;
      date_time = None;
      date_time_on_target = None;
      epoch_seconds = None;
      epoch_seconds_on_target = None;
      http_date = None;
      http_date_on_target = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1398796238.));
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = XmlTimestamps.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<XmlTimestampsRequest>\n\
         \    <httpDateOnTarget>Tue, 29 Apr 2014 18:30:38 GMT</httpDateOnTarget>\n\
          </XmlTimestampsRequest>\n")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri" (Uri.of_string "/XmlTimestamps")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let xml_timestamps () =
  Eio.Switch.run ~name:"XmlTimestamps" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlTimestampsResponse>\n\
         \    <normal>2014-04-29T18:30:38Z</normal>\n\
          </XmlTimestampsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response =
    XmlTimestamps.request ctx
      {
        normal = None;
        date_time = None;
        date_time_on_target = None;
        epoch_seconds = None;
        epoch_seconds_on_target = None;
        http_date = None;
        http_date_on_target = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           normal = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1398796238.));
           date_time = None;
           date_time_on_target = None;
           epoch_seconds = None;
           epoch_seconds_on_target = None;
           http_date = None;
           http_date_on_target = None;
         }
          : Types.xml_timestamps_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_timestamps_response
           Types.equal_xml_timestamps_response)
        "expected output" expected result
  | Error error -> failwith (XmlTimestamps.error_to_string error)

let xml_timestamps_with_date_time_format () =
  Eio.Switch.run ~name:"XmlTimestampsWithDateTimeFormat" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlTimestampsResponse>\n\
         \    <dateTime>2014-04-29T18:30:38Z</dateTime>\n\
          </XmlTimestampsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response =
    XmlTimestamps.request ctx
      {
        normal = None;
        date_time = None;
        date_time_on_target = None;
        epoch_seconds = None;
        epoch_seconds_on_target = None;
        http_date = None;
        http_date_on_target = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           normal = None;
           date_time = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1398796238.));
           date_time_on_target = None;
           epoch_seconds = None;
           epoch_seconds_on_target = None;
           http_date = None;
           http_date_on_target = None;
         }
          : Types.xml_timestamps_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_timestamps_response
           Types.equal_xml_timestamps_response)
        "expected output" expected result
  | Error error -> failwith (XmlTimestamps.error_to_string error)

let xml_timestamps_with_date_time_on_target_format () =
  Eio.Switch.run ~name:"XmlTimestampsWithDateTimeOnTargetFormat" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlTimestampsResponse>\n\
         \    <dateTimeOnTarget>2014-04-29T18:30:38Z</dateTimeOnTarget>\n\
          </XmlTimestampsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response =
    XmlTimestamps.request ctx
      {
        normal = None;
        date_time = None;
        date_time_on_target = None;
        epoch_seconds = None;
        epoch_seconds_on_target = None;
        http_date = None;
        http_date_on_target = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           normal = None;
           date_time = None;
           date_time_on_target =
             Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1398796238.));
           epoch_seconds = None;
           epoch_seconds_on_target = None;
           http_date = None;
           http_date_on_target = None;
         }
          : Types.xml_timestamps_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_timestamps_response
           Types.equal_xml_timestamps_response)
        "expected output" expected result
  | Error error -> failwith (XmlTimestamps.error_to_string error)

let xml_timestamps_with_epoch_seconds_format () =
  Eio.Switch.run ~name:"XmlTimestampsWithEpochSecondsFormat" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlTimestampsResponse>\n\
         \    <epochSeconds>1398796238</epochSeconds>\n\
          </XmlTimestampsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response =
    XmlTimestamps.request ctx
      {
        normal = None;
        date_time = None;
        date_time_on_target = None;
        epoch_seconds = None;
        epoch_seconds_on_target = None;
        http_date = None;
        http_date_on_target = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           normal = None;
           date_time = None;
           date_time_on_target = None;
           epoch_seconds = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1398796238.));
           epoch_seconds_on_target = None;
           http_date = None;
           http_date_on_target = None;
         }
          : Types.xml_timestamps_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_timestamps_response
           Types.equal_xml_timestamps_response)
        "expected output" expected result
  | Error error -> failwith (XmlTimestamps.error_to_string error)

let xml_timestamps_with_epoch_seconds_on_target_format () =
  Eio.Switch.run ~name:"XmlTimestampsWithEpochSecondsOnTargetFormat" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlTimestampsResponse>\n\
         \    <epochSecondsOnTarget>1398796238</epochSecondsOnTarget>\n\
          </XmlTimestampsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response =
    XmlTimestamps.request ctx
      {
        normal = None;
        date_time = None;
        date_time_on_target = None;
        epoch_seconds = None;
        epoch_seconds_on_target = None;
        http_date = None;
        http_date_on_target = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           normal = None;
           date_time = None;
           date_time_on_target = None;
           epoch_seconds = None;
           epoch_seconds_on_target =
             Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1398796238.));
           http_date = None;
           http_date_on_target = None;
         }
          : Types.xml_timestamps_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_timestamps_response
           Types.equal_xml_timestamps_response)
        "expected output" expected result
  | Error error -> failwith (XmlTimestamps.error_to_string error)

let xml_timestamps_with_http_date_format () =
  Eio.Switch.run ~name:"XmlTimestampsWithHttpDateFormat" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlTimestampsResponse>\n\
         \    <httpDate>Tue, 29 Apr 2014 18:30:38 GMT</httpDate>\n\
          </XmlTimestampsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response =
    XmlTimestamps.request ctx
      {
        normal = None;
        date_time = None;
        date_time_on_target = None;
        epoch_seconds = None;
        epoch_seconds_on_target = None;
        http_date = None;
        http_date_on_target = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           normal = None;
           date_time = None;
           date_time_on_target = None;
           epoch_seconds = None;
           epoch_seconds_on_target = None;
           http_date = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1398796238.));
           http_date_on_target = None;
         }
          : Types.xml_timestamps_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_timestamps_response
           Types.equal_xml_timestamps_response)
        "expected output" expected result
  | Error error -> failwith (XmlTimestamps.error_to_string error)

let xml_timestamps_with_http_date_on_target_format () =
  Eio.Switch.run ~name:"XmlTimestampsWithHttpDateOnTargetFormat" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlTimestampsResponse>\n\
         \    <httpDateOnTarget>Tue, 29 Apr 2014 18:30:38 GMT</httpDateOnTarget>\n\
          </XmlTimestampsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response =
    XmlTimestamps.request ctx
      {
        normal = None;
        date_time = None;
        date_time_on_target = None;
        epoch_seconds = None;
        epoch_seconds_on_target = None;
        http_date = None;
        http_date_on_target = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           normal = None;
           date_time = None;
           date_time_on_target = None;
           epoch_seconds = None;
           epoch_seconds_on_target = None;
           http_date = None;
           http_date_on_target =
             Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1398796238.));
         }
          : Types.xml_timestamps_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_timestamps_response
           Types.equal_xml_timestamps_response)
        "expected output" expected result
  | Error error -> failwith (XmlTimestamps.error_to_string error)

let xml_timestamps_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#XmlTimestamps",
    [
      ("XmlTimestamps", `Quick, xml_timestamps);
      ("XmlTimestampsWithDateTimeFormat", `Quick, xml_timestamps_with_date_time_format);
      ( "XmlTimestampsWithDateTimeOnTargetFormat",
        `Quick,
        xml_timestamps_with_date_time_on_target_format );
      ("XmlTimestampsWithEpochSecondsFormat", `Quick, xml_timestamps_with_epoch_seconds_format);
      ( "XmlTimestampsWithEpochSecondsOnTargetFormat",
        `Quick,
        xml_timestamps_with_epoch_seconds_on_target_format );
      ("XmlTimestampsWithHttpDateFormat", `Quick, xml_timestamps_with_http_date_format);
      ( "XmlTimestampsWithHttpDateOnTargetFormat",
        `Quick,
        xml_timestamps_with_http_date_on_target_format );
      ("XmlTimestamps", `Quick, xml_timestamps);
      ("XmlTimestampsWithDateTimeFormat", `Quick, xml_timestamps_with_date_time_format);
      ( "XmlTimestampsWithDateTimeOnTargetFormat",
        `Quick,
        xml_timestamps_with_date_time_on_target_format );
      ("XmlTimestampsWithEpochSecondsFormat", `Quick, xml_timestamps_with_epoch_seconds_format);
      ( "XmlTimestampsWithEpochSecondsOnTargetFormat",
        `Quick,
        xml_timestamps_with_epoch_seconds_on_target_format );
      ("XmlTimestampsWithHttpDateFormat", `Quick, xml_timestamps_with_http_date_format);
      ( "XmlTimestampsWithHttpDateOnTargetFormat",
        `Quick,
        xml_timestamps_with_http_date_on_target_format );
    ] )

let xml_unions_with_struct_member () =
  Eio.Switch.run ~name:"XmlUnionsWithStructMember" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_unions_request =
    {
      union_value =
        Some
          (StructValue
             {
               string_value = Some "string";
               boolean_value = Some true;
               byte_value = Some 1;
               short_value = Some 2;
               integer_value = Some 3;
               long_value = Some (Smaws_Lib.CoreTypes.Int64.of_int 4);
               float_value = Some 5.5;
               double_value = Some 6.5;
             });
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = XmlUnions.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<XmlUnionsRequest>\n\
         \    <unionValue>\n\
         \       <structValue>\n\
         \          <stringValue>string</stringValue>\n\
         \          <booleanValue>true</booleanValue>\n\
         \          <byteValue>1</byteValue>\n\
         \          <shortValue>2</shortValue>\n\
         \          <integerValue>3</integerValue>\n\
         \          <longValue>4</longValue>\n\
         \          <floatValue>5.5</floatValue>\n\
         \          <doubleValue>6.5</doubleValue>\n\
         \       </structValue>\n\
         \    </unionValue>\n\
          </XmlUnionsRequest>\n")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri" (Uri.of_string "/XmlUnions")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let xml_unions_with_string_member () =
  Eio.Switch.run ~name:"XmlUnionsWithStringMember" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_unions_request = { union_value = Some (StringValue "some string") } in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = XmlUnions.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<XmlUnionsRequest>\n\
         \   <unionValue>\n\
         \      <stringValue>some string</stringValue>\n\
         \   </unionValue>\n\
          </XmlUnionsRequest>\n")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri" (Uri.of_string "/XmlUnions")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let xml_unions_with_boolean_member () =
  Eio.Switch.run ~name:"XmlUnionsWithBooleanMember" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_unions_request = { union_value = Some (BooleanValue true) } in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = XmlUnions.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<XmlUnionsRequest>\n\
         \   <unionValue>\n\
         \      <booleanValue>true</booleanValue>\n\
         \   </unionValue>\n\
          </XmlUnionsRequest>\n")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri" (Uri.of_string "/XmlUnions")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let xml_unions_with_union_member () =
  Eio.Switch.run ~name:"XmlUnionsWithUnionMember" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_unions_request = { union_value = Some (UnionValue (BooleanValue true)) } in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = XmlUnions.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<XmlUnionsRequest>\n\
         \   <unionValue>\n\
         \      <unionValue>\n\
         \         <booleanValue>true</booleanValue>\n\
         \      </unionValue>\n\
         \   </unionValue>\n\
          </XmlUnionsRequest>\n")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri" (Uri.of_string "/XmlUnions")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let xml_unions_with_struct_member () =
  Eio.Switch.run ~name:"XmlUnionsWithStructMember" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlUnionsResponse>\n\
         \    <unionValue>\n\
         \       <structValue>\n\
         \          <stringValue>string</stringValue>\n\
         \          <booleanValue>true</booleanValue>\n\
         \          <byteValue>1</byteValue>\n\
         \          <shortValue>2</shortValue>\n\
         \          <integerValue>3</integerValue>\n\
         \          <longValue>4</longValue>\n\
         \          <floatValue>5.5</floatValue>\n\
         \          <doubleValue>6.5</doubleValue>\n\
         \       </structValue>\n\
         \    </unionValue>\n\
          </XmlUnionsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response = XmlUnions.request ctx { union_value = None } in
  match response with
  | Ok result ->
      let expected =
        ({
           union_value =
             Some
               (StructValue
                  {
                    string_value = Some "string";
                    boolean_value = Some true;
                    byte_value = Some 1;
                    short_value = Some 2;
                    integer_value = Some 3;
                    long_value = Some (Smaws_Lib.CoreTypes.Int64.of_int 4);
                    float_value = Some 5.5;
                    double_value = Some 6.5;
                  });
         }
          : Types.xml_unions_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_unions_response
           Types.equal_xml_unions_response)
        "expected output" expected result
  | Error error -> failwith (XmlUnions.error_to_string error)

let xml_unions_with_string_member () =
  Eio.Switch.run ~name:"XmlUnionsWithStringMember" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlUnionsResponse>\n\
         \   <unionValue>\n\
         \      <stringValue>some string</stringValue>\n\
         \   </unionValue>\n\
          </XmlUnionsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response = XmlUnions.request ctx { union_value = None } in
  match response with
  | Ok result ->
      let expected =
        ({ union_value = Some (StringValue "some string") } : Types.xml_unions_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_unions_response
           Types.equal_xml_unions_response)
        "expected output" expected result
  | Error error -> failwith (XmlUnions.error_to_string error)

let xml_unions_with_boolean_member () =
  Eio.Switch.run ~name:"XmlUnionsWithBooleanMember" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlUnionsResponse>\n\
         \   <unionValue>\n\
         \      <booleanValue>true</booleanValue>\n\
         \   </unionValue>\n\
          </XmlUnionsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response = XmlUnions.request ctx { union_value = None } in
  match response with
  | Ok result ->
      let expected = ({ union_value = Some (BooleanValue true) } : Types.xml_unions_response) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_unions_response
           Types.equal_xml_unions_response)
        "expected output" expected result
  | Error error -> failwith (XmlUnions.error_to_string error)

let xml_unions_with_union_member () =
  Eio.Switch.run ~name:"XmlUnionsWithUnionMember" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<XmlUnionsResponse>\n\
         \   <unionValue>\n\
         \      <unionValue>\n\
         \         <booleanValue>true</booleanValue>\n\
         \      </unionValue>\n\
         \   </unionValue>\n\
          </XmlUnionsResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response = XmlUnions.request ctx { union_value = None } in
  match response with
  | Ok result ->
      let expected =
        ({ union_value = Some (UnionValue (BooleanValue true)) } : Types.xml_unions_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_unions_response
           Types.equal_xml_unions_response)
        "expected output" expected result
  | Error error -> failwith (XmlUnions.error_to_string error)

let xml_unions_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#XmlUnions",
    [
      ("XmlUnionsWithStructMember", `Quick, xml_unions_with_struct_member);
      ("XmlUnionsWithStringMember", `Quick, xml_unions_with_string_member);
      ("XmlUnionsWithBooleanMember", `Quick, xml_unions_with_boolean_member);
      ("XmlUnionsWithUnionMember", `Quick, xml_unions_with_union_member);
      ("XmlUnionsWithStructMember", `Quick, xml_unions_with_struct_member);
      ("XmlUnionsWithStringMember", `Quick, xml_unions_with_string_member);
      ("XmlUnionsWithBooleanMember", `Quick, xml_unions_with_boolean_member);
      ("XmlUnionsWithUnionMember", `Quick, xml_unions_with_union_member);
    ] )

let recursive_shapes () =
  Eio.Switch.run ~name:"RecursiveShapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.recursive_shapes_request =
    {
      nested =
        Some
          {
            foo = Some "Foo1";
            nested =
              Some
                {
                  bar = Some "Bar1";
                  recursive_member =
                    Some
                      {
                        foo = Some "Foo2";
                        nested = Some { bar = Some "Bar2"; recursive_member = None };
                      };
                };
          };
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = RecursiveShapes.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<RecursiveShapesRequest>\n\
         \    <nested>\n\
         \        <foo>Foo1</foo>\n\
         \        <nested>\n\
         \            <bar>Bar1</bar>\n\
         \            <recursiveMember>\n\
         \                <foo>Foo2</foo>\n\
         \                <nested>\n\
         \                    <bar>Bar2</bar>\n\
         \                </nested>\n\
         \            </recursiveMember>\n\
         \        </nested>\n\
         \    </nested>\n\
          </RecursiveShapesRequest>\n")
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
      (Uri.of_string "/RecursiveShapes")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let recursive_shapes () =
  Eio.Switch.run ~name:"RecursiveShapes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<RecursiveShapesResponse>\n\
         \    <nested>\n\
         \        <foo>Foo1</foo>\n\
         \        <nested>\n\
         \            <bar>Bar1</bar>\n\
         \            <recursiveMember>\n\
         \                <foo>Foo2</foo>\n\
         \                <nested>\n\
         \                    <bar>Bar2</bar>\n\
         \                </nested>\n\
         \            </recursiveMember>\n\
         \        </nested>\n\
         \    </nested>\n\
          </RecursiveShapesResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response = RecursiveShapes.request ctx { nested = None } in
  match response with
  | Ok result ->
      let expected =
        ({
           nested =
             Some
               {
                 foo = Some "Foo1";
                 nested =
                   Some
                     {
                       bar = Some "Bar1";
                       recursive_member =
                         Some
                           {
                             foo = Some "Foo2";
                             nested = Some { bar = Some "Bar2"; recursive_member = None };
                           };
                     };
               };
         }
          : Types.recursive_shapes_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_recursive_shapes_response
           Types.equal_recursive_shapes_response)
        "expected output" expected result
  | Error error -> failwith (RecursiveShapes.error_to_string error)

let recursive_shapes_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#RecursiveShapes",
    [ ("RecursiveShapes", `Quick, recursive_shapes); ("RecursiveShapes", `Quick, recursive_shapes) ]
  )

let rest_xml_query_precedence () =
  Eio.Switch.run ~name:"RestXmlQueryPrecedence" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.query_precedence_input =
    { foo = Some "named"; baz = Some [ ("bar", "fromMap"); ("qux", "alsoFromMap") ] }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = QueryPrecedence.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/Precedence?bar=named&qux=alsoFromMap")
      request.uri
  in
  let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
  ()

let query_precedence_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#QueryPrecedence",
    [ ("RestXmlQueryPrecedence", `Quick, rest_xml_query_precedence) ] )

let rest_xml_query_params_string_list_map () =
  Eio.Switch.run ~name:"RestXmlQueryParamsStringListMap" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.query_params_as_string_list_map_input =
    { qux = Some "named"; foo = Some [ ("baz", [ "bar"; "qux" ]) ] }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = QueryParamsAsStringListMap.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/StringListMap?corge=named&baz=bar&baz=qux")
      request.uri
  in
  let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
  ()

let query_params_as_string_list_map_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#QueryParamsAsStringListMap",
    [ ("RestXmlQueryParamsStringListMap", `Quick, rest_xml_query_params_string_list_map) ] )

let query_idempotency_token_auto_fill () =
  Eio.Switch.run ~name:"QueryIdempotencyTokenAutoFill" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.query_idempotency_token_auto_fill_input = { token = None } in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response =
    Smaws_Lib.Uuid.with_generator
      (fun _ -> "00000000-0000-4000-8000-000000000000")
      (fun () -> QueryIdempotencyTokenAutoFill.request ctx input)
  in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/QueryIdempotencyTokenAutoFill?token=00000000-0000-4000-8000-000000000000")
      request.uri
  in
  let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
  ()

let query_idempotency_token_auto_fill_is_set () =
  Eio.Switch.run ~name:"QueryIdempotencyTokenAutoFillIsSet" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.query_idempotency_token_auto_fill_input =
    { token = Some "00000000-0000-4000-8000-000000000000" }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = QueryIdempotencyTokenAutoFill.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/QueryIdempotencyTokenAutoFill?token=00000000-0000-4000-8000-000000000000")
      request.uri
  in
  let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
  ()

let query_idempotency_token_auto_fill_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#QueryIdempotencyTokenAutoFill",
    [
      ("QueryIdempotencyTokenAutoFill", `Quick, query_idempotency_token_auto_fill);
      ("QueryIdempotencyTokenAutoFillIsSet", `Quick, query_idempotency_token_auto_fill_is_set);
    ] )

let put_with_content_encoding_test_suite : unit Alcotest.test =
  ("aws.protocoltests.restxml#PutWithContentEncoding", [])

let rest_xml_omits_null_query () =
  Eio.Switch.run ~name:"RestXmlOmitsNullQuery" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.omits_null_serializes_empty_string_input =
    { null_value = None; empty_string = None }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = OmitsNullSerializesEmptyString.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/OmitsNullSerializesEmptyString")
      request.uri
  in
  let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
  ()

let rest_xml_serializes_empty_string () =
  Eio.Switch.run ~name:"RestXmlSerializesEmptyString" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.omits_null_serializes_empty_string_input =
    { null_value = None; empty_string = Some "" }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = OmitsNullSerializesEmptyString.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/OmitsNullSerializesEmptyString?Empty=")
      request.uri
  in
  let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
  ()

let omits_null_serializes_empty_string_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#OmitsNullSerializesEmptyString",
    [
      ("RestXmlOmitsNullQuery", `Quick, rest_xml_omits_null_query);
      ("RestXmlSerializesEmptyString", `Quick, rest_xml_serializes_empty_string);
    ] )

let null_and_empty_headers_server_test_suite : unit Alcotest.test =
  ("aws.protocoltests.restxml#NullAndEmptyHeadersServer", [])

let null_and_empty_headers () =
  Eio.Switch.run ~name:"NullAndEmptyHeaders" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.null_and_empty_headers_i_o = { a = None; b = Some ""; c = Some [] } in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = NullAndEmptyHeadersClient.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/NullAndEmptyHeadersClient")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("X-B", ""); ("X-C", "") ]
      request.headers
  in
  ()

let null_and_empty_headers_client_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#NullAndEmptyHeadersClient",
    [ ("NullAndEmptyHeaders", `Quick, null_and_empty_headers) ] )

let no_input_and_output () =
  Eio.Switch.run ~name:"NoInputAndOutput" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Smaws_Lib.Smithy_api.Types.unit_ = () in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = NoInputAndOutput.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/NoInputAndOutputOutput")
      request.uri
  in
  let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
  ()

let no_input_and_output () =
  Eio.Switch.run ~name:"NoInputAndOutput" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "") ~status:200 ~headers:[] ();
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
  ( "aws.protocoltests.restxml#NoInputAndOutput",
    [
      ("NoInputAndOutput", `Quick, no_input_and_output);
      ("NoInputAndOutput", `Quick, no_input_and_output);
    ] )

let no_input_and_no_output () =
  Eio.Switch.run ~name:"NoInputAndNoOutput" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Smaws_Lib.Smithy_api.Types.unit_ = () in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = NoInputAndNoOutput.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/NoInputAndNoOutput")
      request.uri
  in
  let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
  ()

let no_input_and_no_output () =
  Eio.Switch.run ~name:"NoInputAndNoOutput" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "") ~status:200 ~headers:[] ();
  let response = NoInputAndNoOutput.request ctx () in
  match response with
  | Ok result ->
      let expected = () in
      check Alcotest.unit "expected output" expected result
  | Error error -> failwith (NoInputAndNoOutput.error_to_string error)

let no_input_and_no_output_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#NoInputAndNoOutput",
    [
      ("NoInputAndNoOutput", `Quick, no_input_and_no_output);
      ("NoInputAndNoOutput", `Quick, no_input_and_no_output);
    ] )

let nested_xml_map_request () =
  Eio.Switch.run ~name:"NestedXmlMapRequest" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.nested_xml_maps_request =
    { nested_map = Some [ ("foo", [ ("bar", BAR) ]) ]; flat_nested_map = None }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = NestedXmlMaps.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<NestedXmlMapsRequest>\n\
         \    <nestedMap>\n\
         \        <entry>\n\
         \            <key>foo</key>\n\
         \            <value>\n\
         \                <entry>\n\
         \                    <key>bar</key>\n\
         \                    <value>Bar</value>\n\
         \                </entry>\n\
         \            </value>\n\
         \        </entry>\n\
         \    </nestedMap>\n\
          </NestedXmlMapsRequest>")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri" (Uri.of_string "/NestedXmlMaps")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let flat_nested_xml_map_request () =
  Eio.Switch.run ~name:"FlatNestedXmlMapRequest" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.nested_xml_maps_request =
    { nested_map = None; flat_nested_map = Some [ ("foo", [ ("bar", BAR) ]) ] }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = NestedXmlMaps.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<NestedXmlMapsRequest>\n\
         \    <flatNestedMap>\n\
         \        <key>foo</key>\n\
         \        <value>\n\
         \            <entry>\n\
         \                <key>bar</key>\n\
         \                <value>Bar</value>\n\
         \            </entry>\n\
         \        </value>\n\
         \    </flatNestedMap>\n\
          </NestedXmlMapsRequest>")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri" (Uri.of_string "/NestedXmlMaps")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let nested_xml_map_response () =
  Eio.Switch.run ~name:"NestedXmlMapResponse" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<NestedXmlMapsResponse>\n\
         \    <nestedMap>\n\
         \        <entry>\n\
         \            <key>foo</key>\n\
         \            <value>\n\
         \                <entry>\n\
         \                    <key>bar</key>\n\
         \                    <value>Bar</value>\n\
         \                </entry>\n\
         \            </value>\n\
         \        </entry>\n\
         \    </nestedMap>\n\
          </NestedXmlMapsResponse>")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response = NestedXmlMaps.request ctx { nested_map = None; flat_nested_map = None } in
  match response with
  | Ok result ->
      let expected =
        ({ nested_map = Some [ ("foo", [ ("bar", BAR) ]) ]; flat_nested_map = None }
          : Types.nested_xml_maps_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_nested_xml_maps_response
           Types.equal_nested_xml_maps_response)
        "expected output" expected result
  | Error error -> failwith (NestedXmlMaps.error_to_string error)

let flat_nested_xml_map_response () =
  Eio.Switch.run ~name:"FlatNestedXmlMapResponse" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<NestedXmlMapsResponse>\n\
         \    <flatNestedMap>\n\
         \        <key>foo</key>\n\
         \        <value>\n\
         \            <entry>\n\
         \                <key>bar</key>\n\
         \                <value>Bar</value>\n\
         \            </entry>\n\
         \        </value>\n\
         \    </flatNestedMap>\n\
          </NestedXmlMapsResponse>")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response = NestedXmlMaps.request ctx { nested_map = None; flat_nested_map = None } in
  match response with
  | Ok result ->
      let expected =
        ({ nested_map = None; flat_nested_map = Some [ ("foo", [ ("bar", BAR) ]) ] }
          : Types.nested_xml_maps_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_nested_xml_maps_response
           Types.equal_nested_xml_maps_response)
        "expected output" expected result
  | Error error -> failwith (NestedXmlMaps.error_to_string error)

let nested_xml_maps_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#NestedXmlMaps",
    [
      ("NestedXmlMapRequest", `Quick, nested_xml_map_request);
      ("FlatNestedXmlMapRequest", `Quick, flat_nested_xml_map_request);
      ("NestedXmlMapResponse", `Quick, nested_xml_map_response);
      ("FlatNestedXmlMapResponse", `Quick, flat_nested_xml_map_response);
    ] )

let nested_xml_map_with_xml_name_serializes () =
  Eio.Switch.run ~name:"NestedXmlMapWithXmlNameSerializes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.nested_xml_map_with_xml_name_request =
    {
      nested_xml_map_with_xml_name_map =
        Some
          [
            ("foo", [ ("bar", "Baz"); ("fizz", "Buzz") ]);
            ("qux", [ ("foobar", "Bar"); ("fizzbuzz", "Buzz") ]);
          ];
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = NestedXmlMapWithXmlName.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "    <NestedXmlMapWithXmlNameRequest>\n\
         \        <nestedXmlMapWithXmlNameMap>\n\
         \            <entry>\n\
         \                <OuterKey>foo</OuterKey>\n\
         \                <value>\n\
         \                    <entry>\n\
         \                        <InnerKey>bar</InnerKey>\n\
         \                        <InnerValue>Baz</InnerValue>\n\
         \                    </entry>\n\
         \                    <entry>\n\
         \                        <InnerKey>fizz</InnerKey>\n\
         \                        <InnerValue>Buzz</InnerValue>\n\
         \                    </entry>\n\
         \                </value>\n\
         \            </entry>\n\
         \            <entry>\n\
         \                <OuterKey>qux</OuterKey>\n\
         \                <value>\n\
         \                    <entry>\n\
         \                        <InnerKey>foobar</InnerKey>\n\
         \                        <InnerValue>Bar</InnerValue>\n\
         \                    </entry>\n\
         \                    <entry>\n\
         \                        <InnerKey>fizzbuzz</InnerKey>\n\
         \                        <InnerValue>Buzz</InnerValue>\n\
         \                    </entry>\n\
         \                </value>\n\
         \            </entry>\n\
         \        </nestedXmlMapWithXmlNameMap>\n\
         \    </NestedXmlMapWithXmlNameRequest>\n")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/NestedXmlMapWithXmlName")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let nested_xml_map_with_xml_name_deserializes () =
  Eio.Switch.run ~name:"NestedXmlMapWithXmlNameDeserializes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "    <NestedXmlMapWithXmlNameResponse>\n\
         \        <nestedXmlMapWithXmlNameMap>\n\
         \            <entry>\n\
         \                <OuterKey>foo</OuterKey>\n\
         \                <value>\n\
         \                    <entry>\n\
         \                        <InnerKey>bar</InnerKey>\n\
         \                        <InnerValue>Baz</InnerValue>\n\
         \                    </entry>\n\
         \                    <entry>\n\
         \                        <InnerKey>fizz</InnerKey>\n\
         \                        <InnerValue>Buzz</InnerValue>\n\
         \                    </entry>\n\
         \                </value>\n\
         \            </entry>\n\
         \            <entry>\n\
         \                <OuterKey>qux</OuterKey>\n\
         \                <value>\n\
         \                    <entry>\n\
         \                        <InnerKey>foobar</InnerKey>\n\
         \                        <InnerValue>Bar</InnerValue>\n\
         \                    </entry>\n\
         \                    <entry>\n\
         \                        <InnerKey>fizzbuzz</InnerKey>\n\
         \                        <InnerValue>Buzz</InnerValue>\n\
         \                    </entry>\n\
         \                </value>\n\
         \            </entry>\n\
         \        </nestedXmlMapWithXmlNameMap>\n\
         \    </NestedXmlMapWithXmlNameResponse>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response = NestedXmlMapWithXmlName.request ctx { nested_xml_map_with_xml_name_map = None } in
  match response with
  | Ok result ->
      let expected =
        ({
           nested_xml_map_with_xml_name_map =
             Some
               [
                 ("foo", [ ("bar", "Baz"); ("fizz", "Buzz") ]);
                 ("qux", [ ("foobar", "Bar"); ("fizzbuzz", "Buzz") ]);
               ];
         }
          : Types.nested_xml_map_with_xml_name_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_nested_xml_map_with_xml_name_response
           Types.equal_nested_xml_map_with_xml_name_response)
        "expected output" expected result
  | Error error -> failwith (NestedXmlMapWithXmlName.error_to_string error)

let nested_xml_map_with_xml_name_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#NestedXmlMapWithXmlName",
    [
      ("NestedXmlMapWithXmlNameSerializes", `Quick, nested_xml_map_with_xml_name_serializes);
      ("NestedXmlMapWithXmlNameDeserializes", `Quick, nested_xml_map_with_xml_name_deserializes);
    ] )

let input_and_output_with_string_headers () =
  Eio.Switch.run ~name:"InputAndOutputWithStringHeaders" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.input_and_output_with_headers_i_o =
    {
      header_string = Some "Hello";
      header_byte = None;
      header_short = None;
      header_integer = None;
      header_long = None;
      header_float = None;
      header_double = None;
      header_true_bool = None;
      header_false_bool = None;
      header_string_list = Some [ "a"; "b"; "c" ];
      header_string_set = Some [ "a"; "b"; "c" ];
      header_integer_list = None;
      header_boolean_list = None;
      header_timestamp_list = None;
      header_enum = None;
      header_enum_list = None;
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = InputAndOutputWithHeaders.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/InputAndOutputWithHeaders")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("X-String", "Hello"); ("X-StringList", "a, b, c"); ("X-StringSet", "a, b, c") ]
      request.headers
  in
  ()

let input_and_output_with_numeric_headers () =
  Eio.Switch.run ~name:"InputAndOutputWithNumericHeaders" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.input_and_output_with_headers_i_o =
    {
      header_string = None;
      header_byte = Some 1;
      header_short = Some 123;
      header_integer = Some 123;
      header_long = Some (Smaws_Lib.CoreTypes.Int64.of_int 123);
      header_float = Some 1.1;
      header_double = Some 1.1;
      header_true_bool = None;
      header_false_bool = None;
      header_string_list = None;
      header_string_set = None;
      header_integer_list = Some [ 1; 2; 3 ];
      header_boolean_list = None;
      header_timestamp_list = None;
      header_enum = None;
      header_enum_list = None;
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = InputAndOutputWithHeaders.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/InputAndOutputWithHeaders")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [
        ("X-Byte", "1");
        ("X-Short", "123");
        ("X-Integer", "123");
        ("X-Long", "123");
        ("X-Float", "1.1");
        ("X-Double", "1.1");
        ("X-IntegerList", "1, 2, 3");
      ]
      request.headers
  in
  ()

let input_and_output_with_boolean_headers () =
  Eio.Switch.run ~name:"InputAndOutputWithBooleanHeaders" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.input_and_output_with_headers_i_o =
    {
      header_string = None;
      header_byte = None;
      header_short = None;
      header_integer = None;
      header_long = None;
      header_float = None;
      header_double = None;
      header_true_bool = Some true;
      header_false_bool = Some false;
      header_string_list = None;
      header_string_set = None;
      header_integer_list = None;
      header_boolean_list = Some [ true; false; true ];
      header_timestamp_list = None;
      header_enum = None;
      header_enum_list = None;
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = InputAndOutputWithHeaders.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/InputAndOutputWithHeaders")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("X-Boolean1", "true"); ("X-Boolean2", "false"); ("X-BooleanList", "true, false, true") ]
      request.headers
  in
  ()

let input_and_output_with_enum_headers () =
  Eio.Switch.run ~name:"InputAndOutputWithEnumHeaders" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.input_and_output_with_headers_i_o =
    {
      header_string = None;
      header_byte = None;
      header_short = None;
      header_integer = None;
      header_long = None;
      header_float = None;
      header_double = None;
      header_true_bool = None;
      header_false_bool = None;
      header_string_list = None;
      header_string_set = None;
      header_integer_list = None;
      header_boolean_list = None;
      header_timestamp_list = None;
      header_enum = Some FOO;
      header_enum_list = Some [ FOO; BAR; BAZ ];
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = InputAndOutputWithHeaders.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/InputAndOutputWithHeaders")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("X-Enum", "Foo"); ("X-EnumList", "Foo, Bar, Baz") ]
      request.headers
  in
  ()

let rest_xml_supports_na_n_float_header_inputs () =
  Eio.Switch.run ~name:"RestXmlSupportsNaNFloatHeaderInputs" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.input_and_output_with_headers_i_o =
    {
      header_string = None;
      header_byte = None;
      header_short = None;
      header_integer = None;
      header_long = None;
      header_float = Some Float.nan;
      header_double = Some Float.nan;
      header_true_bool = None;
      header_false_bool = None;
      header_string_list = None;
      header_string_set = None;
      header_integer_list = None;
      header_boolean_list = None;
      header_timestamp_list = None;
      header_enum = None;
      header_enum_list = None;
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = InputAndOutputWithHeaders.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/InputAndOutputWithHeaders")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("X-Float", "NaN"); ("X-Double", "NaN") ]
      request.headers
  in
  ()

let rest_xml_supports_infinity_float_header_inputs () =
  Eio.Switch.run ~name:"RestXmlSupportsInfinityFloatHeaderInputs" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.input_and_output_with_headers_i_o =
    {
      header_string = None;
      header_byte = None;
      header_short = None;
      header_integer = None;
      header_long = None;
      header_float = Some Float.infinity;
      header_double = Some Float.infinity;
      header_true_bool = None;
      header_false_bool = None;
      header_string_list = None;
      header_string_set = None;
      header_integer_list = None;
      header_boolean_list = None;
      header_timestamp_list = None;
      header_enum = None;
      header_enum_list = None;
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = InputAndOutputWithHeaders.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/InputAndOutputWithHeaders")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("X-Float", "Infinity"); ("X-Double", "Infinity") ]
      request.headers
  in
  ()

let rest_xml_supports_negative_infinity_float_header_inputs () =
  Eio.Switch.run ~name:"RestXmlSupportsNegativeInfinityFloatHeaderInputs" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.input_and_output_with_headers_i_o =
    {
      header_string = None;
      header_byte = None;
      header_short = None;
      header_integer = None;
      header_long = None;
      header_float = Some Float.neg_infinity;
      header_double = Some Float.neg_infinity;
      header_true_bool = None;
      header_false_bool = None;
      header_string_list = None;
      header_string_set = None;
      header_integer_list = None;
      header_boolean_list = None;
      header_timestamp_list = None;
      header_enum = None;
      header_enum_list = None;
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = InputAndOutputWithHeaders.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/InputAndOutputWithHeaders")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("X-Float", "-Infinity"); ("X-Double", "-Infinity") ]
      request.headers
  in
  ()

let input_and_output_with_string_headers () =
  Eio.Switch.run ~name:"InputAndOutputWithStringHeaders" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("X-String", "Hello"); ("X-StringList", "a, b, c"); ("X-StringSet", "a, b, c") ]
    ();
  let response =
    InputAndOutputWithHeaders.request ctx
      {
        header_string = None;
        header_byte = None;
        header_short = None;
        header_integer = None;
        header_long = None;
        header_float = None;
        header_double = None;
        header_true_bool = None;
        header_false_bool = None;
        header_string_list = None;
        header_string_set = None;
        header_integer_list = None;
        header_boolean_list = None;
        header_timestamp_list = None;
        header_enum = None;
        header_enum_list = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           header_string = Some "Hello";
           header_byte = None;
           header_short = None;
           header_integer = None;
           header_long = None;
           header_float = None;
           header_double = None;
           header_true_bool = None;
           header_false_bool = None;
           header_string_list = Some [ "a"; "b"; "c" ];
           header_string_set = Some [ "a"; "b"; "c" ];
           header_integer_list = None;
           header_boolean_list = None;
           header_timestamp_list = None;
           header_enum = None;
           header_enum_list = None;
         }
          : Types.input_and_output_with_headers_i_o)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_input_and_output_with_headers_i_o
           Types.equal_input_and_output_with_headers_i_o)
        "expected output" expected result
  | Error error -> failwith (InputAndOutputWithHeaders.error_to_string error)

let input_and_output_with_numeric_headers () =
  Eio.Switch.run ~name:"InputAndOutputWithNumericHeaders" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:
      [
        ("X-Byte", "1");
        ("X-Short", "123");
        ("X-Integer", "123");
        ("X-Long", "123");
        ("X-Float", "1.1");
        ("X-Double", "1.1");
        ("X-IntegerList", "1, 2, 3");
      ]
    ();
  let response =
    InputAndOutputWithHeaders.request ctx
      {
        header_string = None;
        header_byte = None;
        header_short = None;
        header_integer = None;
        header_long = None;
        header_float = None;
        header_double = None;
        header_true_bool = None;
        header_false_bool = None;
        header_string_list = None;
        header_string_set = None;
        header_integer_list = None;
        header_boolean_list = None;
        header_timestamp_list = None;
        header_enum = None;
        header_enum_list = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           header_string = None;
           header_byte = Some 1;
           header_short = Some 123;
           header_integer = Some 123;
           header_long = Some (Smaws_Lib.CoreTypes.Int64.of_int 123);
           header_float = Some 1.1;
           header_double = Some 1.1;
           header_true_bool = None;
           header_false_bool = None;
           header_string_list = None;
           header_string_set = None;
           header_integer_list = Some [ 1; 2; 3 ];
           header_boolean_list = None;
           header_timestamp_list = None;
           header_enum = None;
           header_enum_list = None;
         }
          : Types.input_and_output_with_headers_i_o)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_input_and_output_with_headers_i_o
           Types.equal_input_and_output_with_headers_i_o)
        "expected output" expected result
  | Error error -> failwith (InputAndOutputWithHeaders.error_to_string error)

let input_and_output_with_boolean_headers () =
  Eio.Switch.run ~name:"InputAndOutputWithBooleanHeaders" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:
      [ ("X-Boolean1", "true"); ("X-Boolean2", "false"); ("X-BooleanList", "true, false, true") ]
    ();
  let response =
    InputAndOutputWithHeaders.request ctx
      {
        header_string = None;
        header_byte = None;
        header_short = None;
        header_integer = None;
        header_long = None;
        header_float = None;
        header_double = None;
        header_true_bool = None;
        header_false_bool = None;
        header_string_list = None;
        header_string_set = None;
        header_integer_list = None;
        header_boolean_list = None;
        header_timestamp_list = None;
        header_enum = None;
        header_enum_list = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           header_string = None;
           header_byte = None;
           header_short = None;
           header_integer = None;
           header_long = None;
           header_float = None;
           header_double = None;
           header_true_bool = Some true;
           header_false_bool = Some false;
           header_string_list = None;
           header_string_set = None;
           header_integer_list = None;
           header_boolean_list = Some [ true; false; true ];
           header_timestamp_list = None;
           header_enum = None;
           header_enum_list = None;
         }
          : Types.input_and_output_with_headers_i_o)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_input_and_output_with_headers_i_o
           Types.equal_input_and_output_with_headers_i_o)
        "expected output" expected result
  | Error error -> failwith (InputAndOutputWithHeaders.error_to_string error)

let input_and_output_with_enum_headers () =
  Eio.Switch.run ~name:"InputAndOutputWithEnumHeaders" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("X-Enum", "Foo"); ("X-EnumList", "Foo, Bar, Baz") ]
    ();
  let response =
    InputAndOutputWithHeaders.request ctx
      {
        header_string = None;
        header_byte = None;
        header_short = None;
        header_integer = None;
        header_long = None;
        header_float = None;
        header_double = None;
        header_true_bool = None;
        header_false_bool = None;
        header_string_list = None;
        header_string_set = None;
        header_integer_list = None;
        header_boolean_list = None;
        header_timestamp_list = None;
        header_enum = None;
        header_enum_list = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           header_string = None;
           header_byte = None;
           header_short = None;
           header_integer = None;
           header_long = None;
           header_float = None;
           header_double = None;
           header_true_bool = None;
           header_false_bool = None;
           header_string_list = None;
           header_string_set = None;
           header_integer_list = None;
           header_boolean_list = None;
           header_timestamp_list = None;
           header_enum = Some FOO;
           header_enum_list = Some [ FOO; BAR; BAZ ];
         }
          : Types.input_and_output_with_headers_i_o)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_input_and_output_with_headers_i_o
           Types.equal_input_and_output_with_headers_i_o)
        "expected output" expected result
  | Error error -> failwith (InputAndOutputWithHeaders.error_to_string error)

let rest_xml_supports_na_n_float_header_outputs () =
  Eio.Switch.run ~name:"RestXmlSupportsNaNFloatHeaderOutputs" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("X-Float", "NaN"); ("X-Double", "NaN") ]
    ();
  let response =
    InputAndOutputWithHeaders.request ctx
      {
        header_string = None;
        header_byte = None;
        header_short = None;
        header_integer = None;
        header_long = None;
        header_float = None;
        header_double = None;
        header_true_bool = None;
        header_false_bool = None;
        header_string_list = None;
        header_string_set = None;
        header_integer_list = None;
        header_boolean_list = None;
        header_timestamp_list = None;
        header_enum = None;
        header_enum_list = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           header_string = None;
           header_byte = None;
           header_short = None;
           header_integer = None;
           header_long = None;
           header_float = Some Float.nan;
           header_double = Some Float.nan;
           header_true_bool = None;
           header_false_bool = None;
           header_string_list = None;
           header_string_set = None;
           header_integer_list = None;
           header_boolean_list = None;
           header_timestamp_list = None;
           header_enum = None;
           header_enum_list = None;
         }
          : Types.input_and_output_with_headers_i_o)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_input_and_output_with_headers_i_o
           Types.equal_input_and_output_with_headers_i_o)
        "expected output" expected result
  | Error error -> failwith (InputAndOutputWithHeaders.error_to_string error)

let rest_xml_supports_infinity_float_header_outputs () =
  Eio.Switch.run ~name:"RestXmlSupportsInfinityFloatHeaderOutputs" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("X-Float", "Infinity"); ("X-Double", "Infinity") ]
    ();
  let response =
    InputAndOutputWithHeaders.request ctx
      {
        header_string = None;
        header_byte = None;
        header_short = None;
        header_integer = None;
        header_long = None;
        header_float = None;
        header_double = None;
        header_true_bool = None;
        header_false_bool = None;
        header_string_list = None;
        header_string_set = None;
        header_integer_list = None;
        header_boolean_list = None;
        header_timestamp_list = None;
        header_enum = None;
        header_enum_list = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           header_string = None;
           header_byte = None;
           header_short = None;
           header_integer = None;
           header_long = None;
           header_float = Some Float.infinity;
           header_double = Some Float.infinity;
           header_true_bool = None;
           header_false_bool = None;
           header_string_list = None;
           header_string_set = None;
           header_integer_list = None;
           header_boolean_list = None;
           header_timestamp_list = None;
           header_enum = None;
           header_enum_list = None;
         }
          : Types.input_and_output_with_headers_i_o)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_input_and_output_with_headers_i_o
           Types.equal_input_and_output_with_headers_i_o)
        "expected output" expected result
  | Error error -> failwith (InputAndOutputWithHeaders.error_to_string error)

let rest_xml_supports_negative_infinity_float_header_outputs () =
  Eio.Switch.run ~name:"RestXmlSupportsNegativeInfinityFloatHeaderOutputs" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("X-Float", "-Infinity"); ("X-Double", "-Infinity") ]
    ();
  let response =
    InputAndOutputWithHeaders.request ctx
      {
        header_string = None;
        header_byte = None;
        header_short = None;
        header_integer = None;
        header_long = None;
        header_float = None;
        header_double = None;
        header_true_bool = None;
        header_false_bool = None;
        header_string_list = None;
        header_string_set = None;
        header_integer_list = None;
        header_boolean_list = None;
        header_timestamp_list = None;
        header_enum = None;
        header_enum_list = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           header_string = None;
           header_byte = None;
           header_short = None;
           header_integer = None;
           header_long = None;
           header_float = Some Float.neg_infinity;
           header_double = Some Float.neg_infinity;
           header_true_bool = None;
           header_false_bool = None;
           header_string_list = None;
           header_string_set = None;
           header_integer_list = None;
           header_boolean_list = None;
           header_timestamp_list = None;
           header_enum = None;
           header_enum_list = None;
         }
          : Types.input_and_output_with_headers_i_o)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_input_and_output_with_headers_i_o
           Types.equal_input_and_output_with_headers_i_o)
        "expected output" expected result
  | Error error -> failwith (InputAndOutputWithHeaders.error_to_string error)

let input_and_output_with_headers_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#InputAndOutputWithHeaders",
    [
      ("InputAndOutputWithStringHeaders", `Quick, input_and_output_with_string_headers);
      ("InputAndOutputWithNumericHeaders", `Quick, input_and_output_with_numeric_headers);
      ("InputAndOutputWithBooleanHeaders", `Quick, input_and_output_with_boolean_headers);
      ("InputAndOutputWithEnumHeaders", `Quick, input_and_output_with_enum_headers);
      ("RestXmlSupportsNaNFloatHeaderInputs", `Quick, rest_xml_supports_na_n_float_header_inputs);
      ( "RestXmlSupportsInfinityFloatHeaderInputs",
        `Quick,
        rest_xml_supports_infinity_float_header_inputs );
      ( "RestXmlSupportsNegativeInfinityFloatHeaderInputs",
        `Quick,
        rest_xml_supports_negative_infinity_float_header_inputs );
      ("InputAndOutputWithStringHeaders", `Quick, input_and_output_with_string_headers);
      ("InputAndOutputWithNumericHeaders", `Quick, input_and_output_with_numeric_headers);
      ("InputAndOutputWithBooleanHeaders", `Quick, input_and_output_with_boolean_headers);
      ("InputAndOutputWithEnumHeaders", `Quick, input_and_output_with_enum_headers);
      ("RestXmlSupportsNaNFloatHeaderOutputs", `Quick, rest_xml_supports_na_n_float_header_outputs);
      ( "RestXmlSupportsInfinityFloatHeaderOutputs",
        `Quick,
        rest_xml_supports_infinity_float_header_outputs );
      ( "RestXmlSupportsNegativeInfinityFloatHeaderOutputs",
        `Quick,
        rest_xml_supports_negative_infinity_float_header_outputs );
    ] )

let ignore_query_params_in_response () =
  Eio.Switch.run ~name:"IgnoreQueryParamsInResponse" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some "<IgnoreQueryParamsInResponseOutput><baz>bam</baz></IgnoreQueryParamsInResponseOutput>")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response = IgnoreQueryParamsInResponse.request ctx () in
  match response with
  | Ok result ->
      let expected = ({ baz = Some "bam" } : Types.ignore_query_params_in_response_output) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_ignore_query_params_in_response_output
           Types.equal_ignore_query_params_in_response_output)
        "expected output" expected result
  | Error error -> failwith (IgnoreQueryParamsInResponse.error_to_string error)

let ignore_query_params_in_response_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#IgnoreQueryParamsInResponse",
    [ ("IgnoreQueryParamsInResponse", `Quick, ignore_query_params_in_response) ] )

let rest_xml_string_payload_request () =
  Eio.Switch.run ~name:"RestXmlStringPayloadRequest" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.string_payload_input = { payload = Some "rawstring" } in
  Mock.mock_response ~body:"" ~status:200 ~headers:[] ();
  let _response = HttpStringPayload.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "rawstring")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri" (Uri.of_string "/StringPayload")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "text/plain") ]
      request.headers
  in
  ()

let rest_xml_string_payload_response () =
  Eio.Switch.run ~name:"RestXmlStringPayloadResponse" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "rawstring") ~status:200
    ~headers:[ ("Content-Type", "text/plain") ]
    ();
  let response = HttpStringPayload.request ctx { payload = None } in
  match response with
  | Ok result ->
      let expected = ({ payload = Some "rawstring" } : Types.string_payload_input) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_string_payload_input
           Types.equal_string_payload_input)
        "expected output" expected result
  | Error error -> failwith (HttpStringPayload.error_to_string error)

let http_string_payload_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#HttpStringPayload",
    [
      ("RestXmlStringPayloadRequest", `Quick, rest_xml_string_payload_request);
      ("RestXmlStringPayloadResponse", `Quick, rest_xml_string_payload_response);
    ] )

let rest_xml_http_response_code () =
  Eio.Switch.run ~name:"RestXmlHttpResponseCode" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "") ~status:201 ~headers:[ ("Content-Type", "application/xml") ] ();
  let response = HttpResponseCode.request ctx () in
  match response with
  | Ok result ->
      let expected = ({ status = Some 201 } : Types.http_response_code_output) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_http_response_code_output
           Types.equal_http_response_code_output)
        "expected output" expected result
  | Error error -> failwith (HttpResponseCode.error_to_string error)

let http_response_code_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#HttpResponseCode",
    [ ("RestXmlHttpResponseCode", `Quick, rest_xml_http_response_code) ] )

let http_request_with_labels_and_timestamp_format () =
  Eio.Switch.run ~name:"HttpRequestWithLabelsAndTimestampFormat" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_request_with_labels_and_timestamp_format_input =
    {
      member_epoch_seconds = Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.);
      member_http_date = Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.);
      member_date_time = Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.);
      default_format = Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.);
      target_epoch_seconds = Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.);
      target_http_date = Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.);
      target_date_time = Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.);
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = HttpRequestWithLabelsAndTimestampFormat.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string
         "/HttpRequestWithLabelsAndTimestampFormat/1576540098/Mon%2C%2016%20Dec%202019%2023%3A48%3A18%20GMT/2019-12-16T23%3A48%3A18Z/2019-12-16T23%3A48%3A18Z/1576540098/Mon%2C%2016%20Dec%202019%2023%3A48%3A18%20GMT/2019-12-16T23%3A48%3A18Z")
      request.uri
  in
  let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
  ()

let http_request_with_labels_and_timestamp_format_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#HttpRequestWithLabelsAndTimestampFormat",
    [
      ( "HttpRequestWithLabelsAndTimestampFormat",
        `Quick,
        http_request_with_labels_and_timestamp_format );
    ] )

let input_with_headers_and_all_params () =
  Eio.Switch.run ~name:"InputWithHeadersAndAllParams" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_request_with_labels_input =
    {
      string_ = "string";
      short = 1;
      integer = 2;
      long = Smaws_Lib.CoreTypes.Int64.of_int 3;
      float_ = 4.1;
      double = 5.1;
      boolean_ = true;
      timestamp = Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.);
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = HttpRequestWithLabels.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/HttpRequestWithLabels/string/1/2/3/4.1/5.1/true/2019-12-16T23%3A48%3A18Z")
      request.uri
  in
  let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
  ()

let http_request_label_escaping () =
  Eio.Switch.run ~name:"HttpRequestLabelEscaping" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_request_with_labels_input =
    {
      string_ = " %:/?#[]@!$&'()*+,;=\240\159\152\185";
      short = 1;
      integer = 2;
      long = Smaws_Lib.CoreTypes.Int64.of_int 3;
      float_ = 4.1;
      double = 5.1;
      boolean_ = true;
      timestamp = Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.);
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = HttpRequestWithLabels.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string
         "/HttpRequestWithLabels/%20%25%3A%2F%3F%23%5B%5D%40%21%24%26%27%28%29%2A%2B%2C%3B%3D%F0%9F%98%B9/1/2/3/4.1/5.1/true/2019-12-16T23%3A48%3A18Z")
      request.uri
  in
  let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
  ()

let http_request_with_labels_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#HttpRequestWithLabels",
    [
      ("InputWithHeadersAndAllParams", `Quick, input_with_headers_and_all_params);
      ("HttpRequestLabelEscaping", `Quick, http_request_label_escaping);
    ] )

let http_request_with_greedy_label_in_path () =
  Eio.Switch.run ~name:"HttpRequestWithGreedyLabelInPath" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_request_with_greedy_label_in_path_input =
    { foo = "hello"; baz = "there/guy" }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = HttpRequestWithGreedyLabelInPath.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/HttpRequestWithGreedyLabelInPath/foo/hello/baz/there/guy")
      request.uri
  in
  let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
  ()

let http_request_with_greedy_label_in_path_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#HttpRequestWithGreedyLabelInPath",
    [ ("HttpRequestWithGreedyLabelInPath", `Quick, http_request_with_greedy_label_in_path) ] )

let rest_xml_supports_na_n_float_labels () =
  Eio.Switch.run ~name:"RestXmlSupportsNaNFloatLabels" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_request_with_float_labels_input =
    { float_ = Float.nan; double = Float.nan }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = HttpRequestWithFloatLabels.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/FloatHttpLabels/NaN/NaN")
      request.uri
  in
  let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
  ()

let rest_xml_supports_infinity_float_labels () =
  Eio.Switch.run ~name:"RestXmlSupportsInfinityFloatLabels" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_request_with_float_labels_input =
    { float_ = Float.infinity; double = Float.infinity }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = HttpRequestWithFloatLabels.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/FloatHttpLabels/Infinity/Infinity")
      request.uri
  in
  let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
  ()

let rest_xml_supports_negative_infinity_float_labels () =
  Eio.Switch.run ~name:"RestXmlSupportsNegativeInfinityFloatLabels" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_request_with_float_labels_input =
    { float_ = Float.neg_infinity; double = Float.neg_infinity }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = HttpRequestWithFloatLabels.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/FloatHttpLabels/-Infinity/-Infinity")
      request.uri
  in
  let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
  ()

let http_request_with_float_labels_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#HttpRequestWithFloatLabels",
    [
      ("RestXmlSupportsNaNFloatLabels", `Quick, rest_xml_supports_na_n_float_labels);
      ("RestXmlSupportsInfinityFloatLabels", `Quick, rest_xml_supports_infinity_float_labels);
      ( "RestXmlSupportsNegativeInfinityFloatLabels",
        `Quick,
        rest_xml_supports_negative_infinity_float_labels );
    ] )

let http_prefix_headers_are_present () =
  Eio.Switch.run ~name:"HttpPrefixHeadersArePresent" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_prefix_headers_input_output =
    { foo = Some "Foo"; foo_map = Some [ ("abc", "Abc value"); ("def", "Def value") ] }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = HttpPrefixHeaders.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/HttpPrefixHeaders")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("x-foo", "Foo"); ("x-foo-abc", "Abc value"); ("x-foo-def", "Def value") ]
      request.headers
  in
  ()

let http_prefix_headers_are_not_present () =
  Eio.Switch.run ~name:"HttpPrefixHeadersAreNotPresent" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_prefix_headers_input_output = { foo = Some "Foo"; foo_map = Some [] } in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = HttpPrefixHeaders.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/HttpPrefixHeaders")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("x-foo", "Foo") ]
      request.headers
  in
  ()

let http_prefix_empty_headers () =
  Eio.Switch.run ~name:"HttpPrefixEmptyHeaders" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_prefix_headers_input_output =
    { foo = None; foo_map = Some [ ("abc", "") ] }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = HttpPrefixHeaders.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/HttpPrefixHeaders")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("x-foo-abc", "") ]
      request.headers
  in
  ()

let http_prefix_headers_are_present () =
  Eio.Switch.run ~name:"HttpPrefixHeadersArePresent" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("x-foo", "Foo"); ("x-foo-abc", "Abc value"); ("x-foo-def", "Def value") ]
    ();
  let response = HttpPrefixHeaders.request ctx { foo = None; foo_map = None } in
  match response with
  | Ok result ->
      let expected =
        ({ foo = Some "Foo"; foo_map = Some [ ("abc", "Abc value"); ("def", "Def value") ] }
          : Types.http_prefix_headers_input_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_http_prefix_headers_input_output
           Types.equal_http_prefix_headers_input_output)
        "expected output" expected result
  | Error error -> failwith (HttpPrefixHeaders.error_to_string error)

let http_prefix_headers_are_not_present () =
  Eio.Switch.run ~name:"HttpPrefixHeadersAreNotPresent" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "") ~status:200 ~headers:[ ("x-foo", "Foo") ] ();
  let response = HttpPrefixHeaders.request ctx { foo = None; foo_map = None } in
  match response with
  | Ok result ->
      let expected =
        ({ foo = Some "Foo"; foo_map = Some [] } : Types.http_prefix_headers_input_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_http_prefix_headers_input_output
           Types.equal_http_prefix_headers_input_output)
        "expected output" expected result
  | Error error -> failwith (HttpPrefixHeaders.error_to_string error)

let http_prefix_headers_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#HttpPrefixHeaders",
    [
      ("HttpPrefixHeadersArePresent", `Quick, http_prefix_headers_are_present);
      ("HttpPrefixHeadersAreNotPresent", `Quick, http_prefix_headers_are_not_present);
      ("HttpPrefixEmptyHeaders", `Quick, http_prefix_empty_headers);
      ("HttpPrefixHeadersArePresent", `Quick, http_prefix_headers_are_present);
      ("HttpPrefixHeadersAreNotPresent", `Quick, http_prefix_headers_are_not_present);
    ] )

let http_payload_with_xml_namespace_and_prefix () =
  Eio.Switch.run ~name:"HttpPayloadWithXmlNamespaceAndPrefix" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_payload_with_xml_namespace_and_prefix_input_output =
    { nested = Some { name = Some "Phreddy" } }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = HttpPayloadWithXmlNamespaceAndPrefix.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<PayloadWithXmlNamespaceAndPrefix xmlns:baz=\"http://foo.com\">\n\
         \    <name>Phreddy</name>\n\
          </PayloadWithXmlNamespaceAndPrefix>")
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
      (Uri.of_string "/HttpPayloadWithXmlNamespaceAndPrefix")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let http_payload_with_xml_namespace_and_prefix () =
  Eio.Switch.run ~name:"HttpPayloadWithXmlNamespaceAndPrefix" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<PayloadWithXmlNamespaceAndPrefix xmlns:baz=\"http://foo.com\">\n\
         \    <name>Phreddy</name>\n\
          </PayloadWithXmlNamespaceAndPrefix>")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response = HttpPayloadWithXmlNamespaceAndPrefix.request ctx { nested = None } in
  match response with
  | Ok result ->
      let expected =
        ({ nested = Some { name = Some "Phreddy" } }
          : Types.http_payload_with_xml_namespace_and_prefix_input_output)
      in
      check
        (Alcotest_http.testable_nan_aware
           Types.pp_http_payload_with_xml_namespace_and_prefix_input_output
           Types.equal_http_payload_with_xml_namespace_and_prefix_input_output)
        "expected output" expected result
  | Error error -> failwith (HttpPayloadWithXmlNamespaceAndPrefix.error_to_string error)

let http_payload_with_xml_namespace_and_prefix_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#HttpPayloadWithXmlNamespaceAndPrefix",
    [
      ("HttpPayloadWithXmlNamespaceAndPrefix", `Quick, http_payload_with_xml_namespace_and_prefix);
      ("HttpPayloadWithXmlNamespaceAndPrefix", `Quick, http_payload_with_xml_namespace_and_prefix);
    ] )

let http_payload_with_xml_namespace () =
  Eio.Switch.run ~name:"HttpPayloadWithXmlNamespace" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_payload_with_xml_namespace_input_output =
    { nested = Some { name = Some "Phreddy" } }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = HttpPayloadWithXmlNamespace.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<PayloadWithXmlNamespace xmlns=\"http://foo.com\">\n\
         \    <name>Phreddy</name>\n\
          </PayloadWithXmlNamespace>")
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
      (Uri.of_string "/HttpPayloadWithXmlNamespace")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let http_payload_with_xml_namespace () =
  Eio.Switch.run ~name:"HttpPayloadWithXmlNamespace" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<PayloadWithXmlNamespace xmlns=\"http://foo.com\">\n\
         \    <name>Phreddy</name>\n\
          </PayloadWithXmlNamespace>")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response = HttpPayloadWithXmlNamespace.request ctx { nested = None } in
  match response with
  | Ok result ->
      let expected =
        ({ nested = Some { name = Some "Phreddy" } }
          : Types.http_payload_with_xml_namespace_input_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_http_payload_with_xml_namespace_input_output
           Types.equal_http_payload_with_xml_namespace_input_output)
        "expected output" expected result
  | Error error -> failwith (HttpPayloadWithXmlNamespace.error_to_string error)

let http_payload_with_xml_namespace_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#HttpPayloadWithXmlNamespace",
    [
      ("HttpPayloadWithXmlNamespace", `Quick, http_payload_with_xml_namespace);
      ("HttpPayloadWithXmlNamespace", `Quick, http_payload_with_xml_namespace);
    ] )

let http_payload_with_xml_name () =
  Eio.Switch.run ~name:"HttpPayloadWithXmlName" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_payload_with_xml_name_input_output =
    { nested = Some { name = Some "Phreddy" } }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = HttpPayloadWithXmlName.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some "<Hello><name>Phreddy</name></Hello>")
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
      (Uri.of_string "/HttpPayloadWithXmlName")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let http_payload_with_xml_name () =
  Eio.Switch.run ~name:"HttpPayloadWithXmlName" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "<Hello><name>Phreddy</name></Hello>") ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response = HttpPayloadWithXmlName.request ctx { nested = None } in
  match response with
  | Ok result ->
      let expected =
        ({ nested = Some { name = Some "Phreddy" } }
          : Types.http_payload_with_xml_name_input_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_http_payload_with_xml_name_input_output
           Types.equal_http_payload_with_xml_name_input_output)
        "expected output" expected result
  | Error error -> failwith (HttpPayloadWithXmlName.error_to_string error)

let http_payload_with_xml_name_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#HttpPayloadWithXmlName",
    [
      ("HttpPayloadWithXmlName", `Quick, http_payload_with_xml_name);
      ("HttpPayloadWithXmlName", `Quick, http_payload_with_xml_name);
    ] )

let http_payload_with_union_test_suite : unit Alcotest.test =
  ("aws.protocoltests.restxml#HttpPayloadWithUnion", [])

let http_payload_with_structure () =
  Eio.Switch.run ~name:"HttpPayloadWithStructure" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_payload_with_structure_input_output =
    { nested = Some { greeting = Some "hello"; name = Some "Phreddy" } }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = HttpPayloadWithStructure.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<NestedPayload>\n\
         \    <greeting>hello</greeting>\n\
         \    <name>Phreddy</name>\n\
          </NestedPayload>\n")
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
      (Uri.of_string "/HttpPayloadWithStructure")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let http_payload_with_structure () =
  Eio.Switch.run ~name:"HttpPayloadWithStructure" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<NestedPayload>\n\
         \    <greeting>hello</greeting>\n\
         \    <name>Phreddy</name>\n\
          </NestedPayload>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response = HttpPayloadWithStructure.request ctx { nested = None } in
  match response with
  | Ok result ->
      let expected =
        ({ nested = Some { greeting = Some "hello"; name = Some "Phreddy" } }
          : Types.http_payload_with_structure_input_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_http_payload_with_structure_input_output
           Types.equal_http_payload_with_structure_input_output)
        "expected output" expected result
  | Error error -> failwith (HttpPayloadWithStructure.error_to_string error)

let http_payload_with_structure_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#HttpPayloadWithStructure",
    [
      ("HttpPayloadWithStructure", `Quick, http_payload_with_structure);
      ("HttpPayloadWithStructure", `Quick, http_payload_with_structure);
    ] )

let http_payload_with_member_xml_name () =
  Eio.Switch.run ~name:"HttpPayloadWithMemberXmlName" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_payload_with_member_xml_name_input_output =
    { nested = Some { name = Some "Phreddy" } }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = HttpPayloadWithMemberXmlName.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some "<Hola><name>Phreddy</name></Hola>")
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
      (Uri.of_string "/HttpPayloadWithMemberXmlName")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let http_payload_with_member_xml_name () =
  Eio.Switch.run ~name:"HttpPayloadWithMemberXmlName" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "<Hola><name>Phreddy</name></Hola>") ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response = HttpPayloadWithMemberXmlName.request ctx { nested = None } in
  match response with
  | Ok result ->
      let expected =
        ({ nested = Some { name = Some "Phreddy" } }
          : Types.http_payload_with_member_xml_name_input_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_http_payload_with_member_xml_name_input_output
           Types.equal_http_payload_with_member_xml_name_input_output)
        "expected output" expected result
  | Error error -> failwith (HttpPayloadWithMemberXmlName.error_to_string error)

let http_payload_with_member_xml_name_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#HttpPayloadWithMemberXmlName",
    [
      ("HttpPayloadWithMemberXmlName", `Quick, http_payload_with_member_xml_name);
      ("HttpPayloadWithMemberXmlName", `Quick, http_payload_with_member_xml_name);
    ] )

let http_payload_traits_with_media_type_with_blob () =
  Eio.Switch.run ~name:"HttpPayloadTraitsWithMediaTypeWithBlob" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_payload_traits_with_media_type_input_output =
    { foo = Some "Foo"; blob = Some (Smaws_Lib.CoreTypes.Blob.of_string "blobby blob blob") }
  in
  Mock.mock_response ~body:"" ~status:200 ~headers:[] ();
  let _response = HttpPayloadTraitsWithMediaType.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "blobby blob blob")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/HttpPayloadTraitsWithMediaType")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("X-Foo", "Foo"); ("Content-Type", "text/plain") ]
      request.headers
  in
  ()

let http_payload_traits_with_media_type_with_blob () =
  Eio.Switch.run ~name:"HttpPayloadTraitsWithMediaTypeWithBlob" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "blobby blob blob") ~status:200
    ~headers:[ ("X-Foo", "Foo"); ("Content-Type", "text/plain") ]
    ();
  let response = HttpPayloadTraitsWithMediaType.request ctx { foo = None; blob = None } in
  match response with
  | Ok result ->
      let expected =
        ({ foo = Some "Foo"; blob = Some (Smaws_Lib.CoreTypes.Blob.of_string "blobby blob blob") }
          : Types.http_payload_traits_with_media_type_input_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_http_payload_traits_with_media_type_input_output
           Types.equal_http_payload_traits_with_media_type_input_output)
        "expected output" expected result
  | Error error -> failwith (HttpPayloadTraitsWithMediaType.error_to_string error)

let http_payload_traits_with_media_type_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#HttpPayloadTraitsWithMediaType",
    [
      ( "HttpPayloadTraitsWithMediaTypeWithBlob",
        `Quick,
        http_payload_traits_with_media_type_with_blob );
      ( "HttpPayloadTraitsWithMediaTypeWithBlob",
        `Quick,
        http_payload_traits_with_media_type_with_blob );
    ] )

let http_payload_traits_with_blob () =
  Eio.Switch.run ~name:"HttpPayloadTraitsWithBlob" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_payload_traits_input_output =
    { foo = Some "Foo"; blob = Some (Smaws_Lib.CoreTypes.Blob.of_string "blobby blob blob") }
  in
  Mock.mock_response ~body:"" ~status:200 ~headers:[] ();
  let _response = HttpPayloadTraits.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "blobby blob blob")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/HttpPayloadTraits")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("X-Foo", "Foo") ]
      request.headers
  in
  ()

let http_payload_traits_with_no_blob_body () =
  Eio.Switch.run ~name:"HttpPayloadTraitsWithNoBlobBody" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_payload_traits_input_output = { foo = Some "Foo"; blob = None } in
  Mock.mock_response ~body:"" ~status:200 ~headers:[] ();
  let _response = HttpPayloadTraits.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/HttpPayloadTraits")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("X-Foo", "Foo") ]
      request.headers
  in
  ()

let http_payload_traits_with_blob () =
  Eio.Switch.run ~name:"HttpPayloadTraitsWithBlob" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "blobby blob blob") ~status:200 ~headers:[ ("X-Foo", "Foo") ] ();
  let response = HttpPayloadTraits.request ctx { foo = None; blob = None } in
  match response with
  | Ok result ->
      let expected =
        ({ foo = Some "Foo"; blob = Some (Smaws_Lib.CoreTypes.Blob.of_string "blobby blob blob") }
          : Types.http_payload_traits_input_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_http_payload_traits_input_output
           Types.equal_http_payload_traits_input_output)
        "expected output" expected result
  | Error error -> failwith (HttpPayloadTraits.error_to_string error)

let http_payload_traits_with_no_blob_body () =
  Eio.Switch.run ~name:"HttpPayloadTraitsWithNoBlobBody" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "") ~status:200 ~headers:[ ("X-Foo", "Foo") ] ();
  let response = HttpPayloadTraits.request ctx { foo = None; blob = None } in
  match response with
  | Ok result ->
      let expected = ({ foo = Some "Foo"; blob = None } : Types.http_payload_traits_input_output) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_http_payload_traits_input_output
           Types.equal_http_payload_traits_input_output)
        "expected output" expected result
  | Error error -> failwith (HttpPayloadTraits.error_to_string error)

let http_payload_traits_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#HttpPayloadTraits",
    [
      ("HttpPayloadTraitsWithBlob", `Quick, http_payload_traits_with_blob);
      ("HttpPayloadTraitsWithNoBlobBody", `Quick, http_payload_traits_with_no_blob_body);
      ("HttpPayloadTraitsWithBlob", `Quick, http_payload_traits_with_blob);
      ("HttpPayloadTraitsWithNoBlobBody", `Quick, http_payload_traits_with_no_blob_body);
    ] )

let rest_xml_enum_payload_request () =
  Eio.Switch.run ~name:"RestXmlEnumPayloadRequest" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.enum_payload_input = { payload = Some V } in
  Mock.mock_response ~body:"" ~status:200 ~headers:[] ();
  let _response = HttpEnumPayload.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "enumvalue")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri" (Uri.of_string "/EnumPayload")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "text/plain") ]
      request.headers
  in
  ()

let rest_xml_enum_payload_response () =
  Eio.Switch.run ~name:"RestXmlEnumPayloadResponse" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "enumvalue") ~status:200
    ~headers:[ ("Content-Type", "text/plain") ]
    ();
  let response = HttpEnumPayload.request ctx { payload = None } in
  match response with
  | Ok result ->
      let expected = ({ payload = Some V } : Types.enum_payload_input) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_enum_payload_input Types.equal_enum_payload_input)
        "expected output" expected result
  | Error error -> failwith (HttpEnumPayload.error_to_string error)

let http_enum_payload_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#HttpEnumPayload",
    [
      ("RestXmlEnumPayloadRequest", `Quick, rest_xml_enum_payload_request);
      ("RestXmlEnumPayloadResponse", `Quick, rest_xml_enum_payload_response);
    ] )

let http_empty_prefix_headers_request_client () =
  Eio.Switch.run ~name:"HttpEmptyPrefixHeadersRequestClient" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_empty_prefix_headers_input =
    {
      prefix_headers = Some [ ("x-foo", "Foo"); ("hello", "Hello") ];
      specific_header = Some "There";
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = HttpEmptyPrefixHeaders.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/HttpEmptyPrefixHeaders")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("x-foo", "Foo"); ("hello", "There") ]
      request.headers
  in
  ()

let http_empty_prefix_headers_response_client () =
  Eio.Switch.run ~name:"HttpEmptyPrefixHeadersResponseClient" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:None ~status:200 ~headers:[ ("x-foo", "Foo"); ("hello", "There") ] ();
  let response =
    HttpEmptyPrefixHeaders.request ctx { prefix_headers = None; specific_header = None }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           prefix_headers = Some [ ("x-foo", "Foo"); ("hello", "There") ];
           specific_header = Some "There";
         }
          : Types.http_empty_prefix_headers_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_http_empty_prefix_headers_output
           Types.equal_http_empty_prefix_headers_output)
        "expected output" expected result
  | Error error -> failwith (HttpEmptyPrefixHeaders.error_to_string error)

let http_empty_prefix_headers_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#HttpEmptyPrefixHeaders",
    [
      ("HttpEmptyPrefixHeadersRequestClient", `Quick, http_empty_prefix_headers_request_client);
      ("HttpEmptyPrefixHeadersResponseClient", `Quick, http_empty_prefix_headers_response_client);
    ] )

let greeting_with_errors () =
  Eio.Switch.run ~name:"GreetingWithErrors" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "") ~status:200 ~headers:[ ("X-Greeting", "Hello") ] ();
  let response = GreetingWithErrors.request ctx () in
  match response with
  | Ok result ->
      let expected = ({ greeting = Some "Hello" } : Types.greeting_with_errors_output) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_greeting_with_errors_output
           Types.equal_greeting_with_errors_output)
        "expected output" expected result
  | Error error -> failwith (GreetingWithErrors.error_to_string error)

let complex_error () =
  Eio.Switch.run ~name:"ComplexError" @@ fun sw ->
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
         \      <Message>Hi</Message>\n\
         \      <TopLevel>Top level</TopLevel>\n\
         \      <Nested>\n\
         \          <Foo>bar</Foo>\n\
         \      </Nested>\n\
         \   </Error>\n\
         \   <RequestId>foo-id</RequestId>\n\
          </ErrorResponse>\n")
    ~status:403
    ~headers:[ ("Content-Type", "application/xml"); ("X-Header", "Header") ]
    ();
  let response = GreetingWithErrors.request ctx () in
  match response with
  | Error (`ComplexError e) ->
      let expected =
        ({
           header = Some "Header";
           top_level = Some "Top level";
           nested = Some { foo = Some "bar" };
         }
          : Types.complex_error)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_complex_error Types.equal_complex_error)
        "expected error" expected e
  | Error other -> failwith (GreetingWithErrors.error_to_string other)
  | Ok _ -> failwith "expected an error response, got Ok"

let invalid_greeting_error () =
  Eio.Switch.run ~name:"InvalidGreetingError" @@ fun sw ->
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
         \      <AnotherSetting>setting</AnotherSetting>\n\
         \   </Error>\n\
         \   <RequestId>foo-id</RequestId>\n\
          </ErrorResponse>\n")
    ~status:400
    ~headers:[ ("Content-Type", "application/xml") ]
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
  ( "aws.protocoltests.restxml#GreetingWithErrors",
    [
      ("GreetingWithErrors", `Quick, greeting_with_errors);
      ("ComplexError", `Quick, complex_error);
      ("InvalidGreetingError", `Quick, invalid_greeting_error);
    ] )

let rest_xml_date_time_with_fractional_seconds () =
  Eio.Switch.run ~name:"RestXmlDateTimeWithFractionalSeconds" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<FractionalSecondsOutput>\n\
         \    <datetime>2000-01-02T20:34:56.123Z</datetime>\n\
          </FractionalSecondsOutput>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
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
  ( "aws.protocoltests.restxml#FractionalSeconds",
    [ ("RestXmlDateTimeWithFractionalSeconds", `Quick, rest_xml_date_time_with_fractional_seconds) ]
  )

let rest_xml_flattened_xml_map_with_xml_namespace () =
  Eio.Switch.run ~name:"RestXmlFlattenedXmlMapWithXmlNamespace" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<FlattenedXmlMapWithXmlNamespaceOutput>\n\
         \    <KVP xmlns=\"https://the-member.example.com\">\n\
         \        <K xmlns=\"https://the-key.example.com\">a</K>\n\
         \        <V xmlns=\"https://the-value.example.com\">A</V>\n\
         \    </KVP>\n\
         \    <KVP xmlns=\"https://the-member.example.com\">\n\
         \        <K xmlns=\"https://the-key.example.com\">b</K>\n\
         \        <V xmlns=\"https://the-value.example.com\">B</V>\n\
         \    </KVP>\n\
          </FlattenedXmlMapWithXmlNamespaceOutput>")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
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
  ( "aws.protocoltests.restxml#FlattenedXmlMapWithXmlNamespace",
    [
      ( "RestXmlFlattenedXmlMapWithXmlNamespace",
        `Quick,
        rest_xml_flattened_xml_map_with_xml_namespace );
    ] )

let flattened_xml_map_with_xml_name () =
  Eio.Switch.run ~name:"FlattenedXmlMapWithXmlName" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.flattened_xml_map_with_xml_name_request =
    { my_map = Some [ ("a", "A"); ("b", "B") ] }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = FlattenedXmlMapWithXmlName.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<FlattenedXmlMapWithXmlNameRequest>\n\
         \    <KVP>\n\
         \        <K>a</K>\n\
         \        <V>A</V>\n\
         \    </KVP>\n\
         \    <KVP>\n\
         \        <K>b</K>\n\
         \        <V>B</V>\n\
         \    </KVP>\n\
          </FlattenedXmlMapWithXmlNameRequest>")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/FlattenedXmlMapWithXmlName")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let flattened_xml_map_with_xml_name () =
  Eio.Switch.run ~name:"FlattenedXmlMapWithXmlName" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<FlattenedXmlMapWithXmlNameResponse>\n\
         \    <KVP>\n\
         \        <K>a</K>\n\
         \        <V>A</V>\n\
         \    </KVP>\n\
         \    <KVP>\n\
         \        <K>b</K>\n\
         \        <V>B</V>\n\
         \    </KVP>\n\
          </FlattenedXmlMapWithXmlNameResponse>")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response = FlattenedXmlMapWithXmlName.request ctx { my_map = None } in
  match response with
  | Ok result ->
      let expected =
        ({ my_map = Some [ ("a", "A"); ("b", "B") ] }
          : Types.flattened_xml_map_with_xml_name_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_flattened_xml_map_with_xml_name_response
           Types.equal_flattened_xml_map_with_xml_name_response)
        "expected output" expected result
  | Error error -> failwith (FlattenedXmlMapWithXmlName.error_to_string error)

let flattened_xml_map_with_xml_name_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#FlattenedXmlMapWithXmlName",
    [
      ("FlattenedXmlMapWithXmlName", `Quick, flattened_xml_map_with_xml_name);
      ("FlattenedXmlMapWithXmlName", `Quick, flattened_xml_map_with_xml_name);
    ] )

let flattened_xml_map () =
  Eio.Switch.run ~name:"FlattenedXmlMap" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.flattened_xml_map_request = { my_map = Some [ ("foo", FOO); ("baz", BAZ) ] } in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = FlattenedXmlMap.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<FlattenedXmlMapRequest>\n\
         \    <myMap>\n\
         \        <key>foo</key>\n\
         \        <value>Foo</value>\n\
         \    </myMap>\n\
         \    <myMap>\n\
         \        <key>baz</key>\n\
         \        <value>Baz</value>\n\
         \    </myMap>\n\
          </FlattenedXmlMapRequest>")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/FlattenedXmlMap")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let flattened_xml_map () =
  Eio.Switch.run ~name:"FlattenedXmlMap" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<FlattenedXmlMapResponse>\n\
         \    <myMap>\n\
         \        <key>foo</key>\n\
         \        <value>Foo</value>\n\
         \    </myMap>\n\
         \    <myMap>\n\
         \        <key>baz</key>\n\
         \        <value>Baz</value>\n\
         \    </myMap>\n\
          </FlattenedXmlMapResponse>")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response = FlattenedXmlMap.request ctx { my_map = None } in
  match response with
  | Ok result ->
      let expected =
        ({ my_map = Some [ ("foo", FOO); ("baz", BAZ) ] } : Types.flattened_xml_map_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_flattened_xml_map_response
           Types.equal_flattened_xml_map_response)
        "expected output" expected result
  | Error error -> failwith (FlattenedXmlMap.error_to_string error)

let flattened_xml_map_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#FlattenedXmlMap",
    [
      ("FlattenedXmlMap", `Quick, flattened_xml_map); ("FlattenedXmlMap", `Quick, flattened_xml_map);
    ] )

let rest_xml_endpoint_trait_with_host_label () =
  Eio.Switch.run ~name:"RestXmlEndpointTraitWithHostLabel" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config =
    {
      Config.dummy with
      endpoint = Some { uri = Some ("//example.com" |> Uri.of_string); headers = None };
    }
  in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.endpoint_with_host_label_operation_request = { label = "bar" } in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = EndpointWithHostLabelOperation.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some
         "<EndpointWithHostLabelOperationRequest>\n\
         \    <label>bar</label>\n\
          </EndpointWithHostLabelOperationRequest>\n")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/EndpointWithHostLabelOperation")
      request.uri
  in
  let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
  ()

let endpoint_with_host_label_operation_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#EndpointWithHostLabelOperation",
    [ ("RestXmlEndpointTraitWithHostLabel", `Quick, rest_xml_endpoint_trait_with_host_label) ] )

let rest_xml_endpoint_trait_with_host_label_and_http_binding () =
  Eio.Switch.run ~name:"RestXmlEndpointTraitWithHostLabelAndHttpBinding" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config =
    {
      Config.dummy with
      endpoint = Some { uri = Some ("//example.com" |> Uri.of_string); headers = None };
    }
  in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.host_label_header_input = { account_id = "bar" } in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = EndpointWithHostLabelHeaderOperation.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/EndpointWithHostLabelHeaderOperation")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("X-Amz-Account-Id", "bar") ]
      request.headers
  in
  ()

let endpoint_with_host_label_header_operation_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#EndpointWithHostLabelHeaderOperation",
    [
      ( "RestXmlEndpointTraitWithHostLabelAndHttpBinding",
        `Quick,
        rest_xml_endpoint_trait_with_host_label_and_http_binding );
    ] )

let rest_xml_endpoint_trait () =
  Eio.Switch.run ~name:"RestXmlEndpointTrait" @@ fun sw ->
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
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = EndpointOperation.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/EndpointOperation")
      request.uri
  in
  let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
  ()

let endpoint_operation_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#EndpointOperation",
    [ ("RestXmlEndpointTrait", `Quick, rest_xml_endpoint_trait) ] )

let empty_input_and_empty_output () =
  Eio.Switch.run ~name:"EmptyInputAndEmptyOutput" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.empty_input_and_empty_output_input = () in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = EmptyInputAndEmptyOutput.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `POST request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/EmptyInputAndEmptyOutput")
      request.uri
  in
  let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
  ()

let empty_input_and_empty_output () =
  Eio.Switch.run ~name:"EmptyInputAndEmptyOutput" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "") ~status:200 ~headers:[] ();
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
  ( "aws.protocoltests.restxml#EmptyInputAndEmptyOutput",
    [
      ("EmptyInputAndEmptyOutput", `Quick, empty_input_and_empty_output);
      ("EmptyInputAndEmptyOutput", `Quick, empty_input_and_empty_output);
    ] )

let rest_xml_date_time_with_negative_offset () =
  Eio.Switch.run ~name:"RestXmlDateTimeWithNegativeOffset" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<DatetimeOffsetsOutput>\n\
         \    <datetime>2019-12-16T22:48:18-01:00</datetime>\n\
          </DatetimeOffsetsOutput>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
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

let rest_xml_date_time_with_positive_offset () =
  Eio.Switch.run ~name:"RestXmlDateTimeWithPositiveOffset" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response
    ?body:
      (Some
         "<DatetimeOffsetsOutput>\n\
         \    <datetime>2019-12-17T00:48:18+01:00</datetime>\n\
          </DatetimeOffsetsOutput>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
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
  ( "aws.protocoltests.restxml#DatetimeOffsets",
    [
      ("RestXmlDateTimeWithNegativeOffset", `Quick, rest_xml_date_time_with_negative_offset);
      ("RestXmlDateTimeWithPositiveOffset", `Quick, rest_xml_date_time_with_positive_offset);
    ] )

let content_type_parameters_test_suite : unit Alcotest.test =
  ("aws.protocoltests.restxml#ContentTypeParameters", [])

let constant_query_string () =
  Eio.Switch.run ~name:"ConstantQueryString" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.constant_query_string_input = { hello = "hi" } in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = ConstantQueryString.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/ConstantQueryString/hi?foo=bar&hello")
      request.uri
  in
  let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
  ()

let constant_query_string_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#ConstantQueryString",
    [ ("ConstantQueryString", `Quick, constant_query_string) ] )

let constant_and_variable_query_string_missing_one_value () =
  Eio.Switch.run ~name:"ConstantAndVariableQueryStringMissingOneValue" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.constant_and_variable_query_string_input =
    { baz = Some "bam"; maybe_set = None }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = ConstantAndVariableQueryString.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/ConstantAndVariableQueryString?foo=bar&baz=bam")
      request.uri
  in
  let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
  ()

let constant_and_variable_query_string_all_values () =
  Eio.Switch.run ~name:"ConstantAndVariableQueryStringAllValues" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.constant_and_variable_query_string_input =
    { baz = Some "bam"; maybe_set = Some "yes" }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = ConstantAndVariableQueryString.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/ConstantAndVariableQueryString?foo=bar&baz=bam&maybeSet=yes")
      request.uri
  in
  let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
  ()

let constant_and_variable_query_string_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#ConstantAndVariableQueryString",
    [
      ( "ConstantAndVariableQueryStringMissingOneValue",
        `Quick,
        constant_and_variable_query_string_missing_one_value );
      ( "ConstantAndVariableQueryStringAllValues",
        `Quick,
        constant_and_variable_query_string_all_values );
    ] )

let body_with_xml_name () =
  Eio.Switch.run ~name:"BodyWithXmlName" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.body_with_xml_name_input_output = { nested = Some { name = Some "Phreddy" } } in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = BodyWithXmlName.request ctx input in
  let request = Mock.last_request () in
  let () =
    check Alcotest_http.input_body_xml_testable "expected request body value"
      (Some "<Ahoy><nested><name>Phreddy</name></nested></Ahoy>")
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
      (Uri.of_string "/BodyWithXmlName")
      request.uri
  in
  let () =
    check Alcotest_http.headers_testable "expected request headers"
      [ ("Content-Type", "application/xml") ]
      request.headers
  in
  ()

let body_with_xml_name () =
  Eio.Switch.run ~name:"BodyWithXmlName" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "<Ahoy><nested><name>Phreddy</name></nested></Ahoy>") ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response = BodyWithXmlName.request ctx { nested = None } in
  match response with
  | Ok result ->
      let expected =
        ({ nested = Some { name = Some "Phreddy" } } : Types.body_with_xml_name_input_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_body_with_xml_name_input_output
           Types.equal_body_with_xml_name_input_output)
        "expected output" expected result
  | Error error -> failwith (BodyWithXmlName.error_to_string error)

let body_with_xml_name_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#BodyWithXmlName",
    [
      ("BodyWithXmlName", `Quick, body_with_xml_name);
      ("BodyWithXmlName", `Quick, body_with_xml_name);
    ] )

let all_query_string_types () =
  Eio.Switch.run ~name:"AllQueryStringTypes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.all_query_string_types_input =
    {
      query_string = Some "Hello there";
      query_string_list = Some [ "a"; "b"; "c" ];
      query_string_set = Some [ "a"; "b"; "c" ];
      query_byte = Some 1;
      query_short = Some 2;
      query_integer = Some 3;
      query_integer_list = Some [ 1; 2; 3 ];
      query_integer_set = Some [ 1; 2; 3 ];
      query_long = Some (Smaws_Lib.CoreTypes.Int64.of_int 4);
      query_float = Some 1.1;
      query_double = Some 1.1;
      query_double_list = Some [ 1.1; 2.1; 3.1 ];
      query_boolean = Some true;
      query_boolean_list = Some [ true; false; true ];
      query_timestamp = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1.));
      query_timestamp_list =
        Some
          [
            Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1.);
            Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 2.);
            Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 3.);
          ];
      query_enum = Some FOO;
      query_enum_list = Some [ FOO; BAZ; BAR ];
      query_integer_enum = Some A;
      query_integer_enum_list = Some [ A; B ];
      query_params_map_of_strings = None;
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = AllQueryStringTypes.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string
         "/AllQueryStringTypesInput?String=Hello%20there&StringList=a&StringList=b&StringList=c&StringSet=a&StringSet=b&StringSet=c&Byte=1&Short=2&Integer=3&IntegerList=1&IntegerList=2&IntegerList=3&IntegerSet=1&IntegerSet=2&IntegerSet=3&Long=4&Float=1.1&Double=1.1&DoubleList=1.1&DoubleList=2.1&DoubleList=3.1&Boolean=true&BooleanList=true&BooleanList=false&BooleanList=true&Timestamp=1970-01-01T00%3A00%3A01Z&TimestampList=1970-01-01T00%3A00%3A01Z&TimestampList=1970-01-01T00%3A00%3A02Z&TimestampList=1970-01-01T00%3A00%3A03Z&Enum=Foo&EnumList=Foo&EnumList=Baz&EnumList=Bar&IntegerEnum=1&IntegerEnumList=1&IntegerEnumList=2")
      request.uri
  in
  let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
  ()

let rest_xml_query_string_map () =
  Eio.Switch.run ~name:"RestXmlQueryStringMap" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.all_query_string_types_input =
    {
      query_string = None;
      query_string_list = None;
      query_string_set = None;
      query_byte = None;
      query_short = None;
      query_integer = None;
      query_integer_list = None;
      query_integer_set = None;
      query_long = None;
      query_float = None;
      query_double = None;
      query_double_list = None;
      query_boolean = None;
      query_boolean_list = None;
      query_timestamp = None;
      query_timestamp_list = None;
      query_enum = None;
      query_enum_list = None;
      query_integer_enum = None;
      query_integer_enum_list = None;
      query_params_map_of_strings =
        Some [ ("QueryParamsStringKeyA", "Foo"); ("QueryParamsStringKeyB", "Bar") ];
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = AllQueryStringTypes.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/AllQueryStringTypesInput?QueryParamsStringKeyA=Foo&QueryParamsStringKeyB=Bar")
      request.uri
  in
  let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
  ()

let rest_xml_query_string_escaping () =
  Eio.Switch.run ~name:"RestXmlQueryStringEscaping" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.all_query_string_types_input =
    {
      query_string = Some " %:/?#[]@!$&'()*+,;=\240\159\152\185";
      query_string_list = None;
      query_string_set = None;
      query_byte = None;
      query_short = None;
      query_integer = None;
      query_integer_list = None;
      query_integer_set = None;
      query_long = None;
      query_float = None;
      query_double = None;
      query_double_list = None;
      query_boolean = None;
      query_boolean_list = None;
      query_timestamp = None;
      query_timestamp_list = None;
      query_enum = None;
      query_enum_list = None;
      query_integer_enum = None;
      query_integer_enum_list = None;
      query_params_map_of_strings = None;
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = AllQueryStringTypes.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string
         "/AllQueryStringTypesInput?String=%20%25%3A%2F%3F%23%5B%5D%40%21%24%26%27%28%29%2A%2B%2C%3B%3D%F0%9F%98%B9")
      request.uri
  in
  let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
  ()

let rest_xml_supports_na_n_float_query_values () =
  Eio.Switch.run ~name:"RestXmlSupportsNaNFloatQueryValues" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.all_query_string_types_input =
    {
      query_string = None;
      query_string_list = None;
      query_string_set = None;
      query_byte = None;
      query_short = None;
      query_integer = None;
      query_integer_list = None;
      query_integer_set = None;
      query_long = None;
      query_float = Some Float.nan;
      query_double = Some Float.nan;
      query_double_list = None;
      query_boolean = None;
      query_boolean_list = None;
      query_timestamp = None;
      query_timestamp_list = None;
      query_enum = None;
      query_enum_list = None;
      query_integer_enum = None;
      query_integer_enum_list = None;
      query_params_map_of_strings = None;
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = AllQueryStringTypes.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/AllQueryStringTypesInput?Float=NaN&Double=NaN")
      request.uri
  in
  let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
  ()

let rest_xml_supports_infinity_float_query_values () =
  Eio.Switch.run ~name:"RestXmlSupportsInfinityFloatQueryValues" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.all_query_string_types_input =
    {
      query_string = None;
      query_string_list = None;
      query_string_set = None;
      query_byte = None;
      query_short = None;
      query_integer = None;
      query_integer_list = None;
      query_integer_set = None;
      query_long = None;
      query_float = Some Float.infinity;
      query_double = Some Float.infinity;
      query_double_list = None;
      query_boolean = None;
      query_boolean_list = None;
      query_timestamp = None;
      query_timestamp_list = None;
      query_enum = None;
      query_enum_list = None;
      query_integer_enum = None;
      query_integer_enum_list = None;
      query_params_map_of_strings = None;
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = AllQueryStringTypes.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/AllQueryStringTypesInput?Float=Infinity&Double=Infinity")
      request.uri
  in
  let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
  ()

let rest_xml_supports_negative_infinity_float_query_values () =
  Eio.Switch.run ~name:"RestXmlSupportsNegativeInfinityFloatQueryValues" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.all_query_string_types_input =
    {
      query_string = None;
      query_string_list = None;
      query_string_set = None;
      query_byte = None;
      query_short = None;
      query_integer = None;
      query_integer_list = None;
      query_integer_set = None;
      query_long = None;
      query_float = Some Float.neg_infinity;
      query_double = Some Float.neg_infinity;
      query_double_list = None;
      query_boolean = None;
      query_boolean_list = None;
      query_timestamp = None;
      query_timestamp_list = None;
      query_enum = None;
      query_enum_list = None;
      query_integer_enum = None;
      query_integer_enum_list = None;
      query_params_map_of_strings = None;
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = AllQueryStringTypes.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/AllQueryStringTypesInput?Float=-Infinity&Double=-Infinity")
      request.uri
  in
  let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
  ()

let rest_xml_zero_and_false_query_values () =
  Eio.Switch.run ~name:"RestXmlZeroAndFalseQueryValues" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.all_query_string_types_input =
    {
      query_string = None;
      query_string_list = None;
      query_string_set = None;
      query_byte = None;
      query_short = None;
      query_integer = Some 0;
      query_integer_list = None;
      query_integer_set = None;
      query_long = None;
      query_float = None;
      query_double = None;
      query_double_list = None;
      query_boolean = Some false;
      query_boolean_list = None;
      query_timestamp = None;
      query_timestamp_list = None;
      query_enum = None;
      query_enum_list = None;
      query_integer_enum = None;
      query_integer_enum_list = None;
      query_params_map_of_strings = None;
    }
  in
  Mock.mock_response ~body:"<x/>" ~status:200 ~headers:[] ();
  let _response = AllQueryStringTypes.request ctx input in
  let request = Mock.last_request () in
  let () =
    check
      (Alcotest.option (Alcotest.testable Fmt.string String.equal))
      "expected request body value" (Some "")
      (request.body
      |> Option.map (function
        | `String x -> x
        | `Compressed (x, _) -> x
        | `Form _ -> failwith "not expecting form"
        | `None -> ""))
  in
  let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
  let () =
    check Alcotest_http.restxml_uri_testable "expected request uri"
      (Uri.of_string "/AllQueryStringTypesInput?Integer=0&Boolean=false")
      request.uri
  in
  let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
  ()

let all_query_string_types_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#AllQueryStringTypes",
    [
      ("AllQueryStringTypes", `Quick, all_query_string_types);
      ("RestXmlQueryStringMap", `Quick, rest_xml_query_string_map);
      ("RestXmlQueryStringEscaping", `Quick, rest_xml_query_string_escaping);
      ("RestXmlSupportsNaNFloatQueryValues", `Quick, rest_xml_supports_na_n_float_query_values);
      ( "RestXmlSupportsInfinityFloatQueryValues",
        `Quick,
        rest_xml_supports_infinity_float_query_values );
      ( "RestXmlSupportsNegativeInfinityFloatQueryValues",
        `Quick,
        rest_xml_supports_negative_infinity_float_query_values );
      ("RestXmlZeroAndFalseQueryValues", `Quick, rest_xml_zero_and_false_query_values);
    ] )

let () =
  Eio_main.run @@ fun env ->
  Alcotest.run "aws.protocoltests.restxml"
    [
      simple_scalar_properties_test_suite;
      timestamp_format_headers_test_suite;
      xml_attributes_test_suite;
      xml_attributes_in_middle_test_suite;
      xml_attributes_on_payload_test_suite;
      xml_blobs_test_suite;
      xml_empty_blobs_test_suite;
      xml_empty_lists_test_suite;
      xml_empty_maps_test_suite;
      xml_empty_strings_test_suite;
      xml_enums_test_suite;
      xml_int_enums_test_suite;
      xml_lists_test_suite;
      xml_maps_test_suite;
      xml_maps_xml_name_test_suite;
      xml_map_with_xml_namespace_test_suite;
      xml_namespaces_test_suite;
      xml_timestamps_test_suite;
      xml_unions_test_suite;
      recursive_shapes_test_suite;
      query_precedence_test_suite;
      query_params_as_string_list_map_test_suite;
      query_idempotency_token_auto_fill_test_suite;
      put_with_content_encoding_test_suite;
      omits_null_serializes_empty_string_test_suite;
      null_and_empty_headers_server_test_suite;
      null_and_empty_headers_client_test_suite;
      no_input_and_output_test_suite;
      no_input_and_no_output_test_suite;
      nested_xml_maps_test_suite;
      nested_xml_map_with_xml_name_test_suite;
      input_and_output_with_headers_test_suite;
      ignore_query_params_in_response_test_suite;
      http_string_payload_test_suite;
      http_response_code_test_suite;
      http_request_with_labels_and_timestamp_format_test_suite;
      http_request_with_labels_test_suite;
      http_request_with_greedy_label_in_path_test_suite;
      http_request_with_float_labels_test_suite;
      http_prefix_headers_test_suite;
      http_payload_with_xml_namespace_and_prefix_test_suite;
      http_payload_with_xml_namespace_test_suite;
      http_payload_with_xml_name_test_suite;
      http_payload_with_union_test_suite;
      http_payload_with_structure_test_suite;
      http_payload_with_member_xml_name_test_suite;
      http_payload_traits_with_media_type_test_suite;
      http_payload_traits_test_suite;
      http_enum_payload_test_suite;
      http_empty_prefix_headers_test_suite;
      greeting_with_errors_test_suite;
      fractional_seconds_test_suite;
      flattened_xml_map_with_xml_namespace_test_suite;
      flattened_xml_map_with_xml_name_test_suite;
      flattened_xml_map_test_suite;
      endpoint_with_host_label_operation_test_suite;
      endpoint_with_host_label_header_operation_test_suite;
      endpoint_operation_test_suite;
      empty_input_and_empty_output_test_suite;
      datetime_offsets_test_suite;
      content_type_parameters_test_suite;
      constant_query_string_test_suite;
      constant_and_variable_query_string_test_suite;
      body_with_xml_name_test_suite;
      all_query_string_types_test_suite;
    ]
