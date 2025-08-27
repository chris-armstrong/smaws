# Model Tests Implementation Checklist

This checklist tracks the implementation progress of Smithy protocol compliance testing for the smaws AWS SDK generator. The goal is to validate that generated OCaml code correctly implements AWS JSON 1.0/1.1 protocols according to official Smithy test specifications.

## Current Status Overview

**Feature Status**: 🟡 In Progress - Basic infrastructure exists, full implementation underway

**Last Updated**: 2025-08-27

**Current Branch**: model-tests

---

## Phase 1: Core Infrastructure ⚠️ Critical Prerequisites

### Task 1.1: HTTP Client Interface Refactoring
**Status**: ✅ **Completed** - Critical blocker resolved

**Implemented**: The `Context.t` type is now generic and supports HTTP client substitution for testing.

- [x] **COMPLETED**: Modified `awssdklib/protocols_gen/AwsJson.ml` to accept HTTP client as first-class module
- [x] **COMPLETED**: Changed from functor `Make (Http_module : Http.Client_intf)` to function accepting `(module Http.Client_intf)`
- [x] **COMPLETED**: Updated `request` function signature to use first-class module HTTP client
- [x] **COMPLETED**: Modified `awssdklib/Context.ml` to provide HTTP module extraction
- [x] **COMPLETED**: Generated operations continue to use compatible AwsJson API
- [x] **COMPLETED**: Ensured backward compatibility with existing production code

**Files to modify**:
- `/home/chris/dev/smaws/awssdklib/protocols_gen/AwsJson.ml`
- `/home/chris/dev/smaws/awssdklib/Context.ml`
- `/home/chris/dev/smaws/codegen/codegen/gen_operations.ml` (templates)

**Dependencies**: All subsequent phases depend on this being completed first.

**NOTES**: We don't want to use functors for Context.t nor the files in Protocol_gen - these should be defunctorised and capable of using the Http Client without it

### Task 1.2: Verify HTTP Mock Infrastructure
**Status**: ✅ **Completed**

**Current State**: HTTP mock infrastructure already exists and looks suitable.

- [x] HTTP mock module exists at `/home/chris/dev/smaws/awssdklib_test/http_mock.ml`
- [x] Provides `HttpMock_intf` with required functionality
- [x] Supports request capture and response mocking
- [x] Can be extended for protocol testing needs

---

## Phase 2: AST and Parser Extensions ✅ Completed

### Task 2.1: Request Test Support
**Status**: ✅ **Completed**

**Current State**: HTTP request test support already implemented.

- [x] `httpRequestTest` type exists in `codegen/ast/Trait.ml` (lines 40-61)
- [x] `TestHttpRequestTests` variant implemented
- [x] Parser in `codegen/parse/Smithy.ml` extracts `smithy.test#httpRequestTests` (lines 106-171)
- [x] Test data extraction working (as verified by current `gen.ml` output)

### Task 2.2: Response Test Support
**Status**: ✅ **Completed** - Response test parsing implemented

- [x] **COMPLETED**: Add `httpResponseTest` type to `codegen/ast/Trait.ml`
- [x] **COMPLETED**: Add `TestHttpResponseTests` variant to trait union
- [x] **COMPLETED**: Extend `codegen/parse/Smithy.ml` to parse `smithy.test#httpResponseTests`
- [x] **COMPLETED**: Verify response test data extraction in Smithy model
- [x] **COMPLETED**: Test filtering for AWS JSON protocols

**Required Fields**: `id`, `protocol`, `code`, `headers`, `body`, `bodyMediaType`, `params`, `vendorParams`, `vendorParamsShape`, `documentation`, `tags`, `appliesTo`

---

## Phase 3: Test Data Processing and Code Generation 🔧 Basic Structure Exists

### Task 3.1: Current Generator Analysis
**Status**: ✅ **Analysis Complete** 

**Current Implementation** (`model_tests/gen.ml`):
- [x] Successfully loads Smithy models with namespace mapping
- [x] Extracts operations with HTTP request tests
- [x] Filters for AWS JSON 1.0/1.1 protocols
- [x] Generates basic types with `[@@deriving show, equal]` annotations
- [x] Reuses existing `sdkgen` infrastructure

**Current Output**: Types are being generated in `types.ml/mli` with proper deriving annotations.

### Task 3.2: Extend Test Code Generation
**Status**: 🟡 **Partially Complete** - Needs significant expansion

**Current Status**:
- [x] Basic type generation with deriving annotations working
- [x] Test case identification and parsing working  
- [x] Namespace mapping configured for protocol test namespaces

