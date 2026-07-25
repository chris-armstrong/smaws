open Types

val make_tag : ?key:key -> ?value:value -> unit -> tag

val make_add_tags_to_on_premises_instances_input :
  tags:tag_list ->
  instance_names:instance_name_list ->
  unit ->
  add_tags_to_on_premises_instances_input

val make_alarm : ?name:alarm_name -> unit -> alarm

val make_alarm_configuration :
  ?enabled:boolean_ ->
  ?ignore_poll_alarm_failure:boolean_ ->
  ?alarms:alarm_list ->
  unit ->
  alarm_configuration

val make_app_spec_content :
  ?content:raw_string_content -> ?sha256:raw_string_sha256 -> unit -> app_spec_content

val make_application_info :
  ?application_id:application_id ->
  ?application_name:application_name ->
  ?create_time:timestamp ->
  ?linked_to_git_hub:boolean_ ->
  ?git_hub_account_name:git_hub_account_token_name ->
  ?compute_platform:compute_platform ->
  unit ->
  application_info

val make_auto_rollback_configuration :
  ?enabled:boolean_ -> ?events:auto_rollback_events_list -> unit -> auto_rollback_configuration

val make_auto_scaling_group :
  ?name:auto_scaling_group_name ->
  ?hook:auto_scaling_group_hook ->
  ?termination_hook:auto_scaling_group_hook ->
  unit ->
  auto_scaling_group

val make_generic_revision_info :
  ?description:description ->
  ?deployment_groups:deployment_groups_list ->
  ?first_used_time:timestamp ->
  ?last_used_time:timestamp ->
  ?register_time:timestamp ->
  unit ->
  generic_revision_info

val make_raw_string : ?content:raw_string_content -> ?sha256:raw_string_sha256 -> unit -> raw_string

val make_git_hub_location :
  ?repository:repository -> ?commit_id:commit_id -> unit -> git_hub_location

val make_s3_location :
  ?bucket:s3_bucket ->
  ?key:s3_key ->
  ?bundle_type:bundle_type ->
  ?version:version_id ->
  ?e_tag:e_tag ->
  unit ->
  s3_location

val make_revision_location :
  ?revision_type:revision_location_type ->
  ?s3_location:s3_location ->
  ?git_hub_location:git_hub_location ->
  ?string_:raw_string ->
  ?app_spec_content:app_spec_content ->
  unit ->
  revision_location

val make_revision_info :
  ?revision_location:revision_location ->
  ?generic_revision_info:generic_revision_info ->
  unit ->
  revision_info

val make_batch_get_application_revisions_output :
  ?application_name:application_name ->
  ?error_message:error_message ->
  ?revisions:revision_info_list ->
  unit ->
  batch_get_application_revisions_output

val make_batch_get_application_revisions_input :
  application_name:application_name ->
  revisions:revision_location_list ->
  unit ->
  batch_get_application_revisions_input

val make_batch_get_applications_output :
  ?applications_info:applications_info_list -> unit -> batch_get_applications_output

val make_batch_get_applications_input :
  application_names:applications_list -> unit -> batch_get_applications_input

val make_ecs_service :
  ?service_name:ecs_service_name -> ?cluster_name:ecs_cluster_name -> unit -> ecs_service

val make_tag_filter : ?key:key -> ?value:value -> ?type_:tag_filter_type -> unit -> tag_filter

val make_on_premises_tag_set :
  ?on_premises_tag_set_list:on_premises_tag_set_list -> unit -> on_premises_tag_set

val make_ec2_tag_filter :
  ?key:key -> ?value:value -> ?type_:ec2_tag_filter_type -> unit -> ec2_tag_filter

val make_ec2_tag_set : ?ec2_tag_set_list:ec2_tag_set_list -> unit -> ec2_tag_set

val make_last_deployment_info :
  ?deployment_id:deployment_id ->
  ?status:deployment_status ->
  ?end_time:timestamp ->
  ?create_time:timestamp ->
  unit ->
  last_deployment_info

