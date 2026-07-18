open Types
let xml_nested_union_struct_to_xml w (x : xml_nested_union_struct) =
  ignore
    [(match x.double_value with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v ->
          Smaws_Lib.Xml.Write.element w "doubleValue"
            (fun w ->
               Smaws_Lib.Xml.Write.text w
                 (Smaws_Lib.Protocols.AwsQuery.Serialize.float_to_string v)));
    (match x.float_value with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "floatValue"
           (fun w ->
              Smaws_Lib.Xml.Write.text w
                (Smaws_Lib.Protocols.AwsQuery.Serialize.float_to_string v)));
    (match x.long_value with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "longValue"
           (fun w ->
              Smaws_Lib.Xml.Write.text w
                (Smaws_Lib.CoreTypes.Int64.to_string v)));
    (match x.integer_value with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "integerValue"
           (fun w -> Smaws_Lib.Xml.Write.text w (string_of_int v)));
    (match x.short_value with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "shortValue"
           (fun w -> Smaws_Lib.Xml.Write.text w (string_of_int v)));
    (match x.byte_value with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "byteValue"
           (fun w -> Smaws_Lib.Xml.Write.text w (string_of_int v)));
    (match x.boolean_value with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "booleanValue"
           (fun w -> Smaws_Lib.Xml.Write.text w (string_of_bool v)));
    (match x.string_value with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "stringValue"
           (fun w -> Smaws_Lib.Xml.Write.text w v))]
let rec xml_union_shape_to_xml w (x : xml_union_shape) =
  match x with
  | StructValue v -> xml_nested_union_struct_to_xml w v
  | UnionValue v -> xml_union_shape_to_xml w v
  | DoubleValue v ->
      Smaws_Lib.Xml.Write.element w "doubleValue"
        (fun w ->
           Smaws_Lib.Xml.Write.text w
             (Smaws_Lib.Protocols.AwsQuery.Serialize.float_to_string v))
  | FloatValue v ->
      Smaws_Lib.Xml.Write.element w "floatValue"
        (fun w ->
           Smaws_Lib.Xml.Write.text w
             (Smaws_Lib.Protocols.AwsQuery.Serialize.float_to_string v))
  | LongValue v ->
      Smaws_Lib.Xml.Write.element w "longValue"
        (fun w ->
           Smaws_Lib.Xml.Write.text w (Smaws_Lib.CoreTypes.Int64.to_string v))
  | IntegerValue v ->
      Smaws_Lib.Xml.Write.element w "integerValue"
        (fun w -> Smaws_Lib.Xml.Write.text w (string_of_int v))
  | ShortValue v ->
      Smaws_Lib.Xml.Write.element w "shortValue"
        (fun w -> Smaws_Lib.Xml.Write.text w (string_of_int v))
  | ByteValue v ->
      Smaws_Lib.Xml.Write.element w "byteValue"
        (fun w -> Smaws_Lib.Xml.Write.text w (string_of_int v))
  | BooleanValue v ->
      Smaws_Lib.Xml.Write.element w "booleanValue"
        (fun w -> Smaws_Lib.Xml.Write.text w (string_of_bool v))
  | StringValue v ->
      Smaws_Lib.Xml.Write.element w "stringValue"
        (fun w -> Smaws_Lib.Xml.Write.text w v)
let xml_unions_response_to_xml w (x : xml_unions_response) =
  ignore
    [(match x.union_value with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> xml_union_shape_to_xml w v)]
let xml_unions_request_to_xml w (x : xml_unions_request) =
  ignore
    [(match x.union_value with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> xml_union_shape_to_xml w v)]
let xml_timestamps_response_to_xml w _x = Smaws_Lib.Xml.Write.null w
let xml_timestamps_request_to_xml w _x = Smaws_Lib.Xml.Write.null w
let xml_timestamps_input_output_to_xml w (x : xml_timestamps_input_output) =
  ignore
    [(match x.http_date_on_target with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> Shared.Xml_serializers.http_date_to_xml w v);
    (match x.http_date with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "httpDate"
           (fun w ->
              Smaws_Lib.Xml.Write.text w
                (Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string
                   v)));
    (match x.epoch_seconds_on_target with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.epoch_seconds_to_xml w v);
    (match x.epoch_seconds with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "epochSeconds"
           (fun w ->
              Smaws_Lib.Xml.Write.text w
                (Smaws_Lib.Protocols.RestXml.Serialize.timestamp_epoch_to_string
                   v)));
    (match x.date_time_on_target with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.date_time_to_xml w v);
    (match x.date_time with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "dateTime"
           (fun w ->
              Smaws_Lib.Xml.Write.text w
                (Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string
                   v)));
    (match x.normal with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "normal"
           (fun w ->
              Smaws_Lib.Xml.Write.text w
                (Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string
                   v)))]
let xml_namespaces_response_to_xml w _x = Smaws_Lib.Xml.Write.null w
let xml_namespaces_request_to_xml w _x = Smaws_Lib.Xml.Write.null w
let xml_namespaced_list_to_xml w xs =
  List.iter
    (fun item ->
       Smaws_Lib.Xml.Write.element w "member"
         (fun w -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w item)) xs
let xml_namespace_nested_to_xml w (x : xml_namespace_nested) =
  ignore
    [(match x.values with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> xml_namespaced_list_to_xml w v);
    (match x.foo with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "foo"
           (fun w -> Smaws_Lib.Xml.Write.text w v))]
let xml_namespaces_input_output_to_xml w (x : xml_namespaces_input_output) =
  ignore
    [(match x.nested with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> xml_namespace_nested_to_xml w v)]
let xml_maps_xml_name_input_output_map_to_xml w pairs =
  List.iter
    (fun (k, v) ->
       Smaws_Lib.Xml.Write.element w "entry"
         (fun w ->
            Smaws_Lib.Xml.Write.element w "Attribute"
              (fun w -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w k);
            Smaws_Lib.Xml.Write.element w "Setting"
              (fun w -> Shared.Xml_serializers.greeting_struct_to_xml w v)))
    pairs
