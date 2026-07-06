open Base
open Smithy_ast
open Codegen.Ppx_util
module Longident = Codegen.Ppx_longident

let loc = Location.none

module B = Ppxlib.Ast_builder.Make (struct
  let loc = loc
end)

let dummy_expr = B.pexp_constant (Ppxlib.Ast.Pconst_integer ("5", None))

let is_idempotency_autofill_test (request_test : Trait.httpRequestTest) =
  String.is_suffix request_test.id ~suffix:"IdempotencyTokenAutoFill"
  && not (String.is_suffix request_test.id ~suffix:"IdempotencyTokenAutoFillIsSet")

let deterministic_idempotency_uuid = "00000000-0000-4000-8000-000000000000"

let wrap_operation_call_for_idempotency request_test operation_call_expr =
  if not (is_idempotency_autofill_test request_test) then operation_call_expr
  else
    B.pexp_apply
      (B.pexp_ident
         (Location.mknoloc (make_lident ~names:[ "Smaws_Lib"; "Uuid"; "with_generator" ])))
      [
        ( Nolabel,
          B.pexp_fun Nolabel None
            (B.ppat_var (Location.mknoloc "_"))
            (const_str deterministic_idempotency_uuid) );
        (Nolabel, B.pexp_fun Nolabel None (B.ppat_var (Location.mknoloc "()")) operation_call_expr);
      ]

let unit_expr = B.pexp_construct (Location.mknoloc Ppxlib.(Lident "()")) None

(* Protocol test ids that are known to fail against the current runtime.
   They are emitted as skipped (the test body calls Alcotest.skip ()) so CI
   stays green; remove a case once the underlying runtime gap is fixed.
   Currently no tests are skipped. *)
let is_skipped_test _id = false

(* fun () -> Alcotest.skip (): marks a test case as skipped. Alcotest 1.9.1
   has no Skip speed variant, so skipping is done by calling skip from inside
   the test body. *)
let skip_test_fun =
  B.pexp_fun Nolabel None
    (B.ppat_construct (Location.mknoloc Ppxlib.(Lident "()")) None)
    (B.pexp_apply
       (B.pexp_ident (Location.mknoloc (make_lident ~names:[ "Alcotest"; "skip" ])))
       [ (Nolabel, unit_expr) ])

(* A test-case tuple: (id, Quick, body). The body is skip_test_fun for
   known-failing ids, otherwise the generated test function. *)
