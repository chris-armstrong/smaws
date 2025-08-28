open Base
open Model_tests.Test_data_parser

let test_extract () =
  let model_file = "/home/chris/dev/smaws/smithy-aws-protocol-tests_model.json" in
  match extract_test_cases model_file with
  | Ok test_cases ->
      Stdio.printf "Successfully extracted %d test cases:\n" (List.length test_cases);
      List.iter test_cases ~f:(fun tc ->
          Stdio.printf "- Operation: %s (req: %d, resp: %d)\n" tc.operation_name
            (List.length tc.request_tests) (List.length tc.response_tests))
  | Error err -> Stdio.printf "Error: %s\n" (string_of_error err)

let () = test_extract ()
