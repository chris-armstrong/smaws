open Types

val make_accept_match_output : unit -> unit

val make_accept_match_input :
  ticket_id:matchmaking_id_string_model ->
  player_ids:player_ids_for_accept_match ->
  acceptance_type:acceptance_type ->
  unit ->
  accept_match_input

val make_routing_strategy :
  ?type_:routing_strategy_type ->
  ?fleet_id:fleet_id ->
  ?message:free_text ->
  unit ->
  routing_strategy

val make_alias :
  ?alias_id:alias_id ->
  ?name:non_blank_and_length_constraint_string ->
  ?alias_arn:alias_arn ->
  ?description:free_text ->
  ?routing_strategy:routing_strategy ->
  ?creation_time:timestamp ->
  ?last_updated_time:timestamp ->
  unit ->
  alias

val make_anywhere_configuration :
  cost:non_negative_limited_length_double -> unit -> anywhere_configuration

val make_attribute_value :
  ?s:player_attribute_string ->
  ?n:double_object ->
  ?s_l:player_attribute_string_list ->
  ?sd_m:player_attribute_string_double_map ->
  unit ->
  attribute_value

val make_aws_credentials :
  ?access_key_id:non_empty_string ->
  ?secret_access_key:non_empty_string ->
  ?session_token:non_empty_string ->
  unit ->
  aws_credentials

val make_build :
  ?build_id:build_id ->
  ?build_arn:build_arn ->
  ?name:free_text ->
  ?version:free_text ->
  ?status:build_status ->
  ?size_on_disk:whole_number_long ->
  ?operating_system:operating_system ->
  ?creation_time:timestamp ->
  ?server_sdk_version:server_sdk_version ->
  unit ->
  build

val make_certificate_configuration :
  certificate_type:certificate_type -> unit -> certificate_configuration

val make_claim_filter_option :
  ?instance_statuses:filter_instance_statuses -> unit -> claim_filter_option

val make_game_server :
  ?game_server_group_name:game_server_group_name ->
  ?game_server_group_arn:game_server_group_arn ->
  ?game_server_id:game_server_id ->
  ?instance_id:game_server_instance_id ->
  ?connection_info:game_server_connection_info ->
  ?game_server_data:game_server_data ->
  ?claim_status:game_server_claim_status ->
  ?utilization_status:game_server_utilization_status ->
  ?registration_time:timestamp ->
  ?last_claim_time:timestamp ->
  ?last_health_check_time:timestamp ->
  unit ->
  game_server

val make_claim_game_server_output : ?game_server:game_server -> unit -> claim_game_server_output

val make_claim_game_server_input :
  ?game_server_id:game_server_id ->
  ?game_server_data:game_server_data ->
  ?filter_option:claim_filter_option ->
  game_server_group_name:game_server_group_name_or_arn ->
  unit ->
  claim_game_server_input

val make_container_attribute :
  ?container_name:non_zero_and128_max_ascii_string ->
  ?container_runtime_id:non_empty_string ->
  unit ->
  container_attribute

val make_compute :
  ?fleet_id:fleet_id ->
  ?fleet_arn:fleet_arn ->
  ?compute_name:compute_name ->
  ?compute_arn:compute_arn ->
  ?ip_address:ip_address ->
  ?dns_name:dns_name ->
  ?compute_status:compute_status ->
  ?location:location_string_model ->
  ?creation_time:timestamp ->
  ?operating_system:operating_system ->
  ?type_:ec2_instance_type ->
  ?game_lift_service_sdk_endpoint:game_lift_service_sdk_endpoint_output ->
  ?game_lift_agent_endpoint:game_lift_agent_endpoint_output ->
  ?instance_id:instance_id ->
  ?container_attributes:container_attributes ->
  ?game_server_container_group_definition_arn:container_group_definition_name_or_arn ->
  unit ->
  compute

val make_connection_port_range :
  from_port:port_number -> to_port:port_number -> unit -> connection_port_range

val make_container_dependency :
  container_name:non_zero_and128_max_ascii_string ->
  condition:container_dependency_condition ->
  unit ->
  container_dependency

val make_container_environment :
  name:non_zero_and255_max_string ->
  value:non_zero_and255_max_string ->
  unit ->
  container_environment

val make_container_fleet_location_attributes :
  ?location:location_string_model ->
  ?status:container_fleet_location_status ->
  ?player_gateway_status:player_gateway_status ->
  unit ->
  container_fleet_location_attributes

val make_log_configuration :
  ?log_destination:log_destination ->
  ?s3_bucket_name:non_empty_string ->
  ?log_group_arn:log_group_arn_string_model ->
  unit ->
  log_configuration

val make_deployment_details : ?latest_deployment_id:deployment_id -> unit -> deployment_details

val make_game_session_creation_limit_policy :
  ?new_game_sessions_per_creator:whole_number ->
  ?policy_period_in_minutes:whole_number ->
  unit ->
  game_session_creation_limit_policy

val make_ip_permission :
  from_port:port_number ->
  to_port:port_number ->
  ip_range:ip_range ->
  protocol:ip_protocol ->
  unit ->
  ip_permission

val make_container_fleet :
  ?fleet_id:fleet_id ->
  ?fleet_arn:fleet_arn ->
  ?fleet_role_arn:iam_role_arn ->
  ?game_server_container_group_definition_name:container_group_definition_name ->
  ?game_server_container_group_definition_arn:container_group_definition_arn ->
  ?per_instance_container_group_definition_name:container_group_definition_name ->
  ?per_instance_container_group_definition_arn:container_group_definition_arn ->
  ?instance_connection_port_range:connection_port_range ->
  ?instance_inbound_permissions:ip_permissions_list ->
  ?game_server_container_groups_per_instance:game_server_container_groups_per_instance ->
  ?maximum_game_server_container_groups_per_instance:
    maximum_game_server_container_groups_per_instance ->
  ?instance_type:non_zero_and_max_string ->
  ?billing_type:container_fleet_billing_type ->
  ?description:non_zero_and_max_string ->
  ?creation_time:timestamp ->
  ?metric_groups:metric_group_list ->
  ?new_game_session_protection_policy:protection_policy ->
  ?game_session_creation_limit_policy:game_session_creation_limit_policy ->
  ?status:container_fleet_status ->
  ?deployment_details:deployment_details ->
  ?log_configuration:log_configuration ->
  ?location_attributes:container_fleet_location_attributes_list ->
  ?player_gateway_mode:player_gateway_mode ->
  unit ->
  container_fleet

val make_linux_capabilities : ?include_:linux_capability_list -> unit -> linux_capabilities

val make_container_port_range :
  from_port:port_number ->
  to_port:port_number ->
  protocol:ip_protocol ->
  unit ->
  container_port_range

val make_container_port_configuration :
  container_port_ranges:container_port_range_list -> unit -> container_port_configuration

val make_container_health_check :
  ?interval:container_health_check_interval ->
  ?retries:container_health_check_retries ->
  ?start_period:container_health_check_start_period ->
  ?timeout:container_health_check_timeout ->
  command:container_command_string_list ->
  unit ->
  container_health_check

val make_container_mount_point :
  ?container_path:container_path_string ->
  ?access_level:container_mount_point_access_level ->
  instance_path:instance_path_string ->
  unit ->
  container_mount_point

val make_support_container_definition :
  ?container_name:non_zero_and128_max_ascii_string ->
  ?depends_on:container_dependency_list ->
  ?mount_points:container_mount_point_list ->
  ?environment_override:container_environment_list ->
  ?essential:boolean_model ->
  ?health_check:container_health_check ->
  ?image_uri:image_uri_string ->
  ?memory_hard_limit_mebibytes:container_memory_limit ->
  ?port_configuration:container_port_configuration ->
  ?resolved_image_digest:sha256 ->
  ?vcpu:container_vcpu ->
  ?linux_capabilities:linux_capabilities ->
  unit ->
  support_container_definition

val make_game_server_container_definition :
  ?container_name:non_zero_and128_max_ascii_string ->
  ?depends_on:container_dependency_list ->
  ?mount_points:container_mount_point_list ->
  ?environment_override:container_environment_list ->
  ?image_uri:image_uri_string ->
  ?port_configuration:container_port_configuration ->
  ?resolved_image_digest:sha256 ->
  ?server_sdk_version:server_sdk_version ->
  ?linux_capabilities:linux_capabilities ->
  unit ->
  game_server_container_definition

val make_container_group_definition :
  ?container_group_definition_arn:container_group_definition_arn ->
  ?creation_time:timestamp ->
  ?operating_system:container_operating_system ->
  ?container_group_type:container_group_type ->
  ?total_memory_limit_mebibytes:container_total_memory_limit ->
  ?total_vcpu_limit:container_total_vcpu_limit ->
  ?game_server_container_definition:game_server_container_definition ->
  ?support_container_definitions:support_container_definition_list ->
  ?version_number:positive_integer ->
  ?version_description:non_zero_and_max_string ->
  ?status:container_group_definition_status ->
  ?status_reason:non_zero_and_max_string ->
  name:container_group_definition_name ->
  unit ->
  container_group_definition

val make_container_port_mapping :
  ?container_port:port_number ->
  ?connection_port:port_number ->
  ?protocol:ip_protocol ->
  unit ->
  container_port_mapping

