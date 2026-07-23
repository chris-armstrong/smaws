(** CodePipeline client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

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

(** {1:Serialization and Deserialization} *)
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

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
