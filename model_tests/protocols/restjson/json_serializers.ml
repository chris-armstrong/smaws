open Smaws_Lib.Json.SerializeHelpers
open Types
let union_with_json_name_to_yojson (x : union_with_json_name) =
  match x with
  | Baz arg ->
      assoc_to_yojson
        [("baz",
           (Some
              (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)))]
  | Bar arg ->
      assoc_to_yojson
        [("bar",
           (Some
              (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)))]
  | Foo arg ->
      assoc_to_yojson
        [("foo",
           (Some
              (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)))]
let union_payload_to_yojson (x : union_payload) =
  match x with
  | Greeting arg ->
      assoc_to_yojson
        [("greeting",
           (Some
              (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)))]
let my_union_to_yojson (x : my_union) =
  match x with
  | RenamedStructureValue arg ->
      assoc_to_yojson
        [("renamedStructureValue",
           (Some
              (Restjson_nested.Json_serializers.greeting_struct_to_yojson arg)))]
  | StructureValue arg ->
      assoc_to_yojson
        [("structureValue",
           (Some (Shared.Json_serializers.greeting_struct_to_yojson arg)))]
  | MapValue arg ->
      assoc_to_yojson
        [("mapValue",
           (Some (Shared.Json_serializers.string_map_to_yojson arg)))]
  | ListValue arg ->
      assoc_to_yojson
        [("listValue",
           (Some (Shared.Json_serializers.string_list_to_yojson arg)))]
  | EnumValue arg ->
      assoc_to_yojson
        [("enumValue",
           (Some (Shared.Json_serializers.foo_enum_to_yojson arg)))]
  | TimestampValue arg ->
      assoc_to_yojson
        [("timestampValue",
           (Some
              (Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson arg)))]
  | BlobValue arg ->
      assoc_to_yojson
        [("blobValue",
           (Some (Smaws_Lib.Smithy_api.Json_serializers.blob_to_yojson arg)))]
  | NumberValue arg ->
      assoc_to_yojson
        [("numberValue",
           (Some
              (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson arg)))]
  | BooleanValue arg ->
      assoc_to_yojson
        [("booleanValue",
           (Some
              (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson arg)))]
  | StringValue arg ->
      assoc_to_yojson
        [("stringValue",
           (Some
              (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)))]
let union_input_output_to_yojson (x : union_input_output) =
  assoc_to_yojson
    [("contents", (option_to_yojson my_union_to_yojson x.contents))]
let top_level_to_yojson = unit_to_yojson
let timestamp_format_headers_i_o_to_yojson (x : timestamp_format_headers_i_o)
  =
  assoc_to_yojson
    [("targetDateTime",
       (option_to_yojson Shared.Json_serializers.date_time_to_yojson
          x.target_date_time));
    ("targetHttpDate",
      (option_to_yojson Shared.Json_serializers.http_date_to_yojson
         x.target_http_date));
    ("targetEpochSeconds",
      (option_to_yojson Shared.Json_serializers.epoch_seconds_to_yojson
         x.target_epoch_seconds));
    ("defaultFormat",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson
         x.default_format));
    ("memberDateTime",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson
         x.member_date_time));
    ("memberHttpDate",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson
         x.member_http_date));
    ("memberEpochSeconds",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson
         x.member_epoch_seconds))]
let test_string_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree
let test_string_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree
let test_no_payload_input_output_to_yojson (x : test_no_payload_input_output)
  =
  assoc_to_yojson
    [("testId",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.test_id))]
let payload_config_to_yojson (x : payload_config) =
  assoc_to_yojson
    [("data",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.data))]
let test_payload_structure_input_output_to_yojson
  (x : test_payload_structure_input_output) =
  assoc_to_yojson
    [("payloadConfig",
       (option_to_yojson payload_config_to_yojson x.payload_config));
    ("testId",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.test_id))]
let test_payload_blob_input_output_to_yojson
  (x : test_payload_blob_input_output) =
  assoc_to_yojson
    [("data",
       (option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.blob_to_yojson
          x.data));
    ("contentType",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
         x.content_type))]
let test_int_enum_to_yojson (x : test_int_enum) =
  match x with | TWO -> `Int 2 | ONE -> `Int 1
let test_enum_to_yojson (x : test_enum) =
  match x with
  | BAZ -> `String "BAZ"
  | BAR -> `String "BAR"
  | FOO -> `String "FOO"
let test_config_to_yojson (x : test_config) =
  assoc_to_yojson
    [("timeout",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.timeout))]
let test_body_structure_input_output_to_yojson
  (x : test_body_structure_input_output) =
  assoc_to_yojson
    [("testConfig", (option_to_yojson test_config_to_yojson x.test_config));
    ("testId",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.test_id))]
let structure_list_member_to_yojson (x : structure_list_member) =
  assoc_to_yojson
    [("b",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.b));
    ("a",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.a))]
let structure_list_to_yojson tree =
  list_to_yojson structure_list_member_to_yojson tree
let string_payload_input_to_yojson (x : string_payload_input) =
  assoc_to_yojson
    [("payload",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.payload))]
let string_enum_to_yojson (x : string_enum) =
  match x with | V -> `String "enumvalue"
