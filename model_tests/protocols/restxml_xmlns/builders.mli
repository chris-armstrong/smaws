open Types
val make_simple_scalar_properties_response : unit -> unit
val make_simple_scalar_properties_request : unit -> unit
val make_nested_with_namespace :
  ?attr_field:Smaws_Lib.Smithy_api.Types.string_ ->
    unit -> nested_with_namespace
val make_simple_scalar_properties_input_output :
  ?double_value:Smaws_Lib.Smithy_api.Types.double ->
    ?nested:nested_with_namespace ->
      ?float_value:Smaws_Lib.Smithy_api.Types.float_ ->
        ?long_value:Smaws_Lib.Smithy_api.Types.long ->
          ?integer_value:Smaws_Lib.Smithy_api.Types.integer ->
            ?short_value:Smaws_Lib.Smithy_api.Types.short ->
              ?byte_value:Smaws_Lib.Smithy_api.Types.byte ->
                ?false_boolean_value:Smaws_Lib.Smithy_api.Types.boolean_ ->
                  ?true_boolean_value:Smaws_Lib.Smithy_api.Types.boolean_ ->
                    ?string_value:Smaws_Lib.Smithy_api.Types.string_ ->
                      ?foo:Smaws_Lib.Smithy_api.Types.string_ ->
                        unit -> simple_scalar_properties_input_output