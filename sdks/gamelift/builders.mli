open Types

val make_vpc_peering_connection_status :
  ?message:non_zero_and_max_string ->
  ?code:non_zero_and_max_string ->
  unit ->
  vpc_peering_connection_status

val make_vpc_peering_connection :
  ?game_lift_vpc_id:non_zero_and_max_string ->
  ?peer_vpc_id:non_zero_and_max_string ->
  ?status:vpc_peering_connection_status ->
  ?vpc_peering_connection_id:non_zero_and_max_string ->
  ?ip_v4_cidr_block:non_zero_and_max_string ->
  ?fleet_arn:fleet_arn ->
  ?fleet_id:fleet_id ->
  unit ->
  vpc_peering_connection

val make_vpc_peering_authorization :
  ?expiration_time:timestamp ->
  ?creation_time:timestamp ->
  ?peer_vpc_id:non_zero_and_max_string ->
  ?peer_vpc_aws_account_id:non_zero_and_max_string ->
  ?game_lift_aws_account_id:non_zero_and_max_string ->
  unit ->
  vpc_peering_authorization

val make_validate_matchmaking_rule_set_output :
  ?valid:boolean_model -> unit -> validate_matchmaking_rule_set_output

val make_validate_matchmaking_rule_set_input :
  rule_set_body:rule_set_body -> unit -> validate_matchmaking_rule_set_input

val make_s3_location :
  ?object_version:non_empty_string ->
  ?role_arn:non_empty_string ->
  ?key:non_empty_string ->
  ?bucket:non_empty_string ->
  unit ->
  s3_location

val make_script :
  ?node_js_version:node_js_version ->
  ?storage_location:s3_location ->
  ?creation_time:timestamp ->
  ?size_on_disk:whole_number_long ->
  ?version:non_zero_and_max_string ->
  ?name:non_zero_and_max_string ->
  ?script_arn:script_arn ->
  ?script_id:script_id ->
  unit ->
  script

val make_update_script_output : ?script:script -> unit -> update_script_output

val make_update_script_input :
  ?zip_file:zip_blob ->
  ?storage_location:s3_location ->
  ?version:non_zero_and_max_string ->
  ?name:non_zero_and_max_string ->
  script_id:script_id_or_arn ->
  unit ->
  update_script_input

val make_server_process :
  ?parameters:launch_parameters_string_model ->
  concurrent_executions:positive_integer ->
  launch_path:launch_path_string_model ->
  unit ->
  server_process

val make_runtime_configuration :
  ?game_session_activation_timeout_seconds:game_session_activation_timeout_seconds ->
  ?max_concurrent_game_session_activations:max_concurrent_game_session_activations ->
  ?server_processes:server_process_list ->
  unit ->
  runtime_configuration

val make_update_runtime_configuration_output :
  ?runtime_configuration:runtime_configuration -> unit -> update_runtime_configuration_output

val make_update_runtime_configuration_input :
  runtime_configuration:runtime_configuration ->
  fleet_id:fleet_id_or_arn ->
  unit ->
  update_runtime_configuration_input

val make_game_property : value:game_property_value -> key:game_property_key -> unit -> game_property

val make_matchmaking_configuration :
  ?flex_match_mode:flex_match_mode ->
  ?backfill_mode:backfill_mode ->
  ?game_session_data:game_session_data ->
  ?game_properties:game_property_list ->
  ?creation_time:timestamp ->
  ?custom_event_data:custom_event_data ->
  ?additional_player_count:whole_number ->
  ?notification_target:sns_arn_string_model ->
  ?rule_set_arn:matchmaking_rule_set_arn ->
  ?rule_set_name:matchmaking_id_string_model ->
  ?acceptance_required:boolean_model ->
  ?acceptance_timeout_seconds:matchmaking_acceptance_timeout_integer ->
  ?request_timeout_seconds:matchmaking_request_timeout_integer ->
  ?game_session_queue_arns:queue_arns_list ->
  ?description:non_zero_and_max_string ->
  ?configuration_arn:matchmaking_configuration_arn ->
  ?name:matchmaking_id_string_model ->
  unit ->
  matchmaking_configuration

val make_update_matchmaking_configuration_output :
  ?configuration:matchmaking_configuration -> unit -> update_matchmaking_configuration_output

val make_update_matchmaking_configuration_input :
  ?flex_match_mode:flex_match_mode ->
  ?backfill_mode:backfill_mode ->
  ?game_session_data:game_session_data ->
  ?game_properties:game_property_list ->
  ?custom_event_data:custom_event_data ->
  ?additional_player_count:whole_number ->
  ?notification_target:sns_arn_string_model ->
  ?rule_set_name:matchmaking_rule_set_name ->
  ?acceptance_required:boolean_model ->
  ?acceptance_timeout_seconds:matchmaking_acceptance_timeout_integer ->
  ?request_timeout_seconds:matchmaking_request_timeout_integer ->
  ?game_session_queue_arns:queue_arns_list ->
  ?description:non_zero_and_max_string ->
  name:matchmaking_configuration_name ->
  unit ->
  update_matchmaking_configuration_input

val make_player_latency_policy :
  ?policy_duration_seconds:whole_number ->
  ?maximum_individual_player_latency_milliseconds:whole_number ->
  unit ->
  player_latency_policy

val make_game_session_queue_destination :
  ?destination_arn:arn_string_model -> unit -> game_session_queue_destination

val make_filter_configuration : ?allowed_locations:location_list -> unit -> filter_configuration

val make_priority_configuration :
  ?location_order:location_list ->
  ?priority_order:priority_type_list ->
  unit ->
  priority_configuration

val make_game_session_queue :
  ?notification_target:queue_sns_arn_string_model ->
  ?custom_event_data:queue_custom_event_data ->
  ?priority_configuration:priority_configuration ->
  ?filter_configuration:filter_configuration ->
  ?destinations:game_session_queue_destination_list ->
  ?player_latency_policies:player_latency_policy_list ->
  ?timeout_in_seconds:whole_number ->
  ?game_session_queue_arn:game_session_queue_arn ->
  ?name:game_session_queue_name ->
  unit ->
  game_session_queue

val make_update_game_session_queue_output :
  ?game_session_queue:game_session_queue -> unit -> update_game_session_queue_output

val make_update_game_session_queue_input :
  ?notification_target:queue_sns_arn_string_model ->
  ?custom_event_data:queue_custom_event_data ->
  ?priority_configuration:priority_configuration ->
  ?filter_configuration:filter_configuration ->
  ?destinations:game_session_queue_destination_list ->
  ?player_latency_policies:player_latency_policy_list ->
  ?timeout_in_seconds:whole_number ->
  name:game_session_queue_name_or_arn ->
  unit ->
  update_game_session_queue_input

val make_game_session :
  ?player_gateway_status:player_gateway_status ->
  ?compute_name:compute_name ->
  ?location:location_string_model ->
  ?matchmaker_data:matchmaker_data ->
  ?game_session_data:large_game_session_data ->
  ?creator_id:non_zero_and_max_string ->
  ?player_session_creation_policy:player_session_creation_policy ->
  ?port:port_number ->
  ?dns_name:dns_name ->
  ?ip_address:ip_address ->
  ?game_properties:game_property_list ->
  ?status_reason:game_session_status_reason ->
  ?status:game_session_status ->
  ?maximum_player_session_count:whole_number ->
  ?current_player_session_count:whole_number ->
  ?termination_time:timestamp ->
  ?creation_time:timestamp ->
  ?fleet_arn:fleet_arn ->
  ?fleet_id:fleet_id ->
  ?name:non_zero_and_max_string ->
  ?game_session_id:non_zero_and_max_string ->
  unit ->
  game_session

val make_update_game_session_output :
  ?game_session:game_session -> unit -> update_game_session_output

val make_update_game_session_input :
  ?game_properties:game_property_list ->
  ?protection_policy:protection_policy ->
  ?player_session_creation_policy:player_session_creation_policy ->
  ?name:non_zero_and_max_string ->
  ?maximum_player_session_count:whole_number ->
  game_session_id:arn_string_model ->
  unit ->
  update_game_session_input

val make_game_server :
  ?last_health_check_time:timestamp ->
  ?last_claim_time:timestamp ->
  ?registration_time:timestamp ->
  ?utilization_status:game_server_utilization_status ->
  ?claim_status:game_server_claim_status ->
  ?game_server_data:game_server_data ->
  ?connection_info:game_server_connection_info ->
  ?instance_id:game_server_instance_id ->
  ?game_server_id:game_server_id ->
  ?game_server_group_arn:game_server_group_arn ->
  ?game_server_group_name:game_server_group_name ->
  unit ->
  game_server

val make_update_game_server_output : ?game_server:game_server -> unit -> update_game_server_output

val make_update_game_server_input :
  ?health_check:game_server_health_check ->
  ?utilization_status:game_server_utilization_status ->
  ?game_server_data:game_server_data ->
  game_server_id:game_server_id ->
  game_server_group_name:game_server_group_name_or_arn ->
  unit ->
  update_game_server_input

val make_instance_definition :
  ?weighted_capacity:weighted_capacity ->
  instance_type:game_server_group_instance_type ->
  unit ->
  instance_definition

