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

  (* Generated xml_serializers.ml opens [Smaws_Lib.Xml.Write], so the writer
     functions are referenced unqualified. *)
  let xml_write_call func args = B.pexp_apply (exp_ident func) args

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
                  qualified_apply
                    ~names:[ "Smaws_Lib"; "CoreTypes"; "Int64"; "to_string" ]
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
                  qualified_apply
                    ~names:
                      [ "Smaws_Lib"; "Protocols"; "RestXml"; "Serialize"; "float_field_to_string" ]
                    [ (Nolabel, v) ] );
              ])
    | "smithy.api#Blob" ->
        Some
          (fun w v ->
            xml_write_call "text"
              [
                (Nolabel, w);
                ( Nolabel,
                  qualified_apply ~names:[ "Base64"; "encode_exn" ]
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
            let s = qualified_apply ~names:(helper_mod @ [ helper_name ]) [ (Nolabel, v) ] in
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

  (* Extract an [@xmlNamespace] (uri, prefix) from a trait list, if present. *)
  let xml_namespace_of (traits : Trait.t list option) : (string * string option) option =
    Option.bind traits ~f:(fun ts ->
        List.find_map ts ~f:(function
          | Trait.ApiXmlNamespaceTrait { uri; prefix } -> Some (uri, prefix)
          | _ -> None))

  (* The attribute members of a structure/union shape, in declaration order. *)
  let attribute_members (descriptor : Shape.structureShapeDetails) =
    List.filter descriptor.members ~f:(fun m -> is_attribute m.traits)

  (* A single attribute's contribution to the runtime [attrs] list:
     [(name, value, None)] when the member is required, or
     [match v.am with Some s -> [(name, s, None)] | None -> []] when optional.
     The attribute name embeds any prefix (e.g. "xsi:someName") via the
     member's [@xmlName]. *)
  let attribute_contribution (value_expr : Ppxlib.expression) (mem : Shape.member) =
    let attr_name = xml_name mem.traits mem.name in
    let access = B.pexp_field value_expr (lident_noloc (SafeNames.safeMemberName mem.name)) in
    let triple v_expr =
      B.pexp_tuple [ const_str attr_name; v_expr; B.pexp_construct (lident_noloc "None") None ]
    in
    if is_required mem.traits then B.elist [ triple access ]
    else
      B.pexp_match access
        [
          B.case
            ~lhs:(B.ppat_construct (lident_noloc "Some") (Some (B.ppat_var (Location.mknoloc "s"))))
            ~guard:None
            ~rhs:(B.elist [ triple (exp_ident "s") ]);
          B.case ~lhs:(B.ppat_construct (lident_noloc "None") None) ~guard:None ~rhs:(B.elist []);
        ]

  (* The runtime [attrs] expression for the wrapping element of a
      structure/union target: the concatenation of each attribute member's
      contribution. [None] when the target has no attributes (so the wrapping
      element is emitted with no ~attrs). *)
  let attrs_expr_of_target ~shape_resolver value_expr target_name =
    match Shape_resolver.find_shape_by_name ~name:target_name shape_resolver with
    | Some (Shape.StructureShape s | Shape.UnionShape s) ->
        let attrs = attribute_members s in
        if List.is_empty attrs then None
        else (
          let contribs = List.map attrs ~f:(attribute_contribution value_expr) in
          Some (B.pexp_apply (exp_ident "List.concat") [ (Nolabel, B.elist contribs) ]))
    | _ -> None

  (* Emit [element w tag ?ns ?attrs body] for a wrapping element. [ns] is
     (uri, prefix_opt). [attrs_opt] is the runtime attrs list expression or
     None.

     For a prefixed namespace ([Some (uri, Some prefix)]) the element name is
     NOT prefixed - only an [xmlns:prefix] declaration is added as an attribute.
     The prefix qualifies the element's attributes/children (e.g.
     [xsi:someName]), not the wrapping element itself: the restXml conformance
     expects [<Nested xmlns:xsi="..." xsi:someName="...">], not [<xsi:Nested>].
     The low-level [Write.element_with_ns] (which prefixes the name) is kept as
     a primitive for the round-trip unit tests and is not used here. *)
  let element_with_namespace ~tag ~ns ~attrs_opt body_expr =
    let body_arg : Ppxlib.arg_label * Ppxlib.expression =
      (Ppxlib.Nolabel, B.pexp_fun Ppxlib.Nolabel None (B.ppat_var (Location.mknoloc "w")) body_expr)
    in
    let attrs_args : (Ppxlib.arg_label * Ppxlib.expression) list =
      match attrs_opt with Some e -> [ (Ppxlib.Labelled "attrs", e) ] | None -> []
    in
    let positional = [ (Ppxlib.Nolabel, exp_ident "w"); (Ppxlib.Nolabel, const_str tag) ] in
    match ns with
    | None -> B.pexp_apply (exp_ident "element") (positional @ attrs_args @ [ body_arg ])
    | Some (uri, None) ->
        let with_ns = positional @ [ (Ppxlib.Labelled "ns", const_str uri) ] in
        B.pexp_apply (exp_ident "element") (with_ns @ attrs_args @ [ body_arg ])
    | Some (uri, Some prefix) ->
        let ns_attr =
          B.pexp_tuple
            [
              const_str ("xmlns:" ^ prefix);
              const_str uri;
              B.pexp_construct (lident_noloc "None") None;
            ]
        in
        let attrs_expr =
          match attrs_opt with
          | Some e -> [%expr [%e ns_attr] :: [%e e]]
          | None -> B.elist [ ns_attr ]
        in
        B.pexp_apply (exp_ident "element")
          (positional @ [ (Ppxlib.Labelled "attrs", attrs_expr) ] @ [ body_arg ])

  (* Generate value expression for a member at a given path.
     Returns: expr that produces unit (writes to XML writer) *)
  let member_value_expr ~namespace_resolver ~shape_resolver ~member_traits ~shape_traits ~tag_name
      value_expr target_name =
    (* The wrapping element's namespace: the member's own [@xmlNamespace] wins,
       otherwise the target shape's [@xmlNamespace] (e.g. a list/map shape's
       namespace applied to its wrapping element). *)
    let target_ns =
      match xml_namespace_of (Some member_traits) with
      | Some _ as ns -> ns
      | None -> (
          match Shape_resolver.find_shape_by_name ~name:target_name shape_resolver with
          | Some shape -> xml_namespace_of (Some (Shape.getShapeTraits shape))
          | None -> None)
    in
    (* Attribute members on a structure/union target render as attributes on
       this wrapping element. *)
    let attrs_opt = attrs_expr_of_target ~shape_resolver value_expr target_name in
    match
      primitive_serialize_helper ~member_traits:(Some member_traits)
        ~shape_traits:(Some shape_traits) target_name
    with
    | Some helper ->
        element_with_namespace ~tag:tag_name ~ns:target_ns ~attrs_opt
          (helper (exp_ident "w") value_expr)
    | None -> (
        let shape = Shape_resolver.find_shape_by_name ~name:target_name shape_resolver in
        match shape with
        | Some (Shape.ListShape ls) when is_flattened (Some member_traits) ->
            (* Flattened list: the member's [<tag_name>] becomes the per-item
               element (no container wrapper); items are emitted as repeated
               siblings. *)
            let elem_f = item_serializer_expr ~namespace_resolver ls.target in
            B.pexp_apply (exp_ident "List.iter")
              [
                ( Nolabel,
                  B.pexp_fun Nolabel None
                    (B.ppat_var (Location.mknoloc "item"))
                    (element_with_namespace ~tag:tag_name ~ns:target_ns ~attrs_opt
                       (B.pexp_apply elem_f
                          [ (Nolabel, exp_ident "w"); (Nolabel, exp_ident "item") ])) );
                (Nolabel, value_expr);
              ]
        | Some (Shape.SetShape ss) when is_flattened (Some member_traits) ->
            let elem_f = item_serializer_expr ~namespace_resolver ss.target in
            B.pexp_apply (exp_ident "List.iter")
              [
                ( Nolabel,
                  B.pexp_fun Nolabel None
                    (B.ppat_var (Location.mknoloc "item"))
                    (element_with_namespace ~tag:tag_name ~ns:target_ns ~attrs_opt
                       (B.pexp_apply elem_f
                          [ (Nolabel, exp_ident "w"); (Nolabel, exp_ident "item") ])) );
                (Nolabel, value_expr);
              ]
        | Some (Shape.MapShape ms) when is_flattened (Some member_traits) ->
            (* Flattened map: each entry becomes a repeated [<tag_name>] sibling
               containing the key/value child elements. xmlName on key/value is
               retained for flattened maps. *)
            let key_f = item_serializer_expr ~namespace_resolver ms.mapKey.target in
            let val_f = item_serializer_expr ~namespace_resolver ms.mapValue.target in
            let key_tag = xml_name ms.mapKey.traits "key" in
            let val_tag = xml_name ms.mapValue.traits "value" in
            let entry_body =
              B.pexp_sequence
                (xml_write_call "element"
                   [
                     (Nolabel, exp_ident "w");
                     (Nolabel, const_str key_tag);
                     ( Nolabel,
                       B.pexp_fun Nolabel None
                         (B.ppat_var (Location.mknoloc "w"))
                         (B.pexp_apply key_f [ (Nolabel, exp_ident "w"); (Nolabel, exp_ident "k") ])
                     );
                   ])
                (xml_write_call "element"
                   [
                     (Nolabel, exp_ident "w");
                     (Nolabel, const_str val_tag);
                     ( Nolabel,
                       B.pexp_fun Nolabel None
                         (B.ppat_var (Location.mknoloc "w"))
                         (B.pexp_apply val_f [ (Nolabel, exp_ident "w"); (Nolabel, exp_ident "v") ])
                     );
                   ])
            in
            B.pexp_apply (exp_ident "List.iter")
              [
                ( Nolabel,
                  B.pexp_fun Nolabel None
                    (B.ppat_tuple
                       [ B.ppat_var (Location.mknoloc "k"); B.ppat_var (Location.mknoloc "v") ])
                    (element_with_namespace ~tag:tag_name ~ns:target_ns ~attrs_opt entry_body) );
                (Nolabel, value_expr);
              ]
        | _ ->
            (* Normal complex type (structure/union/non-flattened list/map/set):
               wrap the target's [_to_xml] (which writes the shape's content with
               no outer element of its own) in the member's [<tag_name>] element. *)
            element_with_namespace ~tag:tag_name ~ns:target_ns ~attrs_opt
              (B.pexp_apply
                 (B.pexp_ident (Location.mknoloc (func_longident ~namespace_resolver target_name)))
                 [ (Nolabel, exp_ident "w"); (Nolabel, value_expr) ]))

  (* Generate expression for a structure member. [@xmlAttribute] members are
     NOT written as child elements here — they render as attributes on the
     wrapping element, which [member_value_expr] collects from the target
     shape when a parent serializes this structure as a member. The body-root
     case (operations / [@httpPayload]) is handled in Phase 7. *)
  let generate_member_expr ~namespace_resolver ~shape_resolver (mem : Shape.member) =
    if is_attribute mem.traits then xml_write_call "null" [ (Nolabel, exp_ident "w") ]
    else begin
      let is_req = is_required mem.traits in
      let is_idemp = is_idempotency_token mem.traits in
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
              (qualified_apply ~names:[ "Smaws_Lib"; "Uuid"; "generate" ] [ (Nolabel, unit_expr) ])
          else xml_write_call "null" [ (Nolabel, exp_ident "w") ]
        in
        B.pexp_match field_access
          [
            B.case ~lhs:(B.ppat_construct (lident_noloc "None") None) ~guard:None ~rhs:none_rhs;
            B.case
              ~lhs:
                (B.ppat_construct (lident_noloc "Some") (Some (B.ppat_var (Location.mknoloc "v"))))
              ~guard:None
              ~rhs:(inner_expr (exp_ident "v"));
          ]
      end
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
                       qualified_apply ~names:(helper_mod @ [ helper_name ])
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
                         qualified_apply ~names:(helper_mod @ [ helper_name ])
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
                       qualified_apply
                         ~names:[ "Smaws_Lib"; "CoreTypes"; "Int64"; "to_string" ]
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
                       qualified_apply
                         ~names:
                           [
                             "Smaws_Lib";
                             "Protocols";
                             "RestXml";
                             "Serialize";
                             "float_field_to_string";
                           ]
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
                       qualified_apply ~names:[ "Base64"; "encode_exn" ]
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
  let xml_read_mod = [ "Read" ]
  let xml_struct_mod = [ "Structure" ]
  let xml_call module_path func args = qualified_apply ~names:(module_path @ [ func ]) args

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
        (Nolabel, exp_fun_ident_any "i" body);
        (Nolabel, unit_expr);
      ]

  let read_sequences tag body =
    xml_call xml_read_mod "sequences"
      [
        (Nolabel, exp_ident "i");
        (Nolabel, const_str tag);
        (Nolabel, exp_fun_ident_any "i" body);
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

  let xml_primitive_mod = [ "Primitive" ]

  (* The [Xml.Parse.Primitive.<kind>_of_string] converter for a smithy primitive
     target, or [None] for non-primitives. [String] maps to [Fun.id] (no parse,
     no failure); [Timestamp] defaults to the iso (rfc3339) format, matching the
     previous [Ptime.of_rfc3339] behaviour for list/map items — member
     timestamps take a format-specific path in [member_reader_expr]. *)
  let primitive_conv target_name =
    match target_name with
    | "smithy.api#String" -> Some (exp_ident "Fun.id")
    | "smithy.api#Integer" | "smithy.api#Byte" | "smithy.api#Short" ->
        Some (qualified_ident ~names:(xml_primitive_mod @ [ "int_of_string" ]))
    | "smithy.api#Long" -> Some (qualified_ident ~names:(xml_primitive_mod @ [ "long_of_string" ]))
    | "smithy.api#BigInteger" ->
        Some (qualified_ident ~names:(xml_primitive_mod @ [ "big_int_of_string" ]))
    | "smithy.api#BigDecimal" ->
        Some (qualified_ident ~names:(xml_primitive_mod @ [ "big_decimal_of_string" ]))
    | "smithy.api#Boolean" ->
        Some (qualified_ident ~names:(xml_primitive_mod @ [ "bool_of_string" ]))
    | "smithy.api#Float" ->
        Some (qualified_ident ~names:(xml_primitive_mod @ [ "float_of_string" ]))
    | "smithy.api#Double" ->
        Some (qualified_ident ~names:(xml_primitive_mod @ [ "double_of_string" ]))
    | "smithy.api#Blob" -> Some (qualified_ident ~names:(xml_primitive_mod @ [ "blob_of_string" ]))
    | "smithy.api#Timestamp" ->
        Some (qualified_ident ~names:(xml_primitive_mod @ [ "timestamp_iso_of_string" ]))
    | _ -> None

  (* Read [<tag>]'s text and run [conv] on it, decorating a parse failure
     with [tag] (see [Xml.Parse.Read.element_value]). *)
  let read_element_value tag conv =
    xml_call xml_read_mod "element_value"
      [ (Nolabel, exp_ident "i"); (Nolabel, const_str tag); (Nolabel, conv); (Nolabel, unit_expr) ]

  (* Read every [<tag>] child's text and map [conv] across them, decorating a
     parse failure with [tag] (see [Xml.Parse.Read.elements_value]). *)
  let read_elements_value tag conv =
    xml_call xml_read_mod "elements_value"
      [ (Nolabel, exp_ident "i"); (Nolabel, const_str tag); (Nolabel, conv); (Nolabel, unit_expr) ]

  let map_entry_body ~namespace_resolver (ms : Shape.mapShapeDetails) =
    let key_tag = xml_name ms.mapKey.traits "key" in
    let val_tag = xml_name ms.mapValue.traits "value" in
    let key_expr =
      match primitive_conv ms.mapKey.target with
      | Some conv -> read_element_value key_tag conv
      | None ->
          let kf =
            B.pexp_ident (Location.mknoloc (func_longident ~namespace_resolver ms.mapKey.target))
          in
          read_sequence key_tag (B.pexp_apply kf [ (Nolabel, exp_ident "i") ])
    in
    let val_expr =
      match primitive_conv ms.mapValue.target with
      | Some conv -> read_element_value val_tag conv
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
    match primitive_conv target with
    | Some conv -> read_elements_value item_tag conv
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
    match target_name with
    | "smithy.api#Timestamp" ->
        let fmt = resolve_timestamp_format ~member_traits ~shape_traits:None () in
        let helper =
          match fmt with
          | Trait.TimestampFormatDateTime -> "timestamp_iso_of_string"
          | Trait.TimestampFormatEpochSeconds -> "timestamp_epoch_of_string"
          | Trait.TimestampFormatHttpDate -> "timestamp_httpdate_of_string"
        in
        let conv = qualified_ident ~names:(xml_primitive_mod @ [ helper ]) in
        assign (read_element_value xml_tag conv)
    | _ -> (
        match primitive_conv target_name with
        | Some conv -> assign (read_element_value xml_tag conv)
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
          exp_fun_ident_any "tag" (B.pexp_match (exp_ident "tag") (cases @ [ wildcard_case ])) );
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
            xml_call [] "required"
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

  let deser_mod = xml_primitive_mod

  let read_data_lambda () =
    exp_fun_untyped "i" (xml_call xml_read_mod "data" [ (Nolabel, exp_ident "i") ])

  let primitive_of_xml_lambda helper =
    let s_expr = xml_call xml_read_mod "data" [ (Nolabel, exp_ident "i") ] in
    exp_fun_untyped "i" (qualified_apply ~names:(deser_mod @ [ helper ]) [ (Nolabel, s_expr) ])

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
             (qualified_apply ~names:(deser_mod @ [ helper ]) [ (Nolabel, s_expr) ]))
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
               (qualified_apply ~names:(deser_mod @ [ helper ]) [ (Nolabel, s_expr) ])))
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
      let default_handler = qualified_ident ~names:(restxml_mod @ [ "error_to_string" ]) in
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

  (* generate_error_handler is defined further below, after the output/error
     deserialiser helpers (scan_inner_expr etc.) it depends on. *)

  (* ------------------------------------------------------------------ *)
  (* HTTP binding assembly helpers (Phase 7: plan §7.3)                  *)
  (* ------------------------------------------------------------------ *)

  let uuid_mod = [ "Smaws_Lib"; "Uuid" ]
  let serialize_mod = restxml_mod @ [ "Serialize" ]

  (* Extract a trait value from a trait list. *)
  let find_trait (traits : Trait.t list option) (f : Trait.t -> 'a option) : 'a option =
    Option.bind traits ~f:(fun ts -> List.find_map ts ~f)

  let trait_mem (traits : Trait.t list option) (f : Trait.t -> bool) : bool =
    match traits with Some ts -> List.exists ts ~f | None -> false

  let is_http_label (mem : Shape.member) =
    trait_mem mem.traits (function Trait.HttpLabelTrait -> true | _ -> false)

  let is_http_payload (mem : Shape.member) =
    trait_mem mem.traits (function Trait.HttpPayloadTrait -> true | _ -> false)

  let is_host_label (mem : Shape.member) =
    trait_mem mem.traits (function Trait.HostLabelTrait -> true | _ -> false)

  let is_http_query_params (mem : Shape.member) =
    trait_mem mem.traits (function Trait.HttpQueryParams -> true | _ -> false)

  let is_idempotency_token (mem : Shape.member) =
    trait_mem mem.traits (function Trait.IdempotencyTokenTrait -> true | _ -> false)

  let http_query_name (mem : Shape.member) =
    find_trait mem.traits (function Trait.HttpQueryTrait n -> Some n | _ -> None)

  let http_header_name (mem : Shape.member) =
    find_trait mem.traits (function Trait.HttpHeaderTrait n -> Some n | _ -> None)

  let http_prefix_headers (mem : Shape.member) =
    find_trait mem.traits (function Trait.HttpPrefixHeadersTrait p -> Some p | _ -> None)

  (* A member is serialized into the request body unless an HTTP binding trait
     relocates it out of the body. [@xmlAttribute] members count as body
     members - they render as attributes on the body-root element. [@hostLabel]
     members are NOT excluded: the smithy restXml fixtures serialise them into
     the body in addition to substituting them into the [@endpoint] hostPrefix. *)
  let is_body_member (mem : Shape.member) =
    not
      (is_http_label mem || is_http_payload mem
      || Option.is_some (http_query_name mem)
      || is_http_query_params mem
      || Option.is_some (http_header_name mem)
      || Option.is_some (http_prefix_headers mem))

  (* A member is read from the response body unless an HTTP binding trait
     relocates it to the response headers / status. Note [@httpQuery]/
     [@httpLabel]/[@httpQueryParams]/[@hostLabel] are request-side bindings; on an
     OUTPUT member they are ignored and the member is read from the body (see
     [aws.protocoltests.restxml#IgnoreQueryParamsInResponse]). *)
  let is_output_body_member (mem : Shape.member) =
    not
      (is_http_payload mem
      || Option.is_some (http_header_name mem)
      || Option.is_some (http_prefix_headers mem)
      || trait_mem mem.traits (function Trait.HttpResponseCodeTrait -> true | _ -> false))

  let http_trait_of (operation_shape : Shape.operationShapeDetails) =
    find_trait operation_shape.traits (function Trait.HttpTrait h -> Some h | _ -> None)

  let endpoint_trait_of (operation_shape : Shape.operationShapeDetails) =
    find_trait operation_shape.traits (function Trait.EndpointTrait e -> Some e | _ -> None)

  let method_variant (method_ : string) =
    match method_ with
    | "GET" -> B.pexp_variant "GET" None
    | "POST" -> B.pexp_variant "POST" None
    | "PUT" -> B.pexp_variant "PUT" None
    | "DELETE" -> B.pexp_variant "DELETE" None
    | "HEAD" -> B.pexp_variant "HEAD" None
    | "OPTIONS" -> B.pexp_variant "OPTIONS" None
    | "CONNECT" -> B.pexp_variant "CONNECT" None
    | "TRACE" -> B.pexp_variant "TRACE" None
    | other -> B.pexp_variant "Other" (Some (const_str other))

  (* Field access on the input value [request]. *)
  let request_field (mem : Shape.member) =
    B.pexp_field (exp_ident "request") (lident_noloc (SafeNames.safeMemberName mem.name))

  (* Bind a member's value to [v] and run [body_fn v]. For a [@required]
     member the field is a bare value: [let v = request.<field> in body_fn v].
     For an optional member: [match request.<field> with Some v -> body_fn v
     | None -> []] (the [None] case yields the empty contribution). *)
  let field_binding_expr (mem : Shape.member) body_fn =
    let field = request_field mem in
    if is_required mem.traits then
      B.pexp_let Nonrecursive
        [ B.value_binding ~pat:(B.ppat_var (Location.mknoloc "v")) ~expr:field ]
        (body_fn (exp_ident "v"))
    else
      B.pexp_match field
        [
          B.case
            ~lhs:(B.ppat_construct (lident_noloc "Some") (Some (B.ppat_var (Location.mknoloc "v"))))
            ~guard:None
            ~rhs:(body_fn (exp_ident "v"));
          B.case ~lhs:(B.ppat_construct (lident_noloc "None") None) ~guard:None ~rhs:(B.elist []);
        ]

  (* The [@timestampFormat] default for a binding location: [date-time] for
     @httpLabel/@httpQuery, [http-date] for @httpHeader (plan §2.4). *)
  let timestamp_default_of_binding = function
    | `Label | `Query -> Trait.TimestampFormatDateTime
    | `Header -> Trait.TimestampFormatHttpDate

  let resolve_timestamp_format' ~member_traits ~shape_traits ~default =
    let find_fmt ts =
      find_trait ts (function Trait.TimestampFormatTrait x -> Some x | _ -> None)
    in
    match find_fmt member_traits with
    | Some f -> f
    | None -> ( match find_fmt shape_traits with Some f -> f | None -> default)

  (* [fun v -> string] for a scalar / enum value in an @httpLabel / @httpQuery /
     @httpHeader position. [None] if the target is a complex (structure / union /
     list / map) shape - the call site handles lists by mapping. *)
  let enum_to_string_lambda ~namespace_resolver ~shape_resolver target_name =
    match Shape_resolver.find_shape_by_name ~name:target_name shape_resolver with
    | Some (Shape.EnumShape s) ->
        (* The enum constructors live in the enum's home [Types] module (e.g.
           [Shared.Types.C] for [aws.protocoltests.shared#IntegerEnum]); qualify
           them so the generated match resolves from any operation module. For a
           local enum the path is empty and the constructor is unqualified. *)
        let module_path =
          let resolved =
            Namespace_resolver.Namespace_resolver.resolve_reference
              ~symbol_transformer:(fun ~local x ->
                if local then [ SafeNames.safeTypeName x ]
                else [ "Types"; SafeNames.safeTypeName x ])
              namespace_resolver target_name
          in
          match List.rev resolved with _ :: rest -> List.rev rest | [] -> []
        in
        let cases =
          List.map s.members ~f:(fun (m : Shape.member) ->
              let value =
                List.find_map_exn (Option.value ~default:[] m.traits) ~f:(function
                  | Trait.EnumValueTrait e -> Some e
                  | _ -> None)
              in
              let ctor = SafeNames.safeConstructorName m.name in
              let ctor_ident = make_lident ~names:(module_path @ [ ctor ]) |> Location.mknoloc in
              let rhs =
                match value with
                | `String sv -> const_str sv
                | `Int iv -> B.pexp_apply (exp_ident "string_of_int") [ (Nolabel, exp_int iv) ]
              in
              B.case ~lhs:(B.ppat_construct ctor_ident None) ~guard:None ~rhs)
        in
        Some (exp_fun_untyped "v" (B.pexp_match (exp_ident "v") cases))
    | _ -> None

  let timestamp_lambda ~member_traits ~shape_traits ~binding =
    let fmt =
      resolve_timestamp_format' ~member_traits ~shape_traits
        ~default:(timestamp_default_of_binding binding)
    in
    let helper_name =
      match fmt with
      | Trait.TimestampFormatDateTime -> "timestamp_iso_to_string"
      | Trait.TimestampFormatEpochSeconds -> "timestamp_epoch_to_string"
      | Trait.TimestampFormatHttpDate -> "timestamp_httpdate_to_string"
    in
    exp_fun_untyped "v"
      (qualified_apply ~names:(serialize_mod @ [ helper_name ]) [ (Nolabel, exp_ident "v") ])

  (* [fun v -> string] for a scalar / enum value in an @httpLabel / @httpQuery /
     @httpHeader position. Resolves named shapes (e.g. a [@timestampFormat]
     timestamp shape like [EpochSeconds]) as well as [smithy.api#*] primitives.
     [None] if the target is a complex (structure / union / list / map) shape -
     the call site handles lists by mapping. *)
  let scalar_to_string_lambda ~namespace_resolver ~shape_resolver ~member_traits ~shape_traits
      ~binding target_name =
    match Shape_resolver.find_shape_by_name ~name:target_name shape_resolver with
    | Some (Shape.StringShape _) -> Some (exp_fun_untyped "v" (exp_ident "v"))
    | Some (Shape.IntegerShape _ | Shape.ByteShape _ | Shape.ShortShape _) ->
        Some (exp_fun_untyped "v" [%expr string_of_int v])
    | Some (Shape.LongShape _) ->
        Some
          (exp_fun_untyped "v"
             (qualified_apply
                ~names:[ "Smaws_Lib"; "CoreTypes"; "Int64"; "to_string" ]
                [ (Nolabel, exp_ident "v") ]))
    | Some (Shape.BooleanShape _) -> Some (exp_fun_untyped "v" [%expr string_of_bool v])
    | Some (Shape.FloatShape _ | Shape.DoubleShape _) ->
        Some
          (exp_fun_untyped "v"
             (qualified_apply
                ~names:(serialize_mod @ [ "float_field_to_string" ])
                [ (Nolabel, exp_ident "v") ]))
    | Some (Shape.TimestampShape { traits }) ->
        Some (timestamp_lambda ~member_traits ~shape_traits:traits ~binding)
    | Some (Shape.BlobShape _) ->
        Some (exp_fun_untyped "v" [%expr Base64.encode_exn (Bytes.to_string v)])
    | Some (Shape.EnumShape _) ->
        enum_to_string_lambda ~namespace_resolver ~shape_resolver target_name
    | _ -> (
        (* [smithy.api#*] primitive targets (no named shape in the model). *)
        match target_name with
        | "smithy.api#String" -> Some (exp_fun_untyped "v" (exp_ident "v"))
        | "smithy.api#Integer" | "smithy.api#Byte" | "smithy.api#Short" ->
            Some (exp_fun_untyped "v" [%expr string_of_int v])
        | "smithy.api#Long" ->
            Some
              (exp_fun_untyped "v"
                 (qualified_apply
                    ~names:[ "Smaws_Lib"; "CoreTypes"; "Int64"; "to_string" ]
                    [ (Nolabel, exp_ident "v") ]))
        | "smithy.api#Boolean" -> Some (exp_fun_untyped "v" [%expr string_of_bool v])
        | "smithy.api#Float" | "smithy.api#Double" ->
            Some
              (exp_fun_untyped "v"
                 (qualified_apply
                    ~names:(serialize_mod @ [ "float_field_to_string" ])
                    [ (Nolabel, exp_ident "v") ]))
        | "smithy.api#Timestamp" -> Some (timestamp_lambda ~member_traits ~shape_traits ~binding)
        | "smithy.api#Blob" ->
            Some (exp_fun_untyped "v" [%expr Base64.encode_exn (Bytes.to_string v)])
        | _ -> None)

  (* Whether a target shape is a list/set. *)
  let target_is_list ~shape_resolver (target_name : string) =
    match Shape_resolver.find_shape_by_name ~name:target_name shape_resolver with
    | Some (Shape.ListShape _ | Shape.SetShape _) -> true
    | _ -> false

  (* For a list/set member target, the item target and the list member traits
     (used to resolve [@timestampFormat] on list items). [None] for non-lists. *)
  let list_item_info ~shape_resolver target_name =
    match Shape_resolver.find_shape_by_name ~name:target_name shape_resolver with
    | Some (Shape.ListShape ls) -> Some (ls.target, ls.memberTraits)
    | Some (Shape.SetShape ss) -> Some (ss.target, None)
    | _ -> None

  (* Serializer function reference for a shape (None for [smithy.api#Unit]). *)
  let serializer_ref_expr ~namespace_resolver input_name =
    if String.equal input_name "smithy.api#Unit" then None
    else (
      let sym_transformer ~local x =
        if local then [ Serialiser.serialiser_func_str x ]
        else [ "Xml_serializers"; Serialiser.serialiser_func_str x ]
      in
      let func_ident =
        Namespace_resolver.Namespace_resolver.resolve_reference ~symbol_transformer:sym_transformer
          namespace_resolver input_name
        |> Longident.unflatten |> Option.value_exn
      in
      Some (B.pexp_ident (Location.mknoloc func_ident)))

  (* Deserializer function reference for an output shape. *)
  let deserializer_ref_expr ~namespace_resolver output_name =
    if String.equal output_name "smithy.api#Unit" then
      qualified_ident ~names:[ "Xml_deserializers"; "unit_of_xml" ]
    else (
      let sym_transformer ~local x =
        if local then [ Deserialiser.deserialiser_func_str x ]
        else [ "Xml_deserializers"; Deserialiser.deserialiser_func_str x ]
      in
      let func_ident =
        Namespace_resolver.Namespace_resolver.resolve_reference ~symbol_transformer:sym_transformer
          namespace_resolver output_name
        |> Longident.unflatten |> Option.value_exn
      in
      B.pexp_ident (Location.mknoloc func_ident))

  (* ------------------------------------------------------------------ *)
  (* Output / error deserialiser generation (Phase 8: plan §7.2 wiring)    *)
  (* ------------------------------------------------------------------ *)
  let parse_mod = [ "Smaws_Lib"; "Xml"; "Parse" ]
  let enter_root_fn = qualified_ident ~names:(parse_mod @ [ "Read"; "enter_root" ])
  let parse_primitive_mod = parse_mod @ [ "Primitive" ]
  let header_value_fn = qualified_ident ~names:(restxml_mod @ [ "header_value" ])
  let prefix_headers_fn = qualified_ident ~names:(restxml_mod @ [ "prefix_headers" ])

  (* [fun i attrs -> exp]: a two-parameter lambda binding the root element's attribute list.
     Used by [Read.enter_root] readers that need to read [@xmlAttribute] members from the root. *)
  let exp_fun_ident_attrs arg_name exp =
    B.pexp_fun Ppxlib.Nolabel None
      (B.ppat_var (Location.mknoloc arg_name))
      (B.pexp_fun Ppxlib.Nolabel None (B.ppat_var (Location.mknoloc "attrs")) exp)

  (* string -> target leaf parser for an @httpHeader value (inverse of
     [scalar_to_string_lambda]). [None] for non-leaf targets. Default timestamp
     format for headers is [http-date] (plan §2.4). *)
  let rec scalar_of_string_lambda ~namespace_resolver ~shape_resolver ~member_traits ~shape_traits
      target =
    let mk helper =
      exp_fun_untyped "s"
        (qualified_apply ~names:(parse_primitive_mod @ [ helper ]) [ (Nolabel, exp_ident "s") ])
    in
    let timestamp_helper fmt =
      match fmt with
      | Trait.TimestampFormatDateTime -> "timestamp_iso_of_string"
      | Trait.TimestampFormatEpochSeconds -> "timestamp_epoch_of_string"
      | Trait.TimestampFormatHttpDate -> "timestamp_httpdate_of_string"
    in
    match Shape_resolver.find_shape_by_name ~name:target shape_resolver with
    | Some (Shape.StringShape _) -> Some (exp_fun_untyped "s" (exp_ident "s"))
    | Some (Shape.IntegerShape _ | Shape.ByteShape _ | Shape.ShortShape _) ->
        Some (mk "int_of_string")
    | Some (Shape.LongShape _) -> Some (mk "long_of_string")
    | Some (Shape.BigIntegerShape _) -> Some (mk "big_int_of_string")
    | Some (Shape.BigDecimalShape _) -> Some (mk "big_decimal_of_string")
    | Some (Shape.BooleanShape _) -> Some (mk "bool_of_string")
    | Some (Shape.FloatShape _) -> Some (mk "float_of_string")
    | Some (Shape.DoubleShape _) -> Some (mk "double_of_string")
    | Some (Shape.BlobShape _) -> Some (mk "blob_of_string")
    | Some (Shape.TimestampShape { traits }) ->
        let fmt =
          resolve_timestamp_format' ~member_traits ~shape_traits:traits
            ~default:Trait.TimestampFormatHttpDate
        in
        Some (mk (timestamp_helper fmt))
    | Some (Shape.EnumShape _) -> enum_of_string_lambda ~namespace_resolver ~shape_resolver target
    | _ -> (
        match target with
        | "smithy.api#String" -> Some (exp_fun_untyped "s" (exp_ident "s"))
        | "smithy.api#Integer" | "smithy.api#Byte" | "smithy.api#Short" -> Some (mk "int_of_string")
        | "smithy.api#Long" -> Some (mk "long_of_string")
        | "smithy.api#BigInteger" -> Some (mk "big_int_of_string")
        | "smithy.api#BigDecimal" -> Some (mk "big_decimal_of_string")
        | "smithy.api#Boolean" -> Some (mk "bool_of_string")
        | "smithy.api#Float" -> Some (mk "float_of_string")
        | "smithy.api#Double" -> Some (mk "double_of_string")
        | "smithy.api#Blob" -> Some (mk "blob_of_string")
        | "smithy.api#Timestamp" ->
            let fmt =
              resolve_timestamp_format' ~member_traits ~shape_traits
                ~default:Trait.TimestampFormatHttpDate
            in
            Some (mk (timestamp_helper fmt))
        | _ -> None)

  and enum_of_string_lambda ~namespace_resolver ~shape_resolver target =
    match Shape_resolver.find_shape_by_name ~name:target shape_resolver with
    | Some (Shape.EnumShape s) ->
        let module_path =
          let resolved =
            Namespace_resolver.Namespace_resolver.resolve_reference
              ~symbol_transformer:(fun ~local x ->
                if local then [ SafeNames.safeTypeName x ]
                else [ "Types"; SafeNames.safeTypeName x ])
              namespace_resolver target
          in
          match List.rev resolved with _ :: rest -> List.rev rest | [] -> []
        in
        let cases =
          List.map s.members ~f:(fun (m : Shape.member) ->
              let value =
                List.find_map_exn (Option.value ~default:[] m.traits) ~f:(function
                  | Trait.EnumValueTrait e -> Some e
                  | _ -> None)
              in
              let ctor = SafeNames.safeConstructorName m.name in
              let ctor_ident = make_lident ~names:(module_path @ [ ctor ]) |> Location.mknoloc in
              let pat =
                match value with
                | `String sv -> pat_const_str sv
                | `Int iv -> pat_const_str (Int.to_string iv)
              in
              B.case ~lhs:pat ~guard:None ~rhs:(B.pexp_construct ctor_ident None))
        in
        let failure =
          B.case ~lhs:B.ppat_any ~guard:None ~rhs:[%expr failwith "unknown enum value"]
        in
        Some (exp_fun_untyped "s" (B.pexp_match (exp_ident "s") (cases @ [ failure ])))
    | _ -> None

  let is_http_response_code (mem : Shape.member) =
    trait_mem mem.traits (function Trait.HttpResponseCodeTrait -> true | _ -> false)

  (* Strip a namespace prefix from an [@xmlName] for matching against [Xmlm]'s
     resolved attribute local name (e.g. [xsi:someName] -> [someName]). *)
  let attr_local_name name =
    match String.index name ':' with
    | Some i -> String.sub ~pos:(i + 1) ~len:(String.length name - i - 1) name
    | None -> name

  (* The option-typed value expression for a non-body-scan (overlay) member,
     assuming the in-scope identifiers [attrs]/[headers]/[status]. Covers
     [@xmlAttribute] (root attrs), [@httpHeader] (headers, incl. list split on
     ", "), [@httpPrefixHeaders] (headers), [@httpResponseCode] (status). *)
  let overlay_option_expr ~namespace_resolver ~shape_resolver ~(mem : Shape.member)
      ~(attrs_var : Ppxlib.expression) ~(headers_var : Ppxlib.expression)
      ~(status_var : Ppxlib.expression) =
    let field_name = xml_name mem.traits mem.name in
    if is_attribute mem.traits then (
      let conv =
        Option.value
          (scalar_of_string_lambda ~namespace_resolver ~shape_resolver ~member_traits:mem.traits
             ~shape_traits:None mem.target)
          ~default:(exp_ident "Fun.id")
      in
      let find =
        [%expr
          List.find_map
            (fun ((_, n), v) ->
              if String.equal n [%e const_str (attr_local_name field_name)] then Some v else None)
            [%e attrs_var]]
      in
      [%expr Option.map [%e conv] [%e find]])
    else if Option.is_some (http_header_name mem) then (
      let name = Option.value_exn (http_header_name mem) in
      match list_item_info ~shape_resolver mem.target with
      | Some (item_target, item_member_traits) ->
          let conv =
            Option.value
              (scalar_of_string_lambda ~namespace_resolver ~shape_resolver
                 ~member_traits:item_member_traits ~shape_traits:None item_target)
              ~default:(exp_ident "Fun.id")
          in
          [%expr
            Option.map
              (fun s -> String.split_on_char ',' s |> List.map String.trim |> List.map [%e conv])
              ([%e header_value_fn] [%e headers_var] [%e const_str name])]
      | None ->
          let conv =
            Option.value
              (scalar_of_string_lambda ~namespace_resolver ~shape_resolver ~member_traits:mem.traits
                 ~shape_traits:None mem.target)
              ~default:(exp_ident "Fun.id")
          in
          [%expr Option.map [%e conv] ([%e header_value_fn] [%e headers_var] [%e const_str name])])
    else if Option.is_some (http_prefix_headers mem) then (
      let prefix = Option.value_exn (http_prefix_headers mem) in
      let map_value_target =
        match Shape_resolver.find_shape_by_name ~name:mem.target shape_resolver with
        | Some (Shape.MapShape ms) -> ms.mapValue.target
        | _ -> "smithy.api#String"
      in
      let conv =
        Option.value
          (scalar_of_string_lambda ~namespace_resolver ~shape_resolver ~member_traits:None
             ~shape_traits:None map_value_target)
          ~default:(exp_ident "Fun.id")
      in
      [%expr
        Some
          ([%e prefix_headers_fn] ~prefix:[%e const_str prefix] [%e headers_var]
          |> List.map (fun (k, v) -> (k, [%e conv] v)))])
    else if is_http_response_code mem then [%expr Some [%e status_var]]
    else [%expr None]

  (* Wrap an option-typed value for a [@required] member: [required tag opt i]
     when [i] is in scope (root scan path), else an explicit match. Optional
     members keep the [option] value. *)
  let field_value_expr ~(mem : Shape.member) ~opt_expr ~i_in_scope =
    if is_required mem.traits then
      if i_in_scope then
        B.pexp_apply (exp_ident "required")
          [
            (Nolabel, const_str (xml_name mem.traits mem.name));
            (Nolabel, opt_expr);
            (Nolabel, exp_ident "i");
          ]
      else
        [%expr match [%e opt_expr] with Some v -> v | None -> failwith "missing required field"]
    else opt_expr

  (* The inner expression (refs + child scan + typed record) for a structure
     whose root element has been entered via [Read.enter_root], assuming
     [i]/[attrs]/[headers]/[status] are in scope. Body-scan members are read
     from child elements (refs + [Structure.scanSequence]); [@xmlAttribute]
     members from [attrs]; [@httpHeader]/[@httpPrefixHeaders]/[@httpResponseCode]
     members are overlaid from [headers]/[status]. *)
  let scan_inner_expr ~out_name ~members ~namespace_resolver ~shape_resolver =
    (* Empty structures are generated as [type t = unit]; an empty record
       literal [{ }] is not valid OCaml, so return [()] cast to the type. *)
    if List.is_empty members then
      B.pexp_constraint unit_expr
        (B.ptyp_constr (lident_noloc (SafeNames.safeTypeName out_name)) [])
    else begin
      let body_scan_members =
        List.filter members ~f:(fun m -> is_output_body_member m && not (is_attribute m.traits))
      in
      let ref_bindings = Deserialiser.structure_ref_bindings body_scan_members in
      let scan_call =
        Deserialiser.structure_scan_call ~namespace_resolver ~shape_resolver body_scan_members
      in
      let record_fields =
        List.map members ~f:(fun mem ->
            let opt_expr =
              if is_output_body_member mem && not (is_attribute mem.traits) then
                B.pexp_apply (exp_ident "( ! )")
                  [ (Nolabel, exp_ident (Deserialiser.member_ref_name mem)) ]
              else
                overlay_option_expr ~namespace_resolver ~shape_resolver ~mem
                  ~attrs_var:(exp_ident "attrs") ~headers_var:(exp_ident "headers")
                  ~status_var:(exp_ident "status")
            in
            let val_expr = field_value_expr ~mem ~opt_expr ~i_in_scope:true in
            (lident_noloc (SafeNames.safeMemberName mem.name), val_expr))
      in
      let record = B.pexp_record record_fields None in
      let typed =
        B.pexp_constraint record (B.ptyp_constr (lident_noloc (SafeNames.safeTypeName out_name)) [])
      in
      List.fold_right ref_bindings ~init:(B.pexp_sequence scan_call typed) ~f:(fun b acc ->
          B.pexp_let Nonrecursive [ b ] acc)
    end

  (* A typed record built purely from overlay members ([@httpHeader]/
     [@httpPrefixHeaders]/[@httpResponseCode]) - no body root, no child scan,
     no [i]. Used when an output has no body members (empty response body). *)
  let overlay_record_expr ~out_name ~members ~i_in_scope ~namespace_resolver ~shape_resolver =
    let record_fields =
      List.map members ~f:(fun mem ->
          let opt_expr =
            overlay_option_expr ~namespace_resolver ~shape_resolver ~mem
              ~attrs_var:(exp_ident "attrs") ~headers_var:(exp_ident "headers")
              ~status_var:(exp_ident "status")
          in
          let val_expr = field_value_expr ~mem ~opt_expr ~i_in_scope in
          (lident_noloc (SafeNames.safeMemberName mem.name), val_expr))
    in
    let record = B.pexp_record record_fields None in
    B.pexp_constraint record (B.ptyp_constr (lident_noloc (SafeNames.safeTypeName out_name)) [])

  (* A typed record for an [@httpPayload] output: the payload member takes a
     precomputed [payload_opt] (an [option] expression); the remaining members are
     overlaid from [headers]/[status]. *)
  let payload_record_expr ~out_name ~(pmem : Shape.member) ~members ~payload_opt ~i_in_scope
      ~namespace_resolver ~shape_resolver =
    let other_members = List.filter members ~f:(fun m -> not (is_http_payload m)) in
    let payload_field =
      let val_expr = field_value_expr ~mem:pmem ~opt_expr:payload_opt ~i_in_scope in
      (lident_noloc (SafeNames.safeMemberName pmem.name), val_expr)
    in
    let other_fields =
      List.map other_members ~f:(fun mem ->
          let opt_expr =
            overlay_option_expr ~namespace_resolver ~shape_resolver ~mem
              ~attrs_var:(exp_ident "attrs") ~headers_var:(exp_ident "headers")
              ~status_var:(exp_ident "status")
          in
          let val_expr = field_value_expr ~mem ~opt_expr ~i_in_scope in
          (lident_noloc (SafeNames.safeMemberName mem.name), val_expr))
    in
    let record = B.pexp_record (payload_field :: other_fields) None in
    B.pexp_constraint record (B.ptyp_constr (lident_noloc (SafeNames.safeTypeName out_name)) [])

  (* The per-operation [output_deserializer] lambda: [fun ~body ~headers ~status
     -> ...]. Reads the body root (name-agnostic) for XML outputs, or the raw
     [body] string for [@httpPayload] blob/string/enum outputs; overlays
     [@httpHeader]/[@httpPrefixHeaders]/[@httpResponseCode] from [headers]/[status]. *)
  let generate_output_deserializer_expr ~(operation_shape : Shape.operationShapeDetails)
      ~namespace_resolver ~shape_resolver =
    match operation_shape.output with
    | None | Some "smithy.api#Unit" -> [%expr fun ~body ~headers ~status -> ()]
    | Some out_name ->
        let members =
          match Shape_resolver.find_shape_by_name ~name:out_name shape_resolver with
          | Some (Shape.StructureShape s | Shape.UnionShape s) -> s.members
          | _ -> []
        in
        if List.is_empty members then [%expr fun ~body ~headers ~status -> ()]
        else begin
          let pmem = List.find members ~f:is_http_payload in
          match pmem with
          | Some pmem -> (
              let target = pmem.target in
              let pshape = Shape_resolver.find_shape_by_name ~name:target shape_resolver in
              match pshape with
              | Some (Shape.StructureShape ps | Shape.UnionShape ps) ->
                  let is_union =
                    match pshape with Some (Shape.UnionShape _) -> true | _ -> false
                  in
                  let payload_inner =
                    if is_union then (
                      let deser =
                        B.pexp_ident
                          (Location.mknoloc
                             (Deserialiser.func_longident ~namespace_resolver target))
                      in
                      B.pexp_apply deser [ (Nolabel, exp_ident "i") ])
                    else
                      scan_inner_expr ~out_name:target ~members:ps.members ~namespace_resolver
                        ~shape_resolver
                  in
                  let payload_enter =
                    B.pexp_apply enter_root_fn
                      [
                        (Nolabel, exp_ident "i");
                        ( Nolabel,
                          if is_union then exp_fun_ident_any "i" payload_inner
                          else exp_fun_ident_attrs "i" payload_inner );
                      ]
                  in
                  let record =
                    payload_record_expr ~out_name ~pmem ~members
                      ~payload_opt:(exp_ident "payload_val") ~i_in_scope:false ~namespace_resolver
                      ~shape_resolver
                  in
                  [%expr
                    fun ~body ~headers ~status ->
                      let payload_val =
                        if String.equal body "" then None
                        else (
                          let i =
                            Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body
                              ~encoding:None
                          in
                          Smaws_Lib.Xml.Parse.Read.dtd i;
                          Some [%e payload_enter])
                      in
                      [%e record]]
              | Some (Shape.BlobShape _) ->
                  let conv =
                    qualified_apply
                      ~names:[ "Smaws_Lib"; "CoreTypes"; "Blob"; "of_string" ]
                      [ (Nolabel, exp_ident "body") ]
                  in
                  let payload_opt = [%expr if String.equal body "" then None else Some [%e conv]] in
                  let record =
                    payload_record_expr ~out_name ~pmem ~members ~payload_opt ~i_in_scope:false
                      ~namespace_resolver ~shape_resolver
                  in
                  [%expr fun ~body ~headers ~status -> [%e record]]
              | Some (Shape.StringShape _) ->
                  let payload_opt = [%expr if String.equal body "" then None else Some body] in
                  let record =
                    payload_record_expr ~out_name ~pmem ~members ~payload_opt ~i_in_scope:false
                      ~namespace_resolver ~shape_resolver
                  in
                  [%expr fun ~body ~headers ~status -> [%e record]]
              | Some (Shape.EnumShape _) ->
                  let conv =
                    Option.value_exn
                      (enum_of_string_lambda ~namespace_resolver ~shape_resolver target)
                  in
                  let applied = B.pexp_apply conv [ (Nolabel, exp_ident "body") ] in
                  let payload_opt =
                    [%expr if String.equal body "" then None else Some [%e applied]]
                  in
                  let record =
                    payload_record_expr ~out_name ~pmem ~members ~payload_opt ~i_in_scope:false
                      ~namespace_resolver ~shape_resolver
                  in
                  [%expr fun ~body ~headers ~status -> [%e record]]
              | _ ->
                  let record =
                    payload_record_expr ~out_name ~pmem ~members ~payload_opt:[%expr None]
                      ~i_in_scope:false ~namespace_resolver ~shape_resolver
                  in
                  [%expr fun ~body ~headers ~status -> [%e record]])
          | None ->
              let body_root_needed = List.exists members ~f:is_output_body_member in
              if body_root_needed then (
                let inner =
                  scan_inner_expr ~out_name ~members ~namespace_resolver ~shape_resolver
                in
                [%expr
                  fun ~body ~headers ~status ->
                    let i =
                      Smaws_Lib.Xml.Parse.source_with_encoding ~strip:false ~src:body ~encoding:None
                    in
                    Smaws_Lib.Xml.Parse.Read.dtd i;
                    Smaws_Lib.Xml.Parse.Read.enter_root i (fun i attrs -> [%e inner])])
              else (
                let record =
                  overlay_record_expr ~out_name ~members ~i_in_scope:false ~namespace_resolver
                    ~shape_resolver
                in
                [%expr fun ~body ~headers ~status -> [%e record]])
        end

  (* The per-operation [error_deserializer]: [fun (error : Error.t) ~body ~headers
     -> ...]. For an error shape with [@httpHeader]/[@httpPrefixHeaders]
     members, a custom structParser (built by [scan_inner_expr]) reads the body
     members from the [<Error>] envelope children and the header-bound members
     from the response [headers]; otherwise the per-shape [<error>_of_xml] is
     used (positioned inside [<Error>] by [parse_error_struct]). *)
  let generate_error_handler ~(operation_shape : Ast.Shape.operationShapeDetails)
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t)
      ~(shape_resolver : Shape_resolver.t) () =
    let errors = operation_shape.errors |> Option.value ~default:[] in
    let default_handler = qualified_ident ~names:(restxml_mod @ [ "Errors"; "default_handler" ]) in
    let parse_error_struct = qualified_ident ~names:(restxml_mod @ [ "parse_error_struct" ]) in
    let error_has_http_bound_members error =
      match Shape_resolver.find_shape_by_name ~name:error shape_resolver with
      | Some (Shape.StructureShape s) ->
          List.exists s.members ~f:(fun m ->
              Option.is_some (http_header_name m) || Option.is_some (http_prefix_headers m))
      | _ -> false
    in
    let struct_parser_for error =
      if error_has_http_bound_members error then (
        match Shape_resolver.find_shape_by_name ~name:error shape_resolver with
        | Some (Shape.StructureShape s) ->
            let inner =
              scan_inner_expr ~out_name:error ~members:s.members ~namespace_resolver ~shape_resolver
            in
            exp_fun_untyped "i" inner
        | _ ->
            let deser_func = Deserialiser.func_longident ~namespace_resolver error in
            exp_fun_untyped "i"
              (B.pexp_apply
                 (B.pexp_ident (Location.mknoloc deser_func))
                 [ (Nolabel, exp_ident "i") ]))
      else (
        let deser_func = Deserialiser.func_longident ~namespace_resolver error in
        exp_fun_untyped "i"
          (B.pexp_apply (B.pexp_ident (Location.mknoloc deser_func)) [ (Nolabel, exp_ident "i") ]))
    in
    let body =
      if List.is_empty errors then
        [%expr
          fun (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body:_ ~headers:_ ->
            Smaws_Lib.Protocols.RestXml.Errors.default_handler error]
      else begin
        let cases =
          errors
          |> List.map ~f:(fun error ->
              let wire_code = Util.symbolName error in
              let variant = SafeNames.safeConstructorName error in
              let parse_call =
                B.pexp_apply parse_error_struct
                  [
                    (Labelled "body", exp_ident "body");
                    (Labelled "structParser", struct_parser_for error);
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
                              (B.ppat_construct (lident_noloc "XmlParseError")
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
        [%expr fun (error : Smaws_Lib.Protocols.RestXml.Error.t) ~body ~headers -> [%e match_body]]
      end
    in
    B.pstr_value Nonrecursive
      [ B.value_binding ~pat:(B.ppat_var (Location.mknoloc "error_deserializer")) ~expr:body ]

  (* Build [Smaws_Lib.Xml.Write.element w tag ?ns ?attrs body] (qualified) for a
     body-root element, with the same prefixed-namespace handling as
     [Serialiser.element_with_namespace] (name stays unprefixed; [xmlns:prefix]
     is declared as an attribute). *)
  let write_root_element_call ~tag ~(ns : (string * string option) option) ~attrs_opt body_expr =
    let element_fn = qualified_ident ~names:[ "Smaws_Lib"; "Xml"; "Write"; "element" ] in
    let body_arg = (Ppxlib.Nolabel, exp_fun_untyped "w" body_expr) in
    let positional = [ (Ppxlib.Nolabel, exp_ident "w"); (Ppxlib.Nolabel, const_str tag) ] in
    let attrs_args =
      match attrs_opt with Some e -> [ (Ppxlib.Labelled "attrs", e) ] | None -> []
    in
    match ns with
    | None -> B.pexp_apply element_fn (positional @ attrs_args @ [ body_arg ])
    | Some (uri, None) ->
        B.pexp_apply element_fn
          (positional @ [ (Ppxlib.Labelled "ns", const_str uri) ] @ attrs_args @ [ body_arg ])
    | Some (uri, Some prefix) ->
        let ns_attr =
          B.pexp_tuple
            [
              const_str ("xmlns:" ^ prefix);
              const_str uri;
              B.pexp_construct (lident_noloc "None") None;
            ]
        in
        let attrs_expr =
          match attrs_opt with
          | Some e -> [%expr [%e ns_attr] :: [%e e]]
          | None -> B.elist [ ns_attr ]
        in
        B.pexp_apply element_fn
          (positional @ [ (Ppxlib.Labelled "attrs", attrs_expr) ] @ [ body_arg ])

  (* Root-element namespace precedence: member [@xmlNamespace] -> shape
     [@xmlNamespace] -> service-level [@xmlNamespace]. *)
  let root_ns ~(service_ns : string) ~member_traits ~shape_traits : (string * string option) option
      =
    match Serialiser.xml_namespace_of member_traits with
    | Some ns -> Some ns
    | None -> (
        match Serialiser.xml_namespace_of shape_traits with
        | Some ns -> Some ns
        | None ->
            if String.equal service_ns "" then None else Some (service_ns, (None : string option)))

  (* A [(name, [value])] entry for a scalar @httpQuery member, or [] when the
     optional member is [None]. *)
  let query_scalar_contrib ~namespace_resolver ~shape_resolver (mem : Shape.member) name =
    match
      scalar_to_string_lambda ~namespace_resolver ~shape_resolver ~member_traits:mem.traits
        ~shape_traits:None ~binding:`Query mem.target
    with
    | None -> B.elist []
    | Some conv ->
        let entry_fn v =
          B.elist
            [ B.pexp_tuple [ const_str name; B.elist [ B.pexp_apply conv [ (Nolabel, v) ] ] ] ]
        in
        field_binding_expr mem entry_fn

  (* A [(name, values)] entry for a list/set @httpQuery member, or [] when
     [None]. *)
  let query_list_contrib ~namespace_resolver ~shape_resolver (mem : Shape.member) name =
    match list_item_info ~shape_resolver mem.target with
    | Some (item_target, item_member_traits) ->
        let conv =
          scalar_to_string_lambda ~namespace_resolver ~shape_resolver
            ~member_traits:item_member_traits ~shape_traits:None ~binding:`Query item_target
          |> Option.value ~default:(exp_ident "Fun.id")
        in
        let entry_fn v =
          B.elist
            [
              B.pexp_tuple
                [
                  const_str name;
                  B.pexp_apply (exp_ident "List.map") [ (Nolabel, conv); (Nolabel, v) ];
                ];
            ]
        in
        field_binding_expr mem entry_fn
    | None -> B.elist []

  (* The [(key, values)] list for a single @httpQueryParams map member, or []
     when [None]. Supports [map<string,string>] ([(k, [v])]) and
     [map<string,list<string>>] ([(k, vs)]). *)
  let query_params_contrib ~namespace_resolver ~shape_resolver (mem : Shape.member) =
    match Shape_resolver.find_shape_by_name ~name:mem.target shape_resolver with
    | Some (Shape.MapShape ms) ->
        let value_target = ms.mapValue.target in
        let is_list, item_target =
          match Shape_resolver.find_shape_by_name ~name:value_target shape_resolver with
          | Some (Shape.ListShape ls) -> (true, ls.target)
          | Some (Shape.SetShape ss) -> (true, ss.target)
          | _ -> (false, value_target)
        in
        let conv =
          scalar_to_string_lambda ~namespace_resolver ~shape_resolver
            ~member_traits:ms.mapValue.traits ~shape_traits:None ~binding:`Query item_target
          |> Option.value ~default:(exp_ident "Fun.id")
        in
        let entry_expr =
          if is_list then
            B.pexp_tuple
              [
                exp_ident "k";
                B.pexp_apply (exp_ident "List.map") [ (Nolabel, conv); (Nolabel, exp_ident "vs") ];
              ]
          else
            B.pexp_tuple
              [ exp_ident "k"; B.elist [ B.pexp_apply conv [ (Nolabel, exp_ident "v") ] ] ]
        in
        let pat =
          if is_list then
            B.ppat_tuple [ B.ppat_var (Location.mknoloc "k"); B.ppat_var (Location.mknoloc "vs") ]
          else B.ppat_tuple [ B.ppat_var (Location.mknoloc "k"); B.ppat_var (Location.mknoloc "v") ]
        in
        let fn = B.pexp_fun Ppxlib.Nolabel None pat entry_expr in
        let entry_fn m = B.pexp_apply (exp_ident "List.map") [ (Nolabel, fn); (Nolabel, m) ] in
        field_binding_expr mem entry_fn
    | _ -> B.elist []

  (* A [(name, value)] entry for a scalar @httpHeader member, or [] when
     [None]. *)
  let header_scalar_contrib ~namespace_resolver ~shape_resolver (mem : Shape.member) name =
    match
      scalar_to_string_lambda ~namespace_resolver ~shape_resolver ~member_traits:mem.traits
        ~shape_traits:None ~binding:`Header mem.target
    with
    | None -> B.elist []
    | Some conv ->
        let entry_fn v =
          B.elist [ B.pexp_tuple [ const_str name; B.pexp_apply conv [ (Nolabel, v) ] ] ]
        in
        field_binding_expr mem entry_fn

  (* A [(name, "a, b, c")] entry for a list/set @httpHeader member (smithy
     joins header-list values with ", "), or [] when [None]. *)
  let header_list_contrib ~namespace_resolver ~shape_resolver (mem : Shape.member) name =
    match list_item_info ~shape_resolver mem.target with
    | Some (item_target, item_member_traits) ->
        let conv =
          scalar_to_string_lambda ~namespace_resolver ~shape_resolver
            ~member_traits:item_member_traits ~shape_traits:None ~binding:`Header item_target
          |> Option.value ~default:(exp_ident "Fun.id")
        in
        let entry_fn v =
          B.elist
            [
              B.pexp_tuple
                [
                  const_str name;
                  [%expr
                    String.concat ", "
                      [%e B.pexp_apply (exp_ident "List.map") [ (Nolabel, conv); (Nolabel, v) ]]];
                ];
            ]
        in
        field_binding_expr mem entry_fn
    | None -> B.elist []

  (* The [(prefix, [(key, value); ...])] entry for a single @httpPrefixHeaders
     map member, or [] when [None]. *)
  let prefix_headers_contrib ~namespace_resolver ~shape_resolver (mem : Shape.member) prefix =
    let conv =
      match Shape_resolver.find_shape_by_name ~name:mem.target shape_resolver with
      | Some (Shape.MapShape ms) ->
          scalar_to_string_lambda ~namespace_resolver ~shape_resolver
            ~member_traits:ms.mapValue.traits ~shape_traits:None ~binding:`Header ms.mapValue.target
          |> Option.value ~default:(exp_ident "Fun.id")
      | _ -> exp_ident "Fun.id"
    in
    let fn =
      B.pexp_fun Ppxlib.Nolabel None
        (B.ppat_tuple [ B.ppat_var (Location.mknoloc "k"); B.ppat_var (Location.mknoloc "v") ])
        (B.pexp_tuple [ exp_ident "k"; B.pexp_apply conv [ (Nolabel, exp_ident "v") ] ])
    in
    let entry_fn m =
      B.elist
        [
          B.pexp_tuple
            [
              const_str prefix; B.pexp_apply (exp_ident "List.map") [ (Nolabel, fn); (Nolabel, m) ];
            ];
        ]
    in
    field_binding_expr mem entry_fn

  let label_entry ~namespace_resolver ~shape_resolver ~template (mem : Shape.member) =
    let conv =
      scalar_to_string_lambda ~namespace_resolver ~shape_resolver ~member_traits:mem.traits
        ~shape_traits:None ~binding:`Label mem.target
      |> Option.value_exn
    in
    let value = B.pexp_apply conv [ (Nolabel, request_field mem) ] in
    let greedy = String.is_substring ~substring:("{" ^ mem.name ^ "+}") template in
    B.pexp_tuple
      [
        const_str mem.name;
        value;
        B.pexp_construct (lident_noloc (if greedy then "true" else "false")) None;
      ]

  (* A [(name, value_string)] entry for a required @hostLabel member. *)
  let host_label_entry ~namespace_resolver ~shape_resolver (mem : Shape.member) =
    let conv =
      scalar_to_string_lambda ~namespace_resolver ~shape_resolver ~member_traits:mem.traits
        ~shape_traits:None ~binding:`Label mem.target
      |> Option.value ~default:(exp_ident "Fun.id")
    in
    B.pexp_tuple [ const_str mem.name; B.pexp_apply conv [ (Nolabel, request_field mem) ] ]

  (* The input structure's members, or [] for [Unit] / missing input. *)
  let input_members ~shape_resolver (operation_shape : Shape.operationShapeDetails) =
    match operation_shape.input with
    | Some input_name when not (String.equal input_name "smithy.api#Unit") -> (
        match Shape_resolver.find_shape_by_name ~name:input_name shape_resolver with
        | Some (Shape.StructureShape s) -> s.members
        | _ -> [])
    | _ -> []

  let generate_request_handler ~name ~operation_name
      ~(operation_shape : Ast.Shape.operationShapeDetails) ~alias_context ~xml_namespace
      ~(namespace_resolver : Namespace_resolver.Namespace_resolver.t)
      ~(shape_resolver : Shape_resolver.t) () =
    let shape_name = Util.symbolName operation_name in
    let http =
      Option.value
        ~default:({ method_ = "POST"; uri = "/"; code = None } : Trait.httpTrait)
        (http_trait_of operation_shape)
    in
    let endpoint = endpoint_trait_of operation_shape in
    let members = input_members ~shape_resolver operation_shape in
    let label_members = List.filter members ~f:is_http_label in
    let host_label_members = List.filter members ~f:is_host_label in
    let payload_mem = List.find members ~f:is_http_payload in
    let query_members =
      List.filter_map members ~f:(fun mem ->
          Option.map (http_query_name mem) ~f:(fun name -> (mem, name)))
    in
    let query_params_members = List.filter members ~f:is_http_query_params in
    let header_members =
      List.filter_map members ~f:(fun mem ->
          Option.map (http_header_name mem) ~f:(fun name -> (mem, name)))
    in
    let prefix_header_members =
      List.filter_map members ~f:(fun mem ->
          Option.map (http_prefix_headers mem) ~f:(fun prefix -> (mem, prefix)))
    in
    let idempotency_members =
      List.filter members ~f:(fun mem -> is_idempotency_token mem && not (is_required mem.traits))
    in
    let body_members = List.filter members ~f:is_body_member in
    let output_deserializer =
      generate_output_deserializer_expr ~operation_shape ~namespace_resolver ~shape_resolver
    in
    let labels_list =
      B.elist
        (List.map label_members
           ~f:(label_entry ~namespace_resolver ~shape_resolver ~template:http.uri))
    in
    let host_labels_list =
      B.elist
        (List.map host_label_members ~f:(host_label_entry ~namespace_resolver ~shape_resolver))
    in
    let named_params_contribs =
      List.map query_members ~f:(fun (mem, name) ->
          if target_is_list ~shape_resolver mem.target then
            query_list_contrib ~namespace_resolver ~shape_resolver mem name
          else query_scalar_contrib ~namespace_resolver ~shape_resolver mem name)
    in
    let map_params_contribs =
      List.map query_params_members ~f:(query_params_contrib ~namespace_resolver ~shape_resolver)
    in
    let named_params_expr =
      B.pexp_apply (exp_ident "List.concat") [ (Nolabel, B.elist named_params_contribs) ]
    in
    let map_params_expr =
      B.pexp_apply (exp_ident "List.concat") [ (Nolabel, B.elist map_params_contribs) ]
    in
    let named_headers_contribs =
      List.map header_members ~f:(fun (mem, name) ->
          if target_is_list ~shape_resolver mem.target then
            header_list_contrib ~namespace_resolver ~shape_resolver mem name
          else header_scalar_contrib ~namespace_resolver ~shape_resolver mem name)
    in
    let prefix_headers_contribs =
      List.map prefix_header_members ~f:(fun (mem, prefix) ->
          prefix_headers_contrib ~namespace_resolver ~shape_resolver mem prefix)
    in
    let named_headers_expr =
      B.pexp_apply (exp_ident "List.concat") [ (Nolabel, B.elist named_headers_contribs) ]
    in
    let prefix_headers_expr =
      B.pexp_apply (exp_ident "List.concat") [ (Nolabel, B.elist prefix_headers_contribs) ]
    in
    let host_prefix_expr =
      match endpoint with
      | Some e ->
          [%expr
            Smaws_Lib.Http_bindings.substitute_host_prefix ~host_prefix:[%e const_str e.hostPrefix]
              ~labels:[%e host_labels_list] uri]
      | None -> exp_ident "uri"
    in
    (* [@idempotencyToken] auto-fill: rebuild the input record with each
       unset token member replaced by a fresh UUID. A full record construction
       (no [with]) is used so the single-field case does not trigger
       [useless-record-with]. Skipped entirely when there are no token members. *)
    let idempotency_bindings =
      if List.is_empty idempotency_members then []
      else (
        let fields =
          List.map members ~f:(fun mem ->
              let field_key = lident_noloc (SafeNames.safeMemberName mem.name) in
              let field_val =
                if is_idempotency_token mem && not (is_required mem.traits) then
                  B.pexp_match (request_field mem)
                    [
                      B.case
                        ~lhs:
                          (B.ppat_construct (lident_noloc "Some")
                             (Some (B.ppat_var (Location.mknoloc "t"))))
                        ~guard:None
                        ~rhs:(B.pexp_construct (lident_noloc "Some") (Some (exp_ident "t")));
                      B.case
                        ~lhs:(B.ppat_construct (lident_noloc "None") None)
                        ~guard:None
                        ~rhs:
                          (B.pexp_construct (lident_noloc "Some")
                             (Some
                                (qualified_apply ~names:(uuid_mod @ [ "generate" ])
                                   [ (Nolabel, B.pexp_construct (lident_noloc "()") None) ])));
                    ]
                else request_field mem
              in
              (field_key, field_val))
        in
        [ ("request", B.pexp_record fields None) ])
    in
    let body_expr =
      match payload_mem with
      | Some mem -> (
          let field = request_field mem in
          let target = mem.target in
          let shape = Shape_resolver.find_shape_by_name ~name:target shape_resolver in
          match shape with
          | Some (Shape.StructureShape s | Shape.UnionShape s) ->
              let tag = xml_name mem.traits (xml_name s.traits (Util.symbolName target)) in
              let ns =
                root_ns ~member_traits:mem.traits ~shape_traits:s.traits ~service_ns:xml_namespace
              in
              let attrs_opt =
                Serialiser.attrs_expr_of_target ~shape_resolver (exp_ident "v") target
              in
              let ser_call =
                B.pexp_apply
                  (Option.value_exn (serializer_ref_expr ~namespace_resolver target))
                  [ (Nolabel, exp_ident "w"); (Nolabel, exp_ident "v") ]
              in
              let element_call = write_root_element_call ~tag ~ns ~attrs_opt ser_call in
              [%expr
                match [%e field] with
                | Some v ->
                    let w = Smaws_Lib.Xml.Write.make () in
                    [%e element_call];
                    Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)
                | None -> None]
          | Some (Shape.StringShape _) ->
              [%expr match [%e field] with Some v -> Some ("text/plain", v) | None -> None]
          | Some (Shape.BlobShape blob) ->
              let media_type =
                find_trait blob.traits (function Trait.MediaTypeTrait m -> Some m | _ -> None)
              in
              let ct = Option.value media_type ~default:"application/octet-stream" in
              [%expr
                match [%e field] with
                | Some v -> Some ([%e const_str ct], Bytes.to_string v)
                | None -> None]
          | Some (Shape.EnumShape _) ->
              let conv =
                enum_to_string_lambda ~namespace_resolver ~shape_resolver target |> Option.value_exn
              in
              let applied = B.pexp_apply conv [ (Nolabel, exp_ident "v") ] in
              [%expr
                match [%e field] with Some v -> Some ("text/plain", [%e applied]) | None -> None]
          | _ -> [%expr None])
      | None -> (
          match operation_shape.input with
          | Some input_name when not (String.equal input_name "smithy.api#Unit") -> (
              match Shape_resolver.find_shape_by_name ~name:input_name shape_resolver with
              | Some (Shape.StructureShape s) when not (List.is_empty body_members) ->
                  let tag = xml_name s.traits (Util.symbolName input_name) in
                  let ns =
                    root_ns ~member_traits:None ~shape_traits:s.traits ~service_ns:xml_namespace
                  in
                  let attrs_opt =
                    Serialiser.attrs_expr_of_target ~shape_resolver (exp_ident "request") input_name
                  in
                  let ser_call =
                    B.pexp_apply
                      (Option.value_exn (serializer_ref_expr ~namespace_resolver input_name))
                      [ (Nolabel, exp_ident "w"); (Nolabel, exp_ident "request") ]
                  in
                  let element_call = write_root_element_call ~tag ~ns ~attrs_opt ser_call in
                  [%expr
                    let w = Smaws_Lib.Xml.Write.make () in
                    [%e element_call];
                    Some ("application/xml", Smaws_Lib.Xml.Write.to_string w)]
              | _ -> [%expr None])
          | _ -> [%expr None])
    in
    let request_call =
      qualified_apply ~names:(restxml_mod @ [ "request" ])
        [
          (Ppxlib.Labelled "shape_name", const_str shape_name);
          (Ppxlib.Labelled "service", exp_ident "service");
          (Ppxlib.Labelled "context", exp_ident "context");
          (Ppxlib.Labelled "method_", method_variant http.method_);
          (Ppxlib.Labelled "uri", exp_ident "uri");
          (Ppxlib.Labelled "query", exp_ident "query");
          (Ppxlib.Labelled "headers", exp_ident "headers");
          (Ppxlib.Labelled "body", exp_ident "body");
          (Ppxlib.Labelled "output_deserializer", output_deserializer);
          (Ppxlib.Labelled "error_deserializer", exp_ident "error_deserializer");
        ]
    in
    let lets =
      [
        ( "base",
          [%expr Smaws_Lib.Service.makeUri ~config:(Smaws_Lib.Context.config context) ~service] );
        ( "path",
          [%expr
            Smaws_Lib.Http_bindings.substitute_labels ~template:[%e const_str http.uri]
              ~labels:[%e labels_list]] );
        ("uri", [%expr Smaws_Lib.Http_bindings.apply_path ~base ~path]);
        ("uri", host_prefix_expr);
      ]
      @ idempotency_bindings
      @ [
          ("named_params", named_params_expr);
          ("map_params", map_params_expr);
          ("query", [%expr Smaws_Lib.Http_bindings.merge_query_params ~named_params ~map_params]);
          ("named_headers", named_headers_expr);
          ("prefix_headers", prefix_headers_expr);
          ("headers", [%expr Smaws_Lib.Http_bindings.merge_headers ~named_headers ~prefix_headers]);
          ("body", body_expr);
        ]
    in
    let shape_func_body =
      List.fold_right lets ~init:request_call ~f:(fun (name, e) acc ->
          B.pexp_let Nonrecursive
            [ B.value_binding ~pat:(B.ppat_var (Location.mknoloc name)) ~expr:e ]
            acc)
    in
    let shape_func =
      Option.value_map operation_shape.input ~default:shape_func_body ~f:(fun input_name ->
          B.pexp_fun Ppxlib.Nolabel None
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
        ~namespace_resolver ~shape_resolver ()
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
