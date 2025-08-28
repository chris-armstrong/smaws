# CLAUDE - Smithy Development Notes

## Overview
This file documents important patterns, conventions, and utilities for working with Smithy types and code generation in the smaws project. This information is critical for understanding how to properly work with the Parselib infrastructure.

## Repository Structure

### Key Directories
- `codegen/ast/` - The AST definitions for Smithy (aka Parselib.Ast)
- `codegen/parse/` - Parsing smithy definitions from JSON (aka Parselib.Parse)  
- `codegen/codegen/` - Code generation utilities (aka Parselib.Codegen)

### Important Modules
- `codegen/ast/Shape.ml` - Core Smithy shape type definitions
- `codegen/ast/Trait.ml` - Smithy trait definitions
- `codegen/parse/Smithy.ml` - JSON parsing functions for Smithy models
- `codegen/codegen/SafeNames.ml` - Name generation utilities
- `codegen/codegen/Util.ml` - Common utility functions

## Working with Smithy Types

### Shape Type System
The core type system is defined in `Parselib.Ast.Shape`:

```ocaml
type shapeDescriptor =
  | UnitShape
  | ListShape of listShapeDetails
  | OperationShape of operationShapeDetails
  | StructureShape of structureShapeDetails
  | UnionShape of structureShapeDetails
  | BlobShape of primitiveShapeDetails
  | BooleanShape of primitiveShapeDetails
  | IntegerShape of primitiveShapeDetails
  | StringShape of primitiveShapeDetails
  | MapShape of mapShapeDetails
  | TimestampShape of timestampShapeDetails
  | LongShape of primitiveShapeDetails
  | FloatShape of primitiveShapeDetails
  | DoubleShape of primitiveShapeDetails
  | EnumShape of enumShapeDetails
  (* ... more variants *)
```

### Parsing Shapes from JSON
Use the existing parsing infrastructure instead of custom parsing:

```ocaml
(* Parse shapes using Parselib.Parse.Smithy *)
let parse_shapes_from_json json_content =
  let json = Yojson.Basic.from_string json_content in
  let shapes_json = json |> member "shapes" in
  match Parselib.Parse.Smithy.parseShapes (Ok { tree = shapes_json; path = "$.shapes" }) with
  | Ok parsed_shapes -> 
    (* Convert list to map for easy lookup *)
    let shapes_map = List.fold parsed_shapes ~init:(Map.empty (module String)) ~f:(fun acc shape ->
      Map.set acc ~key:shape.Shape.name ~data:shape
    ) in
    Ok shapes_map
  | Error _ -> Error "Failed to parse shapes"
```

### Built-in Primitive Type Handling
Smithy has built-in primitive types that need special handling:

```ocaml
let resolve_shape_by_name shapes shape_name =
  match shape_name with
  | "smithy.api#String" -> Ok (Shape.StringShape { traits = None })
  | "smithy.api#Integer" -> Ok (Shape.IntegerShape { traits = None })
  | "smithy.api#Long" -> Ok (Shape.LongShape { traits = None })
  | "smithy.api#Float" -> Ok (Shape.FloatShape { traits = None })
  | "smithy.api#Double" -> Ok (Shape.DoubleShape { traits = None })
  | "smithy.api#Boolean" -> Ok (Shape.BooleanShape { traits = None })
  | "smithy.api#Blob" -> Ok (Shape.BlobShape { traits = None })
  | "smithy.api#Timestamp" -> Ok (Shape.TimestampShape { traits = None })
  | "smithy.api#Unit" -> Ok Shape.UnitShape
  | _ ->
    (* Look up user-defined shapes *)
    match Map.find shapes shape_name with
    | Some shape -> Ok shape.Shape.descriptor
    | None -> Error (MissingShape shape_name)
```

## Traits and Required/Optional Fields

### Understanding Required Fields
In Smithy, field optionality is determined by the presence of the `RequiredTrait`:

```ocaml
(* Check if a member is required *)
let is_member_required (member : Shape.member) =
  match member.traits with
  | Some traits -> List.exists traits ~f:Trait.isRequiredTrait
  | None -> false
```

