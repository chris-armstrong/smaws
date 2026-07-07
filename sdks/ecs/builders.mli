open Types

val make_vpc_lattice_configuration :
  port_name:string_ ->
  target_group_arn:string_ ->
  role_arn:iam_role_arn ->
  unit ->
  vpc_lattice_configuration

val make_host_volume_properties : ?source_path:string_ -> unit -> host_volume_properties

val make_docker_volume_configuration :
  ?labels:string_map ->
  ?driver_opts:string_map ->
  ?driver:string_ ->
  ?autoprovision:boxed_boolean ->
  ?scope:scope ->
  unit ->
  docker_volume_configuration

val make_efs_authorization_config :
  ?iam:efs_authorization_config_ia_m -> ?access_point_id:string_ -> unit -> efs_authorization_config

val make_efs_volume_configuration :
  ?authorization_config:efs_authorization_config ->
  ?transit_encryption_port:boxed_integer ->
  ?transit_encryption:efs_transit_encryption ->
  ?root_directory:string_ ->
  file_system_id:string_ ->
  unit ->
  efs_volume_configuration

val make_s3_files_volume_configuration :
  ?access_point_arn:string_ ->
  ?transit_encryption_port:boxed_integer ->
  ?root_directory:string_ ->
  file_system_arn:string_ ->
  unit ->
  s3_files_volume_configuration

val make_f_sx_windows_file_server_authorization_config :
  domain:string_ ->
  credentials_parameter:string_ ->
  unit ->
  f_sx_windows_file_server_authorization_config

val make_f_sx_windows_file_server_volume_configuration :
  authorization_config:f_sx_windows_file_server_authorization_config ->
  root_directory:string_ ->
  file_system_id:string_ ->
  unit ->
  f_sx_windows_file_server_volume_configuration

val make_volume :
  ?configured_at_launch:boxed_boolean ->
  ?fsx_windows_file_server_volume_configuration:f_sx_windows_file_server_volume_configuration ->
  ?s3files_volume_configuration:s3_files_volume_configuration ->
  ?efs_volume_configuration:efs_volume_configuration ->
  ?docker_volume_configuration:docker_volume_configuration ->
  ?host:host_volume_properties ->
  ?name:string_ ->
  unit ->
  volume

val make_volume_from : ?read_only:boxed_boolean -> ?source_container:string_ -> unit -> volume_from

val make_version_info :
  ?docker_version:string_ -> ?agent_hash:string_ -> ?agent_version:string_ -> unit -> version_info

val make_v_cpu_count_range_request :
  ?max:boxed_integer -> min:boxed_integer -> unit -> v_cpu_count_range_request

val make_express_gateway_service_status :
  ?status_reason:string_ ->
  ?status_code:express_gateway_service_status_code ->
  unit ->
  express_gateway_service_status

val make_express_gateway_service_network_configuration :
  ?subnets:string_list ->
  ?security_groups:string_list ->
  unit ->
  express_gateway_service_network_configuration

val make_express_gateway_service_aws_logs_configuration :
  log_stream_prefix:string_ ->
  log_group:string_ ->
  unit ->
  express_gateway_service_aws_logs_configuration

val make_express_gateway_repository_credentials :
  ?credentials_parameter:string_ -> unit -> express_gateway_repository_credentials

val make_key_value_pair : ?value:string_ -> ?name:string_ -> unit -> key_value_pair
val make_secret : value_from:string_ -> name:string_ -> unit -> secret

val make_express_gateway_container :
  ?secrets:secret_list ->
  ?environment:environment_variables ->
  ?command:string_list ->
  ?repository_credentials:express_gateway_repository_credentials ->
  ?aws_logs_configuration:express_gateway_service_aws_logs_configuration ->
  ?container_port:boxed_integer ->
  image:string_ ->
  unit ->
  express_gateway_container

val make_express_gateway_scaling_target :
  ?auto_scaling_target_value:boxed_integer ->
  ?auto_scaling_metric:express_gateway_service_scaling_metric ->
  ?max_task_count:boxed_integer ->
  ?min_task_count:boxed_integer ->
  unit ->
  express_gateway_scaling_target

val make_ingress_path_summary :
  endpoint:string_ -> access_type:access_type -> unit -> ingress_path_summary

val make_express_gateway_service_configuration :
  ?created_at:timestamp ->
  ?ingress_paths:ingress_path_summaries ->
  ?scaling_target:express_gateway_scaling_target ->
  ?primary_container:express_gateway_container ->
  ?health_check_path:string_ ->
  ?network_configuration:express_gateway_service_network_configuration ->
  ?memory:string_ ->
  ?cpu:string_ ->
  ?task_definition_arn:string_ ->
  ?task_role_arn:string_ ->
  ?execution_role_arn:string_ ->
  ?service_revision_arn:string_ ->
  unit ->
  express_gateway_service_configuration

val make_updated_express_gateway_service :
  ?updated_at:timestamp ->
  ?created_at:timestamp ->
  ?target_configuration:express_gateway_service_configuration ->
  ?status:express_gateway_service_status ->
  ?service_name:string_ ->
  ?cluster:string_ ->
  ?service_arn:string_ ->
  unit ->
  updated_express_gateway_service

val make_capacity_provider_strategy_item :
  ?base:capacity_provider_strategy_item_base ->
  ?weight:capacity_provider_strategy_item_weight ->
  capacity_provider:string_ ->
  unit ->
  capacity_provider_strategy_item

val make_aws_vpc_configuration :
  ?assign_public_ip:assign_public_ip ->
  ?security_groups:string_list ->
  subnets:string_list ->
  unit ->
  aws_vpc_configuration

val make_network_configuration :
  ?awsvpc_configuration:aws_vpc_configuration -> unit -> network_configuration

val make_advanced_configuration :
  ?role_arn:string_ ->
  ?test_listener_rule:string_ ->
  ?production_listener_rule:string_ ->
  ?alternate_target_group_arn:string_ ->
  unit ->
  advanced_configuration

val make_load_balancer :
  ?advanced_configuration:advanced_configuration ->
  ?container_port:boxed_integer ->
  ?container_name:string_ ->
  ?load_balancer_name:string_ ->
  ?target_group_arn:string_ ->
  unit ->
  load_balancer

val make_service_registry :
  ?container_port:boxed_integer ->
  ?container_name:string_ ->
  ?port:boxed_integer ->
  ?registry_arn:string_ ->
  unit ->
  service_registry

val make_scale : ?unit_:scale_unit -> ?value:double -> unit -> scale
val make_tag : ?value:tag_value -> ?key:tag_key -> unit -> tag
val make_deployment_ephemeral_storage : ?kms_key_id:string_ -> unit -> deployment_ephemeral_storage

val make_task_set :
  ?fargate_ephemeral_storage:deployment_ephemeral_storage ->
  ?tags:tags ->
  ?stability_status_at:timestamp ->
  ?stability_status:stability_status ->
  ?scale:scale ->
  ?service_registries:service_registries ->
  ?load_balancers:load_balancers ->
  ?network_configuration:network_configuration ->
  ?platform_family:string_ ->
  ?platform_version:string_ ->
  ?capacity_provider_strategy:capacity_provider_strategy ->
  ?launch_type:launch_type ->
  ?updated_at:timestamp ->
  ?created_at:timestamp ->
  ?running_count:integer ->
  ?pending_count:integer ->
  ?computed_desired_count:integer ->
  ?task_definition:string_ ->
  ?status:string_ ->
  ?external_id:string_ ->
  ?started_by:string_ ->
  ?cluster_arn:string_ ->
  ?service_arn:string_ ->
  ?task_set_arn:string_ ->
  ?id:string_ ->
  unit ->
  task_set

val make_update_task_set_response : ?task_set:task_set -> unit -> update_task_set_response

val make_update_task_set_request :
  scale:scale ->
  task_set:string_ ->
  service:string_ ->
  cluster:string_ ->
  unit ->
  update_task_set_request

val make_protected_task :
  ?expiration_date:timestamp ->
  ?protection_enabled:boolean_ ->
  ?task_arn:string_ ->
  unit ->
  protected_task

val make_failure : ?detail:string_ -> ?reason:string_ -> ?arn:string_ -> unit -> failure

val make_update_task_protection_response :
  ?failures:failures -> ?protected_tasks:protected_tasks -> unit -> update_task_protection_response

val make_update_task_protection_request :
  ?expires_in_minutes:boxed_integer ->
  protection_enabled:boolean_ ->
  tasks:string_list ->
  cluster:string_ ->
  unit ->
  update_task_protection_request

val make_threshold_configuration :
  value:integer -> type_:threshold_type -> unit -> threshold_configuration

val make_deployment_circuit_breaker :
  ?threshold_configuration:threshold_configuration ->
  ?reset_on_healthy_task:boxed_boolean ->
  rollback:boolean_ ->
  enable:boolean_ ->
  unit ->
  deployment_circuit_breaker

val make_deployment_alarms :
  enable:boolean_ -> rollback:boolean_ -> alarm_names:string_list -> unit -> deployment_alarms

val make_deployment_lifecycle_hook_timeout_configuration :
  ?action:deployment_lifecycle_hook_action ->
  ?timeout_in_minutes:deployment_lifecycle_hook_duration ->
  unit ->
  deployment_lifecycle_hook_timeout_configuration

val make_deployment_lifecycle_hook :
  ?timeout_configuration:deployment_lifecycle_hook_timeout_configuration ->
  ?hook_details:hook_details ->
  ?lifecycle_stages:deployment_lifecycle_hook_stage_list ->
  ?role_arn:iam_role_arn ->
  ?hook_target_arn:string_ ->
  ?target_type:deployment_lifecycle_hook_target_type ->
  unit ->
  deployment_lifecycle_hook

val make_linear_configuration :
  ?step_bake_time_in_minutes:integer -> ?step_percent:double -> unit -> linear_configuration

val make_canary_configuration :
  ?canary_bake_time_in_minutes:integer -> ?canary_percent:double -> unit -> canary_configuration

val make_deployment_configuration :
  ?canary_configuration:canary_configuration ->
  ?linear_configuration:linear_configuration ->
  ?lifecycle_hooks:deployment_lifecycle_hook_list ->
  ?bake_time_in_minutes:boxed_integer ->
  ?strategy:deployment_strategy ->
  ?alarms:deployment_alarms ->
  ?minimum_healthy_percent:boxed_integer ->
  ?maximum_percent:boxed_integer ->
  ?deployment_circuit_breaker:deployment_circuit_breaker ->
  unit ->
  deployment_configuration

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
  ?test_traffic_rules:service_connect_test_traffic_rules ->
  ?dns_name:string_ ->
  port:port_number ->
  unit ->
  service_connect_client_alias

