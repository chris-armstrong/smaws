open Types

let xml_nested_union_struct_to_query path (x : xml_nested_union_struct) =
  List.concat
    [
      (match x.double_value with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.float_field (List.append path [ "doubleValue" ]) v);
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
      (match x.boolean_value with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field (List.append path [ "booleanValue" ]) v);
      (match x.string_value with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "stringValue" ]) v);
    ]

let rec xml_union_shape_to_query path (x : xml_union_shape) =
  match x with
  | StructValue v -> xml_nested_union_struct_to_query (List.append path [ "structValue" ]) v
  | UnionValue v -> xml_union_shape_to_query (List.append path [ "unionValue" ]) v
  | DoubleValue v ->
      Smaws_Lib.Protocols.AwsQuery.Serialize.float_field (List.append path [ "doubleValue" ]) v
  | FloatValue v ->
      Smaws_Lib.Protocols.AwsQuery.Serialize.float_field (List.append path [ "floatValue" ]) v
  | LongValue v ->
      Smaws_Lib.Protocols.AwsQuery.Serialize.long_field (List.append path [ "longValue" ]) v
  | IntegerValue v ->
      Smaws_Lib.Protocols.AwsQuery.Serialize.int_field (List.append path [ "integerValue" ]) v
  | ShortValue v ->
      Smaws_Lib.Protocols.AwsQuery.Serialize.int_field (List.append path [ "shortValue" ]) v
  | ByteValue v ->
      Smaws_Lib.Protocols.AwsQuery.Serialize.int_field (List.append path [ "byteValue" ]) v
  | BooleanValue v ->
      Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field (List.append path [ "booleanValue" ]) v
  | StringValue v ->
      Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "stringValue" ]) v

let xml_unions_response_to_query path (x : xml_unions_response) =
  List.concat
    [
      (match x.union_value with
      | None -> []
      | Some v -> xml_union_shape_to_query (List.append path [ "unionValue" ]) v);
    ]

let xml_unions_request_to_query path (x : xml_unions_request) =
  List.concat
    [
      (match x.union_value with
      | None -> []
      | Some v -> xml_union_shape_to_query (List.append path [ "unionValue" ]) v);
    ]

let xml_timestamps_response_to_query path _x = []
let xml_timestamps_request_to_query path _x = []

let xml_timestamps_input_output_to_query path (x : xml_timestamps_input_output) =
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

let xml_namespaces_response_to_query path _x = []
let xml_namespaces_request_to_query path _x = []

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

let xml_namespaces_input_output_to_query path (x : xml_namespaces_input_output) =
  List.concat
    [
      (match x.nested with
      | None -> []
      | Some v -> xml_namespace_nested_to_query (List.append path [ "nested" ]) v);
    ]

let xml_maps_xml_name_input_output_map_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "Attribute" "Setting"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
    Shared.Query_serializers.greeting_struct_to_query path pairs

let xml_maps_xml_name_response_to_query path (x : xml_maps_xml_name_response) =
  List.concat
    [
      (match x.my_map with
      | None -> []
      | Some v -> xml_maps_xml_name_input_output_map_to_query (List.append path [ "myMap" ]) v);
    ]

let xml_maps_xml_name_request_to_query path (x : xml_maps_xml_name_request) =
  List.concat
    [
      (match x.my_map with
      | None -> []
      | Some v -> xml_maps_xml_name_input_output_map_to_query (List.append path [ "myMap" ]) v);
    ]

let xml_maps_input_output_map_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "key" "value"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
    Shared.Query_serializers.greeting_struct_to_query path pairs

let xml_maps_response_to_query path (x : xml_maps_response) =
  List.concat
    [
      (match x.my_map with
      | None -> []
      | Some v -> xml_maps_input_output_map_to_query (List.append path [ "myMap" ]) v);
    ]

