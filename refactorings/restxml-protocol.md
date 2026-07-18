# Plan: `aws.protocols#restXml` protocol support

> Status: **plan only — no restXml implementation started.** Reviewed and
> revised 2026-07-15 after a three-agent plan review (plan-vs-codebase audit,
> spec-conformance audit, guidelines/risk audit) and after merging the
> `claude/awsquery-protocol-support-umievv` branch (post-fix AwsQuery) into this
> `restxml` branch. All "current-state" claims below were re-verified against the
> merged tree on 2026-07-15.
> Spec: <https://smithy.io/2.0/aws/protocols/aws-restxml-protocol.html>
> Conformance model (vendored): `smithy-aws-protocol-tests_model.json`, namespaces
> `aws.protocoltests.restxml` (service `RestXml`, `restXml = {}` — wrapped
> envelope) and `aws.protocoltests.restxml.xmlns` (service
> `RestXmlWithNamespace`, `restXml = {}`, applies a service-level
> `@xmlNamespace`). `noErrorWrapping` is **not** exercised by either targeted
> namespace; it appears only on `com.amazonaws.s3#AmazonS3` and is needed for the
> Phase 9 S3 SDK goal, not Phase 8 conformance.

This document is the implementation plan for adding the Smithy `restXml` AWS
protocol to the generator. No code was changed for this plan; the merge brought
in reusable AwsQuery infrastructure (see §3) but no restXml-specific code.

---

## 1. Goal and scope

Generate working OCaml SDKs for services that apply `aws.protocols#restXml`
(S3, CloudFront, and the protocol conformance test services), covering:

- HTTP binding traits (`http`, `httpHeader`, `httpLabel`, `httpPayload`,
  `httpQuery`, `httpQueryParams`, `httpPrefixHeaders`, `httpChecksumRequired`,
  `httpError`, `httpResponseCode`, `endpoint`/`hostLabel`).
- XML serialization of request bodies and deserialization of response bodies,
  including the XML-specific traits (`xmlName`, `xmlAttribute`, `xmlFlattened`,
  `xmlNamespace` — including `prefix` and service-level default namespace).
- The `restXml` error-response envelope (`<ErrorResponse>` / `<Error>` /
  `<Type>` / `<Code>` / `<RequestId>`), including the `noErrorWrapping` variant
  (root `<Error>` directly; needed for S3).
- Content-Type derivation (default `application/xml`; `mediaType`/`string`/
  `blob`/`enum` overrides when `httpPayload` targets them).
- Non-numeric float/double sentinel strings (`NaN`, `Infinity`, `-Infinity`),
  including in `@httpLabel` positions.
- Timestamp formats: default differs by binding location — XML body =
    `date-time`; `@httpHeader` = `http-date` (IMF-fixdate); `@httpLabel`/
    `@httpQuery` = `date-time`; overridable by `timestampFormat`.
- `@idempotencyToken` auto-fill (UUID when unset).
- `@httpQuery`-over-`@httpQueryParams` precedence; `@httpQueryParams` targeting
  `map<string, list<string>>`; empty-prefix `@httpPrefixHeaders` and
  `@httpHeader`-over-`@httpPrefixHeaders` precedence.
- Greedy `@httpLabel` must NOT percent-encode `/`.
- Default-value omission for `@internal` members; null/empty-value and
  empty-container handling per the conformance tests.
- Passing the Smithy protocol compliance tests for the two `restxml`
  namespaces (full conformance — see §8 for the `requestCompression` carve-out).

**Out of scope for this plan** (call out separately if/when requested):
event streams (`eventStreamHttp`, Amazon Event Stream format) and
`requestCompression` integration (separate in-progress plan,
`add_request_compression.md`). `document` shapes are **not supported** by this
protocol per spec and will be rejected at codegen.

### requestCompression carve-out (decision, 2026-07-15)