let streaming_text_plain_blob_to_yojson = blob_to_yojson
let streaming_traits_with_media_type_input_output_to_yojson
  (x : streaming_traits_with_media_type_input_output) =
  assoc_to_yojson
    [("blob", (option_to_yojson streaming_text_plain_blob_to_yojson x.blob));
    ("foo",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.foo))]
let finite_streaming_blob_to_yojson = blob_to_yojson
let streaming_traits_require_length_input_to_yojson
  (x : streaming_traits_require_length_input) =
  assoc_to_yojson
    [("blob", (option_to_yojson finite_streaming_blob_to_yojson x.blob));
    ("foo",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.foo))]
let streaming_blob_to_yojson = blob_to_yojson
let streaming_traits_input_output_to_yojson
  (x : streaming_traits_input_output) =
  assoc_to_yojson
    [("blob", (option_to_yojson streaming_blob_to_yojson x.blob));
    ("foo",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.foo))]
let sparse_struct_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    Shared.Json_serializers.greeting_struct_to_yojson tree
let sparse_set_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    Shared.Json_serializers.string_set_to_yojson tree
let sparse_number_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson tree
let sparse_boolean_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson tree
let sparse_json_maps_input_output_to_yojson
  (x : sparse_json_maps_input_output) =
  assoc_to_yojson
    [("sparseSetMap",
       (option_to_yojson sparse_set_map_to_yojson x.sparse_set_map));
    ("sparseStringMap",
      (option_to_yojson Shared.Json_serializers.sparse_string_map_to_yojson
         x.sparse_string_map));
    ("sparseBooleanMap",
      (option_to_yojson sparse_boolean_map_to_yojson x.sparse_boolean_map));
    ("sparseNumberMap",
      (option_to_yojson sparse_number_map_to_yojson x.sparse_number_map));
    ("sparseStructMap",
      (option_to_yojson sparse_struct_map_to_yojson x.sparse_struct_map))]
let sparse_json_lists_input_output_to_yojson
  (x : sparse_json_lists_input_output) =
  assoc_to_yojson
    [("sparseShortList",
       (option_to_yojson Shared.Json_serializers.sparse_short_list_to_yojson
          x.sparse_short_list));
    ("sparseStringList",
      (option_to_yojson Shared.Json_serializers.sparse_string_list_to_yojson
         x.sparse_string_list))]
let simple_union_to_yojson (x : simple_union) =
  match x with
  | String arg ->
      assoc_to_yojson
        [("string",
           (Some
              (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)))]
  | Int arg ->
      assoc_to_yojson
        [("int",
           (Some
              (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson arg)))]
let simple_scalar_properties_input_output_to_yojson
  (x : simple_scalar_properties_input_output) =
  assoc_to_yojson
    [("doubleValue",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.double_value));
    ("floatValue",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.float_value));
    ("longValue",
      (option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
         x.long_value));
    ("integerValue",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
         x.integer_value));
    ("shortValue",
      (option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.short_to_yojson
         x.short_value));
    ("byteValue",
      (option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.byte_to_yojson
         x.byte_value));
    ("falseBooleanValue",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
         x.false_boolean_value));
    ("trueBooleanValue",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
         x.true_boolean_value));
    ("stringValue",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
         x.string_value));
    ("foo",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.foo))]
let simple_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree
let simple_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree
let response_code_required_output_to_yojson
  (x : response_code_required_output) =
  assoc_to_yojson
    [("responseCode",
       (Some
          (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
             x.response_code)))]
let response_code_http_fallback_input_output_to_yojson = unit_to_yojson
let rec recursive_shapes_input_output_nested1_to_yojson
  (x : recursive_shapes_input_output_nested1) =
  assoc_to_yojson
    [("nested",
       (option_to_yojson recursive_shapes_input_output_nested2_to_yojson
          x.nested));
    ("foo",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.foo))]
and recursive_shapes_input_output_nested2_to_yojson
  (x : recursive_shapes_input_output_nested2) =
  assoc_to_yojson
    [("recursiveMember",
       (option_to_yojson recursive_shapes_input_output_nested1_to_yojson
          x.recursive_member));
    ("bar",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.bar))]
let recursive_shapes_input_output_to_yojson
  (x : recursive_shapes_input_output) =
  assoc_to_yojson
    [("nested",
       (option_to_yojson recursive_shapes_input_output_nested1_to_yojson
          x.nested))]
let query_precedence_input_to_yojson (x : query_precedence_input) =
  assoc_to_yojson
    [("baz",
       (option_to_yojson Shared.Json_serializers.string_map_to_yojson x.baz));
    ("foo",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.foo))]
let query_params_as_string_list_map_input_to_yojson
  (x : query_params_as_string_list_map_input) =
  assoc_to_yojson
    [("foo",
       (option_to_yojson Shared.Json_serializers.string_list_map_to_yojson
          x.foo));
    ("qux",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.qux))]
let query_idempotency_token_auto_fill_input_to_yojson
  (x : query_idempotency_token_auto_fill_input) =
  assoc_to_yojson
    [("token",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.token))]
let put_with_content_encoding_input_to_yojson
  (x : put_with_content_encoding_input) =
  assoc_to_yojson
    [("data",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.data));
    ("encoding",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.encoding))]
