open Smaws_Lib.Json.SerializeHelpers
open Types
let xml_timestamps_output_to_yojson (x : xml_timestamps_output) =
  assoc_to_yojson
    [("httpDateOnTarget",
       (option_to_yojson Shared.Json_serializers.http_date_to_yojson
          x.http_date_on_target));
    ("httpDate",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson
         x.http_date));
    ("epochSecondsOnTarget",
      (option_to_yojson Shared.Json_serializers.epoch_seconds_to_yojson
         x.epoch_seconds_on_target));
    ("epochSeconds",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson
         x.epoch_seconds));
    ("dateTimeOnTarget",
      (option_to_yojson Shared.Json_serializers.date_time_to_yojson
         x.date_time_on_target));
    ("dateTime",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson
         x.date_time));
    ("normal",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson x.normal))]
let xml_namespaced_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree
let xml_namespace_nested_to_yojson (x : xml_namespace_nested) =
  assoc_to_yojson
    [("values", (option_to_yojson xml_namespaced_list_to_yojson x.values));
    ("foo",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.foo))]
let xml_namespaces_output_to_yojson (x : xml_namespaces_output) =
  assoc_to_yojson
    [("nested", (option_to_yojson xml_namespace_nested_to_yojson x.nested))]
let renamed_list_members_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree
let list_with_member_namespace_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree
let list_with_namespace_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree
let structure_list_member_to_yojson (x : structure_list_member) =
  assoc_to_yojson
    [("b",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.b));
    ("a",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.a))]
let structure_list_to_yojson tree =
  list_to_yojson structure_list_member_to_yojson tree
let xml_lists_output_to_yojson (x : xml_lists_output) =
  assoc_to_yojson
    [("structureList",
       (option_to_yojson structure_list_to_yojson x.structure_list));
    ("flattenedListWithNamespace",
      (option_to_yojson list_with_namespace_to_yojson
         x.flattened_list_with_namespace));
    ("flattenedListWithMemberNamespace",
      (option_to_yojson list_with_member_namespace_to_yojson
         x.flattened_list_with_member_namespace));
    ("flattenedList2",
      (option_to_yojson renamed_list_members_to_yojson x.flattened_list2));
    ("flattenedList",
      (option_to_yojson renamed_list_members_to_yojson x.flattened_list));
    ("renamedListMembers",
      (option_to_yojson renamed_list_members_to_yojson x.renamed_list_members));
    ("nestedStringList",
      (option_to_yojson Shared.Json_serializers.nested_string_list_to_yojson
         x.nested_string_list));
    ("intEnumList",
      (option_to_yojson Shared.Json_serializers.integer_enum_list_to_yojson
         x.int_enum_list));
    ("enumList",
      (option_to_yojson Shared.Json_serializers.foo_enum_list_to_yojson
         x.enum_list));
    ("timestampList",
      (option_to_yojson Shared.Json_serializers.timestamp_list_to_yojson
         x.timestamp_list));
    ("booleanList",
      (option_to_yojson Shared.Json_serializers.boolean_list_to_yojson
         x.boolean_list));
    ("integerList",
      (option_to_yojson Shared.Json_serializers.integer_list_to_yojson
         x.integer_list));
    ("stringSet",
      (option_to_yojson Shared.Json_serializers.string_set_to_yojson
         x.string_set));
    ("stringList",
      (option_to_yojson Shared.Json_serializers.string_list_to_yojson
         x.string_list))]
let xml_int_enums_output_to_yojson (x : xml_int_enums_output) =
  assoc_to_yojson
    [("intEnumMap",
       (option_to_yojson Shared.Json_serializers.integer_enum_map_to_yojson
          x.int_enum_map));
    ("intEnumSet",
      (option_to_yojson Shared.Json_serializers.integer_enum_set_to_yojson
         x.int_enum_set));
    ("intEnumList",
      (option_to_yojson Shared.Json_serializers.integer_enum_list_to_yojson
         x.int_enum_list));
    ("intEnum3",
      (option_to_yojson Shared.Json_serializers.integer_enum_to_yojson
         x.int_enum3));
    ("intEnum2",
      (option_to_yojson Shared.Json_serializers.integer_enum_to_yojson
         x.int_enum2));
    ("intEnum1",
      (option_to_yojson Shared.Json_serializers.integer_enum_to_yojson
         x.int_enum1))]
let xml_enums_output_to_yojson (x : xml_enums_output) =
  assoc_to_yojson
    [("fooEnumMap",
       (option_to_yojson Shared.Json_serializers.foo_enum_map_to_yojson
          x.foo_enum_map));
    ("fooEnumSet",
      (option_to_yojson Shared.Json_serializers.foo_enum_set_to_yojson
         x.foo_enum_set));
    ("fooEnumList",
      (option_to_yojson Shared.Json_serializers.foo_enum_list_to_yojson
         x.foo_enum_list));
    ("fooEnum3",
      (option_to_yojson Shared.Json_serializers.foo_enum_to_yojson
         x.foo_enum3));
    ("fooEnum2",
      (option_to_yojson Shared.Json_serializers.foo_enum_to_yojson
         x.foo_enum2));
    ("fooEnum1",
      (option_to_yojson Shared.Json_serializers.foo_enum_to_yojson
         x.foo_enum1))]
let xml_blobs_output_to_yojson (x : xml_blobs_output) =
  assoc_to_yojson
    [("data",
       (option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.blob_to_yojson
          x.data))]
let rec struct_arg_to_yojson (x : struct_arg) =
  assoc_to_yojson
    [("RecursiveArg",
       (option_to_yojson struct_arg_to_yojson x.recursive_arg));
    ("OtherArg",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.other_arg));
    ("StringArg",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.string_arg))]
