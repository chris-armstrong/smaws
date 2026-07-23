open Types

val make_auto_retry_config :
  ?auto_retry_limit:wrapper_int ->
  ?auto_retry_number:wrapper_int ->
  ?next_auto_retry:string_ ->
  ?previous_auto_retry:string_ ->
  unit ->
  auto_retry_config

val make_build_not_deleted :
  ?id:non_empty_string -> ?status_code:string_ -> unit -> build_not_deleted

val make_batch_delete_builds_output :
  ?builds_deleted:build_ids ->
  ?builds_not_deleted:builds_not_deleted ->
  unit ->
  batch_delete_builds_output

val make_batch_delete_builds_input : ids:build_ids -> unit -> batch_delete_builds_input

val make_resolved_artifact :
  ?type_:artifacts_type -> ?location:string_ -> ?identifier:string_ -> unit -> resolved_artifact

val make_build_summary :
  ?arn:string_ ->
  ?requested_on:timestamp ->
  ?build_status:status_type ->
  ?primary_artifact:resolved_artifact ->
  ?secondary_artifacts:resolved_secondary_artifacts ->
  unit ->
  build_summary

val make_build_group :
  ?identifier:string_ ->
  ?depends_on:identifiers ->
  ?ignore_failure:boolean_ ->
  ?current_build_summary:build_summary ->
  ?prior_build_summary_list:build_summaries ->
  unit ->
  build_group

val make_batch_restrictions :
  ?maximum_builds_allowed:wrapper_int ->
  ?compute_types_allowed:compute_types_allowed ->
  ?fleets_allowed:fleets_allowed ->
  unit ->
  batch_restrictions

val make_project_build_batch_config :
  ?service_role:non_empty_string ->
  ?combine_artifacts:wrapper_boolean ->
  ?restrictions:batch_restrictions ->
  ?timeout_in_mins:wrapper_int ->
  ?batch_report_mode:batch_report_mode_type ->
  unit ->
  project_build_batch_config

val make_project_file_system_location :
  ?type_:file_system_type ->
  ?location:string_ ->
  ?mount_point:string_ ->
  ?identifier:string_ ->
  ?mount_options:string_ ->
  unit ->
  project_file_system_location

val make_vpc_config :
  ?vpc_id:non_empty_string ->
  ?subnets:subnets ->
  ?security_group_ids:security_group_ids ->
  unit ->
  vpc_config

val make_s3_logs_config :
  ?location:string_ ->
  ?encryption_disabled:wrapper_boolean ->
  ?bucket_owner_access:bucket_owner_access ->
  status:logs_config_status_type ->
  unit ->
  s3_logs_config

val make_cloud_watch_logs_config :
  ?group_name:string_ ->
  ?stream_name:string_ ->
  status:logs_config_status_type ->
  unit ->
  cloud_watch_logs_config

val make_logs_config :
  ?cloud_watch_logs:cloud_watch_logs_config -> ?s3_logs:s3_logs_config -> unit -> logs_config

val make_docker_server_status : ?status:string_ -> ?message:string_ -> unit -> docker_server_status

val make_docker_server :
  ?security_group_ids:security_group_ids ->
  ?status:docker_server_status ->
  compute_type:compute_type ->
  unit ->
  docker_server

val make_registry_credential :
  credential:non_empty_string ->
  credential_provider:credential_provider_type ->
  unit ->
  registry_credential

val make_environment_variable :
  ?type_:environment_variable_type ->
  name:non_empty_string ->
  value:string_ ->
  unit ->
  environment_variable

val make_project_fleet : ?fleet_arn:string_ -> unit -> project_fleet

val make_compute_configuration :
  ?v_cpu:wrapper_long ->
  ?memory:wrapper_long ->
  ?disk:wrapper_long ->
  ?machine_type:machine_type ->
  ?instance_type:non_empty_string ->
  unit ->
  compute_configuration

val make_project_environment :
  ?compute_configuration:compute_configuration ->
  ?fleet:project_fleet ->
  ?environment_variables:environment_variables ->
  ?privileged_mode:wrapper_boolean ->
  ?certificate:string_ ->
  ?registry_credential:registry_credential ->
  ?image_pull_credentials_type:image_pull_credentials_type ->
  ?docker_server:docker_server ->
  ?host_kernel:host_kernel ->
  type_:environment_type ->
  image:non_empty_string ->
  compute_type:compute_type ->
  unit ->
  project_environment

val make_project_cache :
  ?location:string_ ->
  ?modes:project_cache_modes ->
  ?cache_namespace:string_ ->
  type_:cache_type ->
  unit ->
  project_cache

val make_build_artifacts :
  ?location:string_ ->
  ?sha256sum:string_ ->
  ?md5sum:string_ ->
  ?override_artifact_name:wrapper_boolean ->
  ?encryption_disabled:wrapper_boolean ->
  ?artifact_identifier:string_ ->
  ?bucket_owner_access:bucket_owner_access ->
  unit ->
  build_artifacts

val make_project_source_version :
  source_identifier:string_ -> source_version:string_ -> unit -> project_source_version

val make_build_status_config :
  ?context:string_ -> ?target_url:string_ -> unit -> build_status_config

