open Smaws_Lib.Json.DeserializeHelpers
open Types
let union_with_json_name_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let (key, value_) =
    match _list with
    | (key, value_)::_ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union") in
  (match key with
   | "baz" ->
       Baz
         (Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson value_
            path)
   | "bar" ->
       Bar
         (Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson value_
            path)
   | "foo" ->
       Foo
         (Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson value_
            path)
   | _ as unknown ->
       raise
         (deserialize_unknown_enum_value_error path "UnionWithJsonName"
            unknown) : union_with_json_name)
let union_payload_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let (key, value_) =
    match _list with
    | (key, value_)::_ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union") in
  (match key with
   | "greeting" ->
       Greeting
         (Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson value_
            path)
   | _ as unknown ->
       raise
         (deserialize_unknown_enum_value_error path "UnionPayload" unknown) : 
    union_payload)
let my_union_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let (key, value_) =
    match _list with
    | (key, value_)::_ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union") in
  (match key with
   | "renamedStructureValue" ->
       RenamedStructureValue
         (Restjson_nested.Json_deserializers.greeting_struct_of_yojson value_
            path)
   | "structureValue" ->
       StructureValue
         (Shared.Json_deserializers.greeting_struct_of_yojson value_ path)
   | "mapValue" ->
       MapValue (Shared.Json_deserializers.string_map_of_yojson value_ path)
   | "listValue" ->
       ListValue
         (Shared.Json_deserializers.string_list_of_yojson value_ path)
   | "enumValue" ->
       EnumValue (Shared.Json_deserializers.foo_enum_of_yojson value_ path)
   | "timestampValue" ->
       TimestampValue
         (Smaws_Lib.Smithy_api.Json_deserializers.timestamp_of_yojson value_
            path)
   | "blobValue" ->
       BlobValue
         (Smaws_Lib.Smithy_api.Json_deserializers.blob_of_yojson value_ path)
   | "numberValue" ->
       NumberValue
         (Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson value_
            path)
   | "booleanValue" ->
       BooleanValue
         (Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson value_
            path)
   | "stringValue" ->
       StringValue
         (Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson value_
            path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "MyUnion" unknown) : 
    my_union)
let union_input_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     contents =
       (option_of_yojson (value_for_key my_union_of_yojson "contents") _list
          path)
   } : union_input_output)
let top_level_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let timestamp_format_headers_i_o_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_date_time =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.date_time_of_yojson
             "targetDateTime") _list path);
     target_http_date =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.http_date_of_yojson
             "targetHttpDate") _list path);
     target_epoch_seconds =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.epoch_seconds_of_yojson
             "targetEpochSeconds") _list path);
     default_format =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.timestamp_of_yojson
             "defaultFormat") _list path);
     member_date_time =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.timestamp_of_yojson
             "memberDateTime") _list path);
     member_http_date =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.timestamp_of_yojson
             "memberHttpDate") _list path);
     member_epoch_seconds =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.timestamp_of_yojson
             "memberEpochSeconds") _list path)
   } : timestamp_format_headers_i_o)
let test_string_map_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path
let test_string_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    tree path
let test_no_payload_input_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     test_id =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "testId") _list path)
   } : test_no_payload_input_output)
let payload_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "data")
          _list path)
   } : payload_config)
let test_payload_structure_input_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     payload_config =
       (option_of_yojson
          (value_for_key payload_config_of_yojson "payloadConfig") _list path);
     test_id =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "testId") _list path)
   } : test_payload_structure_input_output)
let test_payload_blob_input_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.blob_of_yojson "data")
          _list path);
     content_type =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "contentType") _list path)
   } : test_payload_blob_input_output)
let test_int_enum_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `Int 2 -> TWO
    | `Int 1 -> ONE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TestIntEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "TestIntEnum") : 
     test_int_enum) : test_int_enum)
let test_enum_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "BAZ" -> BAZ
    | `String "BAR" -> BAR
    | `String "FOO" -> FOO
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "TestEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "TestEnum") : test_enum) : 
  test_enum)
let test_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timeout =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
             "timeout") _list path)
   } : test_config)
let test_body_structure_input_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     test_config =
       (option_of_yojson (value_for_key test_config_of_yojson "testConfig")
          _list path);
     test_id =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "testId") _list path)
   } : test_body_structure_input_output)
let structure_list_member_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     b =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "b")
          _list path);
     a =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "a")
          _list path)
   } : structure_list_member)
let structure_list_of_yojson tree path =
  list_of_yojson structure_list_member_of_yojson tree path