let xml_maps_xml_name_response_to_xml w (x : xml_maps_xml_name_response) =
  ignore
    [(match x.my_map with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> xml_maps_xml_name_input_output_map_to_xml w v)]
let xml_maps_xml_name_request_to_xml w (x : xml_maps_xml_name_request) =
  ignore
    [(match x.my_map with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> xml_maps_xml_name_input_output_map_to_xml w v)]
let xml_maps_input_output_map_to_xml w pairs =
  List.iter
    (fun (k, v) ->
       Smaws_Lib.Xml.Write.element w "entry"
         (fun w ->
            Smaws_Lib.Xml.Write.element w "key"
              (fun w -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w k);
            Smaws_Lib.Xml.Write.element w "value"
              (fun w -> Shared.Xml_serializers.greeting_struct_to_xml w v)))
    pairs
let xml_maps_response_to_xml w (x : xml_maps_response) =
  ignore
    [(match x.my_map with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> xml_maps_input_output_map_to_xml w v)]
let xml_maps_request_to_xml w (x : xml_maps_request) =
  ignore
    [(match x.my_map with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> xml_maps_input_output_map_to_xml w v)]
let xml_map_with_xml_namespace_response_to_xml w _x =
  Smaws_Lib.Xml.Write.null w
let xml_map_with_xml_namespace_request_to_xml w _x =
  Smaws_Lib.Xml.Write.null w
let xml_map_with_xml_namespace_input_output_map_to_xml w pairs =
  List.iter
    (fun (k, v) ->
       Smaws_Lib.Xml.Write.element w "entry"
         (fun w ->
            Smaws_Lib.Xml.Write.element w "K"
              (fun w -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w k);
            Smaws_Lib.Xml.Write.element w "V"
              (fun w -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w v)))
    pairs
let xml_map_with_xml_namespace_input_output_to_xml w
  (x : xml_map_with_xml_namespace_input_output) =
  ignore
    [(match x.my_map with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> xml_map_with_xml_namespace_input_output_map_to_xml w v)]
let xml_lists_response_to_xml w _x = Smaws_Lib.Xml.Write.null w
let xml_lists_request_to_xml w _x = Smaws_Lib.Xml.Write.null w
let renamed_list_members_to_xml w xs =
  List.iter
    (fun item ->
       Smaws_Lib.Xml.Write.element w "item"
         (fun w -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w item)) xs
let list_with_member_namespace_to_xml w xs =
  List.iter
    (fun item ->
       Smaws_Lib.Xml.Write.element w "member"
         (fun w -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w item)) xs
let list_with_namespace_to_xml w xs =
  List.iter
    (fun item ->
       Smaws_Lib.Xml.Write.element w "member"
         (fun w -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w item)) xs
let structure_list_member_to_xml w (x : structure_list_member) =
  ignore
    [(match x.b with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v ->
          Smaws_Lib.Xml.Write.element w "other"
            (fun w -> Smaws_Lib.Xml.Write.text w v));
    (match x.a with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "value"
           (fun w -> Smaws_Lib.Xml.Write.text w v))]
let structure_list_to_xml w xs =
  List.iter
    (fun item ->
       Smaws_Lib.Xml.Write.element w "item"
         (fun w -> structure_list_member_to_xml w item)) xs
let xml_lists_input_output_to_xml w (x : xml_lists_input_output) =
  ignore
    [(match x.flattened_structure_list with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v ->
          Smaws_Lib.Xml.Write.element w "flattenedStructureList"
            (fun w ->
               List.iter (fun item -> structure_list_member_to_xml w item) v));
    (match x.structure_list with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> structure_list_to_xml w v);
    (match x.flattened_list_with_namespace with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "flattenedListWithNamespace"
           (fun w ->
              List.iter
                (fun item -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w item)
                v));
    (match x.flattened_list_with_member_namespace with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "flattenedListWithMemberNamespace"
           (fun w ->
              List.iter
                (fun item -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w item)
                v));
    (match x.flattened_list2 with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "customName"
           (fun w ->
              List.iter
                (fun item -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w item)
                v));
    (match x.flattened_list with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "flattenedList"
           (fun w ->
              List.iter
                (fun item -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w item)
                v));
    (match x.renamed_list_members with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> renamed_list_members_to_xml w v);
    (match x.nested_string_list with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.nested_string_list_to_xml w v);
    (match x.int_enum_list with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.integer_enum_list_to_xml w v);
    (match x.enum_list with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.foo_enum_list_to_xml w v);
    (match x.timestamp_list with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.timestamp_list_to_xml w v);
    (match x.boolean_list with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.boolean_list_to_xml w v);
    (match x.integer_list with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.integer_list_to_xml w v);
    (match x.string_set with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.string_set_to_xml w v);
    (match x.string_list with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.string_list_to_xml w v)]
let xml_int_enums_response_to_xml w _x = Smaws_Lib.Xml.Write.null w
let xml_int_enums_request_to_xml w _x = Smaws_Lib.Xml.Write.null w
let xml_int_enums_input_output_to_xml w (x : xml_int_enums_input_output) =
  ignore
    [(match x.int_enum_map with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> Shared.Xml_serializers.integer_enum_map_to_xml w v);
    (match x.int_enum_set with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.integer_enum_set_to_xml w v);
    (match x.int_enum_list with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.integer_enum_list_to_xml w v);
    (match x.int_enum3 with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.integer_enum_to_xml w v);
    (match x.int_enum2 with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.integer_enum_to_xml w v);
    (match x.int_enum1 with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.integer_enum_to_xml w v)]
