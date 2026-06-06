# Roadmap — Protocol Completeness

## State of the Project

### Protocols implemented vs supported in model definitions

| Protocol | Trait parsing | Service metadata | Runtime impl | Codegen | Gen dispatch | Services unlocked |
|---|---|---|---|---|---|---|
| **AwsJson 1.0/1.1** | done | done | done | done (917 lines) | done | ~138 |
| **AwsQuery** | done | done | done (137 lines) | **missing** | **missing** | ~45 (IAM, CFn, SNS, CloudWatch) |
| **RestJson** | done | done | **missing** | **missing** | **missing** | ~224 (Lambda, ECS, API Gateway, etc.) |
| **RestXml** | done | done | **missing** | **missing** | **missing** | S3, CloudFront, Route53, SQS (alt) |
| **EC2 Query** | done | done | **missing** | **missing** | **missing** | EC2 |

### In-flight refactors

| # | Item | Status |
|---|---|---|
| 1 | Namespace module support | Core done (Phases 1–4). Remaining: CLI `--namespace-map` wiring, multi-ns generation loop, subdirectory output, tests. See `smaws-gen/docs/namespace_resolution.md` |
| 2 | Request compression | Phases 1–2 done (HTTP types + compression.ml). Phases 3–6 remaining |
| 3 | HTTP client substitution | **Already complete** — `Context.ml` parameterized on `(module Http.Client)`, `make_with_eio_http` convenience constructor, `AwsJson.ml` uses first-class module from context |

### Architecture constraints

- **Smaws_Lib must stay stdlib-only** (no Base, camlzip was added for compression — exception granted)
- All existing traits for restJson/restXml are already parsed (`HttpLabelTrait`, `HttpQueryTrait`, `HttpHeaderTrait`, `HttpPayloadTrait`, `HttpQueryParams`, `HttpResponseCodeTrait`, `HostLabelTrait`, `HttpPrefixHeadersTrait`, `XmlAttributeTrait`, `XmlFlattenedTrait`, `XmlNameTrait`, `JsonNameTrait`, `HttpTrait` — the method/URI trait present on every operation)
- `Service.ml` already has all 6 protocol variants in the `protocol` type
- `model_tests/gen.ml` already knows about all namespaces (json, query, restjson, restxml, ec2)
- Test data exists: `smithy-aws-protocol-tests_model.json` (39,048 lines) with tests for all protocols

---

## Critical Architectural Concern: Serialiser/Deserialiser Interface for RestJson/RestXml

### Current contract (AwsJson)

In the JSON protocol, the flow is simple:
1. Serialiser: `input_type -> json` — transforms the entire operation input into a JSON body
2. Runtime: sends JSON body as `POST` with `X-Amz-Target` header
3. Deserialiser: `json -> output_type` — parses the entire JSON response body

Generated operations look like:
```ocaml
let request context (request : input_type) =
  let input = Json_serializers.input_to_yojson request in
  Smaws_Lib.Protocols.AwsJson.request ~shape_name:"..." ~service ~context ~input
    ~output_deserializer:Json_deserializers.output_of_yojson
    ~error_deserializer
```

### Problem for restJson

In restJson, members of the input shape are distributed across **four** locations based on `@http` binding traits:

| Trait on member | Destination | Serialiser needed | Deserialiser needed |
|---|---|---|---|
| `@httpLabel` | URI path segment (`/things/{id}`) | `string_to_yojson` → string interpolation | extract from URI path |
| `@httpQuery` | Query parameter (`?name=value`) | `string_to_yojson` → query string | extract from query params |
| `@httpHeader` | HTTP header | appropriate `_to_yojson` → header string | extract from response headers |
| `@httpPayload` | HTTP body | the body serialiser | body deserialiser |
| (none/default) | HTTP body (if no `@httpPayload`) | shape-as-JSON-body serialiser | shape-from-JSON-body deserialiser |
| `@httpPrefixHeaders` | Multiple headers with prefix | map-to-headers | headers-to-map |
| `@httpResponseCode` | HTTP status code | n/a | int from status |
| `@hostLabel` | Hostname prefix | string → host prefix | n/a |

And the **`HttpTrait`** on the operation shape itself specifies: method (`GET`, `POST`, `PUT`, `DELETE`), URI template (`/things/{id}`).

The **output** shape may similarly have members tagged with `@httpHeader`, `@httpPayload`, `@httpResponseCode`, `@httpPrefixHeaders`.

### What this means

The current generated `json_serializers.ml` / `json_deserializers.ml` modules produce functions of type `shape -> json` and `json -> shape`. They operate on the **entire** input/output shape as a single JSON body. For restJson:

- **Serialisers need to change**: instead of `input -> json_body`, operations need to split the input into `(headers * query_params * path_segments * body)` — each field goes to a different HTTP location
- **Deserialisers need to change**: instead of `json -> output`, operations need access to headers, status code, and body separately

### Proposed approach