let string_payload_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     payload =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "payload") _list path)
   } : string_payload_input)
let string_enum_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "enumvalue" -> V
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "StringEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "StringEnum") : string_enum) : 
  string_enum)
let streaming_text_plain_blob_of_yojson = blob_of_yojson
let streaming_traits_with_media_type_input_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     blob =
       (option_of_yojson
          (value_for_key streaming_text_plain_blob_of_yojson "blob") _list
          path);
     foo =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "foo")
          _list path)
   } : streaming_traits_with_media_type_input_output)
let finite_streaming_blob_of_yojson = blob_of_yojson
let streaming_traits_require_length_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     blob =
       (option_of_yojson
          (value_for_key finite_streaming_blob_of_yojson "blob") _list path);
     foo =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "foo")
          _list path)
   } : streaming_traits_require_length_input)
let streaming_blob_of_yojson = blob_of_yojson
let streaming_traits_input_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     blob =
       (option_of_yojson (value_for_key streaming_blob_of_yojson "blob")
          _list path);
     foo =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "foo")
          _list path)
   } : streaming_traits_input_output)
let sparse_struct_map_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    Shared.Json_deserializers.greeting_struct_of_yojson tree path
let sparse_set_map_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    Shared.Json_deserializers.string_set_of_yojson tree path
let sparse_number_map_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson tree path
let sparse_boolean_map_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson tree path
let sparse_json_maps_input_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sparse_set_map =
       (option_of_yojson
          (value_for_key sparse_set_map_of_yojson "sparseSetMap") _list path);
     sparse_string_map =
       (option_of_yojson
          (value_for_key
             Shared.Json_deserializers.sparse_string_map_of_yojson
             "sparseStringMap") _list path);
     sparse_boolean_map =
       (option_of_yojson
          (value_for_key sparse_boolean_map_of_yojson "sparseBooleanMap")
          _list path);
     sparse_number_map =
       (option_of_yojson
          (value_for_key sparse_number_map_of_yojson "sparseNumberMap") _list
          path);
     sparse_struct_map =
       (option_of_yojson
          (value_for_key sparse_struct_map_of_yojson "sparseStructMap") _list
          path)
   } : sparse_json_maps_input_output)
let sparse_json_lists_input_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sparse_short_list =
       (option_of_yojson
          (value_for_key
             Shared.Json_deserializers.sparse_short_list_of_yojson
             "sparseShortList") _list path);
     sparse_string_list =
       (option_of_yojson
          (value_for_key
             Shared.Json_deserializers.sparse_string_list_of_yojson
             "sparseStringList") _list path)
   } : sparse_json_lists_input_output)
let simple_union_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let (key, value_) =
    match _list with
    | (key, value_)::_ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union") in
  (match key with
   | "string" ->
       String
         (Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson value_
            path)
   | "int" ->
       Int
         (Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson value_
            path)
   | _ as unknown ->
       raise
         (deserialize_unknown_enum_value_error path "SimpleUnion" unknown) : 
    simple_union)
let simple_scalar_properties_input_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     double_value =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
             "doubleValue") _list path);
     float_value =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson
             "floatValue") _list path);
     long_value =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson
             "longValue") _list path);
     integer_value =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
             "integerValue") _list path);
     short_value =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.short_of_yojson
             "shortValue") _list path);
     byte_value =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.byte_of_yojson
             "byteValue") _list path);
     false_boolean_value =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
             "falseBooleanValue") _list path);
     true_boolean_value =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
             "trueBooleanValue") _list path);
     string_value =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "stringValue") _list path);
     foo =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "foo")
          _list path)
   } : simple_scalar_properties_input_output)
let simple_map_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path
let simple_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    tree path
let response_code_required_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     response_code =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
          "responseCode" _list path)
   } : response_code_required_output)
let response_code_http_fallback_input_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let rec recursive_shapes_input_output_nested1_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     nested =
       (option_of_yojson
          (value_for_key recursive_shapes_input_output_nested2_of_yojson
             "nested") _list path);
     foo =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "foo")
          _list path)
   } : recursive_shapes_input_output_nested1)
and recursive_shapes_input_output_nested2_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recursive_member =
       (option_of_yojson
          (value_for_key recursive_shapes_input_output_nested1_of_yojson
             "recursiveMember") _list path);
     bar =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "bar")
          _list path)
   } : recursive_shapes_input_output_nested2)
