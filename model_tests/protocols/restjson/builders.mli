open Types
val make_union_input_output :
  ?contents:my_union -> unit -> union_input_output
val make_top_level : unit -> unit
val make_timestamp_format_headers_i_o :
  ?target_date_time:Shared.Types.date_time ->
    ?target_http_date:Shared.Types.http_date ->
      ?target_epoch_seconds:Shared.Types.epoch_seconds ->
        ?default_format:Smaws_Lib.Smithy_api.Types.timestamp ->
          ?member_date_time:Smaws_Lib.Smithy_api.Types.timestamp ->
            ?member_http_date:Smaws_Lib.Smithy_api.Types.timestamp ->
              ?member_epoch_seconds:Smaws_Lib.Smithy_api.Types.timestamp ->
                unit -> timestamp_format_headers_i_o
val make_test_no_payload_input_output :
  ?test_id:Smaws_Lib.Smithy_api.Types.string_ ->
    unit -> test_no_payload_input_output
val make_payload_config :
  ?data:Smaws_Lib.Smithy_api.Types.integer -> unit -> payload_config
val make_test_payload_structure_input_output :
  ?payload_config:payload_config ->
    ?test_id:Smaws_Lib.Smithy_api.Types.string_ ->
      unit -> test_payload_structure_input_output
val make_test_payload_blob_input_output :
  ?data:Smaws_Lib.Smithy_api.Types.blob ->
    ?content_type:Smaws_Lib.Smithy_api.Types.string_ ->
      unit -> test_payload_blob_input_output
val make_test_config :
  ?timeout:Smaws_Lib.Smithy_api.Types.integer -> unit -> test_config
val make_test_body_structure_input_output :
  ?test_config:test_config ->
    ?test_id:Smaws_Lib.Smithy_api.Types.string_ ->
      unit -> test_body_structure_input_output
val make_structure_list_member :
  ?b:Smaws_Lib.Smithy_api.Types.string_ ->
    ?a:Smaws_Lib.Smithy_api.Types.string_ -> unit -> structure_list_member
val make_string_payload_input :
  ?payload:Smaws_Lib.Smithy_api.Types.string_ -> unit -> string_payload_input
val make_streaming_traits_with_media_type_input_output :
  ?blob:streaming_text_plain_blob ->
    ?foo:Smaws_Lib.Smithy_api.Types.string_ ->
      unit -> streaming_traits_with_media_type_input_output
val make_streaming_traits_require_length_input :
  ?blob:finite_streaming_blob ->
    ?foo:Smaws_Lib.Smithy_api.Types.string_ ->
      unit -> streaming_traits_require_length_input
val make_streaming_traits_input_output :
  ?blob:streaming_blob ->
    ?foo:Smaws_Lib.Smithy_api.Types.string_ ->
      unit -> streaming_traits_input_output
val make_sparse_json_maps_input_output :
  ?sparse_set_map:sparse_set_map ->
    ?sparse_string_map:Shared.Types.sparse_string_map ->
      ?sparse_boolean_map:sparse_boolean_map ->
        ?sparse_number_map:sparse_number_map ->
          ?sparse_struct_map:sparse_struct_map ->
            unit -> sparse_json_maps_input_output
val make_sparse_json_lists_input_output :
  ?sparse_short_list:Shared.Types.sparse_short_list ->
    ?sparse_string_list:Shared.Types.sparse_string_list ->
      unit -> sparse_json_lists_input_output
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
                      unit -> simple_scalar_properties_input_output
val make_response_code_required_output :
  response_code:Smaws_Lib.Smithy_api.Types.integer ->
    unit -> response_code_required_output
val make_response_code_http_fallback_input_output : unit -> unit
val make_recursive_shapes_input_output_nested1 :
  ?nested:recursive_shapes_input_output_nested2 ->
    ?foo:Smaws_Lib.Smithy_api.Types.string_ ->
      unit -> recursive_shapes_input_output_nested1
val make_recursive_shapes_input_output_nested2 :
  ?recursive_member:recursive_shapes_input_output_nested1 ->
    ?bar:Smaws_Lib.Smithy_api.Types.string_ ->
      unit -> recursive_shapes_input_output_nested2
val make_recursive_shapes_input_output :
  ?nested:recursive_shapes_input_output_nested1 ->
    unit -> recursive_shapes_input_output
val make_query_precedence_input :
  ?baz:Shared.Types.string_map ->
    ?foo:Smaws_Lib.Smithy_api.Types.string_ -> unit -> query_precedence_input
