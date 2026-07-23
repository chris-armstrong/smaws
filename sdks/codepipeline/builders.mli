open Types

val make_aws_session_credentials :
  access_key_id:access_key_id ->
  secret_access_key:secret_access_key ->
  session_token:session_token ->
  unit ->
  aws_session_credentials

val make_acknowledge_job_output : ?status:job_status -> unit -> acknowledge_job_output
val make_acknowledge_job_input : job_id:job_id -> nonce:nonce -> unit -> acknowledge_job_input

val make_acknowledge_third_party_job_output :
  ?status:job_status -> unit -> acknowledge_third_party_job_output

val make_acknowledge_third_party_job_input :
  job_id:third_party_job_id ->
  nonce:nonce ->
  client_token:client_token ->
  unit ->
  acknowledge_third_party_job_input

val make_action_configuration :
  ?configuration:action_configuration_map -> unit -> action_configuration

val make_action_configuration_property :
  ?queryable:boolean_ ->
  ?description:description ->
  ?type_:action_configuration_property_type ->
  name:action_configuration_key ->
  required:boolean_ ->
  key:boolean_ ->
  secret:boolean_ ->
  unit ->
  action_configuration_property

val make_action_context :
  ?name:action_name -> ?action_execution_id:action_execution_id -> unit -> action_context

val make_environment_variable :
  ?type_:environment_variable_type ->
  name:environment_variable_name ->
  value:environment_variable_value ->
  unit ->
  environment_variable

val make_input_artifact : name:artifact_name -> unit -> input_artifact
val make_output_artifact : ?files:file_path_list -> name:artifact_name -> unit -> output_artifact

val make_action_type_id :
  category:action_category ->
  owner:action_owner ->
  provider:action_provider ->
  version:version ->
  unit ->
  action_type_id

val make_action_declaration :
  ?run_order:action_run_order ->
  ?configuration:action_configuration_map ->
  ?commands:command_list ->
  ?output_artifacts:output_artifact_list ->
  ?input_artifacts:input_artifact_list ->
  ?output_variables:output_variable_list ->
  ?role_arn:role_arn ->
  ?region:aws_region_name ->
  ?namespace:action_namespace ->
  ?timeout_in_minutes:action_timeout ->
  ?environment_variables:environment_variable_list ->
  name:action_name ->
  action_type_id:action_type_id ->
  unit ->
  action_declaration

val make_error_details : ?code:code -> ?message:message -> unit -> error_details

val make_action_execution :
  ?action_execution_id:action_execution_id ->
  ?status:action_execution_status ->
  ?summary:execution_summary ->
  ?last_status_change:timestamp ->
  ?token:action_execution_token ->
  ?last_updated_by:last_updated_by ->
  ?external_execution_id:execution_id ->
  ?external_execution_url:url ->
  ?percent_complete:percentage ->
  ?error_details:error_details ->
  ?log_stream_ar_n:log_stream_ar_n ->
  unit ->
  action_execution

val make_s3_location : ?bucket:s3_bucket -> ?key:s3_key -> unit -> s3_location
val make_artifact_detail : ?name:artifact_name -> ?s3location:s3_location -> unit -> artifact_detail

val make_action_execution_output :
  ?output_artifacts:artifact_detail_list ->
  ?execution_result:action_execution_result ->
  ?output_variables:output_variables_map ->
  unit ->
  action_execution_output

val make_action_execution_input :
  ?action_type_id:action_type_id ->
  ?configuration:action_configuration_map ->
  ?resolved_configuration:resolved_action_configuration_map ->
  ?role_arn:role_arn ->
  ?region:aws_region_name ->
  ?input_artifacts:artifact_detail_list ->
  ?namespace:action_namespace ->
  unit ->
  action_execution_input

val make_action_execution_detail :
  ?pipeline_execution_id:pipeline_execution_id ->
  ?action_execution_id:action_execution_id ->
  ?pipeline_version:pipeline_version ->
  ?stage_name:stage_name ->
  ?action_name:action_name ->
  ?start_time:timestamp ->
  ?last_update_time:timestamp ->
  ?updated_by:last_updated_by ->
  ?status:action_execution_status ->
  ?input:action_execution_input ->
  ?output:action_execution_output ->
  unit ->
  action_execution_detail

val make_latest_in_pipeline_execution_filter :
  pipeline_execution_id:pipeline_execution_id ->
  start_time_range:start_time_range ->
  unit ->
  latest_in_pipeline_execution_filter

