open Types

val make_webhook_filter :
  ?exclude_matched_pattern:wrapper_boolean ->
  pattern:string_ ->
  type_:webhook_filter_type ->
  unit ->
  webhook_filter

val make_scope_configuration :
  ?domain:string_ -> scope:webhook_scope_type -> name:string_ -> unit -> scope_configuration

val make_pull_request_build_policy :
  ?approver_roles:pull_request_build_approver_roles ->
  requires_comment_approval:pull_request_build_comment_approval ->
  unit ->
  pull_request_build_policy

val make_webhook :
  ?pull_request_build_policy:pull_request_build_policy ->
  ?status_message:string_ ->
  ?status:webhook_status ->
  ?scope_configuration:scope_configuration ->
  ?last_modified_secret:timestamp ->
  ?manual_creation:wrapper_boolean ->
  ?build_type:webhook_build_type ->
  ?filter_groups:filter_groups ->
  ?branch_filter:string_ ->
  ?secret:non_empty_string ->
  ?payload_url:non_empty_string ->
  ?url:non_empty_string ->
  unit ->
  webhook

val make_vpc_config :
  ?security_group_ids:security_group_ids ->
  ?subnets:subnets ->
  ?vpc_id:non_empty_string ->
  unit ->
  vpc_config

val make_update_webhook_output : ?webhook:webhook -> unit -> update_webhook_output

val make_update_webhook_input :
  ?pull_request_build_policy:pull_request_build_policy ->
  ?build_type:webhook_build_type ->
  ?filter_groups:filter_groups ->
  ?rotate_secret:boolean_ ->
  ?branch_filter:string_ ->
  project_name:project_name ->
  unit ->
  update_webhook_input

val make_s3_report_export_config :
  ?encryption_disabled:wrapper_boolean ->
  ?encryption_key:non_empty_string ->
  ?packaging:report_packaging_type ->
  ?path:string_ ->
  ?bucket_owner:string_ ->
  ?bucket:non_empty_string ->
  unit ->
  s3_report_export_config

val make_report_export_config :
  ?s3_destination:s3_report_export_config ->
  ?export_config_type:report_export_config_type ->
  unit ->
  report_export_config

val make_tag : ?value:value_input -> ?key:key_input -> unit -> tag

val make_report_group :
  ?status:report_group_status_type ->
  ?tags:tag_list ->
  ?last_modified:timestamp ->
  ?created:timestamp ->
  ?export_config:report_export_config ->
  ?type_:report_type ->
  ?name:report_group_name ->
  ?arn:non_empty_string ->
  unit ->
  report_group

val make_update_report_group_output :
  ?report_group:report_group -> unit -> update_report_group_output

val make_update_report_group_input :
  ?tags:tag_list ->
  ?export_config:report_export_config ->
  arn:non_empty_string ->
  unit ->
  update_report_group_input

val make_update_project_visibility_output :
  ?project_visibility:project_visibility_type ->
  ?public_project_alias:non_empty_string ->
  ?project_arn:non_empty_string ->
  unit ->
  update_project_visibility_output

val make_update_project_visibility_input :
  ?resource_access_role:non_empty_string ->
  project_visibility:project_visibility_type ->
  project_arn:non_empty_string ->
  unit ->
  update_project_visibility_input

val make_git_submodules_config : fetch_submodules:wrapper_boolean -> unit -> git_submodules_config
val make_source_auth : ?resource:string_ -> type_:source_auth_type -> unit -> source_auth

val make_build_status_config :
  ?target_url:string_ -> ?context:string_ -> unit -> build_status_config

val make_project_source :
  ?source_identifier:string_ ->
  ?insecure_ssl:wrapper_boolean ->
  ?build_status_config:build_status_config ->
  ?report_build_status:wrapper_boolean ->
  ?auth:source_auth ->
  ?buildspec:string_ ->
  ?git_submodules_config:git_submodules_config ->
  ?git_clone_depth:git_clone_depth ->
  ?location:string_ ->
  type_:source_type ->
  unit ->
  project_source

val make_project_source_version :
  source_version:string_ -> source_identifier:string_ -> unit -> project_source_version

val make_project_artifacts :
  ?bucket_owner_access:bucket_owner_access ->
  ?artifact_identifier:string_ ->
  ?encryption_disabled:wrapper_boolean ->
  ?override_artifact_name:wrapper_boolean ->
  ?packaging:artifact_packaging ->
  ?name:string_ ->
  ?namespace_type:artifact_namespace ->
  ?path:string_ ->
  ?location:string_ ->
  type_:artifacts_type ->
  unit ->
  project_artifacts

val make_project_cache :
  ?cache_namespace:string_ ->
  ?modes:project_cache_modes ->
  ?location:string_ ->
  type_:cache_type ->
  unit ->
  project_cache

val make_compute_configuration :
  ?instance_type:non_empty_string ->
  ?machine_type:machine_type ->
  ?disk:wrapper_long ->
  ?memory:wrapper_long ->
  ?v_cpu:wrapper_long ->
  unit ->
  compute_configuration

val make_project_fleet : ?fleet_arn:string_ -> unit -> project_fleet

val make_environment_variable :
  ?type_:environment_variable_type ->
  value:string_ ->
  name:non_empty_string ->
  unit ->
  environment_variable

