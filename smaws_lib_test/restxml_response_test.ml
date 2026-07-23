(** Smoke tests for the restXml runtime protocol module.

    These lock in the two core response paths independently of the smithy compliance fixtures:

    - [parse_response] (the 2xx success path) must hand the [Xmlm.input] to the generated output
      deserializer and return its value. The success fixture below has a trailing newline (as real
      HTTP bodies do) to exercise the boundary at the end of the document's single root element.
    - [parse_error_envelope] (the error path) must recover <Type>/<Code>/ <Message> from inside
      <Error> **and skip the trailing <RequestId> sibling of <Error>** before </ErrorResponse>. The
      error fixture keeps that trailing <RequestId>.

    Two additional cases cover the restXml-specific [noErrorWrapping] envelope (S3 style, root
    <Error> directly) and [parse_error_struct] (positions a generated error-shape deserializer
    inside <Error> and skips the trailing <RequestId> sibling), mirroring the
    aws_query_response_test coverage. *)

(** A realistic restXml success response: a root element named after the operation output, two
    member children, and a trailing newline. *)
let success_body_with_trailing_newline =
  {|<GetXResponse xmlns="https://example.com/">
    <Foo>bar</Foo>
    <Baz>qux</Baz>
</GetXResponse>
|}

(** Error envelope fixture with a trailing <RequestId> sibling of <Error>: [parse_error_envelope]
    must skip it before </ErrorResponse>, otherwise the outer [Read.sequence]'s endTag would see
    <RequestId> and raise [XmlUnexpectedConstruct]. *)
let error_body_with_message_and_trailing_request_id =
  {|<ErrorResponse>
    <Error>
        <Type>Sender</Type>
        <Code>SomeError</Code>
        <Message>boom</Message>
    </Error>
    <RequestId>req-2</RequestId>
</ErrorResponse>
|}

(** S3-style [noErrorWrapping] envelope: <Error> is the root and <RequestId> is a direct child. *)
let no_wrapping_error_body =
  {|<Error>
    <Type>Receiver</Type>
    <Code>NoSuchBucket</Code>
    <Message>nope</Message>
    <RequestId>req-s3</RequestId>
</Error>
|}

let complex_error_body =
  {|<ErrorResponse>
    <Error>
        <Type>Sender</Type>
        <Code>ComplexError</Code>
        <TopLevel>Top level</TopLevel>
        <Nested>
            <Foo>bar</Foo>
        </Nested>
    </Error>
    <RequestId>foo-id</RequestId>
</ErrorResponse>
|}

module RestXml = Smaws_Lib.Protocols.RestXml
module Xml = Smaws_Lib.Xml

let success_path_parses_root_and_returns_value () =
  (* The deserializer consumes the single root element; the runtime must not
     peek past it once consumed, or [Xmlm.peek] raises [Xmlm.Error] at
     end-of-input. *)
  (* The deserializer owns body parsing: it sets up the [Xmlm.input], reads the
     DTD, then consumes the single root element (and must not peek past it, or
     [Xmlm.peek] raises [Xmlm.Error] at end-of-input). [parse_response] wraps this
     in [Xml.Parse.run]. *)
  let deserializer ~body ~headers:_ ~status:_ =
    let open Xml.Parse in
    let i = source_with_encoding ~strip:false ~src:body ~encoding:None in
    Read.dtd i;
    Read.sequence i "GetXResponse" ~ns:"https://example.com/"
      (fun i _ ->
        let r_foo = ref None in
        let r_baz = ref None in
        Structure.scanSequence i [ "Foo"; "Baz" ] (fun tag _ ->
            match tag with
            | "Foo" -> r_foo := Some (Read.element i "Foo" ())
            | "Baz" -> r_baz := Some (Read.element i "Baz" ())
            | _ -> Read.skip_element i);
        (!r_foo, !r_baz))
      ()
  in
  let result =
    RestXml.parse_response ~body:success_body_with_trailing_newline ~headers:[] ~status:200
      ~output_deserializer:deserializer
    |> Result.get_ok
  in
  Alcotest.(check (option string)) "Foo recovered" (Some "bar") (fst result);
  Alcotest.(check (option string)) "Baz recovered" (Some "qux") (snd result)

let error_path_recovers_message_and_skips_trailing_request_id () =
  (* The outer [Read.sequence "ErrorResponse"] must skip the trailing
     <RequestId> sibling of <Error>; scanSequence tolerates it while
     <Message> is recovered. *)
  let error, request_id =
    Result.get_ok
      (RestXml.parse_error_envelope ~body:error_body_with_message_and_trailing_request_id)
  in
  let module E = RestXml.Error in
  Alcotest.(check bool) "errorType is Sender" true (error.E.errorType = E.Sender);
  Alcotest.(check string) "code" "SomeError" error.E.code;
  Alcotest.(check (option string)) "message recovered" (Some "boom") error.E.message;
  Alcotest.(check (option string)) "request_id recovered" (Some "req-2") request_id