val make_game_server_group :
  ?last_updated_time:timestamp ->
  ?creation_time:timestamp ->
  ?suspended_actions:game_server_group_actions ->
  ?status_reason:non_zero_and_max_string ->
  ?status:game_server_group_status ->
  ?auto_scaling_group_arn:auto_scaling_group_arn ->
  ?game_server_protection_policy:game_server_protection_policy ->
  ?balancing_strategy:balancing_strategy ->
  ?instance_definitions:instance_definitions ->
  ?role_arn:iam_role_arn ->
  ?game_server_group_arn:game_server_group_arn ->
  ?game_server_group_name:game_server_group_name ->
  unit ->
  game_server_group

val make_update_game_server_group_output :
  ?game_server_group:game_server_group -> unit -> update_game_server_group_output

val make_update_game_server_group_input :
  ?balancing_strategy:balancing_strategy ->
  ?game_server_protection_policy:game_server_protection_policy ->
  ?instance_definitions:instance_definitions ->
  ?role_arn:iam_role_arn ->
  game_server_group_name:game_server_group_name_or_arn ->
  unit ->
  update_game_server_group_input

val make_update_fleet_port_settings_output :
  ?fleet_arn:fleet_arn -> ?fleet_id:fleet_id -> unit -> update_fleet_port_settings_output

val make_ip_permission :
  protocol:ip_protocol ->
  ip_range:ip_range ->
  to_port:port_number ->
  from_port:port_number ->
  unit ->
  ip_permission

val make_update_fleet_port_settings_input :
  ?inbound_permission_revocations:ip_permissions_list ->
  ?inbound_permission_authorizations:ip_permissions_list ->
  fleet_id:fleet_id_or_arn ->
  unit ->
  update_fleet_port_settings_input

val make_managed_capacity_configuration :
  ?scale_in_after_inactivity_minutes:scale_in_after_inactivity_minutes ->
  ?zero_capacity_strategy:zero_capacity_strategy ->
  unit ->
  managed_capacity_configuration

val make_update_fleet_capacity_output :
  ?managed_capacity_configuration:managed_capacity_configuration ->
  ?location:location_string_model ->
  ?fleet_arn:fleet_arn ->
  ?fleet_id:fleet_id ->
  unit ->
  update_fleet_capacity_output

val make_update_fleet_capacity_input :
  ?managed_capacity_configuration:managed_capacity_configuration ->
  ?location:location_string_model ->
  ?max_size:whole_number ->
  ?min_size:whole_number ->
  ?desired_instances:whole_number ->
  fleet_id:fleet_id_or_arn ->
  unit ->
  update_fleet_capacity_input

val make_update_fleet_attributes_output :
  ?fleet_arn:fleet_arn -> ?fleet_id:fleet_id -> unit -> update_fleet_attributes_output

val make_resource_creation_limit_policy :
  ?policy_period_in_minutes:whole_number ->
  ?new_game_sessions_per_creator:whole_number ->
  unit ->
  resource_creation_limit_policy

val make_anywhere_configuration :
  cost:non_negative_limited_length_double -> unit -> anywhere_configuration

val make_update_fleet_attributes_input :
  ?anywhere_configuration:anywhere_configuration ->
  ?metric_groups:metric_group_list ->
  ?resource_creation_limit_policy:resource_creation_limit_policy ->
  ?new_game_session_protection_policy:protection_policy ->
  ?description:non_zero_and_max_string ->
  ?name:non_zero_and_max_string ->
  fleet_id:fleet_id_or_arn ->
  unit ->
  update_fleet_attributes_input

val make_container_dependency :
  condition:container_dependency_condition ->
  container_name:non_zero_and128_max_ascii_string ->
  unit ->
  container_dependency

val make_container_mount_point :
  ?access_level:container_mount_point_access_level ->
  ?container_path:container_path_string ->
  instance_path:instance_path_string ->
  unit ->
  container_mount_point

val make_container_environment :
  value:non_zero_and255_max_string ->
  name:non_zero_and255_max_string ->
  unit ->
  container_environment

val make_container_port_range :
  protocol:ip_protocol ->
  to_port:port_number ->
  from_port:port_number ->
  unit ->
  container_port_range

val make_container_port_configuration :
  container_port_ranges:container_port_range_list -> unit -> container_port_configuration

val make_linux_capabilities : ?include_:linux_capability_list -> unit -> linux_capabilities

val make_game_server_container_definition :
  ?linux_capabilities:linux_capabilities ->
  ?server_sdk_version:server_sdk_version ->
  ?resolved_image_digest:sha256 ->
  ?port_configuration:container_port_configuration ->
  ?image_uri:image_uri_string ->
  ?environment_override:container_environment_list ->
  ?mount_points:container_mount_point_list ->
  ?depends_on:container_dependency_list ->
  ?container_name:non_zero_and128_max_ascii_string ->
  unit ->
  game_server_container_definition

val make_container_health_check :
  ?timeout:container_health_check_timeout ->
  ?start_period:container_health_check_start_period ->
  ?retries:container_health_check_retries ->
  ?interval:container_health_check_interval ->
  command:container_command_string_list ->
  unit ->
  container_health_check

val make_support_container_definition :
  ?linux_capabilities:linux_capabilities ->
  ?vcpu:container_vcpu ->
  ?resolved_image_digest:sha256 ->
  ?port_configuration:container_port_configuration ->
  ?memory_hard_limit_mebibytes:container_memory_limit ->
  ?image_uri:image_uri_string ->
  ?health_check:container_health_check ->
  ?essential:boolean_model ->
  ?environment_override:container_environment_list ->
  ?mount_points:container_mount_point_list ->
  ?depends_on:container_dependency_list ->
  ?container_name:non_zero_and128_max_ascii_string ->
  unit ->
  support_container_definition

val make_container_group_definition :
  ?status_reason:non_zero_and_max_string ->
  ?status:container_group_definition_status ->
  ?version_description:non_zero_and_max_string ->
  ?version_number:positive_integer ->
  ?support_container_definitions:support_container_definition_list ->
  ?game_server_container_definition:game_server_container_definition ->
  ?total_vcpu_limit:container_total_vcpu_limit ->
  ?total_memory_limit_mebibytes:container_total_memory_limit ->
  ?container_group_type:container_group_type ->
  ?operating_system:container_operating_system ->
  ?creation_time:timestamp ->
  ?container_group_definition_arn:container_group_definition_arn ->
  name:container_group_definition_name ->
  unit ->
  container_group_definition

val make_update_container_group_definition_output :
  ?container_group_definition:container_group_definition ->
  unit ->
  update_container_group_definition_output

val make_game_server_container_definition_input :
  ?linux_capabilities:linux_capabilities ->
  ?environment_override:container_environment_list ->
  ?mount_points:container_mount_point_list ->
  ?depends_on:container_dependency_list ->
  server_sdk_version:server_sdk_version ->
  port_configuration:container_port_configuration ->
  image_uri:image_uri_string ->
  container_name:non_zero_and128_max_ascii_string ->
  unit ->
  game_server_container_definition_input

val make_support_container_definition_input :
  ?linux_capabilities:linux_capabilities ->
  ?vcpu:container_vcpu ->
  ?port_configuration:container_port_configuration ->
  ?memory_hard_limit_mebibytes:container_memory_limit ->
  ?health_check:container_health_check ->
  ?essential:boolean_model ->
  ?environment_override:container_environment_list ->
  ?mount_points:container_mount_point_list ->
  ?depends_on:container_dependency_list ->
  image_uri:image_uri_string ->
  container_name:non_zero_and128_max_ascii_string ->
  unit ->
  support_container_definition_input

val make_update_container_group_definition_input :
  ?operating_system:container_operating_system ->
  ?source_version_number:positive_integer ->
  ?version_description:non_zero_and_max_string ->
  ?total_vcpu_limit:container_total_vcpu_limit ->
  ?total_memory_limit_mebibytes:container_total_memory_limit ->
  ?support_container_definitions:support_container_definition_input_list ->
  ?game_server_container_definition:game_server_container_definition_input ->
  name:container_group_definition_name_or_arn ->
  unit ->
  update_container_group_definition_input

val make_connection_port_range :
  to_port:port_number -> from_port:port_number -> unit -> connection_port_range

val make_game_session_creation_limit_policy :
  ?policy_period_in_minutes:whole_number ->
  ?new_game_sessions_per_creator:whole_number ->
  unit ->
  game_session_creation_limit_policy

val make_deployment_details : ?latest_deployment_id:deployment_id -> unit -> deployment_details

val make_log_configuration :
  ?log_group_arn:log_group_arn_string_model ->
  ?s3_bucket_name:non_empty_string ->
  ?log_destination:log_destination ->
  unit ->
  log_configuration

val make_container_fleet_location_attributes :
  ?player_gateway_status:player_gateway_status ->
  ?status:container_fleet_location_status ->
  ?location:location_string_model ->
  unit ->
  container_fleet_location_attributes

