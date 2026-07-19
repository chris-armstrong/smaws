open Alcotest
open Smaws_Test_Support_Lib
open Restxml

let all_query_string_types () =
  Eio.Switch.run ~name:"AllQueryStringTypes" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.all_query_string_types_input =
    {
      query_params_map_of_strings = None;
      query_integer_enum_list = Some [ A; B ];
      query_integer_enum = Some A;
      query_enum_list = Some [ FOO; BAZ; BAR ];
      query_enum = Some FOO;
      query_timestamp_list =
        Some
          [
            Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1.);
            Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 2.);
            Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 3.);
          ];
      query_timestamp = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1.));
      query_boolean_list = Some [ true; false; true ];
      query_boolean = Some true;
      query_double_list = Some [ 1.1; 2.1; 3.1 ];
      query_double = Some 1.1;
      query_float = Some 1.1;
      query_long = Some (Smaws_Lib.CoreTypes.Int64.of_int 4);
      query_integer_set = Some [ 1; 2; 3 ];
      query_integer_list = Some [ 1; 2; 3 ];
      query_integer = Some 3;
      query_short = Some 2;
      query_byte = Some 1;
      query_string_set = Some [ "a"; "b"; "c" ];
      query_string_list = Some [ "a"; "b"; "c" ];
      query_string = Some "Hello there";
    }
  in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = AllQueryStringTypes.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/AllQueryStringTypesInput")
          request.uri
      in
      let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
      ()
  | Error error -> failwith (AllQueryStringTypes.error_to_string error)

let rest_xml_query_string_map () =
  Eio.Switch.run ~name:"RestXmlQueryStringMap" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.all_query_string_types_input =
    {
      query_params_map_of_strings =
        Some [ ("QueryParamsStringKeyA", "Foo"); ("QueryParamsStringKeyB", "Bar") ];
      query_integer_enum_list = None;
      query_integer_enum = None;
      query_enum_list = None;
      query_enum = None;
      query_timestamp_list = None;
      query_timestamp = None;
      query_boolean_list = None;
      query_boolean = None;
      query_double_list = None;
      query_double = None;
      query_float = None;
      query_long = None;
      query_integer_set = None;
      query_integer_list = None;
      query_integer = None;
      query_short = None;
      query_byte = None;
      query_string_set = None;
      query_string_list = None;
      query_string = None;
    }
  in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = AllQueryStringTypes.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/AllQueryStringTypesInput")
          request.uri
      in
      let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
      ()
  | Error error -> failwith (AllQueryStringTypes.error_to_string error)

let rest_xml_query_string_escaping () =
  Eio.Switch.run ~name:"RestXmlQueryStringEscaping" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.all_query_string_types_input =
    {
      query_params_map_of_strings = None;
      query_integer_enum_list = None;
      query_integer_enum = None;
      query_enum_list = None;
      query_enum = None;
      query_timestamp_list = None;
      query_timestamp = None;
      query_boolean_list = None;
      query_boolean = None;
      query_double_list = None;
      query_double = None;
      query_float = None;
      query_long = None;
      query_integer_set = None;
      query_integer_list = None;
      query_integer = None;
      query_short = None;
      query_byte = None;
      query_string_set = None;
      query_string_list = None;
      query_string = Some " %:/?#[]@!$&'()*+,;=\240\159\152\185";
    }
  in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = AllQueryStringTypes.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/AllQueryStringTypesInput")
          request.uri
      in
      let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
      ()
  | Error error -> failwith (AllQueryStringTypes.error_to_string error)

let rest_xml_supports_na_n_float_query_values () =
  Eio.Switch.run ~name:"RestXmlSupportsNaNFloatQueryValues" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.all_query_string_types_input =
    {
      query_params_map_of_strings = None;
      query_integer_enum_list = None;
      query_integer_enum = None;
      query_enum_list = None;
      query_enum = None;
      query_timestamp_list = None;
      query_timestamp = None;
      query_boolean_list = None;
      query_boolean = None;
      query_double_list = None;
      query_double = Some Float.nan;
      query_float = Some Float.nan;
      query_long = None;
      query_integer_set = None;
      query_integer_list = None;
      query_integer = None;
      query_short = None;
      query_byte = None;
      query_string_set = None;
      query_string_list = None;
      query_string = None;
    }
  in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = AllQueryStringTypes.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/AllQueryStringTypesInput")
          request.uri
      in
      let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
      ()
  | Error error -> failwith (AllQueryStringTypes.error_to_string error)

let rest_xml_supports_infinity_float_query_values () =
  Eio.Switch.run ~name:"RestXmlSupportsInfinityFloatQueryValues" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.all_query_string_types_input =
    {
      query_params_map_of_strings = None;
      query_integer_enum_list = None;
      query_integer_enum = None;
      query_enum_list = None;
      query_enum = None;
      query_timestamp_list = None;
      query_timestamp = None;
      query_boolean_list = None;
      query_boolean = None;
      query_double_list = None;
      query_double = Some Float.infinity;
      query_float = Some Float.infinity;
      query_long = None;
      query_integer_set = None;
      query_integer_list = None;
      query_integer = None;
      query_short = None;
      query_byte = None;
      query_string_set = None;
      query_string_list = None;
      query_string = None;
    }
  in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = AllQueryStringTypes.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/AllQueryStringTypesInput")
          request.uri
      in
      let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
      ()
  | Error error -> failwith (AllQueryStringTypes.error_to_string error)

let rest_xml_supports_negative_infinity_float_query_values () =
  Eio.Switch.run ~name:"RestXmlSupportsNegativeInfinityFloatQueryValues" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.all_query_string_types_input =
    {
      query_params_map_of_strings = None;
      query_integer_enum_list = None;
      query_integer_enum = None;
      query_enum_list = None;
      query_enum = None;
      query_timestamp_list = None;
      query_timestamp = None;
      query_boolean_list = None;
      query_boolean = None;
      query_double_list = None;
      query_double = Some Float.neg_infinity;
      query_float = Some Float.neg_infinity;
      query_long = None;
      query_integer_set = None;
      query_integer_list = None;
      query_integer = None;
      query_short = None;
      query_byte = None;
      query_string_set = None;
      query_string_list = None;
      query_string = None;
    }
  in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = AllQueryStringTypes.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/AllQueryStringTypesInput")
          request.uri
      in
      let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
      ()
  | Error error -> failwith (AllQueryStringTypes.error_to_string error)

let rest_xml_zero_and_false_query_values () =
  Eio.Switch.run ~name:"RestXmlZeroAndFalseQueryValues" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.all_query_string_types_input =
    {
      query_params_map_of_strings = None;
      query_integer_enum_list = None;
      query_integer_enum = None;
      query_enum_list = None;
      query_enum = None;
      query_timestamp_list = None;
      query_timestamp = None;
      query_boolean_list = None;
      query_boolean = Some false;
      query_double_list = None;
      query_double = None;
      query_float = None;
      query_long = None;
      query_integer_set = None;
      query_integer_list = None;
      query_integer = Some 0;
      query_short = None;
      query_byte = None;
      query_string_set = None;
      query_string_list = None;
      query_string = None;
    }
  in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = AllQueryStringTypes.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/AllQueryStringTypesInput")
          request.uri
      in
      let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
      ()
  | Error error -> failwith (AllQueryStringTypes.error_to_string error)

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

let body_with_xml_name () =
  Eio.Switch.run ~name:"BodyWithXmlName" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.body_with_xml_name_input_output = { nested = Some { name = Some "Phreddy" } } in
  Mock.mock_response ?body:(Some "<Ahoy><nested><name>Phreddy</name></nested></Ahoy>") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = BodyWithXmlName.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string "<Ahoy><nested><name>Phreddy</name></nested></Ahoy>"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/BodyWithXmlName")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (BodyWithXmlName.error_to_string error)

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

let constant_and_variable_query_string_missing_one_value () =
  Eio.Switch.run ~name:"ConstantAndVariableQueryStringMissingOneValue" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.constant_and_variable_query_string_input =
    { maybe_set = None; baz = Some "bam" }
  in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = ConstantAndVariableQueryString.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/ConstantAndVariableQueryString")
          request.uri
      in
      let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
      ()
  | Error error -> failwith (ConstantAndVariableQueryString.error_to_string error)

let constant_and_variable_query_string_all_values () =
  Eio.Switch.run ~name:"ConstantAndVariableQueryStringAllValues" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.constant_and_variable_query_string_input =
    { maybe_set = Some "yes"; baz = Some "bam" }
  in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = ConstantAndVariableQueryString.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/ConstantAndVariableQueryString")
          request.uri
      in
      let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
      ()
  | Error error -> failwith (ConstantAndVariableQueryString.error_to_string error)

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

let constant_query_string () =
  Eio.Switch.run ~name:"ConstantQueryString" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.constant_query_string_input = { hello = "hi" } in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = ConstantQueryString.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/ConstantQueryString/hi")
          request.uri
      in
      let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
      ()
  | Error error -> failwith (ConstantQueryString.error_to_string error)

let constant_query_string_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#ConstantQueryString",
    [ ("ConstantQueryString", `Quick, constant_query_string) ] )

let content_type_parameters_test_suite : unit Alcotest.test =
  ("aws.protocoltests.restxml#ContentTypeParameters", [])

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

let empty_input_and_empty_output () =
  Eio.Switch.run ~name:"EmptyInputAndEmptyOutput" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.empty_input_and_empty_output_input = () in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = EmptyInputAndEmptyOutput.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
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
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/EmptyInputAndEmptyOutput")
          request.uri
      in
      let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
      ()
  | Error error -> failwith (EmptyInputAndEmptyOutput.error_to_string error)

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
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = EndpointOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
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
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/EndpointOperation")
          request.uri
      in
      let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
      ()
  | Error error -> failwith (EndpointOperation.error_to_string error)

let endpoint_operation_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#EndpointOperation",
    [ ("RestXmlEndpointTrait", `Quick, rest_xml_endpoint_trait) ] )

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
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = EndpointWithHostLabelHeaderOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
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
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/EndpointWithHostLabelHeaderOperation")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("X-Amz-Account-Id", "bar") ]
          request.headers
      in
      ()
  | Error error -> failwith (EndpointWithHostLabelHeaderOperation.error_to_string error)

let endpoint_with_host_label_header_operation_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#EndpointWithHostLabelHeaderOperation",
    [
      ( "RestXmlEndpointTraitWithHostLabelAndHttpBinding",
        `Quick,
        rest_xml_endpoint_trait_with_host_label_and_http_binding );
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
  Mock.mock_response
    ?body:
      (Some
         "<EndpointWithHostLabelOperationRequest>\n\
         \    <label>bar</label>\n\
          </EndpointWithHostLabelOperationRequest>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = EndpointWithHostLabelOperation.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "<EndpointWithHostLabelOperationRequest>\n\
                \    <label>bar</label>\n\
                 </EndpointWithHostLabelOperationRequest>\n"))
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
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/EndpointWithHostLabelOperation")
          request.uri
      in
      let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
      ()
  | Error error -> failwith (EndpointWithHostLabelOperation.error_to_string error)

let endpoint_with_host_label_operation_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#EndpointWithHostLabelOperation",
    [ ("RestXmlEndpointTraitWithHostLabel", `Quick, rest_xml_endpoint_trait_with_host_label) ] )

let flattened_xml_map () =
  Eio.Switch.run ~name:"FlattenedXmlMap" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.flattened_xml_map_request = { my_map = Some [ ("foo", FOO); ("baz", BAZ) ] } in
  Mock.mock_response
    ?body:
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
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = FlattenedXmlMap.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "<FlattenedXmlMapRequest>\n\
                \    <myMap>\n\
                \        <key>foo</key>\n\
                \        <value>Foo</value>\n\
                \    </myMap>\n\
                \    <myMap>\n\
                \        <key>baz</key>\n\
                \        <value>Baz</value>\n\
                \    </myMap>\n\
                 </FlattenedXmlMapRequest>"))
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
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/FlattenedXmlMap")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (FlattenedXmlMap.error_to_string error)

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

