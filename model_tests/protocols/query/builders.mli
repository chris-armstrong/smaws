open Types

val make_xml_timestamps_output :
  ?normal:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?date_time:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?date_time_on_target:Shared.Types.date_time ->
  ?epoch_seconds:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?epoch_seconds_on_target:Shared.Types.epoch_seconds ->
  ?http_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?http_date_on_target:Shared.Types.http_date ->
  unit ->
  xml_timestamps_output

val make_xml_namespace_nested :
  ?foo:Smaws_Lib.Smithy_api.Types.string_ ->
  ?values:xml_namespaced_list ->
  unit ->
  xml_namespace_nested

val make_xml_namespaces_output : ?nested:xml_namespace_nested -> unit -> xml_namespaces_output

val make_xml_maps_xml_name_output :
  ?my_map:xml_maps_xml_name_output_map -> unit -> xml_maps_xml_name_output

val make_xml_maps_output : ?my_map:xml_maps_output_map -> unit -> xml_maps_output

val make_structure_list_member :
  ?a:Smaws_Lib.Smithy_api.Types.string_ ->
  ?b:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  structure_list_member

val make_xml_lists_output :
  ?string_list:Shared.Types.string_list ->
  ?string_set:Shared.Types.string_set ->
  ?integer_list:Shared.Types.integer_list ->
  ?boolean_list:Shared.Types.boolean_list ->
  ?timestamp_list:Shared.Types.timestamp_list ->
  ?enum_list:Shared.Types.foo_enum_list ->
  ?int_enum_list:Shared.Types.integer_enum_list ->
  ?nested_string_list:Shared.Types.nested_string_list ->
  ?renamed_list_members:renamed_list_members ->
  ?flattened_list:renamed_list_members ->
  ?flattened_list2:renamed_list_members ->
  ?flattened_list_with_member_namespace:list_with_member_namespace ->
  ?flattened_list_with_namespace:list_with_namespace ->
  ?structure_list:structure_list ->
  unit ->
  xml_lists_output

val make_xml_int_enums_output :
  ?int_enum1:Shared.Types.integer_enum ->
  ?int_enum2:Shared.Types.integer_enum ->
  ?int_enum3:Shared.Types.integer_enum ->
  ?int_enum_list:Shared.Types.integer_enum_list ->
  ?int_enum_set:Shared.Types.integer_enum_set ->
  ?int_enum_map:Shared.Types.integer_enum_map ->
  unit ->
  xml_int_enums_output

val make_xml_enums_output :
  ?foo_enum1:Shared.Types.foo_enum ->
  ?foo_enum2:Shared.Types.foo_enum ->
  ?foo_enum3:Shared.Types.foo_enum ->
  ?foo_enum_list:Shared.Types.foo_enum_list ->
  ?foo_enum_set:Shared.Types.foo_enum_set ->
  ?foo_enum_map:Shared.Types.foo_enum_map ->
  unit ->
  xml_enums_output

val make_xml_blobs_output : ?data:Smaws_Lib.Smithy_api.Types.blob -> unit -> xml_blobs_output

val make_simple_scalar_xml_properties_output :
  ?string_value:Smaws_Lib.Smithy_api.Types.string_ ->
  ?empty_string_value:Smaws_Lib.Smithy_api.Types.string_ ->
  ?true_boolean_value:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?false_boolean_value:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?byte_value:Smaws_Lib.Smithy_api.Types.byte ->
  ?short_value:Smaws_Lib.Smithy_api.Types.short ->
  ?integer_value:Smaws_Lib.Smithy_api.Types.integer ->
  ?long_value:Smaws_Lib.Smithy_api.Types.long ->
  ?float_value:Smaws_Lib.Smithy_api.Types.float_ ->
  ?double_value:Smaws_Lib.Smithy_api.Types.double ->
  unit ->
  simple_scalar_xml_properties_output

