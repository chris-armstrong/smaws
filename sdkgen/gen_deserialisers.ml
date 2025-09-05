open Parselib
open Exceptions

let generate ~name ~(service : Ast.Shape.serviceShapeDetails) ~operation_shapes ~structure_shapes
    ~(namespace_resolver : Codegen.Namespace_resolver.Namespace_resolver.t) oc =
  if
    Ast.Trait.hasTrait service.traits (function
      | Ast.Trait.AwsProtocolAwsJson1_1Trait -> true
      | Ast.Trait.AwsProtocolAwsJson1_0Trait -> true
      | _ -> false)
  then begin
    let opens =
      [
        Codegen.Ppx_util.stri_open [ "Smaws_Lib"; "Json"; "DeserializeHelpers" ];
        Codegen.Ppx_util.stri_open [ "Types" ];
      ]
    in
    try
      let serialisers =
        Codegen.AwsProtocolJson.Deserialiser.generate ~structure_shapes ~namespace_resolver ()
      in
      Ppxlib.Pprintast.structure oc (opens @ serialisers)
    with _ as a ->
      Fmt.pf Fmt.stderr "Unable to generate deserialisers for %s: %s" name (Printexc.to_string a);
      raise (Generate_failure (name, a))
  end
