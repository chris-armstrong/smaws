open Types
let make_xml_nested_union_struct
  ?double_value:(double_value_ : Smaws_Lib.Smithy_api.Types.double option)
  ?float_value:(float_value_ : Smaws_Lib.Smithy_api.Types.float_ option)
  ?long_value:(long_value_ : Smaws_Lib.Smithy_api.Types.long option)
  ?integer_value:(integer_value_ : Smaws_Lib.Smithy_api.Types.integer option)
  ?short_value:(short_value_ : Smaws_Lib.Smithy_api.Types.short option)
  ?byte_value:(byte_value_ : Smaws_Lib.Smithy_api.Types.byte option)
  ?boolean_value:(boolean_value_ :
                   Smaws_Lib.Smithy_api.Types.boolean_ option)
  ?string_value:(string_value_ : Smaws_Lib.Smithy_api.Types.string_ option)
  () =
  ({
     double_value = double_value_;
     float_value = float_value_;
     long_value = long_value_;
     integer_value = integer_value_;
     short_value = short_value_;
     byte_value = byte_value_;
     boolean_value = boolean_value_;
     string_value = string_value_
   } : xml_nested_union_struct)
let make_xml_unions_response
  ?union_value:(union_value_ : xml_union_shape option) () =
  ({ union_value = union_value_ } : xml_unions_response)
let make_xml_unions_request
  ?union_value:(union_value_ : xml_union_shape option) () =
  ({ union_value = union_value_ } : xml_unions_request)
let make_xml_timestamps_response () = (() : unit)
let make_xml_timestamps_request () = (() : unit)
let make_xml_timestamps_input_output
  ?http_date_on_target:(http_date_on_target_ : Shared.Types.http_date option)
  ?http_date:(http_date_ : Smaws_Lib.Smithy_api.Types.timestamp option)
  ?epoch_seconds_on_target:(epoch_seconds_on_target_ :
                             Shared.Types.epoch_seconds option)
  ?epoch_seconds:(epoch_seconds_ :
                   Smaws_Lib.Smithy_api.Types.timestamp option)
  ?date_time_on_target:(date_time_on_target_ : Shared.Types.date_time option)
  ?date_time:(date_time_ : Smaws_Lib.Smithy_api.Types.timestamp option)
  ?normal:(normal_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     http_date_on_target = http_date_on_target_;
     http_date = http_date_;
     epoch_seconds_on_target = epoch_seconds_on_target_;
     epoch_seconds = epoch_seconds_;
     date_time_on_target = date_time_on_target_;
     date_time = date_time_;
     normal = normal_
   } : xml_timestamps_input_output)
let make_xml_namespaces_response () = (() : unit)
let make_xml_namespaces_request () = (() : unit)
let make_xml_namespace_nested ?values:(values_ : xml_namespaced_list option)
  ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ values = values_; foo = foo_ } : xml_namespace_nested)
let make_xml_namespaces_input_output
  ?nested:(nested_ : xml_namespace_nested option) () =
  ({ nested = nested_ } : xml_namespaces_input_output)
let make_xml_maps_xml_name_response
  ?my_map:(my_map_ : xml_maps_xml_name_input_output_map option) () =
  ({ my_map = my_map_ } : xml_maps_xml_name_response)
let make_xml_maps_xml_name_request
  ?my_map:(my_map_ : xml_maps_xml_name_input_output_map option) () =
  ({ my_map = my_map_ } : xml_maps_xml_name_request)
let make_xml_maps_response
  ?my_map:(my_map_ : xml_maps_input_output_map option) () =
  ({ my_map = my_map_ } : xml_maps_response)
let make_xml_maps_request
  ?my_map:(my_map_ : xml_maps_input_output_map option) () =
  ({ my_map = my_map_ } : xml_maps_request)