let post_union_with_json_name_output_to_yojson
  (x : post_union_with_json_name_output) =
  assoc_to_yojson
    [("value", (Some (union_with_json_name_to_yojson x.value)))]
let post_union_with_json_name_input_to_yojson
  (x : post_union_with_json_name_input) =
  assoc_to_yojson
    [("value", (option_to_yojson union_with_json_name_to_yojson x.value))]
let player_action_to_yojson (x : player_action) =
  match x with
  | Quit arg ->
      assoc_to_yojson
        [("quit",
           (Some (Smaws_Lib.Smithy_api.Json_serializers.unit__to_yojson arg)))]
let post_player_action_output_to_yojson (x : post_player_action_output) =
  assoc_to_yojson [("action", (Some (player_action_to_yojson x.action)))]
let post_player_action_input_to_yojson (x : post_player_action_input) =
  assoc_to_yojson
    [("action", (option_to_yojson player_action_to_yojson x.action))]
let operation_with_nested_structure_output_to_yojson = unit_to_yojson
let operation_with_nested_structure_input_to_yojson
  (x : operation_with_nested_structure_input) =
  assoc_to_yojson [("topLevel", (Some (top_level_to_yojson x.top_level)))]
let operation_with_defaults_output_to_yojson = unit_to_yojson
let defaults_to_yojson = unit_to_yojson
let client_optional_defaults_to_yojson (x : client_optional_defaults) =
  assoc_to_yojson
    [("member",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.member))]
let operation_with_defaults_input_to_yojson
  (x : operation_with_defaults_input) =
  assoc_to_yojson
    [("otherTopLevelDefault",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.other_top_level_default));
    ("topLevelDefault",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
         x.top_level_default));
    ("clientOptionalDefaults",
      (option_to_yojson client_optional_defaults_to_yojson
         x.client_optional_defaults));
    ("defaults", (option_to_yojson defaults_to_yojson x.defaults))]
let omits_serializing_empty_lists_input_to_yojson
  (x : omits_serializing_empty_lists_input) =
  assoc_to_yojson
    [("queryIntegerEnumList",
       (option_to_yojson Shared.Json_serializers.integer_enum_list_to_yojson
          x.query_integer_enum_list));
    ("queryEnumList",
      (option_to_yojson Shared.Json_serializers.foo_enum_list_to_yojson
         x.query_enum_list));
    ("queryTimestampList",
      (option_to_yojson Shared.Json_serializers.timestamp_list_to_yojson
         x.query_timestamp_list));
    ("queryBooleanList",
      (option_to_yojson Shared.Json_serializers.boolean_list_to_yojson
         x.query_boolean_list));
    ("queryDoubleList",
      (option_to_yojson Shared.Json_serializers.double_list_to_yojson
         x.query_double_list));
    ("queryIntegerList",
      (option_to_yojson Shared.Json_serializers.integer_list_to_yojson
         x.query_integer_list));
    ("queryStringList",
      (option_to_yojson Shared.Json_serializers.string_list_to_yojson
         x.query_string_list))]
let omits_null_serializes_empty_string_input_to_yojson
  (x : omits_null_serializes_empty_string_input) =
  assoc_to_yojson
    [("emptyString",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.empty_string));
    ("nullValue",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.null_value))]
let null_and_empty_headers_i_o_to_yojson (x : null_and_empty_headers_i_o) =
  assoc_to_yojson
    [("c",
       (option_to_yojson Shared.Json_serializers.string_list_to_yojson x.c));
    ("b",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.b));
    ("a",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.a))]
let no_input_and_output_output_to_yojson = unit_to_yojson
let json_value_to_yojson = string_to_yojson
let media_type_header_output_to_yojson (x : media_type_header_output) =
  assoc_to_yojson [("json", (option_to_yojson json_value_to_yojson x.json))]
let media_type_header_input_to_yojson (x : media_type_header_input) =
  assoc_to_yojson [("json", (option_to_yojson json_value_to_yojson x.json))]
let malformed_union_input_to_yojson (x : malformed_union_input) =
  assoc_to_yojson
    [("union", (option_to_yojson simple_union_to_yojson x.union))]
let malformed_timestamp_query_http_date_input_to_yojson
  (x : malformed_timestamp_query_http_date_input) =
  assoc_to_yojson
    [("timestamp",
       (Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson
             x.timestamp)))]
let malformed_timestamp_query_epoch_input_to_yojson
  (x : malformed_timestamp_query_epoch_input) =
  assoc_to_yojson
    [("timestamp",
       (Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson
             x.timestamp)))]
let malformed_timestamp_query_default_input_to_yojson
  (x : malformed_timestamp_query_default_input) =
  assoc_to_yojson
    [("timestamp",
       (Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson
             x.timestamp)))]
let malformed_timestamp_path_http_date_input_to_yojson
  (x : malformed_timestamp_path_http_date_input) =
  assoc_to_yojson
    [("timestamp",
       (Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson
             x.timestamp)))]
let malformed_timestamp_path_epoch_input_to_yojson
  (x : malformed_timestamp_path_epoch_input) =
  assoc_to_yojson
    [("timestamp",
       (Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson
             x.timestamp)))]
let malformed_timestamp_path_default_input_to_yojson
  (x : malformed_timestamp_path_default_input) =
  assoc_to_yojson
    [("timestamp",
       (Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson
             x.timestamp)))]
