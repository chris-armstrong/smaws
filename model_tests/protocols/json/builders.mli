open Types
val make_union_input_output :
  ?contents:my_union -> unit -> union_input_output
val make_struct_with_json_name :
  ?value:Smaws_Lib.Smithy_api.Types.string_ -> unit -> struct_with_json_name
val make_sparse_nulls_operation_input_output :
  ?sparse_string_map:Shared.Types.sparse_string_map ->
    ?sparse_string_list:Shared.Types.sparse_string_list ->
      unit -> sparse_nulls_operation_input_output
val make_simple_struct :
  ?value:Smaws_Lib.Smithy_api.Types.string_ -> unit -> simple_struct
val make_simple_scalar_properties_input_output :
  ?double_value:Smaws_Lib.Smithy_api.Types.double ->
    ?float_value:Smaws_Lib.Smithy_api.Types.float_ ->
      unit -> simple_scalar_properties_input_output
val make_put_with_content_encoding_input :
  ?data:Smaws_Lib.Smithy_api.Types.string_ ->
    ?encoding:Smaws_Lib.Smithy_api.Types.string_ ->
      unit -> put_with_content_encoding_input
val make_put_and_get_inline_documents_input_output :
  ?inline_document:document ->
    unit -> put_and_get_inline_documents_input_output
val make_operation_with_optional_input_output_output :
  ?value:Smaws_Lib.Smithy_api.Types.string_ ->
    unit -> operation_with_optional_input_output_output
val make_operation_with_optional_input_output_input :
  ?value:Smaws_Lib.Smithy_api.Types.string_ ->
    unit -> operation_with_optional_input_output_input
val make_null_operation_input_output :
  ?string_:Smaws_Lib.Smithy_api.Types.string_ ->
    unit -> null_operation_input_output
val make_empty_struct : unit -> unit
val make_kitchen_sink :
  ?unix_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
    ?timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
      ?struct_with_json_name:struct_with_json_name ->
        ?string_:Smaws_Lib.Smithy_api.Types.string_ ->
          ?simple_struct:simple_struct ->
            ?recursive_struct:kitchen_sink ->
              ?recursive_map:map_of_kitchen_sinks ->
                ?recursive_list:list_of_kitchen_sinks ->
                  ?map_of_structs:map_of_structs ->
                    ?map_of_strings:map_of_strings ->
                      ?map_of_maps:map_of_map_of_strings ->
                        ?map_of_lists_of_strings:map_of_lists_of_strings ->
                          ?long:Smaws_Lib.Smithy_api.Types.long ->
                            ?list_of_structs:list_of_structs ->
                              ?list_of_strings:list_of_strings ->
                                ?list_of_maps_of_strings:list_of_maps_of_strings
                                  ->
                                  ?list_of_lists:list_of_list_of_strings ->
                                    ?json_value:json_value ->
                                      ?iso8601_timestamp:Smaws_Lib.Smithy_api.Types.timestamp
                                        ->
                                        ?integer:Smaws_Lib.Smithy_api.Types.integer
                                          ->
                                          ?httpdate_timestamp:Smaws_Lib.Smithy_api.Types.timestamp
                                            ->
                                            ?float_:Smaws_Lib.Smithy_api.Types.float_
                                              ->
                                              ?empty_struct:empty_struct ->
                                                ?double:Smaws_Lib.Smithy_api.Types.double
                                                  ->
                                                  ?boolean_:Smaws_Lib.Smithy_api.Types.boolean_
                                                    ->
                                                    ?blob:Smaws_Lib.Smithy_api.Types.blob
                                                      -> unit -> kitchen_sink
val make_json_int_enums_input_output :
  ?int_enum_map:Shared.Types.integer_enum_map ->
    ?int_enum_set:Shared.Types.integer_enum_set ->
      ?int_enum_list:Shared.Types.integer_enum_list ->
        ?int_enum3:Shared.Types.integer_enum ->
          ?int_enum2:Shared.Types.integer_enum ->
            ?int_enum1:Shared.Types.integer_enum ->
              unit -> json_int_enums_input_output
val make_json_enums_input_output :
  ?foo_enum_map:Shared.Types.foo_enum_map ->
    ?foo_enum_set:Shared.Types.foo_enum_set ->
      ?foo_enum_list:Shared.Types.foo_enum_list ->
        ?foo_enum3:Shared.Types.foo_enum ->
          ?foo_enum2:Shared.Types.foo_enum ->
            ?foo_enum1:Shared.Types.foo_enum ->
              unit -> json_enums_input_output
val make_complex_nested_error_data :
  ?foo:Smaws_Lib.Smithy_api.Types.string_ ->
    unit -> complex_nested_error_data
val make_greeting_with_errors_output :
  ?greeting:Smaws_Lib.Smithy_api.Types.string_ ->
    unit -> greeting_with_errors_output
val make_fractional_seconds_output :
  ?datetime:Shared.Types.date_time -> unit -> fractional_seconds_output
val make_host_label_input :
  label:Smaws_Lib.Smithy_api.Types.string_ -> unit -> host_label_input
val make_datetime_offsets_output :
  ?datetime:Shared.Types.date_time -> unit -> datetime_offsets_output
val make_content_type_parameters_output : unit -> unit
val make_content_type_parameters_input :
  ?value:Smaws_Lib.Smithy_api.Types.integer ->
    unit -> content_type_parameters_input