val make_action_execution_filter :
  ?pipeline_execution_id:pipeline_execution_id ->
  ?latest_in_pipeline_execution:latest_in_pipeline_execution_filter ->
  unit ->
  action_execution_filter

val make_action_revision :
  revision_id:revision ->
  revision_change_id:revision_change_identifier ->
  created:timestamp ->
  unit ->
  action_revision

val make_action_state :
  ?action_name:action_name ->
  ?current_revision:action_revision ->
  ?latest_execution:action_execution ->
  ?entity_url:url ->
  ?revision_url:url ->
  unit ->
  action_state

val make_artifact_details :
  minimum_count:minimum_artifact_count ->
  maximum_count:maximum_artifact_count ->
  unit ->
  artifact_details

val make_action_type_settings :
  ?third_party_configuration_url:url ->
  ?entity_url_template:url_template ->
  ?execution_url_template:url_template ->
  ?revision_url_template:url_template ->
  unit ->
  action_type_settings

val make_action_type :
  ?settings:action_type_settings ->
  ?action_configuration_properties:action_configuration_property_list ->
  id:action_type_id ->
  input_artifact_details:artifact_details ->
  output_artifact_details:artifact_details ->
  unit ->
  action_type

val make_action_type_artifact_details :
  minimum_count:minimum_action_type_artifact_count ->
  maximum_count:maximum_action_type_artifact_count ->
  unit ->
  action_type_artifact_details

val make_action_type_urls :
  ?configuration_url:url ->
  ?entity_url_template:url_template ->
  ?execution_url_template:url_template ->
  ?revision_url_template:url_template ->
  unit ->
  action_type_urls

val make_action_type_property :
  ?queryable:boolean_ ->
  ?description:property_description ->
  name:action_configuration_key ->
  optional:boolean_ ->
  key:boolean_ ->
  no_echo:boolean_ ->
  unit ->
  action_type_property

val make_action_type_permissions :
  allowed_accounts:allowed_accounts -> unit -> action_type_permissions

val make_action_type_identifier :
  category:action_category ->
  owner:action_type_owner ->
  provider:action_provider ->
  version:version ->
  unit ->
  action_type_identifier

val make_job_worker_executor_configuration :
  ?polling_accounts:polling_account_list ->
  ?polling_service_principals:polling_service_principal_list ->
  unit ->
  job_worker_executor_configuration

val make_lambda_executor_configuration :
  lambda_function_arn:lambda_function_arn -> unit -> lambda_executor_configuration

val make_executor_configuration :
  ?lambda_executor_configuration:lambda_executor_configuration ->
  ?job_worker_executor_configuration:job_worker_executor_configuration ->
  unit ->
  executor_configuration

val make_action_type_executor :
  ?policy_statements_template:policy_statements_template ->
  ?job_timeout:job_timeout ->
  configuration:executor_configuration ->
  type_:executor_type ->
  unit ->
  action_type_executor

val make_action_type_declaration :
  ?description:action_type_description ->
  ?permissions:action_type_permissions ->
  ?properties:action_type_properties ->
  ?urls:action_type_urls ->
  executor:action_type_executor ->
  id:action_type_identifier ->
  input_artifact_details:action_type_artifact_details ->
  output_artifact_details:action_type_artifact_details ->
  unit ->
  action_type_declaration

val make_s3_artifact_location :
  bucket_name:s3_bucket_name -> object_key:s3_object_key -> unit -> s3_artifact_location

val make_artifact_location :
  ?type_:artifact_location_type -> ?s3_location:s3_artifact_location -> unit -> artifact_location

val make_artifact :
  ?name:artifact_name -> ?revision:revision -> ?location:artifact_location -> unit -> artifact

val make_artifact_revision :
  ?name:artifact_name ->
  ?revision_id:revision ->
  ?revision_change_identifier:revision_change_identifier ->
  ?revision_summary:revision_summary ->
  ?created:timestamp ->
  ?revision_url:url ->
  unit ->
  artifact_revision

val make_encryption_key :
  id:encryption_key_id -> type_:encryption_key_type -> unit -> encryption_key

val make_artifact_store :
  ?encryption_key:encryption_key ->
  type_:artifact_store_type ->
  location:artifact_store_location ->
  unit ->
  artifact_store

val make_rule_type_id :
  ?owner:rule_owner ->
  ?version:version ->
  category:rule_category ->
  provider:rule_provider ->
  unit ->
  rule_type_id

