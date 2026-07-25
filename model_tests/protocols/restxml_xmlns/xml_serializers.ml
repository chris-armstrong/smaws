open Smaws_Lib.Xml.Write
open Types

let nested_with_namespace_to_xml w (x : nested_with_namespace) = ignore [ null w ]

let simple_scalar_properties_response_to_xml w (x : simple_scalar_properties_response) =
  ignore
    [
      (match x.foo with None -> null w | Some v -> element w "foo" (fun w -> text w v));
      (match x.string_value with
      | None -> null w
      | Some v -> element w "stringValue" (fun w -> text w v));
      (match x.true_boolean_value with
      | None -> null w
      | Some v -> element w "trueBooleanValue" (fun w -> text w (string_of_bool v)));
      (match x.false_boolean_value with
      | None -> null w
      | Some v -> element w "falseBooleanValue" (fun w -> text w (string_of_bool v)));
      (match x.byte_value with
      | None -> null w
      | Some v -> element w "byteValue" (fun w -> text w (string_of_int v)));
      (match x.short_value with
      | None -> null w
      | Some v -> element w "shortValue" (fun w -> text w (string_of_int v)));
      (match x.integer_value with
      | None -> null w
      | Some v -> element w "integerValue" (fun w -> text w (string_of_int v)));
      (match x.long_value with
      | None -> null w
      | Some v -> element w "longValue" (fun w -> text w (Smaws_Lib.CoreTypes.Int64.to_string v)));
      (match x.float_value with
      | None -> null w
      | Some v ->
          element w "floatValue" (fun w ->
              text w (Smaws_Lib.Protocols.RestXml.Serialize.float_field_to_string v)));
      (match x.nested with
      | None -> null w
      | Some v ->
          element w "Nested"
            ~attrs:
              (("xmlns:xsi", "https://example.com", None)
              :: List.concat
                   [
                     (match v.attr_field with
                     | Some s -> [ ("xsi:someName", (fun v -> v) s, None) ]
                     | None -> []);
                   ])
            (fun w -> nested_with_namespace_to_xml w v));
      (match x.double_value with
      | None -> null w
      | Some v ->
          element w "DoubleDribble" (fun w ->
              text w (Smaws_Lib.Protocols.RestXml.Serialize.float_field_to_string v)));
    ]

let simple_scalar_properties_request_to_xml w (x : simple_scalar_properties_request) =
  ignore
    [
      (match x.foo with None -> null w | Some v -> element w "foo" (fun w -> text w v));
      (match x.string_value with
      | None -> null w
      | Some v -> element w "stringValue" (fun w -> text w v));
      (match x.true_boolean_value with
      | None -> null w
      | Some v -> element w "trueBooleanValue" (fun w -> text w (string_of_bool v)));
      (match x.false_boolean_value with
      | None -> null w
      | Some v -> element w "falseBooleanValue" (fun w -> text w (string_of_bool v)));
      (match x.byte_value with
      | None -> null w
      | Some v -> element w "byteValue" (fun w -> text w (string_of_int v)));
      (match x.short_value with
      | None -> null w
      | Some v -> element w "shortValue" (fun w -> text w (string_of_int v)));
      (match x.integer_value with
      | None -> null w
      | Some v -> element w "integerValue" (fun w -> text w (string_of_int v)));
      (match x.long_value with
      | None -> null w
      | Some v -> element w "longValue" (fun w -> text w (Smaws_Lib.CoreTypes.Int64.to_string v)));
      (match x.float_value with
      | None -> null w
      | Some v ->
          element w "floatValue" (fun w ->
              text w (Smaws_Lib.Protocols.RestXml.Serialize.float_field_to_string v)));
      (match x.nested with
      | None -> null w
      | Some v ->
          element w "Nested"
            ~attrs:
              (("xmlns:xsi", "https://example.com", None)
              :: List.concat
                   [
                     (match v.attr_field with
                     | Some s -> [ ("xsi:someName", (fun v -> v) s, None) ]
                     | None -> []);
                   ])
            (fun w -> nested_with_namespace_to_xml w v));
      (match x.double_value with
      | None -> null w
      | Some v ->
          element w "DoubleDribble" (fun w ->
              text w (Smaws_Lib.Protocols.RestXml.Serialize.float_field_to_string v)));
    ]

let simple_scalar_properties_input_output_to_xml w (x : simple_scalar_properties_input_output) =
  ignore
    [
      (match x.foo with None -> null w | Some v -> element w "foo" (fun w -> text w v));
      (match x.string_value with
      | None -> null w
      | Some v -> element w "stringValue" (fun w -> text w v));
      (match x.true_boolean_value with
      | None -> null w
      | Some v -> element w "trueBooleanValue" (fun w -> text w (string_of_bool v)));
      (match x.false_boolean_value with
      | None -> null w
      | Some v -> element w "falseBooleanValue" (fun w -> text w (string_of_bool v)));
      (match x.byte_value with
      | None -> null w
      | Some v -> element w "byteValue" (fun w -> text w (string_of_int v)));
      (match x.short_value with
      | None -> null w
      | Some v -> element w "shortValue" (fun w -> text w (string_of_int v)));
      (match x.integer_value with
      | None -> null w
      | Some v -> element w "integerValue" (fun w -> text w (string_of_int v)));
      (match x.long_value with
      | None -> null w
      | Some v -> element w "longValue" (fun w -> text w (Smaws_Lib.CoreTypes.Int64.to_string v)));
      (match x.float_value with
      | None -> null w
      | Some v ->
          element w "floatValue" (fun w ->
              text w (Smaws_Lib.Protocols.RestXml.Serialize.float_field_to_string v)));
      (match x.nested with
      | None -> null w
      | Some v ->
          element w "Nested"
            ~attrs:
              (("xmlns:xsi", "https://example.com", None)
              :: List.concat
                   [
                     (match v.attr_field with
                     | Some s -> [ ("xsi:someName", (fun v -> v) s, None) ]
                     | None -> []);
                   ])
            (fun w -> nested_with_namespace_to_xml w v));
      (match x.double_value with
      | None -> null w
      | Some v ->
          element w "DoubleDribble" (fun w ->
              text w (Smaws_Lib.Protocols.RestXml.Serialize.float_field_to_string v)));
    ]