val make_traffic_route : ?listener_arns:listener_arn_list -> unit -> traffic_route
val make_target_group_info : ?name:target_group_name -> unit -> target_group_info

val make_target_group_pair_info :
  ?target_groups:target_group_info_list ->
  ?prod_traffic_route:traffic_route ->
  ?test_traffic_route:traffic_route ->
  unit ->
  target_group_pair_info

val make_elb_info : ?name:elb_name -> unit -> elb_info

val make_load_balancer_info :
  ?elb_info_list:elb_info_list ->
  ?target_group_info_list:target_group_info_list ->
  ?target_group_pair_info_list:target_group_pair_info_list ->
  unit ->
  load_balancer_info

val make_green_fleet_provisioning_option :
  ?action:green_fleet_provisioning_action -> unit -> green_fleet_provisioning_option

val make_deployment_ready_option :
  ?action_on_timeout:deployment_ready_action ->
  ?wait_time_in_minutes:duration ->
  unit ->
  deployment_ready_option

val make_blue_instance_termination_option :
  ?action:instance_action ->
  ?termination_wait_time_in_minutes:duration ->
  unit ->
  blue_instance_termination_option

val make_blue_green_deployment_configuration :
  ?terminate_blue_instances_on_deployment_success:blue_instance_termination_option ->
  ?deployment_ready_option:deployment_ready_option ->
  ?green_fleet_provisioning_option:green_fleet_provisioning_option ->
  unit ->
  blue_green_deployment_configuration

val make_deployment_style :
  ?deployment_type:deployment_type ->
  ?deployment_option:deployment_option ->
  unit ->
  deployment_style

val make_trigger_config :
  ?trigger_name:trigger_name ->
  ?trigger_target_arn:trigger_target_arn ->
  ?trigger_events:trigger_event_type_list ->
  unit ->
  trigger_config

val make_deployment_group_info :
  ?application_name:application_name ->
  ?deployment_group_id:deployment_group_id ->
  ?deployment_group_name:deployment_group_name ->
  ?deployment_config_name:deployment_config_name ->
  ?ec2_tag_filters:ec2_tag_filter_list ->
  ?on_premises_instance_tag_filters:tag_filter_list ->
  ?auto_scaling_groups:auto_scaling_group_list ->
  ?service_role_arn:role ->
  ?target_revision:revision_location ->
  ?trigger_configurations:trigger_config_list ->
  ?alarm_configuration:alarm_configuration ->
  ?auto_rollback_configuration:auto_rollback_configuration ->
  ?deployment_style:deployment_style ->
  ?outdated_instances_strategy:outdated_instances_strategy ->
  ?blue_green_deployment_configuration:blue_green_deployment_configuration ->
  ?load_balancer_info:load_balancer_info ->
  ?last_successful_deployment:last_deployment_info ->
  ?last_attempted_deployment:last_deployment_info ->
  ?ec2_tag_set:ec2_tag_set ->
  ?on_premises_tag_set:on_premises_tag_set ->
  ?compute_platform:compute_platform ->
  ?ecs_services:ecs_service_list ->
  ?termination_hook_enabled:boolean_ ->
  unit ->
  deployment_group_info

val make_batch_get_deployment_groups_output :
  ?deployment_groups_info:deployment_group_info_list ->
  ?error_message:error_message ->
  unit ->
  batch_get_deployment_groups_output

val make_batch_get_deployment_groups_input :
  application_name:application_name ->
  deployment_group_names:deployment_groups_list ->
  unit ->
  batch_get_deployment_groups_input

val make_diagnostics :
  ?error_code:lifecycle_error_code ->
  ?script_name:script_name ->
  ?message:lifecycle_message ->
  ?log_tail:log_tail ->
  unit ->
  diagnostics

val make_lifecycle_event :
  ?lifecycle_event_name:lifecycle_event_name ->
  ?diagnostics:diagnostics ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  ?status:lifecycle_event_status ->
  unit ->
  lifecycle_event

