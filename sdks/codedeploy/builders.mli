open Types

val make_minimum_healthy_hosts_per_zone :
  ?value:minimum_healthy_hosts_per_zone_value ->
  ?type_:minimum_healthy_hosts_per_zone_type ->
  unit ->
  minimum_healthy_hosts_per_zone

val make_zonal_config :
  ?minimum_healthy_hosts_per_zone:minimum_healthy_hosts_per_zone ->
  ?monitor_duration_in_seconds:wait_time_in_seconds ->
  ?first_zone_monitor_duration_in_seconds:wait_time_in_seconds ->
  unit ->
  zonal_config

val make_auto_scaling_group :
  ?termination_hook:auto_scaling_group_hook ->
  ?hook:auto_scaling_group_hook ->
  ?name:auto_scaling_group_name ->
  unit ->
  auto_scaling_group

val make_update_deployment_group_output :
  ?hooks_not_cleaned_up:auto_scaling_group_list -> unit -> update_deployment_group_output

val make_ec2_tag_filter :
  ?type_:ec2_tag_filter_type -> ?value:value -> ?key:key -> unit -> ec2_tag_filter

val make_tag_filter : ?type_:tag_filter_type -> ?value:value -> ?key:key -> unit -> tag_filter

val make_trigger_config :
  ?trigger_events:trigger_event_type_list ->
  ?trigger_target_arn:trigger_target_arn ->
  ?trigger_name:trigger_name ->
  unit ->
  trigger_config

val make_alarm : ?name:alarm_name -> unit -> alarm

val make_alarm_configuration :
  ?alarms:alarm_list ->
  ?ignore_poll_alarm_failure:boolean_ ->
  ?enabled:boolean_ ->
  unit ->
  alarm_configuration

val make_auto_rollback_configuration :
  ?events:auto_rollback_events_list -> ?enabled:boolean_ -> unit -> auto_rollback_configuration

val make_deployment_style :
  ?deployment_option:deployment_option ->
  ?deployment_type:deployment_type ->
  unit ->
  deployment_style

val make_blue_instance_termination_option :
  ?termination_wait_time_in_minutes:duration ->
  ?action:instance_action ->
  unit ->
  blue_instance_termination_option

val make_deployment_ready_option :
  ?wait_time_in_minutes:duration ->
  ?action_on_timeout:deployment_ready_action ->
  unit ->
  deployment_ready_option

val make_green_fleet_provisioning_option :
  ?action:green_fleet_provisioning_action -> unit -> green_fleet_provisioning_option

val make_blue_green_deployment_configuration :
  ?green_fleet_provisioning_option:green_fleet_provisioning_option ->
  ?deployment_ready_option:deployment_ready_option ->
  ?terminate_blue_instances_on_deployment_success:blue_instance_termination_option ->
  unit ->
  blue_green_deployment_configuration

val make_elb_info : ?name:elb_name -> unit -> elb_info
val make_target_group_info : ?name:target_group_name -> unit -> target_group_info
val make_traffic_route : ?listener_arns:listener_arn_list -> unit -> traffic_route

val make_target_group_pair_info :
  ?test_traffic_route:traffic_route ->
  ?prod_traffic_route:traffic_route ->
  ?target_groups:target_group_info_list ->
  unit ->
  target_group_pair_info

val make_load_balancer_info :
  ?target_group_pair_info_list:target_group_pair_info_list ->
  ?target_group_info_list:target_group_info_list ->
  ?elb_info_list:elb_info_list ->
  unit ->
  load_balancer_info

val make_ec2_tag_set : ?ec2_tag_set_list:ec2_tag_set_list -> unit -> ec2_tag_set

val make_ecs_service :
  ?cluster_name:ecs_cluster_name -> ?service_name:ecs_service_name -> unit -> ecs_service

val make_on_premises_tag_set :
  ?on_premises_tag_set_list:on_premises_tag_set_list -> unit -> on_premises_tag_set