val make_source_auth : ?resource:string_ -> type_:source_auth_type -> unit -> source_auth
val make_git_submodules_config : fetch_submodules:wrapper_boolean -> unit -> git_submodules_config

val make_project_source :
  ?location:string_ ->
  ?git_clone_depth:git_clone_depth ->
  ?git_submodules_config:git_submodules_config ->
  ?buildspec:string_ ->
  ?auth:source_auth ->
  ?report_build_status:wrapper_boolean ->
  ?build_status_config:build_status_config ->
  ?insecure_ssl:wrapper_boolean ->
  ?source_identifier:string_ ->
  type_:source_type ->
  unit ->
  project_source

val make_phase_context : ?status_code:string_ -> ?message:string_ -> unit -> phase_context

val make_build_batch_phase :
  ?phase_type:build_batch_phase_type ->
  ?phase_status:status_type ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  ?duration_in_seconds:wrapper_long ->
  ?contexts:phase_contexts ->
  unit ->
  build_batch_phase

val make_build_batch :
  ?id:non_empty_string ->
  ?arn:non_empty_string ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  ?current_phase:string_ ->
  ?build_batch_status:status_type ->
  ?source_version:non_empty_string ->
  ?resolved_source_version:non_empty_string ->
  ?project_name:non_empty_string ->
  ?phases:build_batch_phases ->
  ?source:project_source ->
  ?secondary_sources:project_sources ->
  ?secondary_source_versions:project_secondary_source_versions ->
  ?artifacts:build_artifacts ->
  ?secondary_artifacts:build_artifacts_list ->
  ?cache:project_cache ->
  ?environment:project_environment ->
  ?service_role:non_empty_string ->
  ?log_config:logs_config ->
  ?build_timeout_in_minutes:wrapper_int ->
  ?queued_timeout_in_minutes:wrapper_int ->
  ?complete:boolean_ ->
  ?initiator:string_ ->
  ?vpc_config:vpc_config ->
  ?encryption_key:non_empty_string ->
  ?build_batch_number:wrapper_long ->
  ?file_system_locations:project_file_system_locations ->
  ?build_batch_config:project_build_batch_config ->
  ?build_groups:build_groups ->
  ?debug_session_enabled:wrapper_boolean ->
  ?report_arns:build_report_arns ->
  unit ->
  build_batch

val make_batch_get_build_batches_output :
  ?build_batches:build_batches ->
  ?build_batches_not_found:build_batch_ids ->
  unit ->
  batch_get_build_batches_output

val make_batch_get_build_batches_input :
  ids:build_batch_ids -> unit -> batch_get_build_batches_input

val make_debug_session :
  ?session_enabled:wrapper_boolean -> ?session_target:non_empty_string -> unit -> debug_session

val make_exported_environment_variable :
  ?name:non_empty_string -> ?value:string_ -> unit -> exported_environment_variable

val make_network_interface :
  ?subnet_id:non_empty_string -> ?network_interface_id:non_empty_string -> unit -> network_interface

val make_logs_location :
  ?group_name:string_ ->
  ?stream_name:string_ ->
  ?deep_link:string_ ->
  ?s3_deep_link:string_ ->
  ?cloud_watch_logs_arn:string_ ->
  ?s3_logs_arn:string_ ->
  ?cloud_watch_logs:cloud_watch_logs_config ->
  ?s3_logs:s3_logs_config ->
  unit ->
  logs_location

val make_build_phase :
  ?phase_type:build_phase_type ->
  ?phase_status:status_type ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  ?duration_in_seconds:wrapper_long ->
  ?contexts:phase_contexts ->
  unit ->
  build_phase

val make_build :
  ?id:non_empty_string ->
  ?arn:non_empty_string ->
  ?build_number:wrapper_long ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  ?current_phase:string_ ->
  ?build_status:status_type ->
  ?source_version:non_empty_string ->
  ?resolved_source_version:non_empty_string ->
  ?project_name:non_empty_string ->
  ?phases:build_phases ->
  ?source:project_source ->
  ?secondary_sources:project_sources ->
  ?secondary_source_versions:project_secondary_source_versions ->
  ?artifacts:build_artifacts ->
  ?secondary_artifacts:build_artifacts_list ->
  ?cache:project_cache ->
  ?environment:project_environment ->
  ?service_role:non_empty_string ->
  ?logs:logs_location ->
  ?timeout_in_minutes:wrapper_int ->
  ?queued_timeout_in_minutes:wrapper_int ->
  ?build_complete:boolean_ ->
  ?initiator:string_ ->
  ?vpc_config:vpc_config ->
  ?network_interface:network_interface ->
  ?encryption_key:non_empty_string ->
  ?exported_environment_variables:exported_environment_variables ->
  ?report_arns:build_report_arns ->
  ?file_system_locations:project_file_system_locations ->
  ?debug_session:debug_session ->
  ?build_batch_arn:string_ ->
  ?auto_retry_config:auto_retry_config ->
  unit ->
  build

val make_batch_get_builds_output :
  ?builds:builds -> ?builds_not_found:build_ids -> unit -> batch_get_builds_output

val make_batch_get_builds_input : ids:build_ids -> unit -> batch_get_builds_input

