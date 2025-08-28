open Ast

module B = Ppxlib.Ast_builder.Make (struct
  let loc = Location.none
end)

let loc = Location.none
let lident_noloc name = Location.mknoloc (Longident.Lident name)

(** isolate the structure shapes that are not exceptions *)
let structure_shapes_without_exceptions shapeWithTarget =
  let open Ast.Dependencies in
  shapeWithTarget :: Option.value ~default:[] shapeWithTarget.recursWith
  |> List.filter_map (fun { name; descriptor; _ } ->
         match descriptor with
         | StructureShape structureShapeDetails
           when (not Trait.(hasTrait structureShapeDetails.traits isErrorTrait))
                && not (String.ends_with ~suffix:"Result" name) ->
             Some (name, structureShapeDetails)
         | _ -> None)

let generate_builder ~alias_context name ({ members; _ } : Ast.Shape.structureShapeDetails)
    ?(namespace_resolver : Namespace_resolver.Namespace_resolver.t option = None) () =
  let open Ast.Shape in
  let record_expr =
    if List.length members = 0 then B.pexp_ident (lident_noloc "()")
    else
      B.pexp_record
        (List.map
           (fun (member : Ast.Shape.member) ->
             let field_name = SafeNames.safeMemberName member.name in
             let field_value = B.pexp_ident (lident_noloc (field_name ^ "_")) in
             (lident_noloc field_name, field_value))
           members)
        None
  in
  let unit_param =
    B.pexp_fun Nolabel None
      (B.ppat_var (Location.mknoloc "()"))
      (B.pexp_constraint record_expr
         (match members with
         | [] -> B.ptyp_constr (lident_noloc "unit") []
         | _ -> Types.type_ident alias_context ~name ~namespace_resolver ()))
  in
  let required, optional =
    List.partition (fun (mem : member) -> Trait.(hasTrait mem.traits isRequiredTrait)) members
  in
  let map_to_labelled_argument (member : Ast.Shape.member) prev_fun =
    let field_name = SafeNames.safeMemberName member.name in
    let field_type =
      Types.resolve_for_target alias_context ~name:member.target ~traits:member.traits
        ~namespace_resolver ()
    in
    let arg_label =
      if Trait.hasTrait member.traits Trait.isRequiredTrait then Ppxlib.Labelled field_name
      else Ppxlib.Optional field_name
    in
    B.pexp_fun arg_label None
      (B.ppat_constraint (B.ppat_var (Location.mknoloc (field_name ^ "_"))) field_type)
      prev_fun
  in
  let labelled_arguments =
    unit_param
    |> List.fold_right map_to_labelled_argument required
    |> List.fold_right map_to_labelled_argument optional
  in

  labelled_arguments

let generate_builder_sig ~alias_context name ({ members; _ } : Ast.Shape.structureShapeDetails)
    ?(namespace_resolver : Namespace_resolver.Namespace_resolver.t option = None) () =
  let open Ast.Shape in
  let type_name =
    match members with [] -> lident_noloc "unit" | _ -> lident_noloc (SafeNames.safeTypeName name)
  in
  let unit_param =
    B.ptyp_arrow Nolabel (B.ptyp_constr (lident_noloc "unit") []) (B.ptyp_constr type_name [])
  in

  let required, optional =
    List.partition (fun (mem : member) -> Trait.(hasTrait mem.traits isRequiredTrait)) members
  in
  let map_to_labelled_argument (member : Ast.Shape.member) prev_fun =
    let field_name = SafeNames.safeMemberName member.name in
    let field_type = Types.resolve alias_context ~name:member.target ~namespace_resolver () in
    let arg_label =
      if Trait.hasTrait member.traits Trait.isRequiredTrait then Ppxlib.Labelled field_name
      else Ppxlib.Optional field_name
    in
    B.ptyp_arrow arg_label field_type prev_fun
  in
  let labelled_arguments =
    unit_param
    |> List.fold_right map_to_labelled_argument required
    |> List.fold_right map_to_labelled_argument optional
  in

  labelled_arguments

let stri_builders ~structure_shapes ~(alias_context : Types.t)
    ?(namespace_resolver : Namespace_resolver.Namespace_resolver.t option = None) () =
  let make_structure_item name descriptor =
    let builder = generate_builder ~alias_context name descriptor ~namespace_resolver () in
    let func_name = "make_" ^ SafeNames.safeTypeName name in
    [%stri let [%p B.ppat_var (Location.mknoloc func_name)] = [%e builder]]
  in
  let structure_items =
    structure_shapes
    |> List.filter_map (fun shapeWithTarget ->
           let shapes = structure_shapes_without_exceptions shapeWithTarget in
           match shapes with
           | [] -> None
           | items ->
               let sis =
                 List.map (fun (name, descriptor) -> make_structure_item name descriptor) items
               in
               Some sis)
    |> List.flatten
  in
  structure_items

let sigi_builders ~structure_shapes ~(alias_context : Types.t)
    ?(namespace_resolver : Namespace_resolver.Namespace_resolver.t option = None) () =
  let structure_items =
    structure_shapes
    |> List.map (fun shapeWithTarget ->
           let shapes = structure_shapes_without_exceptions shapeWithTarget in
           match shapes with
           | [] -> []
           | (name, descriptor) :: [] ->
               let builder =
                 generate_builder_sig ~alias_context name descriptor ~namespace_resolver ()
               in
               let func_name = "make_" ^ SafeNames.safeTypeName name in

               [
                 B.psig_value
                   (B.value_description ~name:(Location.mknoloc func_name) ~type_:builder ~prim:[]);
               ]
           | (name, descriptor) :: remainder ->
               let func_name = "make_" ^ SafeNames.safeTypeName name in
               let builder =
                 generate_builder_sig ~alias_context name descriptor ~namespace_resolver ()
               in
               let value_binding =
                 B.psig_value
                   (B.value_description ~name:(Location.mknoloc func_name) ~type_:builder ~prim:[])
               in
               let rec_bindings =
                 remainder
                 |> List.map (fun (name, descriptor) ->
                        let func_name = "make_" ^ SafeNames.safeTypeName name in
                        let builder =
                          generate_builder_sig ~alias_context name descriptor ~namespace_resolver ()
                        in
                        let value_binding =
                          B.psig_value
                            (B.value_description ~name:(Location.mknoloc func_name) ~type_:builder
                               ~prim:[])
                        in
                        value_binding)
               in
               value_binding :: rec_bindings)
    |> List.flatten
  in
  structure_items
