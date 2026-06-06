# Namespace Resolution Design

## Overview

The Smaws code generator supports multi-namespace Smithy models — models where shapes may be defined across multiple Smithy namespaces (e.g., `com.amazonaws.amplify#CreateApp` vs `com.amazonaws.s3#Bucket`). When generating OCaml code, each namespace produces its own set of OCaml modules, with cross-namespace type references resolved through module qualifiers.

**Note:** As of June 2026, all 410 AWS Smithy service definitions are self-contained — no service references shapes from a different `com.amazonaws.*` namespace. The `smithy.api`, `smithy.rules`, `smithy.waiters`, `aws.protocols`, and `aws.auth` namespaces are handled as builtins and never produce their own output modules. Multi-namespace support exists for protocol tests, future-proofing, and synthetic models.

## Architecture

### Pipeline

```
Parse JSON model
  → shape_with_target (add dependency targets)
  → Ast.Dependencies.order (topological sort)
  → partition_by_namespace (group shapes by Smithy namespace)
  → make_namespace_context (per-namespace: service/op/structure partitioning, alias context, namespace resolver)
  → filtered to only mapped namespaces
  → write_* functions generate per-namespace OCaml modules
```

### Key modules

| Module | Role |
|--------|------|
| `Codegen.Namespace_resolver` | Core resolver: maps Smithy shape names to OCaml module paths |
| `Codegen.Types` | Type generation — all functions accept `~namespace_resolver` |
| `Codegen.Builders` | Builder function generation — all functions accept `~namespace_resolver` |
| `Codegen.AwsProtocolJson` | Serialisers, Deserialisers, Operations — all accept `~namespace_resolver` |
| `Sdkgen` (`sdkgen.ml`) | Orchestrates partitioning, contexts, and `write_*` dispatch |
| `bin/AwsGenerator.ml` | CLI binary — accepts `--namespace-map` to provide namespace-to-module mapping |

### NamespaceResolver

**File:** `codegen/Namespace_resolver.ml` (27 lines)

```ocaml
type t = {
  current_namespace : string;
  namespace_module_mapping : (string, string) Map.Poly.t;
}
```

`create ~current_namespace ~namespace_module_mapping` creates a resolver for the given namespace context.

`resolve_reference ~symbol_transformer t target_name` resolves a Smithy shape name (e.g., `"com.amazonaws.s3#Bucket"`) to an OCaml module path (e.g., `["S3"; "Types"; "Bucket"]`). The `symbol_transformer` callback receives `~local:bool` so callers can differentiate local references from external module references.

If `target_namespace == current_namespace`, the reference resolves locally (just the symbol name). Otherwise, the module name is looked up in the `namespace_module_mapping` and prepended.

### Context type (`Sdkgen.t`)

```ocaml
type t = {
  namespace : string;
  shape_resolver : Codegen.Shape_resolver.t;
  operation_shapes : (string * Ast.Shape.operationShapeDetails * string list) list;
  structure_shapes : Ast.Dependencies.shapeWithTarget list;
  service_details : (string * Ast.Shape.serviceShapeDetails * Ast.Trait.serviceDetails) option;
  alias_context : Codegen.Types.t;
  shapes : Ast.Shape.t list;
  namespace_module_mapping : (string, string) Map.Poly.t;
}
```

Every context is scoped to a single namespace. The `write_*` functions in `sdkgen.ml` extract `namespace` and `namespace_module_mapping` to create a `Namespace_resolver` and pass it through the entire code generation chain.

### Resolution chain

All `write_*` functions in `sdkgen.ml` create a namespace resolver and pass it to the corresponding `gen_*` wrapper, which passes it to the `Codegen.*` module:

```
write_types → Gen_types.generate_ml/generate_mli → Codegen.Types.stri_structure_shapes/sigi_structure_shapes
write_builders → Gen_builders.generate/generate_mli → Codegen.Builders.stri_builders/sigi_builders
write_operations → Gen_operations.generate/generate_mli → Codegen.AwsProtocolJson.Operations
write_serialisers → Gen_serialisers.generate → Codegen.AwsProtocolJson.Serialiser
write_deserialisers → Gen_deserialisers.generate → Codegen.AwsProtocolJson.Deserialiser
write_module → Gen_module.generate_mli → (various)
write_protocol_tests → Gen_protocol_tests.generate_ml → (various)
```

Every function that might reference a cross-namespace type accepts `~(namespace_resolver : Codegen.Namespace_resolver.Namespace_resolver.t)`.

### Cross-namespace type resolution in generated code

When a shape in namespace `com.amazonaws.amplify` references a type from `com.amazonaws.s3`, the generated OCaml code uses module qualifiers:

```ocaml
(* In Amplify's types.ml *)
type create_app_request = {
  bucket_name : S3.Types.bucket_name;
}
```

This is handled by `Codegen.Types.type_ident`, which calls `Namespace_resolver.resolve_reference` to determine the module path.

### Builtin namespaces

The `smithy.api` namespace is always added to the mapping as `"Smaws_Lib.Smithy_api"` (see `sdkgen.ml:make_namespace_context`, line 51). This ensures builtin Smithy types resolve correctly. Namespaces that are not in the `namespace_module_mapping` are filtered out during `create_from_model_file_with_namespaces` and produce no output.

### CLI integration

The `AwsGenerator.ml` binary accepts a `--namespace-map` argument:

```bash
AwsGenerator --input model.json --output out/ --targets types,builders,operations \
  --namespace-map "com.amazonaws.amplify=Amplify,com.amazonaws.s3=S3"
```

The mapping is passed to `Sdkgen.create_from_model_file_with_namespaces`, which returns `(string * t) list`. The binary iterates over all namespace contexts, generating output for each one.

## Implementation status

| Component | Status |
|-----------|--------|
| `Namespace_resolver` module | Implemented |
| `Sdkgen.t` with `namespace` + `namespace_module_mapping` | Implemented |
| `partition_by_namespace` / `make_namespace_context` | Implemented |
| `create_from_model_file_with_namespaces` returning `(string * t) list` | Implemented |
| `Codegen.Types` all functions accept `~namespace_resolver` | Implemented |
| `Codegen.Builders` all functions accept `~namespace_resolver` | Implemented |
| `Codegen.AwsProtocolJson` all functions accept `~namespace_resolver` | Implemented |
| All `gen_*.ml` wrappers accept `~namespace_resolver` | Implemented |
| All `write_*` functions in `sdkgen.ml` wired | Implemented |
| CLI `--namespace-map` argument | Pending |
| Multi-namespace iteration in `AwsGenerator.ml` | Pending (currently only `List.hd`) |
| Subdirectory output for multi-namespace services | Pending |

## Future work

1. **CLI wiring:** Complete the `--namespace-map` argument processing and multi-namespace iteration in `bin/AwsGenerator.ml`.
2. **Subdirectory output:** When generating multiple namespaces, each namespace should output to its own subdirectory for clean module organisation.
3. **Tests:** Unit tests for `partition_by_namespace`, `make_namespace_context`, and `Namespace_resolver` should be added.
4. **Protocol test integration:** Ensure protocol tests from `smithy-aws-protocol-tests_model.json` correctly reference cross-namespace types.