let flattened_xml_map_with_xml_name () =
  Eio.Switch.run ~name:"FlattenedXmlMapWithXmlName" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.flattened_xml_map_with_xml_name_request =
    { my_map = Some [ ("a", "A"); ("b", "B") ] }
  in
  Mock.mock_response
    ?body:
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
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = FlattenedXmlMapWithXmlName.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "<FlattenedXmlMapWithXmlNameRequest>\n\
                \    <KVP>\n\
                \        <K>a</K>\n\
                \        <V>A</V>\n\
                \    </KVP>\n\
                \    <KVP>\n\
                \        <K>b</K>\n\
                \        <V>B</V>\n\
                \    </KVP>\n\
                 </FlattenedXmlMapWithXmlNameRequest>"))
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
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/FlattenedXmlMapWithXmlName")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (FlattenedXmlMapWithXmlName.error_to_string error)

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
    ~headers:[ ("X-Header", "Header"); ("Content-Type", "application/xml") ]
    ();
  let response = GreetingWithErrors.request ctx () in
  match response with
  | Error (`ComplexError e) ->
      let expected =
        ({
           nested = Some { foo = Some "bar" };
           top_level = Some "Top level";
           header = Some "Header";
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

let http_empty_prefix_headers_request_client () =
  Eio.Switch.run ~name:"HttpEmptyPrefixHeadersRequestClient" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_empty_prefix_headers_input =
    {
      specific_header = Some "There";
      prefix_headers = Some [ ("x-foo", "Foo"); ("hello", "Hello") ];
    }
  in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = HttpEmptyPrefixHeaders.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/HttpEmptyPrefixHeaders")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("hello", "There"); ("x-foo", "Foo") ]
          request.headers
      in
      ()
  | Error error -> failwith (HttpEmptyPrefixHeaders.error_to_string error)

let http_empty_prefix_headers_response_server () =
  Eio.Switch.run ~name:"HttpEmptyPrefixHeadersResponseServer" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:None ~status:200 ~headers:[ ("hello", "There"); ("x-foo", "Foo") ] ();
  let response =
    HttpEmptyPrefixHeaders.request ctx { specific_header = None; prefix_headers = None }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           specific_header = Some "There";
           prefix_headers = Some [ ("x-foo", "Foo"); ("hello", "Hello") ];
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
      ("HttpEmptyPrefixHeadersResponseServer", `Quick, http_empty_prefix_headers_response_server);
    ] )

let rest_xml_enum_payload_request () =
  Eio.Switch.run ~name:"RestXmlEnumPayloadRequest" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.enum_payload_input = { payload = Some V } in
  Mock.mock_response ?body:(Some "enumvalue") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = HttpEnumPayload.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string "enumvalue"))
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
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/EnumPayload")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "text/plain") ]
          request.headers
      in
      ()
  | Error error -> failwith (HttpEnumPayload.error_to_string error)

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

let http_payload_traits_with_blob () =
  Eio.Switch.run ~name:"HttpPayloadTraitsWithBlob" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_payload_traits_input_output =
    { blob = Some (Smaws_Lib.CoreTypes.Blob.of_string "blobby blob blob"); foo = Some "Foo" }
  in
  Mock.mock_response ?body:(Some "blobby blob blob") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = HttpPayloadTraits.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string "blobby blob blob"))
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
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/HttpPayloadTraits")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("X-Foo", "Foo") ]
          request.headers
      in
      ()
  | Error error -> failwith (HttpPayloadTraits.error_to_string error)

let http_payload_traits_with_no_blob_body () =
  Eio.Switch.run ~name:"HttpPayloadTraitsWithNoBlobBody" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_payload_traits_input_output = { blob = None; foo = Some "Foo" } in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = HttpPayloadTraits.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
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
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/HttpPayloadTraits")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("X-Foo", "Foo") ]
          request.headers
      in
      ()
  | Error error -> failwith (HttpPayloadTraits.error_to_string error)

let http_payload_traits_with_blob () =
  Eio.Switch.run ~name:"HttpPayloadTraitsWithBlob" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "blobby blob blob") ~status:200 ~headers:[ ("X-Foo", "Foo") ] ();
  let response = HttpPayloadTraits.request ctx { blob = None; foo = None } in
  match response with
  | Ok result ->
      let expected =
        ({ blob = Some (Smaws_Lib.CoreTypes.Blob.of_string "blobby blob blob"); foo = Some "Foo" }
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
  let response = HttpPayloadTraits.request ctx { blob = None; foo = None } in
  match response with
  | Ok result ->
      let expected = ({ blob = None; foo = Some "Foo" } : Types.http_payload_traits_input_output) in
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

let http_payload_traits_with_media_type_with_blob () =
  Eio.Switch.run ~name:"HttpPayloadTraitsWithMediaTypeWithBlob" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_payload_traits_with_media_type_input_output =
    { blob = Some (Smaws_Lib.CoreTypes.Blob.of_string "blobby blob blob"); foo = Some "Foo" }
  in
  Mock.mock_response ?body:(Some "blobby blob blob") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = HttpPayloadTraitsWithMediaType.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string "blobby blob blob"))
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
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/HttpPayloadTraitsWithMediaType")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "text/plain"); ("X-Foo", "Foo") ]
          request.headers
      in
      ()
  | Error error -> failwith (HttpPayloadTraitsWithMediaType.error_to_string error)

let http_payload_traits_with_media_type_with_blob () =
  Eio.Switch.run ~name:"HttpPayloadTraitsWithMediaTypeWithBlob" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "blobby blob blob") ~status:200
    ~headers:[ ("Content-Type", "text/plain"); ("X-Foo", "Foo") ]
    ();
  let response = HttpPayloadTraitsWithMediaType.request ctx { blob = None; foo = None } in
  match response with
  | Ok result ->
      let expected =
        ({ blob = Some (Smaws_Lib.CoreTypes.Blob.of_string "blobby blob blob"); foo = Some "Foo" }
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

let http_payload_with_member_xml_name () =
  Eio.Switch.run ~name:"HttpPayloadWithMemberXmlName" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_payload_with_member_xml_name_input_output =
    { nested = Some { name = Some "Phreddy" } }
  in
  Mock.mock_response ?body:(Some "<Hola><name>Phreddy</name></Hola>") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = HttpPayloadWithMemberXmlName.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string "<Hola><name>Phreddy</name></Hola>"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/HttpPayloadWithMemberXmlName")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (HttpPayloadWithMemberXmlName.error_to_string error)

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

let http_payload_with_structure () =
  Eio.Switch.run ~name:"HttpPayloadWithStructure" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_payload_with_structure_input_output =
    { nested = Some { name = Some "Phreddy"; greeting = Some "hello" } }
  in
  Mock.mock_response
    ?body:
      (Some
         "<NestedPayload>\n\
         \    <greeting>hello</greeting>\n\
         \    <name>Phreddy</name>\n\
          </NestedPayload>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = HttpPayloadWithStructure.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "<NestedPayload>\n\
                \    <greeting>hello</greeting>\n\
                \    <name>Phreddy</name>\n\
                 </NestedPayload>\n"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/HttpPayloadWithStructure")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (HttpPayloadWithStructure.error_to_string error)

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
        ({ nested = Some { name = Some "Phreddy"; greeting = Some "hello" } }
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

let rest_xml_http_payload_with_union () =
  Eio.Switch.run ~name:"RestXmlHttpPayloadWithUnion" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_payload_with_union_input_output = { nested = Some (Greeting "hello") } in
  Mock.mock_response ?body:(Some "<UnionPayload>\n    <greeting>hello</greeting>\n</UnionPayload>")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = HttpPayloadWithUnion.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "<UnionPayload>\n    <greeting>hello</greeting>\n</UnionPayload>"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/HttpPayloadWithUnion")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (HttpPayloadWithUnion.error_to_string error)

let rest_xml_http_payload_with_unset_union () =
  Eio.Switch.run ~name:"RestXmlHttpPayloadWithUnsetUnion" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_payload_with_union_input_output = { nested = None } in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = HttpPayloadWithUnion.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/HttpPayloadWithUnion")
          request.uri
      in
      let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
      ()
  | Error error -> failwith (HttpPayloadWithUnion.error_to_string error)

let rest_xml_http_payload_with_union () =
  Eio.Switch.run ~name:"RestXmlHttpPayloadWithUnion" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "<UnionPayload>\n    <greeting>hello</greeting>\n</UnionPayload>")
    ~status:200
    ~headers:[ ("Content-Type", "application/xml") ]
    ();
  let response = HttpPayloadWithUnion.request ctx { nested = None } in
  match response with
  | Ok result ->
      let expected =
        ({ nested = Some (Greeting "hello") } : Types.http_payload_with_union_input_output)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_http_payload_with_union_input_output
           Types.equal_http_payload_with_union_input_output)
        "expected output" expected result
  | Error error -> failwith (HttpPayloadWithUnion.error_to_string error)

let rest_xml_http_payload_with_unset_union () =
  Eio.Switch.run ~name:"RestXmlHttpPayloadWithUnsetUnion" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "") ~status:200 ~headers:[ ("Content-Length", "0") ] ();
  let response = HttpPayloadWithUnion.request ctx { nested = None } in
  match response with
  | Ok result ->
      let expected = ({ nested = None } : Types.http_payload_with_union_input_output) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_http_payload_with_union_input_output
           Types.equal_http_payload_with_union_input_output)
        "expected output" expected result
  | Error error -> failwith (HttpPayloadWithUnion.error_to_string error)

