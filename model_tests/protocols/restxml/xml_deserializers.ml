open Types

let unit_of_xml _ = ()

let xml_nested_union_struct_of_xml i =
  let r_double_value = ref None in
  let r_float_value = ref None in
  let r_long_value = ref None in
  let r_integer_value = ref None in
  let r_short_value = ref None in
  let r_byte_value = ref None in
  let r_boolean_value = ref None in
  let r_string_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "doubleValue";
      "floatValue";
      "longValue";
      "integerValue";
      "shortValue";
      "byteValue";
      "booleanValue";
      "stringValue";
    ] (fun tag _ ->
      match tag with
      | "doubleValue" ->
          r_double_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "doubleValue"
                 Smaws_Lib.Xml.Parse.Primitive.double_of_string ())
      | "floatValue" ->
          r_float_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "floatValue"
                 Smaws_Lib.Xml.Parse.Primitive.float_of_string ())
      | "longValue" ->
          r_long_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "longValue"
                 Smaws_Lib.Xml.Parse.Primitive.long_of_string ())
      | "integerValue" ->
          r_integer_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "integerValue"
                 Smaws_Lib.Xml.Parse.Primitive.int_of_string ())
      | "shortValue" ->
          r_short_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "shortValue"
                 Smaws_Lib.Xml.Parse.Primitive.int_of_string ())
      | "byteValue" ->
          r_byte_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "byteValue"
                 Smaws_Lib.Xml.Parse.Primitive.int_of_string ())
      | "booleanValue" ->
          r_boolean_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "booleanValue"
                 Smaws_Lib.Xml.Parse.Primitive.bool_of_string ())
      | "stringValue" ->
          r_string_value := Some (Smaws_Lib.Xml.Parse.Read.element_value i "stringValue" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     double_value = ( ! ) r_double_value;
     float_value = ( ! ) r_float_value;
     long_value = ( ! ) r_long_value;
     integer_value = ( ! ) r_integer_value;
     short_value = ( ! ) r_short_value;
     byte_value = ( ! ) r_byte_value;
     boolean_value = ( ! ) r_boolean_value;
     string_value = ( ! ) r_string_value;
   }
    : xml_nested_union_struct)

let rec xml_union_shape_of_xml i =
  let r_struct_value = ref None in
  let r_union_value = ref None in
  let r_double_value = ref None in
  let r_float_value = ref None in
  let r_long_value = ref None in
  let r_integer_value = ref None in
  let r_short_value = ref None in
  let r_byte_value = ref None in
  let r_boolean_value = ref None in
  let r_string_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "structValue";
      "unionValue";
      "doubleValue";
      "floatValue";
      "longValue";
      "integerValue";
      "shortValue";
      "byteValue";
      "booleanValue";
      "stringValue";
    ] (fun tag _ ->
      match tag with
      | "structValue" ->
          r_struct_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "structValue"
                 (fun i _ -> xml_nested_union_struct_of_xml i)
                 ())
      | "unionValue" ->
          r_union_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "unionValue"
                 (fun i _ -> xml_union_shape_of_xml i)
                 ())
      | "doubleValue" ->
          r_double_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "doubleValue"
                 Smaws_Lib.Xml.Parse.Primitive.double_of_string ())
      | "floatValue" ->
          r_float_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "floatValue"
                 Smaws_Lib.Xml.Parse.Primitive.float_of_string ())
      | "longValue" ->
          r_long_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "longValue"
                 Smaws_Lib.Xml.Parse.Primitive.long_of_string ())
      | "integerValue" ->
          r_integer_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "integerValue"
                 Smaws_Lib.Xml.Parse.Primitive.int_of_string ())
      | "shortValue" ->
          r_short_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "shortValue"
                 Smaws_Lib.Xml.Parse.Primitive.int_of_string ())
      | "byteValue" ->
          r_byte_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "byteValue"
                 Smaws_Lib.Xml.Parse.Primitive.int_of_string ())
      | "booleanValue" ->
          r_boolean_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "booleanValue"
                 Smaws_Lib.Xml.Parse.Primitive.bool_of_string ())
      | "stringValue" ->
          r_string_value := Some (Smaws_Lib.Xml.Parse.Read.element_value i "stringValue" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  (match ( ! ) r_struct_value with
   | Some v -> StructValue v
   | None -> (
       match ( ! ) r_union_value with
       | Some v -> UnionValue v
       | None -> (
           match ( ! ) r_double_value with
           | Some v -> DoubleValue v
           | None -> (
               match ( ! ) r_float_value with
               | Some v -> FloatValue v
               | None -> (
                   match ( ! ) r_long_value with
                   | Some v -> LongValue v
                   | None -> (
                       match ( ! ) r_integer_value with
                       | Some v -> IntegerValue v
                       | None -> (
                           match ( ! ) r_short_value with
                           | Some v -> ShortValue v
                           | None -> (
                               match ( ! ) r_byte_value with
                               | Some v -> ByteValue v
                               | None -> (
                                   match ( ! ) r_boolean_value with
                                   | Some v -> BooleanValue v
                                   | None -> (
                                       match ( ! ) r_string_value with
                                       | Some v -> StringValue v
                                       | None -> failwith "no union member present in xml response")
                                   ))))))))
    : xml_union_shape)

let xml_unions_response_of_xml i =
  let r_union_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "unionValue" ] (fun tag _ ->
      match tag with
      | "unionValue" ->
          r_union_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "unionValue"
                 (fun i _ -> xml_union_shape_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ union_value = ( ! ) r_union_value } : xml_unions_response)

let xml_unions_request_of_xml i =
  let r_union_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "unionValue" ] (fun tag _ ->
      match tag with
      | "unionValue" ->
          r_union_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "unionValue"
                 (fun i _ -> xml_union_shape_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ union_value = ( ! ) r_union_value } : xml_unions_request)

let xml_timestamps_response_of_xml i = ()
let xml_timestamps_request_of_xml i = ()

let xml_timestamps_input_output_of_xml i =
  let r_http_date_on_target = ref None in
  let r_http_date = ref None in
  let r_epoch_seconds_on_target = ref None in
  let r_epoch_seconds = ref None in
  let r_date_time_on_target = ref None in
  let r_date_time = ref None in
  let r_normal = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "httpDateOnTarget";
      "httpDate";
      "epochSecondsOnTarget";
      "epochSeconds";
      "dateTimeOnTarget";
      "dateTime";
      "normal";
    ] (fun tag _ ->
      match tag with
      | "httpDateOnTarget" ->
          r_http_date_on_target :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "httpDateOnTarget"
                 (fun i _ -> Shared.Xml_deserializers.http_date_of_xml i)
                 ())
      | "httpDate" ->
          r_http_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "httpDate"
                 Smaws_Lib.Xml.Parse.Primitive.timestamp_httpdate_of_string ())
      | "epochSecondsOnTarget" ->
          r_epoch_seconds_on_target :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "epochSecondsOnTarget"
                 (fun i _ -> Shared.Xml_deserializers.epoch_seconds_of_xml i)
                 ())
      | "epochSeconds" ->
          r_epoch_seconds :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "epochSeconds"
                 Smaws_Lib.Xml.Parse.Primitive.timestamp_epoch_of_string ())
      | "dateTimeOnTarget" ->
          r_date_time_on_target :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "dateTimeOnTarget"
                 (fun i _ -> Shared.Xml_deserializers.date_time_of_xml i)
                 ())
      | "dateTime" ->
          r_date_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "dateTime"
                 Smaws_Lib.Xml.Parse.Primitive.timestamp_iso_of_string ())
      | "normal" ->
          r_normal :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "normal"
                 Smaws_Lib.Xml.Parse.Primitive.timestamp_iso_of_string ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     http_date_on_target = ( ! ) r_http_date_on_target;
     http_date = ( ! ) r_http_date;
     epoch_seconds_on_target = ( ! ) r_epoch_seconds_on_target;
     epoch_seconds = ( ! ) r_epoch_seconds;
     date_time_on_target = ( ! ) r_date_time_on_target;
     date_time = ( ! ) r_date_time;
     normal = ( ! ) r_normal;
   }
    : xml_timestamps_input_output)

let xml_namespaces_response_of_xml i = ()
let xml_namespaces_request_of_xml i = ()
let xml_namespaced_list_of_xml i = Smaws_Lib.Xml.Parse.Read.elements_value i "member" Fun.id ()

let xml_namespace_nested_of_xml i =
  let r_values = ref None in
  let r_foo = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "values"; "foo" ] (fun tag _ ->
      match tag with
      | "values" ->
          r_values :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "values"
                 (fun i _ -> Smaws_Lib.Xml.Parse.Read.elements_value i "member" Fun.id ())
                 ())
      | "foo" -> r_foo := Some (Smaws_Lib.Xml.Parse.Read.element_value i "foo" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ values = ( ! ) r_values; foo = ( ! ) r_foo } : xml_namespace_nested)

let xml_namespaces_input_output_of_xml i =
  let r_nested = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "nested" ] (fun tag _ ->
      match tag with
      | "nested" ->
          r_nested :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "nested"
                 (fun i _ -> xml_namespace_nested_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ nested = ( ! ) r_nested } : xml_namespaces_input_output)