let malformed_timestamp_header_epoch_input_to_yojson
  (x : malformed_timestamp_header_epoch_input) =
  assoc_to_yojson
    [("timestamp",
       (Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson
             x.timestamp)))]
let malformed_timestamp_header_default_input_to_yojson
  (x : malformed_timestamp_header_default_input) =
  assoc_to_yojson
    [("timestamp",
       (Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson
             x.timestamp)))]
let malformed_timestamp_header_date_time_input_to_yojson
  (x : malformed_timestamp_header_date_time_input) =
  assoc_to_yojson
    [("timestamp",
       (Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson
             x.timestamp)))]
let malformed_timestamp_body_http_date_input_to_yojson
  (x : malformed_timestamp_body_http_date_input) =
  assoc_to_yojson
    [("timestamp",
       (Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson
             x.timestamp)))]
let malformed_timestamp_body_default_input_to_yojson
  (x : malformed_timestamp_body_default_input) =
  assoc_to_yojson
    [("timestamp",
       (Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson
             x.timestamp)))]
let malformed_timestamp_body_date_time_input_to_yojson
  (x : malformed_timestamp_body_date_time_input) =
  assoc_to_yojson
    [("timestamp",
       (Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson
             x.timestamp)))]
let json_header_string_to_yojson = string_to_yojson
let malformed_string_input_to_yojson (x : malformed_string_input) =
  assoc_to_yojson
    [("blob", (option_to_yojson json_header_string_to_yojson x.blob))]
let malformed_short_input_to_yojson (x : malformed_short_input) =
  assoc_to_yojson
    [("shortInHeader",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.short_to_yojson
          x.short_in_header));
    ("shortInQuery",
      (option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.short_to_yojson
         x.short_in_query));
    ("shortInPath",
      (Some
         (Smaws_Lib.Smithy_api.Json_serializers.short_to_yojson
            x.short_in_path)));
    ("shortInBody",
      (option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.short_to_yojson
         x.short_in_body))]
let malformed_request_body_input_to_yojson (x : malformed_request_body_input)
  =
  assoc_to_yojson
    [("float",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.float_));
    ("int",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.int_))]
let malformed_map_input_to_yojson (x : malformed_map_input) =
  assoc_to_yojson
    [("bodyMap", (option_to_yojson simple_map_to_yojson x.body_map))]
let malformed_long_input_to_yojson (x : malformed_long_input) =
  assoc_to_yojson
    [("longInHeader",
       (option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
          x.long_in_header));
    ("longInQuery",
      (option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
         x.long_in_query));
    ("longInPath",
      (Some
         (Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.long_in_path)));
    ("longInBody",
      (option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
         x.long_in_body))]
let malformed_list_input_to_yojson (x : malformed_list_input) =
  assoc_to_yojson
    [("bodyList", (option_to_yojson simple_list_to_yojson x.body_list))]
let malformed_integer_input_to_yojson (x : malformed_integer_input) =
  assoc_to_yojson
    [("integerInHeader",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.integer_in_header));
    ("integerInQuery",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
         x.integer_in_query));
    ("integerInPath",
      (Some
         (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
            x.integer_in_path)));
    ("integerInBody",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
         x.integer_in_body))]
let malformed_float_input_to_yojson (x : malformed_float_input) =
  assoc_to_yojson
    [("floatInHeader",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson
          x.float_in_header));
    ("floatInQuery",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson
         x.float_in_query));
    ("floatInPath",
      (Some
         (Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson
            x.float_in_path)));
    ("floatInBody",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson
         x.float_in_body))]
let malformed_double_input_to_yojson (x : malformed_double_input) =
  assoc_to_yojson
    [("doubleInHeader",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.double_in_header));
    ("doubleInQuery",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
         x.double_in_query));
    ("doubleInPath",
      (Some
         (Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
            x.double_in_path)));
    ("doubleInBody",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
         x.double_in_body))]
let malformed_content_type_with_payload_input_to_yojson
  (x : malformed_content_type_with_payload_input) =
  assoc_to_yojson
    [("payload",
       (option_to_yojson Shared.Json_serializers.jpeg_blob_to_yojson
          x.payload))]
let malformed_content_type_without_body_empty_input_input_to_yojson
  (x : malformed_content_type_without_body_empty_input_input) =
  assoc_to_yojson
    [("header",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.header))]
let malformed_content_type_with_generic_string_input_to_yojson
  (x : malformed_content_type_with_generic_string_input) =
  assoc_to_yojson
    [("payload",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.payload))]
let malformed_byte_input_to_yojson (x : malformed_byte_input) =
  assoc_to_yojson
    [("byteInHeader",
       (option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.byte_to_yojson
          x.byte_in_header));
    ("byteInQuery",
      (option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.byte_to_yojson
         x.byte_in_query));
    ("byteInPath",
      (Some
         (Smaws_Lib.Smithy_api.Json_serializers.byte_to_yojson x.byte_in_path)));
    ("byteInBody",
      (option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.byte_to_yojson
         x.byte_in_body))]
