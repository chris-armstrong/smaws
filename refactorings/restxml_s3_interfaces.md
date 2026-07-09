# restXml / S3 — interface change proposals

Two interface changes, both gated on model annotations so existing AwsJson/AwsQuery
SDKs are byte-for-byte unaffected.

- **Streaming operations** get a different `request` interface, keyed off
  `@httpPayload` + `@streaming`.
- **S3 client construction** takes an extra `?s3_options` parameter, keyed off
  the S3 service customizations.

Concrete before/after below. References are to the current DynamoDB SDK
(`sdks/dynamodb/`) as the canonical "before" shape.

---

## 1. Streaming operation interface

### Detection (codegen)

An operation is *streaming* iff its input or output (or error) has a top-level
member with `@httpPayload` whose target shape carries `@streaming`.

In the S3 model that is:
- `PutObject`, `UploadPart`, `WriteGetObjectResponse` — streaming **input**
  (`Body : StreamingBlob`, `@streaming` blob).
- `GetObject` — streaming **output** (`Body : StreamingBlob`).

`SelectObjectContent` also has a streaming payload (`Payload` is a
`@streaming` union), but because S3 Select has been deprecated by AWS we
**do not support event-stream decoding**. The operation still appears in
the generated SDK, but calling it will fail at runtime. See §3.7 and §8.9.

Non-streaming operations (everything in DynamoDB; the four S3 conformance ops
`ListObjectsV2`, `GetBucketLocation`, `DeleteObjectTagging`, and the test
`GetObject` whose output is empty) keep the existing interface exactly.

### Before (unchanged for non-streaming ops)

```ocaml
module ListObjectsV2 : sig
  val error_to_string : [ ... ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_objects_v2_input ->
    ( list_objects_v2_output, [> ... ] ) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_objects_v2_input ->
    ( list_objects_v2_output Smaws_Lib.Response.t,
      [> ... ] * Smaws_Lib.Response.metadata ) result
end
```

with `list_objects_v2_input` / `_output` records whose members are ordinary
materialised types (`string`, `Smaws_Lib.CoreTypes.Blob.t`, …).

### After — streaming input (`PutObject`)

The `request` function keeps the same shape; the **input record's streaming
payload field** changes type from `Smaws_Lib.CoreTypes.Blob.t` to
`Eio.Flow.source`. The builder follows.

```ocaml
module PutObject : sig
  val error_to_string : [ ... ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_object_input ->                      (* body is a flow *)
    ( put_object_output, [> ... ] ) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_object_input ->
    ( put_object_output Smaws_Lib.Response.t,
      [> ... ] * Smaws_Lib.Response.metadata ) result
end
```

```ocaml
(* Types.ml *)
type put_object_input = {
  body : Eio.Flow.source;       (* was: Smaws_Lib.CoreTypes.Blob.t *)
  bucket : bucket_name;              (* @httpLabel *)
  key : object_key;                  (* @httpLabel *)
  content_length : content_length option;   (* @httpHeader Content-Length *)
  metadata : metadata option;               (* @httpPrefixHeaders x-amz-meta- *)
  ...
}
```

```ocaml
(* Builders.ml *)
val make_put_object_input :
  body:Eio.Flow.source ->
  bucket:bucket_name ->
  key:object_key ->
  ?content_length:content_length ->
  ?metadata:metadata ->
  unit ->
  put_object_input
```

The flow is read inside the `Context`'s switch (`Context.make_with_eio_http
~sw`). The HTTP runtime gains a new `input_body` variant:

```ocaml
(* smaws_lib/http/http.mli *)
type input_body =
  [ `None
  | `String of string
  | `Compressed of string * body_encoding
  | `Form of (string * string list) list
  | `Stream of (unit -> string option) ]   (* NEW: producer returns None at EOF *)
```

### After — streaming output (`GetObject`)

The output record's streaming payload field becomes
`Eio.Flow.source option`. It is `option` because a 304 / 404 / empty-body
response still parses headers but has no body flow. The caller consumes the
flow within the switch; the connection is returned to the pool when the flow
is drained (or the switch is torn down — the existing pool already returns on
drain).

```ocaml
module GetObject : sig
  val request :
    'http_type Smaws_Lib.Context.t ->
    get_object_input ->
    ( get_object_output, [> ... ] ) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_object_input ->
    ( get_object_output Smaws_Lib.Response.t,
      [> ... ] * Smaws_Lib.Response.metadata ) result
end
```

```ocaml
(* Types.ml *)
type get_object_output = {
  body : Eio.Flow.source option;    (* was: Smaws_Lib.CoreTypes.Blob.t option *)
  delete_marker : delete_marker option;  (* @httpHeader x-amz-delete-marker *)
  etag : etag option;                    (* @httpHeader ETag *)
  metadata : metadata option;            (* @httpPrefixHeaders x-amz-meta- *)
  ...
}
```

The HTTP response body is exposed as a stream. To keep `smaws_lib` HTTP
implementations pluggable, the **client signature exposes a small abstract
streaming API**, not Eio directly.

```ocaml
(* smaws_lib/http/http.mli — Body sub-module of Client_intf *)
module Body : sig
  type t
  val to_string : t -> string option
  val drain : t -> unit

  (* Streaming read interface, independent of any specific IO library. *)
  module Stream : sig
    type chunk = { data : string; final : bool }
    val read : t -> (chunk option, [ `Closed | `Streaming_not_supported ]) result
  end
end
```

`Body.Stream.read` returns the next chunk of the response body. A returned
chunk with `final = true` signals end-of-stream. `None` means the body is
already drained. The Eio-based implementation maps `Httpun.Body.Reader` onto
this interface; a synchronous mock can return the whole mock string as one
final chunk. This keeps the protocol runtime and generated SDK types free of
Eio in the HTTP client signature, while still allowing zero-copy streaming
for real HTTP clients.

For **streaming request bodies**, `Http.input_body` gains a similar abstract
variant:

```ocaml
type input_body =
  [ `None
  | `String of string
  | `Compressed of string * body_encoding
  | `Form of (string * string list) list
  | `Stream of (unit -> string option) ]   (* NEW: producer returns None at EOF *)
```

The producer is called repeatedly by the HTTP implementation when it needs
more bytes. It may block if the implementation is effect-based, or return
immediately for a synchronous/mock client. The producer receives no arguments
and must be stateful. The optional `int64` length carried by the old `` `Flow ``
sketch is dropped because a generic producer cannot always know its length;
instead the restXml runtime decides `Content-Length` vs chunked from the
modeled header / length metadata independently (see §8.4).

**Why this design?**

- The current `Http.Client_intf.S` is already functorised (`Http_eio_client.Make`)
  and used by a string-based mock. A streaming extension should fit the same
  pattern: the protocol runtime talks to an abstract `Http.Body.t`, not to Eio.
- Exposing `Eio.Flow.source` in `Http.Client_intf` would force every alternative
  HTTP backend (test mock, future lwt/async backend, etc.) to depend on Eio and
  implement an Eio flow, defeating the point of the pluggable client type.
- The generated S3 types can still expose `Eio.Flow.source` to callers if desired
  (see §1), but the bridge from the generic `Body.Stream.read` to an Eio flow
  lives in a small SDK-side helper, not in the core HTTP signature.
- `request_with_metadata` still returns `output Smaws_Lib.Response.t` because
  metadata (headers / request id) is separate from the body stream, so wrapping
  is fine.

### After — event-stream output (`SelectObjectContent`) — dropped

{e S3 Select has been deprecated by AWS and is no longer available to new
   customers. We therefore do not implement the Amazon Event Stream codec or
   the `decode_events` helper for this operation.}

`SelectObjectContentEventStream` is a `@streaming` union with `@eventPayload`
members — an Amazon Event Stream (binary framed messages) over the streaming
HTTP body. The first S3 cut will **not support this operation at runtime**:

```ocaml
type select_object_content_output = {
  payload : Eio.Flow.source option   (* @httpPayload @streaming union *)
}
```

The generated operation will expose the same streaming field type as other
streaming outputs (raw `Eio.Flow.source option`), so the SDK compiles and the
API surface stays uniform, but `SelectObjectContent.request` will raise
`Not_implemented` (or return an `Error`) until/unless event-stream support is
added for a non-deprecated service. No `decode_events` helper is generated.

See §3.7 and §8.9 for the rationale and scope decision.

### Why a single `request` (not `request_streaming`)

Rejected alternative: keep `request` materialised and add a second
`request_streaming` for streaming ops. Field-type approach preferred because:

- A streaming op has no useful materialised form — a second function would be
  dead weight (you'd be buffering whole objects to satisfy a signature nobody
  should call).
- One code path: types, builders, and the protocol runtime all key off the
  same `@streaming` flag.
- Matches the stated preference: "the request interface can simply be
  different for those with the @streaming tag" — the function name is the
  same; the input/output types differ.

### Generated SDK streaming helper

The S3 SDK may expose a small convenience helper for callers who want an Eio
flow directly. It is generated only for S3 streaming operations and is not
part of the core `smaws_lib` HTTP signature:

```ocaml
(* sdks/s3/operations.ml — generated helper, if desired *)
val body_to_flow : Smaws_Lib.Http.Body.t -> Eio.Flow.source
```

This helper repeatedly calls `Http.Body.Stream.read` and yields each chunk
through an Eio flow, resolving when `final = true`. It lives in the generated
SDK, not in `smaws_lib/http`, so non-Eio clients are not forced to link Eio.

### Impact on existing protocols

None. AwsJson / AwsQuery have no `@httpPayload @streaming` members, so their
generated `Types`/`Builders`/`Operations` are unchanged. `Http.input_body`
gains a `` `Stream `` variant and `Body` gains a `Stream` sub-module; both are
additive. The mock HTTP client used by the conformance suite (`Http_mock`) is
extended to accept `` `Stream `` inputs and to expose response bodies through
`Body.Stream.read`.

---

## 2. S3 options as a client-construction parameter

### Detection (annotation-driven)

Codegen treats a service as S3 iff it has `aws.protocols#restXml` **and**
`aws.api#service.endpointPrefix = Some "s3"` (equivalently
`cloudTrailEventSource = "s3.amazonaws.com"`). When detected, the generated
SDK gains:

- an `Options` submodule (the S3 client-config record),
- a `make_context` constructor that injects the options into the `Context`.

If `endpointPrefix` is `None`, the service is treated as generic restXml and
no S3-specific options or addressing logic is emitted.

