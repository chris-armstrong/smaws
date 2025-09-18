open Alcotest
open Smaws_Test_Support_Lib
open Json
let content_type_parameters_test_suite =
  ("aws.protocoltests.json#ContentTypeParameters", [])
let datetime_offsets_test_suite =
  ("aws.protocoltests.json#DatetimeOffsets", [])
let sends_requests_to_slash () =
  (Eio.Switch.run ~name:"sends_requests_to_slash") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Smaws_Lib.Smithy_api.Types.unit_) = () in
         Mock.mock_response ?body:None ~status:200
           ~headers:[("Content-Type", "application/json")] ();
         (let response = EmptyOperation.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () = () in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.EmptyOperation");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error -> failwith (EmptyOperation.error_to_string error)))
let includes_x_amz_target_and_content_type () =
  (Eio.Switch.run ~name:"includes_x_amz_target_and_content_type") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Smaws_Lib.Smithy_api.Types.unit_) = () in
         Mock.mock_response ?body:None ~status:200
           ~headers:[("Content-Type", "application/json")] ();
         (let response = EmptyOperation.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () = () in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.EmptyOperation");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error -> failwith (EmptyOperation.error_to_string error)))
let json_1_1_client_sends_empty_payload_for_no_input_shape () =
  (Eio.Switch.run
     ~name:"json_1_1_client_sends_empty_payload_for_no_input_shape")
    @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Smaws_Lib.Smithy_api.Types.unit_) = () in
         Mock.mock_response ?body:(Some "{}") ~status:200
           ~headers:[("Content-Type", "application/json")] ();
         (let response = EmptyOperation.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some (Smaws_Lib.Json.of_string "{}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.EmptyOperation");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error -> failwith (EmptyOperation.error_to_string error)))
let empty_operation_test_suite =
  ("aws.protocoltests.json#EmptyOperation",
    [("sends_requests_to_slash", `Quick, sends_requests_to_slash);
    ("includes_x_amz_target_and_content_type", `Quick,
      includes_x_amz_target_and_content_type);
    ("json_1_1_client_sends_empty_payload_for_no_input_shape", `Quick,
      json_1_1_client_sends_empty_payload_for_no_input_shape)])
let aws_json11_endpoint_trait () =
  (Eio.Switch.run ~name:"AwsJson11EndpointTrait") @@
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
         let (input : Smaws_Lib.Smithy_api.Types.unit_) = () in
         Mock.mock_response ?body:(Some "{}") ~status:200
           ~headers:[("Content-Type", "application/json")] ();
         (let response = EndpointOperation.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some (Smaws_Lib.Json.of_string "{}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.EndpointOperation");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error -> failwith (EndpointOperation.error_to_string error)))
let endpoint_operation_test_suite =
  ("aws.protocoltests.json#EndpointOperation",
    [("AwsJson11EndpointTrait", `Quick, aws_json11_endpoint_trait)])
let aws_json11_endpoint_trait_with_host_label () =
  (Eio.Switch.run ~name:"AwsJson11EndpointTraitWithHostLabel") @@
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
         let (input : Types.host_label_input) = { label = "bar" } in
         Mock.mock_response ?body:(Some "{\"label\": \"bar\"}") ~status:200
           ~headers:[("Content-Type", "application/json")] ();
         (let response = EndpointWithHostLabelOperation.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some (Smaws_Lib.Json.of_string "{\"label\": \"bar\"}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target",
                     "JsonProtocol.EndpointWithHostLabelOperation");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith (EndpointWithHostLabelOperation.error_to_string error)))
let endpoint_with_host_label_operation_test_suite =
  ("aws.protocoltests.json#EndpointWithHostLabelOperation",
    [("AwsJson11EndpointTraitWithHostLabel", `Quick,
       aws_json11_endpoint_trait_with_host_label)])
let fractional_seconds_test_suite =
  ("aws.protocoltests.json#FractionalSeconds", [])
let greeting_with_errors_test_suite =
  ("aws.protocoltests.json#GreetingWithErrors", [])
let aws_json11_host_with_path () =
  (Eio.Switch.run ~name:"AwsJson11HostWithPath") @@
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
         let (input : Smaws_Lib.Smithy_api.Types.unit_) = () in
         Mock.mock_response ?body:(Some "{}") ~status:200
           ~headers:[("Content-Type", "application/json")] ();
         (let response = HostWithPathOperation.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some (Smaws_Lib.Json.of_string "{}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/custom/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.HostWithPathOperation");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith (HostWithPathOperation.error_to_string error)))
let host_with_path_operation_test_suite =
  ("aws.protocoltests.json#HostWithPathOperation",
    [("AwsJson11HostWithPath", `Quick, aws_json11_host_with_path)])
let aws_json11_enums () =
  (Eio.Switch.run ~name:"AwsJson11Enums") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.json_enums_input_output) =
           {
             foo_enum_map = (Some [("hi", FOO); ("zero", ZERO)]);
             foo_enum_set = (Some [FOO; ZERO]);
             foo_enum_list = (Some [FOO; ZERO]);
             foo_enum3 = (Some ONE);
             foo_enum2 = (Some ZERO);
             foo_enum1 = (Some FOO)
           } in
         Mock.mock_response
           ?body:(Some
                    "{\n    \"fooEnum1\": \"Foo\",\n    \"fooEnum2\": \"0\",\n    \"fooEnum3\": \"1\",\n    \"fooEnumList\": [\n        \"Foo\",\n        \"0\"\n    ],\n    \"fooEnumSet\": [\n        \"Foo\",\n        \"0\"\n    ],\n    \"fooEnumMap\": {\n        \"hi\": \"Foo\",\n        \"zero\": \"0\"\n    }\n}")
           ~status:200 ~headers:[("Content-Type", "application/json")] ();
         (let response = JsonEnums.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some
                     (Smaws_Lib.Json.of_string
                        "{\n    \"fooEnum1\": \"Foo\",\n    \"fooEnum2\": \"0\",\n    \"fooEnum3\": \"1\",\n    \"fooEnumList\": [\n        \"Foo\",\n        \"0\"\n    ],\n    \"fooEnumSet\": [\n        \"Foo\",\n        \"0\"\n    ],\n    \"fooEnumMap\": {\n        \"hi\": \"Foo\",\n        \"zero\": \"0\"\n    }\n}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.JsonEnums");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error -> failwith (JsonEnums.error_to_string error)))