let xml_enums_response_to_xml w _x = Smaws_Lib.Xml.Write.null w
let xml_enums_request_to_xml w _x = Smaws_Lib.Xml.Write.null w
let xml_enums_input_output_to_xml w (x : xml_enums_input_output) =
  ignore
    [(match x.foo_enum_map with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> Shared.Xml_serializers.foo_enum_map_to_xml w v);
    (match x.foo_enum_set with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.foo_enum_set_to_xml w v);
    (match x.foo_enum_list with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.foo_enum_list_to_xml w v);
    (match x.foo_enum3 with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.foo_enum_to_xml w v);
    (match x.foo_enum2 with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.foo_enum_to_xml w v);
    (match x.foo_enum1 with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.foo_enum_to_xml w v)]
let xml_empty_strings_response_to_xml w (x : xml_empty_strings_response) =
  ignore
    [(match x.empty_string with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v ->
          Smaws_Lib.Xml.Write.element w "emptyString"
            (fun w -> Smaws_Lib.Xml.Write.text w v))]
let xml_empty_strings_request_to_xml w (x : xml_empty_strings_request) =
  ignore
    [(match x.empty_string with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v ->
          Smaws_Lib.Xml.Write.element w "emptyString"
            (fun w -> Smaws_Lib.Xml.Write.text w v))]
let xml_empty_maps_response_to_xml w (x : xml_empty_maps_response) =
  ignore
    [(match x.my_map with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> xml_maps_input_output_map_to_xml w v)]
let xml_empty_maps_request_to_xml w (x : xml_empty_maps_request) =
  ignore
    [(match x.my_map with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> xml_maps_input_output_map_to_xml w v)]
let xml_empty_lists_response_to_xml w _x = Smaws_Lib.Xml.Write.null w
let xml_empty_lists_request_to_xml w _x = Smaws_Lib.Xml.Write.null w
let xml_empty_blobs_response_to_xml w (x : xml_empty_blobs_response) =
  ignore
    [(match x.data with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v ->
          Smaws_Lib.Xml.Write.element w "data"
            (fun w ->
               Smaws_Lib.Xml.Write.text w
                 (Base64.encode_exn (Bytes.to_string v))))]
let xml_empty_blobs_request_to_xml w (x : xml_empty_blobs_request) =
  ignore
    [(match x.data with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v ->
          Smaws_Lib.Xml.Write.element w "data"
            (fun w ->
               Smaws_Lib.Xml.Write.text w
                 (Base64.encode_exn (Bytes.to_string v))))]
let xml_blobs_response_to_xml w (x : xml_blobs_response) =
  ignore
    [(match x.data with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v ->
          Smaws_Lib.Xml.Write.element w "data"
            (fun w ->
               Smaws_Lib.Xml.Write.text w
                 (Base64.encode_exn (Bytes.to_string v))))]
let xml_blobs_request_to_xml w (x : xml_blobs_request) =
  ignore
    [(match x.data with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v ->
          Smaws_Lib.Xml.Write.element w "data"
            (fun w ->
               Smaws_Lib.Xml.Write.text w
                 (Base64.encode_exn (Bytes.to_string v))))]
let xml_attributes_response_to_xml w _x = Smaws_Lib.Xml.Write.null w
let xml_attributes_request_to_xml w _x = Smaws_Lib.Xml.Write.null w
let xml_attributes_payload_response_to_xml w _x = Smaws_Lib.Xml.Write.null w
let xml_attributes_payload_request_to_xml w _x = Smaws_Lib.Xml.Write.null w
let xml_attributes_on_payload_response_to_xml w
  (x : xml_attributes_on_payload_response) =
  ignore
    [(match x.payload with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> xml_attributes_payload_response_to_xml w v)]
let xml_attributes_on_payload_request_to_xml w
  (x : xml_attributes_on_payload_request) =
  ignore
    [(match x.payload with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> xml_attributes_payload_request_to_xml w v)]
let xml_attributes_middle_member_input_output_to_xml w
  (x : xml_attributes_middle_member_input_output) =
  ignore
    [(match x.baz with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v ->
          Smaws_Lib.Xml.Write.element w "baz"
            (fun w -> Smaws_Lib.Xml.Write.text w v));
    (match x.attr with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "test"
           (fun w -> Smaws_Lib.Xml.Write.text w v));
    (match x.foo with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "foo"
           (fun w -> Smaws_Lib.Xml.Write.text w v))]
let xml_attributes_input_output_to_xml w (x : xml_attributes_input_output) =
  ignore
    [(match x.attr with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v ->
          Smaws_Lib.Xml.Write.element w "test"
            (fun w -> Smaws_Lib.Xml.Write.text w v));
    (match x.foo with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "foo"
           (fun w -> Smaws_Lib.Xml.Write.text w v))]
let xml_attributes_in_middle_payload_response_to_xml w _x =
  Smaws_Lib.Xml.Write.null w
let xml_attributes_in_middle_response_to_xml w
  (x : xml_attributes_in_middle_response) =
  ignore
    [(match x.payload with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> xml_attributes_in_middle_payload_response_to_xml w v)]
let xml_attributes_in_middle_payload_request_to_xml w _x =
  Smaws_Lib.Xml.Write.null w
let xml_attributes_in_middle_request_to_xml w
  (x : xml_attributes_in_middle_request) =
  ignore
    [(match x.payload with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> xml_attributes_in_middle_payload_request_to_xml w v)]
let union_payload_to_xml w (x : union_payload) =
  match x with
  | Greeting v ->
      Smaws_Lib.Xml.Write.element w "greeting"
        (fun w -> Smaws_Lib.Xml.Write.text w v)