val make_timeout_configuration :
  ?per_request_timeout_seconds:duration ->
  ?idle_timeout_seconds:duration ->
  unit ->
  timeout_configuration

val make_service_connect_tls_certificate_authority :
  ?aws_pca_authority_arn:string_ -> unit -> service_connect_tls_certificate_authority

val make_service_connect_tls_configuration :
  ?role_arn:string_ ->
  ?kms_key:string_ ->
  issuer_certificate_authority:service_connect_tls_certificate_authority ->
  unit ->
  service_connect_tls_configuration

val make_service_connect_service :
  ?tls:service_connect_tls_configuration ->
  ?timeout:timeout_configuration ->
  ?ingress_port_override:port_number ->
  ?client_aliases:service_connect_client_alias_list ->
  ?discovery_name:string_ ->
  port_name:string_ ->
  unit ->
  service_connect_service

val make_log_configuration :
  ?secret_options:secret_list ->
  ?options:log_configuration_options_map ->
  log_driver:log_driver ->
  unit ->
  log_configuration

val make_service_connect_access_log_configuration :
  ?include_query_parameters:service_connect_include_query_parameters ->
  format:service_connect_access_logging_format ->
  unit ->
  service_connect_access_log_configuration

val make_service_connect_configuration :
  ?access_log_configuration:service_connect_access_log_configuration ->
  ?log_configuration:log_configuration ->
  ?services:service_connect_service_list ->
  ?namespace:string_ ->
  enabled:boolean_ ->
  unit ->
  service_connect_configuration

val make_service_connect_service_resource :
  ?discovery_arn:string_ -> ?discovery_name:string_ -> unit -> service_connect_service_resource

val make_ebs_tag_specification :
  ?propagate_tags:propagate_tags ->
  ?tags:tags ->
  resource_type:ebs_resource_type ->
  unit ->
  ebs_tag_specification

val make_service_managed_ebs_volume_configuration :
  ?filesystem_type:task_filesystem_type ->
  ?tag_specifications:ebs_tag_specifications ->
  ?throughput:boxed_integer ->
  ?iops:boxed_integer ->
  ?volume_initialization_rate:boxed_integer ->
  ?snapshot_id:ebs_snapshot_id ->
  ?size_in_gi_b:boxed_integer ->
  ?volume_type:ebs_volume_type ->
  ?kms_key_id:ebskms_key_id ->
  ?encrypted:boxed_boolean ->
  role_arn:iam_role_arn ->
  unit ->
  service_managed_ebs_volume_configuration

val make_service_volume_configuration :
  ?managed_ebs_volume:service_managed_ebs_volume_configuration ->
  name:ecs_volume_name ->
  unit ->
  service_volume_configuration

val make_deployment :
  ?vpc_lattice_configurations:vpc_lattice_configurations ->
  ?fargate_ephemeral_storage:deployment_ephemeral_storage ->
  ?volume_configurations:service_volume_configurations ->
  ?service_connect_resources:service_connect_service_resource_list ->
  ?service_connect_configuration:service_connect_configuration ->
  ?rollout_state_reason:string_ ->
  ?rollout_state:deployment_rollout_state ->
  ?network_configuration:network_configuration ->
  ?platform_family:string_ ->
  ?platform_version:string_ ->
  ?launch_type:launch_type ->
  ?capacity_provider_strategy:capacity_provider_strategy ->
  ?updated_at:timestamp ->
  ?created_at:timestamp ->
  ?failed_tasks:integer ->
  ?running_count:integer ->
  ?pending_count:integer ->
  ?desired_count:integer ->
  ?task_definition:string_ ->
  ?status:string_ ->
  ?id:string_ ->
  unit ->
  deployment

val make_service_event :
  ?message:string_ -> ?created_at:timestamp -> ?id:string_ -> unit -> service_event

val make_service_current_revision_summary :
  ?pending_task_count:integer ->
  ?running_task_count:integer ->
  ?requested_task_count:integer ->
  ?arn:string_ ->
  unit ->
  service_current_revision_summary

val make_placement_constraint :
  ?expression:string_ -> ?type_:placement_constraint_type -> unit -> placement_constraint

val make_placement_strategy :
  ?field:string_ -> ?type_:placement_strategy_type -> unit -> placement_strategy

val make_deployment_controller : type_:deployment_controller_type -> unit -> deployment_controller

val make_service :
  ?resource_management_type:resource_management_type ->
  ?availability_zone_rebalancing:availability_zone_rebalancing ->
  ?enable_execute_command:boolean_ ->
  ?propagate_tags:propagate_tags ->
  ?enable_ecs_managed_tags:boolean_ ->
  ?created_by:string_ ->
  ?tags:tags ->
  ?deployment_controller:deployment_controller ->
  ?scheduling_strategy:scheduling_strategy ->
  ?health_check_grace_period_seconds:boxed_integer ->
  ?network_configuration:network_configuration ->
  ?placement_strategy:placement_strategies ->
  ?placement_constraints:placement_constraints ->
  ?current_service_revisions:service_current_revision_summary_list ->
  ?current_service_deployment:string_ ->
  ?created_at:timestamp ->
  ?events:service_events ->
  ?role_arn:string_ ->
  ?deployments:deployments ->
  ?task_sets:task_sets ->
  ?deployment_configuration:deployment_configuration ->
  ?task_definition:string_ ->
  ?platform_family:string_ ->
  ?platform_version:string_ ->
  ?capacity_provider_strategy:capacity_provider_strategy ->
  ?launch_type:launch_type ->
  ?pending_count:integer ->
  ?running_count:integer ->
  ?desired_count:integer ->
  ?status:string_ ->
  ?service_registries:service_registries ->
  ?load_balancers:load_balancers ->
  ?cluster_arn:string_ ->
  ?service_name:string_ ->
  ?service_arn:string_ ->
  unit ->
  service

val make_update_service_response : ?service:service -> unit -> update_service_response

val make_metric_configuration :
  resolution_seconds:metric_resolution_seconds ->
  metric_names:metric_names_list ->
  unit ->
  metric_configuration

val make_monitoring_configuration :
  ?metric_configurations:metric_configuration_list -> unit -> monitoring_configuration

val make_update_service_request :
  ?monitoring:monitoring_configuration ->
  ?vpc_lattice_configurations:vpc_lattice_configurations ->
  ?volume_configurations:service_volume_configurations ->
  ?service_connect_configuration:service_connect_configuration ->
  ?service_registries:service_registries ->
  ?propagate_tags:propagate_tags ->
  ?load_balancers:load_balancers ->
  ?enable_ecs_managed_tags:boxed_boolean ->
  ?enable_execute_command:boxed_boolean ->
  ?deployment_controller:deployment_controller ->
  ?health_check_grace_period_seconds:boxed_integer ->
  ?force_new_deployment:boolean_ ->
  ?platform_version:string_ ->
  ?placement_strategy:placement_strategies ->
  ?placement_constraints:placement_constraints ->
  ?network_configuration:network_configuration ->
  ?availability_zone_rebalancing:availability_zone_rebalancing ->
  ?deployment_configuration:deployment_configuration ->
  ?capacity_provider_strategy:capacity_provider_strategy ->
  ?task_definition:string_ ->
  ?desired_count:boxed_integer ->
  ?cluster:string_ ->
  service:string_ ->
  unit ->
  update_service_request

val make_update_service_primary_task_set_response :
  ?task_set:task_set -> unit -> update_service_primary_task_set_response

val make_update_service_primary_task_set_request :
  primary_task_set:string_ ->
  service:string_ ->
  cluster:string_ ->
  unit ->
  update_service_primary_task_set_request

val make_managed_instances_network_configuration :
  ?security_groups:string_list ->
  ?subnets:string_list ->
  unit ->
  managed_instances_network_configuration

val make_managed_instances_storage_configuration :
  ?storage_size_gi_b:task_volume_storage_gi_b -> unit -> managed_instances_storage_configuration

val make_managed_instances_local_storage_configuration :
  ?use_local_storage:boolean_ -> unit -> managed_instances_local_storage_configuration

val make_memory_mi_b_request :
  ?max:boxed_integer -> min:boxed_integer -> unit -> memory_mi_b_request

val make_memory_gi_b_per_v_cpu_request :
  ?max:boxed_double -> ?min:boxed_double -> unit -> memory_gi_b_per_v_cpu_request

val make_network_interface_count_request :
  ?max:boxed_integer -> ?min:boxed_integer -> unit -> network_interface_count_request

val make_total_local_storage_gb_request :
  ?max:boxed_double -> ?min:boxed_double -> unit -> total_local_storage_gb_request

val make_baseline_ebs_bandwidth_mbps_request :
  ?max:boxed_integer -> ?min:boxed_integer -> unit -> baseline_ebs_bandwidth_mbps_request

val make_accelerator_count_request :
  ?max:boxed_integer -> ?min:boxed_integer -> unit -> accelerator_count_request

val make_accelerator_total_memory_mi_b_request :
  ?max:boxed_integer -> ?min:boxed_integer -> unit -> accelerator_total_memory_mi_b_request

val make_network_bandwidth_gbps_request :
  ?max:boxed_double -> ?min:boxed_double -> unit -> network_bandwidth_gbps_request

val make_instance_requirements_request :
  ?max_spot_price_as_percentage_of_optimal_on_demand_price:boxed_integer ->
  ?allowed_instance_types:allowed_instance_type_set ->
  ?network_bandwidth_gbps:network_bandwidth_gbps_request ->
  ?accelerator_total_memory_mi_b:accelerator_total_memory_mi_b_request ->
  ?accelerator_names:accelerator_name_set ->
  ?accelerator_manufacturers:accelerator_manufacturer_set ->
  ?accelerator_count:accelerator_count_request ->
  ?accelerator_types:accelerator_type_set ->
  ?baseline_ebs_bandwidth_mbps:baseline_ebs_bandwidth_mbps_request ->
  ?total_local_storage_g_b:total_local_storage_gb_request ->
  ?local_storage_types:local_storage_type_set ->
  ?local_storage:local_storage ->
  ?network_interface_count:network_interface_count_request ->
  ?require_hibernate_support:boxed_boolean ->
  ?burstable_performance:burstable_performance ->
  ?bare_metal:bare_metal ->
  ?on_demand_max_price_percentage_over_lowest_price:boxed_integer ->
  ?spot_max_price_percentage_over_lowest_price:boxed_integer ->
  ?instance_generations:instance_generation_set ->
  ?excluded_instance_types:excluded_instance_type_set ->
  ?memory_gi_b_per_v_cpu:memory_gi_b_per_v_cpu_request ->
  ?cpu_manufacturers:cpu_manufacturer_set ->
  memory_mi_b:memory_mi_b_request ->
  v_cpu_count:v_cpu_count_range_request ->
  unit ->
  instance_requirements_request

