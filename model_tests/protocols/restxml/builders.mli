open Types

val make_xml_nested_union_struct :
  ?double_value:Smaws_Lib.Smithy_api.Types.double ->
  ?float_value:Smaws_Lib.Smithy_api.Types.float_ ->
  ?long_value:Smaws_Lib.Smithy_api.Types.long ->
  ?integer_value:Smaws_Lib.Smithy_api.Types.integer ->
  ?short_value:Smaws_Lib.Smithy_api.Types.short ->
  ?byte_value:Smaws_Lib.Smithy_api.Types.byte ->
  ?boolean_value:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?string_value:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  xml_nested_union_struct

val make_xml_unions_response : ?union_value:xml_union_shape -> unit -> xml_unions_response
val make_xml_unions_request : ?union_value:xml_union_shape -> unit -> xml_unions_request
val make_xml_timestamps_response : unit -> unit
val make_xml_timestamps_request : unit -> unit

val make_xml_timestamps_input_output :
  ?http_date_on_target:Shared.Types.http_date ->
  ?http_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?epoch_seconds_on_target:Shared.Types.epoch_seconds ->
  ?epoch_seconds:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?date_time_on_target:Shared.Types.date_time ->
  ?date_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?normal:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  xml_timestamps_input_output

val make_xml_namespaces_response : unit -> unit
val make_xml_namespaces_request : unit -> unit

val make_xml_namespace_nested :
  ?values:xml_namespaced_list ->
  ?foo:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  xml_namespace_nested

val make_xml_namespaces_input_output :
  ?nested:xml_namespace_nested -> unit -> xml_namespaces_input_output

val make_xml_maps_xml_name_response :
  ?my_map:xml_maps_xml_name_input_output_map -> unit -> xml_maps_xml_name_response

val make_xml_maps_xml_name_request :
  ?my_map:xml_maps_xml_name_input_output_map -> unit -> xml_maps_xml_name_request

val make_xml_maps_response : ?my_map:xml_maps_input_output_map -> unit -> xml_maps_response
val make_xml_maps_request : ?my_map:xml_maps_input_output_map -> unit -> xml_maps_request
val make_xml_map_with_xml_namespace_response : unit -> unit
val make_xml_map_with_xml_namespace_request : unit -> unit

val make_xml_map_with_xml_namespace_input_output :
  ?my_map:xml_map_with_xml_namespace_input_output_map ->
  unit ->
  xml_map_with_xml_namespace_input_output

val make_xml_lists_response : unit -> unit
val make_xml_lists_request : unit -> unit

val make_structure_list_member :
  ?b:Smaws_Lib.Smithy_api.Types.string_ ->
  ?a:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  structure_list_member

val make_xml_lists_input_output :
  ?flattened_structure_list:structure_list ->
  ?structure_list:structure_list ->
  ?flattened_list_with_namespace:list_with_namespace ->
  ?flattened_list_with_member_namespace:list_with_member_namespace ->
  ?flattened_list2:renamed_list_members ->
  ?flattened_list:renamed_list_members ->
  ?renamed_list_members:renamed_list_members ->
  ?nested_string_list:Shared.Types.nested_string_list ->
  ?int_enum_list:Shared.Types.integer_enum_list ->
  ?enum_list:Shared.Types.foo_enum_list ->
  ?timestamp_list:Shared.Types.timestamp_list ->
  ?boolean_list:Shared.Types.boolean_list ->
  ?integer_list:Shared.Types.integer_list ->
  ?string_set:Shared.Types.string_set ->
  ?string_list:Shared.Types.string_list ->
  unit ->
  xml_lists_input_output

val make_xml_int_enums_response : unit -> unit
val make_xml_int_enums_request : unit -> unit

val make_xml_int_enums_input_output :
  ?int_enum_map:Shared.Types.integer_enum_map ->
  ?int_enum_set:Shared.Types.integer_enum_set ->
  ?int_enum_list:Shared.Types.integer_enum_list ->
  ?int_enum3:Shared.Types.integer_enum ->
  ?int_enum2:Shared.Types.integer_enum ->
  ?int_enum1:Shared.Types.integer_enum ->
  unit ->
  xml_int_enums_input_output

