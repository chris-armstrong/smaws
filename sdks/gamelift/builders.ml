open Types

let make_vpc_peering_connection_status ?message:(message_ : non_zero_and_max_string option)
    ?code:(code_ : non_zero_and_max_string option) () =
  ({ message = message_; code = code_ } : vpc_peering_connection_status)

let make_vpc_peering_connection
    ?game_lift_vpc_id:(game_lift_vpc_id_ : non_zero_and_max_string option)
    ?peer_vpc_id:(peer_vpc_id_ : non_zero_and_max_string option)
    ?status:(status_ : vpc_peering_connection_status option)
    ?vpc_peering_connection_id:(vpc_peering_connection_id_ : non_zero_and_max_string option)
    ?ip_v4_cidr_block:(ip_v4_cidr_block_ : non_zero_and_max_string option)
    ?fleet_arn:(fleet_arn_ : fleet_arn option) ?fleet_id:(fleet_id_ : fleet_id option) () =
  ({
     game_lift_vpc_id = game_lift_vpc_id_;
     peer_vpc_id = peer_vpc_id_;
     status = status_;
     vpc_peering_connection_id = vpc_peering_connection_id_;
     ip_v4_cidr_block = ip_v4_cidr_block_;
     fleet_arn = fleet_arn_;
     fleet_id = fleet_id_;
   }
    : vpc_peering_connection)