let xml_maps_request_to_query path (x : xml_maps_request) =
  List.concat
    [
      (match x.my_map with
      | None -> []
      | Some v -> xml_maps_input_output_map_to_query (List.append path [ "myMap" ]) v);
    ]

let xml_map_with_xml_namespace_response_to_query path _x = []
let xml_map_with_xml_namespace_request_to_query path _x = []

let xml_map_with_xml_namespace_input_output_map_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "K" "V"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
    path pairs

let xml_map_with_xml_namespace_input_output_to_query path
    (x : xml_map_with_xml_namespace_input_output) =
  List.concat
    [
      (match x.my_map with
      | None -> []
      | Some v ->
          xml_map_with_xml_namespace_input_output_map_to_query (List.append path [ "KVP" ]) v);
    ]

let xml_lists_response_to_query path _x = []
let xml_lists_request_to_query path _x = []

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

let xml_lists_input_output_to_query path (x : xml_lists_input_output) =
  List.concat
    [
      (match x.flattened_structure_list with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.flattened_list_to_query
            structure_list_member_to_query
            (List.append path [ "flattenedStructureList" ])
            v);
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

let xml_int_enums_response_to_query path _x = []
let xml_int_enums_request_to_query path _x = []

let xml_int_enums_input_output_to_query path (x : xml_int_enums_input_output) =
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

let xml_enums_response_to_query path _x = []
let xml_enums_request_to_query path _x = []

let xml_enums_input_output_to_query path (x : xml_enums_input_output) =
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

let xml_empty_strings_response_to_query path (x : xml_empty_strings_response) =
  List.concat
    [
      (match x.empty_string with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "emptyString" ]) v);
    ]

let xml_empty_strings_request_to_query path (x : xml_empty_strings_request) =
  List.concat
    [
      (match x.empty_string with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "emptyString" ]) v);
    ]

let xml_empty_maps_response_to_query path (x : xml_empty_maps_response) =
  List.concat
    [
      (match x.my_map with
      | None -> []
      | Some v -> xml_maps_input_output_map_to_query (List.append path [ "myMap" ]) v);
    ]

let xml_empty_maps_request_to_query path (x : xml_empty_maps_request) =
  List.concat
    [
      (match x.my_map with
      | None -> []
      | Some v -> xml_maps_input_output_map_to_query (List.append path [ "myMap" ]) v);
    ]

let xml_empty_lists_response_to_query path _x = []
let xml_empty_lists_request_to_query path _x = []

let xml_empty_blobs_response_to_query path (x : xml_empty_blobs_response) =
  List.concat
    [
      (match x.data with
      | None -> []
      | Some v -> Smaws_Lib.Protocols.AwsQuery.Serialize.blob_field (List.append path [ "data" ]) v);
    ]

let xml_empty_blobs_request_to_query path (x : xml_empty_blobs_request) =
  List.concat
    [
      (match x.data with
      | None -> []
      | Some v -> Smaws_Lib.Protocols.AwsQuery.Serialize.blob_field (List.append path [ "data" ]) v);
    ]

let xml_blobs_response_to_query path (x : xml_blobs_response) =
  List.concat
    [
      (match x.data with
      | None -> []
      | Some v -> Smaws_Lib.Protocols.AwsQuery.Serialize.blob_field (List.append path [ "data" ]) v);
    ]

let xml_blobs_request_to_query path (x : xml_blobs_request) =
  List.concat
    [
      (match x.data with
      | None -> []
      | Some v -> Smaws_Lib.Protocols.AwsQuery.Serialize.blob_field (List.append path [ "data" ]) v);
    ]

let xml_attributes_response_to_query path _x = []
let xml_attributes_request_to_query path _x = []
let xml_attributes_payload_response_to_query path _x = []
let xml_attributes_payload_request_to_query path _x = []

let xml_attributes_on_payload_response_to_query path (x : xml_attributes_on_payload_response) =
  List.concat
    [
      (match x.payload with
      | None -> []
      | Some v -> xml_attributes_payload_response_to_query (List.append path [ "payload" ]) v);
    ]