The `aws.protocoltests.restxml` namespace contains `PutWithContentEncoding`,
which carries `@requestCompression({encodings:["gzip"]})` and two
`httpRequestTest`s: `SDKAppliedContentEncoding_restXml` and
`SDKAppendedGzipAfterProvidedEncoding_restXml`. requestCompression is out of
scope for this plan. The trait is already parsed
(`RequestCompressionTrait of string list`) and the `` `Compressed ``
`input_body` variant exists, but the codegen that actually compresses request
bodies was stripped (commit `538051f`) and is not wired. **Decision: add those
two test IDs to `bannedTests`** in `sdkgen/gen_protocol_tests.ml` (the mechanism
already exists, currently AwsJson-only). They get unbanned when the
requestCompression plan lands. Phase 8's exit criterion is "green for both
restXml namespaces modulo the two banned requestCompression tests."

### Confirmed scope additions from the 2026-07-15 spec audit (decision: full conformance)

The following were missing from the original plan and are now in scope because
the conformance model exercises them: `@httpResponseCode`;
`@idempotencyToken` auto-fill; enum/intEnum serialization (incl. enum-as-
`httpPayload`); per-binding timestamp defaults; `@httpQuery`/`@httpQueryParams`
precedence; greedy-label `/` non-encoding; empty-prefix `@httpPrefixHeaders`
+ httpHeader-over-prefix precedence; `httpQueryParams` targeting
`map<string, list<string>>`; null/empty/empty-container handling;
`xmlNamespace` `prefix` and service-level default namespace; `xmlNamespace` on
list/map shapes and on members; `endpoint`/`hostLabel` host-prefix
substitution into the generated request.

---

## 2. Spec digest (authoritative behaviors)

### 2.1 The `restXml` service trait
Structure with members `http : [string]`, `eventStreamHttp : [string]`,
`noErrorWrapping : boolean`. Only `noErrorWrapping` changes wire behavior for
us; `http`/`eventStreamHttp` are ALPN hints (informational; client picks first
understood, defaults to `http/1.1`) — **not captured** (Q5 resolved: skip).

### 2.2 Content-Type
- Default `application/xml`.
- If a top-level member is `@httpPayload`:
  - target has `mediaType` → use that value
  - target `string` → `text/plain`
  - target `blob` → `application/octet-stream` (and the body is the **raw** blob, not base64 — see §2.4)
  - target `enum` → `text/plain` (raw enum value text; `HttpEnumPayload`)
  - target `structure`/`union` → `application/xml`
  - `document` → unsupported (reject at codegen).
- No conformance test forbids `Content-Type` on body-less GETs, so a GET with
  no body may still set `application/xml` (conformance-safe).

### 2.3 HTTP bindings
Every operation bound to a `restXml` service **MUST** have `@http` (method +
uri + optional success `code`). Request identification is by
(method, path) match plus Content-Type. URI templates use `{label}` segments
filled from `@httpLabel` members; query string literals embedded in the
`@http` `uri` are preserved. **Greedy labels (`{label+}`) MUST NOT
percent-encode `/`** (`HttpRequestWithGreedyLabelInPath`: `baz:"there/guy"` →
`.../baz/there/guy`). `@httpQuery` binds a member to a query param;
`@httpQueryParams` binds a `map` (possibly `map<string, list<string>>`,
serialized as repeated query keys) to extra query params; `@httpHeader` binds a
member to a header; `@httpPrefixHeaders` binds a map to prefixed headers
(prefix may be `""`, matching all headers); `@httpPayload` promotes a member to
the whole body (skipping XML element wrapping for that member).

**Precedence rules:**
- `@httpQuery` over `@httpQueryParams`: if a key is set by both, the
  `@httpQuery` value wins and the conflicting `@httpQueryParams` entry is
  **dropped** (not duplicated) — `RestXmlQueryPrecedence` expects
  `bar=named`, map's `bar` removed.
- `@httpHeader` over `@httpPrefixHeaders`: a specifically-bound header wins
  over a prefix match on the same name — `HttpEmptyPrefixHeaders`:
  `specificHeader` (`@httpHeader("hello")`) overrides `prefixHeaders.hello`.

**`@httpResponseCode`:** a marker on a structure output member; the response's
HTTP status code is deserialized into that member (`RestXmlHttpResponseCode`,
code 201 → `params.Status = 201`).

### 2.4 XML shape serialization (request bodies & non-payload response parts)
| Smithy type | XML |
|---|---|
| blob | text node, base64 — **except** when targeted by `@httpPayload`, where it is the **raw** value |
| boolean | "true"/"false" |
| byte/short/integer/long | decimal text |
| float/double | decimal text; `NaN`/`Infinity`/`-Infinity` as those strings (also in `@httpLabel` positions — `HttpRequestWithFloatLabels`) |
| bigDecimal/bigInteger | decimal text, scientific notation if needed |
| string | XML-escaped UTF-8 text |
| timestamp | text; **default format depends on binding location**: XML body = `date-time`; `@httpHeader` = `http-date` (IMF-fixdate); `@httpLabel`/`@httpQuery` = `date-time`. Overridable by `timestampFormat` on the member or shape. (`TimestampFormatHeaders` → `X-defaultFormat: Mon, 16 Dec 2019 23:48:18 GMT`; `HttpRequestWithLabelsAndTimestampFormat` → `2019-12-16T23:48:18Z`.) |
| enum / intEnum | the enum value text (`XmlEnums` → `Foo`/`0`/`1`; `XmlIntEnums` → `1`/`2`). As `@httpPayload` → `text/plain`, raw value (`HttpEnumPayload`). |
| list/set | element wrapping each item in `<member>`; `xmlName` (on the member) renames the item element; `xmlFlattened` unwraps items into the container. **For flattened lists, `@xmlName` on the list member has NO effect** (the member's own `@xmlName` names the repeated element; the inner list-member `@xmlName` is ignored). |
| map | element wrapping each pair in `<entry>` with `<key>`/`<value>`; `xmlName` renames key/value elements (never `entry`); `xmlFlattened` unwraps entries into the container. **For flattened maps, key/value `@xmlName` IS retained** (`FlattenedXmlMapWithXmlName` → `K`/`V`). |
| structure | element with one child element per set member named after the member; `xmlName` renames the element — but **only when the structure is the body root** (or a payload); `@xmlName` on a structure does NOT influence the element name when that structure is nested as a member (the member's name is used). `xmlAttribute` renders as an attribute of the container; `xmlNamespace` adds `xmlns`. |
| union | like structure, exactly one member set |

**`xmlNamespace` placement (not just structures):** the trait selector includes
`service, simpleType, list, map, structure, union, member`. `xmlNamespace`
value is `{uri, prefix}` — **`prefix` is required for conformance** (the
original plan's "minor follow-up" classification was wrong; see G6b):
`PayloadWithXmlNamespaceAndPrefix` → `<... xmlns:baz="http://foo.com">`;
`xmlns#SimpleScalarPropertiesInputOutput.Nested` →
`<Nested xmlns:xsi="https://example.com" xsi:someName="...">`. List/map shapes
and list/map members may also carry `xmlNamespace` (`XmlNamespaces`:
`<values xmlns="http://qux.com">`, `<member xmlns="http://bux.com">`). A
**service-level** `@xmlNamespace` (e.g. `RestXmlWithNamespace`,
`uri:"https://example.com"`) is applied to request/response root elements even
when the structure shapes carry no `xmlNamespace` trait:
`<SimpleScalarPropertiesRequest xmlns="https://example.com">`.

**Empty/null handling:** empty containers serialize as empty elements (not
omitted) — `XmlEmptyLists`/`XmlEmptyMaps`/`XmlEmptyStrings`; both self-closed
and open forms accepted on deserialize. Null query/header values are omitted;
empty strings are preserved (`OmitsNullSerializesEmptyString`,
`NullAndEmptyHeadersClient`).

