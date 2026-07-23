open Types

val make_account_info :
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  account_id:account_id ->
  status:enrollment_status ->
  organization_rule_mode:organization_rule_mode ->
  last_updated_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  account_info

val make_associate_accounts_response :
  ?account_ids:account_id_list -> ?errors:string_list -> unit -> associate_accounts_response

val make_associate_accounts_request :
  ?client_token:client_token -> account_ids:account_id_list -> unit -> associate_accounts_request

val make_estimated_monthly_savings :
  currency:Smaws_Lib.Smithy_api.Types.string_ ->
  before_discount_savings:Smaws_Lib.Smithy_api.Types.double ->
  after_discount_savings:Smaws_Lib.Smithy_api.Types.double ->
  savings_estimation_mode:savings_estimation_mode ->
  unit ->
  estimated_monthly_savings

val make_automation_event :
  ?event_id:event_id ->
  ?event_description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?event_type:event_type ->
  ?event_status:event_status ->
  ?event_status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?resource_arn:resource_arn ->
  ?resource_id:resource_id ->
  ?recommended_action_id:recommended_action_id ->
  ?account_id:account_id ->
  ?region:Smaws_Lib.Smithy_api.Types.string_ ->
  ?rule_id:rule_id ->
  ?resource_type:resource_type ->
  ?created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?completed_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?estimated_monthly_savings:estimated_monthly_savings ->
  unit ->
  automation_event

val make_automation_event_filter :
  name:automation_event_filter_name -> values:filter_values -> unit -> automation_event_filter

val make_automation_event_step :
  ?event_id:event_id ->
  ?step_id:step_id ->
  ?step_type:step_type ->
  ?step_status:step_status ->
  ?resource_id:resource_id ->
  ?start_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?completed_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?estimated_monthly_savings:estimated_monthly_savings ->
  unit ->
  automation_event_step

val make_summary_totals :
  ?automation_event_count:Smaws_Lib.Smithy_api.Types.integer ->
  ?estimated_monthly_savings:estimated_monthly_savings ->
  unit ->
  summary_totals

val make_time_period :
  ?start_time_inclusive:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?end_time_exclusive:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  time_period

val make_summary_dimension :
  key:summary_dimension_key -> value:Smaws_Lib.Smithy_api.Types.string_ -> unit -> summary_dimension

val make_automation_event_summary :
  ?key:Smaws_Lib.Smithy_api.Types.string_ ->
  ?dimensions:summary_dimensions ->
  ?time_period:time_period ->
  ?total:summary_totals ->
  unit ->
  automation_event_summary

val make_schedule :
  ?schedule_expression:Smaws_Lib.Smithy_api.Types.string_ ->
  ?schedule_expression_timezone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?execution_window_in_minutes:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  schedule

val make_organization_configuration :
  ?rule_apply_order:rule_apply_order ->
  ?account_ids:organization_configuration_account_ids ->
  unit ->
  organization_configuration

val make_automation_rule :
  ?rule_arn:rule_arn ->
  ?rule_id:rule_id ->
  ?name:rule_name ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?rule_type:rule_type ->
  ?rule_revision:Smaws_Lib.Smithy_api.Types.long ->
  ?account_id:account_id ->
  ?organization_configuration:organization_configuration ->
  ?priority:Smaws_Lib.Smithy_api.Types.string_ ->
  ?recommended_action_types:recommended_action_type_list ->
  ?schedule:schedule ->
  ?status:rule_status ->
  ?created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?last_updated_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  automation_rule

val make_update_enrollment_configuration_response :
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  status:enrollment_status ->
  last_updated_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  update_enrollment_configuration_response

val make_update_enrollment_configuration_request :
  ?client_token:client_token ->
  status:enrollment_status ->
  unit ->
  update_enrollment_configuration_request

val make_string_criteria_condition :
  ?comparison:comparison_operator ->
  ?values:string_criteria_values ->
  unit ->
  string_criteria_condition

val make_integer_criteria_condition :
  ?comparison:comparison_operator -> ?values:integer_list -> unit -> integer_criteria_condition

