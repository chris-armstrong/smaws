open Base

module Namespace_resolver = struct
  type t = {
    current_namespace : string;
    namespace_module_mapping : (string, string) Map.Poly.t;
  }

  let create ~current_namespace ~namespace_module_mapping = 
    { current_namespace; namespace_module_mapping }

  let resolve_reference t target_name =
    let target_namespace = Util.symbolNamespace target_name in
    let target_symbol = Util.symbolName target_name in
    if String.equal target_namespace t.current_namespace then
      target_symbol (* Local reference *)
    else
      match Map.find t.namespace_module_mapping target_namespace with
      | Some module_name -> module_name ^ "." ^ target_symbol
      | None -> failwith ("Unknown namespace: " ^ target_namespace)

  let resolve_optional_reference t = function
    | None -> None
    | Some target_name -> Some (resolve_reference t target_name)
end