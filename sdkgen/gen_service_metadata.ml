open Smithy_ast

let create_alias_context = Codegen.Types.create_alias_context

let generate_ml ~name ~(service : Shape.serviceShapeDetails) ~structure_shapes ~alias_context
    ?(no_open = false) fmt =
  let open Codegen.Types in
  let opens = [] in
  let sm = [ stri_service_metadata service ] in
  Ppxlib.Pprintast.structure fmt (opens @ sm)

let generate_mli ~name ~(service : Shape.serviceShapeDetails) ~structure_shapes ~alias_context
    ?(no_open = false) fmt =
  let open Codegen.Types in
  let opens = [] in
  let sm = [ sigi_service_metadata service ] in
  Ppxlib.Pprintast.signature fmt (opens @ sm)