let timestamp_format_headers_i_o_to_xml w (x : timestamp_format_headers_i_o)
  =
  ignore
    [(match x.target_date_time with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> Shared.Xml_serializers.date_time_to_xml w v);
    (match x.target_http_date with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.http_date_to_xml w v);
    (match x.target_epoch_seconds with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.epoch_seconds_to_xml w v);
    (match x.default_format with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "defaultFormat"
           (fun w ->
              Smaws_Lib.Xml.Write.text w
                (Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string
                   v)));
    (match x.member_date_time with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "memberDateTime"
           (fun w ->
              Smaws_Lib.Xml.Write.text w
                (Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string
                   v)));
    (match x.member_http_date with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "memberHttpDate"
           (fun w ->
              Smaws_Lib.Xml.Write.text w
                (Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string
                   v)));
    (match x.member_epoch_seconds with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "memberEpochSeconds"
           (fun w ->
              Smaws_Lib.Xml.Write.text w
                (Smaws_Lib.Protocols.RestXml.Serialize.timestamp_epoch_to_string
                   v)))]
let string_payload_input_to_xml w (x : string_payload_input) =
  ignore
    [(match x.payload with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v ->
          Smaws_Lib.Xml.Write.element w "payload"
            (fun w -> Smaws_Lib.Xml.Write.text w v))]
let string_enum_to_xml w (x : string_enum) =
  Smaws_Lib.Xml.Write.text w (match x with | V -> "enumvalue")
let simple_scalar_properties_response_to_xml w _x =
  Smaws_Lib.Xml.Write.null w
let simple_scalar_properties_request_to_xml w _x = Smaws_Lib.Xml.Write.null w
let simple_scalar_properties_input_output_to_xml w
  (x : simple_scalar_properties_input_output) =
  ignore
    [(match x.double_value with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v ->
          Smaws_Lib.Xml.Write.element w "DoubleDribble"
            (fun w ->
               Smaws_Lib.Xml.Write.text w
                 (Smaws_Lib.Protocols.AwsQuery.Serialize.float_to_string v)));
    (match x.float_value with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "floatValue"
           (fun w ->
              Smaws_Lib.Xml.Write.text w
                (Smaws_Lib.Protocols.AwsQuery.Serialize.float_to_string v)));
    (match x.long_value with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "longValue"
           (fun w ->
              Smaws_Lib.Xml.Write.text w
                (Smaws_Lib.CoreTypes.Int64.to_string v)));
    (match x.integer_value with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "integerValue"
           (fun w -> Smaws_Lib.Xml.Write.text w (string_of_int v)));
    (match x.short_value with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "shortValue"
           (fun w -> Smaws_Lib.Xml.Write.text w (string_of_int v)));
    (match x.byte_value with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "byteValue"
           (fun w -> Smaws_Lib.Xml.Write.text w (string_of_int v)));
    (match x.false_boolean_value with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "falseBooleanValue"
           (fun w -> Smaws_Lib.Xml.Write.text w (string_of_bool v)));
    (match x.true_boolean_value with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "trueBooleanValue"
           (fun w -> Smaws_Lib.Xml.Write.text w (string_of_bool v)));
    (match x.string_value with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "stringValue"
           (fun w -> Smaws_Lib.Xml.Write.text w v));
    (match x.foo with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "foo"
           (fun w -> Smaws_Lib.Xml.Write.text w v))]
let rec recursive_shapes_input_output_nested1_to_xml w
  (x : recursive_shapes_input_output_nested1) =
  ignore
    [(match x.nested with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> recursive_shapes_input_output_nested2_to_xml w v);
    (match x.foo with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "foo"
           (fun w -> Smaws_Lib.Xml.Write.text w v))]
and recursive_shapes_input_output_nested2_to_xml w
  (x : recursive_shapes_input_output_nested2) =
  ignore
    [(match x.recursive_member with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> recursive_shapes_input_output_nested1_to_xml w v);
    (match x.bar with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "bar"
           (fun w -> Smaws_Lib.Xml.Write.text w v))]
let recursive_shapes_response_to_xml w (x : recursive_shapes_response) =
  ignore
    [(match x.nested with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> recursive_shapes_input_output_nested1_to_xml w v)]
let recursive_shapes_request_to_xml w (x : recursive_shapes_request) =
  ignore
    [(match x.nested with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> recursive_shapes_input_output_nested1_to_xml w v)]
let query_precedence_input_to_xml w (x : query_precedence_input) =
  ignore
    [(match x.baz with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> Shared.Xml_serializers.string_map_to_xml w v);
    (match x.foo with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "foo"
           (fun w -> Smaws_Lib.Xml.Write.text w v))]
let query_params_as_string_list_map_input_to_xml w
  (x : query_params_as_string_list_map_input) =
  ignore
    [(match x.foo with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> Shared.Xml_serializers.string_list_map_to_xml w v);
    (match x.qux with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "qux"
           (fun w -> Smaws_Lib.Xml.Write.text w v))]
let query_idempotency_token_auto_fill_input_to_xml w
  (x : query_idempotency_token_auto_fill_input) =
  ignore
    [(match x.token with
      | None ->
          Smaws_Lib.Xml.Write.element w "token"
            (fun w -> Smaws_Lib.Xml.Write.text w (Smaws_Lib.Uuid.generate ()))
      | Some v ->
          Smaws_Lib.Xml.Write.element w "token"
            (fun w -> Smaws_Lib.Xml.Write.text w v))]
let put_with_content_encoding_input_to_xml w
  (x : put_with_content_encoding_input) =
  ignore
    [(match x.data with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v ->
          Smaws_Lib.Xml.Write.element w "data"
            (fun w -> Smaws_Lib.Xml.Write.text w v));
    (match x.encoding with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "encoding"
           (fun w -> Smaws_Lib.Xml.Write.text w v))]
let omits_null_serializes_empty_string_input_to_xml w
  (x : omits_null_serializes_empty_string_input) =
  ignore
    [(match x.empty_string with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v ->
          Smaws_Lib.Xml.Write.element w "emptyString"
            (fun w -> Smaws_Lib.Xml.Write.text w v));
    (match x.null_value with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "nullValue"
           (fun w -> Smaws_Lib.Xml.Write.text w v))]