### 2.5 Error response envelope
Default (used by both targeted conformance namespaces):
```xml
<ErrorResponse>
  <Error>
    <Type>Sender|Receiver</Type>
    <Code>{errorShapeName}</Code>
    <Message>...</Message>  <!-- and other error-shape members -->
  </Error>
  <RequestId>...</RequestId>
</ErrorResponse>
```
With `noErrorWrapping` (S3 `AmazonS3` only, not in targeted conformance
namespaces): the outer `<ErrorResponse>` and inner `<Error>` collapse to a
single root `<Error>` containing `Type`, `Code`, the error members, and
`RequestId` directly — e.g. `<Error><Type>Sender</Type><Code>NoSuchBucket</Code>...</Error>`.
This is **definitive** (per spec + S3 conformance), not hedged. Error members
bound via HTTP traits (`httpHeader`, `httpPrefixHeaders`) are read from
headers, not the body. `Code` is the error **shape name** (no namespace);
renaming error shapes is **not permitted** by this protocol.

### 2.6 Default-value omission
Serializers SHOULD omit `@internal` members' default values; deserializers
SHOULD fill zero values for missing `@required` members. Both are **SHOULD**
(not MUST). Note: neither targeted restXml namespace uses `@internal`, so this
is not conformance-blocking for Phase 8 — but `InternalTrait` must still be
parsed and omission supported for spec correctness and the Phase 9 S3/CloudFront
goal.

---

## 3. Current-state inventory (re-verified against the merged tree, 2026-07-15)

### 3.1 Protocol partially wired
- `smaws_lib/Service.ml`: `type protocol = ... | RestXml | ...` — present.
- `smaws_parse/Smithy.ml:246`: `aws.protocols#restXml` parses to
  `Trait.AwsProtocolRestXmlTrait` (bare — **no `noErrorWrapping` captured**, G1).
- `codegen/Service_metadata.ml:21`: emits `Smaws_Lib.Service.RestXml`.
- `sdkgen/SmithyHelpers.ml:10`: `"AWS REST XML"` label.

### 3.2 XML machinery
- `smaws_lib/Xml.ml` is **parse-only** (modules `Parse`/`Read`/`Structure`;
  no `Write`/`Print`). `xmlm` is a dependency of `smaws_lib`
  (`smaws_lib/dune`). `Xml.Parse` is used by `AwsQuery.ml`. **No XML printer
  exists** (G7).

### 3.3 HTTP layer
- `smaws_lib/http/http.mli`: `request` with `method_` poly-variant and
  `input_body = [`None | `String of string | `Compressed of string *
  body_encoding | `Form of (string * string list) list]`. The `` `Compressed ``
  variant exists (requestCompression plumbing) but compression codegen is
  stripped. `uri` package used (`Service.makeUri`, `Uri.encoded_of_query` in
  AwsQuery). Path-template + label substitution + percent-encoding must be
  added (G8).

### 3.4 Runtime protocol module pattern
- `AwsJson.request` and `AwsQuery.request` are now **both context-based**
  (`~context : http_t Context.t`, using `Context.http_type`/`Context.http`/
  `Context.config`). The original plan's caveat that `AwsQuery.request` used a
  non-context API is **stale post-merge** — `AwsQuery.request` is now the
  closer template in both spirit (XML responses, error envelope with `Code`)
  and API shape.
- `AwsQuery.request` signature:
  `let request (type http_t) ~(action:string) ~(xmlNamespace:string)
   ~(service:Service.descriptor) ~(context:http_t Context.t) ...`. It parses
  responses via `Xml.Parse` and builds query-string bodies via
  `Uri.encoded_of_query`. It has `module Error = struct type t =
  { errorType; code } end` and `module Errors` with a default handler.
- **`smaws_lib/AwsErrors.ml` already exists** with the **JSON namespaced**
  error model (`namespaced_error`, `aws_service_error`, `t = \`AWSServiceError
  of ...`). This is a *different* concept from the XML envelope `Error.t`.
  restXml must keep its XML envelope type **separate** (Q4 resolved: do NOT
  fold into `AwsErrors`).

### 3.5 Codegen protocol-module pattern
- `sdkgen/protocol.ml` defines `type t = AwsQuery | AwsJson` and `of_service`,
  which currently `failwith "Unsupported protocol"` for `RestXml`/`Ec2Query`.
  `gen_operations.ml`, `gen_serialisers.ml`, `gen_deserialisers.ml` all
  dispatch on `Protocol.t`. **So GC2's dispatch mechanism now exists**; restXml
  needs adding to `Protocol.t` (as `RestXml`) and a branch in each dispatcher.
- `codegen/AwsProtocolJson.ml` (917 lines) has `Serialiser`/`Deserialiser`/
  `Operations`. **`codegen/AwsProtocolQuery.ml` (1079 lines) now exists and is
  the closer codegen template** for restXml (XML serialiser/deserialiser/
  operations, `Xml.Parse` consumers).
- `codegen/Modules.ml` centralizes module-path literals (`protocolAwsJson`,
  `protocolAwsQuery`, `json`, `jsonSerializeHelpers`, …); no
  `protocolRestXml`/`xml`/`xmlWrite`/`xmlParse` yet.
- `codegen/Service_metadata.ml` produces `let service :
  Smaws_Lib.Service.descriptor` in scope.

### 3.6 Conformance test harness
- `model_tests/gen.ml` lists `aws.protocoltests.restxml.xmlns → Restxml_xmlns`
  and `aws.protocoltests.query → Query`, but **not** plain
  `aws.protocoltests.restxml` (G10 still open).