**Option A: Generate separate rest-ser/diser modules**
- Keep `Json_serializers` / `Json_deserializers` for AwsJson protocols (unchanged)
- Create `Rest_serializers` / `Rest_deserializers` for restJson protocols
- These generate per-member functions: each structure member tagged with `@httpHeader` gets a `member_to_header_value` function, etc.
- The runtime `RestJson.request` stitches them together

**Option B: Change serialiser interface to return a structured HTTP request**
- Change all serialisers to return `(headers, query_params, path_segments, body)` tuples
- For AwsJson, path_segments and query_params are [] and headers are just content-type
- This is a large refactor of existing generated code

**Recommendation: Option A** — generate separate modules. It keeps AwsJson codegen untouched and lets restJson serialisation be purpose-built for HTTP binding. The existing `AwsProtocolJson.ml` serialiser/deserialiser generators continue to work for AwsJson; a new `codegen/AwsProtocolRestJson.ml` generates both JSON body serialisers (reusing much of the existing logic) and per-field HTTP binding functions.

---

## Implementation Plan

### Phase 0: Cleanup (1–2 days)

| # | Task | Files |
|---|---|---|
| 0.1 | Complete namespace CLI parameter — accept `--namespace-map` CLI arg, iterate over all namespace contexts, generate per-ns output | `bin/AwsGenerator.ml`, `sdkgen/sdkgen.ml` |
| 0.2 | Mark HTTP substitution as complete | Update `refactoring/http_substitution.md` status, add `.todo.md` marking done |

### Phase 1: Request Compression Completion (2–3 days)

| # | Task | Files |
|---|---|---|
| 1.1 | HTTP client handles `Compressed` body variant — set `Content-Encoding: gzip` header, compress body bytes | `http_eio_client.ml`, `http_eio_http1_1_protocol_impl.ml` |
| 1.2 | Protocol layer: extend `AwsJson.request` to accept optional `?compress:body_encoding`, apply `Compression.compress_gzip` when set | `smaws_lib/protocols_impl/AwsJson.ml` |
| 1.3 | Codegen: detect `RequestCompressionTrait` on operation shapes, generate compressed request calls | `codegen/AwsProtocolJson.ml` `Operations` |
| 1.4 | Test mock support: detect `Content-Encoding` header in mock, optionally decompress for assertions | `smaws_test_support_lib/http_mock.ml` |

### Phase 2: AwsQuery Protocol Codegen (3–5 days)

| # | Task | Files |
|---|---|---|
| 2.1 | Create `codegen/AwsProtocolQuery.ml` with `Serialiser`, `Deserialiser`, `Operations` submodules | New file |
| 2.2 | **Serialiser**: generates `_to_form` functions producing `(string * string list) list` (form-encoded key-value pairs). XML serialisers are not needed at the codegen layer — shapes produce form fields, the runtime does XML parsing of responses | `codegen/AwsProtocolQuery.ml` |
| 2.3 | **Deserialiser**: generates `_of_xml` functions that parse `Xmlm.input` into OCaml types. Structure shapes become XML element parsers, lists become repeated elements, maps become `entry`-wrapped key/value pairs | `codegen/AwsProtocolQuery.ml` |
| 2.4 | **Operations**: generates request functions calling `Smaws_Lib.Protocols.AwsQuery.request` with `~action`, `~xmlNamespace`, `~fields`, `~output_deserializer` | `codegen/AwsProtocolQuery.ml` |
| 2.5 | Wire protocol dispatch: update `gen_serialisers.ml`, `gen_deserialisers.ml`, `gen_operations.ml` to dispatch on `AwsProtocolAwsQueryTrait` → `AwsProtocolQuery` module | `sdkgen/gen_*.ml` |
| 2.6 | Update `gen_module.ml` to include `Form_serializers` / `Xml_deserializers` modules for query services | `sdkgen/gen_module.ml` |

### Phase 3: RestJson Serialiser/Deserialiser Interface Refactor (3–5 days)

This is the critical architectural work before RestJson codegen can begin.

| # | Task | Files |
|---|---|---|
| 3.1 | Define the `RestHttp` request/response types in `smaws_lib/http/http_types.ml` | `http_types.ml` |
| 3.2 | Create `smaws_lib/protocols_impl/RestJson.ml` — runtime that takes structured request parts and makes the HTTP call | New file |
| 3.3 | Define generated code interface contract — what functions each member of an operation's input/output shape should produce based on its `@http` trait | Design doc in `refactoring/restjson_interface.md` |
| 3.4 | Create `codegen/AwsProtocolRestJson.ml` with `Serialiser`, `Deserialiser`, `Operations` submodules | New file |
| 3.5 | **Serialiser**: generates `_to_http_body`, `_to_header_value`, `_to_query_value`, `_to_path_value` per-member functions based on HTTP binding traits. Reuses JSON body serialisation from existing `AwsProtocolJson.Serialiser` logic | `codegen/AwsProtocolRestJson.ml` |
| 3.6 | **Deserialiser**: generates `_of_http_response` functions that extract members from headers/status/body. Reuses JSON body deserialisation from existing `AwsProtocolJson.Deserialiser` logic | `codegen/AwsProtocolRestJson.ml` |
| 3.7 | **Operations**: generates request functions that call `Smaws_Lib.Protocols.RestJson.request` with `~method_`, `~uri_template`, `~path_params`, `~query_params`, `~headers`, `~body` | `codegen/AwsProtocolRestJson.ml` |
| 3.8 | Wire protocol dispatch: update `gen_serialisers.ml`, `gen_deserialisers.ml`, `gen_operations.ml` to dispatch on `AwsProtocolRestJson1Trait` → `AwsProtocolRestJson` | `sdkgen/gen_*.ml` |
| 3.9 | Update `gen_module.ml` to include `Rest_serializers` / `Rest_deserializers` for restJson services | `sdkgen/gen_module.ml` |