val make_container_group_port_mapping :
  ?container_name:non_zero_and128_max_ascii_string ->
  ?container_runtime_id:non_empty_string ->
  ?container_port_mappings:container_port_mapping_list ->
  unit ->
  container_group_port_mapping

val make_container_identifier :
  ?container_name:non_zero_and128_max_ascii_string ->
  ?container_runtime_id:non_empty_string ->
  unit ->
  container_identifier

val make_create_alias_output : ?alias:alias -> unit -> create_alias_output
val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_create_alias_input :
  ?description:non_zero_and_max_string ->
  ?tags:tag_list ->
  name:non_blank_and_length_constraint_string ->
  routing_strategy:routing_strategy ->
  unit ->
  create_alias_input

val make_s3_location :
  ?bucket:non_empty_string ->
  ?key:non_empty_string ->
  ?role_arn:non_empty_string ->
  ?object_version:non_empty_string ->
  unit ->
  s3_location

val make_create_build_output :
  ?build:build ->
  ?upload_credentials:aws_credentials ->
  ?storage_location:s3_location ->
  unit ->
  create_build_output

val make_create_build_input :
  ?name:non_zero_and_max_string ->
  ?version:non_zero_and_max_string ->
  ?storage_location:s3_location ->
  ?operating_system:operating_system ->
  ?tags:tag_list ->
  ?server_sdk_version:server_sdk_version ->
  unit ->
  create_build_input

val make_create_container_fleet_output :
  ?container_fleet:container_fleet -> unit -> create_container_fleet_output

val make_location_configuration : location:location_string_model -> unit -> location_configuration

val make_create_container_fleet_input :
  ?description:non_zero_and_max_string ->
  ?game_server_container_group_definition_name:container_group_definition_name_or_arn ->
  ?per_instance_container_group_definition_name:container_group_definition_name_or_arn ->
  ?instance_connection_port_range:connection_port_range ->
  ?instance_inbound_permissions:ip_permissions_list ->
  ?game_server_container_groups_per_instance:game_server_container_groups_per_instance ->
  ?instance_type:non_zero_and_max_string ->
  ?billing_type:container_fleet_billing_type ->
  ?locations:location_configuration_list ->
  ?metric_groups:metric_group_list ->
  ?new_game_session_protection_policy:protection_policy ->
  ?game_session_creation_limit_policy:game_session_creation_limit_policy ->
  ?log_configuration:log_configuration ->
  ?tags:tag_list ->
  ?player_gateway_mode:player_gateway_mode ->
  fleet_role_arn:iam_role_arn ->
  unit ->
  create_container_fleet_input

val make_create_container_group_definition_output :
  ?container_group_definition:container_group_definition ->
  unit ->
  create_container_group_definition_output

val make_support_container_definition_input :
  ?depends_on:container_dependency_list ->
  ?mount_points:container_mount_point_list ->
  ?environment_override:container_environment_list ->
  ?essential:boolean_model ->
  ?health_check:container_health_check ->
  ?memory_hard_limit_mebibytes:container_memory_limit ->
  ?port_configuration:container_port_configuration ->
  ?vcpu:container_vcpu ->
  ?linux_capabilities:linux_capabilities ->
  container_name:non_zero_and128_max_ascii_string ->
  image_uri:image_uri_string ->
  unit ->
  support_container_definition_input

val make_game_server_container_definition_input :
  ?depends_on:container_dependency_list ->
  ?mount_points:container_mount_point_list ->
  ?environment_override:container_environment_list ->
  ?linux_capabilities:linux_capabilities ->
  container_name:non_zero_and128_max_ascii_string ->
  image_uri:image_uri_string ->
  port_configuration:container_port_configuration ->
  server_sdk_version:server_sdk_version ->
  unit ->
  game_server_container_definition_input

val make_create_container_group_definition_input :
  ?container_group_type:container_group_type ->
  ?game_server_container_definition:game_server_container_definition_input ->
  ?support_container_definitions:support_container_definition_input_list ->
  ?version_description:non_zero_and_max_string ->
  ?tags:tag_list ->
  name:container_group_definition_name ->
  total_memory_limit_mebibytes:container_total_memory_limit ->
  total_vcpu_limit:container_total_vcpu_limit ->
  operating_system:container_operating_system ->
  unit ->
  create_container_group_definition_input

val make_location_state :
  ?location:location_string_model ->
  ?status:fleet_status ->
  ?player_gateway_status:player_gateway_status ->
  unit ->
  location_state

val make_player_gateway_configuration :
  ?game_server_ip_protocol_supported:game_server_ip_protocol_supported ->
  unit ->
  player_gateway_configuration

val make_resource_creation_limit_policy :
  ?new_game_sessions_per_creator:whole_number ->
  ?policy_period_in_minutes:whole_number ->
  unit ->
  resource_creation_limit_policy

val make_fleet_attributes :
  ?fleet_id:fleet_id ->
  ?fleet_arn:fleet_arn ->
  ?fleet_type:fleet_type ->
  ?instance_type:ec2_instance_type ->
  ?description:non_zero_and_max_string ->
  ?name:non_zero_and_max_string ->
  ?creation_time:timestamp ->
  ?termination_time:timestamp ->
  ?status:fleet_status ->
  ?build_id:build_id ->
  ?build_arn:build_arn ->
  ?script_id:script_id ->
  ?script_arn:script_arn ->
  ?server_launch_path:launch_path_string_model ->
  ?server_launch_parameters:launch_parameters_string_model ->
  ?log_paths:string_list ->
  ?new_game_session_protection_policy:protection_policy ->
  ?operating_system:operating_system ->
  ?resource_creation_limit_policy:resource_creation_limit_policy ->
  ?metric_groups:metric_group_list ->
  ?stopped_actions:fleet_action_list ->
  ?instance_role_arn:non_empty_string ->
  ?certificate_configuration:certificate_configuration ->
  ?compute_type:compute_type ->
  ?anywhere_configuration:anywhere_configuration ->
  ?instance_role_credentials_provider:instance_role_credentials_provider ->
  ?player_gateway_mode:player_gateway_mode ->
  ?player_gateway_configuration:player_gateway_configuration ->
  unit ->
  fleet_attributes

val make_create_fleet_output :
  ?fleet_attributes:fleet_attributes ->
  ?location_states:location_state_list ->
  unit ->
  create_fleet_output

val make_server_process :
  ?parameters:launch_parameters_string_model ->
  launch_path:launch_path_string_model ->
  concurrent_executions:positive_integer ->
  unit ->
  server_process

val make_runtime_configuration :
  ?server_processes:server_process_list ->
  ?max_concurrent_game_session_activations:max_concurrent_game_session_activations ->
  ?game_session_activation_timeout_seconds:game_session_activation_timeout_seconds ->
  unit ->
  runtime_configuration

val make_create_fleet_input :
  ?description:non_zero_and_max_string ->
  ?build_id:build_id_or_arn ->
  ?script_id:script_id_or_arn ->
  ?server_launch_path:launch_path_string_model ->
  ?server_launch_parameters:launch_parameters_string_model ->
  ?log_paths:string_list ->
  ?ec2_instance_type:ec2_instance_type ->
  ?ec2_inbound_permissions:ip_permissions_list ->
  ?new_game_session_protection_policy:protection_policy ->
  ?runtime_configuration:runtime_configuration ->
  ?resource_creation_limit_policy:resource_creation_limit_policy ->
  ?metric_groups:metric_group_list ->
  ?peer_vpc_aws_account_id:non_zero_and_max_string ->
  ?peer_vpc_id:non_zero_and_max_string ->
  ?fleet_type:fleet_type ->
  ?instance_role_arn:non_empty_string ->
  ?certificate_configuration:certificate_configuration ->
  ?locations:location_configuration_list ->
  ?tags:tag_list ->
  ?compute_type:compute_type ->
  ?anywhere_configuration:anywhere_configuration ->
  ?instance_role_credentials_provider:instance_role_credentials_provider ->
  ?player_gateway_mode:player_gateway_mode ->
  ?player_gateway_configuration:player_gateway_configuration ->
  name:non_zero_and_max_string ->
  unit ->
  create_fleet_input

val make_create_fleet_locations_output :
  ?fleet_id:fleet_id_or_arn ->
  ?fleet_arn:fleet_arn ->
  ?location_states:location_state_list ->
  unit ->
  create_fleet_locations_output

val make_create_fleet_locations_input :
  fleet_id:fleet_id_or_arn ->
  locations:location_configuration_list ->
  unit ->
  create_fleet_locations_input

val make_instance_definition :
  ?weighted_capacity:weighted_capacity ->
  instance_type:game_server_group_instance_type ->
  unit ->
  instance_definition

val make_game_server_group :
  ?game_server_group_name:game_server_group_name ->
  ?game_server_group_arn:game_server_group_arn ->
  ?role_arn:iam_role_arn ->
  ?instance_definitions:instance_definitions ->
  ?balancing_strategy:balancing_strategy ->
  ?game_server_protection_policy:game_server_protection_policy ->
  ?auto_scaling_group_arn:auto_scaling_group_arn ->
  ?status:game_server_group_status ->
  ?status_reason:non_zero_and_max_string ->
  ?suspended_actions:game_server_group_actions ->
  ?creation_time:timestamp ->
  ?last_updated_time:timestamp ->
  unit ->
  game_server_group

