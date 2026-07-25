open Types

val make_accelerator_count_request :
  ?min:boxed_integer -> ?max:boxed_integer -> unit -> accelerator_count_request

val make_accelerator_total_memory_mi_b_request :
  ?min:boxed_integer -> ?max:boxed_integer -> unit -> accelerator_total_memory_mi_b_request

val make_advanced_configuration :
  ?alternate_target_group_arn:string_ ->
  ?production_listener_rule:string_ ->
  ?test_listener_rule:string_ ->
  ?role_arn:string_ ->
  unit ->
  advanced_configuration

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_arn:string_ -> tag_keys:tag_keys -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag : ?key:tag_key -> ?value:tag_value -> unit -> tag
val make_tag_resource_request : resource_arn:string_ -> tags:tags -> unit -> tag_resource_request

val make_setting :
  ?name:setting_name ->
  ?value:string_ ->
  ?principal_arn:string_ ->
  ?type_:setting_type ->
  unit ->
  setting

val make_put_account_setting_default_response :
  ?setting:setting -> unit -> put_account_setting_default_response

val make_put_account_setting_default_request :
  name:setting_name -> value:string_ -> unit -> put_account_setting_default_request

val make_put_account_setting_response : ?setting:setting -> unit -> put_account_setting_response

val make_put_account_setting_request :
  ?principal_arn:string_ ->
  name:setting_name ->
  value:string_ ->
  unit ->
  put_account_setting_request

val make_list_task_definition_families_response :
  ?families:string_list -> ?next_token:string_ -> unit -> list_task_definition_families_response

val make_list_task_definition_families_request :
  ?family_prefix:string_ ->
  ?status:task_definition_family_status ->
  ?next_token:string_ ->
  ?max_results:boxed_integer ->
  unit ->
  list_task_definition_families_request

val make_list_tags_for_resource_response : ?tags:tags -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:string_ -> unit -> list_tags_for_resource_request

val make_list_services_by_namespace_response :
  ?service_arns:string_list -> ?next_token:string_ -> unit -> list_services_by_namespace_response

val make_list_services_by_namespace_request :
  ?next_token:string_ ->
  ?max_results:boxed_integer ->
  namespace:string_ ->
  unit ->
  list_services_by_namespace_request

val make_list_account_settings_response :
  ?settings:settings -> ?next_token:string_ -> unit -> list_account_settings_response

val make_list_account_settings_request :
  ?name:setting_name ->
  ?value:string_ ->
  ?principal_arn:string_ ->
  ?effective_settings:boolean_ ->
  ?next_token:string_ ->
  ?max_results:integer ->
  unit ->
  list_account_settings_request

val make_discover_poll_endpoint_response :
  ?endpoint:string_ ->
  ?telemetry_endpoint:string_ ->
  ?service_connect_endpoint:string_ ->
  unit ->
  discover_poll_endpoint_response

val make_discover_poll_endpoint_request :
  ?container_instance:string_ -> ?cluster:string_ -> unit -> discover_poll_endpoint_request

val make_ephemeral_storage : size_in_gi_b:integer -> unit -> ephemeral_storage
val make_key_value_pair : ?name:string_ -> ?value:string_ -> unit -> key_value_pair

val make_proxy_configuration :
  ?type_:proxy_configuration_type ->
  ?properties:proxy_configuration_properties ->
  container_name:string_ ->
  unit ->
  proxy_configuration

val make_inference_accelerator :
  device_name:string_ -> device_type:string_ -> unit -> inference_accelerator

val make_runtime_platform :
  ?cpu_architecture:cpu_architecture ->
  ?operating_system_family:os_family ->
  unit ->
  runtime_platform

val make_task_definition_placement_constraint :
  ?type_:task_definition_placement_constraint_type ->
  ?expression:string_ ->
  unit ->
  task_definition_placement_constraint

val make_attribute :
  ?value:string_ ->
  ?target_type:target_type ->
  ?target_id:string_ ->
  name:string_ ->
  unit ->
  attribute

val make_f_sx_windows_file_server_authorization_config :
  credentials_parameter:string_ ->
  domain:string_ ->
  unit ->
  f_sx_windows_file_server_authorization_config

val make_f_sx_windows_file_server_volume_configuration :
  file_system_id:string_ ->
  root_directory:string_ ->
  authorization_config:f_sx_windows_file_server_authorization_config ->
  unit ->
  f_sx_windows_file_server_volume_configuration

val make_s3_files_volume_configuration :
  ?root_directory:string_ ->
  ?transit_encryption_port:boxed_integer ->
  ?access_point_arn:string_ ->
  file_system_arn:string_ ->
  unit ->
  s3_files_volume_configuration

val make_efs_authorization_config :
  ?access_point_id:string_ -> ?iam:efs_authorization_config_ia_m -> unit -> efs_authorization_config

val make_efs_volume_configuration :
  ?root_directory:string_ ->
  ?transit_encryption:efs_transit_encryption ->
  ?transit_encryption_port:boxed_integer ->
  ?authorization_config:efs_authorization_config ->
  file_system_id:string_ ->
  unit ->
  efs_volume_configuration

val make_docker_volume_configuration :
  ?scope:scope ->
  ?autoprovision:boxed_boolean ->
  ?driver:string_ ->
  ?driver_opts:string_map ->
  ?labels:string_map ->
  unit ->
  docker_volume_configuration

val make_host_volume_properties : ?source_path:string_ -> unit -> host_volume_properties

val make_volume :
  ?name:string_ ->
  ?host:host_volume_properties ->
  ?docker_volume_configuration:docker_volume_configuration ->
  ?efs_volume_configuration:efs_volume_configuration ->
  ?s3files_volume_configuration:s3_files_volume_configuration ->
  ?fsx_windows_file_server_volume_configuration:f_sx_windows_file_server_volume_configuration ->
  ?configured_at_launch:boxed_boolean ->
  unit ->
  volume

val make_firelens_configuration :
  ?options:firelens_configuration_options_map ->
  type_:firelens_configuration_type ->
  unit ->
  firelens_configuration

val make_resource_requirement : value:string_ -> type_:resource_type -> unit -> resource_requirement
val make_system_control : ?namespace:string_ -> ?value:string_ -> unit -> system_control

val make_health_check :
  ?interval:boxed_integer ->
  ?timeout:boxed_integer ->
  ?retries:boxed_integer ->
  ?start_period:boxed_integer ->
  command:string_list ->
  unit ->
  health_check

val make_secret : name:string_ -> value_from:string_ -> unit -> secret

val make_log_configuration :
  ?options:log_configuration_options_map ->
  ?secret_options:secret_list ->
  log_driver:log_driver ->
  unit ->
  log_configuration

val make_ulimit : name:ulimit_name -> soft_limit:integer -> hard_limit:integer -> unit -> ulimit
val make_host_entry : hostname:string_ -> ip_address:string_ -> unit -> host_entry

val make_container_dependency :
  container_name:string_ -> condition:container_condition -> unit -> container_dependency

val make_tmpfs :
  ?mount_options:string_list -> container_path:string_ -> size:integer -> unit -> tmpfs

val make_device :
  ?container_path:string_ ->
  ?permissions:device_cgroup_permissions ->
  host_path:string_ ->
  unit ->
  device

val make_kernel_capabilities : ?add:string_list -> ?drop:string_list -> unit -> kernel_capabilities

val make_linux_parameters :
  ?capabilities:kernel_capabilities ->
  ?devices:devices_list ->
  ?init_process_enabled:boxed_boolean ->
  ?shared_memory_size:boxed_integer ->
  ?tmpfs:tmpfs_list ->
  ?max_swap:boxed_integer ->
  ?swappiness:boxed_integer ->
  unit ->
  linux_parameters

val make_volume_from : ?source_container:string_ -> ?read_only:boxed_boolean -> unit -> volume_from

val make_mount_point :
  ?source_volume:string_ ->
  ?container_path:string_ ->
  ?read_only:boxed_boolean ->
  unit ->
  mount_point

val make_environment_file : value:string_ -> type_:environment_file_type -> unit -> environment_file

val make_container_restart_policy :
  ?ignored_exit_codes:integer_list ->
  ?restart_attempt_period:boxed_integer ->
  enabled:boxed_boolean ->
  unit ->
  container_restart_policy

val make_port_mapping :
  ?container_port:boxed_integer ->
  ?host_port:boxed_integer ->
  ?protocol:transport_protocol ->
  ?name:string_ ->
  ?app_protocol:application_protocol ->
  ?container_port_range:string_ ->
  unit ->
  port_mapping

val make_repository_credentials : credentials_parameter:string_ -> unit -> repository_credentials

val make_container_definition :
  ?name:string_ ->
  ?image:string_ ->
  ?repository_credentials:repository_credentials ->
  ?cpu:integer ->
  ?memory:boxed_integer ->
  ?memory_reservation:boxed_integer ->
  ?links:string_list ->
  ?port_mappings:port_mapping_list ->
  ?essential:boxed_boolean ->
  ?restart_policy:container_restart_policy ->
  ?entry_point:string_list ->
  ?command:string_list ->
  ?environment:environment_variables ->
  ?environment_files:environment_files ->
  ?mount_points:mount_point_list ->
  ?volumes_from:volume_from_list ->
  ?linux_parameters:linux_parameters ->
  ?secrets:secret_list ->
  ?depends_on:container_dependencies ->
  ?start_timeout:boxed_integer ->
  ?stop_timeout:boxed_integer ->
  ?version_consistency:version_consistency ->
  ?hostname:string_ ->
  ?user:string_ ->
  ?working_directory:string_ ->
  ?disable_networking:boxed_boolean ->
  ?privileged:boxed_boolean ->
  ?readonly_root_filesystem:boxed_boolean ->
  ?dns_servers:string_list ->
  ?dns_search_domains:string_list ->
  ?extra_hosts:host_entry_list ->
  ?docker_security_options:string_list ->
  ?interactive:boxed_boolean ->
  ?pseudo_terminal:boxed_boolean ->
  ?docker_labels:docker_labels_map ->
  ?ulimits:ulimit_list ->
  ?log_configuration:log_configuration ->
  ?health_check:health_check ->
  ?system_controls:system_controls ->
  ?resource_requirements:resource_requirements ->
  ?firelens_configuration:firelens_configuration ->
  ?credential_specs:string_list ->
  unit ->
  container_definition

