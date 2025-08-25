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
- [ ] Review Phase 1 completion status and verify implementation
- [ ] Update core codegen/codegen modules to accept namespace resolver parameter:
  - [ ] Types.ml - core type generation logic
  - [ ] Builders.ml - builder function generation
  - [ ] Serializers.ml - serialization code generation
  - [ ] Deserializers.ml - deserialization code generation
- [ ] Update sdkgen generation modules to use namespace resolver:
  - [ ] gen_types.ml - type references in structure members
  - [ ] gen_operations.ml - input/output type references
  - [ ] gen_builders.ml - parameter and return type references
  - [ ] gen_serialisers.ml - type references in serialization code
  - [ ] gen_deserialisers.ml - type references in deserialization code
- [ ] Ensure namespace resolution works for:
  - [ ] Type name references in generated types
  - [ ] Serializer function references (cross-namespace serializers)
  - [ ] Deserializer function references (cross-namespace deserializers)
  - [ ] Builder function references (cross-namespace builders)
- [ ] Test namespace resolution with multi-namespace models
- [ ] Verify backward compatibility with single-namespace models

## Phase 4: Integration and Testing (Future)
- [x] Update main generation loop to handle multiple namespaces
- [x] Test implementation with existing models

## Implementation Notes
- Namespace separation occurs AFTER `Ast.Dependencies.order` to preserve dependency relationships
- Must happen BEFORE `Ast.Organize.partitionOperationShapes` to maintain shape categorization logic
- Existing `write_*` functions remain unchanged - they receive pre-filtered contexts
- Cross-namespace references handled by namespace resolver module
- Namespace resolver must handle not just type names but also function references (serializers, deserializers, builders)