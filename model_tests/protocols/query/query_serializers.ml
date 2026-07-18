open Types

let xml_timestamps_output_to_query path (x : xml_timestamps_output) =
  List.concat
    [
      (match x.http_date_on_target with
      | None -> []
      | Some v ->
          Shared.Query_serializers.http_date_to_query (List.append path [ "httpDateOnTarget" ]) v);
      (match x.http_date with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_httpdate_field
            (List.append path [ "httpDate" ]) v);
      (match x.epoch_seconds_on_target with
      | None -> []
      | Some v ->
          Shared.Query_serializers.epoch_seconds_to_query
            (List.append path [ "epochSecondsOnTarget" ])
            v);
      (match x.epoch_seconds with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_epoch_field
            (List.append path [ "epochSeconds" ])
            v);
      (match x.date_time_on_target with
      | None -> []
      | Some v ->
          Shared.Query_serializers.date_time_to_query (List.append path [ "dateTimeOnTarget" ]) v);
      (match x.date_time with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field
            (List.append path [ "dateTime" ]) v);
      (match x.normal with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field (List.append path [ "normal" ])
            v);
    ]

let xml_namespaced_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
    path xs

let xml_namespace_nested_to_query path (x : xml_namespace_nested) =
  List.concat
    [
      (match x.values with
      | None -> []
      | Some v -> xml_namespaced_list_to_query (List.append path [ "values" ]) v);
      (match x.foo with
      | None -> []
      | Some v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "foo" ]) v);
    ]

let xml_namespaces_output_to_query path (x : xml_namespaces_output) =
  List.concat
    [
      (match x.nested with
      | None -> []
      | Some v -> xml_namespace_nested_to_query (List.append path [ "nested" ]) v);
    ]

let xml_maps_xml_name_output_map_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "Attribute" "Setting"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
    Shared.Query_serializers.greeting_struct_to_query path pairs

let xml_maps_xml_name_output_to_query path (x : xml_maps_xml_name_output) =
  List.concat
    [
      (match x.my_map with
      | None -> []
      | Some v -> xml_maps_xml_name_output_map_to_query (List.append path [ "myMap" ]) v);
    ]

let xml_maps_output_map_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "key" "value"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
    Shared.Query_serializers.greeting_struct_to_query path pairs

let xml_maps_output_to_query path (x : xml_maps_output) =
  List.concat
    [
      (match x.my_map with
      | None -> []
      | Some v -> xml_maps_output_map_to_query (List.append path [ "myMap" ]) v);
    ]

let renamed_list_members_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "item"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
    path xs

let list_with_member_namespace_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
    path xs

let list_with_namespace_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
    path xs

let structure_list_member_to_query path (x : structure_list_member) =
  List.concat
    [
      (match x.b with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "other" ]) v);
      (match x.a with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "value" ]) v);
    ]

let structure_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "item" structure_list_member_to_query path xs

