open Smaws_Lib.Json.SerializeHelpers
open Types

let foo_union_to_yojson (x : foo_union) =
  match x with
  | Integer arg ->
      assoc_to_yojson
        [ ("integer", Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson arg)) ]
  | String arg ->
      assoc_to_yojson
        [ ("string", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson arg)) ]

let union_set_to_yojson tree = list_to_yojson foo_union_to_yojson tree

let timestamp_set_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson tree

let timestamp_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson tree

let text_plain_blob_to_yojson = blob_to_yojson

let greeting_struct_to_yojson (x : greeting_struct) =
  assoc_to_yojson
    [ ("hi", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.hi) ]

let structure_set_to_yojson tree = list_to_yojson greeting_struct_to_yojson tree

let string_set_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let string_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let string_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let string_list_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson string_list_to_yojson tree

let sparse_string_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    (nullable_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson)
    tree

let sparse_string_list_to_yojson tree =
  list_to_yojson (nullable_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson) tree

let sparse_short_list_to_yojson tree =
  list_to_yojson (nullable_to_yojson Smaws_Lib.Smithy_api.Json_serializers.short_to_yojson) tree

let short_set_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.short_to_yojson tree

let short_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.short_to_yojson tree

let nested_string_list_to_yojson tree = list_to_yojson string_list_to_yojson tree

let long_set_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson tree

let long_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson tree

let list_set_to_yojson tree = list_to_yojson string_list_to_yojson tree
let jpeg_blob_to_yojson = blob_to_yojson

let integer_set_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson tree

let integer_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson tree

let integer_enum_to_yojson (x : integer_enum) =
  match x with C -> `Int 3 | B -> `Int 2 | A -> `Int 1

let integer_enum_set_to_yojson tree = list_to_yojson integer_enum_to_yojson tree

let integer_enum_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson integer_enum_to_yojson tree

let integer_enum_list_to_yojson tree = list_to_yojson integer_enum_to_yojson tree
let http_date_to_yojson = timestamp_to_yojson
let http_date_set_to_yojson tree = list_to_yojson http_date_to_yojson tree
let greeting_list_to_yojson tree = list_to_yojson greeting_struct_to_yojson tree

let foo_enum_to_yojson (x : foo_enum) =
  match x with
  | ZERO -> `String "0"
  | ONE -> `String "1"
  | BAR -> `String "Bar"
  | BAZ -> `String "Baz"
  | FOO -> `String "Foo"

let foo_enum_set_to_yojson tree = list_to_yojson foo_enum_to_yojson tree

let foo_enum_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson foo_enum_to_yojson tree

let foo_enum_list_to_yojson tree = list_to_yojson foo_enum_to_yojson tree

let float_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson tree

let epoch_seconds_to_yojson = timestamp_to_yojson

let double_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson tree

let date_time_to_yojson = timestamp_to_yojson
let date_time_set_to_yojson tree = list_to_yojson date_time_to_yojson tree
let date_time_list_to_yojson tree = list_to_yojson date_time_to_yojson tree

let byte_set_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.byte_to_yojson tree

let byte_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.byte_to_yojson tree

let boolean_set_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson tree

let boolean_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson tree

let blob_set_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.blob_to_yojson tree

let blob_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.blob_to_yojson tree