val make_update_deployment_group_input :
  ?termination_hook_enabled:nullable_boolean ->
  ?on_premises_tag_set:on_premises_tag_set ->
  ?ecs_services:ecs_service_list ->
  ?ec2_tag_set:ec2_tag_set ->
  ?load_balancer_info:load_balancer_info ->
  ?blue_green_deployment_configuration:blue_green_deployment_configuration ->
  ?deployment_style:deployment_style ->
  ?outdated_instances_strategy:outdated_instances_strategy ->
  ?auto_rollback_configuration:auto_rollback_configuration ->
  ?alarm_configuration:alarm_configuration ->
  ?trigger_configurations:trigger_config_list ->
  ?service_role_arn:role ->
  ?auto_scaling_groups:auto_scaling_group_name_list ->
  ?on_premises_instance_tag_filters:tag_filter_list ->
  ?ec2_tag_filters:ec2_tag_filter_list ->
  ?deployment_config_name:deployment_config_name ->
  ?new_deployment_group_name:deployment_group_name ->
  current_deployment_group_name:deployment_group_name ->
  application_name:application_name ->
  unit ->
  update_deployment_group_input

val make_update_application_input :
  ?new_application_name:application_name ->
  ?application_name:application_name ->
  unit ->
  update_application_input

val make_untag_resource_output : unit -> unit

val make_untag_resource_input :
  tag_keys:tag_key_list -> resource_arn:arn -> unit -> untag_resource_input

val make_time_based_canary :
  ?canary_interval:wait_time_in_mins -> ?canary_percentage:percentage -> unit -> time_based_canary

val make_time_based_linear :
  ?linear_interval:wait_time_in_mins -> ?linear_percentage:percentage -> unit -> time_based_linear

val make_traffic_routing_config :
  ?time_based_linear:time_based_linear ->
  ?time_based_canary:time_based_canary ->
  ?type_:traffic_routing_type ->
  unit ->
  traffic_routing_config

val make_time_range : ?end_:timestamp -> ?start:timestamp -> unit -> time_range

val make_target_instances :
  ?ec2_tag_set:ec2_tag_set ->
  ?auto_scaling_groups:auto_scaling_group_name_list ->
  ?tag_filters:ec2_tag_filter_list ->
  unit ->
  target_instances

val make_tag_resource_output : unit -> unit
val make_tag : ?value:value -> ?key:key -> unit -> tag
val make_tag_resource_input : tags:tag_list -> resource_arn:arn -> unit -> tag_resource_input

val make_stop_deployment_output :
  ?status_message:message -> ?status:stop_status -> unit -> stop_deployment_output

val make_stop_deployment_input :
  ?auto_rollback_enabled:nullable_boolean ->
  deployment_id:deployment_id ->
  unit ->
  stop_deployment_input

val make_skip_wait_time_for_instance_termination_input :
  ?deployment_id:deployment_id -> unit -> skip_wait_time_for_instance_termination_input

val make_s3_location :
  ?e_tag:e_tag ->
  ?version:version_id ->
  ?bundle_type:bundle_type ->
  ?key:s3_key ->
  ?bucket:s3_bucket ->
  unit ->
  s3_location

val make_rollback_info :
  ?rollback_message:description ->
  ?rollback_triggering_deployment_id:deployment_id ->
  ?rollback_deployment_id:deployment_id ->
  unit ->
  rollback_info

val make_git_hub_location :
  ?commit_id:commit_id -> ?repository:repository -> unit -> git_hub_location

val make_raw_string : ?sha256:raw_string_sha256 -> ?content:raw_string_content -> unit -> raw_string

val make_app_spec_content :
  ?sha256:raw_string_sha256 -> ?content:raw_string_content -> unit -> app_spec_content

val make_revision_location :
  ?app_spec_content:app_spec_content ->
  ?string_:raw_string ->
  ?git_hub_location:git_hub_location ->
  ?s3_location:s3_location ->
  ?revision_type:revision_location_type ->
  unit ->
  revision_location

val make_generic_revision_info :
  ?register_time:timestamp ->
  ?last_used_time:timestamp ->
  ?first_used_time:timestamp ->
  ?deployment_groups:deployment_groups_list ->
  ?description:description ->
  unit ->
  generic_revision_info

val make_revision_info :
  ?generic_revision_info:generic_revision_info ->
  ?revision_location:revision_location ->
  unit ->
  revision_info