Per-operation annotations (`aws.customizations#s3UnwrappedXmlOutput`,
service-level `restXml noErrorWrapping: true`) are handled in the restXml
runtime, **not** in the options record — they are not client-configurable. The
options record holds only the runtime-configurable S3 settings from the
[Amazon S3 Customizations](https://smithy.io/2.0/aws/customizations/s3-customizations.html)
spec: addressing style, dual-stack, accelerate, ARN region, global endpoint.

### Before (non-S3, unchanged)

```ocaml
(* sdks/dynamodb/Smaws_Client_DynamoDB.ml — generated *)
module Types = Types
include Builders
include Operations
module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
```

User code:

```ocaml
let ctx = Smaws_Lib.Context.make_with_eio_http ~config ~sw net in
let (Ok out) = Smaws_Client_DynamoDB.GetItem.request ctx input in ...
```

No S3 options exist; `Context.make` has no S3 field.

### After — S3 SDK

```ocaml
(* sdks/s3/Smaws_Client_S3.ml — generated *)
module Types = Types
include Builders
include Operations
module Restxml_serializers = Restxml_serializers
module Restxml_deserializers = Restxml_deserializers

module Options = struct
  type addressing_style = [ `Virtual | `Path ]
  type t = {
    addressing_style : addressing_style;   (* default `Virtual *)
    use_dualstack_endpoint : bool;         (* default false *)
    use_accelerate_endpoint : bool;        (* default false *)
    use_arn_region : bool;                 (* default false *)
    use_global_endpoint : bool;            (* default false *)
  }
  let default =
    { addressing_style = `Virtual; use_dualstack_endpoint = false
    ; use_accelerate_endpoint = false; use_arn_region = false
    ; use_global_endpoint = false }
end

val make_context :
  ?config:Smaws_Lib.Config.t ->
  ?s3_options:Options.t ->
  sw:Eio.Switch.t ->
  < mono_clock : [> `Clock of Mtime.t ] Eio.Resource.t
  ; net : [> `Network | `Platform of [> `Generic | `Unix ] ] Eio.Resource.t
  ; .. > ->
  Smaws_Lib.Context.t
```

User code:

```ocaml
let ctx =
  Smaws_Client_S3.make_context ~config
    ~s3_options:{ Smaws_Client_S3.Options.default with
                  use_accelerate_endpoint = true }
    ~sw net
in
let (Ok out) = Smaws_Client_S3.GetObject.request ctx input in ...
```

Operations are still called as `Smaws_Client_S3.GetObject.request ctx input` —
the options live in the `ctx`, not per-call, matching how AWS SDKs in other
languages do it.

### How options reach the runtime without polluting non-S3 contexts

`Context.t` gains a single optional, annotation-driven field. The default is
`None`, so every existing AwsJson / AwsQuery SDK and test is unchanged.

```ocaml
(* smaws_lib/Context.ml *)
type 'http_type t = {
  config : Config.t;
  http : 'http_type;
  http_type : (module Http.Client with type t = 'http_type);
  service_customization : Service_customization.t option;   (* NEW *)
}