let make_vpc_peering_authorization ?expiration_time:(expiration_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?peer_vpc_id:(peer_vpc_id_ : non_zero_and_max_string option)
    ?peer_vpc_aws_account_id:(peer_vpc_aws_account_id_ : non_zero_and_max_string option)
    ?game_lift_aws_account_id:(game_lift_aws_account_id_ : non_zero_and_max_string option) () =
  ({
     expiration_time = expiration_time_;
     creation_time = creation_time_;
     peer_vpc_id = peer_vpc_id_;
     peer_vpc_aws_account_id = peer_vpc_aws_account_id_;
     game_lift_aws_account_id = game_lift_aws_account_id_;
   }
    : vpc_peering_authorization)

let make_validate_matchmaking_rule_set_output ?valid:(valid_ : boolean_model option) () =
  ({ valid = valid_ } : validate_matchmaking_rule_set_output)

let make_validate_matchmaking_rule_set_input ~rule_set_body:(rule_set_body_ : rule_set_body) () =
  ({ rule_set_body = rule_set_body_ } : validate_matchmaking_rule_set_input)

let make_s3_location ?object_version:(object_version_ : non_empty_string option)
    ?role_arn:(role_arn_ : non_empty_string option) ?key:(key_ : non_empty_string option)
    ?bucket:(bucket_ : non_empty_string option) () =
  ({ object_version = object_version_; role_arn = role_arn_; key = key_; bucket = bucket_ }
    : s3_location)

let make_script ?node_js_version:(node_js_version_ : node_js_version option)
    ?storage_location:(storage_location_ : s3_location option)
    ?creation_time:(creation_time_ : timestamp option)
    ?size_on_disk:(size_on_disk_ : whole_number_long option)
    ?version:(version_ : non_zero_and_max_string option)
    ?name:(name_ : non_zero_and_max_string option) ?script_arn:(script_arn_ : script_arn option)
    ?script_id:(script_id_ : script_id option) () =
  ({
     node_js_version = node_js_version_;
     storage_location = storage_location_;
     creation_time = creation_time_;
     size_on_disk = size_on_disk_;
     version = version_;
     name = name_;
     script_arn = script_arn_;
     script_id = script_id_;
   }
    : script)

let make_update_script_output ?script:(script_ : script option) () =
  ({ script = script_ } : update_script_output)

let make_update_script_input ?zip_file:(zip_file_ : zip_blob option)
    ?storage_location:(storage_location_ : s3_location option)
    ?version:(version_ : non_zero_and_max_string option)
    ?name:(name_ : non_zero_and_max_string option) ~script_id:(script_id_ : script_id_or_arn) () =
  ({
     zip_file = zip_file_;
     storage_location = storage_location_;
     version = version_;
     name = name_;
     script_id = script_id_;
   }
    : update_script_input)

let make_server_process ?parameters:(parameters_ : launch_parameters_string_model option)
    ~concurrent_executions:(concurrent_executions_ : positive_integer)
    ~launch_path:(launch_path_ : launch_path_string_model) () =
  ({
     concurrent_executions = concurrent_executions_;
     parameters = parameters_;
     launch_path = launch_path_;
   }
    : server_process)

let make_runtime_configuration
    ?game_session_activation_timeout_seconds:
      (game_session_activation_timeout_seconds_ : game_session_activation_timeout_seconds option)
    ?max_concurrent_game_session_activations:
      (max_concurrent_game_session_activations_ : max_concurrent_game_session_activations option)
    ?server_processes:(server_processes_ : server_process_list option) () =
  ({
     game_session_activation_timeout_seconds = game_session_activation_timeout_seconds_;
     max_concurrent_game_session_activations = max_concurrent_game_session_activations_;
     server_processes = server_processes_;
   }
    : runtime_configuration)

let make_update_runtime_configuration_output
    ?runtime_configuration:(runtime_configuration_ : runtime_configuration option) () =
  ({ runtime_configuration = runtime_configuration_ } : update_runtime_configuration_output)

let make_update_runtime_configuration_input
    ~runtime_configuration:(runtime_configuration_ : runtime_configuration)
    ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({ runtime_configuration = runtime_configuration_; fleet_id = fleet_id_ }
    : update_runtime_configuration_input)

let make_game_property ~value:(value_ : game_property_value) ~key:(key_ : game_property_key) () =
  ({ value = value_; key = key_ } : game_property)

let make_matchmaking_configuration ?flex_match_mode:(flex_match_mode_ : flex_match_mode option)
    ?backfill_mode:(backfill_mode_ : backfill_mode option)
    ?game_session_data:(game_session_data_ : game_session_data option)
    ?game_properties:(game_properties_ : game_property_list option)
    ?creation_time:(creation_time_ : timestamp option)
    ?custom_event_data:(custom_event_data_ : custom_event_data option)
    ?additional_player_count:(additional_player_count_ : whole_number option)
    ?notification_target:(notification_target_ : sns_arn_string_model option)
    ?rule_set_arn:(rule_set_arn_ : matchmaking_rule_set_arn option)
    ?rule_set_name:(rule_set_name_ : matchmaking_id_string_model option)
    ?acceptance_required:(acceptance_required_ : boolean_model option)
    ?acceptance_timeout_seconds:
      (acceptance_timeout_seconds_ : matchmaking_acceptance_timeout_integer option)
    ?request_timeout_seconds:(request_timeout_seconds_ : matchmaking_request_timeout_integer option)
    ?game_session_queue_arns:(game_session_queue_arns_ : queue_arns_list option)
    ?description:(description_ : non_zero_and_max_string option)
    ?configuration_arn:(configuration_arn_ : matchmaking_configuration_arn option)
    ?name:(name_ : matchmaking_id_string_model option) () =
  ({
     flex_match_mode = flex_match_mode_;
     backfill_mode = backfill_mode_;
     game_session_data = game_session_data_;
     game_properties = game_properties_;
     creation_time = creation_time_;
     custom_event_data = custom_event_data_;
     additional_player_count = additional_player_count_;
     notification_target = notification_target_;
     rule_set_arn = rule_set_arn_;
     rule_set_name = rule_set_name_;
     acceptance_required = acceptance_required_;
     acceptance_timeout_seconds = acceptance_timeout_seconds_;
     request_timeout_seconds = request_timeout_seconds_;
     game_session_queue_arns = game_session_queue_arns_;
     description = description_;
     configuration_arn = configuration_arn_;
     name = name_;
   }
    : matchmaking_configuration)

let make_update_matchmaking_configuration_output
    ?configuration:(configuration_ : matchmaking_configuration option) () =
  ({ configuration = configuration_ } : update_matchmaking_configuration_output)

let make_update_matchmaking_configuration_input
    ?flex_match_mode:(flex_match_mode_ : flex_match_mode option)
    ?backfill_mode:(backfill_mode_ : backfill_mode option)
    ?game_session_data:(game_session_data_ : game_session_data option)
    ?game_properties:(game_properties_ : game_property_list option)
    ?custom_event_data:(custom_event_data_ : custom_event_data option)
    ?additional_player_count:(additional_player_count_ : whole_number option)
    ?notification_target:(notification_target_ : sns_arn_string_model option)
    ?rule_set_name:(rule_set_name_ : matchmaking_rule_set_name option)
    ?acceptance_required:(acceptance_required_ : boolean_model option)
    ?acceptance_timeout_seconds:
      (acceptance_timeout_seconds_ : matchmaking_acceptance_timeout_integer option)
    ?request_timeout_seconds:(request_timeout_seconds_ : matchmaking_request_timeout_integer option)
    ?game_session_queue_arns:(game_session_queue_arns_ : queue_arns_list option)
    ?description:(description_ : non_zero_and_max_string option)
    ~name:(name_ : matchmaking_configuration_name) () =
  ({
     flex_match_mode = flex_match_mode_;
     backfill_mode = backfill_mode_;
     game_session_data = game_session_data_;
     game_properties = game_properties_;
     custom_event_data = custom_event_data_;
     additional_player_count = additional_player_count_;
     notification_target = notification_target_;
     rule_set_name = rule_set_name_;
     acceptance_required = acceptance_required_;
     acceptance_timeout_seconds = acceptance_timeout_seconds_;
     request_timeout_seconds = request_timeout_seconds_;
     game_session_queue_arns = game_session_queue_arns_;
     description = description_;
     name = name_;
   }
    : update_matchmaking_configuration_input)

let make_player_latency_policy
    ?policy_duration_seconds:(policy_duration_seconds_ : whole_number option)
    ?maximum_individual_player_latency_milliseconds:
      (maximum_individual_player_latency_milliseconds_ : whole_number option) () =
  ({
     policy_duration_seconds = policy_duration_seconds_;
     maximum_individual_player_latency_milliseconds =
       maximum_individual_player_latency_milliseconds_;
   }
    : player_latency_policy)

let make_game_session_queue_destination
    ?destination_arn:(destination_arn_ : arn_string_model option) () =
  ({ destination_arn = destination_arn_ } : game_session_queue_destination)

let make_filter_configuration ?allowed_locations:(allowed_locations_ : location_list option) () =
  ({ allowed_locations = allowed_locations_ } : filter_configuration)

let make_priority_configuration ?location_order:(location_order_ : location_list option)
    ?priority_order:(priority_order_ : priority_type_list option) () =
  ({ location_order = location_order_; priority_order = priority_order_ } : priority_configuration)

let make_game_session_queue
    ?notification_target:(notification_target_ : queue_sns_arn_string_model option)
    ?custom_event_data:(custom_event_data_ : queue_custom_event_data option)
    ?priority_configuration:(priority_configuration_ : priority_configuration option)
    ?filter_configuration:(filter_configuration_ : filter_configuration option)
    ?destinations:(destinations_ : game_session_queue_destination_list option)
    ?player_latency_policies:(player_latency_policies_ : player_latency_policy_list option)
    ?timeout_in_seconds:(timeout_in_seconds_ : whole_number option)
    ?game_session_queue_arn:(game_session_queue_arn_ : game_session_queue_arn option)
    ?name:(name_ : game_session_queue_name option) () =
  ({
     notification_target = notification_target_;
     custom_event_data = custom_event_data_;
     priority_configuration = priority_configuration_;
     filter_configuration = filter_configuration_;
     destinations = destinations_;
     player_latency_policies = player_latency_policies_;
     timeout_in_seconds = timeout_in_seconds_;
     game_session_queue_arn = game_session_queue_arn_;
     name = name_;
   }
    : game_session_queue)

let make_update_game_session_queue_output
    ?game_session_queue:(game_session_queue_ : game_session_queue option) () =
  ({ game_session_queue = game_session_queue_ } : update_game_session_queue_output)

let make_update_game_session_queue_input
    ?notification_target:(notification_target_ : queue_sns_arn_string_model option)
    ?custom_event_data:(custom_event_data_ : queue_custom_event_data option)
    ?priority_configuration:(priority_configuration_ : priority_configuration option)
    ?filter_configuration:(filter_configuration_ : filter_configuration option)
    ?destinations:(destinations_ : game_session_queue_destination_list option)
    ?player_latency_policies:(player_latency_policies_ : player_latency_policy_list option)
    ?timeout_in_seconds:(timeout_in_seconds_ : whole_number option)
    ~name:(name_ : game_session_queue_name_or_arn) () =
  ({
     notification_target = notification_target_;
     custom_event_data = custom_event_data_;
     priority_configuration = priority_configuration_;
     filter_configuration = filter_configuration_;
     destinations = destinations_;
     player_latency_policies = player_latency_policies_;
     timeout_in_seconds = timeout_in_seconds_;
     name = name_;
   }
    : update_game_session_queue_input)

let make_game_session ?player_gateway_status:(player_gateway_status_ : player_gateway_status option)
    ?compute_name:(compute_name_ : compute_name option)
    ?location:(location_ : location_string_model option)
    ?matchmaker_data:(matchmaker_data_ : matchmaker_data option)
    ?game_session_data:(game_session_data_ : large_game_session_data option)
    ?creator_id:(creator_id_ : non_zero_and_max_string option)
    ?player_session_creation_policy:
      (player_session_creation_policy_ : player_session_creation_policy option)
    ?port:(port_ : port_number option) ?dns_name:(dns_name_ : dns_name option)
    ?ip_address:(ip_address_ : ip_address option)
    ?game_properties:(game_properties_ : game_property_list option)
    ?status_reason:(status_reason_ : game_session_status_reason option)
    ?status:(status_ : game_session_status option)
    ?maximum_player_session_count:(maximum_player_session_count_ : whole_number option)
    ?current_player_session_count:(current_player_session_count_ : whole_number option)
    ?termination_time:(termination_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option) ?fleet_arn:(fleet_arn_ : fleet_arn option)
    ?fleet_id:(fleet_id_ : fleet_id option) ?name:(name_ : non_zero_and_max_string option)
    ?game_session_id:(game_session_id_ : non_zero_and_max_string option) () =
  ({
     player_gateway_status = player_gateway_status_;
     compute_name = compute_name_;
     location = location_;
     matchmaker_data = matchmaker_data_;
     game_session_data = game_session_data_;
     creator_id = creator_id_;
     player_session_creation_policy = player_session_creation_policy_;
     port = port_;
     dns_name = dns_name_;
     ip_address = ip_address_;
     game_properties = game_properties_;
     status_reason = status_reason_;
     status = status_;
     maximum_player_session_count = maximum_player_session_count_;
     current_player_session_count = current_player_session_count_;
     termination_time = termination_time_;
     creation_time = creation_time_;
     fleet_arn = fleet_arn_;
     fleet_id = fleet_id_;
     name = name_;
     game_session_id = game_session_id_;
   }
    : game_session)

let make_update_game_session_output ?game_session:(game_session_ : game_session option) () =
  ({ game_session = game_session_ } : update_game_session_output)

let make_update_game_session_input ?game_properties:(game_properties_ : game_property_list option)
    ?protection_policy:(protection_policy_ : protection_policy option)
    ?player_session_creation_policy:
      (player_session_creation_policy_ : player_session_creation_policy option)
    ?name:(name_ : non_zero_and_max_string option)
    ?maximum_player_session_count:(maximum_player_session_count_ : whole_number option)
    ~game_session_id:(game_session_id_ : arn_string_model) () =
  ({
     game_properties = game_properties_;
     protection_policy = protection_policy_;
     player_session_creation_policy = player_session_creation_policy_;
     name = name_;
     maximum_player_session_count = maximum_player_session_count_;
     game_session_id = game_session_id_;
   }
    : update_game_session_input)

let make_game_server ?last_health_check_time:(last_health_check_time_ : timestamp option)
    ?last_claim_time:(last_claim_time_ : timestamp option)
    ?registration_time:(registration_time_ : timestamp option)
    ?utilization_status:(utilization_status_ : game_server_utilization_status option)
    ?claim_status:(claim_status_ : game_server_claim_status option)
    ?game_server_data:(game_server_data_ : game_server_data option)
    ?connection_info:(connection_info_ : game_server_connection_info option)
    ?instance_id:(instance_id_ : game_server_instance_id option)
    ?game_server_id:(game_server_id_ : game_server_id option)
    ?game_server_group_arn:(game_server_group_arn_ : game_server_group_arn option)
    ?game_server_group_name:(game_server_group_name_ : game_server_group_name option) () =
  ({
     last_health_check_time = last_health_check_time_;
     last_claim_time = last_claim_time_;
     registration_time = registration_time_;
     utilization_status = utilization_status_;
     claim_status = claim_status_;
     game_server_data = game_server_data_;
     connection_info = connection_info_;
     instance_id = instance_id_;
     game_server_id = game_server_id_;
     game_server_group_arn = game_server_group_arn_;
     game_server_group_name = game_server_group_name_;
   }
    : game_server)

let make_update_game_server_output ?game_server:(game_server_ : game_server option) () =
  ({ game_server = game_server_ } : update_game_server_output)

let make_update_game_server_input ?health_check:(health_check_ : game_server_health_check option)
    ?utilization_status:(utilization_status_ : game_server_utilization_status option)
    ?game_server_data:(game_server_data_ : game_server_data option)
    ~game_server_id:(game_server_id_ : game_server_id)
    ~game_server_group_name:(game_server_group_name_ : game_server_group_name_or_arn) () =
  ({
     health_check = health_check_;
     utilization_status = utilization_status_;
     game_server_data = game_server_data_;
     game_server_id = game_server_id_;
     game_server_group_name = game_server_group_name_;
   }
    : update_game_server_input)

let make_instance_definition ?weighted_capacity:(weighted_capacity_ : weighted_capacity option)
    ~instance_type:(instance_type_ : game_server_group_instance_type) () =
  ({ weighted_capacity = weighted_capacity_; instance_type = instance_type_ } : instance_definition)

let make_game_server_group ?last_updated_time:(last_updated_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?suspended_actions:(suspended_actions_ : game_server_group_actions option)
    ?status_reason:(status_reason_ : non_zero_and_max_string option)
    ?status:(status_ : game_server_group_status option)
    ?auto_scaling_group_arn:(auto_scaling_group_arn_ : auto_scaling_group_arn option)
    ?game_server_protection_policy:
      (game_server_protection_policy_ : game_server_protection_policy option)
    ?balancing_strategy:(balancing_strategy_ : balancing_strategy option)
    ?instance_definitions:(instance_definitions_ : instance_definitions option)
    ?role_arn:(role_arn_ : iam_role_arn option)
    ?game_server_group_arn:(game_server_group_arn_ : game_server_group_arn option)
    ?game_server_group_name:(game_server_group_name_ : game_server_group_name option) () =
  ({
     last_updated_time = last_updated_time_;
     creation_time = creation_time_;
     suspended_actions = suspended_actions_;
     status_reason = status_reason_;
     status = status_;
     auto_scaling_group_arn = auto_scaling_group_arn_;
     game_server_protection_policy = game_server_protection_policy_;
     balancing_strategy = balancing_strategy_;
     instance_definitions = instance_definitions_;
     role_arn = role_arn_;
     game_server_group_arn = game_server_group_arn_;
     game_server_group_name = game_server_group_name_;
   }
    : game_server_group)

let make_update_game_server_group_output
    ?game_server_group:(game_server_group_ : game_server_group option) () =
  ({ game_server_group = game_server_group_ } : update_game_server_group_output)

let make_update_game_server_group_input
    ?balancing_strategy:(balancing_strategy_ : balancing_strategy option)
    ?game_server_protection_policy:
      (game_server_protection_policy_ : game_server_protection_policy option)
    ?instance_definitions:(instance_definitions_ : instance_definitions option)
    ?role_arn:(role_arn_ : iam_role_arn option)
    ~game_server_group_name:(game_server_group_name_ : game_server_group_name_or_arn) () =
  ({
     balancing_strategy = balancing_strategy_;
     game_server_protection_policy = game_server_protection_policy_;
     instance_definitions = instance_definitions_;
     role_arn = role_arn_;
     game_server_group_name = game_server_group_name_;
   }
    : update_game_server_group_input)

let make_update_fleet_port_settings_output ?fleet_arn:(fleet_arn_ : fleet_arn option)
    ?fleet_id:(fleet_id_ : fleet_id option) () =
  ({ fleet_arn = fleet_arn_; fleet_id = fleet_id_ } : update_fleet_port_settings_output)

let make_ip_permission ~protocol:(protocol_ : ip_protocol) ~ip_range:(ip_range_ : ip_range)
    ~to_port:(to_port_ : port_number) ~from_port:(from_port_ : port_number) () =
  ({ protocol = protocol_; ip_range = ip_range_; to_port = to_port_; from_port = from_port_ }
    : ip_permission)

let make_update_fleet_port_settings_input
    ?inbound_permission_revocations:(inbound_permission_revocations_ : ip_permissions_list option)
    ?inbound_permission_authorizations:
      (inbound_permission_authorizations_ : ip_permissions_list option)
    ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({
     inbound_permission_revocations = inbound_permission_revocations_;
     inbound_permission_authorizations = inbound_permission_authorizations_;
     fleet_id = fleet_id_;
   }
    : update_fleet_port_settings_input)

let make_managed_capacity_configuration
    ?scale_in_after_inactivity_minutes:
      (scale_in_after_inactivity_minutes_ : scale_in_after_inactivity_minutes option)
    ?zero_capacity_strategy:(zero_capacity_strategy_ : zero_capacity_strategy option) () =
  ({
     scale_in_after_inactivity_minutes = scale_in_after_inactivity_minutes_;
     zero_capacity_strategy = zero_capacity_strategy_;
   }
    : managed_capacity_configuration)

let make_update_fleet_capacity_output
    ?managed_capacity_configuration:
      (managed_capacity_configuration_ : managed_capacity_configuration option)
    ?location:(location_ : location_string_model option) ?fleet_arn:(fleet_arn_ : fleet_arn option)
    ?fleet_id:(fleet_id_ : fleet_id option) () =
  ({
     managed_capacity_configuration = managed_capacity_configuration_;
     location = location_;
     fleet_arn = fleet_arn_;
     fleet_id = fleet_id_;
   }
    : update_fleet_capacity_output)

let make_update_fleet_capacity_input
    ?managed_capacity_configuration:
      (managed_capacity_configuration_ : managed_capacity_configuration option)
    ?location:(location_ : location_string_model option) ?max_size:(max_size_ : whole_number option)
    ?min_size:(min_size_ : whole_number option)
    ?desired_instances:(desired_instances_ : whole_number option)
    ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({
     managed_capacity_configuration = managed_capacity_configuration_;
     location = location_;
     max_size = max_size_;
     min_size = min_size_;
     desired_instances = desired_instances_;
     fleet_id = fleet_id_;
   }
    : update_fleet_capacity_input)

let make_update_fleet_attributes_output ?fleet_arn:(fleet_arn_ : fleet_arn option)
    ?fleet_id:(fleet_id_ : fleet_id option) () =
  ({ fleet_arn = fleet_arn_; fleet_id = fleet_id_ } : update_fleet_attributes_output)

let make_resource_creation_limit_policy
    ?policy_period_in_minutes:(policy_period_in_minutes_ : whole_number option)
    ?new_game_sessions_per_creator:(new_game_sessions_per_creator_ : whole_number option) () =
  ({
     policy_period_in_minutes = policy_period_in_minutes_;
     new_game_sessions_per_creator = new_game_sessions_per_creator_;
   }
    : resource_creation_limit_policy)

let make_anywhere_configuration ~cost:(cost_ : non_negative_limited_length_double) () =
  ({ cost = cost_ } : anywhere_configuration)

let make_update_fleet_attributes_input
    ?anywhere_configuration:(anywhere_configuration_ : anywhere_configuration option)
    ?metric_groups:(metric_groups_ : metric_group_list option)
    ?resource_creation_limit_policy:
      (resource_creation_limit_policy_ : resource_creation_limit_policy option)
    ?new_game_session_protection_policy:
      (new_game_session_protection_policy_ : protection_policy option)
    ?description:(description_ : non_zero_and_max_string option)
    ?name:(name_ : non_zero_and_max_string option) ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({
     anywhere_configuration = anywhere_configuration_;
     metric_groups = metric_groups_;
     resource_creation_limit_policy = resource_creation_limit_policy_;
     new_game_session_protection_policy = new_game_session_protection_policy_;
     description = description_;
     name = name_;
     fleet_id = fleet_id_;
   }
    : update_fleet_attributes_input)

let make_container_dependency ~condition:(condition_ : container_dependency_condition)
    ~container_name:(container_name_ : non_zero_and128_max_ascii_string) () =
  ({ condition = condition_; container_name = container_name_ } : container_dependency)

let make_container_mount_point
    ?access_level:(access_level_ : container_mount_point_access_level option)
    ?container_path:(container_path_ : container_path_string option)
    ~instance_path:(instance_path_ : instance_path_string) () =
  ({
     access_level = access_level_;
     container_path = container_path_;
     instance_path = instance_path_;
   }
    : container_mount_point)

let make_container_environment ~value:(value_ : non_zero_and255_max_string)
    ~name:(name_ : non_zero_and255_max_string) () =
  ({ value = value_; name = name_ } : container_environment)

let make_container_port_range ~protocol:(protocol_ : ip_protocol) ~to_port:(to_port_ : port_number)
    ~from_port:(from_port_ : port_number) () =
  ({ protocol = protocol_; to_port = to_port_; from_port = from_port_ } : container_port_range)

let make_container_port_configuration
    ~container_port_ranges:(container_port_ranges_ : container_port_range_list) () =
  ({ container_port_ranges = container_port_ranges_ } : container_port_configuration)

let make_linux_capabilities ?include_:(include__ : linux_capability_list option) () =
  ({ include_ = include__ } : linux_capabilities)

let make_game_server_container_definition
    ?linux_capabilities:(linux_capabilities_ : linux_capabilities option)
    ?server_sdk_version:(server_sdk_version_ : server_sdk_version option)
    ?resolved_image_digest:(resolved_image_digest_ : sha256 option)
    ?port_configuration:(port_configuration_ : container_port_configuration option)
    ?image_uri:(image_uri_ : image_uri_string option)
    ?environment_override:(environment_override_ : container_environment_list option)
    ?mount_points:(mount_points_ : container_mount_point_list option)
    ?depends_on:(depends_on_ : container_dependency_list option)
    ?container_name:(container_name_ : non_zero_and128_max_ascii_string option) () =
  ({
     linux_capabilities = linux_capabilities_;
     server_sdk_version = server_sdk_version_;
     resolved_image_digest = resolved_image_digest_;
     port_configuration = port_configuration_;
     image_uri = image_uri_;
     environment_override = environment_override_;
     mount_points = mount_points_;
     depends_on = depends_on_;
     container_name = container_name_;
   }
    : game_server_container_definition)

let make_container_health_check ?timeout:(timeout_ : container_health_check_timeout option)
    ?start_period:(start_period_ : container_health_check_start_period option)
    ?retries:(retries_ : container_health_check_retries option)
    ?interval:(interval_ : container_health_check_interval option)
    ~command:(command_ : container_command_string_list) () =
  ({
     timeout = timeout_;
     start_period = start_period_;
     retries = retries_;
     interval = interval_;
     command = command_;
   }
    : container_health_check)

let make_support_container_definition
    ?linux_capabilities:(linux_capabilities_ : linux_capabilities option)
    ?vcpu:(vcpu_ : container_vcpu option)
    ?resolved_image_digest:(resolved_image_digest_ : sha256 option)
    ?port_configuration:(port_configuration_ : container_port_configuration option)
    ?memory_hard_limit_mebibytes:(memory_hard_limit_mebibytes_ : container_memory_limit option)
    ?image_uri:(image_uri_ : image_uri_string option)
    ?health_check:(health_check_ : container_health_check option)
    ?essential:(essential_ : boolean_model option)
    ?environment_override:(environment_override_ : container_environment_list option)
    ?mount_points:(mount_points_ : container_mount_point_list option)
    ?depends_on:(depends_on_ : container_dependency_list option)
    ?container_name:(container_name_ : non_zero_and128_max_ascii_string option) () =
  ({
     linux_capabilities = linux_capabilities_;
     vcpu = vcpu_;
     resolved_image_digest = resolved_image_digest_;
     port_configuration = port_configuration_;
     memory_hard_limit_mebibytes = memory_hard_limit_mebibytes_;
     image_uri = image_uri_;
     health_check = health_check_;
     essential = essential_;
     environment_override = environment_override_;
     mount_points = mount_points_;
     depends_on = depends_on_;
     container_name = container_name_;
   }
    : support_container_definition)

let make_container_group_definition ?status_reason:(status_reason_ : non_zero_and_max_string option)
    ?status:(status_ : container_group_definition_status option)
    ?version_description:(version_description_ : non_zero_and_max_string option)
    ?version_number:(version_number_ : positive_integer option)
    ?support_container_definitions:
      (support_container_definitions_ : support_container_definition_list option)
    ?game_server_container_definition:
      (game_server_container_definition_ : game_server_container_definition option)
    ?total_vcpu_limit:(total_vcpu_limit_ : container_total_vcpu_limit option)
    ?total_memory_limit_mebibytes:
      (total_memory_limit_mebibytes_ : container_total_memory_limit option)
    ?container_group_type:(container_group_type_ : container_group_type option)
    ?operating_system:(operating_system_ : container_operating_system option)
    ?creation_time:(creation_time_ : timestamp option)
    ?container_group_definition_arn:
      (container_group_definition_arn_ : container_group_definition_arn option)
    ~name:(name_ : container_group_definition_name) () =
  ({
     status_reason = status_reason_;
     status = status_;
     version_description = version_description_;
     version_number = version_number_;
     support_container_definitions = support_container_definitions_;
     game_server_container_definition = game_server_container_definition_;
     total_vcpu_limit = total_vcpu_limit_;
     total_memory_limit_mebibytes = total_memory_limit_mebibytes_;
     container_group_type = container_group_type_;
     name = name_;
     operating_system = operating_system_;
     creation_time = creation_time_;
     container_group_definition_arn = container_group_definition_arn_;
   }
    : container_group_definition)

let make_update_container_group_definition_output
    ?container_group_definition:(container_group_definition_ : container_group_definition option) ()
    =
  ({ container_group_definition = container_group_definition_ }
    : update_container_group_definition_output)

let make_game_server_container_definition_input
    ?linux_capabilities:(linux_capabilities_ : linux_capabilities option)
    ?environment_override:(environment_override_ : container_environment_list option)
    ?mount_points:(mount_points_ : container_mount_point_list option)
    ?depends_on:(depends_on_ : container_dependency_list option)
    ~server_sdk_version:(server_sdk_version_ : server_sdk_version)
    ~port_configuration:(port_configuration_ : container_port_configuration)
    ~image_uri:(image_uri_ : image_uri_string)
    ~container_name:(container_name_ : non_zero_and128_max_ascii_string) () =
  ({
     linux_capabilities = linux_capabilities_;
     server_sdk_version = server_sdk_version_;
     port_configuration = port_configuration_;
     image_uri = image_uri_;
     environment_override = environment_override_;
     mount_points = mount_points_;
     depends_on = depends_on_;
     container_name = container_name_;
   }
    : game_server_container_definition_input)

let make_support_container_definition_input
    ?linux_capabilities:(linux_capabilities_ : linux_capabilities option)
    ?vcpu:(vcpu_ : container_vcpu option)
    ?port_configuration:(port_configuration_ : container_port_configuration option)
    ?memory_hard_limit_mebibytes:(memory_hard_limit_mebibytes_ : container_memory_limit option)
    ?health_check:(health_check_ : container_health_check option)
    ?essential:(essential_ : boolean_model option)
    ?environment_override:(environment_override_ : container_environment_list option)
    ?mount_points:(mount_points_ : container_mount_point_list option)
    ?depends_on:(depends_on_ : container_dependency_list option)
    ~image_uri:(image_uri_ : image_uri_string)
    ~container_name:(container_name_ : non_zero_and128_max_ascii_string) () =
  ({
     linux_capabilities = linux_capabilities_;
     vcpu = vcpu_;
     port_configuration = port_configuration_;
     memory_hard_limit_mebibytes = memory_hard_limit_mebibytes_;
     image_uri = image_uri_;
     health_check = health_check_;
     essential = essential_;
     environment_override = environment_override_;
     mount_points = mount_points_;
     depends_on = depends_on_;
     container_name = container_name_;
   }
    : support_container_definition_input)

let make_update_container_group_definition_input
    ?operating_system:(operating_system_ : container_operating_system option)
    ?source_version_number:(source_version_number_ : positive_integer option)
    ?version_description:(version_description_ : non_zero_and_max_string option)
    ?total_vcpu_limit:(total_vcpu_limit_ : container_total_vcpu_limit option)
    ?total_memory_limit_mebibytes:
      (total_memory_limit_mebibytes_ : container_total_memory_limit option)
    ?support_container_definitions:
      (support_container_definitions_ : support_container_definition_input_list option)
    ?game_server_container_definition:
      (game_server_container_definition_ : game_server_container_definition_input option)
    ~name:(name_ : container_group_definition_name_or_arn) () =
  ({
     operating_system = operating_system_;
     source_version_number = source_version_number_;
     version_description = version_description_;
     total_vcpu_limit = total_vcpu_limit_;
     total_memory_limit_mebibytes = total_memory_limit_mebibytes_;
     support_container_definitions = support_container_definitions_;
     game_server_container_definition = game_server_container_definition_;
     name = name_;
   }
    : update_container_group_definition_input)

let make_connection_port_range ~to_port:(to_port_ : port_number)
    ~from_port:(from_port_ : port_number) () =
  ({ to_port = to_port_; from_port = from_port_ } : connection_port_range)

let make_game_session_creation_limit_policy
    ?policy_period_in_minutes:(policy_period_in_minutes_ : whole_number option)
    ?new_game_sessions_per_creator:(new_game_sessions_per_creator_ : whole_number option) () =
  ({
     policy_period_in_minutes = policy_period_in_minutes_;
     new_game_sessions_per_creator = new_game_sessions_per_creator_;
   }
    : game_session_creation_limit_policy)

let make_deployment_details ?latest_deployment_id:(latest_deployment_id_ : deployment_id option) ()
    =
  ({ latest_deployment_id = latest_deployment_id_ } : deployment_details)

let make_log_configuration ?log_group_arn:(log_group_arn_ : log_group_arn_string_model option)
    ?s3_bucket_name:(s3_bucket_name_ : non_empty_string option)
    ?log_destination:(log_destination_ : log_destination option) () =
  ({
     log_group_arn = log_group_arn_;
     s3_bucket_name = s3_bucket_name_;
     log_destination = log_destination_;
   }
    : log_configuration)

let make_container_fleet_location_attributes
    ?player_gateway_status:(player_gateway_status_ : player_gateway_status option)
    ?status:(status_ : container_fleet_location_status option)
    ?location:(location_ : location_string_model option) () =
  ({ player_gateway_status = player_gateway_status_; status = status_; location = location_ }
    : container_fleet_location_attributes)

let make_container_fleet ?player_gateway_mode:(player_gateway_mode_ : player_gateway_mode option)
    ?location_attributes:(location_attributes_ : container_fleet_location_attributes_list option)
    ?log_configuration:(log_configuration_ : log_configuration option)
    ?deployment_details:(deployment_details_ : deployment_details option)
    ?status:(status_ : container_fleet_status option)
    ?game_session_creation_limit_policy:
      (game_session_creation_limit_policy_ : game_session_creation_limit_policy option)
    ?new_game_session_protection_policy:
      (new_game_session_protection_policy_ : protection_policy option)
    ?metric_groups:(metric_groups_ : metric_group_list option)
    ?creation_time:(creation_time_ : timestamp option)
    ?description:(description_ : non_zero_and_max_string option)
    ?billing_type:(billing_type_ : container_fleet_billing_type option)
    ?instance_type:(instance_type_ : non_zero_and_max_string option)
    ?maximum_game_server_container_groups_per_instance:
      (maximum_game_server_container_groups_per_instance_ :
         maximum_game_server_container_groups_per_instance option)
    ?game_server_container_groups_per_instance:
      (game_server_container_groups_per_instance_ : game_server_container_groups_per_instance option)
    ?instance_inbound_permissions:(instance_inbound_permissions_ : ip_permissions_list option)
    ?instance_connection_port_range:(instance_connection_port_range_ : connection_port_range option)
    ?per_instance_container_group_definition_arn:
      (per_instance_container_group_definition_arn_ : container_group_definition_arn option)
    ?per_instance_container_group_definition_name:
      (per_instance_container_group_definition_name_ : container_group_definition_name option)
    ?game_server_container_group_definition_arn:
      (game_server_container_group_definition_arn_ : container_group_definition_arn option)
    ?game_server_container_group_definition_name:
      (game_server_container_group_definition_name_ : container_group_definition_name option)
    ?fleet_role_arn:(fleet_role_arn_ : iam_role_arn option)
    ?fleet_arn:(fleet_arn_ : fleet_arn option) ?fleet_id:(fleet_id_ : fleet_id option) () =
  ({
     player_gateway_mode = player_gateway_mode_;
     location_attributes = location_attributes_;
     log_configuration = log_configuration_;
     deployment_details = deployment_details_;
     status = status_;
     game_session_creation_limit_policy = game_session_creation_limit_policy_;
     new_game_session_protection_policy = new_game_session_protection_policy_;
     metric_groups = metric_groups_;
     creation_time = creation_time_;
     description = description_;
     billing_type = billing_type_;
     instance_type = instance_type_;
     maximum_game_server_container_groups_per_instance =
       maximum_game_server_container_groups_per_instance_;
     game_server_container_groups_per_instance = game_server_container_groups_per_instance_;
     instance_inbound_permissions = instance_inbound_permissions_;
     instance_connection_port_range = instance_connection_port_range_;
     per_instance_container_group_definition_arn = per_instance_container_group_definition_arn_;
     per_instance_container_group_definition_name = per_instance_container_group_definition_name_;
     game_server_container_group_definition_arn = game_server_container_group_definition_arn_;
     game_server_container_group_definition_name = game_server_container_group_definition_name_;
     fleet_role_arn = fleet_role_arn_;
     fleet_arn = fleet_arn_;
     fleet_id = fleet_id_;
   }
    : container_fleet)

let make_update_container_fleet_output ?container_fleet:(container_fleet_ : container_fleet option)
    () =
  ({ container_fleet = container_fleet_ } : update_container_fleet_output)

let make_deployment_configuration
    ?impairment_strategy:(impairment_strategy_ : deployment_impairment_strategy option)
    ?minimum_healthy_percentage:(minimum_healthy_percentage_ : minimum_healthy_percentage option)
    ?protection_strategy:(protection_strategy_ : deployment_protection_strategy option) () =
  ({
     impairment_strategy = impairment_strategy_;
     minimum_healthy_percentage = minimum_healthy_percentage_;
     protection_strategy = protection_strategy_;
   }
    : deployment_configuration)

let make_update_container_fleet_input
    ?remove_attributes:(remove_attributes_ : container_fleet_remove_attribute_list option)
    ?log_configuration:(log_configuration_ : log_configuration option)
    ?game_session_creation_limit_policy:
      (game_session_creation_limit_policy_ : game_session_creation_limit_policy option)
    ?new_game_session_protection_policy:
      (new_game_session_protection_policy_ : protection_policy option)
    ?metric_groups:(metric_groups_ : metric_group_list option)
    ?description:(description_ : non_zero_and_max_string option)
    ?deployment_configuration:(deployment_configuration_ : deployment_configuration option)
    ?instance_inbound_permission_revocations:
      (instance_inbound_permission_revocations_ : ip_permissions_list option)
    ?instance_inbound_permission_authorizations:
      (instance_inbound_permission_authorizations_ : ip_permissions_list option)
    ?instance_connection_port_range:(instance_connection_port_range_ : connection_port_range option)
    ?game_server_container_groups_per_instance:
      (game_server_container_groups_per_instance_ : game_server_container_groups_per_instance option)
    ?per_instance_container_group_definition_name:
      (per_instance_container_group_definition_name_ : container_group_definition_name_or_arn option)
    ?game_server_container_group_definition_name:
      (game_server_container_group_definition_name_ : container_group_definition_name_or_arn option)
    ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({
     remove_attributes = remove_attributes_;
     log_configuration = log_configuration_;
     game_session_creation_limit_policy = game_session_creation_limit_policy_;
     new_game_session_protection_policy = new_game_session_protection_policy_;
     metric_groups = metric_groups_;
     description = description_;
     deployment_configuration = deployment_configuration_;
     instance_inbound_permission_revocations = instance_inbound_permission_revocations_;
     instance_inbound_permission_authorizations = instance_inbound_permission_authorizations_;
     instance_connection_port_range = instance_connection_port_range_;
     game_server_container_groups_per_instance = game_server_container_groups_per_instance_;
     per_instance_container_group_definition_name = per_instance_container_group_definition_name_;
     game_server_container_group_definition_name = game_server_container_group_definition_name_;
     fleet_id = fleet_id_;
   }
    : update_container_fleet_input)

let make_build ?server_sdk_version:(server_sdk_version_ : server_sdk_version option)
    ?creation_time:(creation_time_ : timestamp option)
    ?operating_system:(operating_system_ : operating_system option)
    ?size_on_disk:(size_on_disk_ : whole_number_long option) ?status:(status_ : build_status option)
    ?version:(version_ : free_text option) ?name:(name_ : free_text option)
    ?build_arn:(build_arn_ : build_arn option) ?build_id:(build_id_ : build_id option) () =
  ({
     server_sdk_version = server_sdk_version_;
     creation_time = creation_time_;
     operating_system = operating_system_;
     size_on_disk = size_on_disk_;
     status = status_;
     version = version_;
     name = name_;
     build_arn = build_arn_;
     build_id = build_id_;
   }
    : build)

let make_update_build_output ?build:(build_ : build option) () =
  ({ build = build_ } : update_build_output)

let make_update_build_input ?version:(version_ : non_zero_and_max_string option)
    ?name:(name_ : non_zero_and_max_string option) ~build_id:(build_id_ : build_id_or_arn) () =
  ({ version = version_; name = name_; build_id = build_id_ } : update_build_input)

let make_routing_strategy ?message:(message_ : free_text option)
    ?fleet_id:(fleet_id_ : fleet_id option) ?type_:(type__ : routing_strategy_type option) () =
  ({ message = message_; fleet_id = fleet_id_; type_ = type__ } : routing_strategy)

let make_alias ?last_updated_time:(last_updated_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?routing_strategy:(routing_strategy_ : routing_strategy option)
    ?description:(description_ : free_text option) ?alias_arn:(alias_arn_ : alias_arn option)
    ?name:(name_ : non_blank_and_length_constraint_string option)
    ?alias_id:(alias_id_ : alias_id option) () =
  ({
     last_updated_time = last_updated_time_;
     creation_time = creation_time_;
     routing_strategy = routing_strategy_;
     description = description_;
     alias_arn = alias_arn_;
     name = name_;
     alias_id = alias_id_;
   }
    : alias)

let make_update_alias_output ?alias:(alias_ : alias option) () =
  ({ alias = alias_ } : update_alias_output)

let make_update_alias_input ?routing_strategy:(routing_strategy_ : routing_strategy option)
    ?description:(description_ : non_zero_and_max_string option)
    ?name:(name_ : non_blank_and_length_constraint_string option)
    ~alias_id:(alias_id_ : alias_id_or_arn) () =
  ({
     routing_strategy = routing_strategy_;
     description = description_;
     name = name_;
     alias_id = alias_id_;
   }
    : update_alias_input)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ tag_keys = tag_keys_; resource_ar_n = resource_ar_n_ } : untag_resource_request)

let make_udp_endpoint ?port:(port_ : positive_integer option)
    ?domain:(domain_ : non_zero_and_max_string option) () =
  ({ port = port_; domain = domain_ } : udp_endpoint)

let make_terminate_game_session_output ?game_session:(game_session_ : game_session option) () =
  ({ game_session = game_session_ } : terminate_game_session_output)

let make_terminate_game_session_input ~termination_mode:(termination_mode_ : termination_mode)
    ~game_session_id:(game_session_id_ : arn_string_model) () =
  ({ termination_mode = termination_mode_; game_session_id = game_session_id_ }
    : terminate_game_session_input)

let make_target_tracking_configuration ~target_value:(target_value_ : non_negative_double) () =
  ({ target_value = target_value_ } : target_tracking_configuration)

let make_target_configuration ~target_value:(target_value_ : double) () =
  ({ target_value = target_value_ } : target_configuration)

let make_tag_resource_response () = (() : unit)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_request ~tags:(tags_ : tag_list)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ tags = tags_; resource_ar_n = resource_ar_n_ } : tag_resource_request)

