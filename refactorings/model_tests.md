# Model Tests Implementation Plan

## Overview

Implement protocol compliance testing for smaws by generating test libraries for each Smithy protocol namespace. This will validate that our AWS JSON 1.0/1.1 protocol implementations correctly serialize requests and deserialize responses according to the Smithy test specifications.

## Architecture

### Target Structure
```
model_tests/
├── gen.ml                           # Updated generator (main change)
├── protocol_tests_json/             # aws.protocoltests.json namespace
│   ├── dune                         # Library + test executable  
│   ├── types.ml/mli                 # Generated types
│   ├── serializers.ml               # Request serialization
│   ├── deserializers.ml             # Response deserialization
│   ├── operations.ml/mli            # Operation interfaces
│   ├── service_metadata.ml          # Service details
│   └── tests.ml                     # Embedded test data + alcotest runner
│   └── protocol_tests_json.ml       # Library entry point
├── protocol_tests_json10/           # aws.protocoltests.json10 namespace
│   └── [same structure]
├── protocol_tests_query/            # aws.protocoltests.query namespace
│   └── [same structure]
└── protocol_tests_shared/           # aws.protocoltests.shared namespace
    └── [same structure]
```

### Design Principles

1. **Mirror SDK Pattern**: Each namespace generates a complete SDK-like library following the same structure as `sdks/` directories
2. **Self-Contained**: Tests embed all test data directly in generated code (no external JSON dependencies)  
3. **Exposed Internals**: Unlike production SDKs, these expose serialization/deserialization functions for direct testing
4. **Individual Test Runners**: Each namespace has its own `alcotest` executable
5. **Snake Case Convention**: Directory names follow `protocol_tests_*` pattern

## Implementation Steps

### Phase 1: HTTP Infrastructure Refactoring **[PREREQUISITE]**
- **Problem**: Current `Context.t` hardcodes `Http.Client.t`, preventing HTTP substitution for testing
- **Solution**: Refactor awssdklib to support substitutable HTTP clients
- **Changes**:
  - Make `Context.t` generic over HTTP client type or accept first-class modules
  - Update `awssdklib/AwsJson.ml` to support instantiation with custom HTTP clients  
  - Ensure generated operations remain compatible with refactored Context
  - Extend existing `awssdklib_test/http_mock.ml` for Smithy protocol test support

### Phase 2: AST Extensions
- Add `httpResponseTest` type to `codegen/ast/Trait.ml`
- Add `TestHttpResponseTests` variant to the trait union type
- Fields: `id`, `protocol`, `code`, `headers`, `body`, `params`, etc.
- **Current Status**: `httpRequestTest` and `TestHttpRequestTests` already implemented

### Phase 3: Parser Updates  
- Update Smithy JSON parser to extract `smithy.test#httpResponseTests` traits
- Ensure both request and response tests are captured during model loading
- Verify filtering for `aws.protocols#awsJson1_0` and `aws.protocols#awsJson1_1` works
- **Current Status**: `smithy.test#httpRequestTests` parsing already implemented

### Phase 4: Code Generation Engine
- Extend `model_tests/gen.ml` to generate multiple namespace libraries
- Reuse existing `sdkgen` infrastructure for types, serializers, deserializers, operations
- Generate complete SDK-like libraries per namespace with exposed internals
- **Key Change**: Generate protocol instantiations with mock HTTP clients for testing

### Phase 5: Test Code Generation
- Create test generator for `httpRequestTests`:
  - Take test params → serialize via generated serializers → assert HTTP request matches expected
  - Validate method, URI, headers, body, query params
- Create test generator for `httpResponseTests`:
  - Create mock HTTP response → deserialize via generated deserializers → assert result matches expected params
  - Validate status codes, headers, body parsing
- **Implementation**: Use HTTP mocks to capture requests and provide canned responses

### Phase 6: Build Integration
- Generate `dune` files for each namespace library
- Dependencies: `Smaws_Lib`, `alcotest`, common `model_tests` types
- Create test executables that run via `dune runtest`
- Ensure each namespace can be tested independently

## Test Data Embedding Strategy