- `sdkgen/gen_protocol_tests.ml`:
  - **Response tests are now protocol-aware**: `Mock.mock_response ?body ...
    ~status:[%e status_code] ~headers:[%e response_headers_expr]` drives status
    and Content-Type from the test record (so G12 is **resolved for response
    tests**).
  - **Request tests (the AwsJson path) still hardcode the mock response**
    `~status:200 ~headers:[("Content-Type","application/json")]`. restXml
    request-tests need their own mock path (like the existing query path,
    which uses `~status:200 ~headers:[]`) — otherwise an XML deserializer
    parsing the `application/json` mock response will fail (G11/G12 remaining).
  - Body comparison is **JSON** (`Yojson.Basic.from_string`,
    `Smaws_Lib.Json.of_string`, `Alcotest_http.input_body_json_testable`) —
    restXml needs an XML-aware comparison (G11).
  - `TimestampShape _, `Int` and `TimestampShape _, `Float` arms both present.
  - `Mock.last_request ()` is wrapped in `try/with Stack.Empty`.
  - `bannedTests` exists (currently `["SDKAppliedContentEncoding_awsJson1_1";
    "SDKAppendsGzipAndIgnoresHttpProvidedEncoding_awsJson1_1"]`) and is
    applied to both request and response test selection. restXml will add its
    two requestCompression IDs here (§1 carve-out).
  - `appliesTo` filter correctly keeps `Client` (the old inverted-filter bug
    is fixed); `appliesTo` parsing uses `Result`/`CustomError` (the old
    `failwith`-in-`Result.map` is fixed).

### 3.7 Shapes & traits
`smithy_ast/Shape.ml` defines **23** `shapeDescriptor` constructors (the
original plan said "21"; corrected). Members carry `traits : Trait.t list
option` distinct from shape-level traits. `Organize.partitionOperationShapes`
and `Trait.isErrorTrait` exist. `EnumShape` is modeled (enum/intEnum
serialization is a codegen gap, not an AST gap).

### 3.8 requestCompression plumbing (out of scope, but present)
`smithy.api#requestCompression` parses to
`RequestCompressionTrait of string list`; `` `Compressed `` `input_body`
variant and the test-body `Compressed` comparison exist. The codegen that
compresses request bodies is **not** wired (stripped). Out of scope for this
plan; two tests banned (§1).

---

## 4. Gap analysis (concrete, with locations)

### AST / parser gaps (`smithy_ast/Trait.ml`, `smaws_parse/Smithy.ml`)
- **G1 — `restXml` trait drops `noErrorWrapping`.** Bare variant; parser at
  `Smithy.ml:246` discards the value. Need `AwsProtocolRestXmlTrait of
  restXmlConfig`.
- **G2 — `http` trait drops method/uri/code.** Bare `HttpTrait`; parser
  discards the object. Need `HttpTrait of { method_; uri; code : int option }`.
  (Biggest blocker — restXml requires per-operation method + URI template.)
- **G3 — `httpHeader` drops the header name.** Need `HttpHeaderTrait of string`.
- **G4 — `httpQuery` drops the query param name.** Need `HttpQueryTrait of string`.
- **G5 — `endpoint` trait drops `hostPrefix`.** Need
  `EndpointTrait of { hostPrefix : string }`.
- **G6 — `internal` trait not modeled.** Add `InternalTrait` and parser case.
- **G6b — `xmlNamespace` drops `prefix` — BLOCKER (was misclassified minor).**
  `ApiXmlNamespaceTrait of string` stores `uri` only. Conformance requires
  `prefix` (`xmlns:baz=...`, `xsi:someName=...`). Widen to
  `ApiXmlNamespaceTrait of { uri : string; prefix : string option }`.
- **G6c — `httpResponseCode` trait not modeled.** Marker on an output member.
  Add `HttpResponseCodeTrait` + parser case for `smithy.api#httpResponseCode`.
- **G6d — `idempotencyToken` trait not modeled.** Marker on a member. Add
  `IdempotencyTokenTrait` + parser case for `smithy.api#idempotencyToken`.

### Runtime gaps (`smaws_lib/`)
- **G7 — No XML printer.** Add `Xml.Write` on `Xmlm.make_output`.
- **G8 — No HTTP binding assembly helper.** Path-template `{label}`
  substitution (with greedy `/` exception), percent-encode (path segment vs
  query param), query-list merge with `httpQuery`-over-`httpQueryParams`
  precedence, host-prefix substitution for `endpoint`/`hostLabel`.
- **G9 — No `RestXml` runtime protocol module.** Create
  `smaws_lib/protocols_impl/RestXml.ml` (registered in `Protocols.ml`), context-
  based `request` (mirror the merged `AwsQuery.request`), status dispatch,
  error-envelope parse (default + `noErrorWrapping`), signing, `Failure` catch,
  and a separate `RestXml.Error` type (not folded into `AwsErrors`).

### Codegen gaps (`codegen/`, `sdkgen/`)
- **GC1 — No `codegen/AwsProtocolRestXml.ml`.** Mirror `AwsProtocolQuery.ml`
  with `Serialiser`/`Deserialiser`/`Operations`. Element-name resolution must
  consult `xmlName`/`xmlAttribute`/`xmlFlattened`/`xmlNamespace` (incl. prefix
  and service-level default) on each member/shape.
- **GC2 — Dispatch mechanism exists; restXml branch absent.** `Protocol.t`
  must gain `RestXml`; `of_service` must map `AwsProtocolRestXmlTrait` to it;
  `gen_operations`/`gen_serialisers`/`gen_deserialisers` need a `RestXml` branch.
- **GC3 — Operations generator must emit HTTP-binding call data.** Method,
  resolved uri (with greedy-label exception), query (with `httpQuery`/
  `httpQueryParams` precedence and list-valued maps), headers (with
  `httpHeader`/`httpPrefixHeaders` precedence and empty prefix), `httpPayload`
  flag (for Content-Type + body wrapping), `httpResponseCode` member, and
  `idempotencyToken` auto-fill.

### Spec-behavior codegen gaps (from 2026-07-15 audit)
- **G13 — `httpPayload` blob serialized base64 — wrong.** Payload blob is raw
  (§2.4). Affects request bodies and response decoding.
- **G14 — `httpPayload` on structure: structure's own root element IS the
  body** (Q3 resolved). Element name = target shape name / structure
  `@xmlName` / member `@xmlName` (precedence: member `@xmlName` on the
  `httpPayload` member renames the wrapper). Members nested inside.
- **G15 — enum/intEnum serialization missing** (incl. enum-as-`httpPayload` →
  `text/plain`).