let recursive_shapes_input_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     nested =
       (option_of_yojson
          (value_for_key recursive_shapes_input_output_nested1_of_yojson
             "nested") _list path)
   } : recursive_shapes_input_output)
let query_precedence_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     baz =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.string_map_of_yojson "baz")
          _list path);
     foo =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "foo")
          _list path)
   } : query_precedence_input)
let query_params_as_string_list_map_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     foo =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.string_list_map_of_yojson
             "foo") _list path);
     qux =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "qux")
          _list path)
   } : query_params_as_string_list_map_input)
let query_idempotency_token_auto_fill_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     token =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "token") _list path)
   } : query_idempotency_token_auto_fill_input)
let put_with_content_encoding_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "data")
          _list path);
     encoding =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "encoding") _list path)
   } : put_with_content_encoding_input)
let post_union_with_json_name_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value =
       (value_for_key union_with_json_name_of_yojson "value" _list path)
   } : post_union_with_json_name_output)
let post_union_with_json_name_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value =
       (option_of_yojson
          (value_for_key union_with_json_name_of_yojson "value") _list path)
   } : post_union_with_json_name_input)
let player_action_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let (key, value_) =
    match _list with
    | (key, value_)::_ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union") in
  (match key with
   | "quit" ->
       Quit
         (Smaws_Lib.Smithy_api.Json_deserializers.unit__of_yojson value_ path)
   | _ as unknown ->
       raise
         (deserialize_unknown_enum_value_error path "PlayerAction" unknown) : 
    player_action)
let post_player_action_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ action = (value_for_key player_action_of_yojson "action" _list path) } : 
    post_player_action_output)
let post_player_action_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     action =
       (option_of_yojson (value_for_key player_action_of_yojson "action")
          _list path)
   } : post_player_action_input)
let operation_with_nested_structure_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let operation_with_nested_structure_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ top_level = (value_for_key top_level_of_yojson "topLevel" _list path) } : 
    operation_with_nested_structure_input)
let operation_with_defaults_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let defaults_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let client_optional_defaults_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     member =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
             "member") _list path)
   } : client_optional_defaults)
let operation_with_defaults_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     other_top_level_default =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
             "otherTopLevelDefault") _list path);
     top_level_default =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "topLevelDefault") _list path);
     client_optional_defaults =
       (option_of_yojson
          (value_for_key client_optional_defaults_of_yojson
             "clientOptionalDefaults") _list path);
     defaults =
       (option_of_yojson (value_for_key defaults_of_yojson "defaults") _list
          path)
   } : operation_with_defaults_input)
let omits_serializing_empty_lists_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     query_integer_enum_list =
       (option_of_yojson
          (value_for_key
             Shared.Json_deserializers.integer_enum_list_of_yojson
             "queryIntegerEnumList") _list path);
     query_enum_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.foo_enum_list_of_yojson
             "queryEnumList") _list path);
     query_timestamp_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.timestamp_list_of_yojson
             "queryTimestampList") _list path);
     query_boolean_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.boolean_list_of_yojson
             "queryBooleanList") _list path);
     query_double_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.double_list_of_yojson
             "queryDoubleList") _list path);
     query_integer_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.integer_list_of_yojson
             "queryIntegerList") _list path);
     query_string_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.string_list_of_yojson
             "queryStringList") _list path)
   } : omits_serializing_empty_lists_input)
let omits_null_serializes_empty_string_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     empty_string =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "emptyString") _list path);
     null_value =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "nullValue") _list path)
   } : omits_null_serializes_empty_string_input)
let null_and_empty_headers_i_o_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     c =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.string_list_of_yojson "c")
          _list path);
     b =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "b")
          _list path);
     a =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "a")
          _list path)
   } : null_and_empty_headers_i_o)
let no_input_and_output_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let json_value_of_yojson = string_of_yojson
let media_type_header_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     json =
       (option_of_yojson (value_for_key json_value_of_yojson "json") _list
          path)
   } : media_type_header_output)
let media_type_header_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     json =
       (option_of_yojson (value_for_key json_value_of_yojson "json") _list
          path)
   } : media_type_header_input)
let malformed_union_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     union =
       (option_of_yojson (value_for_key simple_union_of_yojson "union") _list
          path)
   } : malformed_union_input)
let malformed_timestamp_query_http_date_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timestamp =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.timestamp_of_yojson
          "timestamp" _list path)
   } : malformed_timestamp_query_http_date_input)