val make_xml_enums_response : unit -> unit
val make_xml_enums_request : unit -> unit

val make_xml_enums_input_output :
  ?foo_enum_map:Shared.Types.foo_enum_map ->
  ?foo_enum_set:Shared.Types.foo_enum_set ->
  ?foo_enum_list:Shared.Types.foo_enum_list ->
  ?foo_enum3:Shared.Types.foo_enum ->
  ?foo_enum2:Shared.Types.foo_enum ->
  ?foo_enum1:Shared.Types.foo_enum ->
  unit ->
  xml_enums_input_output

val make_xml_empty_strings_response :
  ?empty_string:Smaws_Lib.Smithy_api.Types.string_ -> unit -> xml_empty_strings_response

val make_xml_empty_strings_request :
  ?empty_string:Smaws_Lib.Smithy_api.Types.string_ -> unit -> xml_empty_strings_request

val make_xml_empty_maps_response :
  ?my_map:xml_maps_input_output_map -> unit -> xml_empty_maps_response

val make_xml_empty_maps_request :
  ?my_map:xml_maps_input_output_map -> unit -> xml_empty_maps_request

val make_xml_empty_lists_response : unit -> unit
val make_xml_empty_lists_request : unit -> unit

val make_xml_empty_blobs_response :
  ?data:Smaws_Lib.Smithy_api.Types.blob -> unit -> xml_empty_blobs_response

val make_xml_empty_blobs_request :
  ?data:Smaws_Lib.Smithy_api.Types.blob -> unit -> xml_empty_blobs_request

val make_xml_blobs_response : ?data:Smaws_Lib.Smithy_api.Types.blob -> unit -> xml_blobs_response
val make_xml_blobs_request : ?data:Smaws_Lib.Smithy_api.Types.blob -> unit -> xml_blobs_request
val make_xml_attributes_response : unit -> unit
val make_xml_attributes_request : unit -> unit
val make_xml_attributes_payload_response : unit -> unit
val make_xml_attributes_payload_request : unit -> unit

val make_xml_attributes_on_payload_response :
  ?payload:xml_attributes_payload_response -> unit -> xml_attributes_on_payload_response

val make_xml_attributes_on_payload_request :
  ?payload:xml_attributes_payload_request -> unit -> xml_attributes_on_payload_request

val make_xml_attributes_middle_member_input_output :
  ?baz:Smaws_Lib.Smithy_api.Types.string_ ->
  ?attr:Smaws_Lib.Smithy_api.Types.string_ ->
  ?foo:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  xml_attributes_middle_member_input_output

val make_xml_attributes_input_output :
  ?attr:Smaws_Lib.Smithy_api.Types.string_ ->
  ?foo:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  xml_attributes_input_output

val make_xml_attributes_in_middle_payload_response : unit -> unit

val make_xml_attributes_in_middle_response :
  ?payload:xml_attributes_in_middle_payload_response -> unit -> xml_attributes_in_middle_response

val make_xml_attributes_in_middle_payload_request : unit -> unit

val make_xml_attributes_in_middle_request :
  ?payload:xml_attributes_in_middle_payload_request -> unit -> xml_attributes_in_middle_request

val make_timestamp_format_headers_i_o :
  ?target_date_time:Shared.Types.date_time ->
  ?target_http_date:Shared.Types.http_date ->
  ?target_epoch_seconds:Shared.Types.epoch_seconds ->
  ?default_format:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?member_date_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?member_http_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?member_epoch_seconds:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  timestamp_format_headers_i_o

val make_string_payload_input :
  ?payload:Smaws_Lib.Smithy_api.Types.string_ -> unit -> string_payload_input

val make_simple_scalar_properties_response : unit -> unit
val make_simple_scalar_properties_request : unit -> unit

