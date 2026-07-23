open Smaws_Lib.Json.SerializeHelpers
open Types

let complex_nested_error_data_to_yojson (x : complex_nested_error_data) =
  assoc_to_yojson
    [ ("Foo", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.foo) ]

let complex_error_to_yojson (x : complex_error) =
  assoc_to_yojson
    [
      ( "TopLevel",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.top_level );
      ("Nested", option_to_yojson complex_nested_error_data_to_yojson x.nested);
    ]

let content_type_parameters_output_to_yojson = unit_to_yojson

let content_type_parameters_input_to_yojson (x : content_type_parameters_input) =
  assoc_to_yojson
    [ ("value", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.value) ]

let datetime_offsets_output_to_yojson (x : datetime_offsets_output) =
  assoc_to_yojson
    [ ("datetime", option_to_yojson Shared.Json_serializers.date_time_to_yojson x.datetime) ]

let document_to_yojson = json_to_yojson
let empty_struct_to_yojson = unit_to_yojson

let host_label_input_to_yojson (x : host_label_input) =
  assoc_to_yojson
    [ ("label", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.label)) ]

let map_of_strings_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let list_of_strings_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let struct_with_json_name_to_yojson (x : struct_with_json_name) =
  assoc_to_yojson
    [ ("Value", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.value) ]

let simple_struct_to_yojson (x : simple_struct) =
  assoc_to_yojson
    [ ("Value", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.value) ]

let map_of_structs_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson simple_struct_to_yojson tree

let map_of_map_of_strings_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson map_of_strings_to_yojson
    tree

let map_of_lists_of_strings_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson list_of_strings_to_yojson
    tree

let list_of_structs_to_yojson tree = list_to_yojson simple_struct_to_yojson tree
let list_of_maps_of_strings_to_yojson tree = list_to_yojson map_of_strings_to_yojson tree
let list_of_list_of_strings_to_yojson tree = list_to_yojson list_of_strings_to_yojson tree
let json_value_to_yojson = string_to_yojson

let rec map_of_kitchen_sinks_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson kitchen_sink_to_yojson tree

and list_of_kitchen_sinks_to_yojson tree = list_to_yojson kitchen_sink_to_yojson tree

