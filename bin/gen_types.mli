open Parselib

type t = Codegen.Types.t

val create_alias_context : Ast.Shape.t list -> t

val generate_ml :
  name:string ->
  service:Ast.Shape.serviceShapeDetails ->
  structure_shapes:Ast.Dependencies.shapeWithTarget list ->
  alias_context:t ->
  ?no_open:bool ->
  Format.formatter ->
  unit

val generate_mli :
  name:string ->
  service:Ast.Shape.serviceShapeDetails ->
  structure_shapes:Ast.Dependencies.shapeWithTarget list ->
  alias_context:t ->
  ?no_open:bool ->
  Format.formatter ->
  unit
