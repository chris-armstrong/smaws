open Smaws_Lib.Json.DeserializeHelpers
open Types
let simple_scalar_properties_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let simple_scalar_properties_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let nested_with_namespace_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attr_field =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "attrField") _list path)
   } : nested_with_namespace)
let simple_scalar_properties_input_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     double_value =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
             "doubleValue") _list path);
     nested =
       (option_of_yojson
          (value_for_key nested_with_namespace_of_yojson "Nested") _list path);
     float_value =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.float__of_yojson
             "floatValue") _list path);
     long_value =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson
             "longValue") _list path);
     integer_value =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
             "integerValue") _list path);
     short_value =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.short_of_yojson
             "shortValue") _list path);
     byte_value =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.byte_of_yojson
             "byteValue") _list path);
     false_boolean_value =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
             "falseBooleanValue") _list path);
     true_boolean_value =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
             "trueBooleanValue") _list path);
     string_value =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
             "stringValue") _list path);
     foo =
       (option_of_yojson
          (value_for_key
             Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "foo")
          _list path)
   } : simple_scalar_properties_input_output)