let http_payload_with_union_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#HttpPayloadWithUnion",
    [
      ("RestXmlHttpPayloadWithUnion", `Quick, rest_xml_http_payload_with_union);
      ("RestXmlHttpPayloadWithUnsetUnion", `Quick, rest_xml_http_payload_with_unset_union);
      ("RestXmlHttpPayloadWithUnion", `Quick, rest_xml_http_payload_with_union);
      ("RestXmlHttpPayloadWithUnsetUnion", `Quick, rest_xml_http_payload_with_unset_union);
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
  Mock.mock_response ?body:(Some "<Hello><name>Phreddy</name></Hello>") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = HttpPayloadWithXmlName.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string "<Hello><name>Phreddy</name></Hello>"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/HttpPayloadWithXmlName")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (HttpPayloadWithXmlName.error_to_string error)

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

let http_payload_with_xml_namespace () =
  Eio.Switch.run ~name:"HttpPayloadWithXmlNamespace" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_payload_with_xml_namespace_input_output =
    { nested = Some { name = Some "Phreddy" } }
  in
  Mock.mock_response
    ?body:
      (Some
         "<PayloadWithXmlNamespace xmlns=\"http://foo.com\">\n\
         \    <name>Phreddy</name>\n\
          </PayloadWithXmlNamespace>")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = HttpPayloadWithXmlNamespace.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "<PayloadWithXmlNamespace xmlns=\"http://foo.com\">\n\
                \    <name>Phreddy</name>\n\
                 </PayloadWithXmlNamespace>"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/HttpPayloadWithXmlNamespace")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (HttpPayloadWithXmlNamespace.error_to_string error)

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

let http_payload_with_xml_namespace_and_prefix () =
  Eio.Switch.run ~name:"HttpPayloadWithXmlNamespaceAndPrefix" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_payload_with_xml_namespace_and_prefix_input_output =
    { nested = Some { name = Some "Phreddy" } }
  in
  Mock.mock_response
    ?body:
      (Some
         "<PayloadWithXmlNamespaceAndPrefix xmlns:baz=\"http://foo.com\">\n\
         \    <name>Phreddy</name>\n\
          </PayloadWithXmlNamespaceAndPrefix>")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = HttpPayloadWithXmlNamespaceAndPrefix.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "<PayloadWithXmlNamespaceAndPrefix xmlns:baz=\"http://foo.com\">\n\
                \    <name>Phreddy</name>\n\
                 </PayloadWithXmlNamespaceAndPrefix>"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/HttpPayloadWithXmlNamespaceAndPrefix")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (HttpPayloadWithXmlNamespaceAndPrefix.error_to_string error)

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

let http_prefix_headers_are_present () =
  Eio.Switch.run ~name:"HttpPrefixHeadersArePresent" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_prefix_headers_input_output =
    { foo_map = Some [ ("abc", "Abc value"); ("def", "Def value") ]; foo = Some "Foo" }
  in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = HttpPrefixHeaders.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/HttpPrefixHeaders")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("x-foo-def", "Def value"); ("x-foo-abc", "Abc value"); ("x-foo", "Foo") ]
          request.headers
      in
      ()
  | Error error -> failwith (HttpPrefixHeaders.error_to_string error)

let http_prefix_headers_are_not_present () =
  Eio.Switch.run ~name:"HttpPrefixHeadersAreNotPresent" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_prefix_headers_input_output = { foo_map = Some []; foo = Some "Foo" } in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = HttpPrefixHeaders.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/HttpPrefixHeaders")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("x-foo", "Foo") ]
          request.headers
      in
      ()
  | Error error -> failwith (HttpPrefixHeaders.error_to_string error)

let http_prefix_empty_headers () =
  Eio.Switch.run ~name:"HttpPrefixEmptyHeaders" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_prefix_headers_input_output =
    { foo_map = Some [ ("abc", "") ]; foo = None }
  in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = HttpPrefixHeaders.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/HttpPrefixHeaders")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("x-foo-abc", "") ]
          request.headers
      in
      ()
  | Error error -> failwith (HttpPrefixHeaders.error_to_string error)

let http_prefix_headers_are_present () =
  Eio.Switch.run ~name:"HttpPrefixHeadersArePresent" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("x-foo-def", "Def value"); ("x-foo-abc", "Abc value"); ("x-foo", "Foo") ]
    ();
  let response = HttpPrefixHeaders.request ctx { foo_map = None; foo = None } in
  match response with
  | Ok result ->
      let expected =
        ({ foo_map = Some [ ("abc", "Abc value"); ("def", "Def value") ]; foo = Some "Foo" }
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
  let response = HttpPrefixHeaders.request ctx { foo_map = None; foo = None } in
  match response with
  | Ok result ->
      let expected =
        ({ foo_map = Some []; foo = Some "Foo" } : Types.http_prefix_headers_input_output)
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

let rest_xml_supports_na_n_float_labels () =
  Eio.Switch.run ~name:"RestXmlSupportsNaNFloatLabels" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_request_with_float_labels_input =
    { double = Float.nan; float_ = Float.nan }
  in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = HttpRequestWithFloatLabels.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/FloatHttpLabels/NaN/NaN")
          request.uri
      in
      let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
      ()
  | Error error -> failwith (HttpRequestWithFloatLabels.error_to_string error)

let rest_xml_supports_infinity_float_labels () =
  Eio.Switch.run ~name:"RestXmlSupportsInfinityFloatLabels" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_request_with_float_labels_input =
    { double = Float.infinity; float_ = Float.infinity }
  in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = HttpRequestWithFloatLabels.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/FloatHttpLabels/Infinity/Infinity")
          request.uri
      in
      let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
      ()
  | Error error -> failwith (HttpRequestWithFloatLabels.error_to_string error)

let rest_xml_supports_negative_infinity_float_labels () =
  Eio.Switch.run ~name:"RestXmlSupportsNegativeInfinityFloatLabels" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_request_with_float_labels_input =
    { double = Float.neg_infinity; float_ = Float.neg_infinity }
  in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = HttpRequestWithFloatLabels.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/FloatHttpLabels/-Infinity/-Infinity")
          request.uri
      in
      let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
      ()
  | Error error -> failwith (HttpRequestWithFloatLabels.error_to_string error)

let http_request_with_float_labels_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#HttpRequestWithFloatLabels",
    [
      ("RestXmlSupportsNaNFloatLabels", `Quick, rest_xml_supports_na_n_float_labels);
      ("RestXmlSupportsInfinityFloatLabels", `Quick, rest_xml_supports_infinity_float_labels);
      ( "RestXmlSupportsNegativeInfinityFloatLabels",
        `Quick,
        rest_xml_supports_negative_infinity_float_labels );
    ] )

let http_request_with_greedy_label_in_path () =
  Eio.Switch.run ~name:"HttpRequestWithGreedyLabelInPath" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_request_with_greedy_label_in_path_input =
    { baz = "there/guy"; foo = "hello" }
  in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = HttpRequestWithGreedyLabelInPath.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/HttpRequestWithGreedyLabelInPath/foo/hello/baz/there/guy")
          request.uri
      in
      let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
      ()
  | Error error -> failwith (HttpRequestWithGreedyLabelInPath.error_to_string error)

let http_request_with_greedy_label_in_path_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#HttpRequestWithGreedyLabelInPath",
    [ ("HttpRequestWithGreedyLabelInPath", `Quick, http_request_with_greedy_label_in_path) ] )

let input_with_headers_and_all_params () =
  Eio.Switch.run ~name:"InputWithHeadersAndAllParams" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_request_with_labels_input =
    {
      timestamp = Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.);
      boolean_ = true;
      double = 5.1;
      float_ = 4.1;
      long = Smaws_Lib.CoreTypes.Int64.of_int 3;
      integer = 2;
      short = 1;
      string_ = "string";
    }
  in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = HttpRequestWithLabels.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/HttpRequestWithLabels/string/1/2/3/4.1/5.1/true/2019-12-16T23%3A48%3A18Z")
          request.uri
      in
      let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
      ()
  | Error error -> failwith (HttpRequestWithLabels.error_to_string error)

let http_request_label_escaping () =
  Eio.Switch.run ~name:"HttpRequestLabelEscaping" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_request_with_labels_input =
    {
      timestamp = Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.);
      boolean_ = true;
      double = 5.1;
      float_ = 4.1;
      long = Smaws_Lib.CoreTypes.Int64.of_int 3;
      integer = 2;
      short = 1;
      string_ = " %:/?#[]@!$&'()*+,;=\240\159\152\185";
    }
  in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = HttpRequestWithLabels.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string
             "/HttpRequestWithLabels/%20%25%3A%2F%3F%23%5B%5D%40%21%24%26%27%28%29%2A%2B%2C%3B%3D%F0%9F%98%B9/1/2/3/4.1/5.1/true/2019-12-16T23%3A48%3A18Z")
          request.uri
      in
      let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
      ()
  | Error error -> failwith (HttpRequestWithLabels.error_to_string error)

let http_request_with_labels_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#HttpRequestWithLabels",
    [
      ("InputWithHeadersAndAllParams", `Quick, input_with_headers_and_all_params);
      ("HttpRequestLabelEscaping", `Quick, http_request_label_escaping);
    ] )

let http_request_with_labels_and_timestamp_format () =
  Eio.Switch.run ~name:"HttpRequestWithLabelsAndTimestampFormat" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.http_request_with_labels_and_timestamp_format_input =
    {
      target_date_time = Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.);
      target_http_date = Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.);
      target_epoch_seconds = Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.);
      default_format = Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.);
      member_date_time = Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.);
      member_http_date = Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.);
      member_epoch_seconds = Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.);
    }
  in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = HttpRequestWithLabelsAndTimestampFormat.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string
             "/HttpRequestWithLabelsAndTimestampFormat/1576540098/Mon%2C%2016%20Dec%202019%2023%3A48%3A18%20GMT/2019-12-16T23%3A48%3A18Z/2019-12-16T23%3A48%3A18Z/1576540098/Mon%2C%2016%20Dec%202019%2023%3A48%3A18%20GMT/2019-12-16T23%3A48%3A18Z")
          request.uri
      in
      let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
      ()
  | Error error -> failwith (HttpRequestWithLabelsAndTimestampFormat.error_to_string error)