let make_suspend_game_server_group_output
    ?game_server_group:(game_server_group_ : game_server_group option) () =
  ({ game_server_group = game_server_group_ } : suspend_game_server_group_output)

let make_suspend_game_server_group_input
    ~suspend_actions:(suspend_actions_ : game_server_group_actions)
    ~game_server_group_name:(game_server_group_name_ : game_server_group_name_or_arn) () =
  ({ suspend_actions = suspend_actions_; game_server_group_name = game_server_group_name_ }
    : suspend_game_server_group_input)

let make_stop_matchmaking_output () = (() : unit)

let make_stop_matchmaking_input ~ticket_id:(ticket_id_ : matchmaking_id_string_model) () =
  ({ ticket_id = ticket_id_ } : stop_matchmaking_input)

let make_player_latency ?latency_in_milliseconds:(latency_in_milliseconds_ : float_ option)
    ?region_identifier:(region_identifier_ : non_zero_and_max_string option)
    ?player_id:(player_id_ : player_id option) () =
  ({
     latency_in_milliseconds = latency_in_milliseconds_;
     region_identifier = region_identifier_;
     player_id = player_id_;
   }
    : player_latency)

let make_placed_player_session ?player_session_id:(player_session_id_ : player_session_id option)
    ?player_id:(player_id_ : player_id option) () =
  ({ player_session_id = player_session_id_; player_id = player_id_ } : placed_player_session)

let make_priority_configuration_override
    ?placement_fallback_strategy:(placement_fallback_strategy_ : placement_fallback_strategy option)
    ~location_order:(location_order_ : location_order_override_list) () =
  ({ location_order = location_order_; placement_fallback_strategy = placement_fallback_strategy_ }
    : priority_configuration_override)

let make_game_session_placement
    ?player_gateway_status:(player_gateway_status_ : player_gateway_status option)
    ?priority_configuration_override:
      (priority_configuration_override_ : priority_configuration_override option)
    ?matchmaker_data:(matchmaker_data_ : matchmaker_data option)
    ?game_session_data:(game_session_data_ : large_game_session_data option)
    ?placed_player_sessions:(placed_player_sessions_ : placed_player_session_list option)
    ?port:(port_ : port_number option) ?dns_name:(dns_name_ : dns_name option)
    ?ip_address:(ip_address_ : ip_address option) ?end_time:(end_time_ : timestamp option)
    ?start_time:(start_time_ : timestamp option)
    ?player_latencies:(player_latencies_ : player_latency_list option)
    ?game_session_region:(game_session_region_ : non_zero_and_max_string option)
    ?game_session_arn:(game_session_arn_ : non_zero_and_max_string option)
    ?game_session_id:(game_session_id_ : non_zero_and_max_string option)
    ?game_session_name:(game_session_name_ : non_zero_and_max_string option)
    ?maximum_player_session_count:(maximum_player_session_count_ : whole_number option)
    ?game_properties:(game_properties_ : game_property_list option)
    ?status:(status_ : game_session_placement_state option)
    ?game_session_queue_name:(game_session_queue_name_ : game_session_queue_name option)
    ?placement_id:(placement_id_ : id_string_model option) () =
  ({
     player_gateway_status = player_gateway_status_;
     priority_configuration_override = priority_configuration_override_;
     matchmaker_data = matchmaker_data_;
     game_session_data = game_session_data_;
     placed_player_sessions = placed_player_sessions_;
     port = port_;
     dns_name = dns_name_;
     ip_address = ip_address_;
     end_time = end_time_;
     start_time = start_time_;
     player_latencies = player_latencies_;
     game_session_region = game_session_region_;
     game_session_arn = game_session_arn_;
     game_session_id = game_session_id_;
     game_session_name = game_session_name_;
     maximum_player_session_count = maximum_player_session_count_;
     game_properties = game_properties_;
     status = status_;
     game_session_queue_name = game_session_queue_name_;
     placement_id = placement_id_;
   }
    : game_session_placement)

let make_stop_game_session_placement_output
    ?game_session_placement:(game_session_placement_ : game_session_placement option) () =
  ({ game_session_placement = game_session_placement_ } : stop_game_session_placement_output)

let make_stop_game_session_placement_input ~placement_id:(placement_id_ : id_string_model) () =
  ({ placement_id = placement_id_ } : stop_game_session_placement_input)

let make_stop_fleet_actions_output ?fleet_arn:(fleet_arn_ : fleet_arn option)
    ?fleet_id:(fleet_id_ : fleet_id option) () =
  ({ fleet_arn = fleet_arn_; fleet_id = fleet_id_ } : stop_fleet_actions_output)

let make_stop_fleet_actions_input ?location:(location_ : location_string_model option)
    ~actions:(actions_ : fleet_action_list) ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({ location = location_; actions = actions_; fleet_id = fleet_id_ } : stop_fleet_actions_input)

let make_attribute_value ?sd_m:(sd_m_ : player_attribute_string_double_map option)
    ?s_l:(s_l_ : player_attribute_string_list option) ?n:(n_ : double_object option)
    ?s:(s_ : player_attribute_string option) () =
  ({ sd_m = sd_m_; s_l = s_l_; n = n_; s = s_ } : attribute_value)

let make_player ?latency_in_ms:(latency_in_ms_ : latency_map option)
    ?team:(team_ : non_zero_and_max_string option)
    ?player_attributes:(player_attributes_ : player_attribute_map option)
    ?player_id:(player_id_ : player_id option) () =
  ({
     latency_in_ms = latency_in_ms_;
     team = team_;
     player_attributes = player_attributes_;
     player_id = player_id_;
   }
    : player)

let make_matched_player_session ?player_session_id:(player_session_id_ : player_session_id option)
    ?player_id:(player_id_ : player_id option) () =
  ({ player_session_id = player_session_id_; player_id = player_id_ } : matched_player_session)

