# restXml protocol — implementation todo

Tracking file for the work described in `restxml-protocol.md`.
**No restXml-specific implementation has started.** The
`claude/awsquery-protocol-support-umievv` (post-fix AwsQuery) branch has been
merged into `restxml`, providing reusable infra (context-based `AwsQuery.request`,
`Protocol.t` dispatch, `AwsProtocolQuery.ml` codegen template, `bannedTests`,
protocol-aware response-test codegen). Check off phases as they are reviewed and
landed. Run `dune build` + `dune fmt` at each checkpoint; `dune runtest` where
noted. Stop and wait for developer review between phases (per AGENTS.md).

## Decisions (resolved 2026-07-15)
- [x] D1 requestCompression tests — **ban** the 2 restXml IDs (out of scope;
      unbanned when `add_request_compression.md` lands).
- [x] D2 scope — **full conformance** for both namespaces (fold all spec-audit
      gaps into the phased plan).

## Phase 0 — AST & parser (G1–G6, G6b–G6d)
- [ ] Widen `Trait.ml`: `HttpTrait of httpTrait`, `HttpHeaderTrait of string`,
      `HttpQueryTrait of string`, `EndpointTrait of endpointTrait`,
      `AwsProtocolRestXmlTrait of restXmlConfig`,
      `ApiXmlNamespaceTrait of xmlNamespaceConfig` (uri + **prefix**),
      add `InternalTrait`, `HttpResponseCodeTrait`, `IdempotencyTokenTrait`.
- [ ] Update `Smithy.ml` parser for `http`/`httpHeader`/`httpQuery`/`endpoint`/
      `internal`/`restXml`/`xmlNamespace`(+prefix)/`httpResponseCode`/
      `idempotencyToken`.
- [ ] Update all consumers (`Service_metadata.ml`, `SmithyHelpers.ml`,
      `protocol.ml:of_service`, grep `ApiXmlNamespaceTrait`/`HttpTrait`/...).
- [ ] `dune build` green; `dune runtest` (AwsJson/AwsQuery regressions).

## Phase 1 — XML printer (G7)
- [ ] Add `Xml.Write` (+ `.mli`, on `Xmlm.make_output`) to `smaws_lib/Xml.ml`;
      support `xmlns:prefix`.
- [ ] Round-trip unit test vs `Xml.Parse` (cover `xmlns:prefix`).
- [ ] `dune build` + `dune runtest smaws_lib_test`.

## Phase 2 — HTTP binding helpers (G8)
- [ ] Percent-encode (path segment — greedy keeps `/`; query param),
      `{label}` substitution, query-list merge with `httpQuery` precedence,
      host-prefix substitution.
- [ ] Unit tests (greedy-slash, precedence, list-valued query maps).
- [ ] `dune build`.

## Phase 3 — Runtime `RestXml` module (G9)
- [ ] `smaws_lib/protocols_impl/RestXml.ml` (+ `.mli`) + register in
      `Protocols.ml`.
- [ ] Context-based `request` (mirror merged `AwsQuery.request`); status
      dispatch; error envelope (default + `noErrorWrapping`) with
      **skip-siblings** and **`Failure` catch**; signing.
- [ ] Separate `RestXml.Error` (NOT folded into `AwsErrors`).
- [ ] Mock smoke test (success + error); error mock MUST include a trailing
      `<RequestId>` sibling of `<Error>`. `dune build` + `dune runtest`.

## Phase 4 — Codegen dispatch (GC2)
- [ ] Add `RestXml` to `Protocol.t`; `of_service` mapping (no `failwith`).
- [ ] Branch `gen_operations`/`gen_serialisers`/`gen_deserialisers`.
- [ ] `codegen/Modules.ml` literals (`protocolRestXml`, `xml`, `xmlWrite`,
      `xmlParse`).
- [ ] `dune build`.

## Phase 5 — Codegen `RestXml.Serialiser` (§7.1; G13–G16, G21, G22)
- [ ] `<shape>_to_xml` for all kinds with `xmlName`/`xmlAttribute`/
      `xmlFlattened`/`xmlNamespace` (prefix + service-level + on list/map/
      members)/per-binding `timestampFormat`/NaN-Float/**enum**/**raw-payload-
      blob**/**structure-root-element**/empty+null handling.
- [ ] `dune build` + **round-trip/parse-back test** (catches `%.6f`-vs-`%g`,
      NaN/Infinity, empty containers here).

## Phase 6 — Codegen `RestXml.Deserialiser` (§7.2; G6c, G19)
- [ ] `<shape>_of_xml` (consumes `Xmlm.input` + headers); `httpHeader`/
      `httpPrefixHeaders` (empty prefix + precedence)/`httpResponseCode`/
      `httpPayload` response. No partial functions on the happy path.
- [ ] `dune build` + **parse unit test** (http-date guarded `Scanf`, epoch
      float, explicit `Result` matching).

## Phase 7 — Codegen `RestXml.Operations` (§7.3; G17, G18, G20, G23, G6d)
- [ ] Per-operation `request` with greedy labels, `httpQuery`/`httpQueryParams`
      precedence (+ list-valued maps), `httpHeader`/`httpPrefixHeaders`
      precedence, `endpoint`/`hostLabel` host-prefix, `idempotencyToken`
      auto-fill, `Code` error dispatch (`String.equal`).
- [ ] `dune build`; a generated restXml SDK compiles end-to-end.

## Phase 8 — Conformance tests (§8; G10–G12)
- [ ] Add `aws.protocoltests.restxml -> Restxml` to `model_tests/gen.ml`.
- [ ] restXml request-test path (own mock; no hardcoded `application/json`).
- [ ] Protocol-aware body comparison (XML testable) in `gen_protocol_tests.ml`.
- [ ] Add `SDKAppliedContentEncoding_restXml` +
      `SDKAppendedGzipAfterProvidedEncoding_restXml` to `bannedTests`.
- [ ] `dune runtest model_tests` green for both namespaces modulo the 2 banned
      tests.

## Phase 9 — Polish
- [ ] `dune fmt`.
- [ ] Generate + compile an S3 / CloudFront SDK (exercises `noErrorWrapping`).
- [ ] Remove temporary stubs.

## Open decisions (resolved 2026-07-15 — see plan §10)
- [x] Q1 path-template substitution location — **codegen**
- [x] Q2 output filenames — **xml_serializers.ml / xml_deserializers.ml**
- [x] Q3 httpPayload-structure body-root — structure's own root element IS body
- [x] Q4 shared Error.t — **keep separate** from `AwsErrors`
- [x] Q5 ALPN http/eventStreamHttp — **skip**
- [x] Q6 new dependencies — **none**