val make_query_params_as_string_list_map_input :
  ?foo:Shared.Types.string_list_map ->
    ?qux:Smaws_Lib.Smithy_api.Types.string_ ->
      unit -> query_params_as_string_list_map_input
val make_query_idempotency_token_auto_fill_input :
  ?token:Smaws_Lib.Smithy_api.Types.string_ ->
    unit -> query_idempotency_token_auto_fill_input
val make_put_with_content_encoding_input :
  ?data:Smaws_Lib.Smithy_api.Types.string_ ->
    ?encoding:Smaws_Lib.Smithy_api.Types.string_ ->
      unit -> put_with_content_encoding_input
val make_post_union_with_json_name_output :
  value:union_with_json_name -> unit -> post_union_with_json_name_output
val make_post_union_with_json_name_input :
  ?value:union_with_json_name -> unit -> post_union_with_json_name_input
val make_post_player_action_output :
  action:player_action -> unit -> post_player_action_output
val make_post_player_action_input :
  ?action:player_action -> unit -> post_player_action_input
val make_operation_with_nested_structure_output : unit -> unit
val make_operation_with_nested_structure_input :
  top_level:top_level -> unit -> operation_with_nested_structure_input
val make_operation_with_defaults_output : unit -> unit
val make_defaults : unit -> unit
val make_client_optional_defaults :
  ?member:Smaws_Lib.Smithy_api.Types.integer ->
    unit -> client_optional_defaults
val make_operation_with_defaults_input :
  ?other_top_level_default:Smaws_Lib.Smithy_api.Types.integer ->
    ?top_level_default:Smaws_Lib.Smithy_api.Types.string_ ->
      ?client_optional_defaults:client_optional_defaults ->
        ?defaults:defaults -> unit -> operation_with_defaults_input
val make_omits_serializing_empty_lists_input :
  ?query_integer_enum_list:Shared.Types.integer_enum_list ->
    ?query_enum_list:Shared.Types.foo_enum_list ->
      ?query_timestamp_list:Shared.Types.timestamp_list ->
        ?query_boolean_list:Shared.Types.boolean_list ->
          ?query_double_list:Shared.Types.double_list ->
            ?query_integer_list:Shared.Types.integer_list ->
              ?query_string_list:Shared.Types.string_list ->
                unit -> omits_serializing_empty_lists_input
val make_omits_null_serializes_empty_string_input :
  ?empty_string:Smaws_Lib.Smithy_api.Types.string_ ->
    ?null_value:Smaws_Lib.Smithy_api.Types.string_ ->
      unit -> omits_null_serializes_empty_string_input
val make_null_and_empty_headers_i_o :
  ?c:Shared.Types.string_list ->
    ?b:Smaws_Lib.Smithy_api.Types.string_ ->
      ?a:Smaws_Lib.Smithy_api.Types.string_ ->
        unit -> null_and_empty_headers_i_o
val make_no_input_and_output_output : unit -> unit
val make_media_type_header_output :
  ?json:json_value -> unit -> media_type_header_output
val make_media_type_header_input :
  ?json:json_value -> unit -> media_type_header_input
val make_malformed_union_input :
  ?union:simple_union -> unit -> malformed_union_input
val make_malformed_timestamp_query_http_date_input :
  timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
    unit -> malformed_timestamp_query_http_date_input
val make_malformed_timestamp_query_epoch_input :
  timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
    unit -> malformed_timestamp_query_epoch_input
val make_malformed_timestamp_query_default_input :
  timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
    unit -> malformed_timestamp_query_default_input
val make_malformed_timestamp_path_http_date_input :
  timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
    unit -> malformed_timestamp_path_http_date_input
val make_malformed_timestamp_path_epoch_input :
  timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
    unit -> malformed_timestamp_path_epoch_input
val make_malformed_timestamp_path_default_input :
  timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
    unit -> malformed_timestamp_path_default_input
val make_malformed_timestamp_header_epoch_input :
  timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
    unit -> malformed_timestamp_header_epoch_input
val make_malformed_timestamp_header_default_input :
  timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
    unit -> malformed_timestamp_header_default_input
val make_malformed_timestamp_header_date_time_input :
  timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
    unit -> malformed_timestamp_header_date_time_input
val make_malformed_timestamp_body_http_date_input :
  timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
    unit -> malformed_timestamp_body_http_date_input
