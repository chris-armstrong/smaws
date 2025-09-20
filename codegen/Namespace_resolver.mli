open Base

module Namespace_resolver : sig
  type t

  val create : current_namespace:string -> namespace_module_mapping:(string, string) Map.Poly.t -> t

  val resolve_reference :
    symbol_transformer:(local:bool -> string -> string list) -> t -> string -> string list

  val resolve_optional_reference :
    symbol_transformer:(local:bool -> string -> string list) ->
    t ->
    string option ->
    string list option

  val current_namespace : t -> string
  val current_module : t -> string
end
