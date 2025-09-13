open Smaws_Lib.Json.SerializeHelpers
open Types

let my_union_to_yojson (x : my_union) =
  match x with
  | StructureValue arg ->
      assoc_to_yojson
        [ ("structureValue", Some (Shared.Json_serializers.greeting_struct_to_yojson arg)) ]
  | MapValue arg ->
      assoc_to_yojson [ ("mapValue", Some (Shared.Json_serializers.string_map_to_yojson arg)) ]
  | ListValue arg ->
      assoc_to_yojson [ ("listValue", Some (Shared.Json_serializers.string_list_to_yojson arg)) ]
  | EnumValue arg ->
      assoc_to_yojson [ ("enumValue", Some (Shared.Json_serializers.foo_enum_to_yojson arg)) ]
  | TimestampValue arg ->
      assoc_to_yojson
        [ ("timestampValue", Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson arg)) ]
  | BlobValue arg ->
      assoc_to_yojson
        [ ("blobValue", Some (Smaws_Lib.Smithy_api.Json_serializers.blob_to_yojson arg)) ]
  | NumberValue arg ->
      assoc_to_yojson
        [ ("numberValue", Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson arg)) ]
  | BooleanValue arg ->
      assoc_to_yojson
        [ ("booleanValue", Some (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson arg)) ]
  | StringValue arg ->
      assoc_to_yojson
        [ ("stringValue", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]

let union_input_output_to_yojson (x : union_input_output) =
  assoc_to_yojson [ ("contents", option_to_yojson my_union_to_yojson x.contents) ]

let struct_with_json_name_to_yojson (x : struct_with_json_name) =
  assoc_to_yojson
    [ ("Value", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.value) ]

let sparse_nulls_operation_input_output_to_yojson (x : sparse_nulls_operation_input_output) =
  assoc_to_yojson
    [
      ( "sparseStringMap",
        option_to_yojson Shared.Json_serializers.sparse_string_map_to_yojson x.sparse_string_map );
      ( "sparseStringList",
        option_to_yojson Shared.Json_serializers.sparse_string_list_to_yojson x.sparse_string_list
      );
    ]

let simple_struct_to_yojson (x : simple_struct) =
  assoc_to_yojson
    [ ("Value", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.value) ]

let simple_scalar_properties_input_output_to_yojson (x : simple_scalar_properties_input_output) =
  assoc_to_yojson
    [
      ( "doubleValue",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.double_value );
      ( "floatValue",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.float_value );
    ]

let put_with_content_encoding_input_to_yojson (x : put_with_content_encoding_input) =
  assoc_to_yojson
    [
      ("data", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.data);
      ( "encoding",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.encoding );
    ]

let document_to_yojson = json_to_yojson

let put_and_get_inline_documents_input_output_to_yojson
    (x : put_and_get_inline_documents_input_output) =
  assoc_to_yojson [ ("inlineDocument", option_to_yojson document_to_yojson x.inline_document) ]

let operation_with_optional_input_output_output_to_yojson
    (x : operation_with_optional_input_output_output) =
  assoc_to_yojson
    [ ("Value", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.value) ]

let operation_with_optional_input_output_input_to_yojson
    (x : operation_with_optional_input_output_input) =
  assoc_to_yojson
    [ ("Value", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.value) ]

let null_operation_input_output_to_yojson (x : null_operation_input_output) =
  assoc_to_yojson
    [
      ("string", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.string_);
    ]

let map_of_structs_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson simple_struct_to_yojson tree

let map_of_strings_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let map_of_map_of_strings_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson map_of_strings_to_yojson
    tree

let list_of_strings_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let map_of_lists_of_strings_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson list_of_strings_to_yojson
    tree

let empty_struct_to_yojson = unit_to_yojson
let json_value_to_yojson = string_to_yojson
let list_of_list_of_strings_to_yojson tree = list_to_yojson list_of_strings_to_yojson tree
let list_of_maps_of_strings_to_yojson tree = list_to_yojson map_of_strings_to_yojson tree
let list_of_structs_to_yojson tree = list_to_yojson simple_struct_to_yojson tree

let rec kitchen_sink_to_yojson (x : kitchen_sink) =
  assoc_to_yojson
    [
      ( "UnixTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson x.unix_timestamp
      );
      ( "Timestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson x.timestamp );
      ( "StructWithJsonName",
        option_to_yojson struct_with_json_name_to_yojson x.struct_with_json_name );
      ("String", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.string_);
      ("SimpleStruct", option_to_yojson simple_struct_to_yojson x.simple_struct);
      ("RecursiveStruct", option_to_yojson kitchen_sink_to_yojson x.recursive_struct);
      ("RecursiveMap", option_to_yojson map_of_kitchen_sinks_to_yojson x.recursive_map);
      ("RecursiveList", option_to_yojson list_of_kitchen_sinks_to_yojson x.recursive_list);
      ("MapOfStructs", option_to_yojson map_of_structs_to_yojson x.map_of_structs);
      ("MapOfStrings", option_to_yojson map_of_strings_to_yojson x.map_of_strings);
      ("MapOfMaps", option_to_yojson map_of_map_of_strings_to_yojson x.map_of_maps);
      ( "MapOfListsOfStrings",
        option_to_yojson map_of_lists_of_strings_to_yojson x.map_of_lists_of_strings );
      ("Long", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.long);
      ("ListOfStructs", option_to_yojson list_of_structs_to_yojson x.list_of_structs);
      ("ListOfStrings", option_to_yojson list_of_strings_to_yojson x.list_of_strings);
      ( "ListOfMapsOfStrings",
        option_to_yojson list_of_maps_of_strings_to_yojson x.list_of_maps_of_strings );
      ("ListOfLists", option_to_yojson list_of_list_of_strings_to_yojson x.list_of_lists);
      ("JsonValue", option_to_yojson json_value_to_yojson x.json_value);
      ( "Iso8601Timestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson
          x.iso8601_timestamp );
      ("Integer", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.integer);
      ( "HttpdateTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson
          x.httpdate_timestamp );
      ("Float", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.float_);
      ("EmptyStruct", option_to_yojson empty_struct_to_yojson x.empty_struct);
      ("Double", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.double);
      ( "Boolean",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.boolean_ );
      ("Blob", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.blob_to_yojson x.blob);
    ]

and list_of_kitchen_sinks_to_yojson tree = list_to_yojson kitchen_sink_to_yojson tree

and map_of_kitchen_sinks_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson kitchen_sink_to_yojson tree

let error_without_members_to_yojson = unit_to_yojson

let error_with_members_to_yojson (x : error_with_members) =
  assoc_to_yojson
    [
      ( "StringField",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.string_field );
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
      ("MapField", option_to_yojson map_of_strings_to_yojson x.map_field);
      ("ListField", option_to_yojson list_of_strings_to_yojson x.list_field);
      ( "IntegerField",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.integer_field );
      ("ComplexData", option_to_yojson kitchen_sink_to_yojson x.complex_data);
      ("Code", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.code);
    ]

let json_int_enums_input_output_to_yojson (x : json_int_enums_input_output) =
  assoc_to_yojson
    [
      ( "intEnumMap",
        option_to_yojson Shared.Json_serializers.integer_enum_map_to_yojson x.int_enum_map );
      ( "intEnumSet",
        option_to_yojson Shared.Json_serializers.integer_enum_set_to_yojson x.int_enum_set );
      ( "intEnumList",
        option_to_yojson Shared.Json_serializers.integer_enum_list_to_yojson x.int_enum_list );
      ("intEnum3", option_to_yojson Shared.Json_serializers.integer_enum_to_yojson x.int_enum3);
      ("intEnum2", option_to_yojson Shared.Json_serializers.integer_enum_to_yojson x.int_enum2);
      ("intEnum1", option_to_yojson Shared.Json_serializers.integer_enum_to_yojson x.int_enum1);
    ]

let json_enums_input_output_to_yojson (x : json_enums_input_output) =
  assoc_to_yojson
    [
      ("fooEnumMap", option_to_yojson Shared.Json_serializers.foo_enum_map_to_yojson x.foo_enum_map);
      ("fooEnumSet", option_to_yojson Shared.Json_serializers.foo_enum_set_to_yojson x.foo_enum_set);
      ( "fooEnumList",
        option_to_yojson Shared.Json_serializers.foo_enum_list_to_yojson x.foo_enum_list );
      ("fooEnum3", option_to_yojson Shared.Json_serializers.foo_enum_to_yojson x.foo_enum3);
      ("fooEnum2", option_to_yojson Shared.Json_serializers.foo_enum_to_yojson x.foo_enum2);
      ("fooEnum1", option_to_yojson Shared.Json_serializers.foo_enum_to_yojson x.foo_enum1);
    ]

let invalid_greeting_to_yojson (x : invalid_greeting) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let foo_error_to_yojson = unit_to_yojson

let complex_nested_error_data_to_yojson (x : complex_nested_error_data) =
  assoc_to_yojson
    [ ("Foo", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.foo) ]

let complex_error_to_yojson (x : complex_error) =
  assoc_to_yojson
    [
      ("Nested", option_to_yojson complex_nested_error_data_to_yojson x.nested);
      ( "TopLevel",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.top_level );
    ]

let greeting_with_errors_output_to_yojson (x : greeting_with_errors_output) =
  assoc_to_yojson
    [
      ( "greeting",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.greeting );
    ]

let fractional_seconds_output_to_yojson (x : fractional_seconds_output) =
  assoc_to_yojson
    [ ("datetime", option_to_yojson Shared.Json_serializers.date_time_to_yojson x.datetime) ]

let host_label_input_to_yojson (x : host_label_input) =
  assoc_to_yojson
    [ ("label", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.label)) ]

let datetime_offsets_output_to_yojson (x : datetime_offsets_output) =
  assoc_to_yojson
    [ ("datetime", option_to_yojson Shared.Json_serializers.date_time_to_yojson x.datetime) ]

let content_type_parameters_output_to_yojson = unit_to_yojson

let content_type_parameters_input_to_yojson (x : content_type_parameters_input) =
  assoc_to_yojson
    [ ("value", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.value) ]