### Critical Smithy Semantics
- **Fields WITH `RequiredTrait`**: Mandatory, generate direct values, throw errors if missing
- **Fields WITHOUT `RequiredTrait`**: Optional, use `None`/`Some` patterns
- **`Null` is NEVER used in Smithy**: Don't add `Null` patterns in constructor generation
- **Error handling**: Missing required fields should throw clear error messages

## Name Generation Utilities

### SafeNames Module (`Parselib.Codegen.SafeNames`)
Always use SafeNames for consistent name generation:

```ocaml
(* For field names: camelCase -> snake_case *)
let ocaml_field_name = SafeNames.safeMemberName member_name

(* For type names: handles namespaces and reserved words *)
let simple_name = SafeNames.safeTypeName input_shape_target

(* For function names *)
let function_name = SafeNames.safeFunctionName shape_name

(* For constructor names *)
let constructor_name = SafeNames.safeConstructorName shape_name
```

### Util Module (`Parselib.Codegen.Util`)
Use Util for extracting parts of qualified names:

```ocaml
(* Extract symbol name from "smithy.api#Double" -> "Double" *)
let symbol_name = Util.symbolName qualified_name

(* Extract namespace from "smithy.api#Double" -> "smithy.api" *)
let namespace = Util.symbolNamespace qualified_name

(* Extract both as pair *)
let (namespace, symbol) = Util.symbolPair qualified_name
```

## Common Patterns

### Shape Resolution Pattern
```ocaml
match resolve_shape_by_name shapes member.Shape.target with
| Ok member_descriptor ->
  (* Work with the resolved shape descriptor *)
| Error e -> Error e
```

### Required/Optional Field Generation Pattern
```ocaml
let member_is_required = is_member_required member in
match generate_value_constructor shapes member_descriptor json_value ~is_required:member_is_required with
| Ok value_constructor -> 
  (* Generate field assignment *)
  Ok (Printf.sprintf "%s = %s" ocaml_field_name value_constructor)
| Error e -> Error e
```

### Missing Required Field Error Pattern
```ocaml
match List.Assoc.find assoc member_name ~equal:String.equal with
| Some json_value ->
  (* Process the value *)
| None when member_is_required -> 
  Error (InvalidParams ("Missing required field: " ^ member_name))
| None -> 
  (* Optional field - use None *)
  Ok (Printf.sprintf "%s = None" ocaml_field_name)
```

## Error Handling Best Practices

### Error Types
Define clear error types for different failure modes:

```ocaml
type constructor_error = 
  | UnsupportedType of string
  | MissingShape of string
  | InvalidParams of string
```

### Error Messages
Provide specific, actionable error messages:

```ocaml
let string_of_constructor_error = function
  | UnsupportedType t -> "Unsupported type: " ^ t
  | MissingShape s -> "Missing shape definition: " ^ s  
  | InvalidParams p -> "Invalid parameters: " ^ p
```

## Do's and Don'ts

### DO:
- Use `Parselib.Parse.Smithy.parseShapes` for parsing shape definitions
- Use `SafeNames` functions for all name generation
- Use `Util` functions for extracting qualified name parts
- Check `RequiredTrait` to determine field optionality
- Provide specific error messages for debugging
- Handle built-in Smithy primitive types specially

### DON'T:
- Create custom shape parsing - use existing Parselib infrastructure
- Use manual string parsing for qualified names
- Add `Null` patterns in constructor generation logic
- Assume fields are optional - always check for `RequiredTrait`
- Ignore error handling - propagate errors properly

## Type Signatures to Remember

```ocaml
(* Shape map type *)
(string, Parselib.Ast.Shape.t, Base.String.comparator_witness) Base.Map.t

(* Constructor generation signature *)
generate_value_constructor : shapes -> Shape.shapeDescriptor -> Yojson.Basic.t -> is_required:bool -> (string, error) result

(* Shape resolution signature *)
resolve_shape_by_name : shapes -> string -> (Shape.shapeDescriptor, error) result
```

## Testing and Compilation

### Build Commands
```bash
# Build model tests
dune build model_tests/

# Format code
dune fmt

# Run tests
dune runtest
```

### Common Compilation Issues
- **Map type specifications**: Use full `Base.Map.t` type with comparator witness
- **Module conflicts**: Use explicit module prefixes (e.g., `Shape.member`)
- **Type annotations**: Add explicit type annotations when Base module shadows stdlib types