let make_xml_map_with_xml_namespace_response () = (() : unit)
let make_xml_map_with_xml_namespace_request () = (() : unit)
let make_xml_map_with_xml_namespace_input_output
  ?my_map:(my_map_ : xml_map_with_xml_namespace_input_output_map option) () =
  ({ my_map = my_map_ } : xml_map_with_xml_namespace_input_output)
let make_xml_lists_response () = (() : unit)
let make_xml_lists_request () = (() : unit)
let make_structure_list_member
  ?b:(b_ : Smaws_Lib.Smithy_api.Types.string_ option)
  ?a:(a_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ b = b_; a = a_ } : structure_list_member)
let make_xml_lists_input_output
  ?flattened_structure_list:(flattened_structure_list_ :
                              structure_list option)
  ?structure_list:(structure_list_ : structure_list option)
  ?flattened_list_with_namespace:(flattened_list_with_namespace_ :
                                   list_with_namespace option)
  ?flattened_list_with_member_namespace:(flattened_list_with_member_namespace_
                                          :
                                          list_with_member_namespace option)
  ?flattened_list2:(flattened_list2_ : renamed_list_members option)
  ?flattened_list:(flattened_list_ : renamed_list_members option)
  ?renamed_list_members:(renamed_list_members_ : renamed_list_members option)
  ?nested_string_list:(nested_string_list_ :
                        Shared.Types.nested_string_list option)
  ?int_enum_list:(int_enum_list_ : Shared.Types.integer_enum_list option)
  ?enum_list:(enum_list_ : Shared.Types.foo_enum_list option)
  ?timestamp_list:(timestamp_list_ : Shared.Types.timestamp_list option)
  ?boolean_list:(boolean_list_ : Shared.Types.boolean_list option)
  ?integer_list:(integer_list_ : Shared.Types.integer_list option)
  ?string_set:(string_set_ : Shared.Types.string_set option)
  ?string_list:(string_list_ : Shared.Types.string_list option) () =
  ({
     flattened_structure_list = flattened_structure_list_;
     structure_list = structure_list_;
     flattened_list_with_namespace = flattened_list_with_namespace_;
     flattened_list_with_member_namespace =
       flattened_list_with_member_namespace_;
     flattened_list2 = flattened_list2_;
     flattened_list = flattened_list_;
     renamed_list_members = renamed_list_members_;
     nested_string_list = nested_string_list_;
     int_enum_list = int_enum_list_;
     enum_list = enum_list_;
     timestamp_list = timestamp_list_;
     boolean_list = boolean_list_;
     integer_list = integer_list_;
     string_set = string_set_;
     string_list = string_list_
   } : xml_lists_input_output)
let make_xml_int_enums_response () = (() : unit)
let make_xml_int_enums_request () = (() : unit)
let make_xml_int_enums_input_output
  ?int_enum_map:(int_enum_map_ : Shared.Types.integer_enum_map option)
  ?int_enum_set:(int_enum_set_ : Shared.Types.integer_enum_set option)
  ?int_enum_list:(int_enum_list_ : Shared.Types.integer_enum_list option)
  ?int_enum3:(int_enum3_ : Shared.Types.integer_enum option)
  ?int_enum2:(int_enum2_ : Shared.Types.integer_enum option)
  ?int_enum1:(int_enum1_ : Shared.Types.integer_enum option) () =
  ({
     int_enum_map = int_enum_map_;
     int_enum_set = int_enum_set_;
     int_enum_list = int_enum_list_;
     int_enum3 = int_enum3_;
     int_enum2 = int_enum2_;
     int_enum1 = int_enum1_
   } : xml_int_enums_input_output)