let xml_attributes_on_payload_request_to_query path (x : xml_attributes_on_payload_request) =
  List.concat
    [
      (match x.payload with
      | None -> []
      | Some v -> xml_attributes_payload_request_to_query (List.append path [ "payload" ]) v);
    ]

let xml_attributes_middle_member_input_output_to_query path
    (x : xml_attributes_middle_member_input_output) =
  List.concat
    [
      (match x.baz with
      | None -> []
      | Some v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "baz" ]) v);
      (match x.attr with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "test" ]) v);
      (match x.foo with
      | None -> []
      | Some v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "foo" ]) v);
    ]

let xml_attributes_input_output_to_query path (x : xml_attributes_input_output) =
  List.concat
    [
      (match x.attr with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "test" ]) v);
      (match x.foo with
      | None -> []
      | Some v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "foo" ]) v);
    ]

let xml_attributes_in_middle_payload_response_to_query path _x = []

let xml_attributes_in_middle_response_to_query path (x : xml_attributes_in_middle_response) =
  List.concat
    [
      (match x.payload with
      | None -> []
      | Some v ->
          xml_attributes_in_middle_payload_response_to_query (List.append path [ "payload" ]) v);
    ]

let xml_attributes_in_middle_payload_request_to_query path _x = []

let xml_attributes_in_middle_request_to_query path (x : xml_attributes_in_middle_request) =
  List.concat
    [
      (match x.payload with
      | None -> []
      | Some v ->
          xml_attributes_in_middle_payload_request_to_query (List.append path [ "payload" ]) v);
    ]

let union_payload_to_query path (x : union_payload) =
  match x with
  | Greeting v ->
      Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "greeting" ]) v

let timestamp_format_headers_i_o_to_query path (x : timestamp_format_headers_i_o) =
  List.concat
    [
      (match x.target_date_time with
      | None -> []
      | Some v ->
          Shared.Query_serializers.date_time_to_query (List.append path [ "targetDateTime" ]) v);
      (match x.target_http_date with
      | None -> []
      | Some v ->
          Shared.Query_serializers.http_date_to_query (List.append path [ "targetHttpDate" ]) v);
      (match x.target_epoch_seconds with
      | None -> []
      | Some v ->
          Shared.Query_serializers.epoch_seconds_to_query
            (List.append path [ "targetEpochSeconds" ])
            v);
      (match x.default_format with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field
            (List.append path [ "defaultFormat" ])
            v);
      (match x.member_date_time with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field
            (List.append path [ "memberDateTime" ])
            v);
      (match x.member_http_date with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_httpdate_field
            (List.append path [ "memberHttpDate" ])
            v);
      (match x.member_epoch_seconds with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_epoch_field
            (List.append path [ "memberEpochSeconds" ])
            v);
    ]

let string_payload_input_to_query path (x : string_payload_input) =
  List.concat
    [
      (match x.payload with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "payload" ]) v);
    ]

let string_enum_to_query path (x : string_enum) =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path (match x with V -> "enumvalue")

let simple_scalar_properties_response_to_query path _x = []
let simple_scalar_properties_request_to_query path _x = []

let simple_scalar_properties_input_output_to_query path (x : simple_scalar_properties_input_output)
    =
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
      (match x.string_value with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "stringValue" ]) v);
      (match x.foo with
      | None -> []
      | Some v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "foo" ]) v);
    ]

let rec recursive_shapes_input_output_nested1_to_query path
    (x : recursive_shapes_input_output_nested1) =
  List.concat
    [
      (match x.nested with
      | None -> []
      | Some v -> recursive_shapes_input_output_nested2_to_query (List.append path [ "nested" ]) v);
      (match x.foo with
      | None -> []
      | Some v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "foo" ]) v);
    ]