- **G16 — per-binding timestamp defaults not implemented** (header
  `http-date`, label/query `date-time`).
- **G17 — `httpQuery`/`httpQueryParams` precedence not implemented.**
- **G18 — greedy-label `/` non-encoding not implemented.**
- **G19 — empty-prefix `httpPrefixHeaders` + httpHeader-over-prefix precedence
  not implemented.**
- **G20 — `httpQueryParams` targeting `map<string, list<string>>` not
  implemented.**
- **G21 — null/empty-value + empty-container handling not implemented.**
- **G22 — `xmlNamespace` on list/map + members + service-level default not
  implemented.**
- **G23 — `endpoint`/`hostLabel` host-prefix substitution absent from the
  generated `request` (captured in AST by G5 but not in codegen/runtime).**

### Test gaps (`model_tests/`, `sdkgen/`)
- **G10 — Plain `aws.protocoltests.restxml` namespace not in `gen.ml`.** Add
  `"aws.protocoltests.restxml" -> "Restxml"`.
- **G11 — Protocol-test generator assumes JSON bodies** for request-test body
  comparison; needs an XML-aware comparison (parse/canonicalize both sides).
- **G12 — Response-test mock now protocol-aware (resolved); request-test mock
  still hardcodes `application/json`** — restXml needs its own request-test
  mock path (mirroring the query path) so the XML deserializer doesn't choke.

---

## 5. Design: AST & parser changes

In `smithy_ast/Trait.ml`:

```ocaml
type httpTrait = { method_ : string; uri : string; code : int option }
[@@deriving show, equal]

type endpointTrait = { hostPrefix : string } [@@deriving show, equal]

type xmlNamespaceConfig = { uri : string; prefix : string option }
[@@deriving show, equal]

type restXmlConfig = { http : string list; eventStreamHttp : string list;
  noErrorWrapping : bool } [@@deriving show, equal]

(* within type t: *)
| HttpTrait of httpTrait
| HttpHeaderTrait of string
| HttpQueryTrait of string
| EndpointTrait of endpointTrait
| AwsProtocolRestXmlTrait of restXmlConfig
| ApiXmlNamespaceTrait of xmlNamespaceConfig   (* was `of string` *)
| InternalTrait
| HttpResponseCodeTrait
| IdempotencyTokenTrait
```
(`http`/`eventStreamHttp` captured for completeness though unused wire-side.)

In `smaws_parse/Smithy.ml`, update parser cases for `http`, `httpHeader`,
`httpQuery`, `endpoint`, `internal`, `restXml` (carrying `noErrorWrapping`),
`xmlNamespace` (capturing `uri` + optional `prefix`), `httpResponseCode`,
`idempotencyToken`. Use the existing Result-returning helpers (`parseString`,
`parseInteger`, `optional`, `mapOptional`, `>>|`, `let+`/`let*`) — no partial
functions on the happy path.

**Checkpoint:** `dune build` green (the widened variants are non-exhaustive
across `match`es — grep every consumer: `Service_metadata.ml`,
`SmithyHelpers.ml`, `protocol.ml:of_service`, and any match on
`ApiXmlNamespaceTrait`/`HttpTrait`/`AwsProtocolRestXmlTrait`).

---

## 6. Design: runtime `RestXml` module

New file `smaws_lib/protocols_impl/RestXml.ml` (+ `.mli`), registered as
`module RestXml = Protocols_impl.RestXml` in `smaws_lib/Protocols.ml`. Model
the `request` on the **merged** `AwsQuery.request` (context-based).

### 6.1 Types
- Serialize request bodies to a `string` in codegen via `Xml.Write` (the
  runtime receives the final body string + content type). Deserialize responses
  by handing an `Xmlm.input` (from `Xml.Parse`) to a generated
  `output_deserializer : Xmlm.input -> Http.headers -> 'res` (headers passed so
  `httpHeader`/`httpPrefixHeaders`/`httpResponseCode` members can be read).
- `RestXml.Error` = `{ errorType : Sender | Receiver; code : string }` — kept
  **separate** from `smaws_lib/AwsErrors.ml` (which is the JSON namespaced
  model, Q4 resolved).

### 6.2 `request` signature (proposed, context-based — matches `AwsQuery.request`)
```ocaml
val request :
  shape_name:string -> service:Service.descriptor -> context:'a Context.t ->
  binding:http_binding ->          (* method_, uri_template, success_code from @http *)
  uri:Uri.t ->                     (* fully resolved by codegen (labels substituted, greedy-aware) *)
  query:(string * string list) list ->   (* pre-resolved by codegen; runtime encodes *)
  headers:(string * string) list -> (* pre-resolved httpHeader/httpPrefixHeaders *)
  body:(string * string) option ->  (* (content_type, body_string); None for no body *)
  output_deserializer:(Xmlm.input -> Http.headers -> 'res) ->
  error_deserializer:(RestXml.Error.t -> Xmlm.input -> Http.headers -> 'error) ->
  ('res, 'error) result
```
Path-template substitution + percent-encoding lives in **codegen** (Q1
resolved): the generator emits literal per-operation substitution code (it has
the `@httpLabel` member names and the greedy flag), calling a small runtime
helper for percent-encoding only. The runtime applies signing, sending,
status dispatch, and the error-envelope parse.

### 6.3 Error envelope parse (runtime)
Reuse `Xml.Parse.Read.sequence`. Default envelope `ErrorResponse > { Error,
RequestId }`; `noErrorWrapping` collapses to `<Error>` root with members +
`RequestId` directly. The runtime:
1. detects the envelope shape, extracts `Type` (Sender/Receiver) and `Code`,
2. builds `RestXml.Error.t`,
3. **skips trailing sibling elements** (`RequestId`, etc.) before the outer
   `Read.sequence` endTag — this is the exact AwsQuery-class bug (a hardcoded
   `ResponseMetadata` read in `AwsQuery` does not generalize here); use an
   explicit skip-siblings step so the endTag doesn't see `El_start` and raise
   `XmlUnexpectedConstruct`,
