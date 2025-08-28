open Base
open Yojson.Basic.Util

module Trait = Parselib.Ast.Trait
module Shape = Parselib.Ast.Shape
module SafeNames = Parselib.Codegen.SafeNames
module Util = Parselib.Codegen.Util

(* Type-safe input constructor generator for Smithy protocol test cases *)

type constructor_error = 
  | UnsupportedType of string
  | MissingShape of string
  | InvalidParams of string

let string_of_constructor_error = function
  | UnsupportedType t -> "Unsupported type: " ^ t
  | MissingShape s -> "Missing shape definition: " ^ s  
  | InvalidParams p -> "Invalid parameters: " ^ p

(* Parse shapes using existing Parselib infrastructure *)
let parse_shapes_from_json json_content =
  try
    let json = Yojson.Basic.from_string json_content in
    let shapes_json = json |> member "shapes" in
    match Parselib.Parse.Smithy.parseShapes (Ok { tree = shapes_json; path = "$.shapes" }) with
    | Ok parsed_shapes -> 
      (* Convert list of shapes to a map *)
      let shapes_map = List.fold parsed_shapes ~init:(Map.empty (module String)) ~f:(fun acc shape ->
        Map.set acc ~key:shape.Shape.name ~data:shape
      ) in
      Ok shapes_map
    | Error _ -> Error (InvalidParams "Failed to parse shapes")
  with
  | Yojson.Json_error msg -> Error (InvalidParams ("JSON error: " ^ msg))
  | exn -> Error (InvalidParams ("Parse error: " ^ Exn.to_string exn))

(* Resolve a shape by name from parsed shapes, handling built-in primitives *)
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
    match Map.find shapes shape_name with
    | Some shape -> Ok shape.Shape.descriptor
    | None -> Error (MissingShape shape_name)

(* Helper to check if a member is required *)
let is_member_required (member : Shape.member) =
  match member.traits with
  | Some traits -> List.exists traits ~f:Trait.isRequiredTrait
  | None -> false

