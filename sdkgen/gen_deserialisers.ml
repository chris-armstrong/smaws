open Exceptions

let generate ~operation_shapes ~structure_shapes
    ~(namespace_resolver : Codegen.Namespace_resolver.Namespace_resolver.t) oc =
  let opens =
    [
      Codegen.Ppx_util.stri_open [ "Smaws_Lib"; "Json"; "DeserializeHelpers" ];
      Codegen.Ppx_util.stri_open [ "Types" ];
    ]
  in
  try
    let deserialisers =
      Codegen.AwsProtocolJson.Deserialiser.generate ~structure_shapes ~namespace_resolver ()
    in
    Ppxlib.Pprintast.structure oc (opens @ deserialisers)
  with _ as a ->
    Fmt.pf Fmt.stderr "Unable to generate deserialisers: %s" (Printexc.to_string a);
    raise (Generate_failure ("", a))
