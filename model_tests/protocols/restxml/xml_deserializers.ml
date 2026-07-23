open Smaws_Lib.Xml.Parse
open Types

let unit_of_xml _ = ()

let all_query_string_types_input_of_xml i =
  let r_query_string = ref None in
  let r_query_string_list = ref None in
  let r_query_string_set = ref None in
  let r_query_byte = ref None in
  let r_query_short = ref None in
  let r_query_integer = ref None in
  let r_query_integer_list = ref None in
  let r_query_integer_set = ref None in
  let r_query_long = ref None in
  let r_query_float = ref None in
  let r_query_double = ref None in
  let r_query_double_list = ref None in
  let r_query_boolean = ref None in
  let r_query_boolean_list = ref None in
  let r_query_timestamp = ref None in
  let r_query_timestamp_list = ref None in
  let r_query_enum = ref None in
  let r_query_enum_list = ref None in
  let r_query_integer_enum = ref None in
  let r_query_integer_enum_list = ref None in
  let r_query_params_map_of_strings = ref None in
  Structure.scanSequence i
    [
      "queryString";
      "queryStringList";
      "queryStringSet";
      "queryByte";
      "queryShort";
      "queryInteger";
      "queryIntegerList";
      "queryIntegerSet";
      "queryLong";
      "queryFloat";
      "queryDouble";
      "queryDoubleList";
      "queryBoolean";
      "queryBooleanList";
      "queryTimestamp";
      "queryTimestampList";
      "queryEnum";
      "queryEnumList";
      "queryIntegerEnum";
      "queryIntegerEnumList";
      "queryParamsMapOfStrings";
    ] (fun tag _ ->
      match tag with
      | "queryString" -> r_query_string := Some (Read.element_value i "queryString" Fun.id ())
      | "queryStringList" ->
          r_query_string_list :=
            Some
              (Read.sequence i "queryStringList"
                 (fun i _ -> Read.elements_value i "member" Fun.id ())
                 ())
      | "queryStringSet" ->
          r_query_string_set :=
            Some
              (Read.sequence i "queryStringSet"
                 (fun i _ -> Read.elements_value i "member" Fun.id ())
                 ())
      | "queryByte" ->
          r_query_byte := Some (Read.element_value i "queryByte" Primitive.int_of_string ())
      | "queryShort" ->
          r_query_short := Some (Read.element_value i "queryShort" Primitive.int_of_string ())
      | "queryInteger" ->
          r_query_integer := Some (Read.element_value i "queryInteger" Primitive.int_of_string ())
      | "queryIntegerList" ->
          r_query_integer_list :=
            Some
              (Read.sequence i "queryIntegerList"
                 (fun i _ -> Read.elements_value i "member" Primitive.int_of_string ())
                 ())
      | "queryIntegerSet" ->
          r_query_integer_set :=
            Some
              (Read.sequence i "queryIntegerSet"
                 (fun i _ -> Read.elements_value i "member" Primitive.int_of_string ())
                 ())
      | "queryLong" ->
          r_query_long := Some (Read.element_value i "queryLong" Primitive.long_of_string ())
      | "queryFloat" ->
          r_query_float := Some (Read.element_value i "queryFloat" Primitive.float_of_string ())
      | "queryDouble" ->
          r_query_double := Some (Read.element_value i "queryDouble" Primitive.double_of_string ())
      | "queryDoubleList" ->
          r_query_double_list :=
            Some
              (Read.sequence i "queryDoubleList"
                 (fun i _ -> Read.elements_value i "member" Primitive.double_of_string ())
                 ())
      | "queryBoolean" ->
          r_query_boolean := Some (Read.element_value i "queryBoolean" Primitive.bool_of_string ())
      | "queryBooleanList" ->
          r_query_boolean_list :=
            Some
              (Read.sequence i "queryBooleanList"
                 (fun i _ -> Read.elements_value i "member" Primitive.bool_of_string ())
                 ())
      | "queryTimestamp" ->
          r_query_timestamp :=
            Some (Read.element_value i "queryTimestamp" Primitive.timestamp_iso_of_string ())
      | "queryTimestampList" ->
          r_query_timestamp_list :=
            Some
              (Read.sequence i "queryTimestampList"
                 (fun i _ -> Read.elements_value i "member" Primitive.timestamp_iso_of_string ())
                 ())
      | "queryEnum" ->
          r_query_enum :=
            Some
              (Read.sequence i "queryEnum"
                 (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                 ())
      | "queryEnumList" ->
          r_query_enum_list :=
            Some
              (Read.sequence i "queryEnumList"
                 (fun i _ ->
                   Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                     ())
                 ())
      | "queryIntegerEnum" ->
          r_query_integer_enum :=
            Some
              (Read.sequence i "queryIntegerEnum"
                 (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                 ())
      | "queryIntegerEnumList" ->
          r_query_integer_enum_list :=
            Some
              (Read.sequence i "queryIntegerEnumList"
                 (fun i _ ->
                   Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                     ())
                 ())
      | "queryParamsMapOfStrings" ->
          r_query_params_map_of_strings :=
            Some
              (Read.sequence i "queryParamsMapOfStrings"
                 (fun i _ ->
                   Read.sequences i "entry"
                     (fun i _ ->
                       let k = Read.element_value i "key" Fun.id () in
                       let v = Read.element_value i "value" Fun.id () in
                       (k, v))
                     ())
                 ())
      | _ -> Read.skip_element i);
  ({
     query_string = ( ! ) r_query_string;
     query_string_list = ( ! ) r_query_string_list;
     query_string_set = ( ! ) r_query_string_set;
     query_byte = ( ! ) r_query_byte;
     query_short = ( ! ) r_query_short;
     query_integer = ( ! ) r_query_integer;
     query_integer_list = ( ! ) r_query_integer_list;
     query_integer_set = ( ! ) r_query_integer_set;
     query_long = ( ! ) r_query_long;
     query_float = ( ! ) r_query_float;
     query_double = ( ! ) r_query_double;
     query_double_list = ( ! ) r_query_double_list;
     query_boolean = ( ! ) r_query_boolean;
     query_boolean_list = ( ! ) r_query_boolean_list;
     query_timestamp = ( ! ) r_query_timestamp;
     query_timestamp_list = ( ! ) r_query_timestamp_list;
     query_enum = ( ! ) r_query_enum;
     query_enum_list = ( ! ) r_query_enum_list;
     query_integer_enum = ( ! ) r_query_integer_enum;
     query_integer_enum_list = ( ! ) r_query_integer_enum_list;
     query_params_map_of_strings = ( ! ) r_query_params_map_of_strings;
   }
    : all_query_string_types_input)

let payload_with_xml_name_of_xml i =
  let r_name = ref None in
  Structure.scanSequence i [ "name" ] (fun tag _ ->
      match tag with
      | "name" -> r_name := Some (Read.element_value i "name" Fun.id ())
      | _ -> Read.skip_element i);
  ({ name = ( ! ) r_name } : payload_with_xml_name)

let body_with_xml_name_input_output_of_xml i =
  let r_nested = ref None in
  Structure.scanSequence i [ "nested" ] (fun tag _ ->
      match tag with
      | "nested" ->
          r_nested := Some (Read.sequence i "nested" (fun i _ -> payload_with_xml_name_of_xml i) ())
      | _ -> Read.skip_element i);
  ({ nested = ( ! ) r_nested } : body_with_xml_name_input_output)

let complex_nested_error_data_of_xml i =
  let r_foo = ref None in
  Structure.scanSequence i [ "Foo" ] (fun tag _ ->
      match tag with
      | "Foo" -> r_foo := Some (Read.element_value i "Foo" Fun.id ())
      | _ -> Read.skip_element i);
  ({ foo = ( ! ) r_foo } : complex_nested_error_data)

let complex_error_of_xml i =
  let r_header = ref None in
  let r_top_level = ref None in
  let r_nested = ref None in
  Structure.scanSequence i [ "Header"; "TopLevel"; "Nested" ] (fun tag _ ->
      match tag with
      | "Header" -> r_header := Some (Read.element_value i "Header" Fun.id ())
      | "TopLevel" -> r_top_level := Some (Read.element_value i "TopLevel" Fun.id ())
      | "Nested" ->
          r_nested :=
            Some (Read.sequence i "Nested" (fun i _ -> complex_nested_error_data_of_xml i) ())
      | _ -> Read.skip_element i);
  ({ header = ( ! ) r_header; top_level = ( ! ) r_top_level; nested = ( ! ) r_nested }
    : complex_error)

let constant_and_variable_query_string_input_of_xml i =
  let r_baz = ref None in
  let r_maybe_set = ref None in
  Structure.scanSequence i [ "baz"; "maybeSet" ] (fun tag _ ->
      match tag with
      | "baz" -> r_baz := Some (Read.element_value i "baz" Fun.id ())
      | "maybeSet" -> r_maybe_set := Some (Read.element_value i "maybeSet" Fun.id ())
      | _ -> Read.skip_element i);
  ({ baz = ( ! ) r_baz; maybe_set = ( ! ) r_maybe_set } : constant_and_variable_query_string_input)

let constant_query_string_input_of_xml i =
  let r_hello = ref None in
  Structure.scanSequence i [ "hello" ] (fun tag _ ->
      match tag with
      | "hello" -> r_hello := Some (Read.element_value i "hello" Fun.id ())
      | _ -> Read.skip_element i);
  ({ hello = required "hello" (( ! ) r_hello) i } : constant_query_string_input)

let content_type_parameters_output_of_xml i = ()

let content_type_parameters_input_of_xml i =
  let r_value = ref None in
  Structure.scanSequence i [ "value" ] (fun tag _ ->
      match tag with
      | "value" -> r_value := Some (Read.element_value i "value" Primitive.int_of_string ())
      | _ -> Read.skip_element i);
  ({ value = ( ! ) r_value } : content_type_parameters_input)

let datetime_offsets_output_of_xml i =
  let r_datetime = ref None in
  Structure.scanSequence i [ "datetime" ] (fun tag _ ->
      match tag with
      | "datetime" ->
          r_datetime :=
            Some
              (Read.sequence i "datetime"
                 (fun i _ -> Shared.Xml_deserializers.date_time_of_xml i)
                 ())
      | _ -> Read.skip_element i);
  ({ datetime = ( ! ) r_datetime } : datetime_offsets_output)

let empty_input_and_empty_output_output_of_xml i = ()
let empty_input_and_empty_output_input_of_xml i = ()

let host_label_header_input_of_xml i =
  let r_account_id = ref None in
  Structure.scanSequence i [ "accountId" ] (fun tag _ ->
      match tag with
      | "accountId" -> r_account_id := Some (Read.element_value i "accountId" Fun.id ())
      | _ -> Read.skip_element i);
  ({ account_id = required "accountId" (( ! ) r_account_id) i } : host_label_header_input)

let endpoint_with_host_label_operation_request_of_xml i =
  let r_label = ref None in
  Structure.scanSequence i [ "label" ] (fun tag _ ->
      match tag with
      | "label" -> r_label := Some (Read.element_value i "label" Fun.id ())
      | _ -> Read.skip_element i);
  ({ label = required "label" (( ! ) r_label) i } : endpoint_with_host_label_operation_request)

let string_enum_of_xml i =
  let s = Read.data i in
  (match s with "enumvalue" -> V | _ -> failwith "unknown enum value" : string_enum)

let enum_payload_input_of_xml i =
  let r_payload = ref None in
  Structure.scanSequence i [ "payload" ] (fun tag _ ->
      match tag with
      | "payload" ->
          r_payload := Some (Read.sequence i "payload" (fun i _ -> string_enum_of_xml i) ())
      | _ -> Read.skip_element i);
  ({ payload = ( ! ) r_payload } : enum_payload_input)

let flattened_xml_map_response_of_xml i =
  let r_my_map = ref None in
  Structure.scanSequence i [ "myMap" ] (fun tag _ ->
      match tag with
      | "myMap" ->
          r_my_map :=
            Some
              (Read.sequences i "myMap"
                 (fun i _ ->
                   let k = Read.element_value i "key" Fun.id () in
                   let v =
                     Read.sequence i "value"
                       (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                       ()
                   in
                   (k, v))
                 ())
      | _ -> Read.skip_element i);
  ({ my_map = ( ! ) r_my_map } : flattened_xml_map_response)

let flattened_xml_map_request_of_xml i =
  let r_my_map = ref None in
  Structure.scanSequence i [ "myMap" ] (fun tag _ ->
      match tag with
      | "myMap" ->
          r_my_map :=
            Some
              (Read.sequences i "myMap"
                 (fun i _ ->
                   let k = Read.element_value i "key" Fun.id () in
                   let v =
                     Read.sequence i "value"
                       (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                       ()
                   in
                   (k, v))
                 ())
      | _ -> Read.skip_element i);
  ({ my_map = ( ! ) r_my_map } : flattened_xml_map_request)

let flattened_xml_map_with_xml_name_input_output_map_of_xml i =
  Read.sequences i "entry"
    (fun i _ ->
      let k = Read.element_value i "K" Fun.id () in
      let v = Read.element_value i "V" Fun.id () in
      (k, v))
    ()

let flattened_xml_map_with_xml_name_response_of_xml i =
  let r_my_map = ref None in
  Structure.scanSequence i [ "KVP" ] (fun tag _ ->
      match tag with
      | "KVP" ->
          r_my_map :=
            Some
              (Read.sequences i "KVP"
                 (fun i _ ->
                   let k = Read.element_value i "K" Fun.id () in
                   let v = Read.element_value i "V" Fun.id () in
                   (k, v))
                 ())
      | _ -> Read.skip_element i);
  ({ my_map = ( ! ) r_my_map } : flattened_xml_map_with_xml_name_response)

let flattened_xml_map_with_xml_name_request_of_xml i =
  let r_my_map = ref None in
  Structure.scanSequence i [ "KVP" ] (fun tag _ ->
      match tag with
      | "KVP" ->
          r_my_map :=
            Some
              (Read.sequences i "KVP"
                 (fun i _ ->
                   let k = Read.element_value i "K" Fun.id () in
                   let v = Read.element_value i "V" Fun.id () in
                   (k, v))
                 ())
      | _ -> Read.skip_element i);
  ({ my_map = ( ! ) r_my_map } : flattened_xml_map_with_xml_name_request)

let flattened_xml_map_with_xml_namespace_output_map_of_xml i =
  Read.sequences i "entry"
    (fun i _ ->
      let k = Read.element_value i "K" Fun.id () in
      let v = Read.element_value i "V" Fun.id () in
      (k, v))
    ()

let flattened_xml_map_with_xml_namespace_output_of_xml i =
  let r_my_map = ref None in
  Structure.scanSequence i [ "KVP" ] (fun tag _ ->
      match tag with
      | "KVP" ->
          r_my_map :=
            Some
              (Read.sequences i "KVP"
                 (fun i _ ->
                   let k = Read.element_value i "K" Fun.id () in
                   let v = Read.element_value i "V" Fun.id () in
                   (k, v))
                 ())
      | _ -> Read.skip_element i);
  ({ my_map = ( ! ) r_my_map } : flattened_xml_map_with_xml_namespace_output)

let foo_prefix_headers_of_xml i =
  Read.sequences i "entry"
    (fun i _ ->
      let k = Read.element_value i "key" Fun.id () in
      let v = Read.element_value i "value" Fun.id () in
      (k, v))
    ()

let fractional_seconds_output_of_xml i =
  let r_datetime = ref None in
  Structure.scanSequence i [ "datetime" ] (fun tag _ ->
      match tag with
      | "datetime" ->
          r_datetime :=
            Some
              (Read.sequence i "datetime"
                 (fun i _ -> Shared.Xml_deserializers.date_time_of_xml i)
                 ())
      | _ -> Read.skip_element i);
  ({ datetime = ( ! ) r_datetime } : fractional_seconds_output)

let invalid_greeting_of_xml i =
  let r_message = ref None in
  Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" -> r_message := Some (Read.element_value i "Message" Fun.id ())
      | _ -> Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_greeting)

let greeting_with_errors_output_of_xml i =
  let r_greeting = ref None in
  Structure.scanSequence i [ "greeting" ] (fun tag _ ->
      match tag with
      | "greeting" -> r_greeting := Some (Read.element_value i "greeting" Fun.id ())
      | _ -> Read.skip_element i);
  ({ greeting = ( ! ) r_greeting } : greeting_with_errors_output)

let http_empty_prefix_headers_output_of_xml i =
  let r_prefix_headers = ref None in
  let r_specific_header = ref None in
  Structure.scanSequence i [ "prefixHeaders"; "specificHeader" ] (fun tag _ ->
      match tag with
      | "prefixHeaders" ->
          r_prefix_headers :=
            Some
              (Read.sequence i "prefixHeaders"
                 (fun i _ ->
                   Read.sequences i "entry"
                     (fun i _ ->
                       let k = Read.element_value i "key" Fun.id () in
                       let v = Read.element_value i "value" Fun.id () in
                       (k, v))
                     ())
                 ())
      | "specificHeader" ->
          r_specific_header := Some (Read.element_value i "specificHeader" Fun.id ())
      | _ -> Read.skip_element i);
  ({ prefix_headers = ( ! ) r_prefix_headers; specific_header = ( ! ) r_specific_header }
    : http_empty_prefix_headers_output)

let http_empty_prefix_headers_input_of_xml i =
  let r_prefix_headers = ref None in
  let r_specific_header = ref None in
  Structure.scanSequence i [ "prefixHeaders"; "specificHeader" ] (fun tag _ ->
      match tag with
      | "prefixHeaders" ->
          r_prefix_headers :=
            Some
              (Read.sequence i "prefixHeaders"
                 (fun i _ ->
                   Read.sequences i "entry"
                     (fun i _ ->
                       let k = Read.element_value i "key" Fun.id () in
                       let v = Read.element_value i "value" Fun.id () in
                       (k, v))
                     ())
                 ())
      | "specificHeader" ->
          r_specific_header := Some (Read.element_value i "specificHeader" Fun.id ())
      | _ -> Read.skip_element i);
  ({ prefix_headers = ( ! ) r_prefix_headers; specific_header = ( ! ) r_specific_header }
    : http_empty_prefix_headers_input)

let http_payload_traits_input_output_of_xml i =
  let r_foo = ref None in
  let r_blob = ref None in
  Structure.scanSequence i [ "foo"; "blob" ] (fun tag _ ->
      match tag with
      | "foo" -> r_foo := Some (Read.element_value i "foo" Fun.id ())
      | "blob" -> r_blob := Some (Read.element_value i "blob" Primitive.blob_of_string ())
      | _ -> Read.skip_element i);
  ({ foo = ( ! ) r_foo; blob = ( ! ) r_blob } : http_payload_traits_input_output)

let http_payload_traits_with_media_type_input_output_of_xml i =
  let r_foo = ref None in
  let r_blob = ref None in
  Structure.scanSequence i [ "foo"; "blob" ] (fun tag _ ->
      match tag with
      | "foo" -> r_foo := Some (Read.element_value i "foo" Fun.id ())
      | "blob" ->
          r_blob :=
            Some
              (Read.sequence i "blob"
                 (fun i _ -> Shared.Xml_deserializers.text_plain_blob_of_xml i)
                 ())
      | _ -> Read.skip_element i);
  ({ foo = ( ! ) r_foo; blob = ( ! ) r_blob } : http_payload_traits_with_media_type_input_output)

let http_payload_with_member_xml_name_input_output_of_xml i =
  let r_nested = ref None in
  Structure.scanSequence i [ "Hola" ] (fun tag _ ->
      match tag with
      | "Hola" ->
          r_nested := Some (Read.sequence i "Hola" (fun i _ -> payload_with_xml_name_of_xml i) ())
      | _ -> Read.skip_element i);
  ({ nested = ( ! ) r_nested } : http_payload_with_member_xml_name_input_output)

let nested_payload_of_xml i =
  let r_greeting = ref None in
  let r_name = ref None in
  Structure.scanSequence i [ "greeting"; "name" ] (fun tag _ ->
      match tag with
      | "greeting" -> r_greeting := Some (Read.element_value i "greeting" Fun.id ())
      | "name" -> r_name := Some (Read.element_value i "name" Fun.id ())
      | _ -> Read.skip_element i);
  ({ greeting = ( ! ) r_greeting; name = ( ! ) r_name } : nested_payload)

let http_payload_with_structure_input_output_of_xml i =
  let r_nested = ref None in
  Structure.scanSequence i [ "nested" ] (fun tag _ ->
      match tag with
      | "nested" ->
          r_nested := Some (Read.sequence i "nested" (fun i _ -> nested_payload_of_xml i) ())
      | _ -> Read.skip_element i);
  ({ nested = ( ! ) r_nested } : http_payload_with_structure_input_output)

let union_payload_of_xml i =
  let r_greeting = ref None in
  Structure.scanSequence i [ "greeting" ] (fun tag _ ->
      match tag with
      | "greeting" -> r_greeting := Some (Read.element_value i "greeting" Fun.id ())
      | _ -> Read.skip_element i);
  (match ( ! ) r_greeting with
   | Some v -> Greeting v
   | None -> failwith "no union member present in xml response"
    : union_payload)

let http_payload_with_union_input_output_of_xml i =
  let r_nested = ref None in
  Structure.scanSequence i [ "nested" ] (fun tag _ ->
      match tag with
      | "nested" ->
          r_nested := Some (Read.sequence i "nested" (fun i _ -> union_payload_of_xml i) ())
      | _ -> Read.skip_element i);
  ({ nested = ( ! ) r_nested } : http_payload_with_union_input_output)

let http_payload_with_xml_name_input_output_of_xml i =
  let r_nested = ref None in
  Structure.scanSequence i [ "nested" ] (fun tag _ ->
      match tag with
      | "nested" ->
          r_nested := Some (Read.sequence i "nested" (fun i _ -> payload_with_xml_name_of_xml i) ())
      | _ -> Read.skip_element i);
  ({ nested = ( ! ) r_nested } : http_payload_with_xml_name_input_output)

let payload_with_xml_namespace_of_xml i =
  let r_name = ref None in
  Structure.scanSequence i [ "name" ] (fun tag _ ->
      match tag with
      | "name" -> r_name := Some (Read.element_value i "name" Fun.id ())
      | _ -> Read.skip_element i);
  ({ name = ( ! ) r_name } : payload_with_xml_namespace)

let http_payload_with_xml_namespace_input_output_of_xml i =
  let r_nested = ref None in
  Structure.scanSequence i [ "nested" ] (fun tag _ ->
      match tag with
      | "nested" ->
          r_nested :=
            Some (Read.sequence i "nested" (fun i _ -> payload_with_xml_namespace_of_xml i) ())
      | _ -> Read.skip_element i);
  ({ nested = ( ! ) r_nested } : http_payload_with_xml_namespace_input_output)

let payload_with_xml_namespace_and_prefix_of_xml i =
  let r_name = ref None in
  Structure.scanSequence i [ "name" ] (fun tag _ ->
      match tag with
      | "name" -> r_name := Some (Read.element_value i "name" Fun.id ())
      | _ -> Read.skip_element i);
  ({ name = ( ! ) r_name } : payload_with_xml_namespace_and_prefix)

let http_payload_with_xml_namespace_and_prefix_input_output_of_xml i =
  let r_nested = ref None in
  Structure.scanSequence i [ "nested" ] (fun tag _ ->
      match tag with
      | "nested" ->
          r_nested :=
            Some
              (Read.sequence i "nested"
                 (fun i _ -> payload_with_xml_namespace_and_prefix_of_xml i)
                 ())
      | _ -> Read.skip_element i);
  ({ nested = ( ! ) r_nested } : http_payload_with_xml_namespace_and_prefix_input_output)

let http_prefix_headers_input_output_of_xml i =
  let r_foo = ref None in
  let r_foo_map = ref None in
  Structure.scanSequence i [ "foo"; "fooMap" ] (fun tag _ ->
      match tag with
      | "foo" -> r_foo := Some (Read.element_value i "foo" Fun.id ())
      | "fooMap" ->
          r_foo_map :=
            Some
              (Read.sequence i "fooMap"
                 (fun i _ ->
                   Read.sequences i "entry"
                     (fun i _ ->
                       let k = Read.element_value i "key" Fun.id () in
                       let v = Read.element_value i "value" Fun.id () in
                       (k, v))
                     ())
                 ())
      | _ -> Read.skip_element i);
  ({ foo = ( ! ) r_foo; foo_map = ( ! ) r_foo_map } : http_prefix_headers_input_output)

let http_request_with_float_labels_input_of_xml i =
  let r_float_ = ref None in
  let r_double = ref None in
  Structure.scanSequence i [ "float"; "double" ] (fun tag _ ->
      match tag with
      | "float" -> r_float_ := Some (Read.element_value i "float" Primitive.float_of_string ())
      | "double" -> r_double := Some (Read.element_value i "double" Primitive.double_of_string ())
      | _ -> Read.skip_element i);
  ({ float_ = required "float" (( ! ) r_float_) i; double = required "double" (( ! ) r_double) i }
    : http_request_with_float_labels_input)

let http_request_with_greedy_label_in_path_input_of_xml i =
  let r_foo = ref None in
  let r_baz = ref None in
  Structure.scanSequence i [ "foo"; "baz" ] (fun tag _ ->
      match tag with
      | "foo" -> r_foo := Some (Read.element_value i "foo" Fun.id ())
      | "baz" -> r_baz := Some (Read.element_value i "baz" Fun.id ())
      | _ -> Read.skip_element i);
  ({ foo = required "foo" (( ! ) r_foo) i; baz = required "baz" (( ! ) r_baz) i }
    : http_request_with_greedy_label_in_path_input)

let http_request_with_labels_input_of_xml i =
  let r_string_ = ref None in
  let r_short = ref None in
  let r_integer = ref None in
  let r_long = ref None in
  let r_float_ = ref None in
  let r_double = ref None in
  let r_boolean_ = ref None in
  let r_timestamp = ref None in
  Structure.scanSequence i
    [ "string"; "short"; "integer"; "long"; "float"; "double"; "boolean"; "timestamp" ]
    (fun tag _ ->
      match tag with
      | "string" -> r_string_ := Some (Read.element_value i "string" Fun.id ())
      | "short" -> r_short := Some (Read.element_value i "short" Primitive.int_of_string ())
      | "integer" -> r_integer := Some (Read.element_value i "integer" Primitive.int_of_string ())
      | "long" -> r_long := Some (Read.element_value i "long" Primitive.long_of_string ())
      | "float" -> r_float_ := Some (Read.element_value i "float" Primitive.float_of_string ())
      | "double" -> r_double := Some (Read.element_value i "double" Primitive.double_of_string ())
      | "boolean" -> r_boolean_ := Some (Read.element_value i "boolean" Primitive.bool_of_string ())
      | "timestamp" ->
          r_timestamp :=
            Some (Read.element_value i "timestamp" Primitive.timestamp_iso_of_string ())
      | _ -> Read.skip_element i);
  ({
     string_ = required "string" (( ! ) r_string_) i;
     short = required "short" (( ! ) r_short) i;
     integer = required "integer" (( ! ) r_integer) i;
     long = required "long" (( ! ) r_long) i;
     float_ = required "float" (( ! ) r_float_) i;
     double = required "double" (( ! ) r_double) i;
     boolean_ = required "boolean" (( ! ) r_boolean_) i;
     timestamp = required "timestamp" (( ! ) r_timestamp) i;
   }
    : http_request_with_labels_input)

let http_request_with_labels_and_timestamp_format_input_of_xml i =
  let r_member_epoch_seconds = ref None in
  let r_member_http_date = ref None in
  let r_member_date_time = ref None in
  let r_default_format = ref None in
  let r_target_epoch_seconds = ref None in
  let r_target_http_date = ref None in
  let r_target_date_time = ref None in
  Structure.scanSequence i
    [
      "memberEpochSeconds";
      "memberHttpDate";
      "memberDateTime";
      "defaultFormat";
      "targetEpochSeconds";
      "targetHttpDate";
      "targetDateTime";
    ] (fun tag _ ->
      match tag with
      | "memberEpochSeconds" ->
          r_member_epoch_seconds :=
            Some (Read.element_value i "memberEpochSeconds" Primitive.timestamp_epoch_of_string ())
      | "memberHttpDate" ->
          r_member_http_date :=
            Some (Read.element_value i "memberHttpDate" Primitive.timestamp_httpdate_of_string ())
      | "memberDateTime" ->
          r_member_date_time :=
            Some (Read.element_value i "memberDateTime" Primitive.timestamp_iso_of_string ())
      | "defaultFormat" ->
          r_default_format :=
            Some (Read.element_value i "defaultFormat" Primitive.timestamp_iso_of_string ())
      | "targetEpochSeconds" ->
          r_target_epoch_seconds :=
            Some
              (Read.sequence i "targetEpochSeconds"
                 (fun i _ -> Shared.Xml_deserializers.epoch_seconds_of_xml i)
                 ())
      | "targetHttpDate" ->
          r_target_http_date :=
            Some
              (Read.sequence i "targetHttpDate"
                 (fun i _ -> Shared.Xml_deserializers.http_date_of_xml i)
                 ())
      | "targetDateTime" ->
          r_target_date_time :=
            Some
              (Read.sequence i "targetDateTime"
                 (fun i _ -> Shared.Xml_deserializers.date_time_of_xml i)
                 ())
      | _ -> Read.skip_element i);
  ({
     member_epoch_seconds = required "memberEpochSeconds" (( ! ) r_member_epoch_seconds) i;
     member_http_date = required "memberHttpDate" (( ! ) r_member_http_date) i;
     member_date_time = required "memberDateTime" (( ! ) r_member_date_time) i;
     default_format = required "defaultFormat" (( ! ) r_default_format) i;
     target_epoch_seconds = required "targetEpochSeconds" (( ! ) r_target_epoch_seconds) i;
     target_http_date = required "targetHttpDate" (( ! ) r_target_http_date) i;
     target_date_time = required "targetDateTime" (( ! ) r_target_date_time) i;
   }
    : http_request_with_labels_and_timestamp_format_input)

let http_response_code_output_of_xml i =
  let r_status = ref None in
  Structure.scanSequence i [ "Status" ] (fun tag _ ->
      match tag with
      | "Status" -> r_status := Some (Read.element_value i "Status" Primitive.int_of_string ())
      | _ -> Read.skip_element i);
  ({ status = ( ! ) r_status } : http_response_code_output)

let string_payload_input_of_xml i =
  let r_payload = ref None in
  Structure.scanSequence i [ "payload" ] (fun tag _ ->
      match tag with
      | "payload" -> r_payload := Some (Read.element_value i "payload" Fun.id ())
      | _ -> Read.skip_element i);
  ({ payload = ( ! ) r_payload } : string_payload_input)

let ignore_query_params_in_response_output_of_xml i =
  let r_baz = ref None in
  Structure.scanSequence i [ "baz" ] (fun tag _ ->
      match tag with
      | "baz" -> r_baz := Some (Read.element_value i "baz" Fun.id ())
      | _ -> Read.skip_element i);
  ({ baz = ( ! ) r_baz } : ignore_query_params_in_response_output)

let input_and_output_with_headers_i_o_of_xml i =
  let r_header_string = ref None in
  let r_header_byte = ref None in
  let r_header_short = ref None in
  let r_header_integer = ref None in
  let r_header_long = ref None in
  let r_header_float = ref None in
  let r_header_double = ref None in
  let r_header_true_bool = ref None in
  let r_header_false_bool = ref None in
  let r_header_string_list = ref None in
  let r_header_string_set = ref None in
  let r_header_integer_list = ref None in
  let r_header_boolean_list = ref None in
  let r_header_timestamp_list = ref None in
  let r_header_enum = ref None in
  let r_header_enum_list = ref None in
  Structure.scanSequence i
    [
      "headerString";
      "headerByte";
      "headerShort";
      "headerInteger";
      "headerLong";
      "headerFloat";
      "headerDouble";
      "headerTrueBool";
      "headerFalseBool";
      "headerStringList";
      "headerStringSet";
      "headerIntegerList";
      "headerBooleanList";
      "headerTimestampList";
      "headerEnum";
      "headerEnumList";
    ] (fun tag _ ->
      match tag with
      | "headerString" -> r_header_string := Some (Read.element_value i "headerString" Fun.id ())
      | "headerByte" ->
          r_header_byte := Some (Read.element_value i "headerByte" Primitive.int_of_string ())
      | "headerShort" ->
          r_header_short := Some (Read.element_value i "headerShort" Primitive.int_of_string ())
      | "headerInteger" ->
          r_header_integer := Some (Read.element_value i "headerInteger" Primitive.int_of_string ())
      | "headerLong" ->
          r_header_long := Some (Read.element_value i "headerLong" Primitive.long_of_string ())
      | "headerFloat" ->
          r_header_float := Some (Read.element_value i "headerFloat" Primitive.float_of_string ())
      | "headerDouble" ->
          r_header_double :=
            Some (Read.element_value i "headerDouble" Primitive.double_of_string ())
      | "headerTrueBool" ->
          r_header_true_bool :=
            Some (Read.element_value i "headerTrueBool" Primitive.bool_of_string ())
      | "headerFalseBool" ->
          r_header_false_bool :=
            Some (Read.element_value i "headerFalseBool" Primitive.bool_of_string ())
      | "headerStringList" ->
          r_header_string_list :=
            Some
              (Read.sequence i "headerStringList"
                 (fun i _ -> Read.elements_value i "member" Fun.id ())
                 ())
      | "headerStringSet" ->
          r_header_string_set :=
            Some
              (Read.sequence i "headerStringSet"
                 (fun i _ -> Read.elements_value i "member" Fun.id ())
                 ())
      | "headerIntegerList" ->
          r_header_integer_list :=
            Some
              (Read.sequence i "headerIntegerList"
                 (fun i _ -> Read.elements_value i "member" Primitive.int_of_string ())
                 ())
      | "headerBooleanList" ->
          r_header_boolean_list :=
            Some
              (Read.sequence i "headerBooleanList"
                 (fun i _ -> Read.elements_value i "member" Primitive.bool_of_string ())
                 ())
      | "headerTimestampList" ->
          r_header_timestamp_list :=
            Some
              (Read.sequence i "headerTimestampList"
                 (fun i _ -> Read.elements_value i "member" Primitive.timestamp_iso_of_string ())
                 ())
      | "headerEnum" ->
          r_header_enum :=
            Some
              (Read.sequence i "headerEnum"
                 (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                 ())
      | "headerEnumList" ->
          r_header_enum_list :=
            Some
              (Read.sequence i "headerEnumList"
                 (fun i _ ->
                   Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                     ())
                 ())
      | _ -> Read.skip_element i);
  ({
     header_string = ( ! ) r_header_string;
     header_byte = ( ! ) r_header_byte;
     header_short = ( ! ) r_header_short;
     header_integer = ( ! ) r_header_integer;
     header_long = ( ! ) r_header_long;
     header_float = ( ! ) r_header_float;
     header_double = ( ! ) r_header_double;
     header_true_bool = ( ! ) r_header_true_bool;
     header_false_bool = ( ! ) r_header_false_bool;
     header_string_list = ( ! ) r_header_string_list;
     header_string_set = ( ! ) r_header_string_set;
     header_integer_list = ( ! ) r_header_integer_list;
     header_boolean_list = ( ! ) r_header_boolean_list;
     header_timestamp_list = ( ! ) r_header_timestamp_list;
     header_enum = ( ! ) r_header_enum;
     header_enum_list = ( ! ) r_header_enum_list;
   }
    : input_and_output_with_headers_i_o)

let list_with_member_namespace_of_xml i = Read.elements_value i "member" Fun.id ()
let list_with_namespace_of_xml i = Read.elements_value i "member" Fun.id ()

let nested_map_of_xml i =
  Read.sequences i "entry"
    (fun i _ ->
      let k = Read.element_value i "key" Fun.id () in
      let v =
        Read.sequence i "value" (fun i _ -> Shared.Xml_deserializers.foo_enum_map_of_xml i) ()
      in
      (k, v))
    ()

let nested_xml_map_with_xml_name_inner_map_of_xml i =
  Read.sequences i "entry"
    (fun i _ ->
      let k = Read.element_value i "InnerKey" Fun.id () in
      let v = Read.element_value i "InnerValue" Fun.id () in
      (k, v))
    ()

let nested_xml_map_with_xml_name_map_of_xml i =
  Read.sequences i "entry"
    (fun i _ ->
      let k = Read.element_value i "OuterKey" Fun.id () in
      let v =
        Read.sequence i "value" (fun i _ -> nested_xml_map_with_xml_name_inner_map_of_xml i) ()
      in
      (k, v))
    ()

let nested_xml_map_with_xml_name_response_of_xml i =
  let r_nested_xml_map_with_xml_name_map = ref None in
  Structure.scanSequence i [ "nestedXmlMapWithXmlNameMap" ] (fun tag _ ->
      match tag with
      | "nestedXmlMapWithXmlNameMap" ->
          r_nested_xml_map_with_xml_name_map :=
            Some
              (Read.sequence i "nestedXmlMapWithXmlNameMap"
                 (fun i _ ->
                   Read.sequences i "entry"
                     (fun i _ ->
                       let k = Read.element_value i "OuterKey" Fun.id () in
                       let v =
                         Read.sequence i "value"
                           (fun i _ -> nested_xml_map_with_xml_name_inner_map_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Read.skip_element i);
  ({ nested_xml_map_with_xml_name_map = ( ! ) r_nested_xml_map_with_xml_name_map }
    : nested_xml_map_with_xml_name_response)

let nested_xml_map_with_xml_name_request_of_xml i =
  let r_nested_xml_map_with_xml_name_map = ref None in
  Structure.scanSequence i [ "nestedXmlMapWithXmlNameMap" ] (fun tag _ ->
      match tag with
      | "nestedXmlMapWithXmlNameMap" ->
          r_nested_xml_map_with_xml_name_map :=
            Some
              (Read.sequence i "nestedXmlMapWithXmlNameMap"
                 (fun i _ ->
                   Read.sequences i "entry"
                     (fun i _ ->
                       let k = Read.element_value i "OuterKey" Fun.id () in
                       let v =
                         Read.sequence i "value"
                           (fun i _ -> nested_xml_map_with_xml_name_inner_map_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Read.skip_element i);
  ({ nested_xml_map_with_xml_name_map = ( ! ) r_nested_xml_map_with_xml_name_map }
    : nested_xml_map_with_xml_name_request)

let nested_xml_map_with_xml_name_input_output_of_xml i =
  let r_nested_xml_map_with_xml_name_map = ref None in
  Structure.scanSequence i [ "nestedXmlMapWithXmlNameMap" ] (fun tag _ ->
      match tag with
      | "nestedXmlMapWithXmlNameMap" ->
          r_nested_xml_map_with_xml_name_map :=
            Some
              (Read.sequence i "nestedXmlMapWithXmlNameMap"
                 (fun i _ ->
                   Read.sequences i "entry"
                     (fun i _ ->
                       let k = Read.element_value i "OuterKey" Fun.id () in
                       let v =
                         Read.sequence i "value"
                           (fun i _ -> nested_xml_map_with_xml_name_inner_map_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Read.skip_element i);
  ({ nested_xml_map_with_xml_name_map = ( ! ) r_nested_xml_map_with_xml_name_map }
    : nested_xml_map_with_xml_name_input_output)

let nested_xml_maps_response_of_xml i =
  let r_nested_map = ref None in
  let r_flat_nested_map = ref None in
  Structure.scanSequence i [ "nestedMap"; "flatNestedMap" ] (fun tag _ ->
      match tag with
      | "nestedMap" ->
          r_nested_map :=
            Some
              (Read.sequence i "nestedMap"
                 (fun i _ ->
                   Read.sequences i "entry"
                     (fun i _ ->
                       let k = Read.element_value i "key" Fun.id () in
                       let v =
                         Read.sequence i "value"
                           (fun i _ -> Shared.Xml_deserializers.foo_enum_map_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | "flatNestedMap" ->
          r_flat_nested_map :=
            Some
              (Read.sequences i "flatNestedMap"
                 (fun i _ ->
                   let k = Read.element_value i "key" Fun.id () in
                   let v =
                     Read.sequence i "value"
                       (fun i _ -> Shared.Xml_deserializers.foo_enum_map_of_xml i)
                       ()
                   in
                   (k, v))
                 ())
      | _ -> Read.skip_element i);
  ({ nested_map = ( ! ) r_nested_map; flat_nested_map = ( ! ) r_flat_nested_map }
    : nested_xml_maps_response)

let nested_xml_maps_request_of_xml i =
  let r_nested_map = ref None in
  let r_flat_nested_map = ref None in
  Structure.scanSequence i [ "nestedMap"; "flatNestedMap" ] (fun tag _ ->
      match tag with
      | "nestedMap" ->
          r_nested_map :=
            Some
              (Read.sequence i "nestedMap"
                 (fun i _ ->
                   Read.sequences i "entry"
                     (fun i _ ->
                       let k = Read.element_value i "key" Fun.id () in
                       let v =
                         Read.sequence i "value"
                           (fun i _ -> Shared.Xml_deserializers.foo_enum_map_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | "flatNestedMap" ->
          r_flat_nested_map :=
            Some
              (Read.sequences i "flatNestedMap"
                 (fun i _ ->
                   let k = Read.element_value i "key" Fun.id () in
                   let v =
                     Read.sequence i "value"
                       (fun i _ -> Shared.Xml_deserializers.foo_enum_map_of_xml i)
                       ()
                   in
                   (k, v))
                 ())
      | _ -> Read.skip_element i);
  ({ nested_map = ( ! ) r_nested_map; flat_nested_map = ( ! ) r_flat_nested_map }
    : nested_xml_maps_request)

let nested_xml_maps_input_output_of_xml i =
  let r_nested_map = ref None in
  let r_flat_nested_map = ref None in
  Structure.scanSequence i [ "nestedMap"; "flatNestedMap" ] (fun tag _ ->
      match tag with
      | "nestedMap" ->
          r_nested_map :=
            Some
              (Read.sequence i "nestedMap"
                 (fun i _ ->
                   Read.sequences i "entry"
                     (fun i _ ->
                       let k = Read.element_value i "key" Fun.id () in
                       let v =
                         Read.sequence i "value"
                           (fun i _ -> Shared.Xml_deserializers.foo_enum_map_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | "flatNestedMap" ->
          r_flat_nested_map :=
            Some
              (Read.sequences i "flatNestedMap"
                 (fun i _ ->
                   let k = Read.element_value i "key" Fun.id () in
                   let v =
                     Read.sequence i "value"
                       (fun i _ -> Shared.Xml_deserializers.foo_enum_map_of_xml i)
                       ()
                   in
                   (k, v))
                 ())
      | _ -> Read.skip_element i);
  ({ nested_map = ( ! ) r_nested_map; flat_nested_map = ( ! ) r_flat_nested_map }
    : nested_xml_maps_input_output)

let no_input_and_output_output_of_xml i = ()

let null_and_empty_headers_i_o_of_xml i =
  let r_a = ref None in
  let r_b = ref None in
  let r_c = ref None in
  Structure.scanSequence i [ "a"; "b"; "c" ] (fun tag _ ->
      match tag with
      | "a" -> r_a := Some (Read.element_value i "a" Fun.id ())
      | "b" -> r_b := Some (Read.element_value i "b" Fun.id ())
      | "c" ->
          r_c := Some (Read.sequence i "c" (fun i _ -> Read.elements_value i "member" Fun.id ()) ())
      | _ -> Read.skip_element i);
  ({ a = ( ! ) r_a; b = ( ! ) r_b; c = ( ! ) r_c } : null_and_empty_headers_i_o)

let omits_null_serializes_empty_string_input_of_xml i =
  let r_null_value = ref None in
  let r_empty_string = ref None in
  Structure.scanSequence i [ "nullValue"; "emptyString" ] (fun tag _ ->
      match tag with
      | "nullValue" -> r_null_value := Some (Read.element_value i "nullValue" Fun.id ())
      | "emptyString" -> r_empty_string := Some (Read.element_value i "emptyString" Fun.id ())
      | _ -> Read.skip_element i);
  ({ null_value = ( ! ) r_null_value; empty_string = ( ! ) r_empty_string }
    : omits_null_serializes_empty_string_input)

let put_with_content_encoding_input_of_xml i =
  let r_encoding = ref None in
  let r_data = ref None in
  Structure.scanSequence i [ "encoding"; "data" ] (fun tag _ ->
      match tag with
      | "encoding" -> r_encoding := Some (Read.element_value i "encoding" Fun.id ())
      | "data" -> r_data := Some (Read.element_value i "data" Fun.id ())
      | _ -> Read.skip_element i);
  ({ encoding = ( ! ) r_encoding; data = ( ! ) r_data } : put_with_content_encoding_input)

let query_idempotency_token_auto_fill_input_of_xml i =
  let r_token = ref None in
  Structure.scanSequence i [ "token" ] (fun tag _ ->
      match tag with
      | "token" -> r_token := Some (Read.element_value i "token" Fun.id ())
      | _ -> Read.skip_element i);
  ({ token = ( ! ) r_token } : query_idempotency_token_auto_fill_input)

let query_params_as_string_list_map_input_of_xml i =
  let r_qux = ref None in
  let r_foo = ref None in
  Structure.scanSequence i [ "qux"; "foo" ] (fun tag _ ->
      match tag with
      | "qux" -> r_qux := Some (Read.element_value i "qux" Fun.id ())
      | "foo" ->
          r_foo :=
            Some
              (Read.sequence i "foo"
                 (fun i _ ->
                   Read.sequences i "entry"
                     (fun i _ ->
                       let k = Read.element_value i "key" Fun.id () in
                       let v =
                         Read.sequence i "value"
                           (fun i _ -> Shared.Xml_deserializers.string_list_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Read.skip_element i);
  ({ qux = ( ! ) r_qux; foo = ( ! ) r_foo } : query_params_as_string_list_map_input)

let query_precedence_input_of_xml i =
  let r_foo = ref None in
  let r_baz = ref None in
  Structure.scanSequence i [ "foo"; "baz" ] (fun tag _ ->
      match tag with
      | "foo" -> r_foo := Some (Read.element_value i "foo" Fun.id ())
      | "baz" ->
          r_baz :=
            Some
              (Read.sequence i "baz"
                 (fun i _ ->
                   Read.sequences i "entry"
                     (fun i _ ->
                       let k = Read.element_value i "key" Fun.id () in
                       let v = Read.element_value i "value" Fun.id () in
                       (k, v))
                     ())
                 ())
      | _ -> Read.skip_element i);
  ({ foo = ( ! ) r_foo; baz = ( ! ) r_baz } : query_precedence_input)

let rec recursive_shapes_input_output_nested2_of_xml i =
  let r_bar = ref None in
  let r_recursive_member = ref None in
  Structure.scanSequence i [ "bar"; "recursiveMember" ] (fun tag _ ->
      match tag with
      | "bar" -> r_bar := Some (Read.element_value i "bar" Fun.id ())
      | "recursiveMember" ->
          r_recursive_member :=
            Some
              (Read.sequence i "recursiveMember"
                 (fun i _ -> recursive_shapes_input_output_nested1_of_xml i)
                 ())
      | _ -> Read.skip_element i);
  ({ bar = ( ! ) r_bar; recursive_member = ( ! ) r_recursive_member }
    : recursive_shapes_input_output_nested2)

and recursive_shapes_input_output_nested1_of_xml i =
  let r_foo = ref None in
  let r_nested = ref None in
  Structure.scanSequence i [ "foo"; "nested" ] (fun tag _ ->
      match tag with
      | "foo" -> r_foo := Some (Read.element_value i "foo" Fun.id ())
      | "nested" ->
          r_nested :=
            Some
              (Read.sequence i "nested"
                 (fun i _ -> recursive_shapes_input_output_nested2_of_xml i)
                 ())
      | _ -> Read.skip_element i);
  ({ foo = ( ! ) r_foo; nested = ( ! ) r_nested } : recursive_shapes_input_output_nested1)

let recursive_shapes_response_of_xml i =
  let r_nested = ref None in
  Structure.scanSequence i [ "nested" ] (fun tag _ ->
      match tag with
      | "nested" ->
          r_nested :=
            Some
              (Read.sequence i "nested"
                 (fun i _ -> recursive_shapes_input_output_nested1_of_xml i)
                 ())
      | _ -> Read.skip_element i);
  ({ nested = ( ! ) r_nested } : recursive_shapes_response)

let recursive_shapes_request_of_xml i =
  let r_nested = ref None in
  Structure.scanSequence i [ "nested" ] (fun tag _ ->
      match tag with
      | "nested" ->
          r_nested :=
            Some
              (Read.sequence i "nested"
                 (fun i _ -> recursive_shapes_input_output_nested1_of_xml i)
                 ())
      | _ -> Read.skip_element i);
  ({ nested = ( ! ) r_nested } : recursive_shapes_request)

let renamed_list_members_of_xml i = Read.elements_value i "item" Fun.id ()

let xml_nested_union_struct_of_xml i =
  let r_string_value = ref None in
  let r_boolean_value = ref None in
  let r_byte_value = ref None in
  let r_short_value = ref None in
  let r_integer_value = ref None in
  let r_long_value = ref None in
  let r_float_value = ref None in
  let r_double_value = ref None in
  Structure.scanSequence i
    [
      "stringValue";
      "booleanValue";
      "byteValue";
      "shortValue";
      "integerValue";
      "longValue";
      "floatValue";
      "doubleValue";
    ] (fun tag _ ->
      match tag with
      | "stringValue" -> r_string_value := Some (Read.element_value i "stringValue" Fun.id ())
      | "booleanValue" ->
          r_boolean_value := Some (Read.element_value i "booleanValue" Primitive.bool_of_string ())
      | "byteValue" ->
          r_byte_value := Some (Read.element_value i "byteValue" Primitive.int_of_string ())
      | "shortValue" ->
          r_short_value := Some (Read.element_value i "shortValue" Primitive.int_of_string ())
      | "integerValue" ->
          r_integer_value := Some (Read.element_value i "integerValue" Primitive.int_of_string ())
      | "longValue" ->
          r_long_value := Some (Read.element_value i "longValue" Primitive.long_of_string ())
      | "floatValue" ->
          r_float_value := Some (Read.element_value i "floatValue" Primitive.float_of_string ())
      | "doubleValue" ->
          r_double_value := Some (Read.element_value i "doubleValue" Primitive.double_of_string ())
      | _ -> Read.skip_element i);
  ({
     string_value = ( ! ) r_string_value;
     boolean_value = ( ! ) r_boolean_value;
     byte_value = ( ! ) r_byte_value;
     short_value = ( ! ) r_short_value;
     integer_value = ( ! ) r_integer_value;
     long_value = ( ! ) r_long_value;
     float_value = ( ! ) r_float_value;
     double_value = ( ! ) r_double_value;
   }
    : xml_nested_union_struct)

let rec xml_union_shape_of_xml i =
  let r_string_value = ref None in
  let r_boolean_value = ref None in
  let r_byte_value = ref None in
  let r_short_value = ref None in
  let r_integer_value = ref None in
  let r_long_value = ref None in
  let r_float_value = ref None in
  let r_double_value = ref None in
  let r_union_value = ref None in
  let r_struct_value = ref None in
  Structure.scanSequence i
    [
      "stringValue";
      "booleanValue";
      "byteValue";
      "shortValue";
      "integerValue";
      "longValue";
      "floatValue";
      "doubleValue";
      "unionValue";
      "structValue";
    ] (fun tag _ ->
      match tag with
      | "stringValue" -> r_string_value := Some (Read.element_value i "stringValue" Fun.id ())
      | "booleanValue" ->
          r_boolean_value := Some (Read.element_value i "booleanValue" Primitive.bool_of_string ())
      | "byteValue" ->
          r_byte_value := Some (Read.element_value i "byteValue" Primitive.int_of_string ())
      | "shortValue" ->
          r_short_value := Some (Read.element_value i "shortValue" Primitive.int_of_string ())
      | "integerValue" ->
          r_integer_value := Some (Read.element_value i "integerValue" Primitive.int_of_string ())
      | "longValue" ->
          r_long_value := Some (Read.element_value i "longValue" Primitive.long_of_string ())
      | "floatValue" ->
          r_float_value := Some (Read.element_value i "floatValue" Primitive.float_of_string ())
      | "doubleValue" ->
          r_double_value := Some (Read.element_value i "doubleValue" Primitive.double_of_string ())
      | "unionValue" ->
          r_union_value :=
            Some (Read.sequence i "unionValue" (fun i _ -> xml_union_shape_of_xml i) ())
      | "structValue" ->
          r_struct_value :=
            Some (Read.sequence i "structValue" (fun i _ -> xml_nested_union_struct_of_xml i) ())
      | _ -> Read.skip_element i);
  (match ( ! ) r_string_value with
   | Some v -> StringValue v
   | None -> (
       match ( ! ) r_boolean_value with
       | Some v -> BooleanValue v
       | None -> (
           match ( ! ) r_byte_value with
           | Some v -> ByteValue v
           | None -> (
               match ( ! ) r_short_value with
               | Some v -> ShortValue v
               | None -> (
                   match ( ! ) r_integer_value with
                   | Some v -> IntegerValue v
                   | None -> (
                       match ( ! ) r_long_value with
                       | Some v -> LongValue v
                       | None -> (
                           match ( ! ) r_float_value with
                           | Some v -> FloatValue v
                           | None -> (
                               match ( ! ) r_double_value with
                               | Some v -> DoubleValue v
                               | None -> (
                                   match ( ! ) r_union_value with
                                   | Some v -> UnionValue v
                                   | None -> (
                                       match ( ! ) r_struct_value with
                                       | Some v -> StructValue v
                                       | None -> failwith "no union member present in xml response")
                                   ))))))))
    : xml_union_shape)

let xml_unions_response_of_xml i =
  let r_union_value = ref None in
  Structure.scanSequence i [ "unionValue" ] (fun tag _ ->
      match tag with
      | "unionValue" ->
          r_union_value :=
            Some (Read.sequence i "unionValue" (fun i _ -> xml_union_shape_of_xml i) ())
      | _ -> Read.skip_element i);
  ({ union_value = ( ! ) r_union_value } : xml_unions_response)

let xml_unions_request_of_xml i =
  let r_union_value = ref None in
  Structure.scanSequence i [ "unionValue" ] (fun tag _ ->
      match tag with
      | "unionValue" ->
          r_union_value :=
            Some (Read.sequence i "unionValue" (fun i _ -> xml_union_shape_of_xml i) ())
      | _ -> Read.skip_element i);
  ({ union_value = ( ! ) r_union_value } : xml_unions_request)

let xml_timestamps_response_of_xml i =
  let r_normal = ref None in
  let r_date_time = ref None in
  let r_date_time_on_target = ref None in
  let r_epoch_seconds = ref None in
  let r_epoch_seconds_on_target = ref None in
  let r_http_date = ref None in
  let r_http_date_on_target = ref None in
  Structure.scanSequence i
    [
      "normal";
      "dateTime";
      "dateTimeOnTarget";
      "epochSeconds";
      "epochSecondsOnTarget";
      "httpDate";
      "httpDateOnTarget";
    ] (fun tag _ ->
      match tag with
      | "normal" ->
          r_normal := Some (Read.element_value i "normal" Primitive.timestamp_iso_of_string ())
      | "dateTime" ->
          r_date_time := Some (Read.element_value i "dateTime" Primitive.timestamp_iso_of_string ())
      | "dateTimeOnTarget" ->
          r_date_time_on_target :=
            Some
              (Read.sequence i "dateTimeOnTarget"
                 (fun i _ -> Shared.Xml_deserializers.date_time_of_xml i)
                 ())
      | "epochSeconds" ->
          r_epoch_seconds :=
            Some (Read.element_value i "epochSeconds" Primitive.timestamp_epoch_of_string ())
      | "epochSecondsOnTarget" ->
          r_epoch_seconds_on_target :=
            Some
              (Read.sequence i "epochSecondsOnTarget"
                 (fun i _ -> Shared.Xml_deserializers.epoch_seconds_of_xml i)
                 ())
      | "httpDate" ->
          r_http_date :=
            Some (Read.element_value i "httpDate" Primitive.timestamp_httpdate_of_string ())
      | "httpDateOnTarget" ->
          r_http_date_on_target :=
            Some
              (Read.sequence i "httpDateOnTarget"
                 (fun i _ -> Shared.Xml_deserializers.http_date_of_xml i)
                 ())
      | _ -> Read.skip_element i);
  ({
     normal = ( ! ) r_normal;
     date_time = ( ! ) r_date_time;
     date_time_on_target = ( ! ) r_date_time_on_target;
     epoch_seconds = ( ! ) r_epoch_seconds;
     epoch_seconds_on_target = ( ! ) r_epoch_seconds_on_target;
     http_date = ( ! ) r_http_date;
     http_date_on_target = ( ! ) r_http_date_on_target;
   }
    : xml_timestamps_response)

let xml_timestamps_request_of_xml i =
  let r_normal = ref None in
  let r_date_time = ref None in
  let r_date_time_on_target = ref None in
  let r_epoch_seconds = ref None in
  let r_epoch_seconds_on_target = ref None in
  let r_http_date = ref None in
  let r_http_date_on_target = ref None in
  Structure.scanSequence i
    [
      "normal";
      "dateTime";
      "dateTimeOnTarget";
      "epochSeconds";
      "epochSecondsOnTarget";
      "httpDate";
      "httpDateOnTarget";
    ] (fun tag _ ->
      match tag with
      | "normal" ->
          r_normal := Some (Read.element_value i "normal" Primitive.timestamp_iso_of_string ())
      | "dateTime" ->
          r_date_time := Some (Read.element_value i "dateTime" Primitive.timestamp_iso_of_string ())
      | "dateTimeOnTarget" ->
          r_date_time_on_target :=
            Some
              (Read.sequence i "dateTimeOnTarget"
                 (fun i _ -> Shared.Xml_deserializers.date_time_of_xml i)
                 ())
      | "epochSeconds" ->
          r_epoch_seconds :=
            Some (Read.element_value i "epochSeconds" Primitive.timestamp_epoch_of_string ())
      | "epochSecondsOnTarget" ->
          r_epoch_seconds_on_target :=
            Some
              (Read.sequence i "epochSecondsOnTarget"
                 (fun i _ -> Shared.Xml_deserializers.epoch_seconds_of_xml i)
                 ())
      | "httpDate" ->
          r_http_date :=
            Some (Read.element_value i "httpDate" Primitive.timestamp_httpdate_of_string ())
      | "httpDateOnTarget" ->
          r_http_date_on_target :=
            Some
              (Read.sequence i "httpDateOnTarget"
                 (fun i _ -> Shared.Xml_deserializers.http_date_of_xml i)
                 ())
      | _ -> Read.skip_element i);
  ({
     normal = ( ! ) r_normal;
     date_time = ( ! ) r_date_time;
     date_time_on_target = ( ! ) r_date_time_on_target;
     epoch_seconds = ( ! ) r_epoch_seconds;
     epoch_seconds_on_target = ( ! ) r_epoch_seconds_on_target;
     http_date = ( ! ) r_http_date;
     http_date_on_target = ( ! ) r_http_date_on_target;
   }
    : xml_timestamps_request)

let xml_namespaced_list_of_xml i = Read.elements_value i "member" Fun.id ()

let xml_namespace_nested_of_xml i =
  let r_foo = ref None in
  let r_values = ref None in
  Structure.scanSequence i [ "foo"; "values" ] (fun tag _ ->
      match tag with
      | "foo" -> r_foo := Some (Read.element_value i "foo" Fun.id ())
      | "values" ->
          r_values :=
            Some (Read.sequence i "values" (fun i _ -> Read.elements_value i "member" Fun.id ()) ())
      | _ -> Read.skip_element i);
  ({ foo = ( ! ) r_foo; values = ( ! ) r_values } : xml_namespace_nested)

let xml_namespaces_response_of_xml i =
  let r_nested = ref None in
  Structure.scanSequence i [ "nested" ] (fun tag _ ->
      match tag with
      | "nested" ->
          r_nested := Some (Read.sequence i "nested" (fun i _ -> xml_namespace_nested_of_xml i) ())
      | _ -> Read.skip_element i);
  ({ nested = ( ! ) r_nested } : xml_namespaces_response)

let xml_namespaces_request_of_xml i =
  let r_nested = ref None in
  Structure.scanSequence i [ "nested" ] (fun tag _ ->
      match tag with
      | "nested" ->
          r_nested := Some (Read.sequence i "nested" (fun i _ -> xml_namespace_nested_of_xml i) ())
      | _ -> Read.skip_element i);
  ({ nested = ( ! ) r_nested } : xml_namespaces_request)

let xml_map_with_xml_namespace_input_output_map_of_xml i =
  Read.sequences i "entry"
    (fun i _ ->
      let k = Read.element_value i "K" Fun.id () in
      let v = Read.element_value i "V" Fun.id () in
      (k, v))
    ()

let xml_map_with_xml_namespace_response_of_xml i =
  let r_my_map = ref None in
  Structure.scanSequence i [ "KVP" ] (fun tag _ ->
      match tag with
      | "KVP" ->
          r_my_map :=
            Some
              (Read.sequence i "KVP"
                 (fun i _ ->
                   Read.sequences i "entry"
                     (fun i _ ->
                       let k = Read.element_value i "K" Fun.id () in
                       let v = Read.element_value i "V" Fun.id () in
                       (k, v))
                     ())
                 ())
      | _ -> Read.skip_element i);
  ({ my_map = ( ! ) r_my_map } : xml_map_with_xml_namespace_response)

let xml_map_with_xml_namespace_request_of_xml i =
  let r_my_map = ref None in
  Structure.scanSequence i [ "KVP" ] (fun tag _ ->
      match tag with
      | "KVP" ->
          r_my_map :=
            Some
              (Read.sequence i "KVP"
                 (fun i _ ->
                   Read.sequences i "entry"
                     (fun i _ ->
                       let k = Read.element_value i "K" Fun.id () in
                       let v = Read.element_value i "V" Fun.id () in
                       (k, v))
                     ())
                 ())
      | _ -> Read.skip_element i);
  ({ my_map = ( ! ) r_my_map } : xml_map_with_xml_namespace_request)

let xml_maps_xml_name_input_output_map_of_xml i =
  Read.sequences i "entry"
    (fun i _ ->
      let k = Read.element_value i "Attribute" Fun.id () in
      let v =
        Read.sequence i "Setting" (fun i _ -> Shared.Xml_deserializers.greeting_struct_of_xml i) ()
      in
      (k, v))
    ()

let xml_maps_xml_name_response_of_xml i =
  let r_my_map = ref None in
  Structure.scanSequence i [ "myMap" ] (fun tag _ ->
      match tag with
      | "myMap" ->
          r_my_map :=
            Some
              (Read.sequence i "myMap"
                 (fun i _ ->
                   Read.sequences i "entry"
                     (fun i _ ->
                       let k = Read.element_value i "Attribute" Fun.id () in
                       let v =
                         Read.sequence i "Setting"
                           (fun i _ -> Shared.Xml_deserializers.greeting_struct_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Read.skip_element i);
  ({ my_map = ( ! ) r_my_map } : xml_maps_xml_name_response)

let xml_maps_xml_name_request_of_xml i =
  let r_my_map = ref None in
  Structure.scanSequence i [ "myMap" ] (fun tag _ ->
      match tag with
      | "myMap" ->
          r_my_map :=
            Some
              (Read.sequence i "myMap"
                 (fun i _ ->
                   Read.sequences i "entry"
                     (fun i _ ->
                       let k = Read.element_value i "Attribute" Fun.id () in
                       let v =
                         Read.sequence i "Setting"
                           (fun i _ -> Shared.Xml_deserializers.greeting_struct_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Read.skip_element i);
  ({ my_map = ( ! ) r_my_map } : xml_maps_xml_name_request)

let xml_maps_input_output_map_of_xml i =
  Read.sequences i "entry"
    (fun i _ ->
      let k = Read.element_value i "key" Fun.id () in
      let v =
        Read.sequence i "value" (fun i _ -> Shared.Xml_deserializers.greeting_struct_of_xml i) ()
      in
      (k, v))
    ()

let xml_maps_response_of_xml i =
  let r_my_map = ref None in
  Structure.scanSequence i [ "myMap" ] (fun tag _ ->
      match tag with
      | "myMap" ->
          r_my_map :=
            Some
              (Read.sequence i "myMap"
                 (fun i _ ->
                   Read.sequences i "entry"
                     (fun i _ ->
                       let k = Read.element_value i "key" Fun.id () in
                       let v =
                         Read.sequence i "value"
                           (fun i _ -> Shared.Xml_deserializers.greeting_struct_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Read.skip_element i);
  ({ my_map = ( ! ) r_my_map } : xml_maps_response)

let xml_maps_request_of_xml i =
  let r_my_map = ref None in
  Structure.scanSequence i [ "myMap" ] (fun tag _ ->
      match tag with
      | "myMap" ->
          r_my_map :=
            Some
              (Read.sequence i "myMap"
                 (fun i _ ->
                   Read.sequences i "entry"
                     (fun i _ ->
                       let k = Read.element_value i "key" Fun.id () in
                       let v =
                         Read.sequence i "value"
                           (fun i _ -> Shared.Xml_deserializers.greeting_struct_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Read.skip_element i);
  ({ my_map = ( ! ) r_my_map } : xml_maps_request)

let structure_list_member_of_xml i =
  let r_a = ref None in
  let r_b = ref None in
  Structure.scanSequence i [ "value"; "other" ] (fun tag _ ->
      match tag with
      | "value" -> r_a := Some (Read.element_value i "value" Fun.id ())
      | "other" -> r_b := Some (Read.element_value i "other" Fun.id ())
      | _ -> Read.skip_element i);
  ({ a = ( ! ) r_a; b = ( ! ) r_b } : structure_list_member)

let structure_list_of_xml i = Read.sequences i "item" (fun i _ -> structure_list_member_of_xml i) ()

let xml_lists_response_of_xml i =
  let r_string_list = ref None in
  let r_string_set = ref None in
  let r_integer_list = ref None in
  let r_boolean_list = ref None in
  let r_timestamp_list = ref None in
  let r_enum_list = ref None in
  let r_int_enum_list = ref None in
  let r_nested_string_list = ref None in
  let r_renamed_list_members = ref None in
  let r_flattened_list = ref None in
  let r_flattened_list2 = ref None in
  let r_flattened_list_with_member_namespace = ref None in
  let r_flattened_list_with_namespace = ref None in
  let r_structure_list = ref None in
  let r_flattened_structure_list = ref None in
  Structure.scanSequence i
    [
      "stringList";
      "stringSet";
      "integerList";
      "booleanList";
      "timestampList";
      "enumList";
      "intEnumList";
      "nestedStringList";
      "renamed";
      "flattenedList";
      "customName";
      "flattenedListWithMemberNamespace";
      "flattenedListWithNamespace";
      "myStructureList";
      "flattenedStructureList";
    ] (fun tag _ ->
      match tag with
      | "stringList" ->
          r_string_list :=
            Some
              (Read.sequence i "stringList"
                 (fun i _ -> Read.elements_value i "member" Fun.id ())
                 ())
      | "stringSet" ->
          r_string_set :=
            Some
              (Read.sequence i "stringSet" (fun i _ -> Read.elements_value i "member" Fun.id ()) ())
      | "integerList" ->
          r_integer_list :=
            Some
              (Read.sequence i "integerList"
                 (fun i _ -> Read.elements_value i "member" Primitive.int_of_string ())
                 ())
      | "booleanList" ->
          r_boolean_list :=
            Some
              (Read.sequence i "booleanList"
                 (fun i _ -> Read.elements_value i "member" Primitive.bool_of_string ())
                 ())
      | "timestampList" ->
          r_timestamp_list :=
            Some
              (Read.sequence i "timestampList"
                 (fun i _ -> Read.elements_value i "member" Primitive.timestamp_iso_of_string ())
                 ())
      | "enumList" ->
          r_enum_list :=
            Some
              (Read.sequence i "enumList"
                 (fun i _ ->
                   Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                     ())
                 ())
      | "intEnumList" ->
          r_int_enum_list :=
            Some
              (Read.sequence i "intEnumList"
                 (fun i _ ->
                   Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                     ())
                 ())
      | "nestedStringList" ->
          r_nested_string_list :=
            Some
              (Read.sequence i "nestedStringList"
                 (fun i _ ->
                   Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.string_list_of_xml i)
                     ())
                 ())
      | "renamed" ->
          r_renamed_list_members :=
            Some (Read.sequence i "renamed" (fun i _ -> Read.elements_value i "item" Fun.id ()) ())
      | "flattenedList" ->
          r_flattened_list := Some (Read.elements_value i "flattenedList" Fun.id ())
      | "customName" -> r_flattened_list2 := Some (Read.elements_value i "customName" Fun.id ())
      | "flattenedListWithMemberNamespace" ->
          r_flattened_list_with_member_namespace :=
            Some (Read.elements_value i "flattenedListWithMemberNamespace" Fun.id ())
      | "flattenedListWithNamespace" ->
          r_flattened_list_with_namespace :=
            Some (Read.elements_value i "flattenedListWithNamespace" Fun.id ())
      | "myStructureList" ->
          r_structure_list :=
            Some
              (Read.sequence i "myStructureList"
                 (fun i _ -> Read.sequences i "item" (fun i _ -> structure_list_member_of_xml i) ())
                 ())
      | "flattenedStructureList" ->
          r_flattened_structure_list :=
            Some
              (Read.sequences i "flattenedStructureList"
                 (fun i _ -> structure_list_member_of_xml i)
                 ())
      | _ -> Read.skip_element i);
  ({
     string_list = ( ! ) r_string_list;
     string_set = ( ! ) r_string_set;
     integer_list = ( ! ) r_integer_list;
     boolean_list = ( ! ) r_boolean_list;
     timestamp_list = ( ! ) r_timestamp_list;
     enum_list = ( ! ) r_enum_list;
     int_enum_list = ( ! ) r_int_enum_list;
     nested_string_list = ( ! ) r_nested_string_list;
     renamed_list_members = ( ! ) r_renamed_list_members;
     flattened_list = ( ! ) r_flattened_list;
     flattened_list2 = ( ! ) r_flattened_list2;
     flattened_list_with_member_namespace = ( ! ) r_flattened_list_with_member_namespace;
     flattened_list_with_namespace = ( ! ) r_flattened_list_with_namespace;
     structure_list = ( ! ) r_structure_list;
     flattened_structure_list = ( ! ) r_flattened_structure_list;
   }
    : xml_lists_response)

let xml_lists_request_of_xml i =
  let r_string_list = ref None in
  let r_string_set = ref None in
  let r_integer_list = ref None in
  let r_boolean_list = ref None in
  let r_timestamp_list = ref None in
  let r_enum_list = ref None in
  let r_int_enum_list = ref None in
  let r_nested_string_list = ref None in
  let r_renamed_list_members = ref None in
  let r_flattened_list = ref None in
  let r_flattened_list2 = ref None in
  let r_flattened_list_with_member_namespace = ref None in
  let r_flattened_list_with_namespace = ref None in
  let r_structure_list = ref None in
  let r_flattened_structure_list = ref None in
  Structure.scanSequence i
    [
      "stringList";
      "stringSet";
      "integerList";
      "booleanList";
      "timestampList";
      "enumList";
      "intEnumList";
      "nestedStringList";
      "renamed";
      "flattenedList";
      "customName";
      "flattenedListWithMemberNamespace";
      "flattenedListWithNamespace";
      "myStructureList";
      "flattenedStructureList";
    ] (fun tag _ ->
      match tag with
      | "stringList" ->
          r_string_list :=
            Some
              (Read.sequence i "stringList"
                 (fun i _ -> Read.elements_value i "member" Fun.id ())
                 ())
      | "stringSet" ->
          r_string_set :=
            Some
              (Read.sequence i "stringSet" (fun i _ -> Read.elements_value i "member" Fun.id ()) ())
      | "integerList" ->
          r_integer_list :=
            Some
              (Read.sequence i "integerList"
                 (fun i _ -> Read.elements_value i "member" Primitive.int_of_string ())
                 ())
      | "booleanList" ->
          r_boolean_list :=
            Some
              (Read.sequence i "booleanList"
                 (fun i _ -> Read.elements_value i "member" Primitive.bool_of_string ())
                 ())
      | "timestampList" ->
          r_timestamp_list :=
            Some
              (Read.sequence i "timestampList"
                 (fun i _ -> Read.elements_value i "member" Primitive.timestamp_iso_of_string ())
                 ())
      | "enumList" ->
          r_enum_list :=
            Some
              (Read.sequence i "enumList"
                 (fun i _ ->
                   Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                     ())
                 ())
      | "intEnumList" ->
          r_int_enum_list :=
            Some
              (Read.sequence i "intEnumList"
                 (fun i _ ->
                   Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                     ())
                 ())
      | "nestedStringList" ->
          r_nested_string_list :=
            Some
              (Read.sequence i "nestedStringList"
                 (fun i _ ->
                   Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.string_list_of_xml i)
                     ())
                 ())
      | "renamed" ->
          r_renamed_list_members :=
            Some (Read.sequence i "renamed" (fun i _ -> Read.elements_value i "item" Fun.id ()) ())
      | "flattenedList" ->
          r_flattened_list := Some (Read.elements_value i "flattenedList" Fun.id ())
      | "customName" -> r_flattened_list2 := Some (Read.elements_value i "customName" Fun.id ())
      | "flattenedListWithMemberNamespace" ->
          r_flattened_list_with_member_namespace :=
            Some (Read.elements_value i "flattenedListWithMemberNamespace" Fun.id ())
      | "flattenedListWithNamespace" ->
          r_flattened_list_with_namespace :=
            Some (Read.elements_value i "flattenedListWithNamespace" Fun.id ())
      | "myStructureList" ->
          r_structure_list :=
            Some
              (Read.sequence i "myStructureList"
                 (fun i _ -> Read.sequences i "item" (fun i _ -> structure_list_member_of_xml i) ())
                 ())
      | "flattenedStructureList" ->
          r_flattened_structure_list :=
            Some
              (Read.sequences i "flattenedStructureList"
                 (fun i _ -> structure_list_member_of_xml i)
                 ())
      | _ -> Read.skip_element i);
  ({
     string_list = ( ! ) r_string_list;
     string_set = ( ! ) r_string_set;
     integer_list = ( ! ) r_integer_list;
     boolean_list = ( ! ) r_boolean_list;
     timestamp_list = ( ! ) r_timestamp_list;
     enum_list = ( ! ) r_enum_list;
     int_enum_list = ( ! ) r_int_enum_list;
     nested_string_list = ( ! ) r_nested_string_list;
     renamed_list_members = ( ! ) r_renamed_list_members;
     flattened_list = ( ! ) r_flattened_list;
     flattened_list2 = ( ! ) r_flattened_list2;
     flattened_list_with_member_namespace = ( ! ) r_flattened_list_with_member_namespace;
     flattened_list_with_namespace = ( ! ) r_flattened_list_with_namespace;
     structure_list = ( ! ) r_structure_list;
     flattened_structure_list = ( ! ) r_flattened_structure_list;
   }
    : xml_lists_request)

let xml_int_enums_response_of_xml i =
  let r_int_enum1 = ref None in
  let r_int_enum2 = ref None in
  let r_int_enum3 = ref None in
  let r_int_enum_list = ref None in
  let r_int_enum_set = ref None in
  let r_int_enum_map = ref None in
  Structure.scanSequence i
    [ "intEnum1"; "intEnum2"; "intEnum3"; "intEnumList"; "intEnumSet"; "intEnumMap" ] (fun tag _ ->
      match tag with
      | "intEnum1" ->
          r_int_enum1 :=
            Some
              (Read.sequence i "intEnum1"
                 (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                 ())
      | "intEnum2" ->
          r_int_enum2 :=
            Some
              (Read.sequence i "intEnum2"
                 (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                 ())
      | "intEnum3" ->
          r_int_enum3 :=
            Some
              (Read.sequence i "intEnum3"
                 (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                 ())
      | "intEnumList" ->
          r_int_enum_list :=
            Some
              (Read.sequence i "intEnumList"
                 (fun i _ ->
                   Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                     ())
                 ())
      | "intEnumSet" ->
          r_int_enum_set :=
            Some
              (Read.sequence i "intEnumSet"
                 (fun i _ ->
                   Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                     ())
                 ())
      | "intEnumMap" ->
          r_int_enum_map :=
            Some
              (Read.sequence i "intEnumMap"
                 (fun i _ ->
                   Read.sequences i "entry"
                     (fun i _ ->
                       let k = Read.element_value i "key" Fun.id () in
                       let v =
                         Read.sequence i "value"
                           (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Read.skip_element i);
  ({
     int_enum1 = ( ! ) r_int_enum1;
     int_enum2 = ( ! ) r_int_enum2;
     int_enum3 = ( ! ) r_int_enum3;
     int_enum_list = ( ! ) r_int_enum_list;
     int_enum_set = ( ! ) r_int_enum_set;
     int_enum_map = ( ! ) r_int_enum_map;
   }
    : xml_int_enums_response)

let xml_int_enums_request_of_xml i =
  let r_int_enum1 = ref None in
  let r_int_enum2 = ref None in
  let r_int_enum3 = ref None in
  let r_int_enum_list = ref None in
  let r_int_enum_set = ref None in
  let r_int_enum_map = ref None in
  Structure.scanSequence i
    [ "intEnum1"; "intEnum2"; "intEnum3"; "intEnumList"; "intEnumSet"; "intEnumMap" ] (fun tag _ ->
      match tag with
      | "intEnum1" ->
          r_int_enum1 :=
            Some
              (Read.sequence i "intEnum1"
                 (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                 ())
      | "intEnum2" ->
          r_int_enum2 :=
            Some
              (Read.sequence i "intEnum2"
                 (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                 ())
      | "intEnum3" ->
          r_int_enum3 :=
            Some
              (Read.sequence i "intEnum3"
                 (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                 ())
      | "intEnumList" ->
          r_int_enum_list :=
            Some
              (Read.sequence i "intEnumList"
                 (fun i _ ->
                   Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                     ())
                 ())
      | "intEnumSet" ->
          r_int_enum_set :=
            Some
              (Read.sequence i "intEnumSet"
                 (fun i _ ->
                   Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                     ())
                 ())
      | "intEnumMap" ->
          r_int_enum_map :=
            Some
              (Read.sequence i "intEnumMap"
                 (fun i _ ->
                   Read.sequences i "entry"
                     (fun i _ ->
                       let k = Read.element_value i "key" Fun.id () in
                       let v =
                         Read.sequence i "value"
                           (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Read.skip_element i);
  ({
     int_enum1 = ( ! ) r_int_enum1;
     int_enum2 = ( ! ) r_int_enum2;
     int_enum3 = ( ! ) r_int_enum3;
     int_enum_list = ( ! ) r_int_enum_list;
     int_enum_set = ( ! ) r_int_enum_set;
     int_enum_map = ( ! ) r_int_enum_map;
   }
    : xml_int_enums_request)

let xml_enums_response_of_xml i =
  let r_foo_enum1 = ref None in
  let r_foo_enum2 = ref None in
  let r_foo_enum3 = ref None in
  let r_foo_enum_list = ref None in
  let r_foo_enum_set = ref None in
  let r_foo_enum_map = ref None in
  Structure.scanSequence i
    [ "fooEnum1"; "fooEnum2"; "fooEnum3"; "fooEnumList"; "fooEnumSet"; "fooEnumMap" ] (fun tag _ ->
      match tag with
      | "fooEnum1" ->
          r_foo_enum1 :=
            Some
              (Read.sequence i "fooEnum1"
                 (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                 ())
      | "fooEnum2" ->
          r_foo_enum2 :=
            Some
              (Read.sequence i "fooEnum2"
                 (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                 ())
      | "fooEnum3" ->
          r_foo_enum3 :=
            Some
              (Read.sequence i "fooEnum3"
                 (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                 ())
      | "fooEnumList" ->
          r_foo_enum_list :=
            Some
              (Read.sequence i "fooEnumList"
                 (fun i _ ->
                   Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                     ())
                 ())
      | "fooEnumSet" ->
          r_foo_enum_set :=
            Some
              (Read.sequence i "fooEnumSet"
                 (fun i _ ->
                   Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                     ())
                 ())
      | "fooEnumMap" ->
          r_foo_enum_map :=
            Some
              (Read.sequence i "fooEnumMap"
                 (fun i _ ->
                   Read.sequences i "entry"
                     (fun i _ ->
                       let k = Read.element_value i "key" Fun.id () in
                       let v =
                         Read.sequence i "value"
                           (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Read.skip_element i);
  ({
     foo_enum1 = ( ! ) r_foo_enum1;
     foo_enum2 = ( ! ) r_foo_enum2;
     foo_enum3 = ( ! ) r_foo_enum3;
     foo_enum_list = ( ! ) r_foo_enum_list;
     foo_enum_set = ( ! ) r_foo_enum_set;
     foo_enum_map = ( ! ) r_foo_enum_map;
   }
    : xml_enums_response)

let xml_enums_request_of_xml i =
  let r_foo_enum1 = ref None in
  let r_foo_enum2 = ref None in
  let r_foo_enum3 = ref None in
  let r_foo_enum_list = ref None in
  let r_foo_enum_set = ref None in
  let r_foo_enum_map = ref None in
  Structure.scanSequence i
    [ "fooEnum1"; "fooEnum2"; "fooEnum3"; "fooEnumList"; "fooEnumSet"; "fooEnumMap" ] (fun tag _ ->
      match tag with
      | "fooEnum1" ->
          r_foo_enum1 :=
            Some
              (Read.sequence i "fooEnum1"
                 (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                 ())
      | "fooEnum2" ->
          r_foo_enum2 :=
            Some
              (Read.sequence i "fooEnum2"
                 (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                 ())
      | "fooEnum3" ->
          r_foo_enum3 :=
            Some
              (Read.sequence i "fooEnum3"
                 (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                 ())
      | "fooEnumList" ->
          r_foo_enum_list :=
            Some
              (Read.sequence i "fooEnumList"
                 (fun i _ ->
                   Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                     ())
                 ())
      | "fooEnumSet" ->
          r_foo_enum_set :=
            Some
              (Read.sequence i "fooEnumSet"
                 (fun i _ ->
                   Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                     ())
                 ())
      | "fooEnumMap" ->
          r_foo_enum_map :=
            Some
              (Read.sequence i "fooEnumMap"
                 (fun i _ ->
                   Read.sequences i "entry"
                     (fun i _ ->
                       let k = Read.element_value i "key" Fun.id () in
                       let v =
                         Read.sequence i "value"
                           (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Read.skip_element i);
  ({
     foo_enum1 = ( ! ) r_foo_enum1;
     foo_enum2 = ( ! ) r_foo_enum2;
     foo_enum3 = ( ! ) r_foo_enum3;
     foo_enum_list = ( ! ) r_foo_enum_list;
     foo_enum_set = ( ! ) r_foo_enum_set;
     foo_enum_map = ( ! ) r_foo_enum_map;
   }
    : xml_enums_request)

let xml_empty_strings_response_of_xml i =
  let r_empty_string = ref None in
  Structure.scanSequence i [ "emptyString" ] (fun tag _ ->
      match tag with
      | "emptyString" -> r_empty_string := Some (Read.element_value i "emptyString" Fun.id ())
      | _ -> Read.skip_element i);
  ({ empty_string = ( ! ) r_empty_string } : xml_empty_strings_response)

let xml_empty_strings_request_of_xml i =
  let r_empty_string = ref None in
  Structure.scanSequence i [ "emptyString" ] (fun tag _ ->
      match tag with
      | "emptyString" -> r_empty_string := Some (Read.element_value i "emptyString" Fun.id ())
      | _ -> Read.skip_element i);
  ({ empty_string = ( ! ) r_empty_string } : xml_empty_strings_request)

let xml_empty_maps_response_of_xml i =
  let r_my_map = ref None in
  Structure.scanSequence i [ "myMap" ] (fun tag _ ->
      match tag with
      | "myMap" ->
          r_my_map :=
            Some
              (Read.sequence i "myMap"
                 (fun i _ ->
                   Read.sequences i "entry"
                     (fun i _ ->
                       let k = Read.element_value i "key" Fun.id () in
                       let v =
                         Read.sequence i "value"
                           (fun i _ -> Shared.Xml_deserializers.greeting_struct_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Read.skip_element i);
  ({ my_map = ( ! ) r_my_map } : xml_empty_maps_response)

let xml_empty_maps_request_of_xml i =
  let r_my_map = ref None in
  Structure.scanSequence i [ "myMap" ] (fun tag _ ->
      match tag with
      | "myMap" ->
          r_my_map :=
            Some
              (Read.sequence i "myMap"
                 (fun i _ ->
                   Read.sequences i "entry"
                     (fun i _ ->
                       let k = Read.element_value i "key" Fun.id () in
                       let v =
                         Read.sequence i "value"
                           (fun i _ -> Shared.Xml_deserializers.greeting_struct_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Read.skip_element i);
  ({ my_map = ( ! ) r_my_map } : xml_empty_maps_request)

let xml_empty_lists_response_of_xml i =
  let r_string_list = ref None in
  let r_string_set = ref None in
  let r_integer_list = ref None in
  let r_boolean_list = ref None in
  let r_timestamp_list = ref None in
  let r_enum_list = ref None in
  let r_int_enum_list = ref None in
  let r_nested_string_list = ref None in
  let r_renamed_list_members = ref None in
  let r_flattened_list = ref None in
  let r_flattened_list2 = ref None in
  let r_flattened_list_with_member_namespace = ref None in
  let r_flattened_list_with_namespace = ref None in
  let r_structure_list = ref None in
  let r_flattened_structure_list = ref None in
  Structure.scanSequence i
    [
      "stringList";
      "stringSet";
      "integerList";
      "booleanList";
      "timestampList";
      "enumList";
      "intEnumList";
      "nestedStringList";
      "renamed";
      "flattenedList";
      "customName";
      "flattenedListWithMemberNamespace";
      "flattenedListWithNamespace";
      "myStructureList";
      "flattenedStructureList";
    ] (fun tag _ ->
      match tag with
      | "stringList" ->
          r_string_list :=
            Some
              (Read.sequence i "stringList"
                 (fun i _ -> Read.elements_value i "member" Fun.id ())
                 ())
      | "stringSet" ->
          r_string_set :=
            Some
              (Read.sequence i "stringSet" (fun i _ -> Read.elements_value i "member" Fun.id ()) ())
      | "integerList" ->
          r_integer_list :=
            Some
              (Read.sequence i "integerList"
                 (fun i _ -> Read.elements_value i "member" Primitive.int_of_string ())
                 ())
      | "booleanList" ->
          r_boolean_list :=
            Some
              (Read.sequence i "booleanList"
                 (fun i _ -> Read.elements_value i "member" Primitive.bool_of_string ())
                 ())
      | "timestampList" ->
          r_timestamp_list :=
            Some
              (Read.sequence i "timestampList"
                 (fun i _ -> Read.elements_value i "member" Primitive.timestamp_iso_of_string ())
                 ())
      | "enumList" ->
          r_enum_list :=
            Some
              (Read.sequence i "enumList"
                 (fun i _ ->
                   Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                     ())
                 ())
      | "intEnumList" ->
          r_int_enum_list :=
            Some
              (Read.sequence i "intEnumList"
                 (fun i _ ->
                   Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                     ())
                 ())
      | "nestedStringList" ->
          r_nested_string_list :=
            Some
              (Read.sequence i "nestedStringList"
                 (fun i _ ->
                   Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.string_list_of_xml i)
                     ())
                 ())
      | "renamed" ->
          r_renamed_list_members :=
            Some (Read.sequence i "renamed" (fun i _ -> Read.elements_value i "item" Fun.id ()) ())
      | "flattenedList" ->
          r_flattened_list := Some (Read.elements_value i "flattenedList" Fun.id ())
      | "customName" -> r_flattened_list2 := Some (Read.elements_value i "customName" Fun.id ())
      | "flattenedListWithMemberNamespace" ->
          r_flattened_list_with_member_namespace :=
            Some (Read.elements_value i "flattenedListWithMemberNamespace" Fun.id ())
      | "flattenedListWithNamespace" ->
          r_flattened_list_with_namespace :=
            Some (Read.elements_value i "flattenedListWithNamespace" Fun.id ())
      | "myStructureList" ->
          r_structure_list :=
            Some
              (Read.sequence i "myStructureList"
                 (fun i _ -> Read.sequences i "item" (fun i _ -> structure_list_member_of_xml i) ())
                 ())
      | "flattenedStructureList" ->
          r_flattened_structure_list :=
            Some
              (Read.sequences i "flattenedStructureList"
                 (fun i _ -> structure_list_member_of_xml i)
                 ())
      | _ -> Read.skip_element i);
  ({
     string_list = ( ! ) r_string_list;
     string_set = ( ! ) r_string_set;
     integer_list = ( ! ) r_integer_list;
     boolean_list = ( ! ) r_boolean_list;
     timestamp_list = ( ! ) r_timestamp_list;
     enum_list = ( ! ) r_enum_list;
     int_enum_list = ( ! ) r_int_enum_list;
     nested_string_list = ( ! ) r_nested_string_list;
     renamed_list_members = ( ! ) r_renamed_list_members;
     flattened_list = ( ! ) r_flattened_list;
     flattened_list2 = ( ! ) r_flattened_list2;
     flattened_list_with_member_namespace = ( ! ) r_flattened_list_with_member_namespace;
     flattened_list_with_namespace = ( ! ) r_flattened_list_with_namespace;
     structure_list = ( ! ) r_structure_list;
     flattened_structure_list = ( ! ) r_flattened_structure_list;
   }
    : xml_empty_lists_response)

let xml_empty_lists_request_of_xml i =
  let r_string_list = ref None in
  let r_string_set = ref None in
  let r_integer_list = ref None in
  let r_boolean_list = ref None in
  let r_timestamp_list = ref None in
  let r_enum_list = ref None in
  let r_int_enum_list = ref None in
  let r_nested_string_list = ref None in
  let r_renamed_list_members = ref None in
  let r_flattened_list = ref None in
  let r_flattened_list2 = ref None in
  let r_flattened_list_with_member_namespace = ref None in
  let r_flattened_list_with_namespace = ref None in
  let r_structure_list = ref None in
  let r_flattened_structure_list = ref None in
  Structure.scanSequence i
    [
      "stringList";
      "stringSet";
      "integerList";
      "booleanList";
      "timestampList";
      "enumList";
      "intEnumList";
      "nestedStringList";
      "renamed";
      "flattenedList";
      "customName";
      "flattenedListWithMemberNamespace";
      "flattenedListWithNamespace";
      "myStructureList";
      "flattenedStructureList";
    ] (fun tag _ ->
      match tag with
      | "stringList" ->
          r_string_list :=
            Some
              (Read.sequence i "stringList"
                 (fun i _ -> Read.elements_value i "member" Fun.id ())
                 ())
      | "stringSet" ->
          r_string_set :=
            Some
              (Read.sequence i "stringSet" (fun i _ -> Read.elements_value i "member" Fun.id ()) ())
      | "integerList" ->
          r_integer_list :=
            Some
              (Read.sequence i "integerList"
                 (fun i _ -> Read.elements_value i "member" Primitive.int_of_string ())
                 ())
      | "booleanList" ->
          r_boolean_list :=
            Some
              (Read.sequence i "booleanList"
                 (fun i _ -> Read.elements_value i "member" Primitive.bool_of_string ())
                 ())
      | "timestampList" ->
          r_timestamp_list :=
            Some
              (Read.sequence i "timestampList"
                 (fun i _ -> Read.elements_value i "member" Primitive.timestamp_iso_of_string ())
                 ())
      | "enumList" ->
          r_enum_list :=
            Some
              (Read.sequence i "enumList"
                 (fun i _ ->
                   Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                     ())
                 ())
      | "intEnumList" ->
          r_int_enum_list :=
            Some
              (Read.sequence i "intEnumList"
                 (fun i _ ->
                   Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                     ())
                 ())
      | "nestedStringList" ->
          r_nested_string_list :=
            Some
              (Read.sequence i "nestedStringList"
                 (fun i _ ->
                   Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.string_list_of_xml i)
                     ())
                 ())
      | "renamed" ->
          r_renamed_list_members :=
            Some (Read.sequence i "renamed" (fun i _ -> Read.elements_value i "item" Fun.id ()) ())
      | "flattenedList" ->
          r_flattened_list := Some (Read.elements_value i "flattenedList" Fun.id ())
      | "customName" -> r_flattened_list2 := Some (Read.elements_value i "customName" Fun.id ())
      | "flattenedListWithMemberNamespace" ->
          r_flattened_list_with_member_namespace :=
            Some (Read.elements_value i "flattenedListWithMemberNamespace" Fun.id ())
      | "flattenedListWithNamespace" ->
          r_flattened_list_with_namespace :=
            Some (Read.elements_value i "flattenedListWithNamespace" Fun.id ())
      | "myStructureList" ->
          r_structure_list :=
            Some
              (Read.sequence i "myStructureList"
                 (fun i _ -> Read.sequences i "item" (fun i _ -> structure_list_member_of_xml i) ())
                 ())
      | "flattenedStructureList" ->
          r_flattened_structure_list :=
            Some
              (Read.sequences i "flattenedStructureList"
                 (fun i _ -> structure_list_member_of_xml i)
                 ())
      | _ -> Read.skip_element i);
  ({
     string_list = ( ! ) r_string_list;
     string_set = ( ! ) r_string_set;
     integer_list = ( ! ) r_integer_list;
     boolean_list = ( ! ) r_boolean_list;
     timestamp_list = ( ! ) r_timestamp_list;
     enum_list = ( ! ) r_enum_list;
     int_enum_list = ( ! ) r_int_enum_list;
     nested_string_list = ( ! ) r_nested_string_list;
     renamed_list_members = ( ! ) r_renamed_list_members;
     flattened_list = ( ! ) r_flattened_list;
     flattened_list2 = ( ! ) r_flattened_list2;
     flattened_list_with_member_namespace = ( ! ) r_flattened_list_with_member_namespace;
     flattened_list_with_namespace = ( ! ) r_flattened_list_with_namespace;
     structure_list = ( ! ) r_structure_list;
     flattened_structure_list = ( ! ) r_flattened_structure_list;
   }
    : xml_empty_lists_request)

let xml_empty_blobs_response_of_xml i =
  let r_data = ref None in
  Structure.scanSequence i [ "data" ] (fun tag _ ->
      match tag with
      | "data" -> r_data := Some (Read.element_value i "data" Primitive.blob_of_string ())
      | _ -> Read.skip_element i);
  ({ data = ( ! ) r_data } : xml_empty_blobs_response)

let xml_empty_blobs_request_of_xml i =
  let r_data = ref None in
  Structure.scanSequence i [ "data" ] (fun tag _ ->
      match tag with
      | "data" -> r_data := Some (Read.element_value i "data" Primitive.blob_of_string ())
      | _ -> Read.skip_element i);
  ({ data = ( ! ) r_data } : xml_empty_blobs_request)

let xml_blobs_response_of_xml i =
  let r_data = ref None in
  Structure.scanSequence i [ "data" ] (fun tag _ ->
      match tag with
      | "data" -> r_data := Some (Read.element_value i "data" Primitive.blob_of_string ())
      | _ -> Read.skip_element i);
  ({ data = ( ! ) r_data } : xml_blobs_response)

let xml_blobs_request_of_xml i =
  let r_data = ref None in
  Structure.scanSequence i [ "data" ] (fun tag _ ->
      match tag with
      | "data" -> r_data := Some (Read.element_value i "data" Primitive.blob_of_string ())
      | _ -> Read.skip_element i);
  ({ data = ( ! ) r_data } : xml_blobs_request)

let xml_attributes_payload_response_of_xml i =
  let r_foo = ref None in
  let r_attr = ref None in
  Structure.scanSequence i [ "foo"; "test" ] (fun tag _ ->
      match tag with
      | "foo" -> r_foo := Some (Read.element_value i "foo" Fun.id ())
      | "test" -> r_attr := Some (Read.element_value i "test" Fun.id ())
      | _ -> Read.skip_element i);
  ({ foo = ( ! ) r_foo; attr = ( ! ) r_attr } : xml_attributes_payload_response)

let xml_attributes_on_payload_response_of_xml i =
  let r_payload = ref None in
  Structure.scanSequence i [ "payload" ] (fun tag _ ->
      match tag with
      | "payload" ->
          r_payload :=
            Some
              (Read.sequence i "payload" (fun i _ -> xml_attributes_payload_response_of_xml i) ())
      | _ -> Read.skip_element i);
  ({ payload = ( ! ) r_payload } : xml_attributes_on_payload_response)

let xml_attributes_payload_request_of_xml i =
  let r_foo = ref None in
  let r_attr = ref None in
  Structure.scanSequence i [ "foo"; "test" ] (fun tag _ ->
      match tag with
      | "foo" -> r_foo := Some (Read.element_value i "foo" Fun.id ())
      | "test" -> r_attr := Some (Read.element_value i "test" Fun.id ())
      | _ -> Read.skip_element i);
  ({ foo = ( ! ) r_foo; attr = ( ! ) r_attr } : xml_attributes_payload_request)

let xml_attributes_on_payload_request_of_xml i =
  let r_payload = ref None in
  Structure.scanSequence i [ "payload" ] (fun tag _ ->
      match tag with
      | "payload" ->
          r_payload :=
            Some (Read.sequence i "payload" (fun i _ -> xml_attributes_payload_request_of_xml i) ())
      | _ -> Read.skip_element i);
  ({ payload = ( ! ) r_payload } : xml_attributes_on_payload_request)

let xml_attributes_in_middle_payload_response_of_xml i =
  let r_foo = ref None in
  let r_attr = ref None in
  let r_baz = ref None in
  Structure.scanSequence i [ "foo"; "test"; "baz" ] (fun tag _ ->
      match tag with
      | "foo" -> r_foo := Some (Read.element_value i "foo" Fun.id ())
      | "test" -> r_attr := Some (Read.element_value i "test" Fun.id ())
      | "baz" -> r_baz := Some (Read.element_value i "baz" Fun.id ())
      | _ -> Read.skip_element i);
  ({ foo = ( ! ) r_foo; attr = ( ! ) r_attr; baz = ( ! ) r_baz }
    : xml_attributes_in_middle_payload_response)

let xml_attributes_in_middle_response_of_xml i =
  let r_payload = ref None in
  Structure.scanSequence i [ "payload" ] (fun tag _ ->
      match tag with
      | "payload" ->
          r_payload :=
            Some
              (Read.sequence i "payload"
                 (fun i _ -> xml_attributes_in_middle_payload_response_of_xml i)
                 ())
      | _ -> Read.skip_element i);
  ({ payload = ( ! ) r_payload } : xml_attributes_in_middle_response)

let xml_attributes_in_middle_payload_request_of_xml i =
  let r_foo = ref None in
  let r_attr = ref None in
  let r_baz = ref None in
  Structure.scanSequence i [ "foo"; "test"; "baz" ] (fun tag _ ->
      match tag with
      | "foo" -> r_foo := Some (Read.element_value i "foo" Fun.id ())
      | "test" -> r_attr := Some (Read.element_value i "test" Fun.id ())
      | "baz" -> r_baz := Some (Read.element_value i "baz" Fun.id ())
      | _ -> Read.skip_element i);
  ({ foo = ( ! ) r_foo; attr = ( ! ) r_attr; baz = ( ! ) r_baz }
    : xml_attributes_in_middle_payload_request)

let xml_attributes_in_middle_request_of_xml i =
  let r_payload = ref None in
  Structure.scanSequence i [ "payload" ] (fun tag _ ->
      match tag with
      | "payload" ->
          r_payload :=
            Some
              (Read.sequence i "payload"
                 (fun i _ -> xml_attributes_in_middle_payload_request_of_xml i)
                 ())
      | _ -> Read.skip_element i);
  ({ payload = ( ! ) r_payload } : xml_attributes_in_middle_request)

let xml_attributes_response_of_xml i =
  let r_foo = ref None in
  let r_attr = ref None in
  Structure.scanSequence i [ "foo"; "test" ] (fun tag _ ->
      match tag with
      | "foo" -> r_foo := Some (Read.element_value i "foo" Fun.id ())
      | "test" -> r_attr := Some (Read.element_value i "test" Fun.id ())
      | _ -> Read.skip_element i);
  ({ foo = ( ! ) r_foo; attr = ( ! ) r_attr } : xml_attributes_response)

let xml_attributes_request_of_xml i =
  let r_foo = ref None in
  let r_attr = ref None in
  Structure.scanSequence i [ "foo"; "test" ] (fun tag _ ->
      match tag with
      | "foo" -> r_foo := Some (Read.element_value i "foo" Fun.id ())
      | "test" -> r_attr := Some (Read.element_value i "test" Fun.id ())
      | _ -> Read.skip_element i);
  ({ foo = ( ! ) r_foo; attr = ( ! ) r_attr } : xml_attributes_request)

let timestamp_format_headers_i_o_of_xml i =
  let r_member_epoch_seconds = ref None in
  let r_member_http_date = ref None in
  let r_member_date_time = ref None in
  let r_default_format = ref None in
  let r_target_epoch_seconds = ref None in
  let r_target_http_date = ref None in
  let r_target_date_time = ref None in
  Structure.scanSequence i
    [
      "memberEpochSeconds";
      "memberHttpDate";
      "memberDateTime";
      "defaultFormat";
      "targetEpochSeconds";
      "targetHttpDate";
      "targetDateTime";
    ] (fun tag _ ->
      match tag with
      | "memberEpochSeconds" ->
          r_member_epoch_seconds :=
            Some (Read.element_value i "memberEpochSeconds" Primitive.timestamp_epoch_of_string ())
      | "memberHttpDate" ->
          r_member_http_date :=
            Some (Read.element_value i "memberHttpDate" Primitive.timestamp_httpdate_of_string ())
      | "memberDateTime" ->
          r_member_date_time :=
            Some (Read.element_value i "memberDateTime" Primitive.timestamp_iso_of_string ())
      | "defaultFormat" ->
          r_default_format :=
            Some (Read.element_value i "defaultFormat" Primitive.timestamp_iso_of_string ())
      | "targetEpochSeconds" ->
          r_target_epoch_seconds :=
            Some
              (Read.sequence i "targetEpochSeconds"
                 (fun i _ -> Shared.Xml_deserializers.epoch_seconds_of_xml i)
                 ())
      | "targetHttpDate" ->
          r_target_http_date :=
            Some
              (Read.sequence i "targetHttpDate"
                 (fun i _ -> Shared.Xml_deserializers.http_date_of_xml i)
                 ())
      | "targetDateTime" ->
          r_target_date_time :=
            Some
              (Read.sequence i "targetDateTime"
                 (fun i _ -> Shared.Xml_deserializers.date_time_of_xml i)
                 ())
      | _ -> Read.skip_element i);
  ({
     member_epoch_seconds = ( ! ) r_member_epoch_seconds;
     member_http_date = ( ! ) r_member_http_date;
     member_date_time = ( ! ) r_member_date_time;
     default_format = ( ! ) r_default_format;
     target_epoch_seconds = ( ! ) r_target_epoch_seconds;
     target_http_date = ( ! ) r_target_http_date;
     target_date_time = ( ! ) r_target_date_time;
   }
    : timestamp_format_headers_i_o)

let simple_scalar_properties_response_of_xml i =
  let r_foo = ref None in
  let r_string_value = ref None in
  let r_true_boolean_value = ref None in
  let r_false_boolean_value = ref None in
  let r_byte_value = ref None in
  let r_short_value = ref None in
  let r_integer_value = ref None in
  let r_long_value = ref None in
  let r_float_value = ref None in
  let r_double_value = ref None in
  Structure.scanSequence i
    [
      "foo";
      "stringValue";
      "trueBooleanValue";
      "falseBooleanValue";
      "byteValue";
      "shortValue";
      "integerValue";
      "longValue";
      "floatValue";
      "DoubleDribble";
    ] (fun tag _ ->
      match tag with
      | "foo" -> r_foo := Some (Read.element_value i "foo" Fun.id ())
      | "stringValue" -> r_string_value := Some (Read.element_value i "stringValue" Fun.id ())
      | "trueBooleanValue" ->
          r_true_boolean_value :=
            Some (Read.element_value i "trueBooleanValue" Primitive.bool_of_string ())
      | "falseBooleanValue" ->
          r_false_boolean_value :=
            Some (Read.element_value i "falseBooleanValue" Primitive.bool_of_string ())
      | "byteValue" ->
          r_byte_value := Some (Read.element_value i "byteValue" Primitive.int_of_string ())
      | "shortValue" ->
          r_short_value := Some (Read.element_value i "shortValue" Primitive.int_of_string ())
      | "integerValue" ->
          r_integer_value := Some (Read.element_value i "integerValue" Primitive.int_of_string ())
      | "longValue" ->
          r_long_value := Some (Read.element_value i "longValue" Primitive.long_of_string ())
      | "floatValue" ->
          r_float_value := Some (Read.element_value i "floatValue" Primitive.float_of_string ())
      | "DoubleDribble" ->
          r_double_value :=
            Some (Read.element_value i "DoubleDribble" Primitive.double_of_string ())
      | _ -> Read.skip_element i);
  ({
     foo = ( ! ) r_foo;
     string_value = ( ! ) r_string_value;
     true_boolean_value = ( ! ) r_true_boolean_value;
     false_boolean_value = ( ! ) r_false_boolean_value;
     byte_value = ( ! ) r_byte_value;
     short_value = ( ! ) r_short_value;
     integer_value = ( ! ) r_integer_value;
     long_value = ( ! ) r_long_value;
     float_value = ( ! ) r_float_value;
     double_value = ( ! ) r_double_value;
   }
    : simple_scalar_properties_response)

let simple_scalar_properties_request_of_xml i =
  let r_foo = ref None in
  let r_string_value = ref None in
  let r_true_boolean_value = ref None in
  let r_false_boolean_value = ref None in
  let r_byte_value = ref None in
  let r_short_value = ref None in
  let r_integer_value = ref None in
  let r_long_value = ref None in
  let r_float_value = ref None in
  let r_double_value = ref None in
  Structure.scanSequence i
    [
      "foo";
      "stringValue";
      "trueBooleanValue";
      "falseBooleanValue";
      "byteValue";
      "shortValue";
      "integerValue";
      "longValue";
      "floatValue";
      "DoubleDribble";
    ] (fun tag _ ->
      match tag with
      | "foo" -> r_foo := Some (Read.element_value i "foo" Fun.id ())
      | "stringValue" -> r_string_value := Some (Read.element_value i "stringValue" Fun.id ())
      | "trueBooleanValue" ->
          r_true_boolean_value :=
            Some (Read.element_value i "trueBooleanValue" Primitive.bool_of_string ())
      | "falseBooleanValue" ->
          r_false_boolean_value :=
            Some (Read.element_value i "falseBooleanValue" Primitive.bool_of_string ())
      | "byteValue" ->
          r_byte_value := Some (Read.element_value i "byteValue" Primitive.int_of_string ())
      | "shortValue" ->
          r_short_value := Some (Read.element_value i "shortValue" Primitive.int_of_string ())
      | "integerValue" ->
          r_integer_value := Some (Read.element_value i "integerValue" Primitive.int_of_string ())
      | "longValue" ->
          r_long_value := Some (Read.element_value i "longValue" Primitive.long_of_string ())
      | "floatValue" ->
          r_float_value := Some (Read.element_value i "floatValue" Primitive.float_of_string ())
      | "DoubleDribble" ->
          r_double_value :=
            Some (Read.element_value i "DoubleDribble" Primitive.double_of_string ())
      | _ -> Read.skip_element i);
  ({
     foo = ( ! ) r_foo;
     string_value = ( ! ) r_string_value;
     true_boolean_value = ( ! ) r_true_boolean_value;
     false_boolean_value = ( ! ) r_false_boolean_value;
     byte_value = ( ! ) r_byte_value;
     short_value = ( ! ) r_short_value;
     integer_value = ( ! ) r_integer_value;
     long_value = ( ! ) r_long_value;
     float_value = ( ! ) r_float_value;
     double_value = ( ! ) r_double_value;
   }
    : simple_scalar_properties_request)

let simple_scalar_properties_input_output_of_xml i =
  let r_foo = ref None in
  let r_string_value = ref None in
  let r_true_boolean_value = ref None in
  let r_false_boolean_value = ref None in
  let r_byte_value = ref None in
  let r_short_value = ref None in
  let r_integer_value = ref None in
  let r_long_value = ref None in
  let r_float_value = ref None in
  let r_double_value = ref None in
  Structure.scanSequence i
    [
      "foo";
      "stringValue";
      "trueBooleanValue";
      "falseBooleanValue";
      "byteValue";
      "shortValue";
      "integerValue";
      "longValue";
      "floatValue";
      "DoubleDribble";
    ] (fun tag _ ->
      match tag with
      | "foo" -> r_foo := Some (Read.element_value i "foo" Fun.id ())
      | "stringValue" -> r_string_value := Some (Read.element_value i "stringValue" Fun.id ())
      | "trueBooleanValue" ->
          r_true_boolean_value :=
            Some (Read.element_value i "trueBooleanValue" Primitive.bool_of_string ())
      | "falseBooleanValue" ->
          r_false_boolean_value :=
            Some (Read.element_value i "falseBooleanValue" Primitive.bool_of_string ())
      | "byteValue" ->
          r_byte_value := Some (Read.element_value i "byteValue" Primitive.int_of_string ())
      | "shortValue" ->
          r_short_value := Some (Read.element_value i "shortValue" Primitive.int_of_string ())
      | "integerValue" ->
          r_integer_value := Some (Read.element_value i "integerValue" Primitive.int_of_string ())
      | "longValue" ->
          r_long_value := Some (Read.element_value i "longValue" Primitive.long_of_string ())
      | "floatValue" ->
          r_float_value := Some (Read.element_value i "floatValue" Primitive.float_of_string ())
      | "DoubleDribble" ->
          r_double_value :=
            Some (Read.element_value i "DoubleDribble" Primitive.double_of_string ())
      | _ -> Read.skip_element i);
  ({
     foo = ( ! ) r_foo;
     string_value = ( ! ) r_string_value;
     true_boolean_value = ( ! ) r_true_boolean_value;
     false_boolean_value = ( ! ) r_false_boolean_value;
     byte_value = ( ! ) r_byte_value;
     short_value = ( ! ) r_short_value;
     integer_value = ( ! ) r_integer_value;
     long_value = ( ! ) r_long_value;
     float_value = ( ! ) r_float_value;
     double_value = ( ! ) r_double_value;
   }
    : simple_scalar_properties_input_output)

let xml_attributes_input_output_of_xml i =
  let r_foo = ref None in
  let r_attr = ref None in
  Structure.scanSequence i [ "foo"; "test" ] (fun tag _ ->
      match tag with
      | "foo" -> r_foo := Some (Read.element_value i "foo" Fun.id ())
      | "test" -> r_attr := Some (Read.element_value i "test" Fun.id ())
      | _ -> Read.skip_element i);
  ({ foo = ( ! ) r_foo; attr = ( ! ) r_attr } : xml_attributes_input_output)

let xml_attributes_middle_member_input_output_of_xml i =
  let r_foo = ref None in
  let r_attr = ref None in
  let r_baz = ref None in
  Structure.scanSequence i [ "foo"; "test"; "baz" ] (fun tag _ ->
      match tag with
      | "foo" -> r_foo := Some (Read.element_value i "foo" Fun.id ())
      | "test" -> r_attr := Some (Read.element_value i "test" Fun.id ())
      | "baz" -> r_baz := Some (Read.element_value i "baz" Fun.id ())
      | _ -> Read.skip_element i);
  ({ foo = ( ! ) r_foo; attr = ( ! ) r_attr; baz = ( ! ) r_baz }
    : xml_attributes_middle_member_input_output)

let xml_enums_input_output_of_xml i =
  let r_foo_enum1 = ref None in
  let r_foo_enum2 = ref None in
  let r_foo_enum3 = ref None in
  let r_foo_enum_list = ref None in
  let r_foo_enum_set = ref None in
  let r_foo_enum_map = ref None in
  Structure.scanSequence i
    [ "fooEnum1"; "fooEnum2"; "fooEnum3"; "fooEnumList"; "fooEnumSet"; "fooEnumMap" ] (fun tag _ ->
      match tag with
      | "fooEnum1" ->
          r_foo_enum1 :=
            Some
              (Read.sequence i "fooEnum1"
                 (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                 ())
      | "fooEnum2" ->
          r_foo_enum2 :=
            Some
              (Read.sequence i "fooEnum2"
                 (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                 ())
      | "fooEnum3" ->
          r_foo_enum3 :=
            Some
              (Read.sequence i "fooEnum3"
                 (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                 ())
      | "fooEnumList" ->
          r_foo_enum_list :=
            Some
              (Read.sequence i "fooEnumList"
                 (fun i _ ->
                   Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                     ())
                 ())
      | "fooEnumSet" ->
          r_foo_enum_set :=
            Some
              (Read.sequence i "fooEnumSet"
                 (fun i _ ->
                   Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                     ())
                 ())
      | "fooEnumMap" ->
          r_foo_enum_map :=
            Some
              (Read.sequence i "fooEnumMap"
                 (fun i _ ->
                   Read.sequences i "entry"
                     (fun i _ ->
                       let k = Read.element_value i "key" Fun.id () in
                       let v =
                         Read.sequence i "value"
                           (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Read.skip_element i);
  ({
     foo_enum1 = ( ! ) r_foo_enum1;
     foo_enum2 = ( ! ) r_foo_enum2;
     foo_enum3 = ( ! ) r_foo_enum3;
     foo_enum_list = ( ! ) r_foo_enum_list;
     foo_enum_set = ( ! ) r_foo_enum_set;
     foo_enum_map = ( ! ) r_foo_enum_map;
   }
    : xml_enums_input_output)

let xml_int_enums_input_output_of_xml i =
  let r_int_enum1 = ref None in
  let r_int_enum2 = ref None in
  let r_int_enum3 = ref None in
  let r_int_enum_list = ref None in
  let r_int_enum_set = ref None in
  let r_int_enum_map = ref None in
  Structure.scanSequence i
    [ "intEnum1"; "intEnum2"; "intEnum3"; "intEnumList"; "intEnumSet"; "intEnumMap" ] (fun tag _ ->
      match tag with
      | "intEnum1" ->
          r_int_enum1 :=
            Some
              (Read.sequence i "intEnum1"
                 (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                 ())
      | "intEnum2" ->
          r_int_enum2 :=
            Some
              (Read.sequence i "intEnum2"
                 (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                 ())
      | "intEnum3" ->
          r_int_enum3 :=
            Some
              (Read.sequence i "intEnum3"
                 (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                 ())
      | "intEnumList" ->
          r_int_enum_list :=
            Some
              (Read.sequence i "intEnumList"
                 (fun i _ ->
                   Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                     ())
                 ())
      | "intEnumSet" ->
          r_int_enum_set :=
            Some
              (Read.sequence i "intEnumSet"
                 (fun i _ ->
                   Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                     ())
                 ())
      | "intEnumMap" ->
          r_int_enum_map :=
            Some
              (Read.sequence i "intEnumMap"
                 (fun i _ ->
                   Read.sequences i "entry"
                     (fun i _ ->
                       let k = Read.element_value i "key" Fun.id () in
                       let v =
                         Read.sequence i "value"
                           (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                           ()
                       in
                       (k, v))
                     ())
                 ())
      | _ -> Read.skip_element i);
  ({
     int_enum1 = ( ! ) r_int_enum1;
     int_enum2 = ( ! ) r_int_enum2;
     int_enum3 = ( ! ) r_int_enum3;
     int_enum_list = ( ! ) r_int_enum_list;
     int_enum_set = ( ! ) r_int_enum_set;
     int_enum_map = ( ! ) r_int_enum_map;
   }
    : xml_int_enums_input_output)

let xml_lists_input_output_of_xml i =
  let r_string_list = ref None in
  let r_string_set = ref None in
  let r_integer_list = ref None in
  let r_boolean_list = ref None in
  let r_timestamp_list = ref None in
  let r_enum_list = ref None in
  let r_int_enum_list = ref None in
  let r_nested_string_list = ref None in
  let r_renamed_list_members = ref None in
  let r_flattened_list = ref None in
  let r_flattened_list2 = ref None in
  let r_flattened_list_with_member_namespace = ref None in
  let r_flattened_list_with_namespace = ref None in
  let r_structure_list = ref None in
  let r_flattened_structure_list = ref None in
  Structure.scanSequence i
    [
      "stringList";
      "stringSet";
      "integerList";
      "booleanList";
      "timestampList";
      "enumList";
      "intEnumList";
      "nestedStringList";
      "renamed";
      "flattenedList";
      "customName";
      "flattenedListWithMemberNamespace";
      "flattenedListWithNamespace";
      "myStructureList";
      "flattenedStructureList";
    ] (fun tag _ ->
      match tag with
      | "stringList" ->
          r_string_list :=
            Some
              (Read.sequence i "stringList"
                 (fun i _ -> Read.elements_value i "member" Fun.id ())
                 ())
      | "stringSet" ->
          r_string_set :=
            Some
              (Read.sequence i "stringSet" (fun i _ -> Read.elements_value i "member" Fun.id ()) ())
      | "integerList" ->
          r_integer_list :=
            Some
              (Read.sequence i "integerList"
                 (fun i _ -> Read.elements_value i "member" Primitive.int_of_string ())
                 ())
      | "booleanList" ->
          r_boolean_list :=
            Some
              (Read.sequence i "booleanList"
                 (fun i _ -> Read.elements_value i "member" Primitive.bool_of_string ())
                 ())
      | "timestampList" ->
          r_timestamp_list :=
            Some
              (Read.sequence i "timestampList"
                 (fun i _ -> Read.elements_value i "member" Primitive.timestamp_iso_of_string ())
                 ())
      | "enumList" ->
          r_enum_list :=
            Some
              (Read.sequence i "enumList"
                 (fun i _ ->
                   Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.foo_enum_of_xml i)
                     ())
                 ())
      | "intEnumList" ->
          r_int_enum_list :=
            Some
              (Read.sequence i "intEnumList"
                 (fun i _ ->
                   Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.integer_enum_of_xml i)
                     ())
                 ())
      | "nestedStringList" ->
          r_nested_string_list :=
            Some
              (Read.sequence i "nestedStringList"
                 (fun i _ ->
                   Read.sequences i "member"
                     (fun i _ -> Shared.Xml_deserializers.string_list_of_xml i)
                     ())
                 ())
      | "renamed" ->
          r_renamed_list_members :=
            Some (Read.sequence i "renamed" (fun i _ -> Read.elements_value i "item" Fun.id ()) ())
      | "flattenedList" ->
          r_flattened_list := Some (Read.elements_value i "flattenedList" Fun.id ())
      | "customName" -> r_flattened_list2 := Some (Read.elements_value i "customName" Fun.id ())
      | "flattenedListWithMemberNamespace" ->
          r_flattened_list_with_member_namespace :=
            Some (Read.elements_value i "flattenedListWithMemberNamespace" Fun.id ())
      | "flattenedListWithNamespace" ->
          r_flattened_list_with_namespace :=
            Some (Read.elements_value i "flattenedListWithNamespace" Fun.id ())
      | "myStructureList" ->
          r_structure_list :=
            Some
              (Read.sequence i "myStructureList"
                 (fun i _ -> Read.sequences i "item" (fun i _ -> structure_list_member_of_xml i) ())
                 ())
      | "flattenedStructureList" ->
          r_flattened_structure_list :=
            Some
              (Read.sequences i "flattenedStructureList"
                 (fun i _ -> structure_list_member_of_xml i)
                 ())
      | _ -> Read.skip_element i);
  ({
     string_list = ( ! ) r_string_list;
     string_set = ( ! ) r_string_set;
     integer_list = ( ! ) r_integer_list;
     boolean_list = ( ! ) r_boolean_list;
     timestamp_list = ( ! ) r_timestamp_list;
     enum_list = ( ! ) r_enum_list;
     int_enum_list = ( ! ) r_int_enum_list;
     nested_string_list = ( ! ) r_nested_string_list;
     renamed_list_members = ( ! ) r_renamed_list_members;
     flattened_list = ( ! ) r_flattened_list;
     flattened_list2 = ( ! ) r_flattened_list2;
     flattened_list_with_member_namespace = ( ! ) r_flattened_list_with_member_namespace;
     flattened_list_with_namespace = ( ! ) r_flattened_list_with_namespace;
     structure_list = ( ! ) r_structure_list;
     flattened_structure_list = ( ! ) r_flattened_structure_list;
   }
    : xml_lists_input_output)

let xml_map_with_xml_namespace_input_output_of_xml i =
  let r_my_map = ref None in
  Structure.scanSequence i [ "KVP" ] (fun tag _ ->
      match tag with
      | "KVP" ->
          r_my_map :=
            Some
              (Read.sequence i "KVP"
                 (fun i _ ->
                   Read.sequences i "entry"
                     (fun i _ ->
                       let k = Read.element_value i "K" Fun.id () in
                       let v = Read.element_value i "V" Fun.id () in
                       (k, v))
                     ())
                 ())
      | _ -> Read.skip_element i);
  ({ my_map = ( ! ) r_my_map } : xml_map_with_xml_namespace_input_output)

let xml_namespaces_input_output_of_xml i =
  let r_nested = ref None in
  Structure.scanSequence i [ "nested" ] (fun tag _ ->
      match tag with
      | "nested" ->
          r_nested := Some (Read.sequence i "nested" (fun i _ -> xml_namespace_nested_of_xml i) ())
      | _ -> Read.skip_element i);
  ({ nested = ( ! ) r_nested } : xml_namespaces_input_output)

let xml_timestamps_input_output_of_xml i =
  let r_normal = ref None in
  let r_date_time = ref None in
  let r_date_time_on_target = ref None in
  let r_epoch_seconds = ref None in
  let r_epoch_seconds_on_target = ref None in
  let r_http_date = ref None in
  let r_http_date_on_target = ref None in
  Structure.scanSequence i
    [
      "normal";
      "dateTime";
      "dateTimeOnTarget";
      "epochSeconds";
      "epochSecondsOnTarget";
      "httpDate";
      "httpDateOnTarget";
    ] (fun tag _ ->
      match tag with
      | "normal" ->
          r_normal := Some (Read.element_value i "normal" Primitive.timestamp_iso_of_string ())
      | "dateTime" ->
          r_date_time := Some (Read.element_value i "dateTime" Primitive.timestamp_iso_of_string ())
      | "dateTimeOnTarget" ->
          r_date_time_on_target :=
            Some
              (Read.sequence i "dateTimeOnTarget"
                 (fun i _ -> Shared.Xml_deserializers.date_time_of_xml i)
                 ())
      | "epochSeconds" ->
          r_epoch_seconds :=
            Some (Read.element_value i "epochSeconds" Primitive.timestamp_epoch_of_string ())
      | "epochSecondsOnTarget" ->
          r_epoch_seconds_on_target :=
            Some
              (Read.sequence i "epochSecondsOnTarget"
                 (fun i _ -> Shared.Xml_deserializers.epoch_seconds_of_xml i)
                 ())
      | "httpDate" ->
          r_http_date :=
            Some (Read.element_value i "httpDate" Primitive.timestamp_httpdate_of_string ())
      | "httpDateOnTarget" ->
          r_http_date_on_target :=
            Some
              (Read.sequence i "httpDateOnTarget"
                 (fun i _ -> Shared.Xml_deserializers.http_date_of_xml i)
                 ())
      | _ -> Read.skip_element i);
  ({
     normal = ( ! ) r_normal;
     date_time = ( ! ) r_date_time;
     date_time_on_target = ( ! ) r_date_time_on_target;
     epoch_seconds = ( ! ) r_epoch_seconds;
     epoch_seconds_on_target = ( ! ) r_epoch_seconds_on_target;
     http_date = ( ! ) r_http_date;
     http_date_on_target = ( ! ) r_http_date_on_target;
   }
    : xml_timestamps_input_output)