val make_rule_declaration :
  ?configuration:rule_configuration_map ->
  ?commands:command_list ->
  ?input_artifacts:input_artifact_list ->
  ?role_arn:role_arn ->
  ?region:aws_region_name ->
  ?timeout_in_minutes:rule_timeout ->
  name:rule_name ->
  rule_type_id:rule_type_id ->
  unit ->
  rule_declaration

val make_condition : ?result_:result_ -> ?rules:rule_declaration_list -> unit -> condition
val make_before_entry_conditions : conditions:condition_list -> unit -> before_entry_conditions

val make_blocker_declaration :
  name:blocker_name -> type_:blocker_type -> unit -> blocker_declaration

val make_git_file_path_filter_criteria :
  ?includes:git_file_path_pattern_list ->
  ?excludes:git_file_path_pattern_list ->
  unit ->
  git_file_path_filter_criteria

val make_git_branch_filter_criteria :
  ?includes:git_branch_pattern_list ->
  ?excludes:git_branch_pattern_list ->
  unit ->
  git_branch_filter_criteria

val make_git_pull_request_filter :
  ?events:git_pull_request_event_type_list ->
  ?branches:git_branch_filter_criteria ->
  ?file_paths:git_file_path_filter_criteria ->
  unit ->
  git_pull_request_filter

val make_git_tag_filter_criteria :
  ?includes:git_tag_pattern_list ->
  ?excludes:git_tag_pattern_list ->
  unit ->
  git_tag_filter_criteria

val make_git_push_filter :
  ?tags:git_tag_filter_criteria ->
  ?branches:git_branch_filter_criteria ->
  ?file_paths:git_file_path_filter_criteria ->
  unit ->
  git_push_filter

val make_git_configuration :
  ?push:git_push_filter_list ->
  ?pull_request:git_pull_request_filter_list ->
  source_action_name:action_name ->
  unit ->
  git_configuration

val make_pipeline_trigger_declaration :
  provider_type:pipeline_trigger_provider_type ->
  git_configuration:git_configuration ->
  unit ->
  pipeline_trigger_declaration

val make_pipeline_variable_declaration :
  ?default_value:pipeline_variable_value ->
  ?description:pipeline_variable_description ->
  name:pipeline_variable_name ->
  unit ->
  pipeline_variable_declaration

val make_success_conditions : conditions:condition_list -> unit -> success_conditions
val make_retry_configuration : ?retry_mode:stage_retry_mode -> unit -> retry_configuration

val make_failure_conditions :
  ?result_:result_ ->
  ?retry_configuration:retry_configuration ->
  ?conditions:condition_list ->
  unit ->
  failure_conditions

val make_stage_declaration :
  ?blockers:stage_blocker_declaration_list ->
  ?on_failure:failure_conditions ->
  ?on_success:success_conditions ->
  ?before_entry:before_entry_conditions ->
  name:stage_name ->
  actions:stage_action_declaration_list ->
  unit ->
  stage_declaration

val make_pipeline_declaration :
  ?artifact_store:artifact_store ->
  ?artifact_stores:artifact_store_map ->
  ?version:pipeline_version ->
  ?execution_mode:execution_mode ->
  ?pipeline_type:pipeline_type ->
  ?variables:pipeline_variable_declaration_list ->
  ?triggers:pipeline_trigger_declaration_list ->
  name:pipeline_name ->
  role_arn:role_arn ->
  stages:pipeline_stage_declaration_list ->
  unit ->
  pipeline_declaration

val make_update_pipeline_output : ?pipeline:pipeline_declaration -> unit -> update_pipeline_output
val make_update_pipeline_input : pipeline:pipeline_declaration -> unit -> update_pipeline_input

val make_update_action_type_input :
  action_type:action_type_declaration -> unit -> update_action_type_input

val make_untag_resource_output : unit -> unit

val make_untag_resource_input :
  resource_arn:resource_arn -> tag_keys:tag_key_list -> unit -> untag_resource_input

val make_tag_resource_output : unit -> unit
val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_tag_resource_input :
  resource_arn:resource_arn -> tags:tag_list -> unit -> tag_resource_input

val make_stop_pipeline_execution_output :
  ?pipeline_execution_id:pipeline_execution_id -> unit -> stop_pipeline_execution_output

