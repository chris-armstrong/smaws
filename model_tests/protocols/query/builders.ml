open Types
let make_xml_timestamps_output
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
   } : xml_timestamps_output)
let make_xml_namespace_nested ?values:(values_ : xml_namespaced_list option)
  ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ values = values_; foo = foo_ } : xml_namespace_nested)
let make_xml_namespaces_output
  ?nested:(nested_ : xml_namespace_nested option) () =
  ({ nested = nested_ } : xml_namespaces_output)
let make_xml_maps_xml_name_output
  ?my_map:(my_map_ : xml_maps_xml_name_output_map option) () =
  ({ my_map = my_map_ } : xml_maps_xml_name_output)
let make_xml_maps_output ?my_map:(my_map_ : xml_maps_output_map option) () =
  ({ my_map = my_map_ } : xml_maps_output)
let make_structure_list_member
  ?b:(b_ : Smaws_Lib.Smithy_api.Types.string_ option)
  ?a:(a_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ b = b_; a = a_ } : structure_list_member)
let make_xml_lists_output
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
   } : xml_lists_output)
let make_xml_int_enums_output
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
   } : xml_int_enums_output)
let make_xml_enums_output
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
   } : xml_enums_output)
let make_xml_blobs_output
  ?data:(data_ : Smaws_Lib.Smithy_api.Types.blob option) () =
  ({ data = data_ } : xml_blobs_output)
let make_struct_arg ?recursive_arg:(recursive_arg_ : struct_arg option)
  ?other_arg:(other_arg_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
  ?string_arg:(string_arg_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     recursive_arg = recursive_arg_;
     other_arg = other_arg_;
     string_arg = string_arg_
   } : struct_arg)
let make_simple_scalar_xml_properties_output
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
  ?empty_string_value:(empty_string_value_ :
                        Smaws_Lib.Smithy_api.Types.string_ option)
  ?string_value:(string_value_ : Smaws_Lib.Smithy_api.Types.string_ option)
  () =
  ({
     double_value = double_value_;
     float_value = float_value_;
     long_value = long_value_;
     integer_value = integer_value_;
     short_value = short_value_;
     byte_value = byte_value_;
     false_boolean_value = false_boolean_value_;
     true_boolean_value = true_boolean_value_;
     empty_string_value = empty_string_value_;
     string_value = string_value_
   } : simple_scalar_xml_properties_output)
let make_simple_input_params_input
  ?integer_enum:(integer_enum_ : Shared.Types.integer_enum option)
  ?foo_enum:(foo_enum_ : Shared.Types.foo_enum option)
  ?qux:(qux_ : Smaws_Lib.Smithy_api.Types.blob option)
  ?boo:(boo_ : Smaws_Lib.Smithy_api.Types.double option)
  ?float_value:(float_value_ : Smaws_Lib.Smithy_api.Types.float_ option)
  ?bam:(bam_ : Smaws_Lib.Smithy_api.Types.integer option)
  ?baz:(baz_ : Smaws_Lib.Smithy_api.Types.boolean_ option)
  ?bar:(bar_ : Smaws_Lib.Smithy_api.Types.string_ option)
  ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     integer_enum = integer_enum_;
     foo_enum = foo_enum_;
     qux = qux_;
     boo = boo_;
     float_value = float_value_;
     bam = bam_;
     baz = baz_;
     bar = bar_;
     foo = foo_
   } : simple_input_params_input)
let make_recursive_xml_shapes_output_nested1
  ?nested:(nested_ : recursive_xml_shapes_output_nested2 option)
  ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ nested = nested_; foo = foo_ } : recursive_xml_shapes_output_nested1)
let make_recursive_xml_shapes_output_nested2
  ?recursive_member:(recursive_member_ :
                      recursive_xml_shapes_output_nested1 option)
  ?bar:(bar_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ recursive_member = recursive_member_; bar = bar_ } : recursive_xml_shapes_output_nested2)
let make_recursive_xml_shapes_output
  ?nested:(nested_ : recursive_xml_shapes_output_nested1 option) () =
  ({ nested = nested_ } : recursive_xml_shapes_output)
let make_query_timestamps_input
  ?epoch_target:(epoch_target_ : Shared.Types.epoch_seconds option)
  ?epoch_member:(epoch_member_ : Smaws_Lib.Smithy_api.Types.timestamp option)
  ?normal_format:(normal_format_ :
                   Smaws_Lib.Smithy_api.Types.timestamp option)
  () =
  ({
     epoch_target = epoch_target_;
     epoch_member = epoch_member_;
     normal_format = normal_format_
   } : query_timestamps_input)