let xml_maps_xml_name_input_output_map_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
      let k = Smaws_Lib.Xml.Parse.Read.element_value i "Attribute" Fun.id () in
      let v =
        Smaws_Lib.Xml.Parse.Read.sequence i "Setting"
          (fun i _ -> Shared.Xml_deserializers.greeting_struct_of_xml i)
          ()
      in
      (k, v))
    ()

let xml_maps_xml_name_response_of_xml i =
  let r_my_map = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "myMap" ] (fun tag _ ->
      match tag with
      | "myMap" ->
          r_my_map :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "myMap"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k = Smaws_Lib.Xml.Parse.Read.element_value i "Attribute" Fun.id () in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "Setting"
                           (fun i _ -> Shared.Xml_deserializers.greeting_struct_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ my_map = ( ! ) r_my_map } : xml_maps_xml_name_response)

let xml_maps_xml_name_request_of_xml i =
  let r_my_map = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "myMap" ] (fun tag _ ->
      match tag with
      | "myMap" ->
          r_my_map :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "myMap"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k = Smaws_Lib.Xml.Parse.Read.element_value i "Attribute" Fun.id () in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "Setting"
                           (fun i _ -> Shared.Xml_deserializers.greeting_struct_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ my_map = ( ! ) r_my_map } : xml_maps_xml_name_request)

let xml_maps_input_output_map_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
      let k = Smaws_Lib.Xml.Parse.Read.element_value i "key" Fun.id () in
      let v =
        Smaws_Lib.Xml.Parse.Read.sequence i "value"
          (fun i _ -> Shared.Xml_deserializers.greeting_struct_of_xml i)
          ()
      in
      (k, v))
    ()

let xml_maps_response_of_xml i =
  let r_my_map = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "myMap" ] (fun tag _ ->
      match tag with
      | "myMap" ->
          r_my_map :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "myMap"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k = Smaws_Lib.Xml.Parse.Read.element_value i "key" Fun.id () in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> Shared.Xml_deserializers.greeting_struct_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ my_map = ( ! ) r_my_map } : xml_maps_response)

let xml_maps_request_of_xml i =
  let r_my_map = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "myMap" ] (fun tag _ ->
      match tag with
      | "myMap" ->
          r_my_map :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "myMap"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k = Smaws_Lib.Xml.Parse.Read.element_value i "key" Fun.id () in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> Shared.Xml_deserializers.greeting_struct_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ my_map = ( ! ) r_my_map } : xml_maps_request)

let xml_map_with_xml_namespace_response_of_xml i = ()
let xml_map_with_xml_namespace_request_of_xml i = ()

let xml_map_with_xml_namespace_input_output_map_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
      let k = Smaws_Lib.Xml.Parse.Read.element_value i "K" Fun.id () in
      let v = Smaws_Lib.Xml.Parse.Read.element_value i "V" Fun.id () in
      (k, v))
    ()

let xml_map_with_xml_namespace_input_output_of_xml i =
  let r_my_map = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "KVP" ] (fun tag _ ->
      match tag with
      | "KVP" ->
          r_my_map :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "KVP"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k = Smaws_Lib.Xml.Parse.Read.element_value i "K" Fun.id () in
                       let v = Smaws_Lib.Xml.Parse.Read.element_value i "V" Fun.id () in
                       (k, v))
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ my_map = ( ! ) r_my_map } : xml_map_with_xml_namespace_input_output)

let xml_lists_response_of_xml i = ()
let xml_lists_request_of_xml i = ()
let renamed_list_members_of_xml i = Smaws_Lib.Xml.Parse.Read.elements_value i "item" Fun.id ()

let list_with_member_namespace_of_xml i =
  Smaws_Lib.Xml.Parse.Read.elements_value i "member" Fun.id ()

let list_with_namespace_of_xml i = Smaws_Lib.Xml.Parse.Read.elements_value i "member" Fun.id ()

let structure_list_member_of_xml i =
  let r_b = ref None in
  let r_a = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "other"; "value" ] (fun tag _ ->
      match tag with
      | "other" -> r_b := Some (Smaws_Lib.Xml.Parse.Read.element_value i "other" Fun.id ())
      | "value" -> r_a := Some (Smaws_Lib.Xml.Parse.Read.element_value i "value" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ b = ( ! ) r_b; a = ( ! ) r_a } : structure_list_member)

let structure_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "item" (fun i _ -> structure_list_member_of_xml i) ()

let xml_lists_input_output_of_xml i =
  let r_flattened_structure_list = ref None in
  let r_structure_list = ref None in
  let r_flattened_list_with_namespace = ref None in
  let r_flattened_list_with_member_namespace = ref None in
  let r_flattened_list2 = ref None in
  let r_flattened_list = ref None in
  let r_renamed_list_members = ref None in
  let r_nested_string_list = ref None in
  let r_int_enum_list = ref None in
  let r_enum_list = ref None in
  let r_timestamp_list = ref None in
  let r_boolean_list = ref None in
  let r_integer_list = ref None in
  let r_string_set = ref None in
  let r_string_list = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "flattenedStructureList";
      "myStructureList";
      "flattenedListWithNamespace";
      "flattenedListWithMemberNamespace";
      "customName";
      "flattenedList";
      "renamed";
      "nestedStringList";
      "intEnumList";
      "enumList";
      "timestampList";
      "booleanList";
      "integerList";
      "stringSet";
      "stringList";
    ] (fun tag _ ->
      match tag with
      | "flattenedStructureList" ->
          r_flattened_structure_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequences i "flattenedStructureList"
                 (fun i _ -> structure_list_member_of_xml i)
                 ())
      | "myStructureList" ->
          r_structure_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "myStructureList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "item"
                     (fun i _ -> structure_list_member_of_xml i)
                     ())
                 ())
      | "flattenedListWithNamespace" ->
          r_flattened_list_with_namespace :=
            Some (Smaws_Lib.Xml.Parse.Read.elements_value i "flattenedListWithNamespace" Fun.id ())
      | "flattenedListWithMemberNamespace" ->
          r_flattened_list_with_member_namespace :=
            Some
              (Smaws_Lib.Xml.Parse.Read.elements_value i "flattenedListWithMemberNamespace" Fun.id
                 ())
      | "customName" ->
          r_flattened_list2 :=
            Some (Smaws_Lib.Xml.Parse.Read.elements_value i "customName" Fun.id ())
      | "flattenedList" ->
          r_flattened_list :=
            Some (Smaws_Lib.Xml.Parse.Read.elements_value i "flattenedList" Fun.id ())
      | "renamed" ->
          r_renamed_list_members :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "renamed"
                 (fun i _ -> Smaws_Lib.Xml.Parse.Read.elements_value i "item" Fun.id ())
                 ())
      | "nestedStringList" ->
          r_nested_string_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "nestedStringList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.string_list_of_xml i)
                     ())
                 ())
      | "intEnumList" ->
          r_int_enum_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "intEnumList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                     ())
                 ())
      | "enumList" ->
          r_enum_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "enumList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                     ())
                 ())
      | "timestampList" ->
          r_timestamp_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "timestampList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.elements_value i "member"
                     Smaws_Lib.Xml.Parse.Primitive.timestamp_iso_of_string ())
                 ())
      | "booleanList" ->
          r_boolean_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "booleanList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.elements_value i "member"
                     Smaws_Lib.Xml.Parse.Primitive.bool_of_string ())
                 ())
      | "integerList" ->
          r_integer_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "integerList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.elements_value i "member"
                     Smaws_Lib.Xml.Parse.Primitive.int_of_string ())
                 ())
      | "stringSet" ->
          r_string_set :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "stringSet"
                 (fun i _ -> Smaws_Lib.Xml.Parse.Read.elements_value i "member" Fun.id ())
                 ())
      | "stringList" ->
          r_string_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "stringList"
                 (fun i _ -> Smaws_Lib.Xml.Parse.Read.elements_value i "member" Fun.id ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     flattened_structure_list = ( ! ) r_flattened_structure_list;
     structure_list = ( ! ) r_structure_list;
     flattened_list_with_namespace = ( ! ) r_flattened_list_with_namespace;
     flattened_list_with_member_namespace = ( ! ) r_flattened_list_with_member_namespace;
     flattened_list2 = ( ! ) r_flattened_list2;
     flattened_list = ( ! ) r_flattened_list;
     renamed_list_members = ( ! ) r_renamed_list_members;
     nested_string_list = ( ! ) r_nested_string_list;
     int_enum_list = ( ! ) r_int_enum_list;
     enum_list = ( ! ) r_enum_list;
     timestamp_list = ( ! ) r_timestamp_list;
     boolean_list = ( ! ) r_boolean_list;
     integer_list = ( ! ) r_integer_list;
     string_set = ( ! ) r_string_set;
     string_list = ( ! ) r_string_list;
   }
    : xml_lists_input_output)

let xml_int_enums_response_of_xml i = ()
let xml_int_enums_request_of_xml i = ()