val make_malformed_timestamp_body_default_input :
  timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
    unit -> malformed_timestamp_body_default_input
val make_malformed_timestamp_body_date_time_input :
  timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
    unit -> malformed_timestamp_body_date_time_input
val make_malformed_string_input :
  ?blob:json_header_string -> unit -> malformed_string_input
val make_malformed_short_input :
  ?short_in_header:Smaws_Lib.Smithy_api.Types.short ->
    ?short_in_query:Smaws_Lib.Smithy_api.Types.short ->
      ?short_in_body:Smaws_Lib.Smithy_api.Types.short ->
        short_in_path:Smaws_Lib.Smithy_api.Types.short ->
          unit -> malformed_short_input
val make_malformed_request_body_input :
  ?float_:Smaws_Lib.Smithy_api.Types.float_ ->
    ?int_:Smaws_Lib.Smithy_api.Types.integer ->
      unit -> malformed_request_body_input
val make_malformed_map_input :
  ?body_map:simple_map -> unit -> malformed_map_input
val make_malformed_long_input :
  ?long_in_header:Smaws_Lib.Smithy_api.Types.long ->
    ?long_in_query:Smaws_Lib.Smithy_api.Types.long ->
      ?long_in_body:Smaws_Lib.Smithy_api.Types.long ->
        long_in_path:Smaws_Lib.Smithy_api.Types.long ->
          unit -> malformed_long_input
val make_malformed_list_input :
  ?body_list:simple_list -> unit -> malformed_list_input
val make_malformed_integer_input :
  ?integer_in_header:Smaws_Lib.Smithy_api.Types.integer ->
    ?integer_in_query:Smaws_Lib.Smithy_api.Types.integer ->
      ?integer_in_body:Smaws_Lib.Smithy_api.Types.integer ->
        integer_in_path:Smaws_Lib.Smithy_api.Types.integer ->
          unit -> malformed_integer_input
val make_malformed_float_input :
  ?float_in_header:Smaws_Lib.Smithy_api.Types.float_ ->
    ?float_in_query:Smaws_Lib.Smithy_api.Types.float_ ->
      ?float_in_body:Smaws_Lib.Smithy_api.Types.float_ ->
        float_in_path:Smaws_Lib.Smithy_api.Types.float_ ->
          unit -> malformed_float_input
val make_malformed_double_input :
  ?double_in_header:Smaws_Lib.Smithy_api.Types.double ->
    ?double_in_query:Smaws_Lib.Smithy_api.Types.double ->
      ?double_in_body:Smaws_Lib.Smithy_api.Types.double ->
        double_in_path:Smaws_Lib.Smithy_api.Types.double ->
          unit -> malformed_double_input
val make_malformed_content_type_with_payload_input :
  ?payload:Shared.Types.jpeg_blob ->
    unit -> malformed_content_type_with_payload_input
val make_malformed_content_type_without_body_empty_input_input :
  ?header:Smaws_Lib.Smithy_api.Types.string_ ->
    unit -> malformed_content_type_without_body_empty_input_input
val make_malformed_content_type_with_generic_string_input :
  ?payload:Smaws_Lib.Smithy_api.Types.string_ ->
    unit -> malformed_content_type_with_generic_string_input
val make_malformed_byte_input :
  ?byte_in_header:Smaws_Lib.Smithy_api.Types.byte ->
    ?byte_in_query:Smaws_Lib.Smithy_api.Types.byte ->
      ?byte_in_body:Smaws_Lib.Smithy_api.Types.byte ->
        byte_in_path:Smaws_Lib.Smithy_api.Types.byte ->
          unit -> malformed_byte_input
val make_malformed_boolean_input :
  ?boolean_in_header:Smaws_Lib.Smithy_api.Types.boolean_ ->
    ?boolean_in_query:Smaws_Lib.Smithy_api.Types.boolean_ ->
      ?boolean_in_body:Smaws_Lib.Smithy_api.Types.boolean_ ->
        boolean_in_path:Smaws_Lib.Smithy_api.Types.boolean_ ->
          unit -> malformed_boolean_input
val make_malformed_blob_input :
  ?blob:Smaws_Lib.Smithy_api.Types.blob -> unit -> malformed_blob_input
val make_malformed_accept_with_payload_output :
  ?payload:Shared.Types.jpeg_blob ->
    unit -> malformed_accept_with_payload_output
val make_malformed_accept_with_generic_string_output :
  ?payload:Smaws_Lib.Smithy_api.Types.string_ ->
    unit -> malformed_accept_with_generic_string_output