let make_game_session_connection_info
    ?player_gateway_status:(player_gateway_status_ : player_gateway_status option)
    ?matched_player_sessions:(matched_player_sessions_ : matched_player_session_list option)
    ?port:(port_ : positive_integer option) ?dns_name:(dns_name_ : dns_name option)
    ?ip_address:(ip_address_ : ip_address option)
    ?game_session_arn:(game_session_arn_ : arn_string_model option) () =
  ({
     player_gateway_status = player_gateway_status_;
     matched_player_sessions = matched_player_sessions_;
     port = port_;
     dns_name = dns_name_;
     ip_address = ip_address_;
     game_session_arn = game_session_arn_;
   }
    : game_session_connection_info)

let make_matchmaking_ticket ?estimated_wait_time:(estimated_wait_time_ : whole_number option)
    ?game_session_connection_info:
      (game_session_connection_info_ : game_session_connection_info option)
    ?players:(players_ : player_list option) ?end_time:(end_time_ : timestamp option)
    ?start_time:(start_time_ : timestamp option)
    ?status_message:(status_message_ : string_model option)
    ?status_reason:(status_reason_ : string_model option)
    ?status:(status_ : matchmaking_configuration_status option)
    ?configuration_arn:(configuration_arn_ : matchmaking_configuration_arn option)
    ?configuration_name:(configuration_name_ : matchmaking_id_string_model option)
    ?ticket_id:(ticket_id_ : matchmaking_id_string_model option) () =
  ({
     estimated_wait_time = estimated_wait_time_;
     game_session_connection_info = game_session_connection_info_;
     players = players_;
     end_time = end_time_;
     start_time = start_time_;
     status_message = status_message_;
     status_reason = status_reason_;
     status = status_;
     configuration_arn = configuration_arn_;
     configuration_name = configuration_name_;
     ticket_id = ticket_id_;
   }
    : matchmaking_ticket)

let make_start_matchmaking_output
    ?matchmaking_ticket:(matchmaking_ticket_ : matchmaking_ticket option) () =
  ({ matchmaking_ticket = matchmaking_ticket_ } : start_matchmaking_output)

let make_start_matchmaking_input ?ticket_id:(ticket_id_ : matchmaking_id_string_model option)
    ~players:(players_ : player_list)
    ~configuration_name:(configuration_name_ : matchmaking_configuration_name) () =
  ({ players = players_; configuration_name = configuration_name_; ticket_id = ticket_id_ }
    : start_matchmaking_input)

let make_start_match_backfill_output
    ?matchmaking_ticket:(matchmaking_ticket_ : matchmaking_ticket option) () =
  ({ matchmaking_ticket = matchmaking_ticket_ } : start_match_backfill_output)

let make_start_match_backfill_input ?game_session_arn:(game_session_arn_ : arn_string_model option)
    ?ticket_id:(ticket_id_ : matchmaking_id_string_model option) ~players:(players_ : player_list)
    ~configuration_name:(configuration_name_ : matchmaking_configuration_name) () =
  ({
     players = players_;
     game_session_arn = game_session_arn_;
     configuration_name = configuration_name_;
     ticket_id = ticket_id_;
   }
    : start_match_backfill_input)

let make_start_game_session_placement_output
    ?game_session_placement:(game_session_placement_ : game_session_placement option) () =
  ({ game_session_placement = game_session_placement_ } : start_game_session_placement_output)

let make_desired_player_session ?player_data:(player_data_ : player_data option)
    ?player_id:(player_id_ : player_id option) () =
  ({ player_data = player_data_; player_id = player_id_ } : desired_player_session)

let make_start_game_session_placement_input
    ?priority_configuration_override:
      (priority_configuration_override_ : priority_configuration_override option)
    ?game_session_data:(game_session_data_ : large_game_session_data option)
    ?desired_player_sessions:(desired_player_sessions_ : desired_player_session_list option)
    ?player_latencies:(player_latencies_ : player_latency_list option)
    ?game_session_name:(game_session_name_ : non_zero_and_max_string option)
    ?game_properties:(game_properties_ : game_property_list option)
    ~maximum_player_session_count:(maximum_player_session_count_ : whole_number)
    ~game_session_queue_name:(game_session_queue_name_ : game_session_queue_name_or_arn)
    ~placement_id:(placement_id_ : id_string_model) () =
  ({
     priority_configuration_override = priority_configuration_override_;
     game_session_data = game_session_data_;
     desired_player_sessions = desired_player_sessions_;
     player_latencies = player_latencies_;
     game_session_name = game_session_name_;
     maximum_player_session_count = maximum_player_session_count_;
     game_properties = game_properties_;
     game_session_queue_name = game_session_queue_name_;
     placement_id = placement_id_;
   }
    : start_game_session_placement_input)

let make_start_fleet_actions_output ?fleet_arn:(fleet_arn_ : fleet_arn option)
    ?fleet_id:(fleet_id_ : fleet_id option) () =
  ({ fleet_arn = fleet_arn_; fleet_id = fleet_id_ } : start_fleet_actions_output)

let make_start_fleet_actions_input ?location:(location_ : location_string_model option)
    ~actions:(actions_ : fleet_action_list) ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({ location = location_; actions = actions_; fleet_id = fleet_id_ } : start_fleet_actions_input)

let make_search_game_sessions_output ?next_token:(next_token_ : non_zero_and_max_string option)
    ?game_sessions:(game_sessions_ : game_session_list option) () =
  ({ next_token = next_token_; game_sessions = game_sessions_ } : search_game_sessions_output)

let make_search_game_sessions_input ?next_token:(next_token_ : non_zero_and_max_string option)
    ?limit:(limit_ : positive_integer option)
    ?sort_expression:(sort_expression_ : non_zero_and_max_string option)
    ?filter_expression:(filter_expression_ : non_zero_and_max_string option)
    ?location:(location_ : location_string_model option)
    ?alias_id:(alias_id_ : alias_id_or_arn option) ?fleet_id:(fleet_id_ : fleet_id_or_arn option) ()
    =
  ({
     next_token = next_token_;
     limit = limit_;
     sort_expression = sort_expression_;
     filter_expression = filter_expression_;
     location = location_;
     alias_id = alias_id_;
     fleet_id = fleet_id_;
   }
    : search_game_sessions_input)

let make_scaling_policy ?location:(location_ : location_string_model option)
    ?update_status:(update_status_ : location_update_status option)
    ?target_configuration:(target_configuration_ : target_configuration option)
    ?policy_type:(policy_type_ : policy_type option)
    ?metric_name:(metric_name_ : metric_name option)
    ?evaluation_periods:(evaluation_periods_ : positive_integer option)
    ?threshold:(threshold_ : double option)
    ?comparison_operator:(comparison_operator_ : comparison_operator_type option)
    ?scaling_adjustment_type:(scaling_adjustment_type_ : scaling_adjustment_type option)
    ?scaling_adjustment:(scaling_adjustment_ : integer option)
    ?status:(status_ : scaling_status_type option) ?name:(name_ : non_zero_and_max_string option)
    ?fleet_arn:(fleet_arn_ : fleet_arn option) ?fleet_id:(fleet_id_ : fleet_id option) () =
  ({
     location = location_;
     update_status = update_status_;
     target_configuration = target_configuration_;
     policy_type = policy_type_;
     metric_name = metric_name_;
     evaluation_periods = evaluation_periods_;
     threshold = threshold_;
     comparison_operator = comparison_operator_;
     scaling_adjustment_type = scaling_adjustment_type_;
     scaling_adjustment = scaling_adjustment_;
     status = status_;
     name = name_;
     fleet_arn = fleet_arn_;
     fleet_id = fleet_id_;
   }
    : scaling_policy)

let make_resume_game_server_group_output
    ?game_server_group:(game_server_group_ : game_server_group option) () =
  ({ game_server_group = game_server_group_ } : resume_game_server_group_output)

let make_resume_game_server_group_input
    ~resume_actions:(resume_actions_ : game_server_group_actions)
    ~game_server_group_name:(game_server_group_name_ : game_server_group_name_or_arn) () =
  ({ resume_actions = resume_actions_; game_server_group_name = game_server_group_name_ }
    : resume_game_server_group_input)

let make_resolve_alias_output ?fleet_arn:(fleet_arn_ : fleet_arn option)
    ?fleet_id:(fleet_id_ : fleet_id option) () =
  ({ fleet_arn = fleet_arn_; fleet_id = fleet_id_ } : resolve_alias_output)

let make_resolve_alias_input ~alias_id:(alias_id_ : alias_id_or_arn) () =
  ({ alias_id = alias_id_ } : resolve_alias_input)

let make_aws_credentials ?session_token:(session_token_ : non_empty_string option)
    ?secret_access_key:(secret_access_key_ : non_empty_string option)
    ?access_key_id:(access_key_id_ : non_empty_string option) () =
  ({
     session_token = session_token_;
     secret_access_key = secret_access_key_;
     access_key_id = access_key_id_;
   }
    : aws_credentials)

let make_request_upload_credentials_output
    ?storage_location:(storage_location_ : s3_location option)
    ?upload_credentials:(upload_credentials_ : aws_credentials option) () =
  ({ storage_location = storage_location_; upload_credentials = upload_credentials_ }
    : request_upload_credentials_output)

let make_request_upload_credentials_input ~build_id:(build_id_ : build_id_or_arn) () =
  ({ build_id = build_id_ } : request_upload_credentials_input)

let make_register_game_server_output ?game_server:(game_server_ : game_server option) () =
  ({ game_server = game_server_ } : register_game_server_output)

let make_register_game_server_input ?game_server_data:(game_server_data_ : game_server_data option)
    ?connection_info:(connection_info_ : game_server_connection_info option)
    ~instance_id:(instance_id_ : game_server_instance_id)
    ~game_server_id:(game_server_id_ : game_server_id)
    ~game_server_group_name:(game_server_group_name_ : game_server_group_name_or_arn) () =
  ({
     game_server_data = game_server_data_;
     connection_info = connection_info_;
     instance_id = instance_id_;
     game_server_id = game_server_id_;
     game_server_group_name = game_server_group_name_;
   }
    : register_game_server_input)

let make_container_attribute ?container_runtime_id:(container_runtime_id_ : non_empty_string option)
    ?container_name:(container_name_ : non_zero_and128_max_ascii_string option) () =
  ({ container_runtime_id = container_runtime_id_; container_name = container_name_ }
    : container_attribute)

let make_compute
    ?game_server_container_group_definition_arn:
      (game_server_container_group_definition_arn_ : container_group_definition_name_or_arn option)
    ?container_attributes:(container_attributes_ : container_attributes option)
    ?instance_id:(instance_id_ : instance_id option)
    ?game_lift_agent_endpoint:(game_lift_agent_endpoint_ : game_lift_agent_endpoint_output option)
    ?game_lift_service_sdk_endpoint:
      (game_lift_service_sdk_endpoint_ : game_lift_service_sdk_endpoint_output option)
    ?type_:(type__ : ec2_instance_type option)
    ?operating_system:(operating_system_ : operating_system option)
    ?creation_time:(creation_time_ : timestamp option)
    ?location:(location_ : location_string_model option)
    ?compute_status:(compute_status_ : compute_status option)
    ?dns_name:(dns_name_ : dns_name option) ?ip_address:(ip_address_ : ip_address option)
    ?compute_arn:(compute_arn_ : compute_arn option)
    ?compute_name:(compute_name_ : compute_name option) ?fleet_arn:(fleet_arn_ : fleet_arn option)
    ?fleet_id:(fleet_id_ : fleet_id option) () =
  ({
     game_server_container_group_definition_arn = game_server_container_group_definition_arn_;
     container_attributes = container_attributes_;
     instance_id = instance_id_;
     game_lift_agent_endpoint = game_lift_agent_endpoint_;
     game_lift_service_sdk_endpoint = game_lift_service_sdk_endpoint_;
     type_ = type__;
     operating_system = operating_system_;
     creation_time = creation_time_;
     location = location_;
     compute_status = compute_status_;
     dns_name = dns_name_;
     ip_address = ip_address_;
     compute_arn = compute_arn_;
     compute_name = compute_name_;
     fleet_arn = fleet_arn_;
     fleet_id = fleet_id_;
   }
    : compute)

let make_register_compute_output ?compute:(compute_ : compute option) () =
  ({ compute = compute_ } : register_compute_output)

let make_register_compute_input ?location:(location_ : location_string_model option)
    ?ip_address:(ip_address_ : ip_address option) ?dns_name:(dns_name_ : dns_name_input option)
    ?certificate_path:(certificate_path_ : non_zero_and_max_string option)
    ~compute_name:(compute_name_ : compute_name) ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({
     location = location_;
     ip_address = ip_address_;
     dns_name = dns_name_;
     certificate_path = certificate_path_;
     compute_name = compute_name_;
     fleet_id = fleet_id_;
   }
    : register_compute_input)

let make_put_scaling_policy_output ?name:(name_ : non_zero_and_max_string option) () =
  ({ name = name_ } : put_scaling_policy_output)

let make_put_scaling_policy_input
    ?target_configuration:(target_configuration_ : target_configuration option)
    ?policy_type:(policy_type_ : policy_type option)
    ?evaluation_periods:(evaluation_periods_ : positive_integer option)
    ?comparison_operator:(comparison_operator_ : comparison_operator_type option)
    ?threshold:(threshold_ : double option)
    ?scaling_adjustment_type:(scaling_adjustment_type_ : scaling_adjustment_type option)
    ?scaling_adjustment:(scaling_adjustment_ : integer option)
    ~metric_name:(metric_name_ : metric_name) ~fleet_id:(fleet_id_ : fleet_id_or_arn)
    ~name:(name_ : non_zero_and_max_string) () =
  ({
     target_configuration = target_configuration_;
     policy_type = policy_type_;
     metric_name = metric_name_;
     evaluation_periods = evaluation_periods_;
     comparison_operator = comparison_operator_;
     threshold = threshold_;
     scaling_adjustment_type = scaling_adjustment_type_;
     scaling_adjustment = scaling_adjustment_;
     fleet_id = fleet_id_;
     name = name_;
   }
    : put_scaling_policy_input)

let make_player_session ?player_data:(player_data_ : player_data option)
    ?port:(port_ : port_number option) ?dns_name:(dns_name_ : dns_name option)
    ?ip_address:(ip_address_ : ip_address option) ?status:(status_ : player_session_status option)
    ?termination_time:(termination_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option) ?fleet_arn:(fleet_arn_ : fleet_arn option)
    ?fleet_id:(fleet_id_ : fleet_id option)
    ?game_session_id:(game_session_id_ : non_zero_and_max_string option)
    ?player_id:(player_id_ : player_id option)
    ?player_session_id:(player_session_id_ : player_session_id option) () =
  ({
     player_data = player_data_;
     port = port_;
     dns_name = dns_name_;
     ip_address = ip_address_;
     status = status_;
     termination_time = termination_time_;
     creation_time = creation_time_;
     fleet_arn = fleet_arn_;
     fleet_id = fleet_id_;
     game_session_id = game_session_id_;
     player_id = player_id_;
     player_session_id = player_session_id_;
   }
    : player_session)

let make_player_gateway_configuration
    ?game_server_ip_protocol_supported:
      (game_server_ip_protocol_supported_ : game_server_ip_protocol_supported option) () =
  ({ game_server_ip_protocol_supported = game_server_ip_protocol_supported_ }
    : player_gateway_configuration)

let make_player_connection_endpoint ?port:(port_ : port_number option)
    ?ip_address:(ip_address_ : ip_address option) () =
  ({ port = port_; ip_address = ip_address_ } : player_connection_endpoint)

let make_player_connection_detail ?expiration:(expiration_ : timestamp option)
    ?player_gateway_token:(player_gateway_token_ : max_string option)
    ?endpoints:(endpoints_ : player_connection_endpoint_list option)
    ?player_id:(player_id_ : player_id option) () =
  ({
     expiration = expiration_;
     player_gateway_token = player_gateway_token_;
     endpoints = endpoints_;
     player_id = player_id_;
   }
    : player_connection_detail)

let make_ping_beacon ?udp_endpoint:(udp_endpoint_ : udp_endpoint option) () =
  ({ udp_endpoint = udp_endpoint_ } : ping_beacon)

let make_matchmaking_rule_set ?creation_time:(creation_time_ : timestamp option)
    ?rule_set_arn:(rule_set_arn_ : matchmaking_rule_set_arn option)
    ?rule_set_name:(rule_set_name_ : matchmaking_id_string_model option)
    ~rule_set_body:(rule_set_body_ : rule_set_body) () =
  ({
     creation_time = creation_time_;
     rule_set_body = rule_set_body_;
     rule_set_arn = rule_set_arn_;
     rule_set_name = rule_set_name_;
   }
    : matchmaking_rule_set)

let make_locational_deployment ?deployment_status:(deployment_status_ : deployment_status option) ()
    =
  ({ deployment_status = deployment_status_ } : locational_deployment)

let make_location_state
    ?player_gateway_status:(player_gateway_status_ : player_gateway_status option)
    ?status:(status_ : fleet_status option) ?location:(location_ : location_string_model option) ()
    =
  ({ player_gateway_status = player_gateway_status_; status = status_; location = location_ }
    : location_state)

