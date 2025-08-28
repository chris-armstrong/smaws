open Base

type t = (string, Ppxlib.core_type) Hashtbl.t

module B = Ppxlib.Ast_builder.Make (struct
  let loc = Location.none
end)

let loc = Location.none

let type_name ~is_exception_type name =
  Fmt.str "%s%s" (SafeNames.safeTypeName name) (if is_exception_type then "" else "")

(** Construct an identifier for type `name`. This method should not be used directly - go through
    resolve or resolve_for_target (unless you already know the type's resolution is this name and
    not the resolution of an alias) *)
let type_ident ctx ~name
    ?(namespace_resolver : Namespace_resolver.Namespace_resolver.t option = None) () =
  let resolved_name =
    match namespace_resolver with
    | Some resolver -> Namespace_resolver.Namespace_resolver.resolve_reference resolver name
    | None -> Util.symbolName name
  in
  let base_ident = Longident.Lident (SafeNames.safeTypeName resolved_name) in
  B.ptyp_constr (Location.mknoloc base_ident) []

(** Using the aliasing context, resolve the type for the specified name *)
let resolve ctx ~name ?(namespace_resolver : Namespace_resolver.Namespace_resolver.t option = None)
    () =
  let resolution =
    Hashtbl.find ctx name
    |> Option.value_or_thunk ~default:(fun () -> type_ident ctx ~name ~namespace_resolver ())
  in
  (* Fmt.pr "Resolving %s -> %a\n" name Ppxlib_ast.Pprintast.core_type resolution; *)
  resolution

(** Use the aliasing context to resolve the type for the specified name, using `traits` to determine
    optionality via the `required` trait *)
let resolve_for_target ctx ~name ~traits
    ?(namespace_resolver : Namespace_resolver.Namespace_resolver.t option = None) () =
  let resolution =
    Hashtbl.find ctx name
    |> Option.value_or_thunk ~default:(fun () -> type_ident ctx ~name ~namespace_resolver ())
  in
  (* Fmt.pr "Resolving %s -> %a\n" name Ppxlib_ast.Pprintast.core_type resolution; *)
  let is_required = Ast.Trait.(hasTrait traits isRequiredTrait) in
  if is_required then resolution
  else B.ptyp_constr (Location.mknoloc (Longident.Lident "option")) [ resolution ]

let make_basic_type_manifest ctx descriptor
    ?(namespace_resolver : Namespace_resolver.Namespace_resolver.t option = None) () =
  let open Ast.Shape in
  match descriptor with
  | BigDecimalShape { traits; _ } -> [%type: Bigdecimal.t]
  | BigIntegerShape { traits; _ } -> [%type: Big_int.big_int]
  | ByteShape { traits; _ } -> [%type: int]
  | ShortShape { traits; _ } -> [%type: int]
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
      let basic_type = resolve ctx ~name:target ~namespace_resolver () in
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
  | StructureShape { members = []; _ } -> [%type: unit]
  | _ ->
      failwith
        (Fmt.str "non-basic target not supported: %a" Ast.Shape.pp_shapeDescriptor descriptor)

let manifest_type ~name ~manifest ~is_exception_type =
  B.type_declaration
    ~name:(Location.mknoloc (type_name ~is_exception_type name))
    ~params:[] ~cstrs:[] ~kind:Ptype_abstract ~private_:Public ~manifest:(Some manifest)

let type_declaration ~name ~is_exception_type ~kind
    ?(manifest : Ppxlib.Parsetree.core_type option = None) ~doc_string () =
  let open Ppxlib.Parsetree in
  {
    ptype_name = Location.mknoloc (type_name ~is_exception_type name);
    ptype_params = [];
    ptype_cstrs = [];
    ptype_kind = kind;
    ptype_private = Public;
    ptype_manifest = manifest;
    ptype_loc = loc;
    ptype_attributes = [ Docs.create_doc_attr ~loc doc_string ];
  }

let label_declaration ~name ~type_ ~doc_string =
  Ppxlib.
    {
      pld_name = name;
      pld_mutable = Immutable;
      pld_type = type_;
      pld_loc = loc;
      pld_attributes = [ Docs.create_doc_attr ~loc doc_string ];
    }