val make_capacity_reservation_request :
  ?reservation_preference:capacity_reservation_preference ->
  ?reservation_group_arn:string_ ->
  unit ->
  capacity_reservation_request

val make_instance_launch_template_update :
  ?capacity_reservations:capacity_reservation_request ->
  ?instance_requirements:instance_requirements_request ->
  ?monitoring:managed_instances_monitoring_options ->
  ?local_storage_configuration:managed_instances_local_storage_configuration ->
  ?instance_metadata_tags_propagation:boxed_boolean ->
  ?storage_configuration:managed_instances_storage_configuration ->
  ?network_configuration:managed_instances_network_configuration ->
  ?ec2_instance_profile_arn:string_ ->
  unit ->
  instance_launch_template_update

val make_infrastructure_optimization :
  ?scale_in_after:boxed_integer -> unit -> infrastructure_optimization

val make_auto_repair_configuration :
  ?actions_status:auto_repair_actions_status -> unit -> auto_repair_configuration

val make_update_managed_instances_provider_configuration :
  ?auto_repair_configuration:auto_repair_configuration ->
  ?infrastructure_optimization:infrastructure_optimization ->
  ?propagate_tags:propagate_mi_tags ->
  instance_launch_template:instance_launch_template_update ->
  infrastructure_role_arn:string_ ->
  unit ->
  update_managed_instances_provider_configuration

val make_update_express_gateway_service_response :
  ?service:updated_express_gateway_service -> unit -> update_express_gateway_service_response

val make_update_express_gateway_service_request :
  ?task_definition_arn:string_ ->
  ?scaling_target:express_gateway_scaling_target ->
  ?memory:string_ ->
  ?cpu:string_ ->
  ?network_configuration:express_gateway_service_network_configuration ->
  ?task_role_arn:string_ ->
  ?primary_container:express_gateway_container ->
  ?health_check_path:string_ ->
  ?execution_role_arn:string_ ->
  service_arn:string_ ->
  unit ->
  update_express_gateway_service_request

val make_update_daemon_response :
  ?deployment_arn:string_ ->
  ?updated_at:timestamp ->
  ?created_at:timestamp ->
  ?status:daemon_status ->
  ?daemon_arn:string_ ->
  unit ->
  update_daemon_response

val make_daemon_alarm_configuration :
  ?enable:boolean_ -> ?alarm_names:string_list -> unit -> daemon_alarm_configuration

val make_daemon_deployment_configuration :
  ?bake_time_in_minutes:integer ->
  ?alarms:daemon_alarm_configuration ->
  ?drain_percent:daemon_drain_percent ->
  unit ->
  daemon_deployment_configuration

val make_update_daemon_request :
  ?enable_execute_command:boolean_ ->
  ?enable_ecs_managed_tags:boolean_ ->
  ?propagate_tags:daemon_propagate_tags ->
  ?deployment_configuration:daemon_deployment_configuration ->
  capacity_provider_arns:string_list ->
  daemon_task_definition_arn:string_ ->
  daemon_arn:string_ ->
  unit ->
  update_daemon_request

val make_resource :
  ?string_set_value:string_list ->
  ?integer_value:integer ->
  ?long_value:long ->
  ?double_value:double ->
  ?type_:string_ ->
  ?name:string_ ->
  unit ->
  resource

val make_attribute :
  ?target_id:string_ ->
  ?target_type:target_type ->
  ?value:string_ ->
  name:string_ ->
  unit ->
  attribute

val make_attachment :
  ?details:attachment_details ->
  ?status:string_ ->
  ?type_:string_ ->
  ?id:string_ ->
  unit ->
  attachment

val make_container_instance_health_status :
  ?details:instance_health_check_result_list ->
  ?overall_status:instance_health_check_state ->
  unit ->
  container_instance_health_status

val make_container_instance :
  ?health_status:container_instance_health_status ->
  ?tags:tags ->
  ?attachments:attachments ->
  ?registered_at:timestamp ->
  ?attributes:attributes ->
  ?agent_update_status:agent_update_status ->
  ?pending_tasks_count:integer ->
  ?running_tasks_count:integer ->
  ?agent_connected:boolean_ ->
  ?status_reason:string_ ->
  ?status:string_ ->
  ?registered_resources:resources ->
  ?remaining_resources:resources ->
  ?version_info:version_info ->
  ?version:long ->
  ?capacity_provider_name:string_ ->
  ?ec2_instance_id:string_ ->
  ?container_instance_arn:string_ ->
  unit ->
  container_instance

val make_update_container_instances_state_response :
  ?failures:failures ->
  ?container_instances:container_instances ->
  unit ->
  update_container_instances_state_response

val make_update_container_instances_state_request :
  ?cluster:string_ ->
  status:container_instance_status ->
  container_instances:string_list ->
  unit ->
  update_container_instances_state_request

val make_update_container_agent_response :
  ?container_instance:container_instance -> unit -> update_container_agent_response

val make_update_container_agent_request :
  ?cluster:string_ -> container_instance:string_ -> unit -> update_container_agent_request

val make_execute_command_log_configuration :
  ?s3_key_prefix:string_ ->
  ?s3_encryption_enabled:boolean_ ->
  ?s3_bucket_name:string_ ->
  ?cloud_watch_encryption_enabled:boolean_ ->
  ?cloud_watch_log_group_name:string_ ->
  unit ->
  execute_command_log_configuration

val make_execute_command_configuration :
  ?log_configuration:execute_command_log_configuration ->
  ?logging:execute_command_logging ->
  ?kms_key_id:string_ ->
  unit ->
  execute_command_configuration

val make_managed_storage_configuration :
  ?fargate_ephemeral_storage_kms_key_id:string_ ->
  ?kms_key_id:string_ ->
  unit ->
  managed_storage_configuration

val make_cluster_configuration :
  ?managed_storage_configuration:managed_storage_configuration ->
  ?execute_command_configuration:execute_command_configuration ->
  unit ->
  cluster_configuration

val make_cluster_setting : ?value:string_ -> ?name:cluster_setting_name -> unit -> cluster_setting

val make_cluster_service_connect_defaults :
  ?namespace:string_ -> unit -> cluster_service_connect_defaults

val make_cluster :
  ?service_connect_defaults:cluster_service_connect_defaults ->
  ?attachments_status:string_ ->
  ?attachments:attachments ->
  ?default_capacity_provider_strategy:capacity_provider_strategy ->
  ?capacity_providers:string_list ->
  ?settings:cluster_settings ->
  ?tags:tags ->
  ?statistics:statistics ->
  ?active_services_count:integer ->
  ?pending_tasks_count:integer ->
  ?running_tasks_count:integer ->
  ?registered_container_instances_count:integer ->
  ?status:string_ ->
  ?configuration:cluster_configuration ->
  ?cluster_name:string_ ->
  ?cluster_arn:string_ ->
  unit ->
  cluster

val make_update_cluster_settings_response :
  ?cluster:cluster -> unit -> update_cluster_settings_response

val make_update_cluster_settings_request :
  settings:cluster_settings -> cluster:string_ -> unit -> update_cluster_settings_request

val make_update_cluster_response : ?cluster:cluster -> unit -> update_cluster_response

val make_cluster_service_connect_defaults_request :
  namespace:string_ -> unit -> cluster_service_connect_defaults_request

val make_update_cluster_request :
  ?service_connect_defaults:cluster_service_connect_defaults_request ->
  ?configuration:cluster_configuration ->
  ?settings:cluster_settings ->
  cluster:string_ ->
  unit ->
  update_cluster_request

val make_managed_scaling :
  ?instance_warmup_period:managed_scaling_instance_warmup_period ->
  ?maximum_scaling_step_size:managed_scaling_step_size ->
  ?minimum_scaling_step_size:managed_scaling_step_size ->
  ?target_capacity:managed_scaling_target_capacity ->
  ?status:managed_scaling_status ->
  unit ->
  managed_scaling

val make_auto_scaling_group_provider :
  ?managed_draining:managed_draining ->
  ?managed_termination_protection:managed_termination_protection ->
  ?managed_scaling:managed_scaling ->
  auto_scaling_group_arn:string_ ->
  unit ->
  auto_scaling_group_provider

val make_instance_launch_template :
  ?capacity_reservations:capacity_reservation_request ->
  ?fips_enabled:boxed_boolean ->
  ?instance_requirements:instance_requirements_request ->
  ?instance_metadata_tags_propagation:boxed_boolean ->
  ?capacity_option_type:capacity_option_type ->
  ?monitoring:managed_instances_monitoring_options ->
  ?local_storage_configuration:managed_instances_local_storage_configuration ->
  ?storage_configuration:managed_instances_storage_configuration ->
  network_configuration:managed_instances_network_configuration ->
  ec2_instance_profile_arn:string_ ->
  unit ->
  instance_launch_template

val make_managed_instances_provider :
  ?auto_repair_configuration:auto_repair_configuration ->
  ?infrastructure_optimization:infrastructure_optimization ->
  ?propagate_tags:propagate_mi_tags ->
  ?instance_launch_template:instance_launch_template ->
  ?infrastructure_role_arn:string_ ->
  unit ->
  managed_instances_provider

val make_capacity_provider :
  ?type_:capacity_provider_type ->
  ?tags:tags ->
  ?update_status_reason:string_ ->
  ?update_status:capacity_provider_update_status ->
  ?managed_instances_provider:managed_instances_provider ->
  ?auto_scaling_group_provider:auto_scaling_group_provider ->
  ?status:capacity_provider_status ->
  ?cluster:string_ ->
  ?name:string_ ->
  ?capacity_provider_arn:string_ ->
  unit ->
  capacity_provider

