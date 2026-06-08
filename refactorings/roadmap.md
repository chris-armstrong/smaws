# Roadmap

## State of the Project

### Protocols

AWS defines several service protocols for client-server communication over HTTP:

| Protocol | Status | Services unlocked |
|---|---|---|
| **AwsJson 1.0/1.1** | Complete | ~138 (DynamoDB, KMS, SQS, etc.) |
| **AwsQuery** | Runtime done, codegen missing | ~45 (IAM, CloudFormation, SNS, CloudWatch) |
| **RestJson** | Runtime and codegen missing | ~224 (Lambda, ECS, API Gateway, etc.) |
| **RestXml** | Runtime and codegen missing | S3, CloudFront, Route53 |
| **EC2 Query** | Runtime and codegen missing | EC2 |

Trait parsing and service metadata handling is complete for all five protocols. The remaining work is in two areas: the code generation (producing OCaml modules from Smithy shapes) and the runtime implementations (making the actual HTTP calls).

### In-flight Refactors

| # | Item | Status |
|---|---|---|
| 1 | Namespace module support | Core done. Remaining: CLI integration and tests. See `smaws-gen/docs/namespace_resolution.md` |
| 2 | Request compression | HTTP types and compression library done. Needs protocol/codegen wiring |
| 3 | HTTP client substitution | **Complete** |

### Constraints

- **Smaws_Lib must stay stdlib-only** (no Base — camlzip was added for compression as an exception)
- Model definitions and test data exist: `api-models-aws/` (410 service definitions) and `smithy-aws-protocol-tests_model.json`

## What's Needed

### RestJson / RestXml

RestJson is the most common protocol (~224 services) and the largest gap. It requires an architectural decision before codegen can begin: the current serialiser/deserialiser interface assumes the entire operation input/output is a single JSON body, but restJson distributes shape members across HTTP headers, query params, and URI path segments. The proposal is to generate separate modules (`Rest_serializers` / `Rest_deserializers`) rather than refactoring the existing AwsJson codegen. See `refactorings/restjson_interface.md` for the full design.

### AwsQuery / EC2 Query

AwsQuery is the second most impactful gap — it unlocks foundational services like IAM, CloudFormation, and SNS. The runtime is already implemented (form-encoded requests, XML response parsing). Codegen needs to produce form serialisers and XML deserialisers. EC2 Query is a close variant with minor serialisation differences.

### Other Work

| Area | Items |
|---|---|
| **Auth** | SSO Login, IAM assume role, EC2/ECS metadata, Lambda function resolvers |
| **Documentation** | Incorporate Smithy docs into generated code, convert to odoc, diagrams |
| **CI/CD** | GitHub Actions for CI/CD |
| **Namespace CLI** | `--namespace-map` argument, multi-namespace generation loop, subdirectory output |
| **Compression** | Wire `RequestCompressionTrait` through protocol and codegen layers |
| **Testing** | Protocol conformance tests for all protocols, unit tests for namespace partitioning |

## Dependencies

```
Namespace CLI → (independent utility)
Compression → (independent, can parallelize)
AwsQuery codegen → (no dependencies, runtime already done)
RestJson codegen → depends on serialiser/deserialiser interface decision
RestXml codegen → depends on RestJson patterns + AwsQuery XML patterns
EC2 Query codegen → depends on AwsQuery patterns
Testing → runs alongside all protocols, gates completion
```

## Risks

- **RestJson serialiser/deserialiser interface**: the biggest architectural decision. The wrong approach means rewriting generated code twice.
- **AwsQuery XML deserialiser complexity**: responses have a specific wrapper structure `{Action}Response > {Action}Result > fields`. Runtime handles the wrapper; codegen must produce field-level XML parsers.
- **RestXml S3 quirks**: S3 has non-standard behaviors like unwrapped XML output that may need special-case handling.
