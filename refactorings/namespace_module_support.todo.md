# Namespace Module Support Implementation Todo

## Phase 1: Data Structure Updates
- [x] Analyze current codebase structure and understand existing types
- [x] Update context type to include namespace_module_mapping field
- [x] Implement partition_by_namespace function
- [x] Implement make_namespace_context function
- [x] Modify create_from_model_file to return namespace contexts list

## Phase 2: Helper Modules
- [x] Create namespace_resolver helper module

## Phase 3: Code Generation Updates
- [x] Review Phase 1 completion status and verify implementation
- [x] Update core codegen/codegen modules to accept namespace resolver parameter:
  - [x] Types.ml - core type generation logic
  - [x] Builders.ml - builder function generation
  - [x] AwsProtocolJson.ml - Serializers and Deserializers modules
- [x] Update sdkgen generation modules to use namespace resolver:
  - [x] gen_types.ml - type references in structure members (already implemented)
  - [x] gen_operations.ml - input/output type references
  - [x] gen_builders.ml - parameter and return type references
  - [x] gen_serialisers.ml - type references in serialization code
  - [x] gen_deserialisers.ml - type references in deserialization code
- [x] Update sdkgen.ml write functions to pass namespace resolver to gen modules
- [x] Ensure namespace resolution works for:
  - [x] Type name references in generated types
  - [x] Serializer function references (cross-namespace serializers)
  - [x] Deserializer function references (cross-namespace deserializers)
  - [x] Builder function references (cross-namespace builders)
- [x] Verify backward compatibility with single-namespace models
- [ ] Test namespace resolution with multi-namespace models (Phase 4)

## Phase 4: Integration and Testing (In Progress)
- [x] Update main generation loop to handle multiple namespaces (from Phase 1)
- [x] Test implementation with existing models (basic single-namespace verified)
- [x] Design comprehensive test plan for multi-namespace support
- [ ] Create test model with multiple namespaces for testing
- [ ] Implement unit tests with Alcotest for namespace functions
- [ ] Implement integration tests for multi-namespace pipeline
- [ ] Update dune configuration for test execution
- [ ] Test namespace resolution with actual multi-namespace models
- [ ] Verify cross-namespace references generate correct module qualifiers
- [ ] Test complete generation pipeline with multi-namespace output
- [ ] Update main generator binary to support namespace mappings parameter
- [ ] Test with real AWS service models from sdks/ directory

## Implementation Status: Phase 3 Complete ✅

### Completed in Phase 3:
- ✅ All core codegen modules updated to accept namespace resolver
- ✅ All SDK generation modules updated to use namespace resolver  
- ✅ Integration layer (sdkgen.ml) updated to create and pass namespace resolvers
- ✅ Comprehensive namespace resolution for types, serializers, deserializers, builders
- ✅ Backward compatibility verified with single-namespace models
- ✅ Full codebase compiles successfully
- ✅ Basic functionality testing completed

### Technical Implementation Details:
- All functions accept optional `?(namespace_resolver : Namespace_resolver.Namespace_resolver.t option = None)` 
- Smart namespace resolver creation: only when `namespace_module_mapping` is not empty
- Current namespace extracted from service name using `Codegen.Util.symbolNamespace`
- Cross-namespace references resolved using `Namespace_resolver.resolve_reference`
- Function signatures updated throughout the call chain

## Phase 4 Testing Plan Details

### Testing Strategy
1. **Unit Tests** (`sdkgen/namespace_tests.ml`):
   - Test `partition_by_namespace` with multi-namespace models using real AWS namespaces (com.amazonaws.amplify, com.amazonaws.s3)
   - Test `make_namespace_context` for individual namespace processing
   - Test namespace resolver functions with cross-namespace references
   - Test builtin type handling (smithy.api shapes are implicit, not partitioned)
   - Test single-namespace compatibility (empty mapping should work as before)

2. **Integration Tests** (`sdkgen/integration_tests.ml`):
   - Test complete generation pipeline with cross-namespace references
   - Test realistic scenarios (e.g., Amplify service referencing S3 BucketName)
   - Test with actual models from sdks/ directory
   - Verify generated code structure and compilation

3. **Key Testing Insights**:
   - `smithy.api` namespace contains builtin types handled by `smithyImplicitShapes` in Dependencies.ml
   - Builtin types should resolve to OCaml primitives (string, bool) not module qualifiers
   - Only test with models already proven to work in sdks/ directory
   - Focus on realistic AWS service cross-references

### Example Test Cases
```ocaml
(* Test cross-namespace reference resolution *)
let cross_ref = Namespace_resolver.resolve_reference resolver "com.amazonaws.s3#Bucket" in
check string "cross-namespace reference" "S3.Bucket" cross_ref;

(* Test builtin types resolve to primitives, not modules *)
let builtin_ref = Namespace_resolver.resolve_reference resolver "smithy.api#String" in
check string "builtin reference" "string" builtin_ref;
```

### Dune Configuration
- Add alcotest dependency with `:with-test` flag
- Create test executables in sdkgen/dune
- Tests depend on parselib, sdkgen, base, alcotest libraries

