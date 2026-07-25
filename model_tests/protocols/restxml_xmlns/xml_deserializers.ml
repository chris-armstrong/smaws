open Smaws_Lib.Xml.Parse
open Types

let unit_of_xml _ = ()

let nested_with_namespace_of_xml i attrs =
  let r_attr_field = ref None in
  r_attr_field :=
    List.find_map (fun ((_, n), v) -> if String.equal n "someName" then Some v else None) attrs;
  Structure.scanSequence i [] (fun tag _ -> match tag with _ -> Read.skip_element i);
  ({ attr_field = ( ! ) r_attr_field } : nested_with_namespace)

let simple_scalar_properties_response_of_xml i attrs =
  let r_foo = ref None in
  let r_string_value = ref None in
  let r_true_boolean_value = ref None in
  let r_false_boolean_value = ref None in
  let r_byte_value = ref None in
  let r_short_value = ref None in
  let r_integer_value = ref None in
  let r_long_value = ref None in
  let r_float_value = ref None in
  let r_nested = ref None in
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
      "Nested";
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
      | "Nested" ->
          r_nested :=
            Some (Read.sequence i "Nested" (fun i attrs -> nested_with_namespace_of_xml i attrs) ())
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
     nested = ( ! ) r_nested;
     double_value = ( ! ) r_double_value;
   }
    : simple_scalar_properties_response)

let simple_scalar_properties_request_of_xml i attrs =
  let r_foo = ref None in
  let r_string_value = ref None in
  let r_true_boolean_value = ref None in
  let r_false_boolean_value = ref None in
  let r_byte_value = ref None in
  let r_short_value = ref None in
  let r_integer_value = ref None in
  let r_long_value = ref None in
  let r_float_value = ref None in
  let r_nested = ref None in
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
      "Nested";
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
      | "Nested" ->
          r_nested :=
            Some (Read.sequence i "Nested" (fun i attrs -> nested_with_namespace_of_xml i attrs) ())
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
     nested = ( ! ) r_nested;
     double_value = ( ! ) r_double_value;
   }
    : simple_scalar_properties_request)

let simple_scalar_properties_input_output_of_xml i attrs =
  let r_foo = ref None in
  let r_string_value = ref None in
  let r_true_boolean_value = ref None in
  let r_false_boolean_value = ref None in
  let r_byte_value = ref None in
  let r_short_value = ref None in
  let r_integer_value = ref None in
  let r_long_value = ref None in
  let r_float_value = ref None in
  let r_nested = ref None in
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
      "Nested";
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
      | "Nested" ->
          r_nested :=
            Some (Read.sequence i "Nested" (fun i attrs -> nested_with_namespace_of_xml i attrs) ())
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
     nested = ( ! ) r_nested;
     double_value = ( ! ) r_double_value;
   }
    : simple_scalar_properties_input_output)
