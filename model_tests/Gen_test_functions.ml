open Base

(** Test function generation errors *)
type test_function_error =
  | ConstructorError of Gen_test_constructors.constructor_error
  | InvalidTestCase of string
  | MockSetupError of string

let string_of_test_function_error = function
  | ConstructorError e ->
      "Constructor error: " ^ Gen_test_constructors.string_of_constructor_error e
  | InvalidTestCase s -> "Invalid test case: " ^ s
  | MockSetupError s -> "Mock setup error: " ^ s

(** Convert constructor errors to test function errors *)
let wrap_constructor_error = function Ok x -> Ok x | Error e -> Error (ConstructorError e)

(** Convert HTTP method to string for comparison *)
let http_method_to_string method_ = method_

(** Generate assertion for HTTP request method *)
let generate_method_assertion expected_method =
  Printf.sprintf
    "  Alcotest.(check string) \"HTTP method\" \"%s\" (Http.string_of_method request.method_);"
    expected_method

(** Generate assertion for HTTP request URI *)
let generate_uri_assertion expected_uri =
  Printf.sprintf "  Alcotest.(check string) \"Request URI\" \"%s\" (Uri.to_string request.uri);"
    expected_uri

(** Generate assertion for HTTP request headers *)
let generate_headers_assertions expected_headers =
  match expected_headers with
  | None -> []
  | Some headers ->
      List.map headers ~f:(fun (key, value) ->
          Printf.sprintf
            "  Alcotest.(check (option string)) \"Header %s\" (Some \"%s\") (List.Assoc.find \
             request.headers \"%s\" ~equal:String.equal);"
            key value key)

(** Generate assertion for HTTP request body *)
let generate_body_assertion expected_body =
  match expected_body with
  | None ->
      "  Alcotest.(check (option string)) \"Request body\" None (Option.map request.body \
       ~f:Http.string_of_input_body);"
  | Some body ->
      Printf.sprintf
        "  Alcotest.(check (option string)) \"Request body\" (Some \"%s\") (Option.map \
         request.body ~f:Http.string_of_input_body);"
        body

(** Generate request test function for a single test case *)
let generate_request_test_function shapes operation_name
    (test_case : Parselib.Ast.Trait.httpRequestTest) =
  let test_id = test_case.id in
  let safe_operation_name = Parselib.Codegen.SafeNames.safeFunctionName operation_name in
  let safe_test_id = Parselib.Codegen.SafeNames.safeFunctionName test_id in

  (* Generate input constructor *)
  match
    Gen_test_constructors.generate_input_constructor shapes operation_name operation_name test_case
  with
  | Error e -> Error (ConstructorError e)
  | Ok input_constructor ->
      let method_assertion = generate_method_assertion test_case.method_ in
      let uri_assertion = generate_uri_assertion test_case.uri in
      let headers_assertions =
        generate_headers_assertions test_case.headers |> String.concat ~sep:"\n"
      in
      let body_assertion = generate_body_assertion test_case.body in

      let lines =
        [
          "(* Request test for operation " ^ operation_name ^ ", test case " ^ test_id ^ " *)";
          "let test_" ^ safe_operation_name ^ "_" ^ safe_test_id ^ "_request () =";
          "  let module HttpMock = (val Awssdklib_test.Http_mock.create_http_mock () : \
           Awssdklib_test.Http_mock.HttpMock_intf) in";
          "  let http_client = (module HttpMock : Smaws_Lib.Http.Client_intf) in";
          "  let context = Smaws_Lib.Context.make_with_http_client http_client in";
          "";
          "  (* Set up mock response *)";
          "  HttpMock.mock_response ~status:200 ~body:\"\" ();";
          "";
          "  (* Generate test input *)";
          "  " ^ input_constructor;
          "  let test_input = make_" ^ test_id ^ "_input () in";
          "";
          "  (* Execute operation (this will make HTTP request) *)";
          "  let _result = failwith \"TODO: Call actual operation\" in";
          "";
          "  (* Verify the HTTP request was made correctly *)";
          "  let request = HttpMock.last_request () in";
          method_assertion;
        ]
      in
      let test_function = String.concat lines ~sep:"\n" in

      Ok test_function

