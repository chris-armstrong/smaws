# AwsQuery Protocol Full Support

## Goal

Implement full code-generation support for the `aws.protocols#awsQuery` protocol, including
running the Smithy conformance tests (both request serialization tests and response deserialization
tests) in `model_tests/protocols/query/`, mirroring what already exists for `aws.protocoltests.json`.

---

## Background: How AwsJson Works (Reference Implementation)

| Layer | File | What it does |
|-------|------|--------------|
| Runtime | `smaws_lib/protocols_impl/AwsJson.ml` | Sends JSON body, receives JSON response, context-based API |
| Serialiser codegen | `codegen/AwsProtocolJson.ml` → `Serialiser` | Generates `_to_yojson` functions |
| Deserialiser codegen | `codegen/AwsProtocolJson.ml` → `Deserialiser` | Generates `_of_yojson` functions |
| Operations codegen | `codegen/AwsProtocolJson.ml` → `Operations` | Generates `request` functions calling `Protocols.AwsJson.request` |
| sdkgen wiring | `sdkgen/gen_serialisers.ml`, `gen_deserialisers.ml`, `gen_operations.ml` | Delegates to above |
| Test codegen | `sdkgen/gen_protocol_tests.ml` | Generates request test functions from `httpRequestTests` traits |
| Model test dir | `model_tests/protocols/json/` | Generated + promoted source, `protocol_tests.ml` test binary |

---

## What AwsQuery Needs

### Wire format differences

| Aspect | AwsJson | AwsQuery |
|--------|---------|----------|
| Request body | JSON (`application/x-amz-json-1.x`) | URL-encoded form data (`application/x-www-form-urlencoded`) |
| Request structure | `{"param": "value"}` | `Action=Op&Version=2020&Key=Value` |
| Nested structs | `{"Nested": {"Field": "value"}}` | `Nested.Field=value` |
| Lists | JSON array | `List.member.1=a&List.member.2=b` (or flattened) |
| Maps | JSON object | `Map.entry.1.key=k&Map.entry.1.value=v` |
| Response | JSON | XML wrapped in `<OpResponse><OpResult>...</OpResult></OpResponse>` |
| Error response | JSON with `__type` key | XML `<ErrorResponse><Error><Type>...<Code>...` |

### Smithy model namespace

`aws.protocoltests.query` has 87 shapes:
- **32 request tests** across 10 operations (serialization)
- **29 response tests** across 17 operations (deserialization)

---

## Progress

| Phase | Status | Notes |
|-------|--------|-------|
| Phase 1 | ✅ Done | `smithy_ast/Trait.ml` + `smaws_parse/Smithy.ml` |
| Phase 2 | ✅ Done | `smaws_lib/protocols_impl/AwsQuery.ml` rewritten with context API + Serialize helpers |
| Phase 8 | ✅ Done | `smaws_test_support_lib/alcotest_http.ml` + `input_body_form_testable` |
| Xml.ml | ✅ Done | `Xml.Parse.Read.skip_element` added |
| Phase 3 | 🔄 In progress | `codegen/AwsProtocolQuery.ml` Serialiser |
| Phases 4–7, 9 | ⬜ Pending | |

---

## Implementation Phases

### Phase 1 — Smithy parse layer: `httpResponseTests`

Currently `smithy.test#httpResponseTests` is silently dropped as `UnspecifiedTrait`.

**`smithy_ast/Trait.ml`** — add:
```ocaml
type httpResponseTest = {
  id : string;
  protocol : string;
  code : int;
  body : string option;
  bodyMediaType : string option;
  headers : (string * string) list option;
  params : Yojson.Basic.t option;
  documentation : string option;
  tags : string list option;
  appliesTo : [ `Client | `Server ] option;
}
[@@deriving show, equal]

(* in type t: *)
| TestHttpResponseTests of httpResponseTest list
```

**`smaws_parse/Smithy.ml`** — add `parseTestHttpResponseTests` (parallel to existing
`parseTestHttpRequestTests`) and bind it to `"smithy.test#httpResponseTests"`.

---

### Phase 2 — Runtime: update `AwsQuery.ml`

The existing `AwsQuery.ml` uses the old non-context-based API. It needs to:

1. **Adopt context-based API** (like `AwsJson.ml`): `~context:'http_t Context.t` instead of
   `(module Http)`, `~config`, `~http`.