val make_task_definition :
  ?task_definition_arn:string_ ->
  ?container_definitions:container_definitions ->
  ?family:string_ ->
  ?task_role_arn:string_ ->
  ?execution_role_arn:string_ ->
  ?network_mode:network_mode ->
  ?revision:integer ->
  ?volumes:volume_list ->
  ?status:task_definition_status ->
  ?requires_attributes:requires_attributes ->
  ?placement_constraints:task_definition_placement_constraints ->
  ?compatibilities:compatibility_list ->
  ?runtime_platform:runtime_platform ->
  ?requires_compatibilities:compatibility_list ->
  ?cpu:string_ ->
  ?memory:string_ ->
  ?inference_accelerators:inference_accelerators ->
  ?pid_mode:pid_mode ->
  ?ipc_mode:ipc_mode ->
  ?proxy_configuration:proxy_configuration ->
  ?registered_at:timestamp ->
  ?deregistered_at:timestamp ->
  ?delete_requested_at:timestamp ->
  ?registered_by:string_ ->
  ?ephemeral_storage:ephemeral_storage ->
  ?enable_fault_injection:boxed_boolean ->
  unit ->
  task_definition

val make_describe_task_definition_response :
  ?task_definition:task_definition -> ?tags:tags -> unit -> describe_task_definition_response

val make_describe_task_definition_request :
  ?include_:task_definition_field_list ->
  task_definition:string_ ->
  unit ->
  describe_task_definition_request

val make_deregister_task_definition_response :
  ?task_definition:task_definition -> unit -> deregister_task_definition_response

val make_deregister_task_definition_request :
  task_definition:string_ -> unit -> deregister_task_definition_request

val make_delete_account_setting_response :
  ?setting:setting -> unit -> delete_account_setting_response

val make_delete_account_setting_request :
  ?principal_arn:string_ -> name:setting_name -> unit -> delete_account_setting_request

val make_continue_service_deployment_response :
  ?service_deployment_arn:string_ -> unit -> continue_service_deployment_response

val make_continue_service_deployment_request :
  ?action:deployment_lifecycle_hook_action ->
  service_deployment_arn:string_ ->
  hook_id:string_ ->
  unit ->
  continue_service_deployment_request

val make_attachment :
  ?id:string_ ->
  ?type_:string_ ->
  ?status:string_ ->
  ?details:attachment_details ->
  unit ->
  attachment

val make_attachment_state_change :
  attachment_arn:string_ -> status:string_ -> unit -> attachment_state_change

val make_auto_repair_configuration :
  ?actions_status:auto_repair_actions_status -> unit -> auto_repair_configuration

val make_managed_scaling :
  ?status:managed_scaling_status ->
  ?target_capacity:managed_scaling_target_capacity ->
  ?minimum_scaling_step_size:managed_scaling_step_size ->
  ?maximum_scaling_step_size:managed_scaling_step_size ->
  ?instance_warmup_period:managed_scaling_instance_warmup_period ->
  unit ->
  managed_scaling

val make_auto_scaling_group_provider :
  ?managed_scaling:managed_scaling ->
  ?managed_termination_protection:managed_termination_protection ->
  ?managed_draining:managed_draining ->
  auto_scaling_group_arn:string_ ->
  unit ->
  auto_scaling_group_provider

val make_auto_scaling_group_provider_update :
  ?managed_scaling:managed_scaling ->
  ?managed_termination_protection:managed_termination_protection ->
  ?managed_draining:managed_draining ->
  unit ->
  auto_scaling_group_provider_update

val make_aws_vpc_configuration :
  ?security_groups:string_list ->
  ?assign_public_ip:assign_public_ip ->
  subnets:string_list ->
  unit ->
  aws_vpc_configuration

val make_baseline_ebs_bandwidth_mbps_request :
  ?min:boxed_integer -> ?max:boxed_integer -> unit -> baseline_ebs_bandwidth_mbps_request

val make_canary_configuration :
  ?canary_percent:double -> ?canary_bake_time_in_minutes:integer -> unit -> canary_configuration

val make_infrastructure_optimization :
  ?scale_in_after:boxed_integer -> unit -> infrastructure_optimization

val make_capacity_reservation_request :
  ?reservation_group_arn:string_ ->
  ?reservation_preference:capacity_reservation_preference ->
  unit ->
  capacity_reservation_request

val make_network_bandwidth_gbps_request :
  ?min:boxed_double -> ?max:boxed_double -> unit -> network_bandwidth_gbps_request

val make_total_local_storage_gb_request :
  ?min:boxed_double -> ?max:boxed_double -> unit -> total_local_storage_gb_request

val make_network_interface_count_request :
  ?min:boxed_integer -> ?max:boxed_integer -> unit -> network_interface_count_request

val make_memory_gi_b_per_v_cpu_request :
  ?min:boxed_double -> ?max:boxed_double -> unit -> memory_gi_b_per_v_cpu_request

val make_memory_mi_b_request :
  ?max:boxed_integer -> min:boxed_integer -> unit -> memory_mi_b_request

val make_v_cpu_count_range_request :
  ?max:boxed_integer -> min:boxed_integer -> unit -> v_cpu_count_range_request

val make_instance_requirements_request :
  ?cpu_manufacturers:cpu_manufacturer_set ->
  ?memory_gi_b_per_v_cpu:memory_gi_b_per_v_cpu_request ->
  ?excluded_instance_types:excluded_instance_type_set ->
  ?instance_generations:instance_generation_set ->
  ?spot_max_price_percentage_over_lowest_price:boxed_integer ->
  ?on_demand_max_price_percentage_over_lowest_price:boxed_integer ->
  ?bare_metal:bare_metal ->
  ?burstable_performance:burstable_performance ->
  ?require_hibernate_support:boxed_boolean ->
  ?network_interface_count:network_interface_count_request ->
  ?local_storage:local_storage ->
  ?local_storage_types:local_storage_type_set ->
  ?total_local_storage_g_b:total_local_storage_gb_request ->
  ?baseline_ebs_bandwidth_mbps:baseline_ebs_bandwidth_mbps_request ->
  ?accelerator_types:accelerator_type_set ->
  ?accelerator_count:accelerator_count_request ->
  ?accelerator_manufacturers:accelerator_manufacturer_set ->
  ?accelerator_names:accelerator_name_set ->
  ?accelerator_total_memory_mi_b:accelerator_total_memory_mi_b_request ->
  ?network_bandwidth_gbps:network_bandwidth_gbps_request ->
  ?allowed_instance_types:allowed_instance_type_set ->
  ?max_spot_price_as_percentage_of_optimal_on_demand_price:boxed_integer ->
  v_cpu_count:v_cpu_count_range_request ->
  memory_mi_b:memory_mi_b_request ->
  unit ->
  instance_requirements_request

val make_managed_instances_local_storage_configuration :
  ?use_local_storage:boolean_ -> unit -> managed_instances_local_storage_configuration

val make_managed_instances_storage_configuration :
  ?storage_size_gi_b:task_volume_storage_gi_b -> unit -> managed_instances_storage_configuration

val make_managed_instances_network_configuration :
  ?subnets:string_list ->
  ?security_groups:string_list ->
  unit ->
  managed_instances_network_configuration

val make_instance_launch_template :
  ?storage_configuration:managed_instances_storage_configuration ->
  ?local_storage_configuration:managed_instances_local_storage_configuration ->
  ?monitoring:managed_instances_monitoring_options ->
  ?capacity_option_type:capacity_option_type ->
  ?instance_metadata_tags_propagation:boxed_boolean ->
  ?instance_requirements:instance_requirements_request ->
  ?fips_enabled:boxed_boolean ->
  ?capacity_reservations:capacity_reservation_request ->
  ec2_instance_profile_arn:string_ ->
  network_configuration:managed_instances_network_configuration ->
  unit ->
  instance_launch_template

val make_managed_instances_provider :
  ?infrastructure_role_arn:string_ ->
  ?instance_launch_template:instance_launch_template ->
  ?propagate_tags:propagate_mi_tags ->
  ?infrastructure_optimization:infrastructure_optimization ->
  ?auto_repair_configuration:auto_repair_configuration ->
  unit ->
  managed_instances_provider

val make_capacity_provider :
  ?capacity_provider_arn:string_ ->
  ?name:string_ ->
  ?cluster:string_ ->
  ?status:capacity_provider_status ->
  ?auto_scaling_group_provider:auto_scaling_group_provider ->
  ?managed_instances_provider:managed_instances_provider ->
  ?update_status:capacity_provider_update_status ->
  ?update_status_reason:string_ ->
  ?tags:tags ->
  ?type_:capacity_provider_type ->
  unit ->
  capacity_provider

val make_capacity_provider_strategy_item :
  ?weight:capacity_provider_strategy_item_weight ->
  ?base:capacity_provider_strategy_item_base ->
  capacity_provider:string_ ->
  unit ->
  capacity_provider_strategy_item

val make_cluster_service_connect_defaults :
  ?namespace:string_ -> unit -> cluster_service_connect_defaults

val make_cluster_setting : ?name:cluster_setting_name -> ?value:string_ -> unit -> cluster_setting

val make_managed_storage_configuration :
  ?kms_key_id:string_ ->
  ?fargate_ephemeral_storage_kms_key_id:string_ ->
  unit ->
  managed_storage_configuration

val make_execute_command_log_configuration :
  ?cloud_watch_log_group_name:string_ ->
  ?cloud_watch_encryption_enabled:boolean_ ->
  ?s3_bucket_name:string_ ->
  ?s3_encryption_enabled:boolean_ ->
  ?s3_key_prefix:string_ ->
  unit ->
  execute_command_log_configuration

val make_execute_command_configuration :
  ?kms_key_id:string_ ->
  ?logging:execute_command_logging ->
  ?log_configuration:execute_command_log_configuration ->
  unit ->
  execute_command_configuration

val make_cluster_configuration :
  ?execute_command_configuration:execute_command_configuration ->
  ?managed_storage_configuration:managed_storage_configuration ->
  unit ->
  cluster_configuration

val make_cluster :
  ?cluster_arn:string_ ->
  ?cluster_name:string_ ->
  ?configuration:cluster_configuration ->
  ?status:string_ ->
  ?registered_container_instances_count:integer ->
  ?running_tasks_count:integer ->
  ?pending_tasks_count:integer ->
  ?active_services_count:integer ->
  ?statistics:statistics ->
  ?tags:tags ->
  ?settings:cluster_settings ->
  ?capacity_providers:string_list ->
  ?default_capacity_provider_strategy:capacity_provider_strategy ->
  ?attachments:attachments ->
  ?attachments_status:string_ ->
  ?service_connect_defaults:cluster_service_connect_defaults ->
  unit ->
  cluster

