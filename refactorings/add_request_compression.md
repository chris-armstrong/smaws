# Implementation Plan: requestCompression Trait Support

## Overview

This document outlines the implementation plan for adding support for the `smithy.api#requestCompression` trait to the Smaws AWS SDK generator. The trait enables automatic compression of request payloads for operations that support it.

## Current State Analysis

### HTTP Implementation (smaws_lib/http)
- Current `input_body` type: `[ \`None | \`String of string | \`Form of (string * string list) list ]`
- Request interface: `Http.request ~method_ ~uri ?headers ?body`
- No built-in compression support
- Body handling is straightforward string-based

#### Module Structure Analysis
**Interfaces requiring updates:**
- `http.mli` - Main HTTP interface with `input_body` type and `request` signature
- `http_client_intf.ml` - Client interface definitions
- `protocol_intf.ml` - Protocol interface definitions

**Implementation files requiring updates:**
- `http_types.ml` - Core type definitions including `input_body`
- `http_eio_client.ml` - Main EIO HTTP client implementation
- `http_eio_http1_1_protocol_impl.ml` - HTTP/1.1 protocol implementation
- `http_eio_connection.ml` - Connection handling that processes request bodies

### Protocol Implementation (AwsJson.ml:94)
- Direct body conversion: `Http.request ~body:(\`String body)`
- Headers manually constructed, no compression awareness
- No size-based compression logic

### Code Generation (AwsProtocolJson.ml)
- Operations call `[%e request_func_name] ~shape_name ~service ~context ~input`
- No trait-based request modification

## Implementation Plan with Checkpoints

### Phase 1: HTTP Layer Enhancement
**Files**: `smaws_lib/http/http_types.ml`, `http.mli`

1. **Add body encoding ADT**:
   ```ocaml
   type body_encoding = Gzip [@@deriving show, eq]
   ```

2. **Extend input_body type**:
   ```ocaml
   type input_body = [
     | `None
     | `String of string
     | `Compressed of string * body_encoding  (* body * encoding *)
     | `Form of (string * string list) list
   ] [@@deriving show, eq]
   ```

3. **Update request function signature** (no new function needed):
   - Existing `request` function already handles optional `?body:input_body` parameter
   - Implementation will be updated to handle new `Compressed` variant

4. **Validation checkpoint**: `dune build` + unit tests for new types

### Phase 2: Compression Utilities
**Library Selection**: `decompress` - Pure OCaml implementation of Zlib and GZip
- Pros: No external C dependencies, well-maintained, comprehensive
- Alternative: `camlzip` - Bindings to zlib C library (more widely used but requires C deps)

**New file**: `smaws_lib/compression.ml`

1. **Implement gzip compression**:
   ```ocaml
   val compress_gzip : string -> string
   val body_encoding_to_string : body_encoding -> string
   val body_encoding_to_header_value : body_encoding -> string
   ```

2. **Validation checkpoint**: Unit tests for compression functions

### Phase 3: HTTP Client Updates
**Files**: `smaws_lib/http/http_eio_client.ml`, others

1. **Update request handling**:
   - Handle `\`Compressed` body type
   - Set `Content-Encoding` header automatically
   - Preserve existing behavior for other body types

2. **Validation checkpoint**: HTTP mock tests + integration tests

### Phase 4: Protocol Layer Enhancement
**File**: `smaws_lib/protocols_impl/AwsJson.ml`

1. **Update existing request function** (no new function needed):
   - Extend existing request function to handle compression
   - Check if operation has `RequestCompressionTrait`
   - Apply compression when trait is present
   - Set appropriate headers automatically

2. **Compression logic**:
   - Extract compression encodings from trait
   - Use first supported encoding (Gzip)
   - Create `Compressed` body variant instead of `String`
   - No size threshold - compress when trait is present

3. **Validation checkpoint**: Protocol-level tests

### Phase 5: Code Generation Updates
**File**: `codegen/AwsProtocolJson.ml`

1. **Trait detection in operation generation**:
   ```ocaml
   let has_request_compression operation_shape =
     operation_shape.traits
     |> Option.value ~default:[]
     |> List.exists ~f:(function
       | Trait.RequestCompressionTrait _ -> true
       | _ -> false)
   ```

2. **Generate compression-aware requests**:
   - Extract compression encodings from trait
   - Pass compression information to existing `request` function
   - Standard `request` function handles both compressed and uncompressed cases

3. **Validation checkpoint**: Generated code compilation + smoke tests

### Phase 6: Test Support Updates
**File**: `smaws_test_support_lib/http_mock.ml`

1. **Handle compressed requests in mock**:
   - Detect `Content-Encoding` header
   - Store compression info in mock request
   - Optionally decompress for assertion purposes

2. **Validation checkpoint**: Test infrastructure validation

## Key Design Decisions

1. **ADT for encoding**: `type body_encoding = Gzip` provides type safety and extensibility
2. **Single request function**: Extend existing `request` function rather than adding new one
3. **No size threshold**: Compress whenever trait is present (simplified logic)
4. **Library choice**: `decompress` for pure OCaml implementation without C dependencies
5. **Backwards compatibility**: Existing operations without trait work unchanged

## Implementation Checkpoints & Validations

1. **After each phase**: `dune build` must succeed
2. **Unit tests**: Each new module gets comprehensive tests
3. **Integration tests**: End-to-end tests with real AWS protocol test cases
4. **Regression tests**: Ensure existing functionality unchanged
5. **Performance tests**: Verify compression doesn't degrade performance significantly

## Risk Mitigation

- **Feature flag**: Could add environment variable to disable compression during rollout
- **Incremental rollout**: Start with specific services/operations
- **Monitoring**: Add metrics for compression ratio, performance impact
- **Fallback**: Graceful degradation if compression fails

## Trait Structure Reference

Based on Smithy specification:
- **Applied to**: Operations only
- **Structure**: `{ encodings: [string] }` where encodings is non-empty list
- **Behavior**:
  - Clients compress using first supported algorithm
  - Services must accept non-compressed requests
  - Recommended for payloads ≥ 10,240 bytes
  - Sets `Content-Encoding` header when compressing

## Implementation Status

- [x] Trait definition added to `smithy_ast/Trait.ml`
- [x] Trait parser added to `smaws_parse/Smithy.ml`
- [x] **Phase 1: HTTP layer enhancement**
  - [x] Added `body_encoding` ADT to `http_types.ml`
  - [x] Extended `input_body` type with `Compressed` variant
  - [x] Updated `http.mli` interface
  - [x] Updated `http_eio_http1_1_protocol_impl.ml` to handle compression
  - [x] Fixed test infrastructure (`protocol_tests.ml`, `gen_protocol_tests.ml`)
  - [x] Build validation successful
- [x] **Phase 2: Compression utilities**
  - [x] Added camlzip library dependency to dune-project and dune files (switched from decompress for simplicity)
  - [x] Created `smaws_lib/compression.ml` module with proper gzip compression
  - [x] Implemented real `compress_gzip` function using camlzip library with temporary file approach
  - [x] Implemented `body_encoding_to_string` and `body_encoding_to_header_value` utility functions
  - [x] Added Compression module to Smaws_Lib exports
  - [x] Created comprehensive unit tests in `test/test_compression.ml` including roundtrip verification
  - [x] Build validation successful with all tests passing
- [ ] **Phase 3: HTTP client updates**
- [ ] **Phase 4: Protocol layer enhancement**
- [ ] **Phase 5: Code generation updates**
- [ ] **Phase 6: Test support updates**

This approach ensures each phase is independently testable and the overall change is both safe and comprehensive.