and kitchen_sink_to_yojson (x : kitchen_sink) =
  assoc_to_yojson
    [
      ("Blob", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.blob_to_yojson x.blob);
      ( "Boolean",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.boolean_ );
      ("Double", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.double);
      ("EmptyStruct", option_to_yojson empty_struct_to_yojson x.empty_struct);
      ("Float", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.float_);
      ( "HttpdateTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_http_date_to_yojson
          x.httpdate_timestamp );
      ("Integer", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.integer);
      ( "Iso8601Timestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.iso8601_timestamp );
      ("JsonValue", option_to_yojson json_value_to_yojson x.json_value);
      ("ListOfLists", option_to_yojson list_of_list_of_strings_to_yojson x.list_of_lists);
      ( "ListOfMapsOfStrings",
        option_to_yojson list_of_maps_of_strings_to_yojson x.list_of_maps_of_strings );
      ("ListOfStrings", option_to_yojson list_of_strings_to_yojson x.list_of_strings);
      ("ListOfStructs", option_to_yojson list_of_structs_to_yojson x.list_of_structs);
      ("Long", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.long);
      ( "MapOfListsOfStrings",
        option_to_yojson map_of_lists_of_strings_to_yojson x.map_of_lists_of_strings );
      ("MapOfMaps", option_to_yojson map_of_map_of_strings_to_yojson x.map_of_maps);
      ("MapOfStrings", option_to_yojson map_of_strings_to_yojson x.map_of_strings);
      ("MapOfStructs", option_to_yojson map_of_structs_to_yojson x.map_of_structs);
      ("RecursiveList", option_to_yojson list_of_kitchen_sinks_to_yojson x.recursive_list);
      ("RecursiveMap", option_to_yojson map_of_kitchen_sinks_to_yojson x.recursive_map);
      ("RecursiveStruct", option_to_yojson kitchen_sink_to_yojson x.recursive_struct);
      ("SimpleStruct", option_to_yojson simple_struct_to_yojson x.simple_struct);
      ("String", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.string_);
      ( "StructWithJsonName",
        option_to_yojson struct_with_json_name_to_yojson x.struct_with_json_name );
      ( "Timestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.timestamp );
      ( "UnixTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.unix_timestamp );
    ]

let error_with_members_to_yojson (x : error_with_members) =
  assoc_to_yojson
    [
      ("Code", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.code);
      ("ComplexData", option_to_yojson kitchen_sink_to_yojson x.complex_data);
      ( "IntegerField",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.integer_field );
      ("ListField", option_to_yojson list_of_strings_to_yojson x.list_field);
      ("MapField", option_to_yojson map_of_strings_to_yojson x.map_field);
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
      ( "StringField",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.string_field );
    ]

let error_without_members_to_yojson = unit_to_yojson
let foo_error_to_yojson = unit_to_yojson

let fractional_seconds_output_to_yojson (x : fractional_seconds_output) =
  assoc_to_yojson
    [ ("datetime", option_to_yojson Shared.Json_serializers.date_time_to_yojson x.datetime) ]

let invalid_greeting_to_yojson (x : invalid_greeting) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let greeting_with_errors_output_to_yojson (x : greeting_with_errors_output) =
  assoc_to_yojson
    [
      ( "greeting",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.greeting );
    ]

let json_enums_input_output_to_yojson (x : json_enums_input_output) =
  assoc_to_yojson
    [
      ("fooEnum1", option_to_yojson Shared.Json_serializers.foo_enum_to_yojson x.foo_enum1);
      ("fooEnum2", option_to_yojson Shared.Json_serializers.foo_enum_to_yojson x.foo_enum2);
      ("fooEnum3", option_to_yojson Shared.Json_serializers.foo_enum_to_yojson x.foo_enum3);
      ( "fooEnumList",
        option_to_yojson Shared.Json_serializers.foo_enum_list_to_yojson x.foo_enum_list );
      ("fooEnumSet", option_to_yojson Shared.Json_serializers.foo_enum_set_to_yojson x.foo_enum_set);
      ("fooEnumMap", option_to_yojson Shared.Json_serializers.foo_enum_map_to_yojson x.foo_enum_map);
    ]

let json_int_enums_input_output_to_yojson (x : json_int_enums_input_output) =
  assoc_to_yojson
    [
      ("intEnum1", option_to_yojson Shared.Json_serializers.integer_enum_to_yojson x.int_enum1);
      ("intEnum2", option_to_yojson Shared.Json_serializers.integer_enum_to_yojson x.int_enum2);
      ("intEnum3", option_to_yojson Shared.Json_serializers.integer_enum_to_yojson x.int_enum3);
      ( "intEnumList",
        option_to_yojson Shared.Json_serializers.integer_enum_list_to_yojson x.int_enum_list );
      ( "intEnumSet",
        option_to_yojson Shared.Json_serializers.integer_enum_set_to_yojson x.int_enum_set );
      ( "intEnumMap",
        option_to_yojson Shared.Json_serializers.integer_enum_map_to_yojson x.int_enum_map );
    ]

let sparse_nulls_operation_input_output_to_yojson (x : sparse_nulls_operation_input_output) =
  assoc_to_yojson
    [
      ( "sparseStringList",
        option_to_yojson Shared.Json_serializers.sparse_string_list_to_yojson x.sparse_string_list
      );
      ( "sparseStringMap",
        option_to_yojson Shared.Json_serializers.sparse_string_map_to_yojson x.sparse_string_map );
    ]

let simple_scalar_properties_input_output_to_yojson (x : simple_scalar_properties_input_output) =
  assoc_to_yojson
    [
      ( "floatValue",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.float_value );
      ( "doubleValue",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.double_value );
    ]

let put_with_content_encoding_input_to_yojson (x : put_with_content_encoding_input) =
  assoc_to_yojson
    [
      ( "encoding",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.encoding );
      ("data", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.data);
    ]

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

let my_union_to_yojson (x : my_union) =
  match x with
  | StringValue arg ->
      assoc_to_yojson
        [ ("stringValue", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]
  | BooleanValue arg ->
      assoc_to_yojson
        [ ("booleanValue", Some (Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson arg)) ]
  | NumberValue arg ->
      assoc_to_yojson
        [ ("numberValue", Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson arg)) ]
  | BlobValue arg ->
      assoc_to_yojson
        [ ("blobValue", Some (Smaws_Lib.Smithy_api.Json_serializers.blob_to_yojson arg)) ]
  | TimestampValue arg ->
      assoc_to_yojson
        [
          ( "timestampValue",
            Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson arg) );
        ]
  | EnumValue arg ->
      assoc_to_yojson [ ("enumValue", Some (Shared.Json_serializers.foo_enum_to_yojson arg)) ]
  | ListValue arg ->
      assoc_to_yojson [ ("listValue", Some (Shared.Json_serializers.string_list_to_yojson arg)) ]
  | MapValue arg ->
      assoc_to_yojson [ ("mapValue", Some (Shared.Json_serializers.string_map_to_yojson arg)) ]
  | StructureValue arg ->
      assoc_to_yojson
        [ ("structureValue", Some (Shared.Json_serializers.greeting_struct_to_yojson arg)) ]

let union_input_output_to_yojson (x : union_input_output) =
  assoc_to_yojson [ ("contents", option_to_yojson my_union_to_yojson x.contents) ]
