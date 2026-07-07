open Types

val make_upgrade_account_plan_response :
  account_plan_status:account_plan_status ->
  account_plan_type:account_plan_type ->
  account_id:account_id ->
  unit ->
  upgrade_account_plan_response

val make_upgrade_account_plan_request :
  account_plan_type:account_plan_type -> unit -> upgrade_account_plan_request

val make_monetary_amount : unit_:currency_code -> amount:generic_double -> unit -> monetary_amount

val make_activity_summary :
  status:activity_status ->
  reward:activity_reward ->
  title:generic_string ->
  activity_id:activity_id ->
  unit ->
  activity_summary

val make_list_account_activities_response :
  ?next_token:next_page_token -> activities:activities -> unit -> list_account_activities_response

val make_list_account_activities_request :
  ?language_code:language_code ->
  ?max_results:max_results ->
  ?next_token:next_page_token ->
  ?filter_activity_statuses:filter_activity_statuses ->
  unit ->
  list_account_activities_request

val make_free_tier_usage :
  ?free_tier_type:generic_string ->
  ?description:generic_string ->
  ?unit_:generic_string ->
  ?limit:generic_double ->
  ?forecasted_usage_amount:generic_double ->
  ?actual_usage_amount:generic_double ->
  ?region:generic_string ->
  ?usage_type:generic_string ->
  ?operation:generic_string ->
  ?service:generic_string ->
  unit ->
  free_tier_usage

val make_get_free_tier_usage_response :
  ?next_token:next_page_token ->
  free_tier_usages:free_tier_usages ->
  unit ->
  get_free_tier_usage_response

val make_dimension_values :
  match_options:match_options -> values:values -> key:dimension -> unit -> dimension_values

val make_expression :
  ?dimensions:dimension_values ->
  ?not:expression ->
  ?and_:expressions ->
  ?\#or:expressions ->
  unit ->
  expression

val make_get_free_tier_usage_request :
  ?next_token:next_page_token ->
  ?max_results:max_results ->
  ?filter:expression ->
  unit ->
  get_free_tier_usage_request

val make_get_account_plan_state_response :
  ?account_plan_expiration_date:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?account_plan_remaining_credits:monetary_amount ->
  account_plan_status:account_plan_status ->
  account_plan_type:account_plan_type ->
  account_id:account_id ->
  unit ->
  get_account_plan_state_response

val make_get_account_plan_state_request : unit -> unit

val make_get_account_activity_response :
  ?completed_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?started_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?expires_at:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?estimated_time_to_complete_in_minutes:Smaws_Lib.Smithy_api.Types.integer ->
  reward:activity_reward ->
  instructions_url:generic_string ->
  status:activity_status ->
  description:generic_string ->
  title:generic_string ->
  activity_id:activity_id ->
  unit ->
  get_account_activity_response

val make_get_account_activity_request :
  ?language_code:language_code -> activity_id:activity_id -> unit -> get_account_activity_request