let xml_int_enums_input_output_of_xml i =
  let r_int_enum_map = ref None in
  let r_int_enum_set = ref None in
  let r_int_enum_list = ref None in
  let r_int_enum3 = ref None in
  let r_int_enum2 = ref None in
  let r_int_enum1 = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "intEnumMap"; "intEnumSet"; "intEnumList"; "intEnum3"; "intEnum2"; "intEnum1" ] (fun tag _ ->
      match tag with
      | "intEnumMap" ->
          r_int_enum_map :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "intEnumMap"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k = Smaws_Lib.Xml.Parse.Read.element_value i "key" Fun.id () in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | "intEnumSet" ->
          r_int_enum_set :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "intEnumSet"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                     ())
                 ())
      | "intEnumList" ->
          r_int_enum_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "intEnumList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                     ())
                 ())
      | "intEnum3" ->
          r_int_enum3 :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "intEnum3"
                 (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                 ())
      | "intEnum2" ->
          r_int_enum2 :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "intEnum2"
                 (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                 ())
      | "intEnum1" ->
          r_int_enum1 :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "intEnum1"
                 (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     int_enum_map = ( ! ) r_int_enum_map;
     int_enum_set = ( ! ) r_int_enum_set;
     int_enum_list = ( ! ) r_int_enum_list;
     int_enum3 = ( ! ) r_int_enum3;
     int_enum2 = ( ! ) r_int_enum2;
     int_enum1 = ( ! ) r_int_enum1;
   }
    : xml_int_enums_input_output)

let xml_enums_response_of_xml i = ()
let xml_enums_request_of_xml i = ()

let xml_enums_input_output_of_xml i =
  let r_foo_enum_map = ref None in
  let r_foo_enum_set = ref None in
  let r_foo_enum_list = ref None in
  let r_foo_enum3 = ref None in
  let r_foo_enum2 = ref None in
  let r_foo_enum1 = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "fooEnumMap"; "fooEnumSet"; "fooEnumList"; "fooEnum3"; "fooEnum2"; "fooEnum1" ] (fun tag _ ->
      match tag with
      | "fooEnumMap" ->
          r_foo_enum_map :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "fooEnumMap"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k = Smaws_Lib.Xml.Parse.Read.element_value i "key" Fun.id () in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | "fooEnumSet" ->
          r_foo_enum_set :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "fooEnumSet"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                     ())
                 ())
      | "fooEnumList" ->
          r_foo_enum_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "fooEnumList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                     ())
                 ())
      | "fooEnum3" ->
          r_foo_enum3 :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "fooEnum3"
                 (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                 ())
      | "fooEnum2" ->
          r_foo_enum2 :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "fooEnum2"
                 (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                 ())
      | "fooEnum1" ->
          r_foo_enum1 :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "fooEnum1"
                 (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     foo_enum_map = ( ! ) r_foo_enum_map;
     foo_enum_set = ( ! ) r_foo_enum_set;
     foo_enum_list = ( ! ) r_foo_enum_list;
     foo_enum3 = ( ! ) r_foo_enum3;
     foo_enum2 = ( ! ) r_foo_enum2;
     foo_enum1 = ( ! ) r_foo_enum1;
   }
    : xml_enums_input_output)

let xml_empty_strings_response_of_xml i =
  let r_empty_string = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "emptyString" ] (fun tag _ ->
      match tag with
      | "emptyString" ->
          r_empty_string := Some (Smaws_Lib.Xml.Parse.Read.element_value i "emptyString" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ empty_string = ( ! ) r_empty_string } : xml_empty_strings_response)

let xml_empty_strings_request_of_xml i =
  let r_empty_string = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "emptyString" ] (fun tag _ ->
      match tag with
      | "emptyString" ->
          r_empty_string := Some (Smaws_Lib.Xml.Parse.Read.element_value i "emptyString" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ empty_string = ( ! ) r_empty_string } : xml_empty_strings_request)

let xml_empty_maps_response_of_xml i =
  let r_my_map = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "myMap" ] (fun tag _ ->
      match tag with
      | "myMap" ->
          r_my_map :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "myMap"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k = Smaws_Lib.Xml.Parse.Read.element_value i "key" Fun.id () in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> Shared.Xml_deserializers.greeting_struct_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ my_map = ( ! ) r_my_map } : xml_empty_maps_response)

let xml_empty_maps_request_of_xml i =
  let r_my_map = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "myMap" ] (fun tag _ ->
      match tag with
      | "myMap" ->
          r_my_map :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "myMap"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k = Smaws_Lib.Xml.Parse.Read.element_value i "key" Fun.id () in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> Shared.Xml_deserializers.greeting_struct_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ my_map = ( ! ) r_my_map } : xml_empty_maps_request)

let xml_empty_lists_response_of_xml i = ()
let xml_empty_lists_request_of_xml i = ()

let xml_empty_blobs_response_of_xml i =
  let r_data = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "data" ] (fun tag _ ->
      match tag with
      | "data" ->
          r_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "data"
                 Smaws_Lib.Xml.Parse.Primitive.blob_of_string ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ data = ( ! ) r_data } : xml_empty_blobs_response)

let xml_empty_blobs_request_of_xml i =
  let r_data = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "data" ] (fun tag _ ->
      match tag with
      | "data" ->
          r_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "data"
                 Smaws_Lib.Xml.Parse.Primitive.blob_of_string ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ data = ( ! ) r_data } : xml_empty_blobs_request)

let xml_blobs_response_of_xml i =
  let r_data = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "data" ] (fun tag _ ->
      match tag with
      | "data" ->
          r_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "data"
                 Smaws_Lib.Xml.Parse.Primitive.blob_of_string ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ data = ( ! ) r_data } : xml_blobs_response)

let xml_blobs_request_of_xml i =
  let r_data = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "data" ] (fun tag _ ->
      match tag with
      | "data" ->
          r_data :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "data"
                 Smaws_Lib.Xml.Parse.Primitive.blob_of_string ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ data = ( ! ) r_data } : xml_blobs_request)

let xml_attributes_response_of_xml i = ()
let xml_attributes_request_of_xml i = ()
let xml_attributes_payload_response_of_xml i = ()
let xml_attributes_payload_request_of_xml i = ()

let xml_attributes_on_payload_response_of_xml i =
  let r_payload = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "payload" ] (fun tag _ ->
      match tag with
      | "payload" ->
          r_payload :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "payload"
                 (fun i _ -> xml_attributes_payload_response_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ payload = ( ! ) r_payload } : xml_attributes_on_payload_response)

let xml_attributes_on_payload_request_of_xml i =
  let r_payload = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "payload" ] (fun tag _ ->
      match tag with
      | "payload" ->
          r_payload :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "payload"
                 (fun i _ -> xml_attributes_payload_request_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ payload = ( ! ) r_payload } : xml_attributes_on_payload_request)

let xml_attributes_middle_member_input_output_of_xml i =
  let r_baz = ref None in
  let r_attr = ref None in
  let r_foo = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "baz"; "test"; "foo" ] (fun tag _ ->
      match tag with
      | "baz" -> r_baz := Some (Smaws_Lib.Xml.Parse.Read.element_value i "baz" Fun.id ())
      | "test" -> r_attr := Some (Smaws_Lib.Xml.Parse.Read.element_value i "test" Fun.id ())
      | "foo" -> r_foo := Some (Smaws_Lib.Xml.Parse.Read.element_value i "foo" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ baz = ( ! ) r_baz; attr = ( ! ) r_attr; foo = ( ! ) r_foo }
    : xml_attributes_middle_member_input_output)

let xml_attributes_input_output_of_xml i =
  let r_attr = ref None in
  let r_foo = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "test"; "foo" ] (fun tag _ ->
      match tag with
      | "test" -> r_attr := Some (Smaws_Lib.Xml.Parse.Read.element_value i "test" Fun.id ())
      | "foo" -> r_foo := Some (Smaws_Lib.Xml.Parse.Read.element_value i "foo" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ attr = ( ! ) r_attr; foo = ( ! ) r_foo } : xml_attributes_input_output)

let xml_attributes_in_middle_payload_response_of_xml i = ()

let xml_attributes_in_middle_response_of_xml i =
  let r_payload = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "payload" ] (fun tag _ ->
      match tag with
      | "payload" ->
          r_payload :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "payload"
                 (fun i _ -> xml_attributes_in_middle_payload_response_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ payload = ( ! ) r_payload } : xml_attributes_in_middle_response)

let xml_attributes_in_middle_payload_request_of_xml i = ()

let xml_attributes_in_middle_request_of_xml i =
  let r_payload = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "payload" ] (fun tag _ ->
      match tag with
      | "payload" ->
          r_payload :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "payload"
                 (fun i _ -> xml_attributes_in_middle_payload_request_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ payload = ( ! ) r_payload } : xml_attributes_in_middle_request)