let malformed_timestamp_query_epoch_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timestamp =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.timestamp_of_yojson
          "timestamp" _list path)
   } : malformed_timestamp_query_epoch_input)
let malformed_timestamp_query_default_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timestamp =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.timestamp_of_yojson
          "timestamp" _list path)
   } : malformed_timestamp_query_default_input)
let malformed_timestamp_path_http_date_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timestamp =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.timestamp_of_yojson
          "timestamp" _list path)
   } : malformed_timestamp_path_http_date_input)
let malformed_timestamp_path_epoch_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timestamp =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.timestamp_of_yojson
          "timestamp" _list path)
   } : malformed_timestamp_path_epoch_input)
let malformed_timestamp_path_default_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timestamp =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.timestamp_of_yojson
          "timestamp" _list path)
   } : malformed_timestamp_path_default_input)
let malformed_timestamp_header_epoch_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timestamp =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.timestamp_of_yojson
          "timestamp" _list path)
   } : malformed_timestamp_header_epoch_input)
let malformed_timestamp_header_default_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timestamp =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.timestamp_of_yojson
          "timestamp" _list path)
   } : malformed_timestamp_header_default_input)
let malformed_timestamp_header_date_time_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timestamp =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.timestamp_of_yojson
          "timestamp" _list path)
   } : malformed_timestamp_header_date_time_input)
let malformed_timestamp_body_http_date_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timestamp =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.timestamp_of_yojson
          "timestamp" _list path)
   } : malformed_timestamp_body_http_date_input)
let malformed_timestamp_body_default_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timestamp =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.timestamp_of_yojson
          "timestamp" _list path)
   } : malformed_timestamp_body_default_input)
let malformed_timestamp_body_date_time_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timestamp =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.timestamp_of_yojson
          "timestamp" _list path)
   } : malformed_timestamp_body_date_time_input)
let json_header_string_of_yojson = string_of_yojson
let malformed_string_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     blob =
       (option_of_yojson (value_for_key json_header_string_of_yojson "blob")
          _list path)
   } : malformed_string_input)
let malformed_short_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     short_in_header =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.short_of_yojson
             "shortInHeader") _list path);
     short_in_query =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.short_of_yojson
             "shortInQuery") _list path);
     short_in_path =
       (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.short_of_yojson
          "shortInPath" _list path);
     short_in_body =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.short_of_yojson
             "shortInBody") _list path)
   } : malformed_short_input)
let malformed_request_body_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     float_ =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson "float")
          _list path);
     int_ =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "int")
          _list path)
   } : malformed_request_body_input)
let malformed_map_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     body_map =
       (option_of_yojson (value_for_key simple_map_of_yojson "bodyMap") _list
          path)
   } : malformed_map_input)
let malformed_long_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     long_in_header =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson
             "longInHeader") _list path);
     long_in_query =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson
             "longInQuery") _list path);
     long_in_path =
       (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson
          "longInPath" _list path);
     long_in_body =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson
             "longInBody") _list path)
   } : malformed_long_input)
let malformed_list_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     body_list =
       (option_of_yojson (value_for_key simple_list_of_yojson "bodyList")
          _list path)
   } : malformed_list_input)
let malformed_integer_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     integer_in_header =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
             "integerInHeader") _list path);
     integer_in_query =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
             "integerInQuery") _list path);
     integer_in_path =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
          "integerInPath" _list path);
     integer_in_body =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
             "integerInBody") _list path)
   } : malformed_integer_input)
let malformed_float_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     float_in_header =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson
             "floatInHeader") _list path);
     float_in_query =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson
             "floatInQuery") _list path);
     float_in_path =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson
          "floatInPath" _list path);
     float_in_body =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson
             "floatInBody") _list path)
   } : malformed_float_input)
let malformed_double_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     double_in_header =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
             "doubleInHeader") _list path);
     double_in_query =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
             "doubleInQuery") _list path);
     double_in_path =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
          "doubleInPath" _list path);
     double_in_body =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
             "doubleInBody") _list path)
   } : malformed_double_input)
let malformed_content_type_with_payload_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     payload =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.jpeg_blob_of_yojson
             "payload") _list path)
   } : malformed_content_type_with_payload_input)
let malformed_content_type_without_body_empty_input_input_of_yojson tree path
  =
  let _list = assoc_of_yojson tree path in
  ({
     header =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "header") _list path)
   } : malformed_content_type_without_body_empty_input_input)
let malformed_content_type_with_generic_string_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     payload =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "payload") _list path)
   } : malformed_content_type_with_generic_string_input)
