# restXml protocol + Amazon S3 support — gap analysis

Sources reviewed:
- `smithy-aws-protocol-tests_model.json` — `aws.protocoltests.restxml#RestXml`,
  `aws.protocoltests.restxml.xmlns#RestXmlWithNamespace`, and the S3 service
  `com.amazonaws.s3#AmazonS3` (4 operations: `ListObjectsV2`,
  `GetBucketLocation`, `DeleteObjectTagging`, `GetObject`).
- Real S3 model `api-models-aws/models/s3/service/2006-03-01/s3-2006-03-01.json`
  (112 operations, 819 shapes).
- Smithy 2.0 spec: *AWS restXml protocol* and *Amazon S3 Customizations*.
- Current codegen/runtime: `smithy_ast/Trait.ml`, `codegen/AwsProtocol{Json,Query}.ml`,
  `sdkgen/gen_*.ml`, `smaws_lib/protocols_impl/`, `smaws_lib/http/http.mli`,
  `smaws_lib/Xml.ml`.

## Current state

- `aws.protocols#restXml` is parsed in `Trait.ml` (`AwsProtocolRestXmlTrait`) and
  the service metadata records `Service.RestXml`, but
  `SmithyHelpers.ml` explicitly `failwith "code generation for the restXml
  protocol is not yet supported"`.
- There is **no** `smaws_lib/protocols_impl/AwsRestXml.ml`.
- The HTTP binding traits (`httpLabel`, `httpHeader`, `httpQuery`,
  `httpPayload`, `httpPrefixHeaders`, `httpResponseCode`, `httpQueryParams`)
  are declared in `Trait.ml` (lines 131–137) but are **not consumed anywhere**
  in `sdkgen/` or `codegen/`. AwsQuery/AwsJson don't need them, so they were
  never wired up. restXml is the first protocol that needs them.
- `endpoint` / `hostLabel` / `paginated` / `streaming` / `s3UnwrappedXmlOutput`
  traits are declared but likewise unused.
- `Http.input_body = \`None | \`String | \`Compressed | \`Form` — no streaming
  variant. Response bodies are read via `Body.to_string` (whole-buffer).
- `Xml.ml` exists (xmlm-backed parser used by AwsQuery) but has no
  *serialiser* / builder side and no attribute / namespace-aware writer.

## Ordered gap list (what to add first)

### Tier 0 — restXml core (unblocks the generic `aws.protocoltests.restxml` suite)

1. **`smaws_lib/protocols_impl/AwsRestXml.ml` runtime + `codegen/AwsProtocolRestXml.ml`**
   — mirror the AwsQuery split. Synthesise an XML document from the operation
   input structure (root element = operation input shape name, unless
   `@xmlName`/`@xmlNamespace` override), POST/PUT it as the body with
   `Content-Type: application/xml`. Parse responses the same way.

2. **HTTP binding traits in codegen** (the big new surface for rest-style
   protocols). For each top-level input/output/error member, emit code that
   reads/writes from the right place:
   - `@httpLabel` — URI label substitution, with greedy `{name+}` support.
   - `@httpQuery` — query-string parameter.
   - `@httpQueryParams` — map → query string parameters.
   - `@httpHeader` — request/response header.
   - `@httpPrefixHeaders` — map of `prefix*` headers (e.g. `x-amz-meta-*`).
   - `@httpPayload` — replaces the synthesised XML body with the targeted
     member. Content-Type depends on target shape:
     `string`→`text/plain`, `blob`→`application/octet-stream`,
     `structure`/`union`→`application/xml`, `mediaType` trait wins.
   - `@httpResponseCode` — bind HTTP status code to an output member.

3. **URI label serialisation semantics** (REST label escaping):
   - Non-greedy labels: percent-encode reserved chars per RFC 3986 but **keep
     `/`** escaped (`%2F`) — see `HttpRequestWithLabels` /
     `HttpRequestLabelEscaping` test (encodes ` %:/?#[]@!$&'()*+,;=` and
     emoji).
   - Greedy labels `{name+}`: **do not** encode `/`; only encode other
     reserved chars. See `HttpRequestWithGreedyLabelInPath`.
   - **Do not normalise dot segments** — `S3PreservesLeadingDotSegmentInUriLabel`
     requires `/../key.txt` to be sent verbatim. Our `Uri` handling must not
     call `Uri.normalize` on the path.

