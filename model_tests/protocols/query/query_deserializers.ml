open Types
let unit_of_xml _ = ()
let xml_timestamps_output_of_xml i =
  let r_http_date_on_target = ref None in
  let r_http_date = ref None in
  let r_epoch_seconds_on_target = ref None in
  let r_epoch_seconds = ref None in
  let r_date_time_on_target = ref None in
  let r_date_time = ref None in
  let r_normal = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    ["httpDateOnTarget";
    "httpDate";
    "epochSecondsOnTarget";
    "epochSeconds";
    "dateTimeOnTarget";
    "dateTime";
    "normal"]
    (fun tag _ ->
       match tag with
       | "httpDateOnTarget" ->
           r_http_date_on_target :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "httpDateOnTarget"
                   (fun i _ -> Shared.Query_deserializers.http_date_of_xml i)
                   ()))
       | "httpDate" ->
           r_http_date :=
             (Some
                (let (ts, _, _) =
                   Result.get_ok
                     (Ptime.of_rfc3339
                        (Smaws_Lib.Xml.Parse.Read.element i "httpDate" ())) in
                 ts))
       | "epochSecondsOnTarget" ->
           r_epoch_seconds_on_target :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "epochSecondsOnTarget"
                   (fun i _ ->
                      Shared.Query_deserializers.epoch_seconds_of_xml i) ()))
       | "epochSeconds" ->
           r_epoch_seconds :=
             (Some
                (let (ts, _, _) =
                   Result.get_ok
                     (Ptime.of_rfc3339
                        (Smaws_Lib.Xml.Parse.Read.element i "epochSeconds" ())) in
                 ts))
       | "dateTimeOnTarget" ->
           r_date_time_on_target :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "dateTimeOnTarget"
                   (fun i _ -> Shared.Query_deserializers.date_time_of_xml i)
                   ()))
       | "dateTime" ->
           r_date_time :=
             (Some
                (let (ts, _, _) =
                   Result.get_ok
                     (Ptime.of_rfc3339
                        (Smaws_Lib.Xml.Parse.Read.element i "dateTime" ())) in
                 ts))
       | "normal" ->
           r_normal :=
             (Some
                (let (ts, _, _) =
                   Result.get_ok
                     (Ptime.of_rfc3339
                        (Smaws_Lib.Xml.Parse.Read.element i "normal" ())) in
                 ts))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     http_date_on_target = (( ! ) r_http_date_on_target);
     http_date = (( ! ) r_http_date);
     epoch_seconds_on_target = (( ! ) r_epoch_seconds_on_target);
     epoch_seconds = (( ! ) r_epoch_seconds);
     date_time_on_target = (( ! ) r_date_time_on_target);
     date_time = (( ! ) r_date_time);
     normal = (( ! ) r_normal)
   } : xml_timestamps_output)
let xml_namespaced_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.elements i "member" ()
let xml_namespace_nested_of_xml i =
  let r_values = ref None in
  let r_foo = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["values"; "foo"]
    (fun tag _ ->
       match tag with
       | "values" ->
           r_values :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "values"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.elements i "member" ()) ()))
       | "foo" ->
           r_foo := (Some (Smaws_Lib.Xml.Parse.Read.element i "foo" ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ values = (( ! ) r_values); foo = (( ! ) r_foo) } : xml_namespace_nested)
let xml_namespaces_output_of_xml i =
  let r_nested = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["nested"]
    (fun tag _ ->
       match tag with
       | "nested" ->
           r_nested :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "nested"
                   (fun i _ -> xml_namespace_nested_of_xml i) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ nested = (( ! ) r_nested) } : xml_namespaces_output)
let xml_maps_xml_name_output_map_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
       ((Smaws_Lib.Xml.Parse.Read.element i "Attribute" ()),
         (Shared.Query_deserializers.greeting_struct_of_xml i))) ()
let xml_maps_xml_name_output_of_xml i =
  let r_my_map = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["myMap"]
    (fun tag _ ->
       match tag with
       | "myMap" ->
           r_my_map :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "myMap"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                        (fun i _ ->
                           ((Smaws_Lib.Xml.Parse.Read.element i "Attribute"
                               ()),
                             (Shared.Query_deserializers.greeting_struct_of_xml
                                i))) ()) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ my_map = (( ! ) r_my_map) } : xml_maps_xml_name_output)
let xml_maps_output_map_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
       ((Smaws_Lib.Xml.Parse.Read.element i "key" ()),
         (Shared.Query_deserializers.greeting_struct_of_xml i))) ()
