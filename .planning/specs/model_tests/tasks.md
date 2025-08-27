# Implementation Tasks - Model Tests

## Phase 1: Core Infrastructure ✅ COMPLETED

**Summary**: Successfully implemented first-class module support for HTTP client substitution in AwsJson protocols. All infrastructure is in place to support model testing with custom HTTP clients.

### Task 1.1: Extend HTTP Client Interface ✅ COMPLETED
**Acceptance Criteria**: AwsJson protocols accept HTTP client as first-class module
- [x] Modify `awssdklib/protocols_gen/AwsJson.ml` signature to accept HTTP client as parameter
- [x] Change from `Make (Http_module : Http.Client_intf)` functor to function accepting `(module Http.Client_intf)`
- [x] Update `request` function to use first-class module HTTP client
- [x] Ensure backward compatibility with existing generated code

**Implementation Details**:
- Added `request_with_http_module` function at `awssdklib/protocols_gen/AwsJson.ml:67-105`
- Preserved original `Make` functor for backward compatibility, now delegates to new function
- Full request lifecycle implemented with first-class module unpacking

### Task 1.2: Update Context Module ✅ COMPLETED
**Acceptance Criteria**: Context provides HTTP module extraction capability
- [x] Add `http_module` function to `awssdklib/Context.ml`
- [x] Function signature: `val http_module : t -> (module Http.Client_intf)`
- [x] Extract HTTP client from context and package as first-class module
- [x] Update documentation and examples

**Implementation Details**:
- Added `http_module` function at `awssdklib/Context.ml:10-11`
- Implemented generic context type `'http context` for parameterization
- Added helper functions `make_with_http_client` and `extract_http_module` for testing scenarios

### Task 1.3: Modify Generated Operations ✅ COMPLETED
**Acceptance Criteria**: Generated operations use new AwsJson API with extracted HTTP module
- [x] Update `codegen/codegen/AwsProtocolJson.ml` templates (not gen_operations.ml)
- [x] Change operation calls from `AwsJson.Make(Http.Client).request` pattern
- [x] To `AwsJson.request_with_http_module ~http_module:(Context.http_module context)` pattern
- [x] Regenerate test operations to verify changes
- [x] Run existing tests to ensure no regressions

**Implementation Details**:
- Updated `generate_request_handler` function in `codegen/codegen/AwsProtocolJson.ml:559-579`
- Changed from `request` to `request_with_http_module` function call
- Added `~http_module:(Context.http_module context)` parameter
- Verified existing SDKs (e.g., KMS) already use new API pattern
- All tests pass (`dune runtest` successful)

## Phase 2: Test Data Processing

### Task 2.1: Extend Smithy AST for Response Tests ✅ COMPLETED
**Acceptance Criteria**: AST supports both request and response test data
- [x] Add `httpResponseTest` type to `codegen/ast/Trait.ml`
- [x] Fields: `id`, `protocol`, `code`, `headers`, `body`, `bodyMediaType`, `params`
- [x] Add `TestHttpResponseTests of httpResponseTest list` to trait variant
- [x] Update parser to handle response test traits
- [x] Add equality and show derivations

**Implementation Details**:
- `httpResponseTest` type already exists at `codegen/ast/Trait.ml:63-77` with all required fields
- `TestHttpResponseTests` variant already exists in trait union at line 165
- Parser already handles `smithy.test#httpResponseTests` at `codegen/parse/Smithy.ml:351`
- Parser function `parseTestHttpResponseTests` implemented at lines 173-217
- All derivations (`[@@deriving show, equal]`) already in place

### Task 2.2: Create Test Data Parser
**Acceptance Criteria**: Parser extracts and validates test cases from Smithy model
- [ ] Create `model_tests/Test_data_parser.ml`
- [ ] Function: `extract_test_cases : string -> (operation_name * test_case list, error) result`
- [ ] Support both request and response test extraction
- [ ] Validate test case completeness and protocol compatibility
- [ ] Handle multiple namespaces and protocols

### Task 2.3: Implement Test Case Validation
**Acceptance Criteria**: Test cases are validated for completeness and consistency
- [ ] Create validation functions for required fields
- [ ] Check protocol compatibility (awsJson1_0, awsJson1_1)
- [ ] Validate parameter types against operation schemas
- [ ] Report clear error messages for invalid test cases

## Phase 3: Code Generation