let http_request_with_labels_and_timestamp_format_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#HttpRequestWithLabelsAndTimestampFormat",
    [
      ( "HttpRequestWithLabelsAndTimestampFormat",
        `Quick,
        http_request_with_labels_and_timestamp_format );
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

let rest_xml_string_payload_request () =
  Eio.Switch.run ~name:"RestXmlStringPayloadRequest" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.string_payload_input = { payload = Some "rawstring" } in
  Mock.mock_response ?body:(Some "rawstring") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = HttpStringPayload.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string "rawstring"))
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
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/StringPayload")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "text/plain") ]
          request.headers
      in
      ()
  | Error error -> failwith (HttpStringPayload.error_to_string error)

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

let input_and_output_with_string_headers () =
  Eio.Switch.run ~name:"InputAndOutputWithStringHeaders" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.input_and_output_with_headers_i_o =
    {
      header_enum_list = None;
      header_enum = None;
      header_timestamp_list = None;
      header_boolean_list = None;
      header_integer_list = None;
      header_string_set = Some [ "a"; "b"; "c" ];
      header_string_list = Some [ "a"; "b"; "c" ];
      header_false_bool = None;
      header_true_bool = None;
      header_double = None;
      header_float = None;
      header_long = None;
      header_integer = None;
      header_short = None;
      header_byte = None;
      header_string = Some "Hello";
    }
  in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = InputAndOutputWithHeaders.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
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
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/InputAndOutputWithHeaders")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("X-StringSet", "a, b, c"); ("X-StringList", "a, b, c"); ("X-String", "Hello") ]
          request.headers
      in
      ()
  | Error error -> failwith (InputAndOutputWithHeaders.error_to_string error)

let input_and_output_with_numeric_headers () =
  Eio.Switch.run ~name:"InputAndOutputWithNumericHeaders" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.input_and_output_with_headers_i_o =
    {
      header_enum_list = None;
      header_enum = None;
      header_timestamp_list = None;
      header_boolean_list = None;
      header_integer_list = Some [ 1; 2; 3 ];
      header_string_set = None;
      header_string_list = None;
      header_false_bool = None;
      header_true_bool = None;
      header_double = Some 1.1;
      header_float = Some 1.1;
      header_long = Some (Smaws_Lib.CoreTypes.Int64.of_int 123);
      header_integer = Some 123;
      header_short = Some 123;
      header_byte = Some 1;
      header_string = None;
    }
  in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = InputAndOutputWithHeaders.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
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
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/InputAndOutputWithHeaders")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-IntegerList", "1, 2, 3");
            ("X-Double", "1.1");
            ("X-Float", "1.1");
            ("X-Long", "123");
            ("X-Integer", "123");
            ("X-Short", "123");
            ("X-Byte", "1");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (InputAndOutputWithHeaders.error_to_string error)

let input_and_output_with_boolean_headers () =
  Eio.Switch.run ~name:"InputAndOutputWithBooleanHeaders" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.input_and_output_with_headers_i_o =
    {
      header_enum_list = None;
      header_enum = None;
      header_timestamp_list = None;
      header_boolean_list = Some [ true; false; true ];
      header_integer_list = None;
      header_string_set = None;
      header_string_list = None;
      header_false_bool = Some false;
      header_true_bool = Some true;
      header_double = None;
      header_float = None;
      header_long = None;
      header_integer = None;
      header_short = None;
      header_byte = None;
      header_string = None;
    }
  in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = InputAndOutputWithHeaders.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
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
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/InputAndOutputWithHeaders")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-BooleanList", "true, false, true"); ("X-Boolean2", "false"); ("X-Boolean1", "true");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (InputAndOutputWithHeaders.error_to_string error)

let input_and_output_with_timestamp_headers () =
  Eio.Switch.run ~name:"InputAndOutputWithTimestampHeaders" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.input_and_output_with_headers_i_o =
    {
      header_enum_list = None;
      header_enum = None;
      header_timestamp_list =
        Some
          [
            Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.);
            Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.);
          ];
      header_boolean_list = None;
      header_integer_list = None;
      header_string_set = None;
      header_string_list = None;
      header_false_bool = None;
      header_true_bool = None;
      header_double = None;
      header_float = None;
      header_long = None;
      header_integer = None;
      header_short = None;
      header_byte = None;
      header_string = None;
    }
  in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = InputAndOutputWithHeaders.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
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
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/InputAndOutputWithHeaders")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("X-TimestampList", "Mon, 16 Dec 2019 23:48:18 GMT, Mon, 16 Dec 2019 23:48:18 GMT") ]
          request.headers
      in
      ()
  | Error error -> failwith (InputAndOutputWithHeaders.error_to_string error)

let input_and_output_with_enum_headers () =
  Eio.Switch.run ~name:"InputAndOutputWithEnumHeaders" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.input_and_output_with_headers_i_o =
    {
      header_enum_list = Some [ FOO; BAR; BAZ ];
      header_enum = Some FOO;
      header_timestamp_list = None;
      header_boolean_list = None;
      header_integer_list = None;
      header_string_set = None;
      header_string_list = None;
      header_false_bool = None;
      header_true_bool = None;
      header_double = None;
      header_float = None;
      header_long = None;
      header_integer = None;
      header_short = None;
      header_byte = None;
      header_string = None;
    }
  in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = InputAndOutputWithHeaders.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
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
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/InputAndOutputWithHeaders")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("X-EnumList", "Foo, Bar, Baz"); ("X-Enum", "Foo") ]
          request.headers
      in
      ()
  | Error error -> failwith (InputAndOutputWithHeaders.error_to_string error)

let rest_xml_supports_na_n_float_header_inputs () =
  Eio.Switch.run ~name:"RestXmlSupportsNaNFloatHeaderInputs" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.input_and_output_with_headers_i_o =
    {
      header_enum_list = None;
      header_enum = None;
      header_timestamp_list = None;
      header_boolean_list = None;
      header_integer_list = None;
      header_string_set = None;
      header_string_list = None;
      header_false_bool = None;
      header_true_bool = None;
      header_double = Some Float.nan;
      header_float = Some Float.nan;
      header_long = None;
      header_integer = None;
      header_short = None;
      header_byte = None;
      header_string = None;
    }
  in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = InputAndOutputWithHeaders.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
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
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/InputAndOutputWithHeaders")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("X-Double", "NaN"); ("X-Float", "NaN") ]
          request.headers
      in
      ()
  | Error error -> failwith (InputAndOutputWithHeaders.error_to_string error)

let rest_xml_supports_infinity_float_header_inputs () =
  Eio.Switch.run ~name:"RestXmlSupportsInfinityFloatHeaderInputs" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.input_and_output_with_headers_i_o =
    {
      header_enum_list = None;
      header_enum = None;
      header_timestamp_list = None;
      header_boolean_list = None;
      header_integer_list = None;
      header_string_set = None;
      header_string_list = None;
      header_false_bool = None;
      header_true_bool = None;
      header_double = Some Float.infinity;
      header_float = Some Float.infinity;
      header_long = None;
      header_integer = None;
      header_short = None;
      header_byte = None;
      header_string = None;
    }
  in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = InputAndOutputWithHeaders.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
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
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/InputAndOutputWithHeaders")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("X-Double", "Infinity"); ("X-Float", "Infinity") ]
          request.headers
      in
      ()
  | Error error -> failwith (InputAndOutputWithHeaders.error_to_string error)

let rest_xml_supports_negative_infinity_float_header_inputs () =
  Eio.Switch.run ~name:"RestXmlSupportsNegativeInfinityFloatHeaderInputs" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.input_and_output_with_headers_i_o =
    {
      header_enum_list = None;
      header_enum = None;
      header_timestamp_list = None;
      header_boolean_list = None;
      header_integer_list = None;
      header_string_set = None;
      header_string_list = None;
      header_false_bool = None;
      header_true_bool = None;
      header_double = Some Float.neg_infinity;
      header_float = Some Float.neg_infinity;
      header_long = None;
      header_integer = None;
      header_short = None;
      header_byte = None;
      header_string = None;
    }
  in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = InputAndOutputWithHeaders.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
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
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/InputAndOutputWithHeaders")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("X-Double", "-Infinity"); ("X-Float", "-Infinity") ]
          request.headers
      in
      ()
  | Error error -> failwith (InputAndOutputWithHeaders.error_to_string error)

let input_and_output_with_string_headers () =
  Eio.Switch.run ~name:"InputAndOutputWithStringHeaders" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("X-StringSet", "a, b, c"); ("X-StringList", "a, b, c"); ("X-String", "Hello") ]
    ();
  let response =
    InputAndOutputWithHeaders.request ctx
      {
        header_enum_list = None;
        header_enum = None;
        header_timestamp_list = None;
        header_boolean_list = None;
        header_integer_list = None;
        header_string_set = None;
        header_string_list = None;
        header_false_bool = None;
        header_true_bool = None;
        header_double = None;
        header_float = None;
        header_long = None;
        header_integer = None;
        header_short = None;
        header_byte = None;
        header_string = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           header_enum_list = None;
           header_enum = None;
           header_timestamp_list = None;
           header_boolean_list = None;
           header_integer_list = None;
           header_string_set = Some [ "a"; "b"; "c" ];
           header_string_list = Some [ "a"; "b"; "c" ];
           header_false_bool = None;
           header_true_bool = None;
           header_double = None;
           header_float = None;
           header_long = None;
           header_integer = None;
           header_short = None;
           header_byte = None;
           header_string = Some "Hello";
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
        ("X-IntegerList", "1, 2, 3");
        ("X-Double", "1.1");
        ("X-Float", "1.1");
        ("X-Long", "123");
        ("X-Integer", "123");
        ("X-Short", "123");
        ("X-Byte", "1");
      ]
    ();
  let response =
    InputAndOutputWithHeaders.request ctx
      {
        header_enum_list = None;
        header_enum = None;
        header_timestamp_list = None;
        header_boolean_list = None;
        header_integer_list = None;
        header_string_set = None;
        header_string_list = None;
        header_false_bool = None;
        header_true_bool = None;
        header_double = None;
        header_float = None;
        header_long = None;
        header_integer = None;
        header_short = None;
        header_byte = None;
        header_string = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           header_enum_list = None;
           header_enum = None;
           header_timestamp_list = None;
           header_boolean_list = None;
           header_integer_list = Some [ 1; 2; 3 ];
           header_string_set = None;
           header_string_list = None;
           header_false_bool = None;
           header_true_bool = None;
           header_double = Some 1.1;
           header_float = Some 1.1;
           header_long = Some (Smaws_Lib.CoreTypes.Int64.of_int 123);
           header_integer = Some 123;
           header_short = Some 123;
           header_byte = Some 1;
           header_string = None;
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
      [ ("X-BooleanList", "true, false, true"); ("X-Boolean2", "false"); ("X-Boolean1", "true") ]
    ();
  let response =
    InputAndOutputWithHeaders.request ctx
      {
        header_enum_list = None;
        header_enum = None;
        header_timestamp_list = None;
        header_boolean_list = None;
        header_integer_list = None;
        header_string_set = None;
        header_string_list = None;
        header_false_bool = None;
        header_true_bool = None;
        header_double = None;
        header_float = None;
        header_long = None;
        header_integer = None;
        header_short = None;
        header_byte = None;
        header_string = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           header_enum_list = None;
           header_enum = None;
           header_timestamp_list = None;
           header_boolean_list = Some [ true; false; true ];
           header_integer_list = None;
           header_string_set = None;
           header_string_list = None;
           header_false_bool = Some false;
           header_true_bool = Some true;
           header_double = None;
           header_float = None;
           header_long = None;
           header_integer = None;
           header_short = None;
           header_byte = None;
           header_string = None;
         }
          : Types.input_and_output_with_headers_i_o)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_input_and_output_with_headers_i_o
           Types.equal_input_and_output_with_headers_i_o)
        "expected output" expected result
  | Error error -> failwith (InputAndOutputWithHeaders.error_to_string error)

let input_and_output_with_timestamp_headers () =
  Eio.Switch.run ~name:"InputAndOutputWithTimestampHeaders" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("X-TimestampList", "Mon, 16 Dec 2019 23:48:18 GMT, Mon, 16 Dec 2019 23:48:18 GMT") ]
    ();
  let response =
    InputAndOutputWithHeaders.request ctx
      {
        header_enum_list = None;
        header_enum = None;
        header_timestamp_list = None;
        header_boolean_list = None;
        header_integer_list = None;
        header_string_set = None;
        header_string_list = None;
        header_false_bool = None;
        header_true_bool = None;
        header_double = None;
        header_float = None;
        header_long = None;
        header_integer = None;
        header_short = None;
        header_byte = None;
        header_string = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           header_enum_list = None;
           header_enum = None;
           header_timestamp_list =
             Some
               [
                 Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.);
                 Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.);
               ];
           header_boolean_list = None;
           header_integer_list = None;
           header_string_set = None;
           header_string_list = None;
           header_false_bool = None;
           header_true_bool = None;
           header_double = None;
           header_float = None;
           header_long = None;
           header_integer = None;
           header_short = None;
           header_byte = None;
           header_string = None;
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
    ~headers:[ ("X-EnumList", "Foo, Bar, Baz"); ("X-Enum", "Foo") ]
    ();
  let response =
    InputAndOutputWithHeaders.request ctx
      {
        header_enum_list = None;
        header_enum = None;
        header_timestamp_list = None;
        header_boolean_list = None;
        header_integer_list = None;
        header_string_set = None;
        header_string_list = None;
        header_false_bool = None;
        header_true_bool = None;
        header_double = None;
        header_float = None;
        header_long = None;
        header_integer = None;
        header_short = None;
        header_byte = None;
        header_string = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           header_enum_list = Some [ FOO; BAR; BAZ ];
           header_enum = Some FOO;
           header_timestamp_list = None;
           header_boolean_list = None;
           header_integer_list = None;
           header_string_set = None;
           header_string_list = None;
           header_false_bool = None;
           header_true_bool = None;
           header_double = None;
           header_float = None;
           header_long = None;
           header_integer = None;
           header_short = None;
           header_byte = None;
           header_string = None;
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
    ~headers:[ ("X-Double", "NaN"); ("X-Float", "NaN") ]
    ();
  let response =
    InputAndOutputWithHeaders.request ctx
      {
        header_enum_list = None;
        header_enum = None;
        header_timestamp_list = None;
        header_boolean_list = None;
        header_integer_list = None;
        header_string_set = None;
        header_string_list = None;
        header_false_bool = None;
        header_true_bool = None;
        header_double = None;
        header_float = None;
        header_long = None;
        header_integer = None;
        header_short = None;
        header_byte = None;
        header_string = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           header_enum_list = None;
           header_enum = None;
           header_timestamp_list = None;
           header_boolean_list = None;
           header_integer_list = None;
           header_string_set = None;
           header_string_list = None;
           header_false_bool = None;
           header_true_bool = None;
           header_double = Some Float.nan;
           header_float = Some Float.nan;
           header_long = None;
           header_integer = None;
           header_short = None;
           header_byte = None;
           header_string = None;
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
    ~headers:[ ("X-Double", "Infinity"); ("X-Float", "Infinity") ]
    ();
  let response =
    InputAndOutputWithHeaders.request ctx
      {
        header_enum_list = None;
        header_enum = None;
        header_timestamp_list = None;
        header_boolean_list = None;
        header_integer_list = None;
        header_string_set = None;
        header_string_list = None;
        header_false_bool = None;
        header_true_bool = None;
        header_double = None;
        header_float = None;
        header_long = None;
        header_integer = None;
        header_short = None;
        header_byte = None;
        header_string = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           header_enum_list = None;
           header_enum = None;
           header_timestamp_list = None;
           header_boolean_list = None;
           header_integer_list = None;
           header_string_set = None;
           header_string_list = None;
           header_false_bool = None;
           header_true_bool = None;
           header_double = Some Float.infinity;
           header_float = Some Float.infinity;
           header_long = None;
           header_integer = None;
           header_short = None;
           header_byte = None;
           header_string = None;
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
    ~headers:[ ("X-Double", "-Infinity"); ("X-Float", "-Infinity") ]
    ();
  let response =
    InputAndOutputWithHeaders.request ctx
      {
        header_enum_list = None;
        header_enum = None;
        header_timestamp_list = None;
        header_boolean_list = None;
        header_integer_list = None;
        header_string_set = None;
        header_string_list = None;
        header_false_bool = None;
        header_true_bool = None;
        header_double = None;
        header_float = None;
        header_long = None;
        header_integer = None;
        header_short = None;
        header_byte = None;
        header_string = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           header_enum_list = None;
           header_enum = None;
           header_timestamp_list = None;
           header_boolean_list = None;
           header_integer_list = None;
           header_string_set = None;
           header_string_list = None;
           header_false_bool = None;
           header_true_bool = None;
           header_double = Some Float.neg_infinity;
           header_float = Some Float.neg_infinity;
           header_long = None;
           header_integer = None;
           header_short = None;
           header_byte = None;
           header_string = None;
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
      ("InputAndOutputWithTimestampHeaders", `Quick, input_and_output_with_timestamp_headers);
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
      ("InputAndOutputWithTimestampHeaders", `Quick, input_and_output_with_timestamp_headers);
      ("InputAndOutputWithEnumHeaders", `Quick, input_and_output_with_enum_headers);
      ("RestXmlSupportsNaNFloatHeaderOutputs", `Quick, rest_xml_supports_na_n_float_header_outputs);
      ( "RestXmlSupportsInfinityFloatHeaderOutputs",
        `Quick,
        rest_xml_supports_infinity_float_header_outputs );
      ( "RestXmlSupportsNegativeInfinityFloatHeaderOutputs",
        `Quick,
        rest_xml_supports_negative_infinity_float_header_outputs );
    ] )

let nested_xml_map_request () =
  Eio.Switch.run ~name:"NestedXmlMapRequest" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.nested_xml_maps_request =
    { flat_nested_map = None; nested_map = Some [ ("foo", [ ("bar", BAR) ]) ] }
  in
  Mock.mock_response
    ?body:
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
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = NestedXmlMaps.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
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
                 </NestedXmlMapsRequest>"))
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
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/NestedXmlMaps")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (NestedXmlMaps.error_to_string error)

let flat_nested_xml_map_request () =
  Eio.Switch.run ~name:"FlatNestedXmlMapRequest" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.nested_xml_maps_request =
    { flat_nested_map = Some [ ("foo", [ ("bar", BAR) ]) ]; nested_map = None }
  in
  Mock.mock_response
    ?body:
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
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = NestedXmlMaps.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
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
                 </NestedXmlMapsRequest>"))
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
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/NestedXmlMaps")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (NestedXmlMaps.error_to_string error)

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
  let response = NestedXmlMaps.request ctx { flat_nested_map = None; nested_map = None } in
  match response with
  | Ok result ->
      let expected =
        ({ flat_nested_map = None; nested_map = Some [ ("foo", [ ("bar", BAR) ]) ] }
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
  let response = NestedXmlMaps.request ctx { flat_nested_map = None; nested_map = None } in
  match response with
  | Ok result ->
      let expected =
        ({ flat_nested_map = Some [ ("foo", [ ("bar", BAR) ]) ]; nested_map = None }
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
  Mock.mock_response
    ?body:
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
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = NestedXmlMapWithXmlName.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
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
                \    </NestedXmlMapWithXmlNameRequest>\n"))
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
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/NestedXmlMapWithXmlName")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (NestedXmlMapWithXmlName.error_to_string error)

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

let no_input_and_no_output () =
  Eio.Switch.run ~name:"NoInputAndNoOutput" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Smaws_Lib.Smithy_api.Types.unit_ = () in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = NoInputAndNoOutput.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
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
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/NoInputAndNoOutput")
          request.uri
      in
      let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
      ()
  | Error error -> failwith (NoInputAndNoOutput.error_to_string error)

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

let no_input_and_output () =
  Eio.Switch.run ~name:"NoInputAndOutput" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Smaws_Lib.Smithy_api.Types.unit_ = () in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = NoInputAndOutput.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
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
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/NoInputAndOutputOutput")
          request.uri
      in
      let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
      ()
  | Error error -> failwith (NoInputAndOutput.error_to_string error)

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

let null_and_empty_headers () =
  Eio.Switch.run ~name:"NullAndEmptyHeaders" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.null_and_empty_headers_i_o = { c = Some []; b = Some ""; a = None } in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = NullAndEmptyHeadersClient.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/NullAndEmptyHeadersClient")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("X-C", ""); ("X-B", "") ]
          request.headers
      in
      ()
  | Error error -> failwith (NullAndEmptyHeadersClient.error_to_string error)

let null_and_empty_headers_client_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#NullAndEmptyHeadersClient",
    [ ("NullAndEmptyHeaders", `Quick, null_and_empty_headers) ] )

