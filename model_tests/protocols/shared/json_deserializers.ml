open Smaws_Lib.Json.DeserializeHelpers
open Types

let foo_union_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "integer" -> Integer (Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson value_ path)
   | "string" -> String (Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "FooUnion" unknown)
    : foo_union)

let union_set_of_yojson tree path = list_of_yojson foo_union_of_yojson tree path

let timestamp_set_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.timestamp_of_yojson tree path

let timestamp_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.timestamp_of_yojson tree path

let text_plain_blob_of_yojson = blob_of_yojson

let greeting_struct_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hi =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "hi")
         _list path;
   }
    : greeting_struct)

let structure_set_of_yojson tree path = list_of_yojson greeting_struct_of_yojson tree path

let string_set_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let string_map_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let string_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let string_list_map_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson string_list_of_yojson tree
    path

let sparse_string_map_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    (nullable_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson)
    tree path

let sparse_string_list_of_yojson tree path =
  list_of_yojson
    (nullable_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson)
    tree path

let sparse_short_list_of_yojson tree path =
  list_of_yojson
    (nullable_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.short_of_yojson)
    tree path

let short_set_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.short_of_yojson tree path

let short_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.short_of_yojson tree path

let nested_string_list_of_yojson tree path = list_of_yojson string_list_of_yojson tree path

let long_set_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson tree path

let long_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson tree path

let list_set_of_yojson tree path = list_of_yojson string_list_of_yojson tree path
let jpeg_blob_of_yojson = blob_of_yojson

let integer_set_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson tree path

let integer_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson tree path

let integer_enum_of_yojson (tree : t) path =
  ((match tree with
    | `Int 3 -> C
    | `Int 2 -> B
    | `Int 1 -> A
    | `String value -> raise (deserialize_unknown_enum_value_error path "IntegerEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "IntegerEnum")
     : integer_enum)
    : integer_enum)

let integer_enum_set_of_yojson tree path = list_of_yojson integer_enum_of_yojson tree path

let integer_enum_map_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson integer_enum_of_yojson
    tree path

let integer_enum_list_of_yojson tree path = list_of_yojson integer_enum_of_yojson tree path
let http_date_of_yojson = timestamp_epoch_seconds_of_yojson
let http_date_set_of_yojson tree path = list_of_yojson http_date_of_yojson tree path
let greeting_list_of_yojson tree path = list_of_yojson greeting_struct_of_yojson tree path

let foo_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "0" -> ZERO
    | `String "1" -> ONE
    | `String "Bar" -> BAR
    | `String "Baz" -> BAZ
    | `String "Foo" -> FOO
    | `String value -> raise (deserialize_unknown_enum_value_error path "FooEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "FooEnum")
     : foo_enum)
    : foo_enum)

let foo_enum_set_of_yojson tree path = list_of_yojson foo_enum_of_yojson tree path

let foo_enum_map_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson foo_enum_of_yojson tree
    path

let foo_enum_list_of_yojson tree path = list_of_yojson foo_enum_of_yojson tree path

let float_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson tree path

let epoch_seconds_of_yojson = timestamp_epoch_seconds_of_yojson

let double_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson tree path

let date_time_of_yojson = timestamp_epoch_seconds_of_yojson
let date_time_set_of_yojson tree path = list_of_yojson date_time_of_yojson tree path
let date_time_list_of_yojson tree path = list_of_yojson date_time_of_yojson tree path

let byte_set_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.byte_of_yojson tree path

let byte_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.byte_of_yojson tree path

let boolean_set_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson tree path

let boolean_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson tree path

let blob_set_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.blob_of_yojson tree path

let blob_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.blob_of_yojson tree path
