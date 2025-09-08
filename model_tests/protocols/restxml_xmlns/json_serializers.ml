open Smaws_Lib.Json.SerializeHelpers
open Types
let simple_scalar_properties_response_to_yojson = unit_to_yojson
let simple_scalar_properties_request_to_yojson = unit_to_yojson
let nested_with_namespace_to_yojson (x : nested_with_namespace) =
  assoc_to_yojson
    [("attrField",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.attr_field))]
let simple_scalar_properties_input_output_to_yojson
  (x : simple_scalar_properties_input_output) =
  assoc_to_yojson
    [("doubleValue",
       (option_to_yojson
          Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson
          x.double_value));
    ("Nested", (option_to_yojson nested_with_namespace_to_yojson x.nested));
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
    ("stringValue",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
         x.string_value));
    ("foo",
      (option_to_yojson
         Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.foo))]