let xml_maps_output_of_xml i =
  let r_my_map = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["myMap"]
    (fun tag _ ->
       match tag with
       | "myMap" ->
           r_my_map :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "myMap"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                        (fun i _ ->
                           ((Smaws_Lib.Xml.Parse.Read.element i "key" ()),
                             (Shared.Query_deserializers.greeting_struct_of_xml
                                i))) ()) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ my_map = (( ! ) r_my_map) } : xml_maps_output)
let renamed_list_members_of_xml i =
  Smaws_Lib.Xml.Parse.Read.elements i "item" ()
let list_with_member_namespace_of_xml i =
  Smaws_Lib.Xml.Parse.Read.elements i "member" ()
let list_with_namespace_of_xml i =
  Smaws_Lib.Xml.Parse.Read.elements i "member" ()
let structure_list_member_of_xml i =
  let r_b = ref None in
  let r_a = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["other"; "value"]
    (fun tag _ ->
       match tag with
       | "other" ->
           r_b := (Some (Smaws_Lib.Xml.Parse.Read.element i "other" ()))
       | "value" ->
           r_a := (Some (Smaws_Lib.Xml.Parse.Read.element i "value" ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ b = (( ! ) r_b); a = (( ! ) r_a) } : structure_list_member)
let structure_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "item"
    (fun i _ -> structure_list_member_of_xml i) ()
let xml_lists_output_of_xml i =
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
    ["myStructureList";
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
    "stringList"]
    (fun tag _ ->
       match tag with
       | "myStructureList" ->
           r_structure_list :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "myStructureList"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.sequences i "item"
                        (fun i _ -> structure_list_member_of_xml i) ()) ()))
       | "flattenedListWithNamespace" ->
           r_flattened_list_with_namespace :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i
                   "flattenedListWithNamespace"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.elements i "member" ()) ()))
       | "flattenedListWithMemberNamespace" ->
           r_flattened_list_with_member_namespace :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i
                   "flattenedListWithMemberNamespace"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.elements i "member" ()) ()))
       | "customName" ->
           r_flattened_list2 :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "customName"
                   (fun i _ -> Smaws_Lib.Xml.Parse.Read.elements i "item" ())
                   ()))
       | "flattenedList" ->
           r_flattened_list :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "flattenedList"
                   (fun i _ -> Smaws_Lib.Xml.Parse.Read.elements i "item" ())
                   ()))
       | "renamed" ->
           r_renamed_list_members :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "renamed"
                   (fun i _ -> Smaws_Lib.Xml.Parse.Read.elements i "item" ())
                   ()))
       | "nestedStringList" ->
           r_nested_string_list :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "nestedStringList"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.sequences i "member"
                        (fun i _ ->
                           Shared.Query_deserializers.string_list_of_xml i)
                        ()) ()))
       | "intEnumList" ->
           r_int_enum_list :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "intEnumList"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.sequences i "member"
                        (fun i _ ->
                           Shared.Query_deserializers.integer_enum_of_xml i)
                        ()) ()))
       | "enumList" ->
           r_enum_list :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "enumList"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.sequences i "member"
                        (fun i _ ->
                           Shared.Query_deserializers.foo_enum_of_xml i) ())
                   ()))
       | "timestampList" ->
           r_timestamp_list :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "timestampList"
                   (fun i _ ->
                      List.map
                        (fun s ->
                           let (ts, _, _) =
                             Result.get_ok (Ptime.of_rfc3339 s) in
                           ts)
                        (Smaws_Lib.Xml.Parse.Read.elements i "member" ())) ()))
       | "booleanList" ->
           r_boolean_list :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "booleanList"
                   (fun i _ ->
                      List.map (fun s -> bool_of_string s)
                        (Smaws_Lib.Xml.Parse.Read.elements i "member" ())) ()))
       | "integerList" ->
           r_integer_list :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "integerList"
                   (fun i _ ->
                      List.map (fun s -> int_of_string s)
                        (Smaws_Lib.Xml.Parse.Read.elements i "member" ())) ()))
       | "stringSet" ->
           r_string_set :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "stringSet"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.elements i "member" ()) ()))
       | "stringList" ->
           r_string_list :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "stringList"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.elements i "member" ()) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     structure_list = (( ! ) r_structure_list);
     flattened_list_with_namespace = (( ! ) r_flattened_list_with_namespace);
     flattened_list_with_member_namespace =
       (( ! ) r_flattened_list_with_member_namespace);
     flattened_list2 = (( ! ) r_flattened_list2);
     flattened_list = (( ! ) r_flattened_list);
     renamed_list_members = (( ! ) r_renamed_list_members);
     nested_string_list = (( ! ) r_nested_string_list);
     int_enum_list = (( ! ) r_int_enum_list);
     enum_list = (( ! ) r_enum_list);
     timestamp_list = (( ! ) r_timestamp_list);
     boolean_list = (( ! ) r_boolean_list);
     integer_list = (( ! ) r_integer_list);
     string_set = (( ! ) r_string_set);
     string_list = (( ! ) r_string_list)
   } : xml_lists_output)