val make_command_execution :
  ?id:non_empty_string ->
  ?sandbox_id:non_empty_string ->
  ?submit_time:timestamp ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  ?status:non_empty_string ->
  ?command:sensitive_non_empty_string ->
  ?type_:command_type ->
  ?exit_code:non_empty_string ->
  ?standard_output_content:sensitive_non_empty_string ->
  ?standard_err_content:sensitive_non_empty_string ->
  ?logs:logs_location ->
  ?sandbox_arn:non_empty_string ->
  unit ->
  command_execution

val make_batch_get_command_executions_output :
  ?command_executions:command_executions ->
  ?command_executions_not_found:command_execution_ids ->
  unit ->
  batch_get_command_executions_output

val make_batch_get_command_executions_input :
  sandbox_id:non_empty_string ->
  command_execution_ids:command_execution_ids ->
  unit ->
  batch_get_command_executions_input

val make_tag : ?key:key_input -> ?value:value_input -> unit -> tag

val make_fleet_proxy_rule :
  type_:fleet_proxy_rule_type ->
  effect_:fleet_proxy_rule_effect_type ->
  entities:fleet_proxy_rule_entities ->
  unit ->
  fleet_proxy_rule

val make_proxy_configuration :
  ?default_behavior:fleet_proxy_rule_behavior ->
  ?ordered_proxy_rules:fleet_proxy_rules ->
  unit ->
  proxy_configuration

val make_target_tracking_scaling_configuration :
  ?metric_type:fleet_scaling_metric_type ->
  ?target_value:wrapper_double ->
  unit ->
  target_tracking_scaling_configuration

val make_scaling_configuration_output :
  ?scaling_type:fleet_scaling_type ->
  ?target_tracking_scaling_configs:target_tracking_scaling_configurations ->
  ?max_capacity:fleet_capacity ->
  ?desired_capacity:fleet_capacity ->
  unit ->
  scaling_configuration_output

val make_fleet_status :
  ?status_code:fleet_status_code ->
  ?context:fleet_context_code ->
  ?message:string_ ->
  unit ->
  fleet_status

val make_fleet :
  ?arn:non_empty_string ->
  ?name:fleet_name ->
  ?id:non_empty_string ->
  ?created:timestamp ->
  ?last_modified:timestamp ->
  ?status:fleet_status ->
  ?base_capacity:fleet_capacity ->
  ?environment_type:environment_type ->
  ?compute_type:compute_type ->
  ?compute_configuration:compute_configuration ->
  ?scaling_configuration:scaling_configuration_output ->
  ?overflow_behavior:fleet_overflow_behavior ->
  ?vpc_config:vpc_config ->
  ?proxy_configuration:proxy_configuration ->
  ?image_id:non_empty_string ->
  ?fleet_service_role:non_empty_string ->
  ?tags:tag_list ->
  unit ->
  fleet

val make_batch_get_fleets_output :
  ?fleets:fleets -> ?fleets_not_found:fleet_names -> unit -> batch_get_fleets_output

val make_batch_get_fleets_input : names:fleet_names -> unit -> batch_get_fleets_input

val make_project_badge :
  ?badge_enabled:boolean_ -> ?badge_request_url:string_ -> unit -> project_badge

val make_pull_request_build_policy :
  ?approver_roles:pull_request_build_approver_roles ->
  requires_comment_approval:pull_request_build_comment_approval ->
  unit ->
  pull_request_build_policy

val make_scope_configuration :
  ?domain:string_ -> name:string_ -> scope:webhook_scope_type -> unit -> scope_configuration

val make_webhook_filter :
  ?exclude_matched_pattern:wrapper_boolean ->
  type_:webhook_filter_type ->
  pattern:string_ ->
  unit ->
  webhook_filter

val make_webhook :
  ?url:non_empty_string ->
  ?payload_url:non_empty_string ->
  ?secret:non_empty_string ->
  ?branch_filter:string_ ->
  ?filter_groups:filter_groups ->
  ?build_type:webhook_build_type ->
  ?manual_creation:wrapper_boolean ->
  ?last_modified_secret:timestamp ->
  ?scope_configuration:scope_configuration ->
  ?status:webhook_status ->
  ?status_message:string_ ->
  ?pull_request_build_policy:pull_request_build_policy ->
  unit ->
  webhook

val make_project_artifacts :
  ?location:string_ ->
  ?path:string_ ->
  ?namespace_type:artifact_namespace ->
  ?name:string_ ->
  ?packaging:artifact_packaging ->
  ?override_artifact_name:wrapper_boolean ->
  ?encryption_disabled:wrapper_boolean ->
  ?artifact_identifier:string_ ->
  ?bucket_owner_access:bucket_owner_access ->
  type_:artifacts_type ->
  unit ->
  project_artifacts

val make_project :
  ?name:project_name ->
  ?arn:string_ ->
  ?description:project_description ->
  ?source:project_source ->
  ?secondary_sources:project_sources ->
  ?source_version:string_ ->
  ?secondary_source_versions:project_secondary_source_versions ->
  ?artifacts:project_artifacts ->
  ?secondary_artifacts:project_artifacts_list ->
  ?cache:project_cache ->
  ?environment:project_environment ->
  ?service_role:non_empty_string ->
  ?timeout_in_minutes:build_time_out ->
  ?queued_timeout_in_minutes:time_out ->
  ?encryption_key:non_empty_string ->
  ?tags:tag_list ->
  ?created:timestamp ->
  ?last_modified:timestamp ->
  ?webhook:webhook ->
  ?vpc_config:vpc_config ->
  ?badge:project_badge ->
  ?logs_config:logs_config ->
  ?file_system_locations:project_file_system_locations ->
  ?build_batch_config:project_build_batch_config ->
  ?concurrent_build_limit:wrapper_int ->
  ?project_visibility:project_visibility_type ->
  ?public_project_alias:non_empty_string ->
  ?resource_access_role:non_empty_string ->
  ?auto_retry_limit:wrapper_int ->
  unit ->
  project

