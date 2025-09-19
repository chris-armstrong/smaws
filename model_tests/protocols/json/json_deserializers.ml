open Smaws_Lib.Json.DeserializeHelpers
open Types

let my_union_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "structureValue" ->
       StructureValue (Shared.Json_deserializers.greeting_struct_of_yojson value_ path)
   | "mapValue" -> MapValue (Shared.Json_deserializers.string_map_of_yojson value_ path)
   | "listValue" -> ListValue (Shared.Json_deserializers.string_list_of_yojson value_ path)
   | "enumValue" -> EnumValue (Shared.Json_deserializers.foo_enum_of_yojson value_ path)
   | "timestampValue" ->
       TimestampValue
         (Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson value_ path)
   | "blobValue" -> BlobValue (Smaws_Lib.Smithy_api.Json_deserializers.blob_of_yojson value_ path)
   | "numberValue" ->
       NumberValue (Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson value_ path)
   | "booleanValue" ->
       BooleanValue (Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson value_ path)
   | "stringValue" ->
       StringValue (Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "MyUnion" unknown)
    : my_union)

let union_input_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ contents = option_of_yojson (value_for_key my_union_of_yojson "contents") _list path }
    : union_input_output)

let struct_with_json_name_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Value")
         _list path;
   }
    : struct_with_json_name)

let sparse_nulls_operation_input_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sparse_string_map =
       option_of_yojson
         (value_for_key Shared.Json_deserializers.sparse_string_map_of_yojson "sparseStringMap")
         _list path;
     sparse_string_list =
       option_of_yojson
         (value_for_key Shared.Json_deserializers.sparse_string_list_of_yojson "sparseStringList")
         _list path;
   }
    : sparse_nulls_operation_input_output)

let simple_struct_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Value")
         _list path;
   }
    : simple_struct)

let simple_scalar_properties_input_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     double_value =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "doubleValue")
         _list path;
     float_value =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson "floatValue")
         _list path;
   }
    : simple_scalar_properties_input_output)

let put_with_content_encoding_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "data")
         _list path;
     encoding =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "encoding")
         _list path;
   }
    : put_with_content_encoding_input)

let document_of_yojson = json_of_yojson

let put_and_get_inline_documents_input_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     inline_document =
       option_of_yojson (value_for_key document_of_yojson "inlineDocument") _list path;
   }
    : put_and_get_inline_documents_input_output)

let operation_with_optional_input_output_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Value")
         _list path;
   }
    : operation_with_optional_input_output_output)

let operation_with_optional_input_output_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Value")
         _list path;
   }
    : operation_with_optional_input_output_input)

let null_operation_input_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     string_ =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "string")
         _list path;
   }
    : null_operation_input_output)

let map_of_structs_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson simple_struct_of_yojson
    tree path

let map_of_strings_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let map_of_map_of_strings_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson map_of_strings_of_yojson
    tree path

let list_of_strings_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let map_of_lists_of_strings_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson list_of_strings_of_yojson
    tree path

let empty_struct_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let json_value_of_yojson = string_of_yojson
let list_of_list_of_strings_of_yojson tree path = list_of_yojson list_of_strings_of_yojson tree path
let list_of_maps_of_strings_of_yojson tree path = list_of_yojson map_of_strings_of_yojson tree path
let list_of_structs_of_yojson tree path = list_of_yojson simple_struct_of_yojson tree path

let rec kitchen_sink_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     unix_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "UnixTimestamp")
         _list path;
     timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "Timestamp")
         _list path;
     struct_with_json_name =
       option_of_yojson
         (value_for_key struct_with_json_name_of_yojson "StructWithJsonName")
         _list path;
     string_ =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "String")
         _list path;
     simple_struct =
       option_of_yojson (value_for_key simple_struct_of_yojson "SimpleStruct") _list path;
     recursive_struct =
       option_of_yojson (value_for_key kitchen_sink_of_yojson "RecursiveStruct") _list path;
     recursive_map =
       option_of_yojson (value_for_key map_of_kitchen_sinks_of_yojson "RecursiveMap") _list path;
     recursive_list =
       option_of_yojson (value_for_key list_of_kitchen_sinks_of_yojson "RecursiveList") _list path;
     map_of_structs =
       option_of_yojson (value_for_key map_of_structs_of_yojson "MapOfStructs") _list path;
     map_of_strings =
       option_of_yojson (value_for_key map_of_strings_of_yojson "MapOfStrings") _list path;
     map_of_maps =
       option_of_yojson (value_for_key map_of_map_of_strings_of_yojson "MapOfMaps") _list path;
     map_of_lists_of_strings =
       option_of_yojson
         (value_for_key map_of_lists_of_strings_of_yojson "MapOfListsOfStrings")
         _list path;
     long =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "Long")
         _list path;
     list_of_structs =
       option_of_yojson (value_for_key list_of_structs_of_yojson "ListOfStructs") _list path;
     list_of_strings =
       option_of_yojson (value_for_key list_of_strings_of_yojson "ListOfStrings") _list path;
     list_of_maps_of_strings =
       option_of_yojson
         (value_for_key list_of_maps_of_strings_of_yojson "ListOfMapsOfStrings")
         _list path;
     list_of_lists =
       option_of_yojson (value_for_key list_of_list_of_strings_of_yojson "ListOfLists") _list path;
     json_value = option_of_yojson (value_for_key json_value_of_yojson "JsonValue") _list path;
     iso8601_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "Iso8601Timestamp")
         _list path;
     integer =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "Integer")
         _list path;
     httpdate_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_http_date_of_yojson
            "HttpdateTimestamp")
         _list path;
     float_ =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson "Float")
         _list path;
     empty_struct = option_of_yojson (value_for_key empty_struct_of_yojson "EmptyStruct") _list path;
     double =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "Double")
         _list path;
     boolean_ =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "Boolean")
         _list path;
     blob =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.blob_of_yojson "Blob")
         _list path;
   }
    : kitchen_sink)