## Complete Test Implementation Examples

### Unit Tests: `sdkgen/namespace_tests.ml`
```ocaml
open Base
open Alcotest

let test_partition_by_namespace () =
  let shapes = [
    { Ast.Dependencies.name = "com.amazonaws.amplify#Service"; 
      descriptor = Service { operations = []; traits = [] };
      targets = []; recursWith = None };
    { Ast.Dependencies.name = "com.amazonaws.amplify#CreateApp"; 
      descriptor = Operation { input = None; output = None; traits = [] };
      targets = []; recursWith = None };
    { Ast.Dependencies.name = "com.amazonaws.s3#Bucket"; 
      descriptor = String { traits = [] };
      targets = []; recursWith = None };
  ] in
  
  let namespace_mapping = Map.Poly.of_alist_exn [
    ("com.amazonaws.amplify", "Amplify");
    ("com.amazonaws.s3", "S3");
  ] in
  
  let result = Sdkgen.partition_by_namespace shapes namespace_mapping in
  
  (* Verify we get two namespaces *)
  check int "namespace count" 2 (List.length result);
  
  (* Verify namespace separation *)
  let amplify_context = List.Assoc.find_exn result ~equal:String.equal "com.amazonaws.amplify" in
  let s3_context = List.Assoc.find_exn result ~equal:String.equal "com.amazonaws.s3" in
  
  check int "amplify shapes count" 2 (List.length amplify_context.shapes);
  check int "s3 shapes count" 1 (List.length s3_context.shapes)

let test_namespace_resolver () =
  let resolver = Namespace_resolver.Namespace_resolver.create 
    ~current_namespace:"com.amazonaws.amplify"
    ~namespace_module_mapping:(Map.Poly.of_alist_exn [
      ("com.amazonaws.amplify", "Amplify");
      ("com.amazonaws.s3", "S3");
    ]) in
  
  (* Test local reference *)
  let local_ref = Namespace_resolver.Namespace_resolver.resolve_reference 
    resolver "com.amazonaws.amplify#CreateApp" in
  check string "local reference" "CreateApp" local_ref;
  
  (* Test cross-namespace reference *)
  let cross_ref = Namespace_resolver.Namespace_resolver.resolve_reference 
    resolver "com.amazonaws.s3#Bucket" in
  check string "cross-namespace reference" "S3.Bucket" cross_ref

let test_builtin_types_not_partitioned () =
  (* Test that smithy.api types are handled as builtins, not partitioned *)
  let shapes = [
    { Ast.Dependencies.name = "com.amazonaws.amplify#Service"; 
      descriptor = Service { operations = []; traits = [] };
      targets = ["smithy.api#String"]; recursWith = None };
    { Ast.Dependencies.name = "com.amazonaws.amplify#MyString"; 
      descriptor = String { traits = [] };
      targets = []; recursWith = None };
  ] in
  
  let namespace_mapping = Map.Poly.of_alist_exn [
    ("com.amazonaws.amplify", "Amplify");
  ] in
  
  let result = Sdkgen.partition_by_namespace shapes namespace_mapping in
  
  (* Should only get amplify namespace - smithy.api shapes are implicit/builtin *)
  check int "namespace count" 1 (List.length result);
  
  let amplify_context = List.Assoc.find_exn result ~equal:String.equal "com.amazonaws.amplify" in
  (* Should contain the service and custom string, but not smithy.api#String *)
  check int "amplify shapes count" 2 (List.length amplify_context.shapes)

let test_builtin_types_in_namespace_resolver () =
  let resolver = Namespace_resolver.Namespace_resolver.create 
    ~current_namespace:"com.amazonaws.amplify"
    ~namespace_module_mapping:(Map.Poly.of_alist_exn [
      ("com.amazonaws.amplify", "Amplify");
    ]) in
  
  (* Test that smithy.api types resolve to their builtin OCaml equivalents *)
  (* This should NOT get a module qualifier since they're builtin *)
  let builtin_ref = Namespace_resolver.Namespace_resolver.resolve_reference 
    resolver "smithy.api#String" in
  check string "builtin reference" "string" builtin_ref;
  
  let builtin_bool = Namespace_resolver.Namespace_resolver.resolve_reference 
    resolver "smithy.api#Boolean" in
  check string "builtin boolean" "bool" builtin_bool

let test_single_namespace_compatibility () =
  (* Test that single-namespace models work exactly as before *)
  let shapes = [
    { Ast.Dependencies.name = "com.amazonaws.amplify#Service"; 
      descriptor = Service { operations = []; traits = [] };
      targets = []; recursWith = None };
  ] in
  
  let empty_mapping = Map.Poly.empty in
  let result = Sdkgen.partition_by_namespace shapes empty_mapping in
  
  (* Should get one namespace context *)
  check int "single namespace count" 1 (List.length result)

let () =
  run "Namespace Support Tests" [
    "partition_by_namespace", [
      test_case "multi-namespace partitioning" `Quick test_partition_by_namespace;
      test_case "builtin types not partitioned" `Quick test_builtin_types_not_partitioned;
      test_case "single-namespace compatibility" `Quick test_single_namespace_compatibility;
    ];
    "namespace_resolver", [
      test_case "reference resolution" `Quick test_namespace_resolver;
      test_case "builtin type resolution" `Quick test_builtin_types_in_namespace_resolver;
    ];
  ]