4. repositions the `Xmlm.input` cursor at the error members and calls
   `error_deserializer error input headers`.
5. wraps the success and error parse paths in `try/with Failure msg -> Error
   (...)` so bad timestamps/numbers surface as `Error`, not uncaught
   exceptions (AwsQuery-class fix).
The `code` string is matched by the generated `error_deserializer` against the
operation's error shape names (§7.3); unknown codes go to a default handler.

### 6.4 Request-id recovery (follow-up, added 2026-07-18)

Real AWS restXml responses carry the request id in **two** places: a response
header (`x-amzn-requestid` for most services; `x-amz-request-id` /
historically `x-amz-requestid` for S3) **and** the body (`<RequestId>` sibling
of `<Error>` in the wrapped envelope, or a direct child of root `<Error>` with
`noErrorWrapping`). Success (2xx) responses have **no** body `<RequestId>` —
there the id lives only in the header.

The Phase 3 runtime parses the body `<RequestId>` (to drive skip-siblings) but
`request` discarded it, and never read response headers at all. This small
follow-up surfaces the id by mirroring `AwsQuery`:

- Reuse the shared `Smaws_Lib.Response` module (`type metadata = {
  request_id : string option }`, `'a t = { response; metadata }`, `map`).
- Add `request_id_of_headers : Http.headers -> string option` —
  case-insensitive lookup over `["x-amzn-requestid"; "x-amz-request-id";
  "x-amz-requestid"]`, first non-empty value wins.
- Add `request_id_prefer_header ~header ~body` — header wins, fall back to the
  body `<RequestId>` (parsed by `parse_error_envelope` /
  `parse_error_envelope_nowrapping`).
- Add `request_with_metadata` returning `('out Response.t, 'err *
  Response.metadata) result` (Ok = `{ response; metadata }` record, Error =
  `('err * metadata)` tuple — exactly `AwsQuery.request_with_metadata`'s shape).
  Success metadata = `{ request_id = header }`; error metadata =
  `{ request_id = request_id_prefer_header ~header ~body }`.
- `request` keeps its existing `('out, 'err) result` signature (the Phase 4
  generated stubs call it) and becomes a metadata-stripping wrapper over
  `request_with_metadata` (`Result.map (fun { Response.response; _ } ->
  response) |> Result.map_error (fun (e, _) -> e)`). No codegen change needed;
  Phase 7 may switch the generated `request` to call `request_with_metadata` to
  surface the id to callers.
- Pure helpers (`request_id_of_headers`, `request_id_prefer_header`) are
  unit-tested in `smaws_lib_test/restxml_response_test.ml`; body recovery stays
  covered by the existing `parse_error_envelope` test. `request_with_metadata`
  itself needs an HTTP context and is not runtime-mocked (same stance as
  `AwsQuery.request_with_metadata`).

---

## 7. Design: codegen `RestXml` module (`codegen/AwsProtocolRestXml.ml`)

Mirror `codegen/AwsProtocolQuery.ml` with `Serialiser`/`Deserialiser`/
`Operations`.

### 7.1 `Serialiser` (input → XML string)
For each shape kind, generate `<shape>_to_xml : <type> -> string` using
`Xml.Write`. Per member/shape:
- name = `xmlName` trait value if present, else member name (with the
  root-only and flattened-list/map rules from §2.4).
- `xmlAttribute` → attribute on the container element.
- `xmlNamespace` (on shape, member, list/map, or service) → `xmlns`/`xmlns:prefix`.
  Propagate the service-level default namespace to root elements.
- `xmlFlattened` on a list/set/map member → unwrap the wrapping element.
- timestamp format = binding-location default (§2.4) overridden by
  `timestampFormat` on the member or shape.
- float/double: `NaN`/`Infinity`/`-Infinity` sentinel strings (incl. labels).
- `internal` members: omit when equal to default.
- empty containers: empty elements, not omitted (§2.4); null values omitted,
  empty strings preserved.
- enum/intEnum: enum value text (incl. enum-as-`httpPayload` → `text/plain`,
  raw value).

Top-level input handling:
- `@httpPayload` member alone is the body, serialized per its target:
  - structure/union → the structure's **own root element** is the body (name =
    target shape name / structure `@xmlName` / member `@xmlName`), members
    nested inside (Q3/G14 resolved); **not** bare members.
  - string → text; `text/plain`.
  - blob → **raw** bytes (not base64); `application/octet-stream` (G13).
  - enum → raw value; `text/plain`.
  - mediaType → raw with that content type.
- Otherwise: a structure element named after the input shape (or `xmlName`),
  unless the operation has no body (e.g. GET with all params in query/headers).

### 7.2 `Deserialiser` (response → typed value)
`<shape>_of_xml : Xmlm.input -> Http.headers -> 'res`, built on `Xml.Parse`.
Mirror `AwsProtocolQuery.Deserialiser` but consume XML and read headers.
- `httpHeader`/`httpPrefixHeaders` members (incl. empty prefix and
  httpHeader-over-prefix precedence) deserialized from headers.
- `httpResponseCode` member ← HTTP status code (G6c/G13).
- `httpPayload` response member consumes the whole body.
- Numeric/timestamp parsing: **no partial functions on the happy path** — use
  explicit `match` over `Result`/`Option` (not `Result.get_ok`/`Option.get`);
  wrap `Scanf.sscanf` for `http-date` in `try/with`; use `%.6f`-style fixed-point
  for epoch floats (not `%g`, which emits scientific notation) — these are the
  AwsQuery review fixes to reproduce correctly.

