type all_query_string_types_input = {
  query_string : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  query_string_list : Shared.Types.string_list option; [@ocaml.doc ""]
  query_string_set : Shared.Types.string_set option; [@ocaml.doc ""]
  query_byte : Smaws_Lib.Smithy_api.Types.byte option; [@ocaml.doc ""]
  query_short : Smaws_Lib.Smithy_api.Types.short option; [@ocaml.doc ""]
  query_integer : Smaws_Lib.Smithy_api.Types.integer option; [@ocaml.doc ""]
  query_integer_list : Shared.Types.integer_list option; [@ocaml.doc ""]
  query_integer_set : Shared.Types.integer_set option; [@ocaml.doc ""]
  query_long : Smaws_Lib.Smithy_api.Types.long option; [@ocaml.doc ""]
  query_float : Smaws_Lib.Smithy_api.Types.float_ option; [@ocaml.doc ""]
  query_double : Smaws_Lib.Smithy_api.Types.double option; [@ocaml.doc ""]
  query_double_list : Shared.Types.double_list option; [@ocaml.doc ""]
  query_boolean : Smaws_Lib.Smithy_api.Types.boolean_ option; [@ocaml.doc ""]
  query_boolean_list : Shared.Types.boolean_list option; [@ocaml.doc ""]
  query_timestamp : Smaws_Lib.Smithy_api.Types.timestamp option; [@ocaml.doc ""]
  query_timestamp_list : Shared.Types.timestamp_list option; [@ocaml.doc ""]
  query_enum : Shared.Types.foo_enum option; [@ocaml.doc ""]
  query_enum_list : Shared.Types.foo_enum_list option; [@ocaml.doc ""]
  query_integer_enum : Shared.Types.integer_enum option; [@ocaml.doc ""]
  query_integer_enum_list : Shared.Types.integer_enum_list option; [@ocaml.doc ""]
  query_params_map_of_strings : Shared.Types.string_map option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type payload_with_xml_name = { name : Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""] }
[@@ocaml.doc ""] [@@deriving show, eq]

type body_with_xml_name_input_output = { nested : payload_with_xml_name option [@ocaml.doc ""] }
[@@ocaml.doc ""] [@@deriving show, eq]

type complex_nested_error_data = { foo : Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""] }
[@@ocaml.doc ""] [@@deriving show, eq]

type complex_error = {
  header : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  top_level : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  nested : complex_nested_error_data option; [@ocaml.doc ""]
}
[@@ocaml.doc "This error is thrown when a request is invalid."] [@@deriving show, eq]