let null_and_empty_headers () =
  Eio.Switch.run ~name:"NullAndEmptyHeaders" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "") ~status:200 ~headers:[ ("X-C", ""); ("X-B", "") ] ();
  let response = NullAndEmptyHeadersServer.request ctx { c = None; b = None; a = None } in
  match response with
  | Ok result ->
      let expected = ({ c = Some []; b = Some ""; a = None } : Types.null_and_empty_headers_i_o) in
      check
        (Alcotest_http.testable_nan_aware Types.pp_null_and_empty_headers_i_o
           Types.equal_null_and_empty_headers_i_o)
        "expected output" expected result
  | Error error -> failwith (NullAndEmptyHeadersServer.error_to_string error)

let null_and_empty_headers_server_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#NullAndEmptyHeadersServer",
    [ ("NullAndEmptyHeaders", `Quick, null_and_empty_headers) ] )

let rest_xml_omits_null_query () =
  Eio.Switch.run ~name:"RestXmlOmitsNullQuery" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.omits_null_serializes_empty_string_input =
    { empty_string = None; null_value = None }
  in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = OmitsNullSerializesEmptyString.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/OmitsNullSerializesEmptyString")
          request.uri
      in
      let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
      ()
  | Error error -> failwith (OmitsNullSerializesEmptyString.error_to_string error)

let rest_xml_serializes_empty_string () =
  Eio.Switch.run ~name:"RestXmlSerializesEmptyString" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.omits_null_serializes_empty_string_input =
    { empty_string = Some ""; null_value = None }
  in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = OmitsNullSerializesEmptyString.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `GET request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/OmitsNullSerializesEmptyString")
          request.uri
      in
      let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
      ()
  | Error error -> failwith (OmitsNullSerializesEmptyString.error_to_string error)

let omits_null_serializes_empty_string_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#OmitsNullSerializesEmptyString",
    [
      ("RestXmlOmitsNullQuery", `Quick, rest_xml_omits_null_query);
      ("RestXmlSerializesEmptyString", `Quick, rest_xml_serializes_empty_string);
    ] )

let sdk_applied_content_encoding_rest_xml () =
  Eio.Switch.run ~name:"SDKAppliedContentEncoding_restXml" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.put_with_content_encoding_input =
    {
      data =
        Some
          "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\n";
      encoding = None;
    }
  in
  Mock.mock_response ?body:None ~status:200 ~headers:[ ("Content-Type", "application/json") ] ();
  let response = PutWithContentEncoding.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () = () in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/requestcompression/putcontentwithencoding")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Encoding", "gzip") ]
          request.headers
      in
      ()
  | Error error -> failwith (PutWithContentEncoding.error_to_string error)

let sdk_appended_gzip_after_provided_encoding_rest_xml () =
  Eio.Switch.run ~name:"SDKAppendedGzipAfterProvidedEncoding_restXml" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.put_with_content_encoding_input =
    {
      data =
        Some
          "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\n";
      encoding = Some "custom";
    }
  in
  Mock.mock_response ?body:None ~status:200 ~headers:[ ("Content-Type", "application/json") ] ();
  let response = PutWithContentEncoding.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () = () in
      let () =
        check Alcotest_http.method_testable "expected request method" `POST request.method_
      in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/requestcompression/putcontentwithencoding")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Encoding", "custom, gzip") ]
          request.headers
      in
      ()
  | Error error -> failwith (PutWithContentEncoding.error_to_string error)

let put_with_content_encoding_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#PutWithContentEncoding",
    [
      ("SDKAppliedContentEncoding_restXml", `Quick, sdk_applied_content_encoding_rest_xml);
      ( "SDKAppendedGzipAfterProvidedEncoding_restXml",
        `Quick,
        sdk_appended_gzip_after_provided_encoding_rest_xml );
    ] )

let query_idempotency_token_auto_fill () =
  Eio.Switch.run ~name:"QueryIdempotencyTokenAutoFill" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.query_idempotency_token_auto_fill_input = { token = None } in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response =
    Smaws_Lib.Uuid.with_generator
      (fun _ -> "00000000-0000-4000-8000-000000000000")
      (fun () -> QueryIdempotencyTokenAutoFill.request ctx input)
  in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
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
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/QueryIdempotencyTokenAutoFill")
          request.uri
      in
      let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
      ()
  | Error error -> failwith (QueryIdempotencyTokenAutoFill.error_to_string error)

let query_idempotency_token_auto_fill_is_set () =
  Eio.Switch.run ~name:"QueryIdempotencyTokenAutoFillIsSet" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.query_idempotency_token_auto_fill_input =
    { token = Some "00000000-0000-4000-8000-000000000000" }
  in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = QueryIdempotencyTokenAutoFill.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
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
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/QueryIdempotencyTokenAutoFill")
          request.uri
      in
      let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
      ()
  | Error error -> failwith (QueryIdempotencyTokenAutoFill.error_to_string error)

let query_idempotency_token_auto_fill_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#QueryIdempotencyTokenAutoFill",
    [
      ("QueryIdempotencyTokenAutoFill", `Quick, query_idempotency_token_auto_fill);
      ("QueryIdempotencyTokenAutoFillIsSet", `Quick, query_idempotency_token_auto_fill_is_set);
    ] )

let rest_xml_query_params_string_list_map () =
  Eio.Switch.run ~name:"RestXmlQueryParamsStringListMap" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.query_params_as_string_list_map_input =
    { foo = Some [ ("baz", [ "bar"; "qux" ]) ]; qux = Some "named" }
  in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = QueryParamsAsStringListMap.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
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
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/StringListMap")
          request.uri
      in
      let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
      ()
  | Error error -> failwith (QueryParamsAsStringListMap.error_to_string error)

let query_params_as_string_list_map_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#QueryParamsAsStringListMap",
    [ ("RestXmlQueryParamsStringListMap", `Quick, rest_xml_query_params_string_list_map) ] )

let rest_xml_query_precedence () =
  Eio.Switch.run ~name:"RestXmlQueryPrecedence" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.query_precedence_input =
    { baz = Some [ ("bar", "fromMap"); ("qux", "alsoFromMap") ]; foo = Some "named" }
  in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = QueryPrecedence.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
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
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/Precedence")
          request.uri
      in
      let () = check Alcotest_http.headers_testable "expected request headers" [] request.headers in
      ()
  | Error error -> failwith (QueryPrecedence.error_to_string error)