val make_create_game_server_group_output :
  ?game_server_group:game_server_group -> unit -> create_game_server_group_output

val make_target_tracking_configuration :
  target_value:non_negative_double -> unit -> target_tracking_configuration

val make_game_server_group_auto_scaling_policy :
  ?estimated_instance_warmup:positive_integer ->
  target_tracking_configuration:target_tracking_configuration ->
  unit ->
  game_server_group_auto_scaling_policy

val make_launch_template_specification :
  ?launch_template_id:launch_template_id ->
  ?launch_template_name:launch_template_name ->
  ?version:launch_template_version ->
  unit ->
  launch_template_specification

val make_create_game_server_group_input :
  ?auto_scaling_policy:game_server_group_auto_scaling_policy ->
  ?balancing_strategy:balancing_strategy ->
  ?game_server_protection_policy:game_server_protection_policy ->
  ?vpc_subnets:vpc_subnets ->
  ?tags:tag_list ->
  game_server_group_name:game_server_group_name ->
  role_arn:iam_role_arn ->
  min_size:whole_number ->
  max_size:positive_integer ->
  launch_template:launch_template_specification ->
  instance_definitions:instance_definitions ->
  unit ->
  create_game_server_group_input

val make_game_property : key:game_property_key -> value:game_property_value -> unit -> game_property

val make_game_session :
  ?game_session_id:non_zero_and_max_string ->
  ?name:non_zero_and_max_string ->
  ?fleet_id:fleet_id ->
  ?fleet_arn:fleet_arn ->
  ?creation_time:timestamp ->
  ?termination_time:timestamp ->
  ?current_player_session_count:whole_number ->
  ?maximum_player_session_count:whole_number ->
  ?status:game_session_status ->
  ?status_reason:game_session_status_reason ->
  ?game_properties:game_property_list ->
  ?ip_address:ip_address ->
  ?dns_name:dns_name ->
  ?port:port_number ->
  ?player_session_creation_policy:player_session_creation_policy ->
  ?creator_id:non_zero_and_max_string ->
  ?game_session_data:large_game_session_data ->
  ?matchmaker_data:matchmaker_data ->
  ?location:location_string_model ->
  ?compute_name:compute_name ->
  ?player_gateway_status:player_gateway_status ->
  unit ->
  game_session

val make_create_game_session_output :
  ?game_session:game_session -> unit -> create_game_session_output

val make_create_game_session_input :
  ?fleet_id:fleet_id_or_arn ->
  ?alias_id:alias_id_or_arn ->
  ?name:non_zero_and_max_string ->
  ?game_properties:game_property_list ->
  ?creator_id:non_zero_and_max_string ->
  ?game_session_id:id_string_model ->
  ?idempotency_token:id_string_model ->
  ?game_session_data:large_game_session_data ->
  ?location:location_string_model ->
  maximum_player_session_count:whole_number ->
  unit ->
  create_game_session_input

val make_priority_configuration :
  ?priority_order:priority_type_list ->
  ?location_order:location_list ->
  unit ->
  priority_configuration

val make_filter_configuration : ?allowed_locations:location_list -> unit -> filter_configuration

val make_game_session_queue_destination :
  ?destination_arn:arn_string_model -> unit -> game_session_queue_destination

val make_player_latency_policy :
  ?maximum_individual_player_latency_milliseconds:whole_number ->
  ?policy_duration_seconds:whole_number ->
  unit ->
  player_latency_policy

val make_game_session_queue :
  ?name:game_session_queue_name ->
  ?game_session_queue_arn:game_session_queue_arn ->
  ?timeout_in_seconds:whole_number ->
  ?player_latency_policies:player_latency_policy_list ->
  ?destinations:game_session_queue_destination_list ->
  ?filter_configuration:filter_configuration ->
  ?priority_configuration:priority_configuration ->
  ?custom_event_data:queue_custom_event_data ->
  ?notification_target:queue_sns_arn_string_model ->
  unit ->
  game_session_queue

val make_create_game_session_queue_output :
  ?game_session_queue:game_session_queue -> unit -> create_game_session_queue_output

val make_create_game_session_queue_input :
  ?timeout_in_seconds:whole_number ->
  ?player_latency_policies:player_latency_policy_list ->
  ?destinations:game_session_queue_destination_list ->
  ?filter_configuration:filter_configuration ->
  ?priority_configuration:priority_configuration ->
  ?custom_event_data:queue_custom_event_data ->
  ?notification_target:queue_sns_arn_string_model ->
  ?tags:tag_list ->
  name:game_session_queue_name ->
  unit ->
  create_game_session_queue_input

val make_udp_endpoint :
  ?domain:non_zero_and_max_string -> ?port:positive_integer -> unit -> udp_endpoint

val make_ping_beacon : ?udp_endpoint:udp_endpoint -> unit -> ping_beacon

val make_location_model :
  ?location_name:location_string_model ->
  ?location_arn:location_arn_model ->
  ?ping_beacon:ping_beacon ->
  unit ->
  location_model

val make_create_location_output : ?location:location_model -> unit -> create_location_output

val make_create_location_input :
  ?tags:tag_list ->
  location_name:custom_input_location_string_model ->
  unit ->
  create_location_input

val make_matchmaking_configuration :
  ?name:matchmaking_id_string_model ->
  ?configuration_arn:matchmaking_configuration_arn ->
  ?description:non_zero_and_max_string ->
  ?game_session_queue_arns:queue_arns_list ->
  ?request_timeout_seconds:matchmaking_request_timeout_integer ->
  ?acceptance_timeout_seconds:matchmaking_acceptance_timeout_integer ->
  ?acceptance_required:boolean_model ->
  ?rule_set_name:matchmaking_id_string_model ->
  ?rule_set_arn:matchmaking_rule_set_arn ->
  ?notification_target:sns_arn_string_model ->
  ?additional_player_count:whole_number ->
  ?custom_event_data:custom_event_data ->
  ?creation_time:timestamp ->
  ?game_properties:game_property_list ->
  ?game_session_data:game_session_data ->
  ?backfill_mode:backfill_mode ->
  ?flex_match_mode:flex_match_mode ->
  unit ->
  matchmaking_configuration

val make_create_matchmaking_configuration_output :
  ?configuration:matchmaking_configuration -> unit -> create_matchmaking_configuration_output

val make_create_matchmaking_configuration_input :
  ?description:non_zero_and_max_string ->
  ?game_session_queue_arns:queue_arns_list ->
  ?acceptance_timeout_seconds:matchmaking_acceptance_timeout_integer ->
  ?notification_target:sns_arn_string_model ->
  ?additional_player_count:whole_number ->
  ?custom_event_data:custom_event_data ->
  ?game_properties:game_property_list ->
  ?game_session_data:game_session_data ->
  ?backfill_mode:backfill_mode ->
  ?flex_match_mode:flex_match_mode ->
  ?tags:tag_list ->
  name:matchmaking_id_string_model ->
  request_timeout_seconds:matchmaking_request_timeout_integer ->
  acceptance_required:boolean_model ->
  rule_set_name:matchmaking_rule_set_name ->
  unit ->
  create_matchmaking_configuration_input

val make_matchmaking_rule_set :
  ?rule_set_name:matchmaking_id_string_model ->
  ?rule_set_arn:matchmaking_rule_set_arn ->
  ?creation_time:timestamp ->
  rule_set_body:rule_set_body ->
  unit ->
  matchmaking_rule_set

val make_create_matchmaking_rule_set_output :
  rule_set:matchmaking_rule_set -> unit -> create_matchmaking_rule_set_output

val make_create_matchmaking_rule_set_input :
  ?tags:tag_list ->
  name:matchmaking_id_string_model ->
  rule_set_body:rule_set_body ->
  unit ->
  create_matchmaking_rule_set_input

val make_player_session :
  ?player_session_id:player_session_id ->
  ?player_id:player_id ->
  ?game_session_id:non_zero_and_max_string ->
  ?fleet_id:fleet_id ->
  ?fleet_arn:fleet_arn ->
  ?creation_time:timestamp ->
  ?termination_time:timestamp ->
  ?status:player_session_status ->
  ?ip_address:ip_address ->
  ?dns_name:dns_name ->
  ?port:port_number ->
  ?player_data:player_data ->
  unit ->
  player_session

val make_create_player_session_output :
  ?player_session:player_session -> unit -> create_player_session_output

val make_create_player_session_input :
  ?player_data:player_data ->
  game_session_id:arn_string_model ->
  player_id:player_id ->
  unit ->
  create_player_session_input

val make_create_player_sessions_output :
  ?player_sessions:player_session_list -> unit -> create_player_sessions_output

val make_create_player_sessions_input :
  ?player_data_map:player_data_map ->
  game_session_id:arn_string_model ->
  player_ids:player_id_list ->
  unit ->
  create_player_sessions_input

val make_script :
  ?script_id:script_id ->
  ?script_arn:script_arn ->
  ?name:non_zero_and_max_string ->
  ?version:non_zero_and_max_string ->
  ?size_on_disk:whole_number_long ->
  ?creation_time:timestamp ->
  ?storage_location:s3_location ->
  ?node_js_version:node_js_version ->
  unit ->
  script