type constant_and_variable_query_string_input = {
  baz : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  maybe_set : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type constant_query_string_input = { hello : Smaws_Lib.Smithy_api.Types.string_ [@ocaml.doc ""] }
[@@ocaml.doc ""] [@@deriving show, eq]

type content_type_parameters_output = unit [@@ocaml.doc ""] [@@deriving show, eq]

type content_type_parameters_input = {
  value : Smaws_Lib.Smithy_api.Types.integer option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type datetime_offsets_output = { datetime : Shared.Types.date_time option [@ocaml.doc ""] }
[@@ocaml.doc ""] [@@deriving show, eq]

type empty_input_and_empty_output_output = unit [@@ocaml.doc ""] [@@deriving show, eq]

type empty_input_and_empty_output_input = unit [@@ocaml.doc ""] [@@deriving show, eq]

type host_label_header_input = { account_id : Smaws_Lib.Smithy_api.Types.string_ [@ocaml.doc ""] }
[@@ocaml.doc ""] [@@deriving show, eq]

type endpoint_with_host_label_operation_request = {
  label : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type string_enum = V [@ocaml.doc ""] [@@ocaml.doc ""] [@@deriving show, eq]

type enum_payload_input = { payload : string_enum option [@ocaml.doc ""] }
[@@ocaml.doc ""] [@@deriving show, eq]

type flattened_xml_map_response = { my_map : Shared.Types.foo_enum_map option [@ocaml.doc ""] }
[@@ocaml.doc ""] [@@deriving show, eq]

type flattened_xml_map_request = { my_map : Shared.Types.foo_enum_map option [@ocaml.doc ""] }
[@@ocaml.doc ""] [@@deriving show, eq]

type flattened_xml_map_with_xml_name_input_output_map =
  (Smaws_Lib.Smithy_api.Types.string_ * Smaws_Lib.Smithy_api.Types.string_) list
[@@ocaml.doc ""] [@@deriving show, eq]

type flattened_xml_map_with_xml_name_response = {
  my_map : flattened_xml_map_with_xml_name_input_output_map option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type flattened_xml_map_with_xml_name_request = {
  my_map : flattened_xml_map_with_xml_name_input_output_map option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type flattened_xml_map_with_xml_namespace_output_map =
  (Smaws_Lib.Smithy_api.Types.string_ * Smaws_Lib.Smithy_api.Types.string_) list
[@@ocaml.doc ""] [@@deriving show, eq]

type flattened_xml_map_with_xml_namespace_output = {
  my_map : flattened_xml_map_with_xml_namespace_output_map option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type foo_prefix_headers =
  (Smaws_Lib.Smithy_api.Types.string_ * Smaws_Lib.Smithy_api.Types.string_) list
[@@ocaml.doc ""] [@@deriving show, eq]

type fractional_seconds_output = { datetime : Shared.Types.date_time option [@ocaml.doc ""] }
[@@ocaml.doc ""] [@@deriving show, eq]

type invalid_greeting = { message : Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""] }
[@@ocaml.doc "This error is thrown when an invalid greeting value is provided."]
[@@deriving show, eq]

type greeting_with_errors_output = {
  greeting : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type http_empty_prefix_headers_output = {
  prefix_headers : Shared.Types.string_map option; [@ocaml.doc ""]
  specific_header : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type http_empty_prefix_headers_input = {
  prefix_headers : Shared.Types.string_map option; [@ocaml.doc ""]
  specific_header : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type http_payload_traits_input_output = {
  foo : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  blob : Smaws_Lib.Smithy_api.Types.blob option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type http_payload_traits_with_media_type_input_output = {
  foo : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  blob : Shared.Types.text_plain_blob option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type http_payload_with_member_xml_name_input_output = {
  nested : payload_with_xml_name option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type nested_payload = {
  greeting : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  name : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type http_payload_with_structure_input_output = { nested : nested_payload option [@ocaml.doc ""] }
[@@ocaml.doc ""] [@@deriving show, eq]

type union_payload = Greeting of Smaws_Lib.Smithy_api.Types.string_ [@ocaml.doc ""]
[@@ocaml.doc ""] [@@deriving show, eq]

type http_payload_with_union_input_output = { nested : union_payload option [@ocaml.doc ""] }
[@@ocaml.doc ""] [@@deriving show, eq]

type http_payload_with_xml_name_input_output = {
  nested : payload_with_xml_name option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type payload_with_xml_namespace = {
  name : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type http_payload_with_xml_namespace_input_output = {
  nested : payload_with_xml_namespace option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type payload_with_xml_namespace_and_prefix = {
  name : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type http_payload_with_xml_namespace_and_prefix_input_output = {
  nested : payload_with_xml_namespace_and_prefix option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type http_prefix_headers_input_output = {
  foo : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  foo_map : foo_prefix_headers option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type http_request_with_float_labels_input = {
  float_ : Smaws_Lib.Smithy_api.Types.float_; [@ocaml.doc ""]
  double : Smaws_Lib.Smithy_api.Types.double; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type http_request_with_greedy_label_in_path_input = {
  foo : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
  baz : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type http_request_with_labels_input = {
  string_ : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc ""]
  short : Smaws_Lib.Smithy_api.Types.short; [@ocaml.doc ""]
  integer : Smaws_Lib.Smithy_api.Types.integer; [@ocaml.doc ""]
  long : Smaws_Lib.Smithy_api.Types.long; [@ocaml.doc ""]
  float_ : Smaws_Lib.Smithy_api.Types.float_; [@ocaml.doc ""]
  double : Smaws_Lib.Smithy_api.Types.double; [@ocaml.doc ""]
  boolean_ : Smaws_Lib.Smithy_api.Types.boolean_;
      [@ocaml.doc "Serialized in the path as true or false."]
  timestamp : Smaws_Lib.Smithy_api.Types.timestamp;
      [@ocaml.doc
        "Note that this member has no format, so it's serialized as an RFC 3399 date-time."]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type http_request_with_labels_and_timestamp_format_input = {
  member_epoch_seconds : Smaws_Lib.Smithy_api.Types.timestamp; [@ocaml.doc ""]
  member_http_date : Smaws_Lib.Smithy_api.Types.timestamp; [@ocaml.doc ""]
  member_date_time : Smaws_Lib.Smithy_api.Types.timestamp; [@ocaml.doc ""]
  default_format : Smaws_Lib.Smithy_api.Types.timestamp; [@ocaml.doc ""]
  target_epoch_seconds : Shared.Types.epoch_seconds; [@ocaml.doc ""]
  target_http_date : Shared.Types.http_date; [@ocaml.doc ""]
  target_date_time : Shared.Types.date_time; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type http_response_code_output = {
  status : Smaws_Lib.Smithy_api.Types.integer option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type string_payload_input = { payload : Smaws_Lib.Smithy_api.Types.string_ option [@ocaml.doc ""] }
[@@ocaml.doc ""] [@@deriving show, eq]

type ignore_query_params_in_response_output = {
  baz : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type input_and_output_with_headers_i_o = {
  header_string : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  header_byte : Smaws_Lib.Smithy_api.Types.byte option; [@ocaml.doc ""]
  header_short : Smaws_Lib.Smithy_api.Types.short option; [@ocaml.doc ""]
  header_integer : Smaws_Lib.Smithy_api.Types.integer option; [@ocaml.doc ""]
  header_long : Smaws_Lib.Smithy_api.Types.long option; [@ocaml.doc ""]
  header_float : Smaws_Lib.Smithy_api.Types.float_ option; [@ocaml.doc ""]
  header_double : Smaws_Lib.Smithy_api.Types.double option; [@ocaml.doc ""]
  header_true_bool : Smaws_Lib.Smithy_api.Types.boolean_ option; [@ocaml.doc ""]
  header_false_bool : Smaws_Lib.Smithy_api.Types.boolean_ option; [@ocaml.doc ""]
  header_string_list : Shared.Types.string_list option; [@ocaml.doc ""]
  header_string_set : Shared.Types.string_set option; [@ocaml.doc ""]
  header_integer_list : Shared.Types.integer_list option; [@ocaml.doc ""]
  header_boolean_list : Shared.Types.boolean_list option; [@ocaml.doc ""]
  header_timestamp_list : Shared.Types.timestamp_list option; [@ocaml.doc ""]
  header_enum : Shared.Types.foo_enum option; [@ocaml.doc ""]
  header_enum_list : Shared.Types.foo_enum_list option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type list_with_member_namespace = Smaws_Lib.Smithy_api.Types.string_ list
[@@ocaml.doc ""] [@@deriving show, eq]

type list_with_namespace = Smaws_Lib.Smithy_api.Types.string_ list
[@@ocaml.doc ""] [@@deriving show, eq]

type nested_map = (Smaws_Lib.Smithy_api.Types.string_ * Shared.Types.foo_enum_map) list
[@@ocaml.doc ""] [@@deriving show, eq]

type nested_xml_map_with_xml_name_inner_map =
  (Smaws_Lib.Smithy_api.Types.string_ * Smaws_Lib.Smithy_api.Types.string_) list
[@@ocaml.doc ""] [@@deriving show, eq]

type nested_xml_map_with_xml_name_map =
  (Smaws_Lib.Smithy_api.Types.string_ * nested_xml_map_with_xml_name_inner_map) list
[@@ocaml.doc ""] [@@deriving show, eq]

type nested_xml_map_with_xml_name_response = {
  nested_xml_map_with_xml_name_map : nested_xml_map_with_xml_name_map option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type nested_xml_map_with_xml_name_request = {
  nested_xml_map_with_xml_name_map : nested_xml_map_with_xml_name_map option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type nested_xml_map_with_xml_name_input_output = {
  nested_xml_map_with_xml_name_map : nested_xml_map_with_xml_name_map option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type nested_xml_maps_response = {
  nested_map : nested_map option; [@ocaml.doc ""]
  flat_nested_map : nested_map option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type nested_xml_maps_request = {
  nested_map : nested_map option; [@ocaml.doc ""]
  flat_nested_map : nested_map option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type nested_xml_maps_input_output = {
  nested_map : nested_map option; [@ocaml.doc ""]
  flat_nested_map : nested_map option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type no_input_and_output_output = unit [@@ocaml.doc ""] [@@deriving show, eq]

type null_and_empty_headers_i_o = {
  a : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  b : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  c : Shared.Types.string_list option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type omits_null_serializes_empty_string_input = {
  null_value : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  empty_string : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type put_with_content_encoding_input = {
  encoding : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  data : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type query_idempotency_token_auto_fill_input = {
  token : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type query_params_as_string_list_map_input = {
  qux : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  foo : Shared.Types.string_list_map option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type query_precedence_input = {
  foo : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  baz : Shared.Types.string_map option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type recursive_shapes_input_output_nested2 = {
  bar : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  recursive_member : recursive_shapes_input_output_nested1 option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

and recursive_shapes_input_output_nested1 = {
  foo : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  nested : recursive_shapes_input_output_nested2 option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type recursive_shapes_response = {
  nested : recursive_shapes_input_output_nested1 option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type recursive_shapes_request = {
  nested : recursive_shapes_input_output_nested1 option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type renamed_list_members = Smaws_Lib.Smithy_api.Types.string_ list
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_nested_union_struct = {
  string_value : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  boolean_value : Smaws_Lib.Smithy_api.Types.boolean_ option; [@ocaml.doc ""]
  byte_value : Smaws_Lib.Smithy_api.Types.byte option; [@ocaml.doc ""]
  short_value : Smaws_Lib.Smithy_api.Types.short option; [@ocaml.doc ""]
  integer_value : Smaws_Lib.Smithy_api.Types.integer option; [@ocaml.doc ""]
  long_value : Smaws_Lib.Smithy_api.Types.long option; [@ocaml.doc ""]
  float_value : Smaws_Lib.Smithy_api.Types.float_ option; [@ocaml.doc ""]
  double_value : Smaws_Lib.Smithy_api.Types.double option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_union_shape =
  | StringValue of Smaws_Lib.Smithy_api.Types.string_ [@ocaml.doc ""]
  | BooleanValue of Smaws_Lib.Smithy_api.Types.boolean_ [@ocaml.doc ""]
  | ByteValue of Smaws_Lib.Smithy_api.Types.byte [@ocaml.doc ""]
  | ShortValue of Smaws_Lib.Smithy_api.Types.short [@ocaml.doc ""]
  | IntegerValue of Smaws_Lib.Smithy_api.Types.integer [@ocaml.doc ""]
  | LongValue of Smaws_Lib.Smithy_api.Types.long [@ocaml.doc ""]
  | FloatValue of Smaws_Lib.Smithy_api.Types.float_ [@ocaml.doc ""]
  | DoubleValue of Smaws_Lib.Smithy_api.Types.double [@ocaml.doc ""]
  | UnionValue of xml_union_shape [@ocaml.doc ""]
  | StructValue of xml_nested_union_struct [@ocaml.doc ""]
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_unions_response = { union_value : xml_union_shape option [@ocaml.doc ""] }
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_unions_request = { union_value : xml_union_shape option [@ocaml.doc ""] }
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_timestamps_response = {
  normal : Smaws_Lib.Smithy_api.Types.timestamp option; [@ocaml.doc ""]
  date_time : Smaws_Lib.Smithy_api.Types.timestamp option; [@ocaml.doc ""]
  date_time_on_target : Shared.Types.date_time option; [@ocaml.doc ""]
  epoch_seconds : Smaws_Lib.Smithy_api.Types.timestamp option; [@ocaml.doc ""]
  epoch_seconds_on_target : Shared.Types.epoch_seconds option; [@ocaml.doc ""]
  http_date : Smaws_Lib.Smithy_api.Types.timestamp option; [@ocaml.doc ""]
  http_date_on_target : Shared.Types.http_date option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_timestamps_request = {
  normal : Smaws_Lib.Smithy_api.Types.timestamp option; [@ocaml.doc ""]
  date_time : Smaws_Lib.Smithy_api.Types.timestamp option; [@ocaml.doc ""]
  date_time_on_target : Shared.Types.date_time option; [@ocaml.doc ""]
  epoch_seconds : Smaws_Lib.Smithy_api.Types.timestamp option; [@ocaml.doc ""]
  epoch_seconds_on_target : Shared.Types.epoch_seconds option; [@ocaml.doc ""]
  http_date : Smaws_Lib.Smithy_api.Types.timestamp option; [@ocaml.doc ""]
  http_date_on_target : Shared.Types.http_date option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_namespaced_list = Smaws_Lib.Smithy_api.Types.string_ list
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_namespace_nested = {
  foo : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  values : xml_namespaced_list option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_namespaces_response = { nested : xml_namespace_nested option [@ocaml.doc ""] }
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_namespaces_request = { nested : xml_namespace_nested option [@ocaml.doc ""] }
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_map_with_xml_namespace_input_output_map =
  (Smaws_Lib.Smithy_api.Types.string_ * Smaws_Lib.Smithy_api.Types.string_) list
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_map_with_xml_namespace_response = {
  my_map : xml_map_with_xml_namespace_input_output_map option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_map_with_xml_namespace_request = {
  my_map : xml_map_with_xml_namespace_input_output_map option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_maps_xml_name_input_output_map =
  (Smaws_Lib.Smithy_api.Types.string_ * Shared.Types.greeting_struct) list
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_maps_xml_name_response = {
  my_map : xml_maps_xml_name_input_output_map option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_maps_xml_name_request = {
  my_map : xml_maps_xml_name_input_output_map option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_maps_input_output_map =
  (Smaws_Lib.Smithy_api.Types.string_ * Shared.Types.greeting_struct) list
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_maps_response = { my_map : xml_maps_input_output_map option [@ocaml.doc ""] }
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_maps_request = { my_map : xml_maps_input_output_map option [@ocaml.doc ""] }
[@@ocaml.doc ""] [@@deriving show, eq]

type structure_list_member = {
  a : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  b : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type structure_list = structure_list_member list [@@ocaml.doc ""] [@@deriving show, eq]

type xml_lists_response = {
  string_list : Shared.Types.string_list option; [@ocaml.doc ""]
  string_set : Shared.Types.string_set option; [@ocaml.doc ""]
  integer_list : Shared.Types.integer_list option; [@ocaml.doc ""]
  boolean_list : Shared.Types.boolean_list option; [@ocaml.doc ""]
  timestamp_list : Shared.Types.timestamp_list option; [@ocaml.doc ""]
  enum_list : Shared.Types.foo_enum_list option; [@ocaml.doc ""]
  int_enum_list : Shared.Types.integer_enum_list option; [@ocaml.doc ""]
  nested_string_list : Shared.Types.nested_string_list option; [@ocaml.doc ""]
  renamed_list_members : renamed_list_members option; [@ocaml.doc ""]
  flattened_list : renamed_list_members option; [@ocaml.doc ""]
  flattened_list2 : renamed_list_members option; [@ocaml.doc ""]
  flattened_list_with_member_namespace : list_with_member_namespace option; [@ocaml.doc ""]
  flattened_list_with_namespace : list_with_namespace option; [@ocaml.doc ""]
  structure_list : structure_list option; [@ocaml.doc ""]
  flattened_structure_list : structure_list option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_lists_request = {
  string_list : Shared.Types.string_list option; [@ocaml.doc ""]
  string_set : Shared.Types.string_set option; [@ocaml.doc ""]
  integer_list : Shared.Types.integer_list option; [@ocaml.doc ""]
  boolean_list : Shared.Types.boolean_list option; [@ocaml.doc ""]
  timestamp_list : Shared.Types.timestamp_list option; [@ocaml.doc ""]
  enum_list : Shared.Types.foo_enum_list option; [@ocaml.doc ""]
  int_enum_list : Shared.Types.integer_enum_list option; [@ocaml.doc ""]
  nested_string_list : Shared.Types.nested_string_list option; [@ocaml.doc ""]
  renamed_list_members : renamed_list_members option; [@ocaml.doc ""]
  flattened_list : renamed_list_members option; [@ocaml.doc ""]
  flattened_list2 : renamed_list_members option; [@ocaml.doc ""]
  flattened_list_with_member_namespace : list_with_member_namespace option; [@ocaml.doc ""]
  flattened_list_with_namespace : list_with_namespace option; [@ocaml.doc ""]
  structure_list : structure_list option; [@ocaml.doc ""]
  flattened_structure_list : structure_list option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_int_enums_response = {
  int_enum1 : Shared.Types.integer_enum option; [@ocaml.doc ""]
  int_enum2 : Shared.Types.integer_enum option; [@ocaml.doc ""]
  int_enum3 : Shared.Types.integer_enum option; [@ocaml.doc ""]
  int_enum_list : Shared.Types.integer_enum_list option; [@ocaml.doc ""]
  int_enum_set : Shared.Types.integer_enum_set option; [@ocaml.doc ""]
  int_enum_map : Shared.Types.integer_enum_map option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_int_enums_request = {
  int_enum1 : Shared.Types.integer_enum option; [@ocaml.doc ""]
  int_enum2 : Shared.Types.integer_enum option; [@ocaml.doc ""]
  int_enum3 : Shared.Types.integer_enum option; [@ocaml.doc ""]
  int_enum_list : Shared.Types.integer_enum_list option; [@ocaml.doc ""]
  int_enum_set : Shared.Types.integer_enum_set option; [@ocaml.doc ""]
  int_enum_map : Shared.Types.integer_enum_map option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_enums_response = {
  foo_enum1 : Shared.Types.foo_enum option; [@ocaml.doc ""]
  foo_enum2 : Shared.Types.foo_enum option; [@ocaml.doc ""]
  foo_enum3 : Shared.Types.foo_enum option; [@ocaml.doc ""]
  foo_enum_list : Shared.Types.foo_enum_list option; [@ocaml.doc ""]
  foo_enum_set : Shared.Types.foo_enum_set option; [@ocaml.doc ""]
  foo_enum_map : Shared.Types.foo_enum_map option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_enums_request = {
  foo_enum1 : Shared.Types.foo_enum option; [@ocaml.doc ""]
  foo_enum2 : Shared.Types.foo_enum option; [@ocaml.doc ""]
  foo_enum3 : Shared.Types.foo_enum option; [@ocaml.doc ""]
  foo_enum_list : Shared.Types.foo_enum_list option; [@ocaml.doc ""]
  foo_enum_set : Shared.Types.foo_enum_set option; [@ocaml.doc ""]
  foo_enum_map : Shared.Types.foo_enum_map option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_empty_strings_response = {
  empty_string : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_empty_strings_request = {
  empty_string : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_empty_maps_response = { my_map : xml_maps_input_output_map option [@ocaml.doc ""] }
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_empty_maps_request = { my_map : xml_maps_input_output_map option [@ocaml.doc ""] }
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_empty_lists_response = {
  string_list : Shared.Types.string_list option; [@ocaml.doc ""]
  string_set : Shared.Types.string_set option; [@ocaml.doc ""]
  integer_list : Shared.Types.integer_list option; [@ocaml.doc ""]
  boolean_list : Shared.Types.boolean_list option; [@ocaml.doc ""]
  timestamp_list : Shared.Types.timestamp_list option; [@ocaml.doc ""]
  enum_list : Shared.Types.foo_enum_list option; [@ocaml.doc ""]
  int_enum_list : Shared.Types.integer_enum_list option; [@ocaml.doc ""]
  nested_string_list : Shared.Types.nested_string_list option; [@ocaml.doc ""]
  renamed_list_members : renamed_list_members option; [@ocaml.doc ""]
  flattened_list : renamed_list_members option; [@ocaml.doc ""]
  flattened_list2 : renamed_list_members option; [@ocaml.doc ""]
  flattened_list_with_member_namespace : list_with_member_namespace option; [@ocaml.doc ""]
  flattened_list_with_namespace : list_with_namespace option; [@ocaml.doc ""]
  structure_list : structure_list option; [@ocaml.doc ""]
  flattened_structure_list : structure_list option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_empty_lists_request = {
  string_list : Shared.Types.string_list option; [@ocaml.doc ""]
  string_set : Shared.Types.string_set option; [@ocaml.doc ""]
  integer_list : Shared.Types.integer_list option; [@ocaml.doc ""]
  boolean_list : Shared.Types.boolean_list option; [@ocaml.doc ""]
  timestamp_list : Shared.Types.timestamp_list option; [@ocaml.doc ""]
  enum_list : Shared.Types.foo_enum_list option; [@ocaml.doc ""]
  int_enum_list : Shared.Types.integer_enum_list option; [@ocaml.doc ""]
  nested_string_list : Shared.Types.nested_string_list option; [@ocaml.doc ""]
  renamed_list_members : renamed_list_members option; [@ocaml.doc ""]
  flattened_list : renamed_list_members option; [@ocaml.doc ""]
  flattened_list2 : renamed_list_members option; [@ocaml.doc ""]
  flattened_list_with_member_namespace : list_with_member_namespace option; [@ocaml.doc ""]
  flattened_list_with_namespace : list_with_namespace option; [@ocaml.doc ""]
  structure_list : structure_list option; [@ocaml.doc ""]
  flattened_structure_list : structure_list option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_empty_blobs_response = { data : Smaws_Lib.Smithy_api.Types.blob option [@ocaml.doc ""] }
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_empty_blobs_request = { data : Smaws_Lib.Smithy_api.Types.blob option [@ocaml.doc ""] }
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_blobs_response = { data : Smaws_Lib.Smithy_api.Types.blob option [@ocaml.doc ""] }
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_blobs_request = { data : Smaws_Lib.Smithy_api.Types.blob option [@ocaml.doc ""] }
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_attributes_payload_response = {
  foo : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  attr : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_attributes_on_payload_response = {
  payload : xml_attributes_payload_response option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_attributes_payload_request = {
  foo : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  attr : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_attributes_on_payload_request = {
  payload : xml_attributes_payload_request option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_attributes_in_middle_payload_response = {
  foo : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  attr : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  baz : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_attributes_in_middle_response = {
  payload : xml_attributes_in_middle_payload_response option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_attributes_in_middle_payload_request = {
  foo : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  attr : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  baz : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_attributes_in_middle_request = {
  payload : xml_attributes_in_middle_payload_request option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_attributes_response = {
  foo : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  attr : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_attributes_request = {
  foo : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  attr : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type timestamp_format_headers_i_o = {
  member_epoch_seconds : Smaws_Lib.Smithy_api.Types.timestamp option; [@ocaml.doc ""]
  member_http_date : Smaws_Lib.Smithy_api.Types.timestamp option; [@ocaml.doc ""]
  member_date_time : Smaws_Lib.Smithy_api.Types.timestamp option; [@ocaml.doc ""]
  default_format : Smaws_Lib.Smithy_api.Types.timestamp option; [@ocaml.doc ""]
  target_epoch_seconds : Shared.Types.epoch_seconds option; [@ocaml.doc ""]
  target_http_date : Shared.Types.http_date option; [@ocaml.doc ""]
  target_date_time : Shared.Types.date_time option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type simple_scalar_properties_response = {
  foo : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  string_value : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  true_boolean_value : Smaws_Lib.Smithy_api.Types.boolean_ option; [@ocaml.doc ""]
  false_boolean_value : Smaws_Lib.Smithy_api.Types.boolean_ option; [@ocaml.doc ""]
  byte_value : Smaws_Lib.Smithy_api.Types.byte option; [@ocaml.doc ""]
  short_value : Smaws_Lib.Smithy_api.Types.short option; [@ocaml.doc ""]
  integer_value : Smaws_Lib.Smithy_api.Types.integer option; [@ocaml.doc ""]
  long_value : Smaws_Lib.Smithy_api.Types.long option; [@ocaml.doc ""]
  float_value : Smaws_Lib.Smithy_api.Types.float_ option; [@ocaml.doc ""]
  double_value : Smaws_Lib.Smithy_api.Types.double option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type simple_scalar_properties_request = {
  foo : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  string_value : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  true_boolean_value : Smaws_Lib.Smithy_api.Types.boolean_ option; [@ocaml.doc ""]
  false_boolean_value : Smaws_Lib.Smithy_api.Types.boolean_ option; [@ocaml.doc ""]
  byte_value : Smaws_Lib.Smithy_api.Types.byte option; [@ocaml.doc ""]
  short_value : Smaws_Lib.Smithy_api.Types.short option; [@ocaml.doc ""]
  integer_value : Smaws_Lib.Smithy_api.Types.integer option; [@ocaml.doc ""]
  long_value : Smaws_Lib.Smithy_api.Types.long option; [@ocaml.doc ""]
  float_value : Smaws_Lib.Smithy_api.Types.float_ option; [@ocaml.doc ""]
  double_value : Smaws_Lib.Smithy_api.Types.double option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type simple_scalar_properties_input_output = {
  foo : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  string_value : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  true_boolean_value : Smaws_Lib.Smithy_api.Types.boolean_ option; [@ocaml.doc ""]
  false_boolean_value : Smaws_Lib.Smithy_api.Types.boolean_ option; [@ocaml.doc ""]
  byte_value : Smaws_Lib.Smithy_api.Types.byte option; [@ocaml.doc ""]
  short_value : Smaws_Lib.Smithy_api.Types.short option; [@ocaml.doc ""]
  integer_value : Smaws_Lib.Smithy_api.Types.integer option; [@ocaml.doc ""]
  long_value : Smaws_Lib.Smithy_api.Types.long option; [@ocaml.doc ""]
  float_value : Smaws_Lib.Smithy_api.Types.float_ option; [@ocaml.doc ""]
  double_value : Smaws_Lib.Smithy_api.Types.double option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_attributes_input_output = {
  foo : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  attr : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_attributes_middle_member_input_output = {
  foo : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  attr : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
  baz : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_enums_input_output = {
  foo_enum1 : Shared.Types.foo_enum option; [@ocaml.doc ""]
  foo_enum2 : Shared.Types.foo_enum option; [@ocaml.doc ""]
  foo_enum3 : Shared.Types.foo_enum option; [@ocaml.doc ""]
  foo_enum_list : Shared.Types.foo_enum_list option; [@ocaml.doc ""]
  foo_enum_set : Shared.Types.foo_enum_set option; [@ocaml.doc ""]
  foo_enum_map : Shared.Types.foo_enum_map option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_int_enums_input_output = {
  int_enum1 : Shared.Types.integer_enum option; [@ocaml.doc ""]
  int_enum2 : Shared.Types.integer_enum option; [@ocaml.doc ""]
  int_enum3 : Shared.Types.integer_enum option; [@ocaml.doc ""]
  int_enum_list : Shared.Types.integer_enum_list option; [@ocaml.doc ""]
  int_enum_set : Shared.Types.integer_enum_set option; [@ocaml.doc ""]
  int_enum_map : Shared.Types.integer_enum_map option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_lists_input_output = {
  string_list : Shared.Types.string_list option; [@ocaml.doc ""]
  string_set : Shared.Types.string_set option; [@ocaml.doc ""]
  integer_list : Shared.Types.integer_list option; [@ocaml.doc ""]
  boolean_list : Shared.Types.boolean_list option; [@ocaml.doc ""]
  timestamp_list : Shared.Types.timestamp_list option; [@ocaml.doc ""]
  enum_list : Shared.Types.foo_enum_list option; [@ocaml.doc ""]
  int_enum_list : Shared.Types.integer_enum_list option; [@ocaml.doc ""]
  nested_string_list : Shared.Types.nested_string_list option; [@ocaml.doc ""]
  renamed_list_members : renamed_list_members option; [@ocaml.doc ""]
  flattened_list : renamed_list_members option; [@ocaml.doc ""]
  flattened_list2 : renamed_list_members option; [@ocaml.doc ""]
  flattened_list_with_member_namespace : list_with_member_namespace option; [@ocaml.doc ""]
  flattened_list_with_namespace : list_with_namespace option; [@ocaml.doc ""]
  structure_list : structure_list option; [@ocaml.doc ""]
  flattened_structure_list : structure_list option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_map_with_xml_namespace_input_output = {
  my_map : xml_map_with_xml_namespace_input_output_map option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_namespaces_input_output = { nested : xml_namespace_nested option [@ocaml.doc ""] }
[@@ocaml.doc ""] [@@deriving show, eq]

type xml_timestamps_input_output = {
  normal : Smaws_Lib.Smithy_api.Types.timestamp option; [@ocaml.doc ""]
  date_time : Smaws_Lib.Smithy_api.Types.timestamp option; [@ocaml.doc ""]
  date_time_on_target : Shared.Types.date_time option; [@ocaml.doc ""]
  epoch_seconds : Smaws_Lib.Smithy_api.Types.timestamp option; [@ocaml.doc ""]
  epoch_seconds_on_target : Shared.Types.epoch_seconds option; [@ocaml.doc ""]
  http_date : Smaws_Lib.Smithy_api.Types.timestamp option; [@ocaml.doc ""]
  http_date_on_target : Shared.Types.http_date option; [@ocaml.doc ""]
}
[@@ocaml.doc ""] [@@deriving show, eq]
