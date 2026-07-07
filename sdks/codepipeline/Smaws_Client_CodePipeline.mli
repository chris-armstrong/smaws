(** CodePipeline client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_webhook_filter_rule :
  ?match_equals:match_equals -> json_path:json_path -> unit -> webhook_filter_rule

val make_webhook_auth_configuration :
  ?secret_token:webhook_auth_configuration_secret_token ->
  ?allowed_ip_range:webhook_auth_configuration_allowed_ip_range ->
  unit ->
  webhook_auth_configuration

val make_webhook_definition :
  authentication_configuration:webhook_auth_configuration ->
  authentication:webhook_authentication_type ->
  filters:webhook_filters ->
  target_action:action_name ->
  target_pipeline:pipeline_name ->
  name:webhook_name ->
  unit ->
  webhook_definition

val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_list_webhook_item :
  ?tags:tag_list ->
  ?arn:webhook_arn ->
  ?last_triggered:webhook_last_triggered ->
  ?error_code:webhook_error_code ->
  ?error_message:webhook_error_message ->
  url:webhook_url ->
  definition:webhook_definition ->
  unit ->
  list_webhook_item

val make_encryption_key :
  type_:encryption_key_type -> id:encryption_key_id -> unit -> encryption_key

val make_artifact_store :
  ?encryption_key:encryption_key ->
  location:artifact_store_location ->
  type_:artifact_store_type ->
  unit ->
  artifact_store

val make_blocker_declaration :
  type_:blocker_type -> name:blocker_name -> unit -> blocker_declaration

val make_action_type_id :
  version:version ->
  provider:action_provider ->
  owner:action_owner ->
  category:action_category ->
  unit ->
  action_type_id

val make_output_artifact : ?files:file_path_list -> name:artifact_name -> unit -> output_artifact
val make_input_artifact : name:artifact_name -> unit -> input_artifact

val make_environment_variable :
  ?type_:environment_variable_type ->
  value:environment_variable_value ->
  name:environment_variable_name ->
  unit ->
  environment_variable

val make_action_declaration :
  ?environment_variables:environment_variable_list ->
  ?timeout_in_minutes:action_timeout ->
  ?namespace:action_namespace ->
  ?region:aws_region_name ->
  ?role_arn:role_arn ->
  ?output_variables:output_variable_list ->
  ?input_artifacts:input_artifact_list ->
  ?output_artifacts:output_artifact_list ->
  ?commands:command_list ->
  ?configuration:action_configuration_map ->
  ?run_order:action_run_order ->
  action_type_id:action_type_id ->
  name:action_name ->
  unit ->
  action_declaration

val make_retry_configuration : ?retry_mode:stage_retry_mode -> unit -> retry_configuration

val make_rule_type_id :
  ?version:version ->
  ?owner:rule_owner ->
  provider:rule_provider ->
  category:rule_category ->
  unit ->
  rule_type_id

val make_rule_declaration :
  ?timeout_in_minutes:rule_timeout ->
  ?region:aws_region_name ->
  ?role_arn:role_arn ->
  ?input_artifacts:input_artifact_list ->
  ?commands:command_list ->
  ?configuration:rule_configuration_map ->
  rule_type_id:rule_type_id ->
  name:rule_name ->
  unit ->
  rule_declaration

val make_condition : ?rules:rule_declaration_list -> ?result_:result_ -> unit -> condition

val make_failure_conditions :
  ?conditions:condition_list ->
  ?retry_configuration:retry_configuration ->
  ?result_:result_ ->
  unit ->
  failure_conditions

val make_success_conditions : conditions:condition_list -> unit -> success_conditions
val make_before_entry_conditions : conditions:condition_list -> unit -> before_entry_conditions

val make_stage_declaration :
  ?before_entry:before_entry_conditions ->
  ?on_success:success_conditions ->
  ?on_failure:failure_conditions ->
  ?blockers:stage_blocker_declaration_list ->
  actions:stage_action_declaration_list ->
  name:stage_name ->
  unit ->
  stage_declaration

val make_pipeline_variable_declaration :
  ?description:pipeline_variable_description ->
  ?default_value:pipeline_variable_value ->
  name:pipeline_variable_name ->
  unit ->
  pipeline_variable_declaration

val make_git_tag_filter_criteria :
  ?excludes:git_tag_pattern_list ->
  ?includes:git_tag_pattern_list ->
  unit ->
  git_tag_filter_criteria

val make_git_branch_filter_criteria :
  ?excludes:git_branch_pattern_list ->
  ?includes:git_branch_pattern_list ->
  unit ->
  git_branch_filter_criteria

val make_git_file_path_filter_criteria :
  ?excludes:git_file_path_pattern_list ->
  ?includes:git_file_path_pattern_list ->
  unit ->
  git_file_path_filter_criteria

val make_git_push_filter :
  ?file_paths:git_file_path_filter_criteria ->
  ?branches:git_branch_filter_criteria ->
  ?tags:git_tag_filter_criteria ->
  unit ->
  git_push_filter

val make_git_pull_request_filter :
  ?file_paths:git_file_path_filter_criteria ->
  ?branches:git_branch_filter_criteria ->
  ?events:git_pull_request_event_type_list ->
  unit ->
  git_pull_request_filter

val make_git_configuration :
  ?pull_request:git_pull_request_filter_list ->
  ?push:git_push_filter_list ->
  source_action_name:action_name ->
  unit ->
  git_configuration

val make_pipeline_trigger_declaration :
  git_configuration:git_configuration ->
  provider_type:pipeline_trigger_provider_type ->
  unit ->
  pipeline_trigger_declaration

val make_pipeline_declaration :
  ?triggers:pipeline_trigger_declaration_list ->
  ?variables:pipeline_variable_declaration_list ->
  ?pipeline_type:pipeline_type ->
  ?execution_mode:execution_mode ->
  ?version:pipeline_version ->
  ?artifact_stores:artifact_store_map ->
  ?artifact_store:artifact_store ->
  stages:pipeline_stage_declaration_list ->
  role_arn:role_arn ->
  name:pipeline_name ->
  unit ->
  pipeline_declaration

val make_update_pipeline_output : ?pipeline:pipeline_declaration -> unit -> update_pipeline_output
val make_update_pipeline_input : pipeline:pipeline_declaration -> unit -> update_pipeline_input

val make_lambda_executor_configuration :
  lambda_function_arn:lambda_function_arn -> unit -> lambda_executor_configuration

val make_job_worker_executor_configuration :
  ?polling_service_principals:polling_service_principal_list ->
  ?polling_accounts:polling_account_list ->
  unit ->
  job_worker_executor_configuration

val make_executor_configuration :
  ?job_worker_executor_configuration:job_worker_executor_configuration ->
  ?lambda_executor_configuration:lambda_executor_configuration ->
  unit ->
  executor_configuration

val make_action_type_executor :
  ?job_timeout:job_timeout ->
  ?policy_statements_template:policy_statements_template ->
  type_:executor_type ->
  configuration:executor_configuration ->
  unit ->
  action_type_executor

val make_action_type_identifier :
  version:version ->
  provider:action_provider ->
  owner:action_type_owner ->
  category:action_category ->
  unit ->
  action_type_identifier

val make_action_type_artifact_details :
  maximum_count:maximum_action_type_artifact_count ->
  minimum_count:minimum_action_type_artifact_count ->
  unit ->
  action_type_artifact_details

val make_action_type_permissions :
  allowed_accounts:allowed_accounts -> unit -> action_type_permissions

val make_action_type_property :
  ?description:property_description ->
  ?queryable:boolean_ ->
  no_echo:boolean_ ->
  key:boolean_ ->
  optional:boolean_ ->
  name:action_configuration_key ->
  unit ->
  action_type_property

val make_action_type_urls :
  ?revision_url_template:url_template ->
  ?execution_url_template:url_template ->
  ?entity_url_template:url_template ->
  ?configuration_url:url ->
  unit ->
  action_type_urls

val make_action_type_declaration :
  ?urls:action_type_urls ->
  ?properties:action_type_properties ->
  ?permissions:action_type_permissions ->
  ?description:action_type_description ->
  output_artifact_details:action_type_artifact_details ->
  input_artifact_details:action_type_artifact_details ->
  id:action_type_identifier ->
  executor:action_type_executor ->
  unit ->
  action_type_declaration

val make_update_action_type_input :
  action_type:action_type_declaration -> unit -> update_action_type_input

val make_untag_resource_output : unit -> unit

val make_untag_resource_input :
  tag_keys:tag_key_list -> resource_arn:resource_arn -> unit -> untag_resource_input

val make_transition_state :
  ?disabled_reason:disabled_reason ->
  ?last_changed_at:last_changed_at ->
  ?last_changed_by:last_changed_by ->
  ?enabled:enabled ->
  unit ->
  transition_state

val make_third_party_job : ?job_id:job_id -> ?client_id:client_id -> unit -> third_party_job

val make_action_configuration :
  ?configuration:action_configuration_map -> unit -> action_configuration

val make_stage_context : ?name:stage_name -> unit -> stage_context

val make_action_context :
  ?action_execution_id:action_execution_id -> ?name:action_name -> unit -> action_context

val make_pipeline_context :
  ?pipeline_execution_id:pipeline_execution_id ->
  ?pipeline_arn:pipeline_arn ->
  ?action:action_context ->
  ?stage:stage_context ->
  ?pipeline_name:pipeline_name ->
  unit ->
  pipeline_context

val make_s3_artifact_location :
  object_key:s3_object_key -> bucket_name:s3_bucket_name -> unit -> s3_artifact_location

val make_artifact_location :
  ?s3_location:s3_artifact_location -> ?type_:artifact_location_type -> unit -> artifact_location

val make_artifact :
  ?location:artifact_location -> ?revision:revision -> ?name:artifact_name -> unit -> artifact

val make_aws_session_credentials :
  session_token:session_token ->
  secret_access_key:secret_access_key ->
  access_key_id:access_key_id ->
  unit ->
  aws_session_credentials

val make_third_party_job_data :
  ?encryption_key:encryption_key ->
  ?continuation_token:continuation_token ->
  ?artifact_credentials:aws_session_credentials ->
  ?output_artifacts:artifact_list ->
  ?input_artifacts:artifact_list ->
  ?pipeline_context:pipeline_context ->
  ?action_configuration:action_configuration ->
  ?action_type_id:action_type_id ->
  unit ->
  third_party_job_data

val make_third_party_job_details :
  ?nonce:nonce ->
  ?data:third_party_job_data ->
  ?id:third_party_job_id ->
  unit ->
  third_party_job_details

val make_target_filter :
  ?values:target_filter_value_list -> ?name:target_filter_name -> unit -> target_filter

val make_tag_resource_output : unit -> unit

val make_tag_resource_input :
  tags:tag_list -> resource_arn:resource_arn -> unit -> tag_resource_input

val make_succeeded_in_stage_filter : ?stage_name:stage_name -> unit -> succeeded_in_stage_filter

val make_stop_pipeline_execution_output :
  ?pipeline_execution_id:pipeline_execution_id -> unit -> stop_pipeline_execution_output

val make_stop_pipeline_execution_input :
  ?reason:stop_pipeline_execution_reason ->
  ?abandon:boolean_ ->
  pipeline_execution_id:pipeline_execution_id ->
  pipeline_name:pipeline_name ->
  unit ->
  stop_pipeline_execution_input

val make_stop_execution_trigger :
  ?reason:stop_pipeline_execution_reason -> unit -> stop_execution_trigger

val make_start_pipeline_execution_output :
  ?pipeline_execution_id:pipeline_execution_id -> unit -> start_pipeline_execution_output

val make_pipeline_variable :
  value:pipeline_variable_value -> name:pipeline_variable_name -> unit -> pipeline_variable

val make_source_revision_override :
  revision_value:revision ->
  revision_type:source_revision_type ->
  action_name:action_name ->
  unit ->
  source_revision_override

val make_start_pipeline_execution_input :
  ?source_revisions:source_revision_override_list ->
  ?client_request_token:client_request_token ->
  ?variables:pipeline_variable_list ->
  name:pipeline_name ->
  unit ->
  start_pipeline_execution_input

val make_stage_execution :
  ?type_:execution_type ->
  status:stage_execution_status ->
  pipeline_execution_id:pipeline_execution_id ->
  unit ->
  stage_execution

val make_action_revision :
  created:timestamp ->
  revision_change_id:revision_change_identifier ->
  revision_id:revision ->
  unit ->
  action_revision

val make_error_details : ?message:message -> ?code:code -> unit -> error_details

val make_action_execution :
  ?log_stream_ar_n:log_stream_ar_n ->
  ?error_details:error_details ->
  ?percent_complete:percentage ->
  ?external_execution_url:url ->
  ?external_execution_id:execution_id ->
  ?last_updated_by:last_updated_by ->
  ?token:action_execution_token ->
  ?last_status_change:timestamp ->
  ?summary:execution_summary ->
  ?status:action_execution_status ->
  ?action_execution_id:action_execution_id ->
  unit ->
  action_execution

val make_action_state :
  ?revision_url:url ->
  ?entity_url:url ->
  ?latest_execution:action_execution ->
  ?current_revision:action_revision ->
  ?action_name:action_name ->
  unit ->
  action_state

val make_stage_conditions_execution :
  ?summary:execution_summary ->
  ?status:condition_execution_status ->
  unit ->
  stage_conditions_execution

val make_condition_execution :
  ?last_status_change:timestamp ->
  ?summary:execution_summary ->
  ?status:condition_execution_status ->
  unit ->
  condition_execution

val make_rule_revision :
  created:timestamp ->
  revision_change_id:revision_change_identifier ->
  revision_id:revision ->
  unit ->
  rule_revision

val make_rule_execution :
  ?error_details:error_details ->
  ?external_execution_url:url ->
  ?external_execution_id:execution_id ->
  ?last_updated_by:last_updated_by ->
  ?token:rule_execution_token ->
  ?last_status_change:timestamp ->
  ?summary:execution_summary ->
  ?status:rule_execution_status ->
  ?rule_execution_id:rule_execution_id ->
  unit ->
  rule_execution

val make_rule_state :
  ?revision_url:url ->
  ?entity_url:url ->
  ?latest_execution:rule_execution ->
  ?current_revision:rule_revision ->
  ?rule_name:rule_name ->
  unit ->
  rule_state

val make_condition_state :
  ?rule_states:rule_state_list -> ?latest_execution:condition_execution -> unit -> condition_state

val make_stage_condition_state :
  ?condition_states:condition_state_list ->
  ?latest_execution:stage_conditions_execution ->
  unit ->
  stage_condition_state

val make_retry_stage_metadata :
  ?latest_retry_trigger:retry_trigger ->
  ?manual_stage_retry_attempt:retry_attempt ->
  ?auto_stage_retry_attempt:retry_attempt ->
  unit ->
  retry_stage_metadata

val make_stage_state :
  ?retry_stage_metadata:retry_stage_metadata ->
  ?on_failure_condition_state:stage_condition_state ->
  ?on_success_condition_state:stage_condition_state ->
  ?before_entry_condition_state:stage_condition_state ->
  ?latest_execution:stage_execution ->
  ?action_states:action_state_list ->
  ?inbound_transition_state:transition_state ->
  ?inbound_executions:stage_execution_list ->
  ?inbound_execution:stage_execution ->
  ?stage_name:stage_name ->
  unit ->
  stage_state

val make_source_revision :
  ?revision_url:url ->
  ?revision_summary:revision_summary ->
  ?revision_id:revision ->
  action_name:action_name ->
  unit ->
  source_revision

val make_s3_location : ?key:s3_key -> ?bucket:s3_bucket -> unit -> s3_location

val make_rule_type_settings :
  ?revision_url_template:url_template ->
  ?execution_url_template:url_template ->
  ?entity_url_template:url_template ->
  ?third_party_configuration_url:url ->
  unit ->
  rule_type_settings

val make_rule_configuration_property :
  ?type_:rule_configuration_property_type ->
  ?description:description ->
  ?queryable:boolean_ ->
  secret:boolean_ ->
  key:boolean_ ->
  required:boolean_ ->
  name:rule_configuration_key ->
  unit ->
  rule_configuration_property

val make_artifact_details :
  maximum_count:maximum_artifact_count ->
  minimum_count:minimum_artifact_count ->
  unit ->
  artifact_details

val make_rule_type :
  ?rule_configuration_properties:rule_configuration_property_list ->
  ?settings:rule_type_settings ->
  input_artifact_details:artifact_details ->
  id:rule_type_id ->
  unit ->
  rule_type

val make_rule_execution_output :
  ?execution_result:rule_execution_result -> unit -> rule_execution_output

val make_artifact_detail : ?s3location:s3_location -> ?name:artifact_name -> unit -> artifact_detail

val make_rule_execution_input :
  ?input_artifacts:artifact_detail_list ->
  ?region:aws_region_name ->
  ?role_arn:role_arn ->
  ?resolved_configuration:resolved_rule_configuration_map ->
  ?configuration:rule_configuration_map ->
  ?rule_type_id:rule_type_id ->
  unit ->
  rule_execution_input

val make_latest_in_pipeline_execution_filter :
  start_time_range:start_time_range ->
  pipeline_execution_id:pipeline_execution_id ->
  unit ->
  latest_in_pipeline_execution_filter

val make_rule_execution_filter :
  ?latest_in_pipeline_execution:latest_in_pipeline_execution_filter ->
  ?pipeline_execution_id:pipeline_execution_id ->
  unit ->
  rule_execution_filter

val make_rule_execution_detail :
  ?output:rule_execution_output ->
  ?input:rule_execution_input ->
  ?status:rule_execution_status ->
  ?updated_by:last_updated_by ->
  ?last_update_time:timestamp ->
  ?start_time:timestamp ->
  ?rule_name:rule_name ->
  ?stage_name:stage_name ->
  ?pipeline_version:pipeline_version ->
  ?rule_execution_id:rule_execution_id ->
  ?pipeline_execution_id:pipeline_execution_id ->
  unit ->
  rule_execution_detail

val make_rollback_stage_output :
  pipeline_execution_id:pipeline_execution_id -> unit -> rollback_stage_output

val make_rollback_stage_input :
  target_pipeline_execution_id:pipeline_execution_id ->
  stage_name:stage_name ->
  pipeline_name:pipeline_name ->
  unit ->
  rollback_stage_input

val make_retry_stage_execution_output :
  ?pipeline_execution_id:pipeline_execution_id -> unit -> retry_stage_execution_output

val make_retry_stage_execution_input :
  retry_mode:stage_retry_mode ->
  pipeline_execution_id:pipeline_execution_id ->
  stage_name:stage_name ->
  pipeline_name:pipeline_name ->
  unit ->
  retry_stage_execution_input

val make_resolved_pipeline_variable :
  ?resolved_value:string_ -> ?name:string_ -> unit -> resolved_pipeline_variable

val make_register_webhook_with_third_party_output : unit -> unit

val make_register_webhook_with_third_party_input :
  ?webhook_name:webhook_name -> unit -> register_webhook_with_third_party_input

val make_put_webhook_output : ?webhook:list_webhook_item -> unit -> put_webhook_output

val make_put_webhook_input :
  ?tags:tag_list -> webhook:webhook_definition -> unit -> put_webhook_input

val make_current_revision :
  ?revision_summary:revision_summary ->
  ?created:time ->
  change_identifier:revision_change_identifier ->
  revision:revision ->
  unit ->
  current_revision

val make_execution_details :
  ?percent_complete:percentage ->
  ?external_execution_id:execution_id ->
  ?summary:execution_summary ->
  unit ->
  execution_details

val make_put_third_party_job_success_result_input :
  ?execution_details:execution_details ->
  ?continuation_token:continuation_token ->
  ?current_revision:current_revision ->
  client_token:client_token ->
  job_id:third_party_job_id ->
  unit ->
  put_third_party_job_success_result_input

val make_failure_details :
  ?external_execution_id:execution_id ->
  message:message ->
  type_:failure_type ->
  unit ->
  failure_details

val make_put_third_party_job_failure_result_input :
  failure_details:failure_details ->
  client_token:client_token ->
  job_id:third_party_job_id ->
  unit ->
  put_third_party_job_failure_result_input

val make_put_job_success_result_input :
  ?output_variables:output_variables_map ->
  ?execution_details:execution_details ->
  ?continuation_token:continuation_token ->
  ?current_revision:current_revision ->
  job_id:job_id ->
  unit ->
  put_job_success_result_input

val make_put_job_failure_result_input :
  failure_details:failure_details -> job_id:job_id -> unit -> put_job_failure_result_input

val make_put_approval_result_output : ?approved_at:timestamp -> unit -> put_approval_result_output

val make_put_approval_result_input :
  token:approval_token ->
  result_:approval_result ->
  action_name:action_name ->
  stage_name:stage_name ->
  pipeline_name:pipeline_name ->
  unit ->
  put_approval_result_input

val make_put_action_revision_output :
  ?pipeline_execution_id:pipeline_execution_id ->
  ?new_revision:boolean_ ->
  unit ->
  put_action_revision_output

val make_put_action_revision_input :
  action_revision:action_revision ->
  action_name:action_name ->
  stage_name:stage_name ->
  pipeline_name:pipeline_name ->
  unit ->
  put_action_revision_input

val make_poll_for_third_party_jobs_output :
  ?jobs:third_party_job_list -> unit -> poll_for_third_party_jobs_output

val make_poll_for_third_party_jobs_input :
  ?max_batch_size:max_batch_size ->
  action_type_id:action_type_id ->
  unit ->
  poll_for_third_party_jobs_input

val make_job_data :
  ?encryption_key:encryption_key ->
  ?continuation_token:continuation_token ->
  ?artifact_credentials:aws_session_credentials ->
  ?output_artifacts:artifact_list ->
  ?input_artifacts:artifact_list ->
  ?pipeline_context:pipeline_context ->
  ?action_configuration:action_configuration ->
  ?action_type_id:action_type_id ->
  unit ->
  job_data

val make_job : ?account_id:account_id -> ?nonce:nonce -> ?data:job_data -> ?id:job_id -> unit -> job
val make_poll_for_jobs_output : ?jobs:job_list -> unit -> poll_for_jobs_output

val make_poll_for_jobs_input :
  ?query_param:query_param_map ->
  ?max_batch_size:max_batch_size ->
  action_type_id:action_type_id ->
  unit ->
  poll_for_jobs_input

val make_pipeline_summary :
  ?updated:timestamp ->
  ?created:timestamp ->
  ?execution_mode:execution_mode ->
  ?pipeline_type:pipeline_type ->
  ?version:pipeline_version ->
  ?name:pipeline_name ->
  unit ->
  pipeline_summary

val make_pipeline_rollback_metadata :
  ?rollback_target_pipeline_execution_id:pipeline_execution_id -> unit -> pipeline_rollback_metadata

val make_pipeline_metadata :
  ?polling_disabled_at:timestamp ->
  ?updated:timestamp ->
  ?created:timestamp ->
  ?pipeline_arn:pipeline_arn ->
  unit ->
  pipeline_metadata

val make_execution_trigger :
  ?trigger_detail:trigger_detail -> ?trigger_type:trigger_type -> unit -> execution_trigger

val make_pipeline_execution_summary :
  ?rollback_metadata:pipeline_rollback_metadata ->
  ?execution_type:execution_type ->
  ?execution_mode:execution_mode ->
  ?stop_trigger:stop_execution_trigger ->
  ?trigger:execution_trigger ->
  ?source_revisions:source_revision_list ->
  ?last_update_time:timestamp ->
  ?start_time:timestamp ->
  ?status_summary:pipeline_execution_status_summary ->
  ?status:pipeline_execution_status ->
  ?pipeline_execution_id:pipeline_execution_id ->
  unit ->
  pipeline_execution_summary

val make_pipeline_execution_filter :
  ?succeeded_in_stage:succeeded_in_stage_filter -> unit -> pipeline_execution_filter

val make_artifact_revision :
  ?revision_url:url ->
  ?created:timestamp ->
  ?revision_summary:revision_summary ->
  ?revision_change_identifier:revision_change_identifier ->
  ?revision_id:revision ->
  ?name:artifact_name ->
  unit ->
  artifact_revision

val make_pipeline_execution :
  ?rollback_metadata:pipeline_rollback_metadata ->
  ?execution_type:execution_type ->
  ?execution_mode:execution_mode ->
  ?trigger:execution_trigger ->
  ?variables:resolved_pipeline_variable_list ->
  ?artifact_revisions:artifact_revision_list ->
  ?status_summary:pipeline_execution_status_summary ->
  ?status:pipeline_execution_status ->
  ?pipeline_execution_id:pipeline_execution_id ->
  ?pipeline_version:pipeline_version ->
  ?pipeline_name:pipeline_name ->
  unit ->
  pipeline_execution

val make_override_stage_condition_input :
  condition_type:condition_type ->
  pipeline_execution_id:pipeline_execution_id ->
  stage_name:stage_name ->
  pipeline_name:pipeline_name ->
  unit ->
  override_stage_condition_input

val make_list_webhooks_output :
  ?next_token:next_token -> ?webhooks:webhook_list -> unit -> list_webhooks_output

val make_list_webhooks_input :
  ?max_results:max_results -> ?next_token:next_token -> unit -> list_webhooks_input

val make_list_tags_for_resource_output :
  ?next_token:next_token -> ?tags:tag_list -> unit -> list_tags_for_resource_output

val make_list_tags_for_resource_input :
  ?max_results:max_results ->
  ?next_token:next_token ->
  resource_arn:resource_arn ->
  unit ->
  list_tags_for_resource_input

val make_list_rule_types_output : rule_types:rule_type_list -> unit -> list_rule_types_output

val make_list_rule_types_input :
  ?region_filter:aws_region_name -> ?rule_owner_filter:rule_owner -> unit -> list_rule_types_input

val make_list_rule_executions_output :
  ?next_token:next_token ->
  ?rule_execution_details:rule_execution_detail_list ->
  unit ->
  list_rule_executions_output

val make_list_rule_executions_input :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filter:rule_execution_filter ->
  pipeline_name:pipeline_name ->
  unit ->
  list_rule_executions_input

val make_list_pipelines_output :
  ?next_token:next_token -> ?pipelines:pipeline_list -> unit -> list_pipelines_output

val make_list_pipelines_input :
  ?max_results:max_pipelines -> ?next_token:next_token -> unit -> list_pipelines_input

val make_list_pipeline_executions_output :
  ?next_token:next_token ->
  ?pipeline_execution_summaries:pipeline_execution_summary_list ->
  unit ->
  list_pipeline_executions_output

val make_list_pipeline_executions_input :
  ?next_token:next_token ->
  ?filter:pipeline_execution_filter ->
  ?max_results:max_results ->
  pipeline_name:pipeline_name ->
  unit ->
  list_pipeline_executions_input

val make_deploy_target_event_context :
  ?message:string_ -> ?ssm_command_id:string_ -> unit -> deploy_target_event_context

val make_deploy_target_event :
  ?context:deploy_target_event_context ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?status:string_ ->
  ?name:string_ ->
  unit ->
  deploy_target_event

val make_deploy_action_execution_target :
  ?events:deploy_target_event_list ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?status:string_ ->
  ?target_type:string_ ->
  ?target_id:string_ ->
  unit ->
  deploy_action_execution_target

val make_list_deploy_action_execution_targets_output :
  ?next_token:next_token ->
  ?targets:deploy_action_execution_target_list ->
  unit ->
  list_deploy_action_execution_targets_output

val make_list_deploy_action_execution_targets_input :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filters:target_filter_list ->
  ?pipeline_name:pipeline_name ->
  action_execution_id:action_execution_id ->
  unit ->
  list_deploy_action_execution_targets_input

val make_action_type_settings :
  ?revision_url_template:url_template ->
  ?execution_url_template:url_template ->
  ?entity_url_template:url_template ->
  ?third_party_configuration_url:url ->
  unit ->
  action_type_settings

val make_action_configuration_property :
  ?type_:action_configuration_property_type ->
  ?description:description ->
  ?queryable:boolean_ ->
  secret:boolean_ ->
  key:boolean_ ->
  required:boolean_ ->
  name:action_configuration_key ->
  unit ->
  action_configuration_property

val make_action_type :
  ?action_configuration_properties:action_configuration_property_list ->
  ?settings:action_type_settings ->
  output_artifact_details:artifact_details ->
  input_artifact_details:artifact_details ->
  id:action_type_id ->
  unit ->
  action_type

val make_list_action_types_output :
  ?next_token:next_token -> action_types:action_type_list -> unit -> list_action_types_output

val make_list_action_types_input :
  ?region_filter:aws_region_name ->
  ?next_token:next_token ->
  ?action_owner_filter:action_owner ->
  unit ->
  list_action_types_input

val make_action_execution_input :
  ?namespace:action_namespace ->
  ?input_artifacts:artifact_detail_list ->
  ?region:aws_region_name ->
  ?role_arn:role_arn ->
  ?resolved_configuration:resolved_action_configuration_map ->
  ?configuration:action_configuration_map ->
  ?action_type_id:action_type_id ->
  unit ->
  action_execution_input

val make_action_execution_output :
  ?output_variables:output_variables_map ->
  ?execution_result:action_execution_result ->
  ?output_artifacts:artifact_detail_list ->
  unit ->
  action_execution_output

val make_action_execution_detail :
  ?output:action_execution_output ->
  ?input:action_execution_input ->
  ?status:action_execution_status ->
  ?updated_by:last_updated_by ->
  ?last_update_time:timestamp ->
  ?start_time:timestamp ->
  ?action_name:action_name ->
  ?stage_name:stage_name ->
  ?pipeline_version:pipeline_version ->
  ?action_execution_id:action_execution_id ->
  ?pipeline_execution_id:pipeline_execution_id ->
  unit ->
  action_execution_detail

val make_list_action_executions_output :
  ?next_token:next_token ->
  ?action_execution_details:action_execution_detail_list ->
  unit ->
  list_action_executions_output

val make_action_execution_filter :
  ?latest_in_pipeline_execution:latest_in_pipeline_execution_filter ->
  ?pipeline_execution_id:pipeline_execution_id ->
  unit ->
  action_execution_filter

val make_list_action_executions_input :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filter:action_execution_filter ->
  pipeline_name:pipeline_name ->
  unit ->
  list_action_executions_input

val make_job_details : ?account_id:account_id -> ?data:job_data -> ?id:job_id -> unit -> job_details

val make_get_third_party_job_details_output :
  ?job_details:third_party_job_details -> unit -> get_third_party_job_details_output

val make_get_third_party_job_details_input :
  client_token:client_token ->
  job_id:third_party_job_id ->
  unit ->
  get_third_party_job_details_input

val make_get_pipeline_state_output :
  ?updated:timestamp ->
  ?created:timestamp ->
  ?stage_states:stage_state_list ->
  ?pipeline_version:pipeline_version ->
  ?pipeline_name:pipeline_name ->
  unit ->
  get_pipeline_state_output

val make_get_pipeline_state_input : name:pipeline_name -> unit -> get_pipeline_state_input

val make_get_pipeline_output :
  ?metadata:pipeline_metadata -> ?pipeline:pipeline_declaration -> unit -> get_pipeline_output

val make_get_pipeline_input :
  ?version:pipeline_version -> name:pipeline_name -> unit -> get_pipeline_input

val make_get_pipeline_execution_output :
  ?pipeline_execution:pipeline_execution -> unit -> get_pipeline_execution_output

val make_get_pipeline_execution_input :
  pipeline_execution_id:pipeline_execution_id ->
  pipeline_name:pipeline_name ->
  unit ->
  get_pipeline_execution_input

val make_get_job_details_output : ?job_details:job_details -> unit -> get_job_details_output
val make_get_job_details_input : job_id:job_id -> unit -> get_job_details_input

val make_get_action_type_output :
  ?action_type:action_type_declaration -> unit -> get_action_type_output

val make_get_action_type_input :
  version:version ->
  provider:action_provider ->
  owner:action_type_owner ->
  category:action_category ->
  unit ->
  get_action_type_input

val make_enable_stage_transition_input :
  transition_type:stage_transition_type ->
  stage_name:stage_name ->
  pipeline_name:pipeline_name ->
  unit ->
  enable_stage_transition_input

val make_disable_stage_transition_input :
  reason:disabled_reason ->
  transition_type:stage_transition_type ->
  stage_name:stage_name ->
  pipeline_name:pipeline_name ->
  unit ->
  disable_stage_transition_input

val make_deregister_webhook_with_third_party_output : unit -> unit

val make_deregister_webhook_with_third_party_input :
  ?webhook_name:webhook_name -> unit -> deregister_webhook_with_third_party_input

val make_delete_webhook_output : unit -> unit
val make_delete_webhook_input : name:webhook_name -> unit -> delete_webhook_input
val make_delete_pipeline_input : name:pipeline_name -> unit -> delete_pipeline_input

val make_delete_custom_action_type_input :
  version:version ->
  provider:action_provider ->
  category:action_category ->
  unit ->
  delete_custom_action_type_input

val make_create_pipeline_output :
  ?tags:tag_list -> ?pipeline:pipeline_declaration -> unit -> create_pipeline_output

val make_create_pipeline_input :
  ?tags:tag_list -> pipeline:pipeline_declaration -> unit -> create_pipeline_input

val make_create_custom_action_type_output :
  ?tags:tag_list -> action_type:action_type -> unit -> create_custom_action_type_output

val make_create_custom_action_type_input :
  ?tags:tag_list ->
  ?configuration_properties:action_configuration_property_list ->
  ?settings:action_type_settings ->
  output_artifact_details:artifact_details ->
  input_artifact_details:artifact_details ->
  version:version ->
  provider:action_provider ->
  category:action_category ->
  unit ->
  create_custom_action_type_input

val make_acknowledge_third_party_job_output :
  ?status:job_status -> unit -> acknowledge_third_party_job_output

val make_acknowledge_third_party_job_input :
  client_token:client_token ->
  nonce:nonce ->
  job_id:third_party_job_id ->
  unit ->
  acknowledge_third_party_job_input

val make_acknowledge_job_output : ?status:job_status -> unit -> acknowledge_job_output

val make_acknowledge_job_input : nonce:nonce -> job_id:job_id -> unit -> acknowledge_job_input
(** {1:operations Operations} *)

module AcknowledgeJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNonceException of invalid_nonce_exception
    | `JobNotFoundException of job_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    acknowledge_job_input ->
    ( acknowledge_job_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNonceException of invalid_nonce_exception
      | `JobNotFoundException of job_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    acknowledge_job_input ->
    ( acknowledge_job_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNonceException of invalid_nonce_exception
      | `JobNotFoundException of job_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about a specified job and whether that job has been received by the job \
   worker. Used for custom actions only.\n"]

module AcknowledgeThirdPartyJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidClientTokenException of invalid_client_token_exception
    | `InvalidNonceException of invalid_nonce_exception
    | `JobNotFoundException of job_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    acknowledge_third_party_job_input ->
    ( acknowledge_third_party_job_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidClientTokenException of invalid_client_token_exception
      | `InvalidNonceException of invalid_nonce_exception
      | `JobNotFoundException of job_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    acknowledge_third_party_job_input ->
    ( acknowledge_third_party_job_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidClientTokenException of invalid_client_token_exception
      | `InvalidNonceException of invalid_nonce_exception
      | `JobNotFoundException of job_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Confirms a job worker has received the specified job. Used for partner actions only.\n"]

module CreateCustomActionType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidTagsException of invalid_tags_exception
    | `LimitExceededException of limit_exceeded_exception
    | `TooManyTagsException of too_many_tags_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_custom_action_type_input ->
    ( create_custom_action_type_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidTagsException of invalid_tags_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_custom_action_type_input ->
    ( create_custom_action_type_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidTagsException of invalid_tags_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new custom action that can be used in all pipelines associated with the Amazon Web \
   Services account. Only used for custom actions.\n"]

module CreatePipeline : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidActionDeclarationException of invalid_action_declaration_exception
    | `InvalidBlockerDeclarationException of invalid_blocker_declaration_exception
    | `InvalidStageDeclarationException of invalid_stage_declaration_exception
    | `InvalidStructureException of invalid_structure_exception
    | `InvalidTagsException of invalid_tags_exception
    | `LimitExceededException of limit_exceeded_exception
    | `PipelineNameInUseException of pipeline_name_in_use_exception
    | `TooManyTagsException of too_many_tags_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_pipeline_input ->
    ( create_pipeline_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidActionDeclarationException of invalid_action_declaration_exception
      | `InvalidBlockerDeclarationException of invalid_blocker_declaration_exception
      | `InvalidStageDeclarationException of invalid_stage_declaration_exception
      | `InvalidStructureException of invalid_structure_exception
      | `InvalidTagsException of invalid_tags_exception
      | `LimitExceededException of limit_exceeded_exception
      | `PipelineNameInUseException of pipeline_name_in_use_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_pipeline_input ->
    ( create_pipeline_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidActionDeclarationException of invalid_action_declaration_exception
      | `InvalidBlockerDeclarationException of invalid_blocker_declaration_exception
      | `InvalidStageDeclarationException of invalid_stage_declaration_exception
      | `InvalidStructureException of invalid_structure_exception
      | `InvalidTagsException of invalid_tags_exception
      | `LimitExceededException of limit_exceeded_exception
      | `PipelineNameInUseException of pipeline_name_in_use_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a pipeline.\n\n\
  \  In the pipeline structure, you must include either [artifactStore] or [artifactStores] in \
   your pipeline, but you cannot use both. If you create a cross-region action in your pipeline, \
   you must use [artifactStores].\n\
  \  \n\
  \   "]

module DeleteCustomActionType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_custom_action_type_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_custom_action_type_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Marks a custom action as deleted. [PollForJobs] for the custom action fails after the action is \
   marked for deletion. Used for custom actions only.\n\n\
  \  To re-create a custom action after it has been deleted you must use a string in the version \
   field that has never been used before. This string can be an incremented version number, for \
   example. To restore a deleted custom action, use a JSON file that is identical to the deleted \
   action, including the original string in the version field.\n\
  \  \n\
  \   "]

module DeletePipeline : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_pipeline_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_pipeline_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified pipeline.\n"]

module DeleteWebhook : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_webhook_input ->
    ( delete_webhook_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_webhook_input ->
    ( delete_webhook_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a previously created webhook by name. Deleting the webhook stops CodePipeline from \
   starting a pipeline every time an external event occurs. The API returns successfully when \
   trying to delete a webhook that is already deleted. If a deleted webhook is re-created by \
   calling PutWebhook with the same name, it will have a different URL.\n"]

module DeregisterWebhookWithThirdParty : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ValidationException of validation_exception
    | `WebhookNotFoundException of webhook_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deregister_webhook_with_third_party_input ->
    ( deregister_webhook_with_third_party_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ValidationException of validation_exception
      | `WebhookNotFoundException of webhook_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deregister_webhook_with_third_party_input ->
    ( deregister_webhook_with_third_party_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ValidationException of validation_exception
      | `WebhookNotFoundException of webhook_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the connection between the webhook that was created by CodePipeline and the external \
   tool with events to be detected. Currently supported only for webhooks that target an action \
   type of GitHub.\n"]

module DisableStageTransition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `PipelineNotFoundException of pipeline_not_found_exception
    | `StageNotFoundException of stage_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disable_stage_transition_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `StageNotFoundException of stage_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disable_stage_transition_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `StageNotFoundException of stage_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Prevents artifacts in a pipeline from transitioning to the next stage in the pipeline.\n"]

module EnableStageTransition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `PipelineNotFoundException of pipeline_not_found_exception
    | `StageNotFoundException of stage_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    enable_stage_transition_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `StageNotFoundException of stage_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    enable_stage_transition_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `StageNotFoundException of stage_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Enables artifacts in a pipeline to transition to a stage in a pipeline.\n"]

module GetActionType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ActionTypeNotFoundException of action_type_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_action_type_input ->
    ( get_action_type_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActionTypeNotFoundException of action_type_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_action_type_input ->
    ( get_action_type_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActionTypeNotFoundException of action_type_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about an action type created for an external provider, where the action is \
   to be used by customers of the external provider. The action can be created with any supported \
   integration model.\n"]

module GetJobDetails : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `JobNotFoundException of job_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_job_details_input ->
    ( get_job_details_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `JobNotFoundException of job_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_job_details_input ->
    ( get_job_details_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `JobNotFoundException of job_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about a job. Used for custom actions only.\n\n\
  \  When this API is called, CodePipeline returns temporary credentials for the S3 bucket used to \
   store artifacts for the pipeline, if the action requires access to that S3 bucket for input or \
   output artifacts. This API also returns any secret values defined for the action.\n\
  \  \n\
  \   "]

module GetPipeline : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `PipelineNotFoundException of pipeline_not_found_exception
    | `PipelineVersionNotFoundException of pipeline_version_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_pipeline_input ->
    ( get_pipeline_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `PipelineVersionNotFoundException of pipeline_version_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_pipeline_input ->
    ( get_pipeline_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `PipelineVersionNotFoundException of pipeline_version_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the metadata, structure, stages, and actions of a pipeline. Can be used to return the \
   entire structure of a pipeline in JSON format, which can then be modified and used to update \
   the pipeline structure with [UpdatePipeline].\n"]

module GetPipelineExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `PipelineExecutionNotFoundException of pipeline_execution_not_found_exception
    | `PipelineNotFoundException of pipeline_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_pipeline_execution_input ->
    ( get_pipeline_execution_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `PipelineExecutionNotFoundException of pipeline_execution_not_found_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_pipeline_execution_input ->
    ( get_pipeline_execution_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `PipelineExecutionNotFoundException of pipeline_execution_not_found_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about an execution of a pipeline, including details about artifacts, the \
   pipeline execution ID, and the name, version, and status of the pipeline.\n"]

module GetPipelineState : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `PipelineNotFoundException of pipeline_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_pipeline_state_input ->
    ( get_pipeline_state_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_pipeline_state_input ->
    ( get_pipeline_state_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the state of a pipeline, including the stages and actions.\n\n\
  \  Values returned in the [revisionId] and [revisionUrl] fields indicate the source revision \
   information, such as the commit ID, for the current state.\n\
  \  \n\
  \   "]

module GetThirdPartyJobDetails : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidClientTokenException of invalid_client_token_exception
    | `InvalidJobException of invalid_job_exception
    | `JobNotFoundException of job_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_third_party_job_details_input ->
    ( get_third_party_job_details_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidClientTokenException of invalid_client_token_exception
      | `InvalidJobException of invalid_job_exception
      | `JobNotFoundException of job_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_third_party_job_details_input ->
    ( get_third_party_job_details_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidClientTokenException of invalid_client_token_exception
      | `InvalidJobException of invalid_job_exception
      | `JobNotFoundException of job_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Requests the details of a job for a third party action. Used for partner actions only.\n\n\
  \  When this API is called, CodePipeline returns temporary credentials for the S3 bucket used to \
   store artifacts for the pipeline, if the action requires access to that S3 bucket for input or \
   output artifacts. This API also returns any secret values defined for the action.\n\
  \  \n\
  \   "]

module ListActionExecutions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `PipelineExecutionNotFoundException of pipeline_execution_not_found_exception
    | `PipelineNotFoundException of pipeline_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_action_executions_input ->
    ( list_action_executions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `PipelineExecutionNotFoundException of pipeline_execution_not_found_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_action_executions_input ->
    ( list_action_executions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `PipelineExecutionNotFoundException of pipeline_execution_not_found_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the action executions that have occurred in a pipeline.\n"]

module ListActionTypes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_action_types_input ->
    ( list_action_types_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_action_types_input ->
    ( list_action_types_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a summary of all CodePipeline action types associated with your account.\n"]

module ListDeployActionExecutionTargets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ActionExecutionNotFoundException of action_execution_not_found_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `PipelineNotFoundException of pipeline_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_deploy_action_execution_targets_input ->
    ( list_deploy_action_execution_targets_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActionExecutionNotFoundException of action_execution_not_found_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_deploy_action_execution_targets_input ->
    ( list_deploy_action_execution_targets_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActionExecutionNotFoundException of action_execution_not_found_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the targets for the deploy action.\n"]

module ListPipelineExecutions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `PipelineNotFoundException of pipeline_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_pipeline_executions_input ->
    ( list_pipeline_executions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_pipeline_executions_input ->
    ( list_pipeline_executions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a summary of the most recent executions for a pipeline.\n\n\
  \  When applying the filter for pipeline executions that have succeeded in the stage, the \
   operation returns all executions in the current pipeline version beginning on February 1, 2024.\n\
  \  \n\
  \   "]

module ListPipelines : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_pipelines_input ->
    ( list_pipelines_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_pipelines_input ->
    ( list_pipelines_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a summary of all of the pipelines associated with your account.\n"]

module ListRuleExecutions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `PipelineExecutionNotFoundException of pipeline_execution_not_found_exception
    | `PipelineNotFoundException of pipeline_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_rule_executions_input ->
    ( list_rule_executions_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `PipelineExecutionNotFoundException of pipeline_execution_not_found_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_rule_executions_input ->
    ( list_rule_executions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `PipelineExecutionNotFoundException of pipeline_execution_not_found_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the rule executions that have occurred in a pipeline configured for conditions with rules.\n"]

module ListRuleTypes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_rule_types_input ->
    ( list_rule_types_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_rule_types_input ->
    ( list_rule_types_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the rules for the condition. For more information about conditions, see \
   {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/stage-conditions.html}Stage \
   conditions} and \
   {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/concepts-how-it-works-conditions.html}How \
   do stage conditions work?}.For more information about rules, see the \
   {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/rule-reference.html}CodePipeline \
   rule reference}.\n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArnException of invalid_arn_exception
    | `InvalidNextTokenException of invalid_next_token_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_input ->
    ( list_tags_for_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_input ->
    ( list_tags_for_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArnException of invalid_arn_exception
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets the set of key-value pairs (metadata) that are used to manage the resource.\n"]

module ListWebhooks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidNextTokenException of invalid_next_token_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_webhooks_input ->
    ( list_webhooks_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_webhooks_input ->
    ( list_webhooks_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidNextTokenException of invalid_next_token_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a listing of all the webhooks in this Amazon Web Services Region for this account. The \
   output lists all webhooks and includes the webhook URL and ARN and the configuration for each \
   webhook.\n\n\
  \  If a secret token was provided, it will be redacted in the response.\n\
  \  \n\
  \   "]

module OverrideStageCondition : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentPipelineExecutionsLimitExceededException of
      concurrent_pipeline_executions_limit_exceeded_exception
    | `ConditionNotOverridableException of condition_not_overridable_exception
    | `ConflictException of conflict_exception
    | `NotLatestPipelineExecutionException of not_latest_pipeline_execution_exception
    | `PipelineNotFoundException of pipeline_not_found_exception
    | `StageNotFoundException of stage_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    override_stage_condition_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentPipelineExecutionsLimitExceededException of
        concurrent_pipeline_executions_limit_exceeded_exception
      | `ConditionNotOverridableException of condition_not_overridable_exception
      | `ConflictException of conflict_exception
      | `NotLatestPipelineExecutionException of not_latest_pipeline_execution_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `StageNotFoundException of stage_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    override_stage_condition_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentPipelineExecutionsLimitExceededException of
        concurrent_pipeline_executions_limit_exceeded_exception
      | `ConditionNotOverridableException of condition_not_overridable_exception
      | `ConflictException of conflict_exception
      | `NotLatestPipelineExecutionException of not_latest_pipeline_execution_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `StageNotFoundException of stage_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Used to override a stage condition. For more information about conditions, see \
   {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/stage-conditions.html}Stage \
   conditions} and \
   {{:https://docs.aws.amazon.com/codepipeline/latest/userguide/concepts-how-it-works-conditions.html}How \
   do stage conditions work?}.\n"]

module PollForJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ActionTypeNotFoundException of action_type_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    poll_for_jobs_input ->
    ( poll_for_jobs_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActionTypeNotFoundException of action_type_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    poll_for_jobs_input ->
    ( poll_for_jobs_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActionTypeNotFoundException of action_type_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about any jobs for CodePipeline to act on. [PollForJobs] is valid only for \
   action types with \"Custom\" in the owner field. If the action type contains [AWS] or \
   [ThirdParty] in the owner field, the [PollForJobs] action returns an error.\n\n\
  \  When this API is called, CodePipeline returns temporary credentials for the S3 bucket used to \
   store artifacts for the pipeline, if the action requires access to that S3 bucket for input or \
   output artifacts. This API also returns any secret values defined for the action.\n\
  \  \n\
  \   "]

module PollForThirdPartyJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ActionTypeNotFoundException of action_type_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    poll_for_third_party_jobs_input ->
    ( poll_for_third_party_jobs_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActionTypeNotFoundException of action_type_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    poll_for_third_party_jobs_input ->
    ( poll_for_third_party_jobs_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActionTypeNotFoundException of action_type_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Determines whether there are any third party jobs for a job worker to act on. Used for partner \
   actions only.\n\n\
  \  When this API is called, CodePipeline returns temporary credentials for the S3 bucket used to \
   store artifacts for the pipeline, if the action requires access to that S3 bucket for input or \
   output artifacts.\n\
  \  \n\
  \   "]

module PutActionRevision : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ActionNotFoundException of action_not_found_exception
    | `ConcurrentPipelineExecutionsLimitExceededException of
      concurrent_pipeline_executions_limit_exceeded_exception
    | `PipelineNotFoundException of pipeline_not_found_exception
    | `StageNotFoundException of stage_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_action_revision_input ->
    ( put_action_revision_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActionNotFoundException of action_not_found_exception
      | `ConcurrentPipelineExecutionsLimitExceededException of
        concurrent_pipeline_executions_limit_exceeded_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `StageNotFoundException of stage_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_action_revision_input ->
    ( put_action_revision_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActionNotFoundException of action_not_found_exception
      | `ConcurrentPipelineExecutionsLimitExceededException of
        concurrent_pipeline_executions_limit_exceeded_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `StageNotFoundException of stage_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Provides information to CodePipeline about new revisions to a source.\n"]

module PutApprovalResult : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ActionNotFoundException of action_not_found_exception
    | `ApprovalAlreadyCompletedException of approval_already_completed_exception
    | `InvalidApprovalTokenException of invalid_approval_token_exception
    | `PipelineNotFoundException of pipeline_not_found_exception
    | `StageNotFoundException of stage_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_approval_result_input ->
    ( put_approval_result_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActionNotFoundException of action_not_found_exception
      | `ApprovalAlreadyCompletedException of approval_already_completed_exception
      | `InvalidApprovalTokenException of invalid_approval_token_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `StageNotFoundException of stage_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_approval_result_input ->
    ( put_approval_result_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActionNotFoundException of action_not_found_exception
      | `ApprovalAlreadyCompletedException of approval_already_completed_exception
      | `InvalidApprovalTokenException of invalid_approval_token_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `StageNotFoundException of stage_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides the response to a manual approval request to CodePipeline. Valid responses include \
   Approved and Rejected.\n"]

module PutJobFailureResult : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidJobStateException of invalid_job_state_exception
    | `JobNotFoundException of job_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_job_failure_result_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidJobStateException of invalid_job_state_exception
      | `JobNotFoundException of job_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_job_failure_result_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidJobStateException of invalid_job_state_exception
      | `JobNotFoundException of job_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Represents the failure of a job as returned to the pipeline by a job worker. Used for custom \
   actions only.\n"]

module PutJobSuccessResult : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidJobStateException of invalid_job_state_exception
    | `JobNotFoundException of job_not_found_exception
    | `OutputVariablesSizeExceededException of output_variables_size_exceeded_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_job_success_result_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidJobStateException of invalid_job_state_exception
      | `JobNotFoundException of job_not_found_exception
      | `OutputVariablesSizeExceededException of output_variables_size_exceeded_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_job_success_result_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidJobStateException of invalid_job_state_exception
      | `JobNotFoundException of job_not_found_exception
      | `OutputVariablesSizeExceededException of output_variables_size_exceeded_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Represents the success of a job as returned to the pipeline by a job worker. Used for custom \
   actions only.\n"]

module PutThirdPartyJobFailureResult : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidClientTokenException of invalid_client_token_exception
    | `InvalidJobStateException of invalid_job_state_exception
    | `JobNotFoundException of job_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_third_party_job_failure_result_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidClientTokenException of invalid_client_token_exception
      | `InvalidJobStateException of invalid_job_state_exception
      | `JobNotFoundException of job_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_third_party_job_failure_result_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidClientTokenException of invalid_client_token_exception
      | `InvalidJobStateException of invalid_job_state_exception
      | `JobNotFoundException of job_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Represents the failure of a third party job as returned to the pipeline by a job worker. Used \
   for partner actions only.\n"]

module PutThirdPartyJobSuccessResult : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidClientTokenException of invalid_client_token_exception
    | `InvalidJobStateException of invalid_job_state_exception
    | `JobNotFoundException of job_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_third_party_job_success_result_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidClientTokenException of invalid_client_token_exception
      | `InvalidJobStateException of invalid_job_state_exception
      | `JobNotFoundException of job_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_third_party_job_success_result_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidClientTokenException of invalid_client_token_exception
      | `InvalidJobStateException of invalid_job_state_exception
      | `JobNotFoundException of job_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Represents the success of a third party job as returned to the pipeline by a job worker. Used \
   for partner actions only.\n"]

module PutWebhook : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidTagsException of invalid_tags_exception
    | `InvalidWebhookAuthenticationParametersException of
      invalid_webhook_authentication_parameters_exception
    | `InvalidWebhookFilterPatternException of invalid_webhook_filter_pattern_exception
    | `LimitExceededException of limit_exceeded_exception
    | `PipelineNotFoundException of pipeline_not_found_exception
    | `TooManyTagsException of too_many_tags_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_webhook_input ->
    ( put_webhook_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidTagsException of invalid_tags_exception
      | `InvalidWebhookAuthenticationParametersException of
        invalid_webhook_authentication_parameters_exception
      | `InvalidWebhookFilterPatternException of invalid_webhook_filter_pattern_exception
      | `LimitExceededException of limit_exceeded_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_webhook_input ->
    ( put_webhook_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidTagsException of invalid_tags_exception
      | `InvalidWebhookAuthenticationParametersException of
        invalid_webhook_authentication_parameters_exception
      | `InvalidWebhookFilterPatternException of invalid_webhook_filter_pattern_exception
      | `LimitExceededException of limit_exceeded_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Defines a webhook and returns a unique webhook URL generated by CodePipeline. This URL can be \
   supplied to third party source hosting providers to call every time there's a code change. When \
   CodePipeline receives a POST request on this URL, the pipeline defined in the webhook is \
   started as long as the POST request satisfied the authentication and filtering requirements \
   supplied when defining the webhook. RegisterWebhookWithThirdParty and \
   DeregisterWebhookWithThirdParty APIs can be used to automatically configure supported third \
   parties to call the generated webhook URL.\n\n\
  \  When creating CodePipeline webhooks, do not use your own credentials or reuse the same secret \
   token across multiple webhooks. For optimal security, generate a unique secret token for each \
   webhook you create. The secret token is an arbitrary string that you provide, which GitHub uses \
   to compute and sign the webhook payloads sent to CodePipeline, for protecting the integrity and \
   authenticity of the webhook payloads. Using your own credentials or reusing the same token \
   across multiple webhooks can lead to security vulnerabilities.\n\
  \  \n\
  \     If a secret token was provided, it will be redacted in the response.\n\
  \     \n\
  \      "]

module RegisterWebhookWithThirdParty : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ValidationException of validation_exception
    | `WebhookNotFoundException of webhook_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_webhook_with_third_party_input ->
    ( register_webhook_with_third_party_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ValidationException of validation_exception
      | `WebhookNotFoundException of webhook_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_webhook_with_third_party_input ->
    ( register_webhook_with_third_party_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ValidationException of validation_exception
      | `WebhookNotFoundException of webhook_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Configures a connection between the webhook that was created and the external tool with events \
   to be detected.\n"]

module RetryStageExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentPipelineExecutionsLimitExceededException of
      concurrent_pipeline_executions_limit_exceeded_exception
    | `ConflictException of conflict_exception
    | `NotLatestPipelineExecutionException of not_latest_pipeline_execution_exception
    | `PipelineNotFoundException of pipeline_not_found_exception
    | `StageNotFoundException of stage_not_found_exception
    | `StageNotRetryableException of stage_not_retryable_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    retry_stage_execution_input ->
    ( retry_stage_execution_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentPipelineExecutionsLimitExceededException of
        concurrent_pipeline_executions_limit_exceeded_exception
      | `ConflictException of conflict_exception
      | `NotLatestPipelineExecutionException of not_latest_pipeline_execution_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `StageNotFoundException of stage_not_found_exception
      | `StageNotRetryableException of stage_not_retryable_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    retry_stage_execution_input ->
    ( retry_stage_execution_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentPipelineExecutionsLimitExceededException of
        concurrent_pipeline_executions_limit_exceeded_exception
      | `ConflictException of conflict_exception
      | `NotLatestPipelineExecutionException of not_latest_pipeline_execution_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `StageNotFoundException of stage_not_found_exception
      | `StageNotRetryableException of stage_not_retryable_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "You can retry a stage that has failed without having to run a pipeline again from the \
   beginning. You do this by either retrying the failed actions in a stage or by retrying all \
   actions in the stage starting from the first action in the stage. When you retry the failed \
   actions in a stage, all actions that are still in progress continue working, and failed actions \
   are triggered again. When you retry a failed stage from the first action in the stage, the \
   stage cannot have any actions in progress. Before a stage can be retried, it must either have \
   all actions failed or some actions failed and some succeeded.\n"]

module RollbackStage : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `PipelineExecutionNotFoundException of pipeline_execution_not_found_exception
    | `PipelineExecutionOutdatedException of pipeline_execution_outdated_exception
    | `PipelineNotFoundException of pipeline_not_found_exception
    | `StageNotFoundException of stage_not_found_exception
    | `UnableToRollbackStageException of unable_to_rollback_stage_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    rollback_stage_input ->
    ( rollback_stage_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `PipelineExecutionNotFoundException of pipeline_execution_not_found_exception
      | `PipelineExecutionOutdatedException of pipeline_execution_outdated_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `StageNotFoundException of stage_not_found_exception
      | `UnableToRollbackStageException of unable_to_rollback_stage_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    rollback_stage_input ->
    ( rollback_stage_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `PipelineExecutionNotFoundException of pipeline_execution_not_found_exception
      | `PipelineExecutionOutdatedException of pipeline_execution_outdated_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `StageNotFoundException of stage_not_found_exception
      | `UnableToRollbackStageException of unable_to_rollback_stage_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Rolls back a stage execution.\n"]

module StartPipelineExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentPipelineExecutionsLimitExceededException of
      concurrent_pipeline_executions_limit_exceeded_exception
    | `ConflictException of conflict_exception
    | `PipelineNotFoundException of pipeline_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_pipeline_execution_input ->
    ( start_pipeline_execution_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentPipelineExecutionsLimitExceededException of
        concurrent_pipeline_executions_limit_exceeded_exception
      | `ConflictException of conflict_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_pipeline_execution_input ->
    ( start_pipeline_execution_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentPipelineExecutionsLimitExceededException of
        concurrent_pipeline_executions_limit_exceeded_exception
      | `ConflictException of conflict_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts the specified pipeline. Specifically, it begins processing the latest commit to the \
   source location specified as part of the pipeline.\n"]

module StopPipelineExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConflictException of conflict_exception
    | `DuplicatedStopRequestException of duplicated_stop_request_exception
    | `PipelineExecutionNotStoppableException of pipeline_execution_not_stoppable_exception
    | `PipelineNotFoundException of pipeline_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_pipeline_execution_input ->
    ( stop_pipeline_execution_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DuplicatedStopRequestException of duplicated_stop_request_exception
      | `PipelineExecutionNotStoppableException of pipeline_execution_not_stoppable_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_pipeline_execution_input ->
    ( stop_pipeline_execution_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConflictException of conflict_exception
      | `DuplicatedStopRequestException of duplicated_stop_request_exception
      | `PipelineExecutionNotStoppableException of pipeline_execution_not_stoppable_exception
      | `PipelineNotFoundException of pipeline_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops the specified pipeline execution. You choose to either stop the pipeline execution by \
   completing in-progress actions without starting subsequent actions, or by abandoning \
   in-progress actions. While completing or abandoning in-progress actions, the pipeline execution \
   is in a [Stopping] state. After all in-progress actions are completed or abandoned, the \
   pipeline execution is in a [Stopped] state.\n"]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArnException of invalid_arn_exception
    | `InvalidTagsException of invalid_tags_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_input ->
    ( tag_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArnException of invalid_arn_exception
      | `InvalidTagsException of invalid_tags_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_input ->
    ( tag_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArnException of invalid_arn_exception
      | `InvalidTagsException of invalid_tags_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds to or modifies the tags of the given resource. Tags are metadata that can be used to \
   manage a resource. \n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArnException of invalid_arn_exception
    | `InvalidTagsException of invalid_tags_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_input ->
    ( untag_resource_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArnException of invalid_arn_exception
      | `InvalidTagsException of invalid_tags_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_input ->
    ( untag_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArnException of invalid_arn_exception
      | `InvalidTagsException of invalid_tags_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes tags from an Amazon Web Services resource.\n"]

module UpdateActionType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ActionTypeNotFoundException of action_type_not_found_exception
    | `RequestFailedException of request_failed_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_action_type_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActionTypeNotFoundException of action_type_not_found_exception
      | `RequestFailedException of request_failed_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_action_type_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ActionTypeNotFoundException of action_type_not_found_exception
      | `RequestFailedException of request_failed_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an action type that was created with any supported integration model, where the action \
   type is to be used by customers of the action type provider. Use a JSON file with the action \
   definition and [UpdateActionType] to provide the full structure.\n"]

(** {1:Serialization and Deserialization} *)
module UpdatePipeline : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidActionDeclarationException of invalid_action_declaration_exception
    | `InvalidBlockerDeclarationException of invalid_blocker_declaration_exception
    | `InvalidStageDeclarationException of invalid_stage_declaration_exception
    | `InvalidStructureException of invalid_structure_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_pipeline_input ->
    ( update_pipeline_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidActionDeclarationException of invalid_action_declaration_exception
      | `InvalidBlockerDeclarationException of invalid_blocker_declaration_exception
      | `InvalidStageDeclarationException of invalid_stage_declaration_exception
      | `InvalidStructureException of invalid_structure_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_pipeline_input ->
    ( update_pipeline_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidActionDeclarationException of invalid_action_declaration_exception
      | `InvalidBlockerDeclarationException of invalid_blocker_declaration_exception
      | `InvalidStageDeclarationException of invalid_stage_declaration_exception
      | `InvalidStructureException of invalid_structure_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a specified pipeline with edits or changes to its structure. Use a JSON file with the \
   pipeline structure and [UpdatePipeline] to provide the full structure of the pipeline. Updating \
   the pipeline increases the version number of the pipeline by 1.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