val make_cluster_service_connect_defaults_request :
  namespace:string_ -> unit -> cluster_service_connect_defaults_request

val make_managed_agent :
  ?last_started_at:timestamp ->
  ?name:managed_agent_name ->
  ?reason:string_ ->
  ?last_status:string_ ->
  unit ->
  managed_agent

val make_network_interface :
  ?attachment_id:string_ ->
  ?private_ipv4_address:string_ ->
  ?ipv6_address:string_ ->
  unit ->
  network_interface

val make_network_binding :
  ?bind_i_p:string_ ->
  ?container_port:boxed_integer ->
  ?host_port:boxed_integer ->
  ?protocol:transport_protocol ->
  ?container_port_range:string_ ->
  ?host_port_range:string_ ->
  unit ->
  network_binding

val make_container :
  ?container_arn:string_ ->
  ?task_arn:string_ ->
  ?name:string_ ->
  ?image:string_ ->
  ?image_digest:string_ ->
  ?runtime_id:string_ ->
  ?last_status:string_ ->
  ?exit_code:boxed_integer ->
  ?reason:string_ ->
  ?network_bindings:network_bindings ->
  ?network_interfaces:network_interfaces ->
  ?health_status:health_status ->
  ?managed_agents:managed_agents ->
  ?cpu:string_ ->
  ?memory:string_ ->
  ?memory_reservation:string_ ->
  ?gpu_ids:gpu_ids ->
  ?neuron_device_ids:neuron_device_ids ->
  unit ->
  container

val make_container_image :
  ?container_name:string_ -> ?image_digest:string_ -> ?image:string_ -> unit -> container_image

val make_container_instance_health_status :
  ?overall_status:instance_health_check_state ->
  ?details:instance_health_check_result_list ->
  unit ->
  container_instance_health_status

val make_resource :
  ?name:string_ ->
  ?type_:string_ ->
  ?double_value:double ->
  ?long_value:long ->
  ?integer_value:integer ->
  ?string_set_value:string_list ->
  unit ->
  resource

val make_version_info :
  ?agent_version:string_ -> ?agent_hash:string_ -> ?docker_version:string_ -> unit -> version_info

val make_container_instance :
  ?container_instance_arn:string_ ->
  ?ec2_instance_id:string_ ->
  ?capacity_provider_name:string_ ->
  ?version:long ->
  ?version_info:version_info ->
  ?remaining_resources:resources ->
  ?registered_resources:resources ->
  ?status:string_ ->
  ?status_reason:string_ ->
  ?agent_connected:boolean_ ->
  ?running_tasks_count:integer ->
  ?pending_tasks_count:integer ->
  ?agent_update_status:agent_update_status ->
  ?attributes:attributes ->
  ?registered_at:timestamp ->
  ?attachments:attachments ->
  ?tags:tags ->
  ?health_status:container_instance_health_status ->
  unit ->
  container_instance

val make_container_override :
  ?name:string_ ->
  ?command:string_list ->
  ?environment:environment_variables ->
  ?environment_files:environment_files ->
  ?cpu:boxed_integer ->
  ?memory:boxed_integer ->
  ?memory_reservation:boxed_integer ->
  ?resource_requirements:resource_requirements ->
  unit ->
  container_override

val make_container_state_change :
  ?container_name:string_ ->
  ?image_digest:string_ ->
  ?runtime_id:string_ ->
  ?exit_code:boxed_integer ->
  ?network_bindings:network_bindings ->
  ?reason:string_ ->
  ?status:string_ ->
  unit ->
  container_state_change

val make_create_capacity_provider_response :
  ?capacity_provider:capacity_provider -> unit -> create_capacity_provider_response

val make_create_managed_instances_provider_configuration :
  ?propagate_tags:propagate_mi_tags ->
  ?infrastructure_optimization:infrastructure_optimization ->
  ?auto_repair_configuration:auto_repair_configuration ->
  infrastructure_role_arn:string_ ->
  instance_launch_template:instance_launch_template ->
  unit ->
  create_managed_instances_provider_configuration

val make_create_capacity_provider_request :
  ?cluster:string_ ->
  ?auto_scaling_group_provider:auto_scaling_group_provider ->
  ?managed_instances_provider:create_managed_instances_provider_configuration ->
  ?tags:tags ->
  name:string_ ->
  unit ->
  create_capacity_provider_request

val make_create_cluster_response : ?cluster:cluster -> unit -> create_cluster_response

val make_create_cluster_request :
  ?cluster_name:string_ ->
  ?tags:tags ->
  ?settings:cluster_settings ->
  ?configuration:cluster_configuration ->
  ?capacity_providers:string_list ->
  ?default_capacity_provider_strategy:capacity_provider_strategy ->
  ?service_connect_defaults:cluster_service_connect_defaults_request ->
  unit ->
  create_cluster_request

val make_create_daemon_response :
  ?daemon_arn:string_ ->
  ?status:daemon_status ->
  ?created_at:timestamp ->
  ?deployment_arn:string_ ->
  unit ->
  create_daemon_response

val make_daemon_alarm_configuration :
  ?alarm_names:string_list -> ?enable:boolean_ -> unit -> daemon_alarm_configuration

val make_daemon_deployment_configuration :
  ?drain_percent:daemon_drain_percent ->
  ?alarms:daemon_alarm_configuration ->
  ?bake_time_in_minutes:integer ->
  unit ->
  daemon_deployment_configuration

val make_create_daemon_request :
  ?cluster_arn:string_ ->
  ?deployment_configuration:daemon_deployment_configuration ->
  ?tags:tags ->
  ?propagate_tags:daemon_propagate_tags ->
  ?enable_ecs_managed_tags:boolean_ ->
  ?enable_execute_command:boolean_ ->
  ?client_token:string_ ->
  daemon_name:string_ ->
  daemon_task_definition_arn:string_ ->
  capacity_provider_arns:string_list ->
  unit ->
  create_daemon_request

val make_ingress_path_summary :
  access_type:access_type -> endpoint:string_ -> unit -> ingress_path_summary

val make_express_gateway_scaling_target :
  ?min_task_count:boxed_integer ->
  ?max_task_count:boxed_integer ->
  ?auto_scaling_metric:express_gateway_service_scaling_metric ->
  ?auto_scaling_target_value:boxed_integer ->
  unit ->
  express_gateway_scaling_target

val make_express_gateway_repository_credentials :
  ?credentials_parameter:string_ -> unit -> express_gateway_repository_credentials

val make_express_gateway_service_aws_logs_configuration :
  log_group:string_ ->
  log_stream_prefix:string_ ->
  unit ->
  express_gateway_service_aws_logs_configuration

val make_express_gateway_container :
  ?container_port:boxed_integer ->
  ?aws_logs_configuration:express_gateway_service_aws_logs_configuration ->
  ?repository_credentials:express_gateway_repository_credentials ->
  ?command:string_list ->
  ?environment:environment_variables ->
  ?secrets:secret_list ->
  image:string_ ->
  unit ->
  express_gateway_container

val make_express_gateway_service_network_configuration :
  ?security_groups:string_list ->
  ?subnets:string_list ->
  unit ->
  express_gateway_service_network_configuration

val make_express_gateway_service_configuration :
  ?service_revision_arn:string_ ->
  ?execution_role_arn:string_ ->
  ?task_role_arn:string_ ->
  ?task_definition_arn:string_ ->
  ?cpu:string_ ->
  ?memory:string_ ->
  ?network_configuration:express_gateway_service_network_configuration ->
  ?health_check_path:string_ ->
  ?primary_container:express_gateway_container ->
  ?scaling_target:express_gateway_scaling_target ->
  ?ingress_paths:ingress_path_summaries ->
  ?created_at:timestamp ->
  unit ->
  express_gateway_service_configuration

val make_express_gateway_service_status :
  ?status_code:express_gateway_service_status_code ->
  ?status_reason:string_ ->
  unit ->
  express_gateway_service_status

val make_ecs_express_gateway_service :
  ?cluster:string_ ->
  ?service_name:string_ ->
  ?service_arn:string_ ->
  ?infrastructure_role_arn:string_ ->
  ?status:express_gateway_service_status ->
  ?current_deployment:string_ ->
  ?active_configurations:express_gateway_service_configurations ->
  ?tags:tags ->
  ?created_at:timestamp ->
  ?updated_at:timestamp ->
  unit ->
  ecs_express_gateway_service

val make_create_express_gateway_service_response :
  ?service:ecs_express_gateway_service -> unit -> create_express_gateway_service_response

val make_create_express_gateway_service_request :
  ?execution_role_arn:string_ ->
  ?service_name:string_ ->
  ?cluster:string_ ->
  ?health_check_path:string_ ->
  ?primary_container:express_gateway_container ->
  ?task_role_arn:string_ ->
  ?network_configuration:express_gateway_service_network_configuration ->
  ?cpu:string_ ->
  ?memory:string_ ->
  ?scaling_target:express_gateway_scaling_target ->
  ?tags:tags ->
  ?task_definition_arn:string_ ->
  infrastructure_role_arn:string_ ->
  unit ->
  create_express_gateway_service_request

val make_deployment_controller : type_:deployment_controller_type -> unit -> deployment_controller

val make_network_configuration :
  ?awsvpc_configuration:aws_vpc_configuration -> unit -> network_configuration

val make_placement_strategy :
  ?type_:placement_strategy_type -> ?field:string_ -> unit -> placement_strategy

val make_placement_constraint :
  ?type_:placement_constraint_type -> ?expression:string_ -> unit -> placement_constraint

val make_service_current_revision_summary :
  ?arn:string_ ->
  ?requested_task_count:integer ->
  ?running_task_count:integer ->
  ?pending_task_count:integer ->
  unit ->
  service_current_revision_summary

val make_service_event :
  ?id:string_ -> ?created_at:timestamp -> ?message:string_ -> unit -> service_event

val make_vpc_lattice_configuration :
  role_arn:iam_role_arn ->
  target_group_arn:string_ ->
  port_name:string_ ->
  unit ->
  vpc_lattice_configuration

val make_deployment_ephemeral_storage : ?kms_key_id:string_ -> unit -> deployment_ephemeral_storage

val make_ebs_tag_specification :
  ?tags:tags ->
  ?propagate_tags:propagate_tags ->
  resource_type:ebs_resource_type ->
  unit ->
  ebs_tag_specification