val make_instance_summary :
  ?deployment_id:deployment_id ->
  ?instance_id:instance_id ->
  ?status:instance_status ->
  ?last_updated_at:timestamp ->
  ?lifecycle_events:lifecycle_event_list ->
  ?instance_type:instance_type ->
  unit ->
  instance_summary

val make_batch_get_deployment_instances_output :
  ?instances_summary:instance_summary_list ->
  ?error_message:error_message ->
  unit ->
  batch_get_deployment_instances_output

val make_batch_get_deployment_instances_input :
  deployment_id:deployment_id ->
  instance_ids:instances_list ->
  unit ->
  batch_get_deployment_instances_input

val make_cloud_formation_target :
  ?deployment_id:deployment_id ->
  ?target_id:target_id ->
  ?last_updated_at:time ->
  ?lifecycle_events:lifecycle_event_list ->
  ?status:target_status ->
  ?resource_type:cloud_formation_resource_type ->
  ?target_version_weight:traffic_weight ->
  unit ->
  cloud_formation_target

val make_ecs_task_set :
  ?identifer:ecs_task_set_identifier ->
  ?desired_count:ecs_task_set_count ->
  ?pending_count:ecs_task_set_count ->
  ?running_count:ecs_task_set_count ->
  ?status:ecs_task_set_status ->
  ?traffic_weight:traffic_weight ->
  ?target_group:target_group_info ->
  ?task_set_label:target_label ->
  unit ->
  ecs_task_set

val make_ecs_target :
  ?deployment_id:deployment_id ->
  ?target_id:target_id ->
  ?target_arn:target_arn ->
  ?last_updated_at:time ->
  ?lifecycle_events:lifecycle_event_list ->
  ?status:target_status ->
  ?task_sets_info:ecs_task_set_list ->
  unit ->
  ecs_target

val make_lambda_function_info :
  ?function_name:lambda_function_name ->
  ?function_alias:lambda_function_alias ->
  ?current_version:version ->
  ?target_version:version ->
  ?target_version_weight:traffic_weight ->
  unit ->
  lambda_function_info

val make_lambda_target :
  ?deployment_id:deployment_id ->
  ?target_id:target_id ->
  ?target_arn:target_arn ->
  ?status:target_status ->
  ?last_updated_at:time ->
  ?lifecycle_events:lifecycle_event_list ->
  ?lambda_function_info:lambda_function_info ->
  unit ->
  lambda_target

val make_instance_target :
  ?deployment_id:deployment_id ->
  ?target_id:target_id ->
  ?target_arn:target_arn ->
  ?status:target_status ->
  ?last_updated_at:time ->
  ?lifecycle_events:lifecycle_event_list ->
  ?instance_label:target_label ->
  unit ->
  instance_target

val make_deployment_target :
  ?deployment_target_type:deployment_target_type ->
  ?instance_target:instance_target ->
  ?lambda_target:lambda_target ->
  ?ecs_target:ecs_target ->
  ?cloud_formation_target:cloud_formation_target ->
  unit ->
  deployment_target

val make_batch_get_deployment_targets_output :
  ?deployment_targets:deployment_target_list -> unit -> batch_get_deployment_targets_output

val make_batch_get_deployment_targets_input :
  deployment_id:deployment_id ->
  target_ids:target_id_list ->
  unit ->
  batch_get_deployment_targets_input

val make_related_deployments :
  ?auto_update_outdated_instances_root_deployment_id:deployment_id ->
  ?auto_update_outdated_instances_deployment_ids:deployments_list ->
  unit ->
  related_deployments

val make_target_instances :
  ?tag_filters:ec2_tag_filter_list ->
  ?auto_scaling_groups:auto_scaling_group_name_list ->
  ?ec2_tag_set:ec2_tag_set ->
  unit ->
  target_instances

val make_rollback_info :
  ?rollback_deployment_id:deployment_id ->
  ?rollback_triggering_deployment_id:deployment_id ->
  ?rollback_message:description ->
  unit ->
  rollback_info