val make_stop_pipeline_execution_input :
  ?abandon:boolean_ ->
  ?reason:stop_pipeline_execution_reason ->
  pipeline_name:pipeline_name ->
  pipeline_execution_id:pipeline_execution_id ->
  unit ->
  stop_pipeline_execution_input

val make_start_pipeline_execution_output :
  ?pipeline_execution_id:pipeline_execution_id -> unit -> start_pipeline_execution_output

val make_source_revision_override :
  action_name:action_name ->
  revision_type:source_revision_type ->
  revision_value:revision ->
  unit ->
  source_revision_override

val make_pipeline_variable :
  name:pipeline_variable_name -> value:pipeline_variable_value -> unit -> pipeline_variable

val make_start_pipeline_execution_input :
  ?variables:pipeline_variable_list ->
  ?client_request_token:client_request_token ->
  ?source_revisions:source_revision_override_list ->
  name:pipeline_name ->
  unit ->
  start_pipeline_execution_input

val make_rollback_stage_output :
  pipeline_execution_id:pipeline_execution_id -> unit -> rollback_stage_output

val make_rollback_stage_input :
  pipeline_name:pipeline_name ->
  stage_name:stage_name ->
  target_pipeline_execution_id:pipeline_execution_id ->
  unit ->
  rollback_stage_input

val make_retry_stage_execution_output :
  ?pipeline_execution_id:pipeline_execution_id -> unit -> retry_stage_execution_output

val make_retry_stage_execution_input :
  pipeline_name:pipeline_name ->
  stage_name:stage_name ->
  pipeline_execution_id:pipeline_execution_id ->
  retry_mode:stage_retry_mode ->
  unit ->
  retry_stage_execution_input

val make_register_webhook_with_third_party_output : unit -> unit

val make_register_webhook_with_third_party_input :
  ?webhook_name:webhook_name -> unit -> register_webhook_with_third_party_input

val make_webhook_auth_configuration :
  ?allowed_ip_range:webhook_auth_configuration_allowed_ip_range ->
  ?secret_token:webhook_auth_configuration_secret_token ->
  unit ->
  webhook_auth_configuration

val make_webhook_filter_rule :
  ?match_equals:match_equals -> json_path:json_path -> unit -> webhook_filter_rule

val make_webhook_definition :
  name:webhook_name ->
  target_pipeline:pipeline_name ->
  target_action:action_name ->
  filters:webhook_filters ->
  authentication:webhook_authentication_type ->
  authentication_configuration:webhook_auth_configuration ->
  unit ->
  webhook_definition

val make_list_webhook_item :
  ?error_message:webhook_error_message ->
  ?error_code:webhook_error_code ->
  ?last_triggered:webhook_last_triggered ->
  ?arn:webhook_arn ->
  ?tags:tag_list ->
  definition:webhook_definition ->
  url:webhook_url ->
  unit ->
  list_webhook_item

val make_put_webhook_output : ?webhook:list_webhook_item -> unit -> put_webhook_output

val make_put_webhook_input :
  ?tags:tag_list -> webhook:webhook_definition -> unit -> put_webhook_input

val make_execution_details :
  ?summary:execution_summary ->
  ?external_execution_id:execution_id ->
  ?percent_complete:percentage ->
  unit ->
  execution_details

val make_current_revision :
  ?created:time ->
  ?revision_summary:revision_summary ->
  revision:revision ->
  change_identifier:revision_change_identifier ->
  unit ->
  current_revision

val make_put_third_party_job_success_result_input :
  ?current_revision:current_revision ->
  ?continuation_token:continuation_token ->
  ?execution_details:execution_details ->
  job_id:third_party_job_id ->
  client_token:client_token ->
  unit ->
  put_third_party_job_success_result_input

val make_failure_details :
  ?external_execution_id:execution_id ->
  type_:failure_type ->
  message:message ->
  unit ->
  failure_details

val make_put_third_party_job_failure_result_input :
  job_id:third_party_job_id ->
  client_token:client_token ->
  failure_details:failure_details ->
  unit ->
  put_third_party_job_failure_result_input

val make_put_job_success_result_input :
  ?current_revision:current_revision ->
  ?continuation_token:continuation_token ->
  ?execution_details:execution_details ->
  ?output_variables:output_variables_map ->
  job_id:job_id ->
  unit ->
  put_job_success_result_input

val make_put_job_failure_result_input :
  job_id:job_id -> failure_details:failure_details -> unit -> put_job_failure_result_input