let make_location_model ?ping_beacon:(ping_beacon_ : ping_beacon option)
    ?location_arn:(location_arn_ : location_arn_model option)
    ?location_name:(location_name_ : location_string_model option) () =
  ({ ping_beacon = ping_beacon_; location_arn = location_arn_; location_name = location_name_ }
    : location_model)

let make_location_configuration ~location:(location_ : location_string_model) () =
  ({ location = location_ } : location_configuration)

let make_location_attributes ?update_status:(update_status_ : location_update_status option)
    ?stopped_actions:(stopped_actions_ : fleet_action_list option)
    ?location_state:(location_state_ : location_state option) () =
  ({
     update_status = update_status_;
     stopped_actions = stopped_actions_;
     location_state = location_state_;
   }
    : location_attributes)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)

let make_list_scripts_output ?next_token:(next_token_ : non_empty_string option)
    ?scripts:(scripts_ : script_list option) () =
  ({ next_token = next_token_; scripts = scripts_ } : list_scripts_output)

let make_list_scripts_input ?next_token:(next_token_ : non_empty_string option)
    ?limit:(limit_ : positive_integer option) () =
  ({ next_token = next_token_; limit = limit_ } : list_scripts_input)

let make_list_locations_output ?next_token:(next_token_ : non_zero_and_max_string option)
    ?locations:(locations_ : location_model_list option) () =
  ({ next_token = next_token_; locations = locations_ } : list_locations_output)

let make_list_locations_input ?next_token:(next_token_ : non_zero_and_max_string option)
    ?limit:(limit_ : list_locations_limit option) ?filters:(filters_ : location_filter_list option)
    () =
  ({ next_token = next_token_; limit = limit_; filters = filters_ } : list_locations_input)

let make_list_game_servers_output ?next_token:(next_token_ : non_zero_and_max_string option)
    ?game_servers:(game_servers_ : game_servers option) () =
  ({ next_token = next_token_; game_servers = game_servers_ } : list_game_servers_output)

let make_list_game_servers_input ?next_token:(next_token_ : non_zero_and_max_string option)
    ?limit:(limit_ : positive_integer option) ?sort_order:(sort_order_ : sort_order option)
    ~game_server_group_name:(game_server_group_name_ : game_server_group_name_or_arn) () =
  ({
     next_token = next_token_;
     limit = limit_;
     sort_order = sort_order_;
     game_server_group_name = game_server_group_name_;
   }
    : list_game_servers_input)

let make_list_game_server_groups_output ?next_token:(next_token_ : non_zero_and_max_string option)
    ?game_server_groups:(game_server_groups_ : game_server_groups option) () =
  ({ next_token = next_token_; game_server_groups = game_server_groups_ }
    : list_game_server_groups_output)

let make_list_game_server_groups_input ?next_token:(next_token_ : non_zero_and_max_string option)
    ?limit:(limit_ : positive_integer option) () =
  ({ next_token = next_token_; limit = limit_ } : list_game_server_groups_input)

let make_list_fleets_output ?next_token:(next_token_ : non_zero_and_max_string option)
    ?fleet_ids:(fleet_ids_ : fleet_id_list option) () =
  ({ next_token = next_token_; fleet_ids = fleet_ids_ } : list_fleets_output)

let make_list_fleets_input ?next_token:(next_token_ : non_zero_and_max_string option)
    ?limit:(limit_ : positive_integer option) ?script_id:(script_id_ : script_id_or_arn option)
    ?build_id:(build_id_ : build_id_or_arn option) () =
  ({ next_token = next_token_; limit = limit_; script_id = script_id_; build_id = build_id_ }
    : list_fleets_input)

let make_fleet_deployment ?creation_time:(creation_time_ : timestamp option)
    ?deployment_configuration:(deployment_configuration_ : deployment_configuration option)
    ?deployment_status:(deployment_status_ : deployment_status option)
    ?rollback_per_instance_binary_arn:(rollback_per_instance_binary_arn_ : fleet_binary_arn option)
    ?per_instance_binary_arn:(per_instance_binary_arn_ : fleet_binary_arn option)
    ?rollback_game_server_binary_arn:(rollback_game_server_binary_arn_ : fleet_binary_arn option)
    ?game_server_binary_arn:(game_server_binary_arn_ : fleet_binary_arn option)
    ?fleet_id:(fleet_id_ : fleet_id option) ?deployment_id:(deployment_id_ : deployment_id option)
    () =
  ({
     creation_time = creation_time_;
     deployment_configuration = deployment_configuration_;
     deployment_status = deployment_status_;
     rollback_per_instance_binary_arn = rollback_per_instance_binary_arn_;
     per_instance_binary_arn = per_instance_binary_arn_;
     rollback_game_server_binary_arn = rollback_game_server_binary_arn_;
     game_server_binary_arn = game_server_binary_arn_;
     fleet_id = fleet_id_;
     deployment_id = deployment_id_;
   }
    : fleet_deployment)

let make_list_fleet_deployments_output ?next_token:(next_token_ : non_zero_and_max_string option)
    ?fleet_deployments:(fleet_deployments_ : fleet_deployments option) () =
  ({ next_token = next_token_; fleet_deployments = fleet_deployments_ }
    : list_fleet_deployments_output)

let make_list_fleet_deployments_input ?next_token:(next_token_ : non_zero_and_max_string option)
    ?limit:(limit_ : positive_integer option) ?fleet_id:(fleet_id_ : fleet_id_or_arn option) () =
  ({ next_token = next_token_; limit = limit_; fleet_id = fleet_id_ }
    : list_fleet_deployments_input)

let make_list_container_group_definitions_output
    ?next_token:(next_token_ : non_zero_and_max_string option)
    ?container_group_definitions:
      (container_group_definitions_ : container_group_definition_list option) () =
  ({ next_token = next_token_; container_group_definitions = container_group_definitions_ }
    : list_container_group_definitions_output)

let make_list_container_group_definitions_input
    ?next_token:(next_token_ : non_zero_and_max_string option)
    ?limit:(limit_ : list_container_group_definitions_limit option)
    ?container_group_type:(container_group_type_ : container_group_type option) () =
  ({ next_token = next_token_; limit = limit_; container_group_type = container_group_type_ }
    : list_container_group_definitions_input)

let make_list_container_group_definition_versions_output
    ?next_token:(next_token_ : non_zero_and_max_string option)
    ?container_group_definitions:
      (container_group_definitions_ : container_group_definition_list option) () =
  ({ next_token = next_token_; container_group_definitions = container_group_definitions_ }
    : list_container_group_definition_versions_output)

let make_list_container_group_definition_versions_input
    ?next_token:(next_token_ : non_zero_and_max_string option)
    ?limit:(limit_ : list_container_group_definition_versions_limit option)
    ~name:(name_ : container_group_definition_name_or_arn) () =
  ({ next_token = next_token_; limit = limit_; name = name_ }
    : list_container_group_definition_versions_input)

let make_list_container_fleets_output ?next_token:(next_token_ : non_zero_and_max_string option)
    ?container_fleets:(container_fleets_ : container_fleet_list option) () =
  ({ next_token = next_token_; container_fleets = container_fleets_ }
    : list_container_fleets_output)

let make_list_container_fleets_input ?next_token:(next_token_ : non_zero_and_max_string option)
    ?limit:(limit_ : positive_integer option)
    ?container_group_definition_name:
      (container_group_definition_name_ : container_group_definition_name_or_arn option) () =
  ({
     next_token = next_token_;
     limit = limit_;
     container_group_definition_name = container_group_definition_name_;
   }
    : list_container_fleets_input)

let make_list_compute_output ?next_token:(next_token_ : non_zero_and_max_string option)
    ?compute_list:(compute_list_ : compute_list option) () =
  ({ next_token = next_token_; compute_list = compute_list_ } : list_compute_output)

let make_list_compute_input ?next_token:(next_token_ : non_zero_and_max_string option)
    ?limit:(limit_ : positive_integer option)
    ?compute_status:(compute_status_ : list_compute_input_status option)
    ?container_group_definition_name:
      (container_group_definition_name_ : container_group_definition_name_or_arn option)
    ?location:(location_ : location_string_model option) ~fleet_id:(fleet_id_ : fleet_id_or_arn) ()
    =
  ({
     next_token = next_token_;
     limit = limit_;
     compute_status = compute_status_;
     container_group_definition_name = container_group_definition_name_;
     location = location_;
     fleet_id = fleet_id_;
   }
    : list_compute_input)

let make_list_builds_output ?next_token:(next_token_ : non_empty_string option)
    ?builds:(builds_ : build_list option) () =
  ({ next_token = next_token_; builds = builds_ } : list_builds_output)

let make_list_builds_input ?next_token:(next_token_ : non_empty_string option)
    ?limit:(limit_ : positive_integer option) ?status:(status_ : build_status option) () =
  ({ next_token = next_token_; limit = limit_; status = status_ } : list_builds_input)

let make_list_aliases_output ?next_token:(next_token_ : non_empty_string option)
    ?aliases:(aliases_ : alias_list option) () =
  ({ next_token = next_token_; aliases = aliases_ } : list_aliases_output)

let make_list_aliases_input ?next_token:(next_token_ : non_empty_string option)
    ?limit:(limit_ : positive_integer option) ?name:(name_ : non_empty_string option)
    ?routing_strategy_type:(routing_strategy_type_ : routing_strategy_type option) () =
  ({
     next_token = next_token_;
     limit = limit_;
     name = name_;
     routing_strategy_type = routing_strategy_type_;
   }
    : list_aliases_input)

let make_launch_template_specification ?version:(version_ : launch_template_version option)
    ?launch_template_name:(launch_template_name_ : launch_template_name option)
    ?launch_template_id:(launch_template_id_ : launch_template_id option) () =
  ({
     version = version_;
     launch_template_name = launch_template_name_;
     launch_template_id = launch_template_id_;
   }
    : launch_template_specification)

let make_instance ?location:(location_ : location_string_model option)
    ?creation_time:(creation_time_ : timestamp option) ?status:(status_ : instance_status option)
    ?type_:(type__ : ec2_instance_type option)
    ?operating_system:(operating_system_ : operating_system option)
    ?dns_name:(dns_name_ : dns_name option) ?ip_address:(ip_address_ : ip_address option)
    ?instance_id:(instance_id_ : instance_id option) ?fleet_arn:(fleet_arn_ : fleet_arn option)
    ?fleet_id:(fleet_id_ : fleet_id option) () =
  ({
     location = location_;
     creation_time = creation_time_;
     status = status_;
     type_ = type__;
     operating_system = operating_system_;
     dns_name = dns_name_;
     ip_address = ip_address_;
     instance_id = instance_id_;
     fleet_arn = fleet_arn_;
     fleet_id = fleet_id_;
   }
    : instance)

let make_instance_credentials ?secret:(secret_ : non_empty_string option)
    ?user_name:(user_name_ : non_empty_string option) () =
  ({ secret = secret_; user_name = user_name_ } : instance_credentials)

let make_instance_access ?credentials:(credentials_ : instance_credentials option)
    ?operating_system:(operating_system_ : operating_system option)
    ?ip_address:(ip_address_ : ip_address option) ?instance_id:(instance_id_ : instance_id option)
    ?fleet_id:(fleet_id_ : fleet_id option) () =
  ({
     credentials = credentials_;
     operating_system = operating_system_;
     ip_address = ip_address_;
     instance_id = instance_id_;
     fleet_id = fleet_id_;
   }
    : instance_access)

let make_get_player_connection_details_output
    ?player_connection_details:(player_connection_details_ : player_connection_detail_list option)
    ?game_session_id:(game_session_id_ : arn_string_model option) () =
  ({ player_connection_details = player_connection_details_; game_session_id = game_session_id_ }
    : get_player_connection_details_output)

let make_get_player_connection_details_input ~player_ids:(player_ids_ : player_id_list)
    ~game_session_id:(game_session_id_ : arn_string_model) () =
  ({ player_ids = player_ids_; game_session_id = game_session_id_ }
    : get_player_connection_details_input)

let make_get_instance_access_output ?instance_access:(instance_access_ : instance_access option) ()
    =
  ({ instance_access = instance_access_ } : get_instance_access_output)

let make_get_instance_access_input ~instance_id:(instance_id_ : instance_id)
    ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({ instance_id = instance_id_; fleet_id = fleet_id_ } : get_instance_access_input)

let make_get_game_session_log_url_output
    ?pre_signed_url:(pre_signed_url_ : non_zero_and_max_string option) () =
  ({ pre_signed_url = pre_signed_url_ } : get_game_session_log_url_output)

let make_get_game_session_log_url_input ~game_session_id:(game_session_id_ : arn_string_model) () =
  ({ game_session_id = game_session_id_ } : get_game_session_log_url_input)

let make_get_compute_auth_token_output
    ?expiration_timestamp:(expiration_timestamp_ : timestamp option)
    ?auth_token:(auth_token_ : compute_auth_token option)
    ?compute_arn:(compute_arn_ : compute_arn option)
    ?compute_name:(compute_name_ : compute_name_or_arn option)
    ?fleet_arn:(fleet_arn_ : fleet_arn option) ?fleet_id:(fleet_id_ : fleet_id_or_arn option) () =
  ({
     expiration_timestamp = expiration_timestamp_;
     auth_token = auth_token_;
     compute_arn = compute_arn_;
     compute_name = compute_name_;
     fleet_arn = fleet_arn_;
     fleet_id = fleet_id_;
   }
    : get_compute_auth_token_output)

let make_get_compute_auth_token_input ~compute_name:(compute_name_ : compute_name_or_arn)
    ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({ compute_name = compute_name_; fleet_id = fleet_id_ } : get_compute_auth_token_input)

let make_container_identifier
    ?container_runtime_id:(container_runtime_id_ : non_empty_string option)
    ?container_name:(container_name_ : non_zero_and128_max_ascii_string option) () =
  ({ container_runtime_id = container_runtime_id_; container_name = container_name_ }
    : container_identifier)

let make_get_compute_access_output
    ?container_identifiers:(container_identifiers_ : container_identifier_list option)
    ?target:(target_ : session_target option) ?credentials:(credentials_ : aws_credentials option)
    ?compute_arn:(compute_arn_ : compute_arn option)
    ?compute_name:(compute_name_ : compute_name_or_arn option)
    ?fleet_arn:(fleet_arn_ : fleet_arn option) ?fleet_id:(fleet_id_ : fleet_id_or_arn option) () =
  ({
     container_identifiers = container_identifiers_;
     target = target_;
     credentials = credentials_;
     compute_arn = compute_arn_;
     compute_name = compute_name_;
     fleet_arn = fleet_arn_;
     fleet_id = fleet_id_;
   }
    : get_compute_access_output)

let make_get_compute_access_input ~compute_name:(compute_name_ : compute_name_or_arn)
    ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({ compute_name = compute_name_; fleet_id = fleet_id_ } : get_compute_access_input)

let make_game_session_detail ?protection_policy:(protection_policy_ : protection_policy option)
    ?game_session:(game_session_ : game_session option) () =
  ({ protection_policy = protection_policy_; game_session = game_session_ } : game_session_detail)

let make_game_server_instance
    ?instance_status:(instance_status_ : game_server_instance_status option)
    ?instance_id:(instance_id_ : game_server_instance_id option)
    ?game_server_group_arn:(game_server_group_arn_ : game_server_group_arn option)
    ?game_server_group_name:(game_server_group_name_ : game_server_group_name option) () =
  ({
     instance_status = instance_status_;
     instance_id = instance_id_;
     game_server_group_arn = game_server_group_arn_;
     game_server_group_name = game_server_group_name_;
   }
    : game_server_instance)

let make_game_server_group_auto_scaling_policy
    ?estimated_instance_warmup:(estimated_instance_warmup_ : positive_integer option)
    ~target_tracking_configuration:(target_tracking_configuration_ : target_tracking_configuration)
    () =
  ({
     target_tracking_configuration = target_tracking_configuration_;
     estimated_instance_warmup = estimated_instance_warmup_;
   }
    : game_server_group_auto_scaling_policy)

let make_game_server_container_group_counts ?terminatin_g:(terminatin_g_ : whole_number option)
    ?idl_e:(idl_e_ : whole_number option) ?activ_e:(activ_e_ : whole_number option)
    ?pendin_g:(pendin_g_ : whole_number option) () =
  ({ terminatin_g = terminatin_g_; idl_e = idl_e_; activ_e = activ_e_; pendin_g = pendin_g_ }
    : game_server_container_group_counts)

let make_describe_vpc_peering_connections_output
    ?vpc_peering_connections:(vpc_peering_connections_ : vpc_peering_connection_list option) () =
  ({ vpc_peering_connections = vpc_peering_connections_ } : describe_vpc_peering_connections_output)

let make_describe_vpc_peering_connections_input ?fleet_id:(fleet_id_ : fleet_id option) () =
  ({ fleet_id = fleet_id_ } : describe_vpc_peering_connections_input)