let xml_lists_output_to_query path (x : xml_lists_output) =
  List.concat
    [
      (match x.structure_list with
      | None -> []
      | Some v -> structure_list_to_query (List.append path [ "myStructureList" ]) v);
      (match x.flattened_list_with_namespace with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.flattened_list_to_query
            (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
            (List.append path [ "flattenedListWithNamespace" ])
            v);
      (match x.flattened_list_with_member_namespace with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.flattened_list_to_query
            (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
            (List.append path [ "flattenedListWithMemberNamespace" ])
            v);
      (match x.flattened_list2 with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.flattened_list_to_query
            (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
            (List.append path [ "customName" ])
            v);
      (match x.flattened_list with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.flattened_list_to_query
            (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
            (List.append path [ "flattenedList" ])
            v);
      (match x.renamed_list_members with
      | None -> []
      | Some v -> renamed_list_members_to_query (List.append path [ "renamed" ]) v);
      (match x.nested_string_list with
      | None -> []
      | Some v ->
          Shared.Query_serializers.nested_string_list_to_query
            (List.append path [ "nestedStringList" ])
            v);
      (match x.int_enum_list with
      | None -> []
      | Some v ->
          Shared.Query_serializers.integer_enum_list_to_query (List.append path [ "intEnumList" ]) v);
      (match x.enum_list with
      | None -> []
      | Some v ->
          Shared.Query_serializers.foo_enum_list_to_query (List.append path [ "enumList" ]) v);
      (match x.timestamp_list with
      | None -> []
      | Some v ->
          Shared.Query_serializers.timestamp_list_to_query (List.append path [ "timestampList" ]) v);
      (match x.boolean_list with
      | None -> []
      | Some v ->
          Shared.Query_serializers.boolean_list_to_query (List.append path [ "booleanList" ]) v);
      (match x.integer_list with
      | None -> []
      | Some v ->
          Shared.Query_serializers.integer_list_to_query (List.append path [ "integerList" ]) v);
      (match x.string_set with
      | None -> []
      | Some v -> Shared.Query_serializers.string_set_to_query (List.append path [ "stringSet" ]) v);
      (match x.string_list with
      | None -> []
      | Some v ->
          Shared.Query_serializers.string_list_to_query (List.append path [ "stringList" ]) v);
    ]

let xml_int_enums_output_to_query path (x : xml_int_enums_output) =
  List.concat
    [
      (match x.int_enum_map with
      | None -> []
      | Some v ->
          Shared.Query_serializers.integer_enum_map_to_query (List.append path [ "intEnumMap" ]) v);
      (match x.int_enum_set with
      | None -> []
      | Some v ->
          Shared.Query_serializers.integer_enum_set_to_query (List.append path [ "intEnumSet" ]) v);
      (match x.int_enum_list with
      | None -> []
      | Some v ->
          Shared.Query_serializers.integer_enum_list_to_query (List.append path [ "intEnumList" ]) v);
      (match x.int_enum3 with
      | None -> []
      | Some v -> Shared.Query_serializers.integer_enum_to_query (List.append path [ "intEnum3" ]) v);
      (match x.int_enum2 with
      | None -> []
      | Some v -> Shared.Query_serializers.integer_enum_to_query (List.append path [ "intEnum2" ]) v);
      (match x.int_enum1 with
      | None -> []
      | Some v -> Shared.Query_serializers.integer_enum_to_query (List.append path [ "intEnum1" ]) v);
    ]

let xml_enums_output_to_query path (x : xml_enums_output) =
  List.concat
    [
      (match x.foo_enum_map with
      | None -> []
      | Some v ->
          Shared.Query_serializers.foo_enum_map_to_query (List.append path [ "fooEnumMap" ]) v);
      (match x.foo_enum_set with
      | None -> []
      | Some v ->
          Shared.Query_serializers.foo_enum_set_to_query (List.append path [ "fooEnumSet" ]) v);
      (match x.foo_enum_list with
      | None -> []
      | Some v ->
          Shared.Query_serializers.foo_enum_list_to_query (List.append path [ "fooEnumList" ]) v);
      (match x.foo_enum3 with
      | None -> []
      | Some v -> Shared.Query_serializers.foo_enum_to_query (List.append path [ "fooEnum3" ]) v);
      (match x.foo_enum2 with
      | None -> []
      | Some v -> Shared.Query_serializers.foo_enum_to_query (List.append path [ "fooEnum2" ]) v);
      (match x.foo_enum1 with
      | None -> []
      | Some v -> Shared.Query_serializers.foo_enum_to_query (List.append path [ "fooEnum1" ]) v);
    ]

let xml_blobs_output_to_query path (x : xml_blobs_output) =
  List.concat
    [
      (match x.data with
      | None -> []
      | Some v -> Smaws_Lib.Protocols.AwsQuery.Serialize.blob_field (List.append path [ "data" ]) v);
    ]

let rec struct_arg_to_query path (x : struct_arg) =
  List.concat
    [
      (match x.recursive_arg with
      | None -> []
      | Some v -> struct_arg_to_query (List.append path [ "RecursiveArg" ]) v);
      (match x.other_arg with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field (List.append path [ "OtherArg" ]) v);
      (match x.string_arg with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "StringArg" ]) v);
    ]

let simple_scalar_xml_properties_output_to_query path (x : simple_scalar_xml_properties_output) =
  List.concat
    [
      (match x.double_value with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.float_field
            (List.append path [ "DoubleDribble" ])
            v);
      (match x.float_value with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.float_field (List.append path [ "floatValue" ]) v);
      (match x.long_value with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.long_field (List.append path [ "longValue" ]) v);
      (match x.integer_value with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.int_field (List.append path [ "integerValue" ]) v);
      (match x.short_value with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.int_field (List.append path [ "shortValue" ]) v);
      (match x.byte_value with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.int_field (List.append path [ "byteValue" ]) v);
      (match x.false_boolean_value with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field
            (List.append path [ "falseBooleanValue" ])
            v);
      (match x.true_boolean_value with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field
            (List.append path [ "trueBooleanValue" ])
            v);
      (match x.empty_string_value with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.string_field
            (List.append path [ "emptyStringValue" ])
            v);
      (match x.string_value with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "stringValue" ]) v);
    ]