val make_put_approval_result_output : ?approved_at:timestamp -> unit -> put_approval_result_output

val make_put_approval_result_input :
  pipeline_name:pipeline_name ->
  stage_name:stage_name ->
  action_name:action_name ->
  result_:approval_result ->
  token:approval_token ->
  unit ->
  put_approval_result_input

val make_put_action_revision_output :
  ?new_revision:boolean_ ->
  ?pipeline_execution_id:pipeline_execution_id ->
  unit ->
  put_action_revision_output

val make_put_action_revision_input :
  pipeline_name:pipeline_name ->
  stage_name:stage_name ->
  action_name:action_name ->
  action_revision:action_revision ->
  unit ->
  put_action_revision_input

val make_third_party_job : ?client_id:client_id -> ?job_id:job_id -> unit -> third_party_job

val make_poll_for_third_party_jobs_output :
  ?jobs:third_party_job_list -> unit -> poll_for_third_party_jobs_output

val make_poll_for_third_party_jobs_input :
  ?max_batch_size:max_batch_size ->
  action_type_id:action_type_id ->
  unit ->
  poll_for_third_party_jobs_input

val make_stage_context : ?name:stage_name -> unit -> stage_context

val make_pipeline_context :
  ?pipeline_name:pipeline_name ->
  ?stage:stage_context ->
  ?action:action_context ->
  ?pipeline_arn:pipeline_arn ->
  ?pipeline_execution_id:pipeline_execution_id ->
  unit ->
  pipeline_context

val make_job_data :
  ?action_type_id:action_type_id ->
  ?action_configuration:action_configuration ->
  ?pipeline_context:pipeline_context ->
  ?input_artifacts:artifact_list ->
  ?output_artifacts:artifact_list ->
  ?artifact_credentials:aws_session_credentials ->
  ?continuation_token:continuation_token ->
  ?encryption_key:encryption_key ->
  unit ->
  job_data

val make_job : ?id:job_id -> ?data:job_data -> ?nonce:nonce -> ?account_id:account_id -> unit -> job
val make_poll_for_jobs_output : ?jobs:job_list -> unit -> poll_for_jobs_output

val make_poll_for_jobs_input :
  ?max_batch_size:max_batch_size ->
  ?query_param:query_param_map ->
  action_type_id:action_type_id ->
  unit ->
  poll_for_jobs_input

val make_override_stage_condition_input :
  pipeline_name:pipeline_name ->
  stage_name:stage_name ->
  pipeline_execution_id:pipeline_execution_id ->
  condition_type:condition_type ->
  unit ->
  override_stage_condition_input

val make_list_webhooks_output :
  ?webhooks:webhook_list -> ?next_token:next_token -> unit -> list_webhooks_output

val make_list_webhooks_input :
  ?next_token:next_token -> ?max_results:max_results -> unit -> list_webhooks_input

val make_list_tags_for_resource_output :
  ?tags:tag_list -> ?next_token:next_token -> unit -> list_tags_for_resource_output

val make_list_tags_for_resource_input :
  ?next_token:next_token ->
  ?max_results:max_results ->
  resource_arn:resource_arn ->
  unit ->
  list_tags_for_resource_input

val make_rule_configuration_property :
  ?queryable:boolean_ ->
  ?description:description ->
  ?type_:rule_configuration_property_type ->
  name:rule_configuration_key ->
  required:boolean_ ->
  key:boolean_ ->
  secret:boolean_ ->
  unit ->
  rule_configuration_property

val make_rule_type_settings :
  ?third_party_configuration_url:url ->
  ?entity_url_template:url_template ->
  ?execution_url_template:url_template ->
  ?revision_url_template:url_template ->
  unit ->
  rule_type_settings

val make_rule_type :
  ?settings:rule_type_settings ->
  ?rule_configuration_properties:rule_configuration_property_list ->
  id:rule_type_id ->
  input_artifact_details:artifact_details ->
  unit ->
  rule_type

val make_list_rule_types_output : rule_types:rule_type_list -> unit -> list_rule_types_output

val make_list_rule_types_input :
  ?rule_owner_filter:rule_owner -> ?region_filter:aws_region_name -> unit -> list_rule_types_input

val make_rule_execution_output :
  ?execution_result:rule_execution_result -> unit -> rule_execution_output