val make :
  ?service_customization:Service_customization.t ->         (* NEW optional *)
  http_type:(module Http.Client with type t = 'http_type) ->
  ?config:Config.t ->
  unit ->
  'http_type t

val make_with_eio_http :
  ?service_customization:Service_customization.t ->         (* NEW optional *)
  ?config:Config.t ->
  sw:Eio.Switch.t ->
  < .. > -> Http.Http_Client_Eio.t t
```

```ocaml
(* smaws_lib/Service_customization.ml — NEW *)
module S3 = struct
  type addressing_style = [ `Virtual | `Path ]
  type t = {
    addressing_style : addressing_style;
    use_dualstack_endpoint : bool;
    use_accelerate_endpoint : bool;
    use_arn_region : bool;
    use_global_endpoint : bool;
  }
  let default = { ... }
end

type t = S3 of S3.t
```

The generated `Smaws_Client_S3.make_context` is a one-line wrapper:

```ocaml
let make_context ?config ?s3_options ~sw net =
  Smaws_Lib.Context.make_with_eio_http
    ?config
    ~service_customization:
      (S3 (Option.value s3_options ~default:Options.default))
    ~sw net
```

The restXml runtime reads `Context.service_customization`:

```ocaml
(* smaws_lib/protocols_impl/AwsRestXml.ml — sketch *)
let resolve_host ~ctx ~bucket ~region =
  match Context.service_customization ctx with
  | Some (S3 opts) -> S3_addressing.resolve_host ~opts ~bucket ~region
  | None ->              (* generic restXml: use modeled HTTP bindings verbatim *)
    Fmt.str "%s.%s.amazonaws.com" service_prefix region
```

This is what keeps the generic `aws.protocoltests.restxml` suite passing: it
has `service_customization = None`, so the runtime uses the modeled bindings
and does no bucket-to-host rewriting. The four `com.amazonaws.s3` conformance
ops run with `Some (S3 _)` and exercise the addressing matrix
(`S3DefaultAddressing`, `S3VirtualHostAddressing`, `S3PathAddressing`,
`S3VirtualHostDualstackAddressing`, `S3VirtualHostAccelerateAddressing`,
`S3VirtualHostDualstackAccelerateAddressing`, `S3OperationAddressingPreferred`).

### Operation-level addressing override

The S3 spec allows addressing to be set at env / file / client / **operation**
level, with operation winning (`S3OperationAddressingPreferred`). The
operation-level override is itself annotation-driven: S3 ops that need it
carry a `smithy.rules#staticContextParams` / operation config. For the first
cut we expose only the client-level `Options.t`; the operation-level override
is a Tier-3 extension that adds an optional `?s3_options` to the individual
operation's `request` (passed to the same `S3_addressing.resolve_host`).

Only **client-level (level 2)** and **operation-level (level 3)** options
matter for smaws. Environment/file configuration is intentionally outside
the scope of this library. Precedence is:

```
operation-level ?s3_options  → wins
client-level Options.t in Context.service_customization
```

If the operation-level override is present, it replaces the whole `Options.t`
for that call. The operation's own `S3OperationAddressingPreferred` preference
is treated as an operation-level override generated by codegen, so it takes
precedence over both. `Config.t` is unchanged: it continues to carry only
credentials, region, and endpoint; it does not carry S3 addressing options.

### Alternative considered (rejected)

Add `?s3:S3_options.t` directly to `Context.make`. Simpler one-liner, but bakes
an S3-specific field into the generic `Context` and doesn't scale to the other
AWS service customizations (Glacier, API Gateway, Machine Learning) listed in
the Smithy customizations spec. The `Service_customization.t` sum is the same
cost, stays clean, and is extensible.

---

## Summary of touched files

| Area | File | Change |
|------|------|--------|
| runtime | `smaws_lib/http/http.mli` / `.ml` | `input_body` += `` `Stream ``; `Body.Stream` sub-module |
| runtime | `smaws_lib/http/http_eio_http1_1_protocol_impl.ml` | map `Httpun.Body.Reader` to `Body.Stream.read` |
| runtime | `smaws_lib/http/http_eio_client.ml` | pass `` `Stream `` producer to HTTP/1.1 writer |
| runtime | `smaws_lib/http/http_types.ml` | `pp_input_body` / `equal_input_body` handle `` `Stream `` |
| runtime | `smaws_lib/Sign.ml` | add `sign_request_v4_unsigned_payload` |
| runtime | `smaws_lib/Context.mli` / `.ml` | `?service_customization` optional param + field; `?http_options` optional param + field |
| runtime | `smaws_lib/http/http.mli` / `.ml` | `Http.options` type (`{ follow_redirects : bool; max_redirects : int }`) |
| runtime | `smaws_lib/Service_customization.ml` | NEW — `S3.t` + closed sum |
| runtime | `smaws_lib/protocols_impl/AwsRestXml.ml` | NEW — restXml + S3 addressing |
| codegen | `codegen/AwsProtocolRestXml.ml` | NEW — emit HTTP bindings, streaming field types |
| codegen | `sdkgen/gen_types.ml`, `gen_builders.ml` | streaming member → `Eio.Flow.source` |
| codegen | `sdkgen/gen_module.ml` | emit `Options` + `make_context` when S3 detected |
| codegen | `smithy_ast/Trait.ml` | promote `AwsProtocolRestXmlTrait` to carry `noErrorWrapping` |
| tests | `smaws_test_support_lib/Http_mock.*` | accept `` `Stream ``; expose response bodies via `Body.Stream.read` |
| tests | `smaws_lib_test/` | add namespace-aware XML parser unit tests |
| tests | `model_tests/gen.ml` + `protocols/restxml/` | restXml + restxml.xmlns conformance targets |

No change to any existing `sdks/<svc>/` for AwsJson / AwsQuery services.

---

## 3. Other interface decisions to nail down

Beyond streaming (§1) and S3 options (§2), these generated-type / builder /
operation-signature decisions need to be fixed before restXml codegen is
written. Each is annotation-driven. Items are tagged by when they're needed:
**T0** = required to pass the generic `aws.protocoltests.restxml` suite,
**T1** = required for real S3, **T2** = required for S3-specific conformance
and client construction, **T3** = production hardening.

| Tier | Meaning |
|------|---------|
| **T0** | Generic restXml protocol conformance (`aws.protocoltests.restxml` suite). No S3-specific runtime. |
| **T1** | Real S3 functionality (`GetObject`/`PutObject`/`UploadPart`/etc.). Builds on T0. |
| **T2** | S3-specific customizations and client construction (`com.amazonaws.s3` conformance ops, `Options.t`, `make_context`). |
| **T3** | Production hardening and advanced features; not needed for the first working S3 client. |

Already handled (no change needed — confirmed against DynamoDB output):
`smithy.api#timestamp` → `Smaws_Lib.CoreTypes.Timestamp.t` (= `Ptime.t`);
`@timestampFormat` is already consumed in `AwsProtocolJson`; `smithy.api#enum`
→ plain variant type; `smithy.api#Unit` input/output →
`Smaws_Lib.Smithy_api.Types.unit_`; `@required` → non-`option` field /
required builder arg; greedy `{name+}` labels → `string` field (escaping is
runtime-only); `@endpoint` hostPrefix + `@hostLabel` → runtime composes the
host, no op-signature change (the labelled member is already modeled);
`noErrorWrapping` → error polymorphic-variant shape unchanged, runtime parses
bare `<Error>`; `@xmlAttribute`/`@xmlName`/`@xmlFlattened`/`@xmlNamespace` →
serialization-only, no OCaml type change.

### 3.1 `@httpPrefixHeaders` map type and key convention  — **T0**

S3 uses this heavily (`Metadata : x-amz-meta-*` on `GetObject` output,
`PutObject` input, `WriteGetObjectResponse`). Tests: `HttpPrefixHeaders`,
`HttpEmptyPrefixHeaders`.

The member targets a `map<string,string>`. Decision: represent as
`(string * string) list` (consistent with how headers are already
`(string * string) list` in `Http.headers`), with keys carrying the **full
header name including the prefix** (e.g. `"x-amz-meta-foo"`, not `"foo"`).
This matches what `Http.headers` already is and what the conformance tests
assert (`x-foo`, `x-foo-abc`, …). An empty map → no headers emitted; on
deserialise, only headers matching the prefix are collected into the map.

```ocaml
(* Types.ml *)
type get_object_output = {
  ...
  metadata : (string * string) list option;  (* @httpPrefixHeaders "x-amz-meta-" *)
  ...
}

(* Builders.ml *)
val make_get_object_input :
  ...
  ?metadata:(string * string) list ->
  unit -> get_object_input
```

Rejected: `string String.Map.t` — forces a map dependency and a canonical
key ordering the tests don't require; `(string * string) list` round-trips
through `Http.headers` with no conversion.

### 3.2 `@httpQueryParams` map type  — **T0**

Binds a `map<string,string>` member to query-string parameters (test:
`QueryParamsAsStringListMap`). Same decision as 3.1 for the same reasons:
`(string * string) list`, keys are the query parameter names. Serialiser
appends `&key=value` for each; deserialiser reads matching query params.

### 3.3 `@httpResponseCode` field  — **T0**

Binds the HTTP response status code to an output member (test:
`HttpResponseCode`, expects `201`). The member is an `integer` shape.
Decision: `int` field, non-optional (the status is always present on a
received response).

```ocaml
type http_response_code_output = {
  status : int;   (* @httpResponseCode *)
}
```

The `@http` trait's `code` property (e.g. `DeleteObjectTagging` → `204`)
is a runtime success-code check, **not** a bound field — no field generated
for it. Any 2xx is treated as success; the bound `@httpResponseCode` member
receives the actual received code.

### 3.4 `@httpPayload` scalar / structured payloads  — **T0**

When a top-level member has `@httpPayload`, it *replaces* the synthesised XML
body. The field type is just the member's normal type; the only decision is
optionality and Content-Type. Tests: `HttpStringPayload` (string),
`HttpEnumPayload` (enum), `HttpPayloadTraits` (blob),
`HttpPayloadWithStructure` (structure), `HttpPayloadWithUnion` (union),
`HttpPayloadTraitsWithMediaType` (`@mediaType`).

Decision: the field is **`option`** in the record (an empty body is valid —
`HttpPayloadTraitsWithNoBlobBody`, `RestXmlHttpPayloadWithUnsetUnion`).
Content-Type is derived from the target shape:

| Target shape | Content-Type |
|---|---|
| `string` | `text/plain` |
| `blob` | `application/octet-stream` |
| `structure` / `union` | `application/xml` |
| `enum` | `text/plain` (serialised as its string value) |
| any + `@mediaType "…"` | the `@mediaType` value wins |

A modeled `@httpHeader "Content-Type"` member (e.g. `PutObject.ContentType`)
**overrides** the payload-derived Content-Type — the user's value wins. This
is runtime negotiation; no field-type change, but the serialiser must check
for an explicit Content-Type header before computing the payload default.

```ocaml
type http_string_payload_input = { payload : string option }   (* @httpPayload string *)
type http_payload_with_structure_input = { nested : nested_payload option } (* @httpPayload structure *)
```

### 3.5 `@default` builder auto-fill  — **T1**

Currently `@default` is declared (`Trait.DefaultTrait`) but **not consumed**
— a `@default` field is treated like any non-`@required` field: `t option` in
the record, `?arg` defaulting to `None` in the builder. S3 needs it:
`WriteGetObjectResponse.Body` has `@default ""` (a streaming blob → empty
flow).

Decision: keep the record field `t option` (so callers can always tell
"unset" apart from "set to the default"), but the **builder** auto-fills the
modeled default when the argument is omitted, and the **serialiser** treats
`None` as "use the modeled default". Concretely the builder argument stays
optional `?body`, and when omitted the builder stores `Some <default>` (for
non-streaming) / `Some <empty_flow>` (for streaming) rather than `None`.

```ocaml
(* WriteGetObjectResponse.Body @default "" *)
val make_write_get_object_response_request :
  request_route:request_route ->
  request_token:request_token ->
  ?body:Eio.Flow.source ->      (* omitted → builder substitutes the empty flow *)
  unit -> write_get_object_response_request
```

This keeps the record shape uniform with non-`@default` optional fields and
avoids a "required-but-defaulted" third kind of field.

### 3.6 `@mediaType` Content-Type override  — **T0**

`@mediaType` on the target of an `@httpPayload` member overrides the
Content-Type table in 3.4 (test: `HttpPayloadTraitsWithMediaType`). It's a
runtime/serialiser read; **no generated-type change**. Called out here only
because it interacts with the 3.4 Content-Type negotiation — the serialiser
must check `@mediaType` on the payload target shape before falling back to
the shape-derived default.

### 3.7 Event-stream output field type  — **dropped**

`SelectObjectContent` output `Payload` is a `@streaming` union with
`@eventPayload` members, delivered as Amazon Event Stream binary frames over
the chunked HTTP body. Because S3 Select has been deprecated by AWS and is no
longer available to new customers, the first S3 cut **does not implement
`decode_events` or the Amazon Event Stream codec**.

For consistency with §1, the generated output field is still
`Eio.Flow.source option`:

```ocaml
type select_object_content_output = {
  payload : Eio.Flow.source option   (* @httpPayload @streaming union *)
}
```

The SDK compiles and the API surface stays uniform with other streaming
payloads, but calling `SelectObjectContent.request` at runtime raises
`Not_implemented` (or returns an `Error`). No `decode_events` helper is
generated. If a non-deprecated service needs event-stream support in the
future, the codec can be added then without changing the field type — only
the helper and runtime decoding logic need to be introduced.

### 3.8 `@paginated` paginator interface  — **T3**

`ListObjectsV2`, `ListBuckets`, `ListParts`, `ListDirectoryBuckets`,
`ListObjectAnnotations`. No paginator codegen/runtime exists today. The four
S3 conformance ops include `ListObjectsV2` but only its single-page request
shape is asserted, so this is **not** needed for the conformance suite — it's
production. Decide now to avoid retrofitting the operations module shape.

Decision: emit a `paginate` function per paginated op that returns an
`Eio.Stream.recv` of full pages (output records), driving `inputToken` /
`outputToken` / `pageSize` automatically. The existing `request` /
`request_with_metadata` stay for single-page use.

```ocaml
module ListObjectsV2 : sig
  val request : ...                          (* unchanged, single page *)
  val request_with_metadata : ...            (* unchanged *)

  val paginate :                             (* NEW, only on @paginated ops *)
    'http_type Smaws_Lib.Context.t ->
    list_objects_v2_input ->                 (* first page input; token is auto-filled *)
    list_objects_v2_output Eio.Stream.recv
end
```

Rejected: returning a flat `item Eio.Stream.recv` — loses the per-page
metadata (`IsTruncated`, `KeyCount`, response headers) and forces the runtime
to know the list's item member name. Pages-as-stream keeps each `output`
intact and lets the caller flatten if they want.

### 3.9 `@sensitive` derived-show redaction  — **T3**

6 uses in S3 (e.g. `SSECustomerKey`). `Trait.SensitiveTrait` is declared but
not consumed. Decision: sensitive fields keep their real type and `equal`,
but the generated `[@@deriving show]` for a sensitive field renders
`<redacted>` instead of the value. This is the AWS-SDK convention and avoids
leaking secrets into logs / error messages. No field-type or builder change.

```ocaml
type put_object_input = {
  sse_customer_key : sse_customer_key option;   (* @sensitive *)
  ...
}
[@@deriving show]   (* show for sse_customer_key renders "<redacted>" *)
```

Implementation: codegen emits a per-field custom `pp` for sensitive members
rather than the deriving-generated one. Because `show` is used by
`error_to_string` and the test mock's request logging, this is the right
place rather than at the HTTP layer.

### 3.10 Operation-level S3 addressing override  — **T3**

The S3 spec allows `addressing_style` at env / file / client / **operation**
level, operation winning (test: `S3OperationAddressingPreferred`). The
client-level `Options.t` from §2 covers the conformance ops except this one.
Decision: add an optional `?s3_options:Options.t` to the individual
`request` / `request_with_metadata` of S3 operations, which overrides the
context's `Options.t` for that call only. Non-S3 ops never have this
parameter; S3 ops have it as a trailing optional.

```ocaml
(* S3 ops only *)
val request :
  ?s3_options:Options.t ->
  'http_type Smaws_Lib.Context.t ->
  list_objects_v2_input ->
  ( list_objects_v2_output, [> …] ) result
```

This is the only place an S3-specific parameter appears on a per-call
operation signature; it's generated only because the model allows
operation-level addressing config.

---

## 4. Summary of all interface changes

| # | Change | Where | When |
|---|--------|-------|------|
| 1 | streaming `@httpPayload` → `Eio.Flow.source` field | Types/Builders | T1 |
| 1 | `Http.input_body` += `` `Stream ``; `Body.Stream` sub-module | http.mli | T1 |
| 2 | `?s3_options` at client construction; `Service_customization.t` | Context + SDK module | T2 |
| 3.1 | `@httpPrefixHeaders` → `(string * string) list`, full-key | Types/Builders | T0 |
| 3.2 | `@httpQueryParams` → `(string * string) list` | Types/Builders | T0 |
| 3.3 | `@httpResponseCode` → `int` field | Types | T0 |
| 3.4 | `@httpPayload` scalar/structured → `t option`, Content-Type table | runtime | T0 |
| 3.5 | `@default` → builder auto-fills; record stays `t option` | Builders + serialiser | T1 |
| 3.6 | `@mediaType` overrides Content-Type | runtime | T0 |
| 3.7 | event-stream `@httpPayload` — `SelectObjectContent` unsupported, same field type for compile | Types | T3 (dropped) |
| 3.8 | `@paginated` → `paginate : … -> output Eio.Stream.recv` | Operations | T3 |
| 3.9 | `@sensitive` → `<redacted>` in derived `show` | Types (show) | T3 |
| 3.10 | per-call `?s3_options` on S3 ops only | Operations | T3 |
| — | `?http_options` redirect policy in `Context.make` | Context | T2 |
| — | unmodeled errors carry `request_id` | `AwsErrors` | T0 |

No change to any existing `sdks/<svc>/` for AwsJson / AwsQuery services.

---

## 5. HTTP location bindings: routing members out of the body

restXml (and restJson) serialisers must **partition** an operation's
input/output members by where they go on the wire. This is the single
biggest structural difference from the AwsJson / AwsQuery serialisers we
have today, which put every top-level member into the body document.

### 5.1 Which annotations relocate a member out of the body

| Trait | Direction | Wire location | Body effect |
|-------|-----------|---------------|-------------|
| `@httpLabel` | input only | URI template label (`{name}` / `{name+}`) | removed from body |
| `@httpQuery("k")` | input only | query string `?k=…` | removed from body |
| `@httpQueryParams` | input only | map → multiple query params | removed from body |
| `@httpHeader("H")` | input + output + error | header `H` | removed from body |
| `@httpPrefixHeaders("p-")` | input + output + error | every `p-*` header | removed from body |
| `@httpResponseCode` | output only | HTTP status code | removed from body |
| `@httpPayload` | input + output | **replaces** the whole body | every other member is removed from the body and must be bound elsewhere (model-validated) |

A member with **none** of these traits is a {e document member} and goes
into the synthesised XML body (restXml) / JSON body (restJson).

### 5.2 The serialiser partition (confirmed against the conformance model)

Codegen must split the input structure's members into three buckets:

1. **payload** — the single `@httpPayload` member, if any.
2. **bound** — members with `@httpLabel` / `@httpQuery` / `@httpQueryParams`
   / `@httpHeader` / `@httpPrefixHeaders` / `@httpResponseCode`.
3. **document** — everything else.

The request is then assembled as:

```
uri      = render_uri_template(labels)            # bucket: bound (@httpLabel)
query    = assemble_query(queries, queryParams)    # bucket: bound (@httpQuery/@httpQueryParams)
headers  = assemble_headers(headers, prefixHeaders) # bucket: bound (@httpHeader/@httpPrefixHeaders)
body     = case payload of                          # bucket: payload OR document
           | Some m -> serialise_payload m           #   @httpPayload: body IS that member
           | None   ->                              #   no payload:
               if document = [] then ""             #     no document members → empty body
               else synthesise_xml root document    #     synthesised XML from document members
```

The crucial line: `synthesise_xml root document` iterates **only the
document bucket**, never the bound bucket. Conformance proof:
`SimpleScalarPropertiesInputOutput` has `foo` (`@httpHeader X-Foo`) plus ten
scalar document members. The expected request has header `X-Foo: Foo` and a
body of `<SimpleScalarPropertiesRequest><stringValue>…</…>` containing
only the document members — `foo` does {e not} appear in the body even
though it's in the input params. Same for `PutWithContentEncodingInput`
(`encoding` → `Content-Encoding` header, `data` → body) and `ComplexError`
(`Header` → header, `TopLevel`/`Nested` → error body XML).

When `@httpPayload` is present, the synthesise-XML step is skipped entirely
and `document` is required to be empty — and the conformance model confirms
it always is: **zero** restXml test structures combine `@httpPayload` with an
unbound member. Smithy model validation enforces this, so codegen can assert
it rather than handle orphan document members.

### 5.3 The deserialiser partition (symmetric)

```
status   = response.status                          # bucket: bound (@httpResponseCode)
headers  = read_headers(response.headers)           # bucket: bound (@httpHeader/@httpPrefixHeaders)
body     = case payload of
           | Some m -> deserialise_payload response.body   # raw body → that member
           | None   ->
               if document = [] then { }              # empty body → all-document-None record
               else parse_xml response.body document  # parse XML, fill document members
```
`read_headers` picks only the modeled header names (and, for
`@httpPrefixHeaders`, every header starting with the prefix); it does {e not}
feed those headers into the XML parser. The XML parser only fills the
document bucket. So a value is never read twice.

### 5.4 Per-location serialisation rules (why the serialiser must know the bucket)

The same scalar shape serialises differently depending on its binding
location, so the emit function is dispatched by bucket, not by shape alone:

- **blob** — as a document member: base64-encoded XML text (`XmlBlobs`:
  `<data>dmFsdWU=</data>`). As `@httpPayload`: {e raw bytes} as the body
  (`HttpPayloadTraits`: body = `blobby blob blob`, not base64). As
  `@httpHeader`/`@httpQuery`: base64-encoded string (header/query blobs are
  base64).
- **timestamp** — default format depends on location: `@httpLabel` /
  `@httpQuery` → `date-time` (`HttpRequestWithLabels`:
  `2019-12-16T23%3A48%3A18Z`); `@httpHeader` → `http-date`
  (`TimestampFormatHeaders`: `Mon, 16 Dec 2019 23:48:18 GMT`); document →
  `date-time` (`XmlTimestamps`). `@timestampFormat` overrides any default.
- **string / enum** — `@httpPayload` string/enum → raw text body,
  `Content-Type: text/plain` (`HttpStringPayload`, `HttpEnumPayload`).
  Document string/enum → XML text node.
- **structure / union** — `@httpPayload` structure/union → serialised as XML
  with the root element = the structure's name (or its `@xmlName`), {e not}
  the operation input shape name (`HttpPayloadWithStructure`: root is
  `NestedPayload`, not `HttpPayloadWithStructureInputOutput`).

### 5.5 XML traits apply only to document / payload members

`@xmlName`, `@xmlFlattened`, `@xmlAttribute`, `@xmlNamespace` are meaningless
for header/query/label members — they only affect XML serialisation. Codegen
must gate them on the member being in the document or payload bucket. A
member that is `@httpHeader` + `@xmlName` ignores the `@xmlName`. (The
conformance model doesn't put XML traits on bound members; codegen should
simply not read them there.)

### 5.6 Codegen consequence vs today's AwsJson / AwsQuery

Today's `codegen/AwsProtocolJson.ml` and `codegen/AwsProtocolQuery.ml`
iterate {e every} top-level input member and emit it into the JSON / query
body. That's correct for those protocols because neither uses HTTP binding
traits. For `codegen/AwsProtocolRestXml.ml` the member loop must instead:

```ocaml
(* sketch of the generated per-operation serialiser structure *)
let serialise_request input =
  let labels   = members_with HttpLabelTrait input in
  let queries  = members_with HttpQueryTrait input in
  let qparams  = members_with HttpQueryParams input in
  let headers  = members_with HttpHeaderTrait input in
  let prefixes = members_with HttpPrefixHeadersTrait input in
  let payload  = member_with HttpPayloadTrait input in
  let document = members_with_no_http_binding input in
  let uri      = render_uri ~labels http.uri in
  let query    = render_query ~queries ~qparams in
  let headers  = render_headers ~headers ~prefixes in
  let body =
    match payload with
    | Some (_, m) -> serialise_payload m            (* raw / text / xml-structure *)
    | None when List.is_empty document -> ""
    | None -> Xml.synthesise ~root:input_shape_name ~document
  in
  { Http.uri; query; headers; body }
```

`Xml.synthesise` (the new write side of `smaws_lib/Xml.ml`) takes only the
document bucket; the per-member XML emit functions already used for AwsQuery
structures are reused here, unchanged, because AwsQuery already builds XML
from structure members. The new work is the {e bucketing} and the
{e per-location} emit for labels/queries/headers (sections 5.4 and 3.1–3.3).

The deserialiser mirrors this exactly: a `read_headers` step, a
`read_status` step, and a `parse_xml` step that only fills document members
(or a `deserialise_payload` step that reads the raw body as the payload
member's type). No member is read from two places.

---

## 6. Annotation-by-annotation resolution reference

Master list of every annotation the restXml + S3 work touches, where it is
solved (codegen type / serialiser / deserialiser / runtime / S3-specific),
and the conformance test that proves the behaviour. {e Status key}:
**existing** = already handled by AwsJson/AwsQuery codegen and reused as-is;
**new-restXml** = new restXml serialiser/deserialiser work; **new-S3** =
S3-specific runtime; **new-runtime** = `smaws_lib` change; **T3** = deferred.

### 6.A HTTP location-binding traits (restXml serialiser/deserialiser; §5)

| Annotation | Resolution | Proof |
|---|---|---|
| `@httpLabel` | **new-restXml**. Substitute into URI template; non-greedy `{x}` percent-encodes `/` too; greedy `{x+}` keeps `/`; do NOT normalise dot segments. Member excluded from body. | `HttpRequestWithLabels`, `HttpRequestWithGreedyLabelInPath`, S3 `S3PreservesLeadingDotSegmentInUriLabel`, S3 `S3EscapeObjectKeyInUriLabel` |
| `@httpQuery("k")` | **new-restXml**. Emit `?k=value`; lists/sets → repeated `k=a&k=b`; scalars as strings; timestamp default `date-time`; NaN/Infinity as `NaN`/`Infinity`; percent-encode all non-unreserved in the value. Excluded from body. | `AllQueryStringTypes`, `ConstantAndVariableQueryString`, `RestXmlQueryStringEscaping`, `RestXmlSupportsNaNFloatQueryValues` |
| `@httpQueryParams` | **new-restXml**. Map → `key=value` for each pair. Named `@httpQuery` members take precedence over `@httpQueryParams` entries with the same key. Excluded from body. | `QueryPrecedence`, `RestXmlQueryStringMap`, `QueryParamsAsStringListMap` |
| `@httpHeader("H")` | **new-restXml**. Set header `H: value`; timestamp default `http-date`; blobs base64; `@timestampFormat` overrides. Excluded from body. A modeled `@httpHeader "Content-Type"` overrides the payload-derived Content-Type (§3.4). | `InputAndOutputWithHeaders`, `TimestampFormatHeaders`, `SimpleScalarProperties` (X-Foo) |
| `@httpPrefixHeaders("p-")` | **new-restXml**. Map → one header per pair, key = full header name incl. prefix (`p-foo`). Only headers matching the prefix are collected on deserialise. Excluded from body. | `HttpPrefixHeaders`, `HttpEmptyPrefixHeaders` |
| `@httpResponseCode` | **new-restXml**. Output-only; bind `response.status` to an `int` field. Excluded from body. | `HttpResponseCode` (201) |
| `@httpPayload` | **new-restXml**. Replaces the body entirely with this one member; all other members must be bound elsewhere (model-validated, asserted in codegen). Content-Type per target shape (§3.4); `@mediaType` wins. blob→raw bytes (NOT base64); string/enum→raw text; structure/union→XML rooted at the structure's `@xmlName`/name, not the op input name. | `HttpPayloadTraits`, `HttpStringPayload`, `HttpEnumPayload`, `HttpPayloadWithStructure`, `HttpPayloadWithUnion`, `HttpPayloadTraitsWithMediaType` |
| `@http` (operation) | **new-restXml**. `method`/`uri` drive the request line; `code` (if present) is the success status (any 2xx also succeeds); constant query in `uri` (e.g. `?foo=bar`, `?list-type=2`, `?tagging`, `?location`) is preserved verbatim alongside member-derived query. | `EmptyInputAndEmptyOutput`, `ConstantQueryString`, S3 `DeleteObjectTagging` (?tagging), S3 `ListObjectsV2` (?list-type=2), S3 `GetBucketLocation` (?location) |
| `@httpError` (on error structure) | **new-restXml**. The status code for that error variant (default 400 client / 500 server). Deserialiser maps status + body `Code` → variant. | `ComplexError` (403), `InvalidGreeting` (400) |

### 6.B XML shaping traits (Xml.synthesise / Xml.parse; document & payload members only)

| Annotation | Resolution | Proof |
|---|---|---|
| `@xmlName` | **new-restXml**. Rename the member's XML element (or, on a `@httpPayload` structure, the payload root). Applies only to document/payload members, never bound members. | `XmlMapsXmlName`, `BodyWithXmlName`, `HttpPayloadWithStructure` (root `NestedPayload`) |
| `@xmlFlattened` | **new-restXml**. Unwrap list `member` / map `entry` wrappers into the containing element. | `FlattenedXmlMap`, `FlattenedXmlMapWithXmlName`, S3 `ListObjectsV2` `Contents`/`CommonPrefixes` |
| `@xmlAttribute` | **new-restXml**. Serialise the member as an attribute on the containing element (escaped per XML attr rules). | `XmlAttributes`, `XmlAttributesInMiddle`, `XmlAttributesOnPayload` |
| `@xmlNamespace` | **new-restXml**. Emit `xmlns="uri"` (default) or `xmlns:prefix="uri"` on the element. Service-level `@xmlNamespace` applies to the synthesised root. The parser matches local names regardless of namespace. | `XmlNamespaces`, `RestXmlWithNamespace` service, `XmlMapWithXmlNamespace`, `HttpPayloadWithXmlNamespace` |
| `@timestampFormat` | **existing** in `AwsProtocolJson`; **reuse** in restXml. Overrides per-location defaults (§5.4): document→`date-time`, label/query→`date-time`, header→`http-date`. | `XmlTimestamps`, `TimestampFormatHeaders` |
| `@mediaType` | **new-restXml**. On the target of `@httpPayload`, overrides the shape-derived Content-Type. Serialiser read only; no type change. | `HttpPayloadTraitsWithMediaType` |

### 6.C Member-value semantics traits (codegen Types/Builders)

| Annotation | Resolution | Status |
|---|---|---|
| `@required` | **existing**. Non-`option` record field; required builder arg. | existing |
| `@default` | **new** (§3.5). Record field stays `t option`; builder auto-fills the modeled default when the arg is omitted; serialiser treats `None` as "use default". | new-restXml, T1 (S3 `WriteGetObjectResponse.Body @default ""`) |
| `@sensitive` | **new** (§3.9). Real type + `equal` unchanged; derived `show` renders `<redacted>`. | new, T3 |
| `@idempotencyToken` | **existing** in AwsQuery (`Uuid.with_generator`). **reuse** for restXml when the member is `@httpQuery`/`@httpHeader` (auto-fill UUID when `None`). | existing; restXml test `QueryIdempotencyTokenAutoFill` |
| `@enum` (string) | **existing**. Plain variant type. | existing |
| `smithy.api#Unit` (input/output) | **existing**. `Smithy_api.Types.unit_ = ()`; no body synthesised. | existing (`EmptyInputAndEmptyOutput`, `NoInputAndOutput`) |

### 6.D Protocol, error, and auth traits (restXml runtime)

| Annotation | Resolution | Status |
|---|---|---|
| `aws.protocols#restXml` | **new-runtime** + **new-restXml**. Trait carries `{ noErrorWrapping : bool; http : string list; eventStreamHttp : string list }` — promote `Trait.AwsProtocolRestXmlTrait` from a bare variant to a record. `noErrorWrapping` switches error parsing between `<ErrorResponse><Error>…` and bare `<Error>…`. | new; S3 `noErrorWrapping: true` (S3OperationNoErrorWrappingResponse), generic suite wrapped |
| `smithy.api#error` (`client`/`server`) | **existing** in AwsQuery error gen; **reuse**. Builds the error polymorphic variant; default status 400/500. | existing |
| `aws.auth#sigv4` | **existing** (`Sign.ml`). Signs the request. | existing |
| `aws.auth#unsignedPayload` + `smithy.api#auth` | **new-runtime**. sigv4 with `x-amz-content-sha256: UNSIGNED-PAYLOAD` (no body hash). Selected per-operation from `@auth` allowed schemes. | new, T1 (S3 `WriteGetObjectResponse`) |
| `aws.protocols#httpChecksum` (`requestAlgorithmMember`/`requestChecksumRequired`/`responseAlgorithms`) | **new-runtime**. Compute CRC32/CRC32C/CRC64NVME/SHA1/SHA256/SHA512/MD5/XXHASH* and send as `x-amz-checksum-*` header or `x-amz-trailer` (chunked trailers). Algorithm chosen from the member named by `requestAlgorithmMember`; auto-compute when `requestChecksumRequired`. | new, T1 (33 S3 ops) |
| `smithy.api#requestCompression` (`encodings`) | **new-runtime**. gzip the body, append to `Content-Encoding`. (Already designed for AwsQuery — `refactorings/add_request_compression.md`.) | new; restXml test `PutWithContentEncoding` |

### 6.E Streaming / event-stream traits (Types + runtime; §1, §3.7)

| Annotation | Resolution | Status |
|---|---|---|
| `smithy.api#streaming` (on blob/union) | **new**. `@httpPayload @streaming` member → `Eio.Flow.source` field (§1). Request: `Http.input_body` += `` `Stream ``; response: `Http.Body.Stream.read`. `SelectObjectContent` is dropped — see §3.7 / §8.9. | new, T1 |
| `smithy.api#eventPayload` (union member) | **new**. Event-stream member carried in the event payload. {e Not implemented for S3 Select because the operation is deprecated.} If a non-deprecated service needs it later, the codec is added without changing the streaming field type. | new, T3 (dropped for S3) |
| `smithy.api#eventHeader` (union member) | **new**. Event-stream member carried in the event header. {e Not implemented for S3 Select because the operation is deprecated.} | new, T3 (dropped for S3) |

### 6.F S3-specific traits and customizations (S3 runtime + serialiser)

| Annotation / customization | Resolution | Status |
|---|---|---|
| `aws.customizations#s3UnwrappedXmlOutput` (operation) | **new-restXml**. Skip the operation-level XML wrapper on the response; the output shape's `@xmlName`/name is the root element directly. | new, T2 (S3 `GetBucketLocation`) |
| `aws.api#service` (`endpointPrefix`, `sdkId`, `cloudTrailEventSource`, `arnNamespace`) | **existing** (`Service_metadata`). `endpointPrefix="s3"` + `restXml` is the S3-detection signal that triggers `Options` + `make_context` generation (§2). | existing + new-S3 detection |
| S3 bucket virtual-host vs path addressing (spec, not a model trait) | **new-S3**. `Options.addressing_style`: `Virtual` → move `Bucket` `@httpLabel` from URI path to host prefix (`bucket.s3.region.amazonaws.com`); `Path` → keep `/{bucket}`. Default `Virtual`. | new, T2 (S3 `S3DefaultAddressing`, `S3VirtualHostAddressing`, `S3PathAddressing`) |
| S3 dual-stack endpoint (spec) | **new-S3**. `Options.use_dualstack_endpoint` → insert `.dualstack` after `s3` before region. Requires `Virtual`. | new, T2 (S3 `S3VirtualHostDualstackAddressing`) |
| S3 transfer acceleration (spec) | **new-S3**. `Options.use_accelerate_endpoint` → replace `s3` with `s3-accelerate`, drop region. Combined with dualstack → `s3-accelerate.dualstack`. Requires `Virtual`. | new, T2 (S3 `S3VirtualHostAccelerateAddressing`, `S3VirtualHostDualstackAccelerateAddressing`) |
| S3 operation-level addressing override (spec) | **new-S3** (§3.10). `?s3_options:Options.t` on S3 ops' `request`, overriding the context's `Options.t` for one call. | new, T3 (S3 `S3OperationAddressingPreferred`) |
| `AWS::S3::ForcePathStyle` / `Accelerate` / `UseArnRegion` / `UseGlobalEndpoint` / `DisableMultiRegionAccessPoints` | **T3**. These are {e built-in parameters of `smithy.rules#endpointRuleSet`}, not shape traits. First-cut `S3_options.t` carries `force_path_style`/`use_arn_region`/`use_global_endpoint` directly; the full rules engine (§6.G) consumes them properly later. | new-S3 fields now; rules engine T3 |

### 6.G Endpoint, pagination, and rules traits (T3)

| Annotation | Resolution | Status |
|---|---|---|
| `smithy.api#endpoint` (`hostPrefix`) + `smithy.api#hostLabel` | **new-runtime**, T3. Compose `hostPrefix` (with `{label}` substituted from `@hostLabel` members) onto the resolved host. No op-signature change (the labelled member is already modeled). | new, T3 (S3 `WriteGetObjectResponse`; restXml `EndpointWithHostLabelOperation`) |
| `smithy.api#paginated` (`inputToken`/`outputToken`/`pageSize`) | **new**, T3 (§3.8). Emit `paginate : ctx -> input -> output Eio.Stream.recv` driving the token members automatically. | new, T3 (S3 `ListObjectsV2`, `ListBuckets`, `ListParts`) |
| `smithy.rules#endpointRuleSet` (+ `endpointTests`/`endpointBdd`) | **T3**. Full endpoint rules engine. First cut: hard-code region→host and the S3 addressing matrix; ignore the rule set. | T3 |
| `smithy.rules#staticContextParams` / `contextParam` | **T3**. Feed operation context into the rules engine. 129 uses in S3 (Bucket/Key as context params). | T3 |
| `smithy.api#retryable` | **existing/T3**. Retry policy on the error variant. Not a serialisation concern. | T3 |

### 6.H Validation / constraint traits — out of scope for serialisation

`@length`, `@range`, `@pattern`, `@uniqueItems`, `@sensitiveStrings`
constrain values; they are not read by the restXml serialiser. `@required`
and `@default` are the only constraint traits that affect wire shape
(§6.C). Validation is a separate workstream (TODO.md lists it as pending).

---

## 7. Design aspects still open / needing a decision

Things called out earlier that are not yet pinned to a concrete resolution:

1. **Error `Code` → variant mapping & unmodeled errors.** The deserialiser
   reads `Code` from the body and matches the shape name to the operation's
   modeled error variants. Open: what variant is produced for an S3 error
   {e not} in the operation's `errors` list (e.g. a service-side
   `InternalError`)? Proposal: fall back to the existing
   `Smaws_Lib.Protocols.AwsRestXml.error` / `AWSServiceError` carrier with
   the raw `Code`/`Message`/`RequestId`, mirroring how AwsJson/AwsQuery
   surface unmodeled errors. Needs confirming against the existing
   `AwsErrors.aws_service_error` shape.

