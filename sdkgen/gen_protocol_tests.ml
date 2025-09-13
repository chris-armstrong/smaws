open Base
open Smithy_ast
open Codegen.Ppx_util

let loc = Location.none

module B = Ppxlib.Ast_builder.Make (struct
  let loc = loc
end)

let dummy_expr = B.pexp_constant (Ppxlib.Ast.Pconst_integer ("5", None))
let unit_expr = B.pexp_construct (Location.mknoloc Ppxlib.(Lident "()")) None

let type_expr qualified_name =
  B.pexp_ident (Location.mknoloc (qualified_name |> Longident.unflatten |> Option.value_exn))

let builtin_type_expr qualified_name = type_expr ([ "Smaws_Lib"; "CoreTypes" ] @ qualified_name)
let nullable_expr = builtin_type_expr [ "Nullable"; "Null" ]

let rec structure_mapper =
 fun ~shape_resolver (name : string) (members : Shape.member list) params ->
  let params_obj =
    match params with `Assoc x -> x | _ -> failwith ("expected object for " ^ name)
  in
  let structure_pairs =
    List.map members ~f:(fun member ->
        let { name; target; traits } : Shape.member = member in
        let is_required = Trait.hasTrait traits Trait.isRequiredTrait in
        let field_lookup = List.Assoc.find ~equal:String.equal params_obj name in
        let field_value =
          match (field_lookup, is_required) with
          | Some `Null, true -> failwith "explicit null given for required value"
          | Some `Null, false | None, false ->
              B.pexp_construct (Location.mknoloc Ppxlib.(Lident "None")) None
          | Some value, _ ->
              let value = value_mapper ~shape_resolver ~target ~value in
              if is_required then value
              else B.pexp_construct (Location.mknoloc Ppxlib.(Lident "Some")) (Some value)
          | None, true -> failwith ("missing required field in params " ^ name)
        in
        ( name |> Codegen.SafeNames.safeMemberName
          |> (fun x -> Longident.Lident x)
          |> Location.mknoloc,
          field_value ))
  in
  match structure_pairs with
  | [] -> B.pexp_construct (Location.mknoloc Ppxlib.(Lident "()")) None
  | _ -> B.pexp_record structure_pairs None
(* B.pexp_record structure_pairs None *)

and value_mapper ~shape_resolver ~target ~value =
  let open Shape in
  let shape =
    Codegen.Shape_resolver.find_shape_by_name ~name:target shape_resolver
    |> Option.value_exn ~message:("could not find target shape " ^ target)
  in
  match (shape, value) with
  | StringShape _, `String str -> B.pexp_constant (Ppxlib.Ast.Pconst_string (str, loc, None))
  | IntegerShape _, `Int i -> B.pexp_constant (Ppxlib.Ast.Pconst_integer (Int.to_string i, None))
  | LongShape _, `Int i -> B.pexp_constant (Ppxlib.Ast.Pconst_integer (Int.to_string i, None))
  | ShortShape _, `Int i -> B.pexp_constant (Ppxlib.Ast.Pconst_integer (Int.to_string i, None))
  | ByteShape _, `Int i -> B.pexp_constant (Ppxlib.Ast.Pconst_integer (Int.to_string i, None))
  | BooleanShape _, `Bool b ->
      let ident = if b then "true" else "false" in
      B.pexp_construct (Location.mknoloc (Ppxlib.Lident ident)) None
  | FloatShape _, `Float f -> B.pexp_constant (Ppxlib.Ast.Pconst_float (Float.to_string f, None))
  | DoubleShape _, `Float f -> B.pexp_constant (Ppxlib.Ast.Pconst_float (Float.to_string f, None))
  | DoubleShape _, `String "NaN" | FloatShape _, `String "NaN" -> type_expr [ "Float"; "nan" ]
  | DoubleShape _, `String "Infinity" | FloatShape _, `String "Infinity" ->
      type_expr [ "Float"; "infinity" ]
  | DoubleShape _, `String "-Infinity" | FloatShape _, `String "-Infinity" ->
      type_expr [ "Float"; "neg_infinity" ]
  | UnitShape, `Null -> unit_expr
  (* Structure types - recursively call structure_mapper *)
  | StructureShape ss, `Assoc _ -> structure_mapper ~shape_resolver target ss.members value
  (* List types *)
  | ListShape ls, `List items ->
      let is_sparse = Trait.(hasTrait ls.traits isSparseTrait) in
      let item_exprs =
        List.map items ~f:(fun item ->
            match (item, is_sparse) with
            | `Null, true -> nullable_expr
            | `Null, false -> failwith "sparse list with null value"
            | value, _ -> value_mapper ~shape_resolver ~target:ls.target ~value:item)
      in
      List.fold_right item_exprs
        ~init:(B.pexp_construct (Location.mknoloc (Ppxlib.Lident "[]")) None)
        ~f:(fun expr acc ->
          B.pexp_construct
            (Location.mknoloc (Ppxlib.Lident "::"))
            (Some (B.pexp_tuple [ expr; acc ])))
  (* Map types *)
  | MapShape ms, `Assoc pairs ->
      let is_sparse = Trait.(hasTrait ms.traits isSparseTrait) in
      let pair_exprs =
        List.map pairs ~f:(fun (key, value) ->
            let key_expr =
              value_mapper ~shape_resolver ~target:ms.mapKey.target ~value:(`String key)
            in
            match (is_sparse, value) with
            | true, `Null -> B.pexp_tuple [ key_expr; nullable_expr ]
            | false, `Null -> failwith "sparse map with null value"
            | _, value ->
                let value_expr = value_mapper ~shape_resolver ~target:ms.mapValue.target ~value in
                B.pexp_tuple [ key_expr; value_expr ])
      in
      List.fold_right pair_exprs
        ~init:(B.pexp_construct (Location.mknoloc (Ppxlib.Lident "[]")) None)
        ~f:(fun expr acc ->
          B.pexp_construct
            (Location.mknoloc (Ppxlib.Lident "::"))
            (Some (B.pexp_tuple [ expr; acc ])))
  (* Set types - similar to lists but with different type *)
  | SetShape ss, `List items ->
      let item_exprs =
        List.map items ~f:(fun item -> value_mapper ~shape_resolver ~target:ss.target ~value:item)
      in
      List.fold_right item_exprs
        ~init:(B.pexp_construct (Location.mknoloc (Ppxlib.Lident "[]")) None)
        ~f:(fun expr acc ->
          B.pexp_construct
            (Location.mknoloc (Ppxlib.Lident "::"))
            (Some (B.pexp_tuple [ expr; acc ])))
  (* Union types - need to match on the single key-value pair *)
  | UnionShape us, `Assoc [ (variant_name, variant_value) ] -> (
      let variant_member = List.find us.members ~f:(fun m -> String.equal m.name variant_name) in
      match variant_member with
      | Some member ->
          let variant_expr =
            value_mapper ~shape_resolver ~target:member.target ~value:variant_value
          in
          let constructor_name = Codegen.SafeNames.safeConstructorName variant_name in
          B.pexp_construct (Location.mknoloc (Ppxlib.Lident constructor_name)) (Some variant_expr)
      | None -> failwith ("Unknown union variant: " ^ variant_name))
  (* Enum types - convert string values to enum constructors *)
  | EnumShape es, `String enum_value -> (
      let enum_member =
        List.find es.members ~f:(fun m ->
            let open Trait in
            let open Shape in
            let member_value =
              m.traits |> Option.value ~default:[]
              |> List.find_map ~f:(function EnumValueTrait (`String x) -> Some x | _ -> None)
              |> Option.value ~default:m.name
            in
            String.equal member_value enum_value)
      in
      match enum_member with
      | Some member ->
          let constructor_name = Codegen.SafeNames.safeConstructorName member.name in
          B.pexp_construct (Location.mknoloc (Ppxlib.Lident constructor_name)) None
      | None -> failwith ("Unknown enum value in " ^ target ^ ": " ^ enum_value))
  | EnumShape es, `Int enum_value -> (
      let enum_member =
        List.find es.members ~f:(fun m ->
            let open Trait in
            let open Shape in
            let member_value =
              m.traits |> Option.value ~default:[]
              |> List.find_map ~f:(function EnumValueTrait (`Int x) -> Some x | _ -> None)
              |> Option.value_exn ~message:"no enum value trait"
            in
            Int.equal member_value enum_value)
      in
      match enum_member with
      | Some member ->
          let constructor_name = Codegen.SafeNames.safeConstructorName member.name in
          B.pexp_construct (Location.mknoloc (Ppxlib.Lident constructor_name)) None
      | None -> failwith ("Unknown enum value in " ^ target ^ ": " ^ Int.to_string enum_value))
  | BlobShape x, `String blob_value ->
      B.pexp_apply
        (builtin_type_expr [ "Blob"; "of_string" ])
        [ (Nolabel, B.pexp_constant (Pconst_string (blob_value, loc, None))) ]
  | TimestampShape x, `Int timestamp_value ->
      B.pexp_apply
        (type_expr [ "Option"; "get" ])
        [
          ( Nolabel,
            B.pexp_apply
              (builtin_type_expr [ "Timestamp"; "of_float_s" ])
              [
                ( Nolabel,
                  B.pexp_constant (Pconst_float ((timestamp_value |> Int.to_string) ^ ".", None)) );
              ] );
        ]
  | DocumentShape, value ->
      B.pexp_apply
        (builtin_type_expr [ "Document"; "from_string" ])
        [
          ( Ppxlib.Nolabel,
            B.pexp_constant
              Ppxlib.(Pconst_string (value |> Yojson.Basic.pretty_to_string, Location.none, None))
          );
        ]
  | _ ->
      failwith
        ("Unsupported shape type: " ^ target ^ " for value " ^ Yojson.Basic.pretty_to_string value)