val make_create_script_output : ?script:script -> unit -> create_script_output

val make_create_script_input :
  ?name:non_zero_and_max_string ->
  ?version:non_zero_and_max_string ->
  ?storage_location:s3_location ->
  ?zip_file:zip_blob ->
  ?tags:tag_list ->
  ?node_js_version:node_js_version ->
  unit ->
  create_script_input

val make_vpc_peering_authorization :
  ?game_lift_aws_account_id:non_zero_and_max_string ->
  ?peer_vpc_aws_account_id:non_zero_and_max_string ->
  ?peer_vpc_id:non_zero_and_max_string ->
  ?creation_time:timestamp ->
  ?expiration_time:timestamp ->
  unit ->
  vpc_peering_authorization

val make_create_vpc_peering_authorization_output :
  ?vpc_peering_authorization:vpc_peering_authorization ->
  unit ->
  create_vpc_peering_authorization_output

val make_create_vpc_peering_authorization_input :
  game_lift_aws_account_id:non_zero_and_max_string ->
  peer_vpc_id:non_zero_and_max_string ->
  unit ->
  create_vpc_peering_authorization_input

val make_create_vpc_peering_connection_output : unit -> unit

val make_create_vpc_peering_connection_input :
  fleet_id:fleet_id ->
  peer_vpc_aws_account_id:non_zero_and_max_string ->
  peer_vpc_id:non_zero_and_max_string ->
  unit ->
  create_vpc_peering_connection_input

val make_delete_alias_input : alias_id:alias_id_or_arn -> unit -> delete_alias_input
val make_delete_build_input : build_id:build_id_or_arn -> unit -> delete_build_input
val make_delete_container_fleet_output : unit -> unit

val make_delete_container_fleet_input :
  fleet_id:fleet_id_or_arn -> unit -> delete_container_fleet_input

val make_delete_container_group_definition_output : unit -> unit

val make_delete_container_group_definition_input :
  ?version_number:positive_integer ->
  ?version_count_to_retain:whole_number ->
  name:container_group_definition_name_or_arn ->
  unit ->
  delete_container_group_definition_input

val make_delete_fleet_input : fleet_id:fleet_id_or_arn -> unit -> delete_fleet_input

val make_delete_fleet_locations_output :
  ?fleet_id:fleet_id_or_arn ->
  ?fleet_arn:fleet_arn ->
  ?location_states:location_state_list ->
  unit ->
  delete_fleet_locations_output

val make_delete_fleet_locations_input :
  fleet_id:fleet_id_or_arn -> locations:location_list -> unit -> delete_fleet_locations_input

val make_delete_game_server_group_output :
  ?game_server_group:game_server_group -> unit -> delete_game_server_group_output

val make_delete_game_server_group_input :
  ?delete_option:game_server_group_delete_option ->
  game_server_group_name:game_server_group_name_or_arn ->
  unit ->
  delete_game_server_group_input

val make_delete_game_session_queue_output : unit -> unit

val make_delete_game_session_queue_input :
  name:game_session_queue_name_or_arn -> unit -> delete_game_session_queue_input

val make_delete_location_output : unit -> unit

val make_delete_location_input :
  location_name:custom_location_name_or_arn_model -> unit -> delete_location_input

val make_delete_matchmaking_configuration_output : unit -> unit

val make_delete_matchmaking_configuration_input :
  name:matchmaking_configuration_name -> unit -> delete_matchmaking_configuration_input

val make_delete_matchmaking_rule_set_output : unit -> unit

val make_delete_matchmaking_rule_set_input :
  name:matchmaking_rule_set_name -> unit -> delete_matchmaking_rule_set_input

val make_delete_scaling_policy_input :
  name:non_zero_and_max_string -> fleet_id:fleet_id_or_arn -> unit -> delete_scaling_policy_input

val make_delete_script_input : script_id:script_id_or_arn -> unit -> delete_script_input
val make_delete_vpc_peering_authorization_output : unit -> unit

val make_delete_vpc_peering_authorization_input :
  game_lift_aws_account_id:non_zero_and_max_string ->
  peer_vpc_id:non_zero_and_max_string ->
  unit ->
  delete_vpc_peering_authorization_input

val make_delete_vpc_peering_connection_output : unit -> unit

val make_delete_vpc_peering_connection_input :
  fleet_id:fleet_id ->
  vpc_peering_connection_id:non_zero_and_max_string ->
  unit ->
  delete_vpc_peering_connection_input

val make_deployment_configuration :
  ?protection_strategy:deployment_protection_strategy ->
  ?minimum_healthy_percentage:minimum_healthy_percentage ->
  ?impairment_strategy:deployment_impairment_strategy ->
  unit ->
  deployment_configuration

val make_deregister_compute_output : unit -> unit

val make_deregister_compute_input :
  fleet_id:fleet_id_or_arn -> compute_name:compute_name_or_arn -> unit -> deregister_compute_input

val make_deregister_game_server_input :
  game_server_group_name:game_server_group_name_or_arn ->
  game_server_id:game_server_id ->
  unit ->
  deregister_game_server_input

val make_describe_alias_output : ?alias:alias -> unit -> describe_alias_output
val make_describe_alias_input : alias_id:alias_id_or_arn -> unit -> describe_alias_input
val make_describe_build_output : ?build:build -> unit -> describe_build_output
val make_describe_build_input : build_id:build_id_or_arn -> unit -> describe_build_input
val make_describe_compute_output : ?compute:compute -> unit -> describe_compute_output

val make_describe_compute_input :
  fleet_id:fleet_id_or_arn -> compute_name:compute_name_or_arn -> unit -> describe_compute_input

val make_describe_container_fleet_output :
  ?container_fleet:container_fleet -> unit -> describe_container_fleet_output

val make_describe_container_fleet_input :
  fleet_id:fleet_id_or_arn -> unit -> describe_container_fleet_input

val make_describe_container_group_definition_output :
  ?container_group_definition:container_group_definition ->
  unit ->
  describe_container_group_definition_output

val make_describe_container_group_definition_input :
  ?version_number:positive_integer ->
  name:container_group_definition_name_or_arn ->
  unit ->
  describe_container_group_definition_input

val make_describe_container_group_port_mappings_output :
  ?fleet_id:fleet_id ->
  ?fleet_arn:fleet_arn ->
  ?location:location_string_model ->
  ?container_group_definition_arn:container_group_definition_arn ->
  ?container_group_type:container_group_type ->
  ?compute_name:compute_name ->
  ?instance_id:instance_id ->
  ?container_group_port_mappings:container_group_port_mapping_list ->
  unit ->
  describe_container_group_port_mappings_output

val make_describe_container_group_port_mappings_input :
  ?compute_name:compute_name_or_arn ->
  ?instance_id:instance_id ->
  ?container_name:non_zero_and128_max_ascii_string ->
  fleet_id:fleet_id_or_arn ->
  container_group_type:container_group_type ->
  unit ->
  describe_container_group_port_mappings_input

val make_ec2_instance_limit :
  ?ec2_instance_type:ec2_instance_type ->
  ?current_instances:whole_number ->
  ?instance_limit:whole_number ->
  ?location:location_string_model ->
  unit ->
  ec2_instance_limit

val make_describe_ec2_instance_limits_output :
  ?ec2_instance_limits:ec2_instance_limit_list -> unit -> describe_ec2_instance_limits_output

val make_describe_ec2_instance_limits_input :
  ?ec2_instance_type:ec2_instance_type ->
  ?location:location_string_model ->
  unit ->
  describe_ec2_instance_limits_input

val make_describe_fleet_attributes_output :
  ?fleet_attributes:fleet_attributes_list ->
  ?next_token:non_zero_and_max_string ->
  unit ->
  describe_fleet_attributes_output

val make_describe_fleet_attributes_input :
  ?fleet_ids:fleet_id_or_arn_list ->
  ?limit:positive_integer ->
  ?next_token:non_zero_and_max_string ->
  unit ->
  describe_fleet_attributes_input

val make_managed_capacity_configuration :
  ?zero_capacity_strategy:zero_capacity_strategy ->
  ?scale_in_after_inactivity_minutes:scale_in_after_inactivity_minutes ->
  unit ->
  managed_capacity_configuration

val make_game_server_container_group_counts :
  ?pendin_g:whole_number ->
  ?activ_e:whole_number ->
  ?idl_e:whole_number ->
  ?terminatin_g:whole_number ->
  unit ->
  game_server_container_group_counts

val make_ec2_instance_counts :
  ?desire_d:whole_number ->
  ?minimu_m:whole_number ->
  ?maximu_m:whole_number ->
  ?pendin_g:whole_number ->
  ?activ_e:whole_number ->
  ?idl_e:whole_number ->
  ?terminatin_g:whole_number ->
  unit ->
  ec2_instance_counts

val make_fleet_capacity :
  ?fleet_id:fleet_id ->
  ?fleet_arn:fleet_arn ->
  ?instance_type:ec2_instance_type ->
  ?instance_counts:ec2_instance_counts ->
  ?location:location_string_model ->
  ?game_server_container_group_counts:game_server_container_group_counts ->
  ?managed_capacity_configuration:managed_capacity_configuration ->
  unit ->
  fleet_capacity

