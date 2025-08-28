open Base
open Yojson.Basic.Util

type test_case = {
  operation_name : string;
  request_tests : Parselib.Ast.Trait.httpRequestTest list;
  response_tests : Parselib.Ast.Trait.httpResponseTest list;
}

type error_type =
  | ParseError of string
  | ValidationError of string
  | ProtocolMismatch of string * string

let string_of_error = function
  | ParseError msg -> "Parse error: " ^ msg
  | ValidationError msg -> "Validation error: " ^ msg
  | ProtocolMismatch (expected, actual) ->
      Printf.sprintf "Protocol mismatch: expected %s, got %s" expected actual

let extract_traits_from_operation op_json =
  try
    let traits = op_json |> member "traits" in
    let request_tests =
      match traits |> member "smithy.test#httpRequestTests" with
      | `Null -> []
      | tests -> (
          match
            Parselib.Parse.Smithy.parseTestHttpRequestTests
              (Ok { tree = tests; path = "smithy.test#httpRequestTests" })
          with
          | Ok (Parselib.Ast.Trait.TestHttpRequestTests tests) -> tests
          | _ -> [])
    in
    let response_tests =
      match traits |> member "smithy.test#httpResponseTests" with
      | `Null -> []
      | tests -> (
          match
            Parselib.Parse.Smithy.parseTestHttpResponseTests
              (Ok { tree = tests; path = "smithy.test#httpResponseTests" })
          with
          | Ok (Parselib.Ast.Trait.TestHttpResponseTests tests) -> tests
          | _ -> [])
    in
    Ok (request_tests, response_tests)
  with exn -> Error (ParseError (Exn.to_string exn))

let validate_protocol_compatibility expected_protocols test_protocol =
  if List.mem expected_protocols test_protocol ~equal:String.equal then Ok ()
  else Error (ProtocolMismatch (String.concat ~sep:", " expected_protocols, test_protocol))

let validate_request_test (test : Parselib.Ast.Trait.httpRequestTest) =
  if String.is_empty test.id then Error (ValidationError "Test ID cannot be empty")
  else if String.is_empty test.protocol then Error (ValidationError "Protocol cannot be empty")
  else if String.is_empty test.method_ then Error (ValidationError "HTTP method cannot be empty")
  else if String.is_empty test.uri then Error (ValidationError "URI cannot be empty")
  else Ok ()

let validate_response_test (test : Parselib.Ast.Trait.httpResponseTest) =
  if String.is_empty test.id then Error (ValidationError "Test ID cannot be empty")
  else if String.is_empty test.protocol then Error (ValidationError "Protocol cannot be empty")
  else if test.code < 100 || test.code > 599 then Error (ValidationError "Invalid HTTP status code")
  else Ok ()

let validate_test_completeness (request_tests : Parselib.Ast.Trait.httpRequestTest list)
    (response_tests : Parselib.Ast.Trait.httpResponseTest list) =
  let request_ids = List.map request_tests ~f:(fun t -> t.id) in
  let response_ids = List.map response_tests ~f:(fun t -> t.id) in
  let missing_responses =
    List.filter request_ids ~f:(fun id -> not (List.mem response_ids id ~equal:String.equal))
  in
  let missing_requests =
    List.filter response_ids ~f:(fun id -> not (List.mem request_ids id ~equal:String.equal))
  in

  match (missing_responses, missing_requests) with
  | [], [] -> Ok ()
  | mrs, [] when not (List.is_empty mrs) ->
      Error (ValidationError ("Missing response tests for: " ^ String.concat ~sep:", " mrs))
  | [], mqs when not (List.is_empty mqs) ->
      Error (ValidationError ("Missing request tests for: " ^ String.concat ~sep:", " mqs))
  | mrs, mqs ->
      Error
        (ValidationError
           ("Missing tests - responses: " ^ String.concat ~sep:", " mrs ^ ", requests: "
          ^ String.concat ~sep:", " mqs))

let extract_test_cases_from_json json_content =
  try
    let json = Yojson.Basic.from_string json_content in
    let shapes = json |> member "shapes" in
    let operations =
      shapes |> to_assoc
      |> List.filter ~f:(fun (_, shape) ->
             match shape |> member "type" |> to_string_option with
             | Some "operation" -> true
             | _ -> false)
    in

    let extract_operation (op_name, op_json) =
      match extract_traits_from_operation op_json with
      | Ok ([], []) -> Ok None (* No tests found *)
      | Ok (request_tests, response_tests) -> (
          (* Validate individual tests *)
          let validate_all_request_tests =
            List.fold_result request_tests ~init:() ~f:(fun () test -> validate_request_test test)
          in
          let validate_all_response_tests =
            List.fold_result response_tests ~init:() ~f:(fun () test -> validate_response_test test)
          in

          match (validate_all_request_tests, validate_all_response_tests) with
          | Ok (), Ok () -> (
              (* Validate protocol consistency within test suite *)
              let all_protocols =
                List.map request_tests ~f:(fun t -> t.protocol)
                @ List.map response_tests ~f:(fun t -> t.protocol)
              in
              let unique_protocols = List.dedup_and_sort ~compare:String.compare all_protocols in

              match unique_protocols with
              | [] -> Ok None
              | [ protocol ]
                when String.equal protocol "awsJson1_0"
                     || String.equal protocol "awsJson1_1"
                     || String.equal protocol "aws.protocols#awsJson1_0"
                     || String.equal protocol "aws.protocols#awsJson1_1" ->
                  (* For now, allow operations with only request tests or only response tests *)
                  Ok (Some { operation_name = op_name; request_tests; response_tests })
              | [ protocol ] -> Ok None (* Skip unsupported protocols silently *)
              | protocols ->
                  Error
                    (ValidationError
                       ("Mixed protocols not supported: " ^ String.concat ~sep:", " protocols)))
          | Error e, _ | _, Error e -> Error e)
      | Error e -> Error e
    in

    List.fold_result operations ~init:[] ~f:(fun acc operation ->
        match extract_operation operation with
        | Ok (Some test_case) -> Ok (test_case :: acc)
        | Ok None -> Ok acc
        | Error e -> Error e)
  with
  | Yojson.Json_error msg -> Error (ParseError ("JSON parsing failed: " ^ msg))
  | exn -> Error (ParseError (Exn.to_string exn))

let extract_test_cases model_file_path =
  try
    let ic = Stdio.In_channel.create model_file_path in
    let content = Stdio.In_channel.input_all ic in
    Stdio.In_channel.close ic;
    extract_test_cases_from_json content
  with
  | Sys_error msg -> Error (ParseError ("File error: " ^ msg))
  | exn -> Error (ParseError (Exn.to_string exn))
