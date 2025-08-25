# Namespace Module Support Design Specification

## Overview

This specification outlines the design for refactoring the SDK generation pipeline to support namespace-aware module generation. The current implementation flattens all Smithy namespaces into a single OCaml module, leading to potential name conflicts. This refactoring will enable generating separate OCaml modules for each namespace while maintaining proper cross-namespace references.

## Current Architecture Analysis

### Current Flow in `sdkgen.ml`
1. `create_from_model_file` parses the JSON model
2. `make_context` creates shapes with targets using `shape_with_target`
3. `Ast.Dependencies.order` performs topological ordering of all shapes
4. `Ast.Organize.partitionOperationShapes` partitions shapes into service, operations, and structures
5. Various `write_*` functions generate code from these partitioned shapes

### Key Data Structures
- `Shape.t = { name: string; descriptor: shapeDescriptor }`
- `Dependencies.shapeWithTarget` includes targets and recursion information
- Shape names use Smithy qualified format: `"namespace#shapeName"` (e.g., `"com.amazonaws.amplify#AccessToken"`)
- `Util.symbolNamespace` and `Util.symbolName` extract namespace and name components

## Proposed Architecture

### 1. New Types and Data Structures

```ocaml
(* New type for namespace-to-module mapping *)
type namespace_module_mapping = (string, string) Map.Poly.t

(* Enhanced context type *)
type t = {
  name : string;
  service : Ast.Shape.serviceShapeDetails;
  operation_shapes : (string * Ast.Shape.operationShapeDetails * string list) list;
  structure_shapes : Ast.Dependencies.shapeWithTarget list;
  service_details : Ast.Trait.serviceDetails;
  alias_context : Codegen.Types.t;
  shapes : Ast.Shape.t list;
  namespace_module_mapping : namespace_module_mapping; (* New field *)
}
```

### 2. Modified `create_from_model_file` Function

```ocaml
let create_from_model_file ~namespace_module_mapping input_filename =
  match Parse.Json.Decode.parseJsonFile input_filename Parse.Smithy.parseModel with
  | Ok shapes -> 
      let ordered = shapes |> List.map ~f:shape_with_target |> Ast.Dependencies.order in
      Ok (partition_by_namespace ordered namespace_module_mapping)
  | Error error -> Error (`ParseError error)
```

### 3. New Namespace Partitioning Logic

After `Ast.Dependencies.order` but before `Ast.Organize.partitionOperationShapes`, introduce:

```ocaml
let partition_by_namespace (ordered_shapes : Ast.Dependencies.shapeWithTarget list) 
    (namespace_module_mapping : namespace_module_mapping) : 
  (string * t) list =
  ordered_shapes
  |> List.group ~break:(fun a b -> 
       String.compare 
         (Util.symbolNamespace a.name) 
         (Util.symbolNamespace b.name) <> 0)
  |> List.map ~f:(fun namespace_shapes ->
       let namespace = Util.symbolNamespace (List.hd_exn namespace_shapes).name in
       let context = make_namespace_context namespace namespace_shapes namespace_module_mapping in
       (namespace, context))

let make_namespace_context namespace shapes namespace_module_mapping =
  let (name, service), operation_shapes, structure_shapes =
    Ast.Organize.partitionOperationShapes shapes in
  let service_details = Ast.Trait.extractServiceTrait service.traits in
  let flattened_shapes =
    structure_shapes
    |> List.concat_map ~f:(fun Ast.Dependencies.{ name; descriptor; recursWith; _ } ->
           Ast.Shape.{ name; descriptor }
           :: Option.value_map recursWith ~default:[] ~f:(fun recurs ->
                  List.map recurs ~f:(fun Ast.Dependencies.{ name; descriptor; _ } ->
                      Ast.Shape.{ name; descriptor }))) in
  let alias_context = Gen_types.create_alias_context flattened_shapes in
  {
    name; service; operation_shapes; structure_shapes; 
    service_details; alias_context; shapes = flattened_shapes;
    namespace_module_mapping;
  }
```

### 4. No Changes to `write_*` Functions

The existing `write_*` functions work unchanged - they receive a context that already contains only shapes from their namespace:

```ocaml
let write_types ~output_dir ~filename ?(with_derivings = false) t =
  (* Existing generation logic unchanged *)
  (* Cross-namespace references handled in code generation modules *)
  ...

let write_operations ~output_dir ~filename t =
  (* Existing generation logic unchanged *)
  ...
```

### 5. Main Generation Loop

The main generation flow becomes:

```ocaml
let generate_all_namespaces input_filename namespace_module_mapping output_dir =
  match create_from_model_file ~namespace_module_mapping input_filename with
  | Ok namespace_contexts ->
      List.iter namespace_contexts ~f:(fun (namespace, context) ->
        let module_name = Map.find_exn namespace_module_mapping namespace in
        write_types ~output_dir ~filename:module_name context;
        write_operations ~output_dir ~filename:module_name context;
        write_builders ~output_dir ~filename:module_name context;
        (* ... other write_* calls ... *)
      )
  | Error error -> (* handle error *)
```

### 6. Cross-Namespace Reference Resolution

A new shared helper module (`codegen/codegen/namespace_resolver.ml`) will handle cross-namespace references:

```ocaml
module Namespace_resolver = struct
  type t = {
    current_namespace : string;
    namespace_module_mapping : (string, string) Map.Poly.t;
  }

  let create ~current_namespace ~namespace_module_mapping = 
    { current_namespace; namespace_module_mapping }

  let resolve_reference t target_name =
    let target_namespace = Util.symbolNamespace target_name in
    let target_symbol = Util.symbolName target_name in
    if String.equal target_namespace t.current_namespace then
      target_symbol (* Local reference *)
    else
      match Map.find t.namespace_module_mapping target_namespace with
      | Some module_name -> module_name ^ "." ^ target_symbol
      | None -> failwith ("Unknown namespace: " ^ target_namespace)

  let resolve_optional_reference t = function
    | None -> None
    | Some target_name -> Some (resolve_reference t target_name)