val make_resource_tags_criteria_condition :
  ?comparison:comparison_operator ->
  ?key:string_criteria_value ->
  ?values:string_criteria_values ->
  unit ->
  resource_tags_criteria_condition

val make_double_criteria_condition :
  ?comparison:comparison_operator -> ?values:double_list -> unit -> double_criteria_condition

val make_criteria :
  ?region:string_criteria_condition_list ->
  ?resource_arn:string_criteria_condition_list ->
  ?ebs_volume_type:string_criteria_condition_list ->
  ?ebs_volume_size_in_gib:integer_criteria_condition_list ->
  ?estimated_monthly_savings:double_criteria_condition_list ->
  ?resource_tag:resource_tags_criteria_condition_list ->
  ?look_back_period_in_days:integer_criteria_condition_list ->
  ?restart_needed:string_criteria_condition_list ->
  unit ->
  criteria

val make_update_automation_rule_response :
  ?rule_arn:rule_arn ->
  ?rule_revision:Smaws_Lib.Smithy_api.Types.long ->
  ?name:rule_name ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?rule_type:rule_type ->
  ?organization_configuration:organization_configuration ->
  ?priority:Smaws_Lib.Smithy_api.Types.string_ ->
  ?recommended_action_types:recommended_action_type_list ->
  ?criteria:criteria ->
  ?schedule:schedule ->
  ?status:rule_status ->
  ?created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?last_updated_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  update_automation_rule_response

val make_update_automation_rule_request :
  ?name:rule_name ->
  ?description:rule_description ->
  ?rule_type:rule_type ->
  ?organization_configuration:organization_configuration ->
  ?priority:Smaws_Lib.Smithy_api.Types.string_ ->
  ?recommended_action_types:recommended_action_type_list ->
  ?criteria:criteria ->
  ?schedule:schedule ->
  ?status:rule_status ->
  ?client_token:client_token ->
  rule_arn:rule_arn ->
  rule_revision:Smaws_Lib.Smithy_api.Types.long ->
  unit ->
  update_automation_rule_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  ?client_token:client_token ->
  resource_arn:rule_arn ->
  rule_revision:Smaws_Lib.Smithy_api.Types.long ->
  tag_keys:tag_key_list ->
  unit ->
  untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_tag_resource_request :
  ?client_token:client_token ->
  resource_arn:rule_arn ->
  rule_revision:Smaws_Lib.Smithy_api.Types.long ->
  tags:tag_list ->
  unit ->
  tag_resource_request

val make_start_automation_event_response :
  ?recommended_action_id:recommended_action_id ->
  ?event_id:event_id ->
  ?event_status:event_status ->
  unit ->
  start_automation_event_response

val make_start_automation_event_request :
  ?client_token:client_token ->
  recommended_action_id:recommended_action_id ->
  unit ->
  start_automation_event_request

val make_rollback_automation_event_response :
  ?event_id:event_id -> ?event_status:event_status -> unit -> rollback_automation_event_response

val make_rollback_automation_event_request :
  ?client_token:client_token -> event_id:event_id -> unit -> rollback_automation_event_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:rule_arn -> unit -> list_tags_for_resource_request

val make_recommended_action_total :
  recommended_action_count:Smaws_Lib.Smithy_api.Types.integer ->
  estimated_monthly_savings:estimated_monthly_savings ->
  unit ->
  recommended_action_total

val make_recommended_action_summary :
  key:Smaws_Lib.Smithy_api.Types.string_ ->
  total:recommended_action_total ->
  unit ->
  recommended_action_summary

val make_list_recommended_action_summaries_response :
  ?recommended_action_summaries:recommended_action_summaries ->
  ?next_token:next_token ->
  unit ->
  list_recommended_action_summaries_response

val make_recommended_action_filter :
  name:recommended_action_filter_name -> values:filter_values -> unit -> recommended_action_filter

val make_list_recommended_action_summaries_request :
  ?filters:recommended_action_filter_list ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:next_token ->
  unit ->
  list_recommended_action_summaries_request