val make_remove_tags_from_on_premises_instances_input :
  instance_names:instance_name_list ->
  tags:tag_list ->
  unit ->
  remove_tags_from_on_premises_instances_input

val make_related_deployments :
  ?auto_update_outdated_instances_deployment_ids:deployments_list ->
  ?auto_update_outdated_instances_root_deployment_id:deployment_id ->
  unit ->
  related_deployments

val make_register_on_premises_instance_input :
  ?iam_user_arn:iam_user_arn ->
  ?iam_session_arn:iam_session_arn ->
  instance_name:instance_name ->
  unit ->
  register_on_premises_instance_input

val make_register_application_revision_input :
  ?description:description ->
  revision:revision_location ->
  application_name:application_name ->
  unit ->
  register_application_revision_input

val make_put_lifecycle_event_hook_execution_status_output :
  ?lifecycle_event_hook_execution_id:lifecycle_event_hook_execution_id ->
  unit ->
  put_lifecycle_event_hook_execution_status_output

val make_put_lifecycle_event_hook_execution_status_input :
  ?status:lifecycle_event_status ->
  ?lifecycle_event_hook_execution_id:lifecycle_event_hook_execution_id ->
  ?deployment_id:deployment_id ->
  unit ->
  put_lifecycle_event_hook_execution_status_input

val make_minimum_healthy_hosts :
  ?value:minimum_healthy_hosts_value ->
  ?type_:minimum_healthy_hosts_type ->
  unit ->
  minimum_healthy_hosts

val make_list_tags_for_resource_output :
  ?next_token:next_token -> ?tags:tag_list -> unit -> list_tags_for_resource_output

val make_list_tags_for_resource_input :
  ?next_token:next_token -> resource_arn:arn -> unit -> list_tags_for_resource_input

val make_list_on_premises_instances_output :
  ?next_token:next_token ->
  ?instance_names:instance_name_list ->
  unit ->
  list_on_premises_instances_output

val make_list_on_premises_instances_input :
  ?next_token:next_token ->
  ?tag_filters:tag_filter_list ->
  ?registration_status:registration_status ->
  unit ->
  list_on_premises_instances_input

val make_list_git_hub_account_token_names_output :
  ?next_token:next_token ->
  ?token_name_list:git_hub_account_token_name_list ->
  unit ->
  list_git_hub_account_token_names_output

val make_list_git_hub_account_token_names_input :
  ?next_token:next_token -> unit -> list_git_hub_account_token_names_input

val make_list_deployments_output :
  ?next_token:next_token -> ?deployments:deployments_list -> unit -> list_deployments_output

val make_list_deployments_input :
  ?next_token:next_token ->
  ?create_time_range:time_range ->
  ?include_only_statuses:deployment_status_list ->
  ?external_id:external_id ->
  ?deployment_group_name:deployment_group_name ->
  ?application_name:application_name ->
  unit ->
  list_deployments_input

val make_list_deployment_targets_output :
  ?next_token:next_token -> ?target_ids:target_id_list -> unit -> list_deployment_targets_output

val make_list_deployment_targets_input :
  ?target_filters:target_filters ->
  ?next_token:next_token ->
  deployment_id:deployment_id ->
  unit ->
  list_deployment_targets_input

val make_list_deployment_instances_output :
  ?next_token:next_token ->
  ?instances_list:instances_list ->
  unit ->
  list_deployment_instances_output

val make_list_deployment_instances_input :
  ?instance_type_filter:instance_type_list ->
  ?instance_status_filter:instance_status_list ->
  ?next_token:next_token ->
  deployment_id:deployment_id ->
  unit ->
  list_deployment_instances_input

val make_list_deployment_groups_output :
  ?next_token:next_token ->
  ?deployment_groups:deployment_groups_list ->
  ?application_name:application_name ->
  unit ->
  list_deployment_groups_output

val make_list_deployment_groups_input :
  ?next_token:next_token ->
  application_name:application_name ->
  unit ->
  list_deployment_groups_input