2. **Success-status range.** `@http code` declares one success code (e.g.
   204 for `DeleteObjectTagging`), but `GetObject` legitimately returns
   304 (Not Modified) for conditional requests. Decision needed: treat any
   2xx as success, AND treat 304 as success for GETs? Or only honor the
   modeled `code` + 2xx? Proposal: any 2xx is success; 304 is success only
   when the operation's `@http method = GET` (matches AWS SDK behavior).

3. **Streaming + checksum interaction.** `@httpChecksum` with a streaming
   body requires chunked transfer with `x-amz-trailer` checksums even when
   `Content-Length` is known. Open: when both `@httpChecksum` and a
   streaming `@httpPayload` are present (e.g. `PutObject` with
   `ChecksumAlgorithm`), the serialiser must wrap the flow in an
   aws-chunked encoder that emits the checksum trailer. This is the most
   complex serialiser interaction; needs its own sub-design before T1
   implementation.

4. **`Content-Length` resolution order for streaming input.** When the
   user provides `@httpHeader Content-Length` (modeled on `PutObject`), use
   it. Else if the runtime knows the producer length (e.g. from a file size
   or an explicit wrapper), use it. Else chunked. Confirm this order and
   whether a user-provided `Content-Length` that disagrees with the actual
   bytes is an error or trusted. Note that the old `` `Flow `` sketch carried
   an `int64 option` length; the new `` `Stream `` producer does not, so the
   length is tracked by the restXml runtime as a separate piece of metadata
   when it is available.