let null_and_empty_headers_i_o_to_xml w (x : null_and_empty_headers_i_o) =
  ignore
    [(match x.c with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> Shared.Xml_serializers.string_list_to_xml w v);
    (match x.b with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "b"
           (fun w -> Smaws_Lib.Xml.Write.text w v));
    (match x.a with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "a"
           (fun w -> Smaws_Lib.Xml.Write.text w v))]
let no_input_and_output_output_to_xml w _x = Smaws_Lib.Xml.Write.null w
let nested_xml_map_with_xml_name_response_to_xml w _x =
  Smaws_Lib.Xml.Write.null w
let nested_xml_map_with_xml_name_request_to_xml w _x =
  Smaws_Lib.Xml.Write.null w
let nested_xml_maps_response_to_xml w _x = Smaws_Lib.Xml.Write.null w
let nested_xml_maps_request_to_xml w _x = Smaws_Lib.Xml.Write.null w
let input_and_output_with_headers_i_o_to_xml w
  (x : input_and_output_with_headers_i_o) =
  ignore
    [(match x.header_enum_list with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> Shared.Xml_serializers.foo_enum_list_to_xml w v);
    (match x.header_enum with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.foo_enum_to_xml w v);
    (match x.header_timestamp_list with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.timestamp_list_to_xml w v);
    (match x.header_boolean_list with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.boolean_list_to_xml w v);
    (match x.header_integer_list with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.integer_list_to_xml w v);
    (match x.header_string_set with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.string_set_to_xml w v);
    (match x.header_string_list with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.string_list_to_xml w v);
    (match x.header_false_bool with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "headerFalseBool"
           (fun w -> Smaws_Lib.Xml.Write.text w (string_of_bool v)));
    (match x.header_true_bool with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "headerTrueBool"
           (fun w -> Smaws_Lib.Xml.Write.text w (string_of_bool v)));
    (match x.header_double with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "headerDouble"
           (fun w ->
              Smaws_Lib.Xml.Write.text w
                (Smaws_Lib.Protocols.AwsQuery.Serialize.float_to_string v)));
    (match x.header_float with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "headerFloat"
           (fun w ->
              Smaws_Lib.Xml.Write.text w
                (Smaws_Lib.Protocols.AwsQuery.Serialize.float_to_string v)));
    (match x.header_long with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "headerLong"
           (fun w ->
              Smaws_Lib.Xml.Write.text w
                (Smaws_Lib.CoreTypes.Int64.to_string v)));
    (match x.header_integer with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "headerInteger"
           (fun w -> Smaws_Lib.Xml.Write.text w (string_of_int v)));
    (match x.header_short with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "headerShort"
           (fun w -> Smaws_Lib.Xml.Write.text w (string_of_int v)));
    (match x.header_byte with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "headerByte"
           (fun w -> Smaws_Lib.Xml.Write.text w (string_of_int v)));
    (match x.header_string with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "headerString"
           (fun w -> Smaws_Lib.Xml.Write.text w v))]
let ignore_query_params_in_response_output_to_xml w
  (x : ignore_query_params_in_response_output) =
  ignore
    [(match x.baz with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v ->
          Smaws_Lib.Xml.Write.element w "baz"
            (fun w -> Smaws_Lib.Xml.Write.text w v))]
let http_response_code_output_to_xml w (x : http_response_code_output) =
  ignore
    [(match x.status with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v ->
          Smaws_Lib.Xml.Write.element w "Status"
            (fun w -> Smaws_Lib.Xml.Write.text w (string_of_int v)))]
let http_request_with_labels_and_timestamp_format_input_to_xml w
  (x : http_request_with_labels_and_timestamp_format_input) =
  ignore
    [Shared.Xml_serializers.date_time_to_xml w x.target_date_time;
    Shared.Xml_serializers.http_date_to_xml w x.target_http_date;
    Shared.Xml_serializers.epoch_seconds_to_xml w x.target_epoch_seconds;
    Smaws_Lib.Xml.Write.element w "defaultFormat"
      (fun w ->
         Smaws_Lib.Xml.Write.text w
           (Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string
              x.default_format));
    Smaws_Lib.Xml.Write.element w "memberDateTime"
      (fun w ->
         Smaws_Lib.Xml.Write.text w
           (Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string
              x.member_date_time));
    Smaws_Lib.Xml.Write.element w "memberHttpDate"
      (fun w ->
         Smaws_Lib.Xml.Write.text w
           (Smaws_Lib.Protocols.RestXml.Serialize.timestamp_httpdate_to_string
              x.member_http_date));
    Smaws_Lib.Xml.Write.element w "memberEpochSeconds"
      (fun w ->
         Smaws_Lib.Xml.Write.text w
           (Smaws_Lib.Protocols.RestXml.Serialize.timestamp_epoch_to_string
              x.member_epoch_seconds))]
let http_request_with_labels_input_to_xml w
  (x : http_request_with_labels_input) =
  ignore
    [Smaws_Lib.Xml.Write.element w "timestamp"
       (fun w ->
          Smaws_Lib.Xml.Write.text w
            (Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string
               x.timestamp));
    Smaws_Lib.Xml.Write.element w "boolean"
      (fun w -> Smaws_Lib.Xml.Write.text w (string_of_bool x.boolean_));
    Smaws_Lib.Xml.Write.element w "double"
      (fun w ->
         Smaws_Lib.Xml.Write.text w
           (Smaws_Lib.Protocols.AwsQuery.Serialize.float_to_string x.double));
    Smaws_Lib.Xml.Write.element w "float"
      (fun w ->
         Smaws_Lib.Xml.Write.text w
           (Smaws_Lib.Protocols.AwsQuery.Serialize.float_to_string x.float_));
    Smaws_Lib.Xml.Write.element w "long"
      (fun w ->
         Smaws_Lib.Xml.Write.text w
           (Smaws_Lib.CoreTypes.Int64.to_string x.long));
    Smaws_Lib.Xml.Write.element w "integer"
      (fun w -> Smaws_Lib.Xml.Write.text w (string_of_int x.integer));
    Smaws_Lib.Xml.Write.element w "short"
      (fun w -> Smaws_Lib.Xml.Write.text w (string_of_int x.short));
    Smaws_Lib.Xml.Write.element w "string"
      (fun w -> Smaws_Lib.Xml.Write.text w x.string_)]