end
```

This resolver will be passed to all `codegen/codegen/*.ml` functions that need to generate type references.

## Implementation Strategy

### Phase 1: Data Structure Updates
1. Add `namespace_module_mapping` parameter to `create_from_model_file`
2. Update the context type `t` to include the mapping
3. Implement `partition_by_namespace` and `make_namespace_context` functions

### Phase 2: Core Function Changes
1. Modify `create_from_model_file` to return `(string * t) list` instead of single `t`
2. Update calling code to handle multiple namespace contexts
3. Implement main generation loop to iterate over namespace contexts

### Phase 3: Code Generation Updates
1. Create shared namespace resolution helper module in `codegen/codegen/` (e.g., `namespace_resolver.ml`)
2. Update `sdkgen/gen_*.ml` modules to use the namespace resolver:
   - `gen_types.ml` - for type references in structure members
   - `gen_operations.ml` - for input/output type references  
   - `gen_builders.ml` - for parameter and return type references
   - `gen_serialisers.ml` - for type references in serialization code
   - `gen_deserialisers.ml` - for type references in deserialization code
3. Update underlying `codegen/codegen/*.ml` modules to accept and use qualified names:
   - `Types.ml` - core type generation logic
   - `Builders.ml` - builder function generation
   - Other code generation modules as needed
4. Test with multi-namespace models

### Phase 4: Integration and Testing
1. Update main generator binary to provide namespace mappings
2. Test with real AWS service models containing multiple namespaces
3. Ensure backward compatibility for single-namespace models

## Constraints and Requirements

### Critical Constraints
1. **Ordering Preservation**: Namespace separation must occur AFTER `Ast.Dependencies.order` to preserve dependency relationships
2. **Pre-Partitioning**: Must happen BEFORE `Ast.Organize.partitionOperationShapes` to maintain shape categorization logic
3. **Backward Compatibility**: Existing single-namespace models should continue to work

### Key Requirements
1. **Cross-Namespace References**: Generated code must properly reference shapes in other namespaces using module qualifiers
2. **Dependency Handling**: The dependency graph must account for cross-namespace dependencies
3. **Name Collision Avoidance**: Each namespace gets its own module to prevent naming conflicts

## File Output Structure

For single namespace (current behavior):
```
output_dir/
├── Smaws_Client_ServiceName.ml{i}
├── types.ml{i}
├── operations.ml{i}
├── builders.ml{i}
├── serializers.ml
├── deserializers.ml
└── service_metadata.ml{i}
```

For multiple namespaces:
```
output_dir/
├── main_namespace/
│   ├── Smaws_Client_ServiceName.ml{i}
│   ├── types.ml{i}
│   ├── operations.ml{i}
│   ├── builders.ml{i}
│   ├── serializers.ml
│   ├── deserializers.ml
│   └── service_metadata.ml{i}
├── secondary_namespace/
│   ├── types.ml{i}
│   ├── operations.ml{i}
│   ├── builders.ml{i}
│   ├── serializers.ml
│   ├── deserializers.ml
│   └── service_metadata.ml{i}
└── common/
    └── types.ml{i}         # smithy.api and shared types
```

## Error Handling

1. **Unknown Namespace References**: Fail with clear error message when encountering unmapped namespaces
2. **Empty Namespaces**: Ignore empty namespaces during output generation - no files created
3. **Circular Dependencies**: Cross-namespace circular dependencies will appear as grouped dependencies in the topological sort from `Ast.Dependencies.order`. These should be detected and reported as errors since OCaml modules cannot have circular dependencies.

## Benefits

1. **Name Conflict Resolution**: Each namespace gets its own module scope
2. **Cleaner Organization**: Related shapes grouped by namespace/module
3. **Better Maintainability**: Clear separation of concerns between different shape domains
4. **AWS Service Alignment**: Better alignment with AWS service boundaries and naming conventions

## Testing Strategy

Tests will be written using Alcotest and placed in the `sdkgen/` directory (following the pattern of existing tests in `library_test/`):

1. **Unit Tests** (`sdkgen/namespace_tests.ml`):
   - Test `partition_by_namespace` with synthetic multi-namespace models
   - Test `make_namespace_context` for individual namespace processing  
   - Test namespace resolution helper functions
   - Test empty namespace handling (should be filtered out)

2. **Integration Tests** (`sdkgen/integration_tests.ml`):
   - Test complete generation pipeline with real AWS service models containing multiple namespaces
   - Verify generated code compiles and has correct cross-namespace references
   - Test directory structure creation for multi-namespace output

3. **Regression Tests** (`sdkgen/regression_tests.ml`):
   - Ensure existing single-namespace models continue to work unchanged
   - Verify backward compatibility of existing APIs
   - Test that single-namespace models produce identical output

4. **Cross-Reference Tests** (`sdkgen/cross_reference_tests.ml`):
   - Verify cross-namespace references generate correct module qualifiers (e.g., `OtherNamespace.TypeName`)
   - Test circular dependency detection across namespaces
   - Test error handling for unmapped namespaces

## Migration Path

1. **Phase 1**: Implement new architecture alongside existing code
2. **Phase 2**: Migrate existing generators to use namespace parameters (with default behavior)
3. **Phase 3**: Enable multi-namespace support in the main generator
4. **Phase 4**: Remove legacy single-namespace assumptions