val make_registry_credential :
  credential_provider:credential_provider_type ->
  credential:non_empty_string ->
  unit ->
  registry_credential

val make_docker_server_status : ?message:string_ -> ?status:string_ -> unit -> docker_server_status

val make_docker_server :
  ?status:docker_server_status ->
  ?security_group_ids:security_group_ids ->
  compute_type:compute_type ->
  unit ->
  docker_server

val make_project_environment :
  ?host_kernel:host_kernel ->
  ?docker_server:docker_server ->
  ?image_pull_credentials_type:image_pull_credentials_type ->
  ?registry_credential:registry_credential ->
  ?certificate:string_ ->
  ?privileged_mode:wrapper_boolean ->
  ?environment_variables:environment_variables ->
  ?fleet:project_fleet ->
  ?compute_configuration:compute_configuration ->
  compute_type:compute_type ->
  image:non_empty_string ->
  type_:environment_type ->
  unit ->
  project_environment

val make_project_badge :
  ?badge_request_url:string_ -> ?badge_enabled:boolean_ -> unit -> project_badge

val make_cloud_watch_logs_config :
  ?stream_name:string_ ->
  ?group_name:string_ ->
  status:logs_config_status_type ->
  unit ->
  cloud_watch_logs_config

val make_s3_logs_config :
  ?bucket_owner_access:bucket_owner_access ->
  ?encryption_disabled:wrapper_boolean ->
  ?location:string_ ->
  status:logs_config_status_type ->
  unit ->
  s3_logs_config

val make_logs_config :
  ?s3_logs:s3_logs_config -> ?cloud_watch_logs:cloud_watch_logs_config -> unit -> logs_config

val make_project_file_system_location :
  ?mount_options:string_ ->
  ?identifier:string_ ->
  ?mount_point:string_ ->
  ?location:string_ ->
  ?type_:file_system_type ->
  unit ->
  project_file_system_location

val make_batch_restrictions :
  ?fleets_allowed:fleets_allowed ->
  ?compute_types_allowed:compute_types_allowed ->
  ?maximum_builds_allowed:wrapper_int ->
  unit ->
  batch_restrictions

val make_project_build_batch_config :
  ?batch_report_mode:batch_report_mode_type ->
  ?timeout_in_mins:wrapper_int ->
  ?restrictions:batch_restrictions ->
  ?combine_artifacts:wrapper_boolean ->
  ?service_role:non_empty_string ->
  unit ->
  project_build_batch_config

val make_project :
  ?auto_retry_limit:wrapper_int ->
  ?resource_access_role:non_empty_string ->
  ?public_project_alias:non_empty_string ->
  ?project_visibility:project_visibility_type ->
  ?concurrent_build_limit:wrapper_int ->
  ?build_batch_config:project_build_batch_config ->
  ?file_system_locations:project_file_system_locations ->
  ?logs_config:logs_config ->
  ?badge:project_badge ->
  ?vpc_config:vpc_config ->
  ?webhook:webhook ->
  ?last_modified:timestamp ->
  ?created:timestamp ->
  ?tags:tag_list ->
  ?encryption_key:non_empty_string ->
  ?queued_timeout_in_minutes:time_out ->
  ?timeout_in_minutes:build_time_out ->
  ?service_role:non_empty_string ->
  ?environment:project_environment ->
  ?cache:project_cache ->
  ?secondary_artifacts:project_artifacts_list ->
  ?artifacts:project_artifacts ->
  ?secondary_source_versions:project_secondary_source_versions ->
  ?source_version:string_ ->
  ?secondary_sources:project_sources ->
  ?source:project_source ->
  ?description:project_description ->
  ?arn:string_ ->
  ?name:project_name ->
  unit ->
  project

val make_update_project_output : ?project:project -> unit -> update_project_output

val make_update_project_input :
  ?auto_retry_limit:wrapper_int ->
  ?concurrent_build_limit:wrapper_int ->
  ?build_batch_config:project_build_batch_config ->
  ?file_system_locations:project_file_system_locations ->
  ?logs_config:logs_config ->
  ?badge_enabled:wrapper_boolean ->
  ?vpc_config:vpc_config ->
  ?tags:tag_list ->
  ?encryption_key:non_empty_string ->
  ?queued_timeout_in_minutes:time_out ->
  ?timeout_in_minutes:build_time_out ->
  ?service_role:non_empty_string ->
  ?environment:project_environment ->
  ?cache:project_cache ->
  ?secondary_artifacts:project_artifacts_list ->
  ?artifacts:project_artifacts ->
  ?secondary_source_versions:project_secondary_source_versions ->
  ?source_version:string_ ->
  ?secondary_sources:project_sources ->
  ?source:project_source ->
  ?description:project_description ->
  name:non_empty_string ->
  unit ->
  update_project_input

val make_fleet_status :
  ?message:string_ ->
  ?context:fleet_context_code ->
  ?status_code:fleet_status_code ->
  unit ->
  fleet_status

val make_target_tracking_scaling_configuration :
  ?target_value:wrapper_double ->
  ?metric_type:fleet_scaling_metric_type ->
  unit ->
  target_tracking_scaling_configuration

val make_scaling_configuration_output :
  ?desired_capacity:fleet_capacity ->
  ?max_capacity:fleet_capacity ->
  ?target_tracking_scaling_configs:target_tracking_scaling_configurations ->
  ?scaling_type:fleet_scaling_type ->
  unit ->
  scaling_configuration_output