let http_request_with_greedy_label_in_path_input_to_xml w
  (x : http_request_with_greedy_label_in_path_input) =
  ignore
    [Smaws_Lib.Xml.Write.element w "baz"
       (fun w -> Smaws_Lib.Xml.Write.text w x.baz);
    Smaws_Lib.Xml.Write.element w "foo"
      (fun w -> Smaws_Lib.Xml.Write.text w x.foo)]
let http_request_with_float_labels_input_to_xml w
  (x : http_request_with_float_labels_input) =
  ignore
    [Smaws_Lib.Xml.Write.element w "double"
       (fun w ->
          Smaws_Lib.Xml.Write.text w
            (Smaws_Lib.Protocols.AwsQuery.Serialize.float_to_string x.double));
    Smaws_Lib.Xml.Write.element w "float"
      (fun w ->
         Smaws_Lib.Xml.Write.text w
           (Smaws_Lib.Protocols.AwsQuery.Serialize.float_to_string x.float_))]
let foo_prefix_headers_to_xml w pairs =
  List.iter
    (fun (k, v) ->
       Smaws_Lib.Xml.Write.element w "entry"
         (fun w ->
            Smaws_Lib.Xml.Write.element w "key"
              (fun w -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w k);
            Smaws_Lib.Xml.Write.element w "value"
              (fun w -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w v)))
    pairs
let http_prefix_headers_input_output_to_xml w
  (x : http_prefix_headers_input_output) =
  ignore
    [(match x.foo_map with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> foo_prefix_headers_to_xml w v);
    (match x.foo with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "foo"
           (fun w -> Smaws_Lib.Xml.Write.text w v))]
let payload_with_xml_namespace_and_prefix_to_xml w
  (x : payload_with_xml_namespace_and_prefix) =
  ignore
    [(match x.name with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v ->
          Smaws_Lib.Xml.Write.element w "name"
            (fun w -> Smaws_Lib.Xml.Write.text w v))]
let http_payload_with_xml_namespace_and_prefix_input_output_to_xml w
  (x : http_payload_with_xml_namespace_and_prefix_input_output) =
  ignore
    [(match x.nested with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> payload_with_xml_namespace_and_prefix_to_xml w v)]
let payload_with_xml_namespace_to_xml w (x : payload_with_xml_namespace) =
  ignore
    [(match x.name with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v ->
          Smaws_Lib.Xml.Write.element w "name"
            (fun w -> Smaws_Lib.Xml.Write.text w v))]
let http_payload_with_xml_namespace_input_output_to_xml w
  (x : http_payload_with_xml_namespace_input_output) =
  ignore
    [(match x.nested with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> payload_with_xml_namespace_to_xml w v)]
let payload_with_xml_name_to_xml w (x : payload_with_xml_name) =
  ignore
    [(match x.name with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v ->
          Smaws_Lib.Xml.Write.element w "name"
            (fun w -> Smaws_Lib.Xml.Write.text w v))]
let http_payload_with_xml_name_input_output_to_xml w
  (x : http_payload_with_xml_name_input_output) =
  ignore
    [(match x.nested with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> payload_with_xml_name_to_xml w v)]
let http_payload_with_union_input_output_to_xml w
  (x : http_payload_with_union_input_output) =
  ignore
    [(match x.nested with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> union_payload_to_xml w v)]
let nested_payload_to_xml w (x : nested_payload) =
  ignore
    [(match x.name with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v ->
          Smaws_Lib.Xml.Write.element w "name"
            (fun w -> Smaws_Lib.Xml.Write.text w v));
    (match x.greeting with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "greeting"
           (fun w -> Smaws_Lib.Xml.Write.text w v))]
let http_payload_with_structure_input_output_to_xml w
  (x : http_payload_with_structure_input_output) =
  ignore
    [(match x.nested with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> nested_payload_to_xml w v)]
let http_payload_with_member_xml_name_input_output_to_xml w
  (x : http_payload_with_member_xml_name_input_output) =
  ignore
    [(match x.nested with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> payload_with_xml_name_to_xml w v)]
let http_payload_traits_with_media_type_input_output_to_xml w
  (x : http_payload_traits_with_media_type_input_output) =
  ignore
    [(match x.blob with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> Shared.Xml_serializers.text_plain_blob_to_xml w v);
    (match x.foo with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "foo"
           (fun w -> Smaws_Lib.Xml.Write.text w v))]
let http_payload_traits_input_output_to_xml w
  (x : http_payload_traits_input_output) =
  ignore
    [(match x.blob with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v ->
          Smaws_Lib.Xml.Write.element w "blob"
            (fun w ->
               Smaws_Lib.Xml.Write.text w
                 (Base64.encode_exn (Bytes.to_string v))));
    (match x.foo with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "foo"
           (fun w -> Smaws_Lib.Xml.Write.text w v))]
let enum_payload_input_to_xml w (x : enum_payload_input) =
  ignore
    [(match x.payload with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> string_enum_to_xml w v)]
let http_empty_prefix_headers_output_to_xml w
  (x : http_empty_prefix_headers_output) =
  ignore
    [(match x.specific_header with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v ->
          Smaws_Lib.Xml.Write.element w "specificHeader"
            (fun w -> Smaws_Lib.Xml.Write.text w v));
    (match x.prefix_headers with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.string_map_to_xml w v)]
let http_empty_prefix_headers_input_to_xml w
  (x : http_empty_prefix_headers_input) =
  ignore
    [(match x.specific_header with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v ->
          Smaws_Lib.Xml.Write.element w "specificHeader"
            (fun w -> Smaws_Lib.Xml.Write.text w v));
    (match x.prefix_headers with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.string_map_to_xml w v)]
