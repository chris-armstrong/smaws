open Smaws_Lib.Json.SerializeHelpers
open Types
let my_string_key_to_yojson = string_to_yojson
let missing_key_structure_to_yojson (x : missing_key_structure) =
  assoc_to_yojson [("hi", (Some (my_string_key_to_yojson x.hi)))]
let structure_set_with_no_key_to_yojson tree =
  list_to_yojson missing_key_structure_to_yojson tree
let sensitive_pattern_string_to_yojson = string_to_yojson
let sensitive_validation_input_to_yojson (x : sensitive_validation_input) =
  assoc_to_yojson
    [("string",
       (option_to_yojson sensitive_pattern_string_to_yojson x.string_))]
let recursive_enum_string_to_yojson (x : recursive_enum_string) =
  match x with | DEF -> `String "def" | ABC -> `String "abc"
let rec recursive_union_one_to_yojson (x : recursive_union_one) =
  match x with
  | Union arg ->
      assoc_to_yojson [("union", (Some (recursive_union_two_to_yojson arg)))]
  | String arg ->
      assoc_to_yojson
        [("string", (Some (recursive_enum_string_to_yojson arg)))]
and recursive_union_two_to_yojson (x : recursive_union_two) =
  match x with
  | Union arg ->
      assoc_to_yojson [("union", (Some (recursive_union_one_to_yojson arg)))]
  | String arg ->
      assoc_to_yojson
        [("string", (Some (recursive_enum_string_to_yojson arg)))]
let recursive_structures_input_to_yojson (x : recursive_structures_input) =
  assoc_to_yojson
    [("union", (option_to_yojson recursive_union_one_to_yojson x.union))]
let malformed_unique_items_input_to_yojson (x : malformed_unique_items_input)
  =
  assoc_to_yojson
    [("unionList",
       (option_to_yojson Shared.Json_serializers.union_set_to_yojson
          x.union_list));
    ("structureListWithNoKey",
      (option_to_yojson structure_set_with_no_key_to_yojson
         x.structure_list_with_no_key));
    ("structureList",
      (option_to_yojson Shared.Json_serializers.structure_set_to_yojson
         x.structure_list));
    ("listList",
      (option_to_yojson Shared.Json_serializers.list_set_to_yojson
         x.list_list));
    ("intEnumList",
      (option_to_yojson Shared.Json_serializers.integer_enum_set_to_yojson
         x.int_enum_list));
    ("enumList",
      (option_to_yojson Shared.Json_serializers.foo_enum_set_to_yojson
         x.enum_list));
    ("httpDateList",
      (option_to_yojson Shared.Json_serializers.http_date_set_to_yojson
         x.http_date_list));
    ("dateTimeList",
      (option_to_yojson Shared.Json_serializers.date_time_set_to_yojson
         x.date_time_list));
    ("timestampList",
      (option_to_yojson Shared.Json_serializers.timestamp_set_to_yojson
         x.timestamp_list));
    ("longList",
      (option_to_yojson Shared.Json_serializers.long_set_to_yojson
         x.long_list));
    ("integerList",
      (option_to_yojson Shared.Json_serializers.integer_set_to_yojson
         x.integer_list));
    ("shortList",
      (option_to_yojson Shared.Json_serializers.short_set_to_yojson
         x.short_list));
    ("byteList",
      (option_to_yojson Shared.Json_serializers.byte_set_to_yojson
         x.byte_list));
    ("stringList",
      (option_to_yojson Shared.Json_serializers.string_set_to_yojson
         x.string_list));
    ("booleanList",
      (option_to_yojson Shared.Json_serializers.boolean_set_to_yojson
         x.boolean_list));
    ("blobList",
      (option_to_yojson Shared.Json_serializers.blob_set_to_yojson
         x.blob_list))]
let malformed_required_input_to_yojson (x : malformed_required_input) =
  assoc_to_yojson
    [("stringInHeader",
       (Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
             x.string_in_header)));
    ("stringInQuery",
      (Some
         (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
            x.string_in_query)));
    ("string",
      (Some
         (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.string_)))]