val make_container_fleet :
  ?player_gateway_mode:player_gateway_mode ->
  ?location_attributes:container_fleet_location_attributes_list ->
  ?log_configuration:log_configuration ->
  ?deployment_details:deployment_details ->
  ?status:container_fleet_status ->
  ?game_session_creation_limit_policy:game_session_creation_limit_policy ->
  ?new_game_session_protection_policy:protection_policy ->
  ?metric_groups:metric_group_list ->
  ?creation_time:timestamp ->
  ?description:non_zero_and_max_string ->
  ?billing_type:container_fleet_billing_type ->
  ?instance_type:non_zero_and_max_string ->
  ?maximum_game_server_container_groups_per_instance:
    maximum_game_server_container_groups_per_instance ->
  ?game_server_container_groups_per_instance:game_server_container_groups_per_instance ->
  ?instance_inbound_permissions:ip_permissions_list ->
  ?instance_connection_port_range:connection_port_range ->
  ?per_instance_container_group_definition_arn:container_group_definition_arn ->
  ?per_instance_container_group_definition_name:container_group_definition_name ->
  ?game_server_container_group_definition_arn:container_group_definition_arn ->
  ?game_server_container_group_definition_name:container_group_definition_name ->
  ?fleet_role_arn:iam_role_arn ->
  ?fleet_arn:fleet_arn ->
  ?fleet_id:fleet_id ->
  unit ->
  container_fleet

val make_update_container_fleet_output :
  ?container_fleet:container_fleet -> unit -> update_container_fleet_output

val make_deployment_configuration :
  ?impairment_strategy:deployment_impairment_strategy ->
  ?minimum_healthy_percentage:minimum_healthy_percentage ->
  ?protection_strategy:deployment_protection_strategy ->
  unit ->
  deployment_configuration

val make_update_container_fleet_input :
  ?remove_attributes:container_fleet_remove_attribute_list ->
  ?log_configuration:log_configuration ->
  ?game_session_creation_limit_policy:game_session_creation_limit_policy ->
  ?new_game_session_protection_policy:protection_policy ->
  ?metric_groups:metric_group_list ->
  ?description:non_zero_and_max_string ->
  ?deployment_configuration:deployment_configuration ->
  ?instance_inbound_permission_revocations:ip_permissions_list ->
  ?instance_inbound_permission_authorizations:ip_permissions_list ->
  ?instance_connection_port_range:connection_port_range ->
  ?game_server_container_groups_per_instance:game_server_container_groups_per_instance ->
  ?per_instance_container_group_definition_name:container_group_definition_name_or_arn ->
  ?game_server_container_group_definition_name:container_group_definition_name_or_arn ->
  fleet_id:fleet_id_or_arn ->
  unit ->
  update_container_fleet_input

val make_build :
  ?server_sdk_version:server_sdk_version ->
  ?creation_time:timestamp ->
  ?operating_system:operating_system ->
  ?size_on_disk:whole_number_long ->
  ?status:build_status ->
  ?version:free_text ->
  ?name:free_text ->
  ?build_arn:build_arn ->
  ?build_id:build_id ->
  unit ->
  build

val make_update_build_output : ?build:build -> unit -> update_build_output

val make_update_build_input :
  ?version:non_zero_and_max_string ->
  ?name:non_zero_and_max_string ->
  build_id:build_id_or_arn ->
  unit ->
  update_build_input

val make_routing_strategy :
  ?message:free_text ->
  ?fleet_id:fleet_id ->
  ?type_:routing_strategy_type ->
  unit ->
  routing_strategy

val make_alias :
  ?last_updated_time:timestamp ->
  ?creation_time:timestamp ->
  ?routing_strategy:routing_strategy ->
  ?description:free_text ->
  ?alias_arn:alias_arn ->
  ?name:non_blank_and_length_constraint_string ->
  ?alias_id:alias_id ->
  unit ->
  alias

val make_update_alias_output : ?alias:alias -> unit -> update_alias_output

val make_update_alias_input :
  ?routing_strategy:routing_strategy ->
  ?description:non_zero_and_max_string ->
  ?name:non_blank_and_length_constraint_string ->
  alias_id:alias_id_or_arn ->
  unit ->
  update_alias_input

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_ar_n:amazon_resource_name -> unit -> untag_resource_request

val make_udp_endpoint :
  ?port:positive_integer -> ?domain:non_zero_and_max_string -> unit -> udp_endpoint

val make_terminate_game_session_output :
  ?game_session:game_session -> unit -> terminate_game_session_output

val make_terminate_game_session_input :
  termination_mode:termination_mode ->
  game_session_id:arn_string_model ->
  unit ->
  terminate_game_session_input

val make_target_tracking_configuration :
  target_value:non_negative_double -> unit -> target_tracking_configuration

val make_target_configuration : target_value:double -> unit -> target_configuration
val make_tag_resource_response : unit -> unit
val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_tag_resource_request :
  tags:tag_list -> resource_ar_n:amazon_resource_name -> unit -> tag_resource_request

val make_suspend_game_server_group_output :
  ?game_server_group:game_server_group -> unit -> suspend_game_server_group_output

val make_suspend_game_server_group_input :
  suspend_actions:game_server_group_actions ->
  game_server_group_name:game_server_group_name_or_arn ->
  unit ->
  suspend_game_server_group_input

val make_stop_matchmaking_output : unit -> unit

val make_stop_matchmaking_input :
  ticket_id:matchmaking_id_string_model -> unit -> stop_matchmaking_input

val make_player_latency :
  ?latency_in_milliseconds:float_ ->
  ?region_identifier:non_zero_and_max_string ->
  ?player_id:player_id ->
  unit ->
  player_latency

val make_placed_player_session :
  ?player_session_id:player_session_id -> ?player_id:player_id -> unit -> placed_player_session

val make_priority_configuration_override :
  ?placement_fallback_strategy:placement_fallback_strategy ->
  location_order:location_order_override_list ->
  unit ->
  priority_configuration_override

val make_game_session_placement :
  ?player_gateway_status:player_gateway_status ->
  ?priority_configuration_override:priority_configuration_override ->
  ?matchmaker_data:matchmaker_data ->
  ?game_session_data:large_game_session_data ->
  ?placed_player_sessions:placed_player_session_list ->
  ?port:port_number ->
  ?dns_name:dns_name ->
  ?ip_address:ip_address ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?player_latencies:player_latency_list ->
  ?game_session_region:non_zero_and_max_string ->
  ?game_session_arn:non_zero_and_max_string ->
  ?game_session_id:non_zero_and_max_string ->
  ?game_session_name:non_zero_and_max_string ->
  ?maximum_player_session_count:whole_number ->
  ?game_properties:game_property_list ->
  ?status:game_session_placement_state ->
  ?game_session_queue_name:game_session_queue_name ->
  ?placement_id:id_string_model ->
  unit ->
  game_session_placement

val make_stop_game_session_placement_output :
  ?game_session_placement:game_session_placement -> unit -> stop_game_session_placement_output

val make_stop_game_session_placement_input :
  placement_id:id_string_model -> unit -> stop_game_session_placement_input

val make_stop_fleet_actions_output :
  ?fleet_arn:fleet_arn -> ?fleet_id:fleet_id -> unit -> stop_fleet_actions_output

val make_stop_fleet_actions_input :
  ?location:location_string_model ->
  actions:fleet_action_list ->
  fleet_id:fleet_id_or_arn ->
  unit ->
  stop_fleet_actions_input

val make_attribute_value :
  ?sd_m:player_attribute_string_double_map ->
  ?s_l:player_attribute_string_list ->
  ?n:double_object ->
  ?s:player_attribute_string ->
  unit ->
  attribute_value

val make_player :
  ?latency_in_ms:latency_map ->
  ?team:non_zero_and_max_string ->
  ?player_attributes:player_attribute_map ->
  ?player_id:player_id ->
  unit ->
  player

val make_matched_player_session :
  ?player_session_id:player_session_id -> ?player_id:player_id -> unit -> matched_player_session

val make_game_session_connection_info :
  ?player_gateway_status:player_gateway_status ->
  ?matched_player_sessions:matched_player_session_list ->
  ?port:positive_integer ->
  ?dns_name:dns_name ->
  ?ip_address:ip_address ->
  ?game_session_arn:arn_string_model ->
  unit ->
  game_session_connection_info

val make_matchmaking_ticket :
  ?estimated_wait_time:whole_number ->
  ?game_session_connection_info:game_session_connection_info ->
  ?players:player_list ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?status_message:string_model ->
  ?status_reason:string_model ->
  ?status:matchmaking_configuration_status ->
  ?configuration_arn:matchmaking_configuration_arn ->
  ?configuration_name:matchmaking_id_string_model ->
  ?ticket_id:matchmaking_id_string_model ->
  unit ->
  matchmaking_ticket

val make_start_matchmaking_output :
  ?matchmaking_ticket:matchmaking_ticket -> unit -> start_matchmaking_output

val make_start_matchmaking_input :
  ?ticket_id:matchmaking_id_string_model ->
  players:player_list ->
  configuration_name:matchmaking_configuration_name ->
  unit ->
  start_matchmaking_input

val make_start_match_backfill_output :
  ?matchmaking_ticket:matchmaking_ticket -> unit -> start_match_backfill_output

val make_start_match_backfill_input :
  ?game_session_arn:arn_string_model ->
  ?ticket_id:matchmaking_id_string_model ->
  players:player_list ->
  configuration_name:matchmaking_configuration_name ->
  unit ->
  start_match_backfill_input

val make_start_game_session_placement_output :
  ?game_session_placement:game_session_placement -> unit -> start_game_session_placement_output