### 7.3 `Operations` (the generated `request`)
Per operation, emit:
```ocaml
let request context input =
  let uri = <substitute @httpLabel members into binding.uri_template,
              percent-encoded, greedy labels keep "/"> in
  let query = <@httpQuery members> merged with <@httpQueryParams map(s)>
              with @httpQuery precedence (drop conflicting map keys),
              supporting map<string,list<string>> in
  let headers = <@httpHeader members> merged with <@httpPrefixHeaders map>
              with @httpHeader precedence (and empty-prefix match) in
  let host = <@endpoint hostPrefix substituted with @hostLabel members> in
  let input = <fill unset @idempotencyToken members with a UUID> in
  let body, content_type =
    match <@httpPayload member> with
    | Some m -> (Some (<m>_to_xml ...), <derived content type>)
    | None when <input has body-eligible members> -> (Some (<input>_to_xml input), "application/xml")
    | None -> (None, "application/xml")
  in
  Smaws_Lib.Protocols.RestXml.request ~shape_name:... ~service ~context
    ~binding:{ method_; uri_template; success_code } ~uri ~query ~headers
    ~body:(Option.map (fun b -> (content_type, b)) body)
    ~output_deserializer:<output>_of_xml
    ~error_deserializer
```
The generated `error_deserializer` matches the runtime-parsed `Error.code`
(string, via `String.equal` — not polymorphic `=`) against the operation's
error shape names, delegating to each `<error>_of_xml` and reading
header-bound error members from headers.

### 7.4 Dispatch wiring
- `sdkgen/protocol.ml`: add `RestXml` to `type t`; `of_service` maps
  `AwsProtocolRestXmlTrait _` → `RestXml` (no more `failwith`).
- `gen_operations.ml`/`gen_serialisers.ml`/`gen_deserialisers.ml`: add a
  `Protocol.RestXml` branch calling `Codegen.AwsProtocolRestXml.*`.
- `codegen/Modules.ml`: add `protocolRestXml`, `xml`, `xmlWrite`, `xmlParse`.
- `codegen/Service_metadata.ml`: update `AwsProtocolRestXmlTrait _` case (G1).

---

## 8. Conformance test plan

The vendored model has two restXml namespaces with `httpRequestTest`/
`httpResponseTest` cases covering: query params (literal + variable + map +
precedence + list-valued map), headers, prefix headers (incl. empty prefix),
`httpPayload` (string/blob-raw/structure-with-root-element/enum), `xmlName`,
`xmlNamespace` (incl. `prefix`, service-level, on list/map/members),
`xmlAttribute`, `xmlFlattened`, timestamps (per-binding), non-numeric floats
(incl. labels), wrapped-error envelopes, `httpResponseCode`, `idempotencyToken`
auto-fill, `endpoint`/`hostLabel`, and greedy labels.

Steps:
1. Add `"aws.protocoltests.restxml" -> "Restxml"` to `model_tests/gen.ml` (G10).
2. Make `gen_protocol_tests.ml` protocol-aware for restXml:
   - add a restXml request-test path (mirroring the query path) with a mock
     that doesn't hardcode `application/json` (G11/G12 remaining);
   - body comparison: parse both expected and actual with `Xml` and compare a
     canonical XML tree (G11) — add an `Alcotest.testable` for XML or compare
     canonicalized strings;
   - add the two requestCompression IDs (`SDKAppliedContentEncoding_restXml`,
     `SDKAppendedGzipAfterProvidedEncoding_restXml`) to `bannedTests` (§1).
3. Correct the original plan's false claim: the two targeted namespaces use
   the **wrapped** envelope (`restXml = {}`); `noErrorWrapping` is exercised
   only by `com.amazonaws.s3#AmazonS3` and belongs to the Phase 9 S3 goal.
4. Generate the two test services and run `dune runtest model_tests`. Exit
   criterion: green for both namespaces modulo the two banned
   requestCompression tests.

---

## 9. Phased implementation plan (with checkpoints)

Each phase ends with `dune build` (and `dune fmt`). Do **not** start the next
phase until the developer reviews — per `AGENTS.md` "Stop after each phase".

### Phase 0 — AST & parser (G1, G2, G3, G4, G5, G6, G6b, G6c, G6d)
- Widen `Trait.ml`: `HttpTrait of httpTrait`, `HttpHeaderTrait of string`,
  `HttpQueryTrait of string`, `EndpointTrait of endpointTrait`,
  `AwsProtocolRestXmlTrait of restXmlConfig`,
  `ApiXmlNamespaceTrait of xmlNamespaceConfig` (uri + prefix), add
  `InternalTrait`, `HttpResponseCodeTrait`, `IdempotencyTokenTrait`.
- Update `Smithy.ml` parser for all the above.
- Update all consumers (`Service_metadata.ml`, `SmithyHelpers.ml`,
  `protocol.ml:of_service`, grep for `ApiXmlNamespaceTrait`/`HttpTrait`/…).
- **Checkpoint:** `dune build` green; existing AwsJson/AwsQuery tests pass.

### Phase 1 — XML printer (G7)
- Add `Xml.Write` (+ `.mli`) to `smaws_lib/Xml.ml` on `Xmlm.make_output`:
  element/attribute/text/namespaced (with prefix) elements, pretty/minimal.
- Round-trip unit test vs `Xml.Parse` (cover `xmlns:prefix`).
- **Checkpoint:** `dune build` + `dune runtest smaws_lib_test`.

### Phase 2 — HTTP binding helpers (G8)
- Runtime helpers: percent-encode path segment (greedy keeps `/`) and query
  param, `{label}` substitution, query-list merge with `httpQuery` precedence,
  host-prefix substitution.
- Unit tests (incl. greedy-slash, precedence, list-valued query maps).
- **Checkpoint:** `dune build` + tests.

### Phase 3 — Runtime `RestXml` module (G9)
- `smaws_lib/protocols_impl/RestXml.ml` (+ `.mli`); register in `Protocols.ml`.
- Context-based `request` (mirror merged `AwsQuery.request`); status dispatch;
  error envelope (default + `noErrorWrapping`, with **skip-siblings** and
  **`Failure` catch**); signing; separate `RestXml.Error` (not in `AwsErrors`).
- Mock smoke test: one success + one error path. **The error mock MUST include
  a trailing `<RequestId>` sibling of `<Error>`** to exercise skip-siblings.