let range_byte_to_yojson = byte_to_yojson
let min_byte_to_yojson = byte_to_yojson
let max_byte_to_yojson = byte_to_yojson
let range_short_to_yojson = short_to_yojson
let min_short_to_yojson = short_to_yojson
let max_short_to_yojson = short_to_yojson
let range_integer_to_yojson = int_to_yojson
let min_integer_to_yojson = int_to_yojson
let max_integer_to_yojson = int_to_yojson
let range_long_to_yojson = long_to_yojson
let min_long_to_yojson = long_to_yojson
let max_long_to_yojson = long_to_yojson
let range_float_to_yojson = float_to_yojson
let min_float_to_yojson = float_to_yojson
let max_float_to_yojson = float_to_yojson
let malformed_range_override_input_to_yojson
  (x : malformed_range_override_input) =
  assoc_to_yojson
    [("maxFloat", (option_to_yojson max_float_to_yojson x.max_float));
    ("minFloat", (option_to_yojson min_float_to_yojson x.min_float));
    ("float", (option_to_yojson range_float_to_yojson x.float_));
    ("maxLong", (option_to_yojson max_long_to_yojson x.max_long));
    ("minLong", (option_to_yojson min_long_to_yojson x.min_long));
    ("long", (option_to_yojson range_long_to_yojson x.long));
    ("maxInteger", (option_to_yojson max_integer_to_yojson x.max_integer));
    ("minInteger", (option_to_yojson min_integer_to_yojson x.min_integer));
    ("integer", (option_to_yojson range_integer_to_yojson x.integer));
    ("maxShort", (option_to_yojson max_short_to_yojson x.max_short));
    ("minShort", (option_to_yojson min_short_to_yojson x.min_short));
    ("short", (option_to_yojson range_short_to_yojson x.short));
    ("maxByte", (option_to_yojson max_byte_to_yojson x.max_byte));
    ("minByte", (option_to_yojson min_byte_to_yojson x.min_byte));
    ("byte", (option_to_yojson range_byte_to_yojson x.byte))]
let malformed_range_input_to_yojson (x : malformed_range_input) =
  assoc_to_yojson
    [("maxFloat", (option_to_yojson max_float_to_yojson x.max_float));
    ("minFloat", (option_to_yojson min_float_to_yojson x.min_float));
    ("float", (option_to_yojson range_float_to_yojson x.float_));
    ("maxLong", (option_to_yojson max_long_to_yojson x.max_long));
    ("minLong", (option_to_yojson min_long_to_yojson x.min_long));
    ("long", (option_to_yojson range_long_to_yojson x.long));
    ("maxInteger", (option_to_yojson max_integer_to_yojson x.max_integer));
    ("minInteger", (option_to_yojson min_integer_to_yojson x.min_integer));
    ("integer", (option_to_yojson range_integer_to_yojson x.integer));
    ("maxShort", (option_to_yojson max_short_to_yojson x.max_short));
    ("minShort", (option_to_yojson min_short_to_yojson x.min_short));
    ("short", (option_to_yojson range_short_to_yojson x.short));
    ("maxByte", (option_to_yojson max_byte_to_yojson x.max_byte));
    ("minByte", (option_to_yojson min_byte_to_yojson x.min_byte));
    ("byte", (option_to_yojson range_byte_to_yojson x.byte))]
let pattern_string_to_yojson = string_to_yojson
let pattern_list_override_to_yojson tree =
  list_to_yojson pattern_string_to_yojson tree
let pattern_map_override_to_yojson tree =
  map_to_yojson pattern_string_to_yojson pattern_string_to_yojson tree
let pattern_union_override_to_yojson (x : pattern_union_override) =
  match x with
  | Second arg ->
      assoc_to_yojson [("second", (Some (pattern_string_to_yojson arg)))]
  | First arg ->
      assoc_to_yojson [("first", (Some (pattern_string_to_yojson arg)))]
let malformed_pattern_override_input_to_yojson
  (x : malformed_pattern_override_input) =
  assoc_to_yojson
    [("union", (option_to_yojson pattern_union_override_to_yojson x.union));
    ("map", (option_to_yojson pattern_map_override_to_yojson x.map));
    ("list", (option_to_yojson pattern_list_override_to_yojson x.list));
    ("string", (option_to_yojson pattern_string_to_yojson x.string_))]
