open Base

type t = (string, Ppxlib.core_type) Hashtbl.t

module B = Ppxlib.Ast_builder.Make (struct
  let loc = Location.none
end)

let loc = Location.none

(** Construct an identifier for type `name`. This method should not be used directly - go through
    resolve or resolve_for_target (unless you already know the type's resolution is this name and
    not the resolution of an alias) *)
let type_ident ctx ~name =
  let base_ident = Longident.Lident (SafeNames.safeTypeName name) in
  B.ptyp_constr (Location.mknoloc base_ident) []

(** Using the aliasing context, resolve the type for the specified name *)
let resolve ctx ~name =
  let resolution =
    Hashtbl.find ctx name |> Option.value_or_thunk ~default:(fun () -> type_ident ctx ~name)
  in
  (* Fmt.pr "Resolving %s -> %a\n" name Ppxlib_ast.Pprintast.core_type resolution; *)
  resolution

(** Use the aliasing context to resolve the type for the specified name, using `traits` to determine
    optionality via the `required` trait *)
let resolve_for_target ctx ~name ~traits =
  let resolution =
    Hashtbl.find ctx name |> Option.value_or_thunk ~default:(fun () -> type_ident ctx ~name)
  in
  (* Fmt.pr "Resolving %s -> %a\n" name Ppxlib_ast.Pprintast.core_type resolution; *)
  let is_required = Ast.Trait.(hasTrait traits isRequiredTrait) in
  if is_required then resolution
  else B.ptyp_constr (Location.mknoloc (Longident.Lident "option")) [ resolution ]

let make_basic_type_manifest ctx descriptor =
  let open Ast.Shape in
  match descriptor with
  | BigDecimalShape { traits; _ } -> [%type: Bigdecimal.t]
  | BigIntegerShape { traits; _ } -> [%type: Big_int.big_int]
  | BlobShape { traits; _ } -> [%type: bytes]
  | BooleanShape { traits; _ } -> [%type: bool]
  | DocumentShape -> [%type: CoreTypes.Document.t]
  | FloatShape { traits; _ } | DoubleShape { traits; _ } -> [%type: float]
  | LongShape { traits; _ } | IntegerShape { traits; _ } -> [%type: int]
  | StringShape { traits; _ } -> [%type: string]
  | SetShape { target; traits } | ListShape { target; traits; _ } ->
      (* List types are considered "dense" by default, which means they do not contain null values. However,
         if they have the "sparse" trait, they may have null values.

         This means we need to use the basic resolver (that ignores the traits), and resolve optionality
         ourselves *)
      let basic_type = resolve ctx ~name:target in
      let is_sparse = Ast.Trait.(hasTrait traits isSparseTrait) in
      let resolved_type =
        if is_sparse then
          B.ptyp_constr (Location.mknoloc (Longident.Lident "option")) [ basic_type ]
        else basic_type
      in
      B.ptyp_constr (Location.mknoloc (Longident.Lident "list")) [ resolved_type ]
  | TimestampShape { traits; _ } -> [%type: CoreTypes.Timestamp.t]
  | UnitShape -> [%type: unit]
  | ResourceShape -> [%type: CoreTypes.Resource.t]
  | _ ->
      failwith
        (Fmt.str "non-basic target not supported: %a" Ast.Shape.pp_shapeDescriptor descriptor)

let manifest_type ~name ~manifest ~is_exception_type =
  B.type_declaration
    ~name:(Location.mknoloc (Types.type_name ~is_exception_type name))
    ~params:[] ~cstrs:[] ~kind:Ptype_abstract ~private_:Public ~manifest:(Some manifest)

let empty_type_constructor ~name =
  B.constructor_declaration
    ~name:(Location.mknoloc (SafeNames.safeConstructorName name))
    ~args:(Pcstr_tuple []) ~res:None