val make_describe_fleet_capacity_output :
  ?fleet_capacity:fleet_capacity_list ->
  ?next_token:non_zero_and_max_string ->
  unit ->
  describe_fleet_capacity_output

val make_describe_fleet_capacity_input :
  ?fleet_ids:fleet_id_or_arn_list ->
  ?limit:positive_integer ->
  ?next_token:non_zero_and_max_string ->
  unit ->
  describe_fleet_capacity_input

val make_locational_deployment :
  ?deployment_status:deployment_status -> unit -> locational_deployment

val make_fleet_deployment :
  ?deployment_id:deployment_id ->
  ?fleet_id:fleet_id ->
  ?game_server_binary_arn:fleet_binary_arn ->
  ?rollback_game_server_binary_arn:fleet_binary_arn ->
  ?per_instance_binary_arn:fleet_binary_arn ->
  ?rollback_per_instance_binary_arn:fleet_binary_arn ->
  ?deployment_status:deployment_status ->
  ?deployment_configuration:deployment_configuration ->
  ?creation_time:timestamp ->
  unit ->
  fleet_deployment

val make_describe_fleet_deployment_output :
  ?fleet_deployment:fleet_deployment ->
  ?locational_deployments:locational_deployments ->
  unit ->
  describe_fleet_deployment_output

val make_describe_fleet_deployment_input :
  ?deployment_id:deployment_id ->
  fleet_id:fleet_id_or_arn ->
  unit ->
  describe_fleet_deployment_input

val make_event :
  ?event_id:non_zero_and_max_string ->
  ?resource_id:non_zero_and_max_string ->
  ?event_code:event_code ->
  ?message:non_empty_string ->
  ?event_time:timestamp ->
  ?pre_signed_log_url:non_zero_and_max_string ->
  ?count:event_count ->
  unit ->
  event

val make_describe_fleet_events_output :
  ?events:event_list -> ?next_token:non_zero_and_max_string -> unit -> describe_fleet_events_output

val make_describe_fleet_events_input :
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  ?limit:positive_integer ->
  ?next_token:non_zero_and_max_string ->
  fleet_id:fleet_id_or_arn ->
  unit ->
  describe_fleet_events_input

val make_location_attributes :
  ?location_state:location_state ->
  ?stopped_actions:fleet_action_list ->
  ?update_status:location_update_status ->
  unit ->
  location_attributes

val make_describe_fleet_location_attributes_output :
  ?fleet_id:fleet_id_or_arn ->
  ?fleet_arn:fleet_arn ->
  ?location_attributes:location_attributes_list ->
  ?next_token:non_zero_and_max_string ->
  unit ->
  describe_fleet_location_attributes_output

val make_describe_fleet_location_attributes_input :
  ?locations:location_list ->
  ?limit:positive_integer ->
  ?next_token:non_zero_and_max_string ->
  fleet_id:fleet_id_or_arn ->
  unit ->
  describe_fleet_location_attributes_input

val make_describe_fleet_location_capacity_output :
  ?fleet_capacity:fleet_capacity -> unit -> describe_fleet_location_capacity_output

val make_describe_fleet_location_capacity_input :
  fleet_id:fleet_id_or_arn ->
  location:location_string_model ->
  unit ->
  describe_fleet_location_capacity_input

val make_fleet_utilization :
  ?fleet_id:fleet_id ->
  ?fleet_arn:fleet_arn ->
  ?active_server_process_count:whole_number ->
  ?active_game_session_count:whole_number ->
  ?current_player_session_count:whole_number ->
  ?maximum_player_session_count:whole_number ->
  ?location:location_string_model ->
  unit ->
  fleet_utilization

val make_describe_fleet_location_utilization_output :
  ?fleet_utilization:fleet_utilization -> unit -> describe_fleet_location_utilization_output

val make_describe_fleet_location_utilization_input :
  fleet_id:fleet_id_or_arn ->
  location:location_string_model ->
  unit ->
  describe_fleet_location_utilization_input

val make_describe_fleet_port_settings_output :
  ?fleet_id:fleet_id ->
  ?fleet_arn:fleet_arn ->
  ?inbound_permissions:ip_permissions_list ->
  ?update_status:location_update_status ->
  ?location:location_string_model ->
  unit ->
  describe_fleet_port_settings_output

val make_describe_fleet_port_settings_input :
  ?location:location_string_model ->
  fleet_id:fleet_id_or_arn ->
  unit ->
  describe_fleet_port_settings_input

val make_describe_fleet_utilization_output :
  ?fleet_utilization:fleet_utilization_list ->
  ?next_token:non_zero_and_max_string ->
  unit ->
  describe_fleet_utilization_output

val make_describe_fleet_utilization_input :
  ?fleet_ids:fleet_id_or_arn_list ->
  ?limit:positive_integer ->
  ?next_token:non_zero_and_max_string ->
  unit ->
  describe_fleet_utilization_input

val make_describe_game_server_output :
  ?game_server:game_server -> unit -> describe_game_server_output

val make_describe_game_server_input :
  game_server_group_name:game_server_group_name_or_arn ->
  game_server_id:game_server_id ->
  unit ->
  describe_game_server_input

val make_describe_game_server_group_output :
  ?game_server_group:game_server_group -> unit -> describe_game_server_group_output

val make_describe_game_server_group_input :
  game_server_group_name:game_server_group_name_or_arn -> unit -> describe_game_server_group_input

val make_game_server_instance :
  ?game_server_group_name:game_server_group_name ->
  ?game_server_group_arn:game_server_group_arn ->
  ?instance_id:game_server_instance_id ->
  ?instance_status:game_server_instance_status ->
  unit ->
  game_server_instance

val make_describe_game_server_instances_output :
  ?game_server_instances:game_server_instances ->
  ?next_token:non_zero_and_max_string ->
  unit ->
  describe_game_server_instances_output

val make_describe_game_server_instances_input :
  ?instance_ids:game_server_instance_ids ->
  ?limit:positive_integer ->
  ?next_token:non_zero_and_max_string ->
  game_server_group_name:game_server_group_name_or_arn ->
  unit ->
  describe_game_server_instances_input

val make_game_session_detail :
  ?game_session:game_session -> ?protection_policy:protection_policy -> unit -> game_session_detail

val make_describe_game_session_details_output :
  ?game_session_details:game_session_detail_list ->
  ?next_token:non_zero_and_max_string ->
  unit ->
  describe_game_session_details_output

val make_describe_game_session_details_input :
  ?fleet_id:fleet_id_or_arn ->
  ?game_session_id:arn_string_model ->
  ?alias_id:alias_id_or_arn ->
  ?location:location_string_model ->
  ?status_filter:non_zero_and_max_string ->
  ?limit:positive_integer ->
  ?next_token:non_zero_and_max_string ->
  unit ->
  describe_game_session_details_input

val make_priority_configuration_override :
  ?placement_fallback_strategy:placement_fallback_strategy ->
  location_order:location_order_override_list ->
  unit ->
  priority_configuration_override

val make_placed_player_session :
  ?player_id:player_id -> ?player_session_id:player_session_id -> unit -> placed_player_session

val make_player_latency :
  ?player_id:player_id ->
  ?region_identifier:non_zero_and_max_string ->
  ?latency_in_milliseconds:float_ ->
  unit ->
  player_latency

val make_game_session_placement :
  ?placement_id:id_string_model ->
  ?game_session_queue_name:game_session_queue_name ->
  ?status:game_session_placement_state ->
  ?game_properties:game_property_list ->
  ?maximum_player_session_count:whole_number ->
  ?game_session_name:non_zero_and_max_string ->
  ?game_session_id:non_zero_and_max_string ->
  ?game_session_arn:non_zero_and_max_string ->
  ?game_session_region:non_zero_and_max_string ->
  ?player_latencies:player_latency_list ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  ?ip_address:ip_address ->
  ?dns_name:dns_name ->
  ?port:port_number ->
  ?placed_player_sessions:placed_player_session_list ->
  ?game_session_data:large_game_session_data ->
  ?matchmaker_data:matchmaker_data ->
  ?priority_configuration_override:priority_configuration_override ->
  ?player_gateway_status:player_gateway_status ->
  unit ->
  game_session_placement

val make_describe_game_session_placement_output :
  ?game_session_placement:game_session_placement -> unit -> describe_game_session_placement_output

val make_describe_game_session_placement_input :
  placement_id:id_string_model -> unit -> describe_game_session_placement_input

val make_describe_game_session_queues_output :
  ?game_session_queues:game_session_queue_list ->
  ?next_token:non_zero_and_max_string ->
  unit ->
  describe_game_session_queues_output

val make_describe_game_session_queues_input :
  ?names:game_session_queue_name_or_arn_list ->
  ?limit:positive_integer ->
  ?next_token:non_zero_and_max_string ->
  unit ->
  describe_game_session_queues_input

val make_describe_game_sessions_output :
  ?game_sessions:game_session_list ->
  ?next_token:non_zero_and_max_string ->
  unit ->
  describe_game_sessions_output

val make_describe_game_sessions_input :
  ?fleet_id:fleet_id_or_arn ->
  ?game_session_id:arn_string_model ->
  ?alias_id:alias_id_or_arn ->
  ?location:location_string_model ->
  ?status_filter:non_zero_and_max_string ->
  ?limit:positive_integer ->
  ?next_token:non_zero_and_max_string ->
  unit ->
  describe_game_sessions_input

