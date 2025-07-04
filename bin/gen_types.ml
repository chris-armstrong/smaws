open Parselib

type t = Codegen.Types.t

let create_alias_context = Codegen.Types.create_alias_context

let generate_ml ~name ~(service : Ast.Shape.serviceShapeDetails) ~structure_shapes ~alias_context
    ?(no_open = false) fmt =
  let open Codegen.Types in
  let opens = if not no_open then [ Codegen.Ppx_util.stri_open [ "Smaws_Lib" ] ] else [] in
  let sm = [ stri_service_metadata service ] in
  let types = stri_structure_shapes alias_context structure_shapes fmt in
  Ppxlib.Pprintast.structure fmt (opens @ sm @ types)

let generate_mli ~name ~(service : Ast.Shape.serviceShapeDetails) ~structure_shapes ~alias_context
    ?(no_open = false) fmt =
  let open Codegen.Types in
  let opens = if not no_open then [ Codegen.Ppx_util.sigi_open [ "Smaws_Lib" ] ] else [] in
  let sm = [ sigi_service_metadata service ] in
  let types = sigi_structure_shapes alias_context structure_shapes fmt in
  Ppxlib.Pprintast.signature fmt (opens @ sm @ types)
