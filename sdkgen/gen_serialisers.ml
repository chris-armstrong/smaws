open Exceptions
open Smithy_ast

let generate ?(is_query_override = false) ~(service : Shape.serviceShapeDetails) ~operation_shapes
    ~structure_shapes ~(shape_resolver : Codegen.Shape_resolver.t)
    ~(namespace_resolver : Codegen.Namespace_resolver.Namespace_resolver.t) oc =
  let is_query =
    is_query_override
    || Trait.hasTrait service.traits (function
         | Trait.AwsProtocolAwsQueryTrait -> true
         | _ -> false)
  in
  if is_query then (
    let opens = [ Codegen.Ppx_util.stri_open [ "Types" ] ] in
    try
      let serialisers =
        Codegen.AwsProtocolQuery.Serialiser.generate ~structure_shapes ~namespace_resolver
          ~shape_resolver ()
      in
      Ppxlib.Pprintast.structure oc (opens @ serialisers)
    with _ as a ->
      Fmt.pf Fmt.stderr "Unable to generate serialisers: %s" (Printexc.to_string a);
      raise (Generate_failure ("", a)))
  else (
    let opens =
      [
        Codegen.Ppx_util.stri_open [ "Smaws_Lib"; "Json"; "SerializeHelpers" ];
        Codegen.Ppx_util.stri_open [ "Types" ];
      ]
    in
    try
      let serialisers =
        Codegen.AwsProtocolJson.Serialiser.generate ~structure_shapes ~namespace_resolver ()
      in
      Ppxlib.Pprintast.structure oc (opens @ serialisers)
    with _ as a ->
      Fmt.pf Fmt.stderr "Unable to generate serialisers: %s" (Printexc.to_string a);
      raise (Generate_failure ("", a)))