let union_payload_of_xml i =
  let r_greeting = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "greeting" ] (fun tag _ ->
      match tag with
      | "greeting" ->
          r_greeting := Some (Smaws_Lib.Xml.Parse.Read.element_value i "greeting" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  (match ( ! ) r_greeting with
   | Some v -> Greeting v
   | None -> failwith "no union member present in xml response"
    : union_payload)

let timestamp_format_headers_i_o_of_xml i =
  let r_target_date_time = ref None in
  let r_target_http_date = ref None in
  let r_target_epoch_seconds = ref None in
  let r_default_format = ref None in
  let r_member_date_time = ref None in
  let r_member_http_date = ref None in
  let r_member_epoch_seconds = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "targetDateTime";
      "targetHttpDate";
      "targetEpochSeconds";
      "defaultFormat";
      "memberDateTime";
      "memberHttpDate";
      "memberEpochSeconds";
    ] (fun tag _ ->
      match tag with
      | "targetDateTime" ->
          r_target_date_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "targetDateTime"
                 (fun i _ -> Shared.Xml_deserializers.date_time_of_xml i)
                 ())
      | "targetHttpDate" ->
          r_target_http_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "targetHttpDate"
                 (fun i _ -> Shared.Xml_deserializers.http_date_of_xml i)
                 ())
      | "targetEpochSeconds" ->
          r_target_epoch_seconds :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "targetEpochSeconds"
                 (fun i _ -> Shared.Xml_deserializers.epoch_seconds_of_xml i)
                 ())
      | "defaultFormat" ->
          r_default_format :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "defaultFormat"
                 Smaws_Lib.Xml.Parse.Primitive.timestamp_iso_of_string ())
      | "memberDateTime" ->
          r_member_date_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "memberDateTime"
                 Smaws_Lib.Xml.Parse.Primitive.timestamp_iso_of_string ())
      | "memberHttpDate" ->
          r_member_http_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "memberHttpDate"
                 Smaws_Lib.Xml.Parse.Primitive.timestamp_httpdate_of_string ())
      | "memberEpochSeconds" ->
          r_member_epoch_seconds :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "memberEpochSeconds"
                 Smaws_Lib.Xml.Parse.Primitive.timestamp_epoch_of_string ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     target_date_time = ( ! ) r_target_date_time;
     target_http_date = ( ! ) r_target_http_date;
     target_epoch_seconds = ( ! ) r_target_epoch_seconds;
     default_format = ( ! ) r_default_format;
     member_date_time = ( ! ) r_member_date_time;
     member_http_date = ( ! ) r_member_http_date;
     member_epoch_seconds = ( ! ) r_member_epoch_seconds;
   }
    : timestamp_format_headers_i_o)

let string_payload_input_of_xml i =
  let r_payload = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "payload" ] (fun tag _ ->
      match tag with
      | "payload" ->
          r_payload := Some (Smaws_Lib.Xml.Parse.Read.element_value i "payload" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ payload = ( ! ) r_payload } : string_payload_input)

let string_enum_of_xml i =
  let s = Smaws_Lib.Xml.Parse.Read.data i in
  (match s with "enumvalue" -> V | _ -> failwith "unknown enum value" : string_enum)

let simple_scalar_properties_response_of_xml i = ()
let simple_scalar_properties_request_of_xml i = ()

let simple_scalar_properties_input_output_of_xml i =
  let r_double_value = ref None in
  let r_float_value = ref None in
  let r_long_value = ref None in
  let r_integer_value = ref None in
  let r_short_value = ref None in
  let r_byte_value = ref None in
  let r_false_boolean_value = ref None in
  let r_true_boolean_value = ref None in
  let r_string_value = ref None in
  let r_foo = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "DoubleDribble";
      "floatValue";
      "longValue";
      "integerValue";
      "shortValue";
      "byteValue";
      "falseBooleanValue";
      "trueBooleanValue";
      "stringValue";
      "foo";
    ] (fun tag _ ->
      match tag with
      | "DoubleDribble" ->
          r_double_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "DoubleDribble"
                 Smaws_Lib.Xml.Parse.Primitive.double_of_string ())
      | "floatValue" ->
          r_float_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "floatValue"
                 Smaws_Lib.Xml.Parse.Primitive.float_of_string ())
      | "longValue" ->
          r_long_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "longValue"
                 Smaws_Lib.Xml.Parse.Primitive.long_of_string ())
      | "integerValue" ->
          r_integer_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "integerValue"
                 Smaws_Lib.Xml.Parse.Primitive.int_of_string ())
      | "shortValue" ->
          r_short_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "shortValue"
                 Smaws_Lib.Xml.Parse.Primitive.int_of_string ())
      | "byteValue" ->
          r_byte_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "byteValue"
                 Smaws_Lib.Xml.Parse.Primitive.int_of_string ())
      | "falseBooleanValue" ->
          r_false_boolean_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "falseBooleanValue"
                 Smaws_Lib.Xml.Parse.Primitive.bool_of_string ())
      | "trueBooleanValue" ->
          r_true_boolean_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "trueBooleanValue"
                 Smaws_Lib.Xml.Parse.Primitive.bool_of_string ())
      | "stringValue" ->
          r_string_value := Some (Smaws_Lib.Xml.Parse.Read.element_value i "stringValue" Fun.id ())
      | "foo" -> r_foo := Some (Smaws_Lib.Xml.Parse.Read.element_value i "foo" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     double_value = ( ! ) r_double_value;
     float_value = ( ! ) r_float_value;
     long_value = ( ! ) r_long_value;
     integer_value = ( ! ) r_integer_value;
     short_value = ( ! ) r_short_value;
     byte_value = ( ! ) r_byte_value;
     false_boolean_value = ( ! ) r_false_boolean_value;
     true_boolean_value = ( ! ) r_true_boolean_value;
     string_value = ( ! ) r_string_value;
     foo = ( ! ) r_foo;
   }
    : simple_scalar_properties_input_output)

let rec recursive_shapes_input_output_nested1_of_xml i =
  let r_nested = ref None in
  let r_foo = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "nested"; "foo" ] (fun tag _ ->
      match tag with
      | "nested" ->
          r_nested :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "nested"
                 (fun i _ -> recursive_shapes_input_output_nested2_of_xml i)
                 ())
      | "foo" -> r_foo := Some (Smaws_Lib.Xml.Parse.Read.element_value i "foo" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ nested = ( ! ) r_nested; foo = ( ! ) r_foo } : recursive_shapes_input_output_nested1)

and recursive_shapes_input_output_nested2_of_xml i =
  let r_recursive_member = ref None in
  let r_bar = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "recursiveMember"; "bar" ] (fun tag _ ->
      match tag with
      | "recursiveMember" ->
          r_recursive_member :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "recursiveMember"
                 (fun i _ -> recursive_shapes_input_output_nested1_of_xml i)
                 ())
      | "bar" -> r_bar := Some (Smaws_Lib.Xml.Parse.Read.element_value i "bar" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ recursive_member = ( ! ) r_recursive_member; bar = ( ! ) r_bar }
    : recursive_shapes_input_output_nested2)

let recursive_shapes_response_of_xml i =
  let r_nested = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "nested" ] (fun tag _ ->
      match tag with
      | "nested" ->
          r_nested :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "nested"
                 (fun i _ -> recursive_shapes_input_output_nested1_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ nested = ( ! ) r_nested } : recursive_shapes_response)

let recursive_shapes_request_of_xml i =
  let r_nested = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "nested" ] (fun tag _ ->
      match tag with
      | "nested" ->
          r_nested :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "nested"
                 (fun i _ -> recursive_shapes_input_output_nested1_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ nested = ( ! ) r_nested } : recursive_shapes_request)

let query_precedence_input_of_xml i =
  let r_baz = ref None in
  let r_foo = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "baz"; "foo" ] (fun tag _ ->
      match tag with
      | "baz" ->
          r_baz :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "baz"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k = Smaws_Lib.Xml.Parse.Read.element_value i "key" Fun.id () in
                       let v = Smaws_Lib.Xml.Parse.Read.element_value i "value" Fun.id () in
                       (k, v))
                     ())
                 ())
      | "foo" -> r_foo := Some (Smaws_Lib.Xml.Parse.Read.element_value i "foo" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ baz = ( ! ) r_baz; foo = ( ! ) r_foo } : query_precedence_input)

let query_params_as_string_list_map_input_of_xml i =
  let r_foo = ref None in
  let r_qux = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "foo"; "qux" ] (fun tag _ ->
      match tag with
      | "foo" ->
          r_foo :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "foo"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k = Smaws_Lib.Xml.Parse.Read.element_value i "key" Fun.id () in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> Shared.Xml_deserializers.string_list_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | "qux" -> r_qux := Some (Smaws_Lib.Xml.Parse.Read.element_value i "qux" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ foo = ( ! ) r_foo; qux = ( ! ) r_qux } : query_params_as_string_list_map_input)

let query_idempotency_token_auto_fill_input_of_xml i =
  let r_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "token" ] (fun tag _ ->
      match tag with
      | "token" -> r_token := Some (Smaws_Lib.Xml.Parse.Read.element_value i "token" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ token = ( ! ) r_token } : query_idempotency_token_auto_fill_input)

let put_with_content_encoding_input_of_xml i =
  let r_data = ref None in
  let r_encoding = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "data"; "encoding" ] (fun tag _ ->
      match tag with
      | "data" -> r_data := Some (Smaws_Lib.Xml.Parse.Read.element_value i "data" Fun.id ())
      | "encoding" ->
          r_encoding := Some (Smaws_Lib.Xml.Parse.Read.element_value i "encoding" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ data = ( ! ) r_data; encoding = ( ! ) r_encoding } : put_with_content_encoding_input)

let omits_null_serializes_empty_string_input_of_xml i =
  let r_empty_string = ref None in
  let r_null_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "emptyString"; "nullValue" ] (fun tag _ ->
      match tag with
      | "emptyString" ->
          r_empty_string := Some (Smaws_Lib.Xml.Parse.Read.element_value i "emptyString" Fun.id ())
      | "nullValue" ->
          r_null_value := Some (Smaws_Lib.Xml.Parse.Read.element_value i "nullValue" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ empty_string = ( ! ) r_empty_string; null_value = ( ! ) r_null_value }
    : omits_null_serializes_empty_string_input)