5. **Namespace handling in the existing `Xml.ml` parser.** `Read.sequence`
   already matches tag names ignoring namespace when `ns` is `None`. Need
   to confirm it correctly parses responses with a default `xmlns` (e.g.
   S3 `GetBucketLocation` body `<LocationConstraint xmlns="…">`) and that
   `@xmlNamespace`-prefixed elements round-trip. If the parser needs
   namespace-aware matching, this is a runtime change to scope now.

6. **`@httpPayload` structure/union root naming with `@xmlNamespace`.**
   `HttpPayloadWithXmlNamespace` sends `<NestedPayload xmlns="…">`. Need
   to confirm the payload root inherits the service `@xmlNamespace` by
   default, or only when the structure has its own `@xmlNamespace`. (The
   generic `RestXmlWithNamespace` service suggests service-level
   `@xmlNamespace` applies to synthesised roots; whether it also applies
   to `@httpPayload` roots is untested in the suite — pick the
   AWS-SDK-consistent answer: yes.)

7. **`Uri` construction without dot-segment normalisation.** S3 requires
   `/../key.txt` to be sent verbatim. Need to audit `Uri.of_string` /
   `Uri.to_string` / the eio httpun client path handling to ensure nothing
   calls `Uri.normalize` or RFC 3986 path-segment merging on the request
   path. If it does, the restXml runtime must build the raw path string
   and bypass `Uri` path normalisation.

