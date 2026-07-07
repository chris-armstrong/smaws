open Types

val make_update_enrollment_configuration_response :
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  last_updated_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  status:enrollment_status ->
  unit ->
  update_enrollment_configuration_response

val make_update_enrollment_configuration_request :
  ?client_token:client_token ->
  status:enrollment_status ->
  unit ->
  update_enrollment_configuration_request

val make_organization_configuration :
  ?account_ids:organization_configuration_account_ids ->
  ?rule_apply_order:rule_apply_order ->
  unit ->
  organization_configuration

val make_string_criteria_condition :
  ?values:string_criteria_values ->
  ?comparison:comparison_operator ->
  unit ->
  string_criteria_condition

val make_integer_criteria_condition :
  ?values:integer_list -> ?comparison:comparison_operator -> unit -> integer_criteria_condition

val make_double_criteria_condition :
  ?values:double_list -> ?comparison:comparison_operator -> unit -> double_criteria_condition

val make_resource_tags_criteria_condition :
  ?values:string_criteria_values ->
  ?key:string_criteria_value ->
  ?comparison:comparison_operator ->
  unit ->
  resource_tags_criteria_condition

val make_criteria :
  ?restart_needed:string_criteria_condition_list ->
  ?look_back_period_in_days:integer_criteria_condition_list ->
  ?resource_tag:resource_tags_criteria_condition_list ->
  ?estimated_monthly_savings:double_criteria_condition_list ->
  ?ebs_volume_size_in_gib:integer_criteria_condition_list ->
  ?ebs_volume_type:string_criteria_condition_list ->
  ?resource_arn:string_criteria_condition_list ->
  ?region:string_criteria_condition_list ->
  unit ->
  criteria

val make_schedule :
  ?execution_window_in_minutes:Smaws_Lib.Smithy_api.Types.integer ->
  ?schedule_expression_timezone:Smaws_Lib.Smithy_api.Types.string_ ->
  ?schedule_expression:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  schedule

val make_update_automation_rule_response :
  ?last_updated_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?status:rule_status ->
  ?schedule:schedule ->
  ?criteria:criteria ->
  ?recommended_action_types:recommended_action_type_list ->
  ?priority:Smaws_Lib.Smithy_api.Types.string_ ->
  ?organization_configuration:organization_configuration ->
  ?rule_type:rule_type ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?name:rule_name ->
  ?rule_revision:Smaws_Lib.Smithy_api.Types.long ->
  ?rule_arn:rule_arn ->
  unit ->
  update_automation_rule_response

val make_update_automation_rule_request :
  ?client_token:client_token ->
  ?status:rule_status ->
  ?schedule:schedule ->
  ?criteria:criteria ->
  ?recommended_action_types:recommended_action_type_list ->
  ?priority:Smaws_Lib.Smithy_api.Types.string_ ->
  ?organization_configuration:organization_configuration ->
  ?rule_type:rule_type ->
  ?description:rule_description ->
  ?name:rule_name ->
  rule_revision:Smaws_Lib.Smithy_api.Types.long ->
  rule_arn:rule_arn ->
  unit ->
  update_automation_rule_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  ?client_token:client_token ->
  tag_keys:tag_key_list ->
  rule_revision:Smaws_Lib.Smithy_api.Types.long ->
  resource_arn:rule_arn ->
  unit ->
  untag_resource_request

val make_time_period :
  ?end_time_exclusive:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?start_time_inclusive:Smaws_Lib.Smithy_api.Types.timestamp ->
  unit ->
  time_period

val make_tag_resource_response : unit -> unit
val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_tag_resource_request :
  ?client_token:client_token ->
  tags:tag_list ->
  rule_revision:Smaws_Lib.Smithy_api.Types.long ->
  resource_arn:rule_arn ->
  unit ->
  tag_resource_request

val make_estimated_monthly_savings :
  savings_estimation_mode:savings_estimation_mode ->
  after_discount_savings:Smaws_Lib.Smithy_api.Types.double ->
  before_discount_savings:Smaws_Lib.Smithy_api.Types.double ->
  currency:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  estimated_monthly_savings

