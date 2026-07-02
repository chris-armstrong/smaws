open Base
open Ppx_util
module Ast = Smithy_ast
open Ast
module Longident = Ppx_longident

module B = Ppxlib.Ast_builder.Make (struct
  let loc = Location.none
end)

let loc = Location.none

(* ============================================================ *)
(* Shared helpers *)
(* ============================================================ *)

let xml_name (traits : Trait.t list option) default =
  Option.value ~default
    (Option.bind traits ~f:(fun ts ->
         List.find_map ts ~f:(function Trait.XmlNameTrait n -> Some n | _ -> None)))

let is_flattened (traits : Trait.t list option) =
  match traits with
  | None -> false
  | Some ts -> List.exists ts ~f:(function Trait.XmlFlattenedTrait -> true | _ -> false)

(* AwsQuery default timestamp format is date-time *)
let resolve_timestamp_format ?(member_traits : Trait.t list option = None)
    ?(shape_traits : Trait.t list option = None) () =
  let find_fmt traits =
    Option.bind traits ~f:(fun ts ->
        List.find_map ts ~f:(function Trait.TimestampFormatTrait x -> Some x | _ -> None))
  in
  match find_fmt member_traits with
  | Some f -> f
  | None -> (
      match find_fmt shape_traits with Some f -> f | None -> Trait.TimestampFormatDateTime)

let unit_expr = B.pexp_construct (lident_noloc "()") None

(* ============================================================ *)
(* Serialiser *)
(* ============================================================ *)