- **Follow-up (§6.4):** request-id recovery — `request_id_of_headers`
  (case-insensitive `x-amzn-requestid`/`x-amz-request-id`/`x-amz-requestid`),
  `request_id_prefer_header` (header over body), `request_with_metadata`
  returning `('out Response.t, 'err * Response.metadata) result`; `request`
  keeps its signature and strips metadata. Unit-test the pure helpers.
- **Checkpoint:** `dune build` + `dune runtest`.

### Phase 4 — Codegen dispatch (GC2)
- Add `RestXml` to `Protocol.t`; `of_service` mapping; branches in
  `gen_operations`/`gen_serialisers`/`gen_deserialisers`. `Modules.ml` literals.
- **Checkpoint:** `dune build`; restXml services generate *something* (stub
  generators that fail clearly are acceptable; real generators land in 5–7).

### Phase 5 — Codegen `RestXml.Serialiser` (§7.1, G13–G15, G16, G21, G22)
- `<shape>_to_xml` for all kinds with `xmlName`/`xmlAttribute`/`xmlFlattened`/
  `xmlNamespace` (prefix + service-level + on list/map/members)/per-binding
  `timestampFormat`/NaN-Float/enum/raw-payload-blob/structure-root/empty+null
  handling.
- **Checkpoint (strengthened):** `dune build` + a round-trip/parse-back test
  (serialize then `Xml.Parse` and compare) so `%.6f`-vs-`%g`, NaN/Infinity, and
  empty-container behavior are caught here, not in Phase 8.

### Phase 6 — Codegen `RestXml.Deserialiser` (§7.2, G6c, G19)
- `<shape>_of_xml` (consumes `Xmlm.input` + headers); `httpHeader`/
  `httpPrefixHeaders` (empty prefix + precedence)/`httpResponseCode`/
  `httpPayload` response members. No partial functions on the happy path.
- **Checkpoint (strengthened):** `dune build` + a parse unit test covering
  `http-date` (guarded `Scanf`), epoch float, and `Result`-explicit matching.

### Phase 7 — Codegen `RestXml.Operations` (§7.3, G17, G18, G20, G23, G6d)
- Per-operation `request` with HTTP binding assembly (greedy labels,
  `httpQuery`/`httpQueryParams` precedence, list-valued query maps,
  `httpHeader`/`httpPrefixHeaders` precedence, `endpoint`/`hostLabel`
  host-prefix), `idempotencyToken` auto-fill, and `Code` error dispatch.
- **Checkpoint:** `dune build`; a generated restXml SDK compiles end-to-end.

### Phase 8 — Conformance tests (G10, G11, G12, §8)
- Wire `restxml` namespace; restXml request-test path; XML testable; mock
  content-type from the record; add the two requestCompression IDs to
  `bannedTests`.
- **Checkpoint:** `dune runtest model_tests` green for both namespaces modulo
  the two banned tests. Iterate on failures (normative reference).

### Phase 9 — Polish
- `dune fmt`; verify an S3 / CloudFront SDK generates and compiles (per
  "Adding a new SDK") — **this is where `noErrorWrapping` gets exercised**
  (S3 `AmazonS3`).
- Remove any temporary stubs.

---

## 10. Open questions / decisions (resolved 2026-07-15)

- **Q1 — Path-template substitution location:** **codegen** (decided). The
  generator emits per-operation substitution code; the runtime only
  percent-encodes. Affects the `request` signature (§6.2 takes a fully
  resolved `uri`).
- **Q2 — Output filenames:** **`xml_serializers.ml`/`xml_deserializers.ml`**
  (decided), following the AwsQuery precedent (`query_serializers.ml`/
  `query_deserializers.ml`). Update `sdkgen` writers and `sdks/` dune template.
- **Q3 — `httpPayload` on a structure:** **resolved** — the structure's own
  root element IS the body (name = shape name / structure `@xmlName` / member
  `@xmlName`), members nested inside. Not open.
- **Q4 — Shared `Error.t`:** **keep separate** (decided) — `smaws_lib/AwsErrors.ml`
  holds the JSON namespaced model; the XML envelope `RestXml.Error` is a
  distinct type. Do not fold them together.
- **Q5 — ALPN `http`/`eventStreamHttp`:** **skip** (decided) — informational
  only; captured in `restXmlConfig` for completeness but unused.
- **Q6 — New dependencies:** **none** (confirmed) — xmlm, uri, base64 present.

---

## 11. Files touched (summary)

- `smithy_ast/Trait.ml` — widen variants, add `InternalTrait`/
  `HttpResponseCodeTrait`/`IdempotencyTokenTrait`, config records,
  `xmlNamespaceConfig` (prefix).
- `smaws_parse/Smithy.ml` — parser cases for G1–G6, G6b–G6d.
- `smaws_lib/Xml.ml` (+ `.mli`) — add `Write` (G7).
- `smaws_lib/http/` or new `smaws_lib/Http_bindings.ml` — binding helpers (G8).
- `smaws_lib/protocols_impl/RestXml.ml` (+ `.mli`) — new (G9), separate
  `Error`.
- `smaws_lib/Protocols.ml` — register `RestXml`.
- `sdkgen/protocol.ml` — add `RestXml` to `Protocol.t`, `of_service` mapping.
- `codegen/AwsProtocolRestXml.ml` — new (GC1), mirror `AwsProtocolQuery.ml`.
- `codegen/Modules.ml`, `codegen/Service_metadata.ml` — literals + protocol
  case.
- `sdkgen/gen_operations.ml`, `gen_serialisers.ml`, `gen_deserialisers.ml` —
  `RestXml` branch (GC2/GC3).
- `model_tests/gen.ml` — add `restxml` namespace (G10).
- `sdkgen/gen_protocol_tests.ml` — restXml request-test path, XML testable,
  banned requestCompression IDs (G11/G12, §1).
- `sdks/<svc>/dune` — generated via `service-dune-generate.sh`; xml filenames
  (Q2).