val make_deployment_overview :
  ?pending:instance_count ->
  ?in_progress:instance_count ->
  ?succeeded:instance_count ->
  ?failed:instance_count ->
  ?skipped:instance_count ->
  ?ready:instance_count ->
  unit ->
  deployment_overview

val make_error_information : ?code:error_code -> ?message:error_message -> unit -> error_information

val make_deployment_info :
  ?application_name:application_name ->
  ?deployment_group_name:deployment_group_name ->
  ?deployment_config_name:deployment_config_name ->
  ?deployment_id:deployment_id ->
  ?previous_revision:revision_location ->
  ?revision:revision_location ->
  ?status:deployment_status ->
  ?error_information:error_information ->
  ?create_time:timestamp ->
  ?start_time:timestamp ->
  ?complete_time:timestamp ->
  ?deployment_overview:deployment_overview ->
  ?description:description ->
  ?creator:deployment_creator ->
  ?ignore_application_stop_failures:boolean_ ->
  ?auto_rollback_configuration:auto_rollback_configuration ->
  ?update_outdated_instances_only:boolean_ ->
  ?rollback_info:rollback_info ->
  ?deployment_style:deployment_style ->
  ?target_instances:target_instances ->
  ?instance_termination_wait_time_started:boolean_ ->
  ?blue_green_deployment_configuration:blue_green_deployment_configuration ->
  ?load_balancer_info:load_balancer_info ->
  ?additional_deployment_status_info:additional_deployment_status_info ->
  ?file_exists_behavior:file_exists_behavior ->
  ?deployment_status_messages:deployment_status_message_list ->
  ?compute_platform:compute_platform ->
  ?external_id:external_id ->
  ?related_deployments:related_deployments ->
  ?override_alarm_configuration:alarm_configuration ->
  unit ->
  deployment_info

val make_batch_get_deployments_output :
  ?deployments_info:deployments_info_list -> unit -> batch_get_deployments_output

val make_batch_get_deployments_input :
  deployment_ids:deployments_list -> unit -> batch_get_deployments_input

val make_instance_info :
  ?instance_name:instance_name ->
  ?iam_session_arn:iam_session_arn ->
  ?iam_user_arn:iam_user_arn ->
  ?instance_arn:instance_arn ->
  ?register_time:timestamp ->
  ?deregister_time:timestamp ->
  ?tags:tag_list ->
  unit ->
  instance_info

val make_batch_get_on_premises_instances_output :
  ?instance_infos:instance_info_list -> unit -> batch_get_on_premises_instances_output

val make_batch_get_on_premises_instances_input :
  instance_names:instance_name_list -> unit -> batch_get_on_premises_instances_input

val make_update_deployment_group_output :
  ?hooks_not_cleaned_up:auto_scaling_group_list -> unit -> update_deployment_group_output

val make_update_deployment_group_input :
  ?new_deployment_group_name:deployment_group_name ->
  ?deployment_config_name:deployment_config_name ->
  ?ec2_tag_filters:ec2_tag_filter_list ->
  ?on_premises_instance_tag_filters:tag_filter_list ->
  ?auto_scaling_groups:auto_scaling_group_name_list ->
  ?service_role_arn:role ->
  ?trigger_configurations:trigger_config_list ->
  ?alarm_configuration:alarm_configuration ->
  ?auto_rollback_configuration:auto_rollback_configuration ->
  ?outdated_instances_strategy:outdated_instances_strategy ->
  ?deployment_style:deployment_style ->
  ?blue_green_deployment_configuration:blue_green_deployment_configuration ->
  ?load_balancer_info:load_balancer_info ->
  ?ec2_tag_set:ec2_tag_set ->
  ?ecs_services:ecs_service_list ->
  ?on_premises_tag_set:on_premises_tag_set ->
  ?termination_hook_enabled:nullable_boolean ->
  application_name:application_name ->
  current_deployment_group_name:deployment_group_name ->
  unit ->
  update_deployment_group_input

val make_update_application_input :
  ?application_name:application_name ->
  ?new_application_name:application_name ->
  unit ->
  update_application_input