let xml_int_enums_output_of_xml i =
  let r_int_enum_map = ref None in
  let r_int_enum_set = ref None in
  let r_int_enum_list = ref None in
  let r_int_enum3 = ref None in
  let r_int_enum2 = ref None in
  let r_int_enum1 = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    ["intEnumMap";
    "intEnumSet";
    "intEnumList";
    "intEnum3";
    "intEnum2";
    "intEnum1"]
    (fun tag _ ->
       match tag with
       | "intEnumMap" ->
           r_int_enum_map :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "intEnumMap"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                        (fun i _ ->
                           ((Smaws_Lib.Xml.Parse.Read.element i "key" ()),
                             (Shared.Query_deserializers.integer_enum_of_xml
                                i))) ()) ()))
       | "intEnumSet" ->
           r_int_enum_set :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "intEnumSet"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.sequences i "member"
                        (fun i _ ->
                           Shared.Query_deserializers.integer_enum_of_xml i)
                        ()) ()))
       | "intEnumList" ->
           r_int_enum_list :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "intEnumList"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.sequences i "member"
                        (fun i _ ->
                           Shared.Query_deserializers.integer_enum_of_xml i)
                        ()) ()))
       | "intEnum3" ->
           r_int_enum3 :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "intEnum3"
                   (fun i _ ->
                      Shared.Query_deserializers.integer_enum_of_xml i) ()))
       | "intEnum2" ->
           r_int_enum2 :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "intEnum2"
                   (fun i _ ->
                      Shared.Query_deserializers.integer_enum_of_xml i) ()))
       | "intEnum1" ->
           r_int_enum1 :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "intEnum1"
                   (fun i _ ->
                      Shared.Query_deserializers.integer_enum_of_xml i) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     int_enum_map = (( ! ) r_int_enum_map);
     int_enum_set = (( ! ) r_int_enum_set);
     int_enum_list = (( ! ) r_int_enum_list);
     int_enum3 = (( ! ) r_int_enum3);
     int_enum2 = (( ! ) r_int_enum2);
     int_enum1 = (( ! ) r_int_enum1)
   } : xml_int_enums_output)
let xml_enums_output_of_xml i =
  let r_foo_enum_map = ref None in
  let r_foo_enum_set = ref None in
  let r_foo_enum_list = ref None in
  let r_foo_enum3 = ref None in
  let r_foo_enum2 = ref None in
  let r_foo_enum1 = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    ["fooEnumMap";
    "fooEnumSet";
    "fooEnumList";
    "fooEnum3";
    "fooEnum2";
    "fooEnum1"]
    (fun tag _ ->
       match tag with
       | "fooEnumMap" ->
           r_foo_enum_map :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "fooEnumMap"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                        (fun i _ ->
                           ((Smaws_Lib.Xml.Parse.Read.element i "key" ()),
                             (Shared.Query_deserializers.foo_enum_of_xml i)))
                        ()) ()))
       | "fooEnumSet" ->
           r_foo_enum_set :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "fooEnumSet"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.sequences i "member"
                        (fun i _ ->
                           Shared.Query_deserializers.foo_enum_of_xml i) ())
                   ()))
       | "fooEnumList" ->
           r_foo_enum_list :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "fooEnumList"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.sequences i "member"
                        (fun i _ ->
                           Shared.Query_deserializers.foo_enum_of_xml i) ())
                   ()))
       | "fooEnum3" ->
           r_foo_enum3 :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "fooEnum3"
                   (fun i _ -> Shared.Query_deserializers.foo_enum_of_xml i)
                   ()))
       | "fooEnum2" ->
           r_foo_enum2 :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "fooEnum2"
                   (fun i _ -> Shared.Query_deserializers.foo_enum_of_xml i)
                   ()))
       | "fooEnum1" ->
           r_foo_enum1 :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "fooEnum1"
                   (fun i _ -> Shared.Query_deserializers.foo_enum_of_xml i)
                   ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     foo_enum_map = (( ! ) r_foo_enum_map);
     foo_enum_set = (( ! ) r_foo_enum_set);
     foo_enum_list = (( ! ) r_foo_enum_list);
     foo_enum3 = (( ! ) r_foo_enum3);
     foo_enum2 = (( ! ) r_foo_enum2);
     foo_enum1 = (( ! ) r_foo_enum1)
   } : xml_enums_output)