let make_input_expr ~shape_resolver input_shape_name params =
  let params = Option.value ~default:(`Assoc []) params in
  let is = Option.value ~default:"smithy.api#unit" input_shape_name in
  let open Shape in
  let shape =
    Codegen.Shape_resolver.find_shape_by_name ~name:is shape_resolver
    |> Option.value_exn ~message:("could not find input shape " ^ is)
  in

  match shape with
  | StructureShape ss -> structure_mapper ~shape_resolver is ss.members params
  | UnitShape -> unit_expr
  | _ -> failwith "input shapes must be structure shape or unit"

let make_input_pattern ~namespace_resolver ~pattern_name input_shape =
  input_shape
  |> Option.map ~f:(fun input_shape ->
         let symbol =
           Codegen.Namespace_resolver.Namespace_resolver.resolve_reference
             ~symbol_transformer:(fun ~local value ->
               [ "Types"; value |> Codegen.SafeNames.snakeCase ])
             namespace_resolver input_shape
         in
         B.ppat_constraint
           (B.ppat_var (Location.mknoloc pattern_name))
           (B.ptyp_constr
              (symbol |> Longident.unflatten |> Option.value_exn |> Location.mknoloc)
              []))
  |> Option.value ~default:(B.ppat_var (Location.mknoloc pattern_name))

let make_response_body_expr body_string =
  B.pexp_constant B.(Pconst_string (body_string |> Option.value ~default:"", loc, None))

let make_headers_expr headers =
  headers
  |> Option.map ~f:(fun headers ->
         B.elist
           (headers
           |> List.map ~f:(fun (key, value) ->
                  B.pexp_tuple [ key |> const_str; value |> const_str ])))
  |> Option.value ~default:(B.elist [])

let make_operation_call_expr ~namespace_resolver ~shape_resolver ~operation_name =
  let call_qualified_name =
    Codegen.Namespace_resolver.Namespace_resolver.resolve_reference
      ~symbol_transformer:(fun ~local x -> [ x |> Codegen.SafeNames.safeModuleName; "request" ])
      namespace_resolver operation_name
  in
  B.pexp_ident (call_qualified_name |> Longident.unflatten |> Option.value_exn |> Location.mknoloc)

let make_error_to_string_expr ~namespace_resolver ~shape_resolver ~operation_name =
  let call_qualified_name =
    Codegen.Namespace_resolver.Namespace_resolver.resolve_reference
      ~symbol_transformer:(fun ~local x ->
        [ x |> Codegen.SafeNames.safeModuleName; "error_to_string" ])
      namespace_resolver operation_name
  in
  B.pexp_ident (call_qualified_name |> Longident.unflatten |> Option.value_exn |> Location.mknoloc)

let make_request_body_expected_expr input_body =
  B.pexp_construct (lident_noloc "Some")
    (Some (B.pexp_variant "String" (Some (const_str input_body))))

let make_request_body_test input_body =
  match input_body with
  | Some input_body ->
      let request_body_expected_expr = make_request_body_expected_expr input_body in
      [%expr
        check Alcotest_http.input_body_testable "expected request body value"
          [%e request_body_expected_expr] request.body]
  | None -> [%expr ()]

let make_request_method_expected_expr method_ = B.pexp_variant method_ None

let make_request_uri_expected_expr uri =
  B.pexp_apply (exp_ident "Uri.of_string") [ (Nolabel, const_str uri) ]

let make_test_str ~namespace_resolver ~shape_resolver ~input_shape ~output_shape ~operation_name
    http_protocols =
  http_protocols
  |> List.map ~f:(fun (request_test : Trait.httpRequestTest) ->
         Fmt.pr "Generating test for %s\n" request_test.id;
         let test_name_str =
           B.pexp_constant (Ppxlib.Ast.Pconst_string (request_test.id, loc, None))
         in
         let test_name_pat =
           B.ppat_var (Location.mknoloc (request_test.id |> Codegen.SafeNames.snakeCase))
         in
         let input_pat = make_input_pattern ~pattern_name:"input" ~namespace_resolver input_shape in
         let input_expr = make_input_expr ~shape_resolver input_shape request_test.params in
         let response_body_expr = make_response_body_expr request_test.body in
         let operation_call_expr =
           make_operation_call_expr ~namespace_resolver ~shape_resolver ~operation_name
         in
         let request_body_test = make_request_body_test request_test.body in
         let error_to_string_expr = dummy_expr in
         let request_method_expected_expr =
           make_request_method_expected_expr request_test.method_
         in
         let request_uri_expected_expr = make_request_uri_expected_expr request_test.uri in
         let request_headers_expected_expr = make_headers_expr request_test.headers in
         let error_to_string_expr =
           make_error_to_string_expr ~namespace_resolver ~shape_resolver ~operation_name
         in
         [%stri
           let [%p test_name_pat] =
            fun () ->
             Eio.Switch.run ~name:[%e test_name_str] @@ fun sw ->
             let module Mock = (val Http_mock.create_http_mock ()) in
             let http_type = (module Mock : Smaws_Lib.Http.Client with type t = Mock.t) in

             let ctx = Smaws_Lib.Context.make ~config:Config.dummy ~http_type () in
             let [%p input_pat] = [%e input_expr] in
             Mock.mock_response ~body:[%e response_body_expr] ~status:200
               ~headers:[ ("Content-Type", "application/json") ]
               ();
             let response = [%e operation_call_expr] ctx input in
             match response with
             | Ok resp ->
                 let request = Mock.last_request () in
                 let () = [%e request_body_test] in

                 let () =
                   check Alcotest_http.method_testable "expected request method"
                     [%e request_method_expected_expr] request.method_
                 in
                 let () =
                   check Alcotest_http.uri_testable "expected request uri"
                     [%e request_uri_expected_expr] request.uri
                 in
                 let () =
                   check Alcotest_http.headers_testable "expected request headers"
                     [%e request_headers_expected_expr] request.headers
                 in
                 ()
             | Error error -> failwith ([%e error_to_string_expr] error)])

let generate_ml ~shape_resolver ~operation_shapes ~structure_shapes ~alias_context
    ?(with_derivings = false) ?(no_open = false)
    ~(namespace_resolver : Codegen.Namespace_resolver.Namespace_resolver.t) fmt =
  let all_test_structures =
    operation_shapes
    |> List.map
         ~f:(fun
             ((name, operationShapeDetails, _) : string * Shape.operationShapeDetails * string list)
           ->
           let Shape.{ input; output; traits; _ } = operationShapeDetails in
           let http_protocols =
             traits |> Option.value ~default:[]
             |> List.find_map ~f:(function Trait.TestHttpRequestTests x -> Some x | _ -> None)
             |> Option.value ~default:[]
           in
           let input_shape =
             input
             (* |> Option.bind ~f:(fun input -> *)
             (*        structure_shapes *)
             (*        |> List.find ~f:(fun Dependencies.{ name = shape_name; _ } -> *)
             (*               String.equal shape_name input)) *)
           in
           let output_shape =
             output
             (* |> Option.map ~f:(fun output -> *)
             (*        structure_shapes *)
             (*        |> List.find ~f:(fun Dependencies.{ name = shape_name; _ } -> *)
             (*               String.equal shape_name output)) *)
           in
           make_test_str ~namespace_resolver ~shape_resolver ~input_shape ~output_shape
             ~operation_name:name http_protocols)
  in
  let opens =
    Codegen.Ppx_util.
      [
        stri_open [ "Alcotest" ];
        (* stri_open [ "Smaws_Lib" ]; *)
        stri_open [ "Smaws_Test_Support_Lib" ];
        stri_open
          [ namespace_resolver |> Codegen.Namespace_resolver.Namespace_resolver.current_module ];
      ]
  in

  let flattened_structure_items = all_test_structures |> List.concat in
  Ppxlib.Pprintast.structure fmt (opens @ flattened_structure_items)

let generate_mli ~structure_shapes ~alias_context ?(with_derivings = false) ?(no_open = false)
    ~(namespace_resolver : Codegen.Namespace_resolver.Namespace_resolver.t) fmt =
  ()
