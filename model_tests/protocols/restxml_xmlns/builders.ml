open Types
let make_simple_scalar_properties_response () = (() : unit)
let make_simple_scalar_properties_request () = (() : unit)
let make_nested_with_namespace
  ?attr_field:(attr_field_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({ attr_field = attr_field_ } : nested_with_namespace)
let make_simple_scalar_properties_input_output
  ?double_value:(double_value_ : Smaws_Lib.Smithy_api.Types.double option)
  ?nested:(nested_ : nested_with_namespace option)
  ?float_value:(float_value_ : Smaws_Lib.Smithy_api.Types.float_ option)
  ?long_value:(long_value_ : Smaws_Lib.Smithy_api.Types.long option)
  ?integer_value:(integer_value_ : Smaws_Lib.Smithy_api.Types.integer option)
  ?short_value:(short_value_ : Smaws_Lib.Smithy_api.Types.short option)
  ?byte_value:(byte_value_ : Smaws_Lib.Smithy_api.Types.byte option)
  ?false_boolean_value:(false_boolean_value_ :
                         Smaws_Lib.Smithy_api.Types.boolean_ option)
  ?true_boolean_value:(true_boolean_value_ :
                        Smaws_Lib.Smithy_api.Types.boolean_ option)
  ?string_value:(string_value_ : Smaws_Lib.Smithy_api.Types.string_ option)
  ?foo:(foo_ : Smaws_Lib.Smithy_api.Types.string_ option) () =
  ({
     double_value = double_value_;
     nested = nested_;
     float_value = float_value_;
     long_value = long_value_;
     integer_value = integer_value_;
     short_value = short_value_;
     byte_value = byte_value_;
     false_boolean_value = false_boolean_value_;
     true_boolean_value = true_boolean_value_;
     string_value = string_value_;
     foo = foo_
   } : simple_scalar_properties_input_output)