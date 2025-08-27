(** Type-safe input constructor generator for Smithy protocol test cases *)

open Yojson.Basic

(** Constructor generation errors *)
type constructor_error = 
  | UnsupportedType of string
  | MissingShape of string
  | InvalidParams of string

val string_of_constructor_error : constructor_error -> string

(** Parse shapes from JSON using existing Parselib infrastructure *)
val parse_shapes_from_json : string -> ((string, Parselib.Ast.Shape.t, Base.String.comparator_witness) Base.Map.t, constructor_error) result

(** Resolve a shape by name from parsed shapes *)
val resolve_shape_by_name : (string, Parselib.Ast.Shape.t, Base.String.comparator_witness) Base.Map.t -> string -> (Parselib.Ast.Shape.shapeDescriptor, constructor_error) result

(** Generate OCaml constructor expression from JSON parameter values using shape descriptors *)
val generate_value_constructor : 
  (string, Parselib.Ast.Shape.t, Base.String.comparator_witness) Base.Map.t -> Parselib.Ast.Shape.shapeDescriptor -> t -> (string, constructor_error) result

(** Generate input constructor function for a test case *)
val generate_input_constructor : 
  (string, Parselib.Ast.Shape.t, Base.String.comparator_witness) Base.Map.t -> string -> string -> Parselib.Ast.Trait.httpRequestTest -> (string, constructor_error) result

(** Generate all constructor functions for an operation's test cases from parsed shapes *)
val generate_operation_constructors_from_parsed_shapes : 
  (string, Parselib.Ast.Shape.t, Base.String.comparator_witness) Base.Map.t -> string -> (string list, constructor_error) result

(** Generate all constructor functions from raw JSON (parses shapes internally) *)
val generate_operation_constructors : 
  (string, Parselib.Ast.Shape.t, Base.String.comparator_witness) Base.Map.t -> t -> string -> (string list, constructor_error) result