val make_summary_totals :
  ?estimated_monthly_savings:estimated_monthly_savings ->
  ?automation_event_count:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  summary_totals

val make_summary_dimension :
  value:Smaws_Lib.Smithy_api.Types.string_ -> key:summary_dimension_key -> unit -> summary_dimension

val make_start_automation_event_response :
  ?event_status:event_status ->
  ?event_id:event_id ->
  ?recommended_action_id:recommended_action_id ->
  unit ->
  start_automation_event_response

val make_start_automation_event_request :
  ?client_token:client_token ->
  recommended_action_id:recommended_action_id ->
  unit ->
  start_automation_event_request

val make_rule_preview_total :
  estimated_monthly_savings:estimated_monthly_savings ->
  recommended_action_count:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  rule_preview_total

val make_rollback_automation_event_response :
  ?event_status:event_status -> ?event_id:event_id -> unit -> rollback_automation_event_response

val make_rollback_automation_event_request :
  ?client_token:client_token -> event_id:event_id -> unit -> rollback_automation_event_request

val make_ebs_volume_configuration :
  ?throughput:Smaws_Lib.Smithy_api.Types.integer ->
  ?iops:Smaws_Lib.Smithy_api.Types.integer ->
  ?size_in_gib:Smaws_Lib.Smithy_api.Types.integer ->
  ?type_:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  ebs_volume_configuration

val make_ebs_volume : ?configuration:ebs_volume_configuration -> unit -> ebs_volume

val make_recommended_action :
  ?resource_tags:tag_list ->
  ?estimated_monthly_savings:estimated_monthly_savings ->
  ?restart_needed:Smaws_Lib.Smithy_api.Types.boolean_ ->
  ?recommended_resource_details:resource_details ->
  ?recommended_resource_summary:Smaws_Lib.Smithy_api.Types.string_ ->
  ?current_resource_details:resource_details ->
  ?current_resource_summary:Smaws_Lib.Smithy_api.Types.string_ ->
  ?recommended_action_type:recommended_action_type ->
  ?look_back_period_in_days:Smaws_Lib.Smithy_api.Types.integer ->
  ?resource_type:resource_type ->
  ?region:Smaws_Lib.Smithy_api.Types.string_ ->
  ?account_id:account_id ->
  ?resource_id:resource_id ->
  ?resource_arn:resource_arn ->
  ?recommended_action_id:recommended_action_id ->
  unit ->
  recommended_action

val make_recommended_action_total :
  estimated_monthly_savings:estimated_monthly_savings ->
  recommended_action_count:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  recommended_action_total

val make_recommended_action_summary :
  total:recommended_action_total ->
  key:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  recommended_action_summary

val make_recommended_action_filter :
  values:filter_values -> name:recommended_action_filter_name -> unit -> recommended_action_filter

val make_preview_result_summary :
  total:rule_preview_total ->
  key:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  preview_result_summary

val make_organization_scope :
  ?account_ids:organization_configuration_account_ids -> unit -> organization_scope

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:rule_arn -> unit -> list_tags_for_resource_request

val make_list_recommended_actions_response :
  ?next_token:next_token ->
  ?recommended_actions:recommended_actions ->
  unit ->
  list_recommended_actions_response

val make_list_recommended_actions_request :
  ?next_token:next_token ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?filters:recommended_action_filter_list ->
  unit ->
  list_recommended_actions_request

val make_list_recommended_action_summaries_response :
  ?next_token:next_token ->
  ?recommended_action_summaries:recommended_action_summaries ->
  unit ->
  list_recommended_action_summaries_response

val make_list_recommended_action_summaries_request :
  ?next_token:next_token ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?filters:recommended_action_filter_list ->
  unit ->
  list_recommended_action_summaries_request

val make_automation_rule :
  ?last_updated_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?status:rule_status ->
  ?schedule:schedule ->
  ?recommended_action_types:recommended_action_type_list ->
  ?priority:Smaws_Lib.Smithy_api.Types.string_ ->
  ?organization_configuration:organization_configuration ->
  ?account_id:account_id ->
  ?rule_revision:Smaws_Lib.Smithy_api.Types.long ->
  ?rule_type:rule_type ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?name:rule_name ->
  ?rule_id:rule_id ->
  ?rule_arn:rule_arn ->
  unit ->
  automation_rule