val make_desired_player_session :
  ?player_data:player_data -> ?player_id:player_id -> unit -> desired_player_session

val make_start_game_session_placement_input :
  ?priority_configuration_override:priority_configuration_override ->
  ?game_session_data:large_game_session_data ->
  ?desired_player_sessions:desired_player_session_list ->
  ?player_latencies:player_latency_list ->
  ?game_session_name:non_zero_and_max_string ->
  ?game_properties:game_property_list ->
  maximum_player_session_count:whole_number ->
  game_session_queue_name:game_session_queue_name_or_arn ->
  placement_id:id_string_model ->
  unit ->
  start_game_session_placement_input

val make_start_fleet_actions_output :
  ?fleet_arn:fleet_arn -> ?fleet_id:fleet_id -> unit -> start_fleet_actions_output

val make_start_fleet_actions_input :
  ?location:location_string_model ->
  actions:fleet_action_list ->
  fleet_id:fleet_id_or_arn ->
  unit ->
  start_fleet_actions_input

val make_search_game_sessions_output :
  ?next_token:non_zero_and_max_string ->
  ?game_sessions:game_session_list ->
  unit ->
  search_game_sessions_output

val make_search_game_sessions_input :
  ?next_token:non_zero_and_max_string ->
  ?limit:positive_integer ->
  ?sort_expression:non_zero_and_max_string ->
  ?filter_expression:non_zero_and_max_string ->
  ?location:location_string_model ->
  ?alias_id:alias_id_or_arn ->
  ?fleet_id:fleet_id_or_arn ->
  unit ->
  search_game_sessions_input

val make_scaling_policy :
  ?location:location_string_model ->
  ?update_status:location_update_status ->
  ?target_configuration:target_configuration ->
  ?policy_type:policy_type ->
  ?metric_name:metric_name ->
  ?evaluation_periods:positive_integer ->
  ?threshold:double ->
  ?comparison_operator:comparison_operator_type ->
  ?scaling_adjustment_type:scaling_adjustment_type ->
  ?scaling_adjustment:integer ->
  ?status:scaling_status_type ->
  ?name:non_zero_and_max_string ->
  ?fleet_arn:fleet_arn ->
  ?fleet_id:fleet_id ->
  unit ->
  scaling_policy

val make_resume_game_server_group_output :
  ?game_server_group:game_server_group -> unit -> resume_game_server_group_output

val make_resume_game_server_group_input :
  resume_actions:game_server_group_actions ->
  game_server_group_name:game_server_group_name_or_arn ->
  unit ->
  resume_game_server_group_input

val make_resolve_alias_output :
  ?fleet_arn:fleet_arn -> ?fleet_id:fleet_id -> unit -> resolve_alias_output

val make_resolve_alias_input : alias_id:alias_id_or_arn -> unit -> resolve_alias_input

val make_aws_credentials :
  ?session_token:non_empty_string ->
  ?secret_access_key:non_empty_string ->
  ?access_key_id:non_empty_string ->
  unit ->
  aws_credentials

val make_request_upload_credentials_output :
  ?storage_location:s3_location ->
  ?upload_credentials:aws_credentials ->
  unit ->
  request_upload_credentials_output

val make_request_upload_credentials_input :
  build_id:build_id_or_arn -> unit -> request_upload_credentials_input

val make_register_game_server_output :
  ?game_server:game_server -> unit -> register_game_server_output

val make_register_game_server_input :
  ?game_server_data:game_server_data ->
  ?connection_info:game_server_connection_info ->
  instance_id:game_server_instance_id ->
  game_server_id:game_server_id ->
  game_server_group_name:game_server_group_name_or_arn ->
  unit ->
  register_game_server_input

val make_container_attribute :
  ?container_runtime_id:non_empty_string ->
  ?container_name:non_zero_and128_max_ascii_string ->
  unit ->
  container_attribute

val make_compute :
  ?game_server_container_group_definition_arn:container_group_definition_name_or_arn ->
  ?container_attributes:container_attributes ->
  ?instance_id:instance_id ->
  ?game_lift_agent_endpoint:game_lift_agent_endpoint_output ->
  ?game_lift_service_sdk_endpoint:game_lift_service_sdk_endpoint_output ->
  ?type_:ec2_instance_type ->
  ?operating_system:operating_system ->
  ?creation_time:timestamp ->
  ?location:location_string_model ->
  ?compute_status:compute_status ->
  ?dns_name:dns_name ->
  ?ip_address:ip_address ->
  ?compute_arn:compute_arn ->
  ?compute_name:compute_name ->
  ?fleet_arn:fleet_arn ->
  ?fleet_id:fleet_id ->
  unit ->
  compute

val make_register_compute_output : ?compute:compute -> unit -> register_compute_output

val make_register_compute_input :
  ?location:location_string_model ->
  ?ip_address:ip_address ->
  ?dns_name:dns_name_input ->
  ?certificate_path:non_zero_and_max_string ->
  compute_name:compute_name ->
  fleet_id:fleet_id_or_arn ->
  unit ->
  register_compute_input

val make_put_scaling_policy_output :
  ?name:non_zero_and_max_string -> unit -> put_scaling_policy_output

val make_put_scaling_policy_input :
  ?target_configuration:target_configuration ->
  ?policy_type:policy_type ->
  ?evaluation_periods:positive_integer ->
  ?comparison_operator:comparison_operator_type ->
  ?threshold:double ->
  ?scaling_adjustment_type:scaling_adjustment_type ->
  ?scaling_adjustment:integer ->
  metric_name:metric_name ->
  fleet_id:fleet_id_or_arn ->
  name:non_zero_and_max_string ->
  unit ->
  put_scaling_policy_input

val make_player_session :
  ?player_data:player_data ->
  ?port:port_number ->
  ?dns_name:dns_name ->
  ?ip_address:ip_address ->
  ?status:player_session_status ->
  ?termination_time:timestamp ->
  ?creation_time:timestamp ->
  ?fleet_arn:fleet_arn ->
  ?fleet_id:fleet_id ->
  ?game_session_id:non_zero_and_max_string ->
  ?player_id:player_id ->
  ?player_session_id:player_session_id ->
  unit ->
  player_session

val make_player_gateway_configuration :
  ?game_server_ip_protocol_supported:game_server_ip_protocol_supported ->
  unit ->
  player_gateway_configuration

val make_player_connection_endpoint :
  ?port:port_number -> ?ip_address:ip_address -> unit -> player_connection_endpoint

val make_player_connection_detail :
  ?expiration:timestamp ->
  ?player_gateway_token:max_string ->
  ?endpoints:player_connection_endpoint_list ->
  ?player_id:player_id ->
  unit ->
  player_connection_detail

val make_ping_beacon : ?udp_endpoint:udp_endpoint -> unit -> ping_beacon

val make_matchmaking_rule_set :
  ?creation_time:timestamp ->
  ?rule_set_arn:matchmaking_rule_set_arn ->
  ?rule_set_name:matchmaking_id_string_model ->
  rule_set_body:rule_set_body ->
  unit ->
  matchmaking_rule_set

val make_locational_deployment :
  ?deployment_status:deployment_status -> unit -> locational_deployment

val make_location_state :
  ?player_gateway_status:player_gateway_status ->
  ?status:fleet_status ->
  ?location:location_string_model ->
  unit ->
  location_state

val make_location_model :
  ?ping_beacon:ping_beacon ->
  ?location_arn:location_arn_model ->
  ?location_name:location_string_model ->
  unit ->
  location_model

val make_location_configuration : location:location_string_model -> unit -> location_configuration

val make_location_attributes :
  ?update_status:location_update_status ->
  ?stopped_actions:fleet_action_list ->
  ?location_state:location_state ->
  unit ->
  location_attributes

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_list_scripts_output :
  ?next_token:non_empty_string -> ?scripts:script_list -> unit -> list_scripts_output

val make_list_scripts_input :
  ?next_token:non_empty_string -> ?limit:positive_integer -> unit -> list_scripts_input

val make_list_locations_output :
  ?next_token:non_zero_and_max_string ->
  ?locations:location_model_list ->
  unit ->
  list_locations_output

val make_list_locations_input :
  ?next_token:non_zero_and_max_string ->
  ?limit:list_locations_limit ->
  ?filters:location_filter_list ->
  unit ->
  list_locations_input

val make_list_game_servers_output :
  ?next_token:non_zero_and_max_string ->
  ?game_servers:game_servers ->
  unit ->
  list_game_servers_output

val make_list_game_servers_input :
  ?next_token:non_zero_and_max_string ->
  ?limit:positive_integer ->
  ?sort_order:sort_order ->
  game_server_group_name:game_server_group_name_or_arn ->
  unit ->
  list_game_servers_input

val make_list_game_server_groups_output :
  ?next_token:non_zero_and_max_string ->
  ?game_server_groups:game_server_groups ->
  unit ->
  list_game_server_groups_output

val make_list_game_server_groups_input :
  ?next_token:non_zero_and_max_string ->
  ?limit:positive_integer ->
  unit ->
  list_game_server_groups_input

val make_list_fleets_output :
  ?next_token:non_zero_and_max_string -> ?fleet_ids:fleet_id_list -> unit -> list_fleets_output