val make_list_deployment_configs_output :
  ?next_token:next_token ->
  ?deployment_configs_list:deployment_configs_list ->
  unit ->
  list_deployment_configs_output

val make_list_deployment_configs_input :
  ?next_token:next_token -> unit -> list_deployment_configs_input

val make_list_applications_output :
  ?next_token:next_token -> ?applications:applications_list -> unit -> list_applications_output

val make_list_applications_input : ?next_token:next_token -> unit -> list_applications_input

val make_list_application_revisions_output :
  ?next_token:next_token ->
  ?revisions:revision_location_list ->
  unit ->
  list_application_revisions_output

val make_list_application_revisions_input :
  ?next_token:next_token ->
  ?deployed:list_state_filter_action ->
  ?s3_key_prefix:s3_key ->
  ?s3_bucket:s3_bucket ->
  ?sort_order:sort_order ->
  ?sort_by:application_revision_sort_by ->
  application_name:application_name ->
  unit ->
  list_application_revisions_input

val make_diagnostics :
  ?log_tail:log_tail ->
  ?message:lifecycle_message ->
  ?script_name:script_name ->
  ?error_code:lifecycle_error_code ->
  unit ->
  diagnostics

val make_lifecycle_event :
  ?status:lifecycle_event_status ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?diagnostics:diagnostics ->
  ?lifecycle_event_name:lifecycle_event_name ->
  unit ->
  lifecycle_event

val make_last_deployment_info :
  ?create_time:timestamp ->
  ?end_time:timestamp ->
  ?status:deployment_status ->
  ?deployment_id:deployment_id ->
  unit ->
  last_deployment_info

val make_lambda_function_info :
  ?target_version_weight:traffic_weight ->
  ?target_version:version ->
  ?current_version:version ->
  ?function_alias:lambda_function_alias ->
  ?function_name:lambda_function_name ->
  unit ->
  lambda_function_info

val make_lambda_target :
  ?lambda_function_info:lambda_function_info ->
  ?lifecycle_events:lifecycle_event_list ->
  ?last_updated_at:time ->
  ?status:target_status ->
  ?target_arn:target_arn ->
  ?target_id:target_id ->
  ?deployment_id:deployment_id ->
  unit ->
  lambda_target

val make_instance_target :
  ?instance_label:target_label ->
  ?lifecycle_events:lifecycle_event_list ->
  ?last_updated_at:time ->
  ?status:target_status ->
  ?target_arn:target_arn ->
  ?target_id:target_id ->
  ?deployment_id:deployment_id ->
  unit ->
  instance_target

val make_instance_summary :
  ?instance_type:instance_type ->
  ?lifecycle_events:lifecycle_event_list ->
  ?last_updated_at:timestamp ->
  ?status:instance_status ->
  ?instance_id:instance_id ->
  ?deployment_id:deployment_id ->
  unit ->
  instance_summary

val make_instance_info :
  ?tags:tag_list ->
  ?deregister_time:timestamp ->
  ?register_time:timestamp ->
  ?instance_arn:instance_arn ->
  ?iam_user_arn:iam_user_arn ->
  ?iam_session_arn:iam_session_arn ->
  ?instance_name:instance_name ->
  unit ->
  instance_info

val make_get_on_premises_instance_output :
  ?instance_info:instance_info -> unit -> get_on_premises_instance_output

val make_get_on_premises_instance_input :
  instance_name:instance_name -> unit -> get_on_premises_instance_input

val make_ecs_task_set :
  ?task_set_label:target_label ->
  ?target_group:target_group_info ->
  ?traffic_weight:traffic_weight ->
  ?status:ecs_task_set_status ->
  ?running_count:ecs_task_set_count ->
  ?pending_count:ecs_task_set_count ->
  ?desired_count:ecs_task_set_count ->
  ?identifer:ecs_task_set_identifier ->
  unit ->
  ecs_task_set

val make_ecs_target :
  ?task_sets_info:ecs_task_set_list ->
  ?status:target_status ->
  ?lifecycle_events:lifecycle_event_list ->
  ?last_updated_at:time ->
  ?target_arn:target_arn ->
  ?target_id:target_id ->
  ?deployment_id:deployment_id ->
  unit ->
  ecs_target