### Phase 4: RestXml Protocol Codegen (2–4 days)

| # | Task |
|---|---|
| 4.1 | Create `codegen/AwsProtocolRestXml.ml` — combines XML body serialisation (from AwsQuery patterns) with HTTP binding (from RestJson patterns) |
| 4.2 | Create `smaws_lib/protocols_impl/RestXml.ml` — similar to RestJson runtime but uses XML content type |
| 4.3 | Wire protocol dispatch for `AwsProtocolRestXmlTrait` |
| 4.4 | Handle S3-specific quirks (`AwsCustomizationsS3UnwrappedXmlOutputTrait`, etc.) |

### Phase 5: EC2 Query Protocol (1–3 days)

| # | Task |
|---|---|
| 5.1 | Create `codegen/AwsProtocolEc2Query.ml` — close cousin of AwsQuery with minor serialisation differences (`Ec2QueryNameTrait` for flattened naming) |
| 5.2 | Create `smaws_lib/protocols_impl/Ec2Query.ml` |
| 5.3 | Wire protocol dispatch |

### Phase 6: Validation & Testing (ongoing, parallel)

| # | Task |
|---|---|
| 6.1 | Regenerate test models for each protocol using `model_tests/gen.ml` — verify `dune runtest` passes |
| 6.2 | Run protocol conformance tests from `smithy-aws-protocol-tests_model.json` against each protocol |
| 6.3 | Generate real-world SDKs for key services (IAM, S3, Lambda) and verify compilation |

---

## Dependency Dependencies Between Phases

```
Phase 0 (cleanup) ─┬─► Phase 1 (compression) ─► independent, can parallelize
                   │
                   └─► Phase 2 (AwsQuery) ─► depends on Phase 0 only
                                              ─► runtime already done
                                              ─► ~900 lines codegen modeled on AwsProtocolJson.ml

Phase 3 (RestJson refactor) ─► depends on Phase 0 only
                               ─► no dependency on AwsQuery
                               ─► the serialiser interface question must be decided here

Phase 4 (RestXml) ─► depends on Phase 3 (RestJson interface pattern) + Phase 2 (XML patterns)

Phase 5 (EC2 Query) ─► depends on Phase 2 (AwsQuery patterns)

Phase 6 (validation) ─► parallel with all phases, gates each protocol's completion
```

---

## Other Work Items

### Documentation
| # | Task |
|---|---|
| D1 | Incorporate Smithy documentation nodes into generated code |
| D2 | Convert HTML-based docs to odoc |
| D3 | Diagrams |

### Auth resolvers
| # | Task |
|---|---|
| A1 | SSO Login resolver |
| A2 | IAM assume role resolver (using STS) |
| A3 | EC2 Instance Metadata resolver |
| A4 | Lambda function resolver |

### CI/CD
| # | Task |
|---|---|
| C1 | GitHub build actions for CI/CD |

---

## Risks & Unknowns

1. **RestJson serialiser/deserialiser interface design**: this is the biggest architectural decision. The wrong interface means rewriting generated code twice. The split-module approach (Option A) is recommended because it keeps AwsJson stable and lets restJson evolve independently.

2. **AwsQuery XML deserialiser complexity**: AWS Query protocol XML responses have a specific structure (`{Action}Response` > `{Action}Result` > fields). The runtime already parses this wrapper — the generated codegen needs to produce field-level XML parsers. This is the second-largest new codegen module (~600–800 lines).

3. **RestXml S3 quirks**: S3 has several non-standard behaviors (unwrapped XML output, GET responses with no wrapper element). These may need special-case handling.

4. **`@httpPayload` trait**: when a member is tagged `@httpPayload`, the body is that member's raw serialised form (not a JSON envelope). This is different from the default "all non-http-tagged members go into JSON body" behavior. The serialiser interface must handle both cases.

5. **Protocol test infrastructure**: `gen_protocol_tests.ml` (454 lines) currently hardcodes expectations for JSON protocols. It needs to be made protocol-aware or replaced with per-protocol test generators.