val make_json_timestamps_input_output :
  ?http_date_on_target:Shared.Types.http_date ->
    ?http_date:Smaws_Lib.Smithy_api.Types.timestamp ->
      ?epoch_seconds_on_target:Shared.Types.epoch_seconds ->
        ?epoch_seconds:Smaws_Lib.Smithy_api.Types.timestamp ->
          ?date_time_on_target:Shared.Types.date_time ->
            ?date_time:Smaws_Lib.Smithy_api.Types.timestamp ->
              ?normal:Smaws_Lib.Smithy_api.Types.timestamp ->
                unit -> json_timestamps_input_output
val make_json_maps_input_output :
  ?dense_set_map:dense_set_map ->
    ?dense_string_map:dense_string_map ->
      ?dense_boolean_map:dense_boolean_map ->
        ?dense_number_map:dense_number_map ->
          ?dense_struct_map:dense_struct_map ->
            unit -> json_maps_input_output
val make_json_lists_input_output :
  ?structure_list:structure_list ->
    ?nested_string_list:Shared.Types.nested_string_list ->
      ?int_enum_list:Shared.Types.integer_enum_list ->
        ?enum_list:Shared.Types.foo_enum_list ->
          ?timestamp_list:Shared.Types.timestamp_list ->
            ?boolean_list:Shared.Types.boolean_list ->
              ?integer_list:Shared.Types.integer_list ->
                ?string_set:Shared.Types.string_set ->
                  ?string_list:Shared.Types.string_list ->
                    unit -> json_lists_input_output
val make_json_int_enums_input_output :
  ?integer_enum_map:Shared.Types.integer_enum_map ->
    ?integer_enum_set:Shared.Types.integer_enum_set ->
      ?integer_enum_list:Shared.Types.integer_enum_list ->
        ?integer_enum3:Shared.Types.integer_enum ->
          ?integer_enum2:Shared.Types.integer_enum ->
            ?integer_enum1:Shared.Types.integer_enum ->
              unit -> json_int_enums_input_output
val make_json_enums_input_output :
  ?foo_enum_map:Shared.Types.foo_enum_map ->
    ?foo_enum_set:Shared.Types.foo_enum_set ->
      ?foo_enum_list:Shared.Types.foo_enum_list ->
        ?foo_enum3:Shared.Types.foo_enum ->
          ?foo_enum2:Shared.Types.foo_enum ->
            ?foo_enum1:Shared.Types.foo_enum ->
              unit -> json_enums_input_output
val make_json_blobs_input_output :
  ?data:Smaws_Lib.Smithy_api.Types.blob -> unit -> json_blobs_input_output
val make_input_and_output_with_headers_i_o :
  ?header_integer_enum_list:Shared.Types.integer_enum_list ->
    ?header_integer_enum:Shared.Types.integer_enum ->
      ?header_enum_list:Shared.Types.foo_enum_list ->
        ?header_enum:Shared.Types.foo_enum ->
          ?header_timestamp_list:Shared.Types.timestamp_list ->
            ?header_boolean_list:Shared.Types.boolean_list ->
              ?header_integer_list:Shared.Types.integer_list ->
                ?header_string_set:Shared.Types.string_set ->
                  ?header_string_list:Shared.Types.string_list ->
                    ?header_false_bool:Smaws_Lib.Smithy_api.Types.boolean_ ->
                      ?header_true_bool:Smaws_Lib.Smithy_api.Types.boolean_
                        ->
                        ?header_double:Smaws_Lib.Smithy_api.Types.double ->
                          ?header_float:Smaws_Lib.Smithy_api.Types.float_ ->
                            ?header_long:Smaws_Lib.Smithy_api.Types.long ->
                              ?header_integer:Smaws_Lib.Smithy_api.Types.integer
                                ->
                                ?header_short:Smaws_Lib.Smithy_api.Types.short
                                  ->
                                  ?header_byte:Smaws_Lib.Smithy_api.Types.byte
                                    ->
                                    ?header_string:Smaws_Lib.Smithy_api.Types.string_
                                      ->
                                      unit ->
                                        input_and_output_with_headers_i_o
val make_ignore_query_params_in_response_output :
  ?baz:Smaws_Lib.Smithy_api.Types.string_ ->
    unit -> ignore_query_params_in_response_output
val make_http_response_code_output :
  ?status:Smaws_Lib.Smithy_api.Types.integer ->
    unit -> http_response_code_output