val make_untag_resource_output : unit -> unit

val make_untag_resource_input :
  resource_arn:arn -> tag_keys:tag_key_list -> unit -> untag_resource_input

val make_tag_resource_output : unit -> unit
val make_tag_resource_input : resource_arn:arn -> tags:tag_list -> unit -> tag_resource_input

val make_stop_deployment_output :
  ?status:stop_status -> ?status_message:message -> unit -> stop_deployment_output

val make_stop_deployment_input :
  ?auto_rollback_enabled:nullable_boolean ->
  deployment_id:deployment_id ->
  unit ->
  stop_deployment_input

val make_skip_wait_time_for_instance_termination_input :
  ?deployment_id:deployment_id -> unit -> skip_wait_time_for_instance_termination_input

val make_remove_tags_from_on_premises_instances_input :
  tags:tag_list ->
  instance_names:instance_name_list ->
  unit ->
  remove_tags_from_on_premises_instances_input

val make_register_on_premises_instance_input :
  ?iam_session_arn:iam_session_arn ->
  ?iam_user_arn:iam_user_arn ->
  instance_name:instance_name ->
  unit ->
  register_on_premises_instance_input

val make_register_application_revision_input :
  ?description:description ->
  application_name:application_name ->
  revision:revision_location ->
  unit ->
  register_application_revision_input

val make_put_lifecycle_event_hook_execution_status_output :
  ?lifecycle_event_hook_execution_id:lifecycle_event_hook_execution_id ->
  unit ->
  put_lifecycle_event_hook_execution_status_output

val make_put_lifecycle_event_hook_execution_status_input :
  ?deployment_id:deployment_id ->
  ?lifecycle_event_hook_execution_id:lifecycle_event_hook_execution_id ->
  ?status:lifecycle_event_status ->
  unit ->
  put_lifecycle_event_hook_execution_status_input

val make_list_tags_for_resource_output :
  ?tags:tag_list -> ?next_token:next_token -> unit -> list_tags_for_resource_output

val make_list_tags_for_resource_input :
  ?next_token:next_token -> resource_arn:arn -> unit -> list_tags_for_resource_input

val make_list_on_premises_instances_output :
  ?instance_names:instance_name_list ->
  ?next_token:next_token ->
  unit ->
  list_on_premises_instances_output

val make_list_on_premises_instances_input :
  ?registration_status:registration_status ->
  ?tag_filters:tag_filter_list ->
  ?next_token:next_token ->
  unit ->
  list_on_premises_instances_input

val make_list_git_hub_account_token_names_output :
  ?token_name_list:git_hub_account_token_name_list ->
  ?next_token:next_token ->
  unit ->
  list_git_hub_account_token_names_output

val make_list_git_hub_account_token_names_input :
  ?next_token:next_token -> unit -> list_git_hub_account_token_names_input

val make_list_deployment_targets_output :
  ?target_ids:target_id_list -> ?next_token:next_token -> unit -> list_deployment_targets_output

val make_list_deployment_targets_input :
  ?next_token:next_token ->
  ?target_filters:target_filters ->
  deployment_id:deployment_id ->
  unit ->
  list_deployment_targets_input

val make_list_deployments_output :
  ?deployments:deployments_list -> ?next_token:next_token -> unit -> list_deployments_output

val make_time_range : ?start:timestamp -> ?end_:timestamp -> unit -> time_range

val make_list_deployments_input :
  ?application_name:application_name ->
  ?deployment_group_name:deployment_group_name ->
  ?external_id:external_id ->
  ?include_only_statuses:deployment_status_list ->
  ?create_time_range:time_range ->
  ?next_token:next_token ->
  unit ->
  list_deployments_input

val make_list_deployment_instances_output :
  ?instances_list:instances_list ->
  ?next_token:next_token ->
  unit ->
  list_deployment_instances_output

val make_list_deployment_instances_input :
  ?next_token:next_token ->
  ?instance_status_filter:instance_status_list ->
  ?instance_type_filter:instance_type_list ->
  deployment_id:deployment_id ->
  unit ->
  list_deployment_instances_input