let query_precedence_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#QueryPrecedence",
    [ ("RestXmlQueryPrecedence", `Quick, rest_xml_query_precedence) ] )

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
  in
  Mock.mock_response
    ?body:
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
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = RecursiveShapes.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
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
                 </RecursiveShapesRequest>\n"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/RecursiveShapes")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (RecursiveShapes.error_to_string error)

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

let simple_scalar_properties () =
  Eio.Switch.run ~name:"SimpleScalarProperties" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.simple_scalar_properties_request =
    {
      double_value = Some 6.5;
      float_value = Some 5.5;
      long_value = Some (Smaws_Lib.CoreTypes.Int64.of_int 4);
      integer_value = Some 3;
      short_value = Some 2;
      byte_value = Some 1;
      false_boolean_value = Some false;
      true_boolean_value = Some true;
      string_value = Some "string";
      foo = Some "Foo";
    }
  in
  Mock.mock_response
    ?body:
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
                 </SimpleScalarPropertiesRequest>\n"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/SimpleScalarProperties")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("X-Foo", "Foo"); ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (SimpleScalarProperties.error_to_string error)

let simple_scalar_properties_with_escaped_character () =
  Eio.Switch.run ~name:"SimpleScalarPropertiesWithEscapedCharacter" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.simple_scalar_properties_request =
    {
      double_value = None;
      float_value = None;
      long_value = None;
      integer_value = None;
      short_value = None;
      byte_value = None;
      false_boolean_value = None;
      true_boolean_value = None;
      string_value = Some "<string>";
      foo = Some "Foo";
    }
  in
  Mock.mock_response
    ?body:
      (Some
         "<SimpleScalarPropertiesRequest>\n\
         \    <stringValue>&lt;string&gt;</stringValue>\n\
          </SimpleScalarPropertiesRequest>\n")
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
                "<SimpleScalarPropertiesRequest>\n\
                \    <stringValue>&lt;string&gt;</stringValue>\n\
                 </SimpleScalarPropertiesRequest>\n"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/SimpleScalarProperties")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("X-Foo", "Foo"); ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (SimpleScalarProperties.error_to_string error)

let simple_scalar_properties_with_white_space () =
  Eio.Switch.run ~name:"SimpleScalarPropertiesWithWhiteSpace" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.simple_scalar_properties_request =
    {
      double_value = None;
      float_value = None;
      long_value = None;
      integer_value = None;
      short_value = None;
      byte_value = None;
      false_boolean_value = None;
      true_boolean_value = None;
      string_value = Some "  string with white    space  ";
      foo = Some "Foo";
    }
  in
  Mock.mock_response
    ?body:
      (Some
         "<SimpleScalarPropertiesRequest>\n\
         \    <stringValue>  string with white    space  </stringValue>\n\
          </SimpleScalarPropertiesRequest>\n")
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
                "<SimpleScalarPropertiesRequest>\n\
                \    <stringValue>  string with white    space  </stringValue>\n\
                 </SimpleScalarPropertiesRequest>\n"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/SimpleScalarProperties")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("X-Foo", "Foo"); ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (SimpleScalarProperties.error_to_string error)

let simple_scalar_properties_pure_white_space () =
  Eio.Switch.run ~name:"SimpleScalarPropertiesPureWhiteSpace" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.simple_scalar_properties_request =
    {
      double_value = None;
      float_value = None;
      long_value = None;
      integer_value = None;
      short_value = None;
      byte_value = None;
      false_boolean_value = None;
      true_boolean_value = None;
      string_value = Some "   ";
      foo = Some "Foo";
    }
  in
  Mock.mock_response
    ?body:
      (Some
         "<SimpleScalarPropertiesRequest>\n\
         \    <stringValue>   </stringValue>\n\
          </SimpleScalarPropertiesRequest>\n")
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
                "<SimpleScalarPropertiesRequest>\n\
                \    <stringValue>   </stringValue>\n\
                 </SimpleScalarPropertiesRequest>\n"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/SimpleScalarProperties")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("X-Foo", "Foo"); ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (SimpleScalarProperties.error_to_string error)

let rest_xml_supports_na_n_float_inputs () =
  Eio.Switch.run ~name:"RestXmlSupportsNaNFloatInputs" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.simple_scalar_properties_request =
    {
      double_value = Some Float.nan;
      float_value = Some Float.nan;
      long_value = None;
      integer_value = None;
      short_value = None;
      byte_value = None;
      false_boolean_value = None;
      true_boolean_value = None;
      string_value = None;
      foo = None;
    }
  in
  Mock.mock_response
    ?body:
      (Some
         "<SimpleScalarPropertiesRequest>\n\
         \    <floatValue>NaN</floatValue>\n\
         \    <DoubleDribble>NaN</DoubleDribble>\n\
          </SimpleScalarPropertiesRequest>\n")
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
                "<SimpleScalarPropertiesRequest>\n\
                \    <floatValue>NaN</floatValue>\n\
                \    <DoubleDribble>NaN</DoubleDribble>\n\
                 </SimpleScalarPropertiesRequest>\n"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/SimpleScalarProperties")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (SimpleScalarProperties.error_to_string error)

let rest_xml_supports_infinity_float_inputs () =
  Eio.Switch.run ~name:"RestXmlSupportsInfinityFloatInputs" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.simple_scalar_properties_request =
    {
      double_value = Some Float.infinity;
      float_value = Some Float.infinity;
      long_value = None;
      integer_value = None;
      short_value = None;
      byte_value = None;
      false_boolean_value = None;
      true_boolean_value = None;
      string_value = None;
      foo = None;
    }
  in
  Mock.mock_response
    ?body:
      (Some
         "<SimpleScalarPropertiesRequest>\n\
         \    <floatValue>Infinity</floatValue>\n\
         \    <DoubleDribble>Infinity</DoubleDribble>\n\
          </SimpleScalarPropertiesRequest>\n")
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
                "<SimpleScalarPropertiesRequest>\n\
                \    <floatValue>Infinity</floatValue>\n\
                \    <DoubleDribble>Infinity</DoubleDribble>\n\
                 </SimpleScalarPropertiesRequest>\n"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/SimpleScalarProperties")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (SimpleScalarProperties.error_to_string error)

let rest_xml_supports_negative_infinity_float_inputs () =
  Eio.Switch.run ~name:"RestXmlSupportsNegativeInfinityFloatInputs" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.simple_scalar_properties_request =
    {
      double_value = Some Float.neg_infinity;
      float_value = Some Float.neg_infinity;
      long_value = None;
      integer_value = None;
      short_value = None;
      byte_value = None;
      false_boolean_value = None;
      true_boolean_value = None;
      string_value = None;
      foo = None;
    }
  in
  Mock.mock_response
    ?body:
      (Some
         "<SimpleScalarPropertiesRequest>\n\
         \    <floatValue>-Infinity</floatValue>\n\
         \    <DoubleDribble>-Infinity</DoubleDribble>\n\
          </SimpleScalarPropertiesRequest>\n")
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
                "<SimpleScalarPropertiesRequest>\n\
                \    <floatValue>-Infinity</floatValue>\n\
                \    <DoubleDribble>-Infinity</DoubleDribble>\n\
                 </SimpleScalarPropertiesRequest>\n"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/SimpleScalarProperties")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (SimpleScalarProperties.error_to_string error)

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
    ~headers:[ ("X-Foo", "Foo"); ("Content-Type", "application/xml") ]
    ();
  let response =
    SimpleScalarProperties.request ctx
      {
        double_value = None;
        float_value = None;
        long_value = None;
        integer_value = None;
        short_value = None;
        byte_value = None;
        false_boolean_value = None;
        true_boolean_value = None;
        string_value = None;
        foo = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           double_value = Some 6.5;
           float_value = Some 5.5;
           long_value = Some (Smaws_Lib.CoreTypes.Int64.of_int 4);
           integer_value = Some 3;
           short_value = Some 2;
           byte_value = Some 1;
           false_boolean_value = Some false;
           true_boolean_value = Some true;
           string_value = Some "string";
           foo = Some "Foo";
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
    ~headers:[ ("X-Foo", "Foo"); ("Content-Type", "application/xml") ]
    ();
  let response =
    SimpleScalarProperties.request ctx
      {
        double_value = None;
        float_value = None;
        long_value = None;
        integer_value = None;
        short_value = None;
        byte_value = None;
        false_boolean_value = None;
        true_boolean_value = None;
        string_value = None;
        foo = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           double_value = None;
           float_value = None;
           long_value = None;
           integer_value = None;
           short_value = None;
           byte_value = None;
           false_boolean_value = None;
           true_boolean_value = None;
           string_value = Some "<string>";
           foo = Some "Foo";
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
    ~headers:[ ("X-Foo", "Foo"); ("Content-Type", "application/xml") ]
    ();
  let response =
    SimpleScalarProperties.request ctx
      {
        double_value = None;
        float_value = None;
        long_value = None;
        integer_value = None;
        short_value = None;
        byte_value = None;
        false_boolean_value = None;
        true_boolean_value = None;
        string_value = None;
        foo = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           double_value = None;
           float_value = None;
           long_value = None;
           integer_value = None;
           short_value = None;
           byte_value = None;
           false_boolean_value = None;
           true_boolean_value = None;
           string_value = Some "string";
           foo = Some "Foo";
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
    ~headers:[ ("X-Foo", "Foo"); ("Content-Type", "application/xml") ]
    ();
  let response =
    SimpleScalarProperties.request ctx
      {
        double_value = None;
        float_value = None;
        long_value = None;
        integer_value = None;
        short_value = None;
        byte_value = None;
        false_boolean_value = None;
        true_boolean_value = None;
        string_value = None;
        foo = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           double_value = None;
           float_value = None;
           long_value = None;
           integer_value = None;
           short_value = None;
           byte_value = None;
           false_boolean_value = None;
           true_boolean_value = None;
           string_value = Some " string with white    space ";
           foo = Some "Foo";
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
    ~headers:[ ("X-Foo", "Foo"); ("Content-Type", "application/xml") ]
    ();
  let response =
    SimpleScalarProperties.request ctx
      {
        double_value = None;
        float_value = None;
        long_value = None;
        integer_value = None;
        short_value = None;
        byte_value = None;
        false_boolean_value = None;
        true_boolean_value = None;
        string_value = None;
        foo = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           double_value = None;
           float_value = None;
           long_value = None;
           integer_value = None;
           short_value = None;
           byte_value = None;
           false_boolean_value = None;
           true_boolean_value = None;
           string_value = Some "  ";
           foo = Some "Foo";
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
        double_value = None;
        float_value = None;
        long_value = None;
        integer_value = None;
        short_value = None;
        byte_value = None;
        false_boolean_value = None;
        true_boolean_value = None;
        string_value = None;
        foo = None;
      }
  in
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
           string_value = None;
           foo = None;
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
        double_value = None;
        float_value = None;
        long_value = None;
        integer_value = None;
        short_value = None;
        byte_value = None;
        false_boolean_value = None;
        true_boolean_value = None;
        string_value = None;
        foo = None;
      }
  in
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
           string_value = None;
           foo = None;
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
        double_value = None;
        float_value = None;
        long_value = None;
        integer_value = None;
        short_value = None;
        byte_value = None;
        false_boolean_value = None;
        true_boolean_value = None;
        string_value = None;
        foo = None;
      }
  in
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
           string_value = None;
           foo = None;
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
      target_date_time = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.));
      target_http_date = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.));
      target_epoch_seconds =
        Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.));
      default_format = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.));
      member_date_time = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.));
      member_http_date = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.));
      member_epoch_seconds =
        Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.));
    }
  in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = TimestampFormatHeaders.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some (Smaws_Lib.Json.of_string ""))
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
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/TimestampFormatHeaders")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [
            ("X-targetDateTime", "2019-12-16T23:48:18Z");
            ("X-targetHttpDate", "Mon, 16 Dec 2019 23:48:18 GMT");
            ("X-targetEpochSeconds", "1576540098");
            ("X-defaultFormat", "Mon, 16 Dec 2019 23:48:18 GMT");
            ("X-memberDateTime", "2019-12-16T23:48:18Z");
            ("X-memberHttpDate", "Mon, 16 Dec 2019 23:48:18 GMT");
            ("X-memberEpochSeconds", "1576540098");
          ]
          request.headers
      in
      ()
  | Error error -> failwith (TimestampFormatHeaders.error_to_string error)

let timestamp_format_headers () =
  Eio.Switch.run ~name:"TimestampFormatHeaders" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  Mock.mock_response ?body:(Some "") ~status:200
    ~headers:
      [
        ("X-targetDateTime", "2019-12-16T23:48:18Z");
        ("X-targetHttpDate", "Mon, 16 Dec 2019 23:48:18 GMT");
        ("X-targetEpochSeconds", "1576540098");
        ("X-defaultFormat", "Mon, 16 Dec 2019 23:48:18 GMT");
        ("X-memberDateTime", "2019-12-16T23:48:18Z");
        ("X-memberHttpDate", "Mon, 16 Dec 2019 23:48:18 GMT");
        ("X-memberEpochSeconds", "1576540098");
      ]
    ();
  let response =
    TimestampFormatHeaders.request ctx
      {
        target_date_time = None;
        target_http_date = None;
        target_epoch_seconds = None;
        default_format = None;
        member_date_time = None;
        member_http_date = None;
        member_epoch_seconds = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           target_date_time =
             Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.));
           target_http_date =
             Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.));
           target_epoch_seconds =
             Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.));
           default_format = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.));
           member_date_time =
             Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.));
           member_http_date =
             Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1576540098.));
           member_epoch_seconds =
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
  let input : Types.xml_attributes_request = { attr = Some "test"; foo = Some "hi" } in
  Mock.mock_response
    ?body:
      (Some "<XmlAttributesRequest test=\"test\">\n    <foo>hi</foo>\n</XmlAttributesRequest>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = XmlAttributes.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "<XmlAttributesRequest test=\"test\">\n    <foo>hi</foo>\n</XmlAttributesRequest>\n"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/XmlAttributes")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (XmlAttributes.error_to_string error)

let xml_attributes_with_escaping () =
  Eio.Switch.run ~name:"XmlAttributesWithEscaping" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_attributes_request = { attr = Some "<test&mock>"; foo = Some "hi" } in
  Mock.mock_response
    ?body:
      (Some
         "<XmlAttributesRequest test=\"&lt;test&amp;mock&gt;\">\n\
         \    <foo>hi</foo>\n\
          </XmlAttributesRequest>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = XmlAttributes.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "<XmlAttributesRequest test=\"&lt;test&amp;mock&gt;\">\n\
                \    <foo>hi</foo>\n\
                 </XmlAttributesRequest>\n"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/XmlAttributes")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (XmlAttributes.error_to_string error)

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
  let response = XmlAttributes.request ctx { attr = None; foo = None } in
  match response with
  | Ok result ->
      let expected = ({ attr = Some "test"; foo = Some "hi" } : Types.xml_attributes_response) in
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
    { payload = Some { baz = Some "Baz"; attr = Some "attributeValue"; foo = Some "Foo" } }
  in
  Mock.mock_response
    ?body:
      (Some
         "<XmlAttributesInMiddlePayloadRequest test=\"attributeValue\">\n\
         \    <foo>Foo</foo>\n\
         \    <baz>Baz</baz>\n\
          </XmlAttributesInMiddlePayloadRequest>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = XmlAttributesInMiddle.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "<XmlAttributesInMiddlePayloadRequest test=\"attributeValue\">\n\
                \    <foo>Foo</foo>\n\
                \    <baz>Baz</baz>\n\
                 </XmlAttributesInMiddlePayloadRequest>\n"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/XmlAttributesInMiddle")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (XmlAttributesInMiddle.error_to_string error)

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
        ({ payload = Some { baz = Some "Baz"; attr = Some "attributeValue"; foo = Some "Foo" } }
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
    { payload = Some { attr = Some "test"; foo = Some "hi" } }
  in
  Mock.mock_response
    ?body:
      (Some
         "<XmlAttributesPayloadRequest test=\"test\">\n\
         \    <foo>hi</foo>\n\
          </XmlAttributesPayloadRequest>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = XmlAttributesOnPayload.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "<XmlAttributesPayloadRequest test=\"test\">\n\
                \    <foo>hi</foo>\n\
                 </XmlAttributesPayloadRequest>\n"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/XmlAttributesOnPayload")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (XmlAttributesOnPayload.error_to_string error)

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
        ({ payload = Some { attr = Some "test"; foo = Some "hi" } }
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
  Mock.mock_response
    ?body:(Some "<XmlBlobsRequest>\n    <data>dmFsdWU=</data>\n</XmlBlobsRequest>\n") ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = XmlBlobs.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "<XmlBlobsRequest>\n    <data>dmFsdWU=</data>\n</XmlBlobsRequest>\n"))
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
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/XmlBlobs")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (XmlBlobs.error_to_string error)

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

let xml_empty_blobs_test_suite : unit Alcotest.test = ("aws.protocoltests.restxml#XmlEmptyBlobs", [])

let xml_empty_lists () =
  Eio.Switch.run ~name:"XmlEmptyLists" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_empty_lists_request =
    {
      flattened_structure_list = None;
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
  in
  Mock.mock_response
    ?body:
      (Some
         "<XmlEmptyListsRequest>\n\
         \        <stringList></stringList>\n\
         \        <stringSet></stringSet>\n\
          </XmlEmptyListsRequest>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = XmlEmptyLists.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "<XmlEmptyListsRequest>\n\
                \        <stringList></stringList>\n\
                \        <stringSet></stringSet>\n\
                 </XmlEmptyListsRequest>\n"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/XmlEmptyLists")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (XmlEmptyLists.error_to_string error)

let xml_empty_lists_test_suite : unit Alcotest.test =
  ("aws.protocoltests.restxml#XmlEmptyLists", [ ("XmlEmptyLists", `Quick, xml_empty_lists) ])

