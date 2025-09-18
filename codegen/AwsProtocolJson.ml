open Base
open Ppx_util
module Ast = Smithy_ast
module Parse = Smaws_parse
open Ast

module B = Ppxlib.Ast_builder.Make (struct
  let loc = Location.none
end)

let loc = Location.none

exception UnexpectedType of string

(* let has_func_body = *)
(*   Shape.( *)
(*     function *)
(*     | StructureShape { members = []; _ } -> false *)
(*     | StructureShape _ | StringShape _ | IntegerShape _ | BooleanShape _ | BigIntegerShape _ *)
(*     | BigDecimalShape _ | TimestampShape _ | BlobShape _ | MapShape _ | UnionShape _ | SetShape _ *)
(*     | LongShape _ | DocumentShape | ListShape _ | FloatShape _ | DoubleShape _ | EnumShape _ *)
(*     | UnitShape -> *)
(*         true *)
(*     | ResourceShape | OperationShape _ | ServiceShape _ -> false) *)

module Serialiser = struct
  let serialiser_func_str name = (name |> SafeNames.safeFunctionName) ^ "_to_yojson"

  let func_name ?(is_exception_type = false)
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t) name =
    let symbol_transformer ~local x =
      if local then [ serialiser_func_str x ] else [ "Json_serializers"; serialiser_func_str x ]
    in
    let resolved_name =
      Namespace_resolver.Namespace_resolver.resolve_reference ~symbol_transformer namespace_resolver
        name
    in
    Longident.unflatten resolved_name |> Option.value_exn

  let external_func_name ?(is_exception_type = false)
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t) name =
    let symbol_transformer ~local x = [ "Json_serializers"; serialiser_func_str x ] in
    let resolved_name =
      Namespace_resolver.Namespace_resolver.resolve_reference ~symbol_transformer namespace_resolver
        name
    in
    Longident.unflatten resolved_name |> Option.value_exn

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
                 ~rhs:
                   (match value with
                   | `String value -> B.pexp_variant "String" (Some (exp_str value))
                   | `Int value -> B.pexp_variant "Int" (Some (exp_int value)))))
    in

    exp_fun "x" (SafeNames.safeTypeName name) match_exp

  let union_func_body name (s : Shape.structureShapeDetails)
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t) () =
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
                                       (B.pexp_ident
                                          (Location.mknoloc
                                             (func_name ~namespace_resolver m.target)))
                                       [ (Nolabel, exp_ident "arg") ]));
                             ];
                         ] );
                   ]
               in
               B.case ~lhs:pattern ~guard:None ~rhs:expression))
    in

    exp_fun "x" (SafeNames.safeTypeName name) match_exp

  let structure_func_body name (descriptor : Shape.structureShapeDetails)
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t) () =
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
                        (B.pexp_ident (Location.mknoloc (func_name ~namespace_resolver mem.target)))
                        [ (Nolabel, field_lookup) ]))
            | false ->
                B.pexp_apply
                  (B.pexp_ident (lident_noloc "option_to_yojson"))
                  [
                    ( Nolabel,
                      B.pexp_ident (Location.mknoloc (func_name ~namespace_resolver mem.target)) );
                    (Nolabel, field_lookup);
                  ]
          in
          B.pexp_tuple [ const_str mem.name; value ])
    in

    exp_fun "x"
      (Types.type_name ~is_exception_type name)
      (B.pexp_apply (exp_ident "assoc_to_yojson") [ (Nolabel, B.elist members_list_exp) ])

  let generate_func_body (shapeWithTarget : Dependencies.shapeWithTarget)
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t) () =
    let exp_func name = Some (exp_ident name) in
    match shapeWithTarget.descriptor with
    | StructureShape { members = []; _ } -> exp_func "unit_to_yojson"
    | StructureShape x -> Some (structure_func_body shapeWithTarget.name x ~namespace_resolver ())
    | StringShape x -> exp_func "string_to_yojson"
    | IntegerShape x -> exp_func "int_to_yojson"
    | ByteShape x -> exp_func "byte_to_yojson"
    | ShortShape x -> exp_func "short_to_yojson"
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
        let is_sparse = Trait.hasTrait x.traits Trait.isSparseTrait in
        let item_transformer =
          B.pexp_ident (Location.mknoloc (func_name ~namespace_resolver x.mapValue.target))
        in
        Some
          (exp_fun_untyped "tree"
             (B.pexp_apply (exp_ident "map_to_yojson")
                [
                  ( Nolabel,
                    B.pexp_ident (Location.mknoloc (func_name ~namespace_resolver x.mapKey.target))
                  );
                  ( Nolabel,
                    if is_sparse then
                      B.pexp_apply (exp_ident "nullable_to_yojson") [ (Nolabel, item_transformer) ]
                    else item_transformer );
                  (Nolabel, exp_ident "tree");
                ]))
    | EnumShape s -> Some (enum_func_body shapeWithTarget.name s)
    | UnionShape x -> Some (union_func_body shapeWithTarget.name x ~namespace_resolver ())
    | SetShape x ->
        Some
          (exp_fun_untyped "tree"
             (B.pexp_apply (exp_ident "set_to_yojson")
                [
                  (Nolabel, B.pexp_ident (Location.mknoloc (func_name ~namespace_resolver x.target)));
                  (Nolabel, exp_ident "tree");
                ]))
    | ListShape x ->
        let is_sparse = Trait.hasTrait x.traits Trait.isSparseTrait in
        let item_transformer =
          B.pexp_ident (Location.mknoloc (func_name ~namespace_resolver x.target))
        in
        let transformer =
          B.pexp_apply (exp_ident "list_to_yojson")
            [
              ( Nolabel,
                if is_sparse then
                  B.pexp_apply (exp_ident "nullable_to_yojson") [ (Nolabel, item_transformer) ]
                else item_transformer );
              (Nolabel, exp_ident "tree");
            ]
        in
        Some (exp_fun_untyped "tree" transformer)
    | OperationShape x -> None
    | ResourceShape -> None

  let generate ~(structure_shapes : Ast.Dependencies.shapeWithTarget list)
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t) () =
    let open Trait in
    structure_shapes
    |> List.filter_map ~f:(fun (shapeWithTarget : Dependencies.shapeWithTarget) ->
           let serialiser_name =
             let is_exception_type =
               match shapeWithTarget.descriptor with
               | StructureShape s when hasTrait s.traits isErrorTrait -> true
               | _ -> false
             in
             serialiser_func_str shapeWithTarget.name
           in
           let func_body = generate_func_body shapeWithTarget ~namespace_resolver () in
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
                         serialiser_func_str shapeWithTarget.name
                       in
                       let func_body = generate_func_body shapeWithTarget ~namespace_resolver () in
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
                  (if
                     List.length all_shapes > 1
                     || shapeWithTarget |> Dependencies.is_recursive_shape_with_target
                   then Recursive
                   else Nonrecursive)
                  all_shapes))