let make_xml_enums_response () = (() : unit)
let make_xml_enums_request () = (() : unit)
let make_xml_enums_input_output
  ?foo_enum_map:(foo_enum_map_ : Shared.Types.foo_enum_map option)
  ?foo_enum_set:(foo_enum_set_ : Shared.Types.foo_enum_set option)
  ?foo_enum_list:(foo_enum_list_ : Shared.Types.foo_enum_list option)
  ?foo_enum3:(foo_enum3_ : Shared.Types.foo_enum option)
  ?foo_enum2:(foo_enum2_ : Shared.Types.foo_enum option)
  ?foo_enum1:(foo_enum1_ : Shared.Types.foo_enum option) () =
  ({
     foo_enum_map = foo_enum_map_;
     foo_enum_set = foo_enum_set_;
     foo_enum_list = foo_enum_list_;
     foo_enum3 = foo_enum3_;
     foo_enum2 = foo_enum2_;
     foo_enum1 = foo_enum1_
   } : xml_enums_input_output)
let make_xml_empty_strings_response
  ?empty_string:(empty_string_ : Smaws_Lib.Smithy_api.Types.string_ option)
  () = ({ empty_string = empty_string_ } : xml_empty_strings_response)
let make_xml_empty_strings_request
  ?empty_string:(empty_string_ : Smaws_Lib.Smithy_api.Types.string_ option)
  () = ({ empty_string = empty_string_ } : xml_empty_strings_request)
let make_xml_empty_maps_response
  ?my_map:(my_map_ : xml_maps_input_output_map option) () =
  ({ my_map = my_map_ } : xml_empty_maps_response)
let make_xml_empty_maps_request
  ?my_map:(my_map_ : xml_maps_input_output_map option) () =
  ({ my_map = my_map_ } : xml_empty_maps_request)
let make_xml_empty_lists_response () = (() : unit)
let make_xml_empty_lists_request () = (() : unit)
let make_xml_empty_blobs_response
  ?data:(data_ : Smaws_Lib.Smithy_api.Types.blob option) () =
  ({ data = data_ } : xml_empty_blobs_response)
let make_xml_empty_blobs_request
  ?data:(data_ : Smaws_Lib.Smithy_api.Types.blob option) () =
  ({ data = data_ } : xml_empty_blobs_request)
let make_xml_blobs_response
  ?data:(data_ : Smaws_Lib.Smithy_api.Types.blob option) () =
  ({ data = data_ } : xml_blobs_response)
let make_xml_blobs_request
  ?data:(data_ : Smaws_Lib.Smithy_api.Types.blob option) () =
  ({ data = data_ } : xml_blobs_request)
let make_xml_attributes_response () = (() : unit)
let make_xml_attributes_request () = (() : unit)
let make_xml_attributes_payload_response () = (() : unit)
let make_xml_attributes_payload_request () = (() : unit)
let make_xml_attributes_on_payload_response
  ?payload:(payload_ : xml_attributes_payload_response option) () =
  ({ payload = payload_ } : xml_attributes_on_payload_response)
let make_xml_attributes_on_payload_request
  ?payload:(payload_ : xml_attributes_payload_request option) () =
  ({ payload = payload_ } : xml_attributes_on_payload_request)
let make_xml_attributes_middle_member_input_output
  ?baz:(baz_ : Smaws_Lib.Smithy_api.Types.string_ option)
  ?attr:(attr_ : Smaws_Lib.Smithy_api.Types.string_ option)
  ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ baz = baz_; attr = attr_; foo = foo_ } : xml_attributes_middle_member_input_output)
let make_xml_attributes_input_output
  ?attr:(attr_ : Smaws_Lib.Smithy_api.Types.string_ option)
  ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ attr = attr_; foo = foo_ } : xml_attributes_input_output)
let make_xml_attributes_in_middle_payload_response () = (() : unit)
let make_xml_attributes_in_middle_response
  ?payload:(payload_ : xml_attributes_in_middle_payload_response option) () =
  ({ payload = payload_ } : xml_attributes_in_middle_response)
let make_xml_attributes_in_middle_payload_request () = (() : unit)
let make_xml_attributes_in_middle_request
  ?payload:(payload_ : xml_attributes_in_middle_payload_request option) () =
  ({ payload = payload_ } : xml_attributes_in_middle_request)