let make_describe_vpc_peering_authorizations_output
    ?vpc_peering_authorizations:
      (vpc_peering_authorizations_ : vpc_peering_authorization_list option) () =
  ({ vpc_peering_authorizations = vpc_peering_authorizations_ }
    : describe_vpc_peering_authorizations_output)

let make_describe_vpc_peering_authorizations_input () = (() : unit)

let make_describe_script_output ?script:(script_ : script option) () =
  ({ script = script_ } : describe_script_output)

let make_describe_script_input ~script_id:(script_id_ : script_id_or_arn) () =
  ({ script_id = script_id_ } : describe_script_input)

let make_describe_scaling_policies_output ?next_token:(next_token_ : non_zero_and_max_string option)
    ?scaling_policies:(scaling_policies_ : scaling_policy_list option) () =
  ({ next_token = next_token_; scaling_policies = scaling_policies_ }
    : describe_scaling_policies_output)

let make_describe_scaling_policies_input ?location:(location_ : location_string_model option)
    ?next_token:(next_token_ : non_zero_and_max_string option)
    ?limit:(limit_ : positive_integer option)
    ?status_filter:(status_filter_ : scaling_status_type option)
    ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({
     location = location_;
     next_token = next_token_;
     limit = limit_;
     status_filter = status_filter_;
     fleet_id = fleet_id_;
   }
    : describe_scaling_policies_input)

let make_describe_runtime_configuration_output
    ?runtime_configuration:(runtime_configuration_ : runtime_configuration option) () =
  ({ runtime_configuration = runtime_configuration_ } : describe_runtime_configuration_output)

let make_describe_runtime_configuration_input ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({ fleet_id = fleet_id_ } : describe_runtime_configuration_input)

let make_describe_player_sessions_output ?next_token:(next_token_ : non_zero_and_max_string option)
    ?player_sessions:(player_sessions_ : player_session_list option) () =
  ({ next_token = next_token_; player_sessions = player_sessions_ }
    : describe_player_sessions_output)

let make_describe_player_sessions_input ?next_token:(next_token_ : non_zero_and_max_string option)
    ?limit:(limit_ : positive_integer option)
    ?player_session_status_filter:(player_session_status_filter_ : non_zero_and_max_string option)
    ?player_session_id:(player_session_id_ : player_session_id option)
    ?player_id:(player_id_ : player_id option)
    ?game_session_id:(game_session_id_ : arn_string_model option) () =
  ({
     next_token = next_token_;
     limit = limit_;
     player_session_status_filter = player_session_status_filter_;
     player_session_id = player_session_id_;
     player_id = player_id_;
     game_session_id = game_session_id_;
   }
    : describe_player_sessions_input)

let make_describe_matchmaking_rule_sets_output
    ?next_token:(next_token_ : non_zero_and_max_string option)
    ~rule_sets:(rule_sets_ : matchmaking_rule_set_list) () =
  ({ next_token = next_token_; rule_sets = rule_sets_ } : describe_matchmaking_rule_sets_output)

let make_describe_matchmaking_rule_sets_input
    ?next_token:(next_token_ : non_zero_and_max_string option)
    ?limit:(limit_ : rule_set_limit option) ?names:(names_ : matchmaking_rule_set_name_list option)
    () =
  ({ next_token = next_token_; limit = limit_; names = names_ }
    : describe_matchmaking_rule_sets_input)

let make_describe_matchmaking_configurations_output
    ?next_token:(next_token_ : non_zero_and_max_string option)
    ?configurations:(configurations_ : matchmaking_configuration_list option) () =
  ({ next_token = next_token_; configurations = configurations_ }
    : describe_matchmaking_configurations_output)

let make_describe_matchmaking_configurations_input
    ?next_token:(next_token_ : non_zero_and_max_string option)
    ?limit:(limit_ : positive_integer option)
    ?rule_set_name:(rule_set_name_ : matchmaking_rule_set_name option)
    ?names:(names_ : matchmaking_configuration_name_list option) () =
  ({ next_token = next_token_; limit = limit_; rule_set_name = rule_set_name_; names = names_ }
    : describe_matchmaking_configurations_input)

let make_describe_matchmaking_output ?ticket_list:(ticket_list_ : matchmaking_ticket_list option) ()
    =
  ({ ticket_list = ticket_list_ } : describe_matchmaking_output)

let make_describe_matchmaking_input ~ticket_ids:(ticket_ids_ : matchmaking_id_list) () =
  ({ ticket_ids = ticket_ids_ } : describe_matchmaking_input)

let make_describe_instances_output ?next_token:(next_token_ : non_zero_and_max_string option)
    ?instances:(instances_ : instance_list option) () =
  ({ next_token = next_token_; instances = instances_ } : describe_instances_output)

let make_describe_instances_input ?location:(location_ : location_string_model option)
    ?next_token:(next_token_ : non_zero_and_max_string option)
    ?limit:(limit_ : positive_integer option) ?instance_id:(instance_id_ : instance_id option)
    ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({
     location = location_;
     next_token = next_token_;
     limit = limit_;
     instance_id = instance_id_;
     fleet_id = fleet_id_;
   }
    : describe_instances_input)

let make_describe_game_sessions_output ?next_token:(next_token_ : non_zero_and_max_string option)
    ?game_sessions:(game_sessions_ : game_session_list option) () =
  ({ next_token = next_token_; game_sessions = game_sessions_ } : describe_game_sessions_output)

let make_describe_game_sessions_input ?next_token:(next_token_ : non_zero_and_max_string option)
    ?limit:(limit_ : positive_integer option)
    ?status_filter:(status_filter_ : non_zero_and_max_string option)
    ?location:(location_ : location_string_model option)
    ?alias_id:(alias_id_ : alias_id_or_arn option)
    ?game_session_id:(game_session_id_ : arn_string_model option)
    ?fleet_id:(fleet_id_ : fleet_id_or_arn option) () =
  ({
     next_token = next_token_;
     limit = limit_;
     status_filter = status_filter_;
     location = location_;
     alias_id = alias_id_;
     game_session_id = game_session_id_;
     fleet_id = fleet_id_;
   }
    : describe_game_sessions_input)

let make_describe_game_session_queues_output
    ?next_token:(next_token_ : non_zero_and_max_string option)
    ?game_session_queues:(game_session_queues_ : game_session_queue_list option) () =
  ({ next_token = next_token_; game_session_queues = game_session_queues_ }
    : describe_game_session_queues_output)

let make_describe_game_session_queues_input
    ?next_token:(next_token_ : non_zero_and_max_string option)
    ?limit:(limit_ : positive_integer option)
    ?names:(names_ : game_session_queue_name_or_arn_list option) () =
  ({ next_token = next_token_; limit = limit_; names = names_ }
    : describe_game_session_queues_input)

let make_describe_game_session_placement_output
    ?game_session_placement:(game_session_placement_ : game_session_placement option) () =
  ({ game_session_placement = game_session_placement_ } : describe_game_session_placement_output)

let make_describe_game_session_placement_input ~placement_id:(placement_id_ : id_string_model) () =
  ({ placement_id = placement_id_ } : describe_game_session_placement_input)

let make_describe_game_session_details_output
    ?next_token:(next_token_ : non_zero_and_max_string option)
    ?game_session_details:(game_session_details_ : game_session_detail_list option) () =
  ({ next_token = next_token_; game_session_details = game_session_details_ }
    : describe_game_session_details_output)

let make_describe_game_session_details_input
    ?next_token:(next_token_ : non_zero_and_max_string option)
    ?limit:(limit_ : positive_integer option)
    ?status_filter:(status_filter_ : non_zero_and_max_string option)
    ?location:(location_ : location_string_model option)
    ?alias_id:(alias_id_ : alias_id_or_arn option)
    ?game_session_id:(game_session_id_ : arn_string_model option)
    ?fleet_id:(fleet_id_ : fleet_id_or_arn option) () =
  ({
     next_token = next_token_;
     limit = limit_;
     status_filter = status_filter_;
     location = location_;
     alias_id = alias_id_;
     game_session_id = game_session_id_;
     fleet_id = fleet_id_;
   }
    : describe_game_session_details_input)

let make_describe_game_server_instances_output
    ?next_token:(next_token_ : non_zero_and_max_string option)
    ?game_server_instances:(game_server_instances_ : game_server_instances option) () =
  ({ next_token = next_token_; game_server_instances = game_server_instances_ }
    : describe_game_server_instances_output)

let make_describe_game_server_instances_input
    ?next_token:(next_token_ : non_zero_and_max_string option)
    ?limit:(limit_ : positive_integer option)
    ?instance_ids:(instance_ids_ : game_server_instance_ids option)
    ~game_server_group_name:(game_server_group_name_ : game_server_group_name_or_arn) () =
  ({
     next_token = next_token_;
     limit = limit_;
     instance_ids = instance_ids_;
     game_server_group_name = game_server_group_name_;
   }
    : describe_game_server_instances_input)

let make_describe_game_server_group_output
    ?game_server_group:(game_server_group_ : game_server_group option) () =
  ({ game_server_group = game_server_group_ } : describe_game_server_group_output)

let make_describe_game_server_group_input
    ~game_server_group_name:(game_server_group_name_ : game_server_group_name_or_arn) () =
  ({ game_server_group_name = game_server_group_name_ } : describe_game_server_group_input)

let make_describe_game_server_output ?game_server:(game_server_ : game_server option) () =
  ({ game_server = game_server_ } : describe_game_server_output)

let make_describe_game_server_input ~game_server_id:(game_server_id_ : game_server_id)
    ~game_server_group_name:(game_server_group_name_ : game_server_group_name_or_arn) () =
  ({ game_server_id = game_server_id_; game_server_group_name = game_server_group_name_ }
    : describe_game_server_input)

let make_fleet_utilization ?location:(location_ : location_string_model option)
    ?maximum_player_session_count:(maximum_player_session_count_ : whole_number option)
    ?current_player_session_count:(current_player_session_count_ : whole_number option)
    ?active_game_session_count:(active_game_session_count_ : whole_number option)
    ?active_server_process_count:(active_server_process_count_ : whole_number option)
    ?fleet_arn:(fleet_arn_ : fleet_arn option) ?fleet_id:(fleet_id_ : fleet_id option) () =
  ({
     location = location_;
     maximum_player_session_count = maximum_player_session_count_;
     current_player_session_count = current_player_session_count_;
     active_game_session_count = active_game_session_count_;
     active_server_process_count = active_server_process_count_;
     fleet_arn = fleet_arn_;
     fleet_id = fleet_id_;
   }
    : fleet_utilization)

let make_describe_fleet_utilization_output
    ?next_token:(next_token_ : non_zero_and_max_string option)
    ?fleet_utilization:(fleet_utilization_ : fleet_utilization_list option) () =
  ({ next_token = next_token_; fleet_utilization = fleet_utilization_ }
    : describe_fleet_utilization_output)

let make_describe_fleet_utilization_input ?next_token:(next_token_ : non_zero_and_max_string option)
    ?limit:(limit_ : positive_integer option) ?fleet_ids:(fleet_ids_ : fleet_id_or_arn_list option)
    () =
  ({ next_token = next_token_; limit = limit_; fleet_ids = fleet_ids_ }
    : describe_fleet_utilization_input)

let make_describe_fleet_port_settings_output ?location:(location_ : location_string_model option)
    ?update_status:(update_status_ : location_update_status option)
    ?inbound_permissions:(inbound_permissions_ : ip_permissions_list option)
    ?fleet_arn:(fleet_arn_ : fleet_arn option) ?fleet_id:(fleet_id_ : fleet_id option) () =
  ({
     location = location_;
     update_status = update_status_;
     inbound_permissions = inbound_permissions_;
     fleet_arn = fleet_arn_;
     fleet_id = fleet_id_;
   }
    : describe_fleet_port_settings_output)

let make_describe_fleet_port_settings_input ?location:(location_ : location_string_model option)
    ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({ location = location_; fleet_id = fleet_id_ } : describe_fleet_port_settings_input)

let make_describe_fleet_location_utilization_output
    ?fleet_utilization:(fleet_utilization_ : fleet_utilization option) () =
  ({ fleet_utilization = fleet_utilization_ } : describe_fleet_location_utilization_output)

let make_describe_fleet_location_utilization_input ~location:(location_ : location_string_model)
    ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({ location = location_; fleet_id = fleet_id_ } : describe_fleet_location_utilization_input)

let make_ec2_instance_counts ?terminatin_g:(terminatin_g_ : whole_number option)
    ?idl_e:(idl_e_ : whole_number option) ?activ_e:(activ_e_ : whole_number option)
    ?pendin_g:(pendin_g_ : whole_number option) ?maximu_m:(maximu_m_ : whole_number option)
    ?minimu_m:(minimu_m_ : whole_number option) ?desire_d:(desire_d_ : whole_number option) () =
  ({
     terminatin_g = terminatin_g_;
     idl_e = idl_e_;
     activ_e = activ_e_;
     pendin_g = pendin_g_;
     maximu_m = maximu_m_;
     minimu_m = minimu_m_;
     desire_d = desire_d_;
   }
    : ec2_instance_counts)

let make_fleet_capacity
    ?managed_capacity_configuration:
      (managed_capacity_configuration_ : managed_capacity_configuration option)
    ?game_server_container_group_counts:
      (game_server_container_group_counts_ : game_server_container_group_counts option)
    ?location:(location_ : location_string_model option)
    ?instance_counts:(instance_counts_ : ec2_instance_counts option)
    ?instance_type:(instance_type_ : ec2_instance_type option)
    ?fleet_arn:(fleet_arn_ : fleet_arn option) ?fleet_id:(fleet_id_ : fleet_id option) () =
  ({
     managed_capacity_configuration = managed_capacity_configuration_;
     game_server_container_group_counts = game_server_container_group_counts_;
     location = location_;
     instance_counts = instance_counts_;
     instance_type = instance_type_;
     fleet_arn = fleet_arn_;
     fleet_id = fleet_id_;
   }
    : fleet_capacity)

let make_describe_fleet_location_capacity_output
    ?fleet_capacity:(fleet_capacity_ : fleet_capacity option) () =
  ({ fleet_capacity = fleet_capacity_ } : describe_fleet_location_capacity_output)

let make_describe_fleet_location_capacity_input ~location:(location_ : location_string_model)
    ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({ location = location_; fleet_id = fleet_id_ } : describe_fleet_location_capacity_input)

let make_describe_fleet_location_attributes_output
    ?next_token:(next_token_ : non_zero_and_max_string option)
    ?location_attributes:(location_attributes_ : location_attributes_list option)
    ?fleet_arn:(fleet_arn_ : fleet_arn option) ?fleet_id:(fleet_id_ : fleet_id_or_arn option) () =
  ({
     next_token = next_token_;
     location_attributes = location_attributes_;
     fleet_arn = fleet_arn_;
     fleet_id = fleet_id_;
   }
    : describe_fleet_location_attributes_output)

let make_describe_fleet_location_attributes_input
    ?next_token:(next_token_ : non_zero_and_max_string option)
    ?limit:(limit_ : positive_integer option) ?locations:(locations_ : location_list option)
    ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({ next_token = next_token_; limit = limit_; locations = locations_; fleet_id = fleet_id_ }
    : describe_fleet_location_attributes_input)

let make_event ?count:(count_ : event_count option)
    ?pre_signed_log_url:(pre_signed_log_url_ : non_zero_and_max_string option)
    ?event_time:(event_time_ : timestamp option) ?message:(message_ : non_empty_string option)
    ?event_code:(event_code_ : event_code option)
    ?resource_id:(resource_id_ : non_zero_and_max_string option)
    ?event_id:(event_id_ : non_zero_and_max_string option) () =
  ({
     count = count_;
     pre_signed_log_url = pre_signed_log_url_;
     event_time = event_time_;
     message = message_;
     event_code = event_code_;
     resource_id = resource_id_;
     event_id = event_id_;
   }
    : event)

let make_describe_fleet_events_output ?next_token:(next_token_ : non_zero_and_max_string option)
    ?events:(events_ : event_list option) () =
  ({ next_token = next_token_; events = events_ } : describe_fleet_events_output)

let make_describe_fleet_events_input ?next_token:(next_token_ : non_zero_and_max_string option)
    ?limit:(limit_ : positive_integer option) ?end_time:(end_time_ : timestamp option)
    ?start_time:(start_time_ : timestamp option) ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({
     next_token = next_token_;
     limit = limit_;
     end_time = end_time_;
     start_time = start_time_;
     fleet_id = fleet_id_;
   }
    : describe_fleet_events_input)

let make_describe_fleet_deployment_output
    ?locational_deployments:(locational_deployments_ : locational_deployments option)
    ?fleet_deployment:(fleet_deployment_ : fleet_deployment option) () =
  ({ locational_deployments = locational_deployments_; fleet_deployment = fleet_deployment_ }
    : describe_fleet_deployment_output)

let make_describe_fleet_deployment_input ?deployment_id:(deployment_id_ : deployment_id option)
    ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({ deployment_id = deployment_id_; fleet_id = fleet_id_ } : describe_fleet_deployment_input)