let malformed_byte_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     byte_in_header =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.byte_of_yojson
             "byteInHeader") _list path);
     byte_in_query =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.byte_of_yojson
             "byteInQuery") _list path);
     byte_in_path =
       (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.byte_of_yojson
          "byteInPath" _list path);
     byte_in_body =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.byte_of_yojson
             "byteInBody") _list path)
   } : malformed_byte_input)
let malformed_boolean_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     boolean_in_header =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
             "booleanInHeader") _list path);
     boolean_in_query =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
             "booleanInQuery") _list path);
     boolean_in_path =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
          "booleanInPath" _list path);
     boolean_in_body =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
             "booleanInBody") _list path)
   } : malformed_boolean_input)
let malformed_blob_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     blob =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.blob_of_yojson "blob")
          _list path)
   } : malformed_blob_input)
let malformed_accept_with_payload_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     payload =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.jpeg_blob_of_yojson
             "payload") _list path)
   } : malformed_accept_with_payload_output)
let malformed_accept_with_generic_string_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     payload =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "payload") _list path)
   } : malformed_accept_with_generic_string_output)
let json_timestamps_input_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     http_date_on_target =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.http_date_of_yojson
             "httpDateOnTarget") _list path);
     http_date =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.timestamp_of_yojson
             "httpDate") _list path);
     epoch_seconds_on_target =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.epoch_seconds_of_yojson
             "epochSecondsOnTarget") _list path);
     epoch_seconds =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.timestamp_of_yojson
             "epochSeconds") _list path);
     date_time_on_target =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.date_time_of_yojson
             "dateTimeOnTarget") _list path);
     date_time =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.timestamp_of_yojson
             "dateTime") _list path);
     normal =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.timestamp_of_yojson
             "normal") _list path)
   } : json_timestamps_input_output)
let dense_struct_map_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    Shared.Json_deserializers.greeting_struct_of_yojson tree path
let dense_number_map_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson tree path
let dense_boolean_map_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson tree path
let dense_string_map_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path
let dense_set_map_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    Shared.Json_deserializers.string_set_of_yojson tree path
let json_maps_input_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dense_set_map =
       (option_of_yojson
          (value_for_key dense_set_map_of_yojson "denseSetMap") _list path);
     dense_string_map =
       (option_of_yojson
          (value_for_key dense_string_map_of_yojson "denseStringMap") _list
          path);
     dense_boolean_map =
       (option_of_yojson
          (value_for_key dense_boolean_map_of_yojson "denseBooleanMap") _list
          path);
     dense_number_map =
       (option_of_yojson
          (value_for_key dense_number_map_of_yojson "denseNumberMap") _list
          path);
     dense_struct_map =
       (option_of_yojson
          (value_for_key dense_struct_map_of_yojson "denseStructMap") _list
          path)
   } : json_maps_input_output)
let json_lists_input_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     structure_list =
       (option_of_yojson
          (value_for_key structure_list_of_yojson "structureList") _list path);
     nested_string_list =
       (option_of_yojson
          (value_for_key
             Shared.Json_deserializers.nested_string_list_of_yojson
             "nestedStringList") _list path);
     int_enum_list =
       (option_of_yojson
          (value_for_key
             Shared.Json_deserializers.integer_enum_list_of_yojson
             "intEnumList") _list path);
     enum_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.foo_enum_list_of_yojson
             "enumList") _list path);
     timestamp_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.timestamp_list_of_yojson
             "timestampList") _list path);
     boolean_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.boolean_list_of_yojson
             "booleanList") _list path);
     integer_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.integer_list_of_yojson
             "integerList") _list path);
     string_set =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.string_set_of_yojson
             "stringSet") _list path);
     string_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.string_list_of_yojson
             "stringList") _list path)
   } : json_lists_input_output)
let json_int_enums_input_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     integer_enum_map =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.integer_enum_map_of_yojson
             "integerEnumMap") _list path);
     integer_enum_set =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.integer_enum_set_of_yojson
             "integerEnumSet") _list path);
     integer_enum_list =
       (option_of_yojson
          (value_for_key
             Shared.Json_deserializers.integer_enum_list_of_yojson
             "integerEnumList") _list path);
     integer_enum3 =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.integer_enum_of_yojson
             "integerEnum3") _list path);
     integer_enum2 =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.integer_enum_of_yojson
             "integerEnum2") _list path);
     integer_enum1 =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.integer_enum_of_yojson
             "integerEnum1") _list path)
   } : json_int_enums_input_output)