val make_fleet_proxy_rule :
  entities:fleet_proxy_rule_entities ->
  effect_:fleet_proxy_rule_effect_type ->
  type_:fleet_proxy_rule_type ->
  unit ->
  fleet_proxy_rule

val make_proxy_configuration :
  ?ordered_proxy_rules:fleet_proxy_rules ->
  ?default_behavior:fleet_proxy_rule_behavior ->
  unit ->
  proxy_configuration

val make_fleet :
  ?tags:tag_list ->
  ?fleet_service_role:non_empty_string ->
  ?image_id:non_empty_string ->
  ?proxy_configuration:proxy_configuration ->
  ?vpc_config:vpc_config ->
  ?overflow_behavior:fleet_overflow_behavior ->
  ?scaling_configuration:scaling_configuration_output ->
  ?compute_configuration:compute_configuration ->
  ?compute_type:compute_type ->
  ?environment_type:environment_type ->
  ?base_capacity:fleet_capacity ->
  ?status:fleet_status ->
  ?last_modified:timestamp ->
  ?created:timestamp ->
  ?id:non_empty_string ->
  ?name:fleet_name ->
  ?arn:non_empty_string ->
  unit ->
  fleet

val make_update_fleet_output : ?fleet:fleet -> unit -> update_fleet_output

val make_scaling_configuration_input :
  ?max_capacity:fleet_capacity ->
  ?target_tracking_scaling_configs:target_tracking_scaling_configurations ->
  ?scaling_type:fleet_scaling_type ->
  unit ->
  scaling_configuration_input

val make_update_fleet_input :
  ?tags:tag_list ->
  ?fleet_service_role:non_empty_string ->
  ?image_id:non_empty_string ->
  ?proxy_configuration:proxy_configuration ->
  ?vpc_config:vpc_config ->
  ?overflow_behavior:fleet_overflow_behavior ->
  ?scaling_configuration:scaling_configuration_input ->
  ?compute_configuration:compute_configuration ->
  ?compute_type:compute_type ->
  ?environment_type:environment_type ->
  ?base_capacity:fleet_capacity ->
  arn:non_empty_string ->
  unit ->
  update_fleet_input

val make_test_report_summary :
  duration_in_nano_seconds:wrapper_long ->
  status_counts:report_status_counts ->
  total:wrapper_int ->
  unit ->
  test_report_summary

val make_test_case :
  ?test_suite_name:string_ ->
  ?expired:timestamp ->
  ?message:string_ ->
  ?duration_in_nano_seconds:wrapper_long ->
  ?status:string_ ->
  ?name:string_ ->
  ?prefix:string_ ->
  ?test_raw_data_path:string_ ->
  ?report_arn:non_empty_string ->
  unit ->
  test_case

val make_test_case_filter : ?keyword:string_ -> ?status:string_ -> unit -> test_case_filter
val make_phase_context : ?message:string_ -> ?status_code:string_ -> unit -> phase_context

val make_sandbox_session_phase :
  ?contexts:phase_contexts ->
  ?duration_in_seconds:wrapper_long ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?phase_status:status_type ->
  ?phase_type:string_ ->
  unit ->
  sandbox_session_phase

val make_logs_location :
  ?s3_logs:s3_logs_config ->
  ?cloud_watch_logs:cloud_watch_logs_config ->
  ?s3_logs_arn:string_ ->
  ?cloud_watch_logs_arn:string_ ->
  ?s3_deep_link:string_ ->
  ?deep_link:string_ ->
  ?stream_name:string_ ->
  ?group_name:string_ ->
  unit ->
  logs_location

val make_network_interface :
  ?network_interface_id:non_empty_string -> ?subnet_id:non_empty_string -> unit -> network_interface

val make_sandbox_session :
  ?network_interface:network_interface ->
  ?logs:logs_location ->
  ?resolved_source_version:non_empty_string ->
  ?phases:sandbox_session_phases ->
  ?current_phase:string_ ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?status:string_ ->
  ?id:non_empty_string ->
  unit ->
  sandbox_session

val make_sandbox :
  ?current_session:sandbox_session ->
  ?service_role:non_empty_string ->
  ?encryption_key:non_empty_string ->
  ?log_config:logs_config ->
  ?vpc_config:vpc_config ->
  ?queued_timeout_in_minutes:wrapper_int ->
  ?timeout_in_minutes:wrapper_int ->
  ?file_system_locations:project_file_system_locations ->
  ?environment:project_environment ->
  ?secondary_source_versions:project_secondary_source_versions ->
  ?secondary_sources:project_sources ->
  ?source_version:non_empty_string ->
  ?source:project_source ->
  ?status:string_ ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?request_time:timestamp ->
  ?project_name:non_empty_string ->
  ?arn:non_empty_string ->
  ?id:non_empty_string ->
  unit ->
  sandbox

val make_stop_sandbox_output : ?sandbox:sandbox -> unit -> stop_sandbox_output
val make_stop_sandbox_input : id:non_empty_string -> unit -> stop_sandbox_input

val make_build_phase :
  ?contexts:phase_contexts ->
  ?duration_in_seconds:wrapper_long ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?phase_status:status_type ->
  ?phase_type:build_phase_type ->
  unit ->
  build_phase