val make_update_capacity_provider_response :
  ?capacity_provider:capacity_provider -> unit -> update_capacity_provider_response

val make_auto_scaling_group_provider_update :
  ?managed_draining:managed_draining ->
  ?managed_termination_protection:managed_termination_protection ->
  ?managed_scaling:managed_scaling ->
  unit ->
  auto_scaling_group_provider_update

val make_update_capacity_provider_request :
  ?managed_instances_provider:update_managed_instances_provider_configuration ->
  ?auto_scaling_group_provider:auto_scaling_group_provider_update ->
  ?cluster:string_ ->
  name:string_ ->
  unit ->
  update_capacity_provider_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_keys -> resource_arn:string_ -> unit -> untag_resource_request

val make_ulimit : hard_limit:integer -> soft_limit:integer -> name:ulimit_name -> unit -> ulimit

val make_tmpfs :
  ?mount_options:string_list -> size:integer -> container_path:string_ -> unit -> tmpfs

val make_network_binding :
  ?host_port_range:string_ ->
  ?container_port_range:string_ ->
  ?protocol:transport_protocol ->
  ?host_port:boxed_integer ->
  ?container_port:boxed_integer ->
  ?bind_i_p:string_ ->
  unit ->
  network_binding

val make_network_interface :
  ?ipv6_address:string_ ->
  ?private_ipv4_address:string_ ->
  ?attachment_id:string_ ->
  unit ->
  network_interface

val make_managed_agent :
  ?last_status:string_ ->
  ?reason:string_ ->
  ?name:managed_agent_name ->
  ?last_started_at:timestamp ->
  unit ->
  managed_agent

val make_container :
  ?neuron_device_ids:neuron_device_ids ->
  ?gpu_ids:gpu_ids ->
  ?memory_reservation:string_ ->
  ?memory:string_ ->
  ?cpu:string_ ->
  ?managed_agents:managed_agents ->
  ?health_status:health_status ->
  ?network_interfaces:network_interfaces ->
  ?network_bindings:network_bindings ->
  ?reason:string_ ->
  ?exit_code:boxed_integer ->
  ?last_status:string_ ->
  ?runtime_id:string_ ->
  ?image_digest:string_ ->
  ?image:string_ ->
  ?name:string_ ->
  ?task_arn:string_ ->
  ?container_arn:string_ ->
  unit ->
  container

val make_inference_accelerator :
  device_type:string_ -> device_name:string_ -> unit -> inference_accelerator

val make_environment_file : type_:environment_file_type -> value:string_ -> unit -> environment_file
val make_resource_requirement : type_:resource_type -> value:string_ -> unit -> resource_requirement

val make_container_override :
  ?resource_requirements:resource_requirements ->
  ?memory_reservation:boxed_integer ->
  ?memory:boxed_integer ->
  ?cpu:boxed_integer ->
  ?environment_files:environment_files ->
  ?environment:environment_variables ->
  ?command:string_list ->
  ?name:string_ ->
  unit ->
  container_override

val make_inference_accelerator_override :
  ?device_type:string_ -> ?device_name:string_ -> unit -> inference_accelerator_override

val make_ephemeral_storage : size_in_gi_b:integer -> unit -> ephemeral_storage

val make_task_override :
  ?ephemeral_storage:ephemeral_storage ->
  ?task_role_arn:string_ ->
  ?memory:string_ ->
  ?execution_role_arn:string_ ->
  ?inference_accelerator_overrides:inference_accelerator_overrides ->
  ?cpu:string_ ->
  ?container_overrides:container_overrides ->
  unit ->
  task_override

val make_task_ephemeral_storage :
  ?kms_key_id:string_ -> ?size_in_gi_b:integer -> unit -> task_ephemeral_storage

val make_task :
  ?fargate_ephemeral_storage:task_ephemeral_storage ->
  ?ephemeral_storage:ephemeral_storage ->
  ?version:long ->
  ?task_definition_arn:string_ ->
  ?task_arn:string_ ->
  ?tags:tags ->
  ?stopping_at:timestamp ->
  ?stopped_reason:string_ ->
  ?stopped_at:timestamp ->
  ?stop_code:task_stop_code ->
  ?started_by:string_ ->
  ?started_at:timestamp ->
  ?pull_stopped_at:timestamp ->
  ?pull_started_at:timestamp ->
  ?platform_family:string_ ->
  ?platform_version:string_ ->
  ?overrides:task_override ->
  ?memory:string_ ->
  ?launch_type:launch_type ->
  ?last_status:string_ ->
  ?inference_accelerators:inference_accelerators ->
  ?health_status:health_status ->
  ?group:string_ ->
  ?execution_stopped_at:timestamp ->
  ?enable_execute_command:boolean_ ->
  ?desired_status:string_ ->
  ?created_at:timestamp ->
  ?cpu:string_ ->
  ?containers:containers ->
  ?container_instance_arn:string_ ->
  ?connectivity_at:timestamp ->
  ?connectivity:connectivity ->
  ?cluster_arn:string_ ->
  ?capacity_provider_name:string_ ->
  ?availability_zone:string_ ->
  ?attributes:attributes ->
  ?attachments:attachments ->
  unit ->
  task

val make_task_managed_ebs_volume_termination_policy :
  delete_on_termination:boxed_boolean -> unit -> task_managed_ebs_volume_termination_policy

val make_task_managed_ebs_volume_configuration :
  ?filesystem_type:task_filesystem_type ->
  ?termination_policy:task_managed_ebs_volume_termination_policy ->
  ?tag_specifications:ebs_tag_specifications ->
  ?throughput:boxed_integer ->
  ?iops:boxed_integer ->
  ?volume_initialization_rate:boxed_integer ->
  ?snapshot_id:ebs_snapshot_id ->
  ?size_in_gi_b:boxed_integer ->
  ?volume_type:ebs_volume_type ->
  ?kms_key_id:ebskms_key_id ->
  ?encrypted:boxed_boolean ->
  role_arn:iam_role_arn ->
  unit ->
  task_managed_ebs_volume_configuration

val make_task_volume_configuration :
  ?managed_ebs_volume:task_managed_ebs_volume_configuration ->
  name:ecs_volume_name ->
  unit ->
  task_volume_configuration

val make_task_definition_placement_constraint :
  ?expression:string_ ->
  ?type_:task_definition_placement_constraint_type ->
  unit ->
  task_definition_placement_constraint

val make_repository_credentials : credentials_parameter:string_ -> unit -> repository_credentials

val make_port_mapping :
  ?container_port_range:string_ ->
  ?app_protocol:application_protocol ->
  ?name:string_ ->
  ?protocol:transport_protocol ->
  ?host_port:boxed_integer ->
  ?container_port:boxed_integer ->
  unit ->
  port_mapping

val make_container_restart_policy :
  ?restart_attempt_period:boxed_integer ->
  ?ignored_exit_codes:integer_list ->
  enabled:boxed_boolean ->
  unit ->
  container_restart_policy

val make_mount_point :
  ?read_only:boxed_boolean ->
  ?container_path:string_ ->
  ?source_volume:string_ ->
  unit ->
  mount_point

val make_kernel_capabilities : ?drop:string_list -> ?add:string_list -> unit -> kernel_capabilities

val make_device :
  ?permissions:device_cgroup_permissions ->
  ?container_path:string_ ->
  host_path:string_ ->
  unit ->
  device

val make_linux_parameters :
  ?swappiness:boxed_integer ->
  ?max_swap:boxed_integer ->
  ?tmpfs:tmpfs_list ->
  ?shared_memory_size:boxed_integer ->
  ?init_process_enabled:boxed_boolean ->
  ?devices:devices_list ->
  ?capabilities:kernel_capabilities ->
  unit ->
  linux_parameters

val make_container_dependency :
  condition:container_condition -> container_name:string_ -> unit -> container_dependency

val make_host_entry : ip_address:string_ -> hostname:string_ -> unit -> host_entry

val make_health_check :
  ?start_period:boxed_integer ->
  ?retries:boxed_integer ->
  ?timeout:boxed_integer ->
  ?interval:boxed_integer ->
  command:string_list ->
  unit ->
  health_check

val make_system_control : ?value:string_ -> ?namespace:string_ -> unit -> system_control

val make_firelens_configuration :
  ?options:firelens_configuration_options_map ->
  type_:firelens_configuration_type ->
  unit ->
  firelens_configuration

val make_container_definition :
  ?credential_specs:string_list ->
  ?firelens_configuration:firelens_configuration ->
  ?resource_requirements:resource_requirements ->
  ?system_controls:system_controls ->
  ?health_check:health_check ->
  ?log_configuration:log_configuration ->
  ?ulimits:ulimit_list ->
  ?docker_labels:docker_labels_map ->
  ?pseudo_terminal:boxed_boolean ->
  ?interactive:boxed_boolean ->
  ?docker_security_options:string_list ->
  ?extra_hosts:host_entry_list ->
  ?dns_search_domains:string_list ->
  ?dns_servers:string_list ->
  ?readonly_root_filesystem:boxed_boolean ->
  ?privileged:boxed_boolean ->
  ?disable_networking:boxed_boolean ->
  ?working_directory:string_ ->
  ?user:string_ ->
  ?hostname:string_ ->
  ?version_consistency:version_consistency ->
  ?stop_timeout:boxed_integer ->
  ?start_timeout:boxed_integer ->
  ?depends_on:container_dependencies ->
  ?secrets:secret_list ->
  ?linux_parameters:linux_parameters ->
  ?volumes_from:volume_from_list ->
  ?mount_points:mount_point_list ->
  ?environment_files:environment_files ->
  ?environment:environment_variables ->
  ?command:string_list ->
  ?entry_point:string_list ->
  ?restart_policy:container_restart_policy ->
  ?essential:boxed_boolean ->
  ?port_mappings:port_mapping_list ->
  ?links:string_list ->
  ?memory_reservation:boxed_integer ->
  ?memory:boxed_integer ->
  ?cpu:integer ->
  ?repository_credentials:repository_credentials ->
  ?image:string_ ->
  ?name:string_ ->
  unit ->
  container_definition

val make_runtime_platform :
  ?operating_system_family:os_family ->
  ?cpu_architecture:cpu_architecture ->
  unit ->
  runtime_platform

val make_proxy_configuration :
  ?properties:proxy_configuration_properties ->
  ?type_:proxy_configuration_type ->
  container_name:string_ ->
  unit ->
  proxy_configuration