let invalid_greeting_to_xml w (x : invalid_greeting) =
  ignore
    [(match x.message with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v ->
          Smaws_Lib.Xml.Write.element w "Message"
            (fun w -> Smaws_Lib.Xml.Write.text w v))]
let complex_nested_error_data_to_xml w (x : complex_nested_error_data) =
  ignore
    [(match x.foo with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v ->
          Smaws_Lib.Xml.Write.element w "Foo"
            (fun w -> Smaws_Lib.Xml.Write.text w v))]
let complex_error_to_xml w (x : complex_error) =
  ignore
    [(match x.nested with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> complex_nested_error_data_to_xml w v);
    (match x.top_level with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "TopLevel"
           (fun w -> Smaws_Lib.Xml.Write.text w v));
    (match x.header with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "Header"
           (fun w -> Smaws_Lib.Xml.Write.text w v))]
let greeting_with_errors_output_to_xml w (x : greeting_with_errors_output) =
  ignore
    [(match x.greeting with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v ->
          Smaws_Lib.Xml.Write.element w "greeting"
            (fun w -> Smaws_Lib.Xml.Write.text w v))]
let fractional_seconds_output_to_xml w (x : fractional_seconds_output) =
  ignore
    [(match x.datetime with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> Shared.Xml_serializers.date_time_to_xml w v)]
let flattened_xml_map_with_xml_namespace_output_map_to_xml w pairs =
  List.iter
    (fun (k, v) ->
       Smaws_Lib.Xml.Write.element w "entry"
         (fun w ->
            Smaws_Lib.Xml.Write.element w "K"
              (fun w -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w k);
            Smaws_Lib.Xml.Write.element w "V"
              (fun w -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w v)))
    pairs
let flattened_xml_map_with_xml_namespace_output_to_xml w
  (x : flattened_xml_map_with_xml_namespace_output) =
  ignore
    [(match x.my_map with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v ->
          Smaws_Lib.Xml.Write.element w "KVP"
            (fun w ->
               List.iter
                 (fun (k, v) ->
                    Smaws_Lib.Xml.Write.element w "K"
                      (fun w -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w k);
                    Smaws_Lib.Xml.Write.element w "V"
                      (fun w -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w v))
                 v))]
let flattened_xml_map_with_xml_name_input_output_map_to_xml w pairs =
  List.iter
    (fun (k, v) ->
       Smaws_Lib.Xml.Write.element w "entry"
         (fun w ->
            Smaws_Lib.Xml.Write.element w "K"
              (fun w -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w k);
            Smaws_Lib.Xml.Write.element w "V"
              (fun w -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w v)))
    pairs
let flattened_xml_map_with_xml_name_response_to_xml w
  (x : flattened_xml_map_with_xml_name_response) =
  ignore
    [(match x.my_map with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v ->
          Smaws_Lib.Xml.Write.element w "KVP"
            (fun w ->
               List.iter
                 (fun (k, v) ->
                    Smaws_Lib.Xml.Write.element w "K"
                      (fun w -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w k);
                    Smaws_Lib.Xml.Write.element w "V"
                      (fun w -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w v))
                 v))]
let flattened_xml_map_with_xml_name_request_to_xml w
  (x : flattened_xml_map_with_xml_name_request) =
  ignore
    [(match x.my_map with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v ->
          Smaws_Lib.Xml.Write.element w "KVP"
            (fun w ->
               List.iter
                 (fun (k, v) ->
                    Smaws_Lib.Xml.Write.element w "K"
                      (fun w -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w k);
                    Smaws_Lib.Xml.Write.element w "V"
                      (fun w -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w v))
                 v))]
let flattened_xml_map_response_to_xml w (x : flattened_xml_map_response) =
  ignore
    [(match x.my_map with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v ->
          Smaws_Lib.Xml.Write.element w "myMap"
            (fun w ->
               List.iter
                 (fun (k, v) ->
                    Smaws_Lib.Xml.Write.element w "key"
                      (fun w -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w k);
                    Smaws_Lib.Xml.Write.element w "value"
                      (fun w -> Shared.Xml_serializers.foo_enum_to_xml w v))
                 v))]
let flattened_xml_map_request_to_xml w (x : flattened_xml_map_request) =
  ignore
    [(match x.my_map with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v ->
          Smaws_Lib.Xml.Write.element w "myMap"
            (fun w ->
               List.iter
                 (fun (k, v) ->
                    Smaws_Lib.Xml.Write.element w "key"
                      (fun w -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w k);
                    Smaws_Lib.Xml.Write.element w "value"
                      (fun w -> Shared.Xml_serializers.foo_enum_to_xml w v))
                 v))]
let endpoint_with_host_label_operation_request_to_xml w
  (x : endpoint_with_host_label_operation_request) =
  ignore
    [Smaws_Lib.Xml.Write.element w "label"
       (fun w -> Smaws_Lib.Xml.Write.text w x.label)]
let host_label_header_input_to_xml w (x : host_label_header_input) =
  ignore
    [Smaws_Lib.Xml.Write.element w "accountId"
       (fun w -> Smaws_Lib.Xml.Write.text w x.account_id)]
let empty_input_and_empty_output_output_to_xml w _x =
  Smaws_Lib.Xml.Write.null w
let empty_input_and_empty_output_input_to_xml w _x =
  Smaws_Lib.Xml.Write.null w
let datetime_offsets_output_to_xml w (x : datetime_offsets_output) =
  ignore
    [(match x.datetime with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> Shared.Xml_serializers.date_time_to_xml w v)]
let content_type_parameters_output_to_xml w _x = Smaws_Lib.Xml.Write.null w
let content_type_parameters_input_to_xml w
  (x : content_type_parameters_input) =
  ignore
    [(match x.value with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v ->
          Smaws_Lib.Xml.Write.element w "value"
            (fun w -> Smaws_Lib.Xml.Write.text w (string_of_int v)))]
