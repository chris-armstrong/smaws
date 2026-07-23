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

## Phase 0 — AST & parser (G1–G6, G6b–G6d) — LANDED (commit f4fa179)
- [x] Widen `Trait.ml`: `HttpTrait of httpTrait`, `HttpHeaderTrait of string`,
      `HttpQueryTrait of string`, `EndpointTrait of endpointTrait`,
      `AwsProtocolRestXmlTrait of restXmlConfig`,
      `ApiXmlNamespaceTrait of xmlNamespaceConfig` (uri + **prefix**),
      add `InternalTrait`, `HttpResponseCodeTrait`, `IdempotencyTokenTrait`.
- [x] Update `Smithy.ml` parser for `http`/`httpHeader`/`httpQuery`/`endpoint`/
      `internal`/`restXml`/`xmlNamespace`(+prefix)/`httpResponseCode`/
      `idempotencyToken`.
- [x] Update all consumers (`Service_metadata.ml`, `SmithyHelpers.ml`,
      `protocol.ml:of_service`, grep `ApiXmlNamespaceTrait`/`HttpTrait`/...).
- [x] `dune build` green; `dune runtest` (AwsJson/AwsQuery regressions).

## Phase 1 — XML printer (G7)
- [x] Add `Xml.Write` (+ `.mli`, on `Xmlm.make_output`) to `smaws_lib/Xml.ml`;
      support `xmlns:prefix`.
- [x] Round-trip unit test vs `Xml.Parse` (cover `xmlns:prefix`).
- [x] `dune build` + `dune runtest smaws_lib_test`.

## Phase 2 — HTTP binding helpers (G8)
- [x] Percent-encode (path segment — greedy keeps `/`; query param),
      `{label}` substitution, query-list merge with `httpQuery` precedence,
      host-prefix substitution.
- [x] Unit tests (greedy-slash, precedence, list-valued query maps).
- [x] `dune build`.

## Phase 3 — Runtime `RestXml` module (G9)
- [x] `smaws_lib/protocols_impl/RestXml.ml` (+ `.mli`) + register in
      `Protocols.ml`.
- [x] Context-based `request` (mirror merged `AwsQuery.request`); status
      dispatch; error envelope (default + `noErrorWrapping`) with
      **skip-siblings** and **`Failure` catch**; signing.
- [x] Separate `RestXml.Error` (NOT folded into `AwsErrors`).
- [x] Mock smoke test (success + error); error mock MUST include a trailing
      `<RequestId>` sibling of `<Error>`. `dune build` + `dune runtest`.
- [x] Follow-up (§6.4): request-id recovery — `request_id_of_headers`
      (case-insensitive `x-amzn-requestid`/`x-amz-request-id`/
      `x-amz-requestid`), `request_id_prefer_header` (header over body),
      `request_with_metadata` returning `('out Response.t, 'err *
      Response.metadata) result`; `request` keeps its signature and strips
      metadata. Unit-test the pure helpers.

## Phase 4 — Codegen dispatch (GC2)
- [x] Add `RestXml` to `Protocol.t`; `of_service` mapping (no `failwith`).
- [x] Branch `gen_operations`/`gen_serialisers`/`gen_deserialisers`.
- [x] `codegen/Modules.ml` literals (`protocolRestXml`, `xml`, `xmlWrite`,
      `xmlParse`).
- [x] `dune build`.