val make_list_deployment_groups_output :
  ?application_name:application_name ->
  ?deployment_groups:deployment_groups_list ->
  ?next_token:next_token ->
  unit ->
  list_deployment_groups_output

val make_list_deployment_groups_input :
  ?next_token:next_token ->
  application_name:application_name ->
  unit ->
  list_deployment_groups_input

val make_list_deployment_configs_output :
  ?deployment_configs_list:deployment_configs_list ->
  ?next_token:next_token ->
  unit ->
  list_deployment_configs_output

val make_list_deployment_configs_input :
  ?next_token:next_token -> unit -> list_deployment_configs_input

val make_list_applications_output :
  ?applications:applications_list -> ?next_token:next_token -> unit -> list_applications_output

val make_list_applications_input : ?next_token:next_token -> unit -> list_applications_input

val make_list_application_revisions_output :
  ?revisions:revision_location_list ->
  ?next_token:next_token ->
  unit ->
  list_application_revisions_output

val make_list_application_revisions_input :
  ?sort_by:application_revision_sort_by ->
  ?sort_order:sort_order ->
  ?s3_bucket:s3_bucket ->
  ?s3_key_prefix:s3_key ->
  ?deployed:list_state_filter_action ->
  ?next_token:next_token ->
  application_name:application_name ->
  unit ->
  list_application_revisions_input

val make_get_on_premises_instance_output :
  ?instance_info:instance_info -> unit -> get_on_premises_instance_output

val make_get_on_premises_instance_input :
  instance_name:instance_name -> unit -> get_on_premises_instance_input

val make_get_deployment_target_output :
  ?deployment_target:deployment_target -> unit -> get_deployment_target_output

val make_get_deployment_target_input :
  deployment_id:deployment_id -> target_id:target_id -> unit -> get_deployment_target_input

val make_get_deployment_instance_output :
  ?instance_summary:instance_summary -> unit -> get_deployment_instance_output

val make_get_deployment_instance_input :
  deployment_id:deployment_id -> instance_id:instance_id -> unit -> get_deployment_instance_input

val make_get_deployment_group_output :
  ?deployment_group_info:deployment_group_info -> unit -> get_deployment_group_output

val make_get_deployment_group_input :
  application_name:application_name ->
  deployment_group_name:deployment_group_name ->
  unit ->
  get_deployment_group_input

val make_minimum_healthy_hosts_per_zone :
  ?type_:minimum_healthy_hosts_per_zone_type ->
  ?value:minimum_healthy_hosts_per_zone_value ->
  unit ->
  minimum_healthy_hosts_per_zone

val make_zonal_config :
  ?first_zone_monitor_duration_in_seconds:wait_time_in_seconds ->
  ?monitor_duration_in_seconds:wait_time_in_seconds ->
  ?minimum_healthy_hosts_per_zone:minimum_healthy_hosts_per_zone ->
  unit ->
  zonal_config

val make_time_based_linear :
  ?linear_percentage:percentage -> ?linear_interval:wait_time_in_mins -> unit -> time_based_linear

val make_time_based_canary :
  ?canary_percentage:percentage -> ?canary_interval:wait_time_in_mins -> unit -> time_based_canary

val make_traffic_routing_config :
  ?type_:traffic_routing_type ->
  ?time_based_canary:time_based_canary ->
  ?time_based_linear:time_based_linear ->
  unit ->
  traffic_routing_config

val make_minimum_healthy_hosts :
  ?type_:minimum_healthy_hosts_type ->
  ?value:minimum_healthy_hosts_value ->
  unit ->
  minimum_healthy_hosts

val make_deployment_config_info :
  ?deployment_config_id:deployment_config_id ->
  ?deployment_config_name:deployment_config_name ->
  ?minimum_healthy_hosts:minimum_healthy_hosts ->
  ?create_time:timestamp ->
  ?compute_platform:compute_platform ->
  ?traffic_routing_config:traffic_routing_config ->
  ?zonal_config:zonal_config ->
  unit ->
  deployment_config_info

