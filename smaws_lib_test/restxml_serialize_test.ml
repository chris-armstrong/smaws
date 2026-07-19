(** Phase 5 round-trip / parse-back checkpoint for the restXml request-body serializer.

    The generated [<shape>_to_xml] functions are exercised end-to-end by the Phase 8 conformance
    suite, but the runtime helpers they build on ([Smaws_Lib.Protocols.RestXml.Serialize.*] for
    float/timestamp text and [Smaws_Lib.Xml.Write] for namespaced/attributed/empty elements) are
    pure and can be unit-tested here. This catches the Phase 5 failure modes the plan calls out —
    [%.6f]-vs-[%g] truncation, [NaN]/[Infinity]/[-Infinity] sentinel strings, and empty-container
    rendering — before Phase 8, so a serializer regression surfaces as a small focused failure
    rather than a conformance-suite-wide red. *)

module RestXml = Smaws_Lib.Protocols.RestXml
module Xml = Smaws_Lib.Xml
module Serialize = RestXml.Serialize

let parse_text_inside ~root body =
  (* Parse [body] and read the text content of its single [root] element, so a
     written element round-trips through [Xml.Parse] and the recovered text
     matches what the serializer produced. Returns [Error msg] on parse failure
     so a test can [Result.get_ok]. *)
  let open Xml.Parse in
  run (fun () ->
      let src = source_with_encoding ~src:body ~encoding:None in
      Read.dtd src;
      Read.element src root ())

let float_text_roundtrips_as_round_decimal () =
  (* The serializer must emit a round-trip-safe decimal, not %g's 6-sig-fig
     truncation: 1.234567890123456789 must not collapse to "1.23457". *)
  let s = Serialize.float_field_to_string 1.234567890123456789 in
  Alcotest.(check bool)
    "round-trip preserves double precision" true
    (Float.equal (Float.of_string s) 1.234567890123456789);
  Alcotest.(check string) "common value uses short form" "5.5" (Serialize.float_field_to_string 5.5)

let float_sentinel_strings () =
  (* restXml serializes the non-numeric IEEE sentinels as their literal
     strings (SimpleScalarProperties conformance). *)
  Alcotest.(check string) "NaN" "NaN" (Serialize.float_field_to_string Float.nan);
  Alcotest.(check string) "Infinity" "Infinity" (Serialize.float_field_to_string Float.infinity);
  Alcotest.(check string)
    "-Infinity" "-Infinity"
    (Serialize.float_field_to_string Float.neg_infinity)

let write_element_roundtrips_through_parse () =
  (* A namespaced element with text round-trips: [Xml.Write] emits
     [<root xmlns="uri">text</root>] and [Xml.Parse.Read.sequence ~ns:"uri"]
     recovers the text. This is the shape the restXml serializer uses for
     [@xmlNamespace]-bearing members. *)
  let w = Xml.Write.make () in
  Xml.Write.element ~ns:"http://example.com" w "root" (fun w -> Xml.Write.text w "hello");
  let body = Xml.Write.to_string w in
  Alcotest.(check string)
    "namespaced element emitted" "<root xmlns=\"http://example.com\">hello</root>" body;
  let recovered = Result.get_ok (parse_text_inside ~root:"root" body) in
  Alcotest.(check string) "text round-trips through parse" "hello" recovered

let write_prefixed_namespace_element () =
  (* A prefixed namespace element ([xmlns:baz="..." / baz:foo]) — the form
     used when [@xmlNamespace] carries a [prefix] (XmlNamespaces conformance). *)
  let w = Xml.Write.make ~ns_prefix:(function "http://baz.com" -> Some "baz" | _ -> None) () in
  Xml.Write.element_with_ns w "http://baz.com" (Some "baz") "foo" (fun w -> Xml.Write.text w "Foo");
  let body = Xml.Write.to_string w in
  Alcotest.(check string)
    "prefixed namespace element emitted" "<baz:foo xmlns:baz=\"http://baz.com\">Foo</baz:foo>" body

let write_attributed_element () =
  (* An element with an attribute (the form [member_value_expr] emits for a
     structure member whose target carries an [@xmlAttribute] member). The
     attribute name embeds its prefix via the member's [@xmlName] (e.g.
     "xsi:someName"). *)
  let w = Xml.Write.make () in
  Xml.Write.element ~attrs:[ ("xsi:someName", "nestedAttrValue", None) ] w "Nested" (fun _ -> ());
  let body = Xml.Write.to_string w in
  Alcotest.(check string)
    "attributed element emitted" "<Nested xsi:someName=\"nestedAttrValue\"/>" body

let write_empty_container_element () =
  (* Empty containers serialize as empty elements (not omitted) —
     XmlEmptyLists / XmlEmptyMaps conformance. An empty list's wrapping
     element is [<tag></tag>] (the [List.iter] body writes nothing). *)
  let w = Xml.Write.make () in
  Xml.Write.element w "stringList" (fun w ->
      List.iter
        (fun (item : string) -> Xml.Write.element w "member" (fun w -> Xml.Write.text w item))
        []);
  let body = Xml.Write.to_string w in
  Alcotest.(check string) "empty container renders as empty element" "<stringList/>" body

let () =
  Alcotest.run "RestXml serialize"
    [
      ( "float_text",
        [
          Alcotest.test_case "float round-trips as round decimal" `Quick
            float_text_roundtrips_as_round_decimal;
          Alcotest.test_case "NaN/Infinity sentinel strings" `Quick float_sentinel_strings;
        ] );
      ( "write_roundtrip",
        [
          Alcotest.test_case "namespaced element round-trips through parse" `Quick
            write_element_roundtrips_through_parse;
          Alcotest.test_case "prefixed namespace element" `Quick write_prefixed_namespace_element;
          Alcotest.test_case "attributed element" `Quick write_attributed_element;
          Alcotest.test_case "empty container element" `Quick write_empty_container_element;
        ] );
    ]
