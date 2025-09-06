type t = Codegen.Types.t

val create_alias_context :
  namespace:string ->
  namespace_resolver:Codegen.Namespace_resolver.Namespace_resolver.t ->
  should_alias:bool ->
  Smithy_ast.Shape.t list ->
  t

val generate_ml :
  structure_shapes:Smithy_ast.Dependencies.shapeWithTarget list ->
  alias_context:t ->
  ?with_derivings:bool ->
  ?no_open:bool ->
  namespace_resolver:Codegen.Namespace_resolver.Namespace_resolver.t ->
  Format.formatter ->
  unit

val generate_mli :
  structure_shapes:Smithy_ast.Dependencies.shapeWithTarget list ->
  alias_context:t ->
  ?with_derivings:bool ->
  ?no_open:bool ->
  namespace_resolver:Codegen.Namespace_resolver.Namespace_resolver.t ->
  Format.formatter ->
  unit