val make_ebs_volume_configuration :
  ?type_:Smaws_Lib.Smithy_api.Types.string_ ->
  ?size_in_gib:Smaws_Lib.Smithy_api.Types.integer ->
  ?iops:Smaws_Lib.Smithy_api.Types.integer ->
  ?throughput:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  ebs_volume_configuration

val make_ebs_volume : ?configuration:ebs_volume_configuration -> unit -> ebs_volume

val make_recommended_action :
  ?recommended_action_id:recommended_action_id ->
  ?resource_arn:resource_arn ->
  ?resource_id:resource_id ->
  ?account_id:account_id ->
  ?region:Smaws_Lib.Smithy_api.Types.string_ ->
  ?resource_type:resource_type ->
  ?look_back_period_in_days:Smaws_Lib.Smithy_api.Types.integer ->
  ?recommended_action_type:recommended_action_type ->
  ?current_resource_summary:Smaws_Lib.Smithy_api.Types.string_ ->
  ?current_resource_details:resource_details ->
  ?recommended_resource_summary:Smaws_Lib.Smithy_api.Types.string_ ->
  ?recommended_resource_details:resource_details ->
  ?restart_needed:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?estimated_monthly_savings:estimated_monthly_savings ->
  ?resource_tags:tag_list ->
  unit ->
  recommended_action

val make_list_recommended_actions_response :
  ?recommended_actions:recommended_actions ->
  ?next_token:next_token ->
  unit ->
  list_recommended_actions_response

val make_list_recommended_actions_request :
  ?filters:recommended_action_filter_list ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:next_token ->
  unit ->
  list_recommended_actions_request

val make_list_automation_rules_response :
  ?automation_rules:automation_rules ->
  ?next_token:next_token ->
  unit ->
  list_automation_rules_response

val make_filter : name:automation_rule_filter_name -> values:filter_values -> unit -> filter

val make_list_automation_rules_request :
  ?filters:filter_list ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:next_token ->
  unit ->
  list_automation_rules_request

val make_rule_preview_total :
  recommended_action_count:Smaws_Lib.Smithy_api.Types.integer ->
  estimated_monthly_savings:estimated_monthly_savings ->
  unit ->
  rule_preview_total

val make_preview_result_summary :
  key:Smaws_Lib.Smithy_api.Types.string_ ->
  total:rule_preview_total ->
  unit ->
  preview_result_summary

val make_list_automation_rule_preview_summaries_response :
  ?preview_result_summaries:preview_result_summaries ->
  ?next_token:next_token ->
  unit ->
  list_automation_rule_preview_summaries_response

val make_organization_scope :
  ?account_ids:organization_configuration_account_ids -> unit -> organization_scope

val make_list_automation_rule_preview_summaries_request :
  ?organization_scope:organization_scope ->
  ?criteria:criteria ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:next_token ->
  rule_type:rule_type ->
  recommended_action_types:recommended_action_type_list ->
  unit ->
  list_automation_rule_preview_summaries_request

val make_list_automation_rule_preview_response :
  ?preview_results:preview_results ->
  ?next_token:next_token ->
  unit ->
  list_automation_rule_preview_response

val make_list_automation_rule_preview_request :
  ?organization_scope:organization_scope ->
  ?criteria:criteria ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:next_token ->
  rule_type:rule_type ->
  recommended_action_types:recommended_action_type_list ->
  unit ->
  list_automation_rule_preview_request

val make_list_automation_event_summaries_response :
  ?automation_event_summaries:automation_event_summary_list ->
  ?next_token:next_token ->
  unit ->
  list_automation_event_summaries_response

val make_list_automation_event_summaries_request :
  ?filters:automation_event_filter_list ->
  ?start_date_inclusive:Smaws_Lib.Smithy_api.Types.string_ ->
  ?end_date_exclusive:Smaws_Lib.Smithy_api.Types.string_ ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:next_token ->
  unit ->
  list_automation_event_summaries_request

val make_list_automation_event_steps_response :
  ?automation_event_steps:automation_event_steps ->
  ?next_token:next_token ->
  unit ->
  list_automation_event_steps_response

