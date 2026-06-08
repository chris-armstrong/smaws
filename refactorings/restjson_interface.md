# RestJson/RestXml Serialiser/Deserialiser Interface Design

## Problem

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
| `@httpLabel` | URI path segment (`/things/{id}`) | `_to_yojson` → string interpolation | extract from URI path |
| `@httpQuery` | Query parameter (`?name=value`) | `_to_yojson` → query string | extract from query params |
| `@httpHeader` | HTTP header | `_to_yojson` → header string | extract from response headers |
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

## Proposed approach

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

## Implementation Plan

| # | Task | Files |
|---|---|---|
| 1 | Define the `RestHttp` request/response types | `smaws_lib/http/http_types.ml` |
| 2 | Create `smaws_lib/protocols_impl/RestJson.ml` — runtime that takes structured request parts and makes the HTTP call | New file |
| 3 | Define generated code interface contract — what functions each member of an operation's input/output shape should produce based on its `@http` trait | This document |
| 4 | Create `codegen/AwsProtocolRestJson.ml` with `Serialiser`, `Deserialiser`, `Operations` submodules | New file |
| 5 | Serialiser implementation — generates `_to_http_body`, `_to_header_value`, `_to_query_value`, `_to_path_value` per-member functions based on HTTP binding traits | `codegen/AwsProtocolRestJson.ml` |
| 6 | Deserialiser implementation — generates `_of_http_response` functions that extract members from headers/status/body | `codegen/AwsProtocolRestJson.ml` |
| 7 | Operations generation — generates request functions calling `Smaws_Lib.Protocols.RestJson.request` with structured request parts | `codegen/AwsProtocolRestJson.ml` |
| 8 | Wire protocol dispatch in `gen_serialisers.ml`, `gen_deserialisers.ml`, `gen_operations.ml` | `sdkgen/gen_*.ml` |
| 9 | Update `gen_module.ml` to include `Rest_serializers` / `Rest_deserializers` modules | `sdkgen/gen_module.ml` |

## Risks

- **`@httpPayload` trait**: when a member is tagged `@httpPayload`, the body is that member's raw serialised form (not a JSON envelope). This is different from the default "all non-http-tagged members go into JSON body" behavior. The serialiser interface must handle both cases.
- **Protocol test infrastructure**: `gen_protocol_tests.ml` currently hardcodes expectations for JSON protocols. It needs to be made protocol-aware or replaced with per-protocol test generators.