val make_task_definition :
  ?enable_fault_injection:boxed_boolean ->
  ?ephemeral_storage:ephemeral_storage ->
  ?registered_by:string_ ->
  ?delete_requested_at:timestamp ->
  ?deregistered_at:timestamp ->
  ?registered_at:timestamp ->
  ?proxy_configuration:proxy_configuration ->
  ?ipc_mode:ipc_mode ->
  ?pid_mode:pid_mode ->
  ?inference_accelerators:inference_accelerators ->
  ?memory:string_ ->
  ?cpu:string_ ->
  ?requires_compatibilities:compatibility_list ->
  ?runtime_platform:runtime_platform ->
  ?compatibilities:compatibility_list ->
  ?placement_constraints:task_definition_placement_constraints ->
  ?requires_attributes:requires_attributes ->
  ?status:task_definition_status ->
  ?volumes:volume_list ->
  ?revision:integer ->
  ?network_mode:network_mode ->
  ?execution_role_arn:string_ ->
  ?task_role_arn:string_ ->
  ?family:string_ ->
  ?container_definitions:container_definitions ->
  ?task_definition_arn:string_ ->
  unit ->
  task_definition

val make_tag_resource_response : unit -> unit
val make_tag_resource_request : tags:tags -> resource_arn:string_ -> unit -> tag_resource_request

val make_submit_task_state_change_response :
  ?acknowledgment:string_ -> unit -> submit_task_state_change_response

val make_container_state_change :
  ?status:string_ ->
  ?reason:string_ ->
  ?network_bindings:network_bindings ->
  ?exit_code:boxed_integer ->
  ?runtime_id:string_ ->
  ?image_digest:string_ ->
  ?container_name:string_ ->
  unit ->
  container_state_change

val make_attachment_state_change :
  status:string_ -> attachment_arn:string_ -> unit -> attachment_state_change

val make_managed_agent_state_change :
  ?reason:string_ ->
  status:string_ ->
  managed_agent_name:managed_agent_name ->
  container_name:string_ ->
  unit ->
  managed_agent_state_change

val make_submit_task_state_change_request :
  ?execution_stopped_at:timestamp ->
  ?pull_stopped_at:timestamp ->
  ?pull_started_at:timestamp ->
  ?managed_agents:managed_agent_state_changes ->
  ?attachments:attachment_state_changes ->
  ?containers:container_state_changes ->
  ?reason:string_ ->
  ?status:string_ ->
  ?task:string_ ->
  ?cluster:string_ ->
  unit ->
  submit_task_state_change_request

val make_submit_container_state_change_response :
  ?acknowledgment:string_ -> unit -> submit_container_state_change_response

val make_submit_container_state_change_request :
  ?network_bindings:network_bindings ->
  ?reason:string_ ->
  ?exit_code:boxed_integer ->
  ?status:string_ ->
  ?runtime_id:string_ ->
  ?container_name:string_ ->
  ?task:string_ ->
  ?cluster:string_ ->
  unit ->
  submit_container_state_change_request

val make_submit_attachment_state_changes_response :
  ?acknowledgment:string_ -> unit -> submit_attachment_state_changes_response

val make_submit_attachment_state_changes_request :
  ?cluster:string_ ->
  attachments:attachment_state_changes ->
  unit ->
  submit_attachment_state_changes_request

val make_stop_task_response : ?task:task -> unit -> stop_task_response

val make_stop_task_request :
  ?reason:string_ -> ?cluster:string_ -> task:string_ -> unit -> stop_task_request

val make_stop_service_deployment_response :
  ?service_deployment_arn:string_ -> unit -> stop_service_deployment_response

val make_stop_service_deployment_request :
  ?stop_type:stop_service_deployment_stop_type ->
  service_deployment_arn:string_ ->
  unit ->
  stop_service_deployment_request

val make_start_task_response : ?failures:failures -> ?tasks:tasks -> unit -> start_task_response

val make_start_task_request :
  ?volume_configurations:task_volume_configurations ->
  ?tags:tags ->
  ?started_by:string_ ->
  ?reference_id:string_ ->
  ?propagate_tags:propagate_tags ->
  ?overrides:task_override ->
  ?network_configuration:network_configuration ->
  ?group:string_ ->
  ?enable_execute_command:boolean_ ->
  ?enable_ecs_managed_tags:boolean_ ->
  ?cluster:string_ ->
  task_definition:string_ ->
  container_instances:string_list ->
  unit ->
  start_task_request

val make_setting :
  ?type_:setting_type ->
  ?principal_arn:string_ ->
  ?value:string_ ->
  ?name:setting_name ->
  unit ->
  setting

val make_session :
  ?token_value:sensitive_string -> ?stream_url:string_ -> ?session_id:string_ -> unit -> session

val make_service_revision_summary :
  ?requested_production_traffic_weight:double ->
  ?requested_test_traffic_weight:double ->
  ?pending_task_count:integer ->
  ?running_task_count:integer ->
  ?requested_task_count:integer ->
  ?arn:string_ ->
  unit ->
  service_revision_summary

val make_container_image :
  ?image:string_ -> ?image_digest:string_ -> ?container_name:string_ -> unit -> container_image

val make_service_revision_load_balancer :
  ?production_listener_rule:string_ ->
  ?target_group_arn:string_ ->
  unit ->
  service_revision_load_balancer

val make_resolved_configuration :
  ?load_balancers:service_revision_load_balancers -> unit -> resolved_configuration

val make_managed_load_balancer :
  ?security_group_ids:string_list ->
  ?subnet_ids:string_list ->
  ?status_reason:string_ ->
  ?arn:string_ ->
  scheme:string_ ->
  updated_at:timestamp ->
  status:managed_resource_status ->
  unit ->
  managed_load_balancer

val make_managed_security_group :
  ?status_reason:string_ ->
  ?arn:string_ ->
  updated_at:timestamp ->
  status:managed_resource_status ->
  unit ->
  managed_security_group

val make_managed_certificate :
  ?status_reason:string_ ->
  ?arn:string_ ->
  domain_name:string_ ->
  updated_at:timestamp ->
  status:managed_resource_status ->
  unit ->
  managed_certificate

val make_managed_listener :
  ?status_reason:string_ ->
  ?arn:string_ ->
  updated_at:timestamp ->
  status:managed_resource_status ->
  unit ->
  managed_listener

val make_managed_listener_rule :
  ?status_reason:string_ ->
  ?arn:string_ ->
  updated_at:timestamp ->
  status:managed_resource_status ->
  unit ->
  managed_listener_rule

val make_managed_target_group :
  ?status_reason:string_ ->
  ?arn:string_ ->
  port:integer ->
  health_check_port:integer ->
  health_check_path:string_ ->
  updated_at:timestamp ->
  status:managed_resource_status ->
  unit ->
  managed_target_group

val make_managed_ingress_path :
  ?target_groups:managed_target_groups ->
  ?rule:managed_listener_rule ->
  ?listener:managed_listener ->
  ?certificate:managed_certificate ->
  ?load_balancer_security_groups:managed_security_groups ->
  ?load_balancer:managed_load_balancer ->
  endpoint:string_ ->
  access_type:access_type ->
  unit ->
  managed_ingress_path

val make_managed_scalable_target :
  ?status_reason:string_ ->
  ?arn:string_ ->
  max_capacity:integer ->
  min_capacity:integer ->
  updated_at:timestamp ->
  status:managed_resource_status ->
  unit ->
  managed_scalable_target

val make_managed_application_auto_scaling_policy :
  ?status_reason:string_ ->
  ?arn:string_ ->
  metric:string_ ->
  target_value:double ->
  policy_type:string_ ->
  updated_at:timestamp ->
  status:managed_resource_status ->
  unit ->
  managed_application_auto_scaling_policy

val make_managed_auto_scaling :
  ?application_auto_scaling_policies:managed_application_auto_scaling_policies ->
  ?scalable_target:managed_scalable_target ->
  unit ->
  managed_auto_scaling

val make_managed_metric_alarm :
  ?status_reason:string_ ->
  ?arn:string_ ->
  updated_at:timestamp ->
  status:managed_resource_status ->
  unit ->
  managed_metric_alarm

val make_managed_log_group :
  ?status_reason:string_ ->
  ?arn:string_ ->
  log_group_name:string_ ->
  updated_at:timestamp ->
  status:managed_resource_status ->
  unit ->
  managed_log_group

val make_ecs_managed_resources :
  ?log_groups:managed_log_groups ->
  ?service_security_groups:managed_security_groups ->
  ?metric_alarms:managed_metric_alarms ->
  ?auto_scaling:managed_auto_scaling ->
  ?ingress_paths:managed_ingress_paths ->
  unit ->
  ecs_managed_resources

val make_service_revision :
  ?monitoring:monitoring_configuration ->
  ?ecs_managed_resources:ecs_managed_resources ->
  ?resolved_configuration:resolved_configuration ->
  ?vpc_lattice_configurations:vpc_lattice_configurations ->
  ?created_at:timestamp ->
  ?fargate_ephemeral_storage:deployment_ephemeral_storage ->
  ?volume_configurations:service_volume_configurations ->
  ?service_connect_configuration:service_connect_configuration ->
  ?guard_duty_enabled:boolean_ ->
  ?container_images:container_images ->
  ?network_configuration:network_configuration ->
  ?service_registries:service_registries ->
  ?load_balancers:load_balancers ->
  ?platform_family:string_ ->
  ?platform_version:string_ ->
  ?launch_type:launch_type ->
  ?capacity_provider_strategy:capacity_provider_strategy ->
  ?task_definition:string_ ->
  ?cluster_arn:string_ ->
  ?service_arn:string_ ->
  ?service_revision_arn:string_ ->
  unit ->
  service_revision

val make_service_deployment_brief :
  ?status_reason:string_ ->
  ?status:service_deployment_status ->
  ?target_service_revision_arn:string_ ->
  ?finished_at:timestamp ->
  ?created_at:timestamp ->
  ?started_at:timestamp ->
  ?cluster_arn:string_ ->
  ?service_arn:string_ ->
  ?service_deployment_arn:string_ ->
  unit ->
  service_deployment_brief

val make_deployment_lifecycle_hook_detail :
  ?timeout_action:deployment_lifecycle_hook_action ->
  ?expires_at:timestamp ->
  ?status:deployment_lifecycle_hook_status ->
  ?target_arn:string_ ->
  ?target_type:deployment_lifecycle_hook_target_type ->
  ?hook_id:string_ ->
  unit ->
  deployment_lifecycle_hook_detail

