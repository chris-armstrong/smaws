# HTTP Client Substitution Refactoring Plan

## Overview
Refactor the HTTP module to be substitutable in Context.ml, allowing different HTTP client implementations to be injected as first-class modules.

## Current State Analysis

### Context.ml
- Contains a fixed reference to `Http.Client.t`
- Uses `Http.Client.make` directly in the `make` function
- No abstraction over HTTP client implementations

### HTTP Module Structure
- `http/http.mli` defines `Client_intf` module type and concrete `Client` module
- `Client_intf` is already a proper module signature suitable for first-class modules
- Concrete `Client` module implements the interface

### Dependencies
- `smaws_lib/AwsJson.ml` uses `Protocols_gen.AwsJson.Make (Http.Client)`
- `smaws_lib/AwsQuery.ml` uses `Protocols_gen.AwsQuery.Make (Http.Client)`
- Protocol generators in `protocols_gen/` take HTTP client modules as parameters

## Refactoring Strategy

### Phase 1: Create HTTP Client Factory Interface
1. Define a factory interface in `http/http.mli` for creating HTTP clients
2. Create default factory implementation in `http/http.ml`
3. Verify compilation with `dune build`

### Phase 2: Update Context Module
1. Add optional HTTP factory parameter to `Context.make`
2. Update Context type to store the HTTP client factory
3. Provide default factory when none specified
4. Update Context.mli interface
5. Verify compilation with `dune build`

### Phase 3: Update Protocol Modules
1. Modify `AwsJson.ml` to use Context's HTTP client
2. Modify `AwsQuery.ml` to use Context's HTTP client
3. Ensure protocol generators receive HTTP client from Context
4. Verify compilation with `dune build`

### Phase 4: Update Generated Protocol Modules
1. Update `protocols_gen/AwsJson.ml` if needed for Context integration
2. Update `protocols_gen/AwsQuery.ml` if needed for Context integration
3. Verify compilation with `dune build`

## Implementation Details

### Factory Interface Design
```ocaml
module type Http_factory = sig
  val make : 
    sw:Eio.Switch.t ->
    < mono_clock : [> `Clock of Mtime.t ] Eio.Resource.t
    ; net : [> `Network | `Platform of [> `Generic | `Unix ] ] Eio.Resource.t
    ; .. > ->
    (module Client_intf with type t = 'a) * 'a
end
```

### Context Changes
```ocaml
type t = { 
  http_client : (module Client_intf with type t = 'a) * 'a; 
  config : Config.t 
}

let make ?(http_factory = (module Default_http_factory : Http_factory)) 
         ?(config = Config.defaultConfig ()) ~sw env =
  let (http_module, http_client) = http_factory.make ~sw env in
  { http_client = (http_module, http_client); config }
```

## Benefits
1. Enables testing with mock HTTP clients
2. Allows different HTTP implementations (HTTP/1.1, HTTP/2, etc.)
3. Maintains backward compatibility with existing code
4. Preserves type safety through first-class modules

## Risks & Mitigations
- **Type complexity**: First-class modules can be complex - mitigate with clear interfaces
- **Performance**: Additional indirection - measure and optimize if needed
- **Backward compatibility**: Ensure existing code continues to work unchanged

## Testing Strategy
1. Verify `dune build` succeeds after each phase
2. Test with existing SDK generation
3. Create simple mock HTTP client to verify substitution works
4. Ensure no regressions in generated SDK functionality