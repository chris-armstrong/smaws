# Namespace Module Support Implementation Todo

## Phase 1: Data Structure Updates
- [x] Analyze current codebase structure and understand existing types
- [x] Update context type to include namespace_module_mapping field
- [x] Implement partition_by_namespace function
- [x] Implement make_namespace_context function
- [x] Modify create_from_model_file to return namespace contexts list

## Phase 2: Helper Modules
- [x] Create namespace_resolver helper module

## Phase 3: Integration
- [x] Update main generation loop to handle multiple namespaces
- [x] Test implementation with existing models

## Implementation Notes
- Namespace separation occurs AFTER `Ast.Dependencies.order` to preserve dependency relationships
- Must happen BEFORE `Ast.Organize.partitionOperationShapes` to maintain shape categorization logic
- Existing `write_*` functions remain unchanged - they receive pre-filtered contexts
- Cross-namespace references handled by namespace resolver module