let malformed_boolean_input_to_yojson (x : malformed_boolean_input) =
  assoc_to_yojson
    [("booleanInHeader",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.boolean_in_header));
    ("booleanInQuery",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
         x.boolean_in_query));
    ("booleanInPath",
      (Some
         (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
            x.boolean_in_path)));
    ("booleanInBody",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
         x.boolean_in_body))]
let malformed_blob_input_to_yojson (x : malformed_blob_input) =
  assoc_to_yojson
    [("blob",
       (option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.blob_to_yojson
          x.blob))]
let malformed_accept_with_payload_output_to_yojson
  (x : malformed_accept_with_payload_output) =
  assoc_to_yojson
    [("payload",
       (option_to_yojson Shared.Json_serializers.jpeg_blob_to_yojson
          x.payload))]
let malformed_accept_with_generic_string_output_to_yojson
  (x : malformed_accept_with_generic_string_output) =
  assoc_to_yojson
    [("payload",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.payload))]
let json_timestamps_input_output_to_yojson (x : json_timestamps_input_output)
  =
  assoc_to_yojson
    [("httpDateOnTarget",
       (option_to_yojson Shared.Json_serializers.http_date_to_yojson
          x.http_date_on_target));
    ("httpDate",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson
         x.http_date));
    ("epochSecondsOnTarget",
      (option_to_yojson Shared.Json_serializers.epoch_seconds_to_yojson
         x.epoch_seconds_on_target));
    ("epochSeconds",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson
         x.epoch_seconds));
    ("dateTimeOnTarget",
      (option_to_yojson Shared.Json_serializers.date_time_to_yojson
         x.date_time_on_target));
    ("dateTime",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson
         x.date_time));
    ("normal",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson x.normal))]
let dense_struct_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    Shared.Json_serializers.greeting_struct_to_yojson tree
let dense_number_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson tree
let dense_boolean_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson tree
let dense_string_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree
let dense_set_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    Shared.Json_serializers.string_set_to_yojson tree
let json_maps_input_output_to_yojson (x : json_maps_input_output) =
  assoc_to_yojson
    [("denseSetMap",
       (option_to_yojson dense_set_map_to_yojson x.dense_set_map));
    ("denseStringMap",
      (option_to_yojson dense_string_map_to_yojson x.dense_string_map));
    ("denseBooleanMap",
      (option_to_yojson dense_boolean_map_to_yojson x.dense_boolean_map));
    ("denseNumberMap",
      (option_to_yojson dense_number_map_to_yojson x.dense_number_map));
    ("denseStructMap",
      (option_to_yojson dense_struct_map_to_yojson x.dense_struct_map))]
let json_lists_input_output_to_yojson (x : json_lists_input_output) =
  assoc_to_yojson
    [("structureList",
       (option_to_yojson structure_list_to_yojson x.structure_list));
    ("nestedStringList",
      (option_to_yojson Shared.Json_serializers.nested_string_list_to_yojson
         x.nested_string_list));
    ("intEnumList",
      (option_to_yojson Shared.Json_serializers.integer_enum_list_to_yojson
         x.int_enum_list));
    ("enumList",
      (option_to_yojson Shared.Json_serializers.foo_enum_list_to_yojson
         x.enum_list));
    ("timestampList",
      (option_to_yojson Shared.Json_serializers.timestamp_list_to_yojson
         x.timestamp_list));
    ("booleanList",
      (option_to_yojson Shared.Json_serializers.boolean_list_to_yojson
         x.boolean_list));
    ("integerList",
      (option_to_yojson Shared.Json_serializers.integer_list_to_yojson
         x.integer_list));
    ("stringSet",
      (option_to_yojson Shared.Json_serializers.string_set_to_yojson
         x.string_set));
    ("stringList",
      (option_to_yojson Shared.Json_serializers.string_list_to_yojson
         x.string_list))]
let json_int_enums_input_output_to_yojson (x : json_int_enums_input_output) =
  assoc_to_yojson
    [("integerEnumMap",
       (option_to_yojson Shared.Json_serializers.integer_enum_map_to_yojson
          x.integer_enum_map));
    ("integerEnumSet",
      (option_to_yojson Shared.Json_serializers.integer_enum_set_to_yojson
         x.integer_enum_set));
    ("integerEnumList",
      (option_to_yojson Shared.Json_serializers.integer_enum_list_to_yojson
         x.integer_enum_list));
    ("integerEnum3",
      (option_to_yojson Shared.Json_serializers.integer_enum_to_yojson
         x.integer_enum3));
    ("integerEnum2",
      (option_to_yojson Shared.Json_serializers.integer_enum_to_yojson
         x.integer_enum2));
    ("integerEnum1",
      (option_to_yojson Shared.Json_serializers.integer_enum_to_yojson
         x.integer_enum1))]
let json_enums_input_output_to_yojson (x : json_enums_input_output) =
  assoc_to_yojson
    [("fooEnumMap",
       (option_to_yojson Shared.Json_serializers.foo_enum_map_to_yojson
          x.foo_enum_map));
    ("fooEnumSet",
      (option_to_yojson Shared.Json_serializers.foo_enum_set_to_yojson
         x.foo_enum_set));
    ("fooEnumList",
      (option_to_yojson Shared.Json_serializers.foo_enum_list_to_yojson
         x.foo_enum_list));
    ("fooEnum3",
      (option_to_yojson Shared.Json_serializers.foo_enum_to_yojson
         x.foo_enum3));
    ("fooEnum2",
      (option_to_yojson Shared.Json_serializers.foo_enum_to_yojson
         x.foo_enum2));
    ("fooEnum1",
      (option_to_yojson Shared.Json_serializers.foo_enum_to_yojson
         x.foo_enum1))]
