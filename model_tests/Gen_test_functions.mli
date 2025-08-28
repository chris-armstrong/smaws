(** Test function generator for Smithy protocol test cases *)

open Base

(** Test function generation errors *)
type test_function_error =
  | ConstructorError of Gen_test_constructors.constructor_error
  | InvalidTestCase of string
  | MockSetupError of string

val string_of_test_function_error : test_function_error -> string

val generate_request_test_function :
  (string, Parselib.Ast.Shape.t, String.comparator_witness) Map.t ->
  string ->
  Parselib.Ast.Trait.httpRequestTest ->
  (string, test_function_error) Result.t
(** Generate a request test function for a single test case *)

val generate_response_test_function :
  (string, Parselib.Ast.Shape.t, String.comparator_witness) Map.t ->
  string ->
  Parselib.Ast.Trait.httpResponseTest ->
  (string, test_function_error) Result.t
(** Generate a response test function for a single test case *)

val generate_operation_test_functions :
  (string, Parselib.Ast.Shape.t, String.comparator_witness) Map.t ->
  Test_data_parser.test_case ->
  (string list, test_function_error) Result.t
(** Generate all test functions for an operation's test cases *)

val generate_test_module :
  (string, Parselib.Ast.Shape.t, String.comparator_witness) Map.t ->
  Test_data_parser.test_case list ->
  (string, test_function_error) Result.t
(** Generate complete test module with all test functions for operations *)