and recursive_shapes_input_output_nested2_to_query path (x : recursive_shapes_input_output_nested2)
    =
  List.concat
    [
      (match x.recursive_member with
      | None -> []
      | Some v ->
          recursive_shapes_input_output_nested1_to_query (List.append path [ "recursiveMember" ]) v);
      (match x.bar with
      | None -> []
      | Some v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "bar" ]) v);
    ]

let recursive_shapes_response_to_query path (x : recursive_shapes_response) =
  List.concat
    [
      (match x.nested with
      | None -> []
      | Some v -> recursive_shapes_input_output_nested1_to_query (List.append path [ "nested" ]) v);
    ]

let recursive_shapes_request_to_query path (x : recursive_shapes_request) =
  List.concat
    [
      (match x.nested with
      | None -> []
      | Some v -> recursive_shapes_input_output_nested1_to_query (List.append path [ "nested" ]) v);
    ]

let query_precedence_input_to_query path (x : query_precedence_input) =
  List.concat
    [
      (match x.baz with
      | None -> []
      | Some v -> Shared.Query_serializers.string_map_to_query (List.append path [ "baz" ]) v);
      (match x.foo with
      | None -> []
      | Some v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "foo" ]) v);
    ]

let query_params_as_string_list_map_input_to_query path (x : query_params_as_string_list_map_input)
    =
  List.concat
    [
      (match x.foo with
      | None -> []
      | Some v -> Shared.Query_serializers.string_list_map_to_query (List.append path [ "foo" ]) v);
      (match x.qux with
      | None -> []
      | Some v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "qux" ]) v);
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

let omits_null_serializes_empty_string_input_to_query path
    (x : omits_null_serializes_empty_string_input) =
  List.concat
    [
      (match x.empty_string with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "emptyString" ]) v);
      (match x.null_value with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "nullValue" ]) v);
    ]

let null_and_empty_headers_i_o_to_query path (x : null_and_empty_headers_i_o) =
  List.concat
    [
      (match x.c with
      | None -> []
      | Some v -> Shared.Query_serializers.string_list_to_query (List.append path [ "c" ]) v);
      (match x.b with
      | None -> []
      | Some v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "b" ]) v);
      (match x.a with
      | None -> []
      | Some v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "a" ]) v);
    ]

let no_input_and_output_output_to_query path _x = []
let nested_xml_map_with_xml_name_response_to_query path _x = []
let nested_xml_map_with_xml_name_request_to_query path _x = []
let nested_xml_maps_response_to_query path _x = []
let nested_xml_maps_request_to_query path _x = []

let input_and_output_with_headers_i_o_to_query path (x : input_and_output_with_headers_i_o) =
  List.concat
    [
      (match x.header_enum_list with
      | None -> []
      | Some v ->
          Shared.Query_serializers.foo_enum_list_to_query (List.append path [ "headerEnumList" ]) v);
      (match x.header_enum with
      | None -> []
      | Some v -> Shared.Query_serializers.foo_enum_to_query (List.append path [ "headerEnum" ]) v);
      (match x.header_timestamp_list with
      | None -> []
      | Some v ->
          Shared.Query_serializers.timestamp_list_to_query
            (List.append path [ "headerTimestampList" ])
            v);
      (match x.header_boolean_list with
      | None -> []
      | Some v ->
          Shared.Query_serializers.boolean_list_to_query
            (List.append path [ "headerBooleanList" ])
            v);
      (match x.header_integer_list with
      | None -> []
      | Some v ->
          Shared.Query_serializers.integer_list_to_query
            (List.append path [ "headerIntegerList" ])
            v);
      (match x.header_string_set with
      | None -> []
      | Some v ->
          Shared.Query_serializers.string_set_to_query (List.append path [ "headerStringSet" ]) v);
      (match x.header_string_list with
      | None -> []
      | Some v ->
          Shared.Query_serializers.string_list_to_query (List.append path [ "headerStringList" ]) v);
      (match x.header_false_bool with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field
            (List.append path [ "headerFalseBool" ])
            v);
      (match x.header_true_bool with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field
            (List.append path [ "headerTrueBool" ])
            v);
      (match x.header_double with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.float_field (List.append path [ "headerDouble" ]) v);
      (match x.header_float with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.float_field (List.append path [ "headerFloat" ]) v);
      (match x.header_long with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.long_field (List.append path [ "headerLong" ]) v);
      (match x.header_integer with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.int_field (List.append path [ "headerInteger" ]) v);
      (match x.header_short with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.int_field (List.append path [ "headerShort" ]) v);
      (match x.header_byte with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.int_field (List.append path [ "headerByte" ]) v);
      (match x.header_string with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.string_field
            (List.append path [ "headerString" ])
            v);
    ]