let make_describe_fleet_capacity_output ?next_token:(next_token_ : non_zero_and_max_string option)
    ?fleet_capacity:(fleet_capacity_ : fleet_capacity_list option) () =
  ({ next_token = next_token_; fleet_capacity = fleet_capacity_ } : describe_fleet_capacity_output)

let make_describe_fleet_capacity_input ?next_token:(next_token_ : non_zero_and_max_string option)
    ?limit:(limit_ : positive_integer option) ?fleet_ids:(fleet_ids_ : fleet_id_or_arn_list option)
    () =
  ({ next_token = next_token_; limit = limit_; fleet_ids = fleet_ids_ }
    : describe_fleet_capacity_input)

let make_certificate_configuration ~certificate_type:(certificate_type_ : certificate_type) () =
  ({ certificate_type = certificate_type_ } : certificate_configuration)

let make_fleet_attributes
    ?player_gateway_configuration:
      (player_gateway_configuration_ : player_gateway_configuration option)
    ?player_gateway_mode:(player_gateway_mode_ : player_gateway_mode option)
    ?instance_role_credentials_provider:
      (instance_role_credentials_provider_ : instance_role_credentials_provider option)
    ?anywhere_configuration:(anywhere_configuration_ : anywhere_configuration option)
    ?compute_type:(compute_type_ : compute_type option)
    ?certificate_configuration:(certificate_configuration_ : certificate_configuration option)
    ?instance_role_arn:(instance_role_arn_ : non_empty_string option)
    ?stopped_actions:(stopped_actions_ : fleet_action_list option)
    ?metric_groups:(metric_groups_ : metric_group_list option)
    ?resource_creation_limit_policy:
      (resource_creation_limit_policy_ : resource_creation_limit_policy option)
    ?operating_system:(operating_system_ : operating_system option)
    ?new_game_session_protection_policy:
      (new_game_session_protection_policy_ : protection_policy option)
    ?log_paths:(log_paths_ : string_list option)
    ?server_launch_parameters:(server_launch_parameters_ : launch_parameters_string_model option)
    ?server_launch_path:(server_launch_path_ : launch_path_string_model option)
    ?script_arn:(script_arn_ : script_arn option) ?script_id:(script_id_ : script_id option)
    ?build_arn:(build_arn_ : build_arn option) ?build_id:(build_id_ : build_id option)
    ?status:(status_ : fleet_status option) ?termination_time:(termination_time_ : timestamp option)
    ?creation_time:(creation_time_ : timestamp option)
    ?name:(name_ : non_zero_and_max_string option)
    ?description:(description_ : non_zero_and_max_string option)
    ?instance_type:(instance_type_ : ec2_instance_type option)
    ?fleet_type:(fleet_type_ : fleet_type option) ?fleet_arn:(fleet_arn_ : fleet_arn option)
    ?fleet_id:(fleet_id_ : fleet_id option) () =
  ({
     player_gateway_configuration = player_gateway_configuration_;
     player_gateway_mode = player_gateway_mode_;
     instance_role_credentials_provider = instance_role_credentials_provider_;
     anywhere_configuration = anywhere_configuration_;
     compute_type = compute_type_;
     certificate_configuration = certificate_configuration_;
     instance_role_arn = instance_role_arn_;
     stopped_actions = stopped_actions_;
     metric_groups = metric_groups_;
     resource_creation_limit_policy = resource_creation_limit_policy_;
     operating_system = operating_system_;
     new_game_session_protection_policy = new_game_session_protection_policy_;
     log_paths = log_paths_;
     server_launch_parameters = server_launch_parameters_;
     server_launch_path = server_launch_path_;
     script_arn = script_arn_;
     script_id = script_id_;
     build_arn = build_arn_;
     build_id = build_id_;
     status = status_;
     termination_time = termination_time_;
     creation_time = creation_time_;
     name = name_;
     description = description_;
     instance_type = instance_type_;
     fleet_type = fleet_type_;
     fleet_arn = fleet_arn_;
     fleet_id = fleet_id_;
   }
    : fleet_attributes)

let make_describe_fleet_attributes_output ?next_token:(next_token_ : non_zero_and_max_string option)
    ?fleet_attributes:(fleet_attributes_ : fleet_attributes_list option) () =
  ({ next_token = next_token_; fleet_attributes = fleet_attributes_ }
    : describe_fleet_attributes_output)

let make_describe_fleet_attributes_input ?next_token:(next_token_ : non_zero_and_max_string option)
    ?limit:(limit_ : positive_integer option) ?fleet_ids:(fleet_ids_ : fleet_id_or_arn_list option)
    () =
  ({ next_token = next_token_; limit = limit_; fleet_ids = fleet_ids_ }
    : describe_fleet_attributes_input)

let make_ec2_instance_limit ?location:(location_ : location_string_model option)
    ?instance_limit:(instance_limit_ : whole_number option)
    ?current_instances:(current_instances_ : whole_number option)
    ?ec2_instance_type:(ec2_instance_type_ : ec2_instance_type option) () =
  ({
     location = location_;
     instance_limit = instance_limit_;
     current_instances = current_instances_;
     ec2_instance_type = ec2_instance_type_;
   }
    : ec2_instance_limit)

let make_describe_ec2_instance_limits_output
    ?ec2_instance_limits:(ec2_instance_limits_ : ec2_instance_limit_list option) () =
  ({ ec2_instance_limits = ec2_instance_limits_ } : describe_ec2_instance_limits_output)

let make_describe_ec2_instance_limits_input ?location:(location_ : location_string_model option)
    ?ec2_instance_type:(ec2_instance_type_ : ec2_instance_type option) () =
  ({ location = location_; ec2_instance_type = ec2_instance_type_ }
    : describe_ec2_instance_limits_input)

let make_container_port_mapping ?protocol:(protocol_ : ip_protocol option)
    ?connection_port:(connection_port_ : port_number option)
    ?container_port:(container_port_ : port_number option) () =
  ({ protocol = protocol_; connection_port = connection_port_; container_port = container_port_ }
    : container_port_mapping)

let make_container_group_port_mapping
    ?container_port_mappings:(container_port_mappings_ : container_port_mapping_list option)
    ?container_runtime_id:(container_runtime_id_ : non_empty_string option)
    ?container_name:(container_name_ : non_zero_and128_max_ascii_string option) () =
  ({
     container_port_mappings = container_port_mappings_;
     container_runtime_id = container_runtime_id_;
     container_name = container_name_;
   }
    : container_group_port_mapping)

let make_describe_container_group_port_mappings_output
    ?container_group_port_mappings:
      (container_group_port_mappings_ : container_group_port_mapping_list option)
    ?instance_id:(instance_id_ : instance_id option)
    ?compute_name:(compute_name_ : compute_name option)
    ?container_group_type:(container_group_type_ : container_group_type option)
    ?container_group_definition_arn:
      (container_group_definition_arn_ : container_group_definition_arn option)
    ?location:(location_ : location_string_model option) ?fleet_arn:(fleet_arn_ : fleet_arn option)
    ?fleet_id:(fleet_id_ : fleet_id option) () =
  ({
     container_group_port_mappings = container_group_port_mappings_;
     instance_id = instance_id_;
     compute_name = compute_name_;
     container_group_type = container_group_type_;
     container_group_definition_arn = container_group_definition_arn_;
     location = location_;
     fleet_arn = fleet_arn_;
     fleet_id = fleet_id_;
   }
    : describe_container_group_port_mappings_output)

let make_describe_container_group_port_mappings_input
    ?container_name:(container_name_ : non_zero_and128_max_ascii_string option)
    ?instance_id:(instance_id_ : instance_id option)
    ?compute_name:(compute_name_ : compute_name_or_arn option)
    ~container_group_type:(container_group_type_ : container_group_type)
    ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({
     container_name = container_name_;
     instance_id = instance_id_;
     compute_name = compute_name_;
     container_group_type = container_group_type_;
     fleet_id = fleet_id_;
   }
    : describe_container_group_port_mappings_input)

let make_describe_container_group_definition_output
    ?container_group_definition:(container_group_definition_ : container_group_definition option) ()
    =
  ({ container_group_definition = container_group_definition_ }
    : describe_container_group_definition_output)

let make_describe_container_group_definition_input
    ?version_number:(version_number_ : positive_integer option)
    ~name:(name_ : container_group_definition_name_or_arn) () =
  ({ version_number = version_number_; name = name_ } : describe_container_group_definition_input)

let make_describe_container_fleet_output
    ?container_fleet:(container_fleet_ : container_fleet option) () =
  ({ container_fleet = container_fleet_ } : describe_container_fleet_output)

let make_describe_container_fleet_input ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({ fleet_id = fleet_id_ } : describe_container_fleet_input)

let make_describe_compute_output ?compute:(compute_ : compute option) () =
  ({ compute = compute_ } : describe_compute_output)

let make_describe_compute_input ~compute_name:(compute_name_ : compute_name_or_arn)
    ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({ compute_name = compute_name_; fleet_id = fleet_id_ } : describe_compute_input)

let make_describe_build_output ?build:(build_ : build option) () =
  ({ build = build_ } : describe_build_output)

let make_describe_build_input ~build_id:(build_id_ : build_id_or_arn) () =
  ({ build_id = build_id_ } : describe_build_input)

let make_describe_alias_output ?alias:(alias_ : alias option) () =
  ({ alias = alias_ } : describe_alias_output)

let make_describe_alias_input ~alias_id:(alias_id_ : alias_id_or_arn) () =
  ({ alias_id = alias_id_ } : describe_alias_input)

let make_deregister_game_server_input ~game_server_id:(game_server_id_ : game_server_id)
    ~game_server_group_name:(game_server_group_name_ : game_server_group_name_or_arn) () =
  ({ game_server_id = game_server_id_; game_server_group_name = game_server_group_name_ }
    : deregister_game_server_input)

let make_deregister_compute_output () = (() : unit)

let make_deregister_compute_input ~compute_name:(compute_name_ : compute_name_or_arn)
    ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({ compute_name = compute_name_; fleet_id = fleet_id_ } : deregister_compute_input)

let make_delete_vpc_peering_connection_output () = (() : unit)

let make_delete_vpc_peering_connection_input
    ~vpc_peering_connection_id:(vpc_peering_connection_id_ : non_zero_and_max_string)
    ~fleet_id:(fleet_id_ : fleet_id) () =
  ({ vpc_peering_connection_id = vpc_peering_connection_id_; fleet_id = fleet_id_ }
    : delete_vpc_peering_connection_input)

let make_delete_vpc_peering_authorization_output () = (() : unit)

let make_delete_vpc_peering_authorization_input
    ~peer_vpc_id:(peer_vpc_id_ : non_zero_and_max_string)
    ~game_lift_aws_account_id:(game_lift_aws_account_id_ : non_zero_and_max_string) () =
  ({ peer_vpc_id = peer_vpc_id_; game_lift_aws_account_id = game_lift_aws_account_id_ }
    : delete_vpc_peering_authorization_input)

let make_delete_script_input ~script_id:(script_id_ : script_id_or_arn) () =
  ({ script_id = script_id_ } : delete_script_input)

let make_delete_scaling_policy_input ~fleet_id:(fleet_id_ : fleet_id_or_arn)
    ~name:(name_ : non_zero_and_max_string) () =
  ({ fleet_id = fleet_id_; name = name_ } : delete_scaling_policy_input)

let make_delete_matchmaking_rule_set_output () = (() : unit)

let make_delete_matchmaking_rule_set_input ~name:(name_ : matchmaking_rule_set_name) () =
  ({ name = name_ } : delete_matchmaking_rule_set_input)

let make_delete_matchmaking_configuration_output () = (() : unit)

let make_delete_matchmaking_configuration_input ~name:(name_ : matchmaking_configuration_name) () =
  ({ name = name_ } : delete_matchmaking_configuration_input)

let make_delete_location_output () = (() : unit)

let make_delete_location_input ~location_name:(location_name_ : custom_location_name_or_arn_model)
    () =
  ({ location_name = location_name_ } : delete_location_input)

let make_delete_game_session_queue_output () = (() : unit)

let make_delete_game_session_queue_input ~name:(name_ : game_session_queue_name_or_arn) () =
  ({ name = name_ } : delete_game_session_queue_input)

let make_delete_game_server_group_output
    ?game_server_group:(game_server_group_ : game_server_group option) () =
  ({ game_server_group = game_server_group_ } : delete_game_server_group_output)

let make_delete_game_server_group_input
    ?delete_option:(delete_option_ : game_server_group_delete_option option)
    ~game_server_group_name:(game_server_group_name_ : game_server_group_name_or_arn) () =
  ({ delete_option = delete_option_; game_server_group_name = game_server_group_name_ }
    : delete_game_server_group_input)

let make_delete_fleet_locations_output
    ?location_states:(location_states_ : location_state_list option)
    ?fleet_arn:(fleet_arn_ : fleet_arn option) ?fleet_id:(fleet_id_ : fleet_id_or_arn option) () =
  ({ location_states = location_states_; fleet_arn = fleet_arn_; fleet_id = fleet_id_ }
    : delete_fleet_locations_output)

let make_delete_fleet_locations_input ~locations:(locations_ : location_list)
    ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({ locations = locations_; fleet_id = fleet_id_ } : delete_fleet_locations_input)

let make_delete_fleet_input ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({ fleet_id = fleet_id_ } : delete_fleet_input)

let make_delete_container_group_definition_output () = (() : unit)

let make_delete_container_group_definition_input
    ?version_count_to_retain:(version_count_to_retain_ : whole_number option)
    ?version_number:(version_number_ : positive_integer option)
    ~name:(name_ : container_group_definition_name_or_arn) () =
  ({
     version_count_to_retain = version_count_to_retain_;
     version_number = version_number_;
     name = name_;
   }
    : delete_container_group_definition_input)

let make_delete_container_fleet_output () = (() : unit)

let make_delete_container_fleet_input ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({ fleet_id = fleet_id_ } : delete_container_fleet_input)

let make_delete_build_input ~build_id:(build_id_ : build_id_or_arn) () =
  ({ build_id = build_id_ } : delete_build_input)

let make_delete_alias_input ~alias_id:(alias_id_ : alias_id_or_arn) () =
  ({ alias_id = alias_id_ } : delete_alias_input)

let make_create_vpc_peering_connection_output () = (() : unit)

let make_create_vpc_peering_connection_input ~peer_vpc_id:(peer_vpc_id_ : non_zero_and_max_string)
    ~peer_vpc_aws_account_id:(peer_vpc_aws_account_id_ : non_zero_and_max_string)
    ~fleet_id:(fleet_id_ : fleet_id) () =
  ({
     peer_vpc_id = peer_vpc_id_;
     peer_vpc_aws_account_id = peer_vpc_aws_account_id_;
     fleet_id = fleet_id_;
   }
    : create_vpc_peering_connection_input)

let make_create_vpc_peering_authorization_output
    ?vpc_peering_authorization:(vpc_peering_authorization_ : vpc_peering_authorization option) () =
  ({ vpc_peering_authorization = vpc_peering_authorization_ }
    : create_vpc_peering_authorization_output)

let make_create_vpc_peering_authorization_input
    ~peer_vpc_id:(peer_vpc_id_ : non_zero_and_max_string)
    ~game_lift_aws_account_id:(game_lift_aws_account_id_ : non_zero_and_max_string) () =
  ({ peer_vpc_id = peer_vpc_id_; game_lift_aws_account_id = game_lift_aws_account_id_ }
    : create_vpc_peering_authorization_input)

let make_create_script_output ?script:(script_ : script option) () =
  ({ script = script_ } : create_script_output)

let make_create_script_input ?node_js_version:(node_js_version_ : node_js_version option)
    ?tags:(tags_ : tag_list option) ?zip_file:(zip_file_ : zip_blob option)
    ?storage_location:(storage_location_ : s3_location option)
    ?version:(version_ : non_zero_and_max_string option)
    ?name:(name_ : non_zero_and_max_string option) () =
  ({
     node_js_version = node_js_version_;
     tags = tags_;
     zip_file = zip_file_;
     storage_location = storage_location_;
     version = version_;
     name = name_;
   }
    : create_script_input)

let make_create_player_sessions_output
    ?player_sessions:(player_sessions_ : player_session_list option) () =
  ({ player_sessions = player_sessions_ } : create_player_sessions_output)

let make_create_player_sessions_input ?player_data_map:(player_data_map_ : player_data_map option)
    ~player_ids:(player_ids_ : player_id_list)
    ~game_session_id:(game_session_id_ : arn_string_model) () =
  ({
     player_data_map = player_data_map_;
     player_ids = player_ids_;
     game_session_id = game_session_id_;
   }
    : create_player_sessions_input)

let make_create_player_session_output ?player_session:(player_session_ : player_session option) () =
  ({ player_session = player_session_ } : create_player_session_output)

let make_create_player_session_input ?player_data:(player_data_ : player_data option)
    ~player_id:(player_id_ : player_id) ~game_session_id:(game_session_id_ : arn_string_model) () =
  ({ player_data = player_data_; player_id = player_id_; game_session_id = game_session_id_ }
    : create_player_session_input)