val make_rule_execution_input :
  ?rule_type_id:rule_type_id ->
  ?configuration:rule_configuration_map ->
  ?resolved_configuration:resolved_rule_configuration_map ->
  ?role_arn:role_arn ->
  ?region:aws_region_name ->
  ?input_artifacts:artifact_detail_list ->
  unit ->
  rule_execution_input

val make_rule_execution_detail :
  ?pipeline_execution_id:pipeline_execution_id ->
  ?rule_execution_id:rule_execution_id ->
  ?pipeline_version:pipeline_version ->
  ?stage_name:stage_name ->
  ?rule_name:rule_name ->
  ?start_time:timestamp ->
  ?last_update_time:timestamp ->
  ?updated_by:last_updated_by ->
  ?status:rule_execution_status ->
  ?input:rule_execution_input ->
  ?output:rule_execution_output ->
  unit ->
  rule_execution_detail

val make_list_rule_executions_output :
  ?rule_execution_details:rule_execution_detail_list ->
  ?next_token:next_token ->
  unit ->
  list_rule_executions_output

val make_rule_execution_filter :
  ?pipeline_execution_id:pipeline_execution_id ->
  ?latest_in_pipeline_execution:latest_in_pipeline_execution_filter ->
  unit ->
  rule_execution_filter

val make_list_rule_executions_input :
  ?filter:rule_execution_filter ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  pipeline_name:pipeline_name ->
  unit ->
  list_rule_executions_input

val make_pipeline_summary :
  ?name:pipeline_name ->
  ?version:pipeline_version ->
  ?pipeline_type:pipeline_type ->
  ?execution_mode:execution_mode ->
  ?created:timestamp ->
  ?updated:timestamp ->
  unit ->
  pipeline_summary

val make_list_pipelines_output :
  ?pipelines:pipeline_list -> ?next_token:next_token -> unit -> list_pipelines_output

val make_list_pipelines_input :
  ?next_token:next_token -> ?max_results:max_pipelines -> unit -> list_pipelines_input

val make_pipeline_rollback_metadata :
  ?rollback_target_pipeline_execution_id:pipeline_execution_id -> unit -> pipeline_rollback_metadata

val make_stop_execution_trigger :
  ?reason:stop_pipeline_execution_reason -> unit -> stop_execution_trigger

val make_execution_trigger :
  ?trigger_type:trigger_type -> ?trigger_detail:trigger_detail -> unit -> execution_trigger

val make_source_revision :
  ?revision_id:revision ->
  ?revision_summary:revision_summary ->
  ?revision_url:url ->
  action_name:action_name ->
  unit ->
  source_revision

val make_pipeline_execution_summary :
  ?pipeline_execution_id:pipeline_execution_id ->
  ?status:pipeline_execution_status ->
  ?status_summary:pipeline_execution_status_summary ->
  ?start_time:timestamp ->
  ?last_update_time:timestamp ->
  ?source_revisions:source_revision_list ->
  ?trigger:execution_trigger ->
  ?stop_trigger:stop_execution_trigger ->
  ?execution_mode:execution_mode ->
  ?execution_type:execution_type ->
  ?rollback_metadata:pipeline_rollback_metadata ->
  unit ->
  pipeline_execution_summary

val make_list_pipeline_executions_output :
  ?pipeline_execution_summaries:pipeline_execution_summary_list ->
  ?next_token:next_token ->
  unit ->
  list_pipeline_executions_output

val make_succeeded_in_stage_filter : ?stage_name:stage_name -> unit -> succeeded_in_stage_filter

val make_pipeline_execution_filter :
  ?succeeded_in_stage:succeeded_in_stage_filter -> unit -> pipeline_execution_filter

val make_list_pipeline_executions_input :
  ?max_results:max_results ->
  ?filter:pipeline_execution_filter ->
  ?next_token:next_token ->
  pipeline_name:pipeline_name ->
  unit ->
  list_pipeline_executions_input

val make_deploy_target_event_context :
  ?ssm_command_id:string_ -> ?message:string_ -> unit -> deploy_target_event_context

val make_deploy_target_event :
  ?name:string_ ->
  ?status:string_ ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  ?context:deploy_target_event_context ->
  unit ->
  deploy_target_event

val make_deploy_action_execution_target :
  ?target_id:string_ ->
  ?target_type:string_ ->
  ?status:string_ ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  ?events:deploy_target_event_list ->
  unit ->
  deploy_action_execution_target

val make_list_deploy_action_execution_targets_output :
  ?targets:deploy_action_execution_target_list ->
  ?next_token:next_token ->
  unit ->
  list_deploy_action_execution_targets_output