let json_enums_input_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     foo_enum_map =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.foo_enum_map_of_yojson
             "fooEnumMap") _list path);
     foo_enum_set =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.foo_enum_set_of_yojson
             "fooEnumSet") _list path);
     foo_enum_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.foo_enum_list_of_yojson
             "fooEnumList") _list path);
     foo_enum3 =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.foo_enum_of_yojson
             "fooEnum3") _list path);
     foo_enum2 =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.foo_enum_of_yojson
             "fooEnum2") _list path);
     foo_enum1 =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.foo_enum_of_yojson
             "fooEnum1") _list path)
   } : json_enums_input_output)
let json_blobs_input_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.blob_of_yojson "data")
          _list path)
   } : json_blobs_input_output)
let input_and_output_with_headers_i_o_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     header_integer_enum_list =
       (option_of_yojson
          (value_for_key
             Shared.Json_deserializers.integer_enum_list_of_yojson
             "headerIntegerEnumList") _list path);
     header_integer_enum =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.integer_enum_of_yojson
             "headerIntegerEnum") _list path);
     header_enum_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.foo_enum_list_of_yojson
             "headerEnumList") _list path);
     header_enum =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.foo_enum_of_yojson
             "headerEnum") _list path);
     header_timestamp_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.timestamp_list_of_yojson
             "headerTimestampList") _list path);
     header_boolean_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.boolean_list_of_yojson
             "headerBooleanList") _list path);
     header_integer_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.integer_list_of_yojson
             "headerIntegerList") _list path);
     header_string_set =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.string_set_of_yojson
             "headerStringSet") _list path);
     header_string_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.string_list_of_yojson
             "headerStringList") _list path);
     header_false_bool =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
             "headerFalseBool") _list path);
     header_true_bool =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
             "headerTrueBool") _list path);
     header_double =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
             "headerDouble") _list path);
     header_float =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson
             "headerFloat") _list path);
     header_long =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson
             "headerLong") _list path);
     header_integer =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
             "headerInteger") _list path);
     header_short =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.short_of_yojson
             "headerShort") _list path);
     header_byte =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.byte_of_yojson
             "headerByte") _list path);
     header_string =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "headerString") _list path)
   } : input_and_output_with_headers_i_o)
let ignore_query_params_in_response_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     baz =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "baz")
          _list path)
   } : ignore_query_params_in_response_output)
let http_response_code_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
             "Status") _list path)
   } : http_response_code_output)
let http_request_with_regex_literal_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     str =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "str"
          _list path)
   } : http_request_with_regex_literal_input)
let http_request_with_labels_and_timestamp_format_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_date_time =
       (value_for_key Shared.Json_deserializers.date_time_of_yojson
          "targetDateTime" _list path);
     target_http_date =
       (value_for_key Shared.Json_deserializers.http_date_of_yojson
          "targetHttpDate" _list path);
     target_epoch_seconds =
       (value_for_key Shared.Json_deserializers.epoch_seconds_of_yojson
          "targetEpochSeconds" _list path);
     default_format =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.timestamp_of_yojson
          "defaultFormat" _list path);
     member_date_time =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.timestamp_of_yojson
          "memberDateTime" _list path);
     member_http_date =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.timestamp_of_yojson
          "memberHttpDate" _list path);
     member_epoch_seconds =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.timestamp_of_yojson
          "memberEpochSeconds" _list path)
   } : http_request_with_labels_and_timestamp_format_input)
let http_request_with_labels_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     timestamp =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.timestamp_of_yojson
          "timestamp" _list path);
     boolean_ =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
          "boolean" _list path);
     double =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "double"
          _list path);
     float_ =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson "float"
          _list path);
     long =
       (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson
          "long" _list path);
     integer =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "integer"
          _list path);
     short =
       (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.short_of_yojson
          "short" _list path);
     string_ =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "string"
          _list path)
   } : http_request_with_labels_input)
let http_request_with_greedy_label_in_path_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     baz =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "baz"
          _list path);
     foo =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "foo"
          _list path)
   } : http_request_with_greedy_label_in_path_input)
let http_request_with_float_labels_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     double =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "double"
          _list path);
     float_ =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson "float"
          _list path)
   } : http_request_with_float_labels_input)
let http_prefix_headers_in_response_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     prefix_headers =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.string_map_of_yojson
             "prefixHeaders") _list path)
   } : http_prefix_headers_in_response_output)