let json_enums_test_suite =
  ("aws.protocoltests.json#JsonEnums",
    [("AwsJson11Enums", `Quick, aws_json11_enums)])
let aws_json11_int_enums () =
  (Eio.Switch.run ~name:"AwsJson11IntEnums") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.json_int_enums_input_output) =
           {
             int_enum_map = (Some [("a", A); ("b", B)]);
             int_enum_set = (Some [A; B]);
             int_enum_list = (Some [A; B]);
             int_enum3 = (Some C);
             int_enum2 = (Some B);
             int_enum1 = (Some A)
           } in
         Mock.mock_response
           ?body:(Some
                    "{\n    \"intEnum1\": 1,\n    \"intEnum2\": 2,\n    \"intEnum3\": 3,\n    \"intEnumList\": [\n        1,\n        2\n    ],\n    \"intEnumSet\": [\n        1,\n        2\n    ],\n    \"intEnumMap\": {\n        \"a\": 1,\n        \"b\": 2\n    }\n}")
           ~status:200 ~headers:[("Content-Type", "application/json")] ();
         (let response = JsonIntEnums.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some
                     (Smaws_Lib.Json.of_string
                        "{\n    \"intEnum1\": 1,\n    \"intEnum2\": 2,\n    \"intEnum3\": 3,\n    \"intEnumList\": [\n        1,\n        2\n    ],\n    \"intEnumSet\": [\n        1,\n        2\n    ],\n    \"intEnumMap\": {\n        \"a\": 1,\n        \"b\": 2\n    }\n}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.JsonIntEnums");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error -> failwith (JsonIntEnums.error_to_string error)))
let json_int_enums_test_suite =
  ("aws.protocoltests.json#JsonIntEnums",
    [("AwsJson11IntEnums", `Quick, aws_json11_int_enums)])
let aws_json11_serialize_string_union_value () =
  (Eio.Switch.run ~name:"AwsJson11SerializeStringUnionValue") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.union_input_output) =
           { contents = (Some (StringValue "foo")) } in
         Mock.mock_response
           ?body:(Some
                    "{\n    \"contents\": {\n        \"stringValue\": \"foo\"\n    }\n}")
           ~status:200 ~headers:[("Content-Type", "application/json")] ();
         (let response = JsonUnions.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some
                     (Smaws_Lib.Json.of_string
                        "{\n    \"contents\": {\n        \"stringValue\": \"foo\"\n    }\n}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.JsonUnions");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error -> failwith (JsonUnions.error_to_string error)))
let aws_json11_serialize_boolean_union_value () =
  (Eio.Switch.run ~name:"AwsJson11SerializeBooleanUnionValue") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.union_input_output) =
           { contents = (Some (BooleanValue true)) } in
         Mock.mock_response
           ?body:(Some
                    "{\n    \"contents\": {\n        \"booleanValue\": true\n    }\n}")
           ~status:200 ~headers:[("Content-Type", "application/json")] ();
         (let response = JsonUnions.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some
                     (Smaws_Lib.Json.of_string
                        "{\n    \"contents\": {\n        \"booleanValue\": true\n    }\n}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.JsonUnions");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error -> failwith (JsonUnions.error_to_string error)))
let aws_json11_serialize_number_union_value () =
  (Eio.Switch.run ~name:"AwsJson11SerializeNumberUnionValue") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.union_input_output) =
           { contents = (Some (NumberValue 1)) } in
         Mock.mock_response
           ?body:(Some
                    "{\n    \"contents\": {\n        \"numberValue\": 1\n    }\n}")
           ~status:200 ~headers:[("Content-Type", "application/json")] ();
         (let response = JsonUnions.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some
                     (Smaws_Lib.Json.of_string
                        "{\n    \"contents\": {\n        \"numberValue\": 1\n    }\n}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.JsonUnions");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error -> failwith (JsonUnions.error_to_string error)))
let aws_json11_serialize_blob_union_value () =
  (Eio.Switch.run ~name:"AwsJson11SerializeBlobUnionValue") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.union_input_output) =
           {
             contents =
               (Some (BlobValue (Smaws_Lib.CoreTypes.Blob.of_string "foo")))
           } in
         Mock.mock_response
           ?body:(Some
                    "{\n    \"contents\": {\n        \"blobValue\": \"Zm9v\"\n    }\n}")
           ~status:200 ~headers:[("Content-Type", "application/json")] ();
         (let response = JsonUnions.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some
                     (Smaws_Lib.Json.of_string
                        "{\n    \"contents\": {\n        \"blobValue\": \"Zm9v\"\n    }\n}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.JsonUnions");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error -> failwith (JsonUnions.error_to_string error)))
let aws_json11_serialize_timestamp_union_value () =
  (Eio.Switch.run ~name:"AwsJson11SerializeTimestampUnionValue") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.union_input_output) =
           {
             contents =
               (Some
                  (TimestampValue
                     (Option.get
                        (Smaws_Lib.CoreTypes.Timestamp.of_float_s 1398796238.))))
           } in
         Mock.mock_response
           ?body:(Some
                    "{\n    \"contents\": {\n        \"timestampValue\": 1398796238\n    }\n}")
           ~status:200 ~headers:[("Content-Type", "application/json")] ();
         (let response = JsonUnions.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some
                     (Smaws_Lib.Json.of_string
                        "{\n    \"contents\": {\n        \"timestampValue\": 1398796238\n    }\n}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.JsonUnions");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error -> failwith (JsonUnions.error_to_string error)))
let aws_json11_serialize_enum_union_value () =
  (Eio.Switch.run ~name:"AwsJson11SerializeEnumUnionValue") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.union_input_output) =
           { contents = (Some (EnumValue FOO)) } in
         Mock.mock_response
           ?body:(Some
                    "{\n    \"contents\": {\n        \"enumValue\": \"Foo\"\n    }\n}")
           ~status:200 ~headers:[("Content-Type", "application/json")] ();
         (let response = JsonUnions.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some
                     (Smaws_Lib.Json.of_string
                        "{\n    \"contents\": {\n        \"enumValue\": \"Foo\"\n    }\n}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.JsonUnions");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error -> failwith (JsonUnions.error_to_string error)))
let aws_json11_serialize_list_union_value () =
  (Eio.Switch.run ~name:"AwsJson11SerializeListUnionValue") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.union_input_output) =
           { contents = (Some (ListValue ["foo"; "bar"])) } in
         Mock.mock_response
           ?body:(Some
                    "{\n    \"contents\": {\n        \"listValue\": [\"foo\", \"bar\"]\n    }\n}")
           ~status:200 ~headers:[("Content-Type", "application/json")] ();
         (let response = JsonUnions.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some
                     (Smaws_Lib.Json.of_string
                        "{\n    \"contents\": {\n        \"listValue\": [\"foo\", \"bar\"]\n    }\n}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.JsonUnions");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error -> failwith (JsonUnions.error_to_string error)))
let aws_json11_serialize_map_union_value () =
  (Eio.Switch.run ~name:"AwsJson11SerializeMapUnionValue") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.union_input_output) =
           { contents = (Some (MapValue [("foo", "bar"); ("spam", "eggs")]))
           } in
         Mock.mock_response
           ?body:(Some
                    "{\n    \"contents\": {\n        \"mapValue\": {\n            \"foo\": \"bar\",\n            \"spam\": \"eggs\"\n        }\n    }\n}")
           ~status:200 ~headers:[("Content-Type", "application/json")] ();
         (let response = JsonUnions.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some
                     (Smaws_Lib.Json.of_string
                        "{\n    \"contents\": {\n        \"mapValue\": {\n            \"foo\": \"bar\",\n            \"spam\": \"eggs\"\n        }\n    }\n}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.JsonUnions");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error -> failwith (JsonUnions.error_to_string error)))