let make_timestamp_format_headers_i_o
  ?target_date_time:(target_date_time_ : Shared.Types.date_time option)
  ?target_http_date:(target_http_date_ : Shared.Types.http_date option)
  ?target_epoch_seconds:(target_epoch_seconds_ :
                          Shared.Types.epoch_seconds option)
  ?default_format:(default_format_ :
                    Smaws_Lib.Smithy_api.Types.timestamp option)
  ?member_date_time:(member_date_time_ :
                      Smaws_Lib.Smithy_api.Types.timestamp option)
  ?member_http_date:(member_http_date_ :
                      Smaws_Lib.Smithy_api.Types.timestamp option)
  ?member_epoch_seconds:(member_epoch_seconds_ :
                          Smaws_Lib.Smithy_api.Types.timestamp option)
  () =
  ({
     target_date_time = target_date_time_;
     target_http_date = target_http_date_;
     target_epoch_seconds = target_epoch_seconds_;
     default_format = default_format_;
     member_date_time = member_date_time_;
     member_http_date = member_http_date_;
     member_epoch_seconds = member_epoch_seconds_
   } : timestamp_format_headers_i_o)
let make_string_payload_input
  ?payload:(payload_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ payload = payload_ } : string_payload_input)
let make_simple_scalar_properties_response () = (() : unit)
let make_simple_scalar_properties_request () = (() : unit)
let make_simple_scalar_properties_input_output
  ?double_value:(double_value_ : Smaws_Lib.Smithy_api.Types.double option)
  ?float_value:(float_value_ : Smaws_Lib.Smithy_api.Types.float_ option)
  ?long_value:(long_value_ : Smaws_Lib.Smithy_api.Types.long option)
  ?integer_value:(integer_value_ : Smaws_Lib.Smithy_api.Types.integer option)
  ?short_value:(short_value_ : Smaws_Lib.Smithy_api.Types.short option)
  ?byte_value:(byte_value_ : Smaws_Lib.Smithy_api.Types.byte option)
  ?false_boolean_value:(false_boolean_value_ :
                         Smaws_Lib.Smithy_api.Types.boolean_ option)
  ?true_boolean_value:(true_boolean_value_ :
                        Smaws_Lib.Smithy_api.Types.boolean_ option)
  ?string_value:(string_value_ : Smaws_Lib.Smithy_api.Types.string_ option)
  ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     double_value = double_value_;
     float_value = float_value_;
     long_value = long_value_;
     integer_value = integer_value_;
     short_value = short_value_;
     byte_value = byte_value_;
     false_boolean_value = false_boolean_value_;
     true_boolean_value = true_boolean_value_;
     string_value = string_value_;
     foo = foo_
   } : simple_scalar_properties_input_output)
let make_recursive_shapes_input_output_nested1
  ?nested:(nested_ : recursive_shapes_input_output_nested2 option)
  ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ nested = nested_; foo = foo_ } : recursive_shapes_input_output_nested1)
let make_recursive_shapes_input_output_nested2
  ?recursive_member:(recursive_member_ :
                      recursive_shapes_input_output_nested1 option)
  ?bar:(bar_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ recursive_member = recursive_member_; bar = bar_ } : recursive_shapes_input_output_nested2)
let make_recursive_shapes_response
  ?nested:(nested_ : recursive_shapes_input_output_nested1 option) () =
  ({ nested = nested_ } : recursive_shapes_response)
let make_recursive_shapes_request
  ?nested:(nested_ : recursive_shapes_input_output_nested1 option) () =
  ({ nested = nested_ } : recursive_shapes_request)
let make_query_precedence_input ?baz:(baz_ : Shared.Types.string_map option)
  ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ baz = baz_; foo = foo_ } : query_precedence_input)
let make_query_params_as_string_list_map_input
  ?foo:(foo_ : Shared.Types.string_list_map option)
  ?qux:(qux_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ foo = foo_; qux = qux_ } : query_params_as_string_list_map_input)
let make_query_idempotency_token_auto_fill_input
  ?token:(token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ token = token_ } : query_idempotency_token_auto_fill_input)