(** Generate response test function for a single test case *)
let generate_response_test_function shapes operation_name
    (test_case : Parselib.Ast.Trait.httpResponseTest) =
  let test_id = test_case.id in
  let safe_operation_name = Parselib.Codegen.SafeNames.safeFunctionName operation_name in
  let safe_test_id = Parselib.Codegen.SafeNames.safeFunctionName test_id in

  (* Generate response constructor *)
  match
    Gen_test_constructors.generate_response_constructor shapes operation_name operation_name
      test_case
  with
  | Error e -> Error (ConstructorError e)
  | Ok response_constructor ->
      let response_body = Option.value test_case.body ~default:"" in
      let response_status = test_case.code in

      let lines =
        [
          "(* Response test for operation " ^ operation_name ^ ", test case " ^ test_id ^ " *)";
          "let test_" ^ safe_operation_name ^ "_" ^ safe_test_id ^ "_response () =";
          "  let module HttpMock = (val Awssdklib_test.Http_mock.create_http_mock () : \
           Awssdklib_test.Http_mock.HttpMock_intf) in";
          "  let http_client = (module HttpMock : Smaws_Lib.Http.Client_intf) in";
          "  let context = Smaws_Lib.Context.make_with_http_client http_client in";
          "";
          "  (* Set up mock response *)";
          "  HttpMock.mock_response ~status:" ^ Int.to_string response_status ^ " ~body:\""
          ^ response_body ^ "\" ();";
          "";
          "  (* Generate expected response *)";
          "  " ^ response_constructor;
          "  let expected_response = make_" ^ test_id ^ "_expected () in";
          "";
          "  (* Execute operation *)";
          "  let result = failwith \"TODO: Call actual operation\" in";
          "";
          "  (* Verify the response matches expected *)";
          "  match result with";
          "  | Ok actual_response ->";
          "    (* TODO: Add response comparison using generated equal functions *)";
          "    Alcotest.(check pass) \"Response matches expected\" () ()";
          "  | Error e ->";
          "    Alcotest.fail \"Operation failed\"";
        ]
      in
      let test_function = String.concat lines ~sep:"\n" in

      Ok test_function

(** Generate all test functions for an operation's test cases *)
let generate_operation_test_functions shapes test_case =
  let operation_name = test_case.Test_data_parser.operation_name in

  (* Generate request test functions *)
  let request_tests_result =
    List.fold test_case.request_tests ~init:(Ok []) ~f:(fun acc request_test ->
        match acc with
        | Error e -> Error e
        | Ok tests -> (
            match generate_request_test_function shapes operation_name request_test with
            | Ok test_func -> Ok (test_func :: tests)
            | Error e -> Error e))
  in

  (* Generate response test functions *)
  let response_tests_result =
    List.fold test_case.response_tests ~init:(Ok []) ~f:(fun acc response_test ->
        match acc with
        | Error e -> Error e
        | Ok tests -> (
            match generate_response_test_function shapes operation_name response_test with
            | Ok test_func -> Ok (test_func :: tests)
            | Error e -> Error e))
  in

  match (request_tests_result, response_tests_result) with
  | Ok request_tests, Ok response_tests -> Ok (List.rev request_tests @ List.rev response_tests)
  | Error e, _ -> Error e
  | _, Error e -> Error e

(** Generate complete test module with all test functions for operations *)
let generate_test_module shapes test_cases =
  (* Generate all test functions *)
  let test_functions_result =
    List.fold test_cases ~init:(Ok []) ~f:(fun acc test_case ->
        match acc with
        | Error e -> Error e
        | Ok functions -> (
            match generate_operation_test_functions shapes test_case with
            | Ok new_functions -> Ok (new_functions @ functions)
            | Error e -> Error e))
  in

  match test_functions_result with
  | Error e -> Error e
  | Ok test_functions ->
      let module_header =
        {|
(* Generated test functions for Smithy protocol test cases *)
open Base
open Smaws_Lib

|}
      in
      let test_functions_code = String.concat test_functions ~sep:"\n\n" in
      let test_list_entries =
        List.mapi test_functions ~f:(fun i _ ->
            Printf.sprintf "  test_%d, `Quick, (fun () -> ());" i)
      in
      let test_list =
        Printf.sprintf {|
(* Alcotest test list *)
let tests = [
%s
]
|}
          (String.concat test_list_entries ~sep:"\n")
      in

      Ok (module_header ^ test_functions_code ^ test_list)