let type_constructor ?res ?doc_string ~name ~args () =
  Ppxlib.
    {
      pcd_name = name;
      pcd_vars = [];
      pcd_args = args;
      pcd_res = res;
      pcd_loc = loc;
      pcd_attributes =
        Option.map doc_string ~f:(fun doc_string -> [ Docs.create_doc_attr ~loc doc_string ])
        |> Option.value ~default:[];
    }

let empty_type_constructor ~name ~traits =
  let doc_string = Docs.convert_docs traits in
  type_constructor
    ~name:(Location.mknoloc (SafeNames.safeConstructorName name))
    ~args:(Pcstr_tuple []) ~doc_string ()

let make_complex_type_declaration ctx ~name ~(descriptor : Ast.Shape.shapeDescriptor)
    ?(namespace_resolver : Namespace_resolver.Namespace_resolver.t option = None) () =
  let open Ast.Shape in
  let is_exception_type =
    match descriptor with
    | StructureShape s when Ast.Trait.(hasTrait s.traits isErrorTrait) -> true
    | _ -> false
  in
  match descriptor with
  | StructureShape { members = []; _ } ->
      manifest_type ~name ~manifest:[%type: unit] ~is_exception_type
  | StructureShape { members; traits } ->
      let structure_members =
        members
        |> List.map ~f:(fun ({ name; target; traits } : member) ->
               let doc_string = Docs.convert_docs traits in
               label_declaration
                 ~name:(Location.mknoloc (SafeNames.safeMemberName name))
                 ~type_:(resolve_for_target ctx ~name:target ~traits ~namespace_resolver ())
                 ~doc_string)
      in
      let doc_string = Docs.convert_docs traits in

      type_declaration ~name ~is_exception_type ~kind:(Ptype_record structure_members) ~doc_string
        ()
  | EnumShape { traits; members } ->
      let enum_members =
        members
        |> List.map ~f:(fun ({ name; traits; _ } : member) -> empty_type_constructor ~name ~traits)
      in

      let doc_string = Docs.convert_docs traits in

      type_declaration ~name ~is_exception_type ~kind:(Ptype_variant enum_members) ~doc_string ()
  | MapShape { traits; mapKey; mapValue } ->
      let key_type = resolve ctx ~name:mapKey.target ~namespace_resolver () in
      let value_type = resolve ctx ~name:mapValue.target ~namespace_resolver () in
      let tuple = B.ptyp_tuple [ key_type; value_type ] in
      let list_type = B.ptyp_constr (Location.mknoloc (Longident.Lident "list")) [ tuple ] in

      let doc_string = Docs.convert_docs traits in
      type_declaration ~name ~is_exception_type ~kind:Ptype_abstract ~manifest:(Some list_type)
        ~doc_string ()
  | UnionShape { traits; members } ->
      let union_members =
        members
        |> List.map ~f:(fun ({ name; target; traits } : member) ->
               let doc_string = Docs.convert_docs traits in
               type_constructor
                 ~name:(Location.mknoloc (SafeNames.safeConstructorName name))
                 ~args:(Pcstr_tuple [ resolve ctx ~name:target ~namespace_resolver () ])
                 ~doc_string ())
      in

      let doc_string = Docs.convert_docs traits in
      type_declaration ~name ~kind:(Ptype_variant union_members) ~is_exception_type ~doc_string ()
  | _ -> failwith (Fmt.str "non-complex target not supported: %s" name)