val make_list_fleets_input :
  ?next_token:non_zero_and_max_string ->
  ?limit:positive_integer ->
  ?script_id:script_id_or_arn ->
  ?build_id:build_id_or_arn ->
  unit ->
  list_fleets_input

val make_fleet_deployment :
  ?creation_time:timestamp ->
  ?deployment_configuration:deployment_configuration ->
  ?deployment_status:deployment_status ->
  ?rollback_per_instance_binary_arn:fleet_binary_arn ->
  ?per_instance_binary_arn:fleet_binary_arn ->
  ?rollback_game_server_binary_arn:fleet_binary_arn ->
  ?game_server_binary_arn:fleet_binary_arn ->
  ?fleet_id:fleet_id ->
  ?deployment_id:deployment_id ->
  unit ->
  fleet_deployment

val make_list_fleet_deployments_output :
  ?next_token:non_zero_and_max_string ->
  ?fleet_deployments:fleet_deployments ->
  unit ->
  list_fleet_deployments_output

val make_list_fleet_deployments_input :
  ?next_token:non_zero_and_max_string ->
  ?limit:positive_integer ->
  ?fleet_id:fleet_id_or_arn ->
  unit ->
  list_fleet_deployments_input

val make_list_container_group_definitions_output :
  ?next_token:non_zero_and_max_string ->
  ?container_group_definitions:container_group_definition_list ->
  unit ->
  list_container_group_definitions_output

val make_list_container_group_definitions_input :
  ?next_token:non_zero_and_max_string ->
  ?limit:list_container_group_definitions_limit ->
  ?container_group_type:container_group_type ->
  unit ->
  list_container_group_definitions_input

val make_list_container_group_definition_versions_output :
  ?next_token:non_zero_and_max_string ->
  ?container_group_definitions:container_group_definition_list ->
  unit ->
  list_container_group_definition_versions_output

val make_list_container_group_definition_versions_input :
  ?next_token:non_zero_and_max_string ->
  ?limit:list_container_group_definition_versions_limit ->
  name:container_group_definition_name_or_arn ->
  unit ->
  list_container_group_definition_versions_input

val make_list_container_fleets_output :
  ?next_token:non_zero_and_max_string ->
  ?container_fleets:container_fleet_list ->
  unit ->
  list_container_fleets_output

val make_list_container_fleets_input :
  ?next_token:non_zero_and_max_string ->
  ?limit:positive_integer ->
  ?container_group_definition_name:container_group_definition_name_or_arn ->
  unit ->
  list_container_fleets_input

val make_list_compute_output :
  ?next_token:non_zero_and_max_string -> ?compute_list:compute_list -> unit -> list_compute_output

val make_list_compute_input :
  ?next_token:non_zero_and_max_string ->
  ?limit:positive_integer ->
  ?compute_status:list_compute_input_status ->
  ?container_group_definition_name:container_group_definition_name_or_arn ->
  ?location:location_string_model ->
  fleet_id:fleet_id_or_arn ->
  unit ->
  list_compute_input

val make_list_builds_output :
  ?next_token:non_empty_string -> ?builds:build_list -> unit -> list_builds_output

val make_list_builds_input :
  ?next_token:non_empty_string ->
  ?limit:positive_integer ->
  ?status:build_status ->
  unit ->
  list_builds_input

val make_list_aliases_output :
  ?next_token:non_empty_string -> ?aliases:alias_list -> unit -> list_aliases_output

val make_list_aliases_input :
  ?next_token:non_empty_string ->
  ?limit:positive_integer ->
  ?name:non_empty_string ->
  ?routing_strategy_type:routing_strategy_type ->
  unit ->
  list_aliases_input

val make_launch_template_specification :
  ?version:launch_template_version ->
  ?launch_template_name:launch_template_name ->
  ?launch_template_id:launch_template_id ->
  unit ->
  launch_template_specification

val make_instance :
  ?location:location_string_model ->
  ?creation_time:timestamp ->
  ?status:instance_status ->
  ?type_:ec2_instance_type ->
  ?operating_system:operating_system ->
  ?dns_name:dns_name ->
  ?ip_address:ip_address ->
  ?instance_id:instance_id ->
  ?fleet_arn:fleet_arn ->
  ?fleet_id:fleet_id ->
  unit ->
  instance

val make_instance_credentials :
  ?secret:non_empty_string -> ?user_name:non_empty_string -> unit -> instance_credentials

val make_instance_access :
  ?credentials:instance_credentials ->
  ?operating_system:operating_system ->
  ?ip_address:ip_address ->
  ?instance_id:instance_id ->
  ?fleet_id:fleet_id ->
  unit ->
  instance_access

val make_get_player_connection_details_output :
  ?player_connection_details:player_connection_detail_list ->
  ?game_session_id:arn_string_model ->
  unit ->
  get_player_connection_details_output

val make_get_player_connection_details_input :
  player_ids:player_id_list ->
  game_session_id:arn_string_model ->
  unit ->
  get_player_connection_details_input

val make_get_instance_access_output :
  ?instance_access:instance_access -> unit -> get_instance_access_output

val make_get_instance_access_input :
  instance_id:instance_id -> fleet_id:fleet_id_or_arn -> unit -> get_instance_access_input

val make_get_game_session_log_url_output :
  ?pre_signed_url:non_zero_and_max_string -> unit -> get_game_session_log_url_output

val make_get_game_session_log_url_input :
  game_session_id:arn_string_model -> unit -> get_game_session_log_url_input

val make_get_compute_auth_token_output :
  ?expiration_timestamp:timestamp ->
  ?auth_token:compute_auth_token ->
  ?compute_arn:compute_arn ->
  ?compute_name:compute_name_or_arn ->
  ?fleet_arn:fleet_arn ->
  ?fleet_id:fleet_id_or_arn ->
  unit ->
  get_compute_auth_token_output

val make_get_compute_auth_token_input :
  compute_name:compute_name_or_arn ->
  fleet_id:fleet_id_or_arn ->
  unit ->
  get_compute_auth_token_input

val make_container_identifier :
  ?container_runtime_id:non_empty_string ->
  ?container_name:non_zero_and128_max_ascii_string ->
  unit ->
  container_identifier

val make_get_compute_access_output :
  ?container_identifiers:container_identifier_list ->
  ?target:session_target ->
  ?credentials:aws_credentials ->
  ?compute_arn:compute_arn ->
  ?compute_name:compute_name_or_arn ->
  ?fleet_arn:fleet_arn ->
  ?fleet_id:fleet_id_or_arn ->
  unit ->
  get_compute_access_output

val make_get_compute_access_input :
  compute_name:compute_name_or_arn -> fleet_id:fleet_id_or_arn -> unit -> get_compute_access_input

val make_game_session_detail :
  ?protection_policy:protection_policy -> ?game_session:game_session -> unit -> game_session_detail

val make_game_server_instance :
  ?instance_status:game_server_instance_status ->
  ?instance_id:game_server_instance_id ->
  ?game_server_group_arn:game_server_group_arn ->
  ?game_server_group_name:game_server_group_name ->
  unit ->
  game_server_instance

val make_game_server_group_auto_scaling_policy :
  ?estimated_instance_warmup:positive_integer ->
  target_tracking_configuration:target_tracking_configuration ->
  unit ->
  game_server_group_auto_scaling_policy

val make_game_server_container_group_counts :
  ?terminatin_g:whole_number ->
  ?idl_e:whole_number ->
  ?activ_e:whole_number ->
  ?pendin_g:whole_number ->
  unit ->
  game_server_container_group_counts

val make_describe_vpc_peering_connections_output :
  ?vpc_peering_connections:vpc_peering_connection_list ->
  unit ->
  describe_vpc_peering_connections_output

val make_describe_vpc_peering_connections_input :
  ?fleet_id:fleet_id -> unit -> describe_vpc_peering_connections_input

val make_describe_vpc_peering_authorizations_output :
  ?vpc_peering_authorizations:vpc_peering_authorization_list ->
  unit ->
  describe_vpc_peering_authorizations_output

val make_describe_vpc_peering_authorizations_input : unit -> unit
val make_describe_script_output : ?script:script -> unit -> describe_script_output
val make_describe_script_input : script_id:script_id_or_arn -> unit -> describe_script_input

val make_describe_scaling_policies_output :
  ?next_token:non_zero_and_max_string ->
  ?scaling_policies:scaling_policy_list ->
  unit ->
  describe_scaling_policies_output

val make_describe_scaling_policies_input :
  ?location:location_string_model ->
  ?next_token:non_zero_and_max_string ->
  ?limit:positive_integer ->
  ?status_filter:scaling_status_type ->
  fleet_id:fleet_id_or_arn ->
  unit ->
  describe_scaling_policies_input

val make_describe_runtime_configuration_output :
  ?runtime_configuration:runtime_configuration -> unit -> describe_runtime_configuration_output

val make_describe_runtime_configuration_input :
  fleet_id:fleet_id_or_arn -> unit -> describe_runtime_configuration_input

val make_describe_player_sessions_output :
  ?next_token:non_zero_and_max_string ->
  ?player_sessions:player_session_list ->
  unit ->
  describe_player_sessions_output