let make_put_with_content_encoding_input
  ?data:(data_ : Smaws_Lib.Smithy_api.Types.string_ option)
  ?encoding:(encoding_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ data = data_; encoding = encoding_ } : put_with_content_encoding_input)
let make_omits_null_serializes_empty_string_input
  ?empty_string:(empty_string_ : Smaws_Lib.Smithy_api.Types.string_ option)
  ?null_value:(null_value_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ empty_string = empty_string_; null_value = null_value_ } : omits_null_serializes_empty_string_input)
let make_null_and_empty_headers_i_o ?c:(c_ : Shared.Types.string_list option)
  ?b:(b_ : Smaws_Lib.Smithy_api.Types.string_ option)
  ?a:(a_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ c = c_; b = b_; a = a_ } : null_and_empty_headers_i_o)
let make_no_input_and_output_output () = (() : unit)
let make_nested_xml_map_with_xml_name_response () = (() : unit)
let make_nested_xml_map_with_xml_name_request () = (() : unit)
let make_nested_xml_maps_response () = (() : unit)
let make_nested_xml_maps_request () = (() : unit)
let make_input_and_output_with_headers_i_o
  ?header_enum_list:(header_enum_list_ : Shared.Types.foo_enum_list option)
  ?header_enum:(header_enum_ : Shared.Types.foo_enum option)
  ?header_timestamp_list:(header_timestamp_list_ :
                           Shared.Types.timestamp_list option)
  ?header_boolean_list:(header_boolean_list_ :
                         Shared.Types.boolean_list option)
  ?header_integer_list:(header_integer_list_ :
                         Shared.Types.integer_list option)
  ?header_string_set:(header_string_set_ : Shared.Types.string_set option)
  ?header_string_list:(header_string_list_ : Shared.Types.string_list option)
  ?header_false_bool:(header_false_bool_ :
                       Smaws_Lib.Smithy_api.Types.boolean_ option)
  ?header_true_bool:(header_true_bool_ :
                      Smaws_Lib.Smithy_api.Types.boolean_ option)
  ?header_double:(header_double_ : Smaws_Lib.Smithy_api.Types.double option)
  ?header_float:(header_float_ : Smaws_Lib.Smithy_api.Types.float_ option)
  ?header_long:(header_long_ : Smaws_Lib.Smithy_api.Types.long option)
  ?header_integer:(header_integer_ :
                    Smaws_Lib.Smithy_api.Types.integer option)
  ?header_short:(header_short_ : Smaws_Lib.Smithy_api.Types.short option)
  ?header_byte:(header_byte_ : Smaws_Lib.Smithy_api.Types.byte option)
  ?header_string:(header_string_ : Smaws_Lib.Smithy_api.Types.string_ option)
  () =
  ({
     header_enum_list = header_enum_list_;
     header_enum = header_enum_;
     header_timestamp_list = header_timestamp_list_;
     header_boolean_list = header_boolean_list_;
     header_integer_list = header_integer_list_;
     header_string_set = header_string_set_;
     header_string_list = header_string_list_;
     header_false_bool = header_false_bool_;
     header_true_bool = header_true_bool_;
     header_double = header_double_;
     header_float = header_float_;
     header_long = header_long_;
     header_integer = header_integer_;
     header_short = header_short_;
     header_byte = header_byte_;
     header_string = header_string_
   } : input_and_output_with_headers_i_o)
let make_ignore_query_params_in_response_output
  ?baz:(baz_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ baz = baz_ } : ignore_query_params_in_response_output)