val make_build_artifacts :
  ?bucket_owner_access:bucket_owner_access ->
  ?artifact_identifier:string_ ->
  ?encryption_disabled:wrapper_boolean ->
  ?override_artifact_name:wrapper_boolean ->
  ?md5sum:string_ ->
  ?sha256sum:string_ ->
  ?location:string_ ->
  unit ->
  build_artifacts

val make_exported_environment_variable :
  ?value:string_ -> ?name:non_empty_string -> unit -> exported_environment_variable

val make_debug_session :
  ?session_target:non_empty_string -> ?session_enabled:wrapper_boolean -> unit -> debug_session

val make_auto_retry_config :
  ?previous_auto_retry:string_ ->
  ?next_auto_retry:string_ ->
  ?auto_retry_number:wrapper_int ->
  ?auto_retry_limit:wrapper_int ->
  unit ->
  auto_retry_config

val make_build :
  ?auto_retry_config:auto_retry_config ->
  ?build_batch_arn:string_ ->
  ?debug_session:debug_session ->
  ?file_system_locations:project_file_system_locations ->
  ?report_arns:build_report_arns ->
  ?exported_environment_variables:exported_environment_variables ->
  ?encryption_key:non_empty_string ->
  ?network_interface:network_interface ->
  ?vpc_config:vpc_config ->
  ?initiator:string_ ->
  ?build_complete:boolean_ ->
  ?queued_timeout_in_minutes:wrapper_int ->
  ?timeout_in_minutes:wrapper_int ->
  ?logs:logs_location ->
  ?service_role:non_empty_string ->
  ?environment:project_environment ->
  ?cache:project_cache ->
  ?secondary_artifacts:build_artifacts_list ->
  ?artifacts:build_artifacts ->
  ?secondary_source_versions:project_secondary_source_versions ->
  ?secondary_sources:project_sources ->
  ?source:project_source ->
  ?phases:build_phases ->
  ?project_name:non_empty_string ->
  ?resolved_source_version:non_empty_string ->
  ?source_version:non_empty_string ->
  ?build_status:status_type ->
  ?current_phase:string_ ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?build_number:wrapper_long ->
  ?arn:non_empty_string ->
  ?id:non_empty_string ->
  unit ->
  build

val make_stop_build_output : ?build:build -> unit -> stop_build_output
val make_stop_build_input : id:non_empty_string -> unit -> stop_build_input

val make_build_batch_phase :
  ?contexts:phase_contexts ->
  ?duration_in_seconds:wrapper_long ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?phase_status:status_type ->
  ?phase_type:build_batch_phase_type ->
  unit ->
  build_batch_phase

val make_resolved_artifact :
  ?identifier:string_ -> ?location:string_ -> ?type_:artifacts_type -> unit -> resolved_artifact

val make_build_summary :
  ?secondary_artifacts:resolved_secondary_artifacts ->
  ?primary_artifact:resolved_artifact ->
  ?build_status:status_type ->
  ?requested_on:timestamp ->
  ?arn:string_ ->
  unit ->
  build_summary

val make_build_group :
  ?prior_build_summary_list:build_summaries ->
  ?current_build_summary:build_summary ->
  ?ignore_failure:boolean_ ->
  ?depends_on:identifiers ->
  ?identifier:string_ ->
  unit ->
  build_group

val make_build_batch :
  ?report_arns:build_report_arns ->
  ?debug_session_enabled:wrapper_boolean ->
  ?build_groups:build_groups ->
  ?build_batch_config:project_build_batch_config ->
  ?file_system_locations:project_file_system_locations ->
  ?build_batch_number:wrapper_long ->
  ?encryption_key:non_empty_string ->
  ?vpc_config:vpc_config ->
  ?initiator:string_ ->
  ?complete:boolean_ ->
  ?queued_timeout_in_minutes:wrapper_int ->
  ?build_timeout_in_minutes:wrapper_int ->
  ?log_config:logs_config ->
  ?service_role:non_empty_string ->
  ?environment:project_environment ->
  ?cache:project_cache ->
  ?secondary_artifacts:build_artifacts_list ->
  ?artifacts:build_artifacts ->
  ?secondary_source_versions:project_secondary_source_versions ->
  ?secondary_sources:project_sources ->
  ?source:project_source ->
  ?phases:build_batch_phases ->
  ?project_name:non_empty_string ->
  ?resolved_source_version:non_empty_string ->
  ?source_version:non_empty_string ->
  ?build_batch_status:status_type ->
  ?current_phase:string_ ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?arn:non_empty_string ->
  ?id:non_empty_string ->
  unit ->
  build_batch

val make_stop_build_batch_output : ?build_batch:build_batch -> unit -> stop_build_batch_output
val make_stop_build_batch_input : id:non_empty_string -> unit -> stop_build_batch_input
val make_start_sandbox_output : ?sandbox:sandbox -> unit -> start_sandbox_output

val make_start_sandbox_input :
  ?idempotency_token:sensitive_string ->
  ?project_name:non_empty_string ->
  unit ->
  start_sandbox_input

val make_ssm_session :
  ?stream_url:string_ -> ?token_value:string_ -> ?session_id:string_ -> unit -> ssm_session

val make_start_sandbox_connection_output :
  ?ssm_session:ssm_session -> unit -> start_sandbox_connection_output