let json_blobs_input_output_to_yojson (x : json_blobs_input_output) =
  assoc_to_yojson
    [("data",
       (option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.blob_to_yojson
          x.data))]
let input_and_output_with_headers_i_o_to_yojson
  (x : input_and_output_with_headers_i_o) =
  assoc_to_yojson
    [("headerIntegerEnumList",
       (option_to_yojson Shared.Json_serializers.integer_enum_list_to_yojson
          x.header_integer_enum_list));
    ("headerIntegerEnum",
      (option_to_yojson Shared.Json_serializers.integer_enum_to_yojson
         x.header_integer_enum));
    ("headerEnumList",
      (option_to_yojson Shared.Json_serializers.foo_enum_list_to_yojson
         x.header_enum_list));
    ("headerEnum",
      (option_to_yojson Shared.Json_serializers.foo_enum_to_yojson
         x.header_enum));
    ("headerTimestampList",
      (option_to_yojson Shared.Json_serializers.timestamp_list_to_yojson
         x.header_timestamp_list));
    ("headerBooleanList",
      (option_to_yojson Shared.Json_serializers.boolean_list_to_yojson
         x.header_boolean_list));
    ("headerIntegerList",
      (option_to_yojson Shared.Json_serializers.integer_list_to_yojson
         x.header_integer_list));
    ("headerStringSet",
      (option_to_yojson Shared.Json_serializers.string_set_to_yojson
         x.header_string_set));
    ("headerStringList",
      (option_to_yojson Shared.Json_serializers.string_list_to_yojson
         x.header_string_list));
    ("headerFalseBool",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
         x.header_false_bool));
    ("headerTrueBool",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
         x.header_true_bool));
    ("headerDouble",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
         x.header_double));
    ("headerFloat",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson
         x.header_float));
    ("headerLong",
      (option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
         x.header_long));
    ("headerInteger",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
         x.header_integer));
    ("headerShort",
      (option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.short_to_yojson
         x.header_short));
    ("headerByte",
      (option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.byte_to_yojson
         x.header_byte));
    ("headerString",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
         x.header_string))]
let ignore_query_params_in_response_output_to_yojson
  (x : ignore_query_params_in_response_output) =
  assoc_to_yojson
    [("baz",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.baz))]
let http_response_code_output_to_yojson (x : http_response_code_output) =
  assoc_to_yojson
    [("Status",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.status))]
let http_request_with_regex_literal_input_to_yojson
  (x : http_request_with_regex_literal_input) =
  assoc_to_yojson
    [("str",
       (Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.str)))]
let http_request_with_labels_and_timestamp_format_input_to_yojson
  (x : http_request_with_labels_and_timestamp_format_input) =
  assoc_to_yojson
    [("targetDateTime",
       (Some (Shared.Json_serializers.date_time_to_yojson x.target_date_time)));
    ("targetHttpDate",
      (Some (Shared.Json_serializers.http_date_to_yojson x.target_http_date)));
    ("targetEpochSeconds",
      (Some
         (Shared.Json_serializers.epoch_seconds_to_yojson
            x.target_epoch_seconds)));
    ("defaultFormat",
      (Some
         (Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson
            x.default_format)));
    ("memberDateTime",
      (Some
         (Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson
            x.member_date_time)));
    ("memberHttpDate",
      (Some
         (Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson
            x.member_http_date)));
    ("memberEpochSeconds",
      (Some
         (Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson
            x.member_epoch_seconds)))]
let http_request_with_labels_input_to_yojson
  (x : http_request_with_labels_input) =
  assoc_to_yojson
    [("timestamp",
       (Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson
             x.timestamp)));
    ("boolean",
      (Some
         (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.boolean_)));
    ("double",
      (Some (Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.double)));
    ("float",
      (Some (Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.float_)));
    ("long",
      (Some (Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.long)));
    ("integer",
      (Some
         (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.integer)));
    ("short",
      (Some (Smaws_Lib.Smithy_api.Json_serializers.short_to_yojson x.short)));
    ("string",
      (Some
         (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.string_)))]
let http_request_with_greedy_label_in_path_input_to_yojson
  (x : http_request_with_greedy_label_in_path_input) =
  assoc_to_yojson
    [("baz",
       (Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.baz)));
    ("foo",
      (Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.foo)))]
let http_request_with_float_labels_input_to_yojson
  (x : http_request_with_float_labels_input) =
  assoc_to_yojson
    [("double",
       (Some
          (Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.double)));
    ("float",
      (Some (Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.float_)))]
let http_prefix_headers_in_response_output_to_yojson
  (x : http_prefix_headers_in_response_output) =
  assoc_to_yojson
    [("prefixHeaders",
       (option_to_yojson Shared.Json_serializers.string_map_to_yojson
          x.prefix_headers))]
let http_prefix_headers_in_response_input_to_yojson = unit_to_yojson
let http_prefix_headers_output_to_yojson (x : http_prefix_headers_output) =
  assoc_to_yojson
    [("fooMap",
       (option_to_yojson Shared.Json_serializers.string_map_to_yojson
          x.foo_map));
    ("foo",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.foo))]
