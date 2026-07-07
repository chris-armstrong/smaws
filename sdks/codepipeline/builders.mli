open Types

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