let make_complex_type_declaration ctx ~name ~(descriptor : Ast.Shape.shapeDescriptor) =
  let open Ast.Shape in
  let is_exception_type =
    match descriptor with
    | StructureShape s when Ast.Trait.(hasTrait s.traits isErrorTrait) -> true
    | _ -> false
  in
  match descriptor with
  | StructureShape { members = []; _ } ->
      manifest_type ~name ~manifest:[%type: unit] ~is_exception_type
  | StructureShape { members; _ } ->
      let structure_members =
        members
        |> List.map ~f:(fun ({ name; target; traits } : member) ->
               B.label_declaration
                 ~name:(Location.mknoloc (SafeNames.safeMemberName name))
                 ~mutable_:Immutable
                 ~type_:(resolve_for_target ctx ~name:target ~traits))
      in

      B.type_declaration
        ~name:(Location.mknoloc (Types.type_name ~is_exception_type name))
        ~params:[] ~cstrs:[] ~kind:(Ptype_record structure_members) ~private_:Public ~manifest:None
  | EnumShape { traits; members } ->
      let enum_members =
        members |> List.map ~f:(fun ({ name; _ } : member) -> empty_type_constructor ~name)
      in

      B.type_declaration
        ~name:(Location.mknoloc (Types.type_name ~is_exception_type name))
        ~params:[] ~cstrs:[] ~kind:(Ptype_variant enum_members) ~private_:Public ~manifest:None
      (* | UnionShape { traits; _ } -> *)
  | MapShape { traits; mapKey; mapValue } ->
      let key_type = resolve ctx ~name:mapKey.target in
      let value_type = resolve ctx ~name:mapValue.target in
      let tuple = B.ptyp_tuple [ key_type; value_type ] in
      let list_type = B.ptyp_constr (Location.mknoloc (Longident.Lident "list")) [ tuple ] in

      B.type_declaration
        ~name:(Location.mknoloc (Types.type_name ~is_exception_type name))
        ~params:[] ~cstrs:[] ~kind:Ptype_abstract ~private_:Public ~manifest:(Some list_type)
  | UnionShape { traits; members } ->
      let union_members =
        members
        |> List.map ~f:(fun ({ name; target; traits } : member) ->
               B.constructor_declaration
                 ~name:(Location.mknoloc (SafeNames.safeConstructorName name))
                 ~args:(Pcstr_tuple [ resolve ctx ~name:target ])
                 ~res:None)
      in

      B.type_declaration
        ~name:(Location.mknoloc (Types.type_name ~is_exception_type name))
        ~params:[] ~cstrs:[] ~kind:(Ptype_variant union_members) ~private_:Public ~manifest:None
  | _ -> failwith (Fmt.str "non-complex target not supported: %s" name)

let create_alias_context shapes : t =
  let tbl = Hashtbl.create ~growth_allowed:true ~size:(List.length shapes / 2) (module String) in
  List.iter
    ~f:(fun Ast.Shape.{ name; descriptor; _ } ->
      match descriptor with
      | UnitShape | ListShape _ | BlobShape _ | BooleanShape _ | IntegerShape _ | StringShape _
      | BigIntegerShape _ | BigDecimalShape _ | ResourceShape | TimestampShape _ | LongShape _
      | FloatShape _ | DoubleShape _ | SetShape _ | DocumentShape ->
          let alias = make_basic_type_manifest tbl descriptor in
          (* Fmt.pr "Aliasing %s -> %a\n" name Ppxlib.Pprintast.core_type alias; *)
          ignore (Hashtbl.add ~key:name ~data:alias tbl)
      | _ -> ())
    shapes;
  tbl

let determine_exception_type descriptor =
  match descriptor with
  | Ast.Shape.StructureShape s when Ast.Trait.(hasTrait s.traits isErrorTrait) -> true
  | _ -> false

let const_str s = B.pexp_constant (Pconst_string (s, loc, None))