let null_and_empty_headers_i_o_of_xml i =
  let r_c = ref None in
  let r_b = ref None in
  let r_a = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "c"; "b"; "a" ] (fun tag _ ->
      match tag with
      | "c" ->
          r_c :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "c"
                 (fun i _ -> Smaws_Lib.Xml.Parse.Read.elements_value i "member" Fun.id ())
                 ())
      | "b" -> r_b := Some (Smaws_Lib.Xml.Parse.Read.element_value i "b" Fun.id ())
      | "a" -> r_a := Some (Smaws_Lib.Xml.Parse.Read.element_value i "a" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ c = ( ! ) r_c; b = ( ! ) r_b; a = ( ! ) r_a } : null_and_empty_headers_i_o)

let no_input_and_output_output_of_xml i = ()
let nested_xml_map_with_xml_name_response_of_xml i = ()
let nested_xml_map_with_xml_name_request_of_xml i = ()
let nested_xml_maps_response_of_xml i = ()
let nested_xml_maps_request_of_xml i = ()

let input_and_output_with_headers_i_o_of_xml i =
  let r_header_enum_list = ref None in
  let r_header_enum = ref None in
  let r_header_timestamp_list = ref None in
  let r_header_boolean_list = ref None in
  let r_header_integer_list = ref None in
  let r_header_string_set = ref None in
  let r_header_string_list = ref None in
  let r_header_false_bool = ref None in
  let r_header_true_bool = ref None in
  let r_header_double = ref None in
  let r_header_float = ref None in
  let r_header_long = ref None in
  let r_header_integer = ref None in
  let r_header_short = ref None in
  let r_header_byte = ref None in
  let r_header_string = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "headerEnumList";
      "headerEnum";
      "headerTimestampList";
      "headerBooleanList";
      "headerIntegerList";
      "headerStringSet";
      "headerStringList";
      "headerFalseBool";
      "headerTrueBool";
      "headerDouble";
      "headerFloat";
      "headerLong";
      "headerInteger";
      "headerShort";
      "headerByte";
      "headerString";
    ] (fun tag _ ->
      match tag with
      | "headerEnumList" ->
          r_header_enum_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "headerEnumList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                     ())
                 ())
      | "headerEnum" ->
          r_header_enum :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "headerEnum"
                 (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                 ())
      | "headerTimestampList" ->
          r_header_timestamp_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "headerTimestampList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.elements_value i "member"
                     Smaws_Lib.Xml.Parse.Primitive.timestamp_iso_of_string ())
                 ())
      | "headerBooleanList" ->
          r_header_boolean_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "headerBooleanList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.elements_value i "member"
                     Smaws_Lib.Xml.Parse.Primitive.bool_of_string ())
                 ())
      | "headerIntegerList" ->
          r_header_integer_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "headerIntegerList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.elements_value i "member"
                     Smaws_Lib.Xml.Parse.Primitive.int_of_string ())
                 ())
      | "headerStringSet" ->
          r_header_string_set :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "headerStringSet"
                 (fun i _ -> Smaws_Lib.Xml.Parse.Read.elements_value i "member" Fun.id ())
                 ())
      | "headerStringList" ->
          r_header_string_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "headerStringList"
                 (fun i _ -> Smaws_Lib.Xml.Parse.Read.elements_value i "member" Fun.id ())
                 ())
      | "headerFalseBool" ->
          r_header_false_bool :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "headerFalseBool"
                 Smaws_Lib.Xml.Parse.Primitive.bool_of_string ())
      | "headerTrueBool" ->
          r_header_true_bool :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "headerTrueBool"
                 Smaws_Lib.Xml.Parse.Primitive.bool_of_string ())
      | "headerDouble" ->
          r_header_double :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "headerDouble"
                 Smaws_Lib.Xml.Parse.Primitive.double_of_string ())
      | "headerFloat" ->
          r_header_float :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "headerFloat"
                 Smaws_Lib.Xml.Parse.Primitive.float_of_string ())
      | "headerLong" ->
          r_header_long :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "headerLong"
                 Smaws_Lib.Xml.Parse.Primitive.long_of_string ())
      | "headerInteger" ->
          r_header_integer :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "headerInteger"
                 Smaws_Lib.Xml.Parse.Primitive.int_of_string ())
      | "headerShort" ->
          r_header_short :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "headerShort"
                 Smaws_Lib.Xml.Parse.Primitive.int_of_string ())
      | "headerByte" ->
          r_header_byte :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "headerByte"
                 Smaws_Lib.Xml.Parse.Primitive.int_of_string ())
      | "headerString" ->
          r_header_string :=
            Some (Smaws_Lib.Xml.Parse.Read.element_value i "headerString" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     header_enum_list = ( ! ) r_header_enum_list;
     header_enum = ( ! ) r_header_enum;
     header_timestamp_list = ( ! ) r_header_timestamp_list;
     header_boolean_list = ( ! ) r_header_boolean_list;
     header_integer_list = ( ! ) r_header_integer_list;
     header_string_set = ( ! ) r_header_string_set;
     header_string_list = ( ! ) r_header_string_list;
     header_false_bool = ( ! ) r_header_false_bool;
     header_true_bool = ( ! ) r_header_true_bool;
     header_double = ( ! ) r_header_double;
     header_float = ( ! ) r_header_float;
     header_long = ( ! ) r_header_long;
     header_integer = ( ! ) r_header_integer;
     header_short = ( ! ) r_header_short;
     header_byte = ( ! ) r_header_byte;
     header_string = ( ! ) r_header_string;
   }
    : input_and_output_with_headers_i_o)

let ignore_query_params_in_response_output_of_xml i =
  let r_baz = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "baz" ] (fun tag _ ->
      match tag with
      | "baz" -> r_baz := Some (Smaws_Lib.Xml.Parse.Read.element_value i "baz" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ baz = ( ! ) r_baz } : ignore_query_params_in_response_output)

let http_response_code_output_of_xml i =
  let r_status = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Status" ] (fun tag _ ->
      match tag with
      | "Status" ->
          r_status :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "Status"
                 Smaws_Lib.Xml.Parse.Primitive.int_of_string ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ status = ( ! ) r_status } : http_response_code_output)

let http_request_with_labels_and_timestamp_format_input_of_xml i =
  let r_target_date_time = ref None in
  let r_target_http_date = ref None in
  let r_target_epoch_seconds = ref None in
  let r_default_format = ref None in
  let r_member_date_time = ref None in
  let r_member_http_date = ref None in
  let r_member_epoch_seconds = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "targetDateTime";
      "targetHttpDate";
      "targetEpochSeconds";
      "defaultFormat";
      "memberDateTime";
      "memberHttpDate";
      "memberEpochSeconds";
    ] (fun tag _ ->
      match tag with
      | "targetDateTime" ->
          r_target_date_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "targetDateTime"
                 (fun i _ -> Shared.Xml_deserializers.date_time_of_xml i)
                 ())
      | "targetHttpDate" ->
          r_target_http_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "targetHttpDate"
                 (fun i _ -> Shared.Xml_deserializers.http_date_of_xml i)
                 ())
      | "targetEpochSeconds" ->
          r_target_epoch_seconds :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "targetEpochSeconds"
                 (fun i _ -> Shared.Xml_deserializers.epoch_seconds_of_xml i)
                 ())
      | "defaultFormat" ->
          r_default_format :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "defaultFormat"
                 Smaws_Lib.Xml.Parse.Primitive.timestamp_iso_of_string ())
      | "memberDateTime" ->
          r_member_date_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "memberDateTime"
                 Smaws_Lib.Xml.Parse.Primitive.timestamp_iso_of_string ())
      | "memberHttpDate" ->
          r_member_http_date :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "memberHttpDate"
                 Smaws_Lib.Xml.Parse.Primitive.timestamp_httpdate_of_string ())
      | "memberEpochSeconds" ->
          r_member_epoch_seconds :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "memberEpochSeconds"
                 Smaws_Lib.Xml.Parse.Primitive.timestamp_epoch_of_string ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     target_date_time = Smaws_Lib.Xml.Parse.required "targetDateTime" (( ! ) r_target_date_time) i;
     target_http_date = Smaws_Lib.Xml.Parse.required "targetHttpDate" (( ! ) r_target_http_date) i;
     target_epoch_seconds =
       Smaws_Lib.Xml.Parse.required "targetEpochSeconds" (( ! ) r_target_epoch_seconds) i;
     default_format = Smaws_Lib.Xml.Parse.required "defaultFormat" (( ! ) r_default_format) i;
     member_date_time = Smaws_Lib.Xml.Parse.required "memberDateTime" (( ! ) r_member_date_time) i;
     member_http_date = Smaws_Lib.Xml.Parse.required "memberHttpDate" (( ! ) r_member_http_date) i;
     member_epoch_seconds =
       Smaws_Lib.Xml.Parse.required "memberEpochSeconds" (( ! ) r_member_epoch_seconds) i;
   }
    : http_request_with_labels_and_timestamp_format_input)

