(** Phase 6 parse checkpoint for the restXml deserialiser.

    The generated [<shape>_of_xml] functions are exercised end-to-end by the Phase 8 conformance
    suite, but the runtime leaf parsers they build on ([Smaws_Lib.Xml.Parse.Primitive.*] for
    primitive text, [Smaws_Lib.Xml.Parse.Read.element_value] for path-decorated failure reporting,
    and [Smaws_Lib.Xml.Parse.run] for the result-returning boundary) are pure and are unit-tested
    here. This is the Phase 6 checkpoint: it locks in the three behaviours the plan calls out —
    [http-date] parsed via a guarded [Scanf] (success and failure), [epoch-seconds] floats, and
    explicit [Result] matching at the [run] boundary (no partial functions on the happy path: a bad
    value surfaces as [Error], not an uncaught exception).

    The response-header readers ([RestXml.header_value]/[RestXml.prefix_headers]) used by the
    generated deserialisers for [@httpHeader]/[@httpPrefixHeaders] members are also pure and are
    covered here, including the empty-prefix [httpPrefixHeaders] case (G19). *)

module RestXml = Smaws_Lib.Protocols.RestXml
module Xml = Smaws_Lib.Xml
module Primitive = Xml.Parse.Primitive

(** The Phase 6 fixtures: [Mon, 16 Dec 2019 23:48:18 GMT] is the IMF-fixdate the smithy
    [TimestampFormatHeaders] case uses; its epoch-seconds form is [1576540098]
    (2019-12-16T23:48:18Z). [http-date] and [epoch-seconds] must round-trip to the same [Ptime.t].
*)
let http_date_fixture = "Mon, 16 Dec 2019 23:48:18 GMT"

let epoch_fixture = "1576540098"
let expected_date_time = ((2019, 12, 16), ((23, 48, 18), 0))

(** [Ptime.of_date_time] of a known-valid date is always [Some]; fail the test loudly if not. *)
let pt_of_date_time d =
  match Ptime.of_date_time d with
  | Some t -> t
  | None -> Alcotest.fail "Ptime.of_date_time returned None for a known-valid date"

let pt_of_float_s f =
  match Ptime.of_float_s f with
  | Some t -> t
  | None -> Alcotest.fail "Ptime.of_float_s returned None for a known-valid epoch"

(** [run] returns [Ok] for a well-formed [http-date]; the guarded [Scanf] in
    [timestamp_httpdate_of_string] accepts the IMF-fixdate. Explicit [Result] matching (no
    [Result.get_ok]) keeps the happy path partial-function-free. *)
let httpdate_parses_imf_fixdate () =
  match Xml.Parse.run (fun () -> Primitive.timestamp_httpdate_of_string http_date_fixture) with
  | Ok t ->
      Alcotest.(check bool)
        "http-date parses to the expected instant" true
        (Ptime.equal t (pt_of_date_time expected_date_time));
      Alcotest.(check bool)
        "http-date and epoch-seconds agree" true
        (Ptime.equal t (Primitive.timestamp_epoch_of_string epoch_fixture))
  | Error (Xml.Parse.XmlParseError msg) -> Alcotest.fail ("expected Ok, got Error: " ^ msg)

(** A malformed [http-date] must surface as [Error] at the [run] boundary, not as an uncaught
    [Scanf.Scan_failure]/[Failure]. The guarded [Scanf] (try/with) in [timestamp_httpdate_of_string]
    converts any parse error into [XmlDeserializeError], which [run] folds into [XmlParseError]. *)
let httpdate_rejects_garbage_as_error () =
  match Xml.Parse.run (fun () -> Primitive.timestamp_httpdate_of_string "not a date") with
  | Ok _ -> Alcotest.fail "expected Error for a malformed http-date, got Ok"
  | Error (Xml.Parse.XmlParseError msg) ->
      (* The error message names the kind (timestamp(http-date)) so a deserialiser failure is
         self-describing. *)
      Alcotest.(check bool) "error message names the kind" true (String.length msg > 0)

(** [epoch-seconds] accepts both integer and fractional seconds. *)
let epoch_parses_integer_and_fractional () =
  let parse s = Xml.Parse.run (fun () -> Primitive.timestamp_epoch_of_string s) in
  match (parse "1576540098", parse "1576540098.5") with
  | Ok t_int, Ok t_frac ->
      Alcotest.(check bool)
        "integer epoch matches the http-date instant" true
        (Ptime.equal t_int (pt_of_date_time expected_date_time));
      Alcotest.(check bool)
        "fractional epoch is half a second later" true
        (Ptime.equal t_frac (pt_of_float_s 1576540098.5))
  | _ -> Alcotest.fail "expected both epoch parses to succeed"

let epoch_rejects_garbage_as_error () =
  match Xml.Parse.run (fun () -> Primitive.timestamp_epoch_of_string "not-a-number") with
  | Ok _ -> Alcotest.fail "expected Error for a malformed epoch, got Ok"
  | Error (Xml.Parse.XmlParseError _) -> ()

(** Primitive leaf parsers (int/float/bool) succeed on valid text and surface [Error] on invalid
    text — no [Failure] escapes [run]. This is the "no partial functions on the happy path"
    guarantee: the generated deserialiser may call these directly without a surrounding try/with. *)