let aws_json11_serialize_structure_union_value () =
  (Eio.Switch.run ~name:"AwsJson11SerializeStructureUnionValue") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.union_input_output) =
           { contents = (Some (StructureValue { hi = (Some "hello") })) } in
         Mock.mock_response
           ?body:(Some
                    "{\n    \"contents\": {\n        \"structureValue\": {\n            \"hi\": \"hello\"\n        }\n    }\n}")
           ~status:200 ~headers:[("Content-Type", "application/json")] ();
         (let response = JsonUnions.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some
                     (Smaws_Lib.Json.of_string
                        "{\n    \"contents\": {\n        \"structureValue\": {\n            \"hi\": \"hello\"\n        }\n    }\n}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.JsonUnions");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error -> failwith (JsonUnions.error_to_string error)))
let json_unions_test_suite =
  ("aws.protocoltests.json#JsonUnions",
    [("AwsJson11SerializeStringUnionValue", `Quick,
       aws_json11_serialize_string_union_value);
    ("AwsJson11SerializeBooleanUnionValue", `Quick,
      aws_json11_serialize_boolean_union_value);
    ("AwsJson11SerializeNumberUnionValue", `Quick,
      aws_json11_serialize_number_union_value);
    ("AwsJson11SerializeBlobUnionValue", `Quick,
      aws_json11_serialize_blob_union_value);
    ("AwsJson11SerializeTimestampUnionValue", `Quick,
      aws_json11_serialize_timestamp_union_value);
    ("AwsJson11SerializeEnumUnionValue", `Quick,
      aws_json11_serialize_enum_union_value);
    ("AwsJson11SerializeListUnionValue", `Quick,
      aws_json11_serialize_list_union_value);
    ("AwsJson11SerializeMapUnionValue", `Quick,
      aws_json11_serialize_map_union_value);
    ("AwsJson11SerializeStructureUnionValue", `Quick,
      aws_json11_serialize_structure_union_value)])
let serializes_string_shapes () =
  (Eio.Switch.run ~name:"serializes_string_shapes") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.kitchen_sink) =
           {
             unix_timestamp = None;
             timestamp = None;
             struct_with_json_name = None;
             string_ = (Some "abc xyz");
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
             blob = None
           } in
         Mock.mock_response ?body:(Some "{\"String\":\"abc xyz\"}")
           ~status:200 ~headers:[("Content-Type", "application/json")] ();
         (let response = KitchenSinkOperation.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some (Smaws_Lib.Json.of_string "{\"String\":\"abc xyz\"}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith (KitchenSinkOperation.error_to_string error)))
let serializes_string_shapes_with_jsonvalue_trait () =
  (Eio.Switch.run ~name:"serializes_string_shapes_with_jsonvalue_trait") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.kitchen_sink) =
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
               (Some
                  "{\"string\":\"value\",\"number\":1234.5,\"boolTrue\":true,\"boolFalse\":false,\"array\":[1,2,3,4],\"object\":{\"key\":\"value\"},\"null\":null}");
             iso8601_timestamp = None;
             integer = None;
             httpdate_timestamp = None;
             float_ = None;
             empty_struct = None;
             double = None;
             boolean_ = None;
             blob = None
           } in
         Mock.mock_response
           ?body:(Some
                    "{\"JsonValue\":\"{\\\"string\\\":\\\"value\\\",\\\"number\\\":1234.5,\\\"boolTrue\\\":true,\\\"boolFalse\\\":false,\\\"array\\\":[1,2,3,4],\\\"object\\\":{\\\"key\\\":\\\"value\\\"},\\\"null\\\":null}\"}")
           ~status:200 ~headers:[("Content-Type", "application/json")] ();
         (let response = KitchenSinkOperation.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some
                     (Smaws_Lib.Json.of_string
                        "{\"JsonValue\":\"{\\\"string\\\":\\\"value\\\",\\\"number\\\":1234.5,\\\"boolTrue\\\":true,\\\"boolFalse\\\":false,\\\"array\\\":[1,2,3,4],\\\"object\\\":{\\\"key\\\":\\\"value\\\"},\\\"null\\\":null}\"}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith (KitchenSinkOperation.error_to_string error)))
let serializes_integer_shapes () =
  (Eio.Switch.run ~name:"serializes_integer_shapes") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.kitchen_sink) =
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
             integer = (Some 1234);
             httpdate_timestamp = None;
             float_ = None;
             empty_struct = None;
             double = None;
             boolean_ = None;
             blob = None
           } in
         Mock.mock_response ?body:(Some "{\"Integer\":1234}") ~status:200
           ~headers:[("Content-Type", "application/json")] ();
         (let response = KitchenSinkOperation.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some (Smaws_Lib.Json.of_string "{\"Integer\":1234}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith (KitchenSinkOperation.error_to_string error)))
let serializes_long_shapes () =
  (Eio.Switch.run ~name:"serializes_long_shapes") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.kitchen_sink) =
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
             long = (Some 999999999999);
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
             blob = None
           } in
         Mock.mock_response ?body:(Some "{\"Long\":999999999999}")
           ~status:200 ~headers:[("Content-Type", "application/json")] ();
         (let response = KitchenSinkOperation.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some (Smaws_Lib.Json.of_string "{\"Long\":999999999999}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith (KitchenSinkOperation.error_to_string error)))
let serializes_float_shapes () =
  (Eio.Switch.run ~name:"serializes_float_shapes") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.kitchen_sink) =
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
             float_ = (Some 1234.5);
             empty_struct = None;
             double = None;
             boolean_ = None;
             blob = None
           } in
         Mock.mock_response ?body:(Some "{\"Float\":1234.5}") ~status:200
           ~headers:[("Content-Type", "application/json")] ();
         (let response = KitchenSinkOperation.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some (Smaws_Lib.Json.of_string "{\"Float\":1234.5}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith (KitchenSinkOperation.error_to_string error)))
let serializes_double_shapes () =
  (Eio.Switch.run ~name:"serializes_double_shapes") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.kitchen_sink) =
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
             double = (Some 1234.5);
             boolean_ = None;
             blob = None
           } in
         Mock.mock_response ?body:(Some "{\"Double\":1234.5}") ~status:200
           ~headers:[("Content-Type", "application/json")] ();
         (let response = KitchenSinkOperation.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some (Smaws_Lib.Json.of_string "{\"Double\":1234.5}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith (KitchenSinkOperation.error_to_string error)))
let serializes_blob_shapes () =
  (Eio.Switch.run ~name:"serializes_blob_shapes") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.kitchen_sink) =
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
             blob =
               (Some (Smaws_Lib.CoreTypes.Blob.of_string "binary-value"))
           } in
         Mock.mock_response ?body:(Some "{\"Blob\":\"YmluYXJ5LXZhbHVl\"}")
           ~status:200 ~headers:[("Content-Type", "application/json")] ();
         (let response = KitchenSinkOperation.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some
                     (Smaws_Lib.Json.of_string
                        "{\"Blob\":\"YmluYXJ5LXZhbHVl\"}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith (KitchenSinkOperation.error_to_string error)))
let serializes_boolean_shapes_true () =
  (Eio.Switch.run ~name:"serializes_boolean_shapes_true") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.kitchen_sink) =
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
             boolean_ = (Some true);
             blob = None
           } in
         Mock.mock_response ?body:(Some "{\"Boolean\":true}") ~status:200
           ~headers:[("Content-Type", "application/json")] ();
         (let response = KitchenSinkOperation.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some (Smaws_Lib.Json.of_string "{\"Boolean\":true}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith (KitchenSinkOperation.error_to_string error)))
let serializes_boolean_shapes_false () =
  (Eio.Switch.run ~name:"serializes_boolean_shapes_false") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.kitchen_sink) =
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
             boolean_ = (Some false);
             blob = None
           } in
         Mock.mock_response ?body:(Some "{\"Boolean\":false}") ~status:200
           ~headers:[("Content-Type", "application/json")] ();
         (let response = KitchenSinkOperation.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some (Smaws_Lib.Json.of_string "{\"Boolean\":false}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith (KitchenSinkOperation.error_to_string error)))
let serializes_timestamp_shapes () =
  (Eio.Switch.run ~name:"serializes_timestamp_shapes") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.kitchen_sink) =
           {
             unix_timestamp = None;
             timestamp =
               (Some
                  (Option.get
                     (Smaws_Lib.CoreTypes.Timestamp.of_float_s 946845296.)));
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
             blob = None
           } in
         Mock.mock_response ?body:(Some "{\"Timestamp\":946845296}")
           ~status:200 ~headers:[("Content-Type", "application/json")] ();
         (let response = KitchenSinkOperation.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some
                     (Smaws_Lib.Json.of_string "{\"Timestamp\":946845296}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith (KitchenSinkOperation.error_to_string error)))
let serializes_timestamp_shapes_with_iso8601_timestampformat () =
  (Eio.Switch.run
     ~name:"serializes_timestamp_shapes_with_iso8601_timestampformat")
    @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.kitchen_sink) =
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
             iso8601_timestamp =
               (Some
                  (Option.get
                     (Smaws_Lib.CoreTypes.Timestamp.of_float_s 946845296.)));
             integer = None;
             httpdate_timestamp = None;
             float_ = None;
             empty_struct = None;
             double = None;
             boolean_ = None;
             blob = None
           } in
         Mock.mock_response
           ?body:(Some "{\"Iso8601Timestamp\":\"2000-01-02T20:34:56Z\"}")
           ~status:200 ~headers:[("Content-Type", "application/json")] ();
         (let response = KitchenSinkOperation.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some
                     (Smaws_Lib.Json.of_string
                        "{\"Iso8601Timestamp\":\"2000-01-02T20:34:56Z\"}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith (KitchenSinkOperation.error_to_string error)))
let serializes_timestamp_shapes_with_httpdate_timestampformat () =
  (Eio.Switch.run
     ~name:"serializes_timestamp_shapes_with_httpdate_timestampformat")
    @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.kitchen_sink) =
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
             httpdate_timestamp =
               (Some
                  (Option.get
                     (Smaws_Lib.CoreTypes.Timestamp.of_float_s 946845296.)));
             float_ = None;
             empty_struct = None;
             double = None;
             boolean_ = None;
             blob = None
           } in
         Mock.mock_response
           ?body:(Some
                    "{\"HttpdateTimestamp\":\"Sun, 02 Jan 2000 20:34:56 GMT\"}")
           ~status:200 ~headers:[("Content-Type", "application/json")] ();
         (let response = KitchenSinkOperation.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some
                     (Smaws_Lib.Json.of_string
                        "{\"HttpdateTimestamp\":\"Sun, 02 Jan 2000 20:34:56 GMT\"}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith (KitchenSinkOperation.error_to_string error)))
let serializes_timestamp_shapes_with_unixtimestamp_timestampformat () =
  (Eio.Switch.run
     ~name:"serializes_timestamp_shapes_with_unixtimestamp_timestampformat")
    @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.kitchen_sink) =
           {
             unix_timestamp =
               (Some
                  (Option.get
                     (Smaws_Lib.CoreTypes.Timestamp.of_float_s 946845296.)));
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
             blob = None
           } in
         Mock.mock_response ?body:(Some "{\"UnixTimestamp\":946845296}")
           ~status:200 ~headers:[("Content-Type", "application/json")] ();
         (let response = KitchenSinkOperation.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some
                     (Smaws_Lib.Json.of_string
                        "{\"UnixTimestamp\":946845296}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith (KitchenSinkOperation.error_to_string error)))
let serializes_list_shapes () =
  (Eio.Switch.run ~name:"serializes_list_shapes") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.kitchen_sink) =
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
             list_of_strings = (Some ["abc"; "mno"; "xyz"]);
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
             blob = None
           } in
         Mock.mock_response
           ?body:(Some "{\"ListOfStrings\":[\"abc\",\"mno\",\"xyz\"]}")
           ~status:200 ~headers:[("Content-Type", "application/json")] ();
         (let response = KitchenSinkOperation.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some
                     (Smaws_Lib.Json.of_string
                        "{\"ListOfStrings\":[\"abc\",\"mno\",\"xyz\"]}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith (KitchenSinkOperation.error_to_string error)))
let serializes_empty_list_shapes () =
  (Eio.Switch.run ~name:"serializes_empty_list_shapes") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.kitchen_sink) =
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
             list_of_strings = (Some []);
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
             blob = None
           } in
         Mock.mock_response ?body:(Some "{\"ListOfStrings\":[]}") ~status:200
           ~headers:[("Content-Type", "application/json")] ();
         (let response = KitchenSinkOperation.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some (Smaws_Lib.Json.of_string "{\"ListOfStrings\":[]}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith (KitchenSinkOperation.error_to_string error)))
let serializes_list_of_map_shapes () =
  (Eio.Switch.run ~name:"serializes_list_of_map_shapes") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.kitchen_sink) =
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
             list_of_maps_of_strings =
               (Some [[("foo", "bar")]; [("abc", "xyz")]; [("red", "blue")]]);
             list_of_lists = None;
             json_value = None;
             iso8601_timestamp = None;
             integer = None;
             httpdate_timestamp = None;
             float_ = None;
             empty_struct = None;
             double = None;
             boolean_ = None;
             blob = None
           } in
         Mock.mock_response
           ?body:(Some
                    "{\"ListOfMapsOfStrings\":[{\"foo\":\"bar\"},{\"abc\":\"xyz\"},{\"red\":\"blue\"}]}")
           ~status:200 ~headers:[("Content-Type", "application/json")] ();
         (let response = KitchenSinkOperation.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some
                     (Smaws_Lib.Json.of_string
                        "{\"ListOfMapsOfStrings\":[{\"foo\":\"bar\"},{\"abc\":\"xyz\"},{\"red\":\"blue\"}]}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith (KitchenSinkOperation.error_to_string error)))
let serializes_list_of_structure_shapes () =
  (Eio.Switch.run ~name:"serializes_list_of_structure_shapes") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.kitchen_sink) =
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
               (Some
                  [{ value = (Some "abc") };
                  { value = (Some "mno") };
                  { value = (Some "xyz") }]);
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
             blob = None
           } in
         Mock.mock_response
           ?body:(Some
                    "{\"ListOfStructs\":[{\"Value\":\"abc\"},{\"Value\":\"mno\"},{\"Value\":\"xyz\"}]}")
           ~status:200 ~headers:[("Content-Type", "application/json")] ();
         (let response = KitchenSinkOperation.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some
                     (Smaws_Lib.Json.of_string
                        "{\"ListOfStructs\":[{\"Value\":\"abc\"},{\"Value\":\"mno\"},{\"Value\":\"xyz\"}]}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith (KitchenSinkOperation.error_to_string error)))
let serializes_list_of_recursive_structure_shapes () =
  (Eio.Switch.run ~name:"serializes_list_of_recursive_structure_shapes") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.kitchen_sink) =
           {
             unix_timestamp = None;
             timestamp = None;
             struct_with_json_name = None;
             string_ = None;
             simple_struct = None;
             recursive_struct = None;
             recursive_map = None;
             recursive_list =
               (Some
                  [{
                     unix_timestamp = None;
                     timestamp = None;
                     struct_with_json_name = None;
                     string_ = None;
                     simple_struct = None;
                     recursive_struct = None;
                     recursive_map = None;
                     recursive_list =
                       (Some
                          [{
                             unix_timestamp = None;
                             timestamp = None;
                             struct_with_json_name = None;
                             string_ = None;
                             simple_struct = None;
                             recursive_struct = None;
                             recursive_map = None;
                             recursive_list =
                               (Some
                                  [{
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
                                     integer = (Some 123);
                                     httpdate_timestamp = None;
                                     float_ = None;
                                     empty_struct = None;
                                     double = None;
                                     boolean_ = None;
                                     blob = None
                                   }]);
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
                             blob = None
                           }]);
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
                     blob = None
                   }]);
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
             blob = None
           } in
         Mock.mock_response
           ?body:(Some
                    "{\"RecursiveList\":[{\"RecursiveList\":[{\"RecursiveList\":[{\"Integer\":123}]}]}]}")
           ~status:200 ~headers:[("Content-Type", "application/json")] ();
         (let response = KitchenSinkOperation.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some
                     (Smaws_Lib.Json.of_string
                        "{\"RecursiveList\":[{\"RecursiveList\":[{\"RecursiveList\":[{\"Integer\":123}]}]}]}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith (KitchenSinkOperation.error_to_string error)))
let serializes_map_shapes () =
  (Eio.Switch.run ~name:"serializes_map_shapes") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.kitchen_sink) =
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
             map_of_strings = (Some [("abc", "xyz"); ("mno", "hjk")]);
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
             blob = None
           } in
         Mock.mock_response
           ?body:(Some "{\"MapOfStrings\":{\"abc\":\"xyz\",\"mno\":\"hjk\"}}")
           ~status:200 ~headers:[("Content-Type", "application/json")] ();
         (let response = KitchenSinkOperation.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some
                     (Smaws_Lib.Json.of_string
                        "{\"MapOfStrings\":{\"abc\":\"xyz\",\"mno\":\"hjk\"}}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith (KitchenSinkOperation.error_to_string error)))
let serializes_empty_map_shapes () =
  (Eio.Switch.run ~name:"serializes_empty_map_shapes") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.kitchen_sink) =
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
             map_of_strings = (Some []);
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
             blob = None
           } in
         Mock.mock_response ?body:(Some "{\"MapOfStrings\":{}}") ~status:200
           ~headers:[("Content-Type", "application/json")] ();
         (let response = KitchenSinkOperation.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some (Smaws_Lib.Json.of_string "{\"MapOfStrings\":{}}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith (KitchenSinkOperation.error_to_string error)))
let serializes_map_of_list_shapes () =
  (Eio.Switch.run ~name:"serializes_map_of_list_shapes") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.kitchen_sink) =
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
             map_of_lists_of_strings =
               (Some [("abc", ["abc"; "xyz"]); ("mno", ["xyz"; "abc"])]);
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
             blob = None
           } in
         Mock.mock_response
           ?body:(Some
                    "{\"MapOfListsOfStrings\":{\"abc\":[\"abc\",\"xyz\"],\"mno\":[\"xyz\",\"abc\"]}}")
           ~status:200 ~headers:[("Content-Type", "application/json")] ();
         (let response = KitchenSinkOperation.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some
                     (Smaws_Lib.Json.of_string
                        "{\"MapOfListsOfStrings\":{\"abc\":[\"abc\",\"xyz\"],\"mno\":[\"xyz\",\"abc\"]}}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith (KitchenSinkOperation.error_to_string error)))
let serializes_map_of_structure_shapes () =
  (Eio.Switch.run ~name:"serializes_map_of_structure_shapes") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.kitchen_sink) =
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
               (Some
                  [("key1", { value = (Some "value-1") });
                  ("key2", { value = (Some "value-2") })]);
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
             blob = None
           } in
         Mock.mock_response
           ?body:(Some
                    "{\"MapOfStructs\":{\"key1\":{\"Value\":\"value-1\"},\"key2\":{\"Value\":\"value-2\"}}}")
           ~status:200 ~headers:[("Content-Type", "application/json")] ();
         (let response = KitchenSinkOperation.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some
                     (Smaws_Lib.Json.of_string
                        "{\"MapOfStructs\":{\"key1\":{\"Value\":\"value-1\"},\"key2\":{\"Value\":\"value-2\"}}}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith (KitchenSinkOperation.error_to_string error)))
let serializes_map_of_recursive_structure_shapes () =
  (Eio.Switch.run ~name:"serializes_map_of_recursive_structure_shapes") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.kitchen_sink) =
           {
             unix_timestamp = None;
             timestamp = None;
             struct_with_json_name = None;
             string_ = None;
             simple_struct = None;
             recursive_struct = None;
             recursive_map =
               (Some
                  [("key1",
                     {
                       unix_timestamp = None;
                       timestamp = None;
                       struct_with_json_name = None;
                       string_ = None;
                       simple_struct = None;
                       recursive_struct = None;
                       recursive_map =
                         (Some
                            [("key2",
                               {
                                 unix_timestamp = None;
                                 timestamp = None;
                                 struct_with_json_name = None;
                                 string_ = None;
                                 simple_struct = None;
                                 recursive_struct = None;
                                 recursive_map =
                                   (Some
                                      [("key3",
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
                                           boolean_ = (Some false);
                                           blob = None
                                         })]);
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
                                 blob = None
                               })]);
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
                       blob = None
                     })]);
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
             blob = None
           } in
         Mock.mock_response
           ?body:(Some
                    "{\"RecursiveMap\":{\"key1\":{\"RecursiveMap\":{\"key2\":{\"RecursiveMap\":{\"key3\":{\"Boolean\":false}}}}}}}")
           ~status:200 ~headers:[("Content-Type", "application/json")] ();
         (let response = KitchenSinkOperation.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some
                     (Smaws_Lib.Json.of_string
                        "{\"RecursiveMap\":{\"key1\":{\"RecursiveMap\":{\"key2\":{\"RecursiveMap\":{\"key3\":{\"Boolean\":false}}}}}}}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith (KitchenSinkOperation.error_to_string error)))
let serializes_structure_shapes () =
  (Eio.Switch.run ~name:"serializes_structure_shapes") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.kitchen_sink) =
           {
             unix_timestamp = None;
             timestamp = None;
             struct_with_json_name = None;
             string_ = None;
             simple_struct = (Some { value = (Some "abc") });
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
             blob = None
           } in
         Mock.mock_response
           ?body:(Some "{\"SimpleStruct\":{\"Value\":\"abc\"}}") ~status:200
           ~headers:[("Content-Type", "application/json")] ();
         (let response = KitchenSinkOperation.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some
                     (Smaws_Lib.Json.of_string
                        "{\"SimpleStruct\":{\"Value\":\"abc\"}}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith (KitchenSinkOperation.error_to_string error)))
let serializes_structure_members_with_locationname_traits () =
  (Eio.Switch.run
     ~name:"serializes_structure_members_with_locationname_traits")
    @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.kitchen_sink) =
           {
             unix_timestamp = None;
             timestamp = None;
             struct_with_json_name = (Some { value = (Some "some-value") });
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
             blob = None
           } in
         Mock.mock_response
           ?body:(Some "{\"StructWithJsonName\":{\"Value\":\"some-value\"}}")
           ~status:200 ~headers:[("Content-Type", "application/json")] ();
         (let response = KitchenSinkOperation.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some
                     (Smaws_Lib.Json.of_string
                        "{\"StructWithJsonName\":{\"Value\":\"some-value\"}}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith (KitchenSinkOperation.error_to_string error)))
let serializes_empty_structure_shapes () =
  (Eio.Switch.run ~name:"serializes_empty_structure_shapes") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.kitchen_sink) =
           {
             unix_timestamp = None;
             timestamp = None;
             struct_with_json_name = None;
             string_ = None;
             simple_struct = (Some { value = None });
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
             blob = None
           } in
         Mock.mock_response ?body:(Some "{\"SimpleStruct\":{}}") ~status:200
           ~headers:[("Content-Type", "application/json")] ();
         (let response = KitchenSinkOperation.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some (Smaws_Lib.Json.of_string "{\"SimpleStruct\":{}}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith (KitchenSinkOperation.error_to_string error)))
let serializes_structure_which_have_no_members () =
  (Eio.Switch.run ~name:"serializes_structure_which_have_no_members") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.kitchen_sink) =
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
             empty_struct = (Some ());
             double = None;
             boolean_ = None;
             blob = None
           } in
         Mock.mock_response ?body:(Some "{\"EmptyStruct\":{}}") ~status:200
           ~headers:[("Content-Type", "application/json")] ();
         (let response = KitchenSinkOperation.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some (Smaws_Lib.Json.of_string "{\"EmptyStruct\":{}}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith (KitchenSinkOperation.error_to_string error)))
let serializes_recursive_structure_shapes () =
  (Eio.Switch.run ~name:"serializes_recursive_structure_shapes") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.kitchen_sink) =
           {
             unix_timestamp = None;
             timestamp = None;
             struct_with_json_name = None;
             string_ = (Some "top-value");
             simple_struct = None;
             recursive_struct =
               (Some
                  {
                    unix_timestamp = None;
                    timestamp = None;
                    struct_with_json_name = None;
                    string_ = (Some "nested-value");
                    simple_struct = None;
                    recursive_struct = None;
                    recursive_map = None;
                    recursive_list =
                      (Some
                         [{
                            unix_timestamp = None;
                            timestamp = None;
                            struct_with_json_name = None;
                            string_ = (Some "string-only");
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
                            blob = None
                          };
                         {
                           unix_timestamp = None;
                           timestamp = None;
                           struct_with_json_name = None;
                           string_ = None;
                           simple_struct = None;
                           recursive_struct =
                             (Some
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
                                  map_of_strings =
                                    (Some
                                       [("color", "red"); ("size", "large")]);
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
                                  blob = None
                                });
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
                           blob = None
                         }]);
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
                    boolean_ = (Some true);
                    blob = None
                  });
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
             boolean_ = (Some false);
             blob = None
           } in
         Mock.mock_response
           ?body:(Some
                    "{\"String\":\"top-value\",\"Boolean\":false,\"RecursiveStruct\":{\"String\":\"nested-value\",\"Boolean\":true,\"RecursiveList\":[{\"String\":\"string-only\"},{\"RecursiveStruct\":{\"MapOfStrings\":{\"color\":\"red\",\"size\":\"large\"}}}]}}")
           ~status:200 ~headers:[("Content-Type", "application/json")] ();
         (let response = KitchenSinkOperation.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some
                     (Smaws_Lib.Json.of_string
                        "{\"String\":\"top-value\",\"Boolean\":false,\"RecursiveStruct\":{\"String\":\"nested-value\",\"Boolean\":true,\"RecursiveList\":[{\"String\":\"string-only\"},{\"RecursiveStruct\":{\"MapOfStrings\":{\"color\":\"red\",\"size\":\"large\"}}}]}}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.KitchenSinkOperation");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith (KitchenSinkOperation.error_to_string error)))
let kitchen_sink_operation_test_suite =
  ("aws.protocoltests.json#KitchenSinkOperation",
    [("serializes_string_shapes", `Quick, serializes_string_shapes);
    ("serializes_string_shapes_with_jsonvalue_trait", `Quick,
      serializes_string_shapes_with_jsonvalue_trait);
    ("serializes_integer_shapes", `Quick, serializes_integer_shapes);
    ("serializes_long_shapes", `Quick, serializes_long_shapes);
    ("serializes_float_shapes", `Quick, serializes_float_shapes);
    ("serializes_double_shapes", `Quick, serializes_double_shapes);
    ("serializes_blob_shapes", `Quick, serializes_blob_shapes);
    ("serializes_boolean_shapes_true", `Quick,
      serializes_boolean_shapes_true);
    ("serializes_boolean_shapes_false", `Quick,
      serializes_boolean_shapes_false);
    ("serializes_timestamp_shapes", `Quick, serializes_timestamp_shapes);
    ("serializes_timestamp_shapes_with_iso8601_timestampformat", `Quick,
      serializes_timestamp_shapes_with_iso8601_timestampformat);
    ("serializes_timestamp_shapes_with_httpdate_timestampformat", `Quick,
      serializes_timestamp_shapes_with_httpdate_timestampformat);
    ("serializes_timestamp_shapes_with_unixtimestamp_timestampformat",
      `Quick, serializes_timestamp_shapes_with_unixtimestamp_timestampformat);
    ("serializes_list_shapes", `Quick, serializes_list_shapes);
    ("serializes_empty_list_shapes", `Quick, serializes_empty_list_shapes);
    ("serializes_list_of_map_shapes", `Quick, serializes_list_of_map_shapes);
    ("serializes_list_of_structure_shapes", `Quick,
      serializes_list_of_structure_shapes);
    ("serializes_list_of_recursive_structure_shapes", `Quick,
      serializes_list_of_recursive_structure_shapes);
    ("serializes_map_shapes", `Quick, serializes_map_shapes);
    ("serializes_empty_map_shapes", `Quick, serializes_empty_map_shapes);
    ("serializes_map_of_list_shapes", `Quick, serializes_map_of_list_shapes);
    ("serializes_map_of_structure_shapes", `Quick,
      serializes_map_of_structure_shapes);
    ("serializes_map_of_recursive_structure_shapes", `Quick,
      serializes_map_of_recursive_structure_shapes);
    ("serializes_structure_shapes", `Quick, serializes_structure_shapes);
    ("serializes_structure_members_with_locationname_traits", `Quick,
      serializes_structure_members_with_locationname_traits);
    ("serializes_empty_structure_shapes", `Quick,
      serializes_empty_structure_shapes);
    ("serializes_structure_which_have_no_members", `Quick,
      serializes_structure_which_have_no_members);
    ("serializes_recursive_structure_shapes", `Quick,
      serializes_recursive_structure_shapes)])
let aws_json11_structures_dont_serialize_null_values () =
  (Eio.Switch.run ~name:"AwsJson11StructuresDontSerializeNullValues") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.null_operation_input_output) = { string_ = None } in
         Mock.mock_response ?body:(Some "{}") ~status:200
           ~headers:[("Content-Type", "application/json")] ();
         (let response = NullOperation.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some (Smaws_Lib.Json.of_string "{}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.NullOperation");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error -> failwith (NullOperation.error_to_string error)))
let null_operation_test_suite =
  ("aws.protocoltests.json#NullOperation",
    [("AwsJson11StructuresDontSerializeNullValues", `Quick,
       aws_json11_structures_dont_serialize_null_values)])
