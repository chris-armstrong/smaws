open Parselib

let generate ~name ~(service : Ast.Shape.serviceShapeDetails) ~operation_shapes ~structure_shapes
    ~alias_context fmt =
  let structure_shapes = Codegen.Builders_ppx.stri_builders ~alias_context ~structure_shapes in

  let opens =
    [ Codegen.Ppx_util.stri_open [ "Smaws_Lib" ]; Codegen.Ppx_util.stri_open [ "Types" ] ]
  in
  Ppxlib.Pprintast.structure fmt (opens @ structure_shapes)

let generate_mli ~name ~service ~operation_shapes ~structure_shapes ~alias_context
    ?(no_open = false) fmt =
  let structure_shapes = Codegen.Builders_ppx.sigi_builders ~alias_context ~structure_shapes in

  let opens =
    if not no_open then
      [ Codegen.Ppx_util.sigi_open [ "Smaws_Lib" ]; Codegen.Ppx_util.sigi_open [ "Types" ] ]
    else []
  in
  Ppxlib.Pprintast.signature fmt (opens @ structure_shapes)