val make_service_managed_ebs_volume_configuration :
  ?encrypted:boxed_boolean ->
  ?kms_key_id:ebskms_key_id ->
  ?volume_type:ebs_volume_type ->
  ?size_in_gi_b:boxed_integer ->
  ?snapshot_id:ebs_snapshot_id ->
  ?volume_initialization_rate:boxed_integer ->
  ?iops:boxed_integer ->
  ?throughput:boxed_integer ->
  ?tag_specifications:ebs_tag_specifications ->
  ?filesystem_type:task_filesystem_type ->
  role_arn:iam_role_arn ->
  unit ->
  service_managed_ebs_volume_configuration

val make_service_volume_configuration :
  ?managed_ebs_volume:service_managed_ebs_volume_configuration ->
  name:ecs_volume_name ->
  unit ->
  service_volume_configuration

val make_service_connect_service_resource :
  ?discovery_name:string_ -> ?discovery_arn:string_ -> unit -> service_connect_service_resource

val make_service_connect_access_log_configuration :
  ?include_query_parameters:service_connect_include_query_parameters ->
  format:service_connect_access_logging_format ->
  unit ->
  service_connect_access_log_configuration

val make_service_connect_tls_certificate_authority :
  ?aws_pca_authority_arn:string_ -> unit -> service_connect_tls_certificate_authority

val make_service_connect_tls_configuration :
  ?kms_key:string_ ->
  ?role_arn:string_ ->
  issuer_certificate_authority:service_connect_tls_certificate_authority ->
  unit ->
  service_connect_tls_configuration

val make_timeout_configuration :
  ?idle_timeout_seconds:duration ->
  ?per_request_timeout_seconds:duration ->
  unit ->
  timeout_configuration

val make_service_connect_test_traffic_header_match_rules :
  exact:string_ -> unit -> service_connect_test_traffic_header_match_rules

val make_service_connect_test_traffic_header_rules :
  ?value:service_connect_test_traffic_header_match_rules ->
  name:string_ ->
  unit ->
  service_connect_test_traffic_header_rules

val make_service_connect_test_traffic_rules :
  header:service_connect_test_traffic_header_rules -> unit -> service_connect_test_traffic_rules

val make_service_connect_client_alias :
  ?dns_name:string_ ->
  ?test_traffic_rules:service_connect_test_traffic_rules ->
  port:port_number ->
  unit ->
  service_connect_client_alias

val make_service_connect_service :
  ?discovery_name:string_ ->
  ?client_aliases:service_connect_client_alias_list ->
  ?ingress_port_override:port_number ->
  ?timeout:timeout_configuration ->
  ?tls:service_connect_tls_configuration ->
  port_name:string_ ->
  unit ->
  service_connect_service

val make_service_connect_configuration :
  ?namespace:string_ ->
  ?services:service_connect_service_list ->
  ?log_configuration:log_configuration ->
  ?access_log_configuration:service_connect_access_log_configuration ->
  enabled:boolean_ ->
  unit ->
  service_connect_configuration

val make_deployment :
  ?id:string_ ->
  ?status:string_ ->
  ?task_definition:string_ ->
  ?desired_count:integer ->
  ?pending_count:integer ->
  ?running_count:integer ->
  ?failed_tasks:integer ->
  ?created_at:timestamp ->
  ?updated_at:timestamp ->
  ?capacity_provider_strategy:capacity_provider_strategy ->
  ?launch_type:launch_type ->
  ?platform_version:string_ ->
  ?platform_family:string_ ->
  ?network_configuration:network_configuration ->
  ?rollout_state:deployment_rollout_state ->
  ?rollout_state_reason:string_ ->
  ?service_connect_configuration:service_connect_configuration ->
  ?service_connect_resources:service_connect_service_resource_list ->
  ?volume_configurations:service_volume_configurations ->
  ?fargate_ephemeral_storage:deployment_ephemeral_storage ->
  ?vpc_lattice_configurations:vpc_lattice_configurations ->
  unit ->
  deployment

val make_scale : ?value:double -> ?unit_:scale_unit -> unit -> scale

val make_service_registry :
  ?registry_arn:string_ ->
  ?port:boxed_integer ->
  ?container_name:string_ ->
  ?container_port:boxed_integer ->
  unit ->
  service_registry

val make_load_balancer :
  ?target_group_arn:string_ ->
  ?load_balancer_name:string_ ->
  ?container_name:string_ ->
  ?container_port:boxed_integer ->
  ?advanced_configuration:advanced_configuration ->
  unit ->
  load_balancer

val make_task_set :
  ?id:string_ ->
  ?task_set_arn:string_ ->
  ?service_arn:string_ ->
  ?cluster_arn:string_ ->
  ?started_by:string_ ->
  ?external_id:string_ ->
  ?status:string_ ->
  ?task_definition:string_ ->
  ?computed_desired_count:integer ->
  ?pending_count:integer ->
  ?running_count:integer ->
  ?created_at:timestamp ->
  ?updated_at:timestamp ->
  ?launch_type:launch_type ->
  ?capacity_provider_strategy:capacity_provider_strategy ->
  ?platform_version:string_ ->
  ?platform_family:string_ ->
  ?network_configuration:network_configuration ->
  ?load_balancers:load_balancers ->
  ?service_registries:service_registries ->
  ?scale:scale ->
  ?stability_status:stability_status ->
  ?stability_status_at:timestamp ->
  ?tags:tags ->
  ?fargate_ephemeral_storage:deployment_ephemeral_storage ->
  unit ->
  task_set

val make_linear_configuration :
  ?step_percent:double -> ?step_bake_time_in_minutes:integer -> unit -> linear_configuration

val make_deployment_lifecycle_hook_timeout_configuration :
  ?timeout_in_minutes:deployment_lifecycle_hook_duration ->
  ?action:deployment_lifecycle_hook_action ->
  unit ->
  deployment_lifecycle_hook_timeout_configuration

val make_deployment_lifecycle_hook :
  ?target_type:deployment_lifecycle_hook_target_type ->
  ?hook_target_arn:string_ ->
  ?role_arn:iam_role_arn ->
  ?lifecycle_stages:deployment_lifecycle_hook_stage_list ->
  ?hook_details:hook_details ->
  ?timeout_configuration:deployment_lifecycle_hook_timeout_configuration ->
  unit ->
  deployment_lifecycle_hook

val make_deployment_alarms :
  alarm_names:string_list -> rollback:boolean_ -> enable:boolean_ -> unit -> deployment_alarms

val make_threshold_configuration :
  type_:threshold_type -> value:integer -> unit -> threshold_configuration

val make_deployment_circuit_breaker :
  ?reset_on_healthy_task:boxed_boolean ->
  ?threshold_configuration:threshold_configuration ->
  enable:boolean_ ->
  rollback:boolean_ ->
  unit ->
  deployment_circuit_breaker

val make_deployment_configuration :
  ?deployment_circuit_breaker:deployment_circuit_breaker ->
  ?maximum_percent:boxed_integer ->
  ?minimum_healthy_percent:boxed_integer ->
  ?alarms:deployment_alarms ->
  ?strategy:deployment_strategy ->
  ?bake_time_in_minutes:boxed_integer ->
  ?lifecycle_hooks:deployment_lifecycle_hook_list ->
  ?linear_configuration:linear_configuration ->
  ?canary_configuration:canary_configuration ->
  unit ->
  deployment_configuration

val make_service :
  ?service_arn:string_ ->
  ?service_name:string_ ->
  ?cluster_arn:string_ ->
  ?load_balancers:load_balancers ->
  ?service_registries:service_registries ->
  ?status:string_ ->
  ?desired_count:integer ->
  ?running_count:integer ->
  ?pending_count:integer ->
  ?launch_type:launch_type ->
  ?capacity_provider_strategy:capacity_provider_strategy ->
  ?platform_version:string_ ->
  ?platform_family:string_ ->
  ?task_definition:string_ ->
  ?deployment_configuration:deployment_configuration ->
  ?task_sets:task_sets ->
  ?deployments:deployments ->
  ?role_arn:string_ ->
  ?events:service_events ->
  ?created_at:timestamp ->
  ?current_service_deployment:string_ ->
  ?current_service_revisions:service_current_revision_summary_list ->
  ?placement_constraints:placement_constraints ->
  ?placement_strategy:placement_strategies ->
  ?network_configuration:network_configuration ->
  ?health_check_grace_period_seconds:boxed_integer ->
  ?scheduling_strategy:scheduling_strategy ->
  ?deployment_controller:deployment_controller ->
  ?tags:tags ->
  ?created_by:string_ ->
  ?enable_ecs_managed_tags:boolean_ ->
  ?propagate_tags:propagate_tags ->
  ?enable_execute_command:boolean_ ->
  ?availability_zone_rebalancing:availability_zone_rebalancing ->
  ?resource_management_type:resource_management_type ->
  unit ->
  service

val make_create_service_response : ?service:service -> unit -> create_service_response

val make_metric_configuration :
  metric_names:metric_names_list ->
  resolution_seconds:metric_resolution_seconds ->
  unit ->
  metric_configuration

val make_monitoring_configuration :
  ?metric_configurations:metric_configuration_list -> unit -> monitoring_configuration

val make_create_service_request :
  ?cluster:string_ ->
  ?task_definition:string_ ->
  ?availability_zone_rebalancing:availability_zone_rebalancing ->
  ?load_balancers:load_balancers ->
  ?service_registries:service_registries ->
  ?desired_count:boxed_integer ->
  ?client_token:string_ ->
  ?launch_type:launch_type ->
  ?capacity_provider_strategy:capacity_provider_strategy ->
  ?platform_version:string_ ->
  ?role:string_ ->
  ?deployment_configuration:deployment_configuration ->
  ?placement_constraints:placement_constraints ->
  ?placement_strategy:placement_strategies ->
  ?network_configuration:network_configuration ->
  ?health_check_grace_period_seconds:boxed_integer ->
  ?scheduling_strategy:scheduling_strategy ->
  ?deployment_controller:deployment_controller ->
  ?tags:tags ->
  ?enable_ecs_managed_tags:boolean_ ->
  ?propagate_tags:propagate_tags ->
  ?enable_execute_command:boolean_ ->
  ?service_connect_configuration:service_connect_configuration ->
  ?volume_configurations:service_volume_configurations ->
  ?vpc_lattice_configurations:vpc_lattice_configurations ->
  ?monitoring:monitoring_configuration ->
  service_name:string_ ->
  unit ->
  create_service_request