4. **XML shape serialiser** (write side of `Xml.ml`):
   - structures/unions → nested elements named after the member (or
     `@xmlName`).
   - `@xmlFlattened` — unwrap list/map `member`/`entry` wrappers.
   - `@xmlAttribute` — serialise member as an attribute on the containing
     element (`XmlAttributes`, `XmlAttributesInMiddle`).
   - `@xmlNamespace` / service-level `xmlNamespace` — emit
     `xmlns="..."` / `xmlns:prefix="..."` on the right elements
     (`XmlNamespaces`, `RestXmlWithNamespace` service).
   - blobs base64-encoded; timestamps default `date-time`, honour
     `@timestampFormat` (`epoch-seconds`, `http-date`).
   - NaN / Infinity as the strings `NaN` / `Infinity` / `-Infinity`.
   - maps → `entry`/`key`/`value`; lists → `member`.
   - recursive structures (`RecursiveShapes` test).
   - unions: only one member set; empty union → no payload.

5. **restXml error handling** with `noErrorWrapping`:
   - Default: errors wrapped in `<ErrorResponse><Error>…<Code/><RequestId/>`
     (`GreetingWithErrors` test).
   - S3 sets `noErrorWrapping: true` on the `@restXml` trait → bare `<Error>`
     root with `Type`/`Code`/`Message`/`RequestId` (`S3OperationNoErrorWrappingResponse`).
   - Need to model the `noErrorWrapping` boolean on `AwsProtocolRestXmlTrait`
     (currently the trait is a bare variant — promote to carry a record).

6. **Empty input / empty output / no-input-no-output** operations
   (`EmptyInputAndEmptyOutput`, `NoInputAndNoOutput`, `NoInputAndOutput`):
   when input/output is `smithy.api#Unit` or an empty structure, send/receive
   **no body** (still set method/uri from `@http`).

7. **`@http` `code` binding + arbitrary status codes** — `HttpResponseCode`
   expects `201`; some ops declare non-200 success codes in the `@http` trait
   (`DeleteObjectTagging` → `204`). Treat any 2xx as success and bind the code
   when `@httpResponseCode` is present.

8. **Wire `aws.protocoltests.restxml` (and `.xmlns`) into `model_tests/gen.ml`**
   and add `model_tests/protocols/restxml/` + `restxml_xmlns/` targets so the
   conformance suite runs.

### Tier 1 — streaming (required for real S3 use, not the 4-op test service)

9. **Streaming request body** — `PutObject`, `UploadPart`,
   `WriteGetObjectResponse` send `StreamingBlob` (`@streaming` blob) as
   `@httpPayload`. Need an `Http.input_body` variant that is an
   `Eio.Flow.source` (or `string * int64 length`) so we don't buffer whole
   objects in memory, plus `Content-Length` / chunked transfer handling.

10. **Streaming response body** — `GetObject` output `Body` is a
    `@streaming` `@httpPayload` blob. The typed output must expose the
    response `Body.t` (or an `Eio.Flow.source`) instead of materialising it.
    This changes the generated operation return type for streaming-payload
    outputs — design the interface (e.g. return a record with a `body :
    Eio.Flow.source_read` field) before implementing.

11. **`@httpChecksum` / trailer checksums** — 33 S3 operations carry
    `aws.protocols#httpChecksum` with `requestAlgorithmMember` /
    `requestChecksumRequired` / `responseAlgorithms`. Requires computing
    CRC32/CRC32C/CRC64NVME/SHA1/SHA256/SHA512/MD5/XXHASH64/3/128 and sending
    them as `x-amz-checksum-*` headers or `x-amz-trailer` (chunked
    trailers). `digestif` is already a dep; the xxhash family is not.

12. **`aws.auth#unsignedPayload` / `@auth`** — `WriteGetObjectResponse` uses
    unsigned-payload sigv4 (signature over an empty body digest). The current
    `Sign.ml` presumably hashes the body; needs an "unsigned payload" mode
    that sets `x-amz-content-sha256: UNSIGNED-PAYLOAD`.

### Tier 2 — S3-specific customizations (required for the `com.amazonaws.s3` test ops)

13. **`aws.customizations#s3UnwrappedXmlOutput`** (declared, unused) — for
    `GetBucketLocation`, the response root element is the output shape's
    `@xmlName` (`LocationConstraint`) directly, **not** wrapped in an
    operation-level node. Codegen must check this trait on the operation and
    skip the wrapper.

14. **S3 bucket addressing** (virtual-host vs path-style):
    - virtual: move `Bucket` from the URI path to a host prefix
      (`<bucket>.s3.<region>.amazonaws.com`).
    - path: keep `/<bucket>` in the URI.
    - Default = virtual. Configurable at environment / file / client /
      operation level (precedence table in the S3 customizations spec).
    - Tests: `S3DefaultAddressing`, `S3VirtualHostAddressing`,
      `S3PathAddressing`, `S3OperationAddressingPreferred`.