(* Convert JSON parameter values to OCaml constructor expressions *)
let rec generate_value_constructor shapes shape_descriptor json_value ~is_required =
  match shape_descriptor, json_value with
  | Shape.StringShape _, `String s when is_required -> Ok s
  | Shape.StringShape _, `String s -> Ok (Printf.sprintf "Some %S" s)
  | Shape.IntegerShape _, `Int i when is_required -> Ok (Int.to_string i)
  | Shape.IntegerShape _, `Int i -> Ok (Printf.sprintf "Some %d" i)
  | Shape.LongShape _, `Int i when is_required -> Ok (Printf.sprintf "%dL" i)
  | Shape.LongShape _, `Int i -> Ok (Printf.sprintf "Some %dL" i)
  | Shape.FloatShape _, `String "NaN" when is_required -> Ok "Float.nan"
  | Shape.FloatShape _, `String "NaN" -> Ok "Some Float.nan"
  | Shape.FloatShape _, `String "Infinity" when is_required -> Ok "Float.infinity"
  | Shape.FloatShape _, `String "Infinity" -> Ok "Some Float.infinity"
  | Shape.FloatShape _, `String "-Infinity" when is_required -> Ok "Float.neg_infinity"
  | Shape.FloatShape _, `String "-Infinity" -> Ok "Some Float.neg_infinity"
  | Shape.FloatShape _, `Float f when is_required -> Ok (Printf.sprintf "%g" f)
  | Shape.FloatShape _, `Float f -> Ok (Printf.sprintf "Some %g" f)
  | Shape.FloatShape _, `Int i when is_required -> Ok (Printf.sprintf "(Float.of_int %d)" i)
  | Shape.FloatShape _, `Int i -> Ok (Printf.sprintf "Some (Float.of_int %d)" i)
  | Shape.DoubleShape _, `String "NaN" when is_required -> Ok "Float.nan"
  | Shape.DoubleShape _, `String "NaN" -> Ok "Some Float.nan"
  | Shape.DoubleShape _, `String "Infinity" when is_required -> Ok "Float.infinity"
  | Shape.DoubleShape _, `String "Infinity" -> Ok "Some Float.infinity"
  | Shape.DoubleShape _, `String "-Infinity" when is_required -> Ok "Float.neg_infinity"
  | Shape.DoubleShape _, `String "-Infinity" -> Ok "Some Float.neg_infinity"
  | Shape.DoubleShape _, `Float f when is_required -> Ok (Printf.sprintf "%g" f)
  | Shape.DoubleShape _, `Float f -> Ok (Printf.sprintf "Some %g" f)
  | Shape.DoubleShape _, `Int i when is_required -> Ok (Printf.sprintf "(Float.of_int %d)" i)
  | Shape.DoubleShape _, `Int i -> Ok (Printf.sprintf "Some (Float.of_int %d)" i)
  | Shape.BooleanShape _, `Bool b when is_required -> Ok (Bool.to_string b)
  | Shape.BooleanShape _, `Bool b -> Ok (Printf.sprintf "Some %b" b)
  | Shape.BlobShape _, `String s when is_required -> Ok (Printf.sprintf "%S" s) (* Blob as base64 string *)
  | Shape.BlobShape _, `String s -> Ok (Printf.sprintf "Some %S" s) (* Blob as base64 string *)
  | Shape.TimestampShape _, `String s when is_required -> Ok (Printf.sprintf "%S" s) (* Timestamp as ISO string *)
  | Shape.TimestampShape _, `String s -> Ok (Printf.sprintf "Some %S" s) (* Timestamp as ISO string *)
  | Shape.TimestampShape _, `Int i when is_required -> Ok (Printf.sprintf "(Int.to_string %d)" i) (* Unix timestamp *)
  | Shape.TimestampShape _, `Int i -> Ok (Printf.sprintf "Some (Int.to_string %d)" i) (* Unix timestamp *)
  | Shape.UnitShape, _ -> Ok "()"
  | Shape.ListShape { target; _ }, `List values ->
    (match resolve_shape_by_name shapes target with
     | Ok member_descriptor ->
       let constructor_results = List.map values ~f:(generate_value_constructor shapes member_descriptor ~is_required:true) in
       (match List.fold_result constructor_results ~init:[] ~f:(fun acc result ->
          match result with
          | Ok value -> Ok (value :: acc)
          | Error e -> Error e) with
        | Ok constructors when is_required -> Ok (Printf.sprintf "[%s]" (String.concat ~sep:"; " (List.rev constructors)))
        | Ok constructors -> Ok (Printf.sprintf "Some [%s]" (String.concat ~sep:"; " (List.rev constructors)))
        | Error e -> Error e)
     | Error e -> Error e)
  | Shape.MapShape { mapValue = { target; _ }; _ }, `Assoc assoc ->
    (match resolve_shape_by_name shapes target with
     | Ok value_descriptor ->
       let constructor_results = List.map assoc ~f:(fun (key, value) ->
         match generate_value_constructor shapes value_descriptor value ~is_required:true with
         | Ok value_constructor -> Ok (Printf.sprintf "(%S, %s)" key value_constructor)
         | Error e -> Error e) in
       (match List.fold_result constructor_results ~init:[] ~f:(fun acc result ->
          match result with
          | Ok pair -> Ok (pair :: acc)
          | Error e -> Error e) with
        | Ok pairs when is_required -> Ok (Printf.sprintf "[%s]" (String.concat ~sep:"; " (List.rev pairs)))
        | Ok pairs -> Ok (Printf.sprintf "Some [%s]" (String.concat ~sep:"; " (List.rev pairs)))
        | Error e -> Error e)
     | Error e -> Error e)
  | Shape.StructureShape { members; _ }, `Assoc assoc ->
    generate_structure_constructor shapes members assoc ~is_required
  | Shape.UnionShape { members; _ }, json_value ->
    Error (UnsupportedType "Union types not yet supported")
  | Shape.EnumShape { members; _ }, `String enum_value ->
    let enum_names = List.map members ~f:(fun member -> member.Shape.name) in
    if List.mem enum_names enum_value ~equal:String.equal then
      if is_required then
        Ok enum_value
      else
        Ok (Printf.sprintf "Some %s" enum_value)
    else
      Error (InvalidParams ("Invalid enum value: " ^ enum_value))
  | _, _ when is_required -> 
    Error (InvalidParams "Missing required field value")
  | _, _ -> 
    Error (InvalidParams "Type mismatch in constructor generation")

(* Generate constructor for structure shape *)
and generate_structure_constructor shapes members assoc ~is_required =
  let field_constructors = List.map members ~f:(fun member ->
    let member_name = member.Shape.name in
    let ocaml_field_name = SafeNames.safeMemberName member_name in
    let member_is_required = is_member_required member in
    
    match List.Assoc.find assoc member_name ~equal:String.equal with
    | Some json_value ->
      (match resolve_shape_by_name shapes member.Shape.target with
       | Ok member_descriptor ->
         (match generate_value_constructor shapes member_descriptor json_value ~is_required:member_is_required with
          | Ok value_constructor -> Ok (Printf.sprintf "%s = %s" ocaml_field_name value_constructor)
          | Error e -> Error e)
       | Error e -> Error e)
    | None when member_is_required -> 
      Error (InvalidParams ("Missing required field: " ^ member_name))
    | None -> 
      Ok (Printf.sprintf "%s = None" ocaml_field_name)) in
  (match List.fold_result field_constructors ~init:[] ~f:(fun acc result ->
     match result with
     | Ok field -> Ok (field :: acc)
     | Error e -> Error e) with
   | Ok fields -> Ok (Printf.sprintf "{ %s }" (String.concat ~sep:"; " (List.rev fields)))
   | Error e -> Error e)

