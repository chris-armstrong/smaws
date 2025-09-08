open Smaws_Lib.Json.DeserializeHelpers
open Types
let xml_timestamps_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     http_date_on_target =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.http_date_of_yojson
             "httpDateOnTarget") _list path);
     http_date =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.timestamp_of_yojson
             "httpDate") _list path);
     epoch_seconds_on_target =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.epoch_seconds_of_yojson
             "epochSecondsOnTarget") _list path);
     epoch_seconds =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.timestamp_of_yojson
             "epochSeconds") _list path);
     date_time_on_target =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.date_time_of_yojson
             "dateTimeOnTarget") _list path);
     date_time =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.timestamp_of_yojson
             "dateTime") _list path);
     normal =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.timestamp_of_yojson
             "normal") _list path)
   } : xml_timestamps_output)
let xml_namespaced_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    tree path
let xml_namespace_nested_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     values =
       (option_of_yojson
          (value_for_key xml_namespaced_list_of_yojson "values") _list path);
     foo =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "foo")
          _list path)
   } : xml_namespace_nested)
let xml_namespaces_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     nested =
       (option_of_yojson
          (value_for_key xml_namespace_nested_of_yojson "nested") _list path)
   } : xml_namespaces_output)
let xml_maps_xml_name_output_map_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    Shared.Json_deserializers.greeting_struct_of_yojson tree path
let xml_maps_xml_name_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     my_map =
       (option_of_yojson
          (value_for_key xml_maps_xml_name_output_map_of_yojson "myMap")
          _list path)
   } : xml_maps_xml_name_output)
let xml_maps_output_map_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    Shared.Json_deserializers.greeting_struct_of_yojson tree path
let xml_maps_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     my_map =
       (option_of_yojson
          (value_for_key xml_maps_output_map_of_yojson "myMap") _list path)
   } : xml_maps_output)
let renamed_list_members_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    tree path
let list_with_member_namespace_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    tree path
let list_with_namespace_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    tree path
let structure_list_member_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     b =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "b")
          _list path);
     a =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "a")
          _list path)
   } : structure_list_member)
let structure_list_of_yojson tree path =
  list_of_yojson structure_list_member_of_yojson tree path
let xml_lists_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     structure_list =
       (option_of_yojson
          (value_for_key structure_list_of_yojson "structureList") _list path);
     flattened_list_with_namespace =
       (option_of_yojson
          (value_for_key list_with_namespace_of_yojson
             "flattenedListWithNamespace") _list path);
     flattened_list_with_member_namespace =
       (option_of_yojson
          (value_for_key list_with_member_namespace_of_yojson
             "flattenedListWithMemberNamespace") _list path);
     flattened_list2 =
       (option_of_yojson
          (value_for_key renamed_list_members_of_yojson "flattenedList2")
          _list path);
     flattened_list =
       (option_of_yojson
          (value_for_key renamed_list_members_of_yojson "flattenedList")
          _list path);
     renamed_list_members =
       (option_of_yojson
          (value_for_key renamed_list_members_of_yojson "renamedListMembers")
          _list path);
     nested_string_list =
       (option_of_yojson
          (value_for_key
             Shared.Json_deserializers.nested_string_list_of_yojson
             "nestedStringList") _list path);
     int_enum_list =
       (option_of_yojson
          (value_for_key
             Shared.Json_deserializers.integer_enum_list_of_yojson
             "intEnumList") _list path);
     enum_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.foo_enum_list_of_yojson
             "enumList") _list path);
     timestamp_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.timestamp_list_of_yojson
             "timestampList") _list path);
     boolean_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.boolean_list_of_yojson
             "booleanList") _list path);
     integer_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.integer_list_of_yojson
             "integerList") _list path);
     string_set =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.string_set_of_yojson
             "stringSet") _list path);
     string_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.string_list_of_yojson
             "stringList") _list path)
   } : xml_lists_output)