let ignore_query_params_in_response_output_to_query path
    (x : ignore_query_params_in_response_output) =
  List.concat
    [
      (match x.baz with
      | None -> []
      | Some v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "baz" ]) v);
    ]

let http_response_code_output_to_query path (x : http_response_code_output) =
  List.concat
    [
      (match x.status with
      | None -> []
      | Some v -> Smaws_Lib.Protocols.AwsQuery.Serialize.int_field (List.append path [ "Status" ]) v);
    ]

let http_request_with_labels_and_timestamp_format_input_to_query path
    (x : http_request_with_labels_and_timestamp_format_input) =
  List.concat
    [
      Shared.Query_serializers.date_time_to_query
        (List.append path [ "targetDateTime" ])
        x.target_date_time;
      Shared.Query_serializers.http_date_to_query
        (List.append path [ "targetHttpDate" ])
        x.target_http_date;
      Shared.Query_serializers.epoch_seconds_to_query
        (List.append path [ "targetEpochSeconds" ])
        x.target_epoch_seconds;
      Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field
        (List.append path [ "defaultFormat" ])
        x.default_format;
      Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field
        (List.append path [ "memberDateTime" ])
        x.member_date_time;
      Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_httpdate_field
        (List.append path [ "memberHttpDate" ])
        x.member_http_date;
      Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_epoch_field
        (List.append path [ "memberEpochSeconds" ])
        x.member_epoch_seconds;
    ]

let http_request_with_labels_input_to_query path (x : http_request_with_labels_input) =
  List.concat
    [
      Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field
        (List.append path [ "timestamp" ])
        x.timestamp;
      Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field (List.append path [ "boolean" ]) x.boolean_;
      Smaws_Lib.Protocols.AwsQuery.Serialize.float_field (List.append path [ "double" ]) x.double;
      Smaws_Lib.Protocols.AwsQuery.Serialize.float_field (List.append path [ "float" ]) x.float_;
      Smaws_Lib.Protocols.AwsQuery.Serialize.long_field (List.append path [ "long" ]) x.long;
      Smaws_Lib.Protocols.AwsQuery.Serialize.int_field (List.append path [ "integer" ]) x.integer;
      Smaws_Lib.Protocols.AwsQuery.Serialize.int_field (List.append path [ "short" ]) x.short;
      Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "string" ]) x.string_;
    ]

let http_request_with_greedy_label_in_path_input_to_query path
    (x : http_request_with_greedy_label_in_path_input) =
  List.concat
    [
      Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "baz" ]) x.baz;
      Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "foo" ]) x.foo;
    ]

let http_request_with_float_labels_input_to_query path (x : http_request_with_float_labels_input) =
  List.concat
    [
      Smaws_Lib.Protocols.AwsQuery.Serialize.float_field (List.append path [ "double" ]) x.double;
      Smaws_Lib.Protocols.AwsQuery.Serialize.float_field (List.append path [ "float" ]) x.float_;
    ]

let foo_prefix_headers_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "key" "value"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
    path pairs