val make_batch_get_projects_output :
  ?projects:projects -> ?projects_not_found:project_names -> unit -> batch_get_projects_output

val make_batch_get_projects_input : names:project_names -> unit -> batch_get_projects_input

val make_s3_report_export_config :
  ?bucket:non_empty_string ->
  ?bucket_owner:string_ ->
  ?path:string_ ->
  ?packaging:report_packaging_type ->
  ?encryption_key:non_empty_string ->
  ?encryption_disabled:wrapper_boolean ->
  unit ->
  s3_report_export_config

val make_report_export_config :
  ?export_config_type:report_export_config_type ->
  ?s3_destination:s3_report_export_config ->
  unit ->
  report_export_config

val make_report_group :
  ?arn:non_empty_string ->
  ?name:report_group_name ->
  ?type_:report_type ->
  ?export_config:report_export_config ->
  ?created:timestamp ->
  ?last_modified:timestamp ->
  ?tags:tag_list ->
  ?status:report_group_status_type ->
  unit ->
  report_group

val make_batch_get_report_groups_output :
  ?report_groups:report_groups ->
  ?report_groups_not_found:report_group_arns ->
  unit ->
  batch_get_report_groups_output

val make_batch_get_report_groups_input :
  report_group_arns:report_group_arns -> unit -> batch_get_report_groups_input

val make_code_coverage_report_summary :
  ?line_coverage_percentage:percentage ->
  ?lines_covered:non_negative_int ->
  ?lines_missed:non_negative_int ->
  ?branch_coverage_percentage:percentage ->
  ?branches_covered:non_negative_int ->
  ?branches_missed:non_negative_int ->
  unit ->
  code_coverage_report_summary

val make_test_report_summary :
  total:wrapper_int ->
  status_counts:report_status_counts ->
  duration_in_nano_seconds:wrapper_long ->
  unit ->
  test_report_summary

val make_report :
  ?arn:non_empty_string ->
  ?type_:report_type ->
  ?name:string_ ->
  ?report_group_arn:non_empty_string ->
  ?execution_id:string_ ->
  ?status:report_status_type ->
  ?created:timestamp ->
  ?expired:timestamp ->
  ?export_config:report_export_config ->
  ?truncated:wrapper_boolean ->
  ?test_summary:test_report_summary ->
  ?code_coverage_summary:code_coverage_report_summary ->
  unit ->
  report

val make_batch_get_reports_output :
  ?reports:reports -> ?reports_not_found:report_arns -> unit -> batch_get_reports_output

val make_batch_get_reports_input : report_arns:report_arns -> unit -> batch_get_reports_input

val make_sandbox_session_phase :
  ?phase_type:string_ ->
  ?phase_status:status_type ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  ?duration_in_seconds:wrapper_long ->
  ?contexts:phase_contexts ->
  unit ->
  sandbox_session_phase

val make_sandbox_session :
  ?id:non_empty_string ->
  ?status:string_ ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  ?current_phase:string_ ->
  ?phases:sandbox_session_phases ->
  ?resolved_source_version:non_empty_string ->
  ?logs:logs_location ->
  ?network_interface:network_interface ->
  unit ->
  sandbox_session

val make_sandbox :
  ?id:non_empty_string ->
  ?arn:non_empty_string ->
  ?project_name:non_empty_string ->
  ?request_time:timestamp ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  ?status:string_ ->
  ?source:project_source ->
  ?source_version:non_empty_string ->
  ?secondary_sources:project_sources ->
  ?secondary_source_versions:project_secondary_source_versions ->
  ?environment:project_environment ->
  ?file_system_locations:project_file_system_locations ->
  ?timeout_in_minutes:wrapper_int ->
  ?queued_timeout_in_minutes:wrapper_int ->
  ?vpc_config:vpc_config ->
  ?log_config:logs_config ->
  ?encryption_key:non_empty_string ->
  ?service_role:non_empty_string ->
  ?current_session:sandbox_session ->
  unit ->
  sandbox

val make_batch_get_sandboxes_output :
  ?sandboxes:sandboxes -> ?sandboxes_not_found:sandbox_ids -> unit -> batch_get_sandboxes_output

val make_batch_get_sandboxes_input : ids:sandbox_ids -> unit -> batch_get_sandboxes_input
val make_build_batch_filter : ?status:status_type -> unit -> build_batch_filter
val make_update_webhook_output : ?webhook:webhook -> unit -> update_webhook_output

val make_update_webhook_input :
  ?branch_filter:string_ ->
  ?rotate_secret:boolean_ ->
  ?filter_groups:filter_groups ->
  ?build_type:webhook_build_type ->
  ?pull_request_build_policy:pull_request_build_policy ->
  project_name:project_name ->
  unit ->
  update_webhook_input