let make_http_response_code_output
  ?status:(status_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({ status = status_ } : http_response_code_output)
let make_http_request_with_labels_and_timestamp_format_input
  ~target_date_time:(target_date_time_ : Shared.Types.date_time)
  ~target_http_date:(target_http_date_ : Shared.Types.http_date)
  ~target_epoch_seconds:(target_epoch_seconds_ : Shared.Types.epoch_seconds)
  ~default_format:(default_format_ : Smaws_Lib.Smithy_api.Types.timestamp)
  ~member_date_time:(member_date_time_ :
                      Smaws_Lib.Smithy_api.Types.timestamp)
  ~member_http_date:(member_http_date_ :
                      Smaws_Lib.Smithy_api.Types.timestamp)
  ~member_epoch_seconds:(member_epoch_seconds_ :
                          Smaws_Lib.Smithy_api.Types.timestamp)
  () =
  ({
     target_date_time = target_date_time_;
     target_http_date = target_http_date_;
     target_epoch_seconds = target_epoch_seconds_;
     default_format = default_format_;
     member_date_time = member_date_time_;
     member_http_date = member_http_date_;
     member_epoch_seconds = member_epoch_seconds_
   } : http_request_with_labels_and_timestamp_format_input)
let make_http_request_with_labels_input
  ~timestamp:(timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp)
  ~boolean_:(boolean__ : Smaws_Lib.Smithy_api.Types.boolean_)
  ~double:(double_ : Smaws_Lib.Smithy_api.Types.double)
  ~float_:(float__ : Smaws_Lib.Smithy_api.Types.float_)
  ~long:(long_ : Smaws_Lib.Smithy_api.Types.long)
  ~integer:(integer_ : Smaws_Lib.Smithy_api.Types.integer)
  ~short:(short_ : Smaws_Lib.Smithy_api.Types.short)
  ~string_:(string__ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     timestamp = timestamp_;
     boolean_ = boolean__;
     double = double_;
     float_ = float__;
     long = long_;
     integer = integer_;
     short = short_;
     string_ = string__
   } : http_request_with_labels_input)
let make_http_request_with_greedy_label_in_path_input
  ~baz:(baz_ : Smaws_Lib.Smithy_api.Types.string_)
  ~foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ baz = baz_; foo = foo_ } : http_request_with_greedy_label_in_path_input)
let make_http_request_with_float_labels_input
  ~double:(double_ : Smaws_Lib.Smithy_api.Types.double)
  ~float_:(float__ : Smaws_Lib.Smithy_api.Types.float_) () =
  ({ double = double_; float_ = float__ } : http_request_with_float_labels_input)
let make_http_prefix_headers_input_output
  ?foo_map:(foo_map_ : foo_prefix_headers option)
  ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ foo_map = foo_map_; foo = foo_ } : http_prefix_headers_input_output)
let make_payload_with_xml_namespace_and_prefix
  ?name:(name_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ name = name_ } : payload_with_xml_namespace_and_prefix)
let make_http_payload_with_xml_namespace_and_prefix_input_output
  ?nested:(nested_ : payload_with_xml_namespace_and_prefix option) () =
  ({ nested = nested_ } : http_payload_with_xml_namespace_and_prefix_input_output)
let make_payload_with_xml_namespace
  ?name:(name_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ name = name_ } : payload_with_xml_namespace)
let make_http_payload_with_xml_namespace_input_output
  ?nested:(nested_ : payload_with_xml_namespace option) () =
  ({ nested = nested_ } : http_payload_with_xml_namespace_input_output)
let make_payload_with_xml_name
  ?name:(name_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ name = name_ } : payload_with_xml_name)
let make_http_payload_with_xml_name_input_output
  ?nested:(nested_ : payload_with_xml_name option) () =
  ({ nested = nested_ } : http_payload_with_xml_name_input_output)
let make_http_payload_with_union_input_output
  ?nested:(nested_ : union_payload option) () =
  ({ nested = nested_ } : http_payload_with_union_input_output)
let make_nested_payload
  ?name:(name_ : Smaws_Lib.Smithy_api.Types.string_ option)
  ?greeting:(greeting_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ name = name_; greeting = greeting_ } : nested_payload)
let make_http_payload_with_structure_input_output
  ?nested:(nested_ : nested_payload option) () =
  ({ nested = nested_ } : http_payload_with_structure_input_output)
