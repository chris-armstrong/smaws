open Smaws_Lib.Json.DeserializeHelpers
open Types
let my_string_key_of_yojson = string_of_yojson
let missing_key_structure_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ hi = (value_for_key my_string_key_of_yojson "hi" _list path) } : 
    missing_key_structure)
let structure_set_with_no_key_of_yojson tree path =
  list_of_yojson missing_key_structure_of_yojson tree path
let sensitive_pattern_string_of_yojson = string_of_yojson
let sensitive_validation_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     string_ =
       (option_of_yojson
          (value_for_key sensitive_pattern_string_of_yojson "string") _list
          path)
   } : sensitive_validation_input)
let recursive_enum_string_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "def" -> DEF
    | `String "abc" -> ABC
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "RecursiveEnumString"
             value)
    | _ -> raise (deserialize_wrong_type_error path "RecursiveEnumString") : 
     recursive_enum_string) : recursive_enum_string)
let rec recursive_union_one_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let (key, value_) =
    match _list with
    | (key, value_)::_ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union") in
  (match key with
   | "union" -> Union (recursive_union_two_of_yojson value_ path)
   | "string" -> String (recursive_enum_string_of_yojson value_ path)
   | _ as unknown ->
       raise
         (deserialize_unknown_enum_value_error path "RecursiveUnionOne"
            unknown) : recursive_union_one)
and recursive_union_two_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let (key, value_) =
    match _list with
    | (key, value_)::_ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union") in
  (match key with
   | "union" -> Union (recursive_union_one_of_yojson value_ path)
   | "string" -> String (recursive_enum_string_of_yojson value_ path)
   | _ as unknown ->
       raise
         (deserialize_unknown_enum_value_error path "RecursiveUnionTwo"
            unknown) : recursive_union_two)
let recursive_structures_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     union =
       (option_of_yojson
          (value_for_key recursive_union_one_of_yojson "union") _list path)
   } : recursive_structures_input)
let malformed_unique_items_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     union_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.union_set_of_yojson
             "unionList") _list path);
     structure_list_with_no_key =
       (option_of_yojson
          (value_for_key structure_set_with_no_key_of_yojson
             "structureListWithNoKey") _list path);
     structure_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.structure_set_of_yojson
             "structureList") _list path);
     list_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.list_set_of_yojson
             "listList") _list path);
     int_enum_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.integer_enum_set_of_yojson
             "intEnumList") _list path);
     enum_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.foo_enum_set_of_yojson
             "enumList") _list path);
     http_date_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.http_date_set_of_yojson
             "httpDateList") _list path);
     date_time_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.date_time_set_of_yojson
             "dateTimeList") _list path);
     timestamp_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.timestamp_set_of_yojson
             "timestampList") _list path);
     long_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.long_set_of_yojson
             "longList") _list path);
     integer_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.integer_set_of_yojson
             "integerList") _list path);
     short_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.short_set_of_yojson
             "shortList") _list path);
     byte_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.byte_set_of_yojson
             "byteList") _list path);
     string_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.string_set_of_yojson
             "stringList") _list path);
     boolean_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.boolean_set_of_yojson
             "booleanList") _list path);
     blob_list =
       (option_of_yojson
          (value_for_key Shared.Json_deserializers.blob_set_of_yojson
             "blobList") _list path)
   } : malformed_unique_items_input)
let malformed_required_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     string_in_header =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
          "stringInHeader" _list path);
     string_in_query =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
          "stringInQuery" _list path);
     string_ =
       (value_for_key
          Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "string"
          _list path)
   } : malformed_required_input)
let range_byte_of_yojson = byte_of_yojson
let min_byte_of_yojson = byte_of_yojson
let max_byte_of_yojson = byte_of_yojson
let range_short_of_yojson = short_of_yojson
let min_short_of_yojson = short_of_yojson
let max_short_of_yojson = short_of_yojson
let range_integer_of_yojson = int_of_yojson
let min_integer_of_yojson = int_of_yojson
let max_integer_of_yojson = int_of_yojson
let range_long_of_yojson = long_of_yojson
let min_long_of_yojson = long_of_yojson
let max_long_of_yojson = long_of_yojson
let range_float_of_yojson = float_of_yojson
let min_float_of_yojson = float_of_yojson
let max_float_of_yojson = float_of_yojson
let malformed_range_override_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_float =
       (option_of_yojson (value_for_key max_float_of_yojson "maxFloat") _list
          path);
     min_float =
       (option_of_yojson (value_for_key min_float_of_yojson "minFloat") _list
          path);
     float_ =
       (option_of_yojson (value_for_key range_float_of_yojson "float") _list
          path);
     max_long =
       (option_of_yojson (value_for_key max_long_of_yojson "maxLong") _list
          path);
     min_long =
       (option_of_yojson (value_for_key min_long_of_yojson "minLong") _list
          path);
     long =
       (option_of_yojson (value_for_key range_long_of_yojson "long") _list
          path);
     max_integer =
       (option_of_yojson (value_for_key max_integer_of_yojson "maxInteger")
          _list path);
     min_integer =
       (option_of_yojson (value_for_key min_integer_of_yojson "minInteger")
          _list path);
     integer =
       (option_of_yojson (value_for_key range_integer_of_yojson "integer")
          _list path);
     max_short =
       (option_of_yojson (value_for_key max_short_of_yojson "maxShort") _list
          path);
     min_short =
       (option_of_yojson (value_for_key min_short_of_yojson "minShort") _list
          path);
     short =
       (option_of_yojson (value_for_key range_short_of_yojson "short") _list
          path);
     max_byte =
       (option_of_yojson (value_for_key max_byte_of_yojson "maxByte") _list
          path);
     min_byte =
       (option_of_yojson (value_for_key min_byte_of_yojson "minByte") _list
          path);
     byte =
       (option_of_yojson (value_for_key range_byte_of_yojson "byte") _list
          path)
   } : malformed_range_override_input)
let malformed_range_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_float =
       (option_of_yojson (value_for_key max_float_of_yojson "maxFloat") _list
          path);
     min_float =
       (option_of_yojson (value_for_key min_float_of_yojson "minFloat") _list
          path);
     float_ =
       (option_of_yojson (value_for_key range_float_of_yojson "float") _list
          path);
     max_long =
       (option_of_yojson (value_for_key max_long_of_yojson "maxLong") _list
          path);
     min_long =
       (option_of_yojson (value_for_key min_long_of_yojson "minLong") _list
          path);
     long =
       (option_of_yojson (value_for_key range_long_of_yojson "long") _list
          path);
     max_integer =
       (option_of_yojson (value_for_key max_integer_of_yojson "maxInteger")
          _list path);
     min_integer =
       (option_of_yojson (value_for_key min_integer_of_yojson "minInteger")
          _list path);
     integer =
       (option_of_yojson (value_for_key range_integer_of_yojson "integer")
          _list path);
     max_short =
       (option_of_yojson (value_for_key max_short_of_yojson "maxShort") _list
          path);
     min_short =
       (option_of_yojson (value_for_key min_short_of_yojson "minShort") _list
          path);
     short =
       (option_of_yojson (value_for_key range_short_of_yojson "short") _list
          path);
     max_byte =
       (option_of_yojson (value_for_key max_byte_of_yojson "maxByte") _list
          path);
     min_byte =
       (option_of_yojson (value_for_key min_byte_of_yojson "minByte") _list
          path);
     byte =
       (option_of_yojson (value_for_key range_byte_of_yojson "byte") _list
          path)
   } : malformed_range_input)
let pattern_string_of_yojson = string_of_yojson
let pattern_list_override_of_yojson tree path =
  list_of_yojson pattern_string_of_yojson tree path
let pattern_map_override_of_yojson tree path =
  map_of_yojson pattern_string_of_yojson pattern_string_of_yojson tree path
let pattern_union_override_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let (key, value_) =
    match _list with
    | (key, value_)::_ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union") in
  (match key with
   | "second" -> Second (pattern_string_of_yojson value_ path)
   | "first" -> First (pattern_string_of_yojson value_ path)
   | _ as unknown ->
       raise
         (deserialize_unknown_enum_value_error path "PatternUnionOverride"
            unknown) : pattern_union_override)
let malformed_pattern_override_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     union =
       (option_of_yojson
          (value_for_key pattern_union_override_of_yojson "union") _list path);
     map =
       (option_of_yojson (value_for_key pattern_map_override_of_yojson "map")
          _list path);
     list =
       (option_of_yojson
          (value_for_key pattern_list_override_of_yojson "list") _list path);
     string_ =
       (option_of_yojson (value_for_key pattern_string_of_yojson "string")
          _list path)
   } : malformed_pattern_override_input)
let evil_string_of_yojson = string_of_yojson
let pattern_list_of_yojson tree path =
  list_of_yojson pattern_string_of_yojson tree path
let pattern_map_of_yojson tree path =
  map_of_yojson pattern_string_of_yojson pattern_string_of_yojson tree path
let pattern_union_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let (key, value_) =
    match _list with
    | (key, value_)::_ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union") in
  (match key with
   | "second" -> Second (pattern_string_of_yojson value_ path)
   | "first" -> First (pattern_string_of_yojson value_ path)
   | _ as unknown ->
       raise
         (deserialize_unknown_enum_value_error path "PatternUnion" unknown) : 
    pattern_union)
let malformed_pattern_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     union =
       (option_of_yojson (value_for_key pattern_union_of_yojson "union")
          _list path);
     map =
       (option_of_yojson (value_for_key pattern_map_of_yojson "map") _list
          path);
     list =
       (option_of_yojson (value_for_key pattern_list_of_yojson "list") _list
          path);
     evil_string =
       (option_of_yojson (value_for_key evil_string_of_yojson "evilString")
          _list path);
     string_ =
       (option_of_yojson (value_for_key pattern_string_of_yojson "string")
          _list path)
   } : malformed_pattern_input)
let length_string_of_yojson = string_of_yojson
let malformed_length_query_string_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     string_ =
       (option_of_yojson (value_for_key length_string_of_yojson "string")
          _list path)
   } : malformed_length_query_string_input)
let length_blob_of_yojson = blob_of_yojson
let min_length_string_of_yojson = string_of_yojson
let max_length_string_of_yojson = string_of_yojson
let length_list_of_yojson tree path =
  list_of_yojson length_string_of_yojson tree path
let length_map_of_yojson tree path =
  map_of_yojson length_string_of_yojson length_list_of_yojson tree path
let malformed_length_override_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     map =
       (option_of_yojson (value_for_key length_map_of_yojson "map") _list
          path);
     list =
       (option_of_yojson (value_for_key length_list_of_yojson "list") _list
          path);
     max_string =
       (option_of_yojson
          (value_for_key max_length_string_of_yojson "maxString") _list path);
     min_string =
       (option_of_yojson
          (value_for_key min_length_string_of_yojson "minString") _list path);
     string_ =
       (option_of_yojson (value_for_key length_string_of_yojson "string")
          _list path);
     blob =
       (option_of_yojson (value_for_key length_blob_of_yojson "blob") _list
          path)
   } : malformed_length_override_input)
let malformed_length_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     map =
       (option_of_yojson (value_for_key length_map_of_yojson "map") _list
          path);
     list =
       (option_of_yojson (value_for_key length_list_of_yojson "list") _list
          path);
     max_string =
       (option_of_yojson
          (value_for_key max_length_string_of_yojson "maxString") _list path);
     min_string =
       (option_of_yojson
          (value_for_key min_length_string_of_yojson "minString") _list path);
     string_ =
       (option_of_yojson (value_for_key length_string_of_yojson "string")
          _list path);
     blob =
       (option_of_yojson (value_for_key length_blob_of_yojson "blob") _list
          path)
   } : malformed_length_input)
let enum_string_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "jkl" -> JKL
    | `String "ghi" -> GHI
    | `String "def" -> DEF
    | `String "abc" -> ABC
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "EnumString" value)
    | _ -> raise (deserialize_wrong_type_error path "EnumString") : enum_string) : 
  enum_string)