val make_list_automation_rules_response :
  ?next_token:next_token ->
  ?automation_rules:automation_rules ->
  unit ->
  list_automation_rules_response

val make_filter : values:filter_values -> name:automation_rule_filter_name -> unit -> filter

val make_list_automation_rules_request :
  ?next_token:next_token ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?filters:filter_list ->
  unit ->
  list_automation_rules_request

val make_list_automation_rule_preview_summaries_response :
  ?next_token:next_token ->
  ?preview_result_summaries:preview_result_summaries ->
  unit ->
  list_automation_rule_preview_summaries_response

val make_list_automation_rule_preview_summaries_request :
  ?next_token:next_token ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?criteria:criteria ->
  ?organization_scope:organization_scope ->
  recommended_action_types:recommended_action_type_list ->
  rule_type:rule_type ->
  unit ->
  list_automation_rule_preview_summaries_request

val make_list_automation_rule_preview_response :
  ?next_token:next_token ->
  ?preview_results:preview_results ->
  unit ->
  list_automation_rule_preview_response

val make_list_automation_rule_preview_request :
  ?next_token:next_token ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?criteria:criteria ->
  ?organization_scope:organization_scope ->
  recommended_action_types:recommended_action_type_list ->
  rule_type:rule_type ->
  unit ->
  list_automation_rule_preview_request

val make_automation_event :
  ?estimated_monthly_savings:estimated_monthly_savings ->
  ?completed_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?resource_type:resource_type ->
  ?rule_id:rule_id ->
  ?region:Smaws_Lib.Smithy_api.Types.string_ ->
  ?account_id:account_id ->
  ?recommended_action_id:recommended_action_id ->
  ?resource_id:resource_id ->
  ?resource_arn:resource_arn ->
  ?event_status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?event_status:event_status ->
  ?event_type:event_type ->
  ?event_description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?event_id:event_id ->
  unit ->
  automation_event

val make_list_automation_events_response :
  ?next_token:next_token ->
  ?automation_events:automation_events ->
  unit ->
  list_automation_events_response

val make_automation_event_filter :
  values:filter_values -> name:automation_event_filter_name -> unit -> automation_event_filter

val make_list_automation_events_request :
  ?next_token:next_token ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?end_time_exclusive:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?start_time_inclusive:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?filters:automation_event_filter_list ->
  unit ->
  list_automation_events_request

val make_automation_event_summary :
  ?total:summary_totals ->
  ?time_period:time_period ->
  ?dimensions:summary_dimensions ->
  ?key:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  automation_event_summary

val make_list_automation_event_summaries_response :
  ?next_token:next_token ->
  ?automation_event_summaries:automation_event_summary_list ->
  unit ->
  list_automation_event_summaries_response

val make_list_automation_event_summaries_request :
  ?next_token:next_token ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  ?end_date_exclusive:Smaws_Lib.Smithy_api.Types.string_ ->
  ?start_date_inclusive:Smaws_Lib.Smithy_api.Types.string_ ->
  ?filters:automation_event_filter_list ->
  unit ->
  list_automation_event_summaries_request

val make_automation_event_step :
  ?estimated_monthly_savings:estimated_monthly_savings ->
  ?completed_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?start_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?resource_id:resource_id ->
  ?step_status:step_status ->
  ?step_type:step_type ->
  ?step_id:step_id ->
  ?event_id:event_id ->
  unit ->
  automation_event_step

val make_list_automation_event_steps_response :
  ?next_token:next_token ->
  ?automation_event_steps:automation_event_steps ->
  unit ->
  list_automation_event_steps_response

val make_list_automation_event_steps_request :
  ?next_token:next_token ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  event_id:event_id ->
  unit ->
  list_automation_event_steps_request

val make_account_info :
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  last_updated_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  organization_rule_mode:organization_rule_mode ->
  status:enrollment_status ->
  account_id:account_id ->
  unit ->
  account_info