val make_http_request_with_regex_literal_input :
  str:Smaws_Lib.Smithy_api.Types.string_ ->
    unit -> http_request_with_regex_literal_input
val make_http_request_with_labels_and_timestamp_format_input :
  target_date_time:Shared.Types.date_time ->
    target_http_date:Shared.Types.http_date ->
      target_epoch_seconds:Shared.Types.epoch_seconds ->
        default_format:Smaws_Lib.Smithy_api.Types.timestamp ->
          member_date_time:Smaws_Lib.Smithy_api.Types.timestamp ->
            member_http_date:Smaws_Lib.Smithy_api.Types.timestamp ->
              member_epoch_seconds:Smaws_Lib.Smithy_api.Types.timestamp ->
                unit -> http_request_with_labels_and_timestamp_format_input
val make_http_request_with_labels_input :
  timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
    boolean_:Smaws_Lib.Smithy_api.Types.boolean_ ->
      double:Smaws_Lib.Smithy_api.Types.double ->
        float_:Smaws_Lib.Smithy_api.Types.float_ ->
          long:Smaws_Lib.Smithy_api.Types.long ->
            integer:Smaws_Lib.Smithy_api.Types.integer ->
              short:Smaws_Lib.Smithy_api.Types.short ->
                string_:Smaws_Lib.Smithy_api.Types.string_ ->
                  unit -> http_request_with_labels_input
val make_http_request_with_greedy_label_in_path_input :
  baz:Smaws_Lib.Smithy_api.Types.string_ ->
    foo:Smaws_Lib.Smithy_api.Types.string_ ->
      unit -> http_request_with_greedy_label_in_path_input
val make_http_request_with_float_labels_input :
  double:Smaws_Lib.Smithy_api.Types.double ->
    float_:Smaws_Lib.Smithy_api.Types.float_ ->
      unit -> http_request_with_float_labels_input
val make_http_prefix_headers_in_response_output :
  ?prefix_headers:Shared.Types.string_map ->
    unit -> http_prefix_headers_in_response_output
val make_http_prefix_headers_in_response_input : unit -> unit
val make_http_prefix_headers_output :
  ?foo_map:Shared.Types.string_map ->
    ?foo:Smaws_Lib.Smithy_api.Types.string_ ->
      unit -> http_prefix_headers_output
val make_http_prefix_headers_input :
  ?foo_map:Shared.Types.string_map ->
    ?foo:Smaws_Lib.Smithy_api.Types.string_ ->
      unit -> http_prefix_headers_input
val make_http_payload_with_union_input_output :
  ?nested:union_payload -> unit -> http_payload_with_union_input_output
val make_nested_payload :
  ?name:Smaws_Lib.Smithy_api.Types.string_ ->
    ?greeting:Smaws_Lib.Smithy_api.Types.string_ -> unit -> nested_payload
val make_http_payload_with_structure_input_output :
  ?nested:nested_payload -> unit -> http_payload_with_structure_input_output
val make_http_payload_traits_with_media_type_input_output :
  ?blob:Shared.Types.text_plain_blob ->
    ?foo:Smaws_Lib.Smithy_api.Types.string_ ->
      unit -> http_payload_traits_with_media_type_input_output
val make_http_payload_traits_input_output :
  ?blob:Smaws_Lib.Smithy_api.Types.blob ->
    ?foo:Smaws_Lib.Smithy_api.Types.string_ ->
      unit -> http_payload_traits_input_output
val make_enum_payload_input :
  ?payload:string_enum -> unit -> enum_payload_input
val make_http_empty_prefix_headers_output :
  ?specific_header:Smaws_Lib.Smithy_api.Types.string_ ->
    ?prefix_headers:Shared.Types.string_map ->
      unit -> http_empty_prefix_headers_output
val make_http_empty_prefix_headers_input :
  ?specific_header:Smaws_Lib.Smithy_api.Types.string_ ->
    ?prefix_headers:Shared.Types.string_map ->
      unit -> http_empty_prefix_headers_input
val make_http_checksum_required_input_output :
  ?foo:Smaws_Lib.Smithy_api.Types.string_ ->
    unit -> http_checksum_required_input_output
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
val make_empty_input_and_empty_output_output : unit -> unit
val make_empty_input_and_empty_output_input : unit -> unit
val make_document_type_as_payload_input_output :
  ?document_value:document -> unit -> document_type_as_payload_input_output