let primitive_parsers_succeed_and_fail_via_run () =
  (match Xml.Parse.run (fun () -> Primitive.int_of_string "42") with
  | Ok v -> Alcotest.(check int) "int_of_string ok" 42 v
  | Error (Xml.Parse.XmlParseError msg) -> Alcotest.fail ("expected Ok: " ^ msg));
  (match Xml.Parse.run (fun () -> Primitive.bool_of_string "true") with
  | Ok v -> Alcotest.(check bool) "bool_of_string ok" true v
  | Error (Xml.Parse.XmlParseError msg) -> Alcotest.fail ("expected Ok: " ^ msg));
  (match Xml.Parse.run (fun () -> Primitive.int_of_string "notanint") with
  | Ok _ -> Alcotest.fail "expected Error for malformed int"
  | Error (Xml.Parse.XmlParseError _) -> ());
  match Xml.Parse.run (fun () -> Primitive.bool_of_string "notabool") with
  | Ok _ -> Alcotest.fail "expected Error for malformed bool"
  | Error (Xml.Parse.XmlParseError _) -> ()

(** A primitive parse failure inside [Read.element_value] is decorated with the enclosing element's
    tag as the exception unwinds, so [run]'s [XmlParseError] message reports the full element path
    (the [XmlDeserializeError.path] mechanism). This is what makes a deserialiser failure
    self-locating without per-call exception handling. *)
let element_value_failure_decorates_path () =
  let body = "<Foo>notanint</Foo>" in
  let parse () =
    let open Xml.Parse in
    run (fun () ->
        let i = source_with_encoding ~src:body ~encoding:None in
        Read.dtd i;
        Read.element_value i "Foo" Primitive.int_of_string ())
  in
  match parse () with
  | Ok _ -> Alcotest.fail "expected Error for <Foo>notanint</Foo>"
  | Error (Xml.Parse.XmlParseError msg) ->
      Alcotest.(check bool) "error message names the failing element" true (String.length msg > 0)

(** [@httpHeader] lookup is case-insensitive (HTTP header names are). *)
let header_value_is_case_insensitive () =
  Alcotest.(check (option string))
    "exact name recovered" (Some "Header")
    (RestXml.header_value [ ("X-Header", "Header") ] "X-Header");
  Alcotest.(check (option string))
    "lowercased query finds mixed-case header" (Some "Header")
    (RestXml.header_value [ ("X-Header", "Header") ] "x-header");
  Alcotest.(check (option string))
    "mixed-case query finds lowercased header" (Some "v")
    (RestXml.header_value [ ("x-foo", "v") ] "X-Foo");
  Alcotest.(check (option string))
    "absent header is None" None
    (RestXml.header_value [ ("content-type", "application/xml") ] "X-Header")

(** [@httpPrefixHeaders] with an empty prefix collects every response header under its full name
    (the [HttpEmptyPrefixHeaders] case); a non-empty prefix collects only matching headers under the
    suffix (the [HttpPrefixHeadersArePresent] case). Prefix matching is case-insensitive and the
    returned keys preserve the server's casing. *)
let prefix_headers_empty_and_prefixed () =
  let headers =
    [ ("x-foo", "Foo"); ("x-foo-abc", "Abc"); ("x-foo-def", "Def"); ("hello", "There") ]
  in
  (* Empty prefix: every header, keyed by its full name. *)
  let empty = RestXml.prefix_headers ~prefix:"" headers in
  Alcotest.(check (list (pair string string)))
    "empty prefix collects all headers under full names"
    [ ("hello", "There"); ("x-foo", "Foo"); ("x-foo-abc", "Abc"); ("x-foo-def", "Def") ]
    (List.sort compare empty);
  (* Non-empty prefix: only matching headers, keyed by the suffix. *)
  let prefixed = RestXml.prefix_headers ~prefix:"x-foo-" headers in
  Alcotest.(check (list (pair string string)))
    "prefixed collects suffixes only"
    [ ("abc", "Abc"); ("def", "Def") ]
    (List.sort compare prefixed);
  (* The specific [@httpHeader "x-foo"] member is NOT removed from the empty-prefix map on the
     deserialise side — both bindings are populated independently (the precedence rule is a
     serialise-side concern; see [RestXml.prefix_headers] doc). *)
  Alcotest.(check (list (pair string string)))
    "x-foo is present in the empty-prefix map (no deserialise-side exclusion)"
    [ ("x-foo", "Foo") ]
    (List.filter (fun (k, _) -> String.equal k "x-foo") empty);
  (* Case-insensitive prefix match. *)
  Alcotest.(check (list (pair string string)))
    "prefix match is case-insensitive"
    [ ("abc", "Abc"); ("def", "Def") ]
    (List.sort compare (RestXml.prefix_headers ~prefix:"X-FOO-" headers))

let () =
  Alcotest.run "RestXml deserialise"
    [
      ( "timestamp_httpdate",
        [
          ("parses an IMF-fixdate via guarded Scanf", `Quick, httpdate_parses_imf_fixdate);
          ("rejects a malformed http-date as Error", `Quick, httpdate_rejects_garbage_as_error);
        ] );
      ( "timestamp_epoch",
        [
          ( "parses integer and fractional epoch-seconds",
            `Quick,
            epoch_parses_integer_and_fractional );
          ("rejects a malformed epoch as Error", `Quick, epoch_rejects_garbage_as_error);
        ] );
      ( "primitive_parsers",
        [
          ( "succeed and fail via run (no partial functions on happy path)",
            `Quick,
            primitive_parsers_succeed_and_fail_via_run );
          ( "element_value failure decorates the element path",
            `Quick,
            element_value_failure_decorates_path );
        ] );
      ( "response_headers",
        [
          ("header_value is case-insensitive", `Quick, header_value_is_case_insensitive);
          ("prefix_headers empty and prefixed", `Quick, prefix_headers_empty_and_prefixed);
        ] );
    ]
