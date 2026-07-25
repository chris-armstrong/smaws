open Types

val make_upgrade_account_plan_response :
  account_id:account_id ->
  account_plan_type:account_plan_type ->
  account_plan_status:account_plan_status ->
  unit ->
  upgrade_account_plan_response

val make_upgrade_account_plan_request :
  account_plan_type:account_plan_type -> unit -> upgrade_account_plan_request

val make_monetary_amount : amount:generic_double -> unit_:currency_code -> unit -> monetary_amount

val make_activity_summary :
  activity_id:activity_id ->
  title:generic_string ->
  reward:activity_reward ->
  status:activity_status ->
  unit ->
  activity_summary

val make_list_account_activities_response :
  ?next_token:next_page_token -> activities:activities -> unit -> list_account_activities_response

val make_list_account_activities_request :
  ?filter_activity_statuses:filter_activity_statuses ->
  ?next_token:next_page_token ->
  ?max_results:max_results ->
  ?language_code:language_code ->
  unit ->
  list_account_activities_request

val make_free_tier_usage :
  ?service:generic_string ->
  ?operation:generic_string ->
  ?usage_type:generic_string ->
  ?region:generic_string ->
  ?actual_usage_amount:generic_double ->
  ?forecasted_usage_amount:generic_double ->
  ?limit:generic_double ->
  ?unit_:generic_string ->
  ?description:generic_string ->
  ?free_tier_type:generic_string ->
  unit ->
  free_tier_usage

val make_get_free_tier_usage_response :
  ?next_token:next_page_token ->
  free_tier_usages:free_tier_usages ->
  unit ->
  get_free_tier_usage_response

val make_dimension_values :
  key:dimension -> values:values -> match_options:match_options -> unit -> dimension_values

val make_expression :
  ?\#or:expressions ->
  ?and_:expressions ->
  ?not:expression ->
  ?dimensions:dimension_values ->
  unit ->
  expression

val make_get_free_tier_usage_request :
  ?filter:expression ->
  ?max_results:max_results ->
  ?next_token:next_page_token ->
  unit ->
  get_free_tier_usage_request

val make_get_account_plan_state_response :
  ?account_plan_remaining_credits:monetary_amount ->
  ?account_plan_expiration_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  account_id:account_id ->
  account_plan_type:account_plan_type ->
  account_plan_status:account_plan_status ->
  unit ->
  get_account_plan_state_response

val make_get_account_plan_state_request : unit -> unit

val make_get_account_activity_response :
  ?estimated_time_to_complete_in_minutes:Smaws_Lib.Smithy_api.Types.integer ->
  ?expires_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?started_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?completed_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  activity_id:activity_id ->
  title:generic_string ->
  description:generic_string ->
  status:activity_status ->
  instructions_url:generic_string ->
  reward:activity_reward ->
  unit ->
  get_account_activity_response

val make_get_account_activity_request :
  ?language_code:language_code -> activity_id:activity_id -> unit -> get_account_activity_request
