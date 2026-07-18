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

let is_attribute (traits : Trait.t list option) =
  match traits with
  | None -> false
  | Some ts -> List.exists ts ~f:(function Trait.XmlAttributeTrait -> true | _ -> false)

let is_internal (traits : Trait.t list option) =
  match traits with
  | None -> false
  | Some ts -> List.exists ts ~f:(function Trait.InternalTrait -> true | _ -> false)

let is_idempotency_token (traits : Trait.t list option) =
  match traits with
  | None -> false
  | Some ts -> List.exists ts ~f:(function Trait.IdempotencyTokenTrait -> true | _ -> false)

let is_required (traits : Trait.t list option) =
  match traits with
  | None -> false
  | Some ts -> List.exists ts ~f:(function Trait.RequiredTrait -> true | _ -> false)

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
  let serialiser_func_str name = (name |> SafeNames.safeFunctionName) ^ "_to_xml"
  let xml_write_mod = [ "Smaws_Lib"; "Xml"; "Write" ]

  let xml_write_call func args =
    B.pexp_apply
      (B.pexp_ident (Location.mknoloc (make_lident ~names:(xml_write_mod @ [ func ]))))
      args

  (* fun w v -> Write.text w (string_of v) *)
  let primitive_field_lambda to_string =
    exp_fun_untyped "w"
      (exp_fun_untyped "v"
         (xml_write_call "text"
            [
              (Nolabel, exp_ident "w");
              (Nolabel, B.pexp_apply (exp_ident to_string) [ (Nolabel, exp_ident "v") ]);
            ]))

  (* For a primitive smithy type, return the XML text writer expression or None *)
  let primitive_serialize_helper ?(member_traits : Trait.t list option = None)
      ?(shape_traits : Trait.t list option = None) target_name =
    match target_name with
    | "smithy.api#String" | "smithy.api#Unit" ->
        Some (fun w v -> xml_write_call "text" [ (Nolabel, w); (Nolabel, v) ])
    | "smithy.api#Integer" | "smithy.api#Byte" | "smithy.api#Short" ->
        Some
          (fun w v ->
            xml_write_call "text"
              [ (Nolabel, w); (Nolabel, B.pexp_apply (exp_ident "string_of_int") [ (Nolabel, v) ]) ])
    | "smithy.api#Long" ->
        Some
          (fun w v ->
            xml_write_call "text"
              [
                (Nolabel, w);
                ( Nolabel,
                  B.pexp_apply
                    (B.pexp_ident
                       (Location.mknoloc
                          (make_lident ~names:[ "Smaws_Lib"; "CoreTypes"; "Int64"; "to_string" ])))
                    [ (Nolabel, v) ] );
              ])
    | "smithy.api#Boolean" ->
        Some
          (fun w v ->
            xml_write_call "text"
              [
                (Nolabel, w); (Nolabel, B.pexp_apply (exp_ident "string_of_bool") [ (Nolabel, v) ]);
              ])
    | "smithy.api#Float" | "smithy.api#Double" ->
        Some
          (fun w v ->
            xml_write_call "text"
              [
                (Nolabel, w);
                ( Nolabel,
                  B.pexp_apply
                    (B.pexp_ident
                       (Location.mknoloc
                          (make_lident
                             ~names:
                               [
                                 "Smaws_Lib";
                                 "Protocols";
                                 "AwsQuery";
                                 "Serialize";
                                 "float_to_string";
                               ])))
                    [ (Nolabel, v) ] );
              ])
    | "smithy.api#Blob" ->
        Some
          (fun w v ->
            xml_write_call "text"
              [
                (Nolabel, w);
                ( Nolabel,
                  B.pexp_apply
                    (B.pexp_ident
                       (Location.mknoloc (make_lident ~names:[ "Base64"; "encode_exn" ])))
                    [ (Nolabel, B.pexp_apply (exp_ident "Bytes.to_string") [ (Nolabel, v) ]) ] );
              ])
    | "smithy.api#Timestamp" ->
        let fmt = resolve_timestamp_format ~member_traits ~shape_traits () in
        let helper_name =
          match fmt with
          | Trait.TimestampFormatDateTime -> "timestamp_iso_to_string"
          | Trait.TimestampFormatEpochSeconds -> "timestamp_epoch_to_string"
          | Trait.TimestampFormatHttpDate -> "timestamp_httpdate_to_string"
        in
        let helper_mod = [ "Smaws_Lib"; "Protocols"; "RestXml"; "Serialize" ] in
        Some
          (fun w v ->
            let s =
              B.pexp_apply
                (B.pexp_ident
                   (Location.mknoloc (make_lident ~names:(helper_mod @ [ helper_name ]))))
                [ (Nolabel, v) ]
            in
            xml_write_call "text" [ (Nolabel, w); (Nolabel, s) ])
    | _ -> None

  (* Generate the function name (as Longident) for a target shape's serializer *)
  let func_longident ~namespace_resolver target_name =
    let symbol_transformer ~local x =
      if local then [ serialiser_func_str x ] else [ "Xml_serializers"; serialiser_func_str x ]
    in
    Namespace_resolver.Namespace_resolver.resolve_reference ~symbol_transformer namespace_resolver
      target_name
    |> Longident.unflatten |> Option.value_exn

  (* Generate an element serializer expression: fun w v -> write element with v *)
  let item_serializer_expr ~namespace_resolver ?(member_traits = None) ?(shape_traits = None)
      target_name =
    match primitive_serialize_helper ~member_traits ~shape_traits target_name with
    | Some helper ->
        (* fun w v -> helper w v *)
        B.pexp_fun Nolabel None
          (B.ppat_var (Location.mknoloc "w"))
          (B.pexp_fun Nolabel None
             (B.ppat_var (Location.mknoloc "v"))
             (helper (exp_ident "w") (exp_ident "v")))
    | None ->
        (* Reference to the complex type's _to_xml function *)
        B.pexp_ident (Location.mknoloc (func_longident ~namespace_resolver target_name))

  (* Generate value expression for a member at a given path.
     Returns: expr that produces unit (writes to XML writer) *)
  let member_value_expr ~namespace_resolver ~shape_resolver ~member_traits ~shape_traits ~tag_name
      value_expr target_name =
    match
      primitive_serialize_helper ~member_traits:(Some member_traits)
        ~shape_traits:(Some shape_traits) target_name
    with
    | Some helper ->
        xml_write_call "element"
          [
            (Nolabel, exp_ident "w");
            (Nolabel, const_str tag_name);
            ( Nolabel,
              B.pexp_fun Nolabel None
                (B.ppat_var (Location.mknoloc "w"))
                (helper (exp_ident "w") value_expr) );
          ]
    | None -> (
        let shape = Shape_resolver.find_shape_by_name ~name:target_name shape_resolver in
        match shape with
        | Some (Shape.ListShape ls) when is_flattened (Some member_traits) ->
            let elem_f = item_serializer_expr ~namespace_resolver ls.target in
            xml_write_call "element"
              [
                (Nolabel, exp_ident "w");
                (Nolabel, const_str tag_name);
                ( Nolabel,
                  B.pexp_fun Nolabel None
                    (B.ppat_var (Location.mknoloc "w"))
                    (B.pexp_apply (exp_ident "List.iter")
                       [
                         ( Nolabel,
                           B.pexp_fun Nolabel None
                             (B.ppat_var (Location.mknoloc "item"))
                             (B.pexp_apply elem_f
                                [ (Nolabel, exp_ident "w"); (Nolabel, exp_ident "item") ]) );
                         (Nolabel, value_expr);
                       ]) );
              ]
        | Some (Shape.SetShape ss) when is_flattened (Some member_traits) ->
            let elem_f = item_serializer_expr ~namespace_resolver ss.target in
            xml_write_call "element"
              [
                (Nolabel, exp_ident "w");
                (Nolabel, const_str tag_name);
                ( Nolabel,
                  B.pexp_fun Nolabel None
                    (B.ppat_var (Location.mknoloc "w"))
                    (B.pexp_apply (exp_ident "List.iter")
                       [
                         ( Nolabel,
                           B.pexp_fun Nolabel None
                             (B.ppat_var (Location.mknoloc "item"))
                             (B.pexp_apply elem_f
                                [ (Nolabel, exp_ident "w"); (Nolabel, exp_ident "item") ]) );
                         (Nolabel, value_expr);
                       ]) );
              ]
        | Some (Shape.MapShape ms) when is_flattened (Some member_traits) ->
            let key_f = item_serializer_expr ~namespace_resolver ms.mapKey.target in
            let val_f = item_serializer_expr ~namespace_resolver ms.mapValue.target in
            let key_tag = xml_name ms.mapKey.traits "key" in
            let val_tag = xml_name ms.mapValue.traits "value" in
            xml_write_call "element"
              [
                (Nolabel, exp_ident "w");
                (Nolabel, const_str tag_name);
                ( Nolabel,
                  B.pexp_fun Nolabel None
                    (B.ppat_var (Location.mknoloc "w"))
                    (B.pexp_apply (exp_ident "List.iter")
                       [
                         ( Nolabel,
                           B.pexp_fun Nolabel None
                             (B.ppat_tuple
                                [
                                  B.ppat_var (Location.mknoloc "k");
                                  B.ppat_var (Location.mknoloc "v");
                                ])
                             (B.pexp_sequence
                                (xml_write_call "element"
                                   [
                                     (Nolabel, exp_ident "w");
                                     (Nolabel, const_str key_tag);
                                     ( Nolabel,
                                       B.pexp_fun Nolabel None
                                         (B.ppat_var (Location.mknoloc "w"))
                                         (B.pexp_apply key_f
                                            [ (Nolabel, exp_ident "w"); (Nolabel, exp_ident "k") ])
                                     );
                                   ])
                                (xml_write_call "element"
                                   [
                                     (Nolabel, exp_ident "w");
                                     (Nolabel, const_str val_tag);
                                     ( Nolabel,
                                       B.pexp_fun Nolabel None
                                         (B.ppat_var (Location.mknoloc "w"))
                                         (B.pexp_apply val_f
                                            [ (Nolabel, exp_ident "w"); (Nolabel, exp_ident "v") ])
                                     );
                                   ])) );
                         (Nolabel, value_expr);
                       ]) );
              ]
        | _ ->
            (* Normal complex type: call its _to_xml function *)
            B.pexp_apply
              (B.pexp_ident (Location.mknoloc (func_longident ~namespace_resolver target_name)))
              [ (Nolabel, exp_ident "w"); (Nolabel, value_expr) ])

  (* Generate expression for a structure member *)
  let generate_member_expr ~namespace_resolver ~shape_resolver (mem : Shape.member) =
    let is_req = is_required mem.traits in
    let is_idemp = is_idempotency_token mem.traits in
    let is_attr = is_attribute mem.traits in
    let xml_key = xml_name mem.traits mem.name in
    let field_access =
      B.pexp_field (exp_ident "x") (lident_noloc (SafeNames.safeMemberName mem.name))
    in
    let member_traits = Option.value ~default:[] mem.traits in
    let shape_traits = [] in
    if is_req then
      member_value_expr ~namespace_resolver ~shape_resolver ~member_traits ~shape_traits
        ~tag_name:xml_key field_access mem.target
    else begin
      let inner_expr v_expr =
        member_value_expr ~namespace_resolver ~shape_resolver ~member_traits ~shape_traits
          ~tag_name:xml_key v_expr mem.target
      in
      let none_rhs =
        if is_idemp then
          inner_expr
            (B.pexp_apply
               (B.pexp_ident
                  (Location.mknoloc (make_lident ~names:[ "Smaws_Lib"; "Uuid"; "generate" ])))
               [ (Nolabel, unit_expr) ])
        else xml_write_call "null" [ (Nolabel, exp_ident "w") ]
      in
      B.pexp_match field_access
        [
          B.case ~lhs:(B.ppat_construct (lident_noloc "None") None) ~guard:None ~rhs:none_rhs;
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
                ~f:(fun (t : Ast.Trait.t) -> match t with EnumValueTrait e -> Some e | _ -> None)
                Shape.(m.traits |> Option.value ~default:[])
            in
            let constructor_name = SafeNames.safeConstructorName m.name in
            B.case
              ~lhs:(B.ppat_construct (lident_noloc constructor_name) None)
              ~guard:None
              ~rhs:
                (match value with
                | `String sv -> const_str sv
                | `Int iv -> B.pexp_apply (exp_ident "string_of_int") [ (Nolabel, exp_int iv) ])))
    in
    let type_name = SafeNames.safeTypeName name in
    exp_fun_untyped "w"
      (B.pexp_fun Nolabel None
         (B.ppat_constraint
            (B.ppat_var (Location.mknoloc "x"))
            (B.ptyp_constr (lident_noloc type_name) []))
         (xml_write_call "text" [ (Nolabel, exp_ident "w"); (Nolabel, match_exp) ]))

  let list_func_body (x : Shape.listShapeDetails) ~namespace_resolver () =
    let member_tag = xml_name x.memberTraits "member" in
    let elem_f = item_serializer_expr ~namespace_resolver x.target in
    exp_fun_untyped "w"
      (exp_fun_untyped "xs"
         (B.pexp_apply (exp_ident "List.iter")
            [
              ( Nolabel,
                B.pexp_fun Nolabel None
                  (B.ppat_var (Location.mknoloc "item"))
                  (xml_write_call "element"
                     [
                       (Nolabel, exp_ident "w");
                       (Nolabel, const_str member_tag);
                       ( Nolabel,
                         B.pexp_fun Nolabel None
                           (B.ppat_var (Location.mknoloc "w"))
                           (B.pexp_apply elem_f
                              [ (Nolabel, exp_ident "w"); (Nolabel, exp_ident "item") ]) );
                     ]) );
              (Nolabel, exp_ident "xs");
            ]))

  let set_func_body (x : Shape.setShapeDetails) ~namespace_resolver () =
    let elem_f = item_serializer_expr ~namespace_resolver x.target in
    exp_fun_untyped "w"
      (exp_fun_untyped "xs"
         (B.pexp_apply (exp_ident "List.iter")
            [
              ( Nolabel,
                B.pexp_fun Nolabel None
                  (B.ppat_var (Location.mknoloc "item"))
                  (xml_write_call "element"
                     [
                       (Nolabel, exp_ident "w");
                       (Nolabel, const_str "member");
                       ( Nolabel,
                         B.pexp_fun Nolabel None
                           (B.ppat_var (Location.mknoloc "w"))
                           (B.pexp_apply elem_f
                              [ (Nolabel, exp_ident "w"); (Nolabel, exp_ident "item") ]) );
                     ]) );
              (Nolabel, exp_ident "xs");
            ]))

  let map_func_body (x : Shape.mapShapeDetails) ~namespace_resolver () =
    let key_tag = xml_name x.mapKey.traits "key" in
    let val_tag = xml_name x.mapValue.traits "value" in
    let key_f = item_serializer_expr ~namespace_resolver x.mapKey.target in
    let val_f = item_serializer_expr ~namespace_resolver x.mapValue.target in
    let entry_body =
      B.pexp_sequence
        (xml_write_call "element"
           [
             (Nolabel, exp_ident "w");
             (Nolabel, const_str key_tag);
             ( Nolabel,
               B.pexp_fun Nolabel None
                 (B.ppat_var (Location.mknoloc "w"))
                 (B.pexp_apply key_f [ (Nolabel, exp_ident "w"); (Nolabel, exp_ident "k") ]) );
           ])
        (xml_write_call "element"
           [
             (Nolabel, exp_ident "w");
             (Nolabel, const_str val_tag);
             ( Nolabel,
               B.pexp_fun Nolabel None
                 (B.ppat_var (Location.mknoloc "w"))
                 (B.pexp_apply val_f [ (Nolabel, exp_ident "w"); (Nolabel, exp_ident "v") ]) );
           ])
    in
    let iter_body =
      B.pexp_fun Nolabel None
        (B.ppat_tuple [ B.ppat_var (Location.mknoloc "k"); B.ppat_var (Location.mknoloc "v") ])
        (xml_write_call "element"
           [
             (Nolabel, exp_ident "w");
             (Nolabel, const_str "entry");
             (Nolabel, B.pexp_fun Nolabel None (B.ppat_var (Location.mknoloc "w")) entry_body);
           ])
    in
    exp_fun_untyped "w"
      (exp_fun_untyped "pairs"
         (B.pexp_apply (exp_ident "List.iter")
            [ (Nolabel, iter_body); (Nolabel, exp_ident "pairs") ]))

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
    let body = B.pexp_apply (exp_ident "ignore") [ (Nolabel, B.elist member_exprs) ] in
    exp_fun_untyped "w"
      (B.pexp_fun Nolabel None
         (B.ppat_constraint
            (B.ppat_var (Location.mknoloc "x"))
            (B.ptyp_constr (lident_noloc effective_type_name) []))
         body)

  let union_func_body name (descriptor : Shape.structureShapeDetails) ~namespace_resolver
      ~shape_resolver () =
    let type_name = SafeNames.safeTypeName name in
    let cases =
      descriptor.members
      |> List.map ~f:(fun (mem : Shape.member) ->
          let constructor = lident_noloc (SafeNames.safeConstructorName mem.name) in
          let pattern = B.ppat_construct constructor (Some (B.ppat_var (Location.mknoloc "v"))) in
          let xml_key = xml_name mem.traits mem.name in
          let member_traits = Option.value ~default:[] mem.traits in
          let rhs =
            member_value_expr ~namespace_resolver ~shape_resolver ~member_traits ~shape_traits:[]
              ~tag_name:xml_key (exp_ident "v") mem.target
          in
          B.case ~lhs:pattern ~guard:None ~rhs)
    in
    let match_exp = B.pexp_match (exp_ident "x") cases in
    exp_fun_untyped "w"
      (B.pexp_fun Nolabel None
         (B.ppat_constraint
            (B.ppat_var (Location.mknoloc "x"))
            (B.ptyp_constr (lident_noloc type_name) []))
         match_exp)

  let generate_func_body (shapeWithTarget : Dependencies.shapeWithTarget)
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t)
      ~(shape_resolver : Shape_resolver.t) () =
    match shapeWithTarget.descriptor with
    | StructureShape { members = []; _ } ->
        Some
          (exp_fun_untyped "w"
             (exp_fun_untyped "_x" (xml_write_call "null" [ (Nolabel, exp_ident "w") ])))
    | StructureShape x ->
        Some (structure_func_body shapeWithTarget.name x ~namespace_resolver ~shape_resolver ())
    | ListShape x -> Some (list_func_body x ~namespace_resolver ())
    | SetShape x -> Some (set_func_body x ~namespace_resolver ())
    | MapShape x -> Some (map_func_body x ~namespace_resolver ())
    | EnumShape s -> Some (enum_func_body shapeWithTarget.name s)
    | UnionShape x ->
        Some (union_func_body shapeWithTarget.name x ~namespace_resolver ~shape_resolver ())
    | TimestampShape { traits } ->
        let fmt =
          resolve_timestamp_format ~shape_traits:(Some (Option.value ~default:[] traits)) ()
        in
        let helper_name =
          match fmt with
          | Trait.TimestampFormatDateTime -> "timestamp_iso_to_string"
          | Trait.TimestampFormatEpochSeconds -> "timestamp_epoch_to_string"
          | Trait.TimestampFormatHttpDate -> "timestamp_httpdate_to_string"
        in
        let helper_mod = [ "Smaws_Lib"; "Protocols"; "RestXml"; "Serialize" ] in
        Some
          (exp_fun_untyped "w"
             (exp_fun_untyped "v"
                (xml_write_call "text"
                   [
                     (Nolabel, exp_ident "w");
                     ( Nolabel,
                       B.pexp_apply
                         (B.pexp_ident
                            (Location.mknoloc (make_lident ~names:(helper_mod @ [ helper_name ]))))
                         [ (Nolabel, exp_ident "v") ] );
                   ])))
    | StringShape { traits } ->
        let has_timestamp_fmt =
          Option.value ~default:[] traits
          |> List.exists ~f:(function Trait.TimestampFormatTrait _ -> true | _ -> false)
        in
        if has_timestamp_fmt then (
          let fmt =
            resolve_timestamp_format ~shape_traits:(Some (Option.value ~default:[] traits)) ()
          in
          let helper_name =
            match fmt with
            | Trait.TimestampFormatDateTime -> "timestamp_iso_to_string"
            | Trait.TimestampFormatEpochSeconds -> "timestamp_epoch_to_string"
            | Trait.TimestampFormatHttpDate -> "timestamp_httpdate_to_string"
          in
          let helper_mod = [ "Smaws_Lib"; "Protocols"; "RestXml"; "Serialize" ] in
          Some
            (exp_fun_untyped "w"
               (exp_fun_untyped "v"
                  (xml_write_call "text"
                     [
                       (Nolabel, exp_ident "w");
                       ( Nolabel,
                         B.pexp_apply
                           (B.pexp_ident
                              (Location.mknoloc (make_lident ~names:(helper_mod @ [ helper_name ]))))
                           [ (Nolabel, exp_ident "v") ] );
                     ]))))
        else
          Some
            (exp_fun_untyped "w"
               (exp_fun_untyped "v"
                  (xml_write_call "text" [ (Nolabel, exp_ident "w"); (Nolabel, exp_ident "v") ])))
    | IntegerShape _ | ShortShape _ | ByteShape _ ->
        Some
          (exp_fun_untyped "w"
             (exp_fun_untyped "v"
                (xml_write_call "text"
                   [
                     (Nolabel, exp_ident "w");
                     (Nolabel, B.pexp_apply (exp_ident "string_of_int") [ (Nolabel, exp_ident "v") ]);
                   ])))
    | LongShape _ ->
        Some
          (exp_fun_untyped "w"
             (exp_fun_untyped "v"
                (xml_write_call "text"
                   [
                     (Nolabel, exp_ident "w");
                     ( Nolabel,
                       B.pexp_apply
                         (B.pexp_ident
                            (Location.mknoloc
                               (make_lident
                                  ~names:[ "Smaws_Lib"; "CoreTypes"; "Int64"; "to_string" ])))
                         [ (Nolabel, exp_ident "v") ] );
                   ])))
    | BooleanShape _ ->
        Some
          (exp_fun_untyped "w"
             (exp_fun_untyped "v"
                (xml_write_call "text"
                   [
                     (Nolabel, exp_ident "w");
                     ( Nolabel,
                       B.pexp_apply (exp_ident "string_of_bool") [ (Nolabel, exp_ident "v") ] );
                   ])))
    | FloatShape _ | DoubleShape _ ->
        Some
          (exp_fun_untyped "w"
             (exp_fun_untyped "v"
                (xml_write_call "text"
                   [
                     (Nolabel, exp_ident "w");
                     ( Nolabel,
                       B.pexp_apply
                         (B.pexp_ident
                            (Location.mknoloc
                               (make_lident
                                  ~names:
                                    [
                                      "Smaws_Lib";
                                      "Protocols";
                                      "AwsQuery";
                                      "Serialize";
                                      "float_to_string";
                                    ])))
                         [ (Nolabel, exp_ident "v") ] );
                   ])))
    | BlobShape _ ->
        Some
          (exp_fun_untyped "w"
             (exp_fun_untyped "v"
                (xml_write_call "text"
                   [
                     (Nolabel, exp_ident "w");
                     ( Nolabel,
                       B.pexp_apply
                         (B.pexp_ident
                            (Location.mknoloc (make_lident ~names:[ "Base64"; "encode_exn" ])))
                         [
                           ( Nolabel,
                             B.pexp_apply (exp_ident "Bytes.to_string") [ (Nolabel, exp_ident "v") ]
                           );
                         ] );
                   ])))
    | UnitShape ->
        Some
          (exp_fun_untyped "w"
             (exp_fun_untyped "_x" (xml_write_call "null" [ (Nolabel, exp_ident "w") ])))
    | _ -> None

  let generate ~(structure_shapes : Ast.Dependencies.shapeWithTarget list)
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t)
      ~(shape_resolver : Shape_resolver.t) () =
    structure_shapes
    |> List.filter_map ~f:(fun (shapeWithTarget : Dependencies.shapeWithTarget) ->
        let serialiser_name = serialiser_func_str shapeWithTarget.name in
        let func_body = generate_func_body shapeWithTarget ~namespace_resolver ~shape_resolver () in
        let shape =
          Option.value_map func_body ~default:[] ~f:(fun func_body ->
              [
                B.value_binding ~pat:(B.ppat_var (Location.mknoloc serialiser_name)) ~expr:func_body;
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

  let read_element tag =
    xml_call xml_read_mod "element"
      [ (Nolabel, exp_ident "i"); (Nolabel, const_str tag); (Nolabel, unit_expr) ]

  let read_elements tag =
    xml_call xml_read_mod "elements"
      [ (Nolabel, exp_ident "i"); (Nolabel, const_str tag); (Nolabel, unit_expr) ]

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

  let skip_element_expr = xml_call xml_read_mod "skip_element" [ (Nolabel, exp_ident "i") ]

  let func_longident ~namespace_resolver target_name =
    let symbol_transformer ~local x =
      if local then [ deserialiser_func_str x ]
      else [ "Xml_deserializers"; deserialiser_func_str x ]
    in
    Namespace_resolver.Namespace_resolver.resolve_reference ~symbol_transformer namespace_resolver
      target_name
    |> Longident.unflatten |> Option.value_exn

  let parse_primitive_from_string target_name str_expr =
    match target_name with
    | "smithy.api#String" -> Some str_expr
    | "smithy.api#Integer" | "smithy.api#Byte" | "smithy.api#Short" ->
        Some (B.pexp_apply (exp_ident "int_of_string") [ (Nolabel, str_expr) ])
    | "smithy.api#Long" ->
        Some
          (B.pexp_apply
             (B.pexp_ident
                (Location.mknoloc
                   (make_lident ~names:[ "Smaws_Lib"; "CoreTypes"; "Int64"; "of_string" ])))
             [ (Nolabel, str_expr) ])
    | "smithy.api#BigInteger" ->
        Some
          (B.pexp_apply
             (B.pexp_ident
                (Location.mknoloc
                   (make_lident ~names:[ "Smaws_Lib"; "CoreTypes"; "BigInt"; "of_string" ])))
             [ (Nolabel, str_expr) ])
    | "smithy.api#BigDecimal" ->
        Some
          (B.pexp_apply
             (B.pexp_ident
                (Location.mknoloc
                   (make_lident ~names:[ "Smaws_Lib"; "CoreTypes"; "BigDecimal"; "of_string" ])))
             [ (Nolabel, str_expr) ])
    | "smithy.api#Boolean" ->
        Some (B.pexp_apply (exp_ident "bool_of_string") [ (Nolabel, str_expr) ])
    | "smithy.api#Float" | "smithy.api#Double" ->
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

  let map_entry_body ~namespace_resolver (ms : Shape.mapShapeDetails) =
    let key_tag = xml_name ms.mapKey.traits "key" in
    let val_tag = xml_name ms.mapValue.traits "value" in
    let key_expr =
      match parse_primitive_from_string ms.mapKey.target (read_element key_tag) with
      | Some e -> e
      | None ->
          let kf =
            B.pexp_ident (Location.mknoloc (func_longident ~namespace_resolver ms.mapKey.target))
          in
          read_sequence key_tag (B.pexp_apply kf [ (Nolabel, exp_ident "i") ])
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

  let list_items_body ~namespace_resolver target item_tag =
    match parse_primitive_from_string target (read_element item_tag) with
    | Some _ -> (
        let elements = read_elements item_tag in
        match target with
        | "smithy.api#String" -> elements
        | _ ->
            B.pexp_apply
              (B.pexp_ident (Location.mknoloc (make_lident ~names:[ "List"; "map" ])))
              [
                ( Nolabel,
                  B.pexp_fun Nolabel None
                    (B.ppat_var (Location.mknoloc "s"))
                    (Option.value_exn (parse_primitive_from_string target (exp_ident "s"))) );
                (Nolabel, elements);
              ])
    | None ->
        let item_func =
          B.pexp_ident (Location.mknoloc (func_longident ~namespace_resolver target))
        in
        read_sequences item_tag (B.pexp_apply item_func [ (Nolabel, exp_ident "i") ])

  let member_reader_expr ~namespace_resolver ~shape_resolver ~member_traits xml_tag target_name
      ref_name =
    let assign v_expr =
      B.pexp_apply
        (B.pexp_ident (Location.mknoloc (Longident.Lident ":=")))
        [
          (Nolabel, B.pexp_ident (Location.mknoloc (Longident.Lident ref_name)));
          (Nolabel, B.pexp_construct (lident_noloc "Some") (Some v_expr));
        ]
    in
    let raw_str_expr = read_element xml_tag in
    match target_name with
    | "smithy.api#Timestamp" ->
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
            let shape = Shape_resolver.find_shape_by_name ~name:target_name shape_resolver in
            match shape with
            | Some (Shape.ListShape ls) when is_flattened member_traits ->
                assign (list_items_body ~namespace_resolver ls.target xml_tag)
            | Some (Shape.ListShape ls) ->
                let member_tag = xml_name ls.memberTraits "member" in
                assign
                  (read_sequence xml_tag (list_items_body ~namespace_resolver ls.target member_tag))
            | Some (Shape.SetShape ss) ->
                let set_body = read_elements "member" in
                assign (read_sequence xml_tag set_body)
            | Some (Shape.MapShape ms) when is_flattened member_traits ->
                assign (read_sequences xml_tag (map_entry_body ~namespace_resolver ms))
            | Some (Shape.MapShape ms) ->
                assign
                  (read_sequence xml_tag
                     (read_sequences "entry" (map_entry_body ~namespace_resolver ms)))
            | _ ->
                let item_func =
                  B.pexp_ident (Location.mknoloc (func_longident ~namespace_resolver target_name))
                in
                assign (read_sequence xml_tag (B.pexp_apply item_func [ (Nolabel, exp_ident "i") ]))
            ))

  let member_ref_name (mem : Shape.member) = "r_" ^ SafeNames.safeMemberName mem.name

  let structure_ref_bindings (members : Shape.member list) =
    List.map members ~f:(fun mem ->
        B.value_binding
          ~pat:(B.ppat_var (Location.mknoloc (member_ref_name mem)))
          ~expr:
            (B.pexp_apply (exp_ident "ref")
               [ (Nolabel, B.pexp_construct (lident_noloc "None") None) ]))

  let structure_scan_cases ~namespace_resolver ~shape_resolver (members : Shape.member list) =
    List.map members ~f:(fun (mem : Shape.member) ->
        let xml_tag = xml_name mem.traits mem.name in
        let reader =
          member_reader_expr ~namespace_resolver ~shape_resolver ~member_traits:mem.traits xml_tag
            mem.target (member_ref_name mem)
        in
        B.case ~lhs:(pat_const_str xml_tag) ~guard:None ~rhs:reader)

  let structure_scan_call ~namespace_resolver ~shape_resolver (members : Shape.member list) =
    let xml_tags = List.map members ~f:(fun (mem : Shape.member) -> xml_name mem.traits mem.name) in
    let cases = structure_scan_cases ~namespace_resolver ~shape_resolver members in
    let wildcard_case = B.case ~lhs:B.ppat_any ~guard:None ~rhs:skip_element_expr in
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

  let structure_record_fields (members : Shape.member list) =
    List.map members ~f:(fun (mem : Shape.member) ->
        let is_req = is_required mem.traits in
        let field_key = lident_noloc (SafeNames.safeMemberName mem.name) in
        let deref =
          B.pexp_apply (exp_ident "( ! )") [ (Nolabel, exp_ident (member_ref_name mem)) ]
        in
        let field_val =
          if is_req then
            xml_call [ "Smaws_Lib"; "Xml"; "Parse" ] "required"
              [
                (Nolabel, const_str (xml_name mem.traits mem.name));
                (Nolabel, deref);
                (Nolabel, exp_ident "i");
              ]
          else deref
        in
        (field_key, field_val))

  let structure_func_body name (descriptor : Shape.structureShapeDetails) ~namespace_resolver
      ~shape_resolver () =
    let type_name_str = SafeNames.safeTypeName name in
    let type_name = B.ptyp_constr (lident_noloc type_name_str) [] in
    let members = descriptor.members in
    if List.is_empty members then exp_fun_untyped "i" [%expr ((() : unit) : [%t type_name])]
    else begin
      let ref_bindings = structure_ref_bindings members in
      let scan_call = structure_scan_call ~namespace_resolver ~shape_resolver members in
      let record_expr = B.pexp_record (structure_record_fields members) None in
      let typed_record = B.pexp_constraint record_expr type_name in
      let body =
        List.fold_right ref_bindings ~init:(B.pexp_sequence scan_call typed_record)
          ~f:(fun binding acc -> B.pexp_let Nonrecursive [ binding ] acc)
      in
      exp_fun_untyped "i" body
    end

  let union_func_body name (descriptor : Shape.structureShapeDetails) ~namespace_resolver
      ~shape_resolver () =
    let type_name_str = SafeNames.safeTypeName name in
    let type_name = B.ptyp_constr (lident_noloc type_name_str) [] in
    let members = descriptor.members in
    let ref_bindings = structure_ref_bindings members in
    let scan_call = structure_scan_call ~namespace_resolver ~shape_resolver members in
    let select_expr =
      List.fold_right members ~init:[%expr failwith "no union member present in xml response"]
        ~f:(fun mem acc ->
          let constructor = SafeNames.safeConstructorName mem.name in
          let deref =
            B.pexp_apply (exp_ident "( ! )") [ (Nolabel, exp_ident (member_ref_name mem)) ]
          in
          B.pexp_match deref
            [
              B.case
                ~lhs:
                  (B.ppat_construct (lident_noloc "Some")
                     (Some (B.ppat_var (Location.mknoloc "v"))))
                ~guard:None
                ~rhs:(B.pexp_construct (lident_noloc constructor) (Some (exp_ident "v")));
              B.case ~lhs:(B.ppat_construct (lident_noloc "None") None) ~guard:None ~rhs:acc;
            ])
    in
    let typed_select = B.pexp_constraint select_expr type_name in
    let body =
      List.fold_right ref_bindings ~init:(B.pexp_sequence scan_call typed_select)
        ~f:(fun binding acc -> B.pexp_let Nonrecursive [ binding ] acc)
    in
    exp_fun_untyped "i" body

  let list_func_body (x : Shape.listShapeDetails) ~namespace_resolver ~shape_resolver () =
    let member_tag = xml_name x.memberTraits "member" in
    exp_fun_untyped "i" (list_items_body ~namespace_resolver x.target member_tag)

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
    let match_exp = B.pexp_match (exp_ident "s") (cases @ [ failure_case ]) in
    exp_fun_untyped "i"
      (B.pexp_let Nonrecursive
         [
           B.value_binding
             ~pat:(B.ppat_var (Location.mknoloc "s"))
             ~expr:(xml_call xml_read_mod "data" [ (Nolabel, exp_ident "i") ]);
         ]
         (B.pexp_constraint match_exp type_name))

  let deser_mod = [ "Smaws_Lib"; "Protocols"; "AwsQuery"; "Deserialize" ]

  let read_data_lambda () =
    exp_fun_untyped "i" (xml_call xml_read_mod "data" [ (Nolabel, exp_ident "i") ])

  let primitive_of_xml_lambda helper =
    let s_expr = xml_call xml_read_mod "data" [ (Nolabel, exp_ident "i") ] in
    exp_fun_untyped "i"
      (B.pexp_apply
         (B.pexp_ident (Location.mknoloc (make_lident ~names:(deser_mod @ [ helper ]))))
         [ (Nolabel, s_expr) ])

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
          let s_expr = xml_call xml_read_mod "data" [ (Nolabel, exp_ident "i") ] in
          Some
            (exp_fun_untyped "i"
               (B.pexp_apply
                  (B.pexp_ident (Location.mknoloc (make_lident ~names:(deser_mod @ [ helper ]))))
                  [ (Nolabel, s_expr) ])))
        else Some (read_data_lambda ())
    | LongShape _ -> Some (primitive_of_xml_lambda "long_of_string")
    | IntegerShape _ | ShortShape _ | ByteShape _ -> Some (primitive_of_xml_lambda "int_of_string")
    | BigIntegerShape _ -> Some (primitive_of_xml_lambda "big_int_of_string")
    | BigDecimalShape _ -> Some (primitive_of_xml_lambda "big_decimal_of_string")
    | BooleanShape _ -> Some (primitive_of_xml_lambda "bool_of_string")
    | FloatShape _ | DoubleShape _ -> Some (primitive_of_xml_lambda "float_of_string")
    | BlobShape _ -> Some (primitive_of_xml_lambda "blob_of_string")
    | UnitShape -> Some (exp_fun_untyped "i" unit_expr)
    | UnionShape x ->
        Some (union_func_body shapeWithTarget.name x ~namespace_resolver ~shape_resolver ())
    | _ -> None

  let generate ~(structure_shapes : Ast.Dependencies.shapeWithTarget list)
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t)
      ~(shape_resolver : Shape_resolver.t) () =
    structure_shapes
    |> List.filter_map ~f:(fun (shapeWithTarget : Dependencies.shapeWithTarget) ->
        let func_name = deserialiser_func_str shapeWithTarget.name in
        let func_body = generate_func_body shapeWithTarget ~namespace_resolver ~shape_resolver () in
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
  let restxml_mod = [ "Smaws_Lib"; "Protocols"; "RestXml" ]

  let extract_xml_namespace (service : Shape.serviceShapeDetails) =
    Option.value ~default:""
      (Option.bind service.traits ~f:(fun ts ->
           List.find_map ts ~f:(function Trait.ApiXmlNamespaceTrait ns -> Some ns.uri | _ -> None)))

  let generate_error_to_string ~(operation_shape : Ast.Shape.operationShapeDetails)
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t) () =
    let errors = operation_shape.errors |> Option.value ~default:[] in
    let handler_body =
      let default_handler =
        B.pexp_ident (Location.mknoloc (make_lident ~names:(restxml_mod @ [ "error_to_string" ])))
      in
      match errors with
      | [] -> default_handler
      | errors ->
          let error_cases =
            errors
            |> List.map ~f:(fun error ->
                let name = SafeNames.safeConstructorName error in
                B.case
                  ~lhs:(B.ppat_variant name (Some B.ppat_any))
                  ~guard:None ~rhs:(const_str error))
          in
          let default_case =
            B.case
              ~lhs:
                (B.ppat_alias
                   (B.ppat_type (Location.mknoloc (make_lident ~names:(restxml_mod @ [ "error" ]))))
                   (Location.mknoloc "e"))
              ~guard:None
              ~rhs:(B.pexp_apply default_handler [ (Nolabel, exp_ident "e") ])
          in
          B.pexp_function_cases (error_cases @ [ default_case ])
    in
    B.pstr_value Nonrecursive
      [ B.value_binding ~pat:(B.ppat_var (Location.mknoloc "error_to_string")) ~expr:handler_body ]

  let generate_error_handler ~(operation_shape : Ast.Shape.operationShapeDetails)
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t)
      ~(shape_resolver : Shape_resolver.t) () =
    let errors = operation_shape.errors |> Option.value ~default:[] in
    let default_handler =
      B.pexp_ident
        (Location.mknoloc (make_lident ~names:(restxml_mod @ [ "Errors"; "default_handler" ])))
    in
    let parse_error_struct =
      B.pexp_ident (Location.mknoloc (make_lident ~names:(restxml_mod @ [ "parse_error_struct" ])))
    in
    let body =
      if List.is_empty errors then
        [%expr
          fun (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ->
            Smaws_Lib.Protocols.RestXml.Errors.default_handler error]
      else begin
        let cases =
          errors
          |> List.map ~f:(fun error ->
              let wire_code = Util.symbolName error in
              let variant = SafeNames.safeConstructorName error in
              let deser_func = Deserialiser.func_longident ~namespace_resolver error in
              let parse_call =
                B.pexp_apply parse_error_struct
                  [
                    (Labelled "body", exp_ident "body");
                    (Labelled "structParser", B.pexp_ident (Location.mknoloc deser_func));
                  ]
              in
              let rhs =
                B.pexp_match parse_call
                  [
                    B.case
                      ~lhs:
                        (B.ppat_construct (lident_noloc "Ok")
                           (Some (B.ppat_var (Location.mknoloc "s"))))
                      ~guard:None
                      ~rhs:(B.pexp_variant variant (Some (exp_ident "s")));
                    B.case
                      ~lhs:
                        (B.ppat_construct (lident_noloc "Error")
                           (Some
                              (B.ppat_construct
                                 (Location.mknoloc
                                    (make_lident
                                       ~names:[ "Smaws_Lib"; "Xml"; "Parse"; "XmlParseError" ]))
                                 (Some (B.ppat_var (Location.mknoloc "msg"))))))
                      ~guard:None
                      ~rhs:(B.pexp_variant "XmlParseError" (Some (exp_ident "msg")));
                  ]
              in
              B.case ~lhs:(pat_const_str wire_code) ~guard:None ~rhs)
        in
        let default_case =
          B.case ~lhs:B.ppat_any ~guard:None
            ~rhs:(B.pexp_apply default_handler [ (Nolabel, exp_ident "error") ])
        in
        let match_body =
          B.pexp_match [%expr error.Smaws_Lib.Protocols.RestXml.Error.code]
            (cases @ [ default_case ])
        in
        [%expr fun (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body -> [%e match_body]]
      end
    in
    B.pstr_value Nonrecursive
      [ B.value_binding ~pat:(B.ppat_var (Location.mknoloc "error_deserializer")) ~expr:body ]

  let generate_request_handler ~name ~operation_name
      ~(operation_shape : Ast.Shape.operationShapeDetails) ~alias_context ~xml_namespace
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t) () =
    let shape_name = Util.symbolName operation_name in
    let input_serializer =
      operation_shape.input
      |> Option.value_map ~default:[%expr ()] ~f:(fun input_name ->
          if String.equal input_name "smithy.api#Unit" then [%expr ()]
          else (
            let sym_transformer ~local x =
              if local then [ Serialiser.serialiser_func_str x ]
              else [ "Xml_serializers"; Serialiser.serialiser_func_str x ]
            in
            let func_ident =
              Namespace_resolver.Namespace_resolver.resolve_reference
                ~symbol_transformer:sym_transformer namespace_resolver input_name
              |> Longident.unflatten |> Option.value_exn
            in
            B.pexp_apply
              (B.pexp_ident (Location.mknoloc func_ident))
              [ (Nolabel, exp_ident "w"); (Nolabel, exp_ident "request") ]))
    in
    let output_deserializer =
      operation_shape.output
      |> Option.value_map
           ~default:
             (B.pexp_ident
                (Location.mknoloc (make_lident ~names:[ "Xml_deserializers"; "unit_of_xml" ])))
           ~f:(fun output_name ->
             if String.equal output_name "smithy.api#Unit" then
               B.pexp_ident
                 (Location.mknoloc (make_lident ~names:[ "Xml_deserializers"; "unit_of_xml" ]))
             else (
               let sym_transformer ~local x =
                 if local then [ Deserialiser.deserialiser_func_str x ]
                 else [ "Xml_deserializers"; Deserialiser.deserialiser_func_str x ]
               in
               let func_ident =
                 Namespace_resolver.Namespace_resolver.resolve_reference
                   ~symbol_transformer:sym_transformer namespace_resolver output_name
                 |> Longident.unflatten |> Option.value_exn
               in
               B.pexp_ident (Location.mknoloc func_ident)))
    in
    let request_func =
      B.pexp_ident (Location.mknoloc (make_lident ~names:(restxml_mod @ [ "request" ])))
    in
    let shape_func_body =
      [%expr
        let w = Smaws_Lib.Xml.Write.make () in
        [%e input_serializer];
        let body_str = Smaws_Lib.Xml.Write.to_string w in
        [%e request_func] ~shape_name:[%e const_str shape_name] ~service ~context ~method_:`POST
          ~uri:(Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service)
          ~query:[] ~headers:[]
          ~body:(Some ("application/xml", body_str))
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
      ~xml_namespace ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t)
      ~(shape_resolver : Shape_resolver.t) () =
    let module_name = SafeNames.safeConstructorName operation_name in
    let error_to_string = generate_error_to_string ~operation_shape ~namespace_resolver () in
    let error_handler =
      generate_error_handler ~operation_shape ~namespace_resolver ~shape_resolver ()
    in
    let request_handler =
      generate_request_handler ~name ~operation_name ~operation_shape ~alias_context ~xml_namespace
        ~namespace_resolver ()
    in
    let module_items = [ error_to_string; error_handler; request_handler ] in
    let module_expr = B.pmod_structure module_items in
    B.pstr_module (B.module_binding ~name:(Location.mknoloc (Some module_name)) ~expr:module_expr)

  let generate ~name ~(service : Shape.serviceShapeDetails) ~operation_shapes ~alias_context
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t)
      ~(shape_resolver : Shape_resolver.t) () =
    let xml_namespace = extract_xml_namespace service in
    operation_shapes
    |> List.map ~f:(fun (operation_name, operation_shape, dependencies) ->
        generate_operation_module ~name ~operation_name ~operation_shape ~dependencies
          ~alias_context ~xml_namespace ~namespace_resolver ~shape_resolver ())

  let generate_operation_module_sig ~name ~operation_name ~operation_shape ~dependencies
      ~alias_context ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t) () =
    let open Ast.Shape in
    let module_name = SafeNames.safeConstructorName operation_name in
    let input_type =
      Option.bind operation_shape.input ~f:(fun input ->
          Some (Types.resolve alias_context ~name:input ~namespace_resolver ()))
    in
    let output_type =
      Option.bind operation_shape.output ~f:(fun output ->
          Some (Types.resolve alias_context ~name:output ~namespace_resolver ()))
    in
    let val_request =
      let request_type =
        match input_type with
        | Some input_typ ->
            B.ptyp_arrow Nolabel input_typ
              (B.ptyp_constr (lident_noloc "result")
                 [
                   (match output_type with
                   | Some t -> t
                   | None -> B.ptyp_constr (lident_noloc "unit") []);
                   B.ptyp_constr (lident_noloc "Smaws_Lib.Protocols.RestXml.error") [];
                 ])
        | None ->
            B.ptyp_constr (lident_noloc "result")
              [
                (match output_type with
                | Some t -> t
                | None -> B.ptyp_constr (lident_noloc "unit") []);
                B.ptyp_constr (lident_noloc "Smaws_Lib.Protocols.RestXml.error") [];
              ]
      in
      B.value_description ~name:(Location.mknoloc "request")
        ~type_:
          (B.ptyp_arrow Nolabel
             (B.ptyp_constr (lident_noloc "Smaws_Lib.Context.t") [ B.ptyp_var "_" ])
             request_type)
        ~prim:[]
    in
    let module_sig =
      B.psig_module
        (B.module_declaration
           ~name:(Location.mknoloc (Some module_name))
           ~type_:(B.pmty_signature [ B.psig_value val_request ]))
    in
    module_sig

  let generate_mli ~name ~(service : Shape.serviceShapeDetails) ~operation_shapes ~alias_context
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t) () =
    operation_shapes
    |> List.map ~f:(fun (operation_name, operation_shape, dependencies) ->
        generate_operation_module_sig ~name ~operation_name ~operation_shape ~dependencies
          ~alias_context ~namespace_resolver ())
end
