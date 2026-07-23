open Types

let make_complex_nested_error_data ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ foo = foo_ } : complex_nested_error_data)

let make_content_type_parameters_output () = (() : unit)

let make_content_type_parameters_input ?value:(value_ : Smaws_Lib.Smithy_api.Types.integer option)
    () =
  ({ value = value_ } : content_type_parameters_input)

let make_datetime_offsets_output ?datetime:(datetime_ : Shared.Types.date_time option) () =
  ({ datetime = datetime_ } : datetime_offsets_output)

let make_empty_struct () = (() : unit)

let make_host_label_input ~label:(label_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ label = label_ } : host_label_input)

let make_struct_with_json_name ?value:(value_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ value = value_ } : struct_with_json_name)

let make_simple_struct ?value:(value_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ value = value_ } : simple_struct)

let make_kitchen_sink ?blob:(blob_ : Smaws_Lib.Smithy_api.Types.blob option)
    ?boolean_:(boolean__ : Smaws_Lib.Smithy_api.Types.boolean_ option)
    ?double:(double_ : Smaws_Lib.Smithy_api.Types.double option)
    ?empty_struct:(empty_struct_ : empty_struct option)
    ?float_:(float__ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?httpdate_timestamp:(httpdate_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?integer:(integer_ : Smaws_Lib.Smithy_api.Types.integer option)
    ?iso8601_timestamp:(iso8601_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?json_value:(json_value_ : json_value option)
    ?list_of_lists:(list_of_lists_ : list_of_list_of_strings option)
    ?list_of_maps_of_strings:(list_of_maps_of_strings_ : list_of_maps_of_strings option)
    ?list_of_strings:(list_of_strings_ : list_of_strings option)
    ?list_of_structs:(list_of_structs_ : list_of_structs option)
    ?long:(long_ : Smaws_Lib.Smithy_api.Types.long option)
    ?map_of_lists_of_strings:(map_of_lists_of_strings_ : map_of_lists_of_strings option)
    ?map_of_maps:(map_of_maps_ : map_of_map_of_strings option)
    ?map_of_strings:(map_of_strings_ : map_of_strings option)
    ?map_of_structs:(map_of_structs_ : map_of_structs option)
    ?recursive_list:(recursive_list_ : list_of_kitchen_sinks option)
    ?recursive_map:(recursive_map_ : map_of_kitchen_sinks option)
    ?recursive_struct:(recursive_struct_ : kitchen_sink option)
    ?simple_struct:(simple_struct_ : simple_struct option)
    ?string_:(string__ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?struct_with_json_name:(struct_with_json_name_ : struct_with_json_name option)
    ?timestamp:(timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option)
    ?unix_timestamp:(unix_timestamp_ : Smaws_Lib.Smithy_api.Types.timestamp option) () =
  ({
     blob = blob_;
     boolean_ = boolean__;
     double = double_;
     empty_struct = empty_struct_;
     float_ = float__;
     httpdate_timestamp = httpdate_timestamp_;
     integer = integer_;
     iso8601_timestamp = iso8601_timestamp_;
     json_value = json_value_;
     list_of_lists = list_of_lists_;
     list_of_maps_of_strings = list_of_maps_of_strings_;
     list_of_strings = list_of_strings_;
     list_of_structs = list_of_structs_;
     long = long_;
     map_of_lists_of_strings = map_of_lists_of_strings_;
     map_of_maps = map_of_maps_;
     map_of_strings = map_of_strings_;
     map_of_structs = map_of_structs_;
     recursive_list = recursive_list_;
     recursive_map = recursive_map_;
     recursive_struct = recursive_struct_;
     simple_struct = simple_struct_;
     string_ = string__;
     struct_with_json_name = struct_with_json_name_;
     timestamp = timestamp_;
     unix_timestamp = unix_timestamp_;
   }
    : kitchen_sink)

let make_fractional_seconds_output ?datetime:(datetime_ : Shared.Types.date_time option) () =
  ({ datetime = datetime_ } : fractional_seconds_output)

let make_greeting_with_errors_output
    ?greeting:(greeting_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ greeting = greeting_ } : greeting_with_errors_output)

let make_json_enums_input_output ?foo_enum1:(foo_enum1_ : Shared.Types.foo_enum option)
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
    : json_enums_input_output)

let make_json_int_enums_input_output ?int_enum1:(int_enum1_ : Shared.Types.integer_enum option)
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
    : json_int_enums_input_output)

let make_sparse_nulls_operation_input_output
    ?sparse_string_list:(sparse_string_list_ : Shared.Types.sparse_string_list option)
    ?sparse_string_map:(sparse_string_map_ : Shared.Types.sparse_string_map option) () =
  ({ sparse_string_list = sparse_string_list_; sparse_string_map = sparse_string_map_ }
    : sparse_nulls_operation_input_output)

let make_simple_scalar_properties_input_output
    ?float_value:(float_value_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ?double_value:(double_value_ : Smaws_Lib.Smithy_api.Types.double option) () =
  ({ float_value = float_value_; double_value = double_value_ }
    : simple_scalar_properties_input_output)

let make_put_with_content_encoding_input
    ?encoding:(encoding_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?data:(data_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ encoding = encoding_; data = data_ } : put_with_content_encoding_input)

let make_put_and_get_inline_documents_input_output
    ?inline_document:(inline_document_ : document option) () =
  ({ inline_document = inline_document_ } : put_and_get_inline_documents_input_output)

let make_operation_with_optional_input_output_output
    ?value:(value_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ value = value_ } : operation_with_optional_input_output_output)

let make_operation_with_optional_input_output_input
    ?value:(value_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ value = value_ } : operation_with_optional_input_output_input)

let make_null_operation_input_output ?string_:(string__ : Smaws_Lib.Smithy_api.Types.string_ option)
    () =
  ({ string_ = string__ } : null_operation_input_output)

let make_union_input_output ?contents:(contents_ : my_union option) () =
  ({ contents = contents_ } : union_input_output)