**Still Need**:
- [ ] Generate complete test libraries per namespace (separate directories)
- [ ] Generate serializers.ml, deserializers.ml, operations.ml per namespace
- [ ] Generate test runner functions with HTTP mock integration
- [ ] Generate type-safe input constructors from test params
- [ ] Generate expected response constructors (for response tests)
- [ ] Generate alcotest test functions with embedded test data
- [ ] Generate dune files for each namespace

### Task 3.3: Type-Safe Test Function Generation
**Status**: ❌ **Not Started** - Critical missing piece

**Key Challenge**: OCaml lacks runtime type information, so we cannot convert `Yojson.Basic.t` to arbitrary generated types at runtime.

**Solution Approach**: Generate type-safe constructor functions per test case:

```ocaml
(* For each test case, generate a constructor function *)
type no_input_test_case = {
  test_id : string;
  input_constructor : unit -> unit;  (* Type-safe input constructor *)
  expected_method : string;
  expected_uri : string;
  expected_headers : (string * string) list;
  expected_body : string option;
}

let test_no_input_and_no_output_sends_requests_to_slash = {
  test_id = "sends_requests_to_slash";
  input_constructor = (fun () -> ());
  expected_method = "POST";
  expected_uri = "/";
  expected_headers = [("X-Amz-Target", "JsonProtocol.EmptyOperation"); ("Content-Type", "application/x-amz-json-1.1")];
  expected_body = None;
}
```

**Required Work**:
- [ ] **CRITICAL**: Implement conversion from Smithy test `params` to OCaml constructor expressions
- [ ] Handle all Smithy types: primitives, structures, lists, maps, unions, optional types
- [ ] Generate type-safe test runner functions per operation
- [ ] Embed all test data as OCaml constants (no external JSON dependencies)

---

## Phase 4: Directory Structure and Build System 📁 Needs Implementation

### Task 4.1: Multi-Namespace Directory Structure
**Status**: ❌ **Not Started** - Critical for organization

**Target Structure** (per requirements):
```
model_tests/
├── gen.ml                           # Current generator (needs expansion)
├── protocol_tests_json/             # aws.protocoltests.json namespace
│   ├── dune                         # Library + test executable  
│   ├── types.ml/mli                 # Generated types with [@@deriving show, equal]
│   ├── serializers.ml               # Request serialization functions (exposed)
│   ├── deserializers.ml             # Response deserialization functions (exposed)
│   ├── operations.ml/mli            # Operation interfaces
│   ├── service_metadata.ml          # Service configuration
│   ├── tests.ml                     # Embedded test data + alcotest runner
│   └── protocol_tests_json.ml       # Library entry point
├── protocol_tests_json10/           # aws.protocoltests.json10 namespace
├── protocol_tests_query/            # aws.protocoltests.query namespace  
├── protocol_tests_shared/           # aws.protocoltests.shared namespace
└── [other namespaces as needed]
```

**Current State**: Only single-namespace type generation in root `model_tests/` directory.

**Required Work**:
- [ ] Update `gen.ml` to generate separate directories per namespace
- [ ] Generate complete SDK-like structure per namespace
- [ ] Generate dune configuration files per namespace
- [ ] Ensure each namespace library can be tested independently

### Task 4.2: Build System Integration
**Status**: ❌ **Not Started**

- [ ] Create dune files for each generated namespace library
- [ ] Configure dependencies: `smaws-lib`, `alcotest`, `yojson`, `base`
- [ ] Set up test executables per namespace
- [ ] Integrate with `dune runtest` command
- [ ] Test parallel execution of namespace test suites

---

## Phase 5: Test Execution Framework 🧪 Needs Implementation

### Task 5.1: HTTP Mock Integration with Protocol Tests
**Status**: ❌ **Not Started** - Depends on Phase 1 completion

This phase is **BLOCKED** until HTTP client refactoring (Phase 1.1) is completed.

**Required Once Phase 1 Complete**:
- [ ] Extend HTTP mock for protocol-specific testing
- [ ] Create mock HTTP client instantiation per test namespace
- [ ] Implement request capture and validation
- [ ] Implement response mocking and deserialization testing
- [ ] Create test assertion helpers

### Task 5.2: Test Runner Implementation
**Status**: ❌ **Not Started**

- [ ] Generate alcotest test suites per operation
- [ ] Create test discovery and execution logic
- [ ] Implement test filtering (by protocol, operation, etc.)
- [ ] Add comprehensive test reporting
- [ ] Handle test failures with detailed diagnostics

### Task 5.3: Validation Testing
**Status**: ❌ **Not Started**