let constant_query_string_input_to_xml w (x : constant_query_string_input) =
  ignore
    [Smaws_Lib.Xml.Write.element w "hello"
       (fun w -> Smaws_Lib.Xml.Write.text w x.hello)]
let constant_and_variable_query_string_input_to_xml w
  (x : constant_and_variable_query_string_input) =
  ignore
    [(match x.maybe_set with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v ->
          Smaws_Lib.Xml.Write.element w "maybeSet"
            (fun w -> Smaws_Lib.Xml.Write.text w v));
    (match x.baz with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "baz"
           (fun w -> Smaws_Lib.Xml.Write.text w v))]
let body_with_xml_name_input_output_to_xml w
  (x : body_with_xml_name_input_output) =
  ignore
    [(match x.nested with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> payload_with_xml_name_to_xml w v)]
let all_query_string_types_input_to_xml w (x : all_query_string_types_input)
  =
  ignore
    [(match x.query_params_map_of_strings with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> Shared.Xml_serializers.string_map_to_xml w v);
    (match x.query_integer_enum_list with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.integer_enum_list_to_xml w v);
    (match x.query_integer_enum with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.integer_enum_to_xml w v);
    (match x.query_enum_list with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.foo_enum_list_to_xml w v);
    (match x.query_enum with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.foo_enum_to_xml w v);
    (match x.query_timestamp_list with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.timestamp_list_to_xml w v);
    (match x.query_timestamp with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "queryTimestamp"
           (fun w ->
              Smaws_Lib.Xml.Write.text w
                (Smaws_Lib.Protocols.RestXml.Serialize.timestamp_iso_to_string
                   v)));
    (match x.query_boolean_list with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.boolean_list_to_xml w v);
    (match x.query_boolean with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "queryBoolean"
           (fun w -> Smaws_Lib.Xml.Write.text w (string_of_bool v)));
    (match x.query_double_list with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.double_list_to_xml w v);
    (match x.query_double with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "queryDouble"
           (fun w ->
              Smaws_Lib.Xml.Write.text w
                (Smaws_Lib.Protocols.AwsQuery.Serialize.float_to_string v)));
    (match x.query_float with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "queryFloat"
           (fun w ->
              Smaws_Lib.Xml.Write.text w
                (Smaws_Lib.Protocols.AwsQuery.Serialize.float_to_string v)));
    (match x.query_long with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "queryLong"
           (fun w ->
              Smaws_Lib.Xml.Write.text w
                (Smaws_Lib.CoreTypes.Int64.to_string v)));
    (match x.query_integer_set with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.integer_set_to_xml w v);
    (match x.query_integer_list with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.integer_list_to_xml w v);
    (match x.query_integer with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "queryInteger"
           (fun w -> Smaws_Lib.Xml.Write.text w (string_of_int v)));
    (match x.query_short with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "queryShort"
           (fun w -> Smaws_Lib.Xml.Write.text w (string_of_int v)));
    (match x.query_byte with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "queryByte"
           (fun w -> Smaws_Lib.Xml.Write.text w (string_of_int v)));
    (match x.query_string_set with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.string_set_to_xml w v);
    (match x.query_string_list with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> Shared.Xml_serializers.string_list_to_xml w v);
    (match x.query_string with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v ->
         Smaws_Lib.Xml.Write.element w "queryString"
           (fun w -> Smaws_Lib.Xml.Write.text w v))]
let nested_map_to_xml w pairs =
  List.iter
    (fun (k, v) ->
       Smaws_Lib.Xml.Write.element w "entry"
         (fun w ->
            Smaws_Lib.Xml.Write.element w "key"
              (fun w -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w k);
            Smaws_Lib.Xml.Write.element w "value"
              (fun w -> Shared.Xml_serializers.foo_enum_map_to_xml w v)))
    pairs
let nested_xml_maps_input_output_to_xml w (x : nested_xml_maps_input_output)
  =
  ignore
    [(match x.flat_nested_map with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v ->
          Smaws_Lib.Xml.Write.element w "flatNestedMap"
            (fun w ->
               List.iter
                 (fun (k, v) ->
                    Smaws_Lib.Xml.Write.element w "key"
                      (fun w -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w k);
                    Smaws_Lib.Xml.Write.element w "value"
                      (fun w ->
                         Shared.Xml_serializers.foo_enum_map_to_xml w v)) v));
    (match x.nested_map with
     | None -> Smaws_Lib.Xml.Write.null w
     | Some v -> nested_map_to_xml w v)]
let nested_xml_map_with_xml_name_inner_map_to_xml w pairs =
  List.iter
    (fun (k, v) ->
       Smaws_Lib.Xml.Write.element w "entry"
         (fun w ->
            Smaws_Lib.Xml.Write.element w "InnerKey"
              (fun w -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w k);
            Smaws_Lib.Xml.Write.element w "InnerValue"
              (fun w -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w v)))
    pairs
let nested_xml_map_with_xml_name_map_to_xml w pairs =
  List.iter
    (fun (k, v) ->
       Smaws_Lib.Xml.Write.element w "entry"
         (fun w ->
            Smaws_Lib.Xml.Write.element w "OuterKey"
              (fun w -> (fun w v -> Smaws_Lib.Xml.Write.text w v) w k);
            Smaws_Lib.Xml.Write.element w "value"
              (fun w -> nested_xml_map_with_xml_name_inner_map_to_xml w v)))
    pairs
let nested_xml_map_with_xml_name_input_output_to_xml w
  (x : nested_xml_map_with_xml_name_input_output) =
  ignore
    [(match x.nested_xml_map_with_xml_name_map with
      | None -> Smaws_Lib.Xml.Write.null w
      | Some v -> nested_xml_map_with_xml_name_map_to_xml w v)]