val make_get_deployment_config_output :
  ?deployment_config_info:deployment_config_info -> unit -> get_deployment_config_output

val make_get_deployment_config_input :
  deployment_config_name:deployment_config_name -> unit -> get_deployment_config_input

val make_get_deployment_output : ?deployment_info:deployment_info -> unit -> get_deployment_output
val make_get_deployment_input : deployment_id:deployment_id -> unit -> get_deployment_input

val make_get_application_revision_output :
  ?application_name:application_name ->
  ?revision:revision_location ->
  ?revision_info:generic_revision_info ->
  unit ->
  get_application_revision_output

val make_get_application_revision_input :
  application_name:application_name ->
  revision:revision_location ->
  unit ->
  get_application_revision_input

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
  application_name:application_name ->
  deployment_group_name:deployment_group_name ->
  unit ->
  delete_deployment_group_input

val make_delete_deployment_config_input :
  deployment_config_name:deployment_config_name -> unit -> delete_deployment_config_input

val make_delete_application_input :
  application_name:application_name -> unit -> delete_application_input

val make_create_deployment_group_output :
  ?deployment_group_id:deployment_group_id -> unit -> create_deployment_group_output

val make_create_deployment_group_input :
  ?deployment_config_name:deployment_config_name ->
  ?ec2_tag_filters:ec2_tag_filter_list ->
  ?on_premises_instance_tag_filters:tag_filter_list ->
  ?auto_scaling_groups:auto_scaling_group_name_list ->
  ?trigger_configurations:trigger_config_list ->
  ?alarm_configuration:alarm_configuration ->
  ?auto_rollback_configuration:auto_rollback_configuration ->
  ?outdated_instances_strategy:outdated_instances_strategy ->
  ?deployment_style:deployment_style ->
  ?blue_green_deployment_configuration:blue_green_deployment_configuration ->
  ?load_balancer_info:load_balancer_info ->
  ?ec2_tag_set:ec2_tag_set ->
  ?ecs_services:ecs_service_list ->
  ?on_premises_tag_set:on_premises_tag_set ->
  ?tags:tag_list ->
  ?termination_hook_enabled:nullable_boolean ->
  application_name:application_name ->
  deployment_group_name:deployment_group_name ->
  service_role_arn:role ->
  unit ->
  create_deployment_group_input

val make_create_deployment_config_output :
  ?deployment_config_id:deployment_config_id -> unit -> create_deployment_config_output

val make_create_deployment_config_input :
  ?minimum_healthy_hosts:minimum_healthy_hosts ->
  ?traffic_routing_config:traffic_routing_config ->
  ?compute_platform:compute_platform ->
  ?zonal_config:zonal_config ->
  deployment_config_name:deployment_config_name ->
  unit ->
  create_deployment_config_input

val make_create_deployment_output : ?deployment_id:deployment_id -> unit -> create_deployment_output

val make_create_deployment_input :
  ?deployment_group_name:deployment_group_name ->
  ?revision:revision_location ->
  ?deployment_config_name:deployment_config_name ->
  ?description:description ->
  ?ignore_application_stop_failures:boolean_ ->
  ?target_instances:target_instances ->
  ?auto_rollback_configuration:auto_rollback_configuration ->
  ?update_outdated_instances_only:boolean_ ->
  ?file_exists_behavior:file_exists_behavior ->
  ?override_alarm_configuration:alarm_configuration ->
  application_name:application_name ->
  unit ->
  create_deployment_input

val make_create_application_output :
  ?application_id:application_id -> unit -> create_application_output

val make_create_application_input :
  ?compute_platform:compute_platform ->
  ?tags:tag_list ->
  application_name:application_name ->
  unit ->
  create_application_input

val make_continue_deployment_input :
  ?deployment_id:deployment_id ->
  ?deployment_wait_type:deployment_wait_type ->
  unit ->
  continue_deployment_input