val make_simple_scalar_properties_input_output :
  ?double_value:Smaws_Lib.Smithy_api.Types.double ->
  ?float_value:Smaws_Lib.Smithy_api.Types.float_ ->
  ?long_value:Smaws_Lib.Smithy_api.Types.long ->
  ?integer_value:Smaws_Lib.Smithy_api.Types.integer ->
  ?short_value:Smaws_Lib.Smithy_api.Types.short ->
  ?byte_value:Smaws_Lib.Smithy_api.Types.byte ->
  ?false_boolean_value:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?true_boolean_value:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?string_value:Smaws_Lib.Smithy_api.Types.string_ ->
  ?foo:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  simple_scalar_properties_input_output

val make_recursive_shapes_input_output_nested1 :
  ?nested:recursive_shapes_input_output_nested2 ->
  ?foo:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  recursive_shapes_input_output_nested1

val make_recursive_shapes_input_output_nested2 :
  ?recursive_member:recursive_shapes_input_output_nested1 ->
  ?bar:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  recursive_shapes_input_output_nested2

val make_recursive_shapes_response :
  ?nested:recursive_shapes_input_output_nested1 -> unit -> recursive_shapes_response

val make_recursive_shapes_request :
  ?nested:recursive_shapes_input_output_nested1 -> unit -> recursive_shapes_request

val make_query_precedence_input :
  ?baz:Shared.Types.string_map ->
  ?foo:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  query_precedence_input

val make_query_params_as_string_list_map_input :
  ?foo:Shared.Types.string_list_map ->
  ?qux:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  query_params_as_string_list_map_input

val make_query_idempotency_token_auto_fill_input :
  ?token:Smaws_Lib.Smithy_api.Types.string_ -> unit -> query_idempotency_token_auto_fill_input

val make_put_with_content_encoding_input :
  ?data:Smaws_Lib.Smithy_api.Types.string_ ->
  ?encoding:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  put_with_content_encoding_input

val make_omits_null_serializes_empty_string_input :
  ?empty_string:Smaws_Lib.Smithy_api.Types.string_ ->
  ?null_value:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  omits_null_serializes_empty_string_input

val make_null_and_empty_headers_i_o :
  ?c:Shared.Types.string_list ->
  ?b:Smaws_Lib.Smithy_api.Types.string_ ->
  ?a:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  null_and_empty_headers_i_o

val make_no_input_and_output_output : unit -> unit
val make_nested_xml_map_with_xml_name_response : unit -> unit
val make_nested_xml_map_with_xml_name_request : unit -> unit
val make_nested_xml_maps_response : unit -> unit
val make_nested_xml_maps_request : unit -> unit

val make_input_and_output_with_headers_i_o :
  ?header_enum_list:Shared.Types.foo_enum_list ->
  ?header_enum:Shared.Types.foo_enum ->
  ?header_timestamp_list:Shared.Types.timestamp_list ->
  ?header_boolean_list:Shared.Types.boolean_list ->
  ?header_integer_list:Shared.Types.integer_list ->
  ?header_string_set:Shared.Types.string_set ->
  ?header_string_list:Shared.Types.string_list ->
  ?header_false_bool:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?header_true_bool:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?header_double:Smaws_Lib.Smithy_api.Types.double ->
  ?header_float:Smaws_Lib.Smithy_api.Types.float_ ->
  ?header_long:Smaws_Lib.Smithy_api.Types.long ->
  ?header_integer:Smaws_Lib.Smithy_api.Types.integer ->
  ?header_short:Smaws_Lib.Smithy_api.Types.short ->
  ?header_byte:Smaws_Lib.Smithy_api.Types.byte ->
  ?header_string:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  input_and_output_with_headers_i_o

val make_ignore_query_params_in_response_output :
  ?baz:Smaws_Lib.Smithy_api.Types.string_ -> unit -> ignore_query_params_in_response_output

val make_http_response_code_output :
  ?status:Smaws_Lib.Smithy_api.Types.integer -> unit -> http_response_code_output