let http_prefix_headers_input_output_to_query path (x : http_prefix_headers_input_output) =
  List.concat
    [
      (match x.foo_map with
      | None -> []
      | Some v -> foo_prefix_headers_to_query (List.append path [ "fooMap" ]) v);
      (match x.foo with
      | None -> []
      | Some v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "foo" ]) v);
    ]

let payload_with_xml_namespace_and_prefix_to_query path (x : payload_with_xml_namespace_and_prefix)
    =
  List.concat
    [
      (match x.name with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "name" ]) v);
    ]

let http_payload_with_xml_namespace_and_prefix_input_output_to_query path
    (x : http_payload_with_xml_namespace_and_prefix_input_output) =
  List.concat
    [
      (match x.nested with
      | None -> []
      | Some v -> payload_with_xml_namespace_and_prefix_to_query (List.append path [ "nested" ]) v);
    ]

let payload_with_xml_namespace_to_query path (x : payload_with_xml_namespace) =
  List.concat
    [
      (match x.name with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "name" ]) v);
    ]

let http_payload_with_xml_namespace_input_output_to_query path
    (x : http_payload_with_xml_namespace_input_output) =
  List.concat
    [
      (match x.nested with
      | None -> []
      | Some v -> payload_with_xml_namespace_to_query (List.append path [ "nested" ]) v);
    ]

let payload_with_xml_name_to_query path (x : payload_with_xml_name) =
  List.concat
    [
      (match x.name with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "name" ]) v);
    ]

let http_payload_with_xml_name_input_output_to_query path
    (x : http_payload_with_xml_name_input_output) =
  List.concat
    [
      (match x.nested with
      | None -> []
      | Some v -> payload_with_xml_name_to_query (List.append path [ "nested" ]) v);
    ]

let http_payload_with_union_input_output_to_query path (x : http_payload_with_union_input_output) =
  List.concat
    [
      (match x.nested with
      | None -> []
      | Some v -> union_payload_to_query (List.append path [ "nested" ]) v);
    ]

let nested_payload_to_query path (x : nested_payload) =
  List.concat
    [
      (match x.name with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "name" ]) v);
      (match x.greeting with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "greeting" ]) v);
    ]

let http_payload_with_structure_input_output_to_query path
    (x : http_payload_with_structure_input_output) =
  List.concat
    [
      (match x.nested with
      | None -> []
      | Some v -> nested_payload_to_query (List.append path [ "nested" ]) v);
    ]

let http_payload_with_member_xml_name_input_output_to_query path
    (x : http_payload_with_member_xml_name_input_output) =
  List.concat
    [
      (match x.nested with
      | None -> []
      | Some v -> payload_with_xml_name_to_query (List.append path [ "Hola" ]) v);
    ]

let http_payload_traits_with_media_type_input_output_to_query path
    (x : http_payload_traits_with_media_type_input_output) =
  List.concat
    [
      (match x.blob with
      | None -> []
      | Some v -> Shared.Query_serializers.text_plain_blob_to_query (List.append path [ "blob" ]) v);
      (match x.foo with
      | None -> []
      | Some v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "foo" ]) v);
    ]

let http_payload_traits_input_output_to_query path (x : http_payload_traits_input_output) =
  List.concat
    [
      (match x.blob with
      | None -> []
      | Some v -> Smaws_Lib.Protocols.AwsQuery.Serialize.blob_field (List.append path [ "blob" ]) v);
      (match x.foo with
      | None -> []
      | Some v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "foo" ]) v);
    ]

let enum_payload_input_to_query path (x : enum_payload_input) =
  List.concat
    [
      (match x.payload with
      | None -> []
      | Some v -> string_enum_to_query (List.append path [ "payload" ]) v);
    ]