val make_create_task_set_response : ?task_set:task_set -> unit -> create_task_set_response

val make_create_task_set_request :
  ?external_id:string_ ->
  ?network_configuration:network_configuration ->
  ?load_balancers:load_balancers ->
  ?service_registries:service_registries ->
  ?launch_type:launch_type ->
  ?capacity_provider_strategy:capacity_provider_strategy ->
  ?platform_version:string_ ->
  ?scale:scale ->
  ?client_token:string_ ->
  ?tags:tags ->
  service:string_ ->
  cluster:string_ ->
  task_definition:string_ ->
  unit ->
  create_task_set_request

val make_created_at : ?before:timestamp -> ?after:timestamp -> unit -> created_at

val make_daemon_capacity_provider :
  ?arn:string_ -> ?running_count:integer -> unit -> daemon_capacity_provider

val make_daemon_circuit_breaker :
  ?failure_count:integer ->
  ?status:daemon_deployment_rollback_monitors_status ->
  ?threshold:integer ->
  unit ->
  daemon_circuit_breaker

val make_daemon_linux_parameters :
  ?capabilities:kernel_capabilities ->
  ?devices:devices_list ->
  ?init_process_enabled:boxed_boolean ->
  ?tmpfs:tmpfs_list ->
  unit ->
  daemon_linux_parameters

val make_daemon_container_definition :
  ?name:string_ ->
  ?memory:boxed_integer ->
  ?memory_reservation:boxed_integer ->
  ?repository_credentials:repository_credentials ->
  ?health_check:health_check ->
  ?cpu:integer ->
  ?essential:boxed_boolean ->
  ?entry_point:string_list ->
  ?command:string_list ->
  ?working_directory:string_ ->
  ?environment_files:environment_files ->
  ?environment:environment_variables ->
  ?secrets:secret_list ->
  ?readonly_root_filesystem:boxed_boolean ->
  ?mount_points:mount_point_list ->
  ?log_configuration:log_configuration ->
  ?firelens_configuration:firelens_configuration ->
  ?privileged:boxed_boolean ->
  ?user:string_ ->
  ?ulimits:ulimit_list ->
  ?linux_parameters:daemon_linux_parameters ->
  ?depends_on:container_dependencies ->
  ?start_timeout:boxed_integer ->
  ?stop_timeout:boxed_integer ->
  ?system_controls:system_controls ->
  ?interactive:boxed_boolean ->
  ?pseudo_terminal:boxed_boolean ->
  ?restart_policy:container_restart_policy ->
  image:string_ ->
  unit ->
  daemon_container_definition

val make_daemon_container_image :
  ?container_name:string_ ->
  ?image_digest:string_ ->
  ?image:string_ ->
  unit ->
  daemon_container_image

val make_daemon_rollback :
  ?reason:string_ ->
  ?started_at:timestamp ->
  ?rollback_target_daemon_revision_arn:string_ ->
  ?rollback_capacity_providers:string_list ->
  unit ->
  daemon_rollback

val make_daemon_deployment_alarms :
  ?status:daemon_deployment_rollback_monitors_status ->
  ?alarm_names:string_list ->
  ?triggered_alarm_names:string_list ->
  unit ->
  daemon_deployment_alarms

val make_daemon_deployment_capacity_provider :
  ?arn:string_ ->
  ?running_instance_count:boxed_integer ->
  ?draining_instance_count:boxed_integer ->
  unit ->
  daemon_deployment_capacity_provider

val make_daemon_deployment_revision_detail :
  ?arn:string_ ->
  ?capacity_providers:daemon_deployment_capacity_provider_list ->
  ?total_running_instance_count:boxed_integer ->
  ?total_draining_instance_count:boxed_integer ->
  unit ->
  daemon_deployment_revision_detail

val make_daemon_deployment :
  ?daemon_deployment_arn:string_ ->
  ?cluster_arn:string_ ->
  ?status:daemon_deployment_status ->
  ?status_reason:string_ ->
  ?target_daemon_revision:daemon_deployment_revision_detail ->
  ?source_daemon_revisions:daemon_deployment_revision_detail_list ->
  ?circuit_breaker:daemon_circuit_breaker ->
  ?alarms:daemon_deployment_alarms ->
  ?rollback:daemon_rollback ->
  ?deployment_configuration:daemon_deployment_configuration ->
  ?created_at:timestamp ->
  ?started_at:timestamp ->
  ?stopped_at:timestamp ->
  ?finished_at:timestamp ->
  unit ->
  daemon_deployment

val make_daemon_deployment_summary :
  ?daemon_deployment_arn:string_ ->
  ?daemon_arn:string_ ->
  ?cluster_arn:string_ ->
  ?status:daemon_deployment_status ->
  ?status_reason:string_ ->
  ?target_daemon_revision_arn:string_ ->
  ?created_at:timestamp ->
  ?started_at:timestamp ->
  ?stopped_at:timestamp ->
  ?finished_at:timestamp ->
  unit ->
  daemon_deployment_summary

val make_daemon_revision_detail :
  ?arn:string_ ->
  ?capacity_providers:daemon_capacity_provider_list ->
  ?total_running_count:integer ->
  unit ->
  daemon_revision_detail

val make_daemon_detail :
  ?daemon_arn:string_ ->
  ?cluster_arn:string_ ->
  ?status:daemon_status ->
  ?current_revisions:daemon_revision_detail_list ->
  ?deployment_arn:string_ ->
  ?created_at:timestamp ->
  ?updated_at:timestamp ->
  unit ->
  daemon_detail

val make_daemon_revision :
  ?daemon_revision_arn:string_ ->
  ?cluster_arn:string_ ->
  ?daemon_arn:string_ ->
  ?daemon_task_definition_arn:string_ ->
  ?created_at:timestamp ->
  ?container_images:daemon_container_images ->
  ?propagate_tags:daemon_propagate_tags ->
  ?enable_ecs_managed_tags:boxed_boolean ->
  ?enable_execute_command:boxed_boolean ->
  unit ->
  daemon_revision

val make_daemon_summary :
  ?daemon_arn:string_ ->
  ?status:daemon_status ->
  ?created_at:timestamp ->
  ?updated_at:timestamp ->
  unit ->
  daemon_summary

val make_daemon_volume : ?name:string_ -> ?host:host_volume_properties -> unit -> daemon_volume

val make_daemon_task_definition :
  ?daemon_task_definition_arn:string_ ->
  ?family:string_ ->
  ?revision:integer ->
  ?task_role_arn:string_ ->
  ?execution_role_arn:string_ ->
  ?container_definitions:daemon_container_definition_list ->
  ?volumes:daemon_volume_list ->
  ?cpu:string_ ->
  ?memory:string_ ->
  ?status:daemon_task_definition_status ->
  ?registered_at:timestamp ->
  ?delete_requested_at:timestamp ->
  ?registered_by:string_ ->
  ?pid_mode:daemon_pid_mode ->
  ?ipc_mode:daemon_ipc_mode ->
  unit ->
  daemon_task_definition

val make_daemon_task_definition_summary :
  ?arn:string_ ->
  ?registered_at:timestamp ->
  ?registered_by:string_ ->
  ?delete_requested_at:timestamp ->
  ?status:daemon_task_definition_status ->
  unit ->
  daemon_task_definition_summary

val make_delete_attributes_response : ?attributes:attributes -> unit -> delete_attributes_response

val make_delete_attributes_request :
  ?cluster:string_ -> attributes:attributes -> unit -> delete_attributes_request

val make_delete_capacity_provider_response :
  ?capacity_provider:capacity_provider -> unit -> delete_capacity_provider_response

val make_delete_capacity_provider_request :
  ?cluster:string_ -> capacity_provider:string_ -> unit -> delete_capacity_provider_request

val make_delete_cluster_response : ?cluster:cluster -> unit -> delete_cluster_response
val make_delete_cluster_request : cluster:string_ -> unit -> delete_cluster_request

val make_delete_daemon_response :
  ?daemon_arn:string_ ->
  ?status:daemon_status ->
  ?created_at:timestamp ->
  ?updated_at:timestamp ->
  ?deployment_arn:string_ ->
  unit ->
  delete_daemon_response

val make_delete_daemon_request : daemon_arn:string_ -> unit -> delete_daemon_request

val make_delete_daemon_task_definition_response :
  ?daemon_task_definition_arn:string_ -> unit -> delete_daemon_task_definition_response

val make_delete_daemon_task_definition_request :
  daemon_task_definition:string_ -> unit -> delete_daemon_task_definition_request

val make_delete_express_gateway_service_response :
  ?service:ecs_express_gateway_service -> unit -> delete_express_gateway_service_response

val make_delete_express_gateway_service_request :
  service_arn:string_ -> unit -> delete_express_gateway_service_request

val make_delete_service_response : ?service:service -> unit -> delete_service_response

val make_delete_service_request :
  ?cluster:string_ -> ?force:boxed_boolean -> service:string_ -> unit -> delete_service_request

val make_failure : ?arn:string_ -> ?reason:string_ -> ?detail:string_ -> unit -> failure

val make_delete_task_definitions_response :
  ?task_definitions:task_definition_list ->
  ?failures:failures ->
  unit ->
  delete_task_definitions_response

val make_delete_task_definitions_request :
  task_definitions:string_list -> unit -> delete_task_definitions_request

val make_delete_task_set_response : ?task_set:task_set -> unit -> delete_task_set_response

val make_delete_task_set_request :
  ?force:boxed_boolean ->
  cluster:string_ ->
  service:string_ ->
  task_set:string_ ->
  unit ->
  delete_task_set_request

val make_deployment_lifecycle_hook_detail :
  ?hook_id:string_ ->
  ?target_type:deployment_lifecycle_hook_target_type ->
  ?target_arn:string_ ->
  ?status:deployment_lifecycle_hook_status ->
  ?expires_at:timestamp ->
  ?timeout_action:deployment_lifecycle_hook_action ->
  unit ->
  deployment_lifecycle_hook_detail

val make_deregister_container_instance_response :
  ?container_instance:container_instance -> unit -> deregister_container_instance_response

val make_deregister_container_instance_request :
  ?cluster:string_ ->
  ?force:boxed_boolean ->
  container_instance:string_ ->
  unit ->
  deregister_container_instance_request

