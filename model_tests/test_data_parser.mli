open Base

(** Test case data structure containing operation name and associated test data *)
type test_case = {
  operation_name : string;
  request_tests : Parselib.Ast.Trait.httpRequestTest list;
  response_tests : Parselib.Ast.Trait.httpResponseTest list;
}

(** Error types that can occur during parsing and validation *)
type error_type =
  | ParseError of string (** Errors during JSON parsing or file reading *)
  | ValidationError of string (** Errors in test case validation *)
  | ProtocolMismatch of string * string (** Protocol incompatibility errors *)

(** Convert error to human-readable string *)
val string_of_error : error_type -> string

(** Extract test cases from Smithy model file
    
    @param model_file_path Path to the Smithy JSON model file
    @return List of test cases or error
    
    This function:
    - Parses the Smithy JSON model
    - Extracts operations with test traits
    - Validates test case completeness and consistency  
    - Supports both awsJson1_0 and awsJson1_1 protocols
    - Ensures request and response tests are paired correctly
*)
val extract_test_cases : string -> (test_case list, error_type) Result.t