### Task 3.1: Generate Type-Safe Input Constructors
**Acceptance Criteria**: Test parameters converted to type-safe OCaml constructors
- [ ] Create `model_tests/Gen_test_constructors.ml`
- [ ] Generate constructor functions per test case: `make_<test_id>_input : unit -> <OperationInput>.t`
- [ ] Handle all Smithy primitive types (string, int, bool, timestamp, blob)
- [ ] Handle complex types (structures, lists, maps, unions)
- [ ] Add `[@@deriving show, equal]` to all generated types

### Task 3.2: Generate Expected Response Constructors  
**Acceptance Criteria**: Expected response values generated as OCaml constructors
- [ ] Generate expected response constructors: `make_<test_id>_expected : unit -> <OperationOutput>.t`
- [ ] Handle optional fields and nested structures
- [ ] Support error response constructors for error test cases
- [ ] Ensure type safety and compile-time validation

### Task 3.3: Generate Test Functions
**Acceptance Criteria**: Complete test functions generated per operation test case
- [ ] Create `model_tests/Gen_test_functions.ml` 
- [ ] Generate request test functions: `test_<operation>_<test_id>_request`
- [ ] Generate response test functions: `test_<operation>_<test_id>_response`
- [ ] Include HTTP mock setup and assertion logic
- [ ] Use alcotest framework for test structure

## Phase 4: Test Execution Framework

### Task 4.1: Create HTTP Mock Integration
**Acceptance Criteria**: HTTP mocks properly configured for each test case
- [ ] Extend `awssdklib_test/http_mock.ml` for response tests
- [ ] Add response verification functions
- [ ] Support multiple request/response cycles per test
- [ ] Clear mock state between tests

### Task 4.2: Implement Test Runner
**Acceptance Criteria**: Organized test execution with clear reporting
- [ ] Create `model_tests/Test_runner.ml`
- [ ] Organize tests by namespace and protocol
- [ ] Provide test filtering and selection capabilities
- [ ] Generate comprehensive test reports
- [ ] Handle test failures gracefully

### Task 4.3: Create Test Assertions
**Acceptance Criteria**: Comprehensive assertions for HTTP requests and responses
- [ ] Create `model_tests/Test_assertions.ml`
- [ ] Assert HTTP method, URI, headers, body
- [ ] Assert response status, headers, body
- [ ] Compare actual vs expected using generated `equal` functions
- [ ] Provide detailed failure messages with `show` functions

## Phase 5: Build System Integration

### Task 5.1: Configure Dune Build
**Acceptance Criteria**: Tests integrated into dune build system
- [ ] Create `model_tests/dune` file
- [ ] Configure dependencies: alcotest, yojson, base
- [ ] Set up executable for test runner
- [ ] Add to root dune-project if needed

### Task 5.2: Create Test Discovery
**Acceptance Criteria**: Tests automatically discovered and executed
- [ ] Implement automatic test discovery from Smithy models
- [ ] Support multiple model files and namespaces
- [ ] Integration with `dune runtest` command
- [ ] Document test execution procedures

### Task 5.3: Add CI Integration
**Acceptance Criteria**: Tests run in continuous integration
- [ ] Ensure tests run with `dune runtest`
- [ ] Add model file dependencies
- [ ] Document any special requirements
- [ ] Verify test performance and timeout handling

## Phase 6: Documentation and Examples

### Task 6.1: Create Usage Documentation
**Acceptance Criteria**: Clear documentation for running and extending tests
- [ ] Document test runner usage and options
- [ ] Explain test case structure and requirements
- [ ] Provide troubleshooting guide
- [ ] Add examples of custom test cases

### Task 6.2: Add Code Examples
**Acceptance Criteria**: Working examples of test generation and execution
- [ ] Example of generated test code
- [ ] Example of manual test case addition
- [ ] Example of HTTP mock usage
- [ ] Integration examples with existing SDK code

### Task 6.3: Validation and Testing
**Acceptance Criteria**: Implementation validated against requirements
- [ ] Run tests against actual AWS protocol test suites
- [ ] Verify compliance with Smithy protocol specifications
- [ ] Test with multiple AWS services and namespaces
- [ ] Performance testing and optimization

## Dependencies and Sequencing

- **Critical Path**: Tasks 1.1-1.3 → 2.1-2.3 → 3.1-3.3 → 4.1-4.3
- **Parallel Work**: Tasks 2.x can begin once 1.1 is complete
- **Integration Points**: Task 4.2 requires completion of all Task 3.x
- **Final Validation**: Task 6.3 requires all previous tasks

## Risk Mitigation

- **OCaml Type System**: Extensive unit testing of generated code compilation
- **Smithy Model Changes**: Flexible parser design to handle schema evolution  
- **HTTP Mock Complexity**: Incremental testing with simple cases first
- **Performance Issues**: Profiling and optimization during Task 6.3
