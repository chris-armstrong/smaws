open Types

val make_validation_exception_field :
  name:Smaws_Lib.Smithy_api.Types.string_ ->
  message:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  validation_exception_field

val make_recommended_action :
  ?id:Smaws_Lib.Smithy_api.Types.string_ ->
  ?type_:action_type ->
  ?account_id:account_id ->
  ?severity:severity ->
  ?feature:feature ->
  ?context:context ->
  ?next_steps:next_steps ->
  ?last_updated_time_stamp:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  recommended_action

val make_list_recommended_actions_response :
  ?next_token:next_token ->
  recommended_actions:recommended_actions ->
  unit ->
  list_recommended_actions_response

val make_action_filter :
  key:filter_name -> match_option:match_option -> values:filter_values -> unit -> action_filter

val make_request_filter : ?actions:action_filter_list -> unit -> request_filter

val make_list_recommended_actions_request :
  ?filter:request_filter ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_recommended_actions_request