val make_list_automation_event_steps_request :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:next_token ->
  event_id:event_id ->
  unit ->
  list_automation_event_steps_request

val make_list_automation_events_response :
  ?automation_events:automation_events ->
  ?next_token:next_token ->
  unit ->
  list_automation_events_response

val make_list_automation_events_request :
  ?filters:automation_event_filter_list ->
  ?start_time_inclusive:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?end_time_exclusive:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:next_token ->
  unit ->
  list_automation_events_request

val make_list_accounts_response :
  ?next_token:next_token -> accounts:account_info_list -> unit -> list_accounts_response

val make_list_accounts_request :
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?next_token:next_token ->
  unit ->
  list_accounts_request

val make_get_enrollment_configuration_response :
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?organization_rule_mode:organization_rule_mode ->
  ?last_updated_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  status:enrollment_status ->
  unit ->
  get_enrollment_configuration_response

val make_get_enrollment_configuration_request : unit -> unit

val make_get_automation_rule_response :
  ?rule_arn:rule_arn ->
  ?rule_id:rule_id ->
  ?name:rule_name ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?rule_type:rule_type ->
  ?rule_revision:Smaws_Lib.Smithy_api.Types.long ->
  ?account_id:account_id ->
  ?organization_configuration:organization_configuration ->
  ?priority:Smaws_Lib.Smithy_api.Types.string_ ->
  ?recommended_action_types:recommended_action_type_list ->
  ?criteria:criteria ->
  ?schedule:schedule ->
  ?status:rule_status ->
  ?tags:tag_list ->
  ?created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?last_updated_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  get_automation_rule_response

val make_get_automation_rule_request : rule_arn:rule_arn -> unit -> get_automation_rule_request

val make_get_automation_event_response :
  ?event_id:event_id ->
  ?event_description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?event_type:event_type ->
  ?event_status:event_status ->
  ?event_status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?resource_arn:resource_arn ->
  ?resource_id:resource_id ->
  ?recommended_action_id:recommended_action_id ->
  ?account_id:account_id ->
  ?region:Smaws_Lib.Smithy_api.Types.string_ ->
  ?rule_id:rule_id ->
  ?resource_type:resource_type ->
  ?created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?completed_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?estimated_monthly_savings:estimated_monthly_savings ->
  unit ->
  get_automation_event_response

val make_get_automation_event_request : event_id:event_id -> unit -> get_automation_event_request

val make_disassociate_accounts_response :
  ?account_ids:account_id_list -> ?errors:string_list -> unit -> disassociate_accounts_response

val make_disassociate_accounts_request :
  ?client_token:client_token -> account_ids:account_id_list -> unit -> disassociate_accounts_request

val make_delete_automation_rule_response : unit -> unit

val make_delete_automation_rule_request :
  ?client_token:client_token ->
  rule_arn:rule_arn ->
  rule_revision:Smaws_Lib.Smithy_api.Types.long ->
  unit ->
  delete_automation_rule_request

val make_create_automation_rule_response :
  ?rule_arn:rule_arn ->
  ?rule_id:rule_id ->
  ?name:rule_name ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?rule_type:rule_type ->
  ?rule_revision:Smaws_Lib.Smithy_api.Types.long ->
  ?organization_configuration:organization_configuration ->
  ?priority:Smaws_Lib.Smithy_api.Types.string_ ->
  ?recommended_action_types:recommended_action_type_list ->
  ?criteria:criteria ->
  ?schedule:schedule ->
  ?status:rule_status ->
  ?tags:tag_list ->
  ?created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  create_automation_rule_response

val make_create_automation_rule_request :
  ?description:rule_description ->
  ?organization_configuration:organization_configuration ->
  ?priority:Smaws_Lib.Smithy_api.Types.string_ ->
  ?criteria:criteria ->
  ?tags:tag_list ->
  ?client_token:client_token ->
  name:rule_name ->
  rule_type:rule_type ->
  recommended_action_types:recommended_action_type_list ->
  schedule:schedule ->
  status:rule_status ->
  unit ->
  create_automation_rule_request
