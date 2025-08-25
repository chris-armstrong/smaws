open Base

module Namespace_resolver = struct
  type t = {
    current_namespace : string;
    namespace_module_mapping : (string, string) Map.Poly.t;
  }

  let create ~current_namespace ~namespace_module_mapping = 
    { current_namespace; namespace_module_mapping }

  (* Map smithy.api builtin types to their OCaml equivalents *)
  let builtin_type_mapping = Map.Poly.of_alist_exn [
    ("smithy.api#String", "string");
    ("smithy.api#Boolean", "bool");
    ("smithy.api#Integer", "int");
    ("smithy.api#Long", "int");
    ("smithy.api#Float", "float");
    ("smithy.api#Double", "float");
    ("smithy.api#Timestamp", "float");
    ("smithy.api#Unit", "unit");
    ("smithy.api#Blob", "string");
    ("smithy.api#Document", "Yojson.Safe.t");
  ]

  let resolve_reference t target_name =
    (* First check if this is a builtin type *)
    match Map.find builtin_type_mapping target_name with
    | Some builtin_type -> builtin_type
    | None ->
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