val make_document_type_as_map_value_input_output :
  ?doc_valued_map:document_valued_map ->
    unit -> document_type_as_map_value_input_output
val make_document_type_input_output :
  ?document_value:document ->
    ?string_value:Smaws_Lib.Smithy_api.Types.string_ ->
      unit -> document_type_input_output
val make_datetime_offsets_output :
  ?datetime:Shared.Types.date_time -> unit -> datetime_offsets_output
val make_content_type_parameters_output : unit -> unit
val make_content_type_parameters_input :
  ?value:Smaws_Lib.Smithy_api.Types.integer ->
    unit -> content_type_parameters_input
val make_constant_query_string_input :
  hello:Smaws_Lib.Smithy_api.Types.string_ ->
    unit -> constant_query_string_input
val make_constant_and_variable_query_string_input :
  ?maybe_set:Smaws_Lib.Smithy_api.Types.string_ ->
    ?baz:Smaws_Lib.Smithy_api.Types.string_ ->
      unit -> constant_and_variable_query_string_input
val make_all_query_string_types_input :
  ?query_params_map_of_string_list:Shared.Types.string_list_map ->
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
                              ?query_integer_list:Shared.Types.integer_list
                                ->
                                ?query_integer:Smaws_Lib.Smithy_api.Types.integer
                                  ->
                                  ?query_short:Smaws_Lib.Smithy_api.Types.short
                                    ->
                                    ?query_byte:Smaws_Lib.Smithy_api.Types.byte
                                      ->
                                      ?query_string_set:Shared.Types.string_set
                                        ->
                                        ?query_string_list:Shared.Types.string_list
                                          ->
                                          ?query_string:Smaws_Lib.Smithy_api.Types.string_
                                            ->
                                            unit ->
                                              all_query_string_types_input
val make_farewell :
  ?phrase:Smaws_Lib.Smithy_api.Types.string_ -> unit -> farewell
val make_dialog :
  ?farewell:farewell ->
    ?greeting:Smaws_Lib.Smithy_api.Types.string_ ->
      ?language:Smaws_Lib.Smithy_api.Types.string_ -> unit -> dialog
val make_nested_defaults_mixin :
  ?dialog_map:dialog_map ->
    ?dialog_list:dialog_list ->
      dialog:dialog -> unit -> nested_defaults_mixin
val make_defaults_mixin :
  ?zero_double:Smaws_Lib.Smithy_api.Types.double ->
    ?zero_float:Smaws_Lib.Smithy_api.Types.float_ ->
      ?zero_long:Smaws_Lib.Smithy_api.Types.long ->
        ?zero_integer:Smaws_Lib.Smithy_api.Types.integer ->
          ?zero_short:Smaws_Lib.Smithy_api.Types.short ->
            ?zero_byte:Smaws_Lib.Smithy_api.Types.byte ->
              ?empty_blob:Smaws_Lib.Smithy_api.Types.blob ->
                ?false_boolean:Smaws_Lib.Smithy_api.Types.boolean_ ->
                  ?empty_string:Smaws_Lib.Smithy_api.Types.string_ ->
                    ?default_int_enum:test_int_enum ->
                      ?default_enum:test_enum ->
                        ?default_map:test_string_map ->
                          ?default_double:Smaws_Lib.Smithy_api.Types.double
                            ->
                            ?default_float:Smaws_Lib.Smithy_api.Types.float_
                              ->
                              ?default_long:Smaws_Lib.Smithy_api.Types.long
                                ->
                                ?default_integer:Smaws_Lib.Smithy_api.Types.integer
                                  ->
                                  ?default_short:Smaws_Lib.Smithy_api.Types.short
                                    ->
                                    ?default_byte:Smaws_Lib.Smithy_api.Types.byte
                                      ->
                                      ?default_blob:Smaws_Lib.Smithy_api.Types.blob
                                        ->
                                        ?default_timestamp:Smaws_Lib.Smithy_api.Types.timestamp
                                          ->
                                          ?default_null_document:document ->
                                            ?default_document_list:document
                                              ->
                                              ?default_document_boolean:document
                                                ->
                                                ?default_document_string:document
                                                  ->
                                                  ?default_document_map:document
                                                    ->
                                                    ?default_list:test_string_list
                                                      ->
                                                      ?default_boolean:Smaws_Lib.Smithy_api.Types.boolean_
                                                        ->
                                                        ?default_string:Smaws_Lib.Smithy_api.Types.string_
                                                          ->
                                                          unit ->
                                                            defaults_mixin