15. **S3 dual-stack and transfer-accelerate endpoints**:
    - dualstack: insert `.dualstack` after `s3` and before region
      (`<bucket>.s3.dualstack.<region>.amazonaws.com`).
    - accelerate: replace `s3` with `s3-accelerate` and drop the region
      (`<bucket>.s3-accelerate.amazonaws.com`).
    - Combined: `<bucket>.s3-accelerate.dualstack.amazonaws.com`.
    - Tests: `S3VirtualHostDualstackAddressing`,
      `S3VirtualHostAccelerateAddressing`,
      `S3VirtualHostDualstackAccelerateAddressing`.
    - These are client config flags (`use_dualstack_endpoint`,
      `use_accelerate_endpoint`, `addressing_style`) — needs extension to
      `Config.ml` plus the `vendorParams` plumbing in the test harness.

16. **Object-key URI escaping for S3** (on top of generic label escaping):
    - Escape spaces and special chars (`S3EscapeObjectKeyInUriLabel`:
      `my key.txt` → `my%20key.txt`).
    - Preserve path structure for greedy keys
      (`S3EscapePathObjectKeyInUriLabel`: `foo/bar/my key.txt` →
      `foo/bar/my%20key.txt`). This is just correct greedy-label behaviour
      from item 3, but called out because S3 relies on it heavily.

### Tier 3 — needed for production S3 but not the conformance suite

17. **`@paginated`** — `ListObjectsV2`, `ListBuckets`, `ListParts`,
    `ListDirectoryBuckets`, `ListObjectAnnotations`. No paginator codegen /
    runtime exists. Needs `inputToken`/`outputToken`/`pageSize` auto-pagination
    (and the `token` member kind). Not exercised by the 4 test ops beyond
    `ListObjectsV2`'s single-page request tests.

18. **`@endpoint` trait + `@hostLabel`** — `WriteGetObjectResponse` uses
    `hostPrefix: "{RequestRoute}."` with `@hostLabel` on `RequestRoute`.
    Needs endpoint-trait host-prefix composition in codegen/runtime.

19. **Endpoint rules engine** — S3 carries `smithy.rules#endpointRuleSet` +
    `endpointTests` + `endpointBdd`. Real S3 regional/S3-Express/Outposts
    endpoint resolution needs the rules engine. Out of scope for first cut;
    hard-code region→host for now.

20. **S3 access-point / ARN-based addressing** — `UseArnRegion`,
    `UseGlobalEndpoint`, `ForcePathStyle`, `DisableMultiRegionAccessPoints`
    config traits; bucket-as-ARN rewriting. Production only.

21. **S3 Express session auth** (`DisableS3ExpressSessionAuth`,
    `UseS3ExpressControlEndpoint`) — separate sigv4-s3express variant with
    session token rotation. Production only.

22. **`@sensitive` redaction** in logs / errors — 6 uses in S3. Cosmetic.

23. **`smithy.api#examples`** — operation examples (used by AWS for SDK
    examples). Not a runtime requirement.

## Suggested implementation order

1. Tier 0 items 1–8 (get the generic `aws.protocoltests.restxml` +
   `restxml.xmlns` suites green). This is the bulk of the protocol work and
   is fully covered by the existing smithy conformance tests, so it can be
   developed test-first exactly like AwsQuery was.
2. Tier 2 items 13–16 (S3 customizations) — small, layered on top of Tier 0,
   and covered by the 4 `com.amazonaws.s3` test operations. Land these
   immediately after Tier 0 so the S3 service model actually generates.
3. Tier 1 items 9–12 (streaming + checksums + unsigned payload) — required
   before `GetObject`/`PutObject`/`UploadPart`/`WriteGetObjectResponse` are
   *usable*, but the conformance tests for the 4 modelled S3 ops don't
   exercise streaming bodies (the test `GetObjectOutput` is empty). Do this
   next because no real S3 client is useful without it.
4. Tier 3 items 17–21 — production hardening; defer until the basics work
   against a real bucket.

## Interface-compatibility notes

- The generated operation call shape today is
  `Operation.request ctx input -> (Ok output | Error e, _) result` with the
  HTTP body fully materialised as a `string`. Streaming outputs (item 10)
  **will** change that return type for streaming-payload operations — decide
  the streaming-output interface before implementing so we don't end up with
  two incompatible operation signatures. Recommendation: keep
  `Operation.request` returning the materialised record for non-streaming
  outputs, and add a separate `Operation.request_streaming` (or a
  type-indexed body field) for operations whose output has a
  `@httpPayload @streaming` member, so existing AwsJson/AwsQuery SDKs are
  unaffected.
- `Http.input_body` (item 9) gains a new variant
  `` `Flow of Eio.Flow.source_read * int64 option `` (length unknown →
  chunked). The mock HTTP client used by the conformance tests
  (`Http_mock`) must be extended to accept and assert on it.
- `Config.t` gains S3-specific fields (`addressing_style`, `use_dualstack`,
  `use_accelerate_endpoint`, …). These should live behind an
  `S3_options` sub-record or a functorised client so non-S3 SDKs aren't
  polluted.