# AGENTS.md

Agent and developer reference for the smaws repository.
For general project background see `README.md` and `DEVELOPERS.md`.

---

## Purpose

Generates OCaml AWS SDK bindings from Smithy JSON model definitions.
Pipeline: Smithy JSON → parse → typed AST → code generation → OCaml source files (promoted into `sdks/`).

---

## Repository map

| Directory | Purpose | Key files |
|-----------|---------|-----------|
| `api-models-aws/` | Smithy model inputs (git submodule, read-only) | `models/<svc>/service/<ver>/<svc>-<ver>.json` |
| `smithy_ast/` | Typed Smithy AST | `Shape.ml` (shape types), `Trait.ml` (trait types), `Dependencies.ml` (topological sort), `Organize.ml` (partition ops/structures) |
| `smaws_parse/` | Parsing layer | `Smithy.ml` (JSON→AST), `Json.ml`, `Html.ml` |
| `codegen/` | Low-level code generation primitives | `Types.ml`, `Builders.ml`, `Modules.ml`, `Shape_resolver.ml`, `Namespace_resolver.ml`, `SafeNames.ml` |
| `sdkgen/` | Orchestrates generation for one service | `sdkgen.ml` (context type `t`, entry points), `gen_types.ml`, `gen_operations.ml`, `gen_builders.ml`, `gen_serialisers.ml`, `gen_deserialisers.ml`, `gen_module.ml` |
| `bin/` | Generator executable | `AwsGenerator.ml` → `AwsGenerator.exe` |
| `smaws_lib/` | Runtime support library used by all SDKs | `Protocols.ml`, `Sign.ml`, `Auth.ml`, `Config.ml`, `CoreTypes.ml` |
| `smaws_lib/http/` | HTTP client stack (eio + httpun) | `http.ml`, `http_eio_client.ml`, `connection_pool.ml` |
| `smaws_lib/protocols_impl/` | Protocol wire implementations | `AwsJson.ml`, `AwsQuery.ml` |
| `sdks/` | Generated SDK libraries (one dir per service) | `Smaws_Clients.ml` (aggregates all), `<svc>/types.ml`, `operations.ml`, `builders.ml`, `serializers.ml`, `deserializers.ml` |
| `codegen_test/` | Codegen unit tests | `SafeNames_test.ml`, `docs_test.ml`, `parselib_tests.ml` |
| `smaws_lib_test/` | Runtime library tests | `request_test_example.ml` |
| `model_tests/` | Protocol conformance tests | `gen.ml`, `protocols/` |
| `refactorings/` | In-progress design documents | `*.md` (read before touching named subsystems) |

---

## Build

```sh
dune build          # build everything; run after any change to verify it compiles
dune fmt            # format all OCaml source (ocamlformat); run before committing
```

All build artefacts are under `_build/default/`, mirroring the source layout.
The generator binary is at `_build/default/bin/AwsGenerator.exe`.

---

## Test

```sh
dune runtest                        # run all tests
dune runtest codegen_test           # codegen unit tests only
dune runtest smaws_lib_test         # runtime library tests only
dune runtest model_tests            # protocol conformance tests only
```

---

## Lint / format

```sh
dune fmt            # formats in place; re-run until it produces no diff
```

There is no separate lint step — `dune build` catches type errors and `dune fmt` enforces style.

---

## Protocol support

| Protocol | Generation | Runtime impl | Covers |
|----------|-----------|--------------|--------|
| AwsJson 1.0 | Done | `smaws_lib/protocols_impl/AwsJson.ml` | ~32 services (SQS, DynamoDB, …) |
| AwsJson 1.1 | Done | same | ~138 services total with 1.0 |
| AwsQuery | Partial | `smaws_lib/protocols_impl/AwsQuery.ml` | CloudFormation, IAM, SNS, … |
| restJson 1 | Not started | — | ~224 services |
| restXml | Not started | — | S3, CloudFront |
| EC2 Query | Not started | — | EC2 |

---

## Adding a new SDK

1. Confirm the service model exists:
   `api-models-aws/models/<service-short-name>/service/<version>/<model>.json`
2. Create the SDK directory: `sdks/<service-short-name>/`
3. Generate the `dune` file (from `sdks/`):
   ```sh
   cd sdks && ./service-dune-generate.sh
   ```
   This fills in `service-dune-template` for every service directory that lacks a dune file.
4. Build to generate and promote source files:
   ```sh
   dune build sdks/<service-short-name>/
   ```
5. Register the new library in `sdks/dune` (add `Smaws_Client_<FullName>` to the `libraries` stanza).
6. Add a module alias in `sdks/Smaws_Clients.ml`:
   ```ocaml
   module ServiceName = Smaws_Client_ServiceName
   ```
7. Run `dune build` and `dune fmt` to verify.

The service's protocol must be implemented before generation will produce working code — check the table above.

---

## Code guidelines

- **Naming**: functions and types `snake_case`; type constructors `CamelCase`; modules `Snake_case` (filename `snake_case.ml`, referenced in code as `Snake_case`)
- **No new dependencies** without asking the developer first
- **`base`** is available in `codegen/`, `sdkgen/`, `smaws_parse/`, `smithy_ast/`; `smaws_lib` must use only the OCaml standard library
- **Comments**: only when the *why* is non-obvious; never restate what the code already says
- **Stop after each phase** and wait for the developer to review before continuing to the next