val make_http_request_with_labels_and_timestamp_format_input :
  target_date_time:Shared.Types.date_time ->
  target_http_date:Shared.Types.http_date ->
  target_epoch_seconds:Shared.Types.epoch_seconds ->
  default_format:Smaws_Lib.Smithy_api.Types.timestamp ->
  member_date_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  member_http_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  member_epoch_seconds:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  http_request_with_labels_and_timestamp_format_input

val make_http_request_with_labels_input :
  timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  boolean_:Smaws_Lib.Smithy_api.Types.boolean_ ->
  double:Smaws_Lib.Smithy_api.Types.double ->
  float_:Smaws_Lib.Smithy_api.Types.float_ ->
  long:Smaws_Lib.Smithy_api.Types.long ->
  integer:Smaws_Lib.Smithy_api.Types.integer ->
  short:Smaws_Lib.Smithy_api.Types.short ->
  string_:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  http_request_with_labels_input

val make_http_request_with_greedy_label_in_path_input :
  baz:Smaws_Lib.Smithy_api.Types.string_ ->
  foo:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  http_request_with_greedy_label_in_path_input

val make_http_request_with_float_labels_input :
  double:Smaws_Lib.Smithy_api.Types.double ->
  float_:Smaws_Lib.Smithy_api.Types.float_ ->
  unit ->
  http_request_with_float_labels_input

val make_http_prefix_headers_input_output :
  ?foo_map:foo_prefix_headers ->
  ?foo:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  http_prefix_headers_input_output

val make_payload_with_xml_namespace_and_prefix :
  ?name:Smaws_Lib.Smithy_api.Types.string_ -> unit -> payload_with_xml_namespace_and_prefix

val make_http_payload_with_xml_namespace_and_prefix_input_output :
  ?nested:payload_with_xml_namespace_and_prefix ->
  unit ->
  http_payload_with_xml_namespace_and_prefix_input_output

val make_payload_with_xml_namespace :
  ?name:Smaws_Lib.Smithy_api.Types.string_ -> unit -> payload_with_xml_namespace

val make_http_payload_with_xml_namespace_input_output :
  ?nested:payload_with_xml_namespace -> unit -> http_payload_with_xml_namespace_input_output

val make_payload_with_xml_name :
  ?name:Smaws_Lib.Smithy_api.Types.string_ -> unit -> payload_with_xml_name

val make_http_payload_with_xml_name_input_output :
  ?nested:payload_with_xml_name -> unit -> http_payload_with_xml_name_input_output

val make_http_payload_with_union_input_output :
  ?nested:union_payload -> unit -> http_payload_with_union_input_output

val make_nested_payload :
  ?name:Smaws_Lib.Smithy_api.Types.string_ ->
  ?greeting:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  nested_payload

val make_http_payload_with_structure_input_output :
  ?nested:nested_payload -> unit -> http_payload_with_structure_input_output

val make_http_payload_with_member_xml_name_input_output :
  ?nested:payload_with_xml_name -> unit -> http_payload_with_member_xml_name_input_output

val make_http_payload_traits_with_media_type_input_output :
  ?blob:Shared.Types.text_plain_blob ->
  ?foo:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  http_payload_traits_with_media_type_input_output

val make_http_payload_traits_input_output :
  ?blob:Smaws_Lib.Smithy_api.Types.blob ->
  ?foo:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  http_payload_traits_input_output

val make_enum_payload_input : ?payload:string_enum -> unit -> enum_payload_input

val make_http_empty_prefix_headers_output :
  ?specific_header:Smaws_Lib.Smithy_api.Types.string_ ->
  ?prefix_headers:Shared.Types.string_map ->
  unit ->
  http_empty_prefix_headers_output

val make_http_empty_prefix_headers_input :
  ?specific_header:Smaws_Lib.Smithy_api.Types.string_ ->
  ?prefix_headers:Shared.Types.string_map ->
  unit ->
  http_empty_prefix_headers_input

val make_complex_nested_error_data :
  ?foo:Smaws_Lib.Smithy_api.Types.string_ -> unit -> complex_nested_error_data