val make_instance :
  ?fleet_id:fleet_id ->
  ?fleet_arn:fleet_arn ->
  ?instance_id:instance_id ->
  ?ip_address:ip_address ->
  ?dns_name:dns_name ->
  ?operating_system:operating_system ->
  ?type_:ec2_instance_type ->
  ?status:instance_status ->
  ?creation_time:timestamp ->
  ?location:location_string_model ->
  unit ->
  instance

val make_describe_instances_output :
  ?instances:instance_list ->
  ?next_token:non_zero_and_max_string ->
  unit ->
  describe_instances_output

val make_describe_instances_input :
  ?instance_id:instance_id ->
  ?limit:positive_integer ->
  ?next_token:non_zero_and_max_string ->
  ?location:location_string_model ->
  fleet_id:fleet_id_or_arn ->
  unit ->
  describe_instances_input

val make_matched_player_session :
  ?player_id:player_id -> ?player_session_id:player_session_id -> unit -> matched_player_session

val make_game_session_connection_info :
  ?game_session_arn:arn_string_model ->
  ?ip_address:ip_address ->
  ?dns_name:dns_name ->
  ?port:positive_integer ->
  ?matched_player_sessions:matched_player_session_list ->
  ?player_gateway_status:player_gateway_status ->
  unit ->
  game_session_connection_info

val make_player :
  ?player_id:player_id ->
  ?player_attributes:player_attribute_map ->
  ?team:non_zero_and_max_string ->
  ?latency_in_ms:latency_map ->
  unit ->
  player

val make_matchmaking_ticket :
  ?ticket_id:matchmaking_id_string_model ->
  ?configuration_name:matchmaking_id_string_model ->
  ?configuration_arn:matchmaking_configuration_arn ->
  ?status:matchmaking_configuration_status ->
  ?status_reason:string_model ->
  ?status_message:string_model ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  ?players:player_list ->
  ?game_session_connection_info:game_session_connection_info ->
  ?estimated_wait_time:whole_number ->
  unit ->
  matchmaking_ticket

val make_describe_matchmaking_output :
  ?ticket_list:matchmaking_ticket_list -> unit -> describe_matchmaking_output

val make_describe_matchmaking_input :
  ticket_ids:matchmaking_id_list -> unit -> describe_matchmaking_input

val make_describe_matchmaking_configurations_output :
  ?configurations:matchmaking_configuration_list ->
  ?next_token:non_zero_and_max_string ->
  unit ->
  describe_matchmaking_configurations_output

val make_describe_matchmaking_configurations_input :
  ?names:matchmaking_configuration_name_list ->
  ?rule_set_name:matchmaking_rule_set_name ->
  ?limit:positive_integer ->
  ?next_token:non_zero_and_max_string ->
  unit ->
  describe_matchmaking_configurations_input

val make_describe_matchmaking_rule_sets_output :
  ?next_token:non_zero_and_max_string ->
  rule_sets:matchmaking_rule_set_list ->
  unit ->
  describe_matchmaking_rule_sets_output

val make_describe_matchmaking_rule_sets_input :
  ?names:matchmaking_rule_set_name_list ->
  ?limit:rule_set_limit ->
  ?next_token:non_zero_and_max_string ->
  unit ->
  describe_matchmaking_rule_sets_input

val make_describe_player_sessions_output :
  ?player_sessions:player_session_list ->
  ?next_token:non_zero_and_max_string ->
  unit ->
  describe_player_sessions_output

val make_describe_player_sessions_input :
  ?game_session_id:arn_string_model ->
  ?player_id:player_id ->
  ?player_session_id:player_session_id ->
  ?player_session_status_filter:non_zero_and_max_string ->
  ?limit:positive_integer ->
  ?next_token:non_zero_and_max_string ->
  unit ->
  describe_player_sessions_input

val make_describe_runtime_configuration_output :
  ?runtime_configuration:runtime_configuration -> unit -> describe_runtime_configuration_output

val make_describe_runtime_configuration_input :
  fleet_id:fleet_id_or_arn -> unit -> describe_runtime_configuration_input

val make_target_configuration : target_value:double -> unit -> target_configuration

val make_scaling_policy :
  ?fleet_id:fleet_id ->
  ?fleet_arn:fleet_arn ->
  ?name:non_zero_and_max_string ->
  ?status:scaling_status_type ->
  ?scaling_adjustment:integer ->
  ?scaling_adjustment_type:scaling_adjustment_type ->
  ?comparison_operator:comparison_operator_type ->
  ?threshold:double ->
  ?evaluation_periods:positive_integer ->
  ?metric_name:metric_name ->
  ?policy_type:policy_type ->
  ?target_configuration:target_configuration ->
  ?update_status:location_update_status ->
  ?location:location_string_model ->
  unit ->
  scaling_policy

val make_describe_scaling_policies_output :
  ?scaling_policies:scaling_policy_list ->
  ?next_token:non_zero_and_max_string ->
  unit ->
  describe_scaling_policies_output

val make_describe_scaling_policies_input :
  ?status_filter:scaling_status_type ->
  ?limit:positive_integer ->
  ?next_token:non_zero_and_max_string ->
  ?location:location_string_model ->
  fleet_id:fleet_id_or_arn ->
  unit ->
  describe_scaling_policies_input

val make_describe_script_output : ?script:script -> unit -> describe_script_output
val make_describe_script_input : script_id:script_id_or_arn -> unit -> describe_script_input

val make_describe_vpc_peering_authorizations_output :
  ?vpc_peering_authorizations:vpc_peering_authorization_list ->
  unit ->
  describe_vpc_peering_authorizations_output

val make_describe_vpc_peering_authorizations_input : unit -> unit

val make_vpc_peering_connection_status :
  ?code:non_zero_and_max_string ->
  ?message:non_zero_and_max_string ->
  unit ->
  vpc_peering_connection_status

val make_vpc_peering_connection :
  ?fleet_id:fleet_id ->
  ?fleet_arn:fleet_arn ->
  ?ip_v4_cidr_block:non_zero_and_max_string ->
  ?vpc_peering_connection_id:non_zero_and_max_string ->
  ?status:vpc_peering_connection_status ->
  ?peer_vpc_id:non_zero_and_max_string ->
  ?game_lift_vpc_id:non_zero_and_max_string ->
  unit ->
  vpc_peering_connection

val make_describe_vpc_peering_connections_output :
  ?vpc_peering_connections:vpc_peering_connection_list ->
  unit ->
  describe_vpc_peering_connections_output

val make_describe_vpc_peering_connections_input :
  ?fleet_id:fleet_id -> unit -> describe_vpc_peering_connections_input

val make_desired_player_session :
  ?player_id:player_id -> ?player_data:player_data -> unit -> desired_player_session

val make_validate_matchmaking_rule_set_output :
  ?valid:boolean_model -> unit -> validate_matchmaking_rule_set_output

val make_validate_matchmaking_rule_set_input :
  rule_set_body:rule_set_body -> unit -> validate_matchmaking_rule_set_input

val make_update_script_output : ?script:script -> unit -> update_script_output

val make_update_script_input :
  ?name:non_zero_and_max_string ->
  ?version:non_zero_and_max_string ->
  ?storage_location:s3_location ->
  ?zip_file:zip_blob ->
  script_id:script_id_or_arn ->
  unit ->
  update_script_input

val make_update_runtime_configuration_output :
  ?runtime_configuration:runtime_configuration -> unit -> update_runtime_configuration_output

val make_update_runtime_configuration_input :
  fleet_id:fleet_id_or_arn ->
  runtime_configuration:runtime_configuration ->
  unit ->
  update_runtime_configuration_input

val make_update_matchmaking_configuration_output :
  ?configuration:matchmaking_configuration -> unit -> update_matchmaking_configuration_output

val make_update_matchmaking_configuration_input :
  ?description:non_zero_and_max_string ->
  ?game_session_queue_arns:queue_arns_list ->
  ?request_timeout_seconds:matchmaking_request_timeout_integer ->
  ?acceptance_timeout_seconds:matchmaking_acceptance_timeout_integer ->
  ?acceptance_required:boolean_model ->
  ?rule_set_name:matchmaking_rule_set_name ->
  ?notification_target:sns_arn_string_model ->
  ?additional_player_count:whole_number ->
  ?custom_event_data:custom_event_data ->
  ?game_properties:game_property_list ->
  ?game_session_data:game_session_data ->
  ?backfill_mode:backfill_mode ->
  ?flex_match_mode:flex_match_mode ->
  name:matchmaking_configuration_name ->
  unit ->
  update_matchmaking_configuration_input

val make_update_game_session_queue_output :
  ?game_session_queue:game_session_queue -> unit -> update_game_session_queue_output

val make_update_game_session_queue_input :
  ?timeout_in_seconds:whole_number ->
  ?player_latency_policies:player_latency_policy_list ->
  ?destinations:game_session_queue_destination_list ->
  ?filter_configuration:filter_configuration ->
  ?priority_configuration:priority_configuration ->
  ?custom_event_data:queue_custom_event_data ->
  ?notification_target:queue_sns_arn_string_model ->
  name:game_session_queue_name_or_arn ->
  unit ->
  update_game_session_queue_input

