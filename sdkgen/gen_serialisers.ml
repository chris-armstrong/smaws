open Exceptions
open Smithy_ast

let generate ?protocol_override ~(service : Shape.serviceShapeDetails) ~operation_shapes
    ~structure_shapes ~(shape_resolver : Codegen.Shape_resolver.t)
    ~(namespace_resolver : Codegen.Namespace_resolver.Namespace_resolver.t) oc =
  let protocol =
    match protocol_override with
    | Some protocol -> protocol
    | None -> SmithyHelpers.protocol_of_traits service.traits
  in
  match protocol with
  | Query -> (
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
  | Json -> (
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
  | RestXml -> (
      let opens =
        [
          Codegen.Ppx_util.stri_open [ "Smaws_Lib"; "Xml"; "Write" ];
          Codegen.Ppx_util.stri_open [ "Types" ];
        ]
      in
      try
        let serialisers =
          Codegen.AwsProtocolRestXml.Serialiser.generate ~structure_shapes ~namespace_resolver
            ~shape_resolver ()
        in
        Ppxlib.Pprintast.structure oc (opens @ serialisers)
      with _ as a ->
        Fmt.pf Fmt.stderr "Unable to generate serialisers: %s" (Printexc.to_string a);
        raise (Generate_failure ("", a)))
