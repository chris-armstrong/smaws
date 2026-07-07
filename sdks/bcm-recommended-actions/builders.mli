open Types

val make_validation_exception_field :
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  name:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  validation_exception_field

val make_action_filter :
  values:filter_values -> match_option:match_option -> key:filter_name -> unit -> action_filter

val make_request_filter : ?actions:action_filter_list -> unit -> request_filter

val make_recommended_action :
  ?last_updated_time_stamp:Smaws_Lib.Smithy_api.Types.string_ ->
  ?next_steps:next_steps ->
  ?context:context ->
  ?feature:feature ->
  ?severity:severity ->
  ?account_id:account_id ->
  ?type_:action_type ->
  ?id:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  recommended_action

val make_list_recommended_actions_response :
  ?next_token:next_token ->
  recommended_actions:recommended_actions ->
  unit ->
  list_recommended_actions_response

val make_list_recommended_actions_request :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filter:request_filter ->
  unit ->
  list_recommended_actions_request