let xml_empty_maps () =
  Eio.Switch.run ~name:"XmlEmptyMaps" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_empty_maps_request = { my_map = Some [] } in
  Mock.mock_response
    ?body:(Some "<XmlEmptyMapsRequest>\n    <myMap></myMap>\n</XmlEmptyMapsRequest>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = XmlEmptyMaps.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "<XmlEmptyMapsRequest>\n    <myMap></myMap>\n</XmlEmptyMapsRequest>\n"))
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
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/XmlEmptyMaps")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (XmlEmptyMaps.error_to_string error)

let xml_empty_maps_test_suite : unit Alcotest.test =
  ("aws.protocoltests.restxml#XmlEmptyMaps", [ ("XmlEmptyMaps", `Quick, xml_empty_maps) ])

let xml_empty_strings () =
  Eio.Switch.run ~name:"XmlEmptyStrings" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_empty_strings_request = { empty_string = Some "" } in
  Mock.mock_response
    ?body:
      (Some "<XmlEmptyStringsRequest>\n    <emptyString></emptyString>\n</XmlEmptyStringsRequest>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = XmlEmptyStrings.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "<XmlEmptyStringsRequest>\n\
                \    <emptyString></emptyString>\n\
                 </XmlEmptyStringsRequest>\n"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/XmlEmptyStrings")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (XmlEmptyStrings.error_to_string error)

let xml_empty_strings_test_suite : unit Alcotest.test =
  ("aws.protocoltests.restxml#XmlEmptyStrings", [ ("XmlEmptyStrings", `Quick, xml_empty_strings) ])

let xml_enums () =
  Eio.Switch.run ~name:"XmlEnums" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_enums_request =
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
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = XmlEnums.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
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
                 </XmlEnumsRequest>\n"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/XmlEnums")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (XmlEnums.error_to_string error)

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
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = XmlIntEnums.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
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
                 </XmlIntEnumsRequest>\n"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/XmlIntEnums")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (XmlIntEnums.error_to_string error)

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
      flattened_structure_list =
        Some [ { b = Some "6"; a = Some "5" }; { b = Some "8"; a = Some "7" } ];
      structure_list = Some [ { b = Some "2"; a = Some "1" }; { b = Some "4"; a = Some "3" } ];
      flattened_list_with_namespace = None;
      flattened_list_with_member_namespace = None;
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
  in
  Mock.mock_response
    ?body:
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
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = XmlLists.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
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
                 </XmlListsRequest>\n"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/XmlLists")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (XmlLists.error_to_string error)

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
        flattened_structure_list = None;
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
        string_set = None;
        string_list = None;
      }
  in
  match response with
  | Ok result ->
      let expected =
        ({
           flattened_structure_list =
             Some [ { b = Some "6"; a = Some "5" }; { b = Some "8"; a = Some "7" } ];
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
          : Types.xml_lists_response)
      in
      check
        (Alcotest_http.testable_nan_aware Types.pp_xml_lists_response Types.equal_xml_lists_response)
        "expected output" expected result
  | Error error -> failwith (XmlLists.error_to_string error)

let xml_lists_test_suite : unit Alcotest.test =
  ( "aws.protocoltests.restxml#XmlLists",
    [ ("XmlLists", `Quick, xml_lists); ("XmlLists", `Quick, xml_lists) ] )

let rest_xml_xml_map_with_xml_namespace () =
  Eio.Switch.run ~name:"RestXmlXmlMapWithXmlNamespace" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_map_with_xml_namespace_request =
    { my_map = Some [ ("a", "A"); ("b", "B") ] }
  in
  Mock.mock_response
    ?body:
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
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = XmlMapWithXmlNamespace.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
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
                 </XmlMapWithXmlNamespaceRequest>"))
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
        check Alcotest_http.uri_testable "expected request uri"
          (Uri.of_string "/XmlMapWithXmlNamespace")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (XmlMapWithXmlNamespace.error_to_string error)

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

let xml_maps () =
  Eio.Switch.run ~name:"XmlMaps" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_maps_request =
    { my_map = Some [ ("foo", { hi = Some "there" }); ("baz", { hi = Some "bye" }) ] }
  in
  Mock.mock_response
    ?body:
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
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = XmlMaps.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
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
                 </XmlMapsRequest>\n"))
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
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/XmlMaps")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (XmlMaps.error_to_string error)

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
  Mock.mock_response
    ?body:
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
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = XmlMapsXmlName.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
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
                 </XmlMapsXmlNameRequest>\n"))
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
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/XmlMapsXmlName")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (XmlMapsXmlName.error_to_string error)

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

let xml_namespaces () =
  Eio.Switch.run ~name:"XmlNamespaces" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_namespaces_request =
    { nested = Some { values = Some [ "Bar"; "Baz" ]; foo = Some "Foo" } }
  in
  Mock.mock_response
    ?body:
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
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = XmlNamespaces.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "<XmlNamespacesRequest xmlns=\"http://foo.com\">\n\
                \    <nested>\n\
                \        <foo xmlns:baz=\"http://baz.com\">Foo</foo>\n\
                \        <values xmlns=\"http://qux.com\">\n\
                \            <member xmlns=\"http://bux.com\">Bar</member>\n\
                \            <member xmlns=\"http://bux.com\">Baz</member>\n\
                \        </values>\n\
                \    </nested>\n\
                 </XmlNamespacesRequest>\n"))
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
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/XmlNamespaces")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (XmlNamespaces.error_to_string error)

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
        ({ nested = Some { values = Some [ "Bar"; "Baz" ]; foo = Some "Foo" } }
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
      http_date_on_target = None;
      http_date = None;
      epoch_seconds_on_target = None;
      epoch_seconds = None;
      date_time_on_target = None;
      date_time = None;
      normal = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1398796238.));
    }
  in
  Mock.mock_response
    ?body:
      (Some
         "<XmlTimestampsRequest>\n\
         \    <normal>2014-04-29T18:30:38Z</normal>\n\
          </XmlTimestampsRequest>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = XmlTimestamps.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "<XmlTimestampsRequest>\n\
                \    <normal>2014-04-29T18:30:38Z</normal>\n\
                 </XmlTimestampsRequest>\n"))
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
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/XmlTimestamps")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (XmlTimestamps.error_to_string error)

let xml_timestamps_with_date_time_format () =
  Eio.Switch.run ~name:"XmlTimestampsWithDateTimeFormat" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_timestamps_request =
    {
      http_date_on_target = None;
      http_date = None;
      epoch_seconds_on_target = None;
      epoch_seconds = None;
      date_time_on_target = None;
      date_time = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1398796238.));
      normal = None;
    }
  in
  Mock.mock_response
    ?body:
      (Some
         "<XmlTimestampsRequest>\n\
         \    <dateTime>2014-04-29T18:30:38Z</dateTime>\n\
          </XmlTimestampsRequest>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = XmlTimestamps.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "<XmlTimestampsRequest>\n\
                \    <dateTime>2014-04-29T18:30:38Z</dateTime>\n\
                 </XmlTimestampsRequest>\n"))
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
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/XmlTimestamps")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (XmlTimestamps.error_to_string error)

let xml_timestamps_with_date_time_on_target_format () =
  Eio.Switch.run ~name:"XmlTimestampsWithDateTimeOnTargetFormat" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_timestamps_request =
    {
      http_date_on_target = None;
      http_date = None;
      epoch_seconds_on_target = None;
      epoch_seconds = None;
      date_time_on_target = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1398796238.));
      date_time = None;
      normal = None;
    }
  in
  Mock.mock_response
    ?body:
      (Some
         "<XmlTimestampsRequest>\n\
         \    <dateTimeOnTarget>2014-04-29T18:30:38Z</dateTimeOnTarget>\n\
          </XmlTimestampsRequest>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = XmlTimestamps.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "<XmlTimestampsRequest>\n\
                \    <dateTimeOnTarget>2014-04-29T18:30:38Z</dateTimeOnTarget>\n\
                 </XmlTimestampsRequest>\n"))
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
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/XmlTimestamps")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (XmlTimestamps.error_to_string error)

let xml_timestamps_with_epoch_seconds_format () =
  Eio.Switch.run ~name:"XmlTimestampsWithEpochSecondsFormat" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_timestamps_request =
    {
      http_date_on_target = None;
      http_date = None;
      epoch_seconds_on_target = None;
      epoch_seconds = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1398796238.));
      date_time_on_target = None;
      date_time = None;
      normal = None;
    }
  in
  Mock.mock_response
    ?body:
      (Some
         "<XmlTimestampsRequest>\n\
         \    <epochSeconds>1398796238</epochSeconds>\n\
          </XmlTimestampsRequest>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = XmlTimestamps.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "<XmlTimestampsRequest>\n\
                \    <epochSeconds>1398796238</epochSeconds>\n\
                 </XmlTimestampsRequest>\n"))
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
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/XmlTimestamps")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (XmlTimestamps.error_to_string error)

let xml_timestamps_with_epoch_seconds_on_target_format () =
  Eio.Switch.run ~name:"XmlTimestampsWithEpochSecondsOnTargetFormat" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_timestamps_request =
    {
      http_date_on_target = None;
      http_date = None;
      epoch_seconds_on_target =
        Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1398796238.));
      epoch_seconds = None;
      date_time_on_target = None;
      date_time = None;
      normal = None;
    }
  in
  Mock.mock_response
    ?body:
      (Some
         "<XmlTimestampsRequest>\n\
         \    <epochSecondsOnTarget>1398796238</epochSecondsOnTarget>\n\
          </XmlTimestampsRequest>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = XmlTimestamps.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "<XmlTimestampsRequest>\n\
                \    <epochSecondsOnTarget>1398796238</epochSecondsOnTarget>\n\
                 </XmlTimestampsRequest>\n"))
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
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/XmlTimestamps")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (XmlTimestamps.error_to_string error)

let xml_timestamps_with_http_date_format () =
  Eio.Switch.run ~name:"XmlTimestampsWithHttpDateFormat" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_timestamps_request =
    {
      http_date_on_target = None;
      http_date = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1398796238.));
      epoch_seconds_on_target = None;
      epoch_seconds = None;
      date_time_on_target = None;
      date_time = None;
      normal = None;
    }
  in
  Mock.mock_response
    ?body:
      (Some
         "<XmlTimestampsRequest>\n\
         \    <httpDate>Tue, 29 Apr 2014 18:30:38 GMT</httpDate>\n\
          </XmlTimestampsRequest>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = XmlTimestamps.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "<XmlTimestampsRequest>\n\
                \    <httpDate>Tue, 29 Apr 2014 18:30:38 GMT</httpDate>\n\
                 </XmlTimestampsRequest>\n"))
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
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/XmlTimestamps")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (XmlTimestamps.error_to_string error)

let xml_timestamps_with_http_date_on_target_format () =
  Eio.Switch.run ~name:"XmlTimestampsWithHttpDateOnTargetFormat" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_timestamps_request =
    {
      http_date_on_target = Some (Option.get (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1398796238.));
      http_date = None;
      epoch_seconds_on_target = None;
      epoch_seconds = None;
      date_time_on_target = None;
      date_time = None;
      normal = None;
    }
  in
  Mock.mock_response
    ?body:
      (Some
         "<XmlTimestampsRequest>\n\
         \    <httpDateOnTarget>Tue, 29 Apr 2014 18:30:38 GMT</httpDateOnTarget>\n\
          </XmlTimestampsRequest>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = XmlTimestamps.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "<XmlTimestampsRequest>\n\
                \    <httpDateOnTarget>Tue, 29 Apr 2014 18:30:38 GMT</httpDateOnTarget>\n\
                 </XmlTimestampsRequest>\n"))
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
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/XmlTimestamps")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (XmlTimestamps.error_to_string error)

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
        http_date_on_target = None;
        http_date = None;
        epoch_seconds_on_target = None;
        epoch_seconds = None;
        date_time_on_target = None;
        date_time = None;
        normal = None;
      }
  in
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
        http_date_on_target = None;
        http_date = None;
        epoch_seconds_on_target = None;
        epoch_seconds = None;
        date_time_on_target = None;
        date_time = None;
        normal = None;
      }
  in
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
        http_date_on_target = None;
        http_date = None;
        epoch_seconds_on_target = None;
        epoch_seconds = None;
        date_time_on_target = None;
        date_time = None;
        normal = None;
      }
  in
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
        http_date_on_target = None;
        http_date = None;
        epoch_seconds_on_target = None;
        epoch_seconds = None;
        date_time_on_target = None;
        date_time = None;
        normal = None;
      }
  in
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
        http_date_on_target = None;
        http_date = None;
        epoch_seconds_on_target = None;
        epoch_seconds = None;
        date_time_on_target = None;
        date_time = None;
        normal = None;
      }
  in
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
        http_date_on_target = None;
        http_date = None;
        epoch_seconds_on_target = None;
        epoch_seconds = None;
        date_time_on_target = None;
        date_time = None;
        normal = None;
      }
  in
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
        http_date_on_target = None;
        http_date = None;
        epoch_seconds_on_target = None;
        epoch_seconds = None;
        date_time_on_target = None;
        date_time = None;
        normal = None;
      }
  in
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
               double_value = Some 6.5;
               float_value = Some 5.5;
               long_value = Some (Smaws_Lib.CoreTypes.Int64.of_int 4);
               integer_value = Some 3;
               short_value = Some 2;
               byte_value = Some 1;
               boolean_value = Some true;
               string_value = Some "string";
             });
    }
  in
  Mock.mock_response
    ?body:
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
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = XmlUnions.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
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
                 </XmlUnionsRequest>\n"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/XmlUnions")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (XmlUnions.error_to_string error)