val make_rollback :
  ?service_revision_arn:string_ -> ?started_at:timestamp -> ?reason:string_ -> unit -> rollback

val make_service_deployment_circuit_breaker :
  ?threshold:integer ->
  ?failure_count:integer ->
  ?status:service_deployment_rollback_monitors_status ->
  unit ->
  service_deployment_circuit_breaker

val make_service_deployment_alarms :
  ?triggered_alarm_names:string_list ->
  ?alarm_names:string_list ->
  ?status:service_deployment_rollback_monitors_status ->
  unit ->
  service_deployment_alarms

val make_service_deployment :
  ?alarms:service_deployment_alarms ->
  ?deployment_circuit_breaker:service_deployment_circuit_breaker ->
  ?rollback:rollback ->
  ?deployment_configuration:deployment_configuration ->
  ?lifecycle_hook_details:deployment_lifecycle_hook_detail_list ->
  ?lifecycle_stage:service_deployment_lifecycle_stage ->
  ?status_reason:string_ ->
  ?status:service_deployment_status ->
  ?target_service_revision:service_revision_summary ->
  ?source_service_revisions:service_revisions_summary_list ->
  ?updated_at:timestamp ->
  ?stopped_at:timestamp ->
  ?finished_at:timestamp ->
  ?started_at:timestamp ->
  ?created_at:timestamp ->
  ?cluster_arn:string_ ->
  ?service_arn:string_ ->
  ?service_deployment_arn:string_ ->
  unit ->
  service_deployment

val make_run_task_response : ?failures:failures -> ?tasks:tasks -> unit -> run_task_response

val make_run_task_request :
  ?volume_configurations:task_volume_configurations ->
  ?client_token:string_ ->
  ?tags:tags ->
  ?started_by:string_ ->
  ?reference_id:string_ ->
  ?propagate_tags:propagate_tags ->
  ?platform_version:string_ ->
  ?placement_strategy:placement_strategies ->
  ?placement_constraints:placement_constraints ->
  ?overrides:task_override ->
  ?network_configuration:network_configuration ->
  ?launch_type:launch_type ->
  ?group:string_ ->
  ?enable_execute_command:boolean_ ->
  ?enable_ecs_managed_tags:boolean_ ->
  ?count:boxed_integer ->
  ?cluster:string_ ->
  ?capacity_provider_strategy:capacity_provider_strategy ->
  task_definition:string_ ->
  unit ->
  run_task_request

val make_register_task_definition_response :
  ?tags:tags -> ?task_definition:task_definition -> unit -> register_task_definition_response

val make_register_task_definition_request :
  ?enable_fault_injection:boxed_boolean ->
  ?runtime_platform:runtime_platform ->
  ?ephemeral_storage:ephemeral_storage ->
  ?inference_accelerators:inference_accelerators ->
  ?proxy_configuration:proxy_configuration ->
  ?ipc_mode:ipc_mode ->
  ?pid_mode:pid_mode ->
  ?tags:tags ->
  ?memory:string_ ->
  ?cpu:string_ ->
  ?requires_compatibilities:compatibility_list ->
  ?placement_constraints:task_definition_placement_constraints ->
  ?volumes:volume_list ->
  ?network_mode:network_mode ->
  ?execution_role_arn:string_ ->
  ?task_role_arn:string_ ->
  container_definitions:container_definitions ->
  family:string_ ->
  unit ->
  register_task_definition_request

val make_register_daemon_task_definition_response :
  ?daemon_task_definition_arn:string_ -> unit -> register_daemon_task_definition_response

val make_daemon_linux_parameters :
  ?tmpfs:tmpfs_list ->
  ?init_process_enabled:boxed_boolean ->
  ?devices:devices_list ->
  ?capabilities:kernel_capabilities ->
  unit ->
  daemon_linux_parameters

val make_daemon_container_definition :
  ?restart_policy:container_restart_policy ->
  ?pseudo_terminal:boxed_boolean ->
  ?interactive:boxed_boolean ->
  ?system_controls:system_controls ->
  ?stop_timeout:boxed_integer ->
  ?start_timeout:boxed_integer ->
  ?depends_on:container_dependencies ->
  ?linux_parameters:daemon_linux_parameters ->
  ?ulimits:ulimit_list ->
  ?user:string_ ->
  ?privileged:boxed_boolean ->
  ?firelens_configuration:firelens_configuration ->
  ?log_configuration:log_configuration ->
  ?mount_points:mount_point_list ->
  ?readonly_root_filesystem:boxed_boolean ->
  ?secrets:secret_list ->
  ?environment:environment_variables ->
  ?environment_files:environment_files ->
  ?working_directory:string_ ->
  ?command:string_list ->
  ?entry_point:string_list ->
  ?essential:boxed_boolean ->
  ?cpu:integer ->
  ?health_check:health_check ->
  ?repository_credentials:repository_credentials ->
  ?memory_reservation:boxed_integer ->
  ?memory:boxed_integer ->
  ?name:string_ ->
  image:string_ ->
  unit ->
  daemon_container_definition

val make_daemon_volume : ?host:host_volume_properties -> ?name:string_ -> unit -> daemon_volume

val make_register_daemon_task_definition_request :
  ?ipc_mode:daemon_ipc_mode ->
  ?pid_mode:daemon_pid_mode ->
  ?tags:tags ->
  ?volumes:daemon_volume_list ->
  ?memory:string_ ->
  ?cpu:string_ ->
  ?execution_role_arn:string_ ->
  ?task_role_arn:string_ ->
  container_definitions:daemon_container_definition_list ->
  family:string_ ->
  unit ->
  register_daemon_task_definition_request

val make_register_container_instance_response :
  ?container_instance:container_instance -> unit -> register_container_instance_response

val make_platform_device : type_:platform_device_type -> id:string_ -> unit -> platform_device

val make_register_container_instance_request :
  ?tags:tags ->
  ?platform_devices:platform_devices ->
  ?attributes:attributes ->
  ?container_instance_arn:string_ ->
  ?version_info:version_info ->
  ?total_resources:resources ->
  ?instance_identity_document_signature:string_ ->
  ?instance_identity_document:string_ ->
  ?cluster:string_ ->
  unit ->
  register_container_instance_request

val make_put_cluster_capacity_providers_response :
  ?cluster:cluster -> unit -> put_cluster_capacity_providers_response

val make_put_cluster_capacity_providers_request :
  default_capacity_provider_strategy:capacity_provider_strategy ->
  capacity_providers:string_list ->
  cluster:string_ ->
  unit ->
  put_cluster_capacity_providers_request

val make_put_attributes_response : ?attributes:attributes -> unit -> put_attributes_response

val make_put_attributes_request :
  ?cluster:string_ -> attributes:attributes -> unit -> put_attributes_request

val make_put_account_setting_response : ?setting:setting -> unit -> put_account_setting_response

val make_put_account_setting_request :
  ?principal_arn:string_ ->
  value:string_ ->
  name:setting_name ->
  unit ->
  put_account_setting_request

val make_put_account_setting_default_response :
  ?setting:setting -> unit -> put_account_setting_default_response

val make_put_account_setting_default_request :
  value:string_ -> name:setting_name -> unit -> put_account_setting_default_request

val make_list_tasks_response :
  ?next_token:string_ -> ?task_arns:string_list -> unit -> list_tasks_response

val make_list_tasks_request :
  ?daemon_name:string_ ->
  ?launch_type:launch_type ->
  ?desired_status:desired_status ->
  ?service_name:string_ ->
  ?started_by:string_ ->
  ?max_results:boxed_integer ->
  ?next_token:string_ ->
  ?family:string_ ->
  ?container_instance:string_ ->
  ?cluster:string_ ->
  unit ->
  list_tasks_request

val make_list_task_definitions_response :
  ?next_token:string_ -> ?task_definition_arns:string_list -> unit -> list_task_definitions_response

val make_list_task_definitions_request :
  ?max_results:boxed_integer ->
  ?next_token:string_ ->
  ?sort:sort_order ->
  ?status:task_definition_status ->
  ?family_prefix:string_ ->
  unit ->
  list_task_definitions_request

val make_list_task_definition_families_response :
  ?next_token:string_ -> ?families:string_list -> unit -> list_task_definition_families_response

val make_list_task_definition_families_request :
  ?max_results:boxed_integer ->
  ?next_token:string_ ->
  ?status:task_definition_family_status ->
  ?family_prefix:string_ ->
  unit ->
  list_task_definition_families_request

val make_list_tags_for_resource_response : ?tags:tags -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_arn:string_ -> unit -> list_tags_for_resource_request

val make_list_services_response :
  ?next_token:string_ -> ?service_arns:string_list -> unit -> list_services_response

val make_list_services_request :
  ?resource_management_type:resource_management_type ->
  ?scheduling_strategy:scheduling_strategy ->
  ?launch_type:launch_type ->
  ?max_results:boxed_integer ->
  ?next_token:string_ ->
  ?cluster:string_ ->
  unit ->
  list_services_request

val make_list_services_by_namespace_response :
  ?next_token:string_ -> ?service_arns:string_list -> unit -> list_services_by_namespace_response

val make_list_services_by_namespace_request :
  ?max_results:boxed_integer ->
  ?next_token:string_ ->
  namespace:string_ ->
  unit ->
  list_services_by_namespace_request

val make_list_service_deployments_response :
  ?next_token:string_ ->
  ?service_deployments:service_deployments_brief ->
  unit ->
  list_service_deployments_response

val make_created_at : ?after:timestamp -> ?before:timestamp -> unit -> created_at

val make_list_service_deployments_request :
  ?max_results:boxed_integer ->
  ?next_token:string_ ->
  ?created_at:created_at ->
  ?status:service_deployment_status_list ->
  ?cluster:string_ ->
  service:string_ ->
  unit ->
  list_service_deployments_request

val make_daemon_summary :
  ?updated_at:timestamp ->
  ?created_at:timestamp ->
  ?status:daemon_status ->
  ?daemon_arn:string_ ->
  unit ->
  daemon_summary

val make_list_daemons_response :
  ?next_token:string_ ->
  ?daemon_summaries_list:daemon_summaries_list ->
  unit ->
  list_daemons_response

val make_list_daemons_request :
  ?next_token:string_ ->
  ?max_results:boxed_integer ->
  ?capacity_provider_arns:string_list ->
  ?cluster_arn:string_ ->
  unit ->
  list_daemons_request