val make_greeting_with_errors_output :
  ?greeting:Smaws_Lib.Smithy_api.Types.string_ -> unit -> greeting_with_errors_output

val make_fractional_seconds_output :
  ?datetime:Shared.Types.date_time -> unit -> fractional_seconds_output

val make_flattened_xml_map_with_xml_namespace_output :
  ?my_map:flattened_xml_map_with_xml_namespace_output_map ->
  unit ->
  flattened_xml_map_with_xml_namespace_output

val make_flattened_xml_map_with_xml_name_response :
  ?my_map:flattened_xml_map_with_xml_name_input_output_map ->
  unit ->
  flattened_xml_map_with_xml_name_response

val make_flattened_xml_map_with_xml_name_request :
  ?my_map:flattened_xml_map_with_xml_name_input_output_map ->
  unit ->
  flattened_xml_map_with_xml_name_request

val make_flattened_xml_map_response :
  ?my_map:Shared.Types.foo_enum_map -> unit -> flattened_xml_map_response

val make_flattened_xml_map_request :
  ?my_map:Shared.Types.foo_enum_map -> unit -> flattened_xml_map_request

val make_endpoint_with_host_label_operation_request :
  label:Smaws_Lib.Smithy_api.Types.string_ -> unit -> endpoint_with_host_label_operation_request

val make_host_label_header_input :
  account_id:Smaws_Lib.Smithy_api.Types.string_ -> unit -> host_label_header_input

val make_empty_input_and_empty_output_output : unit -> unit
val make_empty_input_and_empty_output_input : unit -> unit

val make_datetime_offsets_output :
  ?datetime:Shared.Types.date_time -> unit -> datetime_offsets_output

val make_content_type_parameters_output : unit -> unit

val make_content_type_parameters_input :
  ?value:Smaws_Lib.Smithy_api.Types.integer -> unit -> content_type_parameters_input

val make_constant_query_string_input :
  hello:Smaws_Lib.Smithy_api.Types.string_ -> unit -> constant_query_string_input

val make_constant_and_variable_query_string_input :
  ?maybe_set:Smaws_Lib.Smithy_api.Types.string_ ->
  ?baz:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  constant_and_variable_query_string_input

val make_body_with_xml_name_input_output :
  ?nested:payload_with_xml_name -> unit -> body_with_xml_name_input_output

val make_all_query_string_types_input :
  ?query_params_map_of_strings:Shared.Types.string_map ->
  ?query_integer_enum_list:Shared.Types.integer_enum_list ->
  ?query_integer_enum:Shared.Types.integer_enum ->
  ?query_enum_list:Shared.Types.foo_enum_list ->
  ?query_enum:Shared.Types.foo_enum ->
  ?query_timestamp_list:Shared.Types.timestamp_list ->
  ?query_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?query_boolean_list:Shared.Types.boolean_list ->
  ?query_boolean:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?query_double_list:Shared.Types.double_list ->
  ?query_double:Smaws_Lib.Smithy_api.Types.double ->
  ?query_float:Smaws_Lib.Smithy_api.Types.float_ ->
  ?query_long:Smaws_Lib.Smithy_api.Types.long ->
  ?query_integer_set:Shared.Types.integer_set ->
  ?query_integer_list:Shared.Types.integer_list ->
  ?query_integer:Smaws_Lib.Smithy_api.Types.integer ->
  ?query_short:Smaws_Lib.Smithy_api.Types.short ->
  ?query_byte:Smaws_Lib.Smithy_api.Types.byte ->
  ?query_string_set:Shared.Types.string_set ->
  ?query_string_list:Shared.Types.string_list ->
  ?query_string:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  all_query_string_types_input

val make_nested_xml_maps_input_output :
  ?flat_nested_map:nested_map -> ?nested_map:nested_map -> unit -> nested_xml_maps_input_output

val make_nested_xml_map_with_xml_name_input_output :
  ?nested_xml_map_with_xml_name_map:nested_xml_map_with_xml_name_map ->
  unit ->
  nested_xml_map_with_xml_name_input_output