val make_update_game_session_output :
  ?game_session:game_session -> unit -> update_game_session_output

val make_update_game_session_input :
  ?maximum_player_session_count:whole_number ->
  ?name:non_zero_and_max_string ->
  ?player_session_creation_policy:player_session_creation_policy ->
  ?protection_policy:protection_policy ->
  ?game_properties:game_property_list ->
  game_session_id:arn_string_model ->
  unit ->
  update_game_session_input

val make_update_game_server_group_output :
  ?game_server_group:game_server_group -> unit -> update_game_server_group_output

val make_update_game_server_group_input :
  ?role_arn:iam_role_arn ->
  ?instance_definitions:instance_definitions ->
  ?game_server_protection_policy:game_server_protection_policy ->
  ?balancing_strategy:balancing_strategy ->
  game_server_group_name:game_server_group_name_or_arn ->
  unit ->
  update_game_server_group_input

val make_update_game_server_output : ?game_server:game_server -> unit -> update_game_server_output

val make_update_game_server_input :
  ?game_server_data:game_server_data ->
  ?utilization_status:game_server_utilization_status ->
  ?health_check:game_server_health_check ->
  game_server_group_name:game_server_group_name_or_arn ->
  game_server_id:game_server_id ->
  unit ->
  update_game_server_input

val make_update_fleet_port_settings_output :
  ?fleet_id:fleet_id -> ?fleet_arn:fleet_arn -> unit -> update_fleet_port_settings_output

val make_update_fleet_port_settings_input :
  ?inbound_permission_authorizations:ip_permissions_list ->
  ?inbound_permission_revocations:ip_permissions_list ->
  fleet_id:fleet_id_or_arn ->
  unit ->
  update_fleet_port_settings_input

val make_update_fleet_capacity_output :
  ?fleet_id:fleet_id ->
  ?fleet_arn:fleet_arn ->
  ?location:location_string_model ->
  ?managed_capacity_configuration:managed_capacity_configuration ->
  unit ->
  update_fleet_capacity_output

val make_update_fleet_capacity_input :
  ?desired_instances:whole_number ->
  ?min_size:whole_number ->
  ?max_size:whole_number ->
  ?location:location_string_model ->
  ?managed_capacity_configuration:managed_capacity_configuration ->
  fleet_id:fleet_id_or_arn ->
  unit ->
  update_fleet_capacity_input

val make_update_fleet_attributes_output :
  ?fleet_id:fleet_id -> ?fleet_arn:fleet_arn -> unit -> update_fleet_attributes_output

val make_update_fleet_attributes_input :
  ?name:non_zero_and_max_string ->
  ?description:non_zero_and_max_string ->
  ?new_game_session_protection_policy:protection_policy ->
  ?resource_creation_limit_policy:resource_creation_limit_policy ->
  ?metric_groups:metric_group_list ->
  ?anywhere_configuration:anywhere_configuration ->
  fleet_id:fleet_id_or_arn ->
  unit ->
  update_fleet_attributes_input

val make_update_container_group_definition_output :
  ?container_group_definition:container_group_definition ->
  unit ->
  update_container_group_definition_output

val make_update_container_group_definition_input :
  ?game_server_container_definition:game_server_container_definition_input ->
  ?support_container_definitions:support_container_definition_input_list ->
  ?total_memory_limit_mebibytes:container_total_memory_limit ->
  ?total_vcpu_limit:container_total_vcpu_limit ->
  ?version_description:non_zero_and_max_string ->
  ?source_version_number:positive_integer ->
  ?operating_system:container_operating_system ->
  name:container_group_definition_name_or_arn ->
  unit ->
  update_container_group_definition_input

val make_update_container_fleet_output :
  ?container_fleet:container_fleet -> unit -> update_container_fleet_output

val make_update_container_fleet_input :
  ?game_server_container_group_definition_name:container_group_definition_name_or_arn ->
  ?per_instance_container_group_definition_name:container_group_definition_name_or_arn ->
  ?game_server_container_groups_per_instance:game_server_container_groups_per_instance ->
  ?instance_connection_port_range:connection_port_range ->
  ?instance_inbound_permission_authorizations:ip_permissions_list ->
  ?instance_inbound_permission_revocations:ip_permissions_list ->
  ?deployment_configuration:deployment_configuration ->
  ?description:non_zero_and_max_string ->
  ?metric_groups:metric_group_list ->
  ?new_game_session_protection_policy:protection_policy ->
  ?game_session_creation_limit_policy:game_session_creation_limit_policy ->
  ?log_configuration:log_configuration ->
  ?remove_attributes:container_fleet_remove_attribute_list ->
  fleet_id:fleet_id_or_arn ->
  unit ->
  update_container_fleet_input

val make_update_build_output : ?build:build -> unit -> update_build_output

val make_update_build_input :
  ?name:non_zero_and_max_string ->
  ?version:non_zero_and_max_string ->
  build_id:build_id_or_arn ->
  unit ->
  update_build_input

val make_update_alias_output : ?alias:alias -> unit -> update_alias_output

val make_update_alias_input :
  ?name:non_blank_and_length_constraint_string ->
  ?description:non_zero_and_max_string ->
  ?routing_strategy:routing_strategy ->
  alias_id:alias_id_or_arn ->
  unit ->
  update_alias_input

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_ar_n:amazon_resource_name -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_terminate_game_session_output :
  ?game_session:game_session -> unit -> terminate_game_session_output

val make_terminate_game_session_input :
  game_session_id:arn_string_model ->
  termination_mode:termination_mode ->
  unit ->
  terminate_game_session_input

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_ar_n:amazon_resource_name -> tags:tag_list -> unit -> tag_resource_request

val make_suspend_game_server_group_output :
  ?game_server_group:game_server_group -> unit -> suspend_game_server_group_output

val make_suspend_game_server_group_input :
  game_server_group_name:game_server_group_name_or_arn ->
  suspend_actions:game_server_group_actions ->
  unit ->
  suspend_game_server_group_input

val make_stop_matchmaking_output : unit -> unit

val make_stop_matchmaking_input :
  ticket_id:matchmaking_id_string_model -> unit -> stop_matchmaking_input

val make_stop_game_session_placement_output :
  ?game_session_placement:game_session_placement -> unit -> stop_game_session_placement_output

val make_stop_game_session_placement_input :
  placement_id:id_string_model -> unit -> stop_game_session_placement_input

val make_stop_fleet_actions_output :
  ?fleet_id:fleet_id -> ?fleet_arn:fleet_arn -> unit -> stop_fleet_actions_output

val make_stop_fleet_actions_input :
  ?location:location_string_model ->
  fleet_id:fleet_id_or_arn ->
  actions:fleet_action_list ->
  unit ->
  stop_fleet_actions_input

val make_start_matchmaking_output :
  ?matchmaking_ticket:matchmaking_ticket -> unit -> start_matchmaking_output

val make_start_matchmaking_input :
  ?ticket_id:matchmaking_id_string_model ->
  configuration_name:matchmaking_configuration_name ->
  players:player_list ->
  unit ->
  start_matchmaking_input

val make_start_match_backfill_output :
  ?matchmaking_ticket:matchmaking_ticket -> unit -> start_match_backfill_output

val make_start_match_backfill_input :
  ?ticket_id:matchmaking_id_string_model ->
  ?game_session_arn:arn_string_model ->
  configuration_name:matchmaking_configuration_name ->
  players:player_list ->
  unit ->
  start_match_backfill_input

val make_start_game_session_placement_output :
  ?game_session_placement:game_session_placement -> unit -> start_game_session_placement_output

val make_start_game_session_placement_input :
  ?game_properties:game_property_list ->
  ?game_session_name:non_zero_and_max_string ->
  ?player_latencies:player_latency_list ->
  ?desired_player_sessions:desired_player_session_list ->
  ?game_session_data:large_game_session_data ->
  ?priority_configuration_override:priority_configuration_override ->
  placement_id:id_string_model ->
  game_session_queue_name:game_session_queue_name_or_arn ->
  maximum_player_session_count:whole_number ->
  unit ->
  start_game_session_placement_input

val make_start_fleet_actions_output :
  ?fleet_id:fleet_id -> ?fleet_arn:fleet_arn -> unit -> start_fleet_actions_output

val make_start_fleet_actions_input :
  ?location:location_string_model ->
  fleet_id:fleet_id_or_arn ->
  actions:fleet_action_list ->
  unit ->
  start_fleet_actions_input

val make_search_game_sessions_output :
  ?game_sessions:game_session_list ->
  ?next_token:non_zero_and_max_string ->
  unit ->
  search_game_sessions_output

val make_search_game_sessions_input :
  ?fleet_id:fleet_id_or_arn ->
  ?alias_id:alias_id_or_arn ->
  ?location:location_string_model ->
  ?filter_expression:non_zero_and_max_string ->
  ?sort_expression:non_zero_and_max_string ->
  ?limit:positive_integer ->
  ?next_token:non_zero_and_max_string ->
  unit ->
  search_game_sessions_input

val make_resume_game_server_group_output :
  ?game_server_group:game_server_group -> unit -> resume_game_server_group_output