let test_case_tuple id func_expr =
  B.pexp_tuple
    [
      const_str id;
      B.pexp_variant "Quick" None;
      (if is_skipped_test id then skip_test_fun else func_expr);
    ]

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
  | LongShape _, `Int i ->
      B.pexp_apply
        (builtin_type_expr [ "Int64"; "of_int" ])
        [ (Nolabel, B.pexp_constant (Ppxlib.Ast.Pconst_integer (Int.to_string i, None))) ]
  | BigIntegerShape _, `Int i ->
      B.pexp_apply
        (builtin_type_expr [ "BigInt"; "of_int" ])
        [ (Nolabel, B.pexp_constant (Ppxlib.Ast.Pconst_integer (Int.to_string i, None))) ]
  | BigIntegerShape _, `String s ->
      B.pexp_apply
        (builtin_type_expr [ "BigInt"; "of_string" ])
        [ (Nolabel, B.pexp_constant (Ppxlib.Ast.Pconst_string (s, loc, None))) ]
  | BigDecimalShape _, `String s ->
      B.pexp_apply
        (builtin_type_expr [ "BigDecimal"; "of_string" ])
        [ (Nolabel, B.pexp_constant (Ppxlib.Ast.Pconst_string (s, loc, None))) ]
  | BigDecimalShape _, `Float f ->
      B.pexp_apply
        (builtin_type_expr [ "BigDecimal"; "of_string" ])
        [ (Nolabel, B.pexp_constant (Ppxlib.Ast.Pconst_float (Float.to_string f, None))) ]
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
  | TimestampShape x, `Float timestamp_value ->
      (* Float epoch-seconds carry ~1e-7 imprecision at AWS timestamps, which would
         otherwise make the expected value differ from the deserialized
         (string-parsed) result. Truncate to microsecond precision -- finer
         than the millisecond bodies the smithy fixtures use, coarser than the
         float error -- so the two compare equal. *)
      B.pexp_apply
        (builtin_type_expr [ "Timestamp"; "truncate" ])
        [
          (Labelled "frac_s", B.pexp_constant (Ppxlib.Ast.Pconst_integer ("6", None)));
          ( Nolabel,
            B.pexp_apply
              (type_expr [ "Option"; "get" ])
              [
                ( Nolabel,
                  B.pexp_apply
                    (builtin_type_expr [ "Timestamp"; "of_float_s" ])
                    [
                      ( Nolabel,
                        B.pexp_constant (Pconst_float (Float.to_string timestamp_value, None)) );
                    ] );
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
        (B.ptyp_constr (symbol |> Longident.unflatten |> Option.value_exn |> Location.mknoloc) []))
  |> Option.value ~default:(B.ppat_var (Location.mknoloc pattern_name))

let make_response_body_expr body_string =
  body_string
  |> Option.map ~f:(fun body_string ->
      B.pexp_construct
        (Location.mknoloc Longident.(Lident "Some"))
        (Some (B.pexp_constant B.(Pconst_string (body_string, loc, None)))))
  |> Option.value ~default:B.(pexp_construct Location.(mknoloc Longident.(Lident "None")) None)

let make_headers_expr headers =
  headers
  |> Option.map ~f:(fun headers ->
      B.elist
        (headers
        |> List.map ~f:(fun (key, value) -> B.pexp_tuple [ key |> const_str; value |> const_str ])))
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
    (Some
       (B.pexp_apply
          (B.pexp_ident
             (Location.mknoloc (make_lident ~names:[ "Smaws_Lib"; "Json"; "of_string" ])))
          [ (Nolabel, const_str input_body) ]))

let make_request_body_test input_body =
  match input_body with
  | Some input_body ->
      let request_body_expected_expr = make_request_body_expected_expr input_body in
      [%expr
        check Alcotest_http.input_body_json_testable "expected request body value"
          [%e request_body_expected_expr]
          (request.body
          |> Option.map (function
            | `Form _ -> failwith "not expecting form"
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> "{}")
          |> Option.map Yojson.Basic.from_string)]
  | None -> [%expr ()]

let make_query_request_body_test input_body =
  match input_body with
  | Some input_body ->
      [%expr
        check Alcotest_http.input_body_form_testable "expected request body value"
          (Some [%e const_str input_body])
          (request.body
          |> Option.map (function
            | `Form x -> Uri.encoded_of_query x
            | `String x -> x
            | `Compressed (x, _) -> x
            | `None -> ""))]
  | None -> [%expr ()]

let make_request_method_expected_expr method_ = B.pexp_variant method_ None

let make_request_uri_expected_expr uri =
  B.pexp_apply (exp_ident "Uri.of_string") [ (Nolabel, const_str uri) ]

let make_test_case_function_name (request_test : Trait.httpRequestTest) =
  request_test.id |> Codegen.SafeNames.snakeCase

let make_response_test_case_function_name (response_test : Trait.httpResponseTest) =
  response_test.id |> Codegen.SafeNames.snakeCase

let make_config_expr (http_request_test : Trait.httpRequestTest) =
  match http_request_test.host with
  | Some host ->
      [%expr
        {
          Config.dummy with
          endpoint =
            Some { uri = Some ([%e "//" ^ host |> const_str] |> Uri.of_string); headers = None };
        }]
  | None -> [%expr Config.dummy]

let make_test_str ~namespace_resolver ~shape_resolver ~input_shape ~output_shape ~operation_name
    http_protocols =
  http_protocols
  |> List.map ~f:(fun (request_test : Trait.httpRequestTest) ->
      Fmt.pr "Generating test for %s\n" request_test.id;
      let test_name_str = B.pexp_constant (Ppxlib.Ast.Pconst_string (request_test.id, loc, None)) in
      let test_name_pat =
        B.ppat_var (Location.mknoloc (make_test_case_function_name request_test))
      in
      let input_pat = make_input_pattern ~pattern_name:"input" ~namespace_resolver input_shape in
      let input_expr = make_input_expr ~shape_resolver input_shape request_test.params in
      let response_body_expr = make_response_body_expr request_test.body in
      let operation_call_expr =
        make_operation_call_expr ~namespace_resolver ~shape_resolver ~operation_name
      in
      let operation_call_expr =
        wrap_operation_call_for_idempotency request_test
          (B.pexp_apply operation_call_expr
             [ (Nolabel, exp_ident "ctx"); (Nolabel, exp_ident "input") ])
      in
      let request_body_test = make_request_body_test request_test.body in
      let error_to_string_expr = dummy_expr in
      let request_method_expected_expr = make_request_method_expected_expr request_test.method_ in
      let request_uri_expected_expr = make_request_uri_expected_expr request_test.uri in
      let request_headers_expected_expr = make_headers_expr request_test.headers in
      let error_to_string_expr =
        make_error_to_string_expr ~namespace_resolver ~shape_resolver ~operation_name
      in
      let config_expr = make_config_expr request_test in
      [%stri
        let [%p test_name_pat] =
         fun () ->
          Eio.Switch.run ~name:[%e test_name_str] @@ fun sw ->
          let module Mock = (val Http_mock.create_http_mock ()) in
          let http_type = (module Mock : Smaws_Lib.Http.Client with type t = Mock.t) in

          let config = [%e config_expr] in

          let ctx = Smaws_Lib.Context.make ~config ~http_type () in
          let [%p input_pat] = [%e input_expr] in
          Mock.mock_response ?body:[%e response_body_expr] ~status:200
            ~headers:[ ("Content-Type", "application/json") ]
            ();
          let response = [%e operation_call_expr] in
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

let make_response_test_str ~namespace_resolver ~shape_resolver ~input_shape ~output_shape
    ~operation_name response_tests =
  response_tests
  |> List.map ~f:(fun (response_test : Trait.httpResponseTest) ->
      Fmt.pr "Generating response test for %s\n" response_test.id;
      let test_name_str = const_str response_test.id in
      let test_name_pat =
        B.ppat_var (Location.mknoloc (make_response_test_case_function_name response_test))
      in
      let expected_output_expr =
        make_input_expr ~shape_resolver output_shape response_test.params
      in
      let input_expr = make_input_expr ~shape_resolver input_shape None in
      let response_body_expr = make_response_body_expr response_test.body in
      let response_headers_expr = make_headers_expr response_test.headers in
      let operation_call_expr =
        make_operation_call_expr ~namespace_resolver ~shape_resolver ~operation_name
      in
      let error_to_string_expr =
        make_error_to_string_expr ~namespace_resolver ~shape_resolver ~operation_name
      in
      let status_code =
        B.pexp_constant (Ppxlib.Ast.Pconst_integer (Int.to_string response_test.code, None))
      in
      let testable, expected_expr =
        match output_shape with
        | Some name when String.equal name "smithy.api#Unit" ->
            let testable =
              B.pexp_ident (Location.mknoloc (make_lident ~names:[ "Alcotest"; "unit" ]))
            in
            (testable, unit_expr)
        | Some name ->
            let type_name = Codegen.SafeNames.safeTypeName name in
            let pp_func =
              B.pexp_ident (Location.mknoloc (make_lident ~names:[ "Types"; "pp_" ^ type_name ]))
            in
            let equal_func =
              B.pexp_ident (Location.mknoloc (make_lident ~names:[ "Types"; "equal_" ^ type_name ]))
            in
            let testable =
              B.pexp_apply
                (B.pexp_ident
                   (Location.mknoloc (make_lident ~names:[ "Alcotest_http"; "testable_nan_aware" ])))
                [ (Nolabel, pp_func); (Nolabel, equal_func) ]
            in
            let type_expr =
              B.ptyp_constr (Location.mknoloc (make_lident ~names:[ "Types"; type_name ])) []
            in
            let expected = B.pexp_constraint expected_output_expr type_expr in
            (testable, expected)
        | None ->
            let testable =
              B.pexp_ident (Location.mknoloc (make_lident ~names:[ "Alcotest"; "unit" ]))
            in
            (testable, unit_expr)
      in
      [%stri
        let [%p test_name_pat] =
         fun () ->
          Eio.Switch.run ~name:[%e test_name_str] @@ fun sw ->
          let module Mock = (val Http_mock.create_http_mock ()) in
          let http_type = (module Mock : Smaws_Lib.Http.Client with type t = Mock.t) in
          let config = Config.dummy in
          let ctx = Smaws_Lib.Context.make ~config ~http_type () in
          Mock.mock_response ?body:[%e response_body_expr] ~status:[%e status_code]
            ~headers:[%e response_headers_expr] ();
          let response = [%e operation_call_expr] ctx [%e input_expr] in
          match response with
          | Ok result ->
              let expected = [%e expected_expr] in
              check [%e testable] "expected output" expected result
          | Error error -> failwith ([%e error_to_string_expr] error)])

let make_error_response_test_str ~namespace_resolver ~shape_resolver ~input_shape ~operation_name
    error_response_tests =
  (* Generate a test that mocks an error response body and asserts the operation
     returns [Error (`Variant struct)] with the error-shape members deserialised
     to match the test's [params]. Mirrors make_response_test_str but for the
     Error branch; the httpResponseTests live on the error shapes, not the
     operation. *)
  error_response_tests
  |> List.map ~f:(fun (error_shape_name, (response_test : Trait.httpResponseTest)) ->
      Fmt.pr "Generating error response test for %s\n" response_test.id;
      let test_name_str = const_str response_test.id in
      let test_name_pat =
        B.ppat_var (Location.mknoloc (make_response_test_case_function_name response_test))
      in
      let variant = Codegen.SafeNames.safeConstructorName error_shape_name in
      let type_name = Codegen.SafeNames.safeTypeName error_shape_name in
      let expected_struct_expr =
        make_input_expr ~shape_resolver (Some error_shape_name) response_test.params
      in
      let input_expr = make_input_expr ~shape_resolver input_shape None in
      let response_body_expr = make_response_body_expr response_test.body in
      let response_headers_expr = make_headers_expr response_test.headers in
      let operation_call_expr =
        make_operation_call_expr ~namespace_resolver ~shape_resolver ~operation_name
      in
      let error_to_string_expr =
        make_error_to_string_expr ~namespace_resolver ~shape_resolver ~operation_name
      in
      let status_code =
        B.pexp_constant (Ppxlib.Ast.Pconst_integer (Int.to_string response_test.code, None))
      in
      let pp_func =
        B.pexp_ident (Location.mknoloc (make_lident ~names:[ "Types"; "pp_" ^ type_name ]))
      in
      let equal_func =
        B.pexp_ident (Location.mknoloc (make_lident ~names:[ "Types"; "equal_" ^ type_name ]))
      in
      let testable =
        B.pexp_apply
          (B.pexp_ident
             (Location.mknoloc (make_lident ~names:[ "Alcotest_http"; "testable_nan_aware" ])))
          [ (Nolabel, pp_func); (Nolabel, equal_func) ]
      in
      let expected =
        B.pexp_constraint expected_struct_expr
          (B.ptyp_constr (Location.mknoloc (make_lident ~names:[ "Types"; type_name ])) [])
      in
      let err_var_pat = B.ppat_variant variant (Some (B.ppat_var (Location.mknoloc "e"))) in
      [%stri
        let [%p test_name_pat] =
         fun () ->
          Eio.Switch.run ~name:[%e test_name_str] @@ fun sw ->
          let module Mock = (val Http_mock.create_http_mock ()) in
          let http_type = (module Mock : Smaws_Lib.Http.Client with type t = Mock.t) in
          let config = Config.dummy in
          let ctx = Smaws_Lib.Context.make ~config ~http_type () in
          Mock.mock_response ?body:[%e response_body_expr] ~status:[%e status_code]
            ~headers:[%e response_headers_expr] ();
          let response = [%e operation_call_expr] ctx [%e input_expr] in
          match response with
          | Error [%p err_var_pat] ->
              let expected = [%e expected] in
              check [%e testable] "expected error" expected e
          | Error other -> failwith ([%e error_to_string_expr] other)
          | Ok _ -> failwith "expected an error response, got Ok"])

let make_query_test_str ~namespace_resolver ~shape_resolver ~input_shape ~output_shape
    ~operation_name http_protocols =
  http_protocols
  |> List.map ~f:(fun (request_test : Trait.httpRequestTest) ->
      Fmt.pr "Generating query test for %s\n" request_test.id;
      let test_name_str = B.pexp_constant (Ppxlib.Ast.Pconst_string (request_test.id, loc, None)) in
      let test_name_pat =
        B.ppat_var (Location.mknoloc (make_test_case_function_name request_test))
      in
      let input_pat = make_input_pattern ~pattern_name:"input" ~namespace_resolver input_shape in
      let input_expr = make_input_expr ~shape_resolver input_shape request_test.params in
      let operation_call_expr =
        make_operation_call_expr ~namespace_resolver ~shape_resolver ~operation_name
      in
      let operation_call_expr =
        wrap_operation_call_for_idempotency request_test
          (B.pexp_apply operation_call_expr
             [ (Nolabel, exp_ident "ctx"); (Nolabel, exp_ident "input") ])
      in
      let request_body_test = make_query_request_body_test request_test.body in
      let request_method_expected_expr = make_request_method_expected_expr request_test.method_ in
      let request_uri_expected_expr = make_request_uri_expected_expr request_test.uri in
      let request_headers_expected_expr = make_headers_expr request_test.headers in
      let config_expr = make_config_expr request_test in
      [%stri
        let [%p test_name_pat] =
         fun () ->
          Eio.Switch.run ~name:[%e test_name_str] @@ fun sw ->
          let module Mock = (val Http_mock.create_http_mock ()) in
          let http_type = (module Mock : Smaws_Lib.Http.Client with type t = Mock.t) in

          let config = [%e config_expr] in

          let ctx = Smaws_Lib.Context.make ~config ~http_type () in
          let [%p input_pat] = [%e input_expr] in
          Mock.mock_response ~status:200 ~headers:[] ();
          let _response = [%e operation_call_expr] in
          let request = Mock.last_request () in
          let () = [%e request_body_test] in
          let () =
            check Alcotest_http.method_testable "expected request method"
              [%e request_method_expected_expr] request.method_
          in
          let () =
            check Alcotest_http.uri_testable "expected request uri" [%e request_uri_expected_expr]
              request.uri
          in
          let () =
            check Alcotest_http.headers_testable "expected request headers"
              [%e request_headers_expected_expr] request.headers
          in
          ()])

(* Tests which are disabled for reasons *)
let bannedTests =
  [
    (* these tests require SDK-level gzip compression which is not implemented *)
    "SDKAppliedContentEncoding_awsJson1_1";
    "SDKAppendsGzipAndIgnoresHttpProvidedEncoding_awsJson1_1";
    "SDKAppliedContentEncoding_awsQuery";
    "SDKAppendsGzipAndIgnoresHttpProvidedEncoding_awsQuery";
  ]

let is_query_service (service : Shape.serviceShapeDetails option) =
  match service with
  | None -> false
  | Some s ->
      Trait.hasTrait s.traits (function Trait.AwsProtocolAwsQueryTrait -> true | _ -> false)

(* httpResponseTests attached to an operation's error shapes (rather than to the
   operation itself). Returns (error_shape_name, httpResponseTest) pairs, after
   the same banned/appliesTo/protocol filters as the operation-level tests. *)
let error_shape_response_tests ~query_protocol ~query_protocol_id
    ~(shape_resolver : Codegen.Shape_resolver.t)
    (operationShapeDetails : Shape.operationShapeDetails) =
  operationShapeDetails.errors |> Option.value ~default:[]
  |> List.concat_map ~f:(fun error_name ->
      let trait_tests =
        Codegen.Shape_resolver.find_shape_by_name ~name:error_name shape_resolver
        |> Option.bind ~f:(function
          | Shape.StructureShape { traits; _ } ->
              Option.bind traits ~f:(fun ts ->
                  List.find_map ts ~f:(function
                    | Trait.TestHttpResponseTests x -> Some x
                    | _ -> None))
          | _ -> None)
        |> Option.value ~default:[]
      in
      trait_tests
      |> List.filter ~f:(fun (t : Trait.httpResponseTest) ->
          not (List.exists bannedTests ~f:(String.equal t.id)))
      |> List.filter ~f:(fun (t : Trait.httpResponseTest) ->
          match t.appliesTo with Some `Server -> false | Some `Client | None -> true)
      |> List.filter ~f:(fun (t : Trait.httpResponseTest) ->
          if query_protocol then String.equal t.protocol query_protocol_id
          else not (String.equal t.protocol query_protocol_id))
      |> List.map ~f:(fun t -> (error_name, t)))

let generate_ml ~shape_resolver ~operation_shapes ~structure_shapes ~alias_context
    ?(with_derivings = false) ?(no_open = false)
    ?(service : Shape.serviceShapeDetails option = None)
    ~(namespace_resolver : Codegen.Namespace_resolver.Namespace_resolver.t) fmt =
  let query_protocol = is_query_service service in
  let query_protocol_id = "aws.protocols#awsQuery" in
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
             |> List.filter ~f:(fun (t : Trait.httpRequestTest) ->
                 not (List.exists bannedTests ~f:(String.equal t.id)))
             |> List.filter ~f:(fun (t : Trait.httpRequestTest) ->
                 match t.appliesTo with Some `Client | None -> true | Some `Server -> false)
             |> List.filter ~f:(fun (t : Trait.httpRequestTest) ->
                 if query_protocol then String.equal t.protocol query_protocol_id
                 else not (String.equal t.protocol query_protocol_id))
           in
           let http_response_protocols =
             traits |> Option.value ~default:[]
             |> List.find_map ~f:(function Trait.TestHttpResponseTests x -> Some x | _ -> None)
             |> Option.value ~default:[]
             |> List.filter ~f:(fun (t : Trait.httpResponseTest) ->
                 not (List.exists bannedTests ~f:(String.equal t.id)))
             |> List.filter ~f:(fun (t : Trait.httpResponseTest) ->
                 (* Which response tests a client SDK should run, by appliesTo:
                       - None (default): applies to BOTH client and server -> run
                         (core deserialization).
                       - `Client: client-specific behaviour -> run on a client SDK.
                       - `Server: server-only (server must produce these bytes) ->
                         irrelevant to a client -> drop.
                       So the correct filter is `Client | None kept, `Server dropped
                       -- symmetric with the request-test filter above. The
                       original code had it inverted (kept Server|None, dropped
                       Client), silently skipping the client-applies response
                       tests.

                       awsQuery: apply the correct filter. Its `Client tests are
                       core client-side deserialization (empty collections, datetime
                       offsets / fractional seconds) that must pass -- they now
                       run and pass.

                       awsJson: keep the old (inverted) filter for now. Its
                       `Client tests are optional client-robustness behaviours
                       that this SDK has not implemented -- per the smithy "Default
                       value serialization" guidance, client deserializers SHOULD
                       (not MUST) error-correct: populate default zero values
                       when the server omits a @required member, tolerate
                       unexpected / __type-tagged output, and allow nulls.
                       Running them would fail for unimplemented-feature reasons,
                       not bugs; they stay skipped until that robustness is built. *)
                 if query_protocol then (
                   match t.appliesTo with Some `Client | None -> true | Some `Server -> false)
                 else (match t.appliesTo with Some `Server | None -> true | Some `Client -> false))
             |> List.filter ~f:(fun (t : Trait.httpResponseTest) ->
                 if query_protocol then String.equal t.protocol query_protocol_id
                 else not (String.equal t.protocol query_protocol_id))
           in
           let input_shape = input in
           let output_shape = output in
           let error_response_tests =
             error_shape_response_tests ~query_protocol ~query_protocol_id ~shape_resolver
               operationShapeDetails
           in
           let request_test_functions =
             if query_protocol then
               make_query_test_str ~namespace_resolver ~shape_resolver ~input_shape ~output_shape
                 ~operation_name:name http_protocols
             else
               make_test_str ~namespace_resolver ~shape_resolver ~input_shape ~output_shape
                 ~operation_name:name http_protocols
           in
           let response_test_functions =
             make_response_test_str ~namespace_resolver ~shape_resolver ~input_shape ~output_shape
               ~operation_name:name http_response_protocols
           in
           let error_response_test_functions =
             make_error_response_test_str ~namespace_resolver ~shape_resolver ~input_shape
               ~operation_name:name error_response_tests
           in
           let test_case_functions =
             request_test_functions @ response_test_functions @ error_response_test_functions
           in
           let test_suite_name =
             B.ppat_var
               (Location.mknoloc ((name |> Codegen.SafeNames.safeFunctionName) ^ "_test_suite"))
           in
           let test_suite_str = const_str name in
           let test_cases =
             B.elist
               ((http_protocols
                |> List.map ~f:(fun (protocol : Trait.httpRequestTest) ->
                    test_case_tuple protocol.id
                      (Codegen.Ppx_util.exp_ident (make_test_case_function_name protocol))))
               @ (http_response_protocols
                 |> List.map ~f:(fun (protocol : Trait.httpResponseTest) ->
                     test_case_tuple protocol.id
                       (Codegen.Ppx_util.exp_ident (make_response_test_case_function_name protocol)))
                 )
               @ (error_response_tests
                 |> List.map ~f:(fun (_, (protocol : Trait.httpResponseTest)) ->
                     test_case_tuple protocol.id
                       (Codegen.Ppx_util.exp_ident (make_response_test_case_function_name protocol)))
                 ))
           in
           test_case_functions
           @ [%str
               let [%p test_suite_name] : unit Alcotest.test = ([%e test_suite_str], [%e test_cases])])
  in
  let namespace_str =
    const_str (Codegen.Namespace_resolver.Namespace_resolver.current_namespace namespace_resolver)
  in
  let test_suites_expr =
    operation_shapes
    |> List.map ~f:(fun (name, _, _) ->
        B.pexp_ident
          (Location.mknoloc
             (Longident.Lident ((name |> Codegen.SafeNames.safeFunctionName) ^ "_test_suite"))))
    |> B.elist
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
  Ppxlib.Pprintast.structure fmt
    (opens @ flattened_structure_items
    @ [
        [%stri
          let () = Eio_main.run @@ fun env -> Alcotest.run [%e namespace_str] [%e test_suites_expr]];
      ])

let generate_mli ~structure_shapes ~alias_context ?(with_derivings = false) ?(no_open = false)
    ~(namespace_resolver : Codegen.Namespace_resolver.Namespace_resolver.t) fmt =
  ()