let xml_blobs_output_of_xml i =
  let r_data = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["data"]
    (fun tag _ ->
       match tag with
       | "data" ->
           r_data :=
             (Some
                (Bytes.of_string
                   (Base64.decode_exn
                      (Smaws_Lib.Xml.Parse.Read.element i "data" ()))))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ data = (( ! ) r_data) } : xml_blobs_output)
let rec struct_arg_of_xml i =
  let r_recursive_arg = ref None in
  let r_other_arg = ref None in
  let r_string_arg = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    ["RecursiveArg"; "OtherArg"; "StringArg"]
    (fun tag _ ->
       match tag with
       | "RecursiveArg" ->
           r_recursive_arg :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "RecursiveArg"
                   (fun i _ -> struct_arg_of_xml i) ()))
       | "OtherArg" ->
           r_other_arg :=
             (Some
                (bool_of_string
                   (Smaws_Lib.Xml.Parse.Read.element i "OtherArg" ())))
       | "StringArg" ->
           r_string_arg :=
             (Some (Smaws_Lib.Xml.Parse.Read.element i "StringArg" ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     recursive_arg = (( ! ) r_recursive_arg);
     other_arg = (( ! ) r_other_arg);
     string_arg = (( ! ) r_string_arg)
   } : struct_arg)
let simple_scalar_xml_properties_output_of_xml i =
  let r_double_value = ref None in
  let r_float_value = ref None in
  let r_long_value = ref None in
  let r_integer_value = ref None in
  let r_short_value = ref None in
  let r_byte_value = ref None in
  let r_false_boolean_value = ref None in
  let r_true_boolean_value = ref None in
  let r_empty_string_value = ref None in
  let r_string_value = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    ["DoubleDribble";
    "floatValue";
    "longValue";
    "integerValue";
    "shortValue";
    "byteValue";
    "falseBooleanValue";
    "trueBooleanValue";
    "emptyStringValue";
    "stringValue"]
    (fun tag _ ->
       match tag with
       | "DoubleDribble" ->
           r_double_value :=
             (Some
                (float_of_string
                   (Smaws_Lib.Xml.Parse.Read.element i "DoubleDribble" ())))
       | "floatValue" ->
           r_float_value :=
             (Some
                (float_of_string
                   (Smaws_Lib.Xml.Parse.Read.element i "floatValue" ())))
       | "longValue" ->
           r_long_value :=
             (Some
                (int_of_string
                   (Smaws_Lib.Xml.Parse.Read.element i "longValue" ())))
       | "integerValue" ->
           r_integer_value :=
             (Some
                (int_of_string
                   (Smaws_Lib.Xml.Parse.Read.element i "integerValue" ())))
       | "shortValue" ->
           r_short_value :=
             (Some
                (int_of_string
                   (Smaws_Lib.Xml.Parse.Read.element i "shortValue" ())))
       | "byteValue" ->
           r_byte_value :=
             (Some
                (int_of_string
                   (Smaws_Lib.Xml.Parse.Read.element i "byteValue" ())))
       | "falseBooleanValue" ->
           r_false_boolean_value :=
             (Some
                (bool_of_string
                   (Smaws_Lib.Xml.Parse.Read.element i "falseBooleanValue" ())))
       | "trueBooleanValue" ->
           r_true_boolean_value :=
             (Some
                (bool_of_string
                   (Smaws_Lib.Xml.Parse.Read.element i "trueBooleanValue" ())))
       | "emptyStringValue" ->
           r_empty_string_value :=
             (Some (Smaws_Lib.Xml.Parse.Read.element i "emptyStringValue" ()))
       | "stringValue" ->
           r_string_value :=
             (Some (Smaws_Lib.Xml.Parse.Read.element i "stringValue" ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     double_value = (( ! ) r_double_value);
     float_value = (( ! ) r_float_value);
     long_value = (( ! ) r_long_value);
     integer_value = (( ! ) r_integer_value);
     short_value = (( ! ) r_short_value);
     byte_value = (( ! ) r_byte_value);
     false_boolean_value = (( ! ) r_false_boolean_value);
     true_boolean_value = (( ! ) r_true_boolean_value);
     empty_string_value = (( ! ) r_empty_string_value);
     string_value = (( ! ) r_string_value)
   } : simple_scalar_xml_properties_output)
let simple_input_params_input_of_xml i =
  let r_integer_enum = ref None in
  let r_foo_enum = ref None in
  let r_qux = ref None in
  let r_boo = ref None in
  let r_float_value = ref None in
  let r_bam = ref None in
  let r_baz = ref None in
  let r_bar = ref None in
  let r_foo = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    ["IntegerEnum";
    "FooEnum";
    "Qux";
    "Boo";
    "FloatValue";
    "Bam";
    "Baz";
    "Bar";
    "Foo"]
    (fun tag _ ->
       match tag with
       | "IntegerEnum" ->
           r_integer_enum :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "IntegerEnum"
                   (fun i _ ->
                      Shared.Query_deserializers.integer_enum_of_xml i) ()))
       | "FooEnum" ->
           r_foo_enum :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "FooEnum"
                   (fun i _ -> Shared.Query_deserializers.foo_enum_of_xml i)
                   ()))
       | "Qux" ->
           r_qux :=
             (Some
                (Bytes.of_string
                   (Base64.decode_exn
                      (Smaws_Lib.Xml.Parse.Read.element i "Qux" ()))))
       | "Boo" ->
           r_boo :=
             (Some
                (float_of_string
                   (Smaws_Lib.Xml.Parse.Read.element i "Boo" ())))
       | "FloatValue" ->
           r_float_value :=
             (Some
                (float_of_string
                   (Smaws_Lib.Xml.Parse.Read.element i "FloatValue" ())))
       | "Bam" ->
           r_bam :=
             (Some
                (int_of_string (Smaws_Lib.Xml.Parse.Read.element i "Bam" ())))
       | "Baz" ->
           r_baz :=
             (Some
                (bool_of_string (Smaws_Lib.Xml.Parse.Read.element i "Baz" ())))
       | "Bar" ->
           r_bar := (Some (Smaws_Lib.Xml.Parse.Read.element i "Bar" ()))
       | "Foo" ->
           r_foo := (Some (Smaws_Lib.Xml.Parse.Read.element i "Foo" ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     integer_enum = (( ! ) r_integer_enum);
     foo_enum = (( ! ) r_foo_enum);
     qux = (( ! ) r_qux);
     boo = (( ! ) r_boo);
     float_value = (( ! ) r_float_value);
     bam = (( ! ) r_bam);
     baz = (( ! ) r_baz);
     bar = (( ! ) r_bar);
     foo = (( ! ) r_foo)
   } : simple_input_params_input)