let xml_unions_with_string_member () =
  Eio.Switch.run ~name:"XmlUnionsWithStringMember" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_unions_request = { union_value = Some (StringValue "some string") } in
  Mock.mock_response
    ?body:
      (Some
         "<XmlUnionsRequest>\n\
         \   <unionValue>\n\
         \      <stringValue>some string</stringValue>\n\
         \   </unionValue>\n\
          </XmlUnionsRequest>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = XmlUnions.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "<XmlUnionsRequest>\n\
                \   <unionValue>\n\
                \      <stringValue>some string</stringValue>\n\
                \   </unionValue>\n\
                 </XmlUnionsRequest>\n"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/XmlUnions")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (XmlUnions.error_to_string error)

let xml_unions_with_boolean_member () =
  Eio.Switch.run ~name:"XmlUnionsWithBooleanMember" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_unions_request = { union_value = Some (BooleanValue true) } in
  Mock.mock_response
    ?body:
      (Some
         "<XmlUnionsRequest>\n\
         \   <unionValue>\n\
         \      <booleanValue>true</booleanValue>\n\
         \   </unionValue>\n\
          </XmlUnionsRequest>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = XmlUnions.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "<XmlUnionsRequest>\n\
                \   <unionValue>\n\
                \      <booleanValue>true</booleanValue>\n\
                \   </unionValue>\n\
                 </XmlUnionsRequest>\n"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/XmlUnions")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (XmlUnions.error_to_string error)

let xml_unions_with_union_member () =
  Eio.Switch.run ~name:"XmlUnionsWithUnionMember" @@ fun sw ->
  let module Mock = (val Http_mock.create_http_mock ()) in
  let http_type = ((module Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
  let config = Config.dummy in
  let ctx = Smaws_Lib.Context.make ~config ~http_type () in
  let input : Types.xml_unions_request = { union_value = Some (UnionValue (BooleanValue true)) } in
  Mock.mock_response
    ?body:
      (Some
         "<XmlUnionsRequest>\n\
         \   <unionValue>\n\
         \      <unionValue>\n\
         \         <booleanValue>true</booleanValue>\n\
         \      </unionValue>\n\
         \   </unionValue>\n\
          </XmlUnionsRequest>\n")
    ~status:200
    ~headers:[ ("Content-Type", "application/json") ]
    ();
  let response = XmlUnions.request ctx input in
  match response with
  | Ok resp ->
      let request = Mock.last_request () in
      let () =
        check Alcotest_http.input_body_json_testable "expected request body value"
          (Some
             (Smaws_Lib.Json.of_string
                "<XmlUnionsRequest>\n\
                \   <unionValue>\n\
                \      <unionValue>\n\
                \         <booleanValue>true</booleanValue>\n\
                \      </unionValue>\n\
                \   </unionValue>\n\
                 </XmlUnionsRequest>\n"))
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)
      in
      let () = check Alcotest_http.method_testable "expected request method" `PUT request.method_ in
      let () =
        check Alcotest_http.uri_testable "expected request uri" (Uri.of_string "/XmlUnions")
          request.uri
      in
      let () =
        check Alcotest_http.headers_testable "expected request headers"
          [ ("Content-Type", "application/xml") ]
          request.headers
      in
      ()
  | Error error -> failwith (XmlUnions.error_to_string error)

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
                    double_value = Some 6.5;
                    float_value = Some 5.5;
                    long_value = Some (Smaws_Lib.CoreTypes.Int64.of_int 4);
                    integer_value = Some 3;
                    short_value = Some 2;
                    byte_value = Some 1;
                    boolean_value = Some true;
                    string_value = Some "string";
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

let () =
  Eio_main.run @@ fun env ->
  Alcotest.run "aws.protocoltests.restxml"
    [
      all_query_string_types_test_suite;
      body_with_xml_name_test_suite;
      constant_and_variable_query_string_test_suite;
      constant_query_string_test_suite;
      content_type_parameters_test_suite;
      datetime_offsets_test_suite;
      empty_input_and_empty_output_test_suite;
      endpoint_operation_test_suite;
      endpoint_with_host_label_header_operation_test_suite;
      endpoint_with_host_label_operation_test_suite;
      flattened_xml_map_test_suite;
      flattened_xml_map_with_xml_name_test_suite;
      flattened_xml_map_with_xml_namespace_test_suite;
      fractional_seconds_test_suite;
      greeting_with_errors_test_suite;
      http_empty_prefix_headers_test_suite;
      http_enum_payload_test_suite;
      http_payload_traits_test_suite;
      http_payload_traits_with_media_type_test_suite;
      http_payload_with_member_xml_name_test_suite;
      http_payload_with_structure_test_suite;
      http_payload_with_union_test_suite;
      http_payload_with_xml_name_test_suite;
      http_payload_with_xml_namespace_test_suite;
      http_payload_with_xml_namespace_and_prefix_test_suite;
      http_prefix_headers_test_suite;
      http_request_with_float_labels_test_suite;
      http_request_with_greedy_label_in_path_test_suite;
      http_request_with_labels_test_suite;
      http_request_with_labels_and_timestamp_format_test_suite;
      http_response_code_test_suite;
      http_string_payload_test_suite;
      ignore_query_params_in_response_test_suite;
      input_and_output_with_headers_test_suite;
      nested_xml_maps_test_suite;
      nested_xml_map_with_xml_name_test_suite;
      no_input_and_no_output_test_suite;
      no_input_and_output_test_suite;
      null_and_empty_headers_client_test_suite;
      null_and_empty_headers_server_test_suite;
      omits_null_serializes_empty_string_test_suite;
      put_with_content_encoding_test_suite;
      query_idempotency_token_auto_fill_test_suite;
      query_params_as_string_list_map_test_suite;
      query_precedence_test_suite;
      recursive_shapes_test_suite;
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
      xml_map_with_xml_namespace_test_suite;
      xml_maps_test_suite;
      xml_maps_xml_name_test_suite;
      xml_namespaces_test_suite;
      xml_timestamps_test_suite;
      xml_unions_test_suite;
    ]