let simple_input_params_input_to_query path (x : simple_input_params_input) =
  List.concat
    [
      (match x.integer_enum with
      | None -> []
      | Some v ->
          Shared.Query_serializers.integer_enum_to_query (List.append path [ "IntegerEnum" ]) v);
      (match x.foo_enum with
      | None -> []
      | Some v -> Shared.Query_serializers.foo_enum_to_query (List.append path [ "FooEnum" ]) v);
      (match x.qux with
      | None -> []
      | Some v -> Smaws_Lib.Protocols.AwsQuery.Serialize.blob_field (List.append path [ "Qux" ]) v);
      (match x.boo with
      | None -> []
      | Some v -> Smaws_Lib.Protocols.AwsQuery.Serialize.float_field (List.append path [ "Boo" ]) v);
      (match x.float_value with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.float_field (List.append path [ "FloatValue" ]) v);
      (match x.bam with
      | None -> []
      | Some v -> Smaws_Lib.Protocols.AwsQuery.Serialize.int_field (List.append path [ "Bam" ]) v);
      (match x.baz with
      | None -> []
      | Some v -> Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field (List.append path [ "Baz" ]) v);
      (match x.bar with
      | None -> []
      | Some v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "Bar" ]) v);
      (match x.foo with
      | None -> []
      | Some v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "Foo" ]) v);
    ]

let rec recursive_xml_shapes_output_nested1_to_query path (x : recursive_xml_shapes_output_nested1)
    =
  List.concat
    [
      (match x.nested with
      | None -> []
      | Some v -> recursive_xml_shapes_output_nested2_to_query (List.append path [ "nested" ]) v);
      (match x.foo with
      | None -> []
      | Some v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "foo" ]) v);
    ]

and recursive_xml_shapes_output_nested2_to_query path (x : recursive_xml_shapes_output_nested2) =
  List.concat
    [
      (match x.recursive_member with
      | None -> []
      | Some v ->
          recursive_xml_shapes_output_nested1_to_query (List.append path [ "recursiveMember" ]) v);
      (match x.bar with
      | None -> []
      | Some v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "bar" ]) v);
    ]

let recursive_xml_shapes_output_to_query path (x : recursive_xml_shapes_output) =
  List.concat
    [
      (match x.nested with
      | None -> []
      | Some v -> recursive_xml_shapes_output_nested1_to_query (List.append path [ "nested" ]) v);
    ]

let query_timestamps_input_to_query path (x : query_timestamps_input) =
  List.concat
    [
      (match x.epoch_target with
      | None -> []
      | Some v ->
          Shared.Query_serializers.epoch_seconds_to_query (List.append path [ "epochTarget" ]) v);
      (match x.epoch_member with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_epoch_field
            (List.append path [ "epochMember" ])
            v);
      (match x.normal_format with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field
            (List.append path [ "normalFormat" ])
            v);
    ]

let complex_map_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "key" "value"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
    Shared.Query_serializers.greeting_struct_to_query path pairs

let map_with_xml_name_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "K" "V"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
    path pairs

let map_of_lists_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "key" "value"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
    Shared.Query_serializers.string_list_to_query path pairs

let nested_struct_with_map_to_query path (x : nested_struct_with_map) =
  List.concat
    [
      (match x.map_arg with
      | None -> []
      | Some v -> Shared.Query_serializers.string_map_to_query (List.append path [ "MapArg" ]) v);
    ]

let query_maps_input_to_query path (x : query_maps_input) =
  List.concat
    [
      (match x.nested_struct_with_map with
      | None -> []
      | Some v -> nested_struct_with_map_to_query (List.append path [ "NestedStructWithMap" ]) v);
      (match x.map_of_lists with
      | None -> []
      | Some v -> map_of_lists_to_query (List.append path [ "MapOfLists" ]) v);
      (match x.flattened_map_with_xml_name with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.flattened_map_to_query "K" "V"
            (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
            (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
            (List.append path [ "Hi" ]) v);
      (match x.flattened_map with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.flattened_map_to_query "key" "value"
            (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
            (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
            (List.append path [ "FlattenedMap" ])
            v);
      (match x.map_with_xml_member_name with
      | None -> []
      | Some v -> map_with_xml_name_to_query (List.append path [ "MapWithXmlMemberName" ]) v);
      (match x.complex_map_arg with
      | None -> []
      | Some v -> complex_map_to_query (List.append path [ "ComplexMapArg" ]) v);
      (match x.renamed_map_arg with
      | None -> []
      | Some v -> Shared.Query_serializers.string_map_to_query (List.append path [ "Foo" ]) v);
      (match x.map_arg with
      | None -> []
      | Some v -> Shared.Query_serializers.string_map_to_query (List.append path [ "MapArg" ]) v);
    ]

let list_with_xml_name_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "item"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
    path xs

let nested_struct_with_list_to_query path (x : nested_struct_with_list) =
  List.concat
    [
      (match x.list_arg with
      | None -> []
      | Some v -> Shared.Query_serializers.string_list_to_query (List.append path [ "ListArg" ]) v);
    ]

let query_lists_input_to_query path (x : query_lists_input) =
  List.concat
    [
      (match x.nested_with_list with
      | None -> []
      | Some v -> nested_struct_with_list_to_query (List.append path [ "NestedWithList" ]) v);
      (match x.flattened_list_arg_with_xml_name with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.flattened_list_to_query
            (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
            (List.append path [ "Hi" ]) v);
      (match x.list_arg_with_xml_name_member with
      | None -> []
      | Some v -> list_with_xml_name_to_query (List.append path [ "ListArgWithXmlNameMember" ]) v);
      (match x.flattened_list_arg with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.flattened_list_to_query
            (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
            (List.append path [ "FlattenedListArg" ])
            v);
      (match x.complex_list_arg with
      | None -> []
      | Some v ->
          Shared.Query_serializers.greeting_list_to_query (List.append path [ "ComplexListArg" ]) v);
      (match x.list_arg with
      | None -> []
      | Some v -> Shared.Query_serializers.string_list_to_query (List.append path [ "ListArg" ]) v);
    ]

let query_idempotency_token_auto_fill_input_to_query path
    (x : query_idempotency_token_auto_fill_input) =
  List.concat
    [
      (match x.token with
      | None ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "token" ])
            (Smaws_Lib.Uuid.generate ())
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "token" ]) v);
    ]

let put_with_content_encoding_input_to_query path (x : put_with_content_encoding_input) =
  List.concat
    [
      (match x.data with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "data" ]) v);
      (match x.encoding with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "encoding" ]) v);
    ]