```

### Integration Tests: `sdkgen/integration_tests.ml`
```ocaml
open Base
open Alcotest

let test_amplify_with_s3_references () =
  (* Test a scenario where Amplify service might reference S3 types *)
  let shapes = [
    { Ast.Dependencies.name = "com.amazonaws.amplify#Service"; 
      descriptor = Service { operations = ["com.amazonaws.amplify#CreateApp"]; traits = [] };
      targets = []; recursWith = None };
    { Ast.Dependencies.name = "com.amazonaws.amplify#CreateApp"; 
      descriptor = Operation { 
        input = Some "com.amazonaws.amplify#CreateAppRequest"; 
        output = Some "com.amazonaws.amplify#CreateAppResponse"; 
        traits = [] 
      };
      targets = ["com.amazonaws.amplify#CreateAppRequest"; "com.amazonaws.amplify#CreateAppResponse"]; 
      recursWith = None };
    { Ast.Dependencies.name = "com.amazonaws.amplify#CreateAppRequest"; 
      descriptor = Structure { 
        members = [("bucketName", "com.amazonaws.s3#BucketName")]; 
        traits = [] 
      };
      targets = ["com.amazonaws.s3#BucketName"]; recursWith = None };
    { Ast.Dependencies.name = "com.amazonaws.s3#BucketName"; 
      descriptor = String { traits = [] };
      targets = []; recursWith = None };
  ] in
  
  let namespace_mapping = Map.Poly.of_alist_exn [
    ("com.amazonaws.amplify", "Amplify");
    ("com.amazonaws.s3", "S3");
  ] in
  
  let result = Sdkgen.partition_by_namespace shapes namespace_mapping in
  
  (* Verify cross-namespace references are preserved *)
  check int "namespace count" 2 (List.length result);
  
  let amplify_context = List.Assoc.find_exn result ~equal:String.equal "com.amazonaws.amplify" in
  let s3_context = List.Assoc.find_exn result ~equal:String.equal "com.amazonaws.s3" in
  
  (* Amplify should have service, operation, and request structure *)
  check int "amplify shapes count" 3 (List.length amplify_context.shapes);
  (* S3 should have just the bucket name type *)
  check int "s3 shapes count" 1 (List.length s3_context.shapes)

let test_real_amplify_model () =
  (* Test with actual Amplify model if it exists in sdks/ *)
  let model_path = "sdks/amplify/model.json" in
  if Sys.file_exists model_path then (
    let namespace_mapping = Map.Poly.of_alist_exn [("com.amazonaws.amplify", "Amplify")] in
    
    match Sdkgen.create_from_model_file ~namespace_module_mapping:namespace_mapping model_path with
    | Ok contexts ->
        (* Should successfully parse and partition *)
        check bool "real model parsing" true (List.length contexts > 0)
    | Error _ ->
        check bool "real model parsing failed" true false
  ) else (
    (* Skip test if model doesn't exist *)
    check bool "real model test skipped" true true
  )

let () =
  run "Integration Tests" [
    "cross_namespace_references", [
      test_case "amplify with s3 references" `Quick test_amplify_with_s3_references;
    ];
    "real_models", [
      test_case "real amplify model" `Quick test_real_amplify_model;
    ];
  ]
```

### Dune Configuration: `sdkgen/dune` (updated)
```lisp
(executable
 (public_name sdkgen)
 (name Sdkgen)
 (libraries 
   parselib 
   base 
   yojson))

(test
 (name namespace_tests)
 (libraries 
   parselib
   sdkgen
   base
   alcotest))

(test
 (name integration_tests)
 (libraries 
   parselib
   sdkgen
   base
   alcotest))
```

### Root `dune-project` (ensure test dependencies)
```lisp
(package
 (name smaws)
 (depends
   ocaml
   dune
   base
   yojson
   xmlm
   digestif
   eio-ssl
   uri
   logs
   httpun
   httpun-eio
   ptime
   ppx_deriving
   (alcotest :with-test)))
```

### Test Execution Commands
```bash
# Run namespace-specific tests
dune test sdkgen/namespace_tests.exe

# Run integration tests  
dune test sdkgen/integration_tests.exe

# Run all tests
dune test
```

## Implementation Notes
- Namespace separation occurs AFTER `Ast.Dependencies.order` to preserve dependency relationships
- Must happen BEFORE `Ast.Organize.partitionOperationShapes` to maintain shape categorization logic
- Existing `write_*` functions remain unchanged - they receive pre-filtered contexts
- Cross-namespace references handled by namespace resolver module
- Namespace resolver must handle not just type names but also function references (serializers, deserializers, builders)
- Backward compatibility maintained: single-namespace models work exactly as before
- **CRITICAL**: smithy.api types are builtin via smithyImplicitShapes - not partitioned into separate namespace