let evil_string_to_yojson = string_to_yojson
let pattern_list_to_yojson tree =
  list_to_yojson pattern_string_to_yojson tree
let pattern_map_to_yojson tree =
  map_to_yojson pattern_string_to_yojson pattern_string_to_yojson tree
let pattern_union_to_yojson (x : pattern_union) =
  match x with
  | Second arg ->
      assoc_to_yojson [("second", (Some (pattern_string_to_yojson arg)))]
  | First arg ->
      assoc_to_yojson [("first", (Some (pattern_string_to_yojson arg)))]
let malformed_pattern_input_to_yojson (x : malformed_pattern_input) =
  assoc_to_yojson
    [("union", (option_to_yojson pattern_union_to_yojson x.union));
    ("map", (option_to_yojson pattern_map_to_yojson x.map));
    ("list", (option_to_yojson pattern_list_to_yojson x.list));
    ("evilString", (option_to_yojson evil_string_to_yojson x.evil_string));
    ("string", (option_to_yojson pattern_string_to_yojson x.string_))]
let length_string_to_yojson = string_to_yojson
let malformed_length_query_string_input_to_yojson
  (x : malformed_length_query_string_input) =
  assoc_to_yojson
    [("string", (option_to_yojson length_string_to_yojson x.string_))]
let length_blob_to_yojson = blob_to_yojson
let min_length_string_to_yojson = string_to_yojson
let max_length_string_to_yojson = string_to_yojson
let length_list_to_yojson tree = list_to_yojson length_string_to_yojson tree
let length_map_to_yojson tree =
  map_to_yojson length_string_to_yojson length_list_to_yojson tree
let malformed_length_override_input_to_yojson
  (x : malformed_length_override_input) =
  assoc_to_yojson
    [("map", (option_to_yojson length_map_to_yojson x.map));
    ("list", (option_to_yojson length_list_to_yojson x.list));
    ("maxString",
      (option_to_yojson max_length_string_to_yojson x.max_string));
    ("minString",
      (option_to_yojson min_length_string_to_yojson x.min_string));
    ("string", (option_to_yojson length_string_to_yojson x.string_));
    ("blob", (option_to_yojson length_blob_to_yojson x.blob))]
let malformed_length_input_to_yojson (x : malformed_length_input) =
  assoc_to_yojson
    [("map", (option_to_yojson length_map_to_yojson x.map));
    ("list", (option_to_yojson length_list_to_yojson x.list));
    ("maxString",
      (option_to_yojson max_length_string_to_yojson x.max_string));
    ("minString",
      (option_to_yojson min_length_string_to_yojson x.min_string));
    ("string", (option_to_yojson length_string_to_yojson x.string_));
    ("blob", (option_to_yojson length_blob_to_yojson x.blob))]
let enum_string_to_yojson (x : enum_string) =
  match x with
  | JKL -> `String "jkl"
  | GHI -> `String "ghi"
  | DEF -> `String "def"
  | ABC -> `String "abc"
let enum_trait_string_to_yojson (x : enum_trait_string) =
  match x with
  | ABC -> `String "abc"
  | DEF -> `String "def"
  | GHI -> `String "ghi"
let enum_list_to_yojson tree = list_to_yojson enum_string_to_yojson tree
let enum_map_to_yojson tree =
  map_to_yojson enum_string_to_yojson enum_string_to_yojson tree
let enum_union_to_yojson (x : enum_union) =
  match x with
  | Second arg ->
      assoc_to_yojson [("second", (Some (enum_string_to_yojson arg)))]
  | First arg ->
      assoc_to_yojson [("first", (Some (enum_string_to_yojson arg)))]
let malformed_enum_input_to_yojson (x : malformed_enum_input) =
  assoc_to_yojson
    [("union", (option_to_yojson enum_union_to_yojson x.union));
    ("map", (option_to_yojson enum_map_to_yojson x.map));
    ("list", (option_to_yojson enum_list_to_yojson x.list));
    ("stringWithEnumTrait",
      (option_to_yojson enum_trait_string_to_yojson x.string_with_enum_trait));
    ("string", (option_to_yojson enum_string_to_yojson x.string_))]