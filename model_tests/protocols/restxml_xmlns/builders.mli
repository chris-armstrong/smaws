open Types

val make_nested_with_namespace :
  ?attr_field:Smaws_Lib.Smithy_api.Types.string_ -> unit -> nested_with_namespace

val make_simple_scalar_properties_response :
  ?foo:Smaws_Lib.Smithy_api.Types.string_ ->
  ?string_value:Smaws_Lib.Smithy_api.Types.string_ ->
  ?true_boolean_value:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?false_boolean_value:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?byte_value:Smaws_Lib.Smithy_api.Types.byte ->
  ?short_value:Smaws_Lib.Smithy_api.Types.short ->
  ?integer_value:Smaws_Lib.Smithy_api.Types.integer ->
  ?long_value:Smaws_Lib.Smithy_api.Types.long ->
  ?float_value:Smaws_Lib.Smithy_api.Types.float_ ->
  ?nested:nested_with_namespace ->
  ?double_value:Smaws_Lib.Smithy_api.Types.double ->
  unit ->
  simple_scalar_properties_response

val make_simple_scalar_properties_request :
  ?foo:Smaws_Lib.Smithy_api.Types.string_ ->
  ?string_value:Smaws_Lib.Smithy_api.Types.string_ ->
  ?true_boolean_value:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?false_boolean_value:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?byte_value:Smaws_Lib.Smithy_api.Types.byte ->
  ?short_value:Smaws_Lib.Smithy_api.Types.short ->
  ?integer_value:Smaws_Lib.Smithy_api.Types.integer ->
  ?long_value:Smaws_Lib.Smithy_api.Types.long ->
  ?float_value:Smaws_Lib.Smithy_api.Types.float_ ->
  ?nested:nested_with_namespace ->
  ?double_value:Smaws_Lib.Smithy_api.Types.double ->
  unit ->
  simple_scalar_properties_request

val make_simple_scalar_properties_input_output :
  ?foo:Smaws_Lib.Smithy_api.Types.string_ ->
  ?string_value:Smaws_Lib.Smithy_api.Types.string_ ->
  ?true_boolean_value:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?false_boolean_value:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?byte_value:Smaws_Lib.Smithy_api.Types.byte ->
  ?short_value:Smaws_Lib.Smithy_api.Types.short ->
  ?integer_value:Smaws_Lib.Smithy_api.Types.integer ->
  ?long_value:Smaws_Lib.Smithy_api.Types.long ->
  ?float_value:Smaws_Lib.Smithy_api.Types.float_ ->
  ?nested:nested_with_namespace ->
  ?double_value:Smaws_Lib.Smithy_api.Types.double ->
  unit ->
  simple_scalar_properties_input_output