(* Generate input constructor function for a test case *)
let generate_input_constructor shapes operation_name input_shape_target (test_case : Parselib.Ast.Trait.httpRequestTest) =
  match resolve_shape_by_name shapes input_shape_target with
  | Ok shape_descriptor ->
    (match test_case.params with
     | Some params_json ->
       (match shape_descriptor with
        | Shape.StructureShape { members; _ } ->
          (* For structures, we need to handle the type name prefix *)
          let simple_name = SafeNames.safeTypeName input_shape_target in
          (match params_json with
           | `Assoc assoc ->
             (match generate_structure_constructor shapes members assoc ~is_required:false with
              | Ok field_constructor ->
                Ok (Printf.sprintf "let make_%s_input () = %s.%s" test_case.id simple_name field_constructor)
              | Error e -> Error e)
           | _ -> Error (InvalidParams "Expected object for structure parameters"))
        | _ ->
          (match generate_value_constructor shapes shape_descriptor params_json ~is_required:true with
           | Ok constructor_expr -> 
             Ok (Printf.sprintf "let make_%s_input () = %s" test_case.id constructor_expr)
           | Error e -> Error e))
     | None -> 
       (* No parameters - use unit for Unit types, empty constructor for structures *)
       (match shape_descriptor with
        | Shape.UnitShape -> Ok (Printf.sprintf "let make_%s_input () = ()" test_case.id)
        | Shape.StructureShape _ ->
          let simple_name = SafeNames.safeTypeName input_shape_target in
          Ok (Printf.sprintf "let make_%s_input () = %s.default ()" test_case.id simple_name)
        | _ -> Error (InvalidParams ("No parameters provided for non-unit type"))))
  | Error e -> Error e

(* Generate all constructor functions for an operation's test cases from parsed shapes *)
let generate_operation_constructors_from_parsed_shapes parsed_shapes operation_name =
  match Map.find parsed_shapes operation_name with
  | Some operation_shape ->
    (match operation_shape.Shape.descriptor with
     | Shape.OperationShape { input = Some input_target; _ } ->
       (* Extract test cases from the operation shape's traits *)
       let request_tests = 
         match operation_shape.Shape.descriptor with
         | Shape.OperationShape { traits = Some traits; _ } ->
           List.filter_map traits ~f:(function
             | Trait.TestHttpRequestTests tests -> Some tests
             | _ -> None)
           |> List.concat
         | _ -> []
       in
       List.fold_result request_tests ~init:[] ~f:(fun acc test_case ->
         match generate_input_constructor parsed_shapes operation_name input_target test_case with
         | Ok constructor -> Ok (constructor :: acc)
         | Error e -> Error e)
     | Shape.OperationShape { input = None; _ } ->
       Error (InvalidParams ("Operation missing input target: " ^ operation_name))
     | _ -> Error (InvalidParams ("Not an operation shape: " ^ operation_name)))
  | None -> Error (MissingShape operation_name)

(* Function that works with raw JSON - parses shapes and extracts test cases *)
let generate_operation_constructors shapes operation_json operation_name =
  match operation_json |> member "input" |> member "target" |> to_string_option with
  | Some input_target ->
    let request_tests = 
      match operation_json |> member "traits" |> member "smithy.test#httpRequestTests" with
      | `List tests -> tests
      | _ -> []
    in
    let test_cases = List.filter_map request_tests ~f:(fun test_json ->
      try
        Some {
          Parselib.Ast.Trait.
          id = test_json |> member "id" |> to_string;
          protocol = test_json |> member "protocol" |> to_string;
          method_ = test_json |> member "method" |> to_string;
          uri = test_json |> member "uri" |> to_string; 
          host = None;
          resolvedHost = None;
          authScheme = None;
          queryParams = None;
          forbidQueryParams = None;
          headers = (match test_json |> member "headers" with
                    | `Assoc h -> Some (List.map h ~f:(fun (k,v) -> (k, to_string v)))
                    | _ -> None);
          forbidHeaders = None;
          body = (test_json |> member "body" |> to_string_option);
          bodyMediaType = (test_json |> member "bodyMediaType" |> to_string_option);
          params = (match test_json |> member "params" with
                   | `Null -> None
                   | p -> Some p);
          vendorParams = None;
          vendorParamsShape = None;
          documentation = (test_json |> member "documentation" |> to_string_option);
          tags = None;
          appliesTo = None;
        }
      with
      | _ -> None
    ) in
    
    List.fold_result test_cases ~init:[] ~f:(fun acc test_case ->
      match generate_input_constructor shapes operation_name input_target test_case with
      | Ok constructor -> Ok (constructor :: acc)
      | Error e -> Error e)
  | None -> Error (InvalidParams ("Operation missing input target: " ^ operation_name))