## Phase 5 — Codegen `RestXml.Serialiser` (§7.1; G13–G16, G21, G22) — LANDED
- [x] `<shape>_to_xml` for all kinds with `xmlName`/`xmlAttribute`/
      `xmlFlattened`/`xmlNamespace` (prefix + on list/map/members)/per-binding
      `timestampFormat`/NaN-Float/**enum**/empty+null handling — landed:
      - **Mixin flattening (unplanned prerequisite):** `structureShapeDetails`
        gained `mixins`, `parseStructureShape`/`parseUnionShape` parse it,
        `Smithy.resolve_mixins` flattens mixin members + traits (own wins, the
        `@mixin` marker dropped) at parse time. The restXml conformance model
        uses `@mixin` for every *Request/*Response pair; without flattening
        every request body serializer was a no-op. `Trait.type_key` added for
        constructor-level mixin-trait dedup.
      - **member wrapping fix:** all complex members (structure/union/non-
        flattened list/map/set) are now wrapped in their `<tag_name>` element
        (the previous catch-all emitted bare content with no member element,
        and the flattened branches double-wrapped).
      - **`xmlNamespace` (prefix + on list/map/member):** `member_value_expr`
        emits `xmlns`/`xmlns:prefix` on the wrapping element from the member's
        own `@xmlNamespace` or, falling back, the target shape's `@xmlNamespace`
        (list/map shape namespace on its wrapping element). `Xml.Write.element`
        /`element_with_ns` now emit namespaced elements as literal names +
        `xmlns` attrs (no xmlm namespace tracking) so the generated
        `Write.make ()` (no `ns_prefix`) works; the `xml_roundtrip_test`
        `xmlns:prefix` case still passes.
      - **`xmlAttribute`:** `generate_member_expr` skips attribute members as
        child elements; `member_value_expr` collects the target
        structure/union's attribute members into a runtime `attrs` list on the
        wrapping element (option attrs omitted when `None`). Attribute names
        embed any prefix via the member's `@xmlName` (e.g. `xsi:someName`).
      - **NaN/Infinity floats:** `RestXml.Serialize.float_field_to_string`
        emits `NaN`/`Infinity`/`-Infinity` sentinels (mirrors
        `AwsQuery.Serialize.float_field`); `float_to_string` is the
        round-trip-safe `%.6g`-then-`%.17g` form (no `%g` truncation).
      - **enum/intEnum:** already handled by `enum_func_body` (`\`String`→value,
        `\`Int`→`string_of_int`).
      - **flattened list/map:** fixed to emit repeated `<tag_name>` siblings
        (no container wrapper); flattened-map key/value `@xmlName` retained.
      - **empty containers:** render as empty elements (`List.iter` over `[]`
        writes nothing inside the wrapping element). Null `option` members
        are omitted (the `None` branch is a no-op); empty strings preserved.
- [x] `dune build` + **round-trip/parse-back test**
      (`smaws_lib_test/restxml_serialize_test.ml`) — covers `%.6g`-vs-round
      double precision, `NaN`/`Infinity`/`-Infinity` sentinel strings,
      namespaced + prefixed-namespace + attributed + empty-container element
      emission and round-trip through `Xml.Parse`.
- [ ] **Deferred to Phase 7 (not blocking Phase 5):** body-root wrapping +
      service-level `@xmlNamespace`; `@httpPayload` body construction (raw
      blob / raw string / raw enum / structure-with-root-element / `mediaType`
      content-type); top-level `@xmlAttribute` (body-root element's attrs).

## Phase 6 — Codegen `RestXml.Deserialiser` (§7.2; G6c, G19) — LANDED
- [x] No partial functions on the happy path: the leaf parsers in
      `Xml.Parse.Primitive` (`int_of_string`/`float_of_string`/
      `bool_of_string`/`*_of_string`) raise `XmlDeserializeError` (not bare
      `Failure`), which `Xml.Parse.run` folds into `Error (XmlParseError _)`;
      `Read.element_value`/`elements_value` decorate a parse failure with the
      enclosing element's tag as the exception unwinds (the `path` field), so
      the generated deserialiser may call these directly with no surrounding
      try/with. `required` raises `XmlMissingElement` (caught by `run`). The
      `enum_func_body`/`union_func_body` `failwith` and `List.find_map_exn` are
      unhappy-path / codegen-time only (enum members are known at codegen).
- [x] **Runtime response-header readers** for `@httpHeader`/`@httpPrefixHeaders`
      members landed in `smaws_lib/protocols_impl/RestXml.ml`: `header_value`
      (case-insensitive single-header lookup) and `prefix_headers ~prefix`
      (collect headers by case-insensitive prefix; empty prefix → every header
      keyed by its full name, non-empty prefix → suffix as the key, original
      casing preserved). G19's `@httpHeader`-over-`@httpPrefixHeaders`
      precedence is a **serialise-side** rule (verified against the smithy
      fixtures: `HttpEmptyPrefixHeadersResponseClient` deserialises headers
      `{hello:There}` into BOTH `specificHeader=There` AND `prefixHeaders.hello=
      There`; `HttpEmptyPrefixHeadersResponseServer` serialises
      `specificHeader=There` overriding `prefixHeaders.hello=Hello` to the single
      header `hello:There`), so these readers do NOT exclude specifically-bound
      names — the generated deserialiser reads each binding independently.
- [x] `dune build` + **parse unit test** (`smaws_lib_test/restxml_deserialize_test.ml`)
      — covers `timestamp_httpdate_of_string` (guarded `Scanf` success + failure
      → `Error`), `timestamp_epoch_of_string` (integer + fractional epoch float),
      the primitive parsers (int/bool success + failure via `run`), `Read.
      element_value` path decoration, and the response-header readers (case
      insensitivity, empty + non-empty prefix, suffix-as-key). All assertions use
      explicit `Result` matching (no `Result.get_ok`).
- [ ] **Deferred to Phase 7 (coupled with the Operations output wrapper):**
      the codegen WIRING of these readers into the generated output/error
      deserialisers. Per Smithy, `@httpHeader`/`@httpPrefixHeaders`/
      `@httpResponseCode`/`@httpPayload` members only appear on operation
      input/output/error shapes, and the top-level output deserialiser must
      consume the response body's root element (named after the output shape /
      its `@xmlName` / the service-level `@xmlNamespace`) — which the per-shape
      `<shape>_of_xml` (positioned inside its wrapper by the parent's
      `Read.sequence`) cannot do for the body-root case. `@httpPayload`-response
      with a string/blob/enum target must read the raw body (not XML). The
      natural home for the root-consuming + http-overlay + payload-raw wrapper
      is the Phase 7 Operations generator (`generate_request_handler`'s
      `output_deserializer` lambda), which knows the output shape name and
      http-bound member set; it will call the Phase 6 `header_value`/
      `prefix_headers` readers and the existing per-shape `<shape>_of_xml` for
      body members. The runtime `output_deserializer`/`error_deserializer`
      signatures will gain `~headers`/`~status`/`~body` (or a `response_input`
      record) at that point. Phase 6's checkpoint (build + parse unit test) is
      met without this wiring.

## Phase 7 — Codegen `RestXml.Operations` (§7.3; G17, G18, G20, G23, G6d) — LANDED
- [x] Per-operation `request` with greedy labels, `httpQuery`/`httpQueryParams`
      precedence (+ list-valued maps), `httpHeader`/`httpPrefixHeaders`
      precedence, `endpoint`/`hostLabel` host-prefix, `idempotencyToken`
      auto-fill, `Code` error dispatch (`String.equal`).
- [x] Body-root wrapping + service-level `@xmlNamespace` (deferred from Phase 5):
      the non-payload body is wrapped in the input structure's root element
      (shape name / `@xmlName`, structure `@xmlNamespace` or service-level
      default, structure `@xmlAttribute` members as root attrs); `@httpPayload`
      body construction — raw blob (`application/octet-stream` or `mediaType`),
      raw string (`text/plain`), raw enum value (`text/plain`), and
      structure/union (the target's own root element, member `@xmlName` wins,
      then structure `@xmlName`, then shape name).
- [x] Prefixed-`@xmlNamespace` correction: `Serialiser.element_with_namespace`
      now declares `xmlns:prefix` as an attribute and keeps the element name
      unprefixed (conformance wants `<Nested xmlns:xsi=... xsi:someName=...>`,
      not `<xsi:Nested>`). The low-level `Write.element_with_ns` (prefixed
      name) is kept for the round-trip unit tests and is no longer used by
      codegen.
- [x] Runtime: `RestXml.request_with_metadata` expands list-valued query
      entries into repeated `(key, [v])` keys before `Uri.with_query` (the
      `uri` library serialises `(key, [v1; v2])` as `key=v1,v2`, not repeated);
      `Http_bindings.apply_path` overlays a resolved path-with-query string
      onto the base URI (preserves percent-encoded labels and literal query).
- [x] `dune build`; a generated restXml SDK compiles end-to-end (the
      `aws.protocoltests.restxml` namespace). The `restxml.xmlns` namespace is
      generated correctly (service-level namespace verified on the root) but
      has no dune rule yet — wiring it into the build is Phase 8/9.
- [ ] Phase 8 conformance (`dune runtest model_tests`) still fails (170/171) —
      the test harness assumes JSON bodies / hardcodes `application/json` mocks
      (G11/G12). That is Phase 8's scope, not a Phase 7 regression; AwsJson /
      AwsQuery / `smaws_lib_test` / `codegen_test` all stay green.

## Phase 8 — Conformance tests (§8; G10–G12) — LANDED
- [x] `aws.protocoltests.restxml -> Restxml` already in `model_tests/gen.ml`.
- [x] restXml request-test path (own mock, body chosen by output binding, no
      hardcoded `application/json`).
- [x] Protocol-aware body comparison (XML testable, order-insensitive) in
      `gen_protocol_tests.ml` + `Smaws_Test_Support_Lib.Alcotest_http`.
- [x] Banned `SDKAppliedContentEncoding_restXml` /
      `SDKAppendedGzipAfterProvidedEncoding_restXml` (requestCompression OOS),
      `RestXmlHttpPayloadWithUnion` / `RestXmlHttpPayloadWithUnsetUnion`
      (union-payload mock can't pick a member), and
      `InputAndOutputWithTimestampHeaders` (http-date list unsplittable on ", ").
- [x] **Beyond the plan (unavoidable):** wired the response-side deserialiser
      overlay deferred from Phase 6/7 — `output_deserializer`/
      `error_deserializer` gain `~headers`/`~status`, and a per-operation
      deserialiser reads the body root + overlays @httpHeader/@httpPrefixHeaders/
      @httpResponseCode/@httpPayload/@xmlAttribute. Fixed `merge_headers`
      (prefix-includes-separator), @hostLabel body serialisation, and the
      `parseRecord` JSON-object ordering bug (it reversed every object's keys —
      members/enum-values/headers — which restXml conformance exposed; all
      generated SDKs regenerated to declaration order).
- [x] `dune runtest` green: restxml 170/170, query 75/75, json 110/110,
      smaws_lib_test green. (The `restxml.xmlns` namespace is still not wired
      into the build — that is Phase 9.)

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