8. **Bucket-name DNS validity forcing path-style fallback.** When
   `addressing_style = Virtual` but the bucket name is not DNS-compatible
   (contains uppercase, `_`, starts with `.`/`-`, etc.), AWS SDKs fall
   back to path-style. Decide whether the first cut does this fallback or
   requires the user to set `Path` explicitly. Proposal: do the fallback
   (matches every other AWS SDK and avoids request failures).

9. **Event-stream codec source.** `SelectObjectContent` is deprecated, so
    we do not need an Amazon Event Stream decoder for the S3 work. If a
    non-deprecated service needs event streams in the future, the codec can
    be hand-rolled at that point. This question is therefore {e dropped} for
    the current plan.

10. **`@auth` scheme selection at runtime.** `WriteGetObjectResponse`
    lists `aws.auth#unsignedPayload` via `@auth`. The runtime must pick the
    right signer per operation. Open: is scheme selection purely
    model-driven (codegen emits which signer to call), or runtime-driven
    (Context carries allowed schemes, the protocol picks)? Proposal:
    codegen-driven — the operation's generated `request` calls the signer
    the model dictates, keeping the runtime simple.

---

## 8. Resolutions for the §7 open questions

Resolutions recorded after spec research (Smithy 2.0 HTTP bindings,
streaming, Amazon Event Stream; AWS S3 sigv4-streaming-trailers; opam
package search). Each item references the §7 number.

### 8.1 Unmodeled errors — reuse existing carrier

Confirmed: reuse `Smaws_Lib.AwsErrors.aws_service_error` as the fallback
variant when the restXml error body's `Code` does not match any modeled
error shape in the operation's `errors` list. The error polymorphic
variant for an op becomes `[> …modeled errors… |
`AWSServiceError of AwsErrors.aws_service_error ]`, identical to how
AwsJson/AwsQuery surface unmodeled service errors today. The record carries
`message`, `request_id` and `_type` (with `namespace` and `name`):

```ocaml
(* smaws_lib/AwsErrors.ml *)
type namespaced_error = { namespace : string; name : string }