let rec recursive_xml_shapes_output_nested1_of_xml i =
  let r_nested = ref None in
  let r_foo = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["nested"; "foo"]
    (fun tag _ ->
       match tag with
       | "nested" ->
           r_nested :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "nested"
                   (fun i _ -> recursive_xml_shapes_output_nested2_of_xml i)
                   ()))
       | "foo" ->
           r_foo := (Some (Smaws_Lib.Xml.Parse.Read.element i "foo" ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ nested = (( ! ) r_nested); foo = (( ! ) r_foo) } : recursive_xml_shapes_output_nested1)
and recursive_xml_shapes_output_nested2_of_xml i =
  let r_recursive_member = ref None in
  let r_bar = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["recursiveMember"; "bar"]
    (fun tag _ ->
       match tag with
       | "recursiveMember" ->
           r_recursive_member :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "recursiveMember"
                   (fun i _ -> recursive_xml_shapes_output_nested1_of_xml i)
                   ()))
       | "bar" ->
           r_bar := (Some (Smaws_Lib.Xml.Parse.Read.element i "bar" ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ recursive_member = (( ! ) r_recursive_member); bar = (( ! ) r_bar) } : 
  recursive_xml_shapes_output_nested2)
let recursive_xml_shapes_output_of_xml i =
  let r_nested = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["nested"]
    (fun tag _ ->
       match tag with
       | "nested" ->
           r_nested :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "nested"
                   (fun i _ -> recursive_xml_shapes_output_nested1_of_xml i)
                   ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ nested = (( ! ) r_nested) } : recursive_xml_shapes_output)
let query_timestamps_input_of_xml i =
  let r_epoch_target = ref None in
  let r_epoch_member = ref None in
  let r_normal_format = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    ["epochTarget"; "epochMember"; "normalFormat"]
    (fun tag _ ->
       match tag with
       | "epochTarget" ->
           r_epoch_target :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "epochTarget"
                   (fun i _ ->
                      Shared.Query_deserializers.epoch_seconds_of_xml i) ()))
       | "epochMember" ->
           r_epoch_member :=
             (Some
                (let (ts, _, _) =
                   Result.get_ok
                     (Ptime.of_rfc3339
                        (Smaws_Lib.Xml.Parse.Read.element i "epochMember" ())) in
                 ts))
       | "normalFormat" ->
           r_normal_format :=
             (Some
                (let (ts, _, _) =
                   Result.get_ok
                     (Ptime.of_rfc3339
                        (Smaws_Lib.Xml.Parse.Read.element i "normalFormat" ())) in
                 ts))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     epoch_target = (( ! ) r_epoch_target);
     epoch_member = (( ! ) r_epoch_member);
     normal_format = (( ! ) r_normal_format)
   } : query_timestamps_input)