2. **Change `fields` type** from `field option list` to `(string * string list) list`
   (a flat list of already-expanded query params). The option-based flattening is moved to the
   serialiser layer.

3. **Add error type and `error_to_string`** (parallel to `AwsJson`):
   ```ocaml
   type error = [ `HttpError of Http.http_failure | `XmlParseError of string | `AWSServiceError of AwsErrors.aws_service_error ]
   ```

4. **Add `error_deserializer` helper** (parallel to `AwsJson.error_deserializer`) that wraps
   the XML error response parsing.

The new signature for `request`:
```ocaml
val request : 
  action:string ->
  xmlNamespace:string ->
  service:Service.descriptor ->
  context:'http_t Context.t ->
  fields:(string * string list) list ->
  output_deserializer:(Xmlm.input -> 'out) ->
  error_deserializer:(Error.t -> 'err) ->
  ('out, [> error ] as 'err) result
```

---

### Phase 3 — Serialiser codegen: `codegen/AwsProtocolQuery.ml` → `Serialiser`

The serialiser generates `_to_query` functions (analogous to `_to_yojson`).

#### Type signature

Each `_to_query` function takes a `path : string list` and the value, and returns
`(string * string list) list` — a flat list of query params.

#### Shape handling rules

| Shape | Generated code |
|-------|----------------|
| StringShape | `[( join_path (path @ [member_name]), [value] )]` |
| IntegerShape, LongShape, ByteShape, ShortShape | same, via `string_of_int` |
| BooleanShape | `"true"` / `"false"` |
| FloatShape, DoubleShape | via `string_of_float` |
| BlobShape | base64-encoded |
| TimestampShape | iso8601 (default for awsQuery) |
| StructureShape | recursive: each member prefixed with its xmlName at the path level |
| ListShape (normal) | indexed: `path @ ["member"; string_of_int i]` (or custom xmlName for member) |
| ListShape (flattened member) | no "member" level: `path @ [string_of_int i]` |
| ListShape (empty) | single entry: `[(join_path path, [""])]` |
| MapShape | `path @ ["entry"; string_of_int i; "key"]` and `...value"` |
| MapShape (with xmlName for key/value) | custom key/value tag names |
| EnumShape | string value of enum constructor |
| SetShape | like ListShape |
| Optional member | if `None`, produces `[]`; otherwise apply the mapper |

#### xmlName resolution

When generating code for a member, check for `XmlNameTrait` on the member:
- If present, use that name as the last path element instead of the member's Smithy name
- If absent, use the member's Smithy name

For list members, check for `XmlNameTrait` on the list `member` target:
- Used as the member element name instead of `"member"`

#### Flattened lists

Check for `XmlFlattenedTrait` on the member referencing the list. If present:
- Omit the intermediate `member` element: path goes directly `[..., name, index]`
- The member name itself (or xmlName override on the member reference) is used

#### Example generated code

```ocaml
(* Generated for SimpleInputParams *)
let simple_input_params_input_to_query x =
  List.concat [
    (match x.foo with None -> [] | Some v -> [("Foo", [v])]);
    (match x.bar with None -> [] | Some v -> [("Bar", [v])]);
    (match x.baz with None -> [] | Some v -> [("Baz", [Bool.to_string v])]);
  ]

(* Generated for NestedStructures *)
let nested_struct_with_list_to_query path x = 
  List.concat [
    (match x.list_arg with
     | None -> []
     | Some vs ->
         if List.is_empty vs then [(String.concat "." (path @ ["ListArg"]), [""])]
         else List.concat_mapi (fun i v ->
           [((String.concat "." (path @ ["ListArg"; "member"; string_of_int (i+1)])), [v])]
         ) vs);
  ]

let nested_structures_input_to_query x =
  List.concat [
    (match x.nested with
     | None -> []
     | Some v -> nested_struct_to_query ["Nested"] v);
  ]
```

#### Runtime helpers to add to `smaws_lib/protocols_impl/AwsQuery.ml`

Add a `Serialize` module with primitive helpers referenced in generated code:
```ocaml
module Serialize = struct
  let join_path path = String.concat "." path
  let string_field path v = [(join_path path, [v])]
  let int_field path v = string_field path (string_of_int v)
  let bool_field path v = string_field path (string_of_bool v)
  let float_field path v = string_field path (Printf.sprintf "%g" v)
  let blob_field path v = string_field path (Base64.encode_string v)
  let timestamp_iso_field path v = string_field path (Timestamp.to_iso8601 v)
  let timestamp_epoch_field path v = string_field path (Timestamp.to_epoch_string v)
  let empty_list_field path = [(join_path path, [""])]
end
```

---

### Phase 4 — Deserialiser codegen: `codegen/AwsProtocolQuery.ml` → `Deserialiser`

The deserialiser generates `_of_xml` functions (analogous to `_of_yojson`).

#### Input type

Each `_of_xml` function takes `Xmlm.input` positioned just after entering the parent element
(after the `El_start` of the containing element has been consumed), and reads until the
matching `El_end`.

This matches the calling convention in `Xml.Parse.Read.sequence`:
```ocaml
Read.sequence xmlSource tag (fun i _attrs -> result_deserialiser i) ()
```

#### Shape handling rules

| Shape | Reading strategy |
|-------|-----------------|
| StringShape | `Xml.Parse.Read.element i tag ()` |
| IntegerShape | parse string from element |
| BooleanShape | `"true"` → `true` |
| FloatShape | `float_of_string`, with `"NaN"`, `"Infinity"`, `"-Infinity"` handled |
| TimestampShape | parse ISO 8601 string |
| BlobShape | base64-decode |
| StructureShape | use `Xml.Parse.Structure.scanSequence` to read each member by tag |
| ListShape (normal) | read repeated `<member>` elements |
| ListShape (flattened) | read repeated same-named sibling elements |
| MapShape | read `<entry>` elements each containing `<key>` and `<value>` |
| EnumShape | read string, convert to constructor |
| UnionShape | read first key-value pair |

#### Structure deserialization pattern

```ocaml
let simple_scalar_xml_properties_output_of_xml i =
  let open Xml.Parse in
  let r_string_value = ref None in
  let r_integer_value = ref None in
  (* ... one ref per member ... *)
  Structure.scanSequence i ["stringValue"; "integerValue"; ...]
    (fun tag _next ->
      match tag with
      | "stringValue" -> r_string_value := Some (Read.element i "stringValue" ())
      | "integerValue" ->
          r_integer_value := Some (int_of_string (Read.element i "integerValue" ()))
      | _ -> ignore (Xmlm.input i)  (* skip unknown *)
    );
  { 
    string_value = !r_string_value;
    integer_value = !r_integer_value;
    (* ... *)
  }
```

Note: `Structure.scanSequence` reads until the current element's `El_end` without consuming it;
that's consumed by the parent `Read.sequence` call.

#### List deserialization

For normal (non-flattened) lists, the list is wrapped in an element and each item is in a
`<member>` sub-element (or the custom xmlName):
```ocaml
let string_list_of_xml i =
  Xml.Parse.Read.elements i "member" ()
```

For flattened lists, the items appear as repeated siblings at the parent level — handled in
the parent structure's `scanSequence` by accumulating into a ref list.

---

### Phase 5 — Operations codegen

**`gen_operations.ml`** currently only generates for `AwsJson1_0` and `AwsJson1_1`.

Add a branch for `AwsProtocolAwsQueryTrait`:
- Call `AwsProtocolQuery.Operations.generate` (new module in `codegen/AwsProtocolQuery.ml`)

**`codegen/AwsProtocolQuery.ml` → `Operations`**:

```ocaml
(* Generated module example: *)
module SimpleInputParams = struct
  let error_to_string = function
    | #Smaws_Lib.Protocols.AwsQuery.error as e -> Smaws_Lib.Protocols.AwsQuery.error_to_string e

  let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) =
    (* match error.code → error variant *)
    Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error

  let request context (request : simple_input_params_input) =
    let fields = Query_serializers.simple_input_params_input_to_query request in
    Smaws_Lib.Protocols.AwsQuery.request
      ~action:"SimpleInputParams"
      ~xmlNamespace:"https://example.com/"
      ~service ~context ~fields
      ~output_deserializer:Query_deserializers.unit_of_xml
      ~error_deserializer
end
```

The `xmlNamespace` value is extracted from the service shape's `ApiXmlNamespaceTrait` at codegen time and embedded as a string literal.

The `action` is the operation's Smithy name (the last segment: `Util.symbolName operation_name`).

---

### Phase 6 — sdkgen wiring

**`sdkgen/gen_serialisers.ml`** — detect protocol and switch:
- If awsQuery: call `Codegen.AwsProtocolQuery.Serialiser.generate` → output to `query_serializers.ml`
- If awsJson: existing path → `json_serializers.ml`

Wait — the existing `write_serialisers` in `sdkgen.ml` always writes `json_serializers.ml`.
We need to also write `query_serializers.ml` for awsQuery services. The filename and module
need to be protocol-dependent.

For the protocol conformance test model (which has only one protocol: awsQuery), the generated
files should be:
- `query_serializers.ml`
- `query_deserializers.ml`

**`sdkgen/sdkgen.ml`** — the `write_serialisers` and `write_deserialisers` functions need to:
1. Detect whether the service uses awsQuery
2. Change filename and delegate accordingly

**`sdkgen/gen_operations.ml`** — add the awsQuery branch (same detection logic as gen_serialisers).

---

### Phase 7 — Protocol test codegen

**`sdkgen/gen_protocol_tests.ml`** currently generates request tests for awsJson.

Extend to:

#### Request tests (awsQuery-specific assertions)

Replace the JSON body assertion with a form-encoded body assertion:
```ocaml
let make_request_body_test_query expected_body =
  match expected_body with
  | Some body ->
      [%expr
        check Alcotest_http.input_body_form_testable "expected request body value"
          (Some [%e const_str body])
          (request.body |> Option.map (function
            | `String s -> s
            | `Form _ -> failwith "unexpected form body"
            | _ -> ""))]
  | None -> [%expr ()]
```

The `input_body_form_testable` compares form-encoded bodies by parsing into `(key, values)` lists
and sorting.

Also check `Content-Type: application/x-www-form-urlencoded` instead of JSON content type.

The mock response for request tests should return a minimal valid XML:
```ocaml
Mock.mock_response ~body:"<ActionResponse xmlns=\"...\"><ActionResult/></ActionResponse>"
  ~status:200 ~headers:[("Content-Type", "text/xml")] ()
```

(The actual XML content doesn't matter for request tests.)

#### Response tests (new)

New function `make_response_test_str` that generates test code for `httpResponseTests`:

1. **Mock the response** with the XML body from the test case.
2. **Call the operation** with a unit/empty input.
3. **Check the output** by comparing the OCaml result struct against the expected params.

For output comparison, the generated types have `[@@deriving show, eq]` so we can use
`Alcotest.testable pp_type equal_type`.

The `make_output_expr` function (new, parallel to `make_input_expr`) builds an OCaml expression
from the `params` JSON blob.

---

### Phase 8 — `smaws_test_support_lib`

Add `input_body_form_testable` to `alcotest_http.ml`:

```ocaml
let parse_form_body s =
  Uri.query_of_encoded s
  |> List.map (fun (k, vs) -> (k, List.sort String.compare vs))
  |> List.sort (fun (k1, _) (k2, _) -> String.compare k1 k2)

let form_body_pp fmt s = Fmt.string fmt s

let form_body_equal expected actual =
  List.equal
    (fun (k1, v1) (k2, v2) -> String.equal k1 k2 && List.equal String.equal v1 v2)
    (parse_form_body expected)
    (parse_form_body actual)

let input_body_form_testable =
  Alcotest.option (Alcotest.testable form_body_pp form_body_equal)
```

---

### Phase 9 — Model tests directory

Create `model_tests/protocols/query/`:

**`dune`**:
```scheme
(rule
 (mode promote)
 (targets
  builders.ml builders.mli
  query.ml query.mli
  query_deserializers.ml query_serializers.ml
  operations.ml operations.mli
  protocol_tests.ml
  service.ml service_metadata.ml service_metadata.mli
  types.ml types.mli)
 (deps
  (:gen ../../gen.exe)
  (:input ../../../smithy-aws-protocol-tests_model.json))
 (action
  (run %{gen} %{input} . aws.protocoltests.query)))

(library
 (name query)
 (modules builders query operations service service_metadata types
          query_deserializers query_serializers)
 (preprocess (pps ppx_deriving.show ppx_deriving.eq))
 (libraries Smaws_Lib shared))

(test
 (name protocol_tests)
 (modules protocol_tests)
 (libraries Smaws_Lib Smaws_Test_Support_Lib alcotest query eio_main))
```

---

## Key Technical Details

### Operation name (action)

The `action` parameter to `AwsQuery.request` is the simple operation name, NOT the
fully-qualified shape name. Example: `"SimpleInputParams"` not `"AwsQuery#SimpleInputParams"`.

Extract with `Codegen.Util.symbolName operation_name`.

### xmlNamespace

From the service shape's `smithy.api#xmlNamespace` trait → `ApiXmlNamespaceTrait uri`.
This is already parsed. Extract it in `gen_operations.ml` (or pass it down from the service context)
and embed as a string literal in the generated `request` call.

### Response XML wrapper

The runtime `AwsQuery.request` already handles the outer XML wrapper:
```
<ActionResponse xmlns="..."><ActionResult>...</ActionResult></ActionResponse>
```

The `output_deserializer : Xmlm.input -> 'out` is called with the input positioned inside
`<ActionResult>`, so generated deserializers don't need to handle the outer wrapper.

### Error deserialization

AwsQuery errors are identified by the `Code` element in the XML error response.
`AwsQuery.Error.t = { errorType: Sender | Receiver; code: string }`.

The generated `error_deserializer` for each operation matches on `error.code`:
```ocaml
let error_deserializer (error : Smaws_Lib.Protocols.AwsQuery.Error.t) =
  match error.code with
  | "InvalidInputException" ->
      `InvalidInputException (Query_deserializers.invalid_input_exception_of_xml ...)
  | _ -> Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error
```

### Flattened list serialization

Member with `XmlFlattenedTrait`:
- Remove the `member` intermediate level
- Use the member's name (or `XmlNameTrait` override) directly as the parent key

Example: `FlattenedListArg` with `xmlFlattened` → `FlattenedListArg.1=A&FlattenedListArg.2=B`
Example: `FlattenedListArgWithXmlName` with `xmlFlattened` + `xmlName="Hi"` → `Hi.1=A&Hi.2=B`

### Tests banned list

The JSON tests have a `bannedTests` list for tests that violate the protocol spec. The query
tests should also have one (initially empty, add as needed).

---

## File Checklist

### New files
- `codegen/AwsProtocolQuery.ml` — query serialiser/deserialiser/operations codegen
- `model_tests/protocols/query/dune` — build rules
- `model_tests/protocols/query/` — generated & promoted files (created by dune rule)

### Modified files
- `smithy_ast/Trait.ml` — add `httpResponseTest` type + `TestHttpResponseTests` constructor
- `smaws_parse/Smithy.ml` — parse `httpResponseTests` trait
- `smaws_lib/protocols_impl/AwsQuery.ml` — context-based API, error type, Serialize helpers
- `smaws_test_support_lib/alcotest_http.ml` — add `input_body_form_testable`
- `sdkgen/gen_serialisers.ml` — protocol detection + query path
- `sdkgen/gen_deserialisers.ml` — protocol detection + query path
- `sdkgen/gen_operations.ml` — add awsQuery branch
- `sdkgen/gen_protocol_tests.ml` — add query request+response test generation
- `sdkgen/sdkgen.ml` — pass protocol info to serialiser/deserialiser writers; add `write_protocol_response_tests`
- `model_tests/gen.ml` — add `aws.protocoltests.query` → `"Query"` mapping
- `model_tests/protocols/model_tests_protocols.ml` — reference query tests

---

## Implementation Order

1. **Phase 1** — Parse `httpResponseTests` (small, self-contained, unblocks everything)
2. **Phase 8** — Add `input_body_form_testable` to test support lib (small, needed for tests)
3. **Phase 2** — Update `AwsQuery.ml` runtime (context-based API + Serialize helpers)
4. **Phase 3** — `AwsProtocolQuery.Serialiser` codegen
5. **Phase 5** — `AwsProtocolQuery.Operations` codegen + sdkgen wiring (Phase 6)
6. **Phase 4** — `AwsProtocolQuery.Deserialiser` codegen
7. **Phase 7** — Protocol test codegen (request + response)
8. **Phase 9** — Model tests directory + dune file
9. Wire up `model_tests/gen.ml` + `model_tests_protocols.ml`
10. `dune runtest model_tests` — iterate until green

---

## What's Out of Scope (for later)

- Generating AwsQuery SDKs for real AWS services (CloudFormation, IAM, SNS, STS, SQS…)
  — those will work once the codegen is correct, but are not part of this plan
- EC2 Query protocol (different flattened list conventions)
- Response compression