let create_alias_context shapes : t =
  let tbl = Hashtbl.create ~growth_allowed:true ~size:(List.length shapes / 2) (module String) in
  List.iter
    ~f:(fun Ast.Shape.{ name; descriptor; _ } ->
      match descriptor with
      | UnitShape | ByteShape _ | ListShape _ | BlobShape _ | BooleanShape _ | IntegerShape _
      | StringShape _ | BigIntegerShape _ | BigDecimalShape _ | ResourceShape | TimestampShape _
      | ShortShape _ | LongShape _ | FloatShape _ | DoubleShape _ | SetShape _ | DocumentShape
      | StructureShape { members = []; _ } ->
          let alias = make_basic_type_manifest tbl descriptor () in
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

let generate_type_target ctx name descriptor
    ?(namespace_resolver : Namespace_resolver.Namespace_resolver.t option = None) () =
  let open Ast.Shape in
  match descriptor with
  (* basic types are aliased and don't require separate declaration *)
  | UnitShape | ByteShape _ | ShortShape _ | ListShape _ | BlobShape _ | BooleanShape _
  | IntegerShape _ | StringShape _ | BigIntegerShape _ | BigDecimalShape _ | ResourceShape
  | TimestampShape _ | LongShape _ | FloatShape _ | DoubleShape _ | SetShape _ | DocumentShape ->
      None
  (* service shapes and operation shapes are not of interest to type generation (yet) *)
  | ServiceShape _ | OperationShape _ -> None
  | StructureShape { members = []; _ } -> None
  | _ -> Some (make_complex_type_declaration ctx ~name ~descriptor ~namespace_resolver ())

let str_deriving_attributes () =
  [
    B.attribute ~name:(Location.mknoloc "deriving") ~payload:(PStr [%str show]);
    B.attribute ~name:(Location.mknoloc "deriving") ~payload:(PStr [%str eq]);
  ]

let stri_structure_shapes ?(with_derivings = false)
    ?(namespace_resolver : Namespace_resolver.Namespace_resolver.t option = None) ctx
    structure_shapes fmt =
  structure_shapes
  |> List.filter_map ~f:(function
       | Ast.Dependencies.{ recursWith = Some recursItems; name; descriptor; _ } ->
           let items =
             Ast.Dependencies.{ name; descriptor; targets = []; recursWith = None } :: recursItems
           in
           let filtered_items =
             List.filter_map
               ~f:(fun item ->
                 generate_type_target ctx item.name item.descriptor ~namespace_resolver ())
               items
           in
           let attributed_items =
             filtered_items
             |> List.map ~f:(fun tt ->
                    match with_derivings with
                    | true ->
                        Ppxlib_ast.Ast.
                          {
                            tt with
                            ptype_attributes = tt.ptype_attributes @ str_deriving_attributes ();
                          }
                    | _ -> tt)
           in
           if List.length attributed_items > 0 then
             Some
               Ppxlib_ast.Parsetree.
                 { pstr_loc = Location.none; pstr_desc = Pstr_type (Recursive, attributed_items) }
           else failwith (Fmt.str "no complex structured items in bundle: %s" name)
       | Ast.Dependencies.{ name; descriptor; _ } ->
           let type_declaration = generate_type_target ctx name descriptor ~namespace_resolver () in

           type_declaration
           |> Option.map ~f:(fun type_declaration ->
                  let filtered_declaration =
                    if with_derivings then
                      Ppxlib.Ast.
                        {
                          type_declaration with
                          ptype_attributes =
                            type_declaration.ptype_attributes @ str_deriving_attributes ();
                        }
                    else type_declaration
                  in

                  B.pstr_type Nonrecursive [ filtered_declaration ]))

let sigi_structure_shapes ?(with_derivings = false)
    ?(namespace_resolver : Namespace_resolver.Namespace_resolver.t option = None) ctx
    structure_shapes fmt =
  structure_shapes
  |> List.filter_map ~f:(function
       | Ast.Dependencies.{ recursWith = Some recursItems; name; descriptor; _ } ->
           let items =
             Ast.Dependencies.{ name; descriptor; targets = []; recursWith = None } :: recursItems
           in
           let filtered_items =
             List.filter_map
               ~f:(fun item ->
                 generate_type_target ctx item.name item.descriptor ~namespace_resolver ())
               items
           in

           if List.length filtered_items > 0 then Some (B.psig_type Recursive filtered_items)
           else failwith (Fmt.str "no complex structured items in bundle: %s" name)
       | Ast.Dependencies.{ name; descriptor; _ } ->
           let type_declaration = generate_type_target ctx name descriptor ~namespace_resolver () in

           type_declaration
           |> Option.map ~f:(fun type_declaration -> B.psig_type Nonrecursive [ type_declaration ]))