val make_target_filter :
  ?name:target_filter_name -> ?values:target_filter_value_list -> unit -> target_filter

val make_list_deploy_action_execution_targets_input :
  ?pipeline_name:pipeline_name ->
  ?filters:target_filter_list ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  action_execution_id:action_execution_id ->
  unit ->
  list_deploy_action_execution_targets_input

val make_list_action_types_output :
  ?next_token:next_token -> action_types:action_type_list -> unit -> list_action_types_output

val make_list_action_types_input :
  ?action_owner_filter:action_owner ->
  ?next_token:next_token ->
  ?region_filter:aws_region_name ->
  unit ->
  list_action_types_input

val make_list_action_executions_output :
  ?action_execution_details:action_execution_detail_list ->
  ?next_token:next_token ->
  unit ->
  list_action_executions_output

val make_list_action_executions_input :
  ?filter:action_execution_filter ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  pipeline_name:pipeline_name ->
  unit ->
  list_action_executions_input

val make_third_party_job_data :
  ?action_type_id:action_type_id ->
  ?action_configuration:action_configuration ->
  ?pipeline_context:pipeline_context ->
  ?input_artifacts:artifact_list ->
  ?output_artifacts:artifact_list ->
  ?artifact_credentials:aws_session_credentials ->
  ?continuation_token:continuation_token ->
  ?encryption_key:encryption_key ->
  unit ->
  third_party_job_data

val make_third_party_job_details :
  ?id:third_party_job_id ->
  ?data:third_party_job_data ->
  ?nonce:nonce ->
  unit ->
  third_party_job_details

val make_get_third_party_job_details_output :
  ?job_details:third_party_job_details -> unit -> get_third_party_job_details_output

val make_get_third_party_job_details_input :
  job_id:third_party_job_id ->
  client_token:client_token ->
  unit ->
  get_third_party_job_details_input

val make_retry_stage_metadata :
  ?auto_stage_retry_attempt:retry_attempt ->
  ?manual_stage_retry_attempt:retry_attempt ->
  ?latest_retry_trigger:retry_trigger ->
  unit ->
  retry_stage_metadata

val make_rule_execution :
  ?rule_execution_id:rule_execution_id ->
  ?status:rule_execution_status ->
  ?summary:execution_summary ->
  ?last_status_change:timestamp ->
  ?token:rule_execution_token ->
  ?last_updated_by:last_updated_by ->
  ?external_execution_id:execution_id ->
  ?external_execution_url:url ->
  ?error_details:error_details ->
  unit ->
  rule_execution

val make_rule_revision :
  revision_id:revision ->
  revision_change_id:revision_change_identifier ->
  created:timestamp ->
  unit ->
  rule_revision

val make_rule_state :
  ?rule_name:rule_name ->
  ?current_revision:rule_revision ->
  ?latest_execution:rule_execution ->
  ?entity_url:url ->
  ?revision_url:url ->
  unit ->
  rule_state

val make_condition_execution :
  ?status:condition_execution_status ->
  ?summary:execution_summary ->
  ?last_status_change:timestamp ->
  unit ->
  condition_execution

val make_condition_state :
  ?latest_execution:condition_execution -> ?rule_states:rule_state_list -> unit -> condition_state

val make_stage_conditions_execution :
  ?status:condition_execution_status ->
  ?summary:execution_summary ->
  unit ->
  stage_conditions_execution

val make_stage_condition_state :
  ?latest_execution:stage_conditions_execution ->
  ?condition_states:condition_state_list ->
  unit ->
  stage_condition_state

val make_stage_execution :
  ?type_:execution_type ->
  pipeline_execution_id:pipeline_execution_id ->
  status:stage_execution_status ->
  unit ->
  stage_execution

val make_transition_state :
  ?enabled:enabled ->
  ?last_changed_by:last_changed_by ->
  ?last_changed_at:last_changed_at ->
  ?disabled_reason:disabled_reason ->
  unit ->
  transition_state

val make_stage_state :
  ?stage_name:stage_name ->
  ?inbound_execution:stage_execution ->
  ?inbound_executions:stage_execution_list ->
  ?inbound_transition_state:transition_state ->
  ?action_states:action_state_list ->
  ?latest_execution:stage_execution ->
  ?before_entry_condition_state:stage_condition_state ->
  ?on_success_condition_state:stage_condition_state ->
  ?on_failure_condition_state:stage_condition_state ->
  ?retry_stage_metadata:retry_stage_metadata ->
  unit ->
  stage_state

