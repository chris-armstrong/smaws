# Model Tests Requirements

## Overview
This document defines requirements for implementing Smithy protocol compliance testing for the smaws AWS SDK generator. The goal is to validate that our generated OCaml code correctly implements AWS JSON 1.0/1.1 protocols according to the official Smithy test specifications.

## Stakeholders
- **Primary**: smaws SDK maintainers and contributors
- **Secondary**: OCaml developers using generated AWS SDKs
- **Tertiary**: AWS service consumers relying on protocol correctness

## User Stories

### Epic: Protocol Compliance Validation
**As a** smaws SDK maintainer  
**I want** automated protocol compliance testing  
**So that** I can ensure our generated code matches AWS Smithy specifications exactly

### Story 1: HTTP Request Serialization Testing
**As a** SDK maintainer  
**I want** to validate HTTP request serialization  
**So that** generated operations produce correct HTTP requests

**Acceptance Criteria:**
- **GIVEN** a Smithy operation with `smithy.test#httpRequestTests` trait
- **WHEN** the test is executed with test input parameters  
- **THEN** the generated serializer produces HTTP requests matching expected method, URI, headers, and body
- **AND** all JSON 1.0/1.1 protocol variations are tested
- **AND** test failures provide clear diagnostic information

### Story 2: HTTP Response Deserialization Testing  
**As a** SDK maintainer  
**I want** to validate HTTP response deserialization  
**So that** generated operations correctly parse AWS service responses

**Acceptance Criteria:**
- **GIVEN** a Smithy operation with `smithy.test#httpResponseTests` trait
- **WHEN** the test provides a mock HTTP response
- **THEN** the generated deserializer produces output matching expected parameters
- **AND** all status codes, headers, and body formats are validated
- **AND** error responses are properly handled

### Story 3: Multi-Namespace Test Organization
**As a** SDK maintainer  
**I want** tests organized by Smithy protocol namespace  
**So that** I can run and debug protocol-specific test suites independently

**Acceptance Criteria:**
- **GIVEN** multiple Smithy protocol test namespaces (json, json10, query, shared)
- **WHEN** tests are generated  
- **THEN** each namespace produces a separate test library
- **AND** each library follows the same structure as production SDKs
- **AND** libraries can be tested independently via `dune runtest`

### Story 4: Test Data Self-Containment
**As a** SDK maintainer  
**I want** test data embedded directly in generated code  
**So that** tests are self-contained and don't depend on external JSON files

**Acceptance Criteria:**
- **GIVEN** Smithy test specifications from protocol test models
- **WHEN** test code is generated
- **THEN** all test data is embedded as OCaml data structures
- **AND** no external file dependencies exist for test execution
- **AND** test data includes input parameters, expected HTTP details, and response scenarios

### Story 5: HTTP Client Substitution
**As a** SDK maintainer  
**I want** to substitute HTTP clients for testing  
**So that** I can capture requests and provide mock responses without network calls

**Acceptance Criteria:**
- **GIVEN** generated protocol implementations
- **WHEN** instantiated with a mock HTTP client
- **THEN** the mock can capture outgoing HTTP requests for validation
- **AND** the mock can provide canned responses for deserialization testing
- **AND** the substitution doesn't require changes to generated operation code

## Functional Requirements

### FR1: Request Serialization Validation
**The system SHALL** generate test code that validates HTTP request serialization by:
- Taking operation input parameters from test specifications
- Serializing via generated serializers  
- Comparing actual HTTP method, URI, headers, query parameters, and body against expected values
- Supporting both AWS JSON 1.0 and JSON 1.1 protocol variants

### FR2: Response Deserialization Validation  
**The system SHALL** generate test code that validates HTTP response deserialization by:
- Providing mock HTTP responses with specified status, headers, and body
- Deserializing via generated deserializers
- Comparing actual parsed output against expected parameters
- Validating error response handling

### FR3: Namespace-Based Test Libraries
**The system SHALL** generate separate test libraries for each Smithy protocol namespace:
- `aws.protocoltests.json` → `protocol_tests_json/`
- `aws.protocoltests.json10` → `protocol_tests_json10/`  
- `aws.protocoltests.query` → `protocol_tests_query/`
- `aws.protocoltests.shared` → `protocol_tests_shared/`

### FR4: SDK-Like Library Structure
**The system SHALL** generate test libraries that mirror production SDK structure:
- `types.ml/mli` - Generated type definitions
- `serializers.ml` - Request serialization functions  
- `deserializers.ml` - Response deserialization functions
- `operations.ml/mli` - Operation interfaces
- `service_metadata.ml` - Service configuration
- `tests.ml` - Embedded test data and alcotest runner

### FR5: Mock HTTP Integration
**The system SHALL** support HTTP client substitution by:
- Using first-class modules for protocol instantiation
- Accepting mock HTTP clients that implement `Http.Client_intf`
- Enabling request capture and response mocking
- Maintaining compatibility with existing generated code

## Non-Functional Requirements

### NFR1: Performance
**The system SHALL** execute all protocol tests within 30 seconds on typical development machines

### NFR2: Maintainability  
**The system SHALL** regenerate test code automatically when Smithy models change

### NFR3: Reliability
**The system SHALL** provide deterministic test results with clear failure diagnostics

### NFR4: Compatibility
**The system SHALL** maintain backward compatibility with existing SDK generation workflow

## Constraints

### Technical Constraints
- **MUST** use OCaml with existing dune build system
- **MUST** integrate with current alcotest testing framework  
- **MUST** follow existing snake_case naming conventions
- **MUST** use only approved libraries (yojson, base, etc.)
- **MUST** support both JSON 1.0 and JSON 1.1 AWS protocols

### Business Constraints  
- **MUST** not break existing SDK generation or runtime behavior
- **MUST** not introduce new external dependencies
- **MUST** follow existing project commit and review processes

## Dependencies

### Internal Dependencies
- Current `sdkgen` infrastructure for type/serializer/operation generation
- Existing `awssdklib` HTTP client abstraction (`Http.Client_intf`)
- Current `awssdklib_test/http_mock.ml` testing infrastructure
- Smithy AST and parsing infrastructure in `codegen/`

### External Dependencies
- Smithy protocol test model files (existing in submodule)
- AWS protocol specifications (JSON 1.0/1.1)

### Critical Prerequisites
- HTTP infrastructure refactoring to support client substitution
- AST extensions for `httpResponseTest` support  
- Parser updates for response test extraction

## Success Criteria

### Primary Success Criteria
1. **Protocol Compliance**: All generated AWS JSON protocol implementations pass official Smithy compliance tests
2. **Regression Prevention**: Test suite catches serialization/deserialization bugs before release
3. **CI Integration**: Tests run automatically in continuous integration pipeline

### Secondary Success Criteria  
1. **Developer Experience**: Clear test failure diagnostics help debug protocol issues
2. **Documentation**: Generated tests serve as executable protocol behavior documentation
3. **Modularity**: Protocol variants can be tested and debugged independently

## Risks & Assumptions

### Assumptions
- Smithy protocol test specifications are complete and accurate
- Existing HTTP mock infrastructure can be extended for protocol testing
- Current functor-based protocol design can support client substitution

### Risks
- **High**: HTTP infrastructure refactoring may impact existing generated code
- **Medium**: Large embedded test data may significantly increase binary size
- **Low**: Test model changes may require generator updates

## Out of Scope

The following are explicitly **NOT** included in this implementation:
- Testing protocols other than AWS JSON 1.0/1.1 (Query, REST-XML, etc.)
- Performance benchmarking of generated code
- Integration testing with live AWS services
- Protocol specification validation beyond provided test cases