let http_empty_prefix_headers_output_to_query path (x : http_empty_prefix_headers_output) =
  List.concat
    [
      (match x.specific_header with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.string_field
            (List.append path [ "specificHeader" ])
            v);
      (match x.prefix_headers with
      | None -> []
      | Some v ->
          Shared.Query_serializers.string_map_to_query (List.append path [ "prefixHeaders" ]) v);
    ]

let http_empty_prefix_headers_input_to_query path (x : http_empty_prefix_headers_input) =
  List.concat
    [
      (match x.specific_header with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.string_field
            (List.append path [ "specificHeader" ])
            v);
      (match x.prefix_headers with
      | None -> []
      | Some v ->
          Shared.Query_serializers.string_map_to_query (List.append path [ "prefixHeaders" ]) v);
    ]

let invalid_greeting_to_query path (x : invalid_greeting) =
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
      (match x.header with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "Header" ]) v);
    ]

let greeting_with_errors_output_to_query path (x : greeting_with_errors_output) =
  List.concat
    [
      (match x.greeting with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "greeting" ]) v);
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

let flattened_xml_map_with_xml_name_input_output_map_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "K" "V"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
    path pairs

let flattened_xml_map_with_xml_name_response_to_query path
    (x : flattened_xml_map_with_xml_name_response) =
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

let flattened_xml_map_with_xml_name_request_to_query path
    (x : flattened_xml_map_with_xml_name_request) =
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

let flattened_xml_map_response_to_query path (x : flattened_xml_map_response) =
  List.concat
    [
      (match x.my_map with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.flattened_map_to_query "key" "value"
            (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
            Shared.Query_serializers.foo_enum_to_query (List.append path [ "myMap" ]) v);
    ]

let flattened_xml_map_request_to_query path (x : flattened_xml_map_request) =
  List.concat
    [
      (match x.my_map with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.flattened_map_to_query "key" "value"
            (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
            Shared.Query_serializers.foo_enum_to_query (List.append path [ "myMap" ]) v);
    ]

let endpoint_with_host_label_operation_request_to_query path
    (x : endpoint_with_host_label_operation_request) =
  List.concat
    [ Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "label" ]) x.label ]

let host_label_header_input_to_query path (x : host_label_header_input) =
  List.concat
    [
      Smaws_Lib.Protocols.AwsQuery.Serialize.string_field
        (List.append path [ "accountId" ])
        x.account_id;
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

let content_type_parameters_output_to_query path _x = []

let content_type_parameters_input_to_query path (x : content_type_parameters_input) =
  List.concat
    [
      (match x.value with
      | None -> []
      | Some v -> Smaws_Lib.Protocols.AwsQuery.Serialize.int_field (List.append path [ "value" ]) v);
    ]

let constant_query_string_input_to_query path (x : constant_query_string_input) =
  List.concat
    [ Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "hello" ]) x.hello ]

let constant_and_variable_query_string_input_to_query path
    (x : constant_and_variable_query_string_input) =
  List.concat
    [
      (match x.maybe_set with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "maybeSet" ]) v);
      (match x.baz with
      | None -> []
      | Some v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "baz" ]) v);
    ]

let body_with_xml_name_input_output_to_query path (x : body_with_xml_name_input_output) =
  List.concat
    [
      (match x.nested with
      | None -> []
      | Some v -> payload_with_xml_name_to_query (List.append path [ "nested" ]) v);
    ]