val make_resume_game_server_group_input :
  game_server_group_name:game_server_group_name_or_arn ->
  resume_actions:game_server_group_actions ->
  unit ->
  resume_game_server_group_input

val make_resolve_alias_output :
  ?fleet_id:fleet_id -> ?fleet_arn:fleet_arn -> unit -> resolve_alias_output

val make_resolve_alias_input : alias_id:alias_id_or_arn -> unit -> resolve_alias_input

val make_request_upload_credentials_output :
  ?upload_credentials:aws_credentials ->
  ?storage_location:s3_location ->
  unit ->
  request_upload_credentials_output

val make_request_upload_credentials_input :
  build_id:build_id_or_arn -> unit -> request_upload_credentials_input

val make_register_game_server_output :
  ?game_server:game_server -> unit -> register_game_server_output

val make_register_game_server_input :
  ?connection_info:game_server_connection_info ->
  ?game_server_data:game_server_data ->
  game_server_group_name:game_server_group_name_or_arn ->
  game_server_id:game_server_id ->
  instance_id:game_server_instance_id ->
  unit ->
  register_game_server_input

val make_register_compute_output : ?compute:compute -> unit -> register_compute_output

val make_register_compute_input :
  ?certificate_path:non_zero_and_max_string ->
  ?dns_name:dns_name_input ->
  ?ip_address:ip_address ->
  ?location:location_string_model ->
  fleet_id:fleet_id_or_arn ->
  compute_name:compute_name ->
  unit ->
  register_compute_input

val make_put_scaling_policy_output :
  ?name:non_zero_and_max_string -> unit -> put_scaling_policy_output

val make_put_scaling_policy_input :
  ?scaling_adjustment:integer ->
  ?scaling_adjustment_type:scaling_adjustment_type ->
  ?threshold:double ->
  ?comparison_operator:comparison_operator_type ->
  ?evaluation_periods:positive_integer ->
  ?policy_type:policy_type ->
  ?target_configuration:target_configuration ->
  name:non_zero_and_max_string ->
  fleet_id:fleet_id_or_arn ->
  metric_name:metric_name ->
  unit ->
  put_scaling_policy_input

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_list_scripts_output :
  ?scripts:script_list -> ?next_token:non_empty_string -> unit -> list_scripts_output

val make_list_scripts_input :
  ?limit:positive_integer -> ?next_token:non_empty_string -> unit -> list_scripts_input

val make_list_locations_output :
  ?locations:location_model_list ->
  ?next_token:non_zero_and_max_string ->
  unit ->
  list_locations_output

val make_list_locations_input :
  ?filters:location_filter_list ->
  ?limit:list_locations_limit ->
  ?next_token:non_zero_and_max_string ->
  unit ->
  list_locations_input

val make_list_game_servers_output :
  ?game_servers:game_servers ->
  ?next_token:non_zero_and_max_string ->
  unit ->
  list_game_servers_output

val make_list_game_servers_input :
  ?sort_order:sort_order ->
  ?limit:positive_integer ->
  ?next_token:non_zero_and_max_string ->
  game_server_group_name:game_server_group_name_or_arn ->
  unit ->
  list_game_servers_input

val make_list_game_server_groups_output :
  ?game_server_groups:game_server_groups ->
  ?next_token:non_zero_and_max_string ->
  unit ->
  list_game_server_groups_output

val make_list_game_server_groups_input :
  ?limit:positive_integer ->
  ?next_token:non_zero_and_max_string ->
  unit ->
  list_game_server_groups_input

val make_list_fleets_output :
  ?fleet_ids:fleet_id_list -> ?next_token:non_zero_and_max_string -> unit -> list_fleets_output

val make_list_fleets_input :
  ?build_id:build_id_or_arn ->
  ?script_id:script_id_or_arn ->
  ?limit:positive_integer ->
  ?next_token:non_zero_and_max_string ->
  unit ->
  list_fleets_input

val make_list_fleet_deployments_output :
  ?fleet_deployments:fleet_deployments ->
  ?next_token:non_zero_and_max_string ->
  unit ->
  list_fleet_deployments_output

val make_list_fleet_deployments_input :
  ?fleet_id:fleet_id_or_arn ->
  ?limit:positive_integer ->
  ?next_token:non_zero_and_max_string ->
  unit ->
  list_fleet_deployments_input

val make_list_container_group_definition_versions_output :
  ?container_group_definitions:container_group_definition_list ->
  ?next_token:non_zero_and_max_string ->
  unit ->
  list_container_group_definition_versions_output

val make_list_container_group_definition_versions_input :
  ?limit:list_container_group_definition_versions_limit ->
  ?next_token:non_zero_and_max_string ->
  name:container_group_definition_name_or_arn ->
  unit ->
  list_container_group_definition_versions_input

val make_list_container_group_definitions_output :
  ?container_group_definitions:container_group_definition_list ->
  ?next_token:non_zero_and_max_string ->
  unit ->
  list_container_group_definitions_output

val make_list_container_group_definitions_input :
  ?container_group_type:container_group_type ->
  ?limit:list_container_group_definitions_limit ->
  ?next_token:non_zero_and_max_string ->
  unit ->
  list_container_group_definitions_input

val make_list_container_fleets_output :
  ?container_fleets:container_fleet_list ->
  ?next_token:non_zero_and_max_string ->
  unit ->
  list_container_fleets_output

val make_list_container_fleets_input :
  ?container_group_definition_name:container_group_definition_name_or_arn ->
  ?limit:positive_integer ->
  ?next_token:non_zero_and_max_string ->
  unit ->
  list_container_fleets_input

val make_list_compute_output :
  ?compute_list:compute_list -> ?next_token:non_zero_and_max_string -> unit -> list_compute_output

val make_list_compute_input :
  ?location:location_string_model ->
  ?container_group_definition_name:container_group_definition_name_or_arn ->
  ?compute_status:list_compute_input_status ->
  ?limit:positive_integer ->
  ?next_token:non_zero_and_max_string ->
  fleet_id:fleet_id_or_arn ->
  unit ->
  list_compute_input

val make_list_builds_output :
  ?builds:build_list -> ?next_token:non_empty_string -> unit -> list_builds_output

val make_list_builds_input :
  ?status:build_status ->
  ?limit:positive_integer ->
  ?next_token:non_empty_string ->
  unit ->
  list_builds_input

val make_list_aliases_output :
  ?aliases:alias_list -> ?next_token:non_empty_string -> unit -> list_aliases_output

val make_list_aliases_input :
  ?routing_strategy_type:routing_strategy_type ->
  ?name:non_empty_string ->
  ?limit:positive_integer ->
  ?next_token:non_empty_string ->
  unit ->
  list_aliases_input

val make_player_connection_endpoint :
  ?ip_address:ip_address -> ?port:port_number -> unit -> player_connection_endpoint

val make_player_connection_detail :
  ?player_id:player_id ->
  ?endpoints:player_connection_endpoint_list ->
  ?player_gateway_token:max_string ->
  ?expiration:timestamp ->
  unit ->
  player_connection_detail

val make_get_player_connection_details_output :
  ?game_session_id:arn_string_model ->
  ?player_connection_details:player_connection_detail_list ->
  unit ->
  get_player_connection_details_output

val make_get_player_connection_details_input :
  game_session_id:arn_string_model ->
  player_ids:player_id_list ->
  unit ->
  get_player_connection_details_input

val make_instance_credentials :
  ?user_name:non_empty_string -> ?secret:non_empty_string -> unit -> instance_credentials

val make_instance_access :
  ?fleet_id:fleet_id ->
  ?instance_id:instance_id ->
  ?ip_address:ip_address ->
  ?operating_system:operating_system ->
  ?credentials:instance_credentials ->
  unit ->
  instance_access

val make_get_instance_access_output :
  ?instance_access:instance_access -> unit -> get_instance_access_output

val make_get_instance_access_input :
  fleet_id:fleet_id_or_arn -> instance_id:instance_id -> unit -> get_instance_access_input

val make_get_game_session_log_url_output :
  ?pre_signed_url:non_zero_and_max_string -> unit -> get_game_session_log_url_output

val make_get_game_session_log_url_input :
  game_session_id:arn_string_model -> unit -> get_game_session_log_url_input

val make_get_compute_auth_token_output :
  ?fleet_id:fleet_id_or_arn ->
  ?fleet_arn:fleet_arn ->
  ?compute_name:compute_name_or_arn ->
  ?compute_arn:compute_arn ->
  ?auth_token:compute_auth_token ->
  ?expiration_timestamp:timestamp ->
  unit ->
  get_compute_auth_token_output

val make_get_compute_auth_token_input :
  fleet_id:fleet_id_or_arn ->
  compute_name:compute_name_or_arn ->
  unit ->
  get_compute_auth_token_input

val make_get_compute_access_output :
  ?fleet_id:fleet_id_or_arn ->
  ?fleet_arn:fleet_arn ->
  ?compute_name:compute_name_or_arn ->
  ?compute_arn:compute_arn ->
  ?credentials:aws_credentials ->
  ?target:session_target ->
  ?container_identifiers:container_identifier_list ->
  unit ->
  get_compute_access_output

val make_get_compute_access_input :
  fleet_id:fleet_id_or_arn -> compute_name:compute_name_or_arn -> unit -> get_compute_access_input