let simple_scalar_xml_properties_output_to_yojson
  (x : simple_scalar_xml_properties_output) =
  assoc_to_yojson
    [("doubleValue",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.double_value));
    ("floatValue",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.float_value));
    ("longValue",
      (option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson
         x.long_value));
    ("integerValue",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
         x.integer_value));
    ("shortValue",
      (option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.short_to_yojson
         x.short_value));
    ("byteValue",
      (option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.byte_to_yojson
         x.byte_value));
    ("falseBooleanValue",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
         x.false_boolean_value));
    ("trueBooleanValue",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
         x.true_boolean_value));
    ("emptyStringValue",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
         x.empty_string_value));
    ("stringValue",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
         x.string_value))]
let simple_input_params_input_to_yojson (x : simple_input_params_input) =
  assoc_to_yojson
    [("UsesXmlName",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.uses_xml_name));
    ("HasQueryAndXmlName",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
         x.has_query_and_xml_name));
    ("HasQueryName",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
         x.has_query_name));
    ("FooEnum",
      (option_to_yojson Shared.Json_serializers.foo_enum_to_yojson x.foo_enum));
    ("Qux",
      (option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.blob_to_yojson
         x.qux));
    ("Boo",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.boo));
    ("FloatValue",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.float__to_yojson x.float_value));
    ("Bam",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.bam));
    ("Baz",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.baz));
    ("Bar",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.bar));
    ("Foo",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.foo))]
let rec recursive_xml_shapes_output_nested1_to_yojson
  (x : recursive_xml_shapes_output_nested1) =
  assoc_to_yojson
    [("nested",
       (option_to_yojson recursive_xml_shapes_output_nested2_to_yojson
          x.nested));
    ("foo",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.foo))]
and recursive_xml_shapes_output_nested2_to_yojson
  (x : recursive_xml_shapes_output_nested2) =
  assoc_to_yojson
    [("recursiveMember",
       (option_to_yojson recursive_xml_shapes_output_nested1_to_yojson
          x.recursive_member));
    ("bar",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.bar))]
let recursive_xml_shapes_output_to_yojson (x : recursive_xml_shapes_output) =
  assoc_to_yojson
    [("nested",
       (option_to_yojson recursive_xml_shapes_output_nested1_to_yojson
          x.nested))]
let query_timestamps_input_to_yojson (x : query_timestamps_input) =
  assoc_to_yojson
    [("epochTarget",
       (option_to_yojson Shared.Json_serializers.epoch_seconds_to_yojson
          x.epoch_target));
    ("epochMember",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson
         x.epoch_member));
    ("normalFormat",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.timestamp_to_yojson
         x.normal_format))]
let list_with_xml_name_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree
let nested_struct_with_list_to_yojson (x : nested_struct_with_list) =
  assoc_to_yojson
    [("ListArg",
       (option_to_yojson Shared.Json_serializers.string_list_to_yojson
          x.list_arg))]
let query_lists_input_to_yojson (x : query_lists_input) =
  assoc_to_yojson
    [("NestedWithList",
       (option_to_yojson nested_struct_with_list_to_yojson x.nested_with_list));
    ("ListArgWithXmlName",
      (option_to_yojson list_with_xml_name_to_yojson x.list_arg_with_xml_name));
    ("ListArgWithXmlNameMember",
      (option_to_yojson list_with_xml_name_to_yojson
         x.list_arg_with_xml_name_member));
    ("ComplexListArg",
      (option_to_yojson Shared.Json_serializers.greeting_list_to_yojson
         x.complex_list_arg));
    ("ListArg",
      (option_to_yojson Shared.Json_serializers.string_list_to_yojson
         x.list_arg))]
let query_idempotency_token_auto_fill_input_to_yojson
  (x : query_idempotency_token_auto_fill_input) =
  assoc_to_yojson
    [("token",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.token))]
let put_with_content_encoding_input_to_yojson
  (x : put_with_content_encoding_input) =
  assoc_to_yojson
    [("data",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.data));
    ("encoding",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.encoding))]
let no_input_and_output_output_to_yojson = unit_to_yojson
let nested_structures_input_to_yojson (x : nested_structures_input) =
  assoc_to_yojson
    [("Nested", (option_to_yojson struct_arg_to_yojson x.nested))]
let invalid_greeting_to_yojson (x : invalid_greeting) =
  assoc_to_yojson
    [("Message",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message))]
let ignores_wrapping_xml_name_output_to_yojson
  (x : ignores_wrapping_xml_name_output) =
  assoc_to_yojson
    [("foo",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.foo))]
let host_label_input_to_yojson (x : host_label_input) =
  assoc_to_yojson
    [("label",
       (Some
          (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.label)))]
let greeting_with_errors_output_to_yojson (x : greeting_with_errors_output) =
  assoc_to_yojson
    [("greeting",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.greeting))]
let complex_nested_error_data_to_yojson (x : complex_nested_error_data) =
  assoc_to_yojson
    [("Foo",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.foo))]
let complex_error_to_yojson (x : complex_error) =
  assoc_to_yojson
    [("Nested",
       (option_to_yojson complex_nested_error_data_to_yojson x.nested));
    ("TopLevel",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.top_level))]
let fractional_seconds_output_to_yojson (x : fractional_seconds_output) =
  assoc_to_yojson
    [("datetime",
       (option_to_yojson Shared.Json_serializers.date_time_to_yojson
          x.datetime))]
let empty_input_and_empty_output_output_to_yojson = unit_to_yojson
let empty_input_and_empty_output_input_to_yojson = unit_to_yojson
let datetime_offsets_output_to_yojson (x : datetime_offsets_output) =
  assoc_to_yojson
    [("datetime",
       (option_to_yojson Shared.Json_serializers.date_time_to_yojson
          x.datetime))]