val make_describe_capacity_providers_response :
  ?capacity_providers:capacity_providers ->
  ?failures:failures ->
  ?next_token:string_ ->
  unit ->
  describe_capacity_providers_response

val make_describe_capacity_providers_request :
  ?capacity_providers:string_list ->
  ?cluster:string_ ->
  ?include_:capacity_provider_field_list ->
  ?max_results:boxed_integer ->
  ?next_token:string_ ->
  unit ->
  describe_capacity_providers_request

val make_describe_clusters_response :
  ?clusters:clusters -> ?failures:failures -> unit -> describe_clusters_response

val make_describe_clusters_request :
  ?clusters:string_list -> ?include_:cluster_field_list -> unit -> describe_clusters_request

val make_describe_container_instances_response :
  ?container_instances:container_instances ->
  ?failures:failures ->
  unit ->
  describe_container_instances_response

val make_describe_container_instances_request :
  ?cluster:string_ ->
  ?include_:container_instance_field_list ->
  container_instances:string_list ->
  unit ->
  describe_container_instances_request

val make_describe_daemon_response : ?daemon:daemon_detail -> unit -> describe_daemon_response
val make_describe_daemon_request : daemon_arn:string_ -> unit -> describe_daemon_request

val make_describe_daemon_deployments_response :
  ?failures:failures ->
  ?daemon_deployments:daemon_deployment_list ->
  unit ->
  describe_daemon_deployments_response

val make_describe_daemon_deployments_request :
  daemon_deployment_arns:string_list -> unit -> describe_daemon_deployments_request

val make_describe_daemon_revisions_response :
  ?daemon_revisions:daemon_revisions ->
  ?failures:failures ->
  unit ->
  describe_daemon_revisions_response

val make_describe_daemon_revisions_request :
  daemon_revision_arns:string_list -> unit -> describe_daemon_revisions_request

val make_describe_daemon_task_definition_response :
  ?daemon_task_definition:daemon_task_definition -> unit -> describe_daemon_task_definition_response

val make_describe_daemon_task_definition_request :
  daemon_task_definition:string_ -> unit -> describe_daemon_task_definition_request

val make_describe_express_gateway_service_response :
  ?service:ecs_express_gateway_service -> unit -> describe_express_gateway_service_response

val make_describe_express_gateway_service_request :
  ?include_:express_gateway_service_include_list ->
  service_arn:string_ ->
  unit ->
  describe_express_gateway_service_request

val make_service_deployment_alarms :
  ?status:service_deployment_rollback_monitors_status ->
  ?alarm_names:string_list ->
  ?triggered_alarm_names:string_list ->
  unit ->
  service_deployment_alarms

val make_service_deployment_circuit_breaker :
  ?status:service_deployment_rollback_monitors_status ->
  ?failure_count:integer ->
  ?threshold:integer ->
  unit ->
  service_deployment_circuit_breaker

val make_rollback :
  ?reason:string_ -> ?started_at:timestamp -> ?service_revision_arn:string_ -> unit -> rollback

val make_service_revision_summary :
  ?arn:string_ ->
  ?requested_task_count:integer ->
  ?running_task_count:integer ->
  ?pending_task_count:integer ->
  ?requested_test_traffic_weight:double ->
  ?requested_production_traffic_weight:double ->
  unit ->
  service_revision_summary

val make_service_deployment :
  ?service_deployment_arn:string_ ->
  ?service_arn:string_ ->
  ?cluster_arn:string_ ->
  ?created_at:timestamp ->
  ?started_at:timestamp ->
  ?finished_at:timestamp ->
  ?stopped_at:timestamp ->
  ?updated_at:timestamp ->
  ?source_service_revisions:service_revisions_summary_list ->
  ?target_service_revision:service_revision_summary ->
  ?status:service_deployment_status ->
  ?status_reason:string_ ->
  ?lifecycle_stage:service_deployment_lifecycle_stage ->
  ?lifecycle_hook_details:deployment_lifecycle_hook_detail_list ->
  ?deployment_configuration:deployment_configuration ->
  ?rollback:rollback ->
  ?deployment_circuit_breaker:service_deployment_circuit_breaker ->
  ?alarms:service_deployment_alarms ->
  unit ->
  service_deployment

val make_describe_service_deployments_response :
  ?service_deployments:service_deployments ->
  ?failures:failures ->
  unit ->
  describe_service_deployments_response

val make_describe_service_deployments_request :
  service_deployment_arns:string_list -> unit -> describe_service_deployments_request

val make_managed_log_group :
  ?arn:string_ ->
  ?status_reason:string_ ->
  status:managed_resource_status ->
  updated_at:timestamp ->
  log_group_name:string_ ->
  unit ->
  managed_log_group

val make_managed_security_group :
  ?arn:string_ ->
  ?status_reason:string_ ->
  status:managed_resource_status ->
  updated_at:timestamp ->
  unit ->
  managed_security_group

val make_managed_metric_alarm :
  ?arn:string_ ->
  ?status_reason:string_ ->
  status:managed_resource_status ->
  updated_at:timestamp ->
  unit ->
  managed_metric_alarm

val make_managed_application_auto_scaling_policy :
  ?arn:string_ ->
  ?status_reason:string_ ->
  status:managed_resource_status ->
  updated_at:timestamp ->
  policy_type:string_ ->
  target_value:double ->
  metric:string_ ->
  unit ->
  managed_application_auto_scaling_policy

val make_managed_scalable_target :
  ?arn:string_ ->
  ?status_reason:string_ ->
  status:managed_resource_status ->
  updated_at:timestamp ->
  min_capacity:integer ->
  max_capacity:integer ->
  unit ->
  managed_scalable_target

val make_managed_auto_scaling :
  ?scalable_target:managed_scalable_target ->
  ?application_auto_scaling_policies:managed_application_auto_scaling_policies ->
  unit ->
  managed_auto_scaling

val make_managed_target_group :
  ?arn:string_ ->
  ?status_reason:string_ ->
  status:managed_resource_status ->
  updated_at:timestamp ->
  health_check_path:string_ ->
  health_check_port:integer ->
  port:integer ->
  unit ->
  managed_target_group

val make_managed_listener_rule :
  ?arn:string_ ->
  ?status_reason:string_ ->
  status:managed_resource_status ->
  updated_at:timestamp ->
  unit ->
  managed_listener_rule

val make_managed_listener :
  ?arn:string_ ->
  ?status_reason:string_ ->
  status:managed_resource_status ->
  updated_at:timestamp ->
  unit ->
  managed_listener

val make_managed_certificate :
  ?arn:string_ ->
  ?status_reason:string_ ->
  status:managed_resource_status ->
  updated_at:timestamp ->
  domain_name:string_ ->
  unit ->
  managed_certificate

val make_managed_load_balancer :
  ?arn:string_ ->
  ?status_reason:string_ ->
  ?subnet_ids:string_list ->
  ?security_group_ids:string_list ->
  status:managed_resource_status ->
  updated_at:timestamp ->
  scheme:string_ ->
  unit ->
  managed_load_balancer

val make_managed_ingress_path :
  ?load_balancer:managed_load_balancer ->
  ?load_balancer_security_groups:managed_security_groups ->
  ?certificate:managed_certificate ->
  ?listener:managed_listener ->
  ?rule:managed_listener_rule ->
  ?target_groups:managed_target_groups ->
  access_type:access_type ->
  endpoint:string_ ->
  unit ->
  managed_ingress_path

val make_ecs_managed_resources :
  ?ingress_paths:managed_ingress_paths ->
  ?auto_scaling:managed_auto_scaling ->
  ?metric_alarms:managed_metric_alarms ->
  ?service_security_groups:managed_security_groups ->
  ?log_groups:managed_log_groups ->
  unit ->
  ecs_managed_resources

val make_service_revision_load_balancer :
  ?target_group_arn:string_ ->
  ?production_listener_rule:string_ ->
  unit ->
  service_revision_load_balancer

val make_resolved_configuration :
  ?load_balancers:service_revision_load_balancers -> unit -> resolved_configuration

val make_service_revision :
  ?service_revision_arn:string_ ->
  ?service_arn:string_ ->
  ?cluster_arn:string_ ->
  ?task_definition:string_ ->
  ?capacity_provider_strategy:capacity_provider_strategy ->
  ?launch_type:launch_type ->
  ?platform_version:string_ ->
  ?platform_family:string_ ->
  ?load_balancers:load_balancers ->
  ?service_registries:service_registries ->
  ?network_configuration:network_configuration ->
  ?container_images:container_images ->
  ?guard_duty_enabled:boolean_ ->
  ?service_connect_configuration:service_connect_configuration ->
  ?volume_configurations:service_volume_configurations ->
  ?fargate_ephemeral_storage:deployment_ephemeral_storage ->
  ?created_at:timestamp ->
  ?vpc_lattice_configurations:vpc_lattice_configurations ->
  ?resolved_configuration:resolved_configuration ->
  ?ecs_managed_resources:ecs_managed_resources ->
  ?monitoring:monitoring_configuration ->
  unit ->
  service_revision

val make_describe_service_revisions_response :
  ?service_revisions:service_revisions ->
  ?failures:failures ->
  unit ->
  describe_service_revisions_response

val make_describe_service_revisions_request :
  service_revision_arns:string_list -> unit -> describe_service_revisions_request

val make_describe_services_response :
  ?services:services -> ?failures:failures -> unit -> describe_services_response

val make_describe_services_request :
  ?cluster:string_ ->
  ?include_:service_field_list ->
  services:string_list ->
  unit ->
  describe_services_request

val make_describe_task_sets_response :
  ?task_sets:task_sets -> ?failures:failures -> unit -> describe_task_sets_response

val make_describe_task_sets_request :
  ?task_sets:string_list ->
  ?include_:task_set_field_list ->
  cluster:string_ ->
  service:string_ ->
  unit ->
  describe_task_sets_request

val make_task_ephemeral_storage :
  ?size_in_gi_b:integer -> ?kms_key_id:string_ -> unit -> task_ephemeral_storage

val make_inference_accelerator_override :
  ?device_name:string_ -> ?device_type:string_ -> unit -> inference_accelerator_override

val make_task_override :
  ?container_overrides:container_overrides ->
  ?cpu:string_ ->
  ?inference_accelerator_overrides:inference_accelerator_overrides ->
  ?execution_role_arn:string_ ->
  ?memory:string_ ->
  ?task_role_arn:string_ ->
  ?ephemeral_storage:ephemeral_storage ->
  unit ->
  task_override