val make_list_accounts_response :
  ?next_token:next_token -> accounts:account_info_list -> unit -> list_accounts_response

val make_list_accounts_request :
  ?next_token:next_token ->
  ?max_results:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  list_accounts_request

val make_get_enrollment_configuration_response :
  ?last_updated_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?organization_rule_mode:organization_rule_mode ->
  ?status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  status:enrollment_status ->
  unit ->
  get_enrollment_configuration_response

val make_get_enrollment_configuration_request : unit -> unit

val make_get_automation_rule_response :
  ?last_updated_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?tags:tag_list ->
  ?status:rule_status ->
  ?schedule:schedule ->
  ?criteria:criteria ->
  ?recommended_action_types:recommended_action_type_list ->
  ?priority:Smaws_Lib.Smithy_api.Types.string_ ->
  ?organization_configuration:organization_configuration ->
  ?account_id:account_id ->
  ?rule_revision:Smaws_Lib.Smithy_api.Types.long ->
  ?rule_type:rule_type ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?name:rule_name ->
  ?rule_id:rule_id ->
  ?rule_arn:rule_arn ->
  unit ->
  get_automation_rule_response

val make_get_automation_rule_request : rule_arn:rule_arn -> unit -> get_automation_rule_request

val make_get_automation_event_response :
  ?estimated_monthly_savings:estimated_monthly_savings ->
  ?completed_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?resource_type:resource_type ->
  ?rule_id:rule_id ->
  ?region:Smaws_Lib.Smithy_api.Types.string_ ->
  ?account_id:account_id ->
  ?recommended_action_id:recommended_action_id ->
  ?resource_id:resource_id ->
  ?resource_arn:resource_arn ->
  ?event_status_reason:Smaws_Lib.Smithy_api.Types.string_ ->
  ?event_status:event_status ->
  ?event_type:event_type ->
  ?event_description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?event_id:event_id ->
  unit ->
  get_automation_event_response

val make_get_automation_event_request : event_id:event_id -> unit -> get_automation_event_request

val make_disassociate_accounts_response :
  ?errors:string_list -> ?account_ids:account_id_list -> unit -> disassociate_accounts_response

val make_disassociate_accounts_request :
  ?client_token:client_token -> account_ids:account_id_list -> unit -> disassociate_accounts_request

val make_delete_automation_rule_response : unit -> unit

val make_delete_automation_rule_request :
  ?client_token:client_token ->
  rule_revision:Smaws_Lib.Smithy_api.Types.long ->
  rule_arn:rule_arn ->
  unit ->
  delete_automation_rule_request

val make_create_automation_rule_response :
  ?created_timestamp:Smaws_Lib.Smithy_api.Types.timestamp ->
  ?tags:tag_list ->
  ?status:rule_status ->
  ?schedule:schedule ->
  ?criteria:criteria ->
  ?recommended_action_types:recommended_action_type_list ->
  ?priority:Smaws_Lib.Smithy_api.Types.string_ ->
  ?organization_configuration:organization_configuration ->
  ?rule_revision:Smaws_Lib.Smithy_api.Types.long ->
  ?rule_type:rule_type ->
  ?description:Smaws_Lib.Smithy_api.Types.string_ ->
  ?name:rule_name ->
  ?rule_id:rule_id ->
  ?rule_arn:rule_arn ->
  unit ->
  create_automation_rule_response

val make_create_automation_rule_request :
  ?client_token:client_token ->
  ?tags:tag_list ->
  ?criteria:criteria ->
  ?priority:Smaws_Lib.Smithy_api.Types.string_ ->
  ?organization_configuration:organization_configuration ->
  ?description:rule_description ->
  status:rule_status ->
  schedule:schedule ->
  recommended_action_types:recommended_action_type_list ->
  rule_type:rule_type ->
  name:rule_name ->
  unit ->
  create_automation_rule_request

val make_associate_accounts_response :
  ?errors:string_list -> ?account_ids:account_id_list -> unit -> associate_accounts_response

val make_associate_accounts_request :
  ?client_token:client_token -> account_ids:account_id_list -> unit -> associate_accounts_request