let http_prefix_headers_input_to_yojson (x : http_prefix_headers_input) =
  assoc_to_yojson
    [("fooMap",
       (option_to_yojson Shared.Json_serializers.string_map_to_yojson
          x.foo_map));
    ("foo",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.foo))]
let http_payload_with_union_input_output_to_yojson
  (x : http_payload_with_union_input_output) =
  assoc_to_yojson
    [("nested", (option_to_yojson union_payload_to_yojson x.nested))]
let nested_payload_to_yojson (x : nested_payload) =
  assoc_to_yojson
    [("name",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name));
    ("greeting",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.greeting))]
let http_payload_with_structure_input_output_to_yojson
  (x : http_payload_with_structure_input_output) =
  assoc_to_yojson
    [("nested", (option_to_yojson nested_payload_to_yojson x.nested))]
let http_payload_traits_with_media_type_input_output_to_yojson
  (x : http_payload_traits_with_media_type_input_output) =
  assoc_to_yojson
    [("blob",
       (option_to_yojson Shared.Json_serializers.text_plain_blob_to_yojson
          x.blob));
    ("foo",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.foo))]
let http_payload_traits_input_output_to_yojson
  (x : http_payload_traits_input_output) =
  assoc_to_yojson
    [("blob",
       (option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.blob_to_yojson
          x.blob));
    ("foo",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.foo))]
let enum_payload_input_to_yojson (x : enum_payload_input) =
  assoc_to_yojson
    [("payload", (option_to_yojson string_enum_to_yojson x.payload))]
let http_empty_prefix_headers_output_to_yojson
  (x : http_empty_prefix_headers_output) =
  assoc_to_yojson
    [("specificHeader",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.specific_header));
    ("prefixHeaders",
      (option_to_yojson Shared.Json_serializers.string_map_to_yojson
         x.prefix_headers))]
let http_empty_prefix_headers_input_to_yojson
  (x : http_empty_prefix_headers_input) =
  assoc_to_yojson
    [("specificHeader",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.specific_header));
    ("prefixHeaders",
      (option_to_yojson Shared.Json_serializers.string_map_to_yojson
         x.prefix_headers))]
let http_checksum_required_input_output_to_yojson
  (x : http_checksum_required_input_output) =
  assoc_to_yojson
    [("foo",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.foo))]
let invalid_greeting_to_yojson (x : invalid_greeting) =
  assoc_to_yojson
    [("Message",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message))]
let foo_error_to_yojson = unit_to_yojson
let complex_nested_error_data_to_yojson (x : complex_nested_error_data) =
  assoc_to_yojson
    [("Foo",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.foo))]
let complex_error_to_yojson (x : complex_error) =
  assoc_to_yojson
    [("Nested",
       (option_to_yojson complex_nested_error_data_to_yojson x.nested));
    ("TopLevel",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.top_level));
    ("Header",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.header))]
let greeting_with_errors_output_to_yojson (x : greeting_with_errors_output) =
  assoc_to_yojson
    [("greeting",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.greeting))]
let fractional_seconds_output_to_yojson (x : fractional_seconds_output) =
  assoc_to_yojson
    [("datetime",
       (option_to_yojson Shared.Json_serializers.date_time_to_yojson
          x.datetime))]
let host_label_input_to_yojson (x : host_label_input) =
  assoc_to_yojson
    [("label",
       (Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.label)))]
let empty_input_and_empty_output_output_to_yojson = unit_to_yojson
let empty_input_and_empty_output_input_to_yojson = unit_to_yojson
let document_to_yojson = json_to_yojson
let document_type_as_payload_input_output_to_yojson
  (x : document_type_as_payload_input_output) =
  assoc_to_yojson
    [("documentValue",
       (option_to_yojson document_to_yojson x.document_value))]
let document_valued_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    document_to_yojson tree
let document_type_as_map_value_input_output_to_yojson
  (x : document_type_as_map_value_input_output) =
  assoc_to_yojson
    [("docValuedMap",
       (option_to_yojson document_valued_map_to_yojson x.doc_valued_map))]
let document_type_input_output_to_yojson (x : document_type_input_output) =
  assoc_to_yojson
    [("documentValue",
       (option_to_yojson document_to_yojson x.document_value));
    ("stringValue",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
         x.string_value))]
let datetime_offsets_output_to_yojson (x : datetime_offsets_output) =
  assoc_to_yojson
    [("datetime",
       (option_to_yojson Shared.Json_serializers.date_time_to_yojson
          x.datetime))]
let content_type_parameters_output_to_yojson = unit_to_yojson
let content_type_parameters_input_to_yojson
  (x : content_type_parameters_input) =
  assoc_to_yojson
    [("value",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.value))]
let constant_query_string_input_to_yojson (x : constant_query_string_input) =
  assoc_to_yojson
    [("hello",
       (Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.hello)))]
let constant_and_variable_query_string_input_to_yojson
  (x : constant_and_variable_query_string_input) =
  assoc_to_yojson
    [("maybeSet",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.maybe_set));
    ("baz",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.baz))]
