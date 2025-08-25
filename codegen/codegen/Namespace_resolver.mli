open Base

module Namespace_resolver : sig
  type t

  val create : 
    current_namespace:string -> 
    namespace_module_mapping:(string, string) Map.Poly.t -> 
    t

  val resolve_reference : t -> string -> string
  val resolve_optional_reference : t -> string option -> string option
end