let complex_map_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
       ((Smaws_Lib.Xml.Parse.Read.element i "key" ()),
         (Shared.Query_deserializers.greeting_struct_of_xml i))) ()
let map_with_xml_name_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
       ((Smaws_Lib.Xml.Parse.Read.element i "K" ()),
         (Smaws_Lib.Xml.Parse.Read.element i "V" ()))) ()
let map_of_lists_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
       ((Smaws_Lib.Xml.Parse.Read.element i "key" ()),
         (Shared.Query_deserializers.string_list_of_xml i))) ()
let nested_struct_with_map_of_xml i =
  let r_map_arg = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["MapArg"]
    (fun tag _ ->
       match tag with
       | "MapArg" ->
           r_map_arg :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "MapArg"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                        (fun i _ ->
                           ((Smaws_Lib.Xml.Parse.Read.element i "key" ()),
                             (Smaws_Lib.Xml.Parse.Read.element i "value" ())))
                        ()) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ map_arg = (( ! ) r_map_arg) } : nested_struct_with_map)
let query_maps_input_of_xml i =
  let r_nested_struct_with_map = ref None in
  let r_map_of_lists = ref None in
  let r_flattened_map_with_xml_name = ref None in
  let r_flattened_map = ref None in
  let r_map_with_xml_member_name = ref None in
  let r_complex_map_arg = ref None in
  let r_renamed_map_arg = ref None in
  let r_map_arg = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    ["NestedStructWithMap";
    "MapOfLists";
    "Hi";
    "FlattenedMap";
    "MapWithXmlMemberName";
    "ComplexMapArg";
    "Foo";
    "MapArg"]
    (fun tag _ ->
       match tag with
       | "NestedStructWithMap" ->
           r_nested_struct_with_map :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "NestedStructWithMap"
                   (fun i _ -> nested_struct_with_map_of_xml i) ()))
       | "MapOfLists" ->
           r_map_of_lists :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "MapOfLists"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                        (fun i _ ->
                           ((Smaws_Lib.Xml.Parse.Read.element i "key" ()),
                             (Shared.Query_deserializers.string_list_of_xml i)))
                        ()) ()))
       | "Hi" ->
           r_flattened_map_with_xml_name :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "Hi"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                        (fun i _ ->
                           ((Smaws_Lib.Xml.Parse.Read.element i "K" ()),
                             (Smaws_Lib.Xml.Parse.Read.element i "V" ()))) ())
                   ()))
       | "FlattenedMap" ->
           r_flattened_map :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "FlattenedMap"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                        (fun i _ ->
                           ((Smaws_Lib.Xml.Parse.Read.element i "key" ()),
                             (Smaws_Lib.Xml.Parse.Read.element i "value" ())))
                        ()) ()))
       | "MapWithXmlMemberName" ->
           r_map_with_xml_member_name :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "MapWithXmlMemberName"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                        (fun i _ ->
                           ((Smaws_Lib.Xml.Parse.Read.element i "K" ()),
                             (Smaws_Lib.Xml.Parse.Read.element i "V" ()))) ())
                   ()))
       | "ComplexMapArg" ->
           r_complex_map_arg :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "ComplexMapArg"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                        (fun i _ ->
                           ((Smaws_Lib.Xml.Parse.Read.element i "key" ()),
                             (Shared.Query_deserializers.greeting_struct_of_xml
                                i))) ()) ()))
       | "Foo" ->
           r_renamed_map_arg :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "Foo"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                        (fun i _ ->
                           ((Smaws_Lib.Xml.Parse.Read.element i "key" ()),
                             (Smaws_Lib.Xml.Parse.Read.element i "value" ())))
                        ()) ()))
       | "MapArg" ->
           r_map_arg :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "MapArg"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                        (fun i _ ->
                           ((Smaws_Lib.Xml.Parse.Read.element i "key" ()),
                             (Smaws_Lib.Xml.Parse.Read.element i "value" ())))
                        ()) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     nested_struct_with_map = (( ! ) r_nested_struct_with_map);
     map_of_lists = (( ! ) r_map_of_lists);
     flattened_map_with_xml_name = (( ! ) r_flattened_map_with_xml_name);
     flattened_map = (( ! ) r_flattened_map);
     map_with_xml_member_name = (( ! ) r_map_with_xml_member_name);
     complex_map_arg = (( ! ) r_complex_map_arg);
     renamed_map_arg = (( ! ) r_renamed_map_arg);
     map_arg = (( ! ) r_map_arg)
   } : query_maps_input)
