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
    let unit_of_xml_stri =
      let module B = Ppxlib.Ast_builder.Make (struct
        let loc = Location.none
      end) in
      B.pstr_value Nonrecursive
        [
          B.value_binding
            ~pat:(B.ppat_var (Location.mknoloc "unit_of_xml"))
            ~expr:
              (B.pexp_fun Nolabel None B.ppat_any
                 (B.pexp_construct (Location.mknoloc (Ppxlib.Longident.Lident "()")) None));
        ]
    in
    try
      let deserialisers =
        Codegen.AwsProtocolQuery.Deserialiser.generate ~structure_shapes ~namespace_resolver
          ~shape_resolver ()
      in
      Ppxlib.Pprintast.structure oc (opens @ [ unit_of_xml_stri ] @ deserialisers)
    with _ as a ->
      Fmt.pf Fmt.stderr "Unable to generate deserialisers: %s" (Printexc.to_string a);
      raise (Generate_failure ("", a)))
  else (
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
      raise (Generate_failure ("", a)))
