(** Regression tests for the awsQuery response parsers.

    These lock in two runtime fixes independently of the smithy compliance fixtures, whose
    ok-response fixtures omit <ResponseMetadata> entirely (so the suite never exercised the
    trailing-sibling path that real AWS responses always have):

    - [parse_xml_ok_response] must parse <Result> and skip the trailing <ResponseMetadata> sibling
      before the response end tag (previously raised "unexpected XML construct").
    - [parse_xml_error_response] must tolerate extra <Error> members and skip the trailing
      <RequestId> sibling, and recover the <Message> (previously raised Unparseable; message was
      always None). *)

let ok_body_with_response_metadata =
  {|<GetXResponse xmlns="https://example.com/">
    <GetXResult>
        <Foo>bar</Foo>
    </GetXResult>
    <ResponseMetadata>
        <RequestId>req-1</RequestId>
    </ResponseMetadata>
</GetXResponse>
|}

let error_body_with_message_and_request_id =
  {|<ErrorResponse>
    <Error>
        <Type>Sender</Type>
        <Code>SomeError</Code>
        <Message>boom</Message>
    </Error>
    <RequestId>req-2</RequestId>
</ErrorResponse>
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

module AwsQuery = Smaws_Lib.Protocols.AwsQuery
module Xml = Smaws_Lib.Xml

let ok_response_skips_response_metadata () =
  (* Without the skip_to_end fix this raises XmlUnexpectedConstruct on the
     <ResponseMetadata> sibling. *)
  let result =
    AwsQuery.Response.parse_xml_ok_response ~action:"GetX" ~xmlNamespace:"https://example.com/"
      ~body:ok_body_with_response_metadata ~resultParser:(fun i ->
        Xml.Parse.Read.element i "Foo" ())
  in
  Alcotest.(check string) "result parsed from <Result>" "bar" (Result.get_ok result)

let error_response_recovers_message_and_skips_request_id () =
  (* Without the scanSequence + skip_to_end fix this raises Unparseable
     (on the <Message> after <Code>, and/or the trailing <RequestId>), and
     message was always None. *)
  let error =
    Result.get_ok
      (AwsQuery.Response.parse_xml_error_response ~body:error_body_with_message_and_request_id)
  in
  let module E = AwsQuery.Error in
  Alcotest.(check bool) "errorType is Sender" true (error.E.errorType = E.Sender);
  Alcotest.(check string) "code" "SomeError" error.E.code;
  Alcotest.(check (option string)) "message recovered" (Some "boom") error.E.message

let parse_error_struct_recovers_members_and_skips_metadata () =
  (* A generated error-shape _of_xml uses Structure.scanSequence over <Error>'s
     children, reading its own members and skipping the protocol metadata tags
     (Type/Code). [parse_error_struct] positions the cursor inside <Error> and
     skips the trailing <RequestId> sibling. *)
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
    Result.get_ok
      (AwsQuery.Response.parse_error_struct ~body:complex_error_body ~structParser:struct_parser)
  in
  Alcotest.(check (option string)) "TopLevel recovered" (Some "Top level") top;
  Alcotest.(check (option string)) "Nested/Foo recovered" (Some "bar") foo

let () =
  Alcotest.run "AwsQuery response parsing"
    [
      ( "ok_response",
        [ ("skips <ResponseMetadata> sibling", `Quick, ok_response_skips_response_metadata) ] );
      ( "error_response",
        [
          ( "recovers <Message> and skips <RequestId>",
            `Quick,
            error_response_recovers_message_and_skips_request_id );
          ( "parse_error_struct recovers members and skips metadata",
            `Quick,
            parse_error_struct_recovers_members_and_skips_metadata );
        ] );
    ]