val make_get_pipeline_state_output :
  ?pipeline_name:pipeline_name ->
  ?pipeline_version:pipeline_version ->
  ?stage_states:stage_state_list ->
  ?created:timestamp ->
  ?updated:timestamp ->
  unit ->
  get_pipeline_state_output

val make_get_pipeline_state_input : name:pipeline_name -> unit -> get_pipeline_state_input

val make_resolved_pipeline_variable :
  ?name:string_ -> ?resolved_value:string_ -> unit -> resolved_pipeline_variable

val make_pipeline_execution :
  ?pipeline_name:pipeline_name ->
  ?pipeline_version:pipeline_version ->
  ?pipeline_execution_id:pipeline_execution_id ->
  ?status:pipeline_execution_status ->
  ?status_summary:pipeline_execution_status_summary ->
  ?artifact_revisions:artifact_revision_list ->
  ?variables:resolved_pipeline_variable_list ->
  ?trigger:execution_trigger ->
  ?execution_mode:execution_mode ->
  ?execution_type:execution_type ->
  ?rollback_metadata:pipeline_rollback_metadata ->
  unit ->
  pipeline_execution

val make_get_pipeline_execution_output :
  ?pipeline_execution:pipeline_execution -> unit -> get_pipeline_execution_output

val make_get_pipeline_execution_input :
  pipeline_name:pipeline_name ->
  pipeline_execution_id:pipeline_execution_id ->
  unit ->
  get_pipeline_execution_input

val make_pipeline_metadata :
  ?pipeline_arn:pipeline_arn ->
  ?created:timestamp ->
  ?updated:timestamp ->
  ?polling_disabled_at:timestamp ->
  unit ->
  pipeline_metadata

val make_get_pipeline_output :
  ?pipeline:pipeline_declaration -> ?metadata:pipeline_metadata -> unit -> get_pipeline_output

val make_get_pipeline_input :
  ?version:pipeline_version -> name:pipeline_name -> unit -> get_pipeline_input

val make_job_details : ?id:job_id -> ?data:job_data -> ?account_id:account_id -> unit -> job_details
val make_get_job_details_output : ?job_details:job_details -> unit -> get_job_details_output
val make_get_job_details_input : job_id:job_id -> unit -> get_job_details_input

val make_get_action_type_output :
  ?action_type:action_type_declaration -> unit -> get_action_type_output

val make_get_action_type_input :
  category:action_category ->
  owner:action_type_owner ->
  provider:action_provider ->
  version:version ->
  unit ->
  get_action_type_input

val make_enable_stage_transition_input :
  pipeline_name:pipeline_name ->
  stage_name:stage_name ->
  transition_type:stage_transition_type ->
  unit ->
  enable_stage_transition_input

val make_disable_stage_transition_input :
  pipeline_name:pipeline_name ->
  stage_name:stage_name ->
  transition_type:stage_transition_type ->
  reason:disabled_reason ->
  unit ->
  disable_stage_transition_input

val make_deregister_webhook_with_third_party_output : unit -> unit

val make_deregister_webhook_with_third_party_input :
  ?webhook_name:webhook_name -> unit -> deregister_webhook_with_third_party_input

val make_delete_webhook_output : unit -> unit
val make_delete_webhook_input : name:webhook_name -> unit -> delete_webhook_input
val make_delete_pipeline_input : name:pipeline_name -> unit -> delete_pipeline_input

val make_delete_custom_action_type_input :
  category:action_category ->
  provider:action_provider ->
  version:version ->
  unit ->
  delete_custom_action_type_input

val make_create_pipeline_output :
  ?pipeline:pipeline_declaration -> ?tags:tag_list -> unit -> create_pipeline_output

val make_create_pipeline_input :
  ?tags:tag_list -> pipeline:pipeline_declaration -> unit -> create_pipeline_input

val make_create_custom_action_type_output :
  ?tags:tag_list -> action_type:action_type -> unit -> create_custom_action_type_output

val make_create_custom_action_type_input :
  ?settings:action_type_settings ->
  ?configuration_properties:action_configuration_property_list ->
  ?tags:tag_list ->
  category:action_category ->
  provider:action_provider ->
  version:version ->
  input_artifact_details:artifact_details ->
  output_artifact_details:artifact_details ->
  unit ->
  create_custom_action_type_input