let all_query_string_types_input_to_query path (x : all_query_string_types_input) =
  List.concat
    [
      (match x.query_params_map_of_strings with
      | None -> []
      | Some v ->
          Shared.Query_serializers.string_map_to_query
            (List.append path [ "queryParamsMapOfStrings" ])
            v);
      (match x.query_integer_enum_list with
      | None -> []
      | Some v ->
          Shared.Query_serializers.integer_enum_list_to_query
            (List.append path [ "queryIntegerEnumList" ])
            v);
      (match x.query_integer_enum with
      | None -> []
      | Some v ->
          Shared.Query_serializers.integer_enum_to_query (List.append path [ "queryIntegerEnum" ]) v);
      (match x.query_enum_list with
      | None -> []
      | Some v ->
          Shared.Query_serializers.foo_enum_list_to_query (List.append path [ "queryEnumList" ]) v);
      (match x.query_enum with
      | None -> []
      | Some v -> Shared.Query_serializers.foo_enum_to_query (List.append path [ "queryEnum" ]) v);
      (match x.query_timestamp_list with
      | None -> []
      | Some v ->
          Shared.Query_serializers.timestamp_list_to_query
            (List.append path [ "queryTimestampList" ])
            v);
      (match x.query_timestamp with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field
            (List.append path [ "queryTimestamp" ])
            v);
      (match x.query_boolean_list with
      | None -> []
      | Some v ->
          Shared.Query_serializers.boolean_list_to_query (List.append path [ "queryBooleanList" ]) v);
      (match x.query_boolean with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field (List.append path [ "queryBoolean" ]) v);
      (match x.query_double_list with
      | None -> []
      | Some v ->
          Shared.Query_serializers.double_list_to_query (List.append path [ "queryDoubleList" ]) v);
      (match x.query_double with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.float_field (List.append path [ "queryDouble" ]) v);
      (match x.query_float with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.float_field (List.append path [ "queryFloat" ]) v);
      (match x.query_long with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.long_field (List.append path [ "queryLong" ]) v);
      (match x.query_integer_set with
      | None -> []
      | Some v ->
          Shared.Query_serializers.integer_set_to_query (List.append path [ "queryIntegerSet" ]) v);
      (match x.query_integer_list with
      | None -> []
      | Some v ->
          Shared.Query_serializers.integer_list_to_query (List.append path [ "queryIntegerList" ]) v);
      (match x.query_integer with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.int_field (List.append path [ "queryInteger" ]) v);
      (match x.query_short with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.int_field (List.append path [ "queryShort" ]) v);
      (match x.query_byte with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.int_field (List.append path [ "queryByte" ]) v);
      (match x.query_string_set with
      | None -> []
      | Some v ->
          Shared.Query_serializers.string_set_to_query (List.append path [ "queryStringSet" ]) v);
      (match x.query_string_list with
      | None -> []
      | Some v ->
          Shared.Query_serializers.string_list_to_query (List.append path [ "queryStringList" ]) v);
      (match x.query_string with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.string_field (List.append path [ "queryString" ]) v);
    ]

let nested_map_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "key" "value"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
    Shared.Query_serializers.foo_enum_map_to_query path pairs

let nested_xml_maps_input_output_to_query path (x : nested_xml_maps_input_output) =
  List.concat
    [
      (match x.flat_nested_map with
      | None -> []
      | Some v ->
          Smaws_Lib.Protocols.AwsQuery.Serialize.flattened_map_to_query "key" "value"
            (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
            Shared.Query_serializers.foo_enum_map_to_query
            (List.append path [ "flatNestedMap" ])
            v);
      (match x.nested_map with
      | None -> []
      | Some v -> nested_map_to_query (List.append path [ "nestedMap" ]) v);
    ]

let nested_xml_map_with_xml_name_inner_map_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "InnerKey" "InnerValue"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
    path pairs

let nested_xml_map_with_xml_name_map_to_query path pairs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.map_to_query "OuterKey" "value"
    (fun p v -> Smaws_Lib.Protocols.AwsQuery.Serialize.string_field p v)
    nested_xml_map_with_xml_name_inner_map_to_query path pairs

let nested_xml_map_with_xml_name_input_output_to_query path
    (x : nested_xml_map_with_xml_name_input_output) =
  List.concat
    [
      (match x.nested_xml_map_with_xml_name_map with
      | None -> []
      | Some v ->
          nested_xml_map_with_xml_name_map_to_query
            (List.append path [ "nestedXmlMapWithXmlNameMap" ])
            v);
    ]