module Serialiser = struct
  let serialiser_func_str name = (name |> SafeNames.safeFunctionName) ^ "_to_query"
  let serialize_mod = [ "Smaws_Lib"; "Protocols"; "AwsQuery"; "Serialize" ]

  let serialize_call func args =
    B.pexp_apply
      (B.pexp_ident (Location.mknoloc (make_lident ~names:(serialize_mod @ [ func ]))))
      args

  (* Build: List.append <path_expr> ["key"] *)
  let path_append path_expr key =
    B.pexp_apply
      (B.pexp_ident (Location.mknoloc (make_lident ~names:[ "List"; "append" ])))
      [ (Nolabel, path_expr); (Nolabel, B.elist [ const_str key ]) ]

  let path_ident = exp_ident "path"

  (* For a primitive smithy type, return the Serialize helper name or None *)
  let primitive_serialize_helper ?(member_traits : Trait.t list option = None)
      ?(shape_traits : Trait.t list option = None) target_name =
    match target_name with
    | "smithy.api#String" | "smithy.api#Unit" -> Some "string_field"
    | "smithy.api#Integer" | "smithy.api#Byte" | "smithy.api#Short" | "smithy.api#Long"
    | "smithy.api#BigInteger" ->
        Some "int_field"
    | "smithy.api#Boolean" -> Some "bool_field"
    | "smithy.api#Float" | "smithy.api#Double" | "smithy.api#BigDecimal" -> Some "float_field"
    | "smithy.api#Blob" -> Some "blob_field"
    | "smithy.api#Timestamp" ->
        let fmt = resolve_timestamp_format ~member_traits ~shape_traits () in
        Some
          (match fmt with
          | Trait.TimestampFormatDateTime -> "timestamp_iso_field"
          | Trait.TimestampFormatEpochSeconds -> "timestamp_epoch_field"
          | Trait.TimestampFormatHttpDate -> "timestamp_httpdate_field")
    | _ -> None

  (* Generate the function name (as Longident) for a target shape's serializer *)
  let func_longident ~namespace_resolver target_name =
    let symbol_transformer ~local x =
      if local then [ serialiser_func_str x ] else [ "Query_serializers"; serialiser_func_str x ]
    in
    Namespace_resolver.Namespace_resolver.resolve_reference ~symbol_transformer namespace_resolver
      target_name
    |> Longident.unflatten |> Option.value_exn

  (* Generate an element serializer expression: fun path v -> serialize v at path *)
  let item_serializer_expr ~namespace_resolver ?(member_traits = None) ?(shape_traits = None)
      target_name =
    match primitive_serialize_helper ~member_traits ~shape_traits target_name with
    | Some helper ->
        (* fun p v -> Serialize.helper p v *)
        B.pexp_fun Nolabel None
          (B.ppat_var (Location.mknoloc "p"))
          (B.pexp_fun Nolabel None
             (B.ppat_var (Location.mknoloc "v"))
             (serialize_call helper [ (Nolabel, exp_ident "p"); (Nolabel, exp_ident "v") ]))
    | None ->
        (* Reference to the complex type's _to_query function *)
        B.pexp_ident (Location.mknoloc (func_longident ~namespace_resolver target_name))

  (* Generate value expression for a member at a given path.
     Returns: expr that produces (string * string list) list *)
  let member_value_expr ~namespace_resolver ~shape_resolver ~member_traits ~shape_traits ~path_expr
      value_expr target_name =
    match
      primitive_serialize_helper ~member_traits:(Some member_traits)
        ~shape_traits:(Some shape_traits) target_name
    with
    | Some helper -> serialize_call helper [ (Nolabel, path_expr); (Nolabel, value_expr) ]
    | None -> (
        (* Look up the shape to handle flattened lists/maps specially *)
        let shape = Shape_resolver.find_shape_by_name ~name:target_name shape_resolver in
        match shape with
        | Some (Shape.ListShape ls) when is_flattened (Some member_traits) ->
            (* flattened list: call flattened_list_to_query with element serializer *)
            let member_tag = xml_name ls.memberTraits "member" in
            ignore member_tag;
            (* flattened lists don't use member_tag *)
            let elem_f = item_serializer_expr ~namespace_resolver ls.target in
            serialize_call "flattened_list_to_query"
              [ (Nolabel, elem_f); (Nolabel, path_expr); (Nolabel, value_expr) ]
        | Some (Shape.SetShape ss) when is_flattened (Some member_traits) ->
            let elem_f = item_serializer_expr ~namespace_resolver ss.target in
            serialize_call "flattened_list_to_query"
              [ (Nolabel, elem_f); (Nolabel, path_expr); (Nolabel, value_expr) ]
        | Some (Shape.MapShape ms) when is_flattened (Some member_traits) ->
            let key_tag = xml_name ms.mapKey.traits "key" in
            let val_tag = xml_name ms.mapValue.traits "value" in
            let key_f = item_serializer_expr ~namespace_resolver ms.mapKey.target in
            let val_f = item_serializer_expr ~namespace_resolver ms.mapValue.target in
            serialize_call "flattened_map_to_query"
              [
                (Nolabel, const_str key_tag);
                (Nolabel, const_str val_tag);
                (Nolabel, key_f);
                (Nolabel, val_f);
                (Nolabel, path_expr);
                (Nolabel, value_expr);
              ]
        | _ ->
            (* Normal complex type: call its _to_query function *)
            B.pexp_apply
              (B.pexp_ident (Location.mknoloc (func_longident ~namespace_resolver target_name)))
              [ (Nolabel, path_expr); (Nolabel, value_expr) ])

  (* Generate expression for a structure member *)
  let generate_member_expr ~namespace_resolver ~shape_resolver (mem : Shape.member) =
    let open Trait in
    let is_required = hasTrait mem.traits isRequiredTrait in
    let xml_key = xml_name mem.traits mem.name in
    let path_expr = path_append path_ident xml_key in
    let field_access =
      B.pexp_field (exp_ident "x") (lident_noloc (SafeNames.safeMemberName mem.name))
    in
    let member_traits = Option.value ~default:[] mem.traits in
    let shape_traits = [] in
    if is_required then
      member_value_expr ~namespace_resolver ~shape_resolver ~member_traits ~shape_traits ~path_expr
        field_access mem.target
    else begin
      let inner_expr v_expr =
        member_value_expr ~namespace_resolver ~shape_resolver ~member_traits ~shape_traits
          ~path_expr v_expr mem.target
      in
      B.pexp_match field_access
        [
          B.case ~lhs:(B.ppat_construct (lident_noloc "None") None) ~guard:None ~rhs:(B.elist []);
          B.case
            ~lhs:(B.ppat_construct (lident_noloc "Some") (Some (B.ppat_var (Location.mknoloc "v"))))
            ~guard:None
            ~rhs:(inner_expr (exp_ident "v"));
        ]
    end

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
               let constructor_name = SafeNames.safeConstructorName m.name in
               B.case
                 ~lhs:(B.ppat_construct (lident_noloc constructor_name) None)
                 ~guard:None
                 ~rhs:
                   (match value with
                   | `String sv -> const_str sv
                   | `Int iv -> B.pexp_apply (exp_ident "string_of_int") [ (Nolabel, exp_int iv) ]))
        )
    in
    let type_name = SafeNames.safeTypeName name in
    exp_fun_untyped "path"
      (B.pexp_fun Nolabel None
         (B.ppat_constraint
            (B.ppat_var (Location.mknoloc "x"))
            (B.ptyp_constr (lident_noloc type_name) []))
         (serialize_call "string_field" [ (Nolabel, path_ident); (Nolabel, match_exp) ]))

  let list_func_body (x : Shape.listShapeDetails) ~namespace_resolver () =
    let member_tag = xml_name x.memberTraits "member" in
    let elem_f = item_serializer_expr ~namespace_resolver x.target in
    exp_fun_untyped "path"
      (exp_fun_untyped "xs"
         (serialize_call "list_to_query"
            [
              (Nolabel, const_str member_tag);
              (Nolabel, elem_f);
              (Nolabel, path_ident);
              (Nolabel, exp_ident "xs");
            ]))

  let set_func_body (x : Shape.setShapeDetails) ~namespace_resolver () =
    let elem_f = item_serializer_expr ~namespace_resolver x.target in
    exp_fun_untyped "path"
      (exp_fun_untyped "xs"
         (serialize_call "list_to_query"
            [
              (Nolabel, const_str "member");
              (Nolabel, elem_f);
              (Nolabel, path_ident);
              (Nolabel, exp_ident "xs");
            ]))

  let map_func_body (x : Shape.mapShapeDetails) ~namespace_resolver () =
    let key_tag = xml_name x.mapKey.traits "key" in
    let val_tag = xml_name x.mapValue.traits "value" in
    let key_f = item_serializer_expr ~namespace_resolver x.mapKey.target in
    let val_f = item_serializer_expr ~namespace_resolver x.mapValue.target in
    exp_fun_untyped "path"
      (exp_fun_untyped "pairs"
         (serialize_call "map_to_query"
            [
              (Nolabel, const_str key_tag);
              (Nolabel, const_str val_tag);
              (Nolabel, key_f);
              (Nolabel, val_f);
              (Nolabel, path_ident);
              (Nolabel, exp_ident "pairs");
            ]))

  let structure_func_body name (descriptor : Shape.structureShapeDetails) ~namespace_resolver
      ~shape_resolver () =
    let type_name = SafeNames.safeTypeName name in
    let is_exception_type = Trait.hasTrait descriptor.traits Trait.isErrorTrait in
    let effective_type_name =
      if is_exception_type then SafeNames.safeTypeName name else type_name
    in
    let member_exprs =
      List.map descriptor.members ~f:(generate_member_expr ~namespace_resolver ~shape_resolver)
    in
    let body = B.pexp_apply (exp_ident "List.concat") [ (Nolabel, B.elist member_exprs) ] in
    exp_fun_untyped "path"
      (B.pexp_fun Nolabel None
         (B.ppat_constraint
            (B.ppat_var (Location.mknoloc "x"))
            (B.ptyp_constr (lident_noloc effective_type_name) []))
         body)

  let generate_func_body (shapeWithTarget : Dependencies.shapeWithTarget)
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t)
      ~(shape_resolver : Shape_resolver.t) () =
    match shapeWithTarget.descriptor with
    | StructureShape { members = []; _ } ->
        Some (exp_fun_untyped "path" (exp_fun_untyped "_x" (B.elist [])))
    | StructureShape x ->
        Some (structure_func_body shapeWithTarget.name x ~namespace_resolver ~shape_resolver ())
    | ListShape x -> Some (list_func_body x ~namespace_resolver ())
    | SetShape x -> Some (set_func_body x ~namespace_resolver ())
    | MapShape x -> Some (map_func_body x ~namespace_resolver ())
    | EnumShape s -> Some (enum_func_body shapeWithTarget.name s)
    | UnionShape _ ->
        (* AwsQuery union serialization not yet implemented; generate a stub *)
        Some (exp_fun_untyped "path" (exp_fun_untyped "_x" (B.elist [])))
    | TimestampShape { traits } ->
        let fmt =
          resolve_timestamp_format ~shape_traits:(Some (Option.value ~default:[] traits)) ()
        in
        let helper =
          match fmt with
          | Trait.TimestampFormatDateTime -> "timestamp_iso_field"
          | Trait.TimestampFormatEpochSeconds -> "timestamp_epoch_field"
          | Trait.TimestampFormatHttpDate -> "timestamp_httpdate_field"
        in
        Some
          (exp_fun_untyped "path"
             (exp_fun_untyped "v"
                (serialize_call helper [ (Nolabel, exp_ident "path"); (Nolabel, exp_ident "v") ])))
    | StringShape { traits } ->
        (* String aliases that carry @timestampFormat need a dedicated serializer *)
        let has_timestamp_fmt =
          Option.value ~default:[] traits
          |> List.exists ~f:(function Trait.TimestampFormatTrait _ -> true | _ -> false)
        in
        if has_timestamp_fmt then (
          let fmt =
            resolve_timestamp_format ~shape_traits:(Some (Option.value ~default:[] traits)) ()
          in
          let helper =
            match fmt with
            | Trait.TimestampFormatDateTime -> "timestamp_iso_field"
            | Trait.TimestampFormatEpochSeconds -> "timestamp_epoch_field"
            | Trait.TimestampFormatHttpDate -> "timestamp_httpdate_field"
          in
          Some
            (exp_fun_untyped "path"
               (exp_fun_untyped "v"
                  (serialize_call helper [ (Nolabel, exp_ident "path"); (Nolabel, exp_ident "v") ]))))
        else None
    | _ -> None

  let generate ~(structure_shapes : Ast.Dependencies.shapeWithTarget list)
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t)
      ~(shape_resolver : Shape_resolver.t) () =
    structure_shapes
    |> List.filter_map ~f:(fun (shapeWithTarget : Dependencies.shapeWithTarget) ->
           let serialiser_name = serialiser_func_str shapeWithTarget.name in
           let func_body =
             generate_func_body shapeWithTarget ~namespace_resolver ~shape_resolver ()
           in
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
                 let recurs =
                   List.filter_map recursWith ~f:(fun (swt : Dependencies.shapeWithTarget) ->
                       let sname = serialiser_func_str swt.name in
                       let fb = generate_func_body swt ~namespace_resolver ~shape_resolver () in
                       Option.map fb ~f:(fun body ->
                           B.value_binding ~pat:(B.ppat_var (Location.mknoloc sname)) ~expr:body))
                 in
                 shape @ recurs
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

(* ============================================================ *)
(* Deserialiser *)
(* ============================================================ *)

module Deserialiser = struct
  let deserialiser_func_str name = (name |> SafeNames.safeFunctionName) ^ "_of_xml"
  let xml_read_mod = [ "Smaws_Lib"; "Xml"; "Parse"; "Read" ]
  let xml_struct_mod = [ "Smaws_Lib"; "Xml"; "Parse"; "Structure" ]

  let xml_call module_path func args =
    B.pexp_apply
      (B.pexp_ident (Location.mknoloc (make_lident ~names:(module_path @ [ func ]))))
      args

  (* Read.element i "tag" () *)
  let read_element tag =
    xml_call xml_read_mod "element"
      [ (Nolabel, exp_ident "i"); (Nolabel, const_str tag); (Nolabel, unit_expr) ]

  (* Read.elements i "tag" () *)
  let read_elements tag =
    xml_call xml_read_mod "elements"
      [ (Nolabel, exp_ident "i"); (Nolabel, const_str tag); (Nolabel, unit_expr) ]

  (* Read.sequence i "tag" (fun i _ -> body) () *)
  let read_sequence tag body =
    xml_call xml_read_mod "sequence"
      [
        (Nolabel, exp_ident "i");
        (Nolabel, const_str tag);
        ( Nolabel,
          B.pexp_fun Nolabel None
            (B.ppat_var (Location.mknoloc "i"))
            (B.pexp_fun Nolabel None B.ppat_any body) );
        (Nolabel, unit_expr);
      ]

  (* Read.sequences i "tag" (fun i _ -> body) () *)
  let read_sequences tag body =
    xml_call xml_read_mod "sequences"
      [
        (Nolabel, exp_ident "i");
        (Nolabel, const_str tag);
        ( Nolabel,
          B.pexp_fun Nolabel None
            (B.ppat_var (Location.mknoloc "i"))
            (B.pexp_fun Nolabel None B.ppat_any body) );
        (Nolabel, unit_expr);
      ]

  (* Read.optionalElement i "tag" () *)
  let read_optional_element tag =
    xml_call xml_read_mod "optionalElement"
      [ (Nolabel, exp_ident "i"); (Nolabel, const_str tag); (Nolabel, unit_expr) ]

  (* skip_element i *)
  let skip_element_expr = xml_call xml_read_mod "skip_element" [ (Nolabel, exp_ident "i") ]

  (* Get the _of_xml function name for a target shape *)
  let func_longident ~namespace_resolver target_name =
    let symbol_transformer ~local x =
      if local then [ deserialiser_func_str x ]
      else [ "Query_deserializers"; deserialiser_func_str x ]
    in
    Namespace_resolver.Namespace_resolver.resolve_reference ~symbol_transformer namespace_resolver
      target_name
    |> Longident.unflatten |> Option.value_exn

  (* Parse a primitive from a raw string expression *)
  let parse_primitive_from_string target_name str_expr =
    match target_name with
    | "smithy.api#String" -> Some str_expr
    | "smithy.api#Integer" | "smithy.api#Byte" | "smithy.api#Short" | "smithy.api#Long"
    | "smithy.api#BigInteger" ->
        Some (B.pexp_apply (exp_ident "int_of_string") [ (Nolabel, str_expr) ])
    | "smithy.api#Boolean" ->
        Some (B.pexp_apply (exp_ident "bool_of_string") [ (Nolabel, str_expr) ])
    | "smithy.api#Float" | "smithy.api#Double" | "smithy.api#BigDecimal" ->
        Some (B.pexp_apply (exp_ident "float_of_string") [ (Nolabel, str_expr) ])
    | "smithy.api#Blob" ->
        Some
          (B.pexp_apply (exp_ident "Bytes.of_string")
             [
               ( Nolabel,
                 B.pexp_apply
                   (B.pexp_ident (Location.mknoloc (make_lident ~names:[ "Base64"; "decode_exn" ])))
                   [ (Nolabel, str_expr) ] );
             ])
    | "smithy.api#Timestamp" ->
        (* Parse ISO 8601 timestamp *)
        Some
          ( B.pexp_apply
              (B.pexp_ident (Location.mknoloc (make_lident ~names:[ "Ptime"; "of_rfc3339" ])))
              [ (Nolabel, str_expr) ]
          |> fun e ->
            B.pexp_apply (exp_ident "Result.get_ok") [ (Nolabel, e) ] |> fun e ->
            B.pexp_let Nonrecursive
              [
                B.value_binding
                  ~pat:(B.ppat_tuple [ B.ppat_var (Location.mknoloc "ts"); B.ppat_any; B.ppat_any ])
                  ~expr:e;
              ]
              (exp_ident "ts") )
    | _ -> None

  (* Body for one map entry: reads <key_tag> then <val_tag> in order, returning (k, v).
     Primitive sides read their wrapper via Read.element; complex sides read it via
     Read.sequence so the wrapper is consumed before the struct/enum reader runs.
     Evaluation is forced left-to-right because OCaml evaluates tuples right-to-left. *)
  let map_entry_body ~namespace_resolver (ms : Shape.mapShapeDetails) =
    let key_tag = xml_name ms.mapKey.traits "key" in
    let val_tag = xml_name ms.mapValue.traits "value" in
    let key_expr =
      match parse_primitive_from_string ms.mapKey.target (read_element key_tag) with
      | Some e -> e
      | None -> read_element key_tag
    in
    let val_expr =
      match parse_primitive_from_string ms.mapValue.target (read_element val_tag) with
      | Some e -> e
      | None ->
          let vf =
            B.pexp_ident (Location.mknoloc (func_longident ~namespace_resolver ms.mapValue.target))
          in
          read_sequence val_tag (B.pexp_apply vf [ (Nolabel, exp_ident "i") ])
    in
    B.pexp_let Nonrecursive
      [ B.value_binding ~pat:(B.ppat_var (Location.mknoloc "k")) ~expr:key_expr ]
      (B.pexp_let Nonrecursive
         [ B.value_binding ~pat:(B.ppat_var (Location.mknoloc "v")) ~expr:val_expr ]
         (B.pexp_tuple [ exp_ident "k"; exp_ident "v" ]))

  (* Reader expression for a member inside scanSequence.
     Returns (tag_name, expr) where expr reads+assigns to the ref.
     For primitives: reads the element text.
     For complex types: reads a sequence. *)
  let member_reader_expr ~namespace_resolver ~shape_resolver ~member_traits xml_tag target_name
      ref_name =
    let assign v_expr =
      B.pexp_apply
        (B.pexp_ident (Location.mknoloc (Longident.Lident ":=")))
        [
          ( Nolabel,
            B.pexp_apply (exp_ident "( ! )") [ (Nolabel, exp_ident ref_name) ] |> fun _ ->
            B.pexp_ident (Location.mknoloc (Longident.Lident ref_name)) );
          (Nolabel, B.pexp_construct (lident_noloc "Some") (Some v_expr));
        ]
    in
    let raw_str_expr = read_element xml_tag in
    match target_name with
    | "smithy.api#Timestamp" ->
        (* The @timestampFormat trait lives on the member for direct smithy.api#Timestamp
           targets; named timestamp shapes are handled via their dedicated _of_xml function
           in the generic branch below. Mirrors the serialiser's member-trait handling. *)
        let fmt = resolve_timestamp_format ~member_traits ~shape_traits:None () in
        let helper =
          match fmt with
          | Trait.TimestampFormatDateTime -> "timestamp_iso_of_string"
          | Trait.TimestampFormatEpochSeconds -> "timestamp_epoch_of_string"
          | Trait.TimestampFormatHttpDate -> "timestamp_httpdate_of_string"
        in
        let deser_mod = [ "Smaws_Lib"; "Protocols"; "AwsQuery"; "Deserialize" ] in
        assign
          (B.pexp_apply
             (B.pexp_ident (Location.mknoloc (make_lident ~names:(deser_mod @ [ helper ]))))
             [ (Nolabel, raw_str_expr) ])
    | _ -> (
        match parse_primitive_from_string target_name raw_str_expr with
        | Some parsed_expr -> assign parsed_expr
        | None -> (
            (* Complex type - look up to determine if list/map/struct *)
            let shape = Shape_resolver.find_shape_by_name ~name:target_name shape_resolver in
            match shape with
            | Some (Shape.ListShape ls) when is_flattened member_traits ->
                (* Flattened list: repeated <xml_tag> elements, each holding a member value
               directly (no member wrapper, no container). *)
                let list_body =
                  match parse_primitive_from_string ls.target (read_element xml_tag) with
                  | Some _ -> (
                      let elements = read_elements xml_tag in
                      match ls.target with
                      | "smithy.api#String" -> elements
                      | _ ->
                          B.pexp_apply
                            (B.pexp_ident (Location.mknoloc (make_lident ~names:[ "List"; "map" ])))
                            [
                              ( Nolabel,
                                B.pexp_fun Nolabel None
                                  (B.ppat_var (Location.mknoloc "s"))
                                  (Option.value_exn
                                     (parse_primitive_from_string ls.target (exp_ident "s"))) );
                              (Nolabel, elements);
                            ])
                  | None ->
                      let item_func =
                        B.pexp_ident
                          (Location.mknoloc (func_longident ~namespace_resolver ls.target))
                      in
                      read_sequences xml_tag (B.pexp_apply item_func [ (Nolabel, exp_ident "i") ])
                in
                assign list_body
            | Some (Shape.ListShape ls) ->
                let member_tag = xml_name ls.memberTraits "member" in
                (* Check if element type is primitive *)
                let list_body =
                  match parse_primitive_from_string ls.target (read_element member_tag) with
                  | Some _ -> (
                      (* List of primitives: Read.elements *)
                      let elements = read_elements member_tag in
                      (* Map elements to parsed values *)
                      match ls.target with
                      | "smithy.api#String" -> elements
                      | _ ->
                          B.pexp_apply
                            (B.pexp_ident (Location.mknoloc (make_lident ~names:[ "List"; "map" ])))
                            [
                              ( Nolabel,
                                B.pexp_fun Nolabel None
                                  (B.ppat_var (Location.mknoloc "s"))
                                  (Option.value_exn
                                     (parse_primitive_from_string ls.target (exp_ident "s"))) );
                              (Nolabel, elements);
                            ])
                  | None ->
                      (* List of complex types *)
                      let item_func =
                        B.pexp_ident
                          (Location.mknoloc (func_longident ~namespace_resolver ls.target))
                      in
                      read_sequences member_tag
                        (B.pexp_apply item_func [ (Nolabel, exp_ident "i") ])
                in
                assign (read_sequence xml_tag list_body)
            | Some (Shape.SetShape ss) ->
                let set_body = read_elements "member" in
                assign (read_sequence xml_tag set_body)
            | Some (Shape.MapShape ms) when is_flattened member_traits ->
                (* Flattened map: repeated <xml_tag> elements, each an entry with <key>/<value>
               directly (no <entry> wrapper, no container). *)
                assign (read_sequences xml_tag (map_entry_body ~namespace_resolver ms))
            | Some (Shape.MapShape ms) ->
                assign
                  (read_sequence xml_tag
                     (read_sequences "entry" (map_entry_body ~namespace_resolver ms)))
            | _ ->
                (* Generic structure/enum *)
                let item_func =
                  B.pexp_ident (Location.mknoloc (func_longident ~namespace_resolver target_name))
                in
                assign (read_sequence xml_tag (B.pexp_apply item_func [ (Nolabel, exp_ident "i") ]))
            ))

  let structure_func_body name (descriptor : Shape.structureShapeDetails) ~namespace_resolver
      ~shape_resolver () =
    let type_name_str = SafeNames.safeTypeName name in
    let type_name = B.ptyp_constr (lident_noloc type_name_str) [] in
    let members = descriptor.members in
    if List.is_empty members then exp_fun_untyped "i" [%expr ((() : unit) : [%t type_name])]
    else begin
      (* Generate a ref for each member *)
      let ref_bindings =
        List.map members ~f:(fun (mem : Shape.member) ->
            let ref_name = "r_" ^ SafeNames.safeMemberName mem.name in
            B.value_binding
              ~pat:(B.ppat_var (Location.mknoloc ref_name))
              ~expr:
                (B.pexp_apply (exp_ident "ref")
                   [ (Nolabel, B.pexp_construct (lident_noloc "None") None) ]))
      in
      (* Generate match cases for scanSequence *)
      let xml_tags =
        List.map members ~f:(fun (mem : Shape.member) -> xml_name mem.traits mem.name)
      in
      let cases =
        List.map members ~f:(fun (mem : Shape.member) ->
            let xml_tag = xml_name mem.traits mem.name in
            let ref_name = "r_" ^ SafeNames.safeMemberName mem.name in
            let reader =
              member_reader_expr ~namespace_resolver ~shape_resolver ~member_traits:mem.traits
                xml_tag mem.target ref_name
            in
            B.case ~lhs:(pat_const_str xml_tag) ~guard:None ~rhs:reader)
      in
      let wildcard_case = B.case ~lhs:B.ppat_any ~guard:None ~rhs:skip_element_expr in
      let scan_call =
        xml_call xml_struct_mod "scanSequence"
          [
            (Nolabel, exp_ident "i");
            (Nolabel, B.elist (List.map xml_tags ~f:const_str));
            ( Nolabel,
              B.pexp_fun Nolabel None
                (B.ppat_var (Location.mknoloc "tag"))
                (B.pexp_fun Nolabel None B.ppat_any
                   (B.pexp_match (exp_ident "tag") (cases @ [ wildcard_case ]))) );
          ]
      in
      (* Build the record expression *)
      let record_fields =
        List.map members ~f:(fun (mem : Shape.member) ->
            let is_required = Trait.hasTrait mem.traits Trait.isRequiredTrait in
            let ref_name = "r_" ^ SafeNames.safeMemberName mem.name in
            let field_key = lident_noloc (SafeNames.safeMemberName mem.name) in
            let deref = B.pexp_apply (exp_ident "( ! )") [ (Nolabel, exp_ident ref_name) ] in
            let field_val =
              if is_required then
                (* Xml.Parse.required "Tag" !r_tag i *)
                xml_call [ "Smaws_Lib"; "Xml"; "Parse" ] "required"
                  [
                    (Nolabel, const_str (xml_name mem.traits mem.name));
                    (Nolabel, deref);
                    (Nolabel, exp_ident "i");
                  ]
              else deref
            in
            (field_key, field_val))
      in
      let record_expr = B.pexp_record record_fields None in
      let typed_record = B.pexp_constraint record_expr type_name in
      let body =
        List.fold_right ref_bindings ~init:(B.pexp_sequence scan_call typed_record)
          ~f:(fun binding acc -> B.pexp_let Nonrecursive [ binding ] acc)
      in
      exp_fun_untyped "i" body
    end

  let list_func_body (x : Shape.listShapeDetails) ~namespace_resolver ~shape_resolver () =
    let member_tag = xml_name x.memberTraits "member" in
    let body =
      match parse_primitive_from_string x.target (read_element member_tag) with
      | Some _ -> (
          let elements = read_elements member_tag in
          match x.target with
          | "smithy.api#String" -> elements
          | _ ->
              B.pexp_apply
                (B.pexp_ident (Location.mknoloc (make_lident ~names:[ "List"; "map" ])))
                [
                  ( Nolabel,
                    B.pexp_fun Nolabel None
                      (B.ppat_var (Location.mknoloc "s"))
                      (Option.value_exn (parse_primitive_from_string x.target (exp_ident "s"))) );
                  (Nolabel, elements);
                ])
      | None ->
          let item_func =
            B.pexp_ident (Location.mknoloc (func_longident ~namespace_resolver x.target))
          in
          read_sequences member_tag (B.pexp_apply item_func [ (Nolabel, exp_ident "i") ])
    in
    exp_fun_untyped "i" body

  let set_func_body (x : Shape.setShapeDetails) ~namespace_resolver ~shape_resolver () =
    let body = read_elements "member" in
    exp_fun_untyped "i" body

  let map_func_body (x : Shape.mapShapeDetails) ~namespace_resolver () =
    exp_fun_untyped "i" (read_sequences "entry" (map_entry_body ~namespace_resolver x))

  let enum_func_body name (s : Shape.enumShapeDetails) ~namespace_resolver () =
    let type_name_str = SafeNames.safeTypeName name in
    let type_name = B.ptyp_constr (lident_noloc type_name_str) [] in
    let cases =
      s.members
      |> List.map ~f:(fun (m : Shape.member) ->
             let value =
               List.find_map_exn
                 ~f:(fun (t : Ast.Trait.t) -> match t with EnumValueTrait e -> Some e | _ -> None)
                 Shape.(m.traits |> Option.value ~default:[])
             in
             let pattern =
               match value with
               | `String sv -> pat_const_str sv
               | `Int iv -> pat_const_str (Int.to_string iv)
             in
             B.case ~lhs:pattern ~guard:None
               ~rhs:(B.pexp_construct (lident_noloc (SafeNames.safeConstructorName m.name)) None))
    in
    let failure_case =
      B.case ~lhs:B.ppat_any ~guard:None ~rhs:[%expr failwith "unknown enum value"]
    in
    (* Read data directly from the current position (caller already opened the element) *)
    let match_exp = B.pexp_match (exp_ident "s") (cases @ [ failure_case ]) in
    exp_fun_untyped "i"
      (B.pexp_let Nonrecursive
         [
           B.value_binding
             ~pat:(B.ppat_var (Location.mknoloc "s"))
             ~expr:(xml_call xml_read_mod "data" [ (Nolabel, exp_ident "i") ]);
         ]
         (B.pexp_constraint match_exp type_name))

  let generate_func_body (shapeWithTarget : Dependencies.shapeWithTarget)
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t)
      ~(shape_resolver : Shape_resolver.t) () =
    match shapeWithTarget.descriptor with
    | StructureShape { members = []; _ } -> Some (exp_fun_untyped "i" unit_expr)
    | StructureShape x ->
        Some (structure_func_body shapeWithTarget.name x ~namespace_resolver ~shape_resolver ())
    | ListShape x -> Some (list_func_body x ~namespace_resolver ~shape_resolver ())
    | SetShape x -> Some (set_func_body x ~namespace_resolver ~shape_resolver ())
    | MapShape x -> Some (map_func_body x ~namespace_resolver ())
    | EnumShape s -> Some (enum_func_body shapeWithTarget.name s ~namespace_resolver ())
    | TimestampShape { traits } ->
        let fmt =
          resolve_timestamp_format ~shape_traits:(Some (Option.value ~default:[] traits)) ()
        in
        let helper =
          match fmt with
          | Trait.TimestampFormatDateTime -> "timestamp_iso_of_string"
          | Trait.TimestampFormatEpochSeconds -> "timestamp_epoch_of_string"
          | Trait.TimestampFormatHttpDate -> "timestamp_httpdate_of_string"
        in
        let deser_mod = [ "Smaws_Lib"; "Protocols"; "AwsQuery"; "Deserialize" ] in
        let s_expr = xml_call xml_read_mod "data" [ (Nolabel, exp_ident "i") ] in
        Some
          (exp_fun_untyped "i"
             (B.pexp_apply
                (B.pexp_ident (Location.mknoloc (make_lident ~names:(deser_mod @ [ helper ]))))
                [ (Nolabel, s_expr) ]))
    | StringShape { traits } ->
        let has_timestamp_fmt =
          Option.value ~default:[] traits
          |> List.exists ~f:(function Trait.TimestampFormatTrait _ -> true | _ -> false)
        in
        if has_timestamp_fmt then (
          let fmt =
            resolve_timestamp_format ~shape_traits:(Some (Option.value ~default:[] traits)) ()
          in
          let helper =
            match fmt with
            | Trait.TimestampFormatDateTime -> "timestamp_iso_of_string"
            | Trait.TimestampFormatEpochSeconds -> "timestamp_epoch_of_string"
            | Trait.TimestampFormatHttpDate -> "timestamp_httpdate_of_string"
          in
          let deser_mod = [ "Smaws_Lib"; "Protocols"; "AwsQuery"; "Deserialize" ] in
          let s_expr = xml_call xml_read_mod "data" [ (Nolabel, exp_ident "i") ] in
          Some
            (exp_fun_untyped "i"
               (B.pexp_apply
                  (B.pexp_ident (Location.mknoloc (make_lident ~names:(deser_mod @ [ helper ]))))
                  [ (Nolabel, s_expr) ])))
        else None
    | UnionShape _ ->
        Some
          (exp_fun_untyped "_i"
             (B.pexp_apply (exp_ident "failwith")
                [ (Nolabel, const_str "union xml deserialization not implemented") ]))
    | _ -> None

  let generate ~(structure_shapes : Ast.Dependencies.shapeWithTarget list)
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t)
      ~(shape_resolver : Shape_resolver.t) () =
    structure_shapes
    |> List.filter_map ~f:(fun (shapeWithTarget : Dependencies.shapeWithTarget) ->
           let func_name = deserialiser_func_str shapeWithTarget.name in
           let func_body =
             generate_func_body shapeWithTarget ~namespace_resolver ~shape_resolver ()
           in
           let shape =
             Option.value_map func_body ~default:[] ~f:(fun body ->
                 [ B.value_binding ~pat:(B.ppat_var (Location.mknoloc func_name)) ~expr:body ])
           in
           let all_shapes =
             match shapeWithTarget.recursWith with
             | Some recursWith ->
                 let recurs =
                   List.filter_map recursWith ~f:(fun (swt : Dependencies.shapeWithTarget) ->
                       let sname = deserialiser_func_str swt.name in
                       let fb = generate_func_body swt ~namespace_resolver ~shape_resolver () in
                       Option.map fb ~f:(fun body ->
                           B.value_binding ~pat:(B.ppat_var (Location.mknoloc sname)) ~expr:body))
                 in
                 shape @ recurs
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

(* ============================================================ *)
(* Operations *)
(* ============================================================ *)

module Operations = struct
  let awsquery_mod = [ "Smaws_Lib"; "Protocols"; "AwsQuery" ]

  let generate_error_to_string ~(operation_shape : Ast.Shape.operationShapeDetails)
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t) () =
    let errors = operation_shape.errors |> Option.value ~default:[] in
    let handler_body =
      let default_handler =
        B.pexp_ident (Location.mknoloc (make_lident ~names:(awsquery_mod @ [ "error_to_string" ])))
      in
      match errors with
      | [] -> default_handler
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
                      (Location.mknoloc (make_lident ~names:(awsquery_mod @ [ "error" ]))))
                   (Location.mknoloc "e"))
              ~guard:None
              ~rhs:(B.pexp_apply default_handler [ (Nolabel, exp_ident "e") ])
          in
          B.pexp_function_cases (error_cases @ [ default_case ])
    in
    B.pstr_value Nonrecursive
      [ B.value_binding ~pat:(B.ppat_var (Location.mknoloc "error_to_string")) ~expr:handler_body ]

  let generate_error_handler ~(operation_shape : Ast.Shape.operationShapeDetails)
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t) () =
    (* For AwsQuery, error responses only contain Type and Code - no XML body for struct parsing.
       We match on error.code and return the appropriate variant. Error struct fields are
       unavailable so all operations use the default handler for specific error data. *)
    let errors = operation_shape.errors |> Option.value ~default:[] in
    let default_handler =
      B.pexp_ident
        (Location.mknoloc (make_lident ~names:(awsquery_mod @ [ "Errors"; "default_handler" ])))
    in
    let body =
      if List.is_empty errors then
        [%expr
          fun (error : Smaws_Lib.Protocols.AwsQuery.Error.t) ->
            Smaws_Lib.Protocols.AwsQuery.Errors.default_handler error]
      else begin
        let cases =
          errors
          |> List.map ~f:(fun error ->
                 let _, exc_name = Util.symbolPair error in
                 let pattern = pat_const_str exc_name in
                 (* AwsQuery errors are identified by code alone; error struct fields not available *)
                 let expression = B.pexp_apply default_handler [ (Nolabel, exp_ident "error") ] in
                 B.case ~lhs:pattern ~guard:None ~rhs:expression)
        in
        let default_case =
          B.case ~lhs:B.ppat_any ~guard:None
            ~rhs:(B.pexp_apply default_handler [ (Nolabel, exp_ident "error") ])
        in
        let match_body =
          B.pexp_match [%expr error.Smaws_Lib.Protocols.AwsQuery.Error.code]
            (cases @ [ default_case ])
        in
        [%expr fun (error : Smaws_Lib.Protocols.AwsQuery.Error.t) -> [%e match_body]]
      end
    in
    B.pstr_value Nonrecursive
      [ B.value_binding ~pat:(B.ppat_var (Location.mknoloc "error_deserializer")) ~expr:body ]

  let generate_request_handler ~name ~operation_name
      ~(operation_shape : Ast.Shape.operationShapeDetails) ~alias_context ~xml_namespace
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t) () =
    let action_name = Util.symbolName operation_name in
    let input_serializer =
      operation_shape.input
      |> Option.value_map ~default:[%expr []] ~f:(fun input_name ->
             let sym_transformer ~local x =
               if local then [ Serialiser.serialiser_func_str x ]
               else [ "Query_serializers"; Serialiser.serialiser_func_str x ]
             in
             let func_ident =
               Namespace_resolver.Namespace_resolver.resolve_reference
                 ~symbol_transformer:sym_transformer namespace_resolver input_name
               |> Longident.unflatten |> Option.value_exn
             in
             B.pexp_apply
               (B.pexp_ident (Location.mknoloc func_ident))
               [ (Nolabel, B.elist []); (Nolabel, exp_ident "request") ])
    in
    let output_deserializer =
      operation_shape.output
      |> Option.value_map
           ~default:
             (B.pexp_ident
                (Location.mknoloc (make_lident ~names:[ "Query_deserializers"; "unit_of_xml" ])))
           ~f:(fun output_name ->
             let sym_transformer ~local x =
               if local then [ Deserialiser.deserialiser_func_str x ]
               else [ "Query_deserializers"; Deserialiser.deserialiser_func_str x ]
             in
             let func_ident =
               Namespace_resolver.Namespace_resolver.resolve_reference
                 ~symbol_transformer:sym_transformer namespace_resolver output_name
               |> Longident.unflatten |> Option.value_exn
             in
             B.pexp_ident (Location.mknoloc func_ident))
    in
    let request_func =
      B.pexp_ident (Location.mknoloc (make_lident ~names:(awsquery_mod @ [ "request" ])))
    in
    let shape_func_body =
      [%expr
        let fields = [%e input_serializer] in
        [%e request_func] ~action:[%e const_str action_name]
          ~xmlNamespace:[%e const_str xml_namespace] ~service ~context ~fields
          ~output_deserializer:[%e output_deserializer] ~error_deserializer]
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
      ~xml_namespace ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t) () =
    let module_name = SafeNames.safeConstructorName operation_name in
    let request_handler =
      generate_request_handler ~name ~operation_name ~operation_shape ~alias_context ~xml_namespace
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
          (B.ptyp_constr (Location.mknoloc (make_lident ~names:(awsquery_mod @ [ "error" ]))) []);
      ]
    in
    smaws_lib_constructor
    @ (errors |> Option.value ~default:[]
      |> List.map ~f:(fun error ->
             let name = SafeNames.safeConstructorName error in
             B.rtag (lstr_noloc name) false
               [ Types.resolve alias_ctx ~name:error ~namespace_resolver () ]))

  let generate_error_type alias_ctx errors ~namespace_resolver () =
    generate_error_constructor_list alias_ctx errors ~namespace_resolver () |> fun cs ->
    B.ptyp_variant cs Open None

  let generate_error_to_string_type alias_ctx errors ~namespace_resolver () =
    generate_error_constructor_list alias_ctx errors ~namespace_resolver () |> fun cs ->
    B.ptyp_variant cs Closed None

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

  let extract_xml_namespace (service : Shape.serviceShapeDetails) =
    Option.value ~default:""
      (Option.bind service.traits ~f:(fun ts ->
           List.find_map ts ~f:(function Trait.ApiXmlNamespaceTrait ns -> Some ns | _ -> None)))

  let generate ~name ~(service : Shape.serviceShapeDetails) ~operation_shapes ~alias_context
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t) () =
    let xml_namespace = extract_xml_namespace service in
    operation_shapes
    |> List.map ~f:(fun (operation_name, operation_shape, dependencies) ->
           generate_operation_module ~name ~operation_name ~operation_shape ~dependencies
             ~alias_context ~xml_namespace ~namespace_resolver ())

  let generate_mli ~name ~(service : Shape.serviceShapeDetails) ~operation_shapes ~alias_context
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t) () =
    operation_shapes
    |> List.map ~f:(fun (operation_name, operation_shape, dependencies) ->
           generate_operation_module_sig ~name ~operation_name ~operation_shape ~dependencies
             ~alias_context ~namespace_resolver ())
end
