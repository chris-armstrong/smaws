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
* [x] AwsQuery (core: serialise/deserialise/typed errors, unions; passes smithy conformance suite. Pending: idempotency-token auto-fill, request compression)
  * [ ] Wire [UInt64] (or [Int64]) into codegen for `smithy.api#Long` - currently maps to OCaml [int], overflowing for values > 2^62-1
  * [ ] Represent `smithy.api#BigInteger` / `smithy.api#BigDecimal` beyond [int]/[float] - [UInt64] only covers 0..2^64-1; BigInteger is unbounded and BigDecimal needs >15 sig digits. Likely needs a string passthrough or a bignum dependency (ask before adding deps)
  * [x] awsQuery union serialisation/deserialisation
  * [ ] `@idempotencyToken` auto-fill (`QueryProtocolIdempotencyTokenAutoFill` is banned)
  * [ ] `@requestCompression` gzip (`SDKAppliedContentEncoding_awsQuery` / `SDKAppendsGzipAndIgnoresHttpProvidedEncoding_awsQuery` are banned)
  * [ ] awsJson error-response test generation (`make_error_response_test_str` is awsQuery-only; awsJson error fixtures need a JSON error reader)
* [ ] REST
* [ ] S3
