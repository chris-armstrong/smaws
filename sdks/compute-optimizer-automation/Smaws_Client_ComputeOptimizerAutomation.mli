(** Compute Optimizer Automation client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module AssociateAccounts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `NotManagementAccountException of not_management_account_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_accounts_request ->
    ( associate_accounts_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NotManagementAccountException of not_management_account_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_accounts_request ->
    ( associate_accounts_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NotManagementAccountException of not_management_account_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates one or more member accounts with your organization's management account, enabling \
   centralized implementation of optimization actions across those accounts. Once associated, the \
   management account (or a delegated administrator) can apply recommended actions to the member \
   account. When you associate a member account, its organization rule mode is automatically set \
   to \"Any allowed,\" which permits the management account to create Automation rules that \
   automatically apply actions to that account. If the member account has not previously enabled \
   the Automation feature, the association process automatically enables it.\n\n\
  \  Only the management account or a delegated administrator can perform this action.\n\
  \  \n\
  \   "]

module CreateAutomationRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_automation_rule_request ->
    ( create_automation_rule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_automation_rule_request ->
    ( create_automation_rule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Creates a new automation rule to apply recommended actions to resources based on specified \
   criteria. \n"]

module DeleteAutomationRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_automation_rule_request ->
    ( delete_automation_rule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_automation_rule_request ->
    ( delete_automation_rule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Deletes an existing automation rule. \n"]

module DisassociateAccounts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `NotManagementAccountException of not_management_account_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_accounts_request ->
    ( disassociate_accounts_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NotManagementAccountException of not_management_account_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_accounts_request ->
    ( disassociate_accounts_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NotManagementAccountException of not_management_account_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Disassociates member accounts from your organization's management account, removing \
   centralized automation capabilities. Once disassociated, organization rules no longer apply to \
   the member account, and the management account (or delegated administrator) cannot create \
   Automation rules for that account. \n\n\
  \  Only the management account or a delegated administrator can perform this action.\n\
  \  \n\
  \   "]

module GetAutomationEvent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_automation_event_request ->
    ( get_automation_event_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_automation_event_request ->
    ( get_automation_event_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Retrieves details about a specific automation event. \n"]

module GetAutomationRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_automation_rule_request ->
    ( get_automation_rule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_automation_rule_request ->
    ( get_automation_rule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Retrieves details about a specific automation rule. \n"]

module GetEnrollmentConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_enrollment_configuration_request ->
    ( get_enrollment_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_enrollment_configuration_request ->
    ( get_enrollment_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Retrieves the current enrollment configuration for Compute Optimizer Automation. \n"]

module ListAccounts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `NotManagementAccountException of not_management_account_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_accounts_request ->
    ( list_accounts_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NotManagementAccountException of not_management_account_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_accounts_request ->
    ( list_accounts_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NotManagementAccountException of not_management_account_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Lists the accounts in your organization that are enrolled in Compute Optimizer and whether \
   they have enabled Automation. \n\n\
  \  Only the management account or a delegated administrator can perform this action.\n\
  \  \n\
  \   "]

module ListAutomationEventSteps : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_automation_event_steps_request ->
    ( list_automation_event_steps_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_automation_event_steps_request ->
    ( list_automation_event_steps_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the steps for a specific automation event. You can only list steps for events created \
   within the past year. \n"]

module ListAutomationEventSummaries : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_automation_event_summaries_request ->
    ( list_automation_event_summaries_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_automation_event_summaries_request ->
    ( list_automation_event_summaries_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides a summary of automation events based on specified filters. Only events created within \
   the past year will be included in the summary. \n"]

module ListAutomationEvents : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_automation_events_request ->
    ( list_automation_events_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_automation_events_request ->
    ( list_automation_events_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists automation events based on specified filters. You can retrieve events that were created \
   within the past year. \n"]

module ListAutomationRulePreview : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_automation_rule_preview_request ->
    ( list_automation_rule_preview_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_automation_rule_preview_request ->
    ( list_automation_rule_preview_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a preview of the recommended actions that match your Automation rule's configuration \
   and criteria. \n"]

module ListAutomationRulePreviewSummaries : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_automation_rule_preview_summaries_request ->
    ( list_automation_rule_preview_summaries_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_automation_rule_preview_summaries_request ->
    ( list_automation_rule_preview_summaries_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a summary of the recommended actions that match your rule preview configuration and \
   criteria. \n"]

module ListAutomationRules : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_automation_rules_request ->
    ( list_automation_rules_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_automation_rules_request ->
    ( list_automation_rules_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Lists the automation rules that match specified filters. \n"]

module ListRecommendedActionSummaries : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_recommended_action_summaries_request ->
    ( list_recommended_action_summaries_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_recommended_action_summaries_request ->
    ( list_recommended_action_summaries_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Provides a summary of recommended actions based on specified filters. \n\n\
  \  Management accounts and delegated administrators can retrieve recommended actions that \
   include associated member accounts. You can associate a member account using \
   [AssociateAccounts].\n\
  \  \n\
  \   "]

module ListRecommendedActions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_recommended_actions_request ->
    ( list_recommended_actions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_recommended_actions_request ->
    ( list_recommended_actions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Lists the recommended actions based that match specified filters. \n\n\
  \  Management accounts and delegated administrators can retrieve recommended actions that \
   include associated member accounts. You can associate a member account using \
   [AssociateAccounts].\n\
  \  \n\
  \   "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Lists the tags for a specified resource. \n"]

module RollbackAutomationEvent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    rollback_automation_event_request ->
    ( rollback_automation_event_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    rollback_automation_event_request ->
    ( rollback_automation_event_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Initiates a rollback for a completed automation event. \n\n\
  \  Management accounts and delegated administrators can only initiate a rollback for events \
   belonging to associated member accounts. You can associate a member account using \
   [AssociateAccounts].\n\
  \  \n\
  \   "]

module StartAutomationEvent : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_automation_event_request ->
    ( start_automation_event_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_automation_event_request ->
    ( start_automation_event_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Initiates a one-time, on-demand automation for the specified recommended action. \n\n\
  \  Management accounts and delegated administrators can only initiate recommended actions for \
   associated member accounts. You can associate a member account using [AssociateAccounts].\n\
  \  \n\
  \   "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Adds tags to the specified resource. \n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Removes tags from the specified resource. \n"]

module UpdateAutomationRule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_automation_rule_request ->
    ( update_automation_rule_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_automation_rule_request ->
    ( update_automation_rule_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Updates an existing automation rule. \n"]

(** {1:Serialization and Deserialization} *)
module UpdateEnrollmentConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ForbiddenException of forbidden_exception
    | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
    | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
    | `InternalServerException of internal_server_exception
    | `InvalidParameterValueException of invalid_parameter_value_exception
    | `NotManagementAccountException of not_management_account_exception
    | `OptInRequiredException of opt_in_required_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_enrollment_configuration_request ->
    ( update_enrollment_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NotManagementAccountException of not_management_account_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_enrollment_configuration_request ->
    ( update_enrollment_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ForbiddenException of forbidden_exception
      | `IdempotencyTokenInUseException of idempotency_token_in_use_exception
      | `IdempotentParameterMismatchException of idempotent_parameter_mismatch_exception
      | `InternalServerException of internal_server_exception
      | `InvalidParameterValueException of invalid_parameter_value_exception
      | `NotManagementAccountException of not_management_account_exception
      | `OptInRequiredException of opt_in_required_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates your account\226\128\153s Compute Optimizer Automation enrollment configuration. \n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