val make_update_report_group_output :
  ?report_group:report_group -> unit -> update_report_group_output

val make_update_report_group_input :
  ?export_config:report_export_config ->
  ?tags:tag_list ->
  arn:non_empty_string ->
  unit ->
  update_report_group_input

val make_update_project_visibility_output :
  ?project_arn:non_empty_string ->
  ?public_project_alias:non_empty_string ->
  ?project_visibility:project_visibility_type ->
  unit ->
  update_project_visibility_output

val make_update_project_visibility_input :
  ?resource_access_role:non_empty_string ->
  project_arn:non_empty_string ->
  project_visibility:project_visibility_type ->
  unit ->
  update_project_visibility_input

val make_update_project_output : ?project:project -> unit -> update_project_output

val make_update_project_input :
  ?description:project_description ->
  ?source:project_source ->
  ?secondary_sources:project_sources ->
  ?source_version:string_ ->
  ?secondary_source_versions:project_secondary_source_versions ->
  ?artifacts:project_artifacts ->
  ?secondary_artifacts:project_artifacts_list ->
  ?cache:project_cache ->
  ?environment:project_environment ->
  ?service_role:non_empty_string ->
  ?timeout_in_minutes:build_time_out ->
  ?queued_timeout_in_minutes:time_out ->
  ?encryption_key:non_empty_string ->
  ?tags:tag_list ->
  ?vpc_config:vpc_config ->
  ?badge_enabled:wrapper_boolean ->
  ?logs_config:logs_config ->
  ?file_system_locations:project_file_system_locations ->
  ?build_batch_config:project_build_batch_config ->
  ?concurrent_build_limit:wrapper_int ->
  ?auto_retry_limit:wrapper_int ->
  name:non_empty_string ->
  unit ->
  update_project_input

val make_update_fleet_output : ?fleet:fleet -> unit -> update_fleet_output

val make_scaling_configuration_input :
  ?scaling_type:fleet_scaling_type ->
  ?target_tracking_scaling_configs:target_tracking_scaling_configurations ->
  ?max_capacity:fleet_capacity ->
  unit ->
  scaling_configuration_input

val make_update_fleet_input :
  ?base_capacity:fleet_capacity ->
  ?environment_type:environment_type ->
  ?compute_type:compute_type ->
  ?compute_configuration:compute_configuration ->
  ?scaling_configuration:scaling_configuration_input ->
  ?overflow_behavior:fleet_overflow_behavior ->
  ?vpc_config:vpc_config ->
  ?proxy_configuration:proxy_configuration ->
  ?image_id:non_empty_string ->
  ?fleet_service_role:non_empty_string ->
  ?tags:tag_list ->
  arn:non_empty_string ->
  unit ->
  update_fleet_input

val make_stop_sandbox_output : ?sandbox:sandbox -> unit -> stop_sandbox_output
val make_stop_sandbox_input : id:non_empty_string -> unit -> stop_sandbox_input
val make_stop_build_batch_output : ?build_batch:build_batch -> unit -> stop_build_batch_output
val make_stop_build_batch_input : id:non_empty_string -> unit -> stop_build_batch_input
val make_stop_build_output : ?build:build -> unit -> stop_build_output
val make_stop_build_input : id:non_empty_string -> unit -> stop_build_input

val make_ssm_session :
  ?session_id:string_ -> ?token_value:string_ -> ?stream_url:string_ -> unit -> ssm_session

val make_start_sandbox_connection_output :
  ?ssm_session:ssm_session -> unit -> start_sandbox_connection_output

val make_start_sandbox_connection_input :
  sandbox_id:non_empty_string -> unit -> start_sandbox_connection_input

val make_start_sandbox_output : ?sandbox:sandbox -> unit -> start_sandbox_output

val make_start_sandbox_input :
  ?project_name:non_empty_string ->
  ?idempotency_token:sensitive_string ->
  unit ->
  start_sandbox_input

val make_start_command_execution_output :
  ?command_execution:command_execution -> unit -> start_command_execution_output

val make_start_command_execution_input :
  ?type_:command_type ->
  sandbox_id:non_empty_string ->
  command:sensitive_non_empty_string ->
  unit ->
  start_command_execution_input

val make_start_build_batch_output : ?build_batch:build_batch -> unit -> start_build_batch_output

val make_start_build_batch_input :
  ?secondary_sources_override:project_sources ->
  ?secondary_sources_version_override:project_secondary_source_versions ->
  ?source_version:string_ ->
  ?artifacts_override:project_artifacts ->
  ?secondary_artifacts_override:project_artifacts_list ->
  ?environment_variables_override:environment_variables ->
  ?source_type_override:source_type ->
  ?source_location_override:string_ ->
  ?source_auth_override:source_auth ->
  ?git_clone_depth_override:git_clone_depth ->
  ?git_submodules_config_override:git_submodules_config ->
  ?buildspec_override:string_ ->
  ?insecure_ssl_override:wrapper_boolean ->
  ?report_build_batch_status_override:wrapper_boolean ->
  ?environment_type_override:environment_type ->
  ?image_override:non_empty_string ->
  ?compute_type_override:compute_type ->
  ?certificate_override:string_ ->
  ?cache_override:project_cache ->
  ?service_role_override:non_empty_string ->
  ?privileged_mode_override:wrapper_boolean ->
  ?build_timeout_in_minutes_override:build_time_out ->
  ?queued_timeout_in_minutes_override:time_out ->
  ?encryption_key_override:non_empty_string ->
  ?idempotency_token:string_ ->
  ?logs_config_override:logs_config ->
  ?registry_credential_override:registry_credential ->
  ?image_pull_credentials_type_override:image_pull_credentials_type ->
  ?build_batch_config_override:project_build_batch_config ->
  ?debug_session_enabled:wrapper_boolean ->
  project_name:non_empty_string ->
  unit ->
  start_build_batch_input