let make_http_payload_with_member_xml_name_input_output
  ?nested:(nested_ : payload_with_xml_name option) () =
  ({ nested = nested_ } : http_payload_with_member_xml_name_input_output)
let make_http_payload_traits_with_media_type_input_output
  ?blob:(blob_ : Shared.Types.text_plain_blob option)
  ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ blob = blob_; foo = foo_ } : http_payload_traits_with_media_type_input_output)
let make_http_payload_traits_input_output
  ?blob:(blob_ : Smaws_Lib.Smithy_api.Types.blob option)
  ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ blob = blob_; foo = foo_ } : http_payload_traits_input_output)
let make_enum_payload_input ?payload:(payload_ : string_enum option) () =
  ({ payload = payload_ } : enum_payload_input)
let make_http_empty_prefix_headers_output
  ?specific_header:(specific_header_ :
                     Smaws_Lib.Smithy_api.Types.string_ option)
  ?prefix_headers:(prefix_headers_ : Shared.Types.string_map option) () =
  ({ specific_header = specific_header_; prefix_headers = prefix_headers_ } : 
  http_empty_prefix_headers_output)
let make_http_empty_prefix_headers_input
  ?specific_header:(specific_header_ :
                     Smaws_Lib.Smithy_api.Types.string_ option)
  ?prefix_headers:(prefix_headers_ : Shared.Types.string_map option) () =
  ({ specific_header = specific_header_; prefix_headers = prefix_headers_ } : 
  http_empty_prefix_headers_input)
let make_complex_nested_error_data
  ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ foo = foo_ } : complex_nested_error_data)
let make_greeting_with_errors_output
  ?greeting:(greeting_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ greeting = greeting_ } : greeting_with_errors_output)
let make_fractional_seconds_output
  ?datetime:(datetime_ : Shared.Types.date_time option) () =
  ({ datetime = datetime_ } : fractional_seconds_output)
let make_flattened_xml_map_with_xml_namespace_output
  ?my_map:(my_map_ : flattened_xml_map_with_xml_namespace_output_map option)
  () = ({ my_map = my_map_ } : flattened_xml_map_with_xml_namespace_output)
let make_flattened_xml_map_with_xml_name_response
  ?my_map:(my_map_ : flattened_xml_map_with_xml_name_input_output_map option)
  () = ({ my_map = my_map_ } : flattened_xml_map_with_xml_name_response)
let make_flattened_xml_map_with_xml_name_request
  ?my_map:(my_map_ : flattened_xml_map_with_xml_name_input_output_map option)
  () = ({ my_map = my_map_ } : flattened_xml_map_with_xml_name_request)
let make_flattened_xml_map_response
  ?my_map:(my_map_ : Shared.Types.foo_enum_map option) () =
  ({ my_map = my_map_ } : flattened_xml_map_response)
let make_flattened_xml_map_request
  ?my_map:(my_map_ : Shared.Types.foo_enum_map option) () =
  ({ my_map = my_map_ } : flattened_xml_map_request)
let make_endpoint_with_host_label_operation_request
  ~label:(label_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ label = label_ } : endpoint_with_host_label_operation_request)
let make_host_label_header_input
  ~account_id:(account_id_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ account_id = account_id_ } : host_label_header_input)
let make_empty_input_and_empty_output_output () = (() : unit)
let make_empty_input_and_empty_output_input () = (() : unit)
let make_datetime_offsets_output
  ?datetime:(datetime_ : Shared.Types.date_time option) () =
  ({ datetime = datetime_ } : datetime_offsets_output)
let make_content_type_parameters_output () = (() : unit)
let make_content_type_parameters_input
  ?value:(value_ : Smaws_Lib.Smithy_api.Types.integer option) () =
  ({ value = value_ } : content_type_parameters_input)
let make_constant_query_string_input
  ~hello:(hello_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ hello = hello_ } : constant_query_string_input)
let make_constant_and_variable_query_string_input
  ?maybe_set:(maybe_set_ : Smaws_Lib.Smithy_api.Types.string_ option)
  ?baz:(baz_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ maybe_set = maybe_set_; baz = baz_ } : constant_and_variable_query_string_input)