let no_input_and_output_output_to_query path _x = []
let no_input_and_output_input_to_query path _x = []

let nested_structures_input_to_query path (x : nested_structures_input) =
  List.concat
    [
      (match x.nested with
      | None -> []
      | Some v -> struct_arg_to_query (List.append path [ "Nested" ]) v);
    ]

let invalid_greeting_to_query path (x : invalid_greeting) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "Message" ]) v);
    ]

let ignores_wrapping_xml_name_output_to_query path (x : ignores_wrapping_xml_name_output) =
  List.concat
    [
      (match x.foo with
      | None -> []
      | Some v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "foo" ]) v);
    ]

let host_label_input_to_query path (x : host_label_input) =
  List.concat
    [ Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "label" ]) x.label ]

let greeting_with_errors_output_to_query path (x : greeting_with_errors_output) =
  List.concat
    [
      (match x.greeting with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "greeting" ]) v);
    ]

let custom_code_error_to_query path (x : custom_code_error) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "Message" ]) v);
    ]

let complex_nested_error_data_to_query path (x : complex_nested_error_data) =
  List.concat
    [
      (match x.foo with
      | None -> []
      | Some v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "Foo" ]) v);
    ]

let complex_error_to_query path (x : complex_error) =
  List.concat
    [
      (match x.nested with
      | None -> []
      | Some v -> complex_nested_error_data_to_query (List.append path [ "Nested" ]) v);
      (match x.top_level with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "TopLevel" ]) v);
    ]

let fractional_seconds_output_to_query path (x : fractional_seconds_output) =
  List.concat
    [
      (match x.datetime with
      | None -> []
      | Some v -> Shared.Query_serializers.date_time_to_query (List.append path [ "datetime" ]) v);
    ]

let flattened_xml_map_with_xml_namespace_output_map_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "K" "V"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
    path pairs

let flattened_xml_map_with_xml_namespace_output_to_query path
    (x : flattened_xml_map_with_xml_namespace_output) =
  List.concat
    [
      (match x.my_map with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.flattened_map_to_query "K" "V"
            (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
            (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
            (List.append path [ "KVP" ]) v);
    ]

let flattened_xml_map_with_xml_name_output_map_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "K" "V"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
    path pairs

let flattened_xml_map_with_xml_name_output_to_query path
    (x : flattened_xml_map_with_xml_name_output) =
  List.concat
    [
      (match x.my_map with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.flattened_map_to_query "K" "V"
            (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
            (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
            (List.append path [ "KVP" ]) v);
    ]

let flattened_xml_map_output_to_query path (x : flattened_xml_map_output) =
  List.concat
    [
      (match x.my_map with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.flattened_map_to_query "key" "value"
            (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
            Shared.Query_serializers.foo_enum_to_query (List.append path [ "myMap" ]) v);
    ]

let empty_input_and_empty_output_output_to_query path _x = []
let empty_input_and_empty_output_input_to_query path _x = []

let datetime_offsets_output_to_query path (x : datetime_offsets_output) =
  List.concat
    [
      (match x.datetime with
      | None -> []
      | Some v -> Shared.Query_serializers.date_time_to_query (List.append path [ "datetime" ]) v);
    ]