val make_start_build_output : ?build:build -> unit -> start_build_output

val make_start_build_input :
  ?secondary_sources_override:project_sources ->
  ?secondary_sources_version_override:project_secondary_source_versions ->
  ?source_version:string_ ->
  ?artifacts_override:project_artifacts ->
  ?secondary_artifacts_override:project_artifacts_list ->
  ?environment_variables_override:environment_variables ->
  ?source_type_override:source_type ->
  ?source_location_override:string_ ->
  ?source_auth_override:source_auth ->
  ?git_clone_depth_override:git_clone_depth ->
  ?git_submodules_config_override:git_submodules_config ->
  ?buildspec_override:string_ ->
  ?insecure_ssl_override:wrapper_boolean ->
  ?report_build_status_override:wrapper_boolean ->
  ?build_status_config_override:build_status_config ->
  ?environment_type_override:environment_type ->
  ?image_override:non_empty_string ->
  ?compute_type_override:compute_type ->
  ?certificate_override:string_ ->
  ?cache_override:project_cache ->
  ?service_role_override:non_empty_string ->
  ?privileged_mode_override:wrapper_boolean ->
  ?timeout_in_minutes_override:build_time_out ->
  ?queued_timeout_in_minutes_override:time_out ->
  ?encryption_key_override:non_empty_string ->
  ?idempotency_token:string_ ->
  ?logs_config_override:logs_config ->
  ?registry_credential_override:registry_credential ->
  ?image_pull_credentials_type_override:image_pull_credentials_type ->
  ?debug_session_enabled:wrapper_boolean ->
  ?fleet_override:project_fleet ->
  ?auto_retry_limit_override:wrapper_int ->
  ?host_kernel_override:host_kernel ->
  project_name:non_empty_string ->
  unit ->
  start_build_input

val make_retry_build_batch_output : ?build_batch:build_batch -> unit -> retry_build_batch_output

val make_retry_build_batch_input :
  ?id:non_empty_string ->
  ?idempotency_token:string_ ->
  ?retry_type:retry_build_batch_type ->
  unit ->
  retry_build_batch_input

val make_retry_build_output : ?build:build -> unit -> retry_build_output

val make_retry_build_input :
  ?id:non_empty_string -> ?idempotency_token:string_ -> unit -> retry_build_input

val make_put_resource_policy_output :
  ?resource_arn:non_empty_string -> unit -> put_resource_policy_output

val make_put_resource_policy_input :
  policy:non_empty_string -> resource_arn:non_empty_string -> unit -> put_resource_policy_input

val make_source_credentials_info :
  ?arn:non_empty_string ->
  ?server_type:server_type ->
  ?auth_type:auth_type ->
  ?resource:string_ ->
  unit ->
  source_credentials_info

val make_list_source_credentials_output :
  ?source_credentials_infos:source_credentials_infos -> unit -> list_source_credentials_output

val make_list_source_credentials_input : unit -> unit

val make_list_shared_report_groups_output :
  ?next_token:string_ ->
  ?report_groups:report_group_arns ->
  unit ->
  list_shared_report_groups_output

val make_list_shared_report_groups_input :
  ?sort_order:sort_order_type ->
  ?sort_by:shared_resource_sort_by_type ->
  ?next_token:string_ ->
  ?max_results:page_size ->
  unit ->
  list_shared_report_groups_input

val make_list_shared_projects_output :
  ?next_token:string_ -> ?projects:project_arns -> unit -> list_shared_projects_output

val make_list_shared_projects_input :
  ?sort_by:shared_resource_sort_by_type ->
  ?sort_order:sort_order_type ->
  ?max_results:page_size ->
  ?next_token:non_empty_string ->
  unit ->
  list_shared_projects_input

val make_list_sandboxes_for_project_output :
  ?ids:sandbox_ids -> ?next_token:string_ -> unit -> list_sandboxes_for_project_output

val make_list_sandboxes_for_project_input :
  ?max_results:page_size ->
  ?sort_order:sort_order_type ->
  ?next_token:sensitive_string ->
  project_name:non_empty_string ->
  unit ->
  list_sandboxes_for_project_input

val make_list_sandboxes_output :
  ?ids:sandbox_ids -> ?next_token:string_ -> unit -> list_sandboxes_output

val make_list_sandboxes_input :
  ?max_results:page_size ->
  ?sort_order:sort_order_type ->
  ?next_token:string_ ->
  unit ->
  list_sandboxes_input

val make_list_reports_for_report_group_output :
  ?next_token:string_ -> ?reports:report_arns -> unit -> list_reports_for_report_group_output