val make_cloud_formation_target :
  ?target_version_weight:traffic_weight ->
  ?resource_type:cloud_formation_resource_type ->
  ?status:target_status ->
  ?lifecycle_events:lifecycle_event_list ->
  ?last_updated_at:time ->
  ?target_id:target_id ->
  ?deployment_id:deployment_id ->
  unit ->
  cloud_formation_target

val make_deployment_target :
  ?cloud_formation_target:cloud_formation_target ->
  ?ecs_target:ecs_target ->
  ?lambda_target:lambda_target ->
  ?instance_target:instance_target ->
  ?deployment_target_type:deployment_target_type ->
  unit ->
  deployment_target

val make_get_deployment_target_output :
  ?deployment_target:deployment_target -> unit -> get_deployment_target_output

val make_get_deployment_target_input :
  target_id:target_id -> deployment_id:deployment_id -> unit -> get_deployment_target_input

val make_error_information : ?message:error_message -> ?code:error_code -> unit -> error_information

val make_deployment_overview :
  ?ready:instance_count ->
  ?skipped:instance_count ->
  ?failed:instance_count ->
  ?succeeded:instance_count ->
  ?in_progress:instance_count ->
  ?pending:instance_count ->
  unit ->
  deployment_overview

val make_deployment_info :
  ?override_alarm_configuration:alarm_configuration ->
  ?related_deployments:related_deployments ->
  ?external_id:external_id ->
  ?compute_platform:compute_platform ->
  ?deployment_status_messages:deployment_status_message_list ->
  ?file_exists_behavior:file_exists_behavior ->
  ?additional_deployment_status_info:additional_deployment_status_info ->
  ?load_balancer_info:load_balancer_info ->
  ?blue_green_deployment_configuration:blue_green_deployment_configuration ->
  ?instance_termination_wait_time_started:boolean_ ->
  ?target_instances:target_instances ->
  ?deployment_style:deployment_style ->
  ?rollback_info:rollback_info ->
  ?update_outdated_instances_only:boolean_ ->
  ?auto_rollback_configuration:auto_rollback_configuration ->
  ?ignore_application_stop_failures:boolean_ ->
  ?creator:deployment_creator ->
  ?description:description ->
  ?deployment_overview:deployment_overview ->
  ?complete_time:timestamp ->
  ?start_time:timestamp ->
  ?create_time:timestamp ->
  ?error_information:error_information ->
  ?status:deployment_status ->
  ?revision:revision_location ->
  ?previous_revision:revision_location ->
  ?deployment_id:deployment_id ->
  ?deployment_config_name:deployment_config_name ->
  ?deployment_group_name:deployment_group_name ->
  ?application_name:application_name ->
  unit ->
  deployment_info

val make_get_deployment_output : ?deployment_info:deployment_info -> unit -> get_deployment_output

val make_get_deployment_instance_output :
  ?instance_summary:instance_summary -> unit -> get_deployment_instance_output

val make_get_deployment_instance_input :
  instance_id:instance_id -> deployment_id:deployment_id -> unit -> get_deployment_instance_input

val make_get_deployment_input : deployment_id:deployment_id -> unit -> get_deployment_input

val make_deployment_group_info :
  ?termination_hook_enabled:boolean_ ->
  ?ecs_services:ecs_service_list ->
  ?compute_platform:compute_platform ->
  ?on_premises_tag_set:on_premises_tag_set ->
  ?ec2_tag_set:ec2_tag_set ->
  ?last_attempted_deployment:last_deployment_info ->
  ?last_successful_deployment:last_deployment_info ->
  ?load_balancer_info:load_balancer_info ->
  ?blue_green_deployment_configuration:blue_green_deployment_configuration ->
  ?outdated_instances_strategy:outdated_instances_strategy ->
  ?deployment_style:deployment_style ->
  ?auto_rollback_configuration:auto_rollback_configuration ->
  ?alarm_configuration:alarm_configuration ->
  ?trigger_configurations:trigger_config_list ->
  ?target_revision:revision_location ->
  ?service_role_arn:role ->
  ?auto_scaling_groups:auto_scaling_group_list ->
  ?on_premises_instance_tag_filters:tag_filter_list ->
  ?ec2_tag_filters:ec2_tag_filter_list ->
  ?deployment_config_name:deployment_config_name ->
  ?deployment_group_name:deployment_group_name ->
  ?deployment_group_id:deployment_group_id ->
  ?application_name:application_name ->
  unit ->
  deployment_group_info