val make_start_sandbox_connection_input :
  sandbox_id:non_empty_string -> unit -> start_sandbox_connection_input

val make_command_execution :
  ?sandbox_arn:non_empty_string ->
  ?logs:logs_location ->
  ?standard_err_content:sensitive_non_empty_string ->
  ?standard_output_content:sensitive_non_empty_string ->
  ?exit_code:non_empty_string ->
  ?type_:command_type ->
  ?command:sensitive_non_empty_string ->
  ?status:non_empty_string ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?submit_time:timestamp ->
  ?sandbox_id:non_empty_string ->
  ?id:non_empty_string ->
  unit ->
  command_execution

val make_start_command_execution_output :
  ?command_execution:command_execution -> unit -> start_command_execution_output

val make_start_command_execution_input :
  ?type_:command_type ->
  command:sensitive_non_empty_string ->
  sandbox_id:non_empty_string ->
  unit ->
  start_command_execution_input

val make_start_build_output : ?build:build -> unit -> start_build_output

val make_start_build_input :
  ?host_kernel_override:host_kernel ->
  ?auto_retry_limit_override:wrapper_int ->
  ?fleet_override:project_fleet ->
  ?debug_session_enabled:wrapper_boolean ->
  ?image_pull_credentials_type_override:image_pull_credentials_type ->
  ?registry_credential_override:registry_credential ->
  ?logs_config_override:logs_config ->
  ?idempotency_token:string_ ->
  ?encryption_key_override:non_empty_string ->
  ?queued_timeout_in_minutes_override:time_out ->
  ?timeout_in_minutes_override:build_time_out ->
  ?privileged_mode_override:wrapper_boolean ->
  ?service_role_override:non_empty_string ->
  ?cache_override:project_cache ->
  ?certificate_override:string_ ->
  ?compute_type_override:compute_type ->
  ?image_override:non_empty_string ->
  ?environment_type_override:environment_type ->
  ?build_status_config_override:build_status_config ->
  ?report_build_status_override:wrapper_boolean ->
  ?insecure_ssl_override:wrapper_boolean ->
  ?buildspec_override:string_ ->
  ?git_submodules_config_override:git_submodules_config ->
  ?git_clone_depth_override:git_clone_depth ->
  ?source_auth_override:source_auth ->
  ?source_location_override:string_ ->
  ?source_type_override:source_type ->
  ?environment_variables_override:environment_variables ->
  ?secondary_artifacts_override:project_artifacts_list ->
  ?artifacts_override:project_artifacts ->
  ?source_version:string_ ->
  ?secondary_sources_version_override:project_secondary_source_versions ->
  ?secondary_sources_override:project_sources ->
  project_name:non_empty_string ->
  unit ->
  start_build_input

val make_start_build_batch_output : ?build_batch:build_batch -> unit -> start_build_batch_output

val make_start_build_batch_input :
  ?debug_session_enabled:wrapper_boolean ->
  ?build_batch_config_override:project_build_batch_config ->
  ?image_pull_credentials_type_override:image_pull_credentials_type ->
  ?registry_credential_override:registry_credential ->
  ?logs_config_override:logs_config ->
  ?idempotency_token:string_ ->
  ?encryption_key_override:non_empty_string ->
  ?queued_timeout_in_minutes_override:time_out ->
  ?build_timeout_in_minutes_override:build_time_out ->
  ?privileged_mode_override:wrapper_boolean ->
  ?service_role_override:non_empty_string ->
  ?cache_override:project_cache ->
  ?certificate_override:string_ ->
  ?compute_type_override:compute_type ->
  ?image_override:non_empty_string ->
  ?environment_type_override:environment_type ->
  ?report_build_batch_status_override:wrapper_boolean ->
  ?insecure_ssl_override:wrapper_boolean ->
  ?buildspec_override:string_ ->
  ?git_submodules_config_override:git_submodules_config ->
  ?git_clone_depth_override:git_clone_depth ->
  ?source_auth_override:source_auth ->
  ?source_location_override:string_ ->
  ?source_type_override:source_type ->
  ?environment_variables_override:environment_variables ->
  ?secondary_artifacts_override:project_artifacts_list ->
  ?artifacts_override:project_artifacts ->
  ?source_version:string_ ->
  ?secondary_sources_version_override:project_secondary_source_versions ->
  ?secondary_sources_override:project_sources ->
  project_name:non_empty_string ->
  unit ->
  start_build_batch_input

val make_source_credentials_info :
  ?resource:string_ ->
  ?auth_type:auth_type ->
  ?server_type:server_type ->
  ?arn:non_empty_string ->
  unit ->
  source_credentials_info

val make_retry_build_output : ?build:build -> unit -> retry_build_output

val make_retry_build_input :
  ?idempotency_token:string_ -> ?id:non_empty_string -> unit -> retry_build_input

val make_retry_build_batch_output : ?build_batch:build_batch -> unit -> retry_build_batch_output

val make_retry_build_batch_input :
  ?retry_type:retry_build_batch_type ->
  ?idempotency_token:string_ ->
  ?id:non_empty_string ->
  unit ->
  retry_build_batch_input

val make_code_coverage_report_summary :
  ?branches_missed:non_negative_int ->
  ?branches_covered:non_negative_int ->
  ?branch_coverage_percentage:percentage ->
  ?lines_missed:non_negative_int ->
  ?lines_covered:non_negative_int ->
  ?line_coverage_percentage:percentage ->
  unit ->
  code_coverage_report_summary