let list_with_xml_name_of_xml i =
  Smaws_Lib.Xml.Parse.Read.elements i "item" ()
let nested_struct_with_list_of_xml i =
  let r_list_arg = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["ListArg"]
    (fun tag _ ->
       match tag with
       | "ListArg" ->
           r_list_arg :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "ListArg"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.elements i "member" ()) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ list_arg = (( ! ) r_list_arg) } : nested_struct_with_list)
let query_lists_input_of_xml i =
  let r_nested_with_list = ref None in
  let r_flattened_list_arg_with_xml_name = ref None in
  let r_list_arg_with_xml_name_member = ref None in
  let r_flattened_list_arg = ref None in
  let r_complex_list_arg = ref None in
  let r_list_arg = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    ["NestedWithList";
    "Hi";
    "ListArgWithXmlNameMember";
    "FlattenedListArg";
    "ComplexListArg";
    "ListArg"]
    (fun tag _ ->
       match tag with
       | "NestedWithList" ->
           r_nested_with_list :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "NestedWithList"
                   (fun i _ -> nested_struct_with_list_of_xml i) ()))
       | "Hi" ->
           r_flattened_list_arg_with_xml_name :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "Hi"
                   (fun i _ -> Smaws_Lib.Xml.Parse.Read.elements i "item" ())
                   ()))
       | "ListArgWithXmlNameMember" ->
           r_list_arg_with_xml_name_member :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i
                   "ListArgWithXmlNameMember"
                   (fun i _ -> Smaws_Lib.Xml.Parse.Read.elements i "item" ())
                   ()))
       | "FlattenedListArg" ->
           r_flattened_list_arg :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "FlattenedListArg"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.elements i "member" ()) ()))
       | "ComplexListArg" ->
           r_complex_list_arg :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "ComplexListArg"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.sequences i "member"
                        (fun i _ ->
                           Shared.Query_deserializers.greeting_struct_of_xml
                             i) ()) ()))
       | "ListArg" ->
           r_list_arg :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "ListArg"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.elements i "member" ()) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     nested_with_list = (( ! ) r_nested_with_list);
     flattened_list_arg_with_xml_name =
       (( ! ) r_flattened_list_arg_with_xml_name);
     list_arg_with_xml_name_member = (( ! ) r_list_arg_with_xml_name_member);
     flattened_list_arg = (( ! ) r_flattened_list_arg);
     complex_list_arg = (( ! ) r_complex_list_arg);
     list_arg = (( ! ) r_list_arg)
   } : query_lists_input)