let make_create_matchmaking_rule_set_output ~rule_set:(rule_set_ : matchmaking_rule_set) () =
  ({ rule_set = rule_set_ } : create_matchmaking_rule_set_output)

let make_create_matchmaking_rule_set_input ?tags:(tags_ : tag_list option)
    ~rule_set_body:(rule_set_body_ : rule_set_body) ~name:(name_ : matchmaking_id_string_model) () =
  ({ tags = tags_; rule_set_body = rule_set_body_; name = name_ }
    : create_matchmaking_rule_set_input)

let make_create_matchmaking_configuration_output
    ?configuration:(configuration_ : matchmaking_configuration option) () =
  ({ configuration = configuration_ } : create_matchmaking_configuration_output)

let make_create_matchmaking_configuration_input ?tags:(tags_ : tag_list option)
    ?flex_match_mode:(flex_match_mode_ : flex_match_mode option)
    ?backfill_mode:(backfill_mode_ : backfill_mode option)
    ?game_session_data:(game_session_data_ : game_session_data option)
    ?game_properties:(game_properties_ : game_property_list option)
    ?custom_event_data:(custom_event_data_ : custom_event_data option)
    ?additional_player_count:(additional_player_count_ : whole_number option)
    ?notification_target:(notification_target_ : sns_arn_string_model option)
    ?acceptance_timeout_seconds:
      (acceptance_timeout_seconds_ : matchmaking_acceptance_timeout_integer option)
    ?game_session_queue_arns:(game_session_queue_arns_ : queue_arns_list option)
    ?description:(description_ : non_zero_and_max_string option)
    ~rule_set_name:(rule_set_name_ : matchmaking_rule_set_name)
    ~acceptance_required:(acceptance_required_ : boolean_model)
    ~request_timeout_seconds:(request_timeout_seconds_ : matchmaking_request_timeout_integer)
    ~name:(name_ : matchmaking_id_string_model) () =
  ({
     tags = tags_;
     flex_match_mode = flex_match_mode_;
     backfill_mode = backfill_mode_;
     game_session_data = game_session_data_;
     game_properties = game_properties_;
     custom_event_data = custom_event_data_;
     additional_player_count = additional_player_count_;
     notification_target = notification_target_;
     rule_set_name = rule_set_name_;
     acceptance_required = acceptance_required_;
     acceptance_timeout_seconds = acceptance_timeout_seconds_;
     request_timeout_seconds = request_timeout_seconds_;
     game_session_queue_arns = game_session_queue_arns_;
     description = description_;
     name = name_;
   }
    : create_matchmaking_configuration_input)

let make_create_location_output ?location:(location_ : location_model option) () =
  ({ location = location_ } : create_location_output)

let make_create_location_input ?tags:(tags_ : tag_list option)
    ~location_name:(location_name_ : custom_input_location_string_model) () =
  ({ tags = tags_; location_name = location_name_ } : create_location_input)

let make_create_game_session_queue_output
    ?game_session_queue:(game_session_queue_ : game_session_queue option) () =
  ({ game_session_queue = game_session_queue_ } : create_game_session_queue_output)

let make_create_game_session_queue_input ?tags:(tags_ : tag_list option)
    ?notification_target:(notification_target_ : queue_sns_arn_string_model option)
    ?custom_event_data:(custom_event_data_ : queue_custom_event_data option)
    ?priority_configuration:(priority_configuration_ : priority_configuration option)
    ?filter_configuration:(filter_configuration_ : filter_configuration option)
    ?destinations:(destinations_ : game_session_queue_destination_list option)
    ?player_latency_policies:(player_latency_policies_ : player_latency_policy_list option)
    ?timeout_in_seconds:(timeout_in_seconds_ : whole_number option)
    ~name:(name_ : game_session_queue_name) () =
  ({
     tags = tags_;
     notification_target = notification_target_;
     custom_event_data = custom_event_data_;
     priority_configuration = priority_configuration_;
     filter_configuration = filter_configuration_;
     destinations = destinations_;
     player_latency_policies = player_latency_policies_;
     timeout_in_seconds = timeout_in_seconds_;
     name = name_;
   }
    : create_game_session_queue_input)

let make_create_game_session_output ?game_session:(game_session_ : game_session option) () =
  ({ game_session = game_session_ } : create_game_session_output)

let make_create_game_session_input ?location:(location_ : location_string_model option)
    ?game_session_data:(game_session_data_ : large_game_session_data option)
    ?idempotency_token:(idempotency_token_ : id_string_model option)
    ?game_session_id:(game_session_id_ : id_string_model option)
    ?creator_id:(creator_id_ : non_zero_and_max_string option)
    ?game_properties:(game_properties_ : game_property_list option)
    ?name:(name_ : non_zero_and_max_string option) ?alias_id:(alias_id_ : alias_id_or_arn option)
    ?fleet_id:(fleet_id_ : fleet_id_or_arn option)
    ~maximum_player_session_count:(maximum_player_session_count_ : whole_number) () =
  ({
     location = location_;
     game_session_data = game_session_data_;
     idempotency_token = idempotency_token_;
     game_session_id = game_session_id_;
     creator_id = creator_id_;
     game_properties = game_properties_;
     name = name_;
     maximum_player_session_count = maximum_player_session_count_;
     alias_id = alias_id_;
     fleet_id = fleet_id_;
   }
    : create_game_session_input)

let make_create_game_server_group_output
    ?game_server_group:(game_server_group_ : game_server_group option) () =
  ({ game_server_group = game_server_group_ } : create_game_server_group_output)

let make_create_game_server_group_input ?tags:(tags_ : tag_list option)
    ?vpc_subnets:(vpc_subnets_ : vpc_subnets option)
    ?game_server_protection_policy:
      (game_server_protection_policy_ : game_server_protection_policy option)
    ?balancing_strategy:(balancing_strategy_ : balancing_strategy option)
    ?auto_scaling_policy:(auto_scaling_policy_ : game_server_group_auto_scaling_policy option)
    ~instance_definitions:(instance_definitions_ : instance_definitions)
    ~launch_template:(launch_template_ : launch_template_specification)
    ~max_size:(max_size_ : positive_integer) ~min_size:(min_size_ : whole_number)
    ~role_arn:(role_arn_ : iam_role_arn)
    ~game_server_group_name:(game_server_group_name_ : game_server_group_name) () =
  ({
     tags = tags_;
     vpc_subnets = vpc_subnets_;
     game_server_protection_policy = game_server_protection_policy_;
     balancing_strategy = balancing_strategy_;
     auto_scaling_policy = auto_scaling_policy_;
     instance_definitions = instance_definitions_;
     launch_template = launch_template_;
     max_size = max_size_;
     min_size = min_size_;
     role_arn = role_arn_;
     game_server_group_name = game_server_group_name_;
   }
    : create_game_server_group_input)

let make_create_fleet_locations_output
    ?location_states:(location_states_ : location_state_list option)
    ?fleet_arn:(fleet_arn_ : fleet_arn option) ?fleet_id:(fleet_id_ : fleet_id_or_arn option) () =
  ({ location_states = location_states_; fleet_arn = fleet_arn_; fleet_id = fleet_id_ }
    : create_fleet_locations_output)

let make_create_fleet_locations_input ~locations:(locations_ : location_configuration_list)
    ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({ locations = locations_; fleet_id = fleet_id_ } : create_fleet_locations_input)

let make_create_fleet_output ?location_states:(location_states_ : location_state_list option)
    ?fleet_attributes:(fleet_attributes_ : fleet_attributes option) () =
  ({ location_states = location_states_; fleet_attributes = fleet_attributes_ }
    : create_fleet_output)

let make_create_fleet_input
    ?player_gateway_configuration:
      (player_gateway_configuration_ : player_gateway_configuration option)
    ?player_gateway_mode:(player_gateway_mode_ : player_gateway_mode option)
    ?instance_role_credentials_provider:
      (instance_role_credentials_provider_ : instance_role_credentials_provider option)
    ?anywhere_configuration:(anywhere_configuration_ : anywhere_configuration option)
    ?compute_type:(compute_type_ : compute_type option) ?tags:(tags_ : tag_list option)
    ?locations:(locations_ : location_configuration_list option)
    ?certificate_configuration:(certificate_configuration_ : certificate_configuration option)
    ?instance_role_arn:(instance_role_arn_ : non_empty_string option)
    ?fleet_type:(fleet_type_ : fleet_type option)
    ?peer_vpc_id:(peer_vpc_id_ : non_zero_and_max_string option)
    ?peer_vpc_aws_account_id:(peer_vpc_aws_account_id_ : non_zero_and_max_string option)
    ?metric_groups:(metric_groups_ : metric_group_list option)
    ?resource_creation_limit_policy:
      (resource_creation_limit_policy_ : resource_creation_limit_policy option)
    ?runtime_configuration:(runtime_configuration_ : runtime_configuration option)
    ?new_game_session_protection_policy:
      (new_game_session_protection_policy_ : protection_policy option)
    ?ec2_inbound_permissions:(ec2_inbound_permissions_ : ip_permissions_list option)
    ?ec2_instance_type:(ec2_instance_type_ : ec2_instance_type option)
    ?log_paths:(log_paths_ : string_list option)
    ?server_launch_parameters:(server_launch_parameters_ : launch_parameters_string_model option)
    ?server_launch_path:(server_launch_path_ : launch_path_string_model option)
    ?script_id:(script_id_ : script_id_or_arn option) ?build_id:(build_id_ : build_id_or_arn option)
    ?description:(description_ : non_zero_and_max_string option)
    ~name:(name_ : non_zero_and_max_string) () =
  ({
     player_gateway_configuration = player_gateway_configuration_;
     player_gateway_mode = player_gateway_mode_;
     instance_role_credentials_provider = instance_role_credentials_provider_;
     anywhere_configuration = anywhere_configuration_;
     compute_type = compute_type_;
     tags = tags_;
     locations = locations_;
     certificate_configuration = certificate_configuration_;
     instance_role_arn = instance_role_arn_;
     fleet_type = fleet_type_;
     peer_vpc_id = peer_vpc_id_;
     peer_vpc_aws_account_id = peer_vpc_aws_account_id_;
     metric_groups = metric_groups_;
     resource_creation_limit_policy = resource_creation_limit_policy_;
     runtime_configuration = runtime_configuration_;
     new_game_session_protection_policy = new_game_session_protection_policy_;
     ec2_inbound_permissions = ec2_inbound_permissions_;
     ec2_instance_type = ec2_instance_type_;
     log_paths = log_paths_;
     server_launch_parameters = server_launch_parameters_;
     server_launch_path = server_launch_path_;
     script_id = script_id_;
     build_id = build_id_;
     description = description_;
     name = name_;
   }
    : create_fleet_input)

let make_create_container_group_definition_output
    ?container_group_definition:(container_group_definition_ : container_group_definition option) ()
    =
  ({ container_group_definition = container_group_definition_ }
    : create_container_group_definition_output)

let make_create_container_group_definition_input ?tags:(tags_ : tag_list option)
    ?version_description:(version_description_ : non_zero_and_max_string option)
    ?support_container_definitions:
      (support_container_definitions_ : support_container_definition_input_list option)
    ?game_server_container_definition:
      (game_server_container_definition_ : game_server_container_definition_input option)
    ?container_group_type:(container_group_type_ : container_group_type option)
    ~operating_system:(operating_system_ : container_operating_system)
    ~total_vcpu_limit:(total_vcpu_limit_ : container_total_vcpu_limit)
    ~total_memory_limit_mebibytes:(total_memory_limit_mebibytes_ : container_total_memory_limit)
    ~name:(name_ : container_group_definition_name) () =
  ({
     tags = tags_;
     version_description = version_description_;
     operating_system = operating_system_;
     support_container_definitions = support_container_definitions_;
     game_server_container_definition = game_server_container_definition_;
     total_vcpu_limit = total_vcpu_limit_;
     total_memory_limit_mebibytes = total_memory_limit_mebibytes_;
     container_group_type = container_group_type_;
     name = name_;
   }
    : create_container_group_definition_input)

let make_create_container_fleet_output ?container_fleet:(container_fleet_ : container_fleet option)
    () =
  ({ container_fleet = container_fleet_ } : create_container_fleet_output)

let make_create_container_fleet_input
    ?player_gateway_mode:(player_gateway_mode_ : player_gateway_mode option)
    ?tags:(tags_ : tag_list option)
    ?log_configuration:(log_configuration_ : log_configuration option)
    ?game_session_creation_limit_policy:
      (game_session_creation_limit_policy_ : game_session_creation_limit_policy option)
    ?new_game_session_protection_policy:
      (new_game_session_protection_policy_ : protection_policy option)
    ?metric_groups:(metric_groups_ : metric_group_list option)
    ?locations:(locations_ : location_configuration_list option)
    ?billing_type:(billing_type_ : container_fleet_billing_type option)
    ?instance_type:(instance_type_ : non_zero_and_max_string option)
    ?game_server_container_groups_per_instance:
      (game_server_container_groups_per_instance_ : game_server_container_groups_per_instance option)
    ?instance_inbound_permissions:(instance_inbound_permissions_ : ip_permissions_list option)
    ?instance_connection_port_range:(instance_connection_port_range_ : connection_port_range option)
    ?per_instance_container_group_definition_name:
      (per_instance_container_group_definition_name_ : container_group_definition_name_or_arn option)
    ?game_server_container_group_definition_name:
      (game_server_container_group_definition_name_ : container_group_definition_name_or_arn option)
    ?description:(description_ : non_zero_and_max_string option)
    ~fleet_role_arn:(fleet_role_arn_ : iam_role_arn) () =
  ({
     player_gateway_mode = player_gateway_mode_;
     tags = tags_;
     log_configuration = log_configuration_;
     game_session_creation_limit_policy = game_session_creation_limit_policy_;
     new_game_session_protection_policy = new_game_session_protection_policy_;
     metric_groups = metric_groups_;
     locations = locations_;
     billing_type = billing_type_;
     instance_type = instance_type_;
     game_server_container_groups_per_instance = game_server_container_groups_per_instance_;
     instance_inbound_permissions = instance_inbound_permissions_;
     instance_connection_port_range = instance_connection_port_range_;
     per_instance_container_group_definition_name = per_instance_container_group_definition_name_;
     game_server_container_group_definition_name = game_server_container_group_definition_name_;
     description = description_;
     fleet_role_arn = fleet_role_arn_;
   }
    : create_container_fleet_input)

let make_create_build_output ?storage_location:(storage_location_ : s3_location option)
    ?upload_credentials:(upload_credentials_ : aws_credentials option)
    ?build:(build_ : build option) () =
  ({
     storage_location = storage_location_;
     upload_credentials = upload_credentials_;
     build = build_;
   }
    : create_build_output)

let make_create_build_input ?server_sdk_version:(server_sdk_version_ : server_sdk_version option)
    ?tags:(tags_ : tag_list option) ?operating_system:(operating_system_ : operating_system option)
    ?storage_location:(storage_location_ : s3_location option)
    ?version:(version_ : non_zero_and_max_string option)
    ?name:(name_ : non_zero_and_max_string option) () =
  ({
     server_sdk_version = server_sdk_version_;
     tags = tags_;
     operating_system = operating_system_;
     storage_location = storage_location_;
     version = version_;
     name = name_;
   }
    : create_build_input)

let make_create_alias_output ?alias:(alias_ : alias option) () =
  ({ alias = alias_ } : create_alias_output)

let make_create_alias_input ?tags:(tags_ : tag_list option)
    ?description:(description_ : non_zero_and_max_string option)
    ~routing_strategy:(routing_strategy_ : routing_strategy)
    ~name:(name_ : non_blank_and_length_constraint_string) () =
  ({ tags = tags_; routing_strategy = routing_strategy_; description = description_; name = name_ }
    : create_alias_input)

let make_claim_game_server_output ?game_server:(game_server_ : game_server option) () =
  ({ game_server = game_server_ } : claim_game_server_output)

let make_claim_filter_option
    ?instance_statuses:(instance_statuses_ : filter_instance_statuses option) () =
  ({ instance_statuses = instance_statuses_ } : claim_filter_option)

let make_claim_game_server_input ?filter_option:(filter_option_ : claim_filter_option option)
    ?game_server_data:(game_server_data_ : game_server_data option)
    ?game_server_id:(game_server_id_ : game_server_id option)
    ~game_server_group_name:(game_server_group_name_ : game_server_group_name_or_arn) () =
  ({
     filter_option = filter_option_;
     game_server_data = game_server_data_;
     game_server_id = game_server_id_;
     game_server_group_name = game_server_group_name_;
   }
    : claim_game_server_input)

let make_accept_match_output () = (() : unit)

let make_accept_match_input ~acceptance_type:(acceptance_type_ : acceptance_type)
    ~player_ids:(player_ids_ : player_ids_for_accept_match)
    ~ticket_id:(ticket_id_ : matchmaking_id_string_model) () =
  ({ acceptance_type = acceptance_type_; player_ids = player_ids_; ticket_id = ticket_id_ }
    : accept_match_input)