let all_query_string_types_input_to_yojson (x : all_query_string_types_input)
  =
  assoc_to_yojson
    [("queryParamsMapOfStringList",
       (option_to_yojson Shared.Json_serializers.string_list_map_to_yojson
          x.query_params_map_of_string_list));
    ("queryIntegerEnumList",
      (option_to_yojson Shared.Json_serializers.integer_enum_list_to_yojson
         x.query_integer_enum_list));
    ("queryIntegerEnum",
      (option_to_yojson Shared.Json_serializers.integer_enum_to_yojson
         x.query_integer_enum));
    ("queryEnumList",
      (option_to_yojson Shared.Json_serializers.foo_enum_list_to_yojson
         x.query_enum_list));
    ("queryEnum",
      (option_to_yojson Shared.Json_serializers.foo_enum_to_yojson
         x.query_enum));
    ("queryTimestampList",
      (option_to_yojson Shared.Json_serializers.timestamp_list_to_yojson
         x.query_timestamp_list));
    ("queryTimestamp",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson
         x.query_timestamp));
    ("queryBooleanList",
      (option_to_yojson Shared.Json_serializers.boolean_list_to_yojson
         x.query_boolean_list));
    ("queryBoolean",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
         x.query_boolean));
    ("queryDoubleList",
      (option_to_yojson Shared.Json_serializers.double_list_to_yojson
         x.query_double_list));
    ("queryDouble",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
         x.query_double));
    ("queryFloat",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.query_float));
    ("queryLong",
      (option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
         x.query_long));
    ("queryIntegerSet",
      (option_to_yojson Shared.Json_serializers.integer_set_to_yojson
         x.query_integer_set));
    ("queryIntegerList",
      (option_to_yojson Shared.Json_serializers.integer_list_to_yojson
         x.query_integer_list));
    ("queryInteger",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
         x.query_integer));
    ("queryShort",
      (option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.short_to_yojson
         x.query_short));
    ("queryByte",
      (option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.byte_to_yojson
         x.query_byte));
    ("queryStringSet",
      (option_to_yojson Shared.Json_serializers.string_set_to_yojson
         x.query_string_set));
    ("queryStringList",
      (option_to_yojson Shared.Json_serializers.string_list_to_yojson
         x.query_string_list));
    ("queryString",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
         x.query_string))]
let farewell_to_yojson (x : farewell) =
  assoc_to_yojson
    [("phrase",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.phrase))]
let dialog_to_yojson (x : dialog) =
  assoc_to_yojson
    [("farewell", (option_to_yojson farewell_to_yojson x.farewell));
    ("greeting",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.greeting));
    ("language",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.language))]
let dialog_list_to_yojson tree = list_to_yojson dialog_to_yojson tree
let dialog_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    dialog_to_yojson tree
let nested_defaults_mixin_to_yojson (x : nested_defaults_mixin) =
  assoc_to_yojson
    [("dialogMap", (option_to_yojson dialog_map_to_yojson x.dialog_map));
    ("dialogList", (option_to_yojson dialog_list_to_yojson x.dialog_list));
    ("dialog", (Some (dialog_to_yojson x.dialog)))]
let defaults_mixin_to_yojson (x : defaults_mixin) =
  assoc_to_yojson
    [("zeroDouble",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.zero_double));
    ("zeroFloat",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.zero_float));
    ("zeroLong",
      (option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
         x.zero_long));
    ("zeroInteger",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
         x.zero_integer));
    ("zeroShort",
      (option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.short_to_yojson
         x.zero_short));
    ("zeroByte",
      (option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.byte_to_yojson
         x.zero_byte));
    ("emptyBlob",
      (option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.blob_to_yojson
         x.empty_blob));
    ("falseBoolean",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
         x.false_boolean));
    ("emptyString",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
         x.empty_string));
    ("defaultIntEnum",
      (option_to_yojson test_int_enum_to_yojson x.default_int_enum));
    ("defaultEnum", (option_to_yojson test_enum_to_yojson x.default_enum));
    ("defaultMap",
      (option_to_yojson test_string_map_to_yojson x.default_map));
    ("defaultDouble",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
         x.default_double));
    ("defaultFloat",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson
         x.default_float));
    ("defaultLong",
      (option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
         x.default_long));
    ("defaultInteger",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
         x.default_integer));
    ("defaultShort",
      (option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.short_to_yojson
         x.default_short));
    ("defaultByte",
      (option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.byte_to_yojson
         x.default_byte));
    ("defaultBlob",
      (option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.blob_to_yojson
         x.default_blob));
    ("defaultTimestamp",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson
         x.default_timestamp));
    ("defaultNullDocument",
      (option_to_yojson document_to_yojson x.default_null_document));
    ("defaultDocumentList",
      (option_to_yojson document_to_yojson x.default_document_list));
    ("defaultDocumentBoolean",
      (option_to_yojson document_to_yojson x.default_document_boolean));
    ("defaultDocumentString",
      (option_to_yojson document_to_yojson x.default_document_string));
    ("defaultDocumentMap",
      (option_to_yojson document_to_yojson x.default_document_map));
    ("defaultList",
      (option_to_yojson test_string_list_to_yojson x.default_list));
    ("defaultBoolean",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
         x.default_boolean));
    ("defaultString",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
         x.default_string))]