let enum_trait_string_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "abc" -> ABC
    | `String "def" -> DEF
    | `String "ghi" -> GHI
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "EnumTraitString" value)
    | _ -> raise (deserialize_wrong_type_error path "EnumTraitString") : 
     enum_trait_string) : enum_trait_string)
let enum_list_of_yojson tree path =
  list_of_yojson enum_string_of_yojson tree path
let enum_map_of_yojson tree path =
  map_of_yojson enum_string_of_yojson enum_string_of_yojson tree path
let enum_union_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let (key, value_) =
    match _list with
    | (key, value_)::_ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union") in
  (match key with
   | "second" -> Second (enum_string_of_yojson value_ path)
   | "first" -> First (enum_string_of_yojson value_ path)
   | _ as unknown ->
       raise (deserialize_unknown_enum_value_error path "EnumUnion" unknown) : 
    enum_union)
let malformed_enum_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     union =
       (option_of_yojson (value_for_key enum_union_of_yojson "union") _list
          path);
     map =
       (option_of_yojson (value_for_key enum_map_of_yojson "map") _list path);
     list =
       (option_of_yojson (value_for_key enum_list_of_yojson "list") _list
          path);
     string_with_enum_trait =
       (option_of_yojson
          (value_for_key enum_trait_string_of_yojson "stringWithEnumTrait")
          _list path);
     string_ =
       (option_of_yojson (value_for_key enum_string_of_yojson "string") _list
          path)
   } : malformed_enum_input)