let no_wrapping_envelope_recovers_direct_children () =
  (* The S3 [noErrorWrapping] path: <Error> is the root and <RequestId> is a
     direct child read by the same scanSequence. *)
  let error, request_id =
    Result.get_ok (RestXml.parse_error_envelope_nowrapping ~body:no_wrapping_error_body)
  in
  let module E = RestXml.Error in
  Alcotest.(check bool) "errorType is Receiver" true (error.E.errorType = E.Receiver);
  Alcotest.(check string) "code" "NoSuchBucket" error.E.code;
  Alcotest.(check (option string)) "message recovered" (Some "nope") error.E.message;
  Alcotest.(check (option string)) "request_id recovered" (Some "req-s3") request_id

let parse_error_struct_recovers_members_and_skips_request_id () =
  (* A generated error-shape _of_xml uses Structure.scanSequence over <Error>'s
     children, reading its own members and skipping the protocol metadata tags
     (Type/Code). [parse_error_struct] positions the cursor inside <Error> and
     skips the trailing <RequestId> sibling before </ErrorResponse>. *)
  let open Xml.Parse in
  let r_top = ref None in
  let r_foo = ref None in
  let struct_parser i =
    Structure.scanSequence i [ "TopLevel"; "Nested" ] (fun tag _ ->
        match tag with
        | "TopLevel" -> r_top := Some (Read.element i "TopLevel" ())
        | "Nested" ->
            r_foo := Some (Read.sequence i "Nested" (fun i _ -> Read.element i "Foo" ()) ())
        | _ -> Read.skip_element i);
    (!r_top, !r_foo)
  in
  let top, foo =
    Result.get_ok (RestXml.parse_error_struct ~body:complex_error_body ~structParser:struct_parser)
  in
  Alcotest.(check (option string)) "TopLevel recovered" (Some "Top level") top;
  Alcotest.(check (option string)) "Nested/Foo recovered" (Some "bar") foo

let request_id_of_headers_finds_x_amzn_requestid () =
  (* AWS restXml services put the request id in a response header. The name
     varies and is case-insensitive; the first non-empty value wins. *)
  let open RestXml in
  Alcotest.(check (option string))
    "x-amzn-requestid recovered" (Some "req-from-header")
    (request_id_of_headers [ ("x-amzn-requestid", "req-from-header") ]);
  Alcotest.(check (option string))
    "lookup is case-insensitive" (Some "req-camel")
    (request_id_of_headers [ ("X-Amzn-RequestId", "req-camel") ]);
  Alcotest.(check (option string))
    "S3-style x-amz-request-id recovered" (Some "s3-req")
    (request_id_of_headers [ ("x-amz-request-id", "s3-req") ]);
  Alcotest.(check (option string))
    "empty value is skipped" None
    (request_id_of_headers [ ("x-amzn-requestid", "") ]);
  Alcotest.(check (option string))
    "absent header returns None" None
    (request_id_of_headers [ ("content-type", "application/xml") ]);
  Alcotest.(check (option string))
    "x-amzn-requestid wins over a later x-amz-request-id" (Some "first")
    (request_id_of_headers [ ("x-amz-request-id", "second"); ("x-amzn-requestid", "first") ])

let request_id_prefer_header_over_body () =
  (* On error the id is in both the header and the body <RequestId>; the header
     wins, with the body as a fallback when the header is absent. *)
  let open RestXml in
  Alcotest.(check (option string))
    "header wins when both present" (Some "hdr")
    (request_id_prefer_header ~header:(Some "hdr") ~body:(Some "body"));
  Alcotest.(check (option string))
    "body used when header absent" (Some "body")
    (request_id_prefer_header ~header:None ~body:(Some "body"));
  Alcotest.(check (option string))
    "None when both absent" None
    (request_id_prefer_header ~header:None ~body:None);
  Alcotest.(check (option string))
    "header wins even when body is None" (Some "hdr")
    (request_id_prefer_header ~header:(Some "hdr") ~body:None)

let () =
  Alcotest.run "RestXml response parsing"
    [
      ( "success_response",
        [
          ( "parses root and returns deserializer value",
            `Quick,
            success_path_parses_root_and_returns_value );
        ] );
      ( "error_response",
        [
          ( "recovers <Message> and skips trailing <RequestId>",
            `Quick,
            error_path_recovers_message_and_skips_trailing_request_id );
          ( "noErrorWrapping envelope recovers direct children",
            `Quick,
            no_wrapping_envelope_recovers_direct_children );
          ( "parse_error_struct recovers members and skips metadata",
            `Quick,
            parse_error_struct_recovers_members_and_skips_request_id );
        ] );
      ( "request_id",
        [
          ( "request_id_of_headers finds/case-insensitive/empty/absent",
            `Quick,
            request_id_of_headers_finds_x_amzn_requestid );
          ( "request_id_prefer_header prefers header over body",
            `Quick,
            request_id_prefer_header_over_body );
        ] );
    ]