val make_describe_player_sessions_input :
  ?next_token:non_zero_and_max_string ->
  ?limit:positive_integer ->
  ?player_session_status_filter:non_zero_and_max_string ->
  ?player_session_id:player_session_id ->
  ?player_id:player_id ->
  ?game_session_id:arn_string_model ->
  unit ->
  describe_player_sessions_input

val make_describe_matchmaking_rule_sets_output :
  ?next_token:non_zero_and_max_string ->
  rule_sets:matchmaking_rule_set_list ->
  unit ->
  describe_matchmaking_rule_sets_output

val make_describe_matchmaking_rule_sets_input :
  ?next_token:non_zero_and_max_string ->
  ?limit:rule_set_limit ->
  ?names:matchmaking_rule_set_name_list ->
  unit ->
  describe_matchmaking_rule_sets_input

val make_describe_matchmaking_configurations_output :
  ?next_token:non_zero_and_max_string ->
  ?configurations:matchmaking_configuration_list ->
  unit ->
  describe_matchmaking_configurations_output

val make_describe_matchmaking_configurations_input :
  ?next_token:non_zero_and_max_string ->
  ?limit:positive_integer ->
  ?rule_set_name:matchmaking_rule_set_name ->
  ?names:matchmaking_configuration_name_list ->
  unit ->
  describe_matchmaking_configurations_input

val make_describe_matchmaking_output :
  ?ticket_list:matchmaking_ticket_list -> unit -> describe_matchmaking_output

val make_describe_matchmaking_input :
  ticket_ids:matchmaking_id_list -> unit -> describe_matchmaking_input

val make_describe_instances_output :
  ?next_token:non_zero_and_max_string ->
  ?instances:instance_list ->
  unit ->
  describe_instances_output

val make_describe_instances_input :
  ?location:location_string_model ->
  ?next_token:non_zero_and_max_string ->
  ?limit:positive_integer ->
  ?instance_id:instance_id ->
  fleet_id:fleet_id_or_arn ->
  unit ->
  describe_instances_input

val make_describe_game_sessions_output :
  ?next_token:non_zero_and_max_string ->
  ?game_sessions:game_session_list ->
  unit ->
  describe_game_sessions_output

val make_describe_game_sessions_input :
  ?next_token:non_zero_and_max_string ->
  ?limit:positive_integer ->
  ?status_filter:non_zero_and_max_string ->
  ?location:location_string_model ->
  ?alias_id:alias_id_or_arn ->
  ?game_session_id:arn_string_model ->
  ?fleet_id:fleet_id_or_arn ->
  unit ->
  describe_game_sessions_input

val make_describe_game_session_queues_output :
  ?next_token:non_zero_and_max_string ->
  ?game_session_queues:game_session_queue_list ->
  unit ->
  describe_game_session_queues_output

val make_describe_game_session_queues_input :
  ?next_token:non_zero_and_max_string ->
  ?limit:positive_integer ->
  ?names:game_session_queue_name_or_arn_list ->
  unit ->
  describe_game_session_queues_input

val make_describe_game_session_placement_output :
  ?game_session_placement:game_session_placement -> unit -> describe_game_session_placement_output

val make_describe_game_session_placement_input :
  placement_id:id_string_model -> unit -> describe_game_session_placement_input

val make_describe_game_session_details_output :
  ?next_token:non_zero_and_max_string ->
  ?game_session_details:game_session_detail_list ->
  unit ->
  describe_game_session_details_output

val make_describe_game_session_details_input :
  ?next_token:non_zero_and_max_string ->
  ?limit:positive_integer ->
  ?status_filter:non_zero_and_max_string ->
  ?location:location_string_model ->
  ?alias_id:alias_id_or_arn ->
  ?game_session_id:arn_string_model ->
  ?fleet_id:fleet_id_or_arn ->
  unit ->
  describe_game_session_details_input

val make_describe_game_server_instances_output :
  ?next_token:non_zero_and_max_string ->
  ?game_server_instances:game_server_instances ->
  unit ->
  describe_game_server_instances_output

val make_describe_game_server_instances_input :
  ?next_token:non_zero_and_max_string ->
  ?limit:positive_integer ->
  ?instance_ids:game_server_instance_ids ->
  game_server_group_name:game_server_group_name_or_arn ->
  unit ->
  describe_game_server_instances_input

val make_describe_game_server_group_output :
  ?game_server_group:game_server_group -> unit -> describe_game_server_group_output

val make_describe_game_server_group_input :
  game_server_group_name:game_server_group_name_or_arn -> unit -> describe_game_server_group_input

val make_describe_game_server_output :
  ?game_server:game_server -> unit -> describe_game_server_output

val make_describe_game_server_input :
  game_server_id:game_server_id ->
  game_server_group_name:game_server_group_name_or_arn ->
  unit ->
  describe_game_server_input

val make_fleet_utilization :
  ?location:location_string_model ->
  ?maximum_player_session_count:whole_number ->
  ?current_player_session_count:whole_number ->
  ?active_game_session_count:whole_number ->
  ?active_server_process_count:whole_number ->
  ?fleet_arn:fleet_arn ->
  ?fleet_id:fleet_id ->
  unit ->
  fleet_utilization

val make_describe_fleet_utilization_output :
  ?next_token:non_zero_and_max_string ->
  ?fleet_utilization:fleet_utilization_list ->
  unit ->
  describe_fleet_utilization_output

val make_describe_fleet_utilization_input :
  ?next_token:non_zero_and_max_string ->
  ?limit:positive_integer ->
  ?fleet_ids:fleet_id_or_arn_list ->
  unit ->
  describe_fleet_utilization_input

val make_describe_fleet_port_settings_output :
  ?location:location_string_model ->
  ?update_status:location_update_status ->
  ?inbound_permissions:ip_permissions_list ->
  ?fleet_arn:fleet_arn ->
  ?fleet_id:fleet_id ->
  unit ->
  describe_fleet_port_settings_output

val make_describe_fleet_port_settings_input :
  ?location:location_string_model ->
  fleet_id:fleet_id_or_arn ->
  unit ->
  describe_fleet_port_settings_input

val make_describe_fleet_location_utilization_output :
  ?fleet_utilization:fleet_utilization -> unit -> describe_fleet_location_utilization_output

val make_describe_fleet_location_utilization_input :
  location:location_string_model ->
  fleet_id:fleet_id_or_arn ->
  unit ->
  describe_fleet_location_utilization_input

val make_ec2_instance_counts :
  ?terminatin_g:whole_number ->
  ?idl_e:whole_number ->
  ?activ_e:whole_number ->
  ?pendin_g:whole_number ->
  ?maximu_m:whole_number ->
  ?minimu_m:whole_number ->
  ?desire_d:whole_number ->
  unit ->
  ec2_instance_counts

val make_fleet_capacity :
  ?managed_capacity_configuration:managed_capacity_configuration ->
  ?game_server_container_group_counts:game_server_container_group_counts ->
  ?location:location_string_model ->
  ?instance_counts:ec2_instance_counts ->
  ?instance_type:ec2_instance_type ->
  ?fleet_arn:fleet_arn ->
  ?fleet_id:fleet_id ->
  unit ->
  fleet_capacity

val make_describe_fleet_location_capacity_output :
  ?fleet_capacity:fleet_capacity -> unit -> describe_fleet_location_capacity_output

val make_describe_fleet_location_capacity_input :
  location:location_string_model ->
  fleet_id:fleet_id_or_arn ->
  unit ->
  describe_fleet_location_capacity_input

val make_describe_fleet_location_attributes_output :
  ?next_token:non_zero_and_max_string ->
  ?location_attributes:location_attributes_list ->
  ?fleet_arn:fleet_arn ->
  ?fleet_id:fleet_id_or_arn ->
  unit ->
  describe_fleet_location_attributes_output

val make_describe_fleet_location_attributes_input :
  ?next_token:non_zero_and_max_string ->
  ?limit:positive_integer ->
  ?locations:location_list ->
  fleet_id:fleet_id_or_arn ->
  unit ->
  describe_fleet_location_attributes_input

val make_event :
  ?count:event_count ->
  ?pre_signed_log_url:non_zero_and_max_string ->
  ?event_time:timestamp ->
  ?message:non_empty_string ->
  ?event_code:event_code ->
  ?resource_id:non_zero_and_max_string ->
  ?event_id:non_zero_and_max_string ->
  unit ->
  event

val make_describe_fleet_events_output :
  ?next_token:non_zero_and_max_string -> ?events:event_list -> unit -> describe_fleet_events_output

val make_describe_fleet_events_input :
  ?next_token:non_zero_and_max_string ->
  ?limit:positive_integer ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  fleet_id:fleet_id_or_arn ->
  unit ->
  describe_fleet_events_input

val make_describe_fleet_deployment_output :
  ?locational_deployments:locational_deployments ->
  ?fleet_deployment:fleet_deployment ->
  unit ->
  describe_fleet_deployment_output

val make_describe_fleet_deployment_input :
  ?deployment_id:deployment_id ->
  fleet_id:fleet_id_or_arn ->
  unit ->
  describe_fleet_deployment_input

val make_describe_fleet_capacity_output :
  ?next_token:non_zero_and_max_string ->
  ?fleet_capacity:fleet_capacity_list ->
  unit ->
  describe_fleet_capacity_output

