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
  Alcotest.(check string) "result parsed from <Result>" "bar" result

let error_response_recovers_message_and_skips_request_id () =
  (* Without the scanSequence + skip_to_end fix this raises Unparseable
     (on the <Message> after <Code>, and/or the trailing <RequestId>), and
     message was always None. *)
  let error =
    AwsQuery.Response.parse_xml_error_response ~body:error_body_with_message_and_request_id
  in
  let module E = AwsQuery.Error in
  Alcotest.(check bool) "errorType is Sender" true (error.E.errorType = E.Sender);
  Alcotest.(check string) "code" "SomeError" error.E.code;
  Alcotest.(check (option string)) "message recovered" (Some "boom") error.E.message

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
        ] );
    ]
