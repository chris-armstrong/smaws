open Types

let make_all_query_string_types_input
    ?query_string:(query_string_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?query_string_list:(query_string_list_ : Shared.Types.string_list option)
    ?query_string_set:(query_string_set_ : Shared.Types.string_set option)
    ?query_byte:(query_byte_ : Smaws_Lib.Smithy_api.Types.byte option)
    ?query_short:(query_short_ : Smaws_Lib.Smithy_api.Types.short option)
    ?query_integer:(query_integer_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?query_integer_list:(query_integer_list_ : Shared.Types.integer_list option)
    ?query_integer_set:(query_integer_set_ : Shared.Types.integer_set option)
    ?query_long:(query_long_ : Smaws_Lib.Smithy_api.Types.long option)
    ?query_float:(query_float_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?query_double:(query_double_ : Smaws_Lib.Smithy_api.Types.double option)
    ?query_double_list:(query_double_list_ : Shared.Types.double_list option)
    ?query_boolean:(query_boolean_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?query_boolean_list:(query_boolean_list_ : Shared.Types.boolean_list option)
    ?query_timestamp:(query_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?query_timestamp_list:(query_timestamp_list_ : Shared.Types.timestamp_list option)
    ?query_enum:(query_enum_ : Shared.Types.foo_enum option)
    ?query_enum_list:(query_enum_list_ : Shared.Types.foo_enum_list option)
    ?query_integer_enum:(query_integer_enum_ : Shared.Types.integer_enum option)
    ?query_integer_enum_list:(query_integer_enum_list_ : Shared.Types.integer_enum_list option)
    ?query_params_map_of_strings:(query_params_map_of_strings_ : Shared.Types.string_map option) ()
    =
  ({
     query_string = query_string_;
     query_string_list = query_string_list_;
     query_string_set = query_string_set_;
     query_byte = query_byte_;
     query_short = query_short_;
     query_integer = query_integer_;
     query_integer_list = query_integer_list_;
     query_integer_set = query_integer_set_;
     query_long = query_long_;
     query_float = query_float_;
     query_double = query_double_;
     query_double_list = query_double_list_;
     query_boolean = query_boolean_;
     query_boolean_list = query_boolean_list_;
     query_timestamp = query_timestamp_;
     query_timestamp_list = query_timestamp_list_;
     query_enum = query_enum_;
     query_enum_list = query_enum_list_;
     query_integer_enum = query_integer_enum_;
     query_integer_enum_list = query_integer_enum_list_;
     query_params_map_of_strings = query_params_map_of_strings_;
   }
    : all_query_string_types_input)

let make_payload_with_xml_name ?name:(name_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ name = name_ } : payload_with_xml_name)

let make_body_with_xml_name_input_output ?nested:(nested_ : payload_with_xml_name option) () =
  ({ nested = nested_ } : body_with_xml_name_input_output)

let make_complex_nested_error_data ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ foo = foo_ } : complex_nested_error_data)

let make_constant_and_variable_query_string_input
    ?baz:(baz_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?maybe_set:(maybe_set_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ baz = baz_; maybe_set = maybe_set_ } : constant_and_variable_query_string_input)

let make_constant_query_string_input ~hello:(hello_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ hello = hello_ } : constant_query_string_input)

let make_content_type_parameters_output () = (() : unit)

let make_content_type_parameters_input ?value:(value_ : Smaws_Lib.Smithy_api.Types.integer option)
    () =
  ({ value = value_ } : content_type_parameters_input)

let make_datetime_offsets_output ?datetime:(datetime_ : Shared.Types.date_time option) () =
  ({ datetime = datetime_ } : datetime_offsets_output)

let make_empty_input_and_empty_output_output () = (() : unit)
let make_empty_input_and_empty_output_input () = (() : unit)

let make_host_label_header_input ~account_id:(account_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ account_id = account_id_ } : host_label_header_input)

let make_endpoint_with_host_label_operation_request
    ~label:(label_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ label = label_ } : endpoint_with_host_label_operation_request)

let make_enum_payload_input ?payload:(payload_ : string_enum option) () =
  ({ payload = payload_ } : enum_payload_input)

let make_flattened_xml_map_response ?my_map:(my_map_ : Shared.Types.foo_enum_map option) () =
  ({ my_map = my_map_ } : flattened_xml_map_response)

let make_flattened_xml_map_request ?my_map:(my_map_ : Shared.Types.foo_enum_map option) () =
  ({ my_map = my_map_ } : flattened_xml_map_request)

let make_flattened_xml_map_with_xml_name_response
    ?my_map:(my_map_ : flattened_xml_map_with_xml_name_input_output_map option) () =
  ({ my_map = my_map_ } : flattened_xml_map_with_xml_name_response)

let make_flattened_xml_map_with_xml_name_request
    ?my_map:(my_map_ : flattened_xml_map_with_xml_name_input_output_map option) () =
  ({ my_map = my_map_ } : flattened_xml_map_with_xml_name_request)

let make_flattened_xml_map_with_xml_namespace_output
    ?my_map:(my_map_ : flattened_xml_map_with_xml_namespace_output_map option) () =
  ({ my_map = my_map_ } : flattened_xml_map_with_xml_namespace_output)

let make_fractional_seconds_output ?datetime:(datetime_ : Shared.Types.date_time option) () =
  ({ datetime = datetime_ } : fractional_seconds_output)

let make_greeting_with_errors_output
    ?greeting:(greeting_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ greeting = greeting_ } : greeting_with_errors_output)

