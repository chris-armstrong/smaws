open Base
open Ast
open Ppx_util

module B = Ppxlib.Ast_builder.Make (struct
  let loc = Location.none
end)

let loc = Location.none
let lident_noloc name = Location.mknoloc (Longident.Lident name)

exception UnexpectedType of string

let has_func_body =
  Shape.(
    function
    | StructureShape x -> true
    | StringShape _ | IntegerShape _ | BooleanShape _ | BigIntegerShape _ | BigDecimalShape _
    | TimestampShape _ | BlobShape _ | MapShape _ | UnionShape _ | SetShape _ | LongShape _
    | DocumentShape | ListShape _ | FloatShape _ | DoubleShape _ | EnumShape _ | UnitShape ->
        true
    | ResourceShape | OperationShape _ | ServiceShape _ -> false)

module Serialiser = struct
  let func_name ?(is_exception_type = false) name =
    let exception_extension = if is_exception_type then "" else "" in
    Fmt.str "%s%s_to_yojson" (SafeNames.safeFunctionName name) exception_extension

  let enum_func_body name (s : Shape.enumShapeDetails) =
    let match_exp =
      B.pexp_match (exp_ident "x")
        (s.members
        |> List.map ~f:(fun (m : Shape.member) ->
               let value =
                 List.find_map_exn
                   ~f:(fun (t : Ast.Trait.t) ->
                     match t with EnumValueTrait e -> Some e | _ -> None)
                   Shape.(m.traits |> Option.value ~default:[])
               in
               let name = SafeNames.safeConstructorName m.name in
               B.case
                 ~lhs:(B.ppat_construct (lident_noloc name) None)
                 ~guard:None
                 ~rhs:(B.pexp_variant "String" (Some (exp_str value)))))
    in

    exp_fun "x" (SafeNames.safeTypeName name) match_exp

  let union_func_body name (s : Shape.structureShapeDetails) =
    let match_exp =
      B.pexp_match (exp_ident "x")
        (s.members
        |> List.map ~f:(fun (m : Shape.member) ->
               let constructor = lident_noloc (SafeNames.safeConstructorName m.name) in
               let pattern =
                 B.ppat_construct constructor (Some (B.ppat_var (Location.mknoloc "arg")))
               in
               let expression =
                 B.pexp_apply (exp_ident "assoc_to_yojson")
                   [
                     ( Nolabel,
                       B.elist
                         [
                           B.pexp_tuple
                             [
                               const_str m.name;
                               B.pexp_construct (lident_noloc "Some")
                                 (Some
                                    (B.pexp_apply
                                       (exp_ident (func_name m.target))
                                       [ (Nolabel, exp_ident "arg") ]));
                             ];
                         ] );
                   ]
               in
               B.case ~lhs:pattern ~guard:None ~rhs:expression))
    in

    exp_fun "x" (SafeNames.safeTypeName name) match_exp

  let structure_func_body name (descriptor : Shape.structureShapeDetails) =
    let open Trait in
    let is_exception_type = hasTrait descriptor.traits isErrorTrait in
    let members_list_exp =
      List.map descriptor.members ~f:(fun mem ->
          let is_required = Trait.hasTrait mem.traits Trait.isRequiredTrait in
          let field_lookup =
            B.pexp_field
              (B.pexp_ident (lident_noloc "x"))
              (lident_noloc (SafeNames.safeMemberName mem.name))
          in
          let value =
            match is_required with
            | true ->
                B.pexp_construct (lident_noloc "Some")
                  (Some
                     (B.pexp_apply
                        (B.pexp_ident (lident_noloc (func_name mem.target)))
                        [ (Nolabel, field_lookup) ]))
            | false ->
                B.pexp_apply
                  (B.pexp_ident (lident_noloc "option_to_yojson"))
                  [
                    (Nolabel, B.pexp_ident (lident_noloc (func_name mem.target)));
                    (Nolabel, field_lookup);
                  ]
          in
          B.pexp_tuple [ const_str mem.name; value ])
    in

    exp_fun "x"
      (Types.type_name ~is_exception_type name)
      (B.pexp_apply (exp_ident "assoc_to_yojson") [ (Nolabel, B.elist members_list_exp) ])

  let generate_func_body (shapeWithTarget : Dependencies.shapeWithTarget) =
    let exp_func name = Some (exp_ident name) in
    match shapeWithTarget.descriptor with
    | StructureShape x -> Some (structure_func_body shapeWithTarget.name x)
    | StringShape x -> exp_func "string_to_yojson"
    | IntegerShape x -> exp_func "int_to_yojson"
    | BooleanShape x -> exp_func "bool_to_yojson"
    | BigIntegerShape x -> exp_func "big_int_to_yojson"
    | BigDecimalShape x -> exp_func "big_decimal_to_yojson"
    | TimestampShape x -> exp_func "timestamp_to_yojson"
    | BlobShape x -> exp_func "blob_to_yojson"
    | LongShape x -> exp_func "long_to_yojson"
    | FloatShape x -> exp_func "float_to_yojson"
    | DoubleShape x -> exp_func "double_to_yojson"
    | UnitShape -> exp_func "unit_to_yojson"
    | DocumentShape -> exp_func "json_to_yojson"
    | ServiceShape x -> None
    | MapShape x ->
        Some
          (exp_fun_untyped "tree"
             (B.pexp_apply (exp_ident "map_to_yojson")
                [
                  (Nolabel, exp_ident (func_name x.mapKey.target));
                  (Nolabel, exp_ident (func_name x.mapValue.target));
                  (Nolabel, exp_ident "tree");
                ]))
    | EnumShape s -> Some (enum_func_body shapeWithTarget.name s)
    | UnionShape x -> Some (union_func_body shapeWithTarget.name x)
    | SetShape x ->
        Some
          (exp_fun_untyped "tree"
             (B.pexp_apply (exp_ident "set_to_yojson")
                [ (Nolabel, exp_ident (func_name x.target)); (Nolabel, exp_ident "tree") ]))
    | ListShape x ->
        Some
          (exp_fun_untyped "tree"
             (B.pexp_apply (exp_ident "list_to_yojson")
                [ (Nolabel, exp_ident (func_name x.target)); (Nolabel, exp_ident "tree") ]))
    | OperationShape x -> None
    | ResourceShape -> None

  let generate ~(structure_shapes : Ast.Dependencies.shapeWithTarget list) =
    let open Trait in
    structure_shapes
    |> List.filter_map ~f:(fun (shapeWithTarget : Dependencies.shapeWithTarget) ->
           let serialiser_name =
             let is_exception_type =
               match shapeWithTarget.descriptor with
               | StructureShape s when hasTrait s.traits isErrorTrait -> true
               | _ -> false
             in
             func_name ~is_exception_type shapeWithTarget.name
           in
           let func_body = generate_func_body shapeWithTarget in
           let shape =
             Option.value_map func_body ~default:[] ~f:(fun func_body ->
                 [
                   B.value_binding
                     ~pat:(B.ppat_var (Location.mknoloc serialiser_name))
                     ~expr:func_body;
                 ])
           in
           let all_shapes =
             match shapeWithTarget.recursWith with
             | Some recursWith ->
                 let all_recurs =
                   List.filter_map recursWith
                     ~f:(fun (shapeWithTarget : Dependencies.shapeWithTarget) ->
                       let serialiser_name =
                         let is_exception_type =
                           match shapeWithTarget.descriptor with
                           | StructureShape s when hasTrait s.traits isErrorTrait -> true
                           | _ -> false
                         in
                         func_name ~is_exception_type shapeWithTarget.name
                       in
                       let func_body = generate_func_body shapeWithTarget in
                       match func_body with
                       | Some body ->
                           Some
                             (B.value_binding
                                ~pat:(B.ppat_var (Location.mknoloc serialiser_name))
                                ~expr:body)
                       | None -> None)
                 in
                 shape @ all_recurs
             | None -> shape
           in
           if List.is_empty all_shapes then None
           else
             Some
               (B.pstr_value
                  (if List.length all_shapes > 1 then Recursive else Nonrecursive)
                  all_shapes))