type aws_service_error = {
  message : string option;
  request_id : string option;
  _type : namespaced_error;
}
```

`Code` maps to `_type.name`, `Message` maps to `message`, and `RequestId`
is captured from the `<RequestId>` element (wrapped errors) or the
`x-amz-request-id` / `x-amzn-requestid` header when present. `Type`
(sender/receiver) is ignored for the generic carrier; it remains available
in the raw XML if a future deserializer needs it.

### 8.2 Redirects / 3xx — HTTP-client concern, with operation override

Smithy spec findings:

- `@http code` is {e the status code of a successful response}; the value
  SHOULD be 200–299 (MUST 100–999). A non-2xx `code` emits a `DANGER`
  validation. So {e Smithy defines success as 2xx}; 3xx is not success.
- The spec is silent on redirect-following. The Smithy maintainers'
  explicit guidance (issue #1386) is that redirects (e.g. SAML SSO) are
  {e not} to be modeled — "they are something generated clients should
  handle on their behalf," as an implementation detail of the HTTP
  client / auth trait.
- `@httpResponseCode` is documented as 200–299 only.

So redirects are the HTTP client's job, not the protocol's. Resolution:

1. **Bake sensible redirect-following into the eio HTTP client**
   (`smaws_lib/http/`): follow `301`/`302`/`303`/`307`/`308` by default,
   up to a small max (e.g. 5). `303` always switches to `GET`; `301`/`302`
   switch to `GET` for non-`GET`/`HEAD` (historical browser behavior);
   `307`/`308` preserve method and body. Do {e not} follow `300`/`304`/
   `305`/`306`. Preserve the original `Authorization` header only when
   the redirect target is the same host (strip it on cross-host
   redirects, per RFC 9110 §15.4.7 security considerations).
2. **Operation-controllable override**: `Context` gains an optional
   `http_options : Http.options` field carrying `{ follow_redirects :
   bool; max_redirects : int }` (default `{ true; 5 }`). The generated
   S3 `make_context` and the generic `Context.make` both accept
   `?http_options`. Per-call override is not needed initially. The
   field is additive and has no effect on existing AwsJson / AwsQuery
   SDKs because they never construct `Context` with `http_options`.
3. **304 `Not Modified` is a success for conditional GETs** —
   `GetObject` legitimately returns 304 when `If-Modified-Since`/
   `If-None-Match` matches. The restXml runtime treats `304` as success
   when the operation's `@http method = GET`; otherwise 304 is an error.
   This is the one 3xx that is operation-meaningful and must be honored
   in the protocol runtime, not the HTTP client (the client must {e not}
   auto-follow 304 — there is nowhere to follow to).

Net: "bake in better behaviour {e and} operation-controllable" — both,
matching the guess. The protocol layer only special-cases 304; everything
else 3xx is the HTTP client's redirect policy.

### 8.3 Streaming — what needs it, and how necessary is the trailer part?

Disambiguation first, because this is the crux: **streaming I/O** and
**streaming + checksum trailers (aws-chunked)** are two different things.
The original §8.3 deferral recommendation was about the {e trailers},
not about streaming. Streaming I/O itself is essential and ships on the
Tier 1 critical path.

#### The full streaming surface in S3 (from the model)

Streaming {e input} (upload — `Body`/`AnnotationPayload` is a
`@streaming @httpPayload` blob):

- `PutObject` — upload an object. The core write path.
- `UploadPart` — multipart upload part. Required for objects > 5 GB; the
  recommended path for anything > ~100 MB.
- `PutObjectAnnotation` — annotation upload.
- `WriteGetObjectResponse` — S3 Object Lambda: stream the transformed
  object back. Niche, but the streaming body is the whole point.

Streaming {e output} (download — `Body`/`AnnotationPayload` is a
`@streaming @httpPayload` blob):

- `GetObject` — download an object. The core read path.
- `GetObjectAnnotation` — annotation download.
- `GetObjectTorrent` — BitTorrent torrent file download.

Event-stream {e output} (`@streaming` union, `@httpPayload`):

- `SelectObjectContent` — S3 Select (run SQL-ish queries over CSV/JSON/
  Parquet in place). The only consumer of the Amazon Event Stream codec.

#### Necessity ranking

1. **Streaming output for `GetObject` — essential, no trailer coupling.**
   Without it you materialize the whole object into memory as a `string`
   before returning it; a 5 GB download OOMs. Range GETs (`Range` header —
   the basis of partial/resumable downloads) are especially absurd to
   buffer. The response checksum comes back in {e headers}
   (`x-amz-checksum-*`), never as a body trailer, so this is purely the
   §1 `Eio.Flow.source` work — zero aws-chunked involvement. {e Must
   ship early; simplest of the three.}

2. **Streaming input for `PutObject`/`UploadPart` — essential, no trailer
   coupling unless the user opts in.** Without it you buffer the whole
   object in memory before sending; multipart upload (designed for
   objects too large to handle at once) is defeated entirely. Streaming
   input works fine with plain `Content-Length` (known, e.g. from a
   file) or plain `Transfer-Encoding: chunked` — {e no} aws-chunked,
   {e no} trailer. The trailer machinery only switches on when the user
   {e also} sets `ChecksumAlgorithm`. {e Must ship early.}

3. **Streaming + checksum trailers (aws-chunked) — a quality feature, not
   a functional necessity.** It only activates when the user combines
   `ChecksumAlgorithm` with a streaming body. Without it, the options
   are: (a) buffer small bodies to compute a header checksum (works for
   small, defeats streaming for large), (b) send without a client
   checksum — S3 still stores and returns {e its own} checksum; the
   client just forgoes pre-upload integrity verification, or (c) refuse
   `ChecksumAlgorithm` on streaming and steer the user to `Content-MD5`
   (modeled, header-based, one-shot). So trailers are {e integrity
   verification for large streaming uploads} — valuable, but the upload
   itself works without them. {e Deferrable.}

4. **Event stream for `SelectObjectContent` — dropped.** S3 Select
   is no longer available to new customers, so the Amazon Event Stream
   codec is {e not implemented}. The operation still generates (so the
   SDK compiles) but its `request` raises `Not_implemented` at runtime.
   {e Not on the critical path.}

#### What the trailer mechanism is, plainly (for when we do it)

- For a {e small, buffered} body the SDK reads the whole payload, computes
  the checksum, and sends it in a request {e header} (`x-amz-checksum-sha256:
  …`) {e before} the body. Simple, one pass, body-in-memory.
- For a {e streaming} body (a file, a pipe) you can't read it twice and
  you don't want to buffer it. So instead you promise S3 the checksum
  will arrive {e at the end}, in a {e trailer}, and you sign the body
  {e as it streams}. Concretely a `PutObject` with `ChecksumAlgorithm =
  CRC32C` and a streaming `Body` becomes:

  ```
  PUT /key HTTP/1.1
  x-amz-content-sha256: STREAMING-AWS4-HMAC-SHA256-PAYLOAD-TRAILER
  x-amz-trailer: x-amz-checksum-crc32c
  Content-Encoding: aws-chunked
  x-amz-decoded-content-length: 66560        # the real body size
  Content-Length: 66946                       # size AFTER aws-chunked framing + trailer
  Authorization: …seed signature…

  10000;chunk-signature=<sig1>\r\n           # hex chunk len ; per-chunk sig
  <65536 bytes>\r\n
  400;chunk-signature=<sig2>\r\n
  <1024 bytes>\r\n
  0\r\n                                       # end of body
  x-amz-checksum-crc32c:sOO8/Q==\r\n          # trailer chunk
  x-amz-trailer-signature=<sigT>\r\n\r\n
  ```

  Each chunk's signature chains off the previous one (sig2 signs
  `hash("")` + `hash(chunk1-data)` + sig1), so signing is streaming and
  can't be precomputed. The trailer's signature signs the trailer bytes.
  `Content-Length` must be the {e encoded} length — chunk prefixes +
  `\r\n`s + the `0\r\n` terminator + the trailer bytes — which means you
  {e must know the decoded length up front} (`x-amz-decoded-content-
  length`); S3 requires it even with `Transfer-Encoding: chunked`.

Why it's gnarly: it couples four things — streaming I/O, a sigv4
signature {e chain} (stateful, per-chunk), checksum computation
(CRC32/CRC32C/SHA*/xxhash) as bytes flow, and HTTP framing where
`Content-Length` must account for trailer bytes that haven't been
emitted yet. The Smithy-Rust author wrote a whole post mortem on the
footguns (trailers count toward Content-Length; hyper's `poll_trailers`
is incompatible with `aws-chunked`; `is_end_stream` must be owned by
the outer body; `x-amz-decoded-content-length` is mandatory).

#### Resolution (revised)

- **Tier 1a — streaming output (`GetObject` etc.)**: ship with the §1
  `Eio.Flow.source` interface. No trailers, no codec. Essential.
- **Tier 1b — streaming input (`PutObject`/`UploadPart` etc.)**: ship
  with `Content-Length` (modeled header or known flow length) or plain
  `Transfer-Encoding: chunked`. No aws-chunked, no trailer. Essential.
  If the user sets `ChecksumAlgorithm` on a streaming body, the
  serialiser {e falls back to buffering} when the body length is
  known-and-small (≤ a configurable cap, e.g. 1 MB) and computes a header
  checksum; for larger streaming bodies it {e errors} with a clear
  message ("checksum on streaming bodies > N requires aws-chunked
  trailer support, not yet implemented — omit `ChecksumAlgorithm` or
  set `Content-MD5`"), rather than silently sending an unsigned
  checksum. This makes the limitation loud and the common cases work.
- **Tier 1c — aws-chunked + trailer checksums**: dedicated follow-on
  workstream. Only needed to lift the Tier 1b streaming+checksum
  limitation. Not blocking GetObject/PutObject/UploadPart working
  against a real bucket.
- **Tier 1d — event stream (`SelectObjectContent`) — dropped.**
  S3 Select is no longer available to new customers, so the Amazon
  Event Stream codec is {e not implemented} for the S3 work. The
  operation still generates (so the SDK compiles) but its `request`
  raises `Not_implemented` at runtime. Do not build the codec unless
  another non-deprecated event-stream service is added.

So the "defer" stands but is now precise: we defer the {e aws-chunked
trailer} sub-feature (1c) and the {e event-stream codec} (1d —
dropped, S3 Select is no longer available to new customers), {e not}
streaming I/O (1a/1b). Streaming I/O is essential and on the critical
path. The 4 S3 conformance ops don't exercise any of 1a–1d (their
`GetObjectOutput` is empty), so none of this blocks the conformance
suite — but 1a/1b block real-bucket usability, so they ship with the
first S3 cut, ahead of 1c. Event-stream support (1d) is dropped
entirely unless another event-stream service is added later.

### 8.4 `Content-Length` resolution order for streaming input

Spec findings:

- `Content-Length` is a {e restricted header} for `@httpHeader`/
  `@httpPrefixHeaders` — "HTTP clients and servers are responsible for
  providing a Content-Length header." S3 models it as `@httpHeader
  Content-Length` anyway; the restriction is "highly discouraged," not
  forbidden.
- `@requiresLength` (on a `@streaming` blob): "the Content-Length header
  MUST be sent prior to a client sending the payload." So a
  `requiresLength` streaming blob forces a known length.
- Plain streaming (no `requiresLength`): size may be unknown →
  `Transfer-Encoding: chunked` (standard HTTP). S3 with `aws-chunked`
  additionally requires `x-amz-decoded-content-length`.

Options:

- **A. Spec-pure** — the HTTP client owns `Content-Length` entirely;
  ignore the modeled `@httpHeader Content-Length` member (restricted).
  Known flow length → `Content-Length`; unknown → chunked. Cleanest per
  spec, but breaks the S3 convention where callers set `Content-Length`
  to avoid buffering.
- **B. S3-pragmatic (recommended)** — honor the modeled `@httpHeader
  Content-Length` if the user set it; else if the runtime knows the
  producer length (file size, explicit wrapper, etc.), use it; else
  `Transfer-Encoding: chunked`. A user-provided `Content-Length` that
  disagrees with the actual bytes is {e trusted} (the user asserts the
  size; mismatches fail server-side). This matches what AWS SDKs do.
  Because the new `` `Stream `` producer does not carry its own length,
  the restXml runtime tracks length as a separate piece of metadata when
  it is available.
- **C. Hybrid** — B, but for `@requiresLength` streaming blobs, treat a
  missing `Content-Length` as a client-side error (don't fall back to
  chunked), because the trait mandates a known length.

Resolution: **B**, plus the `@requiresLength` twist from C. Concretely
the serialiser order for a streaming input body is:

```
if user set modeled @httpHeader Content-Length → use it (trust)
else if @requiresLength on the streaming blob → error if no length known
else if runtime knows the producer length                  → Content-Length = that
else                                                       → Transfer-Encoding: chunked
```

A wrong user-provided `Content-Length` is not a client error; it surfaces
as a server `BadDigest`/`IncompleteBody`. Document this. Note: the earlier
`` `Flow `` sketch carried an `int64 option` length directly in
`Http.input_body`; the new `` `Stream `` producer does not, so length
metadata travels with the request context instead.

### 8.5 Namespace handling in `Xml.ml` — yes, write tests first

Yes. Before building the restXml serialiser, de-risk the parser by
adding unit tests that feed it the conformance bodies and assert
local-name matches. Concretely, in `smaws_lib_test/` (or `codegen_test/`):

- parse `<?xml version="1.0"?>\n<LocationConstraint
  xmlns="http://s3.amazonaws.com/doc/2006-03-01/">us-west-2
  </LocationConstraint>` and assert the text value is `us-west-2`
  (S3 `GetBucketLocation`, default-namespace response).
- parse the `RestXmlWithNamespace` `SimpleScalarProperties` response
  (service-level `@xmlNamespace`) and assert each scalar member is
  found by local name regardless of the default xmlns.
- parse the `XmlNamespaces` response (nested prefixed + default
  namespaces on inner elements) and assert the structure is recovered.
- parse the `HttpPayloadWithStructure` request body `<NestedPayload>…
  </NestedPayload>` and assert round-trip through the existing
  `Read.sequence`/`Read.element` helpers.

`Read.sequence` already matches tag names ignoring namespace when its
`~ns` argument is `None`, so these tests should largely pass; if any
fail, the gap is scoped to `Xml.ml` before the serialiser depends on it.
These tests are pure-parser, no HTTP, no codegen — fast to write and run.

### 8.6 `@httpPayload` root + service `@xmlNamespace` — confirmed yes