val make_describe_fleet_capacity_input :
  ?next_token:non_zero_and_max_string ->
  ?limit:positive_integer ->
  ?fleet_ids:fleet_id_or_arn_list ->
  unit ->
  describe_fleet_capacity_input

val make_certificate_configuration :
  certificate_type:certificate_type -> unit -> certificate_configuration

val make_fleet_attributes :
  ?player_gateway_configuration:player_gateway_configuration ->
  ?player_gateway_mode:player_gateway_mode ->
  ?instance_role_credentials_provider:instance_role_credentials_provider ->
  ?anywhere_configuration:anywhere_configuration ->
  ?compute_type:compute_type ->
  ?certificate_configuration:certificate_configuration ->
  ?instance_role_arn:non_empty_string ->
  ?stopped_actions:fleet_action_list ->
  ?metric_groups:metric_group_list ->
  ?resource_creation_limit_policy:resource_creation_limit_policy ->
  ?operating_system:operating_system ->
  ?new_game_session_protection_policy:protection_policy ->
  ?log_paths:string_list ->
  ?server_launch_parameters:launch_parameters_string_model ->
  ?server_launch_path:launch_path_string_model ->
  ?script_arn:script_arn ->
  ?script_id:script_id ->
  ?build_arn:build_arn ->
  ?build_id:build_id ->
  ?status:fleet_status ->
  ?termination_time:timestamp ->
  ?creation_time:timestamp ->
  ?name:non_zero_and_max_string ->
  ?description:non_zero_and_max_string ->
  ?instance_type:ec2_instance_type ->
  ?fleet_type:fleet_type ->
  ?fleet_arn:fleet_arn ->
  ?fleet_id:fleet_id ->
  unit ->
  fleet_attributes

val make_describe_fleet_attributes_output :
  ?next_token:non_zero_and_max_string ->
  ?fleet_attributes:fleet_attributes_list ->
  unit ->
  describe_fleet_attributes_output

val make_describe_fleet_attributes_input :
  ?next_token:non_zero_and_max_string ->
  ?limit:positive_integer ->
  ?fleet_ids:fleet_id_or_arn_list ->
  unit ->
  describe_fleet_attributes_input

val make_ec2_instance_limit :
  ?location:location_string_model ->
  ?instance_limit:whole_number ->
  ?current_instances:whole_number ->
  ?ec2_instance_type:ec2_instance_type ->
  unit ->
  ec2_instance_limit

val make_describe_ec2_instance_limits_output :
  ?ec2_instance_limits:ec2_instance_limit_list -> unit -> describe_ec2_instance_limits_output

val make_describe_ec2_instance_limits_input :
  ?location:location_string_model ->
  ?ec2_instance_type:ec2_instance_type ->
  unit ->
  describe_ec2_instance_limits_input

val make_container_port_mapping :
  ?protocol:ip_protocol ->
  ?connection_port:port_number ->
  ?container_port:port_number ->
  unit ->
  container_port_mapping

val make_container_group_port_mapping :
  ?container_port_mappings:container_port_mapping_list ->
  ?container_runtime_id:non_empty_string ->
  ?container_name:non_zero_and128_max_ascii_string ->
  unit ->
  container_group_port_mapping

val make_describe_container_group_port_mappings_output :
  ?container_group_port_mappings:container_group_port_mapping_list ->
  ?instance_id:instance_id ->
  ?compute_name:compute_name ->
  ?container_group_type:container_group_type ->
  ?container_group_definition_arn:container_group_definition_arn ->
  ?location:location_string_model ->
  ?fleet_arn:fleet_arn ->
  ?fleet_id:fleet_id ->
  unit ->
  describe_container_group_port_mappings_output

val make_describe_container_group_port_mappings_input :
  ?container_name:non_zero_and128_max_ascii_string ->
  ?instance_id:instance_id ->
  ?compute_name:compute_name_or_arn ->
  container_group_type:container_group_type ->
  fleet_id:fleet_id_or_arn ->
  unit ->
  describe_container_group_port_mappings_input

val make_describe_container_group_definition_output :
  ?container_group_definition:container_group_definition ->
  unit ->
  describe_container_group_definition_output

val make_describe_container_group_definition_input :
  ?version_number:positive_integer ->
  name:container_group_definition_name_or_arn ->
  unit ->
  describe_container_group_definition_input

val make_describe_container_fleet_output :
  ?container_fleet:container_fleet -> unit -> describe_container_fleet_output

val make_describe_container_fleet_input :
  fleet_id:fleet_id_or_arn -> unit -> describe_container_fleet_input

val make_describe_compute_output : ?compute:compute -> unit -> describe_compute_output

val make_describe_compute_input :
  compute_name:compute_name_or_arn -> fleet_id:fleet_id_or_arn -> unit -> describe_compute_input

val make_describe_build_output : ?build:build -> unit -> describe_build_output
val make_describe_build_input : build_id:build_id_or_arn -> unit -> describe_build_input
val make_describe_alias_output : ?alias:alias -> unit -> describe_alias_output
val make_describe_alias_input : alias_id:alias_id_or_arn -> unit -> describe_alias_input

val make_deregister_game_server_input :
  game_server_id:game_server_id ->
  game_server_group_name:game_server_group_name_or_arn ->
  unit ->
  deregister_game_server_input

val make_deregister_compute_output : unit -> unit

val make_deregister_compute_input :
  compute_name:compute_name_or_arn -> fleet_id:fleet_id_or_arn -> unit -> deregister_compute_input

val make_delete_vpc_peering_connection_output : unit -> unit

val make_delete_vpc_peering_connection_input :
  vpc_peering_connection_id:non_zero_and_max_string ->
  fleet_id:fleet_id ->
  unit ->
  delete_vpc_peering_connection_input

val make_delete_vpc_peering_authorization_output : unit -> unit

val make_delete_vpc_peering_authorization_input :
  peer_vpc_id:non_zero_and_max_string ->
  game_lift_aws_account_id:non_zero_and_max_string ->
  unit ->
  delete_vpc_peering_authorization_input

val make_delete_script_input : script_id:script_id_or_arn -> unit -> delete_script_input

val make_delete_scaling_policy_input :
  fleet_id:fleet_id_or_arn -> name:non_zero_and_max_string -> unit -> delete_scaling_policy_input

val make_delete_matchmaking_rule_set_output : unit -> unit

val make_delete_matchmaking_rule_set_input :
  name:matchmaking_rule_set_name -> unit -> delete_matchmaking_rule_set_input

val make_delete_matchmaking_configuration_output : unit -> unit

val make_delete_matchmaking_configuration_input :
  name:matchmaking_configuration_name -> unit -> delete_matchmaking_configuration_input

val make_delete_location_output : unit -> unit

val make_delete_location_input :
  location_name:custom_location_name_or_arn_model -> unit -> delete_location_input

val make_delete_game_session_queue_output : unit -> unit

val make_delete_game_session_queue_input :
  name:game_session_queue_name_or_arn -> unit -> delete_game_session_queue_input

val make_delete_game_server_group_output :
  ?game_server_group:game_server_group -> unit -> delete_game_server_group_output

val make_delete_game_server_group_input :
  ?delete_option:game_server_group_delete_option ->
  game_server_group_name:game_server_group_name_or_arn ->
  unit ->
  delete_game_server_group_input

val make_delete_fleet_locations_output :
  ?location_states:location_state_list ->
  ?fleet_arn:fleet_arn ->
  ?fleet_id:fleet_id_or_arn ->
  unit ->
  delete_fleet_locations_output

val make_delete_fleet_locations_input :
  locations:location_list -> fleet_id:fleet_id_or_arn -> unit -> delete_fleet_locations_input

val make_delete_fleet_input : fleet_id:fleet_id_or_arn -> unit -> delete_fleet_input
val make_delete_container_group_definition_output : unit -> unit

val make_delete_container_group_definition_input :
  ?version_count_to_retain:whole_number ->
  ?version_number:positive_integer ->
  name:container_group_definition_name_or_arn ->
  unit ->
  delete_container_group_definition_input

val make_delete_container_fleet_output : unit -> unit

val make_delete_container_fleet_input :
  fleet_id:fleet_id_or_arn -> unit -> delete_container_fleet_input

val make_delete_build_input : build_id:build_id_or_arn -> unit -> delete_build_input
val make_delete_alias_input : alias_id:alias_id_or_arn -> unit -> delete_alias_input
val make_create_vpc_peering_connection_output : unit -> unit

val make_create_vpc_peering_connection_input :
  peer_vpc_id:non_zero_and_max_string ->
  peer_vpc_aws_account_id:non_zero_and_max_string ->
  fleet_id:fleet_id ->
  unit ->
  create_vpc_peering_connection_input

val make_create_vpc_peering_authorization_output :
  ?vpc_peering_authorization:vpc_peering_authorization ->
  unit ->
  create_vpc_peering_authorization_output

val make_create_vpc_peering_authorization_input :
  peer_vpc_id:non_zero_and_max_string ->
  game_lift_aws_account_id:non_zero_and_max_string ->
  unit ->
  create_vpc_peering_authorization_input

val make_create_script_output : ?script:script -> unit -> create_script_output

val make_create_script_input :
  ?node_js_version:node_js_version ->
  ?tags:tag_list ->
  ?zip_file:zip_blob ->
  ?storage_location:s3_location ->
  ?version:non_zero_and_max_string ->
  ?name:non_zero_and_max_string ->
  unit ->
  create_script_input

