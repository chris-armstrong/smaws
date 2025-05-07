open Parselib
open Exceptions

module Log =
  (val Logs.src_log
         (Logs.Src.create "AwsGenerator.Serialisers_ppx" ~doc:"AwsSdkLib Serialisers Ppx generator")
      : Logs.LOG)

let generate ~name ~(service : Ast.Shape.serviceShapeDetails) ~operation_shapes ~structure_shapes oc
    =
  if
    Ast.Trait.hasTrait service.traits (function
      | Ast.Trait.AwsProtocolAwsJson1_1Trait -> true
      | Ast.Trait.AwsProtocolAwsJson1_0Trait -> true
      | _ -> false)
  then begin
    let opens =
      [
        Codegen.Ppx_util.stri_open [ "Smaws_Lib"; "Json"; "SerializeHelpers" ];
        Codegen.Ppx_util.stri_open [ "Types" ];
      ]
    in
    try
      let serialisers = Codegen.AwsProtocolJson_ppx.Serialiser.generate ~structure_shapes in
      Ppxlib.Pprintast.structure oc (opens @ serialisers)
    with _ as a ->
      Fmt.pf Fmt.stderr "Unable to generate serialisers for %s: %s" name (Printexc.to_string a);
      raise (Generate_failure (name, a))
  end
