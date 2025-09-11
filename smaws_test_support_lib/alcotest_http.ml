type input_body = Smaws_Lib.Http.input_body [@@deriving show, eq]

let input_body_testable = Alcotest.option (Alcotest.testable pp_input_body equal_input_body)

(** A testable for comparing HTTP header output. Specifically, [expected] is a list of expected
    header names which need to be present in [actual].

    Keys are case-insensitive. Extra headers in actual are ignored *)
let headers_eq expected actual =
  List.for_all
    (fun (k, v) ->
      List.exists
        (fun (k', v') ->
          let has_key = String.equal (String.lowercase_ascii k) (String.lowercase_ascii k') in
          let has_value = String.equal v v' in
          has_key && has_value)
        actual)
    expected

let headers_pp = Fmt.(list (pair string string))
let headers_testable = Alcotest.testable headers_pp headers_eq
let method_testable = Alcotest.testable Smaws_Lib.Http.pp_method_ Smaws_Lib.Http.equal_method_

(** A testable for comparing Smithy URIs - only compares the path component *)
let uri_testable =
  Alcotest.testable
    (fun fmt uri -> Fmt.pf fmt "%s" (Uri.path uri))
    (fun exp actual -> String.equal (Uri.path exp) (Uri.path actual))