let make_http_empty_prefix_headers_output
    ?prefix_headers:(prefix_headers_ : Shared.Types.string_map option)
    ?specific_header:(specific_header_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ prefix_headers = prefix_headers_; specific_header = specific_header_ }
    : http_empty_prefix_headers_output)

let make_http_empty_prefix_headers_input
    ?prefix_headers:(prefix_headers_ : Shared.Types.string_map option)
    ?specific_header:(specific_header_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ prefix_headers = prefix_headers_; specific_header = specific_header_ }
    : http_empty_prefix_headers_input)

let make_http_payload_traits_input_output ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?blob:(blob_ : Smaws_Lib.Smithy_api.Types.blob option) () =
  ({ foo = foo_; blob = blob_ } : http_payload_traits_input_output)

let make_http_payload_traits_with_media_type_input_output
    ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?blob:(blob_ : Shared.Types.text_plain_blob option) () =
  ({ foo = foo_; blob = blob_ } : http_payload_traits_with_media_type_input_output)

let make_http_payload_with_member_xml_name_input_output
    ?nested:(nested_ : payload_with_xml_name option) () =
  ({ nested = nested_ } : http_payload_with_member_xml_name_input_output)

let make_nested_payload ?greeting:(greeting_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?name:(name_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ greeting = greeting_; name = name_ } : nested_payload)

let make_http_payload_with_structure_input_output ?nested:(nested_ : nested_payload option) () =
  ({ nested = nested_ } : http_payload_with_structure_input_output)

let make_http_payload_with_union_input_output ?nested:(nested_ : union_payload option) () =
  ({ nested = nested_ } : http_payload_with_union_input_output)

let make_http_payload_with_xml_name_input_output ?nested:(nested_ : payload_with_xml_name option) ()
    =
  ({ nested = nested_ } : http_payload_with_xml_name_input_output)

let make_payload_with_xml_namespace ?name:(name_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ name = name_ } : payload_with_xml_namespace)

let make_http_payload_with_xml_namespace_input_output
    ?nested:(nested_ : payload_with_xml_namespace option) () =
  ({ nested = nested_ } : http_payload_with_xml_namespace_input_output)

let make_payload_with_xml_namespace_and_prefix
    ?name:(name_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ name = name_ } : payload_with_xml_namespace_and_prefix)

let make_http_payload_with_xml_namespace_and_prefix_input_output
    ?nested:(nested_ : payload_with_xml_namespace_and_prefix option) () =
  ({ nested = nested_ } : http_payload_with_xml_namespace_and_prefix_input_output)

let make_http_prefix_headers_input_output ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?foo_map:(foo_map_ : foo_prefix_headers option) () =
  ({ foo = foo_; foo_map = foo_map_ } : http_prefix_headers_input_output)

let make_http_request_with_float_labels_input ~float_:(float__ : Smaws_Lib.Smithy_api.Types.float_)
    ~double:(double_ : Smaws_Lib.Smithy_api.Types.double) () =
  ({ float_ = float__; double = double_ } : http_request_with_float_labels_input)

let make_http_request_with_greedy_label_in_path_input
    ~foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_)
    ~baz:(baz_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ foo = foo_; baz = baz_ } : http_request_with_greedy_label_in_path_input)

let make_http_request_with_labels_input ~string_:(string__ : Smaws_Lib.Smithy_api.Types.string_)
    ~short:(short_ : Smaws_Lib.Smithy_api.Types.short)
    ~integer:(integer_ : Smaws_Lib.Smithy_api.Types.integer)
    ~long:(long_ : Smaws_Lib.Smithy_api.Types.long)
    ~float_:(float__ : Smaws_Lib.Smithy_api.Types.float_)
    ~double:(double_ : Smaws_Lib.Smithy_api.Types.double)
    ~boolean_:(boolean__ : Smaws_Lib.Smithy_api.Types.boolean_)
    ~timestamp:(timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp) () =
  ({
     string_ = string__;
     short = short_;
     integer = integer_;
     long = long_;
     float_ = float__;
     double = double_;
     boolean_ = boolean__;
     timestamp = timestamp_;
   }
    : http_request_with_labels_input)