val make_task :
  ?attachments:attachments ->
  ?attributes:attributes ->
  ?availability_zone:string_ ->
  ?capacity_provider_name:string_ ->
  ?cluster_arn:string_ ->
  ?connectivity:connectivity ->
  ?connectivity_at:timestamp ->
  ?container_instance_arn:string_ ->
  ?containers:containers ->
  ?cpu:string_ ->
  ?created_at:timestamp ->
  ?desired_status:string_ ->
  ?enable_execute_command:boolean_ ->
  ?execution_stopped_at:timestamp ->
  ?group:string_ ->
  ?health_status:health_status ->
  ?inference_accelerators:inference_accelerators ->
  ?last_status:string_ ->
  ?launch_type:launch_type ->
  ?memory:string_ ->
  ?overrides:task_override ->
  ?platform_version:string_ ->
  ?platform_family:string_ ->
  ?pull_started_at:timestamp ->
  ?pull_stopped_at:timestamp ->
  ?started_at:timestamp ->
  ?started_by:string_ ->
  ?stop_code:task_stop_code ->
  ?stopped_at:timestamp ->
  ?stopped_reason:string_ ->
  ?stopping_at:timestamp ->
  ?tags:tags ->
  ?task_arn:string_ ->
  ?task_definition_arn:string_ ->
  ?version:long ->
  ?ephemeral_storage:ephemeral_storage ->
  ?fargate_ephemeral_storage:task_ephemeral_storage ->
  unit ->
  task

val make_describe_tasks_response :
  ?tasks:tasks -> ?failures:failures -> unit -> describe_tasks_response

val make_describe_tasks_request :
  ?cluster:string_ ->
  ?include_:task_field_list ->
  tasks:string_list ->
  unit ->
  describe_tasks_request

val make_session :
  ?session_id:string_ -> ?stream_url:string_ -> ?token_value:sensitive_string -> unit -> session

val make_execute_command_response :
  ?cluster_arn:string_ ->
  ?container_arn:string_ ->
  ?container_name:string_ ->
  ?interactive:boolean_ ->
  ?session:session ->
  ?task_arn:string_ ->
  unit ->
  execute_command_response

val make_execute_command_request :
  ?cluster:string_ ->
  ?container:string_ ->
  command:string_ ->
  interactive:boolean_ ->
  task:string_ ->
  unit ->
  execute_command_request

val make_protected_task :
  ?task_arn:string_ ->
  ?protection_enabled:boolean_ ->
  ?expiration_date:timestamp ->
  unit ->
  protected_task

val make_get_task_protection_response :
  ?protected_tasks:protected_tasks -> ?failures:failures -> unit -> get_task_protection_response

val make_get_task_protection_request :
  ?tasks:string_list -> cluster:string_ -> unit -> get_task_protection_request

val make_instance_launch_template_update :
  ?ec2_instance_profile_arn:string_ ->
  ?network_configuration:managed_instances_network_configuration ->
  ?storage_configuration:managed_instances_storage_configuration ->
  ?instance_metadata_tags_propagation:boxed_boolean ->
  ?local_storage_configuration:managed_instances_local_storage_configuration ->
  ?monitoring:managed_instances_monitoring_options ->
  ?instance_requirements:instance_requirements_request ->
  ?capacity_reservations:capacity_reservation_request ->
  unit ->
  instance_launch_template_update

val make_list_attributes_response :
  ?attributes:attributes -> ?next_token:string_ -> unit -> list_attributes_response

val make_list_attributes_request :
  ?cluster:string_ ->
  ?attribute_name:string_ ->
  ?attribute_value:string_ ->
  ?next_token:string_ ->
  ?max_results:boxed_integer ->
  target_type:target_type ->
  unit ->
  list_attributes_request

val make_list_clusters_response :
  ?cluster_arns:string_list -> ?next_token:string_ -> unit -> list_clusters_response

val make_list_clusters_request :
  ?next_token:string_ -> ?max_results:boxed_integer -> unit -> list_clusters_request

val make_list_container_instances_response :
  ?container_instance_arns:string_list ->
  ?next_token:string_ ->
  unit ->
  list_container_instances_response

val make_list_container_instances_request :
  ?cluster:string_ ->
  ?filter:string_ ->
  ?next_token:string_ ->
  ?max_results:boxed_integer ->
  ?status:container_instance_status ->
  unit ->
  list_container_instances_request

val make_list_daemon_deployments_response :
  ?next_token:string_ ->
  ?daemon_deployments:daemon_deployment_summary_list ->
  unit ->
  list_daemon_deployments_response

val make_list_daemon_deployments_request :
  ?status:daemon_deployment_status_list ->
  ?created_at:created_at ->
  ?max_results:boxed_integer ->
  ?next_token:string_ ->
  daemon_arn:string_ ->
  unit ->
  list_daemon_deployments_request

val make_list_daemon_task_definitions_response :
  ?daemon_task_definitions:daemon_task_definition_summaries ->
  ?next_token:string_ ->
  unit ->
  list_daemon_task_definitions_response

val make_list_daemon_task_definitions_request :
  ?family_prefix:string_ ->
  ?family:string_ ->
  ?revision:daemon_task_definition_revision_filter ->
  ?status:daemon_task_definition_status_filter ->
  ?sort:sort_order ->
  ?next_token:string_ ->
  ?max_results:boxed_integer ->
  unit ->
  list_daemon_task_definitions_request

val make_list_daemons_response :
  ?daemon_summaries_list:daemon_summaries_list ->
  ?next_token:string_ ->
  unit ->
  list_daemons_response

val make_list_daemons_request :
  ?cluster_arn:string_ ->
  ?capacity_provider_arns:string_list ->
  ?max_results:boxed_integer ->
  ?next_token:string_ ->
  unit ->
  list_daemons_request

val make_service_deployment_brief :
  ?service_deployment_arn:string_ ->
  ?service_arn:string_ ->
  ?cluster_arn:string_ ->
  ?started_at:timestamp ->
  ?created_at:timestamp ->
  ?finished_at:timestamp ->
  ?target_service_revision_arn:string_ ->
  ?status:service_deployment_status ->
  ?status_reason:string_ ->
  unit ->
  service_deployment_brief

val make_list_service_deployments_response :
  ?service_deployments:service_deployments_brief ->
  ?next_token:string_ ->
  unit ->
  list_service_deployments_response

val make_list_service_deployments_request :
  ?cluster:string_ ->
  ?status:service_deployment_status_list ->
  ?created_at:created_at ->
  ?next_token:string_ ->
  ?max_results:boxed_integer ->
  service:string_ ->
  unit ->
  list_service_deployments_request

val make_list_services_response :
  ?service_arns:string_list -> ?next_token:string_ -> unit -> list_services_response

val make_list_services_request :
  ?cluster:string_ ->
  ?next_token:string_ ->
  ?max_results:boxed_integer ->
  ?launch_type:launch_type ->
  ?scheduling_strategy:scheduling_strategy ->
  ?resource_management_type:resource_management_type ->
  unit ->
  list_services_request

val make_list_task_definitions_response :
  ?task_definition_arns:string_list -> ?next_token:string_ -> unit -> list_task_definitions_response

val make_list_task_definitions_request :
  ?family_prefix:string_ ->
  ?status:task_definition_status ->
  ?sort:sort_order ->
  ?next_token:string_ ->
  ?max_results:boxed_integer ->
  unit ->
  list_task_definitions_request

val make_list_tasks_response :
  ?task_arns:string_list -> ?next_token:string_ -> unit -> list_tasks_response

val make_list_tasks_request :
  ?cluster:string_ ->
  ?container_instance:string_ ->
  ?family:string_ ->
  ?next_token:string_ ->
  ?max_results:boxed_integer ->
  ?started_by:string_ ->
  ?service_name:string_ ->
  ?desired_status:desired_status ->
  ?launch_type:launch_type ->
  ?daemon_name:string_ ->
  unit ->
  list_tasks_request

val make_managed_agent_state_change :
  ?reason:string_ ->
  container_name:string_ ->
  managed_agent_name:managed_agent_name ->
  status:string_ ->
  unit ->
  managed_agent_state_change

val make_platform_device : id:string_ -> type_:platform_device_type -> unit -> platform_device
val make_put_attributes_response : ?attributes:attributes -> unit -> put_attributes_response

val make_put_attributes_request :
  ?cluster:string_ -> attributes:attributes -> unit -> put_attributes_request

val make_put_cluster_capacity_providers_response :
  ?cluster:cluster -> unit -> put_cluster_capacity_providers_response

val make_put_cluster_capacity_providers_request :
  cluster:string_ ->
  capacity_providers:string_list ->
  default_capacity_provider_strategy:capacity_provider_strategy ->
  unit ->
  put_cluster_capacity_providers_request

val make_register_container_instance_response :
  ?container_instance:container_instance -> unit -> register_container_instance_response

val make_register_container_instance_request :
  ?cluster:string_ ->
  ?instance_identity_document:string_ ->
  ?instance_identity_document_signature:string_ ->
  ?total_resources:resources ->
  ?version_info:version_info ->
  ?container_instance_arn:string_ ->
  ?attributes:attributes ->
  ?platform_devices:platform_devices ->
  ?tags:tags ->
  unit ->
  register_container_instance_request

val make_register_daemon_task_definition_response :
  ?daemon_task_definition_arn:string_ -> unit -> register_daemon_task_definition_response

val make_register_daemon_task_definition_request :
  ?task_role_arn:string_ ->
  ?execution_role_arn:string_ ->
  ?cpu:string_ ->
  ?memory:string_ ->
  ?volumes:daemon_volume_list ->
  ?tags:tags ->
  ?pid_mode:daemon_pid_mode ->
  ?ipc_mode:daemon_ipc_mode ->
  family:string_ ->
  container_definitions:daemon_container_definition_list ->
  unit ->
  register_daemon_task_definition_request

val make_register_task_definition_response :
  ?task_definition:task_definition -> ?tags:tags -> unit -> register_task_definition_response

val make_register_task_definition_request :
  ?task_role_arn:string_ ->
  ?execution_role_arn:string_ ->
  ?network_mode:network_mode ->
  ?volumes:volume_list ->
  ?placement_constraints:task_definition_placement_constraints ->
  ?requires_compatibilities:compatibility_list ->
  ?cpu:string_ ->
  ?memory:string_ ->
  ?tags:tags ->
  ?pid_mode:pid_mode ->
  ?ipc_mode:ipc_mode ->
  ?proxy_configuration:proxy_configuration ->
  ?inference_accelerators:inference_accelerators ->
  ?ephemeral_storage:ephemeral_storage ->
  ?runtime_platform:runtime_platform ->
  ?enable_fault_injection:boxed_boolean ->
  family:string_ ->
  container_definitions:container_definitions ->
  unit ->
  register_task_definition_request