let make_nested_struct_with_map
  ?map_arg:(map_arg_ : Shared.Types.string_map option) () =
  ({ map_arg = map_arg_ } : nested_struct_with_map)
let make_query_maps_input
  ?nested_struct_with_map:(nested_struct_with_map_ :
                            nested_struct_with_map option)
  ?map_of_lists:(map_of_lists_ : map_of_lists option)
  ?flattened_map_with_xml_name:(flattened_map_with_xml_name_ :
                                 map_with_xml_name option)
  ?flattened_map:(flattened_map_ : Shared.Types.string_map option)
  ?map_with_xml_member_name:(map_with_xml_member_name_ :
                              map_with_xml_name option)
  ?complex_map_arg:(complex_map_arg_ : complex_map option)
  ?renamed_map_arg:(renamed_map_arg_ : Shared.Types.string_map option)
  ?map_arg:(map_arg_ : Shared.Types.string_map option) () =
  ({
     nested_struct_with_map = nested_struct_with_map_;
     map_of_lists = map_of_lists_;
     flattened_map_with_xml_name = flattened_map_with_xml_name_;
     flattened_map = flattened_map_;
     map_with_xml_member_name = map_with_xml_member_name_;
     complex_map_arg = complex_map_arg_;
     renamed_map_arg = renamed_map_arg_;
     map_arg = map_arg_
   } : query_maps_input)
let make_nested_struct_with_list
  ?list_arg:(list_arg_ : Shared.Types.string_list option) () =
  ({ list_arg = list_arg_ } : nested_struct_with_list)
let make_query_lists_input
  ?nested_with_list:(nested_with_list_ : nested_struct_with_list option)
  ?flattened_list_arg_with_xml_name:(flattened_list_arg_with_xml_name_ :
                                      list_with_xml_name option)
  ?list_arg_with_xml_name_member:(list_arg_with_xml_name_member_ :
                                   list_with_xml_name option)
  ?flattened_list_arg:(flattened_list_arg_ : Shared.Types.string_list option)
  ?complex_list_arg:(complex_list_arg_ : Shared.Types.greeting_list option)
  ?list_arg:(list_arg_ : Shared.Types.string_list option) () =
  ({
     nested_with_list = nested_with_list_;
     flattened_list_arg_with_xml_name = flattened_list_arg_with_xml_name_;
     list_arg_with_xml_name_member = list_arg_with_xml_name_member_;
     flattened_list_arg = flattened_list_arg_;
     complex_list_arg = complex_list_arg_;
     list_arg = list_arg_
   } : query_lists_input)
let make_query_idempotency_token_auto_fill_input
  ?token:(token_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ token = token_ } : query_idempotency_token_auto_fill_input)
let make_put_with_content_encoding_input
  ?data:(data_ : Smaws_Lib.Smithy_api.Types.string_ option)
  ?encoding:(encoding_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ data = data_; encoding = encoding_ } : put_with_content_encoding_input)
let make_no_input_and_output_output () = (() : unit)
let make_no_input_and_output_input () = (() : unit)
let make_nested_structures_input ?nested:(nested_ : struct_arg option) () =
  ({ nested = nested_ } : nested_structures_input)
let make_ignores_wrapping_xml_name_output
  ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ foo = foo_ } : ignores_wrapping_xml_name_output)
let make_host_label_input
  ~label:(label_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ label = label_ } : host_label_input)
let make_greeting_with_errors_output
  ?greeting:(greeting_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ greeting = greeting_ } : greeting_with_errors_output)
let make_complex_nested_error_data
  ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ foo = foo_ } : complex_nested_error_data)
let make_fractional_seconds_output
  ?datetime:(datetime_ : Shared.Types.date_time option) () =
  ({ datetime = datetime_ } : fractional_seconds_output)
let make_flattened_xml_map_with_xml_namespace_output
  ?my_map:(my_map_ : flattened_xml_map_with_xml_namespace_output_map option)
  () = ({ my_map = my_map_ } : flattened_xml_map_with_xml_namespace_output)
let make_flattened_xml_map_with_xml_name_output
  ?my_map:(my_map_ : flattened_xml_map_with_xml_name_output_map option) () =
  ({ my_map = my_map_ } : flattened_xml_map_with_xml_name_output)
let make_flattened_xml_map_output
  ?my_map:(my_map_ : Shared.Types.foo_enum_map option) () =
  ({ my_map = my_map_ } : flattened_xml_map_output)
let make_empty_input_and_empty_output_output () = (() : unit)
let make_empty_input_and_empty_output_input () = (() : unit)
let make_datetime_offsets_output
  ?datetime:(datetime_ : Shared.Types.date_time option) () =
  ({ datetime = datetime_ } : datetime_offsets_output)