let xml_int_enums_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     int_enum_map =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.integer_enum_map_of_yojson
             "intEnumMap") _list path);
     int_enum_set =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.integer_enum_set_of_yojson
             "intEnumSet") _list path);
     int_enum_list =
       (option_of_yojson
          (value_for_key
             Shared.Json_deserializers.integer_enum_list_of_yojson
             "intEnumList") _list path);
     int_enum3 =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.integer_enum_of_yojson
             "intEnum3") _list path);
     int_enum2 =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.integer_enum_of_yojson
             "intEnum2") _list path);
     int_enum1 =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.integer_enum_of_yojson
             "intEnum1") _list path)
   } : xml_int_enums_output)
let xml_enums_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     foo_enum_map =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.foo_enum_map_of_yojson
             "fooEnumMap") _list path);
     foo_enum_set =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.foo_enum_set_of_yojson
             "fooEnumSet") _list path);
     foo_enum_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.foo_enum_list_of_yojson
             "fooEnumList") _list path);
     foo_enum3 =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.foo_enum_of_yojson
             "fooEnum3") _list path);
     foo_enum2 =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.foo_enum_of_yojson
             "fooEnum2") _list path);
     foo_enum1 =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.foo_enum_of_yojson
             "fooEnum1") _list path)
   } : xml_enums_output)
let xml_blobs_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.blob_of_yojson "data")
          _list path)
   } : xml_blobs_output)
let rec struct_arg_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recursive_arg =
       (option_of_yojson (value_for_key struct_arg_of_yojson "RecursiveArg")
          _list path);
     other_arg =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
             "OtherArg") _list path);
     string_arg =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "StringArg") _list path)
   } : struct_arg)
let simple_scalar_xml_properties_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     double_value =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
             "doubleValue") _list path);
     float_value =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson
             "floatValue") _list path);
     long_value =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson
             "longValue") _list path);
     integer_value =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
             "integerValue") _list path);
     short_value =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.short_of_yojson
             "shortValue") _list path);
     byte_value =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.byte_of_yojson
             "byteValue") _list path);
     false_boolean_value =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
             "falseBooleanValue") _list path);
     true_boolean_value =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
             "trueBooleanValue") _list path);
     empty_string_value =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "emptyStringValue") _list path);
     string_value =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "stringValue") _list path)
   } : simple_scalar_xml_properties_output)
let simple_input_params_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     integer_enum =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.integer_enum_of_yojson
             "IntegerEnum") _list path);
     foo_enum =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.foo_enum_of_yojson
             "FooEnum") _list path);
     qux =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.blob_of_yojson "Qux")
          _list path);
     boo =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "Boo")
          _list path);
     float_value =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson
             "FloatValue") _list path);
     bam =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "Bam")
          _list path);
     baz =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "Baz")
          _list path);
     bar =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Bar")
          _list path);
     foo =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Foo")
          _list path)
   } : simple_input_params_input)
let rec recursive_xml_shapes_output_nested1_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     nested =
       (option_of_yojson
          (value_for_key recursive_xml_shapes_output_nested2_of_yojson
             "nested") _list path);
     foo =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "foo")
          _list path)
   } : recursive_xml_shapes_output_nested1)
and recursive_xml_shapes_output_nested2_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recursive_member =
       (option_of_yojson
          (value_for_key recursive_xml_shapes_output_nested1_of_yojson
             "recursiveMember") _list path);
     bar =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "bar")
          _list path)
   } : recursive_xml_shapes_output_nested2)
let recursive_xml_shapes_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     nested =
       (option_of_yojson
          (value_for_key recursive_xml_shapes_output_nested1_of_yojson
             "nested") _list path)
   } : recursive_xml_shapes_output)
let query_timestamps_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     epoch_target =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.epoch_seconds_of_yojson
             "epochTarget") _list path);
     epoch_member =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.timestamp_of_yojson
             "epochMember") _list path);
     normal_format =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.timestamp_of_yojson
             "normalFormat") _list path)
   } : query_timestamps_input)
let complex_map_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    Shared.Json_deserializers.greeting_struct_of_yojson tree path
let map_with_xml_name_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path
let map_of_lists_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    Shared.Json_deserializers.string_list_of_yojson tree path
let nested_struct_with_map_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     map_arg =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.string_map_of_yojson
             "MapArg") _list path)
   } : nested_struct_with_map)