Each `tests.ml` will contain:
```ocaml
(* Generated protocol instantiation with mock HTTP *)
module TestHttpClient = struct
  (* HTTP mock implementation for this test namespace *)
  include Http.Client_intf
  (* Test-specific mock configuration *)
end

module TestProtocol = Protocols_gen.AwsJson.Make(TestHttpClient)

(* Embedded test data *)
let request_tests = [
  {
    test_id = "sends_requests_to_slash";
    operation = "NoInputAndNoOutput";  
    input_params = `Assoc [];
    expected_method = "POST";
    expected_uri = "/";
    expected_headers = [("Content-Type", "application/x-amz-json-1.1")];
    expected_body = Some "{}";
  };
  (* ... more tests ... *)
]

let response_tests = [
  {
    test_id = "handles_empty_output_shape";
    operation = "NoInputAndNoOutput";
    mock_status = 200;
    mock_headers = [("Content-Type", "application/x-amz-json-1.1")]; 
    mock_body = Some "{}";
    expected_result = `Assoc [];
  };
  (* ... more tests ... *)
]

(* Generated test functions using TestProtocol instead of Smaws_Lib.Protocols.AwsJson *)
let run_request_test test_case =
  TestHttpClient.clear_state ();
  TestHttpClient.expect_request test_case.expected_method test_case.expected_uri;
  let result = TestProtocol.request ~input:test_case.input_params (* ... *) in
  let captured = TestHttpClient.last_request () in
  assert_request_matches test_case.expected captured

let run_response_test test_case =
  TestHttpClient.clear_state ();
  TestHttpClient.mock_response ~status:test_case.mock_status ~body:test_case.mock_body ();
  let result = TestProtocol.request ~input:(`Assoc []) (* ... *) in
  assert_response_matches test_case.expected_result result
```

## Dependencies

Each generated namespace library will depend on:
- `Smaws_Lib` - Core AWS protocol support
- `alcotest` - Test framework
- `yojson` - JSON handling for test data
- `base` - Standard library extensions

## Benefits

1. **Protocol Compliance**: Ensures our JSON protocol implementations match AWS specifications exactly
2. **Regression Prevention**: Catches serialization/deserialization bugs during development
3. **Self-Documenting**: Generated tests serve as executable documentation of protocol behavior
4. **Modular**: Each protocol can be tested independently
5. **CI Integration**: Tests run automatically via `dune runtest`

## Current Code Analysis Findings

### Already Implemented ✅
- **HTTP Request Tests**: `httpRequestTest` type exists in `codegen/ast/Trait.ml:40-61`
- **Request Test Parsing**: `smithy.test#httpRequestTests` parser implemented in `codegen/parse/Smithy.ml:106-171`
- **HTTP Client Abstraction**: `Http.Client_intf` provides interface abstraction
- **Protocol Functors**: `protocols_gen/AwsJson.ml` uses `Make(Http_module)` pattern
- **Mock Testing Infrastructure**: Working HTTP mock in `awssdklib_test/http_mock.ml`
- **Multi-namespace Support**: `sdkgen` already supports namespace mapping via `create_from_model_file_with_namespaces`

### Missing/Needs Implementation ❌
- **HTTP Response Tests**: No `httpResponseTest` type or `TestHttpResponseTests` variant
- **Response Test Parsing**: No parser for `smithy.test#httpResponseTests` (exists in model file)
- **Context Refactoring**: `Context.t` hardcodes `Http.Client.t`, preventing HTTP substitution
- **Protocol Instantiation**: `awssdklib/AwsJson.ml` hardcoded to concrete HTTP client
- **Test Code Generation**: No generators for embedding test data and creating test runners

### Critical Dependencies
- **HTTP Infrastructure Refactoring** is prerequisite for model tests
- Generated operations use `context.http` directly, requiring Context refactoring
- Test generation depends on ability to instantiate protocols with mock HTTP clients

## Risks & Mitigation

- **Code Generation Complexity**: Mitigated by reusing existing `sdkgen` patterns and building on existing HTTP mock infrastructure
- **Test Data Volume**: Embedded data creates larger executables, but improves reliability  
- **HTTP Refactoring Impact**: Breaking change to Context API, requires careful backward compatibility planning
- **Maintenance**: Generated code is rebuilt automatically when model changes
