(* XML round-trip test: write XML, parse it back, verify structure *)

let test_simple_element () =
  let w = Smaws_Lib.Xml.Write.make () in
  Smaws_Lib.Xml.Write.element w "root" (fun w -> Smaws_Lib.Xml.Write.text w "hello");
  let xml_str = Smaws_Lib.Xml.Write.to_string w in
  let expected = "<root>hello</root>" in
  Alcotest.(check string) "simple element" expected xml_str

let test_nested_elements () =
  let w = Smaws_Lib.Xml.Write.make () in
  Smaws_Lib.Xml.Write.element w "parent" (fun w ->
      Smaws_Lib.Xml.Write.element w "child" (fun w -> Smaws_Lib.Xml.Write.text w "value"));
  let xml_str = Smaws_Lib.Xml.Write.to_string w in
  let expected = "<parent><child>value</child></parent>" in
  Alcotest.(check string) "nested elements" expected xml_str

let test_empty_element () =
  let w = Smaws_Lib.Xml.Write.make () in
  Smaws_Lib.Xml.Write.element w "empty" (fun _ -> ());
  let xml_str = Smaws_Lib.Xml.Write.to_string w in
  let expected = "<empty/>" in
  Alcotest.(check string) "empty element" expected xml_str

let test_namespace () =
  let w = Smaws_Lib.Xml.Write.make ~ns_prefix:(fun _ -> Some "") () in
  Smaws_Lib.Xml.Write.element ~ns:"http://example.com" w "root" (fun w ->
      Smaws_Lib.Xml.Write.text w "ns");
  let xml_str = Smaws_Lib.Xml.Write.to_string w in
  let expected = "<root xmlns=\"http://example.com\">ns</root>" in
  Alcotest.(check string) "namespace" expected xml_str

let test_namespace_with_prefix () =
  let w =
    Smaws_Lib.Xml.Write.make
      ~ns_prefix:(function "http://example.com" -> Some "baz" | _ -> None)
      ()
  in
  Smaws_Lib.Xml.Write.element_with_ns w "http://example.com" (Some "baz") "root" (fun w ->
      Smaws_Lib.Xml.Write.text w "prefixed");
  let xml_str = Smaws_Lib.Xml.Write.to_string w in
  let expected = "<baz:root xmlns:baz=\"http://example.com\">prefixed</baz:root>" in
  Alcotest.(check string) "namespace with prefix" expected xml_str

let test_roundtrip () =
  (* Write XML, then parse it back *)
  let w = Smaws_Lib.Xml.Write.make () in
  Smaws_Lib.Xml.Write.element w "Root" (fun w ->
      Smaws_Lib.Xml.Write.element w "Member" (fun w -> Smaws_Lib.Xml.Write.text w "value1");
      Smaws_Lib.Xml.Write.element w "Member" (fun w -> Smaws_Lib.Xml.Write.text w "value2"));
  let xml_str = Smaws_Lib.Xml.Write.to_string w in
  let open Smaws_Lib.Xml.Parse in
  let result =
    run (fun () ->
        let src = source_with_encoding ~strip:true ~src:xml_str ~encoding:None in
        Read.dtd src;
        Read.sequence src "Root"
          (fun i _ ->
            let members = Read.elements i "Member" () in
            Alcotest.(check int) "two members" 2 (List.length members);
            Alcotest.(check string) "first member" "value1" (List.nth members 0);
            Alcotest.(check string) "second member" "value2" (List.nth members 1))
          ())
  in
  match result with Ok () -> () | Error (XmlParseError msg) -> Alcotest.fail msg

let () =
  Alcotest.run "Xml.Write"
    [
      ( "write",
        [
          Alcotest.test_case "simple element" `Quick test_simple_element;
          Alcotest.test_case "nested elements" `Quick test_nested_elements;
          Alcotest.test_case "empty element" `Quick test_empty_element;
          Alcotest.test_case "namespace" `Quick test_namespace;
          Alcotest.test_case "namespace with prefix" `Quick test_namespace_with_prefix;
          Alcotest.test_case "roundtrip" `Quick test_roundtrip;
        ] );
    ]