end

module Deserialiser = struct
  let deserialiser_func_str name = (name |> SafeNames.safeFunctionName) ^ "_of_yojson"

  let func_name ?(is_exception_type = false)
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t) name =
    let symbol_transformer ~local x =
      if local then [ deserialiser_func_str x ]
      else [ "Json_deserializers"; deserialiser_func_str x ]
    in
    let resolved_name =
      Namespace_resolver.Namespace_resolver.resolve_reference ~symbol_transformer namespace_resolver
        name
      |> Longident.unflatten |> Option.value_exn
    in
    resolved_name

  let external_func_name ?(is_exception_type = false)
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t) name =
    let symbol_transformer ~local x = [ "Json_deserializers"; deserialiser_func_str x ] in
    let resolved_name =
      Namespace_resolver.Namespace_resolver.resolve_reference ~symbol_transformer namespace_resolver
        name
      |> Longident.unflatten |> Option.value_exn
    in
    resolved_name

  let union_func_body name (s : Shape.structureShapeDetails)
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t) () =
    let cases =
      s.members
      |> List.map ~f:(fun (m : Ast.Shape.member) ->
             let pattern = pat_const_str m.name in
             let application =
               B.pexp_apply
                 (B.pexp_ident (Location.mknoloc (func_name ~namespace_resolver m.target)))
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
    let type_name_s = SafeNames.safeTypeName name in

    let type_name = B.ptyp_constr (lident_noloc type_name_s) [] in
    let forecode =
      [%expr
        let _list = assoc_of_yojson tree path in
        let key, value_ =
          match _list with
          | (key, value_) :: _ -> (key, value_)
          | _ -> raise (deserialize_wrong_type_error path "union")
        in
        ([%e match_exp] : [%t type_name])]
    in
    exp_fun "tree" "t" (exp_fun_untyped "path" forecode)

  let enum_func_body name (s : Shape.enumShapeDetails) =
    let cases =
      s.members
      |> List.map ~f:(fun (m : Ast.Shape.member) ->
             let value =
               List.find_map_exn
                 ~f:(fun (t : Ast.Trait.t) -> match t with EnumValueTrait e -> Some e | _ -> None)
                 Shape.(m.traits |> Option.value ~default:[])
             in
             let pattern =
               match value with
               | `String value ->
                   B.ppat_variant "String"
                     (Some (B.ppat_constant (Pconst_string (value, loc, None))))
               | `Int value ->
                   B.ppat_variant "Int"
                     (Some (B.ppat_constant (Pconst_integer (value |> Int.to_string, None))))
             in
             let constructor_exp =
               B.pexp_construct (lident_noloc (SafeNames.safeConstructorName m.name)) None
             in
             B.case ~lhs:pattern ~guard:None ~rhs:constructor_exp)
    in
    let name_const = B.pexp_constant (Pconst_string (name |> Util.symbolName, loc, None)) in
    let failure_cases =
      (* TODO: this is incorrect, it could be a string or int *)
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
    let type_name_s = SafeNames.safeTypeName name in

    let type_name = B.ptyp_constr (lident_noloc type_name_s) [] in
    let typed_match_exp = [%expr ([%e match_exp] : [%t type_name])] in
    exp_fun "tree" "t"
      (exp_fun_untyped "path"
         (B.pexp_constraint typed_match_exp (B.ptyp_constr (lident_noloc type_name_s) [])))

  let structure_func_body name (descriptor : Shape.structureShapeDetails)
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t) () =
    let type_name = Types.type_name ~is_exception_type:false name in
    let member_exp =
      if List.length descriptor.members > 0 then
        B.pexp_record
          (List.map descriptor.members ~f:(fun mem ->
               let is_required = Trait.hasTrait mem.traits Trait.isRequiredTrait in
               let converter_name =
                 func_name ~is_exception_type:false ~namespace_resolver mem.target
               in
               let key_name = SafeNames.safeMemberName mem.name in
               let key = lident_noloc key_name in
               let base_field_expr =
                 B.pexp_apply
                   (B.pexp_ident (lident_noloc "value_for_key"))
                   [
                     (Nolabel, B.pexp_ident (Location.mknoloc converter_name));
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
    let type_name =
      match descriptor.members with
      | [] -> B.ptyp_constr (lident_noloc "unit") []
      | _ -> B.ptyp_constr (lident_noloc type_name) []
    in
    let code =
      [%expr
        let _list = assoc_of_yojson tree path in
        ([%e member_exp] : [%t type_name])]
    in
    exp_fun_untyped "tree" (exp_fun_untyped "path" code)

  let generate_func_body (shapeWithTarget : Dependencies.shapeWithTarget)
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t) () =
    let exp_func name = Some (exp_ident name) in
    match shapeWithTarget.descriptor with
    | StructureShape x -> Some (structure_func_body shapeWithTarget.name x ~namespace_resolver ())
    | StringShape x -> exp_func "string_of_yojson"
    | IntegerShape x -> exp_func "int_of_yojson"
    | ByteShape x -> exp_func "byte_of_yojson"
    | ShortShape x -> exp_func "short_of_yojson"
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
        let is_sparse = Trait.hasTrait x.traits Trait.isSparseTrait in
        let item_type =
          B.pexp_ident (Location.mknoloc (func_name ~namespace_resolver x.mapValue.target))
        in
        Some
          (exp_fun_untyped "tree"
             (exp_fun_untyped "path"
                (B.pexp_apply (exp_ident "map_of_yojson")
                   [
                     ( Nolabel,
                       B.pexp_ident
                         (Location.mknoloc (func_name ~namespace_resolver x.mapKey.target)) );
                     ( Nolabel,
                       if is_sparse then
                         B.pexp_apply
                           (B.pexp_ident
                              ([ "nullable_of_yojson" ] |> Longident.unflatten |> Option.value_exn
                             |> Location.mknoloc))
                           [ (Nolabel, item_type) ]
                       else item_type );
                     (Nolabel, exp_ident "tree");
                     (Nolabel, exp_ident "path");
                   ])))
    | EnumShape s -> Some (enum_func_body shapeWithTarget.name s)
    | UnionShape x -> Some (union_func_body shapeWithTarget.name x ~namespace_resolver ())
    | SetShape x ->
        Some
          (exp_fun_untyped "tree"
             (exp_fun_untyped "path"
                (B.pexp_apply (exp_ident "list_of_yojson")
                   [
                     ( Nolabel,
                       B.pexp_ident (Location.mknoloc (func_name ~namespace_resolver x.target)) );
                     (Nolabel, exp_ident "tree");
                     (Nolabel, exp_ident "path");
                   ])))
    | ListShape x ->
        let item_type = B.pexp_ident (Location.mknoloc (func_name ~namespace_resolver x.target)) in
        let is_sparse = Trait.hasTrait x.traits Trait.isSparseTrait in
        let wrapped_type =
          if is_sparse then
            B.pexp_apply
              (B.pexp_ident
                 ([ "nullable_of_yojson" ] |> Longident.unflatten |> Option.value_exn
                |> Location.mknoloc))
              [ (Nolabel, item_type) ]
          else item_type
        in
        Some
          (exp_fun_untyped "tree"
             (exp_fun_untyped "path"
                (B.pexp_apply (exp_ident "list_of_yojson")
                   [
                     (Nolabel, wrapped_type);
                     (Nolabel, exp_ident "tree");
                     (Nolabel, exp_ident "path");
                   ])))
    | OperationShape x -> None
    | ResourceShape -> None

  let generate ~(structure_shapes : Ast.Dependencies.shapeWithTarget list)
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t) () =
    let open Trait in
    structure_shapes
    |> List.filter_map ~f:(fun (shapeWithTarget : Dependencies.shapeWithTarget) ->
           let serialiser_name =
             let is_exception_type =
               match shapeWithTarget.descriptor with
               | StructureShape s when hasTrait s.traits isErrorTrait -> true
               | _ -> false
             in
             deserialiser_func_str shapeWithTarget.name
           in
           let func_body = generate_func_body shapeWithTarget ~namespace_resolver () in
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
                         deserialiser_func_str shapeWithTarget.name
                       in
                       let func_body = generate_func_body shapeWithTarget ~namespace_resolver () in
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
                  (if
                     List.length all_shapes > 1
                     || shapeWithTarget |> Dependencies.is_recursive_shape_with_target
                   then Recursive
                   else Nonrecursive)
                  all_shapes))