let http_prefix_headers_in_response_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let http_prefix_headers_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     foo_map =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.string_map_of_yojson
             "fooMap") _list path);
     foo =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "foo")
          _list path)
   } : http_prefix_headers_output)
let http_prefix_headers_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     foo_map =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.string_map_of_yojson
             "fooMap") _list path);
     foo =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "foo")
          _list path)
   } : http_prefix_headers_input)
let http_payload_with_union_input_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     nested =
       (option_of_yojson (value_for_key union_payload_of_yojson "nested")
          _list path)
   } : http_payload_with_union_input_output)
let nested_payload_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "name")
          _list path);
     greeting =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "greeting") _list path)
   } : nested_payload)
let http_payload_with_structure_input_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     nested =
       (option_of_yojson (value_for_key nested_payload_of_yojson "nested")
          _list path)
   } : http_payload_with_structure_input_output)
let http_payload_traits_with_media_type_input_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     blob =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.text_plain_blob_of_yojson
             "blob") _list path);
     foo =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "foo")
          _list path)
   } : http_payload_traits_with_media_type_input_output)
let http_payload_traits_input_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     blob =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.blob_of_yojson "blob")
          _list path);
     foo =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "foo")
          _list path)
   } : http_payload_traits_input_output)
let enum_payload_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     payload =
       (option_of_yojson (value_for_key string_enum_of_yojson "payload")
          _list path)
   } : enum_payload_input)
let http_empty_prefix_headers_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     specific_header =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "specificHeader") _list path);
     prefix_headers =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.string_map_of_yojson
             "prefixHeaders") _list path)
   } : http_empty_prefix_headers_output)
let http_empty_prefix_headers_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     specific_header =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "specificHeader") _list path);
     prefix_headers =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.string_map_of_yojson
             "prefixHeaders") _list path)
   } : http_empty_prefix_headers_input)
let http_checksum_required_input_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     foo =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "foo")
          _list path)
   } : http_checksum_required_input_output)
let invalid_greeting_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "Message") _list path)
   } : invalid_greeting)
let foo_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let complex_nested_error_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     foo =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Foo")
          _list path)
   } : complex_nested_error_data)
let complex_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     nested =
       (option_of_yojson
          (value_for_key complex_nested_error_data_of_yojson "Nested") _list
          path);
     top_level =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "TopLevel") _list path);
     header =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "Header") _list path)
   } : complex_error)
let greeting_with_errors_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     greeting =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "greeting") _list path)
   } : greeting_with_errors_output)
let fractional_seconds_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     datetime =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.date_time_of_yojson
             "datetime") _list path)
   } : fractional_seconds_output)
let host_label_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     label =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "label"
          _list path)
   } : host_label_input)
let empty_input_and_empty_output_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let empty_input_and_empty_output_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let document_of_yojson = json_of_yojson
let document_type_as_payload_input_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_value =
       (option_of_yojson (value_for_key document_of_yojson "documentValue")
          _list path)
   } : document_type_as_payload_input_output)
let document_valued_map_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    document_of_yojson tree path
let document_type_as_map_value_input_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     doc_valued_map =
       (option_of_yojson
          (value_for_key document_valued_map_of_yojson "docValuedMap") _list
          path)
   } : document_type_as_map_value_input_output)
let document_type_input_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     document_value =
       (option_of_yojson (value_for_key document_of_yojson "documentValue")
          _list path);
     string_value =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "stringValue") _list path)
   } : document_type_input_output)
let datetime_offsets_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     datetime =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.date_time_of_yojson
             "datetime") _list path)
   } : datetime_offsets_output)
let content_type_parameters_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let content_type_parameters_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
             "value") _list path)
   } : content_type_parameters_input)
let constant_query_string_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hello =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "hello"
          _list path)
   } : constant_query_string_input)
let constant_and_variable_query_string_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     maybe_set =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "maybeSet") _list path);
     baz =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "baz")
          _list path)
   } : constant_and_variable_query_string_input)
