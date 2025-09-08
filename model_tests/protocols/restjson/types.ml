type nonrec union_with_json_name =
  | Baz of Smaws_Lib.Smithy_api.Types.string_ [@ocaml.doc ""]
  | Bar of Smaws_Lib.Smithy_api.Types.string_ [@ocaml.doc ""]
  | Foo of Smaws_Lib.Smithy_api.Types.string_ [@ocaml.doc ""][@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec union_payload =
  | Greeting of Smaws_Lib.Smithy_api.Types.string_ [@ocaml.doc ""][@@ocaml.doc
                                                                    ""]
[@@deriving show][@@deriving eq]
type nonrec my_union =
  | RenamedStructureValue of Restjson_nested.Types.greeting_struct
  [@ocaml.doc ""]
  | StructureValue of Shared.Types.greeting_struct [@ocaml.doc ""]
  | MapValue of Shared.Types.string_map [@ocaml.doc ""]
  | ListValue of Shared.Types.string_list [@ocaml.doc ""]
  | EnumValue of Shared.Types.foo_enum [@ocaml.doc ""]
  | TimestampValue of Smaws_Lib.Smithy_api.Types.timestamp [@ocaml.doc ""]
  | BlobValue of Smaws_Lib.Smithy_api.Types.blob [@ocaml.doc ""]
  | NumberValue of Smaws_Lib.Smithy_api.Types.integer [@ocaml.doc ""]
  | BooleanValue of Smaws_Lib.Smithy_api.Types.boolean_ [@ocaml.doc ""]
  | StringValue of Smaws_Lib.Smithy_api.Types.string_ [@ocaml.doc ""]
[@@ocaml.doc "A union with a representative set of types for members."]
[@@deriving show][@@deriving eq]
type nonrec union_input_output = {
  contents: my_union option [@ocaml.doc ""]}[@@ocaml.doc
                                              "A shared structure that contains a single union member."]
[@@deriving show][@@deriving eq]
type nonrec top_level = unit[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec timestamp_format_headers_i_o =
  {
  target_date_time: Shared.Types.date_time option [@ocaml.doc ""];
  target_http_date: Shared.Types.http_date option [@ocaml.doc ""];
  target_epoch_seconds: Shared.Types.epoch_seconds option [@ocaml.doc ""];
  default_format: Smaws_Lib.Smithy_api.Types.timestamp option [@ocaml.doc ""];
  member_date_time: Smaws_Lib.Smithy_api.Types.timestamp option
    [@ocaml.doc ""];
  member_http_date: Smaws_Lib.Smithy_api.Types.timestamp option
    [@ocaml.doc ""];
  member_epoch_seconds: Smaws_Lib.Smithy_api.Types.timestamp option
    [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec test_string_map =
  (Smaws_Lib.Smithy_api.Types.string_ * Smaws_Lib.Smithy_api.Types.string_)
    list[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec test_string_list = Smaws_Lib.Smithy_api.Types.string_ list
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec test_no_payload_input_output =
  {
  test_id: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec payload_config =
  {
  data: Smaws_Lib.Smithy_api.Types.integer option [@ocaml.doc ""]}[@@ocaml.doc
                                                                    ""]
[@@deriving show][@@deriving eq]
type nonrec test_payload_structure_input_output =
  {
  payload_config: payload_config option [@ocaml.doc ""];
  test_id: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec test_payload_blob_input_output =
  {
  data: Smaws_Lib.Smithy_api.Types.blob option [@ocaml.doc ""];
  content_type: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec test_int_enum =
  | TWO [@ocaml.doc ""]
  | ONE [@ocaml.doc ""][@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec test_enum =
  | BAZ [@ocaml.doc ""]
  | BAR [@ocaml.doc ""]
  | FOO [@ocaml.doc ""][@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec test_config =
  {
  timeout: Smaws_Lib.Smithy_api.Types.integer option [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec test_body_structure_input_output =
  {
  test_config: test_config option [@ocaml.doc ""];
  test_id: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec structure_list_member =
  {
  b: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""];
  a: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                 ""][@@deriving
                                                                    show]
[@@deriving eq]
type nonrec structure_list = structure_list_member list[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec string_payload_input =
  {
  payload: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec string_enum =
  | V [@ocaml.doc ""][@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec streaming_text_plain_blob = bytes[@@ocaml.doc ""][@@deriving
                                                               show][@@deriving
                                                                    eq]
type nonrec streaming_traits_with_media_type_input_output =
  {
  blob: streaming_text_plain_blob option [@ocaml.doc ""];
  foo: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                   ""]
[@@deriving show][@@deriving eq]
type nonrec finite_streaming_blob = bytes[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec streaming_traits_require_length_input =
  {
  blob: finite_streaming_blob option [@ocaml.doc ""];
  foo: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                   ""]
[@@deriving show][@@deriving eq]
type nonrec streaming_blob = bytes[@@ocaml.doc ""][@@deriving show][@@deriving
                                                                    eq]
type nonrec streaming_traits_input_output =
  {
  blob: streaming_blob option [@ocaml.doc ""];
  foo: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                   ""]
[@@deriving show][@@deriving eq]
type nonrec sparse_struct_map =
  (Smaws_Lib.Smithy_api.Types.string_ * Shared.Types.greeting_struct) list
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec sparse_set_map =
  (Smaws_Lib.Smithy_api.Types.string_ * Shared.Types.string_set) list
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec sparse_number_map =
  (Smaws_Lib.Smithy_api.Types.string_ * Smaws_Lib.Smithy_api.Types.integer)
    list[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec sparse_boolean_map =
  (Smaws_Lib.Smithy_api.Types.string_ * Smaws_Lib.Smithy_api.Types.boolean_)
    list[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec sparse_json_maps_input_output =
  {
  sparse_set_map: sparse_set_map option [@ocaml.doc ""];
  sparse_string_map: Shared.Types.sparse_string_map option [@ocaml.doc ""];
  sparse_boolean_map: sparse_boolean_map option [@ocaml.doc ""];
  sparse_number_map: sparse_number_map option [@ocaml.doc ""];
  sparse_struct_map: sparse_struct_map option [@ocaml.doc ""]}[@@ocaml.doc
                                                                ""][@@deriving
                                                                    show]
[@@deriving eq]
type nonrec sparse_json_lists_input_output =
  {
  sparse_short_list: Shared.Types.sparse_short_list option [@ocaml.doc ""];
  sparse_string_list: Shared.Types.sparse_string_list option [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec simple_union =
  | String of Smaws_Lib.Smithy_api.Types.string_ [@ocaml.doc ""]
  | Int of Smaws_Lib.Smithy_api.Types.integer [@ocaml.doc ""][@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec simple_scalar_properties_input_output =
  {
  double_value: Smaws_Lib.Smithy_api.Types.double option [@ocaml.doc ""];
  float_value: Smaws_Lib.Smithy_api.Types.float_ option [@ocaml.doc ""];
  long_value: Smaws_Lib.Smithy_api.Types.long option [@ocaml.doc ""];
  integer_value: Smaws_Lib.Smithy_api.Types.integer option [@ocaml.doc ""];
  short_value: Smaws_Lib.Smithy_api.Types.short option [@ocaml.doc ""];
  byte_value: Smaws_Lib.Smithy_api.Types.byte option [@ocaml.doc ""];
  false_boolean_value: Smaws_Lib.Smithy_api.Types.boolean_ option
    [@ocaml.doc ""];
  true_boolean_value: Smaws_Lib.Smithy_api.Types.boolean_ option
    [@ocaml.doc ""];
  string_value: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""];
  foo: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                   ""]
[@@deriving show][@@deriving eq]
type nonrec simple_map =
  (Smaws_Lib.Smithy_api.Types.string_ * Smaws_Lib.Smithy_api.Types.string_)
    list[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec simple_list = Smaws_Lib.Smithy_api.Types.string_ list[@@ocaml.doc
                                                                   ""]
[@@deriving show][@@deriving eq]
type nonrec response_code_required_output =
  {
  response_code: Smaws_Lib.Smithy_api.Types.integer [@ocaml.doc ""]}[@@ocaml.doc
                                                                    ""]
[@@deriving show][@@deriving eq]
type nonrec response_code_http_fallback_input_output = unit[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type recursive_shapes_input_output_nested1 =
  {
  nested: recursive_shapes_input_output_nested2 option [@ocaml.doc ""];
  foo: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                   ""]
[@@deriving show][@@deriving eq]
and recursive_shapes_input_output_nested2 =
  {
  recursive_member: recursive_shapes_input_output_nested1 option
    [@ocaml.doc ""];
  bar: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                   ""]
[@@deriving show][@@deriving eq]
type nonrec recursive_shapes_input_output =
  {
  nested: recursive_shapes_input_output_nested1 option [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec query_precedence_input =
  {
  baz: Shared.Types.string_map option [@ocaml.doc ""];
  foo: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                   ""]
[@@deriving show][@@deriving eq]
type nonrec query_params_as_string_list_map_input =
  {
  foo: Shared.Types.string_list_map option [@ocaml.doc ""];
  qux: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                   ""]
[@@deriving show][@@deriving eq]
type nonrec query_idempotency_token_auto_fill_input =
  {
  token: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                    ""]
[@@deriving show][@@deriving eq]
type nonrec put_with_content_encoding_input =
  {
  data: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""];
  encoding: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec post_union_with_json_name_output =
  {
  value: union_with_json_name [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving
                                                                show]
[@@deriving eq]
type nonrec post_union_with_json_name_input =
  {
  value: union_with_json_name option [@ocaml.doc ""]}[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec player_action =
  | Quit of Smaws_Lib.Smithy_api.Types.unit_ [@ocaml.doc "Quit the game."]
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec post_player_action_output =
  {
  action: player_action [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec post_player_action_input =
  {
  action: player_action option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving
                                                                 show]
[@@deriving eq]
type nonrec operation_with_nested_structure_output = unit[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec operation_with_nested_structure_input =
  {
  top_level: top_level [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec operation_with_defaults_output = unit[@@ocaml.doc ""][@@deriving
                                                                   show]
[@@deriving eq]
type nonrec defaults = unit[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec client_optional_defaults =
  {
  member: Smaws_Lib.Smithy_api.Types.integer option [@ocaml.doc ""]}[@@ocaml.doc
                                                                    ""]
[@@deriving show][@@deriving eq]
type nonrec operation_with_defaults_input =
  {
  other_top_level_default: Smaws_Lib.Smithy_api.Types.integer option
    [@ocaml.doc ""];
  top_level_default: Smaws_Lib.Smithy_api.Types.string_ option
    [@ocaml.doc ""];
  client_optional_defaults: client_optional_defaults option [@ocaml.doc ""];
  defaults: defaults option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec omits_serializing_empty_lists_input =
  {
  query_integer_enum_list: Shared.Types.integer_enum_list option
    [@ocaml.doc ""];
  query_enum_list: Shared.Types.foo_enum_list option [@ocaml.doc ""];
  query_timestamp_list: Shared.Types.timestamp_list option [@ocaml.doc ""];
  query_boolean_list: Shared.Types.boolean_list option [@ocaml.doc ""];
  query_double_list: Shared.Types.double_list option [@ocaml.doc ""];
  query_integer_list: Shared.Types.integer_list option [@ocaml.doc ""];
  query_string_list: Shared.Types.string_list option [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec omits_null_serializes_empty_string_input =
  {
  empty_string: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""];
  null_value: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec null_and_empty_headers_i_o =
  {
  c: Shared.Types.string_list option [@ocaml.doc ""];
  b: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""];
  a: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                 ""][@@deriving
                                                                    show]
[@@deriving eq]
type nonrec no_input_and_output_output = unit[@@ocaml.doc ""][@@deriving
                                                               show][@@deriving
                                                                    eq]
type nonrec json_value = string[@@ocaml.doc ""][@@deriving show][@@deriving
                                                                  eq]
type nonrec media_type_header_output =
  {
  json: json_value option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec media_type_header_input =
  {
  json: json_value option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec malformed_union_input =
  {
  union: simple_union option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving
                                                               show][@@deriving
                                                                    eq]
type nonrec malformed_timestamp_query_http_date_input =
  {
  timestamp: Smaws_Lib.Smithy_api.Types.timestamp [@ocaml.doc ""]}[@@ocaml.doc
                                                                    ""]
[@@deriving show][@@deriving eq]
type nonrec malformed_timestamp_query_epoch_input =
  {
  timestamp: Smaws_Lib.Smithy_api.Types.timestamp [@ocaml.doc ""]}[@@ocaml.doc
                                                                    ""]
[@@deriving show][@@deriving eq]
type nonrec malformed_timestamp_query_default_input =
  {
  timestamp: Smaws_Lib.Smithy_api.Types.timestamp [@ocaml.doc ""]}[@@ocaml.doc
                                                                    ""]
[@@deriving show][@@deriving eq]
type nonrec malformed_timestamp_path_http_date_input =
  {
  timestamp: Smaws_Lib.Smithy_api.Types.timestamp [@ocaml.doc ""]}[@@ocaml.doc
                                                                    ""]
[@@deriving show][@@deriving eq]
type nonrec malformed_timestamp_path_epoch_input =
  {
  timestamp: Smaws_Lib.Smithy_api.Types.timestamp [@ocaml.doc ""]}[@@ocaml.doc
                                                                    ""]
[@@deriving show][@@deriving eq]
type nonrec malformed_timestamp_path_default_input =
  {
  timestamp: Smaws_Lib.Smithy_api.Types.timestamp [@ocaml.doc ""]}[@@ocaml.doc
                                                                    ""]
[@@deriving show][@@deriving eq]
type nonrec malformed_timestamp_header_epoch_input =
  {
  timestamp: Smaws_Lib.Smithy_api.Types.timestamp [@ocaml.doc ""]}[@@ocaml.doc
                                                                    ""]
[@@deriving show][@@deriving eq]
type nonrec malformed_timestamp_header_default_input =
  {
  timestamp: Smaws_Lib.Smithy_api.Types.timestamp [@ocaml.doc ""]}[@@ocaml.doc
                                                                    ""]
[@@deriving show][@@deriving eq]
type nonrec malformed_timestamp_header_date_time_input =
  {
  timestamp: Smaws_Lib.Smithy_api.Types.timestamp [@ocaml.doc ""]}[@@ocaml.doc
                                                                    ""]
[@@deriving show][@@deriving eq]
type nonrec malformed_timestamp_body_http_date_input =
  {
  timestamp: Smaws_Lib.Smithy_api.Types.timestamp [@ocaml.doc ""]}[@@ocaml.doc
                                                                    ""]
[@@deriving show][@@deriving eq]
type nonrec malformed_timestamp_body_default_input =
  {
  timestamp: Smaws_Lib.Smithy_api.Types.timestamp [@ocaml.doc ""]}[@@ocaml.doc
                                                                    ""]
[@@deriving show][@@deriving eq]
type nonrec malformed_timestamp_body_date_time_input =
  {
  timestamp: Smaws_Lib.Smithy_api.Types.timestamp [@ocaml.doc ""]}[@@ocaml.doc
                                                                    ""]
[@@deriving show][@@deriving eq]
type nonrec json_header_string = string[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec malformed_string_input =
  {
  blob: json_header_string option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving
                                                                    show]
[@@deriving eq]
type nonrec malformed_short_input =
  {
  short_in_header: Smaws_Lib.Smithy_api.Types.short option [@ocaml.doc ""];
  short_in_query: Smaws_Lib.Smithy_api.Types.short option [@ocaml.doc ""];
  short_in_path: Smaws_Lib.Smithy_api.Types.short [@ocaml.doc ""];
  short_in_body: Smaws_Lib.Smithy_api.Types.short option [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec malformed_request_body_input =
  {
  float_: Smaws_Lib.Smithy_api.Types.float_ option [@ocaml.doc ""];
  int_: Smaws_Lib.Smithy_api.Types.integer option [@ocaml.doc ""]}[@@ocaml.doc
                                                                    ""]
[@@deriving show][@@deriving eq]
type nonrec malformed_map_input =
  {
  body_map: simple_map option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving
                                                                show]
[@@deriving eq]
type nonrec malformed_long_input =
  {
  long_in_header: Smaws_Lib.Smithy_api.Types.long option [@ocaml.doc ""];
  long_in_query: Smaws_Lib.Smithy_api.Types.long option [@ocaml.doc ""];
  long_in_path: Smaws_Lib.Smithy_api.Types.long [@ocaml.doc ""];
  long_in_body: Smaws_Lib.Smithy_api.Types.long option [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec malformed_list_input =
  {
  body_list: simple_list option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving
                                                                  show]
[@@deriving eq]
type nonrec malformed_integer_input =
  {
  integer_in_header: Smaws_Lib.Smithy_api.Types.integer option
    [@ocaml.doc ""];
  integer_in_query: Smaws_Lib.Smithy_api.Types.integer option [@ocaml.doc ""];
  integer_in_path: Smaws_Lib.Smithy_api.Types.integer [@ocaml.doc ""];
  integer_in_body: Smaws_Lib.Smithy_api.Types.integer option [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec malformed_float_input =
  {
  float_in_header: Smaws_Lib.Smithy_api.Types.float_ option [@ocaml.doc ""];
  float_in_query: Smaws_Lib.Smithy_api.Types.float_ option [@ocaml.doc ""];
  float_in_path: Smaws_Lib.Smithy_api.Types.float_ [@ocaml.doc ""];
  float_in_body: Smaws_Lib.Smithy_api.Types.float_ option [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec malformed_double_input =
  {
  double_in_header: Smaws_Lib.Smithy_api.Types.double option [@ocaml.doc ""];
  double_in_query: Smaws_Lib.Smithy_api.Types.double option [@ocaml.doc ""];
  double_in_path: Smaws_Lib.Smithy_api.Types.double [@ocaml.doc ""];
  double_in_body: Smaws_Lib.Smithy_api.Types.double option [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec malformed_content_type_with_payload_input =
  {
  payload: Shared.Types.jpeg_blob option [@ocaml.doc ""]}[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec malformed_content_type_without_body_empty_input_input =
  {
  header: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                    ""]
[@@deriving show][@@deriving eq]
type nonrec malformed_content_type_with_generic_string_input =
  {
  payload: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec malformed_byte_input =
  {
  byte_in_header: Smaws_Lib.Smithy_api.Types.byte option [@ocaml.doc ""];
  byte_in_query: Smaws_Lib.Smithy_api.Types.byte option [@ocaml.doc ""];
  byte_in_path: Smaws_Lib.Smithy_api.Types.byte [@ocaml.doc ""];
  byte_in_body: Smaws_Lib.Smithy_api.Types.byte option [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec malformed_boolean_input =
  {
  boolean_in_header: Smaws_Lib.Smithy_api.Types.boolean_ option
    [@ocaml.doc ""];
  boolean_in_query: Smaws_Lib.Smithy_api.Types.boolean_ option
    [@ocaml.doc ""];
  boolean_in_path: Smaws_Lib.Smithy_api.Types.boolean_ [@ocaml.doc ""];
  boolean_in_body: Smaws_Lib.Smithy_api.Types.boolean_ option [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec malformed_blob_input =
  {
  blob: Smaws_Lib.Smithy_api.Types.blob option [@ocaml.doc ""]}[@@ocaml.doc
                                                                 ""][@@deriving
                                                                    show]
[@@deriving eq]
type nonrec malformed_accept_with_payload_output =
  {
  payload: Shared.Types.jpeg_blob option [@ocaml.doc ""]}[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec malformed_accept_with_generic_string_output =
  {
  payload: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec json_timestamps_input_output =
  {
  http_date_on_target: Shared.Types.http_date option [@ocaml.doc ""];
  http_date: Smaws_Lib.Smithy_api.Types.timestamp option [@ocaml.doc ""];
  epoch_seconds_on_target: Shared.Types.epoch_seconds option [@ocaml.doc ""];
  epoch_seconds: Smaws_Lib.Smithy_api.Types.timestamp option [@ocaml.doc ""];
  date_time_on_target: Shared.Types.date_time option [@ocaml.doc ""];
  date_time: Smaws_Lib.Smithy_api.Types.timestamp option [@ocaml.doc ""];
  normal: Smaws_Lib.Smithy_api.Types.timestamp option [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec dense_struct_map =
  (Smaws_Lib.Smithy_api.Types.string_ * Shared.Types.greeting_struct) list
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec dense_number_map =
  (Smaws_Lib.Smithy_api.Types.string_ * Smaws_Lib.Smithy_api.Types.integer)
    list[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec dense_boolean_map =
  (Smaws_Lib.Smithy_api.Types.string_ * Smaws_Lib.Smithy_api.Types.boolean_)
    list[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec dense_string_map =
  (Smaws_Lib.Smithy_api.Types.string_ * Smaws_Lib.Smithy_api.Types.string_)
    list[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec dense_set_map =
  (Smaws_Lib.Smithy_api.Types.string_ * Shared.Types.string_set) list
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec json_maps_input_output =
  {
  dense_set_map: dense_set_map option [@ocaml.doc ""];
  dense_string_map: dense_string_map option [@ocaml.doc ""];
  dense_boolean_map: dense_boolean_map option [@ocaml.doc ""];
  dense_number_map: dense_number_map option [@ocaml.doc ""];
  dense_struct_map: dense_struct_map option [@ocaml.doc ""]}[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec json_lists_input_output =
  {
  structure_list: structure_list option [@ocaml.doc ""];
  nested_string_list: Shared.Types.nested_string_list option [@ocaml.doc ""];
  int_enum_list: Shared.Types.integer_enum_list option [@ocaml.doc ""];
  enum_list: Shared.Types.foo_enum_list option [@ocaml.doc ""];
  timestamp_list: Shared.Types.timestamp_list option [@ocaml.doc ""];
  boolean_list: Shared.Types.boolean_list option [@ocaml.doc ""];
  integer_list: Shared.Types.integer_list option [@ocaml.doc ""];
  string_set: Shared.Types.string_set option [@ocaml.doc ""];
  string_list: Shared.Types.string_list option [@ocaml.doc ""]}[@@ocaml.doc
                                                                 ""][@@deriving
                                                                    show]
[@@deriving eq]
type nonrec json_int_enums_input_output =
  {
  integer_enum_map: Shared.Types.integer_enum_map option [@ocaml.doc ""];
  integer_enum_set: Shared.Types.integer_enum_set option [@ocaml.doc ""];
  integer_enum_list: Shared.Types.integer_enum_list option [@ocaml.doc ""];
  integer_enum3: Shared.Types.integer_enum option [@ocaml.doc ""];
  integer_enum2: Shared.Types.integer_enum option [@ocaml.doc ""];
  integer_enum1: Shared.Types.integer_enum option [@ocaml.doc ""]}[@@ocaml.doc
                                                                    ""]
[@@deriving show][@@deriving eq]
type nonrec json_enums_input_output =
  {
  foo_enum_map: Shared.Types.foo_enum_map option [@ocaml.doc ""];
  foo_enum_set: Shared.Types.foo_enum_set option [@ocaml.doc ""];
  foo_enum_list: Shared.Types.foo_enum_list option [@ocaml.doc ""];
  foo_enum3: Shared.Types.foo_enum option [@ocaml.doc ""];
  foo_enum2: Shared.Types.foo_enum option [@ocaml.doc ""];
  foo_enum1: Shared.Types.foo_enum option [@ocaml.doc ""]}[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec json_blobs_input_output =
  {
  data: Smaws_Lib.Smithy_api.Types.blob option [@ocaml.doc ""]}[@@ocaml.doc
                                                                 ""][@@deriving
                                                                    show]
[@@deriving eq]
type nonrec input_and_output_with_headers_i_o =
  {
  header_integer_enum_list: Shared.Types.integer_enum_list option
    [@ocaml.doc ""];
  header_integer_enum: Shared.Types.integer_enum option [@ocaml.doc ""];
  header_enum_list: Shared.Types.foo_enum_list option [@ocaml.doc ""];
  header_enum: Shared.Types.foo_enum option [@ocaml.doc ""];
  header_timestamp_list: Shared.Types.timestamp_list option [@ocaml.doc ""];
  header_boolean_list: Shared.Types.boolean_list option [@ocaml.doc ""];
  header_integer_list: Shared.Types.integer_list option [@ocaml.doc ""];
  header_string_set: Shared.Types.string_set option [@ocaml.doc ""];
  header_string_list: Shared.Types.string_list option [@ocaml.doc ""];
  header_false_bool: Smaws_Lib.Smithy_api.Types.boolean_ option
    [@ocaml.doc ""];
  header_true_bool: Smaws_Lib.Smithy_api.Types.boolean_ option
    [@ocaml.doc ""];
  header_double: Smaws_Lib.Smithy_api.Types.double option [@ocaml.doc ""];
  header_float: Smaws_Lib.Smithy_api.Types.float_ option [@ocaml.doc ""];
  header_long: Smaws_Lib.Smithy_api.Types.long option [@ocaml.doc ""];
  header_integer: Smaws_Lib.Smithy_api.Types.integer option [@ocaml.doc ""];
  header_short: Smaws_Lib.Smithy_api.Types.short option [@ocaml.doc ""];
  header_byte: Smaws_Lib.Smithy_api.Types.byte option [@ocaml.doc ""];
  header_string: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec ignore_query_params_in_response_output =
  {
  baz: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                   ""]
[@@deriving show][@@deriving eq]
type nonrec http_response_code_output =
  {
  status: Smaws_Lib.Smithy_api.Types.integer option [@ocaml.doc ""]}[@@ocaml.doc
                                                                    ""]
[@@deriving show][@@deriving eq]
type nonrec http_request_with_regex_literal_input =
  {
  str: Smaws_Lib.Smithy_api.Types.string_ [@ocaml.doc ""]}[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec http_request_with_labels_and_timestamp_format_input =
  {
  target_date_time: Shared.Types.date_time [@ocaml.doc ""];
  target_http_date: Shared.Types.http_date [@ocaml.doc ""];
  target_epoch_seconds: Shared.Types.epoch_seconds [@ocaml.doc ""];
  default_format: Smaws_Lib.Smithy_api.Types.timestamp [@ocaml.doc ""];
  member_date_time: Smaws_Lib.Smithy_api.Types.timestamp [@ocaml.doc ""];
  member_http_date: Smaws_Lib.Smithy_api.Types.timestamp [@ocaml.doc ""];
  member_epoch_seconds: Smaws_Lib.Smithy_api.Types.timestamp [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec http_request_with_labels_input =
  {
  timestamp: Smaws_Lib.Smithy_api.Types.timestamp
    [@ocaml.doc
      "Note that this member has no format, so it's serialized as an RFC 3399 date-time."];
  boolean_: Smaws_Lib.Smithy_api.Types.boolean_
    [@ocaml.doc "Serialized in the path as true or false."];
  double: Smaws_Lib.Smithy_api.Types.double [@ocaml.doc ""];
  float_: Smaws_Lib.Smithy_api.Types.float_ [@ocaml.doc ""];
  long: Smaws_Lib.Smithy_api.Types.long [@ocaml.doc ""];
  integer: Smaws_Lib.Smithy_api.Types.integer [@ocaml.doc ""];
  short: Smaws_Lib.Smithy_api.Types.short [@ocaml.doc ""];
  string_: Smaws_Lib.Smithy_api.Types.string_ [@ocaml.doc ""]}[@@ocaml.doc
                                                                ""][@@deriving
                                                                    show]
[@@deriving eq]
type nonrec http_request_with_greedy_label_in_path_input =
  {
  baz: Smaws_Lib.Smithy_api.Types.string_ [@ocaml.doc ""];
  foo: Smaws_Lib.Smithy_api.Types.string_ [@ocaml.doc ""]}[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec http_request_with_float_labels_input =
  {
  double: Smaws_Lib.Smithy_api.Types.double [@ocaml.doc ""];
  float_: Smaws_Lib.Smithy_api.Types.float_ [@ocaml.doc ""]}[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec http_prefix_headers_in_response_output =
  {
  prefix_headers: Shared.Types.string_map option [@ocaml.doc ""]}[@@ocaml.doc
                                                                   ""]
[@@deriving show][@@deriving eq]
type nonrec http_prefix_headers_in_response_input = unit[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec http_prefix_headers_output =
  {
  foo_map: Shared.Types.string_map option [@ocaml.doc ""];
  foo: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                   ""]
[@@deriving show][@@deriving eq]
type nonrec http_prefix_headers_input =
  {
  foo_map: Shared.Types.string_map option [@ocaml.doc ""];
  foo: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                   ""]
[@@deriving show][@@deriving eq]
type nonrec http_payload_with_union_input_output =
  {
  nested: union_payload option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving
                                                                 show]
[@@deriving eq]
type nonrec nested_payload =
  {
  name: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""];
  greeting: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec http_payload_with_structure_input_output =
  {
  nested: nested_payload option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving
                                                                  show]
[@@deriving eq]
type nonrec http_payload_traits_with_media_type_input_output =
  {
  blob: Shared.Types.text_plain_blob option [@ocaml.doc ""];
  foo: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                   ""]
[@@deriving show][@@deriving eq]
type nonrec http_payload_traits_input_output =
  {
  blob: Smaws_Lib.Smithy_api.Types.blob option [@ocaml.doc ""];
  foo: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                   ""]
[@@deriving show][@@deriving eq]
type nonrec enum_payload_input =
  {
  payload: string_enum option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving
                                                                show]
[@@deriving eq]
type nonrec http_empty_prefix_headers_output =
  {
  specific_header: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""];
  prefix_headers: Shared.Types.string_map option [@ocaml.doc ""]}[@@ocaml.doc
                                                                   ""]
[@@deriving show][@@deriving eq]
type nonrec http_empty_prefix_headers_input =
  {
  specific_header: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""];
  prefix_headers: Shared.Types.string_map option [@ocaml.doc ""]}[@@ocaml.doc
                                                                   ""]
[@@deriving show][@@deriving eq]
type nonrec http_checksum_required_input_output =
  {
  foo: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                   ""]
[@@deriving show][@@deriving eq]
type nonrec invalid_greeting =
  {
  message: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}
[@@ocaml.doc
  "This error is thrown when an invalid greeting value is provided."]
[@@deriving show][@@deriving eq]
type nonrec foo_error = unit[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec complex_nested_error_data =
  {
  foo: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                   ""]
[@@deriving show][@@deriving eq]
type nonrec complex_error =
  {
  nested: complex_nested_error_data option [@ocaml.doc ""];
  top_level: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""];
  header: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                    "This error is thrown when a request is invalid."]
[@@deriving show][@@deriving eq]
type nonrec greeting_with_errors_output =
  {
  greeting: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec fractional_seconds_output =
  {
  datetime: Shared.Types.date_time option [@ocaml.doc ""]}[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec host_label_input =
  {
  label: Smaws_Lib.Smithy_api.Types.string_ [@ocaml.doc ""]}[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec empty_input_and_empty_output_output = unit[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec empty_input_and_empty_output_input = unit[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec document = Smaws_Lib.CoreTypes.Document.t[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec document_type_as_payload_input_output =
  {
  document_value: document option [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving
                                                                    show]
[@@deriving eq]
type nonrec document_valued_map =
  (Smaws_Lib.Smithy_api.Types.string_ * document) list[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec document_type_as_map_value_input_output =
  {
  doc_valued_map: document_valued_map option [@ocaml.doc ""]}[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec document_type_input_output =
  {
  document_value: document option [@ocaml.doc ""];
  string_value: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec datetime_offsets_output =
  {
  datetime: Shared.Types.date_time option [@ocaml.doc ""]}[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec content_type_parameters_output = unit[@@ocaml.doc ""][@@deriving
                                                                   show]
[@@deriving eq]
type nonrec content_type_parameters_input =
  {
  value: Smaws_Lib.Smithy_api.Types.integer option [@ocaml.doc ""]}[@@ocaml.doc
                                                                    ""]
[@@deriving show][@@deriving eq]
type nonrec constant_query_string_input =
  {
  hello: Smaws_Lib.Smithy_api.Types.string_ [@ocaml.doc ""]}[@@ocaml.doc ""]
[@@deriving show][@@deriving eq]
type nonrec constant_and_variable_query_string_input =
  {
  maybe_set: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""];
  baz: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                   ""]
[@@deriving show][@@deriving eq]
type nonrec all_query_string_types_input =
  {
  query_params_map_of_string_list: Shared.Types.string_list_map option
    [@ocaml.doc ""];
  query_integer_enum_list: Shared.Types.integer_enum_list option
    [@ocaml.doc ""];
  query_integer_enum: Shared.Types.integer_enum option [@ocaml.doc ""];
  query_enum_list: Shared.Types.foo_enum_list option [@ocaml.doc ""];
  query_enum: Shared.Types.foo_enum option [@ocaml.doc ""];
  query_timestamp_list: Shared.Types.timestamp_list option [@ocaml.doc ""];
  query_timestamp: Smaws_Lib.Smithy_api.Types.timestamp option
    [@ocaml.doc ""];
  query_boolean_list: Shared.Types.boolean_list option [@ocaml.doc ""];
  query_boolean: Smaws_Lib.Smithy_api.Types.boolean_ option [@ocaml.doc ""];
  query_double_list: Shared.Types.double_list option [@ocaml.doc ""];
  query_double: Smaws_Lib.Smithy_api.Types.double option [@ocaml.doc ""];
  query_float: Smaws_Lib.Smithy_api.Types.float_ option [@ocaml.doc ""];
  query_long: Smaws_Lib.Smithy_api.Types.long option [@ocaml.doc ""];
  query_integer_set: Shared.Types.integer_set option [@ocaml.doc ""];
  query_integer_list: Shared.Types.integer_list option [@ocaml.doc ""];
  query_integer: Smaws_Lib.Smithy_api.Types.integer option [@ocaml.doc ""];
  query_short: Smaws_Lib.Smithy_api.Types.short option [@ocaml.doc ""];
  query_byte: Smaws_Lib.Smithy_api.Types.byte option [@ocaml.doc ""];
  query_string_set: Shared.Types.string_set option [@ocaml.doc ""];
  query_string_list: Shared.Types.string_list option [@ocaml.doc ""];
  query_string: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec farewell =
  {
  phrase: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}[@@ocaml.doc
                                                                    ""]
[@@deriving show][@@deriving eq]
type nonrec dialog =
  {
  farewell: farewell option [@ocaml.doc ""];
  greeting: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""];
  language: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec dialog_list = dialog list[@@ocaml.doc ""][@@deriving show]
[@@deriving eq]
type nonrec dialog_map = (Smaws_Lib.Smithy_api.Types.string_ * dialog) list
[@@ocaml.doc ""][@@deriving show][@@deriving eq]
type nonrec nested_defaults_mixin =
  {
  dialog_map: dialog_map option [@ocaml.doc ""];
  dialog_list: dialog_list option [@ocaml.doc ""];
  dialog: dialog [@ocaml.doc ""]}[@@ocaml.doc ""][@@deriving show][@@deriving
                                                                    eq]
type nonrec defaults_mixin =
  {
  zero_double: Smaws_Lib.Smithy_api.Types.double option [@ocaml.doc ""];
  zero_float: Smaws_Lib.Smithy_api.Types.float_ option [@ocaml.doc ""];
  zero_long: Smaws_Lib.Smithy_api.Types.long option [@ocaml.doc ""];
  zero_integer: Smaws_Lib.Smithy_api.Types.integer option [@ocaml.doc ""];
  zero_short: Smaws_Lib.Smithy_api.Types.short option [@ocaml.doc ""];
  zero_byte: Smaws_Lib.Smithy_api.Types.byte option [@ocaml.doc ""];
  empty_blob: Smaws_Lib.Smithy_api.Types.blob option [@ocaml.doc ""];
  false_boolean: Smaws_Lib.Smithy_api.Types.boolean_ option [@ocaml.doc ""];
  empty_string: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""];
  default_int_enum: test_int_enum option [@ocaml.doc ""];
  default_enum: test_enum option [@ocaml.doc ""];
  default_map: test_string_map option [@ocaml.doc ""];
  default_double: Smaws_Lib.Smithy_api.Types.double option [@ocaml.doc ""];
  default_float: Smaws_Lib.Smithy_api.Types.float_ option [@ocaml.doc ""];
  default_long: Smaws_Lib.Smithy_api.Types.long option [@ocaml.doc ""];
  default_integer: Smaws_Lib.Smithy_api.Types.integer option [@ocaml.doc ""];
  default_short: Smaws_Lib.Smithy_api.Types.short option [@ocaml.doc ""];
  default_byte: Smaws_Lib.Smithy_api.Types.byte option [@ocaml.doc ""];
  default_blob: Smaws_Lib.Smithy_api.Types.blob option [@ocaml.doc ""];
  default_timestamp: Smaws_Lib.Smithy_api.Types.timestamp option
    [@ocaml.doc ""];
  default_null_document: document option [@ocaml.doc ""];
  default_document_list: document option [@ocaml.doc ""];
  default_document_boolean: document option [@ocaml.doc ""];
  default_document_string: document option [@ocaml.doc ""];
  default_document_map: document option [@ocaml.doc ""];
  default_list: test_string_list option [@ocaml.doc ""];
  default_boolean: Smaws_Lib.Smithy_api.Types.boolean_ option [@ocaml.doc ""];
  default_string: Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""]}
[@@ocaml.doc ""][@@deriving show][@@deriving eq]