val make_daemon_task_definition_summary :
  ?status:daemon_task_definition_status ->
  ?delete_requested_at:timestamp ->
  ?registered_by:string_ ->
  ?registered_at:timestamp ->
  ?arn:string_ ->
  unit ->
  daemon_task_definition_summary

val make_list_daemon_task_definitions_response :
  ?next_token:string_ ->
  ?daemon_task_definitions:daemon_task_definition_summaries ->
  unit ->
  list_daemon_task_definitions_response

val make_list_daemon_task_definitions_request :
  ?max_results:boxed_integer ->
  ?next_token:string_ ->
  ?sort:sort_order ->
  ?status:daemon_task_definition_status_filter ->
  ?revision:daemon_task_definition_revision_filter ->
  ?family:string_ ->
  ?family_prefix:string_ ->
  unit ->
  list_daemon_task_definitions_request

val make_daemon_deployment_summary :
  ?finished_at:timestamp ->
  ?stopped_at:timestamp ->
  ?started_at:timestamp ->
  ?created_at:timestamp ->
  ?target_daemon_revision_arn:string_ ->
  ?status_reason:string_ ->
  ?status:daemon_deployment_status ->
  ?cluster_arn:string_ ->
  ?daemon_arn:string_ ->
  ?daemon_deployment_arn:string_ ->
  unit ->
  daemon_deployment_summary

val make_list_daemon_deployments_response :
  ?daemon_deployments:daemon_deployment_summary_list ->
  ?next_token:string_ ->
  unit ->
  list_daemon_deployments_response

val make_list_daemon_deployments_request :
  ?next_token:string_ ->
  ?max_results:boxed_integer ->
  ?created_at:created_at ->
  ?status:daemon_deployment_status_list ->
  daemon_arn:string_ ->
  unit ->
  list_daemon_deployments_request

val make_list_container_instances_response :
  ?next_token:string_ ->
  ?container_instance_arns:string_list ->
  unit ->
  list_container_instances_response

val make_list_container_instances_request :
  ?status:container_instance_status ->
  ?max_results:boxed_integer ->
  ?next_token:string_ ->
  ?filter:string_ ->
  ?cluster:string_ ->
  unit ->
  list_container_instances_request

val make_list_clusters_response :
  ?next_token:string_ -> ?cluster_arns:string_list -> unit -> list_clusters_response

val make_list_clusters_request :
  ?max_results:boxed_integer -> ?next_token:string_ -> unit -> list_clusters_request

val make_list_attributes_response :
  ?next_token:string_ -> ?attributes:attributes -> unit -> list_attributes_response

val make_list_attributes_request :
  ?max_results:boxed_integer ->
  ?next_token:string_ ->
  ?attribute_value:string_ ->
  ?attribute_name:string_ ->
  ?cluster:string_ ->
  target_type:target_type ->
  unit ->
  list_attributes_request

val make_list_account_settings_response :
  ?next_token:string_ -> ?settings:settings -> unit -> list_account_settings_response

val make_list_account_settings_request :
  ?max_results:integer ->
  ?next_token:string_ ->
  ?effective_settings:boolean_ ->
  ?principal_arn:string_ ->
  ?value:string_ ->
  ?name:setting_name ->
  unit ->
  list_account_settings_request

val make_get_task_protection_response :
  ?failures:failures -> ?protected_tasks:protected_tasks -> unit -> get_task_protection_response

val make_get_task_protection_request :
  ?tasks:string_list -> cluster:string_ -> unit -> get_task_protection_request

val make_execute_command_response :
  ?task_arn:string_ ->
  ?session:session ->
  ?interactive:boolean_ ->
  ?container_name:string_ ->
  ?container_arn:string_ ->
  ?cluster_arn:string_ ->
  unit ->
  execute_command_response

val make_execute_command_request :
  ?container:string_ ->
  ?cluster:string_ ->
  task:string_ ->
  interactive:boolean_ ->
  command:string_ ->
  unit ->
  execute_command_request

val make_ecs_express_gateway_service :
  ?updated_at:timestamp ->
  ?created_at:timestamp ->
  ?tags:tags ->
  ?active_configurations:express_gateway_service_configurations ->
  ?current_deployment:string_ ->
  ?status:express_gateway_service_status ->
  ?infrastructure_role_arn:string_ ->
  ?service_arn:string_ ->
  ?service_name:string_ ->
  ?cluster:string_ ->
  unit ->
  ecs_express_gateway_service

val make_discover_poll_endpoint_response :
  ?service_connect_endpoint:string_ ->
  ?telemetry_endpoint:string_ ->
  ?endpoint:string_ ->
  unit ->
  discover_poll_endpoint_response

val make_discover_poll_endpoint_request :
  ?cluster:string_ -> ?container_instance:string_ -> unit -> discover_poll_endpoint_request

val make_describe_tasks_response :
  ?failures:failures -> ?tasks:tasks -> unit -> describe_tasks_response

val make_describe_tasks_request :
  ?include_:task_field_list ->
  ?cluster:string_ ->
  tasks:string_list ->
  unit ->
  describe_tasks_request

val make_describe_task_sets_response :
  ?failures:failures -> ?task_sets:task_sets -> unit -> describe_task_sets_response

val make_describe_task_sets_request :
  ?include_:task_set_field_list ->
  ?task_sets:string_list ->
  service:string_ ->
  cluster:string_ ->
  unit ->
  describe_task_sets_request

val make_describe_task_definition_response :
  ?tags:tags -> ?task_definition:task_definition -> unit -> describe_task_definition_response

val make_describe_task_definition_request :
  ?include_:task_definition_field_list ->
  task_definition:string_ ->
  unit ->
  describe_task_definition_request

val make_describe_services_response :
  ?failures:failures -> ?services:services -> unit -> describe_services_response

val make_describe_services_request :
  ?include_:service_field_list ->
  ?cluster:string_ ->
  services:string_list ->
  unit ->
  describe_services_request

val make_describe_service_revisions_response :
  ?failures:failures ->
  ?service_revisions:service_revisions ->
  unit ->
  describe_service_revisions_response

val make_describe_service_revisions_request :
  service_revision_arns:string_list -> unit -> describe_service_revisions_request

val make_describe_service_deployments_response :
  ?failures:failures ->
  ?service_deployments:service_deployments ->
  unit ->
  describe_service_deployments_response

val make_describe_service_deployments_request :
  service_deployment_arns:string_list -> unit -> describe_service_deployments_request

val make_describe_express_gateway_service_response :
  ?service:ecs_express_gateway_service -> unit -> describe_express_gateway_service_response

val make_describe_express_gateway_service_request :
  ?include_:express_gateway_service_include_list ->
  service_arn:string_ ->
  unit ->
  describe_express_gateway_service_request

val make_daemon_task_definition :
  ?ipc_mode:daemon_ipc_mode ->
  ?pid_mode:daemon_pid_mode ->
  ?registered_by:string_ ->
  ?delete_requested_at:timestamp ->
  ?registered_at:timestamp ->
  ?status:daemon_task_definition_status ->
  ?memory:string_ ->
  ?cpu:string_ ->
  ?volumes:daemon_volume_list ->
  ?container_definitions:daemon_container_definition_list ->
  ?execution_role_arn:string_ ->
  ?task_role_arn:string_ ->
  ?revision:integer ->
  ?family:string_ ->
  ?daemon_task_definition_arn:string_ ->
  unit ->
  daemon_task_definition

val make_describe_daemon_task_definition_response :
  ?daemon_task_definition:daemon_task_definition -> unit -> describe_daemon_task_definition_response

val make_describe_daemon_task_definition_request :
  daemon_task_definition:string_ -> unit -> describe_daemon_task_definition_request

val make_daemon_container_image :
  ?image:string_ ->
  ?image_digest:string_ ->
  ?container_name:string_ ->
  unit ->
  daemon_container_image

val make_daemon_revision :
  ?enable_execute_command:boxed_boolean ->
  ?enable_ecs_managed_tags:boxed_boolean ->
  ?propagate_tags:daemon_propagate_tags ->
  ?container_images:daemon_container_images ->
  ?created_at:timestamp ->
  ?daemon_task_definition_arn:string_ ->
  ?daemon_arn:string_ ->
  ?cluster_arn:string_ ->
  ?daemon_revision_arn:string_ ->
  unit ->
  daemon_revision

val make_describe_daemon_revisions_response :
  ?failures:failures ->
  ?daemon_revisions:daemon_revisions ->
  unit ->
  describe_daemon_revisions_response

val make_describe_daemon_revisions_request :
  daemon_revision_arns:string_list -> unit -> describe_daemon_revisions_request

val make_daemon_capacity_provider :
  ?running_count:integer -> ?arn:string_ -> unit -> daemon_capacity_provider

val make_daemon_revision_detail :
  ?total_running_count:integer ->
  ?capacity_providers:daemon_capacity_provider_list ->
  ?arn:string_ ->
  unit ->
  daemon_revision_detail

val make_daemon_detail :
  ?updated_at:timestamp ->
  ?created_at:timestamp ->
  ?deployment_arn:string_ ->
  ?current_revisions:daemon_revision_detail_list ->
  ?status:daemon_status ->
  ?cluster_arn:string_ ->
  ?daemon_arn:string_ ->
  unit ->
  daemon_detail

val make_describe_daemon_response : ?daemon:daemon_detail -> unit -> describe_daemon_response
val make_describe_daemon_request : daemon_arn:string_ -> unit -> describe_daemon_request

val make_daemon_deployment_capacity_provider :
  ?draining_instance_count:boxed_integer ->
  ?running_instance_count:boxed_integer ->
  ?arn:string_ ->
  unit ->
  daemon_deployment_capacity_provider

val make_daemon_deployment_revision_detail :
  ?total_draining_instance_count:boxed_integer ->
  ?total_running_instance_count:boxed_integer ->
  ?capacity_providers:daemon_deployment_capacity_provider_list ->
  ?arn:string_ ->
  unit ->
  daemon_deployment_revision_detail

val make_daemon_circuit_breaker :
  ?threshold:integer ->
  ?status:daemon_deployment_rollback_monitors_status ->
  ?failure_count:integer ->
  unit ->
  daemon_circuit_breaker

val make_daemon_deployment_alarms :
  ?triggered_alarm_names:string_list ->
  ?alarm_names:string_list ->
  ?status:daemon_deployment_rollback_monitors_status ->
  unit ->
  daemon_deployment_alarms