let query_idempotency_token_auto_fill_input_of_xml i =
  let r_token = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["token"]
    (fun tag _ ->
       match tag with
       | "token" ->
           r_token := (Some (Smaws_Lib.Xml.Parse.Read.element i "token" ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ token = (( ! ) r_token) } : query_idempotency_token_auto_fill_input)
let put_with_content_encoding_input_of_xml i =
  let r_data = ref None in
  let r_encoding = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["data"; "encoding"]
    (fun tag _ ->
       match tag with
       | "data" ->
           r_data := (Some (Smaws_Lib.Xml.Parse.Read.element i "data" ()))
       | "encoding" ->
           r_encoding :=
             (Some (Smaws_Lib.Xml.Parse.Read.element i "encoding" ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ data = (( ! ) r_data); encoding = (( ! ) r_encoding) } : put_with_content_encoding_input)
let no_input_and_output_output_of_xml i = ()
let no_input_and_output_input_of_xml i = ()
let nested_structures_input_of_xml i =
  let r_nested = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["Nested"]
    (fun tag _ ->
       match tag with
       | "Nested" ->
           r_nested :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "Nested"
                   (fun i _ -> struct_arg_of_xml i) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ nested = (( ! ) r_nested) } : nested_structures_input)
let invalid_greeting_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["Message"]
    (fun tag _ ->
       match tag with
       | "Message" ->
           r_message :=
             (Some (Smaws_Lib.Xml.Parse.Read.element i "Message" ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = (( ! ) r_message) } : invalid_greeting)
let ignores_wrapping_xml_name_output_of_xml i =
  let r_foo = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["foo"]
    (fun tag _ ->
       match tag with
       | "foo" ->
           r_foo := (Some (Smaws_Lib.Xml.Parse.Read.element i "foo" ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ foo = (( ! ) r_foo) } : ignores_wrapping_xml_name_output)
let host_label_input_of_xml i =
  let r_label = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["label"]
    (fun tag _ ->
       match tag with
       | "label" ->
           r_label := (Some (Smaws_Lib.Xml.Parse.Read.element i "label" ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ label = (Smaws_Lib.Xml.Parse.required "label" (( ! ) r_label) i) } : 
  host_label_input)
let greeting_with_errors_output_of_xml i =
  let r_greeting = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["greeting"]
    (fun tag _ ->
       match tag with
       | "greeting" ->
           r_greeting :=
             (Some (Smaws_Lib.Xml.Parse.Read.element i "greeting" ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ greeting = (( ! ) r_greeting) } : greeting_with_errors_output)
let custom_code_error_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["Message"]
    (fun tag _ ->
       match tag with
       | "Message" ->
           r_message :=
             (Some (Smaws_Lib.Xml.Parse.Read.element i "Message" ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = (( ! ) r_message) } : custom_code_error)
let complex_nested_error_data_of_xml i =
  let r_foo = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["Foo"]
    (fun tag _ ->
       match tag with
       | "Foo" ->
           r_foo := (Some (Smaws_Lib.Xml.Parse.Read.element i "Foo" ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ foo = (( ! ) r_foo) } : complex_nested_error_data)
let complex_error_of_xml i =
  let r_nested = ref None in
  let r_top_level = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["Nested"; "TopLevel"]
    (fun tag _ ->
       match tag with
       | "Nested" ->
           r_nested :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "Nested"
                   (fun i _ -> complex_nested_error_data_of_xml i) ()))
       | "TopLevel" ->
           r_top_level :=
             (Some (Smaws_Lib.Xml.Parse.Read.element i "TopLevel" ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ nested = (( ! ) r_nested); top_level = (( ! ) r_top_level) } : complex_error)
let fractional_seconds_output_of_xml i =
  let r_datetime = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["datetime"]
    (fun tag _ ->
       match tag with
       | "datetime" ->
           r_datetime :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "datetime"
                   (fun i _ -> Shared.Query_deserializers.date_time_of_xml i)
                   ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ datetime = (( ! ) r_datetime) } : fractional_seconds_output)
let flattened_xml_map_with_xml_namespace_output_map_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
       ((Smaws_Lib.Xml.Parse.Read.element i "K" ()),
         (Smaws_Lib.Xml.Parse.Read.element i "V" ()))) ()
let flattened_xml_map_with_xml_namespace_output_of_xml i =
  let r_my_map = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["KVP"]
    (fun tag _ ->
       match tag with
       | "KVP" ->
           r_my_map :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "KVP"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                        (fun i _ ->
                           ((Smaws_Lib.Xml.Parse.Read.element i "K" ()),
                             (Smaws_Lib.Xml.Parse.Read.element i "V" ()))) ())
                   ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ my_map = (( ! ) r_my_map) } : flattened_xml_map_with_xml_namespace_output)
let flattened_xml_map_with_xml_name_output_map_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "entry"
    (fun i _ ->
       ((Smaws_Lib.Xml.Parse.Read.element i "K" ()),
         (Smaws_Lib.Xml.Parse.Read.element i "V" ()))) ()
let flattened_xml_map_with_xml_name_output_of_xml i =
  let r_my_map = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["KVP"]
    (fun tag _ ->
       match tag with
       | "KVP" ->
           r_my_map :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "KVP"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                        (fun i _ ->
                           ((Smaws_Lib.Xml.Parse.Read.element i "K" ()),
                             (Smaws_Lib.Xml.Parse.Read.element i "V" ()))) ())
                   ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ my_map = (( ! ) r_my_map) } : flattened_xml_map_with_xml_name_output)
let flattened_xml_map_output_of_xml i =
  let r_my_map = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["myMap"]
    (fun tag _ ->
       match tag with
       | "myMap" ->
           r_my_map :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "myMap"
                   (fun i _ ->
                      Smaws_Lib.Xml.Parse.Read.sequences i "entry"
                        (fun i _ ->
                           ((Smaws_Lib.Xml.Parse.Read.element i "key" ()),
                             (Shared.Query_deserializers.foo_enum_of_xml i)))
                        ()) ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ my_map = (( ! ) r_my_map) } : flattened_xml_map_output)
let empty_input_and_empty_output_output_of_xml i = ()
let empty_input_and_empty_output_input_of_xml i = ()
let datetime_offsets_output_of_xml i =
  let r_datetime = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i ["datetime"]
    (fun tag _ ->
       match tag with
       | "datetime" ->
           r_datetime :=
             (Some
                (Smaws_Lib.Xml.Parse.Read.sequence i "datetime"
                   (fun i _ -> Shared.Query_deserializers.date_time_of_xml i)
                   ()))
       | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ datetime = (( ! ) r_datetime) } : datetime_offsets_output)