let http_request_with_labels_input_of_xml i =
  let r_timestamp = ref None in
  let r_boolean_ = ref None in
  let r_double = ref None in
  let r_float_ = ref None in
  let r_long = ref None in
  let r_integer = ref None in
  let r_short = ref None in
  let r_string_ = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "timestamp"; "boolean"; "double"; "float"; "long"; "integer"; "short"; "string" ]
    (fun tag _ ->
      match tag with
      | "timestamp" ->
          r_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "timestamp"
                 Smaws_Lib.Xml.Parse.Primitive.timestamp_iso_of_string ())
      | "boolean" ->
          r_boolean_ :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "boolean"
                 Smaws_Lib.Xml.Parse.Primitive.bool_of_string ())
      | "double" ->
          r_double :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "double"
                 Smaws_Lib.Xml.Parse.Primitive.double_of_string ())
      | "float" ->
          r_float_ :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "float"
                 Smaws_Lib.Xml.Parse.Primitive.float_of_string ())
      | "long" ->
          r_long :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "long"
                 Smaws_Lib.Xml.Parse.Primitive.long_of_string ())
      | "integer" ->
          r_integer :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "integer"
                 Smaws_Lib.Xml.Parse.Primitive.int_of_string ())
      | "short" ->
          r_short :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "short"
                 Smaws_Lib.Xml.Parse.Primitive.int_of_string ())
      | "string" -> r_string_ := Some (Smaws_Lib.Xml.Parse.Read.element_value i "string" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     timestamp = Smaws_Lib.Xml.Parse.required "timestamp" (( ! ) r_timestamp) i;
     boolean_ = Smaws_Lib.Xml.Parse.required "boolean" (( ! ) r_boolean_) i;
     double = Smaws_Lib.Xml.Parse.required "double" (( ! ) r_double) i;
     float_ = Smaws_Lib.Xml.Parse.required "float" (( ! ) r_float_) i;
     long = Smaws_Lib.Xml.Parse.required "long" (( ! ) r_long) i;
     integer = Smaws_Lib.Xml.Parse.required "integer" (( ! ) r_integer) i;
     short = Smaws_Lib.Xml.Parse.required "short" (( ! ) r_short) i;
     string_ = Smaws_Lib.Xml.Parse.required "string" (( ! ) r_string_) i;
   }
    : http_request_with_labels_input)

let http_request_with_greedy_label_in_path_input_of_xml i =
  let r_baz = ref None in
  let r_foo = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "baz"; "foo" ] (fun tag _ ->
      match tag with
      | "baz" -> r_baz := Some (Smaws_Lib.Xml.Parse.Read.element_value i "baz" Fun.id ())
      | "foo" -> r_foo := Some (Smaws_Lib.Xml.Parse.Read.element_value i "foo" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     baz = Smaws_Lib.Xml.Parse.required "baz" (( ! ) r_baz) i;
     foo = Smaws_Lib.Xml.Parse.required "foo" (( ! ) r_foo) i;
   }
    : http_request_with_greedy_label_in_path_input)

let http_request_with_float_labels_input_of_xml i =
  let r_double = ref None in
  let r_float_ = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "double"; "float" ] (fun tag _ ->
      match tag with
      | "double" ->
          r_double :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "double"
                 Smaws_Lib.Xml.Parse.Primitive.double_of_string ())
      | "float" ->
          r_float_ :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "float"
                 Smaws_Lib.Xml.Parse.Primitive.float_of_string ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     double = Smaws_Lib.Xml.Parse.required "double" (( ! ) r_double) i;
     float_ = Smaws_Lib.Xml.Parse.required "float" (( ! ) r_float_) i;
   }
    : http_request_with_float_labels_input)

let foo_prefix_headers_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
      let k = Smaws_Lib.Xml.Parse.Read.element_value i "key" Fun.id () in
      let v = Smaws_Lib.Xml.Parse.Read.element_value i "value" Fun.id () in
      (k, v))
    ()

let http_prefix_headers_input_output_of_xml i =
  let r_foo_map = ref None in
  let r_foo = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "fooMap"; "foo" ] (fun tag _ ->
      match tag with
      | "fooMap" ->
          r_foo_map :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "fooMap"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k = Smaws_Lib.Xml.Parse.Read.element_value i "key" Fun.id () in
                       let v = Smaws_Lib.Xml.Parse.Read.element_value i "value" Fun.id () in
                       (k, v))
                     ())
                 ())
      | "foo" -> r_foo := Some (Smaws_Lib.Xml.Parse.Read.element_value i "foo" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ foo_map = ( ! ) r_foo_map; foo = ( ! ) r_foo } : http_prefix_headers_input_output)

let payload_with_xml_namespace_and_prefix_of_xml i =
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "name" ] (fun tag _ ->
      match tag with
      | "name" -> r_name := Some (Smaws_Lib.Xml.Parse.Read.element_value i "name" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ name = ( ! ) r_name } : payload_with_xml_namespace_and_prefix)

let http_payload_with_xml_namespace_and_prefix_input_output_of_xml i =
  let r_nested = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "nested" ] (fun tag _ ->
      match tag with
      | "nested" ->
          r_nested :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "nested"
                 (fun i _ -> payload_with_xml_namespace_and_prefix_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ nested = ( ! ) r_nested } : http_payload_with_xml_namespace_and_prefix_input_output)

let payload_with_xml_namespace_of_xml i =
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "name" ] (fun tag _ ->
      match tag with
      | "name" -> r_name := Some (Smaws_Lib.Xml.Parse.Read.element_value i "name" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ name = ( ! ) r_name } : payload_with_xml_namespace)

let http_payload_with_xml_namespace_input_output_of_xml i =
  let r_nested = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "nested" ] (fun tag _ ->
      match tag with
      | "nested" ->
          r_nested :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "nested"
                 (fun i _ -> payload_with_xml_namespace_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ nested = ( ! ) r_nested } : http_payload_with_xml_namespace_input_output)

let payload_with_xml_name_of_xml i =
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "name" ] (fun tag _ ->
      match tag with
      | "name" -> r_name := Some (Smaws_Lib.Xml.Parse.Read.element_value i "name" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ name = ( ! ) r_name } : payload_with_xml_name)

let http_payload_with_xml_name_input_output_of_xml i =
  let r_nested = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "nested" ] (fun tag _ ->
      match tag with
      | "nested" ->
          r_nested :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "nested"
                 (fun i _ -> payload_with_xml_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ nested = ( ! ) r_nested } : http_payload_with_xml_name_input_output)

let http_payload_with_union_input_output_of_xml i =
  let r_nested = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "nested" ] (fun tag _ ->
      match tag with
      | "nested" ->
          r_nested :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "nested" (fun i _ -> union_payload_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ nested = ( ! ) r_nested } : http_payload_with_union_input_output)

let nested_payload_of_xml i =
  let r_name = ref None in
  let r_greeting = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "name"; "greeting" ] (fun tag _ ->
      match tag with
      | "name" -> r_name := Some (Smaws_Lib.Xml.Parse.Read.element_value i "name" Fun.id ())
      | "greeting" ->
          r_greeting := Some (Smaws_Lib.Xml.Parse.Read.element_value i "greeting" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ name = ( ! ) r_name; greeting = ( ! ) r_greeting } : nested_payload)

let http_payload_with_structure_input_output_of_xml i =
  let r_nested = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "nested" ] (fun tag _ ->
      match tag with
      | "nested" ->
          r_nested :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "nested" (fun i _ -> nested_payload_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ nested = ( ! ) r_nested } : http_payload_with_structure_input_output)

let http_payload_with_member_xml_name_input_output_of_xml i =
  let r_nested = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Hola" ] (fun tag _ ->
      match tag with
      | "Hola" ->
          r_nested :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Hola"
                 (fun i _ -> payload_with_xml_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ nested = ( ! ) r_nested } : http_payload_with_member_xml_name_input_output)

let http_payload_traits_with_media_type_input_output_of_xml i =
  let r_blob = ref None in
  let r_foo = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "blob"; "foo" ] (fun tag _ ->
      match tag with
      | "blob" ->
          r_blob :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "blob"
                 (fun i _ -> Shared.Xml_deserializers.text_plain_blob_of_xml i)
                 ())
      | "foo" -> r_foo := Some (Smaws_Lib.Xml.Parse.Read.element_value i "foo" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ blob = ( ! ) r_blob; foo = ( ! ) r_foo } : http_payload_traits_with_media_type_input_output)

let http_payload_traits_input_output_of_xml i =
  let r_blob = ref None in
  let r_foo = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "blob"; "foo" ] (fun tag _ ->
      match tag with
      | "blob" ->
          r_blob :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "blob"
                 Smaws_Lib.Xml.Parse.Primitive.blob_of_string ())
      | "foo" -> r_foo := Some (Smaws_Lib.Xml.Parse.Read.element_value i "foo" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ blob = ( ! ) r_blob; foo = ( ! ) r_foo } : http_payload_traits_input_output)

let enum_payload_input_of_xml i =
  let r_payload = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "payload" ] (fun tag _ ->
      match tag with
      | "payload" ->
          r_payload :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "payload" (fun i _ -> string_enum_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ payload = ( ! ) r_payload } : enum_payload_input)