let query_maps_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     nested_struct_with_map =
       (option_of_yojson
          (value_for_key nested_struct_with_map_of_yojson
             "NestedStructWithMap") _list path);
     map_of_lists =
       (option_of_yojson (value_for_key map_of_lists_of_yojson "MapOfLists")
          _list path);
     flattened_map_with_xml_name =
       (option_of_yojson
          (value_for_key map_with_xml_name_of_yojson
             "FlattenedMapWithXmlName") _list path);
     flattened_map =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.string_map_of_yojson
             "FlattenedMap") _list path);
     map_with_xml_member_name =
       (option_of_yojson
          (value_for_key map_with_xml_name_of_yojson "MapWithXmlMemberName")
          _list path);
     complex_map_arg =
       (option_of_yojson
          (value_for_key complex_map_of_yojson "ComplexMapArg") _list path);
     renamed_map_arg =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.string_map_of_yojson
             "RenamedMapArg") _list path);
     map_arg =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.string_map_of_yojson
             "MapArg") _list path)
   } : query_maps_input)
let list_with_xml_name_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    tree path
let nested_struct_with_list_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     list_arg =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.string_list_of_yojson
             "ListArg") _list path)
   } : nested_struct_with_list)
let query_lists_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     nested_with_list =
       (option_of_yojson
          (value_for_key nested_struct_with_list_of_yojson "NestedWithList")
          _list path);
     flattened_list_arg_with_xml_name =
       (option_of_yojson
          (value_for_key list_with_xml_name_of_yojson
             "FlattenedListArgWithXmlName") _list path);
     list_arg_with_xml_name_member =
       (option_of_yojson
          (value_for_key list_with_xml_name_of_yojson
             "ListArgWithXmlNameMember") _list path);
     flattened_list_arg =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.string_list_of_yojson
             "FlattenedListArg") _list path);
     complex_list_arg =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.greeting_list_of_yojson
             "ComplexListArg") _list path);
     list_arg =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.string_list_of_yojson
             "ListArg") _list path)
   } : query_lists_input)
let query_idempotency_token_auto_fill_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     token =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "token") _list path)
   } : query_idempotency_token_auto_fill_input)
let put_with_content_encoding_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "data")
          _list path);
     encoding =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "encoding") _list path)
   } : put_with_content_encoding_input)
let no_input_and_output_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let no_input_and_output_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let nested_structures_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     nested =
       (option_of_yojson (value_for_key struct_arg_of_yojson "Nested") _list
          path)
   } : nested_structures_input)
let invalid_greeting_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "Message") _list path)
   } : invalid_greeting)
let ignores_wrapping_xml_name_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     foo =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "foo")
          _list path)
   } : ignores_wrapping_xml_name_output)
let host_label_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     label =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "label"
          _list path)
   } : host_label_input)
let greeting_with_errors_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     greeting =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "greeting") _list path)
   } : greeting_with_errors_output)
let custom_code_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "Message") _list path)
   } : custom_code_error)
let complex_nested_error_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     foo =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Foo")
          _list path)
   } : complex_nested_error_data)
let complex_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     nested =
       (option_of_yojson
          (value_for_key complex_nested_error_data_of_yojson "Nested") _list
          path);
     top_level =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "TopLevel") _list path)
   } : complex_error)
let fractional_seconds_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     datetime =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.date_time_of_yojson
             "datetime") _list path)
   } : fractional_seconds_output)
let flattened_xml_map_with_xml_namespace_output_map_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path
let flattened_xml_map_with_xml_namespace_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     my_map =
       (option_of_yojson
          (value_for_key
             flattened_xml_map_with_xml_namespace_output_map_of_yojson
             "myMap") _list path)
   } : flattened_xml_map_with_xml_namespace_output)
let flattened_xml_map_with_xml_name_output_map_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path
let flattened_xml_map_with_xml_name_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     my_map =
       (option_of_yojson
          (value_for_key flattened_xml_map_with_xml_name_output_map_of_yojson
             "myMap") _list path)
   } : flattened_xml_map_with_xml_name_output)
let flattened_xml_map_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     my_map =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.foo_enum_map_of_yojson
             "myMap") _list path)
   } : flattened_xml_map_output)
let empty_input_and_empty_output_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let empty_input_and_empty_output_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let datetime_offsets_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     datetime =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.date_time_of_yojson
             "datetime") _list path)
   } : datetime_offsets_output)