- [ ] Validate against actual AWS protocol test suites
- [ ] Test with multiple operations and protocols
- [ ] Performance testing and optimization
- [ ] Integration testing with existing SDK code

---

## Phase 6: Documentation and Integration 📚 Future Work

### Task 6.1: Usage Documentation
**Status**: ❌ **Not Started**

- [ ] Document test runner usage and options
- [ ] Create troubleshooting guide
- [ ] Add examples of generated test code
- [ ] Integration documentation with existing workflow

### Task 6.2: CI Integration
**Status**: ❌ **Not Started**

- [ ] Ensure tests run with `dune runtest`
- [ ] Verify test performance and timeouts
- [ ] Add to existing CI pipeline
- [ ] Document any special requirements

---

## Current Blockers and Issues 🚫

### Critical Path Blockers (Must be resolved first)

1. **HTTP Client Refactoring (Phase 1.1)** - This is the #1 blocker
   - Current `Context.t` hardcodes `Http.Client.t`
   - Cannot substitute HTTP clients for testing
   - All protocol testing depends on this being fixed
   - Requires careful backward compatibility planning

2. **Response Test AST Support (Phase 2.2)**
   - Missing `httpResponseTest` type and parsing
   - Needed for response deserialization testing
   - Moderate complexity, but required for completeness

### Implementation Challenges

3. **Type-Safe Test Generation (Phase 3.3)**
   - Cannot convert JSON to arbitrary types at runtime in OCaml
   - Must generate type-safe constructors at code generation time
   - Complex but has clear solution path

4. **Multi-Namespace Generation (Phase 4.1)**
   - Current generator only handles single output directory
   - Need to organize by protocol namespace
   - Moderate refactoring required

---

## Success Metrics and Testing Strategy 📊

### Definition of Done
- [ ] All AWS JSON 1.0/1.1 protocol tests pass from official Smithy test specifications
- [ ] Tests run automatically via `dune runtest`  
- [ ] Each protocol namespace can be tested independently
- [ ] Test failures provide clear diagnostic information
- [ ] No regressions in existing SDK generation or runtime behavior

### Testing Strategy
1. **Phase 1 Validation**: Ensure HTTP refactoring doesn't break existing SDKs
2. **Phase 3 Validation**: Verify generated test code compiles and types are correct
3. **Phase 5 Validation**: Run against actual Smithy protocol specifications
4. **Integration Testing**: Test with multiple AWS services and protocol variants

---

## Next Recommended Actions 🎯

### Immediate Priority (Critical Path)
1. **Start with Phase 1.1** - HTTP client refactoring is the critical blocker
2. **Implement Phase 2.2** - Add response test AST support (relatively straightforward)
3. **Expand Phase 3.2** - Extend current generator to multi-namespace structure

### Development Approach
1. **Incremental Implementation**: Build on existing working pieces
2. **Test Early**: Validate each phase before proceeding
3. **Maintain Compatibility**: Ensure no regressions in production SDKs
4. **Document Decisions**: Track implementation choices for future maintenance

---

## File References 📂

### Current Implementation Files
- `/home/chris/dev/smaws/model_tests/gen.ml` - Main generator (needs expansion)
- `/home/chris/dev/smaws/model_tests/types.ml` - Generated types (working)
- `/home/chris/dev/smaws/model_tests/types.mli` - Type interfaces (working)
- `/home/chris/dev/smaws/model_tests/dune` - Build configuration

### Files Requiring Modification
- `/home/chris/dev/smaws/awssdklib/protocols_gen/AwsJson.ml` - HTTP client refactoring
- `/home/chris/dev/smaws/awssdklib/Context.ml` - HTTP module extraction
- `/home/chris/dev/smaws/codegen/ast/Trait.ml` - Response test AST
- `/home/chris/dev/smaws/codegen/parse/Smithy.ml` - Response test parsing
- `/home/chris/dev/smaws/codegen/codegen/gen_operations.ml` - Operation generation templates

### Specification Documents
- `/home/chris/dev/smaws/.planning/specs/model_tests/requirements.md` - Requirements
- `/home/chris/dev/smaws/.planning/specs/model_tests/design.md` - Technical design
- `/home/chris/dev/smaws/.planning/specs/model_tests/tasks.md` - Task breakdown
- `/home/chris/dev/smaws/refactorings/model_tests.md` - Implementation plan

### Test Data
- `/home/chris/dev/smaws/smithy-aws-protocol-tests_model.json` - Smithy test specifications

---

**Legend**: ✅ Complete | 🟡 In Progress | ❌ Not Started | ⚠️ Blocked | 🚫 Critical Issue