val make_create_player_sessions_output :
  ?player_sessions:player_session_list -> unit -> create_player_sessions_output

val make_create_player_sessions_input :
  ?player_data_map:player_data_map ->
  player_ids:player_id_list ->
  game_session_id:arn_string_model ->
  unit ->
  create_player_sessions_input

val make_create_player_session_output :
  ?player_session:player_session -> unit -> create_player_session_output

val make_create_player_session_input :
  ?player_data:player_data ->
  player_id:player_id ->
  game_session_id:arn_string_model ->
  unit ->
  create_player_session_input

val make_create_matchmaking_rule_set_output :
  rule_set:matchmaking_rule_set -> unit -> create_matchmaking_rule_set_output

val make_create_matchmaking_rule_set_input :
  ?tags:tag_list ->
  rule_set_body:rule_set_body ->
  name:matchmaking_id_string_model ->
  unit ->
  create_matchmaking_rule_set_input

val make_create_matchmaking_configuration_output :
  ?configuration:matchmaking_configuration -> unit -> create_matchmaking_configuration_output

val make_create_matchmaking_configuration_input :
  ?tags:tag_list ->
  ?flex_match_mode:flex_match_mode ->
  ?backfill_mode:backfill_mode ->
  ?game_session_data:game_session_data ->
  ?game_properties:game_property_list ->
  ?custom_event_data:custom_event_data ->
  ?additional_player_count:whole_number ->
  ?notification_target:sns_arn_string_model ->
  ?acceptance_timeout_seconds:matchmaking_acceptance_timeout_integer ->
  ?game_session_queue_arns:queue_arns_list ->
  ?description:non_zero_and_max_string ->
  rule_set_name:matchmaking_rule_set_name ->
  acceptance_required:boolean_model ->
  request_timeout_seconds:matchmaking_request_timeout_integer ->
  name:matchmaking_id_string_model ->
  unit ->
  create_matchmaking_configuration_input

val make_create_location_output : ?location:location_model -> unit -> create_location_output

val make_create_location_input :
  ?tags:tag_list ->
  location_name:custom_input_location_string_model ->
  unit ->
  create_location_input

val make_create_game_session_queue_output :
  ?game_session_queue:game_session_queue -> unit -> create_game_session_queue_output

val make_create_game_session_queue_input :
  ?tags:tag_list ->
  ?notification_target:queue_sns_arn_string_model ->
  ?custom_event_data:queue_custom_event_data ->
  ?priority_configuration:priority_configuration ->
  ?filter_configuration:filter_configuration ->
  ?destinations:game_session_queue_destination_list ->
  ?player_latency_policies:player_latency_policy_list ->
  ?timeout_in_seconds:whole_number ->
  name:game_session_queue_name ->
  unit ->
  create_game_session_queue_input

val make_create_game_session_output :
  ?game_session:game_session -> unit -> create_game_session_output

val make_create_game_session_input :
  ?location:location_string_model ->
  ?game_session_data:large_game_session_data ->
  ?idempotency_token:id_string_model ->
  ?game_session_id:id_string_model ->
  ?creator_id:non_zero_and_max_string ->
  ?game_properties:game_property_list ->
  ?name:non_zero_and_max_string ->
  ?alias_id:alias_id_or_arn ->
  ?fleet_id:fleet_id_or_arn ->
  maximum_player_session_count:whole_number ->
  unit ->
  create_game_session_input

val make_create_game_server_group_output :
  ?game_server_group:game_server_group -> unit -> create_game_server_group_output

val make_create_game_server_group_input :
  ?tags:tag_list ->
  ?vpc_subnets:vpc_subnets ->
  ?game_server_protection_policy:game_server_protection_policy ->
  ?balancing_strategy:balancing_strategy ->
  ?auto_scaling_policy:game_server_group_auto_scaling_policy ->
  instance_definitions:instance_definitions ->
  launch_template:launch_template_specification ->
  max_size:positive_integer ->
  min_size:whole_number ->
  role_arn:iam_role_arn ->
  game_server_group_name:game_server_group_name ->
  unit ->
  create_game_server_group_input

val make_create_fleet_locations_output :
  ?location_states:location_state_list ->
  ?fleet_arn:fleet_arn ->
  ?fleet_id:fleet_id_or_arn ->
  unit ->
  create_fleet_locations_output

val make_create_fleet_locations_input :
  locations:location_configuration_list ->
  fleet_id:fleet_id_or_arn ->
  unit ->
  create_fleet_locations_input

val make_create_fleet_output :
  ?location_states:location_state_list ->
  ?fleet_attributes:fleet_attributes ->
  unit ->
  create_fleet_output

val make_create_fleet_input :
  ?player_gateway_configuration:player_gateway_configuration ->
  ?player_gateway_mode:player_gateway_mode ->
  ?instance_role_credentials_provider:instance_role_credentials_provider ->
  ?anywhere_configuration:anywhere_configuration ->
  ?compute_type:compute_type ->
  ?tags:tag_list ->
  ?locations:location_configuration_list ->
  ?certificate_configuration:certificate_configuration ->
  ?instance_role_arn:non_empty_string ->
  ?fleet_type:fleet_type ->
  ?peer_vpc_id:non_zero_and_max_string ->
  ?peer_vpc_aws_account_id:non_zero_and_max_string ->
  ?metric_groups:metric_group_list ->
  ?resource_creation_limit_policy:resource_creation_limit_policy ->
  ?runtime_configuration:runtime_configuration ->
  ?new_game_session_protection_policy:protection_policy ->
  ?ec2_inbound_permissions:ip_permissions_list ->
  ?ec2_instance_type:ec2_instance_type ->
  ?log_paths:string_list ->
  ?server_launch_parameters:launch_parameters_string_model ->
  ?server_launch_path:launch_path_string_model ->
  ?script_id:script_id_or_arn ->
  ?build_id:build_id_or_arn ->
  ?description:non_zero_and_max_string ->
  name:non_zero_and_max_string ->
  unit ->
  create_fleet_input

val make_create_container_group_definition_output :
  ?container_group_definition:container_group_definition ->
  unit ->
  create_container_group_definition_output

val make_create_container_group_definition_input :
  ?tags:tag_list ->
  ?version_description:non_zero_and_max_string ->
  ?support_container_definitions:support_container_definition_input_list ->
  ?game_server_container_definition:game_server_container_definition_input ->
  ?container_group_type:container_group_type ->
  operating_system:container_operating_system ->
  total_vcpu_limit:container_total_vcpu_limit ->
  total_memory_limit_mebibytes:container_total_memory_limit ->
  name:container_group_definition_name ->
  unit ->
  create_container_group_definition_input

val make_create_container_fleet_output :
  ?container_fleet:container_fleet -> unit -> create_container_fleet_output

val make_create_container_fleet_input :
  ?player_gateway_mode:player_gateway_mode ->
  ?tags:tag_list ->
  ?log_configuration:log_configuration ->
  ?game_session_creation_limit_policy:game_session_creation_limit_policy ->
  ?new_game_session_protection_policy:protection_policy ->
  ?metric_groups:metric_group_list ->
  ?locations:location_configuration_list ->
  ?billing_type:container_fleet_billing_type ->
  ?instance_type:non_zero_and_max_string ->
  ?game_server_container_groups_per_instance:game_server_container_groups_per_instance ->
  ?instance_inbound_permissions:ip_permissions_list ->
  ?instance_connection_port_range:connection_port_range ->
  ?per_instance_container_group_definition_name:container_group_definition_name_or_arn ->
  ?game_server_container_group_definition_name:container_group_definition_name_or_arn ->
  ?description:non_zero_and_max_string ->
  fleet_role_arn:iam_role_arn ->
  unit ->
  create_container_fleet_input

val make_create_build_output :
  ?storage_location:s3_location ->
  ?upload_credentials:aws_credentials ->
  ?build:build ->
  unit ->
  create_build_output

val make_create_build_input :
  ?server_sdk_version:server_sdk_version ->
  ?tags:tag_list ->
  ?operating_system:operating_system ->
  ?storage_location:s3_location ->
  ?version:non_zero_and_max_string ->
  ?name:non_zero_and_max_string ->
  unit ->
  create_build_input

val make_create_alias_output : ?alias:alias -> unit -> create_alias_output

val make_create_alias_input :
  ?tags:tag_list ->
  ?description:non_zero_and_max_string ->
  routing_strategy:routing_strategy ->
  name:non_blank_and_length_constraint_string ->
  unit ->
  create_alias_input

val make_claim_game_server_output : ?game_server:game_server -> unit -> claim_game_server_output

val make_claim_filter_option :
  ?instance_statuses:filter_instance_statuses -> unit -> claim_filter_option

val make_claim_game_server_input :
  ?filter_option:claim_filter_option ->
  ?game_server_data:game_server_data ->
  ?game_server_id:game_server_id ->
  game_server_group_name:game_server_group_name_or_arn ->
  unit ->
  claim_game_server_input

val make_accept_match_output : unit -> unit

val make_accept_match_input :
  acceptance_type:acceptance_type ->
  player_ids:player_ids_for_accept_match ->
  ticket_id:matchmaking_id_string_model ->
  unit ->
  accept_match_input