let all_query_string_types_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     query_params_map_of_string_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.string_list_map_of_yojson
             "queryParamsMapOfStringList") _list path);
     query_integer_enum_list =
       (option_of_yojson
          (value_for_key
             Shared.Json_deserializers.integer_enum_list_of_yojson
             "queryIntegerEnumList") _list path);
     query_integer_enum =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.integer_enum_of_yojson
             "queryIntegerEnum") _list path);
     query_enum_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.foo_enum_list_of_yojson
             "queryEnumList") _list path);
     query_enum =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.foo_enum_of_yojson
             "queryEnum") _list path);
     query_timestamp_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.timestamp_list_of_yojson
             "queryTimestampList") _list path);
     query_timestamp =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.timestamp_of_yojson
             "queryTimestamp") _list path);
     query_boolean_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.boolean_list_of_yojson
             "queryBooleanList") _list path);
     query_boolean =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
             "queryBoolean") _list path);
     query_double_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.double_list_of_yojson
             "queryDoubleList") _list path);
     query_double =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
             "queryDouble") _list path);
     query_float =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson
             "queryFloat") _list path);
     query_long =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson
             "queryLong") _list path);
     query_integer_set =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.integer_set_of_yojson
             "queryIntegerSet") _list path);
     query_integer_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.integer_list_of_yojson
             "queryIntegerList") _list path);
     query_integer =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
             "queryInteger") _list path);
     query_short =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.short_of_yojson
             "queryShort") _list path);
     query_byte =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.byte_of_yojson
             "queryByte") _list path);
     query_string_set =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.string_set_of_yojson
             "queryStringSet") _list path);
     query_string_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.string_list_of_yojson
             "queryStringList") _list path);
     query_string =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "queryString") _list path)
   } : all_query_string_types_input)
let farewell_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     phrase =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "phrase") _list path)
   } : farewell)
let dialog_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     farewell =
       (option_of_yojson (value_for_key farewell_of_yojson "farewell") _list
          path);
     greeting =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "greeting") _list path);
     language =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "language") _list path)
   } : dialog)
let dialog_list_of_yojson tree path =
  list_of_yojson dialog_of_yojson tree path
let dialog_map_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    dialog_of_yojson tree path
let nested_defaults_mixin_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dialog_map =
       (option_of_yojson (value_for_key dialog_map_of_yojson "dialogMap")
          _list path);
     dialog_list =
       (option_of_yojson (value_for_key dialog_list_of_yojson "dialogList")
          _list path);
     dialog = (value_for_key dialog_of_yojson "dialog" _list path)
   } : nested_defaults_mixin)
let defaults_mixin_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     zero_double =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
             "zeroDouble") _list path);
     zero_float =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson
             "zeroFloat") _list path);
     zero_long =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson
             "zeroLong") _list path);
     zero_integer =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
             "zeroInteger") _list path);
     zero_short =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.short_of_yojson
             "zeroShort") _list path);
     zero_byte =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.byte_of_yojson
             "zeroByte") _list path);
     empty_blob =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.blob_of_yojson
             "emptyBlob") _list path);
     false_boolean =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
             "falseBoolean") _list path);
     empty_string =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "emptyString") _list path);
     default_int_enum =
       (option_of_yojson
          (value_for_key test_int_enum_of_yojson "defaultIntEnum") _list path);
     default_enum =
       (option_of_yojson (value_for_key test_enum_of_yojson "defaultEnum")
          _list path);
     default_map =
       (option_of_yojson
          (value_for_key test_string_map_of_yojson "defaultMap") _list path);
     default_double =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
             "defaultDouble") _list path);
     default_float =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson
             "defaultFloat") _list path);
     default_long =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson
             "defaultLong") _list path);
     default_integer =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
             "defaultInteger") _list path);
     default_short =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.short_of_yojson
             "defaultShort") _list path);
     default_byte =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.byte_of_yojson
             "defaultByte") _list path);
     default_blob =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.blob_of_yojson
             "defaultBlob") _list path);
     default_timestamp =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.timestamp_of_yojson
             "defaultTimestamp") _list path);
     default_null_document =
       (option_of_yojson
          (value_for_key document_of_yojson "defaultNullDocument") _list path);
     default_document_list =
       (option_of_yojson
          (value_for_key document_of_yojson "defaultDocumentList") _list path);
     default_document_boolean =
       (option_of_yojson
          (value_for_key document_of_yojson "defaultDocumentBoolean") _list
          path);
     default_document_string =
       (option_of_yojson
          (value_for_key document_of_yojson "defaultDocumentString") _list
          path);
     default_document_map =
       (option_of_yojson
          (value_for_key document_of_yojson "defaultDocumentMap") _list path);
     default_list =
       (option_of_yojson
          (value_for_key test_string_list_of_yojson "defaultList") _list path);
     default_boolean =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
             "defaultBoolean") _list path);
     default_string =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "defaultString") _list path)
   } : defaults_mixin)