let can_call_operation_with_no_input_or_output () =
  (Eio.Switch.run ~name:"can_call_operation_with_no_input_or_output") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.operation_with_optional_input_output_input) =
           { value = None } in
         Mock.mock_response ?body:(Some "{}") ~status:200
           ~headers:[("Content-Type", "application/json")] ();
         (let response = OperationWithOptionalInputOutput.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some (Smaws_Lib.Json.of_string "{}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target",
                     "JsonProtocol.OperationWithOptionalInputOutput");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith
                (OperationWithOptionalInputOutput.error_to_string error)))
let can_call_operation_with_optional_input () =
  (Eio.Switch.run ~name:"can_call_operation_with_optional_input") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.operation_with_optional_input_output_input) =
           { value = (Some "Hi") } in
         Mock.mock_response ?body:(Some "{\"Value\":\"Hi\"}") ~status:200
           ~headers:[("Content-Type", "application/json")] ();
         (let response = OperationWithOptionalInputOutput.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some (Smaws_Lib.Json.of_string "{\"Value\":\"Hi\"}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target",
                     "JsonProtocol.OperationWithOptionalInputOutput");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith
                (OperationWithOptionalInputOutput.error_to_string error)))
let operation_with_optional_input_output_test_suite =
  ("aws.protocoltests.json#OperationWithOptionalInputOutput",
    [("can_call_operation_with_no_input_or_output", `Quick,
       can_call_operation_with_no_input_or_output);
    ("can_call_operation_with_optional_input", `Quick,
      can_call_operation_with_optional_input)])
