# TODO

## Code Generator

* [x] Rename from `aws-smsdk` to `aws-smsdk-gen` to disambiguate code generator

## HTTP

* [x] Make Http module a functor that returns a new HTTP module with its own connection pool on the same switch
* [x] Return connection to connection pool only once the body is drained / read
* [ ] ~Run multiple requests in parallel for HTTP/2 connections but not HTTP/1.1 connections~
* [x] Rewrite connection pool to use Eio.Pool

## Documentation
* [ ] Incorporate Smithy documentation nodes into code for API documentation
* [ ] Produce usage guide for each module
* [ ] Convert HTML based docs to odoc
* [ ] Diagrams

## DX
* [x] Builder functions for major types
* [x] Address type aliasing which overproduces intermediary types
* [ ] GitHub build actions for CI/CD

## Unit Testing

* [x] Implement basic unit testing suite
* [ ] Unit test all protocols
* [ ] Library components unit tests (Auth resolvers, config resolvers, etc)

## AwsSdkLib support Library

### Auth

* [ ] SSO Login resolver
* [ ] IAM assume role resolver (using STS)
* [ ] EC2 Instance Metadata resolver
* [ ] Lambda function resolver

### Configuration

* [x] Read ~/.aws/config file

### Protocols

* [x] AwsJson1.0
* [x] AwsJson1.1
* [x] AwsQuery (core: serialise/deserialise/typed errors, unions; passes smithy conformance suite. Pending: request compression)
  * [x] ResponseMetadata handling in awsQuery responses with no result wrapper
  * [x] Wire [Int64] into codegen for `smithy.api#Long` - no longer maps to OCaml [int]
  * [x] Represent `smithy.api#BigInteger` / `smithy.api#BigDecimal` beyond [int]/[float] using zarith-backed [CoreTypes.BigInt] / [CoreTypes.BigDecimal]
  * [x] awsQuery union serialisation/deserialisation
  * [x] `@idempotencyToken` auto-fill using uuidm
  * [ ] `@requestCompression` gzip (`SDKAppliedContentEncoding_awsQuery` / `SDKAppendsGzipAndIgnoresHttpProvidedEncoding_awsQuery` are banned)
  * [x] awsJson error-response test generation (`make_error_response_test_str` now works for awsJson too, with header/body error-type extraction)
* [ ] REST
* [ ] restXml (core: HTTP binding traits, XML serialise/deserialise, noErrorWrapping; see `refactorings/restxml_s3_interfaces.md`)
  * [ ] `@httpPayload` scalar/structure/union payloads + Content-Type negotiation
  * [ ] aws-chunked request body + trailer checksums for streaming uploads (deferred — see S3 below; streaming I/O itself ships first)
* [ ] S3
  * [ ] restXml protocol + S3 bucket addressing (virtual-host/path/dualstack/accelerate)
  * [ ] `@s3UnwrappedXmlOutput` (GetBucketLocation)
  * [ ] Streaming output (`GetObject` etc.) via `Eio.Flow.source_read`
  * [ ] Streaming input (`PutObject`/`UploadPart` etc.): `Content-Length` per §8.4 of restXml design doc
  * [ ] Flexible checksums: `@httpChecksum` header checksums (CRC32/CRC32C/SHA*/MD5); vendored CRC32, hand-rolled CRC64NVME, decide `checkseum`/`xxhash` vs vendor when this lands
  * [ ] aws-chunked trailer checksums for streaming uploads (deferred — streaming uploads work without a client checksum until then)
  * [ ] `aws.auth#unsignedPayload` (WriteGetObjectResponse) — codegen-driven signer selection
  * [ ] Endpoint rules engine / `contextParam` (regional/S3-Express/Outposts endpoints) — currently hard-coded
  * [ ] `@paginated` paginators (ListObjectsV2, ListBuckets, ListParts, ...)
  * [ ] `SelectObjectContent` event stream — **deprioritised: S3 Select is no longer available to new customers**