val make_run_task_response : ?tasks:tasks -> ?failures:failures -> unit -> run_task_response

val make_task_managed_ebs_volume_termination_policy :
  delete_on_termination:boxed_boolean -> unit -> task_managed_ebs_volume_termination_policy

val make_task_managed_ebs_volume_configuration :
  ?encrypted:boxed_boolean ->
  ?kms_key_id:ebskms_key_id ->
  ?volume_type:ebs_volume_type ->
  ?size_in_gi_b:boxed_integer ->
  ?snapshot_id:ebs_snapshot_id ->
  ?volume_initialization_rate:boxed_integer ->
  ?iops:boxed_integer ->
  ?throughput:boxed_integer ->
  ?tag_specifications:ebs_tag_specifications ->
  ?termination_policy:task_managed_ebs_volume_termination_policy ->
  ?filesystem_type:task_filesystem_type ->
  role_arn:iam_role_arn ->
  unit ->
  task_managed_ebs_volume_configuration

val make_task_volume_configuration :
  ?managed_ebs_volume:task_managed_ebs_volume_configuration ->
  name:ecs_volume_name ->
  unit ->
  task_volume_configuration

val make_run_task_request :
  ?capacity_provider_strategy:capacity_provider_strategy ->
  ?cluster:string_ ->
  ?count:boxed_integer ->
  ?enable_ecs_managed_tags:boolean_ ->
  ?enable_execute_command:boolean_ ->
  ?group:string_ ->
  ?launch_type:launch_type ->
  ?network_configuration:network_configuration ->
  ?overrides:task_override ->
  ?placement_constraints:placement_constraints ->
  ?placement_strategy:placement_strategies ->
  ?platform_version:string_ ->
  ?propagate_tags:propagate_tags ->
  ?reference_id:string_ ->
  ?started_by:string_ ->
  ?tags:tags ->
  ?client_token:string_ ->
  ?volume_configurations:task_volume_configurations ->
  task_definition:string_ ->
  unit ->
  run_task_request

val make_start_task_response : ?tasks:tasks -> ?failures:failures -> unit -> start_task_response

val make_start_task_request :
  ?cluster:string_ ->
  ?enable_ecs_managed_tags:boolean_ ->
  ?enable_execute_command:boolean_ ->
  ?group:string_ ->
  ?network_configuration:network_configuration ->
  ?overrides:task_override ->
  ?propagate_tags:propagate_tags ->
  ?reference_id:string_ ->
  ?started_by:string_ ->
  ?tags:tags ->
  ?volume_configurations:task_volume_configurations ->
  container_instances:string_list ->
  task_definition:string_ ->
  unit ->
  start_task_request

val make_stop_service_deployment_response :
  ?service_deployment_arn:string_ -> unit -> stop_service_deployment_response

val make_stop_service_deployment_request :
  ?stop_type:stop_service_deployment_stop_type ->
  service_deployment_arn:string_ ->
  unit ->
  stop_service_deployment_request

val make_stop_task_response : ?task:task -> unit -> stop_task_response

val make_stop_task_request :
  ?cluster:string_ -> ?reason:string_ -> task:string_ -> unit -> stop_task_request

val make_submit_attachment_state_changes_response :
  ?acknowledgment:string_ -> unit -> submit_attachment_state_changes_response

val make_submit_attachment_state_changes_request :
  ?cluster:string_ ->
  attachments:attachment_state_changes ->
  unit ->
  submit_attachment_state_changes_request

val make_submit_container_state_change_response :
  ?acknowledgment:string_ -> unit -> submit_container_state_change_response

val make_submit_container_state_change_request :
  ?cluster:string_ ->
  ?task:string_ ->
  ?container_name:string_ ->
  ?runtime_id:string_ ->
  ?status:string_ ->
  ?exit_code:boxed_integer ->
  ?reason:string_ ->
  ?network_bindings:network_bindings ->
  unit ->
  submit_container_state_change_request

val make_submit_task_state_change_response :
  ?acknowledgment:string_ -> unit -> submit_task_state_change_response

val make_submit_task_state_change_request :
  ?cluster:string_ ->
  ?task:string_ ->
  ?status:string_ ->
  ?reason:string_ ->
  ?containers:container_state_changes ->
  ?attachments:attachment_state_changes ->
  ?managed_agents:managed_agent_state_changes ->
  ?pull_started_at:timestamp ->
  ?pull_stopped_at:timestamp ->
  ?execution_stopped_at:timestamp ->
  unit ->
  submit_task_state_change_request

val make_update_capacity_provider_response :
  ?capacity_provider:capacity_provider -> unit -> update_capacity_provider_response

val make_update_managed_instances_provider_configuration :
  ?propagate_tags:propagate_mi_tags ->
  ?infrastructure_optimization:infrastructure_optimization ->
  ?auto_repair_configuration:auto_repair_configuration ->
  infrastructure_role_arn:string_ ->
  instance_launch_template:instance_launch_template_update ->
  unit ->
  update_managed_instances_provider_configuration

val make_update_capacity_provider_request :
  ?cluster:string_ ->
  ?auto_scaling_group_provider:auto_scaling_group_provider_update ->
  ?managed_instances_provider:update_managed_instances_provider_configuration ->
  name:string_ ->
  unit ->
  update_capacity_provider_request

val make_update_cluster_response : ?cluster:cluster -> unit -> update_cluster_response

val make_update_cluster_request :
  ?settings:cluster_settings ->
  ?configuration:cluster_configuration ->
  ?service_connect_defaults:cluster_service_connect_defaults_request ->
  cluster:string_ ->
  unit ->
  update_cluster_request

val make_update_cluster_settings_response :
  ?cluster:cluster -> unit -> update_cluster_settings_response

val make_update_cluster_settings_request :
  cluster:string_ -> settings:cluster_settings -> unit -> update_cluster_settings_request

val make_update_container_agent_response :
  ?container_instance:container_instance -> unit -> update_container_agent_response

val make_update_container_agent_request :
  ?cluster:string_ -> container_instance:string_ -> unit -> update_container_agent_request

val make_update_container_instances_state_response :
  ?container_instances:container_instances ->
  ?failures:failures ->
  unit ->
  update_container_instances_state_response

val make_update_container_instances_state_request :
  ?cluster:string_ ->
  container_instances:string_list ->
  status:container_instance_status ->
  unit ->
  update_container_instances_state_request

val make_update_daemon_response :
  ?daemon_arn:string_ ->
  ?status:daemon_status ->
  ?created_at:timestamp ->
  ?updated_at:timestamp ->
  ?deployment_arn:string_ ->
  unit ->
  update_daemon_response

val make_update_daemon_request :
  ?deployment_configuration:daemon_deployment_configuration ->
  ?propagate_tags:daemon_propagate_tags ->
  ?enable_ecs_managed_tags:boolean_ ->
  ?enable_execute_command:boolean_ ->
  daemon_arn:string_ ->
  daemon_task_definition_arn:string_ ->
  capacity_provider_arns:string_list ->
  unit ->
  update_daemon_request

val make_updated_express_gateway_service :
  ?service_arn:string_ ->
  ?cluster:string_ ->
  ?service_name:string_ ->
  ?status:express_gateway_service_status ->
  ?target_configuration:express_gateway_service_configuration ->
  ?created_at:timestamp ->
  ?updated_at:timestamp ->
  unit ->
  updated_express_gateway_service

val make_update_express_gateway_service_response :
  ?service:updated_express_gateway_service -> unit -> update_express_gateway_service_response

val make_update_express_gateway_service_request :
  ?execution_role_arn:string_ ->
  ?health_check_path:string_ ->
  ?primary_container:express_gateway_container ->
  ?task_role_arn:string_ ->
  ?network_configuration:express_gateway_service_network_configuration ->
  ?cpu:string_ ->
  ?memory:string_ ->
  ?scaling_target:express_gateway_scaling_target ->
  ?task_definition_arn:string_ ->
  service_arn:string_ ->
  unit ->
  update_express_gateway_service_request

val make_update_service_response : ?service:service -> unit -> update_service_response

val make_update_service_request :
  ?cluster:string_ ->
  ?desired_count:boxed_integer ->
  ?task_definition:string_ ->
  ?capacity_provider_strategy:capacity_provider_strategy ->
  ?deployment_configuration:deployment_configuration ->
  ?availability_zone_rebalancing:availability_zone_rebalancing ->
  ?network_configuration:network_configuration ->
  ?placement_constraints:placement_constraints ->
  ?placement_strategy:placement_strategies ->
  ?platform_version:string_ ->
  ?force_new_deployment:boolean_ ->
  ?health_check_grace_period_seconds:boxed_integer ->
  ?deployment_controller:deployment_controller ->
  ?enable_execute_command:boxed_boolean ->
  ?enable_ecs_managed_tags:boxed_boolean ->
  ?load_balancers:load_balancers ->
  ?propagate_tags:propagate_tags ->
  ?service_registries:service_registries ->
  ?service_connect_configuration:service_connect_configuration ->
  ?volume_configurations:service_volume_configurations ->
  ?vpc_lattice_configurations:vpc_lattice_configurations ->
  ?monitoring:monitoring_configuration ->
  service:string_ ->
  unit ->
  update_service_request

val make_update_service_primary_task_set_response :
  ?task_set:task_set -> unit -> update_service_primary_task_set_response

val make_update_service_primary_task_set_request :
  cluster:string_ ->
  service:string_ ->
  primary_task_set:string_ ->
  unit ->
  update_service_primary_task_set_request

val make_update_task_protection_response :
  ?protected_tasks:protected_tasks -> ?failures:failures -> unit -> update_task_protection_response

val make_update_task_protection_request :
  ?expires_in_minutes:boxed_integer ->
  cluster:string_ ->
  tasks:string_list ->
  protection_enabled:boolean_ ->
  unit ->
  update_task_protection_request

val make_update_task_set_response : ?task_set:task_set -> unit -> update_task_set_response

val make_update_task_set_request :
  cluster:string_ ->
  service:string_ ->
  task_set:string_ ->
  scale:scale ->
  unit ->
  update_task_set_request
