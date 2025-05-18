open Parselib
open Ast
open Exceptions

let generate ~name ~(service : Shape.serviceShapeDetails) ~operation_shapes ~structure_shapes
    ~alias_context oc =
  if
    Trait.hasTrait service.traits (function
      | Trait.AwsProtocolAwsJson1_1Trait -> true
      | Trait.AwsProtocolAwsJson1_0Trait -> true
      | _ -> false)
  then (
    let opens = [ Codegen.Ppx_util.stri_open [ "Types" ] ] in
    try
      let structure =
        Codegen.AwsProtocolJson_ppx.Operations.generate ~name ~operation_shapes ~alias_context
      in
      Ppxlib.Pprintast.structure oc (opens @ structure)
    with _ as a ->
      Fmt.pf Fmt.stderr "Unable to generate operations for %s: %s" name (Printexc.to_string a);
      raise (Generate_failure (name, a)))

let generate_mli ~name ~(service : Shape.serviceShapeDetails) ~operation_shapes ~structure_shapes
    ~alias_context oc =
  if
    Trait.hasTrait service.traits (function
      | Trait.AwsProtocolAwsJson1_1Trait -> true
      | Trait.AwsProtocolAwsJson1_0Trait -> true
      | _ -> false)
  then (
    let opens = [ Codegen.Ppx_util.sigi_open [ "Types" ] ] in
    try
      let sign =
        Codegen.AwsProtocolJson_ppx.Operations.generate_mli ~name ~operation_shapes ~alias_context
      in
      Ppxlib.Pprintast.signature oc (opens @ sign)
    with _ as a ->
      Fmt.pf Fmt.stderr "Unable to generate operations for %s: %s" name (Printexc.to_string a);
      raise (Generate_failure (name, a)))