end

module Deserialiser = struct
  let func_name ?(is_exception_type = false) name =
    let exception_extension = if is_exception_type then "" else "" in
    Fmt.str "%s%s_of_yojson" (SafeNames.safeFunctionName name) exception_extension

  let union_func_body name (s : Shape.structureShapeDetails) =
    let cases =
      s.members
      |> List.map ~f:(fun (m : Ast.Shape.member) ->
             let pattern = B.ppat_constant (Pconst_string (m.name, loc, None)) in
             let application =
               B.pexp_apply
                 (exp_ident (func_name m.target))
                 [ (Nolabel, exp_ident "value_"); (Nolabel, exp_ident "path") ]
             in
             let expression =
               B.pexp_construct
                 (lident_noloc (SafeNames.safeConstructorName m.name))
                 (Some application)
             in
             B.case ~lhs:pattern ~guard:None ~rhs:expression)
    in
    let failure_cases =
      [
        B.case
          ~lhs:(B.ppat_alias B.ppat_any (Location.mknoloc "unknown"))
          ~guard:None
          ~rhs:
            [%expr
              raise
                (deserialize_unknown_enum_value_error path
                   [%e B.pexp_constant (Pconst_string (name |> Util.symbolName, loc, None))]
                   unknown)];
      ]
    in
    let match_exp = B.pexp_match (exp_ident "key") (cases @ failure_cases) in
    let forecode =
      [%expr
        let _list = assoc_of_yojson tree path in
        let key, value_ =
          match _list with
          | (key, value_) :: _ -> (key, value_)
          | _ -> raise (deserialize_wrong_type_error path "union")
        in
        [%e match_exp]]
    in
    exp_fun "tree" "t" (exp_fun_untyped "path" forecode)

  let enum_func_body name (s : Shape.enumShapeDetails) =
    let cases =
      s.members
      |> List.map ~f:(fun (m : Ast.Shape.member) ->
             let pattern =
               B.ppat_variant "String" (Some (B.ppat_constant (Pconst_string (m.name, loc, None))))
             in
             let constructor_exp =
               B.pexp_construct (lident_noloc (SafeNames.safeConstructorName m.name)) None
             in
             B.case ~lhs:pattern ~guard:None ~rhs:constructor_exp)
    in
    let name_const = B.pexp_constant (Pconst_string (name |> Util.symbolName, loc, None)) in
    let failure_cases =
      [
        B.case
          ~lhs:(B.ppat_variant "String" (Some (B.ppat_var (Location.mknoloc "value"))))
          ~guard:None
          ~rhs:[%expr raise (deserialize_unknown_enum_value_error path [%e name_const] value)];
        B.case ~lhs:B.ppat_any ~guard:None
          ~rhs:[%expr raise (deserialize_wrong_type_error path [%e name_const])];
      ]
    in
    let match_exp = B.pexp_match (exp_ident "tree") (cases @ failure_cases) in
    let type_name = SafeNames.safeTypeName name in
    exp_fun "tree" "t"
      (exp_fun_untyped "path"
         (B.pexp_constraint match_exp (B.ptyp_constr (lident_noloc type_name) [])))

  let structure_func_body name (descriptor : Shape.structureShapeDetails) =
    let type_name = Types.type_name ~is_exception_type:false name in
    let member_exp =
      if List.length descriptor.members > 0 then
        B.pexp_record
          (List.map descriptor.members ~f:(fun mem ->
               let is_required = Trait.hasTrait mem.traits Trait.isRequiredTrait in
               let converter_name = func_name ~is_exception_type:false mem.target in
               let key_name = SafeNames.safeMemberName mem.name in
               let key = lident_noloc key_name in
               let base_field_expr =
                 B.pexp_apply
                   (B.pexp_ident (lident_noloc "value_for_key"))
                   [
                     (Nolabel, B.pexp_ident (lident_noloc converter_name));
                     (Nolabel, const_str mem.name);
                   ]
               in

               let field_value =
                 if is_required then
                   B.pexp_apply base_field_expr
                     [
                       (Nolabel, B.pexp_ident (lident_noloc "_list"));
                       (Nolabel, B.pexp_ident (lident_noloc "path"));
                     ]
                 else
                   B.pexp_apply
                     (B.pexp_ident (lident_noloc "option_of_yojson"))
                     [
                       (Nolabel, base_field_expr);
                       (Nolabel, B.pexp_ident (lident_noloc "_list"));
                       (Nolabel, B.pexp_ident (lident_noloc "path"));
                     ]
               in
               (key, field_value)))
          None
      else B.pexp_tuple []
    in
    let code =
      [%expr
        let _list = assoc_of_yojson tree path in
        let _res : [%t B.ptyp_constr (lident_noloc type_name) []] = [%e member_exp] in
        _res]
    in
    exp_fun_untyped "tree" (exp_fun_untyped "path" code)

  let generate_func_body (shapeWithTarget : Dependencies.shapeWithTarget) =
    let exp_func name = Some (exp_ident name) in
    match shapeWithTarget.descriptor with
    | StructureShape x -> Some (structure_func_body shapeWithTarget.name x)
    | StringShape x -> exp_func "string_of_yojson"
    | IntegerShape x -> exp_func "int_of_yojson"
    | BooleanShape x -> exp_func "bool_of_yojson"
    | BigIntegerShape x -> exp_func "big_int_of_yojson"
    | BigDecimalShape x -> exp_func "big_decimal_of_yojson"
    | TimestampShape x -> exp_func "timestamp_epoch_seconds_of_yojson"
    | BlobShape x -> exp_func "blob_of_yojson"
    | LongShape x -> exp_func "long_of_yojson"
    | FloatShape x -> exp_func "float_of_yojson"
    | DoubleShape x -> exp_func "double_of_yojson"
    | UnitShape -> exp_func "unit_of_yojson"
    | DocumentShape -> exp_func "json_of_yojson"
    | ServiceShape x -> None
    | MapShape x ->
        Some
          (exp_fun_untyped "tree"
             (exp_fun_untyped "path"
                (B.pexp_apply (exp_ident "map_of_yojson")
                   [
                     (Nolabel, exp_ident (func_name x.mapKey.target));
                     (Nolabel, exp_ident (func_name x.mapValue.target));
                     (Nolabel, exp_ident "tree");
                     (Nolabel, exp_ident "path");
                   ])))
    | EnumShape s -> Some (enum_func_body shapeWithTarget.name s)
    | UnionShape x -> Some (union_func_body shapeWithTarget.name x)
    | SetShape x ->
        Some
          (exp_fun_untyped "tree"
             (exp_fun_untyped "path"
                (B.pexp_apply (exp_ident "list_of_yojson")
                   [
                     (Nolabel, exp_ident (func_name x.target));
                     (Nolabel, exp_ident "tree");
                     (Nolabel, exp_ident "path");
                   ])))
    | ListShape x ->
        Some
          (exp_fun_untyped "tree"
             (exp_fun_untyped "path"
                (B.pexp_apply (exp_ident "list_of_yojson")
                   [
                     (Nolabel, exp_ident (func_name x.target));
                     (Nolabel, exp_ident "tree");
                     (Nolabel, exp_ident "path");
                   ])))
    | OperationShape x -> None
    | ResourceShape -> None

  let generate ~(structure_shapes : Ast.Dependencies.shapeWithTarget list) =
    let open Trait in
    structure_shapes
    |> List.filter_map ~f:(fun (shapeWithTarget : Dependencies.shapeWithTarget) ->
           let serialiser_name =
             let is_exception_type =
               match shapeWithTarget.descriptor with
               | StructureShape s when hasTrait s.traits isErrorTrait -> true
               | _ -> false
             in
             func_name ~is_exception_type shapeWithTarget.name
           in
           let func_body = generate_func_body shapeWithTarget in
           let shape =
             Option.value_map func_body ~default:[] ~f:(fun func_body ->
                 [
                   B.value_binding
                     ~pat:(B.ppat_var (Location.mknoloc serialiser_name))
                     ~expr:func_body;
                 ])
           in
           let all_shapes =
             match shapeWithTarget.recursWith with
             | Some recursWith ->
                 let all_recurs =
                   List.filter_map recursWith
                     ~f:(fun (shapeWithTarget : Dependencies.shapeWithTarget) ->
                       let serialiser_name =
                         let is_exception_type =
                           match shapeWithTarget.descriptor with
                           | StructureShape s when hasTrait s.traits isErrorTrait -> true
                           | _ -> false
                         in
                         func_name ~is_exception_type shapeWithTarget.name
                       in
                       let func_body = generate_func_body shapeWithTarget in
                       match func_body with
                       | Some body ->
                           Some
                             (B.value_binding
                                ~pat:(B.ppat_var (Location.mknoloc serialiser_name))
                                ~expr:body)
                       | None -> None)
                 in
                 shape @ all_recurs
             | None -> shape
           in
           if List.is_empty all_shapes then None
           else
             Some
               (B.pstr_value
                  (if List.length all_shapes > 1 then Recursive else Nonrecursive)
                  all_shapes))
end