let put_and_get_inline_documents_input () =
  (Eio.Switch.run ~name:"PutAndGetInlineDocumentsInput") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.put_and_get_inline_documents_input_output) =
           {
             inline_document =
               (Some
                  (Smaws_Lib.CoreTypes.Document.from_string
                     "{ \"foo\": \"bar\" }"))
           } in
         Mock.mock_response
           ?body:(Some "{\n    \"inlineDocument\": {\"foo\": \"bar\"}\n}")
           ~status:200 ~headers:[("Content-Type", "application/json")] ();
         (let response = PutAndGetInlineDocuments.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some
                     (Smaws_Lib.Json.of_string
                        "{\n    \"inlineDocument\": {\"foo\": \"bar\"}\n}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.PutAndGetInlineDocuments");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith (PutAndGetInlineDocuments.error_to_string error)))
let put_and_get_inline_documents_test_suite =
  ("aws.protocoltests.json#PutAndGetInlineDocuments",
    [("PutAndGetInlineDocumentsInput", `Quick,
       put_and_get_inline_documents_input)])
let sdk_applied_content_encoding_aws_json1_1 () =
  (Eio.Switch.run ~name:"SDKAppliedContentEncoding_awsJson1_1") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.put_with_content_encoding_input) =
           {
             data =
               (Some
                  "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\n");
             encoding = None
           } in
         Mock.mock_response ?body:None ~status:200
           ~headers:[("Content-Type", "application/json")] ();
         (let response = PutWithContentEncoding.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () = () in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers" [("Content-Encoding", "gzip")]
                  request.headers in
              ()
          | Error error ->
              failwith (PutWithContentEncoding.error_to_string error)))
let sdk_appends_gzip_and_ignores_http_provided_encoding_aws_json1_1 () =
  (Eio.Switch.run
     ~name:"SDKAppendsGzipAndIgnoresHttpProvidedEncoding_awsJson1_1")
    @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.put_with_content_encoding_input) =
           {
             data =
               (Some
                  "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\n");
             encoding = (Some "custom")
           } in
         Mock.mock_response ?body:None ~status:200
           ~headers:[("Content-Type", "application/json")] ();
         (let response = PutWithContentEncoding.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () = () in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers" [("Content-Encoding", "gzip")]
                  request.headers in
              ()
          | Error error ->
              failwith (PutWithContentEncoding.error_to_string error)))
let put_with_content_encoding_test_suite =
  ("aws.protocoltests.json#PutWithContentEncoding",
    [("SDKAppliedContentEncoding_awsJson1_1", `Quick,
       sdk_applied_content_encoding_aws_json1_1);
    ("SDKAppendsGzipAndIgnoresHttpProvidedEncoding_awsJson1_1", `Quick,
      sdk_appends_gzip_and_ignores_http_provided_encoding_aws_json1_1)])
let aws_json11_supports_na_n_float_inputs () =
  (Eio.Switch.run ~name:"AwsJson11SupportsNaNFloatInputs") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.simple_scalar_properties_input_output) =
           { double_value = (Some Float.nan); float_value = (Some Float.nan)
           } in
         Mock.mock_response
           ?body:(Some
                    "{\n    \"floatValue\": \"NaN\",\n    \"doubleValue\": \"NaN\"\n}")
           ~status:200 ~headers:[("Content-Type", "application/json")] ();
         (let response = SimpleScalarProperties.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some
                     (Smaws_Lib.Json.of_string
                        "{\n    \"floatValue\": \"NaN\",\n    \"doubleValue\": \"NaN\"\n}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.SimpleScalarProperties");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith (SimpleScalarProperties.error_to_string error)))
let aws_json11_supports_infinity_float_inputs () =
  (Eio.Switch.run ~name:"AwsJson11SupportsInfinityFloatInputs") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.simple_scalar_properties_input_output) =
           {
             double_value = (Some Float.infinity);
             float_value = (Some Float.infinity)
           } in
         Mock.mock_response
           ?body:(Some
                    "{\n    \"floatValue\": \"Infinity\",\n    \"doubleValue\": \"Infinity\"\n}")
           ~status:200 ~headers:[("Content-Type", "application/json")] ();
         (let response = SimpleScalarProperties.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some
                     (Smaws_Lib.Json.of_string
                        "{\n    \"floatValue\": \"Infinity\",\n    \"doubleValue\": \"Infinity\"\n}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.SimpleScalarProperties");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith (SimpleScalarProperties.error_to_string error)))
let aws_json11_supports_negative_infinity_float_inputs () =
  (Eio.Switch.run ~name:"AwsJson11SupportsNegativeInfinityFloatInputs") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.simple_scalar_properties_input_output) =
           {
             double_value = (Some Float.neg_infinity);
             float_value = (Some Float.neg_infinity)
           } in
         Mock.mock_response
           ?body:(Some
                    "{\n    \"floatValue\": \"-Infinity\",\n    \"doubleValue\": \"-Infinity\"\n}")
           ~status:200 ~headers:[("Content-Type", "application/json")] ();
         (let response = SimpleScalarProperties.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some
                     (Smaws_Lib.Json.of_string
                        "{\n    \"floatValue\": \"-Infinity\",\n    \"doubleValue\": \"-Infinity\"\n}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.SimpleScalarProperties");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith (SimpleScalarProperties.error_to_string error)))
let simple_scalar_properties_test_suite =
  ("aws.protocoltests.json#SimpleScalarProperties",
    [("AwsJson11SupportsNaNFloatInputs", `Quick,
       aws_json11_supports_na_n_float_inputs);
    ("AwsJson11SupportsInfinityFloatInputs", `Quick,
      aws_json11_supports_infinity_float_inputs);
    ("AwsJson11SupportsNegativeInfinityFloatInputs", `Quick,
      aws_json11_supports_negative_infinity_float_inputs)])