val make_simple_input_params_input :
  ?foo:Smaws_Lib.Smithy_api.Types.string_ ->
  ?bar:Smaws_Lib.Smithy_api.Types.string_ ->
  ?baz:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?bam:Smaws_Lib.Smithy_api.Types.integer ->
  ?float_value:Smaws_Lib.Smithy_api.Types.float_ ->
  ?boo:Smaws_Lib.Smithy_api.Types.double ->
  ?qux:Smaws_Lib.Smithy_api.Types.blob ->
  ?foo_enum:Shared.Types.foo_enum ->
  ?integer_enum:Shared.Types.integer_enum ->
  unit ->
  simple_input_params_input

val make_recursive_xml_shapes_output_nested2 :
  ?bar:Smaws_Lib.Smithy_api.Types.string_ ->
  ?recursive_member:recursive_xml_shapes_output_nested1 ->
  unit ->
  recursive_xml_shapes_output_nested2

val make_recursive_xml_shapes_output_nested1 :
  ?foo:Smaws_Lib.Smithy_api.Types.string_ ->
  ?nested:recursive_xml_shapes_output_nested2 ->
  unit ->
  recursive_xml_shapes_output_nested1

val make_recursive_xml_shapes_output :
  ?nested:recursive_xml_shapes_output_nested1 -> unit -> recursive_xml_shapes_output

val make_query_timestamps_input :
  ?normal_format:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?epoch_member:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?epoch_target:Shared.Types.epoch_seconds ->
  unit ->
  query_timestamps_input

val make_nested_struct_with_map : ?map_arg:Shared.Types.string_map -> unit -> nested_struct_with_map

val make_query_maps_input :
  ?map_arg:Shared.Types.string_map ->
  ?renamed_map_arg:Shared.Types.string_map ->
  ?complex_map_arg:complex_map ->
  ?map_with_xml_member_name:map_with_xml_name ->
  ?flattened_map:Shared.Types.string_map ->
  ?flattened_map_with_xml_name:map_with_xml_name ->
  ?map_of_lists:map_of_lists ->
  ?nested_struct_with_map:nested_struct_with_map ->
  unit ->
  query_maps_input

val make_nested_struct_with_list :
  ?list_arg:Shared.Types.string_list -> unit -> nested_struct_with_list

val make_query_lists_input :
  ?list_arg:Shared.Types.string_list ->
  ?complex_list_arg:Shared.Types.greeting_list ->
  ?flattened_list_arg:Shared.Types.string_list ->
  ?list_arg_with_xml_name_member:list_with_xml_name ->
  ?flattened_list_arg_with_xml_name:list_with_xml_name ->
  ?nested_with_list:nested_struct_with_list ->
  unit ->
  query_lists_input

val make_query_idempotency_token_auto_fill_input :
  ?token:Smaws_Lib.Smithy_api.Types.string_ -> unit -> query_idempotency_token_auto_fill_input

val make_put_with_content_encoding_input :
  ?encoding:Smaws_Lib.Smithy_api.Types.string_ ->
  ?data:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  put_with_content_encoding_input

val make_no_input_and_output_output : unit -> unit
val make_no_input_and_output_input : unit -> unit

val make_struct_arg :
  ?string_arg:Smaws_Lib.Smithy_api.Types.string_ ->
  ?other_arg:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?recursive_arg:struct_arg ->
  unit ->
  struct_arg

val make_nested_structures_input : ?nested:struct_arg -> unit -> nested_structures_input

val make_ignores_wrapping_xml_name_output :
  ?foo:Smaws_Lib.Smithy_api.Types.string_ -> unit -> ignores_wrapping_xml_name_output

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

val make_flattened_xml_map_with_xml_name_output :
  ?my_map:flattened_xml_map_with_xml_name_output_map ->
  unit ->
  flattened_xml_map_with_xml_name_output

val make_flattened_xml_map_output :
  ?my_map:Shared.Types.foo_enum_map -> unit -> flattened_xml_map_output

val make_host_label_input : label:Smaws_Lib.Smithy_api.Types.string_ -> unit -> host_label_input
val make_empty_input_and_empty_output_output : unit -> unit
val make_empty_input_and_empty_output_input : unit -> unit

val make_datetime_offsets_output :
  ?datetime:Shared.Types.date_time -> unit -> datetime_offsets_output