val make_report :
  ?code_coverage_summary:code_coverage_report_summary ->
  ?test_summary:test_report_summary ->
  ?truncated:wrapper_boolean ->
  ?export_config:report_export_config ->
  ?expired:timestamp ->
  ?created:timestamp ->
  ?status:report_status_type ->
  ?execution_id:string_ ->
  ?report_group_arn:non_empty_string ->
  ?name:string_ ->
  ?type_:report_type ->
  ?arn:non_empty_string ->
  unit ->
  report

val make_report_with_raw_data :
  ?data:string_ -> ?report_arn:non_empty_string -> unit -> report_with_raw_data

val make_report_group_trend_stats :
  ?min:string_ -> ?max:string_ -> ?average:string_ -> unit -> report_group_trend_stats

val make_report_filter : ?status:report_status_type -> unit -> report_filter

val make_put_resource_policy_output :
  ?resource_arn:non_empty_string -> unit -> put_resource_policy_output

val make_put_resource_policy_input :
  resource_arn:non_empty_string -> policy:non_empty_string -> unit -> put_resource_policy_input

val make_list_source_credentials_output :
  ?source_credentials_infos:source_credentials_infos -> unit -> list_source_credentials_output

val make_list_source_credentials_input : unit -> unit

val make_list_shared_report_groups_output :
  ?report_groups:report_group_arns ->
  ?next_token:string_ ->
  unit ->
  list_shared_report_groups_output

val make_list_shared_report_groups_input :
  ?max_results:page_size ->
  ?next_token:string_ ->
  ?sort_by:shared_resource_sort_by_type ->
  ?sort_order:sort_order_type ->
  unit ->
  list_shared_report_groups_input

val make_list_shared_projects_output :
  ?projects:project_arns -> ?next_token:string_ -> unit -> list_shared_projects_output

val make_list_shared_projects_input :
  ?next_token:non_empty_string ->
  ?max_results:page_size ->
  ?sort_order:sort_order_type ->
  ?sort_by:shared_resource_sort_by_type ->
  unit ->
  list_shared_projects_input

val make_list_sandboxes_output :
  ?next_token:string_ -> ?ids:sandbox_ids -> unit -> list_sandboxes_output

val make_list_sandboxes_input :
  ?next_token:string_ ->
  ?sort_order:sort_order_type ->
  ?max_results:page_size ->
  unit ->
  list_sandboxes_input

val make_list_sandboxes_for_project_output :
  ?next_token:string_ -> ?ids:sandbox_ids -> unit -> list_sandboxes_for_project_output

val make_list_sandboxes_for_project_input :
  ?next_token:sensitive_string ->
  ?sort_order:sort_order_type ->
  ?max_results:page_size ->
  project_name:non_empty_string ->
  unit ->
  list_sandboxes_for_project_input

val make_list_reports_output :
  ?reports:report_arns -> ?next_token:string_ -> unit -> list_reports_output

val make_list_reports_input :
  ?filter:report_filter ->
  ?max_results:page_size ->
  ?next_token:string_ ->
  ?sort_order:sort_order_type ->
  unit ->
  list_reports_input

val make_list_reports_for_report_group_output :
  ?reports:report_arns -> ?next_token:string_ -> unit -> list_reports_for_report_group_output

val make_list_reports_for_report_group_input :
  ?filter:report_filter ->
  ?max_results:page_size ->
  ?sort_order:sort_order_type ->
  ?next_token:string_ ->
  report_group_arn:string_ ->
  unit ->
  list_reports_for_report_group_input

val make_list_report_groups_output :
  ?report_groups:report_group_arns -> ?next_token:string_ -> unit -> list_report_groups_output

val make_list_report_groups_input :
  ?max_results:page_size ->
  ?next_token:string_ ->
  ?sort_by:report_group_sort_by_type ->
  ?sort_order:sort_order_type ->
  unit ->
  list_report_groups_input

val make_list_projects_output :
  ?projects:project_names -> ?next_token:string_ -> unit -> list_projects_output

val make_list_projects_input :
  ?next_token:non_empty_string ->
  ?sort_order:sort_order_type ->
  ?sort_by:project_sort_by_type ->
  unit ->
  list_projects_input

val make_list_fleets_output :
  ?fleets:fleet_arns -> ?next_token:string_ -> unit -> list_fleets_output

val make_list_fleets_input :
  ?sort_by:fleet_sort_by_type ->
  ?sort_order:sort_order_type ->
  ?max_results:page_size ->
  ?next_token:sensitive_string ->
  unit ->
  list_fleets_input

val make_environment_image :
  ?versions:image_versions -> ?description:string_ -> ?name:string_ -> unit -> environment_image

val make_environment_language :
  ?images:environment_images -> ?language:language_type -> unit -> environment_language

val make_environment_platform :
  ?languages:environment_languages -> ?platform:platform_type -> unit -> environment_platform

val make_list_curated_environment_images_output :
  ?platforms:environment_platforms -> unit -> list_curated_environment_images_output

val make_list_curated_environment_images_input : unit -> unit

val make_list_command_executions_for_sandbox_output :
  ?next_token:string_ ->
  ?command_executions:command_executions ->
  unit ->
  list_command_executions_for_sandbox_output