val make_daemon_rollback :
  ?rollback_capacity_providers:string_list ->
  ?rollback_target_daemon_revision_arn:string_ ->
  ?started_at:timestamp ->
  ?reason:string_ ->
  unit ->
  daemon_rollback

val make_daemon_deployment :
  ?finished_at:timestamp ->
  ?stopped_at:timestamp ->
  ?started_at:timestamp ->
  ?created_at:timestamp ->
  ?deployment_configuration:daemon_deployment_configuration ->
  ?rollback:daemon_rollback ->
  ?alarms:daemon_deployment_alarms ->
  ?circuit_breaker:daemon_circuit_breaker ->
  ?source_daemon_revisions:daemon_deployment_revision_detail_list ->
  ?target_daemon_revision:daemon_deployment_revision_detail ->
  ?status_reason:string_ ->
  ?status:daemon_deployment_status ->
  ?cluster_arn:string_ ->
  ?daemon_deployment_arn:string_ ->
  unit ->
  daemon_deployment

val make_describe_daemon_deployments_response :
  ?daemon_deployments:daemon_deployment_list ->
  ?failures:failures ->
  unit ->
  describe_daemon_deployments_response

val make_describe_daemon_deployments_request :
  daemon_deployment_arns:string_list -> unit -> describe_daemon_deployments_request

val make_describe_container_instances_response :
  ?failures:failures ->
  ?container_instances:container_instances ->
  unit ->
  describe_container_instances_response

val make_describe_container_instances_request :
  ?include_:container_instance_field_list ->
  ?cluster:string_ ->
  container_instances:string_list ->
  unit ->
  describe_container_instances_request

val make_describe_clusters_response :
  ?failures:failures -> ?clusters:clusters -> unit -> describe_clusters_response

val make_describe_clusters_request :
  ?include_:cluster_field_list -> ?clusters:string_list -> unit -> describe_clusters_request

val make_describe_capacity_providers_response :
  ?next_token:string_ ->
  ?failures:failures ->
  ?capacity_providers:capacity_providers ->
  unit ->
  describe_capacity_providers_response

val make_describe_capacity_providers_request :
  ?next_token:string_ ->
  ?max_results:boxed_integer ->
  ?include_:capacity_provider_field_list ->
  ?cluster:string_ ->
  ?capacity_providers:string_list ->
  unit ->
  describe_capacity_providers_request

val make_deregister_task_definition_response :
  ?task_definition:task_definition -> unit -> deregister_task_definition_response

val make_deregister_task_definition_request :
  task_definition:string_ -> unit -> deregister_task_definition_request

val make_deregister_container_instance_response :
  ?container_instance:container_instance -> unit -> deregister_container_instance_response

val make_deregister_container_instance_request :
  ?force:boxed_boolean ->
  ?cluster:string_ ->
  container_instance:string_ ->
  unit ->
  deregister_container_instance_request

val make_delete_task_set_response : ?task_set:task_set -> unit -> delete_task_set_response

val make_delete_task_set_request :
  ?force:boxed_boolean ->
  task_set:string_ ->
  service:string_ ->
  cluster:string_ ->
  unit ->
  delete_task_set_request

val make_delete_task_definitions_response :
  ?failures:failures ->
  ?task_definitions:task_definition_list ->
  unit ->
  delete_task_definitions_response

val make_delete_task_definitions_request :
  task_definitions:string_list -> unit -> delete_task_definitions_request

val make_delete_service_response : ?service:service -> unit -> delete_service_response

val make_delete_service_request :
  ?force:boxed_boolean -> ?cluster:string_ -> service:string_ -> unit -> delete_service_request

val make_delete_express_gateway_service_response :
  ?service:ecs_express_gateway_service -> unit -> delete_express_gateway_service_response

val make_delete_express_gateway_service_request :
  service_arn:string_ -> unit -> delete_express_gateway_service_request

val make_delete_daemon_task_definition_response :
  ?daemon_task_definition_arn:string_ -> unit -> delete_daemon_task_definition_response

val make_delete_daemon_task_definition_request :
  daemon_task_definition:string_ -> unit -> delete_daemon_task_definition_request

val make_delete_daemon_response :
  ?deployment_arn:string_ ->
  ?updated_at:timestamp ->
  ?created_at:timestamp ->
  ?status:daemon_status ->
  ?daemon_arn:string_ ->
  unit ->
  delete_daemon_response

val make_delete_daemon_request : daemon_arn:string_ -> unit -> delete_daemon_request
val make_delete_cluster_response : ?cluster:cluster -> unit -> delete_cluster_response
val make_delete_cluster_request : cluster:string_ -> unit -> delete_cluster_request

val make_delete_capacity_provider_response :
  ?capacity_provider:capacity_provider -> unit -> delete_capacity_provider_response

val make_delete_capacity_provider_request :
  ?cluster:string_ -> capacity_provider:string_ -> unit -> delete_capacity_provider_request

val make_delete_attributes_response : ?attributes:attributes -> unit -> delete_attributes_response

val make_delete_attributes_request :
  ?cluster:string_ -> attributes:attributes -> unit -> delete_attributes_request

val make_delete_account_setting_response :
  ?setting:setting -> unit -> delete_account_setting_response

val make_delete_account_setting_request :
  ?principal_arn:string_ -> name:setting_name -> unit -> delete_account_setting_request

val make_create_task_set_response : ?task_set:task_set -> unit -> create_task_set_response

val make_create_task_set_request :
  ?tags:tags ->
  ?client_token:string_ ->
  ?scale:scale ->
  ?platform_version:string_ ->
  ?capacity_provider_strategy:capacity_provider_strategy ->
  ?launch_type:launch_type ->
  ?service_registries:service_registries ->
  ?load_balancers:load_balancers ->
  ?network_configuration:network_configuration ->
  ?external_id:string_ ->
  task_definition:string_ ->
  cluster:string_ ->
  service:string_ ->
  unit ->
  create_task_set_request

val make_create_service_response : ?service:service -> unit -> create_service_response

val make_create_service_request :
  ?monitoring:monitoring_configuration ->
  ?vpc_lattice_configurations:vpc_lattice_configurations ->
  ?volume_configurations:service_volume_configurations ->
  ?service_connect_configuration:service_connect_configuration ->
  ?enable_execute_command:boolean_ ->
  ?propagate_tags:propagate_tags ->
  ?enable_ecs_managed_tags:boolean_ ->
  ?tags:tags ->
  ?deployment_controller:deployment_controller ->
  ?scheduling_strategy:scheduling_strategy ->
  ?health_check_grace_period_seconds:boxed_integer ->
  ?network_configuration:network_configuration ->
  ?placement_strategy:placement_strategies ->
  ?placement_constraints:placement_constraints ->
  ?deployment_configuration:deployment_configuration ->
  ?role:string_ ->
  ?platform_version:string_ ->
  ?capacity_provider_strategy:capacity_provider_strategy ->
  ?launch_type:launch_type ->
  ?client_token:string_ ->
  ?desired_count:boxed_integer ->
  ?service_registries:service_registries ->
  ?load_balancers:load_balancers ->
  ?availability_zone_rebalancing:availability_zone_rebalancing ->
  ?task_definition:string_ ->
  ?cluster:string_ ->
  service_name:string_ ->
  unit ->
  create_service_request

val make_create_managed_instances_provider_configuration :
  ?auto_repair_configuration:auto_repair_configuration ->
  ?infrastructure_optimization:infrastructure_optimization ->
  ?propagate_tags:propagate_mi_tags ->
  instance_launch_template:instance_launch_template ->
  infrastructure_role_arn:string_ ->
  unit ->
  create_managed_instances_provider_configuration

val make_create_express_gateway_service_response :
  ?service:ecs_express_gateway_service -> unit -> create_express_gateway_service_response

val make_create_express_gateway_service_request :
  ?task_definition_arn:string_ ->
  ?tags:tags ->
  ?scaling_target:express_gateway_scaling_target ->
  ?memory:string_ ->
  ?cpu:string_ ->
  ?network_configuration:express_gateway_service_network_configuration ->
  ?task_role_arn:string_ ->
  ?primary_container:express_gateway_container ->
  ?health_check_path:string_ ->
  ?cluster:string_ ->
  ?service_name:string_ ->
  ?execution_role_arn:string_ ->
  infrastructure_role_arn:string_ ->
  unit ->
  create_express_gateway_service_request

val make_create_daemon_response :
  ?deployment_arn:string_ ->
  ?created_at:timestamp ->
  ?status:daemon_status ->
  ?daemon_arn:string_ ->
  unit ->
  create_daemon_response

val make_create_daemon_request :
  ?client_token:string_ ->
  ?enable_execute_command:boolean_ ->
  ?enable_ecs_managed_tags:boolean_ ->
  ?propagate_tags:daemon_propagate_tags ->
  ?tags:tags ->
  ?deployment_configuration:daemon_deployment_configuration ->
  ?cluster_arn:string_ ->
  capacity_provider_arns:string_list ->
  daemon_task_definition_arn:string_ ->
  daemon_name:string_ ->
  unit ->
  create_daemon_request

val make_create_cluster_response : ?cluster:cluster -> unit -> create_cluster_response

val make_create_cluster_request :
  ?service_connect_defaults:cluster_service_connect_defaults_request ->
  ?default_capacity_provider_strategy:capacity_provider_strategy ->
  ?capacity_providers:string_list ->
  ?configuration:cluster_configuration ->
  ?settings:cluster_settings ->
  ?tags:tags ->
  ?cluster_name:string_ ->
  unit ->
  create_cluster_request

val make_create_capacity_provider_response :
  ?capacity_provider:capacity_provider -> unit -> create_capacity_provider_response

val make_create_capacity_provider_request :
  ?tags:tags ->
  ?managed_instances_provider:create_managed_instances_provider_configuration ->
  ?auto_scaling_group_provider:auto_scaling_group_provider ->
  ?cluster:string_ ->
  name:string_ ->
  unit ->
  create_capacity_provider_request

val make_continue_service_deployment_response :
  ?service_deployment_arn:string_ -> unit -> continue_service_deployment_response

val make_continue_service_deployment_request :
  ?action:deployment_lifecycle_hook_action ->
  hook_id:string_ ->
  service_deployment_arn:string_ ->
  unit ->
  continue_service_deployment_request