let make_body_with_xml_name_input_output
  ?nested:(nested_ : payload_with_xml_name option) () =
  ({ nested = nested_ } : body_with_xml_name_input_output)
let make_all_query_string_types_input
  ?query_params_map_of_strings:(query_params_map_of_strings_ :
                                 Shared.Types.string_map option)
  ?query_integer_enum_list:(query_integer_enum_list_ :
                             Shared.Types.integer_enum_list option)
  ?query_integer_enum:(query_integer_enum_ :
                        Shared.Types.integer_enum option)
  ?query_enum_list:(query_enum_list_ : Shared.Types.foo_enum_list option)
  ?query_enum:(query_enum_ : Shared.Types.foo_enum option)
  ?query_timestamp_list:(query_timestamp_list_ :
                          Shared.Types.timestamp_list option)
  ?query_timestamp:(query_timestamp_ :
                     Smaws_Lib.Smithy_api.Types.timestamp option)
  ?query_boolean_list:(query_boolean_list_ :
                        Shared.Types.boolean_list option)
  ?query_boolean:(query_boolean_ :
                   Smaws_Lib.Smithy_api.Types.boolean_ option)
  ?query_double_list:(query_double_list_ : Shared.Types.double_list option)
  ?query_double:(query_double_ : Smaws_Lib.Smithy_api.Types.double option)
  ?query_float:(query_float_ : Smaws_Lib.Smithy_api.Types.float_ option)
  ?query_long:(query_long_ : Smaws_Lib.Smithy_api.Types.long option)
  ?query_integer_set:(query_integer_set_ : Shared.Types.integer_set option)
  ?query_integer_list:(query_integer_list_ :
                        Shared.Types.integer_list option)
  ?query_integer:(query_integer_ : Smaws_Lib.Smithy_api.Types.integer option)
  ?query_short:(query_short_ : Smaws_Lib.Smithy_api.Types.short option)
  ?query_byte:(query_byte_ : Smaws_Lib.Smithy_api.Types.byte option)
  ?query_string_set:(query_string_set_ : Shared.Types.string_set option)
  ?query_string_list:(query_string_list_ : Shared.Types.string_list option)
  ?query_string:(query_string_ : Smaws_Lib.Smithy_api.Types.string_ option)
  () =
  ({
     query_params_map_of_strings = query_params_map_of_strings_;
     query_integer_enum_list = query_integer_enum_list_;
     query_integer_enum = query_integer_enum_;
     query_enum_list = query_enum_list_;
     query_enum = query_enum_;
     query_timestamp_list = query_timestamp_list_;
     query_timestamp = query_timestamp_;
     query_boolean_list = query_boolean_list_;
     query_boolean = query_boolean_;
     query_double_list = query_double_list_;
     query_double = query_double_;
     query_float = query_float_;
     query_long = query_long_;
     query_integer_set = query_integer_set_;
     query_integer_list = query_integer_list_;
     query_integer = query_integer_;
     query_short = query_short_;
     query_byte = query_byte_;
     query_string_set = query_string_set_;
     query_string_list = query_string_list_;
     query_string = query_string_
   } : all_query_string_types_input)
let make_nested_xml_maps_input_output
  ?flat_nested_map:(flat_nested_map_ : nested_map option)
  ?nested_map:(nested_map_ : nested_map option) () =
  ({ flat_nested_map = flat_nested_map_; nested_map = nested_map_ } : 
  nested_xml_maps_input_output)
let make_nested_xml_map_with_xml_name_input_output
  ?nested_xml_map_with_xml_name_map:(nested_xml_map_with_xml_name_map_ :
                                      nested_xml_map_with_xml_name_map option)
  () =
  ({ nested_xml_map_with_xml_name_map = nested_xml_map_with_xml_name_map_ } : 
  nested_xml_map_with_xml_name_input_output)