end

module Operations = struct
  (** * Create a generic error_to_string function for an operation's error type. * * FIXME: This
      just prints the error name with its Smithy namespace. It should * also print its value. *)
  let generate_error_to_string ~(operation_shape : Ast.Shape.operationShapeDetails)
      ~namespace_resolver () =
    let errors = operation_shape.errors |> Option.value ~default:[] in
    let handler_body =
      match errors with
      | [] ->
          B.pexp_ident
            (Location.mknoloc (make_lident ~names:[ Modules.protocolAwsJson; "error_to_string" ]))
      | errors ->
          let error_cases =
            errors
            |> List.map ~f:(fun error ->
                   let name = Util.symbolName error in
                   B.case
                     ~lhs:(B.ppat_variant name (Some B.ppat_any))
                     ~guard:None ~rhs:(const_str error))
          in
          let default_case =
            B.case
              ~lhs:
                (B.ppat_alias
                   (B.ppat_type
                      (Location.mknoloc (make_lident ~names:[ Modules.protocolAwsJson; "error" ])))
                   (Location.mknoloc "e"))
              ~guard:None
              ~rhs:
                (B.pexp_apply
                   (make_lident ~names:[ Modules.protocolAwsJson; "error_to_string" ]
                   |> Location.mknoloc |> B.pexp_ident)
                   [ (Nolabel, exp_ident "e") ])
          in
          B.pexp_function_cases (error_cases @ [ default_case ])
    in
    B.pstr_value Nonrecursive
      [ B.value_binding ~pat:(B.ppat_var (Location.mknoloc "error_to_string")) ~expr:handler_body ]

  let generate_error_handler ~(operation_shape : Ast.Shape.operationShapeDetails)
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t) () =
    let errors = operation_shape.errors |> Option.value ~default:[] in
    let handler_body =
      let protocol_aws_json_module = B.pmod_ident (lident_noloc Modules.protocolAwsJson) in
      let request_func_name =
        B.pexp_ident (Location.mknoloc (make_lident ~names:[ Modules.protocolAwsJson ]))
      in
      let error_default_handler_name =
        B.pexp_ident
          (Location.mknoloc
             (make_lident ~names:[ Modules.protocolAwsJson; "Errors"; "default_handler" ]))
      in
      let call_handler =
        [%expr
          [%e request_func_name].(error_deserializer
                                    (handler [%e error_default_handler_name])
                                    tree path)]
      in
      if List.length errors > 0 then begin
        let failure_cases =
          [
            B.case
              ~lhs:(B.ppat_var (Location.mknoloc "_type"))
              ~guard:None ~rhs:[%expr handler tree path _type];
          ]
        in
        let cases =
          errors
          |> List.map ~f:(fun error ->
                 let _, exc_name = Util.symbolPair error in
                 let pattern = B.ppat_tuple [ B.ppat_any; pat_const_str exc_name ] in
                 let deserialiser_func_name =
                   B.pexp_ident
                     (Location.mknoloc (Deserialiser.external_func_name ~namespace_resolver error))
                 in
                 let expression =
                   B.pexp_variant
                     (SafeNames.safeConstructorName error)
                     (Some [%expr [%e deserialiser_func_name] tree path])
                 in
                 B.case ~lhs:pattern ~guard:None ~rhs:expression)
        in
        let matchers = B.pexp_function_cases (cases @ failure_cases) in

        [%expr
          (* let open Json_deserializers in *)
          let handler = fun handler tree path -> [%e matchers] in
          [%e call_handler]]
      end
      else
        [%expr
          let handler a = a in
          [%e call_handler]]
    in
    [%stri let error_deserializer tree path = [%e handler_body]]

  let generate_request_handler ~name ~operation_name
      ~(operation_shape : Ast.Shape.operationShapeDetails) ~alias_context
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t) () =
    let shape_func_body =
      let input =
        operation_shape.input
        |> Option.value_map ~default:[%expr `Assoc ()] ~f:(fun input ->
               B.pexp_apply
                 (B.pexp_ident
                    (Location.mknoloc (Serialiser.external_func_name ~namespace_resolver input)))
                 [ (Nolabel, exp_ident "request") ])
      in
      let service_shape = Util.symbolName name ^ "." ^ Util.symbolName operation_name in
      let response_shape_deserializer =
        operation_shape.output
        |> Option.map ~f:(fun output -> Deserialiser.external_func_name ~namespace_resolver output)
        |> Option.value ~default:(Longident.Lident "base_unit_of_yojson")
      in
      (* Fmt.pr "response_shape_deserializer: %a %a\n%!" (Fmt.list Fmt.string) *)
      (* (Longident.flatten response_shape_deserializer) *)
      (* (Fmt.option Fmt.string) operation_shape.output; *)
      let request_func_name =
        B.pexp_ident (Location.mknoloc (make_lident ~names:[ Modules.protocolAwsJson; "request" ]))
      in
      [%expr
        let input = [%e input] in
        [%e request_func_name] ~shape_name:[%e const_str service_shape] ~service ~context ~input
          ~output_deserializer:[%e B.pexp_ident (Location.mknoloc response_shape_deserializer)]
          ~error_deserializer]
    in

    let shape_func =
      Option.value_map operation_shape.input ~default:shape_func_body ~f:(fun input_name ->
          B.pexp_fun Nolabel None
            (B.ppat_constraint
               (B.ppat_var (Location.mknoloc "request"))
               (Types.resolve alias_context ~name:input_name ~namespace_resolver ()))
            shape_func_body)
    in
    [%stri let request = fun context -> [%e shape_func]]

  let generate_operation_module ~name ~operation_name ~operation_shape ~dependencies ~alias_context
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t) () =
    let module_name = SafeNames.safeConstructorName operation_name in
    let request_handler =
      generate_request_handler ~name ~operation_name ~operation_shape ~alias_context
        ~namespace_resolver ()
    in
    let error_handler = generate_error_handler ~operation_shape ~namespace_resolver () in
    let error_to_string = generate_error_to_string ~operation_shape ~namespace_resolver () in
    let module_items = [ error_to_string; error_handler; request_handler ] in
    let module_expr = B.pmod_structure module_items in
    B.pstr_module (B.module_binding ~name:(Location.mknoloc (Some module_name)) ~expr:module_expr)

  let generate_error_constructor_list alias_ctx errors ~namespace_resolver () =
    let smaws_lib_constructor =
      [
        B.rinherit
          (B.ptyp_constr
             (Location.mknoloc
                (make_lident ~names:[ "Smaws_Lib"; "Protocols"; "AwsJson"; "error" ]))
             []);
      ]
    in
    smaws_lib_constructor
    @ (errors |> Option.value ~default:[]
      |> List.map ~f:(fun error ->
             let name = SafeNames.safeConstructorName error in
             B.rtag (lstr_noloc name) false
               [ Types.resolve alias_ctx ~name:error ~namespace_resolver () ]))

  let generate_error_type alias_ctx errors
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t) () =
    generate_error_constructor_list alias_ctx errors ~namespace_resolver () |> fun constructors ->
    B.ptyp_variant constructors Open None

  let generate_error_to_string_type alias_ctx errors
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t) () =
    generate_error_constructor_list alias_ctx errors ~namespace_resolver () |> fun constructors ->
    B.ptyp_variant constructors Closed None

  let generate_operation_module_sig ~name ~operation_name ~operation_shape ~dependencies
      ~alias_context ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t) () =
    let open Ast.Shape in
    let module_name = SafeNames.safeConstructorName operation_name in
    let input_type =
      operation_shape.input
      |> Option.value_map
           ~f:(fun input -> Types.resolve alias_context ~name:input ~namespace_resolver ())
           ~default:(B.ptyp_constr (lident_noloc "unit") [])
    in
    let output_type =
      operation_shape.output
      |> Option.value_map
           ~f:(fun output -> Types.resolve alias_context ~name:output ~namespace_resolver ())
           ~default:(B.ptyp_constr (lident_noloc "unit") [])
    in

    let exception_type =
      generate_error_type alias_context operation_shape.errors ~namespace_resolver ()
    in

    let doc_string = Docs.convert_docs operation_shape.traits in
    B.psig_module
      (B.module_declaration
         ~name:(Location.mknoloc (Some module_name))
         ~type_:
           (B.pmty_signature
              [%sig:
                val error_to_string :
                  [%t
                    generate_error_to_string_type alias_context operation_shape.errors
                      ~namespace_resolver ()] ->
                  string

                val request :
                  'http_type Smaws_Lib.Context.t ->
                  [%t input_type] ->
                  ([%t output_type], [%t exception_type]) result]))
    |> Docs.attach_doc_to_signature_item ~loc ~doc_string

  let generate ~name ~operation_shapes ~alias_context
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t) () =
    operation_shapes
    |> List.map ~f:(fun (operation_name, operation_shape, dependencies) ->
           generate_operation_module ~name ~operation_name ~operation_shape ~dependencies
             ~alias_context ~namespace_resolver ())

  let generate_mli ~name ~operation_shapes ~alias_context
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t) () =
    operation_shapes
    |> List.map ~f:(fun (operation_name, operation_shape, dependencies) ->
           generate_operation_module_sig ~name ~operation_name ~operation_shape ~dependencies
             ~alias_context ~namespace_resolver ())
end