let make_http_request_with_labels_and_timestamp_format_input
    ~member_epoch_seconds:(member_epoch_seconds_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~member_http_date:(member_http_date_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~member_date_time:(member_date_time_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~default_format:(default_format_ : Smaws_Lib.Smithy_api.Types.timestamp)
    ~target_epoch_seconds:(target_epoch_seconds_ : Shared.Types.epoch_seconds)
    ~target_http_date:(target_http_date_ : Shared.Types.http_date)
    ~target_date_time:(target_date_time_ : Shared.Types.date_time) () =
  ({
     member_epoch_seconds = member_epoch_seconds_;
     member_http_date = member_http_date_;
     member_date_time = member_date_time_;
     default_format = default_format_;
     target_epoch_seconds = target_epoch_seconds_;
     target_http_date = target_http_date_;
     target_date_time = target_date_time_;
   }
    : http_request_with_labels_and_timestamp_format_input)

let make_http_response_code_output ?status:(status_ : Smaws_Lib.Smithy_api.Types.integer option) ()
    =
  ({ status = status_ } : http_response_code_output)

let make_string_payload_input ?payload:(payload_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ payload = payload_ } : string_payload_input)

let make_ignore_query_params_in_response_output
    ?baz:(baz_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ baz = baz_ } : ignore_query_params_in_response_output)

let make_input_and_output_with_headers_i_o
    ?header_string:(header_string_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?header_byte:(header_byte_ : Smaws_Lib.Smithy_api.Types.byte option)
    ?header_short:(header_short_ : Smaws_Lib.Smithy_api.Types.short option)
    ?header_integer:(header_integer_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?header_long:(header_long_ : Smaws_Lib.Smithy_api.Types.long option)
    ?header_float:(header_float_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?header_double:(header_double_ : Smaws_Lib.Smithy_api.Types.double option)
    ?header_true_bool:(header_true_bool_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?header_false_bool:(header_false_bool_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?header_string_list:(header_string_list_ : Shared.Types.string_list option)
    ?header_string_set:(header_string_set_ : Shared.Types.string_set option)
    ?header_integer_list:(header_integer_list_ : Shared.Types.integer_list option)
    ?header_boolean_list:(header_boolean_list_ : Shared.Types.boolean_list option)
    ?header_timestamp_list:(header_timestamp_list_ : Shared.Types.timestamp_list option)
    ?header_enum:(header_enum_ : Shared.Types.foo_enum option)
    ?header_enum_list:(header_enum_list_ : Shared.Types.foo_enum_list option) () =
  ({
     header_string = header_string_;
     header_byte = header_byte_;
     header_short = header_short_;
     header_integer = header_integer_;
     header_long = header_long_;
     header_float = header_float_;
     header_double = header_double_;
     header_true_bool = header_true_bool_;
     header_false_bool = header_false_bool_;
     header_string_list = header_string_list_;
     header_string_set = header_string_set_;
     header_integer_list = header_integer_list_;
     header_boolean_list = header_boolean_list_;
     header_timestamp_list = header_timestamp_list_;
     header_enum = header_enum_;
     header_enum_list = header_enum_list_;
   }
    : input_and_output_with_headers_i_o)

let make_nested_xml_map_with_xml_name_response
    ?nested_xml_map_with_xml_name_map:
      (nested_xml_map_with_xml_name_map_ : nested_xml_map_with_xml_name_map option) () =
  ({ nested_xml_map_with_xml_name_map = nested_xml_map_with_xml_name_map_ }
    : nested_xml_map_with_xml_name_response)

let make_nested_xml_map_with_xml_name_request
    ?nested_xml_map_with_xml_name_map:
      (nested_xml_map_with_xml_name_map_ : nested_xml_map_with_xml_name_map option) () =
  ({ nested_xml_map_with_xml_name_map = nested_xml_map_with_xml_name_map_ }
    : nested_xml_map_with_xml_name_request)

let make_nested_xml_map_with_xml_name_input_output
    ?nested_xml_map_with_xml_name_map:
      (nested_xml_map_with_xml_name_map_ : nested_xml_map_with_xml_name_map option) () =
  ({ nested_xml_map_with_xml_name_map = nested_xml_map_with_xml_name_map_ }
    : nested_xml_map_with_xml_name_input_output)

let make_nested_xml_maps_response ?nested_map:(nested_map_ : nested_map option)
    ?flat_nested_map:(flat_nested_map_ : nested_map option) () =
  ({ nested_map = nested_map_; flat_nested_map = flat_nested_map_ } : nested_xml_maps_response)

let make_nested_xml_maps_request ?nested_map:(nested_map_ : nested_map option)
    ?flat_nested_map:(flat_nested_map_ : nested_map option) () =
  ({ nested_map = nested_map_; flat_nested_map = flat_nested_map_ } : nested_xml_maps_request)

let make_nested_xml_maps_input_output ?nested_map:(nested_map_ : nested_map option)
    ?flat_nested_map:(flat_nested_map_ : nested_map option) () =
  ({ nested_map = nested_map_; flat_nested_map = flat_nested_map_ } : nested_xml_maps_input_output)

let make_no_input_and_output_output () = (() : unit)

let make_null_and_empty_headers_i_o ?a:(a_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?b:(b_ : Smaws_Lib.Smithy_api.Types.string_ option) ?c:(c_ : Shared.Types.string_list option) ()
    =
  ({ a = a_; b = b_; c = c_ } : null_and_empty_headers_i_o)

let make_omits_null_serializes_empty_string_input
    ?null_value:(null_value_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?empty_string:(empty_string_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ null_value = null_value_; empty_string = empty_string_ }
    : omits_null_serializes_empty_string_input)

let make_put_with_content_encoding_input
    ?encoding:(encoding_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?data:(data_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ encoding = encoding_; data = data_ } : put_with_content_encoding_input)

let make_query_idempotency_token_auto_fill_input
    ?token:(token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ token = token_ } : query_idempotency_token_auto_fill_input)

let make_query_params_as_string_list_map_input
    ?qux:(qux_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?foo:(foo_ : Shared.Types.string_list_map option) () =
  ({ qux = qux_; foo = foo_ } : query_params_as_string_list_map_input)

let make_query_precedence_input ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?baz:(baz_ : Shared.Types.string_map option) () =
  ({ foo = foo_; baz = baz_ } : query_precedence_input)

let make_recursive_shapes_input_output_nested2
    ?bar:(bar_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?recursive_member:(recursive_member_ : recursive_shapes_input_output_nested1 option) () =
  ({ bar = bar_; recursive_member = recursive_member_ } : recursive_shapes_input_output_nested2)

let make_recursive_shapes_input_output_nested1
    ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?nested:(nested_ : recursive_shapes_input_output_nested2 option) () =
  ({ foo = foo_; nested = nested_ } : recursive_shapes_input_output_nested1)

let make_recursive_shapes_response ?nested:(nested_ : recursive_shapes_input_output_nested1 option)
    () =
  ({ nested = nested_ } : recursive_shapes_response)

let make_recursive_shapes_request ?nested:(nested_ : recursive_shapes_input_output_nested1 option)
    () =
  ({ nested = nested_ } : recursive_shapes_request)

let make_xml_nested_union_struct
    ?string_value:(string_value_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?boolean_value:(boolean_value_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?byte_value:(byte_value_ : Smaws_Lib.Smithy_api.Types.byte option)
    ?short_value:(short_value_ : Smaws_Lib.Smithy_api.Types.short option)
    ?integer_value:(integer_value_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?long_value:(long_value_ : Smaws_Lib.Smithy_api.Types.long option)
    ?float_value:(float_value_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?double_value:(double_value_ : Smaws_Lib.Smithy_api.Types.double option) () =
  ({
     string_value = string_value_;
     boolean_value = boolean_value_;
     byte_value = byte_value_;
     short_value = short_value_;
     integer_value = integer_value_;
     long_value = long_value_;
     float_value = float_value_;
     double_value = double_value_;
   }
    : xml_nested_union_struct)

let make_xml_unions_response ?union_value:(union_value_ : xml_union_shape option) () =
  ({ union_value = union_value_ } : xml_unions_response)

let make_xml_unions_request ?union_value:(union_value_ : xml_union_shape option) () =
  ({ union_value = union_value_ } : xml_unions_request)

let make_xml_timestamps_response ?normal:(normal_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?date_time:(date_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?date_time_on_target:(date_time_on_target_ : Shared.Types.date_time option)
    ?epoch_seconds:(epoch_seconds_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?epoch_seconds_on_target:(epoch_seconds_on_target_ : Shared.Types.epoch_seconds option)
    ?http_date:(http_date_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?http_date_on_target:(http_date_on_target_ : Shared.Types.http_date option) () =
  ({
     normal = normal_;
     date_time = date_time_;
     date_time_on_target = date_time_on_target_;
     epoch_seconds = epoch_seconds_;
     epoch_seconds_on_target = epoch_seconds_on_target_;
     http_date = http_date_;
     http_date_on_target = http_date_on_target_;
   }
    : xml_timestamps_response)

let make_xml_timestamps_request ?normal:(normal_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?date_time:(date_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?date_time_on_target:(date_time_on_target_ : Shared.Types.date_time option)
    ?epoch_seconds:(epoch_seconds_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?epoch_seconds_on_target:(epoch_seconds_on_target_ : Shared.Types.epoch_seconds option)
    ?http_date:(http_date_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?http_date_on_target:(http_date_on_target_ : Shared.Types.http_date option) () =
  ({
     normal = normal_;
     date_time = date_time_;
     date_time_on_target = date_time_on_target_;
     epoch_seconds = epoch_seconds_;
     epoch_seconds_on_target = epoch_seconds_on_target_;
     http_date = http_date_;
     http_date_on_target = http_date_on_target_;
   }
    : xml_timestamps_request)

let make_xml_namespace_nested ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?values:(values_ : xml_namespaced_list option) () =
  ({ foo = foo_; values = values_ } : xml_namespace_nested)

let make_xml_namespaces_response ?nested:(nested_ : xml_namespace_nested option) () =
  ({ nested = nested_ } : xml_namespaces_response)

let make_xml_namespaces_request ?nested:(nested_ : xml_namespace_nested option) () =
  ({ nested = nested_ } : xml_namespaces_request)

let make_xml_map_with_xml_namespace_response
    ?my_map:(my_map_ : xml_map_with_xml_namespace_input_output_map option) () =
  ({ my_map = my_map_ } : xml_map_with_xml_namespace_response)

let make_xml_map_with_xml_namespace_request
    ?my_map:(my_map_ : xml_map_with_xml_namespace_input_output_map option) () =
  ({ my_map = my_map_ } : xml_map_with_xml_namespace_request)

let make_xml_maps_xml_name_response ?my_map:(my_map_ : xml_maps_xml_name_input_output_map option) ()
    =
  ({ my_map = my_map_ } : xml_maps_xml_name_response)

let make_xml_maps_xml_name_request ?my_map:(my_map_ : xml_maps_xml_name_input_output_map option) ()
    =
  ({ my_map = my_map_ } : xml_maps_xml_name_request)

let make_xml_maps_response ?my_map:(my_map_ : xml_maps_input_output_map option) () =
  ({ my_map = my_map_ } : xml_maps_response)

let make_xml_maps_request ?my_map:(my_map_ : xml_maps_input_output_map option) () =
  ({ my_map = my_map_ } : xml_maps_request)

let make_structure_list_member ?a:(a_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?b:(b_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ a = a_; b = b_ } : structure_list_member)

let make_xml_lists_response ?string_list:(string_list_ : Shared.Types.string_list option)
    ?string_set:(string_set_ : Shared.Types.string_set option)
    ?integer_list:(integer_list_ : Shared.Types.integer_list option)
    ?boolean_list:(boolean_list_ : Shared.Types.boolean_list option)
    ?timestamp_list:(timestamp_list_ : Shared.Types.timestamp_list option)
    ?enum_list:(enum_list_ : Shared.Types.foo_enum_list option)
    ?int_enum_list:(int_enum_list_ : Shared.Types.integer_enum_list option)
    ?nested_string_list:(nested_string_list_ : Shared.Types.nested_string_list option)
    ?renamed_list_members:(renamed_list_members_ : renamed_list_members option)
    ?flattened_list:(flattened_list_ : renamed_list_members option)
    ?flattened_list2:(flattened_list2_ : renamed_list_members option)
    ?flattened_list_with_member_namespace:
      (flattened_list_with_member_namespace_ : list_with_member_namespace option)
    ?flattened_list_with_namespace:(flattened_list_with_namespace_ : list_with_namespace option)
    ?structure_list:(structure_list_ : structure_list option)
    ?flattened_structure_list:(flattened_structure_list_ : structure_list option) () =
  ({
     string_list = string_list_;
     string_set = string_set_;
     integer_list = integer_list_;
     boolean_list = boolean_list_;
     timestamp_list = timestamp_list_;
     enum_list = enum_list_;
     int_enum_list = int_enum_list_;
     nested_string_list = nested_string_list_;
     renamed_list_members = renamed_list_members_;
     flattened_list = flattened_list_;
     flattened_list2 = flattened_list2_;
     flattened_list_with_member_namespace = flattened_list_with_member_namespace_;
     flattened_list_with_namespace = flattened_list_with_namespace_;
     structure_list = structure_list_;
     flattened_structure_list = flattened_structure_list_;
   }
    : xml_lists_response)

let make_xml_lists_request ?string_list:(string_list_ : Shared.Types.string_list option)
    ?string_set:(string_set_ : Shared.Types.string_set option)
    ?integer_list:(integer_list_ : Shared.Types.integer_list option)
    ?boolean_list:(boolean_list_ : Shared.Types.boolean_list option)
    ?timestamp_list:(timestamp_list_ : Shared.Types.timestamp_list option)
    ?enum_list:(enum_list_ : Shared.Types.foo_enum_list option)
    ?int_enum_list:(int_enum_list_ : Shared.Types.integer_enum_list option)
    ?nested_string_list:(nested_string_list_ : Shared.Types.nested_string_list option)
    ?renamed_list_members:(renamed_list_members_ : renamed_list_members option)
    ?flattened_list:(flattened_list_ : renamed_list_members option)
    ?flattened_list2:(flattened_list2_ : renamed_list_members option)
    ?flattened_list_with_member_namespace:
      (flattened_list_with_member_namespace_ : list_with_member_namespace option)
    ?flattened_list_with_namespace:(flattened_list_with_namespace_ : list_with_namespace option)
    ?structure_list:(structure_list_ : structure_list option)
    ?flattened_structure_list:(flattened_structure_list_ : structure_list option) () =
  ({
     string_list = string_list_;
     string_set = string_set_;
     integer_list = integer_list_;
     boolean_list = boolean_list_;
     timestamp_list = timestamp_list_;
     enum_list = enum_list_;
     int_enum_list = int_enum_list_;
     nested_string_list = nested_string_list_;
     renamed_list_members = renamed_list_members_;
     flattened_list = flattened_list_;
     flattened_list2 = flattened_list2_;
     flattened_list_with_member_namespace = flattened_list_with_member_namespace_;
     flattened_list_with_namespace = flattened_list_with_namespace_;
     structure_list = structure_list_;
     flattened_structure_list = flattened_structure_list_;
   }
    : xml_lists_request)

let make_xml_int_enums_response ?int_enum1:(int_enum1_ : Shared.Types.integer_enum option)
    ?int_enum2:(int_enum2_ : Shared.Types.integer_enum option)
    ?int_enum3:(int_enum3_ : Shared.Types.integer_enum option)
    ?int_enum_list:(int_enum_list_ : Shared.Types.integer_enum_list option)
    ?int_enum_set:(int_enum_set_ : Shared.Types.integer_enum_set option)
    ?int_enum_map:(int_enum_map_ : Shared.Types.integer_enum_map option) () =
  ({
     int_enum1 = int_enum1_;
     int_enum2 = int_enum2_;
     int_enum3 = int_enum3_;
     int_enum_list = int_enum_list_;
     int_enum_set = int_enum_set_;
     int_enum_map = int_enum_map_;
   }
    : xml_int_enums_response)

let make_xml_int_enums_request ?int_enum1:(int_enum1_ : Shared.Types.integer_enum option)
    ?int_enum2:(int_enum2_ : Shared.Types.integer_enum option)
    ?int_enum3:(int_enum3_ : Shared.Types.integer_enum option)
    ?int_enum_list:(int_enum_list_ : Shared.Types.integer_enum_list option)
    ?int_enum_set:(int_enum_set_ : Shared.Types.integer_enum_set option)
    ?int_enum_map:(int_enum_map_ : Shared.Types.integer_enum_map option) () =
  ({
     int_enum1 = int_enum1_;
     int_enum2 = int_enum2_;
     int_enum3 = int_enum3_;
     int_enum_list = int_enum_list_;
     int_enum_set = int_enum_set_;
     int_enum_map = int_enum_map_;
   }
    : xml_int_enums_request)

let make_xml_enums_response ?foo_enum1:(foo_enum1_ : Shared.Types.foo_enum option)
    ?foo_enum2:(foo_enum2_ : Shared.Types.foo_enum option)
    ?foo_enum3:(foo_enum3_ : Shared.Types.foo_enum option)
    ?foo_enum_list:(foo_enum_list_ : Shared.Types.foo_enum_list option)
    ?foo_enum_set:(foo_enum_set_ : Shared.Types.foo_enum_set option)
    ?foo_enum_map:(foo_enum_map_ : Shared.Types.foo_enum_map option) () =
  ({
     foo_enum1 = foo_enum1_;
     foo_enum2 = foo_enum2_;
     foo_enum3 = foo_enum3_;
     foo_enum_list = foo_enum_list_;
     foo_enum_set = foo_enum_set_;
     foo_enum_map = foo_enum_map_;
   }
    : xml_enums_response)

let make_xml_enums_request ?foo_enum1:(foo_enum1_ : Shared.Types.foo_enum option)
    ?foo_enum2:(foo_enum2_ : Shared.Types.foo_enum option)
    ?foo_enum3:(foo_enum3_ : Shared.Types.foo_enum option)
    ?foo_enum_list:(foo_enum_list_ : Shared.Types.foo_enum_list option)
    ?foo_enum_set:(foo_enum_set_ : Shared.Types.foo_enum_set option)
    ?foo_enum_map:(foo_enum_map_ : Shared.Types.foo_enum_map option) () =
  ({
     foo_enum1 = foo_enum1_;
     foo_enum2 = foo_enum2_;
     foo_enum3 = foo_enum3_;
     foo_enum_list = foo_enum_list_;
     foo_enum_set = foo_enum_set_;
     foo_enum_map = foo_enum_map_;
   }
    : xml_enums_request)

let make_xml_empty_strings_response
    ?empty_string:(empty_string_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ empty_string = empty_string_ } : xml_empty_strings_response)

let make_xml_empty_strings_request
    ?empty_string:(empty_string_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ empty_string = empty_string_ } : xml_empty_strings_request)

let make_xml_empty_maps_response ?my_map:(my_map_ : xml_maps_input_output_map option) () =
  ({ my_map = my_map_ } : xml_empty_maps_response)

let make_xml_empty_maps_request ?my_map:(my_map_ : xml_maps_input_output_map option) () =
  ({ my_map = my_map_ } : xml_empty_maps_request)

let make_xml_empty_lists_response ?string_list:(string_list_ : Shared.Types.string_list option)
    ?string_set:(string_set_ : Shared.Types.string_set option)
    ?integer_list:(integer_list_ : Shared.Types.integer_list option)
    ?boolean_list:(boolean_list_ : Shared.Types.boolean_list option)
    ?timestamp_list:(timestamp_list_ : Shared.Types.timestamp_list option)
    ?enum_list:(enum_list_ : Shared.Types.foo_enum_list option)
    ?int_enum_list:(int_enum_list_ : Shared.Types.integer_enum_list option)
    ?nested_string_list:(nested_string_list_ : Shared.Types.nested_string_list option)
    ?renamed_list_members:(renamed_list_members_ : renamed_list_members option)
    ?flattened_list:(flattened_list_ : renamed_list_members option)
    ?flattened_list2:(flattened_list2_ : renamed_list_members option)
    ?flattened_list_with_member_namespace:
      (flattened_list_with_member_namespace_ : list_with_member_namespace option)
    ?flattened_list_with_namespace:(flattened_list_with_namespace_ : list_with_namespace option)
    ?structure_list:(structure_list_ : structure_list option)
    ?flattened_structure_list:(flattened_structure_list_ : structure_list option) () =
  ({
     string_list = string_list_;
     string_set = string_set_;
     integer_list = integer_list_;
     boolean_list = boolean_list_;
     timestamp_list = timestamp_list_;
     enum_list = enum_list_;
     int_enum_list = int_enum_list_;
     nested_string_list = nested_string_list_;
     renamed_list_members = renamed_list_members_;
     flattened_list = flattened_list_;
     flattened_list2 = flattened_list2_;
     flattened_list_with_member_namespace = flattened_list_with_member_namespace_;
     flattened_list_with_namespace = flattened_list_with_namespace_;
     structure_list = structure_list_;
     flattened_structure_list = flattened_structure_list_;
   }
    : xml_empty_lists_response)

let make_xml_empty_lists_request ?string_list:(string_list_ : Shared.Types.string_list option)
    ?string_set:(string_set_ : Shared.Types.string_set option)
    ?integer_list:(integer_list_ : Shared.Types.integer_list option)
    ?boolean_list:(boolean_list_ : Shared.Types.boolean_list option)
    ?timestamp_list:(timestamp_list_ : Shared.Types.timestamp_list option)
    ?enum_list:(enum_list_ : Shared.Types.foo_enum_list option)
    ?int_enum_list:(int_enum_list_ : Shared.Types.integer_enum_list option)
    ?nested_string_list:(nested_string_list_ : Shared.Types.nested_string_list option)
    ?renamed_list_members:(renamed_list_members_ : renamed_list_members option)
    ?flattened_list:(flattened_list_ : renamed_list_members option)
    ?flattened_list2:(flattened_list2_ : renamed_list_members option)
    ?flattened_list_with_member_namespace:
      (flattened_list_with_member_namespace_ : list_with_member_namespace option)
    ?flattened_list_with_namespace:(flattened_list_with_namespace_ : list_with_namespace option)
    ?structure_list:(structure_list_ : structure_list option)
    ?flattened_structure_list:(flattened_structure_list_ : structure_list option) () =
  ({
     string_list = string_list_;
     string_set = string_set_;
     integer_list = integer_list_;
     boolean_list = boolean_list_;
     timestamp_list = timestamp_list_;
     enum_list = enum_list_;
     int_enum_list = int_enum_list_;
     nested_string_list = nested_string_list_;
     renamed_list_members = renamed_list_members_;
     flattened_list = flattened_list_;
     flattened_list2 = flattened_list2_;
     flattened_list_with_member_namespace = flattened_list_with_member_namespace_;
     flattened_list_with_namespace = flattened_list_with_namespace_;
     structure_list = structure_list_;
     flattened_structure_list = flattened_structure_list_;
   }
    : xml_empty_lists_request)

let make_xml_empty_blobs_response ?data:(data_ : Smaws_Lib.Smithy_api.Types.blob option) () =
  ({ data = data_ } : xml_empty_blobs_response)

let make_xml_empty_blobs_request ?data:(data_ : Smaws_Lib.Smithy_api.Types.blob option) () =
  ({ data = data_ } : xml_empty_blobs_request)

let make_xml_blobs_response ?data:(data_ : Smaws_Lib.Smithy_api.Types.blob option) () =
  ({ data = data_ } : xml_blobs_response)

let make_xml_blobs_request ?data:(data_ : Smaws_Lib.Smithy_api.Types.blob option) () =
  ({ data = data_ } : xml_blobs_request)

let make_xml_attributes_payload_response ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?attr:(attr_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ foo = foo_; attr = attr_ } : xml_attributes_payload_response)

let make_xml_attributes_on_payload_response
    ?payload:(payload_ : xml_attributes_payload_response option) () =
  ({ payload = payload_ } : xml_attributes_on_payload_response)

let make_xml_attributes_payload_request ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?attr:(attr_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ foo = foo_; attr = attr_ } : xml_attributes_payload_request)

let make_xml_attributes_on_payload_request
    ?payload:(payload_ : xml_attributes_payload_request option) () =
  ({ payload = payload_ } : xml_attributes_on_payload_request)

let make_xml_attributes_in_middle_payload_response
    ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?attr:(attr_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?baz:(baz_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ foo = foo_; attr = attr_; baz = baz_ } : xml_attributes_in_middle_payload_response)

let make_xml_attributes_in_middle_response
    ?payload:(payload_ : xml_attributes_in_middle_payload_response option) () =
  ({ payload = payload_ } : xml_attributes_in_middle_response)

let make_xml_attributes_in_middle_payload_request
    ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?attr:(attr_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?baz:(baz_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ foo = foo_; attr = attr_; baz = baz_ } : xml_attributes_in_middle_payload_request)

let make_xml_attributes_in_middle_request
    ?payload:(payload_ : xml_attributes_in_middle_payload_request option) () =
  ({ payload = payload_ } : xml_attributes_in_middle_request)

let make_xml_attributes_response ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?attr:(attr_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ foo = foo_; attr = attr_ } : xml_attributes_response)

let make_xml_attributes_request ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?attr:(attr_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ foo = foo_; attr = attr_ } : xml_attributes_request)

let make_timestamp_format_headers_i_o
    ?member_epoch_seconds:(member_epoch_seconds_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?member_http_date:(member_http_date_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?member_date_time:(member_date_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?default_format:(default_format_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?target_epoch_seconds:(target_epoch_seconds_ : Shared.Types.epoch_seconds option)
    ?target_http_date:(target_http_date_ : Shared.Types.http_date option)
    ?target_date_time:(target_date_time_ : Shared.Types.date_time option) () =
  ({
     member_epoch_seconds = member_epoch_seconds_;
     member_http_date = member_http_date_;
     member_date_time = member_date_time_;
     default_format = default_format_;
     target_epoch_seconds = target_epoch_seconds_;
     target_http_date = target_http_date_;
     target_date_time = target_date_time_;
   }
    : timestamp_format_headers_i_o)

let make_simple_scalar_properties_response ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?string_value:(string_value_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?true_boolean_value:(true_boolean_value_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?false_boolean_value:(false_boolean_value_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?byte_value:(byte_value_ : Smaws_Lib.Smithy_api.Types.byte option)
    ?short_value:(short_value_ : Smaws_Lib.Smithy_api.Types.short option)
    ?integer_value:(integer_value_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?long_value:(long_value_ : Smaws_Lib.Smithy_api.Types.long option)
    ?float_value:(float_value_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?double_value:(double_value_ : Smaws_Lib.Smithy_api.Types.double option) () =
  ({
     foo = foo_;
     string_value = string_value_;
     true_boolean_value = true_boolean_value_;
     false_boolean_value = false_boolean_value_;
     byte_value = byte_value_;
     short_value = short_value_;
     integer_value = integer_value_;
     long_value = long_value_;
     float_value = float_value_;
     double_value = double_value_;
   }
    : simple_scalar_properties_response)

let make_simple_scalar_properties_request ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?string_value:(string_value_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?true_boolean_value:(true_boolean_value_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?false_boolean_value:(false_boolean_value_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?byte_value:(byte_value_ : Smaws_Lib.Smithy_api.Types.byte option)
    ?short_value:(short_value_ : Smaws_Lib.Smithy_api.Types.short option)
    ?integer_value:(integer_value_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?long_value:(long_value_ : Smaws_Lib.Smithy_api.Types.long option)
    ?float_value:(float_value_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?double_value:(double_value_ : Smaws_Lib.Smithy_api.Types.double option) () =
  ({
     foo = foo_;
     string_value = string_value_;
     true_boolean_value = true_boolean_value_;
     false_boolean_value = false_boolean_value_;
     byte_value = byte_value_;
     short_value = short_value_;
     integer_value = integer_value_;
     long_value = long_value_;
     float_value = float_value_;
     double_value = double_value_;
   }
    : simple_scalar_properties_request)

let make_simple_scalar_properties_input_output
    ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?string_value:(string_value_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?true_boolean_value:(true_boolean_value_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?false_boolean_value:(false_boolean_value_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?byte_value:(byte_value_ : Smaws_Lib.Smithy_api.Types.byte option)
    ?short_value:(short_value_ : Smaws_Lib.Smithy_api.Types.short option)
    ?integer_value:(integer_value_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?long_value:(long_value_ : Smaws_Lib.Smithy_api.Types.long option)
    ?float_value:(float_value_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?double_value:(double_value_ : Smaws_Lib.Smithy_api.Types.double option) () =
  ({
     foo = foo_;
     string_value = string_value_;
     true_boolean_value = true_boolean_value_;
     false_boolean_value = false_boolean_value_;
     byte_value = byte_value_;
     short_value = short_value_;
     integer_value = integer_value_;
     long_value = long_value_;
     float_value = float_value_;
     double_value = double_value_;
   }
    : simple_scalar_properties_input_output)

let make_xml_attributes_input_output ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?attr:(attr_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ foo = foo_; attr = attr_ } : xml_attributes_input_output)

let make_xml_attributes_middle_member_input_output
    ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?attr:(attr_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?baz:(baz_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ foo = foo_; attr = attr_; baz = baz_ } : xml_attributes_middle_member_input_output)

let make_xml_enums_input_output ?foo_enum1:(foo_enum1_ : Shared.Types.foo_enum option)
    ?foo_enum2:(foo_enum2_ : Shared.Types.foo_enum option)
    ?foo_enum3:(foo_enum3_ : Shared.Types.foo_enum option)
    ?foo_enum_list:(foo_enum_list_ : Shared.Types.foo_enum_list option)
    ?foo_enum_set:(foo_enum_set_ : Shared.Types.foo_enum_set option)
    ?foo_enum_map:(foo_enum_map_ : Shared.Types.foo_enum_map option) () =
  ({
     foo_enum1 = foo_enum1_;
     foo_enum2 = foo_enum2_;
     foo_enum3 = foo_enum3_;
     foo_enum_list = foo_enum_list_;
     foo_enum_set = foo_enum_set_;
     foo_enum_map = foo_enum_map_;
   }
    : xml_enums_input_output)

let make_xml_int_enums_input_output ?int_enum1:(int_enum1_ : Shared.Types.integer_enum option)
    ?int_enum2:(int_enum2_ : Shared.Types.integer_enum option)
    ?int_enum3:(int_enum3_ : Shared.Types.integer_enum option)
    ?int_enum_list:(int_enum_list_ : Shared.Types.integer_enum_list option)
    ?int_enum_set:(int_enum_set_ : Shared.Types.integer_enum_set option)
    ?int_enum_map:(int_enum_map_ : Shared.Types.integer_enum_map option) () =
  ({
     int_enum1 = int_enum1_;
     int_enum2 = int_enum2_;
     int_enum3 = int_enum3_;
     int_enum_list = int_enum_list_;
     int_enum_set = int_enum_set_;
     int_enum_map = int_enum_map_;
   }
    : xml_int_enums_input_output)

let make_xml_lists_input_output ?string_list:(string_list_ : Shared.Types.string_list option)
    ?string_set:(string_set_ : Shared.Types.string_set option)
    ?integer_list:(integer_list_ : Shared.Types.integer_list option)
    ?boolean_list:(boolean_list_ : Shared.Types.boolean_list option)
    ?timestamp_list:(timestamp_list_ : Shared.Types.timestamp_list option)
    ?enum_list:(enum_list_ : Shared.Types.foo_enum_list option)
    ?int_enum_list:(int_enum_list_ : Shared.Types.integer_enum_list option)
    ?nested_string_list:(nested_string_list_ : Shared.Types.nested_string_list option)
    ?renamed_list_members:(renamed_list_members_ : renamed_list_members option)
    ?flattened_list:(flattened_list_ : renamed_list_members option)
    ?flattened_list2:(flattened_list2_ : renamed_list_members option)
    ?flattened_list_with_member_namespace:
      (flattened_list_with_member_namespace_ : list_with_member_namespace option)
    ?flattened_list_with_namespace:(flattened_list_with_namespace_ : list_with_namespace option)
    ?structure_list:(structure_list_ : structure_list option)
    ?flattened_structure_list:(flattened_structure_list_ : structure_list option) () =
  ({
     string_list = string_list_;
     string_set = string_set_;
     integer_list = integer_list_;
     boolean_list = boolean_list_;
     timestamp_list = timestamp_list_;
     enum_list = enum_list_;
     int_enum_list = int_enum_list_;
     nested_string_list = nested_string_list_;
     renamed_list_members = renamed_list_members_;
     flattened_list = flattened_list_;
     flattened_list2 = flattened_list2_;
     flattened_list_with_member_namespace = flattened_list_with_member_namespace_;
     flattened_list_with_namespace = flattened_list_with_namespace_;
     structure_list = structure_list_;
     flattened_structure_list = flattened_structure_list_;
   }
    : xml_lists_input_output)

let make_xml_map_with_xml_namespace_input_output
    ?my_map:(my_map_ : xml_map_with_xml_namespace_input_output_map option) () =
  ({ my_map = my_map_ } : xml_map_with_xml_namespace_input_output)

let make_xml_namespaces_input_output ?nested:(nested_ : xml_namespace_nested option) () =
  ({ nested = nested_ } : xml_namespaces_input_output)

let make_xml_timestamps_input_output ?normal:(normal_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?date_time:(date_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?date_time_on_target:(date_time_on_target_ : Shared.Types.date_time option)
    ?epoch_seconds:(epoch_seconds_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?epoch_seconds_on_target:(epoch_seconds_on_target_ : Shared.Types.epoch_seconds option)
    ?http_date:(http_date_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?http_date_on_target:(http_date_on_target_ : Shared.Types.http_date option) () =
  ({
     normal = normal_;
     date_time = date_time_;
     date_time_on_target = date_time_on_target_;
     epoch_seconds = epoch_seconds_;
     epoch_seconds_on_target = epoch_seconds_on_target_;
     http_date = http_date_;
     http_date_on_target = http_date_on_target_;
   }
    : xml_timestamps_input_output)