let aws_json11_sparse_maps_serialize_null_values () =
  (Eio.Switch.run ~name:"AwsJson11SparseMapsSerializeNullValues") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.sparse_nulls_operation_input_output) =
           {
             sparse_string_map =
               (Some [("foo", Smaws_Lib.CoreTypes.Nullable.Null)]);
             sparse_string_list = None
           } in
         Mock.mock_response
           ?body:(Some
                    "{\n    \"sparseStringMap\": {\n        \"foo\": null\n    }\n}")
           ~status:200 ~headers:[("Content-Type", "application/json")] ();
         (let response = SparseNullsOperation.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some
                     (Smaws_Lib.Json.of_string
                        "{\n    \"sparseStringMap\": {\n        \"foo\": null\n    }\n}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.SparseNullsOperation");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith (SparseNullsOperation.error_to_string error)))
let aws_json11_sparse_lists_serialize_null () =
  (Eio.Switch.run ~name:"AwsJson11SparseListsSerializeNull") @@
    (fun sw ->
       let module Mock = (val Http_mock.create_http_mock ()) in
         let http_type = ((module
           Mock) : (module Smaws_Lib.Http.Client with type t = Mock.t)) in
         let config = Config.dummy in
         let ctx = Smaws_Lib.Context.make ~config ~http_type () in
         let (input : Types.sparse_nulls_operation_input_output) =
           {
             sparse_string_map = None;
             sparse_string_list = (Some [Smaws_Lib.CoreTypes.Nullable.Null])
           } in
         Mock.mock_response
           ?body:(Some
                    "{\n    \"sparseStringList\": [\n        null\n    ]\n}")
           ~status:200 ~headers:[("Content-Type", "application/json")] ();
         (let response = SparseNullsOperation.request ctx input in
          match response with
          | Ok resp ->
              let request = Mock.last_request () in
              let () =
                check Alcotest_http.input_body_json_testable
                  "expected request body value"
                  (Some
                     (Smaws_Lib.Json.of_string
                        "{\n    \"sparseStringList\": [\n        null\n    ]\n}"))
                  ((request.body |>
                      (Option.map
                         (function
                          | `Form _ -> failwith "not expecting form"
                          | `String x -> x
                          | `None -> "{}")))
                     |> (Option.map Yojson.Basic.from_string)) in
              let () =
                check Alcotest_http.method_testable "expected request method"
                  `POST request.method_ in
              let () =
                check Alcotest_http.uri_testable "expected request uri"
                  (Uri.of_string "/") request.uri in
              let () =
                check Alcotest_http.headers_testable
                  "expected request headers"
                  [("X-Amz-Target", "JsonProtocol.SparseNullsOperation");
                  ("Content-Type", "application/x-amz-json-1.1")]
                  request.headers in
              ()
          | Error error ->
              failwith (SparseNullsOperation.error_to_string error)))
let sparse_nulls_operation_test_suite =
  ("aws.protocoltests.json#SparseNullsOperation",
    [("AwsJson11SparseMapsSerializeNullValues", `Quick,
       aws_json11_sparse_maps_serialize_null_values);
    ("AwsJson11SparseListsSerializeNull", `Quick,
      aws_json11_sparse_lists_serialize_null)])
let () =
  Eio_main.run @@
    (fun env ->
       Alcotest.run "aws.protocoltests.json"
         [content_type_parameters_test_suite;
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
         sparse_nulls_operation_test_suite])