let http_empty_prefix_headers_output_of_xml i =
  let r_specific_header = ref None in
  let r_prefix_headers = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "specificHeader"; "prefixHeaders" ] (fun tag _ ->
      match tag with
      | "specificHeader" ->
          r_specific_header :=
            Some (Smaws_Lib.Xml.Parse.Read.element_value i "specificHeader" Fun.id ())
      | "prefixHeaders" ->
          r_prefix_headers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "prefixHeaders"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k = Smaws_Lib.Xml.Parse.Read.element_value i "key" Fun.id () in
                       let v = Smaws_Lib.Xml.Parse.Read.element_value i "value" Fun.id () in
                       (k, v))
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ specific_header = ( ! ) r_specific_header; prefix_headers = ( ! ) r_prefix_headers }
    : http_empty_prefix_headers_output)

let http_empty_prefix_headers_input_of_xml i =
  let r_specific_header = ref None in
  let r_prefix_headers = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "specificHeader"; "prefixHeaders" ] (fun tag _ ->
      match tag with
      | "specificHeader" ->
          r_specific_header :=
            Some (Smaws_Lib.Xml.Parse.Read.element_value i "specificHeader" Fun.id ())
      | "prefixHeaders" ->
          r_prefix_headers :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "prefixHeaders"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k = Smaws_Lib.Xml.Parse.Read.element_value i "key" Fun.id () in
                       let v = Smaws_Lib.Xml.Parse.Read.element_value i "value" Fun.id () in
                       (k, v))
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ specific_header = ( ! ) r_specific_header; prefix_headers = ( ! ) r_prefix_headers }
    : http_empty_prefix_headers_input)

let invalid_greeting_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message := Some (Smaws_Lib.Xml.Parse.Read.element_value i "Message" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_greeting)

let complex_nested_error_data_of_xml i =
  let r_foo = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Foo" ] (fun tag _ ->
      match tag with
      | "Foo" -> r_foo := Some (Smaws_Lib.Xml.Parse.Read.element_value i "Foo" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ foo = ( ! ) r_foo } : complex_nested_error_data)

let complex_error_of_xml i =
  let r_nested = ref None in
  let r_top_level = ref None in
  let r_header = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Nested"; "TopLevel"; "Header" ] (fun tag _ ->
      match tag with
      | "Nested" ->
          r_nested :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Nested"
                 (fun i _ -> complex_nested_error_data_of_xml i)
                 ())
      | "TopLevel" ->
          r_top_level := Some (Smaws_Lib.Xml.Parse.Read.element_value i "TopLevel" Fun.id ())
      | "Header" -> r_header := Some (Smaws_Lib.Xml.Parse.Read.element_value i "Header" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ nested = ( ! ) r_nested; top_level = ( ! ) r_top_level; header = ( ! ) r_header }
    : complex_error)

let greeting_with_errors_output_of_xml i =
  let r_greeting = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "greeting" ] (fun tag _ ->
      match tag with
      | "greeting" ->
          r_greeting := Some (Smaws_Lib.Xml.Parse.Read.element_value i "greeting" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ greeting = ( ! ) r_greeting } : greeting_with_errors_output)

let fractional_seconds_output_of_xml i =
  let r_datetime = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "datetime" ] (fun tag _ ->
      match tag with
      | "datetime" ->
          r_datetime :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "datetime"
                 (fun i _ -> Shared.Xml_deserializers.date_time_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ datetime = ( ! ) r_datetime } : fractional_seconds_output)

let flattened_xml_map_with_xml_namespace_output_map_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
      let k = Smaws_Lib.Xml.Parse.Read.element_value i "K" Fun.id () in
      let v = Smaws_Lib.Xml.Parse.Read.element_value i "V" Fun.id () in
      (k, v))
    ()

let flattened_xml_map_with_xml_namespace_output_of_xml i =
  let r_my_map = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "KVP" ] (fun tag _ ->
      match tag with
      | "KVP" ->
          r_my_map :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequences i "KVP"
                 (fun i _ ->
                   let k = Smaws_Lib.Xml.Parse.Read.element_value i "K" Fun.id () in
                   let v = Smaws_Lib.Xml.Parse.Read.element_value i "V" Fun.id () in
                   (k, v))
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ my_map = ( ! ) r_my_map } : flattened_xml_map_with_xml_namespace_output)

let flattened_xml_map_with_xml_name_input_output_map_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
      let k = Smaws_Lib.Xml.Parse.Read.element_value i "K" Fun.id () in
      let v = Smaws_Lib.Xml.Parse.Read.element_value i "V" Fun.id () in
      (k, v))
    ()

let flattened_xml_map_with_xml_name_response_of_xml i =
  let r_my_map = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "KVP" ] (fun tag _ ->
      match tag with
      | "KVP" ->
          r_my_map :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequences i "KVP"
                 (fun i _ ->
                   let k = Smaws_Lib.Xml.Parse.Read.element_value i "K" Fun.id () in
                   let v = Smaws_Lib.Xml.Parse.Read.element_value i "V" Fun.id () in
                   (k, v))
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ my_map = ( ! ) r_my_map } : flattened_xml_map_with_xml_name_response)

let flattened_xml_map_with_xml_name_request_of_xml i =
  let r_my_map = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "KVP" ] (fun tag _ ->
      match tag with
      | "KVP" ->
          r_my_map :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequences i "KVP"
                 (fun i _ ->
                   let k = Smaws_Lib.Xml.Parse.Read.element_value i "K" Fun.id () in
                   let v = Smaws_Lib.Xml.Parse.Read.element_value i "V" Fun.id () in
                   (k, v))
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ my_map = ( ! ) r_my_map } : flattened_xml_map_with_xml_name_request)

let flattened_xml_map_response_of_xml i =
  let r_my_map = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "myMap" ] (fun tag _ ->
      match tag with
      | "myMap" ->
          r_my_map :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequences i "myMap"
                 (fun i _ ->
                   let k = Smaws_Lib.Xml.Parse.Read.element_value i "key" Fun.id () in
                   let v =
                     Smaws_Lib.Xml.Parse.Read.sequence i "value"
                       (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                       ()
                   in
                   (k, v))
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ my_map = ( ! ) r_my_map } : flattened_xml_map_response)

let flattened_xml_map_request_of_xml i =
  let r_my_map = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "myMap" ] (fun tag _ ->
      match tag with
      | "myMap" ->
          r_my_map :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequences i "myMap"
                 (fun i _ ->
                   let k = Smaws_Lib.Xml.Parse.Read.element_value i "key" Fun.id () in
                   let v =
                     Smaws_Lib.Xml.Parse.Read.sequence i "value"
                       (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                       ()
                   in
                   (k, v))
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ my_map = ( ! ) r_my_map } : flattened_xml_map_request)

let endpoint_with_host_label_operation_request_of_xml i =
  let r_label = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "label" ] (fun tag _ ->
      match tag with
      | "label" -> r_label := Some (Smaws_Lib.Xml.Parse.Read.element_value i "label" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ label = Smaws_Lib.Xml.Parse.required "label" (( ! ) r_label) i }
    : endpoint_with_host_label_operation_request)

let host_label_header_input_of_xml i =
  let r_account_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "accountId" ] (fun tag _ ->
      match tag with
      | "accountId" ->
          r_account_id := Some (Smaws_Lib.Xml.Parse.Read.element_value i "accountId" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ account_id = Smaws_Lib.Xml.Parse.required "accountId" (( ! ) r_account_id) i }
    : host_label_header_input)

let empty_input_and_empty_output_output_of_xml i = ()
let empty_input_and_empty_output_input_of_xml i = ()

let datetime_offsets_output_of_xml i =
  let r_datetime = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "datetime" ] (fun tag _ ->
      match tag with
      | "datetime" ->
          r_datetime :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "datetime"
                 (fun i _ -> Shared.Xml_deserializers.date_time_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ datetime = ( ! ) r_datetime } : datetime_offsets_output)

let content_type_parameters_output_of_xml i = ()

let content_type_parameters_input_of_xml i =
  let r_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "value" ] (fun tag _ ->
      match tag with
      | "value" ->
          r_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "value"
                 Smaws_Lib.Xml.Parse.Primitive.int_of_string ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ value = ( ! ) r_value } : content_type_parameters_input)

let constant_query_string_input_of_xml i =
  let r_hello = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "hello" ] (fun tag _ ->
      match tag with
      | "hello" -> r_hello := Some (Smaws_Lib.Xml.Parse.Read.element_value i "hello" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ hello = Smaws_Lib.Xml.Parse.required "hello" (( ! ) r_hello) i } : constant_query_string_input)

let constant_and_variable_query_string_input_of_xml i =
  let r_maybe_set = ref None in
  let r_baz = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "maybeSet"; "baz" ] (fun tag _ ->
      match tag with
      | "maybeSet" ->
          r_maybe_set := Some (Smaws_Lib.Xml.Parse.Read.element_value i "maybeSet" Fun.id ())
      | "baz" -> r_baz := Some (Smaws_Lib.Xml.Parse.Read.element_value i "baz" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ maybe_set = ( ! ) r_maybe_set; baz = ( ! ) r_baz } : constant_and_variable_query_string_input)

let body_with_xml_name_input_output_of_xml i =
  let r_nested = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "nested" ] (fun tag _ ->
      match tag with
      | "nested" ->
          r_nested :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "nested"
                 (fun i _ -> payload_with_xml_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ nested = ( ! ) r_nested } : body_with_xml_name_input_output)