val make_list_command_executions_for_sandbox_input :
  ?next_token:sensitive_string ->
  ?sort_order:sort_order_type ->
  ?max_results:page_size ->
  sandbox_id:non_empty_string ->
  unit ->
  list_command_executions_for_sandbox_input

val make_list_builds_output : ?next_token:string_ -> ?ids:build_ids -> unit -> list_builds_output

val make_list_builds_input :
  ?next_token:string_ -> ?sort_order:sort_order_type -> unit -> list_builds_input

val make_list_builds_for_project_output :
  ?next_token:string_ -> ?ids:build_ids -> unit -> list_builds_for_project_output

val make_list_builds_for_project_input :
  ?next_token:string_ ->
  ?sort_order:sort_order_type ->
  project_name:non_empty_string ->
  unit ->
  list_builds_for_project_input

val make_list_build_batches_output :
  ?next_token:string_ -> ?ids:build_batch_ids -> unit -> list_build_batches_output

val make_build_batch_filter : ?status:status_type -> unit -> build_batch_filter

val make_list_build_batches_input :
  ?next_token:string_ ->
  ?sort_order:sort_order_type ->
  ?max_results:page_size ->
  ?filter:build_batch_filter ->
  unit ->
  list_build_batches_input

val make_list_build_batches_for_project_output :
  ?next_token:string_ -> ?ids:build_batch_ids -> unit -> list_build_batches_for_project_output

val make_list_build_batches_for_project_input :
  ?next_token:string_ ->
  ?sort_order:sort_order_type ->
  ?max_results:page_size ->
  ?filter:build_batch_filter ->
  ?project_name:non_empty_string ->
  unit ->
  list_build_batches_for_project_input

val make_invalidate_project_cache_output : unit -> unit

val make_invalidate_project_cache_input :
  project_name:non_empty_string -> unit -> invalidate_project_cache_input

val make_import_source_credentials_output :
  ?arn:non_empty_string -> unit -> import_source_credentials_output

val make_import_source_credentials_input :
  ?should_overwrite:wrapper_boolean ->
  ?username:non_empty_string ->
  auth_type:auth_type ->
  server_type:server_type ->
  token:sensitive_non_empty_string ->
  unit ->
  import_source_credentials_input

val make_get_resource_policy_output : ?policy:non_empty_string -> unit -> get_resource_policy_output

val make_get_resource_policy_input :
  resource_arn:non_empty_string -> unit -> get_resource_policy_input

val make_get_report_group_trend_output :
  ?raw_data:report_group_trend_raw_data_list ->
  ?stats:report_group_trend_stats ->
  unit ->
  get_report_group_trend_output

val make_get_report_group_trend_input :
  ?num_of_reports:page_size ->
  trend_field:report_group_trend_field_type ->
  report_group_arn:non_empty_string ->
  unit ->
  get_report_group_trend_input

val make_describe_test_cases_output :
  ?test_cases:test_cases -> ?next_token:string_ -> unit -> describe_test_cases_output

val make_describe_test_cases_input :
  ?filter:test_case_filter ->
  ?max_results:page_size ->
  ?next_token:string_ ->
  report_arn:string_ ->
  unit ->
  describe_test_cases_input

val make_code_coverage :
  ?expired:timestamp ->
  ?branches_missed:non_negative_int ->
  ?branches_covered:non_negative_int ->
  ?branch_coverage_percentage:percentage ->
  ?lines_missed:non_negative_int ->
  ?lines_covered:non_negative_int ->
  ?line_coverage_percentage:percentage ->
  ?file_path:non_empty_string ->
  ?report_ar_n:non_empty_string ->
  ?id:non_empty_string ->
  unit ->
  code_coverage

val make_describe_code_coverages_output :
  ?code_coverages:code_coverages -> ?next_token:string_ -> unit -> describe_code_coverages_output

val make_describe_code_coverages_input :
  ?max_line_coverage_percentage:percentage ->
  ?min_line_coverage_percentage:percentage ->
  ?sort_by:report_code_coverage_sort_by_type ->
  ?sort_order:sort_order_type ->
  ?max_results:page_size ->
  ?next_token:string_ ->
  report_arn:non_empty_string ->
  unit ->
  describe_code_coverages_input

val make_delete_webhook_output : unit -> unit
val make_delete_webhook_input : project_name:project_name -> unit -> delete_webhook_input

val make_delete_source_credentials_output :
  ?arn:non_empty_string -> unit -> delete_source_credentials_output

val make_delete_source_credentials_input :
  arn:non_empty_string -> unit -> delete_source_credentials_input

val make_delete_resource_policy_output : unit -> unit

val make_delete_resource_policy_input :
  resource_arn:non_empty_string -> unit -> delete_resource_policy_input

val make_delete_report_output : unit -> unit
val make_delete_report_input : arn:non_empty_string -> unit -> delete_report_input
val make_delete_report_group_output : unit -> unit

val make_delete_report_group_input :
  ?delete_reports:boolean_ -> arn:non_empty_string -> unit -> delete_report_group_input

val make_delete_project_output : unit -> unit
val make_delete_project_input : name:non_empty_string -> unit -> delete_project_input
val make_delete_fleet_output : unit -> unit
val make_delete_fleet_input : arn:non_empty_string -> unit -> delete_fleet_input