val make_report_filter : ?status:report_status_type -> unit -> report_filter

val make_list_reports_for_report_group_input :
  ?next_token:string_ ->
  ?sort_order:sort_order_type ->
  ?max_results:page_size ->
  ?filter:report_filter ->
  report_group_arn:string_ ->
  unit ->
  list_reports_for_report_group_input

val make_list_reports_output :
  ?next_token:string_ -> ?reports:report_arns -> unit -> list_reports_output

val make_list_reports_input :
  ?sort_order:sort_order_type ->
  ?next_token:string_ ->
  ?max_results:page_size ->
  ?filter:report_filter ->
  unit ->
  list_reports_input

val make_list_report_groups_output :
  ?next_token:string_ -> ?report_groups:report_group_arns -> unit -> list_report_groups_output

val make_list_report_groups_input :
  ?sort_order:sort_order_type ->
  ?sort_by:report_group_sort_by_type ->
  ?next_token:string_ ->
  ?max_results:page_size ->
  unit ->
  list_report_groups_input

val make_list_projects_output :
  ?next_token:string_ -> ?projects:project_names -> unit -> list_projects_output

val make_list_projects_input :
  ?sort_by:project_sort_by_type ->
  ?sort_order:sort_order_type ->
  ?next_token:non_empty_string ->
  unit ->
  list_projects_input

val make_list_fleets_output :
  ?next_token:string_ -> ?fleets:fleet_arns -> unit -> list_fleets_output

val make_list_fleets_input :
  ?next_token:sensitive_string ->
  ?max_results:page_size ->
  ?sort_order:sort_order_type ->
  ?sort_by:fleet_sort_by_type ->
  unit ->
  list_fleets_input

val make_environment_image :
  ?name:string_ -> ?description:string_ -> ?versions:image_versions -> unit -> environment_image

val make_environment_language :
  ?language:language_type -> ?images:environment_images -> unit -> environment_language

val make_environment_platform :
  ?platform:platform_type -> ?languages:environment_languages -> unit -> environment_platform

val make_list_curated_environment_images_output :
  ?platforms:environment_platforms -> unit -> list_curated_environment_images_output

val make_list_curated_environment_images_input : unit -> unit

val make_list_command_executions_for_sandbox_output :
  ?command_executions:command_executions ->
  ?next_token:string_ ->
  unit ->
  list_command_executions_for_sandbox_output

val make_list_command_executions_for_sandbox_input :
  ?max_results:page_size ->
  ?sort_order:sort_order_type ->
  ?next_token:sensitive_string ->
  sandbox_id:non_empty_string ->
  unit ->
  list_command_executions_for_sandbox_input

val make_list_builds_for_project_output :
  ?ids:build_ids -> ?next_token:string_ -> unit -> list_builds_for_project_output

val make_list_builds_for_project_input :
  ?sort_order:sort_order_type ->
  ?next_token:string_ ->
  project_name:non_empty_string ->
  unit ->
  list_builds_for_project_input

val make_list_builds_output : ?ids:build_ids -> ?next_token:string_ -> unit -> list_builds_output

val make_list_builds_input :
  ?sort_order:sort_order_type -> ?next_token:string_ -> unit -> list_builds_input

val make_list_build_batches_for_project_output :
  ?ids:build_batch_ids -> ?next_token:string_ -> unit -> list_build_batches_for_project_output

val make_list_build_batches_for_project_input :
  ?project_name:non_empty_string ->
  ?filter:build_batch_filter ->
  ?max_results:page_size ->
  ?sort_order:sort_order_type ->
  ?next_token:string_ ->
  unit ->
  list_build_batches_for_project_input

val make_list_build_batches_output :
  ?ids:build_batch_ids -> ?next_token:string_ -> unit -> list_build_batches_output

val make_list_build_batches_input :
  ?filter:build_batch_filter ->
  ?max_results:page_size ->
  ?sort_order:sort_order_type ->
  ?next_token:string_ ->
  unit ->
  list_build_batches_input

val make_invalidate_project_cache_output : unit -> unit

val make_invalidate_project_cache_input :
  project_name:non_empty_string -> unit -> invalidate_project_cache_input

val make_import_source_credentials_output :
  ?arn:non_empty_string -> unit -> import_source_credentials_output

val make_import_source_credentials_input :
  ?username:non_empty_string ->
  ?should_overwrite:wrapper_boolean ->
  token:sensitive_non_empty_string ->
  server_type:server_type ->
  auth_type:auth_type ->
  unit ->
  import_source_credentials_input

val make_get_resource_policy_output : ?policy:non_empty_string -> unit -> get_resource_policy_output

val make_get_resource_policy_input :
  resource_arn:non_empty_string -> unit -> get_resource_policy_input

val make_report_with_raw_data :
  ?report_arn:non_empty_string -> ?data:string_ -> unit -> report_with_raw_data

val make_report_group_trend_stats :
  ?average:string_ -> ?max:string_ -> ?min:string_ -> unit -> report_group_trend_stats

val make_get_report_group_trend_output :
  ?stats:report_group_trend_stats ->
  ?raw_data:report_group_trend_raw_data_list ->
  unit ->
  get_report_group_trend_output