let all_query_string_types_input_of_xml i =
  let r_query_params_map_of_strings = ref None in
  let r_query_integer_enum_list = ref None in
  let r_query_integer_enum = ref None in
  let r_query_enum_list = ref None in
  let r_query_enum = ref None in
  let r_query_timestamp_list = ref None in
  let r_query_timestamp = ref None in
  let r_query_boolean_list = ref None in
  let r_query_boolean = ref None in
  let r_query_double_list = ref None in
  let r_query_double = ref None in
  let r_query_float = ref None in
  let r_query_long = ref None in
  let r_query_integer_set = ref None in
  let r_query_integer_list = ref None in
  let r_query_integer = ref None in
  let r_query_short = ref None in
  let r_query_byte = ref None in
  let r_query_string_set = ref None in
  let r_query_string_list = ref None in
  let r_query_string = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "queryParamsMapOfStrings";
      "queryIntegerEnumList";
      "queryIntegerEnum";
      "queryEnumList";
      "queryEnum";
      "queryTimestampList";
      "queryTimestamp";
      "queryBooleanList";
      "queryBoolean";
      "queryDoubleList";
      "queryDouble";
      "queryFloat";
      "queryLong";
      "queryIntegerSet";
      "queryIntegerList";
      "queryInteger";
      "queryShort";
      "queryByte";
      "queryStringSet";
      "queryStringList";
      "queryString";
    ] (fun tag _ ->
      match tag with
      | "queryParamsMapOfStrings" ->
          r_query_params_map_of_strings :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "queryParamsMapOfStrings"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k = Smaws_Lib.Xml.Parse.Read.element_value i "key" Fun.id () in
                       let v = Smaws_Lib.Xml.Parse.Read.element_value i "value" Fun.id () in
                       (k, v))
                     ())
                 ())
      | "queryIntegerEnumList" ->
          r_query_integer_enum_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "queryIntegerEnumList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                     ())
                 ())
      | "queryIntegerEnum" ->
          r_query_integer_enum :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "queryIntegerEnum"
                 (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                 ())
      | "queryEnumList" ->
          r_query_enum_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "queryEnumList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                     ())
                 ())
      | "queryEnum" ->
          r_query_enum :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "queryEnum"
                 (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                 ())
      | "queryTimestampList" ->
          r_query_timestamp_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "queryTimestampList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.elements_value i "member"
                     Smaws_Lib.Xml.Parse.Primitive.timestamp_iso_of_string ())
                 ())
      | "queryTimestamp" ->
          r_query_timestamp :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "queryTimestamp"
                 Smaws_Lib.Xml.Parse.Primitive.timestamp_iso_of_string ())
      | "queryBooleanList" ->
          r_query_boolean_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "queryBooleanList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.elements_value i "member"
                     Smaws_Lib.Xml.Parse.Primitive.bool_of_string ())
                 ())
      | "queryBoolean" ->
          r_query_boolean :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "queryBoolean"
                 Smaws_Lib.Xml.Parse.Primitive.bool_of_string ())
      | "queryDoubleList" ->
          r_query_double_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "queryDoubleList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.elements_value i "member"
                     Smaws_Lib.Xml.Parse.Primitive.double_of_string ())
                 ())
      | "queryDouble" ->
          r_query_double :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "queryDouble"
                 Smaws_Lib.Xml.Parse.Primitive.double_of_string ())
      | "queryFloat" ->
          r_query_float :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "queryFloat"
                 Smaws_Lib.Xml.Parse.Primitive.float_of_string ())
      | "queryLong" ->
          r_query_long :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "queryLong"
                 Smaws_Lib.Xml.Parse.Primitive.long_of_string ())
      | "queryIntegerSet" ->
          r_query_integer_set :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "queryIntegerSet"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.elements_value i "member"
                     Smaws_Lib.Xml.Parse.Primitive.int_of_string ())
                 ())
      | "queryIntegerList" ->
          r_query_integer_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "queryIntegerList"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.elements_value i "member"
                     Smaws_Lib.Xml.Parse.Primitive.int_of_string ())
                 ())
      | "queryInteger" ->
          r_query_integer :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "queryInteger"
                 Smaws_Lib.Xml.Parse.Primitive.int_of_string ())
      | "queryShort" ->
          r_query_short :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "queryShort"
                 Smaws_Lib.Xml.Parse.Primitive.int_of_string ())
      | "queryByte" ->
          r_query_byte :=
            Some
              (Smaws_Lib.Xml.Parse.Read.element_value i "queryByte"
                 Smaws_Lib.Xml.Parse.Primitive.int_of_string ())
      | "queryStringSet" ->
          r_query_string_set :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "queryStringSet"
                 (fun i _ -> Smaws_Lib.Xml.Parse.Read.elements_value i "member" Fun.id ())
                 ())
      | "queryStringList" ->
          r_query_string_list :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "queryStringList"
                 (fun i _ -> Smaws_Lib.Xml.Parse.Read.elements_value i "member" Fun.id ())
                 ())
      | "queryString" ->
          r_query_string := Some (Smaws_Lib.Xml.Parse.Read.element_value i "queryString" Fun.id ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     query_params_map_of_strings = ( ! ) r_query_params_map_of_strings;
     query_integer_enum_list = ( ! ) r_query_integer_enum_list;
     query_integer_enum = ( ! ) r_query_integer_enum;
     query_enum_list = ( ! ) r_query_enum_list;
     query_enum = ( ! ) r_query_enum;
     query_timestamp_list = ( ! ) r_query_timestamp_list;
     query_timestamp = ( ! ) r_query_timestamp;
     query_boolean_list = ( ! ) r_query_boolean_list;
     query_boolean = ( ! ) r_query_boolean;
     query_double_list = ( ! ) r_query_double_list;
     query_double = ( ! ) r_query_double;
     query_float = ( ! ) r_query_float;
     query_long = ( ! ) r_query_long;
     query_integer_set = ( ! ) r_query_integer_set;
     query_integer_list = ( ! ) r_query_integer_list;
     query_integer = ( ! ) r_query_integer;
     query_short = ( ! ) r_query_short;
     query_byte = ( ! ) r_query_byte;
     query_string_set = ( ! ) r_query_string_set;
     query_string_list = ( ! ) r_query_string_list;
     query_string = ( ! ) r_query_string;
   }
    : all_query_string_types_input)

let nested_map_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
      let k = Smaws_Lib.Xml.Parse.Read.element_value i "key" Fun.id () in
      let v =
        Smaws_Lib.Xml.Parse.Read.sequence i "value"
          (fun i _ -> Shared.Xml_deserializers.foo_enum_map_of_xml i)
          ()
      in
      (k, v))
    ()

let nested_xml_maps_input_output_of_xml i =
  let r_flat_nested_map = ref None in
  let r_nested_map = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "flatNestedMap"; "nestedMap" ] (fun tag _ ->
      match tag with
      | "flatNestedMap" ->
          r_flat_nested_map :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequences i "flatNestedMap"
                 (fun i _ ->
                   let k = Smaws_Lib.Xml.Parse.Read.element_value i "key" Fun.id () in
                   let v =
                     Smaws_Lib.Xml.Parse.Read.sequence i "value"
                       (fun i _ -> Shared.Xml_deserializers.foo_enum_map_of_xml i)
                       ()
                   in
                   (k, v))
                 ())
      | "nestedMap" ->
          r_nested_map :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "nestedMap"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k = Smaws_Lib.Xml.Parse.Read.element_value i "key" Fun.id () in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> Shared.Xml_deserializers.foo_enum_map_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ flat_nested_map = ( ! ) r_flat_nested_map; nested_map = ( ! ) r_nested_map }
    : nested_xml_maps_input_output)

let nested_xml_map_with_xml_name_inner_map_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
      let k = Smaws_Lib.Xml.Parse.Read.element_value i "InnerKey" Fun.id () in
      let v = Smaws_Lib.Xml.Parse.Read.element_value i "InnerValue" Fun.id () in
      (k, v))
    ()

let nested_xml_map_with_xml_name_map_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
      let k = Smaws_Lib.Xml.Parse.Read.element_value i "OuterKey" Fun.id () in
      let v =
        Smaws_Lib.Xml.Parse.Read.sequence i "value"
          (fun i _ -> nested_xml_map_with_xml_name_inner_map_of_xml i)
          ()
      in
      (k, v))
    ()

let nested_xml_map_with_xml_name_input_output_of_xml i =
  let r_nested_xml_map_with_xml_name_map = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "nestedXmlMapWithXmlNameMap" ] (fun tag _ ->
      match tag with
      | "nestedXmlMapWithXmlNameMap" ->
          r_nested_xml_map_with_xml_name_map :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "nestedXmlMapWithXmlNameMap"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                     (fun i _ ->
                       let k = Smaws_Lib.Xml.Parse.Read.element_value i "OuterKey" Fun.id () in
                       let v =
                         Smaws_Lib.Xml.Parse.Read.sequence i "value"
                           (fun i _ -> nested_xml_map_with_xml_name_inner_map_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ nested_xml_map_with_xml_name_map = ( ! ) r_nested_xml_map_with_xml_name_map }
    : nested_xml_map_with_xml_name_input_output)