The payload root inherits the service-level `@xmlNamespace` by default,
and a `@xmlNamespace` on the payload structure overrides it. Matches the
`RestXmlWithNamespace` service behavior (service `@xmlNamespace` applies
to synthesised roots) and AWS SDK behavior. No conformance test
exercises the combination directly; we'll cover it with a unit test.

### 8.7 Dot-segment preservation — why (and is it a security concern)?

Why we must not normalise dot segments: S3 object keys are {e opaque
strings}. An object can literally be named `../key.txt` or
`foo/../key.txt`; the `/` in a key is part of the key, {e not} a path
hierarchy. If the HTTP client applies RFC 3986 §6.2.2.3 dot-segment
normalisation (`/foo/../key.txt` → `/key.txt`), the request addresses a
{e different object} (`key.txt` instead of `foo/../key.txt`).

That is primarily a {e correctness} bug. It has a {e security} flavour
because S3 access is keyed on object names: a client that silently
rewrites `../secret` to `secret` (or vice versa) can defeat bucket
policies / IAM scoping that grant access to one name but not the other.
So it's correctness-with-authorization-side-effects, not a vulnerability
in our code, but a real S3 requirement.

RFC 9112 §3.2.1 (origin-form request-target) says a client sends the
path as-is and {e SHOULD NOT} normalise. `Uri.normalize` in OCaml's
`uri` lib does RFC 3986 normalisation including dot-segment removal, so
we must {e not} call it on the request path. Resolution:

1. Build the request-target path as a raw string from the `@http uri`
   template + label substitution, never round-tripping it through
   `Uri.normalize` / `Uri.path`-mutation.
2. The restXml runtime should hand the resulting raw path to `Sign` as a
   pre-computed canonical URI string, rather than letting `Sign` extract it
   from `Uri.t`. This avoids both dot-segment normalisation and the current
   `Sign.sign_request_v4` path-splitting logic (`Uri.path`, split on `/`,
   `Uri.pct_encode`, re-join), which is correct for AwsJson/AwsQuery where
   paths are always `/` but is unsafe for S3 object keys.
3. Audit `Uri.of_string` → `Uri.to_string` and the httpun-eio client:
   if any layer normalises the path, bypass `Uri` for the path and
   hand-assemble the origin-form string (`method`, raw path, `?query`).
4. Add a unit test that asserts `/../key.txt` and `/foo/../key.txt`
   survive a round-trip through whatever path-construction helper the
   restXml runtime uses. (The S3 conformance ops `S3Preserves…`
   already assert this end-to-end.)

### 8.8 Bucket DNS-validity → path-style fallback — confirmed yes

When `Options.addressing_style = `Virtual` but the bucket name is not
DNS-compatible (uppercase letters, `_`, length > 63, starts/ends with
`.` or `-`, contains consecutive dots, looks like an IP address), the
runtime automatically falls back to path-style for that request and
warns. The user-set `Path` style is always honored as-is. Matches every
AWS SDK; avoids request failures on valid-but-non-DNS bucket names.

### 8.9 Event-stream codec — dropped for S3

{e `SelectObjectContent` (S3 Select) is no longer available to new
   customers. We therefore do not implement the Amazon Event Stream codec for
   the S3 work. The notes below are retained only as background for a future
   non-deprecated event-stream service, and the CRC32/CRC32C discussion is
   relevant to the flexible-checksum work, which {e is} in scope.}

Research findings:

- There is {e no} existing OCaml opam package that implements the Amazon
  Event Stream wire format. `aws` (ocaml-aws), `orsetto`, `digestif`
  don't. `ocaml-wire` (parsimoni-labs, created 2026-03, 3 stars, github
  pin only, ISC) is a binary-wire-format DSL that could {e describe} the
  format but doesn't implement it; very new, not on opam central.
- The Amazon Event Stream format is small: a prelude
  (`total_length` u32, `headers_length` u32, `prelude_crc` u32), typed
  headers (10 type codes), payload, `message_crc` u32. CRC32 of the
  prelude and of the whole message. ~200 lines to decode.
- The only primitive we lack is CRC32. `digestif` (already a dep) covers
  SHA1/SHA256/SHA512/MD5/Blake2 but {e not} CRC32.

opam packages relevant to the primitives:

| Package | Provides | Notes |
|---|---|---|
| `checkseum` 0.5.3 | CRC32, CRC32C, Adler-32 (C + OCaml) | Mirage-grade, widely depended-on; best fit |
| `crc` | CRC32 over strings/cstructs | minimal |
| `pcrc` | parameterized CRC8/16/32/64 | can do CRC64NVME |
| `xxhash` + `conf-xxhash` | XXHASH64, XXHASH3, XXHASH128 (C bindings) | needed for S3 flexible checksums |
| `digestif` (have) | SHA1/SHA256/SHA512/MD5 | covers most S3 checksums |

If a non-deprecated event-stream service is added later, the codec can be
hand-rolled (~200 lines) in `smaws_lib/event_stream.ml` on top of a CRC32
primitive. Options for that future work:

- **A. Vendor a ~50-line CRC32** (no new dep at all). Fine for event
  stream; but S3 flexible checksums also need CRC32C/CRC64NVME/XXHASH*
  which are {e not} trivially vendored.
- **B. Add `checkseum`** for CRC32 + CRC32C (covers event-stream CRC32
  and the two most common S3 checksums), and `xxhash` for XXHASH64/3/128.
  CRC64NVME either hand-rolled (~30 lines, fixed polynomial
  0x9A6C9329AC4BC9B5 reflected) or via `pcrc`.

Recommendation for the S3/flexible-checksum path: **B (`checkseum` for
CRC32/CRC32C, `xxhash` for the XXHASH family, hand-rolled CRC64NVME)**.
The event-stream codec itself would stay vendored (no new dep for the codec,
only for the CRC/hash primitives it and the S3 checksums share). For the
current S3 work, the event-stream codec is **not implemented** and
`SelectObjectContent.request` raises `Not_implemented` at runtime; the
operation still generates so the SDK compiles.

{e Your call} (for flexible checksums only): add `checkseum` (and later
`xxhash`), or vendor CRC32 and hand-roll CRC64NVME? This decision can wait
until flexible-checksum work begins; it is not blocking the first S3 cut.

### 8.10 `@auth` scheme selection — codegen-driven, not runtime-driven

Why {e not} runtime-driven: a runtime-driven design would have the
`Context` carry the operation's allowed auth schemes (from `@auth`) and
the protocol runtime pick a signer by inspecting that list at request
time. That sounds flexible but in practice:

- The set of signers smaws supports is fixed and small (sigv4,
  sigv4-unsigned-payload, sigv4-s3express). There is no runtime
  negotiation: the model says which scheme(s) an op allows, and exactly
  one applies.
- A runtime choice means every request pays an option-inspection and
  the generated `request` function must thread a "signer selector" —
  more allocation, more indirection, and the type of `request` can't
  statically reflect which auth the op uses (so callers can't see, e.g.,
  that `WriteGetObjectResponse` won't hash the body).
- The `@auth` trait is static at the operation level; nothing the {e
  user} does at call time changes which scheme applies. So a runtime
  decision is solving a problem that doesn't exist.

Options:

- **A. Codegen-driven (recommended)** — for each operation, codegen
  emits a call to the specific signer the model dictates. An op whose
  `@auth` allows `aws.auth#unsignedPayload` gets a generated `request`
  that calls `Sign.sigv4_unsigned_payload`; an op with only `sigv4` calls
  `Sign.sigv4`. The `Context` carries credentials/region, not a scheme
  list. The op's auth is visible in its generated code; no runtime
  dispatch.
- **B. Runtime-driven** — `Context` carries `auth_schemes : Auth.scheme
  list`; the protocol runtime pattern-matches to pick a signer. More
  machinery, no static visibility, pays on every request.
- **C. Hybrid** — codegen emits a closed sum of the signers the op
  allows, and the runtime picks the first the `Context` can satisfy
  (useful only if a `Context` could be configured with multiple
  credential sources). Over-engineered for smaws's single-credential
  `Auth.t`.

Resolution: **A**. Codegen reads `@auth` (+ `aws.auth#unsignedPayload`
etc.) per operation and emits the matching `Sign.*` call; the runtime
just exposes the named signers. The `Context` stays auth-scheme-agnostic.
If a future service needs runtime auth negotiation (e.g. SSO with
multiple resolvers), revisit then — but that's `Auth.t` resolver work
(already on the TODO.md list), not a protocol-runtime concern.

---

## 9. Confirmed decisions

Final picks for the §7 questions, agreed 2026-07-07:

| # | Question | Resolution |
|---|---|---|
| 1 | Unmodeled S3 errors | Reuse `AwsErrors.aws_service_error` carrier (§8.1) |
| 2 | Redirects / 3xx | HTTP-client redirect-following + `?http_options` override; 304 = success for GET (§8.2) |
| 2b | `?http_options` in `Context.make` / `make_with_eio_http` | Add optional `Http.options` field; default `{ follow_redirects = true; max_redirects = 5 }`; 304 handled as GET success in restXml runtime |
| 3 | Streaming + trailer | Streaming I/O is essential, ships Tier 1a/1b; aws-chunked trailers (1c) and event-stream codec (1d) dropped for S3 (§8.3) |
| 4 | `Content-Length` order | **B** — honor modeled `Content-Length` → known flow length → chunked; `@requiresLength` errors if unknowable (§8.4) |
| 5 | Namespace parser | Write pure-parser unit tests first (§8.5) |
| 6 | Payload root + service `@xmlNamespace` | Inherit service namespace by default (§8.6) |
| 7 | Dot-segment preservation | Build raw path string, bypass `Uri.normalize`; correctness + authorization-flavoured (§8.7) |
| 8 | Bucket DNS fallback | Auto-fall-back to path-style on non-DNS bucket names (§8.8) |
| 9 | Event-stream codec | **Dropped for S3** — `SelectObjectContent` is deprecated; the codec is not implemented and the operation raises `Not_implemented` at runtime. CRC32/hash primitive choice deferred to flexible-checksum work (§8.9) |
| 10 | `@auth` scheme selection | **A** — codegen-driven; each op's generated `request` calls the modeled `Sign.*` (§8.10) |

{e Open follow-up (non-blocking):} when flexible checksums are
implemented, decide whether to keep vendoring CRC32 (and hand-roll
CRC64NVME) or add `checkseum` + `xxhash` for CRC32/CRC32C/XXHASH*
respectively. That decision can wait until 1c is in scope.