val make_get_report_group_trend_input :
  ?num_of_reports:page_size ->
  report_group_arn:non_empty_string ->
  trend_field:report_group_trend_field_type ->
  unit ->
  get_report_group_trend_input

val make_test_case :
  ?report_arn:non_empty_string ->
  ?test_raw_data_path:string_ ->
  ?prefix:string_ ->
  ?name:string_ ->
  ?status:string_ ->
  ?duration_in_nano_seconds:wrapper_long ->
  ?message:string_ ->
  ?expired:timestamp ->
  ?test_suite_name:string_ ->
  unit ->
  test_case

val make_describe_test_cases_output :
  ?next_token:string_ -> ?test_cases:test_cases -> unit -> describe_test_cases_output

val make_test_case_filter : ?status:string_ -> ?keyword:string_ -> unit -> test_case_filter

val make_describe_test_cases_input :
  ?next_token:string_ ->
  ?max_results:page_size ->
  ?filter:test_case_filter ->
  report_arn:string_ ->
  unit ->
  describe_test_cases_input

val make_code_coverage :
  ?id:non_empty_string ->
  ?report_ar_n:non_empty_string ->
  ?file_path:non_empty_string ->
  ?line_coverage_percentage:percentage ->
  ?lines_covered:non_negative_int ->
  ?lines_missed:non_negative_int ->
  ?branch_coverage_percentage:percentage ->
  ?branches_covered:non_negative_int ->
  ?branches_missed:non_negative_int ->
  ?expired:timestamp ->
  unit ->
  code_coverage

val make_describe_code_coverages_output :
  ?next_token:string_ -> ?code_coverages:code_coverages -> unit -> describe_code_coverages_output

val make_describe_code_coverages_input :
  ?next_token:string_ ->
  ?max_results:page_size ->
  ?sort_order:sort_order_type ->
  ?sort_by:report_code_coverage_sort_by_type ->
  ?min_line_coverage_percentage:percentage ->
  ?max_line_coverage_percentage:percentage ->
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

val make_delete_report_group_output : unit -> unit

val make_delete_report_group_input :
  ?delete_reports:boolean_ -> arn:non_empty_string -> unit -> delete_report_group_input

val make_delete_report_output : unit -> unit
val make_delete_report_input : arn:non_empty_string -> unit -> delete_report_input
val make_delete_project_output : unit -> unit
val make_delete_project_input : name:non_empty_string -> unit -> delete_project_input
val make_delete_fleet_output : unit -> unit
val make_delete_fleet_input : arn:non_empty_string -> unit -> delete_fleet_input

val make_delete_build_batch_output :
  ?status_code:string_ ->
  ?builds_deleted:build_ids ->
  ?builds_not_deleted:builds_not_deleted ->
  unit ->
  delete_build_batch_output

val make_delete_build_batch_input : id:non_empty_string -> unit -> delete_build_batch_input
val make_create_webhook_output : ?webhook:webhook -> unit -> create_webhook_output

val make_create_webhook_input :
  ?branch_filter:string_ ->
  ?filter_groups:filter_groups ->
  ?build_type:webhook_build_type ->
  ?manual_creation:wrapper_boolean ->
  ?scope_configuration:scope_configuration ->
  ?pull_request_build_policy:pull_request_build_policy ->
  project_name:project_name ->
  unit ->
  create_webhook_input

val make_create_report_group_output :
  ?report_group:report_group -> unit -> create_report_group_output

val make_create_report_group_input :
  ?tags:tag_list ->
  name:report_group_name ->
  type_:report_type ->
  export_config:report_export_config ->
  unit ->
  create_report_group_input

val make_create_project_output : ?project:project -> unit -> create_project_output

val make_create_project_input :
  ?description:project_description ->
  ?secondary_sources:project_sources ->
  ?source_version:string_ ->
  ?secondary_source_versions:project_secondary_source_versions ->
  ?secondary_artifacts:project_artifacts_list ->
  ?cache:project_cache ->
  ?timeout_in_minutes:build_time_out ->
  ?queued_timeout_in_minutes:time_out ->
  ?encryption_key:non_empty_string ->
  ?tags:tag_list ->
  ?vpc_config:vpc_config ->
  ?badge_enabled:wrapper_boolean ->
  ?logs_config:logs_config ->
  ?file_system_locations:project_file_system_locations ->
  ?build_batch_config:project_build_batch_config ->
  ?concurrent_build_limit:wrapper_int ->
  ?auto_retry_limit:wrapper_int ->
  name:project_name ->
  source:project_source ->
  artifacts:project_artifacts ->
  environment:project_environment ->
  service_role:non_empty_string ->
  unit ->
  create_project_input

val make_create_fleet_output : ?fleet:fleet -> unit -> create_fleet_output

val make_create_fleet_input :
  ?compute_configuration:compute_configuration ->
  ?scaling_configuration:scaling_configuration_input ->
  ?overflow_behavior:fleet_overflow_behavior ->
  ?vpc_config:vpc_config ->
  ?proxy_configuration:proxy_configuration ->
  ?image_id:non_empty_string ->
  ?fleet_service_role:non_empty_string ->
  ?tags:tag_list ->
  name:fleet_name ->
  base_capacity:fleet_capacity ->
  environment_type:environment_type ->
  compute_type:compute_type ->
  unit ->
  create_fleet_input