let stri_service_metadata (service : Ast.Shape.serviceShapeDetails) =
  let traits = Option.value service.traits ~default:[] in
  let serviceDetails =
    List.find_map_exn traits ~f:(function Ast.Trait.ServiceTrait x -> Some x | _ -> None)
  in
  let protocol_expr =
    List.find_map_exn traits ~f:(function
      | Ast.Trait.AwsProtocolAwsJson1_0Trait -> Some [%expr Smaws_Lib.Service.AwsJson_1_0]
      | Ast.Trait.AwsProtocolAwsJson1_1Trait -> Some [%expr Smaws_Lib.Service.AwsJson_1_1]
      | _ -> None)
  in
  let namespace_expr = const_str (Option.value serviceDetails.arnNamespace ~default:"<blank>") in
  let endpointPrefix_expr =
    const_str (Option.value serviceDetails.endpointPrefix ~default:"<blank>")
  in
  let version_expr = const_str service.version in

  let service_expr =
    [%expr
      Smaws_Lib.Service.
        {
          namespace = [%e namespace_expr];
          endpointPrefix = [%e endpointPrefix_expr];
          version = [%e version_expr];
          protocol = [%e protocol_expr];
        }]
  in
  let service_metadata_letop = [%stri let service = [%e service_expr]] in
  service_metadata_letop

let sigi_service_metadata service = [%sigi: val service : Smaws_Lib.Service.descriptor]

let generate_type_target ctx name descriptor =
  let open Ast.Shape in
  match descriptor with
  (* basic types are aliased and don't require separate declaration *)
  | UnitShape | ListShape _ | BlobShape _ | BooleanShape _ | IntegerShape _ | StringShape _
  | BigIntegerShape _ | BigDecimalShape _ | ResourceShape | TimestampShape _ | LongShape _
  | FloatShape _ | DoubleShape _ | SetShape _ | DocumentShape ->
      None
  (* service shapes and operation shapes are not of interest to type generation (yet) *)
  | ServiceShape _ | OperationShape _ -> None
  | _ -> Some (make_complex_type_declaration ctx ~name ~descriptor)

let stri_structure_shapes ctx structure_shapes fmt =
  structure_shapes
  |> List.filter_map ~f:(function
       | Ast.Dependencies.{ recursWith = Some recursItems; name; descriptor; _ } ->
           let items =
             Ast.Dependencies.{ name; descriptor; targets = []; recursWith = None } :: recursItems
           in
           let filtered_items =
             List.filter_map
               ~f:(fun item -> generate_type_target ctx item.name item.descriptor)
               items
           in
           if List.length filtered_items > 0 then Some (B.pstr_type Recursive filtered_items)
           else failwith (Fmt.str "no complex structured items in bundle: %s" name)
       | Ast.Dependencies.{ name; descriptor; _ } ->
           let type_declaration = generate_type_target ctx name descriptor in

           type_declaration
           |> Option.map ~f:(fun type_declaration -> B.pstr_type Nonrecursive [ type_declaration ]))

let sigi_structure_shapes ctx structure_shapes fmt =
  structure_shapes
  |> List.filter_map ~f:(function
       | Ast.Dependencies.{ recursWith = Some recursItems; name; descriptor; _ } ->
           let items =
             Ast.Dependencies.{ name; descriptor; targets = []; recursWith = None } :: recursItems
           in
           let filtered_items =
             List.filter_map
               ~f:(fun item -> generate_type_target ctx item.name item.descriptor)
               items
           in
           if List.length filtered_items > 0 then Some (B.psig_type Recursive filtered_items)
           else failwith (Fmt.str "no complex structured items in bundle: %s" name)
       | Ast.Dependencies.{ name; descriptor; _ } ->
           let type_declaration = generate_type_target ctx name descriptor in

           type_declaration
           |> Option.map ~f:(fun type_declaration -> B.psig_type Nonrecursive [ type_declaration ]))