val make_build_not_deleted :
  ?status_code:string_ -> ?id:non_empty_string -> unit -> build_not_deleted

val make_delete_build_batch_output :
  ?builds_not_deleted:builds_not_deleted ->
  ?builds_deleted:build_ids ->
  ?status_code:string_ ->
  unit ->
  delete_build_batch_output

val make_delete_build_batch_input : id:non_empty_string -> unit -> delete_build_batch_input
val make_create_webhook_output : ?webhook:webhook -> unit -> create_webhook_output

val make_create_webhook_input :
  ?pull_request_build_policy:pull_request_build_policy ->
  ?scope_configuration:scope_configuration ->
  ?manual_creation:wrapper_boolean ->
  ?build_type:webhook_build_type ->
  ?filter_groups:filter_groups ->
  ?branch_filter:string_ ->
  project_name:project_name ->
  unit ->
  create_webhook_input

val make_create_report_group_output :
  ?report_group:report_group -> unit -> create_report_group_output

val make_create_report_group_input :
  ?tags:tag_list ->
  export_config:report_export_config ->
  type_:report_type ->
  name:report_group_name ->
  unit ->
  create_report_group_input

val make_create_project_output : ?project:project -> unit -> create_project_output

val make_create_project_input :
  ?auto_retry_limit:wrapper_int ->
  ?concurrent_build_limit:wrapper_int ->
  ?build_batch_config:project_build_batch_config ->
  ?file_system_locations:project_file_system_locations ->
  ?logs_config:logs_config ->
  ?badge_enabled:wrapper_boolean ->
  ?vpc_config:vpc_config ->
  ?tags:tag_list ->
  ?encryption_key:non_empty_string ->
  ?queued_timeout_in_minutes:time_out ->
  ?timeout_in_minutes:build_time_out ->
  ?cache:project_cache ->
  ?secondary_artifacts:project_artifacts_list ->
  ?secondary_source_versions:project_secondary_source_versions ->
  ?source_version:string_ ->
  ?secondary_sources:project_sources ->
  ?description:project_description ->
  service_role:non_empty_string ->
  environment:project_environment ->
  artifacts:project_artifacts ->
  source:project_source ->
  name:project_name ->
  unit ->
  create_project_input

val make_create_fleet_output : ?fleet:fleet -> unit -> create_fleet_output

val make_create_fleet_input :
  ?tags:tag_list ->
  ?fleet_service_role:non_empty_string ->
  ?image_id:non_empty_string ->
  ?proxy_configuration:proxy_configuration ->
  ?vpc_config:vpc_config ->
  ?overflow_behavior:fleet_overflow_behavior ->
  ?scaling_configuration:scaling_configuration_input ->
  ?compute_configuration:compute_configuration ->
  compute_type:compute_type ->
  environment_type:environment_type ->
  base_capacity:fleet_capacity ->
  name:fleet_name ->
  unit ->
  create_fleet_input

val make_batch_get_sandboxes_output :
  ?sandboxes_not_found:sandbox_ids -> ?sandboxes:sandboxes -> unit -> batch_get_sandboxes_output

val make_batch_get_sandboxes_input : ids:sandbox_ids -> unit -> batch_get_sandboxes_input

val make_batch_get_reports_output :
  ?reports_not_found:report_arns -> ?reports:reports -> unit -> batch_get_reports_output

val make_batch_get_reports_input : report_arns:report_arns -> unit -> batch_get_reports_input

val make_batch_get_report_groups_output :
  ?report_groups_not_found:report_group_arns ->
  ?report_groups:report_groups ->
  unit ->
  batch_get_report_groups_output

val make_batch_get_report_groups_input :
  report_group_arns:report_group_arns -> unit -> batch_get_report_groups_input

val make_batch_get_projects_output :
  ?projects_not_found:project_names -> ?projects:projects -> unit -> batch_get_projects_output

val make_batch_get_projects_input : names:project_names -> unit -> batch_get_projects_input

val make_batch_get_fleets_output :
  ?fleets_not_found:fleet_names -> ?fleets:fleets -> unit -> batch_get_fleets_output

val make_batch_get_fleets_input : names:fleet_names -> unit -> batch_get_fleets_input

val make_batch_get_command_executions_output :
  ?command_executions_not_found:command_execution_ids ->
  ?command_executions:command_executions ->
  unit ->
  batch_get_command_executions_output

val make_batch_get_command_executions_input :
  command_execution_ids:command_execution_ids ->
  sandbox_id:non_empty_string ->
  unit ->
  batch_get_command_executions_input

val make_batch_get_builds_output :
  ?builds_not_found:build_ids -> ?builds:builds -> unit -> batch_get_builds_output

val make_batch_get_builds_input : ids:build_ids -> unit -> batch_get_builds_input

val make_batch_get_build_batches_output :
  ?build_batches_not_found:build_batch_ids ->
  ?build_batches:build_batches ->
  unit ->
  batch_get_build_batches_output

val make_batch_get_build_batches_input :
  ids:build_batch_ids -> unit -> batch_get_build_batches_input

val make_batch_delete_builds_output :
  ?builds_not_deleted:builds_not_deleted ->
  ?builds_deleted:build_ids ->
  unit ->
  batch_delete_builds_output

val make_batch_delete_builds_input : ids:build_ids -> unit -> batch_delete_builds_input