and list_of_kitchen_sinks_of_yojson tree path = list_of_yojson kitchen_sink_of_yojson tree path

and map_of_kitchen_sinks_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson kitchen_sink_of_yojson
    tree path

let error_without_members_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let error_with_members_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     string_field =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "StringField")
         _list path;
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
     map_field = option_of_yojson (value_for_key map_of_strings_of_yojson "MapField") _list path;
     list_field = option_of_yojson (value_for_key list_of_strings_of_yojson "ListField") _list path;
     integer_field =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "IntegerField")
         _list path;
     complex_data = option_of_yojson (value_for_key kitchen_sink_of_yojson "ComplexData") _list path;
     code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Code")
         _list path;
   }
    : error_with_members)

let json_int_enums_input_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     int_enum_map =
       option_of_yojson
         (value_for_key Shared.Json_deserializers.integer_enum_map_of_yojson "intEnumMap")
         _list path;
     int_enum_set =
       option_of_yojson
         (value_for_key Shared.Json_deserializers.integer_enum_set_of_yojson "intEnumSet")
         _list path;
     int_enum_list =
       option_of_yojson
         (value_for_key Shared.Json_deserializers.integer_enum_list_of_yojson "intEnumList")
         _list path;
     int_enum3 =
       option_of_yojson
         (value_for_key Shared.Json_deserializers.integer_enum_of_yojson "intEnum3")
         _list path;
     int_enum2 =
       option_of_yojson
         (value_for_key Shared.Json_deserializers.integer_enum_of_yojson "intEnum2")
         _list path;
     int_enum1 =
       option_of_yojson
         (value_for_key Shared.Json_deserializers.integer_enum_of_yojson "intEnum1")
         _list path;
   }
    : json_int_enums_input_output)

let json_enums_input_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     foo_enum_map =
       option_of_yojson
         (value_for_key Shared.Json_deserializers.foo_enum_map_of_yojson "fooEnumMap")
         _list path;
     foo_enum_set =
       option_of_yojson
         (value_for_key Shared.Json_deserializers.foo_enum_set_of_yojson "fooEnumSet")
         _list path;
     foo_enum_list =
       option_of_yojson
         (value_for_key Shared.Json_deserializers.foo_enum_list_of_yojson "fooEnumList")
         _list path;
     foo_enum3 =
       option_of_yojson
         (value_for_key Shared.Json_deserializers.foo_enum_of_yojson "fooEnum3")
         _list path;
     foo_enum2 =
       option_of_yojson
         (value_for_key Shared.Json_deserializers.foo_enum_of_yojson "fooEnum2")
         _list path;
     foo_enum1 =
       option_of_yojson
         (value_for_key Shared.Json_deserializers.foo_enum_of_yojson "fooEnum1")
         _list path;
   }
    : json_enums_input_output)

let invalid_greeting_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message")
         _list path;
   }
    : invalid_greeting)

let foo_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let complex_nested_error_data_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     foo =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Foo")
         _list path;
   }
    : complex_nested_error_data)

let complex_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     nested =
       option_of_yojson (value_for_key complex_nested_error_data_of_yojson "Nested") _list path;
     top_level =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "TopLevel")
         _list path;
   }
    : complex_error)

let greeting_with_errors_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     greeting =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "greeting")
         _list path;
   }
    : greeting_with_errors_output)

let fractional_seconds_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     datetime =
       option_of_yojson
         (value_for_key Shared.Json_deserializers.date_time_of_yojson "datetime")
         _list path;
   }
    : fractional_seconds_output)

let host_label_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     label =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "label" _list path;
   }
    : host_label_input)

let datetime_offsets_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     datetime =
       option_of_yojson
         (value_for_key Shared.Json_deserializers.date_time_of_yojson "datetime")
         _list path;
   }
    : datetime_offsets_output)

let content_type_parameters_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let content_type_parameters_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "value")
         _list path;
   }
    : content_type_parameters_input)
