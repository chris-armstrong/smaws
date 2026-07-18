(* Verifies the XML deserialiser reports the failing element path when a leaf
   value cannot be parsed. The path is built allocation-free by
   [Read.sequence]/[Read.element_value] decorating [XmlDeserializeError] as it
   unwinds (see Xml.ml). *)

let parse body parser =
  let open Smaws_Lib.Xml.Parse in
  run (fun () ->
      let src = source_with_encoding ~src:body ~encoding:None in
      Read.dtd src;
      parser src)

let err_msg = function Smaws_Lib.Xml.Parse.XmlParseError m -> m

let contains sub s =
  (* stdlib has no String.contains_substring; a tiny suffix-safe scan. *)
  let n = String.length s and m = String.length sub in
  if m = 0 then true
  else if m > n then false
  else (
    let last = n - m in
    let rec loop i = i <= last && (String.sub s i m = sub || loop (i + 1)) in
    loop 0)

let test_primitive_failure_reports_element () =
  (* <root><doubleValue>notafloat</doubleValue></root> — the float converter
     raises, [Read.element_value] decorates with "doubleValue", [Read.sequence]
     with "root". *)
  let body = "<root><doubleValue>notafloat</doubleValue></root>" in
  let open Smaws_Lib.Xml.Parse in
  let result =
    parse body (fun src ->
        Read.sequence src "root"
          (fun i _ -> Read.element_value i "doubleValue" Primitive.float_of_string ())
          ())
  in
  match result with
  | Ok _ -> Alcotest.fail "expected a parse error"
  | Error e ->
      let msg = err_msg e in
      Alcotest.(check bool)
        "mentions invalid float at root/doubleValue" true
        (contains "invalid float at root/doubleValue" msg)

let test_int_failure_reports_element () =
  let body = "<container><count>xx</count></container>" in
  let open Smaws_Lib.Xml.Parse in
  let result =
    parse body (fun src ->
        Read.sequence src "container"
          (fun i _ -> Read.element_value i "count" Primitive.int_of_string ())
          ())
  in
  match result with
  | Ok _ -> Alcotest.fail "expected a parse error"
  | Error e ->
      let msg = err_msg e in
      Alcotest.(check bool)
        "mentions invalid integer at container/count" true
        (contains "invalid integer at container/count" msg)

let test_valid_parse_unaffected () =
  let body = "<root><doubleValue>3.14</doubleValue></root>" in
  let open Smaws_Lib.Xml.Parse in
  let result =
    parse body (fun src ->
        Read.sequence src "root"
          (fun i _ -> Read.element_value i "doubleValue" Primitive.float_of_string ())
          ())
  in
  match result with
  | Ok v -> Alcotest.(check (float 1e-9)) "parsed float" 3.14 v
  | Error e -> Alcotest.fail (err_msg e)

let () =
  Alcotest.run "Xml.Parse error reporting"
    [
      ( "errors",
        [
          Alcotest.test_case "primitive failure reports element path" `Quick
            test_primitive_failure_reports_element;
          Alcotest.test_case "int failure reports element path" `Quick
            test_int_failure_reports_element;
          Alcotest.test_case "valid parse unaffected" `Quick test_valid_parse_unaffected;
        ] );
    ]