val make_get_deployment_group_output :
  ?deployment_group_info:deployment_group_info -> unit -> get_deployment_group_output

val make_get_deployment_group_input :
  deployment_group_name:deployment_group_name ->
  application_name:application_name ->
  unit ->
  get_deployment_group_input

val make_deployment_config_info :
  ?zonal_config:zonal_config ->
  ?traffic_routing_config:traffic_routing_config ->
  ?compute_platform:compute_platform ->
  ?create_time:timestamp ->
  ?minimum_healthy_hosts:minimum_healthy_hosts ->
  ?deployment_config_name:deployment_config_name ->
  ?deployment_config_id:deployment_config_id ->
  unit ->
  deployment_config_info

val make_get_deployment_config_output :
  ?deployment_config_info:deployment_config_info -> unit -> get_deployment_config_output

val make_get_deployment_config_input :
  deployment_config_name:deployment_config_name -> unit -> get_deployment_config_input

val make_get_application_revision_output :
  ?revision_info:generic_revision_info ->
  ?revision:revision_location ->
  ?application_name:application_name ->
  unit ->
  get_application_revision_output

val make_get_application_revision_input :
  revision:revision_location ->
  application_name:application_name ->
  unit ->
  get_application_revision_input

val make_application_info :
  ?compute_platform:compute_platform ->
  ?git_hub_account_name:git_hub_account_token_name ->
  ?linked_to_git_hub:boolean_ ->
  ?create_time:timestamp ->
  ?application_name:application_name ->
  ?application_id:application_id ->
  unit ->
  application_info

val make_get_application_output : ?application:application_info -> unit -> get_application_output
val make_get_application_input : application_name:application_name -> unit -> get_application_input

val make_deregister_on_premises_instance_input :
  instance_name:instance_name -> unit -> deregister_on_premises_instance_input

val make_delete_resources_by_external_id_output : unit -> unit

val make_delete_resources_by_external_id_input :
  ?external_id:external_id -> unit -> delete_resources_by_external_id_input

val make_delete_git_hub_account_token_output :
  ?token_name:git_hub_account_token_name -> unit -> delete_git_hub_account_token_output

val make_delete_git_hub_account_token_input :
  ?token_name:git_hub_account_token_name -> unit -> delete_git_hub_account_token_input

val make_delete_deployment_group_output :
  ?hooks_not_cleaned_up:auto_scaling_group_list -> unit -> delete_deployment_group_output

val make_delete_deployment_group_input :
  deployment_group_name:deployment_group_name ->
  application_name:application_name ->
  unit ->
  delete_deployment_group_input

val make_delete_deployment_config_input :
  deployment_config_name:deployment_config_name -> unit -> delete_deployment_config_input

val make_delete_application_input :
  application_name:application_name -> unit -> delete_application_input

val make_create_deployment_output : ?deployment_id:deployment_id -> unit -> create_deployment_output

val make_create_deployment_input :
  ?override_alarm_configuration:alarm_configuration ->
  ?file_exists_behavior:file_exists_behavior ->
  ?update_outdated_instances_only:boolean_ ->
  ?auto_rollback_configuration:auto_rollback_configuration ->
  ?target_instances:target_instances ->
  ?ignore_application_stop_failures:boolean_ ->
  ?description:description ->
  ?deployment_config_name:deployment_config_name ->
  ?revision:revision_location ->
  ?deployment_group_name:deployment_group_name ->
  application_name:application_name ->
  unit ->
  create_deployment_input

val make_create_deployment_group_output :
  ?deployment_group_id:deployment_group_id -> unit -> create_deployment_group_output

val make_create_deployment_group_input :
  ?termination_hook_enabled:nullable_boolean ->
  ?tags:tag_list ->
  ?on_premises_tag_set:on_premises_tag_set ->
  ?ecs_services:ecs_service_list ->
  ?ec2_tag_set:ec2_tag_set ->
  ?load_balancer_info:load_balancer_info ->
  ?blue_green_deployment_configuration:blue_green_deployment_configuration ->
  ?deployment_style:deployment_style ->
  ?outdated_instances_strategy:outdated_instances_strategy ->
  ?auto_rollback_configuration:auto_rollback_configuration ->
  ?alarm_configuration:alarm_configuration ->
  ?trigger_configurations:trigger_config_list ->
  ?auto_scaling_groups:auto_scaling_group_name_list ->
  ?on_premises_instance_tag_filters:tag_filter_list ->
  ?ec2_tag_filters:ec2_tag_filter_list ->
  ?deployment_config_name:deployment_config_name ->
  service_role_arn:role ->
  deployment_group_name:deployment_group_name ->
  application_name:application_name ->
  unit ->
  create_deployment_group_input

val make_create_deployment_config_output :
  ?deployment_config_id:deployment_config_id -> unit -> create_deployment_config_output

val make_create_deployment_config_input :
  ?zonal_config:zonal_config ->
  ?compute_platform:compute_platform ->
  ?traffic_routing_config:traffic_routing_config ->
  ?minimum_healthy_hosts:minimum_healthy_hosts ->
  deployment_config_name:deployment_config_name ->
  unit ->
  create_deployment_config_input

val make_create_application_output :
  ?application_id:application_id -> unit -> create_application_output

val make_create_application_input :
  ?tags:tag_list ->
  ?compute_platform:compute_platform ->
  application_name:application_name ->
  unit ->
  create_application_input

val make_continue_deployment_input :
  ?deployment_wait_type:deployment_wait_type ->
  ?deployment_id:deployment_id ->
  unit ->
  continue_deployment_input

val make_batch_get_on_premises_instances_output :
  ?instance_infos:instance_info_list -> unit -> batch_get_on_premises_instances_output

val make_batch_get_on_premises_instances_input :
  instance_names:instance_name_list -> unit -> batch_get_on_premises_instances_input

val make_batch_get_deployment_targets_output :
  ?deployment_targets:deployment_target_list -> unit -> batch_get_deployment_targets_output

val make_batch_get_deployment_targets_input :
  target_ids:target_id_list ->
  deployment_id:deployment_id ->
  unit ->
  batch_get_deployment_targets_input

val make_batch_get_deployments_output :
  ?deployments_info:deployments_info_list -> unit -> batch_get_deployments_output

val make_batch_get_deployments_input :
  deployment_ids:deployments_list -> unit -> batch_get_deployments_input

val make_batch_get_deployment_instances_output :
  ?error_message:error_message ->
  ?instances_summary:instance_summary_list ->
  unit ->
  batch_get_deployment_instances_output

val make_batch_get_deployment_instances_input :
  instance_ids:instances_list ->
  deployment_id:deployment_id ->
  unit ->
  batch_get_deployment_instances_input

val make_batch_get_deployment_groups_output :
  ?error_message:error_message ->
  ?deployment_groups_info:deployment_group_info_list ->
  unit ->
  batch_get_deployment_groups_output

val make_batch_get_deployment_groups_input :
  deployment_group_names:deployment_groups_list ->
  application_name:application_name ->
  unit ->
  batch_get_deployment_groups_input

val make_batch_get_applications_output :
  ?applications_info:applications_info_list -> unit -> batch_get_applications_output

val make_batch_get_applications_input :
  application_names:applications_list -> unit -> batch_get_applications_input

val make_batch_get_application_revisions_output :
  ?revisions:revision_info_list ->
  ?error_message:error_message ->
  ?application_name:application_name ->
  unit ->
  batch_get_application_revisions_output

val make_batch_get_application_revisions_input :
  revisions:revision_location_list ->
  application_name:application_name ->
  unit ->
  batch_get_application_revisions_input

val make_add_tags_to_on_premises_instances_input :
  instance_names:instance_name_list ->
  tags:tag_list ->
  unit ->
  add_tags_to_on_premises_instances_input
