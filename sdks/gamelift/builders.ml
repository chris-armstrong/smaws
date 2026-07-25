open Types

let make_accept_match_output () = (() : unit)

let make_accept_match_input ~ticket_id:(ticket_id_ : matchmaking_id_string_model)
    ~player_ids:(player_ids_ : player_ids_for_accept_match)
    ~acceptance_type:(acceptance_type_ : acceptance_type) () =
  ({ ticket_id = ticket_id_; player_ids = player_ids_; acceptance_type = acceptance_type_ }
    : accept_match_input)

let make_routing_strategy ?type_:(type__ : routing_strategy_type option)
    ?fleet_id:(fleet_id_ : fleet_id option) ?message:(message_ : free_text option) () =
  ({ type_ = type__; fleet_id = fleet_id_; message = message_ } : routing_strategy)

let make_alias ?alias_id:(alias_id_ : alias_id option)
    ?name:(name_ : non_blank_and_length_constraint_string option)
    ?alias_arn:(alias_arn_ : alias_arn option) ?description:(description_ : free_text option)
    ?routing_strategy:(routing_strategy_ : routing_strategy option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_updated_time:(last_updated_time_ : timestamp option) () =
  ({
     alias_id = alias_id_;
     name = name_;
     alias_arn = alias_arn_;
     description = description_;
     routing_strategy = routing_strategy_;
     creation_time = creation_time_;
     last_updated_time = last_updated_time_;
   }
    : alias)

let make_anywhere_configuration ~cost:(cost_ : non_negative_limited_length_double) () =
  ({ cost = cost_ } : anywhere_configuration)

let make_attribute_value ?s:(s_ : player_attribute_string option) ?n:(n_ : double_object option)
    ?s_l:(s_l_ : player_attribute_string_list option)
    ?sd_m:(sd_m_ : player_attribute_string_double_map option) () =
  ({ s = s_; n = n_; s_l = s_l_; sd_m = sd_m_ } : attribute_value)

let make_aws_credentials ?access_key_id:(access_key_id_ : non_empty_string option)
    ?secret_access_key:(secret_access_key_ : non_empty_string option)
    ?session_token:(session_token_ : non_empty_string option) () =
  ({
     access_key_id = access_key_id_;
     secret_access_key = secret_access_key_;
     session_token = session_token_;
   }
    : aws_credentials)

let make_build ?build_id:(build_id_ : build_id option) ?build_arn:(build_arn_ : build_arn option)
    ?name:(name_ : free_text option) ?version:(version_ : free_text option)
    ?status:(status_ : build_status option) ?size_on_disk:(size_on_disk_ : whole_number_long option)
    ?operating_system:(operating_system_ : operating_system option)
    ?creation_time:(creation_time_ : timestamp option)
    ?server_sdk_version:(server_sdk_version_ : server_sdk_version option) () =
  ({
     build_id = build_id_;
     build_arn = build_arn_;
     name = name_;
     version = version_;
     status = status_;
     size_on_disk = size_on_disk_;
     operating_system = operating_system_;
     creation_time = creation_time_;
     server_sdk_version = server_sdk_version_;
   }
    : build)

let make_certificate_configuration ~certificate_type:(certificate_type_ : certificate_type) () =
  ({ certificate_type = certificate_type_ } : certificate_configuration)

let make_claim_filter_option
    ?instance_statuses:(instance_statuses_ : filter_instance_statuses option) () =
  ({ instance_statuses = instance_statuses_ } : claim_filter_option)

let make_game_server
    ?game_server_group_name:(game_server_group_name_ : game_server_group_name option)
    ?game_server_group_arn:(game_server_group_arn_ : game_server_group_arn option)
    ?game_server_id:(game_server_id_ : game_server_id option)
    ?instance_id:(instance_id_ : game_server_instance_id option)
    ?connection_info:(connection_info_ : game_server_connection_info option)
    ?game_server_data:(game_server_data_ : game_server_data option)
    ?claim_status:(claim_status_ : game_server_claim_status option)
    ?utilization_status:(utilization_status_ : game_server_utilization_status option)
    ?registration_time:(registration_time_ : timestamp option)
    ?last_claim_time:(last_claim_time_ : timestamp option)
    ?last_health_check_time:(last_health_check_time_ : timestamp option) () =
  ({
     game_server_group_name = game_server_group_name_;
     game_server_group_arn = game_server_group_arn_;
     game_server_id = game_server_id_;
     instance_id = instance_id_;
     connection_info = connection_info_;
     game_server_data = game_server_data_;
     claim_status = claim_status_;
     utilization_status = utilization_status_;
     registration_time = registration_time_;
     last_claim_time = last_claim_time_;
     last_health_check_time = last_health_check_time_;
   }
    : game_server)

let make_claim_game_server_output ?game_server:(game_server_ : game_server option) () =
  ({ game_server = game_server_ } : claim_game_server_output)

let make_claim_game_server_input ?game_server_id:(game_server_id_ : game_server_id option)
    ?game_server_data:(game_server_data_ : game_server_data option)
    ?filter_option:(filter_option_ : claim_filter_option option)
    ~game_server_group_name:(game_server_group_name_ : game_server_group_name_or_arn) () =
  ({
     game_server_group_name = game_server_group_name_;
     game_server_id = game_server_id_;
     game_server_data = game_server_data_;
     filter_option = filter_option_;
   }
    : claim_game_server_input)

let make_container_attribute
    ?container_name:(container_name_ : non_zero_and128_max_ascii_string option)
    ?container_runtime_id:(container_runtime_id_ : non_empty_string option) () =
  ({ container_name = container_name_; container_runtime_id = container_runtime_id_ }
    : container_attribute)

let make_compute ?fleet_id:(fleet_id_ : fleet_id option) ?fleet_arn:(fleet_arn_ : fleet_arn option)
    ?compute_name:(compute_name_ : compute_name option)
    ?compute_arn:(compute_arn_ : compute_arn option) ?ip_address:(ip_address_ : ip_address option)
    ?dns_name:(dns_name_ : dns_name option)
    ?compute_status:(compute_status_ : compute_status option)
    ?location:(location_ : location_string_model option)
    ?creation_time:(creation_time_ : timestamp option)
    ?operating_system:(operating_system_ : operating_system option)
    ?type_:(type__ : ec2_instance_type option)
    ?game_lift_service_sdk_endpoint:
      (game_lift_service_sdk_endpoint_ : game_lift_service_sdk_endpoint_output option)
    ?game_lift_agent_endpoint:(game_lift_agent_endpoint_ : game_lift_agent_endpoint_output option)
    ?instance_id:(instance_id_ : instance_id option)
    ?container_attributes:(container_attributes_ : container_attributes option)
    ?game_server_container_group_definition_arn:
      (game_server_container_group_definition_arn_ : container_group_definition_name_or_arn option)
    () =
  ({
     fleet_id = fleet_id_;
     fleet_arn = fleet_arn_;
     compute_name = compute_name_;
     compute_arn = compute_arn_;
     ip_address = ip_address_;
     dns_name = dns_name_;
     compute_status = compute_status_;
     location = location_;
     creation_time = creation_time_;
     operating_system = operating_system_;
     type_ = type__;
     game_lift_service_sdk_endpoint = game_lift_service_sdk_endpoint_;
     game_lift_agent_endpoint = game_lift_agent_endpoint_;
     instance_id = instance_id_;
     container_attributes = container_attributes_;
     game_server_container_group_definition_arn = game_server_container_group_definition_arn_;
   }
    : compute)

let make_connection_port_range ~from_port:(from_port_ : port_number)
    ~to_port:(to_port_ : port_number) () =
  ({ from_port = from_port_; to_port = to_port_ } : connection_port_range)

let make_container_dependency ~container_name:(container_name_ : non_zero_and128_max_ascii_string)
    ~condition:(condition_ : container_dependency_condition) () =
  ({ container_name = container_name_; condition = condition_ } : container_dependency)

let make_container_environment ~name:(name_ : non_zero_and255_max_string)
    ~value:(value_ : non_zero_and255_max_string) () =
  ({ name = name_; value = value_ } : container_environment)

let make_container_fleet_location_attributes ?location:(location_ : location_string_model option)
    ?status:(status_ : container_fleet_location_status option)
    ?player_gateway_status:(player_gateway_status_ : player_gateway_status option) () =
  ({ location = location_; status = status_; player_gateway_status = player_gateway_status_ }
    : container_fleet_location_attributes)

let make_log_configuration ?log_destination:(log_destination_ : log_destination option)
    ?s3_bucket_name:(s3_bucket_name_ : non_empty_string option)
    ?log_group_arn:(log_group_arn_ : log_group_arn_string_model option) () =
  ({
     log_destination = log_destination_;
     s3_bucket_name = s3_bucket_name_;
     log_group_arn = log_group_arn_;
   }
    : log_configuration)

let make_deployment_details ?latest_deployment_id:(latest_deployment_id_ : deployment_id option) ()
    =
  ({ latest_deployment_id = latest_deployment_id_ } : deployment_details)

let make_game_session_creation_limit_policy
    ?new_game_sessions_per_creator:(new_game_sessions_per_creator_ : whole_number option)
    ?policy_period_in_minutes:(policy_period_in_minutes_ : whole_number option) () =
  ({
     new_game_sessions_per_creator = new_game_sessions_per_creator_;
     policy_period_in_minutes = policy_period_in_minutes_;
   }
    : game_session_creation_limit_policy)

let make_ip_permission ~from_port:(from_port_ : port_number) ~to_port:(to_port_ : port_number)
    ~ip_range:(ip_range_ : ip_range) ~protocol:(protocol_ : ip_protocol) () =
  ({ from_port = from_port_; to_port = to_port_; ip_range = ip_range_; protocol = protocol_ }
    : ip_permission)

let make_container_fleet ?fleet_id:(fleet_id_ : fleet_id option)
    ?fleet_arn:(fleet_arn_ : fleet_arn option)
    ?fleet_role_arn:(fleet_role_arn_ : iam_role_arn option)
    ?game_server_container_group_definition_name:
      (game_server_container_group_definition_name_ : container_group_definition_name option)
    ?game_server_container_group_definition_arn:
      (game_server_container_group_definition_arn_ : container_group_definition_arn option)
    ?per_instance_container_group_definition_name:
      (per_instance_container_group_definition_name_ : container_group_definition_name option)
    ?per_instance_container_group_definition_arn:
      (per_instance_container_group_definition_arn_ : container_group_definition_arn option)
    ?instance_connection_port_range:(instance_connection_port_range_ : connection_port_range option)
    ?instance_inbound_permissions:(instance_inbound_permissions_ : ip_permissions_list option)
    ?game_server_container_groups_per_instance:
      (game_server_container_groups_per_instance_ : game_server_container_groups_per_instance option)
    ?maximum_game_server_container_groups_per_instance:
      (maximum_game_server_container_groups_per_instance_ :
         maximum_game_server_container_groups_per_instance option)
    ?instance_type:(instance_type_ : non_zero_and_max_string option)
    ?billing_type:(billing_type_ : container_fleet_billing_type option)
    ?description:(description_ : non_zero_and_max_string option)
    ?creation_time:(creation_time_ : timestamp option)
    ?metric_groups:(metric_groups_ : metric_group_list option)
    ?new_game_session_protection_policy:
      (new_game_session_protection_policy_ : protection_policy option)
    ?game_session_creation_limit_policy:
      (game_session_creation_limit_policy_ : game_session_creation_limit_policy option)
    ?status:(status_ : container_fleet_status option)
    ?deployment_details:(deployment_details_ : deployment_details option)
    ?log_configuration:(log_configuration_ : log_configuration option)
    ?location_attributes:(location_attributes_ : container_fleet_location_attributes_list option)
    ?player_gateway_mode:(player_gateway_mode_ : player_gateway_mode option) () =
  ({
     fleet_id = fleet_id_;
     fleet_arn = fleet_arn_;
     fleet_role_arn = fleet_role_arn_;
     game_server_container_group_definition_name = game_server_container_group_definition_name_;
     game_server_container_group_definition_arn = game_server_container_group_definition_arn_;
     per_instance_container_group_definition_name = per_instance_container_group_definition_name_;
     per_instance_container_group_definition_arn = per_instance_container_group_definition_arn_;
     instance_connection_port_range = instance_connection_port_range_;
     instance_inbound_permissions = instance_inbound_permissions_;
     game_server_container_groups_per_instance = game_server_container_groups_per_instance_;
     maximum_game_server_container_groups_per_instance =
       maximum_game_server_container_groups_per_instance_;
     instance_type = instance_type_;
     billing_type = billing_type_;
     description = description_;
     creation_time = creation_time_;
     metric_groups = metric_groups_;
     new_game_session_protection_policy = new_game_session_protection_policy_;
     game_session_creation_limit_policy = game_session_creation_limit_policy_;
     status = status_;
     deployment_details = deployment_details_;
     log_configuration = log_configuration_;
     location_attributes = location_attributes_;
     player_gateway_mode = player_gateway_mode_;
   }
    : container_fleet)

let make_linux_capabilities ?include_:(include__ : linux_capability_list option) () =
  ({ include_ = include__ } : linux_capabilities)

let make_container_port_range ~from_port:(from_port_ : port_number)
    ~to_port:(to_port_ : port_number) ~protocol:(protocol_ : ip_protocol) () =
  ({ from_port = from_port_; to_port = to_port_; protocol = protocol_ } : container_port_range)

let make_container_port_configuration
    ~container_port_ranges:(container_port_ranges_ : container_port_range_list) () =
  ({ container_port_ranges = container_port_ranges_ } : container_port_configuration)

let make_container_health_check ?interval:(interval_ : container_health_check_interval option)
    ?retries:(retries_ : container_health_check_retries option)
    ?start_period:(start_period_ : container_health_check_start_period option)
    ?timeout:(timeout_ : container_health_check_timeout option)
    ~command:(command_ : container_command_string_list) () =
  ({
     command = command_;
     interval = interval_;
     retries = retries_;
     start_period = start_period_;
     timeout = timeout_;
   }
    : container_health_check)

let make_container_mount_point ?container_path:(container_path_ : container_path_string option)
    ?access_level:(access_level_ : container_mount_point_access_level option)
    ~instance_path:(instance_path_ : instance_path_string) () =
  ({
     instance_path = instance_path_;
     container_path = container_path_;
     access_level = access_level_;
   }
    : container_mount_point)

let make_support_container_definition
    ?container_name:(container_name_ : non_zero_and128_max_ascii_string option)
    ?depends_on:(depends_on_ : container_dependency_list option)
    ?mount_points:(mount_points_ : container_mount_point_list option)
    ?environment_override:(environment_override_ : container_environment_list option)
    ?essential:(essential_ : boolean_model option)
    ?health_check:(health_check_ : container_health_check option)
    ?image_uri:(image_uri_ : image_uri_string option)
    ?memory_hard_limit_mebibytes:(memory_hard_limit_mebibytes_ : container_memory_limit option)
    ?port_configuration:(port_configuration_ : container_port_configuration option)
    ?resolved_image_digest:(resolved_image_digest_ : sha256 option)
    ?vcpu:(vcpu_ : container_vcpu option)
    ?linux_capabilities:(linux_capabilities_ : linux_capabilities option) () =
  ({
     container_name = container_name_;
     depends_on = depends_on_;
     mount_points = mount_points_;
     environment_override = environment_override_;
     essential = essential_;
     health_check = health_check_;
     image_uri = image_uri_;
     memory_hard_limit_mebibytes = memory_hard_limit_mebibytes_;
     port_configuration = port_configuration_;
     resolved_image_digest = resolved_image_digest_;
     vcpu = vcpu_;
     linux_capabilities = linux_capabilities_;
   }
    : support_container_definition)

let make_game_server_container_definition
    ?container_name:(container_name_ : non_zero_and128_max_ascii_string option)
    ?depends_on:(depends_on_ : container_dependency_list option)
    ?mount_points:(mount_points_ : container_mount_point_list option)
    ?environment_override:(environment_override_ : container_environment_list option)
    ?image_uri:(image_uri_ : image_uri_string option)
    ?port_configuration:(port_configuration_ : container_port_configuration option)
    ?resolved_image_digest:(resolved_image_digest_ : sha256 option)
    ?server_sdk_version:(server_sdk_version_ : server_sdk_version option)
    ?linux_capabilities:(linux_capabilities_ : linux_capabilities option) () =
  ({
     container_name = container_name_;
     depends_on = depends_on_;
     mount_points = mount_points_;
     environment_override = environment_override_;
     image_uri = image_uri_;
     port_configuration = port_configuration_;
     resolved_image_digest = resolved_image_digest_;
     server_sdk_version = server_sdk_version_;
     linux_capabilities = linux_capabilities_;
   }
    : game_server_container_definition)

let make_container_group_definition
    ?container_group_definition_arn:
      (container_group_definition_arn_ : container_group_definition_arn option)
    ?creation_time:(creation_time_ : timestamp option)
    ?operating_system:(operating_system_ : container_operating_system option)
    ?container_group_type:(container_group_type_ : container_group_type option)
    ?total_memory_limit_mebibytes:
      (total_memory_limit_mebibytes_ : container_total_memory_limit option)
    ?total_vcpu_limit:(total_vcpu_limit_ : container_total_vcpu_limit option)
    ?game_server_container_definition:
      (game_server_container_definition_ : game_server_container_definition option)
    ?support_container_definitions:
      (support_container_definitions_ : support_container_definition_list option)
    ?version_number:(version_number_ : positive_integer option)
    ?version_description:(version_description_ : non_zero_and_max_string option)
    ?status:(status_ : container_group_definition_status option)
    ?status_reason:(status_reason_ : non_zero_and_max_string option)
    ~name:(name_ : container_group_definition_name) () =
  ({
     container_group_definition_arn = container_group_definition_arn_;
     creation_time = creation_time_;
     operating_system = operating_system_;
     name = name_;
     container_group_type = container_group_type_;
     total_memory_limit_mebibytes = total_memory_limit_mebibytes_;
     total_vcpu_limit = total_vcpu_limit_;
     game_server_container_definition = game_server_container_definition_;
     support_container_definitions = support_container_definitions_;
     version_number = version_number_;
     version_description = version_description_;
     status = status_;
     status_reason = status_reason_;
   }
    : container_group_definition)

let make_container_port_mapping ?container_port:(container_port_ : port_number option)
    ?connection_port:(connection_port_ : port_number option)
    ?protocol:(protocol_ : ip_protocol option) () =
  ({ container_port = container_port_; connection_port = connection_port_; protocol = protocol_ }
    : container_port_mapping)

let make_container_group_port_mapping
    ?container_name:(container_name_ : non_zero_and128_max_ascii_string option)
    ?container_runtime_id:(container_runtime_id_ : non_empty_string option)
    ?container_port_mappings:(container_port_mappings_ : container_port_mapping_list option) () =
  ({
     container_name = container_name_;
     container_runtime_id = container_runtime_id_;
     container_port_mappings = container_port_mappings_;
   }
    : container_group_port_mapping)

let make_container_identifier
    ?container_name:(container_name_ : non_zero_and128_max_ascii_string option)
    ?container_runtime_id:(container_runtime_id_ : non_empty_string option) () =
  ({ container_name = container_name_; container_runtime_id = container_runtime_id_ }
    : container_identifier)

let make_create_alias_output ?alias:(alias_ : alias option) () =
  ({ alias = alias_ } : create_alias_output)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_create_alias_input ?description:(description_ : non_zero_and_max_string option)
    ?tags:(tags_ : tag_list option) ~name:(name_ : non_blank_and_length_constraint_string)
    ~routing_strategy:(routing_strategy_ : routing_strategy) () =
  ({ name = name_; description = description_; routing_strategy = routing_strategy_; tags = tags_ }
    : create_alias_input)

let make_s3_location ?bucket:(bucket_ : non_empty_string option)
    ?key:(key_ : non_empty_string option) ?role_arn:(role_arn_ : non_empty_string option)
    ?object_version:(object_version_ : non_empty_string option) () =
  ({ bucket = bucket_; key = key_; role_arn = role_arn_; object_version = object_version_ }
    : s3_location)

let make_create_build_output ?build:(build_ : build option)
    ?upload_credentials:(upload_credentials_ : aws_credentials option)
    ?storage_location:(storage_location_ : s3_location option) () =
  ({
     build = build_;
     upload_credentials = upload_credentials_;
     storage_location = storage_location_;
   }
    : create_build_output)

let make_create_build_input ?name:(name_ : non_zero_and_max_string option)
    ?version:(version_ : non_zero_and_max_string option)
    ?storage_location:(storage_location_ : s3_location option)
    ?operating_system:(operating_system_ : operating_system option) ?tags:(tags_ : tag_list option)
    ?server_sdk_version:(server_sdk_version_ : server_sdk_version option) () =
  ({
     name = name_;
     version = version_;
     storage_location = storage_location_;
     operating_system = operating_system_;
     tags = tags_;
     server_sdk_version = server_sdk_version_;
   }
    : create_build_input)

let make_create_container_fleet_output ?container_fleet:(container_fleet_ : container_fleet option)
    () =
  ({ container_fleet = container_fleet_ } : create_container_fleet_output)

let make_location_configuration ~location:(location_ : location_string_model) () =
  ({ location = location_ } : location_configuration)

let make_create_container_fleet_input ?description:(description_ : non_zero_and_max_string option)
    ?game_server_container_group_definition_name:
      (game_server_container_group_definition_name_ : container_group_definition_name_or_arn option)
    ?per_instance_container_group_definition_name:
      (per_instance_container_group_definition_name_ : container_group_definition_name_or_arn option)
    ?instance_connection_port_range:(instance_connection_port_range_ : connection_port_range option)
    ?instance_inbound_permissions:(instance_inbound_permissions_ : ip_permissions_list option)
    ?game_server_container_groups_per_instance:
      (game_server_container_groups_per_instance_ : game_server_container_groups_per_instance option)
    ?instance_type:(instance_type_ : non_zero_and_max_string option)
    ?billing_type:(billing_type_ : container_fleet_billing_type option)
    ?locations:(locations_ : location_configuration_list option)
    ?metric_groups:(metric_groups_ : metric_group_list option)
    ?new_game_session_protection_policy:
      (new_game_session_protection_policy_ : protection_policy option)
    ?game_session_creation_limit_policy:
      (game_session_creation_limit_policy_ : game_session_creation_limit_policy option)
    ?log_configuration:(log_configuration_ : log_configuration option)
    ?tags:(tags_ : tag_list option)
    ?player_gateway_mode:(player_gateway_mode_ : player_gateway_mode option)
    ~fleet_role_arn:(fleet_role_arn_ : iam_role_arn) () =
  ({
     fleet_role_arn = fleet_role_arn_;
     description = description_;
     game_server_container_group_definition_name = game_server_container_group_definition_name_;
     per_instance_container_group_definition_name = per_instance_container_group_definition_name_;
     instance_connection_port_range = instance_connection_port_range_;
     instance_inbound_permissions = instance_inbound_permissions_;
     game_server_container_groups_per_instance = game_server_container_groups_per_instance_;
     instance_type = instance_type_;
     billing_type = billing_type_;
     locations = locations_;
     metric_groups = metric_groups_;
     new_game_session_protection_policy = new_game_session_protection_policy_;
     game_session_creation_limit_policy = game_session_creation_limit_policy_;
     log_configuration = log_configuration_;
     tags = tags_;
     player_gateway_mode = player_gateway_mode_;
   }
    : create_container_fleet_input)

let make_create_container_group_definition_output
    ?container_group_definition:(container_group_definition_ : container_group_definition option) ()
    =
  ({ container_group_definition = container_group_definition_ }
    : create_container_group_definition_output)

let make_support_container_definition_input
    ?depends_on:(depends_on_ : container_dependency_list option)
    ?mount_points:(mount_points_ : container_mount_point_list option)
    ?environment_override:(environment_override_ : container_environment_list option)
    ?essential:(essential_ : boolean_model option)
    ?health_check:(health_check_ : container_health_check option)
    ?memory_hard_limit_mebibytes:(memory_hard_limit_mebibytes_ : container_memory_limit option)
    ?port_configuration:(port_configuration_ : container_port_configuration option)
    ?vcpu:(vcpu_ : container_vcpu option)
    ?linux_capabilities:(linux_capabilities_ : linux_capabilities option)
    ~container_name:(container_name_ : non_zero_and128_max_ascii_string)
    ~image_uri:(image_uri_ : image_uri_string) () =
  ({
     container_name = container_name_;
     depends_on = depends_on_;
     mount_points = mount_points_;
     environment_override = environment_override_;
     essential = essential_;
     health_check = health_check_;
     image_uri = image_uri_;
     memory_hard_limit_mebibytes = memory_hard_limit_mebibytes_;
     port_configuration = port_configuration_;
     vcpu = vcpu_;
     linux_capabilities = linux_capabilities_;
   }
    : support_container_definition_input)

let make_game_server_container_definition_input
    ?depends_on:(depends_on_ : container_dependency_list option)
    ?mount_points:(mount_points_ : container_mount_point_list option)
    ?environment_override:(environment_override_ : container_environment_list option)
    ?linux_capabilities:(linux_capabilities_ : linux_capabilities option)
    ~container_name:(container_name_ : non_zero_and128_max_ascii_string)
    ~image_uri:(image_uri_ : image_uri_string)
    ~port_configuration:(port_configuration_ : container_port_configuration)
    ~server_sdk_version:(server_sdk_version_ : server_sdk_version) () =
  ({
     container_name = container_name_;
     depends_on = depends_on_;
     mount_points = mount_points_;
     environment_override = environment_override_;
     image_uri = image_uri_;
     port_configuration = port_configuration_;
     server_sdk_version = server_sdk_version_;
     linux_capabilities = linux_capabilities_;
   }
    : game_server_container_definition_input)

let make_create_container_group_definition_input
    ?container_group_type:(container_group_type_ : container_group_type option)
    ?game_server_container_definition:
      (game_server_container_definition_ : game_server_container_definition_input option)
    ?support_container_definitions:
      (support_container_definitions_ : support_container_definition_input_list option)
    ?version_description:(version_description_ : non_zero_and_max_string option)
    ?tags:(tags_ : tag_list option) ~name:(name_ : container_group_definition_name)
    ~total_memory_limit_mebibytes:(total_memory_limit_mebibytes_ : container_total_memory_limit)
    ~total_vcpu_limit:(total_vcpu_limit_ : container_total_vcpu_limit)
    ~operating_system:(operating_system_ : container_operating_system) () =
  ({
     name = name_;
     container_group_type = container_group_type_;
     total_memory_limit_mebibytes = total_memory_limit_mebibytes_;
     total_vcpu_limit = total_vcpu_limit_;
     game_server_container_definition = game_server_container_definition_;
     support_container_definitions = support_container_definitions_;
     operating_system = operating_system_;
     version_description = version_description_;
     tags = tags_;
   }
    : create_container_group_definition_input)

let make_location_state ?location:(location_ : location_string_model option)
    ?status:(status_ : fleet_status option)
    ?player_gateway_status:(player_gateway_status_ : player_gateway_status option) () =
  ({ location = location_; status = status_; player_gateway_status = player_gateway_status_ }
    : location_state)

let make_player_gateway_configuration
    ?game_server_ip_protocol_supported:
      (game_server_ip_protocol_supported_ : game_server_ip_protocol_supported option) () =
  ({ game_server_ip_protocol_supported = game_server_ip_protocol_supported_ }
    : player_gateway_configuration)

let make_resource_creation_limit_policy
    ?new_game_sessions_per_creator:(new_game_sessions_per_creator_ : whole_number option)
    ?policy_period_in_minutes:(policy_period_in_minutes_ : whole_number option) () =
  ({
     new_game_sessions_per_creator = new_game_sessions_per_creator_;
     policy_period_in_minutes = policy_period_in_minutes_;
   }
    : resource_creation_limit_policy)

let make_fleet_attributes ?fleet_id:(fleet_id_ : fleet_id option)
    ?fleet_arn:(fleet_arn_ : fleet_arn option) ?fleet_type:(fleet_type_ : fleet_type option)
    ?instance_type:(instance_type_ : ec2_instance_type option)
    ?description:(description_ : non_zero_and_max_string option)
    ?name:(name_ : non_zero_and_max_string option)
    ?creation_time:(creation_time_ : timestamp option)
    ?termination_time:(termination_time_ : timestamp option) ?status:(status_ : fleet_status option)
    ?build_id:(build_id_ : build_id option) ?build_arn:(build_arn_ : build_arn option)
    ?script_id:(script_id_ : script_id option) ?script_arn:(script_arn_ : script_arn option)
    ?server_launch_path:(server_launch_path_ : launch_path_string_model option)
    ?server_launch_parameters:(server_launch_parameters_ : launch_parameters_string_model option)
    ?log_paths:(log_paths_ : string_list option)
    ?new_game_session_protection_policy:
      (new_game_session_protection_policy_ : protection_policy option)
    ?operating_system:(operating_system_ : operating_system option)
    ?resource_creation_limit_policy:
      (resource_creation_limit_policy_ : resource_creation_limit_policy option)
    ?metric_groups:(metric_groups_ : metric_group_list option)
    ?stopped_actions:(stopped_actions_ : fleet_action_list option)
    ?instance_role_arn:(instance_role_arn_ : non_empty_string option)
    ?certificate_configuration:(certificate_configuration_ : certificate_configuration option)
    ?compute_type:(compute_type_ : compute_type option)
    ?anywhere_configuration:(anywhere_configuration_ : anywhere_configuration option)
    ?instance_role_credentials_provider:
      (instance_role_credentials_provider_ : instance_role_credentials_provider option)
    ?player_gateway_mode:(player_gateway_mode_ : player_gateway_mode option)
    ?player_gateway_configuration:
      (player_gateway_configuration_ : player_gateway_configuration option) () =
  ({
     fleet_id = fleet_id_;
     fleet_arn = fleet_arn_;
     fleet_type = fleet_type_;
     instance_type = instance_type_;
     description = description_;
     name = name_;
     creation_time = creation_time_;
     termination_time = termination_time_;
     status = status_;
     build_id = build_id_;
     build_arn = build_arn_;
     script_id = script_id_;
     script_arn = script_arn_;
     server_launch_path = server_launch_path_;
     server_launch_parameters = server_launch_parameters_;
     log_paths = log_paths_;
     new_game_session_protection_policy = new_game_session_protection_policy_;
     operating_system = operating_system_;
     resource_creation_limit_policy = resource_creation_limit_policy_;
     metric_groups = metric_groups_;
     stopped_actions = stopped_actions_;
     instance_role_arn = instance_role_arn_;
     certificate_configuration = certificate_configuration_;
     compute_type = compute_type_;
     anywhere_configuration = anywhere_configuration_;
     instance_role_credentials_provider = instance_role_credentials_provider_;
     player_gateway_mode = player_gateway_mode_;
     player_gateway_configuration = player_gateway_configuration_;
   }
    : fleet_attributes)

let make_create_fleet_output ?fleet_attributes:(fleet_attributes_ : fleet_attributes option)
    ?location_states:(location_states_ : location_state_list option) () =
  ({ fleet_attributes = fleet_attributes_; location_states = location_states_ }
    : create_fleet_output)

let make_server_process ?parameters:(parameters_ : launch_parameters_string_model option)
    ~launch_path:(launch_path_ : launch_path_string_model)
    ~concurrent_executions:(concurrent_executions_ : positive_integer) () =
  ({
     launch_path = launch_path_;
     parameters = parameters_;
     concurrent_executions = concurrent_executions_;
   }
    : server_process)

let make_runtime_configuration ?server_processes:(server_processes_ : server_process_list option)
    ?max_concurrent_game_session_activations:
      (max_concurrent_game_session_activations_ : max_concurrent_game_session_activations option)
    ?game_session_activation_timeout_seconds:
      (game_session_activation_timeout_seconds_ : game_session_activation_timeout_seconds option) ()
    =
  ({
     server_processes = server_processes_;
     max_concurrent_game_session_activations = max_concurrent_game_session_activations_;
     game_session_activation_timeout_seconds = game_session_activation_timeout_seconds_;
   }
    : runtime_configuration)

let make_create_fleet_input ?description:(description_ : non_zero_and_max_string option)
    ?build_id:(build_id_ : build_id_or_arn option) ?script_id:(script_id_ : script_id_or_arn option)
    ?server_launch_path:(server_launch_path_ : launch_path_string_model option)
    ?server_launch_parameters:(server_launch_parameters_ : launch_parameters_string_model option)
    ?log_paths:(log_paths_ : string_list option)
    ?ec2_instance_type:(ec2_instance_type_ : ec2_instance_type option)
    ?ec2_inbound_permissions:(ec2_inbound_permissions_ : ip_permissions_list option)
    ?new_game_session_protection_policy:
      (new_game_session_protection_policy_ : protection_policy option)
    ?runtime_configuration:(runtime_configuration_ : runtime_configuration option)
    ?resource_creation_limit_policy:
      (resource_creation_limit_policy_ : resource_creation_limit_policy option)
    ?metric_groups:(metric_groups_ : metric_group_list option)
    ?peer_vpc_aws_account_id:(peer_vpc_aws_account_id_ : non_zero_and_max_string option)
    ?peer_vpc_id:(peer_vpc_id_ : non_zero_and_max_string option)
    ?fleet_type:(fleet_type_ : fleet_type option)
    ?instance_role_arn:(instance_role_arn_ : non_empty_string option)
    ?certificate_configuration:(certificate_configuration_ : certificate_configuration option)
    ?locations:(locations_ : location_configuration_list option) ?tags:(tags_ : tag_list option)
    ?compute_type:(compute_type_ : compute_type option)
    ?anywhere_configuration:(anywhere_configuration_ : anywhere_configuration option)
    ?instance_role_credentials_provider:
      (instance_role_credentials_provider_ : instance_role_credentials_provider option)
    ?player_gateway_mode:(player_gateway_mode_ : player_gateway_mode option)
    ?player_gateway_configuration:
      (player_gateway_configuration_ : player_gateway_configuration option)
    ~name:(name_ : non_zero_and_max_string) () =
  ({
     name = name_;
     description = description_;
     build_id = build_id_;
     script_id = script_id_;
     server_launch_path = server_launch_path_;
     server_launch_parameters = server_launch_parameters_;
     log_paths = log_paths_;
     ec2_instance_type = ec2_instance_type_;
     ec2_inbound_permissions = ec2_inbound_permissions_;
     new_game_session_protection_policy = new_game_session_protection_policy_;
     runtime_configuration = runtime_configuration_;
     resource_creation_limit_policy = resource_creation_limit_policy_;
     metric_groups = metric_groups_;
     peer_vpc_aws_account_id = peer_vpc_aws_account_id_;
     peer_vpc_id = peer_vpc_id_;
     fleet_type = fleet_type_;
     instance_role_arn = instance_role_arn_;
     certificate_configuration = certificate_configuration_;
     locations = locations_;
     tags = tags_;
     compute_type = compute_type_;
     anywhere_configuration = anywhere_configuration_;
     instance_role_credentials_provider = instance_role_credentials_provider_;
     player_gateway_mode = player_gateway_mode_;
     player_gateway_configuration = player_gateway_configuration_;
   }
    : create_fleet_input)

let make_create_fleet_locations_output ?fleet_id:(fleet_id_ : fleet_id_or_arn option)
    ?fleet_arn:(fleet_arn_ : fleet_arn option)
    ?location_states:(location_states_ : location_state_list option) () =
  ({ fleet_id = fleet_id_; fleet_arn = fleet_arn_; location_states = location_states_ }
    : create_fleet_locations_output)

let make_create_fleet_locations_input ~fleet_id:(fleet_id_ : fleet_id_or_arn)
    ~locations:(locations_ : location_configuration_list) () =
  ({ fleet_id = fleet_id_; locations = locations_ } : create_fleet_locations_input)

let make_instance_definition ?weighted_capacity:(weighted_capacity_ : weighted_capacity option)
    ~instance_type:(instance_type_ : game_server_group_instance_type) () =
  ({ instance_type = instance_type_; weighted_capacity = weighted_capacity_ } : instance_definition)

let make_game_server_group
    ?game_server_group_name:(game_server_group_name_ : game_server_group_name option)
    ?game_server_group_arn:(game_server_group_arn_ : game_server_group_arn option)
    ?role_arn:(role_arn_ : iam_role_arn option)
    ?instance_definitions:(instance_definitions_ : instance_definitions option)
    ?balancing_strategy:(balancing_strategy_ : balancing_strategy option)
    ?game_server_protection_policy:
      (game_server_protection_policy_ : game_server_protection_policy option)
    ?auto_scaling_group_arn:(auto_scaling_group_arn_ : auto_scaling_group_arn option)
    ?status:(status_ : game_server_group_status option)
    ?status_reason:(status_reason_ : non_zero_and_max_string option)
    ?suspended_actions:(suspended_actions_ : game_server_group_actions option)
    ?creation_time:(creation_time_ : timestamp option)
    ?last_updated_time:(last_updated_time_ : timestamp option) () =
  ({
     game_server_group_name = game_server_group_name_;
     game_server_group_arn = game_server_group_arn_;
     role_arn = role_arn_;
     instance_definitions = instance_definitions_;
     balancing_strategy = balancing_strategy_;
     game_server_protection_policy = game_server_protection_policy_;
     auto_scaling_group_arn = auto_scaling_group_arn_;
     status = status_;
     status_reason = status_reason_;
     suspended_actions = suspended_actions_;
     creation_time = creation_time_;
     last_updated_time = last_updated_time_;
   }
    : game_server_group)

let make_create_game_server_group_output
    ?game_server_group:(game_server_group_ : game_server_group option) () =
  ({ game_server_group = game_server_group_ } : create_game_server_group_output)

let make_target_tracking_configuration ~target_value:(target_value_ : non_negative_double) () =
  ({ target_value = target_value_ } : target_tracking_configuration)

let make_game_server_group_auto_scaling_policy
    ?estimated_instance_warmup:(estimated_instance_warmup_ : positive_integer option)
    ~target_tracking_configuration:(target_tracking_configuration_ : target_tracking_configuration)
    () =
  ({
     estimated_instance_warmup = estimated_instance_warmup_;
     target_tracking_configuration = target_tracking_configuration_;
   }
    : game_server_group_auto_scaling_policy)

let make_launch_template_specification
    ?launch_template_id:(launch_template_id_ : launch_template_id option)
    ?launch_template_name:(launch_template_name_ : launch_template_name option)
    ?version:(version_ : launch_template_version option) () =
  ({
     launch_template_id = launch_template_id_;
     launch_template_name = launch_template_name_;
     version = version_;
   }
    : launch_template_specification)

let make_create_game_server_group_input
    ?auto_scaling_policy:(auto_scaling_policy_ : game_server_group_auto_scaling_policy option)
    ?balancing_strategy:(balancing_strategy_ : balancing_strategy option)
    ?game_server_protection_policy:
      (game_server_protection_policy_ : game_server_protection_policy option)
    ?vpc_subnets:(vpc_subnets_ : vpc_subnets option) ?tags:(tags_ : tag_list option)
    ~game_server_group_name:(game_server_group_name_ : game_server_group_name)
    ~role_arn:(role_arn_ : iam_role_arn) ~min_size:(min_size_ : whole_number)
    ~max_size:(max_size_ : positive_integer)
    ~launch_template:(launch_template_ : launch_template_specification)
    ~instance_definitions:(instance_definitions_ : instance_definitions) () =
  ({
     game_server_group_name = game_server_group_name_;
     role_arn = role_arn_;
     min_size = min_size_;
     max_size = max_size_;
     launch_template = launch_template_;
     instance_definitions = instance_definitions_;
     auto_scaling_policy = auto_scaling_policy_;
     balancing_strategy = balancing_strategy_;
     game_server_protection_policy = game_server_protection_policy_;
     vpc_subnets = vpc_subnets_;
     tags = tags_;
   }
    : create_game_server_group_input)

let make_game_property ~key:(key_ : game_property_key) ~value:(value_ : game_property_value) () =
  ({ key = key_; value = value_ } : game_property)

let make_game_session ?game_session_id:(game_session_id_ : non_zero_and_max_string option)
    ?name:(name_ : non_zero_and_max_string option) ?fleet_id:(fleet_id_ : fleet_id option)
    ?fleet_arn:(fleet_arn_ : fleet_arn option) ?creation_time:(creation_time_ : timestamp option)
    ?termination_time:(termination_time_ : timestamp option)
    ?current_player_session_count:(current_player_session_count_ : whole_number option)
    ?maximum_player_session_count:(maximum_player_session_count_ : whole_number option)
    ?status:(status_ : game_session_status option)
    ?status_reason:(status_reason_ : game_session_status_reason option)
    ?game_properties:(game_properties_ : game_property_list option)
    ?ip_address:(ip_address_ : ip_address option) ?dns_name:(dns_name_ : dns_name option)
    ?port:(port_ : port_number option)
    ?player_session_creation_policy:
      (player_session_creation_policy_ : player_session_creation_policy option)
    ?creator_id:(creator_id_ : non_zero_and_max_string option)
    ?game_session_data:(game_session_data_ : large_game_session_data option)
    ?matchmaker_data:(matchmaker_data_ : matchmaker_data option)
    ?location:(location_ : location_string_model option)
    ?compute_name:(compute_name_ : compute_name option)
    ?player_gateway_status:(player_gateway_status_ : player_gateway_status option) () =
  ({
     game_session_id = game_session_id_;
     name = name_;
     fleet_id = fleet_id_;
     fleet_arn = fleet_arn_;
     creation_time = creation_time_;
     termination_time = termination_time_;
     current_player_session_count = current_player_session_count_;
     maximum_player_session_count = maximum_player_session_count_;
     status = status_;
     status_reason = status_reason_;
     game_properties = game_properties_;
     ip_address = ip_address_;
     dns_name = dns_name_;
     port = port_;
     player_session_creation_policy = player_session_creation_policy_;
     creator_id = creator_id_;
     game_session_data = game_session_data_;
     matchmaker_data = matchmaker_data_;
     location = location_;
     compute_name = compute_name_;
     player_gateway_status = player_gateway_status_;
   }
    : game_session)

let make_create_game_session_output ?game_session:(game_session_ : game_session option) () =
  ({ game_session = game_session_ } : create_game_session_output)

let make_create_game_session_input ?fleet_id:(fleet_id_ : fleet_id_or_arn option)
    ?alias_id:(alias_id_ : alias_id_or_arn option) ?name:(name_ : non_zero_and_max_string option)
    ?game_properties:(game_properties_ : game_property_list option)
    ?creator_id:(creator_id_ : non_zero_and_max_string option)
    ?game_session_id:(game_session_id_ : id_string_model option)
    ?idempotency_token:(idempotency_token_ : id_string_model option)
    ?game_session_data:(game_session_data_ : large_game_session_data option)
    ?location:(location_ : location_string_model option)
    ~maximum_player_session_count:(maximum_player_session_count_ : whole_number) () =
  ({
     fleet_id = fleet_id_;
     alias_id = alias_id_;
     maximum_player_session_count = maximum_player_session_count_;
     name = name_;
     game_properties = game_properties_;
     creator_id = creator_id_;
     game_session_id = game_session_id_;
     idempotency_token = idempotency_token_;
     game_session_data = game_session_data_;
     location = location_;
   }
    : create_game_session_input)

let make_priority_configuration ?priority_order:(priority_order_ : priority_type_list option)
    ?location_order:(location_order_ : location_list option) () =
  ({ priority_order = priority_order_; location_order = location_order_ } : priority_configuration)

let make_filter_configuration ?allowed_locations:(allowed_locations_ : location_list option) () =
  ({ allowed_locations = allowed_locations_ } : filter_configuration)

let make_game_session_queue_destination
    ?destination_arn:(destination_arn_ : arn_string_model option) () =
  ({ destination_arn = destination_arn_ } : game_session_queue_destination)

let make_player_latency_policy
    ?maximum_individual_player_latency_milliseconds:
      (maximum_individual_player_latency_milliseconds_ : whole_number option)
    ?policy_duration_seconds:(policy_duration_seconds_ : whole_number option) () =
  ({
     maximum_individual_player_latency_milliseconds =
       maximum_individual_player_latency_milliseconds_;
     policy_duration_seconds = policy_duration_seconds_;
   }
    : player_latency_policy)

let make_game_session_queue ?name:(name_ : game_session_queue_name option)
    ?game_session_queue_arn:(game_session_queue_arn_ : game_session_queue_arn option)
    ?timeout_in_seconds:(timeout_in_seconds_ : whole_number option)
    ?player_latency_policies:(player_latency_policies_ : player_latency_policy_list option)
    ?destinations:(destinations_ : game_session_queue_destination_list option)
    ?filter_configuration:(filter_configuration_ : filter_configuration option)
    ?priority_configuration:(priority_configuration_ : priority_configuration option)
    ?custom_event_data:(custom_event_data_ : queue_custom_event_data option)
    ?notification_target:(notification_target_ : queue_sns_arn_string_model option) () =
  ({
     name = name_;
     game_session_queue_arn = game_session_queue_arn_;
     timeout_in_seconds = timeout_in_seconds_;
     player_latency_policies = player_latency_policies_;
     destinations = destinations_;
     filter_configuration = filter_configuration_;
     priority_configuration = priority_configuration_;
     custom_event_data = custom_event_data_;
     notification_target = notification_target_;
   }
    : game_session_queue)

let make_create_game_session_queue_output
    ?game_session_queue:(game_session_queue_ : game_session_queue option) () =
  ({ game_session_queue = game_session_queue_ } : create_game_session_queue_output)

let make_create_game_session_queue_input
    ?timeout_in_seconds:(timeout_in_seconds_ : whole_number option)
    ?player_latency_policies:(player_latency_policies_ : player_latency_policy_list option)
    ?destinations:(destinations_ : game_session_queue_destination_list option)
    ?filter_configuration:(filter_configuration_ : filter_configuration option)
    ?priority_configuration:(priority_configuration_ : priority_configuration option)
    ?custom_event_data:(custom_event_data_ : queue_custom_event_data option)
    ?notification_target:(notification_target_ : queue_sns_arn_string_model option)
    ?tags:(tags_ : tag_list option) ~name:(name_ : game_session_queue_name) () =
  ({
     name = name_;
     timeout_in_seconds = timeout_in_seconds_;
     player_latency_policies = player_latency_policies_;
     destinations = destinations_;
     filter_configuration = filter_configuration_;
     priority_configuration = priority_configuration_;
     custom_event_data = custom_event_data_;
     notification_target = notification_target_;
     tags = tags_;
   }
    : create_game_session_queue_input)

let make_udp_endpoint ?domain:(domain_ : non_zero_and_max_string option)
    ?port:(port_ : positive_integer option) () =
  ({ domain = domain_; port = port_ } : udp_endpoint)

let make_ping_beacon ?udp_endpoint:(udp_endpoint_ : udp_endpoint option) () =
  ({ udp_endpoint = udp_endpoint_ } : ping_beacon)

let make_location_model ?location_name:(location_name_ : location_string_model option)
    ?location_arn:(location_arn_ : location_arn_model option)
    ?ping_beacon:(ping_beacon_ : ping_beacon option) () =
  ({ location_name = location_name_; location_arn = location_arn_; ping_beacon = ping_beacon_ }
    : location_model)

let make_create_location_output ?location:(location_ : location_model option) () =
  ({ location = location_ } : create_location_output)

let make_create_location_input ?tags:(tags_ : tag_list option)
    ~location_name:(location_name_ : custom_input_location_string_model) () =
  ({ location_name = location_name_; tags = tags_ } : create_location_input)

let make_matchmaking_configuration ?name:(name_ : matchmaking_id_string_model option)
    ?configuration_arn:(configuration_arn_ : matchmaking_configuration_arn option)
    ?description:(description_ : non_zero_and_max_string option)
    ?game_session_queue_arns:(game_session_queue_arns_ : queue_arns_list option)
    ?request_timeout_seconds:(request_timeout_seconds_ : matchmaking_request_timeout_integer option)
    ?acceptance_timeout_seconds:
      (acceptance_timeout_seconds_ : matchmaking_acceptance_timeout_integer option)
    ?acceptance_required:(acceptance_required_ : boolean_model option)
    ?rule_set_name:(rule_set_name_ : matchmaking_id_string_model option)
    ?rule_set_arn:(rule_set_arn_ : matchmaking_rule_set_arn option)
    ?notification_target:(notification_target_ : sns_arn_string_model option)
    ?additional_player_count:(additional_player_count_ : whole_number option)
    ?custom_event_data:(custom_event_data_ : custom_event_data option)
    ?creation_time:(creation_time_ : timestamp option)
    ?game_properties:(game_properties_ : game_property_list option)
    ?game_session_data:(game_session_data_ : game_session_data option)
    ?backfill_mode:(backfill_mode_ : backfill_mode option)
    ?flex_match_mode:(flex_match_mode_ : flex_match_mode option) () =
  ({
     name = name_;
     configuration_arn = configuration_arn_;
     description = description_;
     game_session_queue_arns = game_session_queue_arns_;
     request_timeout_seconds = request_timeout_seconds_;
     acceptance_timeout_seconds = acceptance_timeout_seconds_;
     acceptance_required = acceptance_required_;
     rule_set_name = rule_set_name_;
     rule_set_arn = rule_set_arn_;
     notification_target = notification_target_;
     additional_player_count = additional_player_count_;
     custom_event_data = custom_event_data_;
     creation_time = creation_time_;
     game_properties = game_properties_;
     game_session_data = game_session_data_;
     backfill_mode = backfill_mode_;
     flex_match_mode = flex_match_mode_;
   }
    : matchmaking_configuration)

let make_create_matchmaking_configuration_output
    ?configuration:(configuration_ : matchmaking_configuration option) () =
  ({ configuration = configuration_ } : create_matchmaking_configuration_output)

let make_create_matchmaking_configuration_input
    ?description:(description_ : non_zero_and_max_string option)
    ?game_session_queue_arns:(game_session_queue_arns_ : queue_arns_list option)
    ?acceptance_timeout_seconds:
      (acceptance_timeout_seconds_ : matchmaking_acceptance_timeout_integer option)
    ?notification_target:(notification_target_ : sns_arn_string_model option)
    ?additional_player_count:(additional_player_count_ : whole_number option)
    ?custom_event_data:(custom_event_data_ : custom_event_data option)
    ?game_properties:(game_properties_ : game_property_list option)
    ?game_session_data:(game_session_data_ : game_session_data option)
    ?backfill_mode:(backfill_mode_ : backfill_mode option)
    ?flex_match_mode:(flex_match_mode_ : flex_match_mode option) ?tags:(tags_ : tag_list option)
    ~name:(name_ : matchmaking_id_string_model)
    ~request_timeout_seconds:(request_timeout_seconds_ : matchmaking_request_timeout_integer)
    ~acceptance_required:(acceptance_required_ : boolean_model)
    ~rule_set_name:(rule_set_name_ : matchmaking_rule_set_name) () =
  ({
     name = name_;
     description = description_;
     game_session_queue_arns = game_session_queue_arns_;
     request_timeout_seconds = request_timeout_seconds_;
     acceptance_timeout_seconds = acceptance_timeout_seconds_;
     acceptance_required = acceptance_required_;
     rule_set_name = rule_set_name_;
     notification_target = notification_target_;
     additional_player_count = additional_player_count_;
     custom_event_data = custom_event_data_;
     game_properties = game_properties_;
     game_session_data = game_session_data_;
     backfill_mode = backfill_mode_;
     flex_match_mode = flex_match_mode_;
     tags = tags_;
   }
    : create_matchmaking_configuration_input)

let make_matchmaking_rule_set ?rule_set_name:(rule_set_name_ : matchmaking_id_string_model option)
    ?rule_set_arn:(rule_set_arn_ : matchmaking_rule_set_arn option)
    ?creation_time:(creation_time_ : timestamp option)
    ~rule_set_body:(rule_set_body_ : rule_set_body) () =
  ({
     rule_set_name = rule_set_name_;
     rule_set_arn = rule_set_arn_;
     rule_set_body = rule_set_body_;
     creation_time = creation_time_;
   }
    : matchmaking_rule_set)

let make_create_matchmaking_rule_set_output ~rule_set:(rule_set_ : matchmaking_rule_set) () =
  ({ rule_set = rule_set_ } : create_matchmaking_rule_set_output)

let make_create_matchmaking_rule_set_input ?tags:(tags_ : tag_list option)
    ~name:(name_ : matchmaking_id_string_model) ~rule_set_body:(rule_set_body_ : rule_set_body) () =
  ({ name = name_; rule_set_body = rule_set_body_; tags = tags_ }
    : create_matchmaking_rule_set_input)

let make_player_session ?player_session_id:(player_session_id_ : player_session_id option)
    ?player_id:(player_id_ : player_id option)
    ?game_session_id:(game_session_id_ : non_zero_and_max_string option)
    ?fleet_id:(fleet_id_ : fleet_id option) ?fleet_arn:(fleet_arn_ : fleet_arn option)
    ?creation_time:(creation_time_ : timestamp option)
    ?termination_time:(termination_time_ : timestamp option)
    ?status:(status_ : player_session_status option) ?ip_address:(ip_address_ : ip_address option)
    ?dns_name:(dns_name_ : dns_name option) ?port:(port_ : port_number option)
    ?player_data:(player_data_ : player_data option) () =
  ({
     player_session_id = player_session_id_;
     player_id = player_id_;
     game_session_id = game_session_id_;
     fleet_id = fleet_id_;
     fleet_arn = fleet_arn_;
     creation_time = creation_time_;
     termination_time = termination_time_;
     status = status_;
     ip_address = ip_address_;
     dns_name = dns_name_;
     port = port_;
     player_data = player_data_;
   }
    : player_session)

let make_create_player_session_output ?player_session:(player_session_ : player_session option) () =
  ({ player_session = player_session_ } : create_player_session_output)

let make_create_player_session_input ?player_data:(player_data_ : player_data option)
    ~game_session_id:(game_session_id_ : arn_string_model) ~player_id:(player_id_ : player_id) () =
  ({ game_session_id = game_session_id_; player_id = player_id_; player_data = player_data_ }
    : create_player_session_input)

let make_create_player_sessions_output
    ?player_sessions:(player_sessions_ : player_session_list option) () =
  ({ player_sessions = player_sessions_ } : create_player_sessions_output)

let make_create_player_sessions_input ?player_data_map:(player_data_map_ : player_data_map option)
    ~game_session_id:(game_session_id_ : arn_string_model)
    ~player_ids:(player_ids_ : player_id_list) () =
  ({
     game_session_id = game_session_id_;
     player_ids = player_ids_;
     player_data_map = player_data_map_;
   }
    : create_player_sessions_input)

let make_script ?script_id:(script_id_ : script_id option)
    ?script_arn:(script_arn_ : script_arn option) ?name:(name_ : non_zero_and_max_string option)
    ?version:(version_ : non_zero_and_max_string option)
    ?size_on_disk:(size_on_disk_ : whole_number_long option)
    ?creation_time:(creation_time_ : timestamp option)
    ?storage_location:(storage_location_ : s3_location option)
    ?node_js_version:(node_js_version_ : node_js_version option) () =
  ({
     script_id = script_id_;
     script_arn = script_arn_;
     name = name_;
     version = version_;
     size_on_disk = size_on_disk_;
     creation_time = creation_time_;
     storage_location = storage_location_;
     node_js_version = node_js_version_;
   }
    : script)

let make_create_script_output ?script:(script_ : script option) () =
  ({ script = script_ } : create_script_output)

let make_create_script_input ?name:(name_ : non_zero_and_max_string option)
    ?version:(version_ : non_zero_and_max_string option)
    ?storage_location:(storage_location_ : s3_location option)
    ?zip_file:(zip_file_ : zip_blob option) ?tags:(tags_ : tag_list option)
    ?node_js_version:(node_js_version_ : node_js_version option) () =
  ({
     name = name_;
     version = version_;
     storage_location = storage_location_;
     zip_file = zip_file_;
     tags = tags_;
     node_js_version = node_js_version_;
   }
    : create_script_input)

let make_vpc_peering_authorization
    ?game_lift_aws_account_id:(game_lift_aws_account_id_ : non_zero_and_max_string option)
    ?peer_vpc_aws_account_id:(peer_vpc_aws_account_id_ : non_zero_and_max_string option)
    ?peer_vpc_id:(peer_vpc_id_ : non_zero_and_max_string option)
    ?creation_time:(creation_time_ : timestamp option)
    ?expiration_time:(expiration_time_ : timestamp option) () =
  ({
     game_lift_aws_account_id = game_lift_aws_account_id_;
     peer_vpc_aws_account_id = peer_vpc_aws_account_id_;
     peer_vpc_id = peer_vpc_id_;
     creation_time = creation_time_;
     expiration_time = expiration_time_;
   }
    : vpc_peering_authorization)

let make_create_vpc_peering_authorization_output
    ?vpc_peering_authorization:(vpc_peering_authorization_ : vpc_peering_authorization option) () =
  ({ vpc_peering_authorization = vpc_peering_authorization_ }
    : create_vpc_peering_authorization_output)

let make_create_vpc_peering_authorization_input
    ~game_lift_aws_account_id:(game_lift_aws_account_id_ : non_zero_and_max_string)
    ~peer_vpc_id:(peer_vpc_id_ : non_zero_and_max_string) () =
  ({ game_lift_aws_account_id = game_lift_aws_account_id_; peer_vpc_id = peer_vpc_id_ }
    : create_vpc_peering_authorization_input)

let make_create_vpc_peering_connection_output () = (() : unit)

let make_create_vpc_peering_connection_input ~fleet_id:(fleet_id_ : fleet_id)
    ~peer_vpc_aws_account_id:(peer_vpc_aws_account_id_ : non_zero_and_max_string)
    ~peer_vpc_id:(peer_vpc_id_ : non_zero_and_max_string) () =
  ({
     fleet_id = fleet_id_;
     peer_vpc_aws_account_id = peer_vpc_aws_account_id_;
     peer_vpc_id = peer_vpc_id_;
   }
    : create_vpc_peering_connection_input)

let make_delete_alias_input ~alias_id:(alias_id_ : alias_id_or_arn) () =
  ({ alias_id = alias_id_ } : delete_alias_input)

let make_delete_build_input ~build_id:(build_id_ : build_id_or_arn) () =
  ({ build_id = build_id_ } : delete_build_input)

let make_delete_container_fleet_output () = (() : unit)

let make_delete_container_fleet_input ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({ fleet_id = fleet_id_ } : delete_container_fleet_input)

let make_delete_container_group_definition_output () = (() : unit)

let make_delete_container_group_definition_input
    ?version_number:(version_number_ : positive_integer option)
    ?version_count_to_retain:(version_count_to_retain_ : whole_number option)
    ~name:(name_ : container_group_definition_name_or_arn) () =
  ({
     name = name_;
     version_number = version_number_;
     version_count_to_retain = version_count_to_retain_;
   }
    : delete_container_group_definition_input)

let make_delete_fleet_input ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({ fleet_id = fleet_id_ } : delete_fleet_input)

let make_delete_fleet_locations_output ?fleet_id:(fleet_id_ : fleet_id_or_arn option)
    ?fleet_arn:(fleet_arn_ : fleet_arn option)
    ?location_states:(location_states_ : location_state_list option) () =
  ({ fleet_id = fleet_id_; fleet_arn = fleet_arn_; location_states = location_states_ }
    : delete_fleet_locations_output)

let make_delete_fleet_locations_input ~fleet_id:(fleet_id_ : fleet_id_or_arn)
    ~locations:(locations_ : location_list) () =
  ({ fleet_id = fleet_id_; locations = locations_ } : delete_fleet_locations_input)

let make_delete_game_server_group_output
    ?game_server_group:(game_server_group_ : game_server_group option) () =
  ({ game_server_group = game_server_group_ } : delete_game_server_group_output)

let make_delete_game_server_group_input
    ?delete_option:(delete_option_ : game_server_group_delete_option option)
    ~game_server_group_name:(game_server_group_name_ : game_server_group_name_or_arn) () =
  ({ game_server_group_name = game_server_group_name_; delete_option = delete_option_ }
    : delete_game_server_group_input)

let make_delete_game_session_queue_output () = (() : unit)

let make_delete_game_session_queue_input ~name:(name_ : game_session_queue_name_or_arn) () =
  ({ name = name_ } : delete_game_session_queue_input)

let make_delete_location_output () = (() : unit)

let make_delete_location_input ~location_name:(location_name_ : custom_location_name_or_arn_model)
    () =
  ({ location_name = location_name_ } : delete_location_input)

let make_delete_matchmaking_configuration_output () = (() : unit)

let make_delete_matchmaking_configuration_input ~name:(name_ : matchmaking_configuration_name) () =
  ({ name = name_ } : delete_matchmaking_configuration_input)

let make_delete_matchmaking_rule_set_output () = (() : unit)

let make_delete_matchmaking_rule_set_input ~name:(name_ : matchmaking_rule_set_name) () =
  ({ name = name_ } : delete_matchmaking_rule_set_input)

let make_delete_scaling_policy_input ~name:(name_ : non_zero_and_max_string)
    ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({ name = name_; fleet_id = fleet_id_ } : delete_scaling_policy_input)

let make_delete_script_input ~script_id:(script_id_ : script_id_or_arn) () =
  ({ script_id = script_id_ } : delete_script_input)

let make_delete_vpc_peering_authorization_output () = (() : unit)

let make_delete_vpc_peering_authorization_input
    ~game_lift_aws_account_id:(game_lift_aws_account_id_ : non_zero_and_max_string)
    ~peer_vpc_id:(peer_vpc_id_ : non_zero_and_max_string) () =
  ({ game_lift_aws_account_id = game_lift_aws_account_id_; peer_vpc_id = peer_vpc_id_ }
    : delete_vpc_peering_authorization_input)

let make_delete_vpc_peering_connection_output () = (() : unit)

let make_delete_vpc_peering_connection_input ~fleet_id:(fleet_id_ : fleet_id)
    ~vpc_peering_connection_id:(vpc_peering_connection_id_ : non_zero_and_max_string) () =
  ({ fleet_id = fleet_id_; vpc_peering_connection_id = vpc_peering_connection_id_ }
    : delete_vpc_peering_connection_input)

let make_deployment_configuration
    ?protection_strategy:(protection_strategy_ : deployment_protection_strategy option)
    ?minimum_healthy_percentage:(minimum_healthy_percentage_ : minimum_healthy_percentage option)
    ?impairment_strategy:(impairment_strategy_ : deployment_impairment_strategy option) () =
  ({
     protection_strategy = protection_strategy_;
     minimum_healthy_percentage = minimum_healthy_percentage_;
     impairment_strategy = impairment_strategy_;
   }
    : deployment_configuration)

let make_deregister_compute_output () = (() : unit)

let make_deregister_compute_input ~fleet_id:(fleet_id_ : fleet_id_or_arn)
    ~compute_name:(compute_name_ : compute_name_or_arn) () =
  ({ fleet_id = fleet_id_; compute_name = compute_name_ } : deregister_compute_input)

let make_deregister_game_server_input
    ~game_server_group_name:(game_server_group_name_ : game_server_group_name_or_arn)
    ~game_server_id:(game_server_id_ : game_server_id) () =
  ({ game_server_group_name = game_server_group_name_; game_server_id = game_server_id_ }
    : deregister_game_server_input)

let make_describe_alias_output ?alias:(alias_ : alias option) () =
  ({ alias = alias_ } : describe_alias_output)

let make_describe_alias_input ~alias_id:(alias_id_ : alias_id_or_arn) () =
  ({ alias_id = alias_id_ } : describe_alias_input)

let make_describe_build_output ?build:(build_ : build option) () =
  ({ build = build_ } : describe_build_output)

let make_describe_build_input ~build_id:(build_id_ : build_id_or_arn) () =
  ({ build_id = build_id_ } : describe_build_input)

let make_describe_compute_output ?compute:(compute_ : compute option) () =
  ({ compute = compute_ } : describe_compute_output)

let make_describe_compute_input ~fleet_id:(fleet_id_ : fleet_id_or_arn)
    ~compute_name:(compute_name_ : compute_name_or_arn) () =
  ({ fleet_id = fleet_id_; compute_name = compute_name_ } : describe_compute_input)

let make_describe_container_fleet_output
    ?container_fleet:(container_fleet_ : container_fleet option) () =
  ({ container_fleet = container_fleet_ } : describe_container_fleet_output)

let make_describe_container_fleet_input ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({ fleet_id = fleet_id_ } : describe_container_fleet_input)

let make_describe_container_group_definition_output
    ?container_group_definition:(container_group_definition_ : container_group_definition option) ()
    =
  ({ container_group_definition = container_group_definition_ }
    : describe_container_group_definition_output)

let make_describe_container_group_definition_input
    ?version_number:(version_number_ : positive_integer option)
    ~name:(name_ : container_group_definition_name_or_arn) () =
  ({ name = name_; version_number = version_number_ } : describe_container_group_definition_input)

let make_describe_container_group_port_mappings_output ?fleet_id:(fleet_id_ : fleet_id option)
    ?fleet_arn:(fleet_arn_ : fleet_arn option) ?location:(location_ : location_string_model option)
    ?container_group_definition_arn:
      (container_group_definition_arn_ : container_group_definition_arn option)
    ?container_group_type:(container_group_type_ : container_group_type option)
    ?compute_name:(compute_name_ : compute_name option)
    ?instance_id:(instance_id_ : instance_id option)
    ?container_group_port_mappings:
      (container_group_port_mappings_ : container_group_port_mapping_list option) () =
  ({
     fleet_id = fleet_id_;
     fleet_arn = fleet_arn_;
     location = location_;
     container_group_definition_arn = container_group_definition_arn_;
     container_group_type = container_group_type_;
     compute_name = compute_name_;
     instance_id = instance_id_;
     container_group_port_mappings = container_group_port_mappings_;
   }
    : describe_container_group_port_mappings_output)

let make_describe_container_group_port_mappings_input
    ?compute_name:(compute_name_ : compute_name_or_arn option)
    ?instance_id:(instance_id_ : instance_id option)
    ?container_name:(container_name_ : non_zero_and128_max_ascii_string option)
    ~fleet_id:(fleet_id_ : fleet_id_or_arn)
    ~container_group_type:(container_group_type_ : container_group_type) () =
  ({
     fleet_id = fleet_id_;
     container_group_type = container_group_type_;
     compute_name = compute_name_;
     instance_id = instance_id_;
     container_name = container_name_;
   }
    : describe_container_group_port_mappings_input)

let make_ec2_instance_limit ?ec2_instance_type:(ec2_instance_type_ : ec2_instance_type option)
    ?current_instances:(current_instances_ : whole_number option)
    ?instance_limit:(instance_limit_ : whole_number option)
    ?location:(location_ : location_string_model option) () =
  ({
     ec2_instance_type = ec2_instance_type_;
     current_instances = current_instances_;
     instance_limit = instance_limit_;
     location = location_;
   }
    : ec2_instance_limit)

let make_describe_ec2_instance_limits_output
    ?ec2_instance_limits:(ec2_instance_limits_ : ec2_instance_limit_list option) () =
  ({ ec2_instance_limits = ec2_instance_limits_ } : describe_ec2_instance_limits_output)

let make_describe_ec2_instance_limits_input
    ?ec2_instance_type:(ec2_instance_type_ : ec2_instance_type option)
    ?location:(location_ : location_string_model option) () =
  ({ ec2_instance_type = ec2_instance_type_; location = location_ }
    : describe_ec2_instance_limits_input)

let make_describe_fleet_attributes_output
    ?fleet_attributes:(fleet_attributes_ : fleet_attributes_list option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({ fleet_attributes = fleet_attributes_; next_token = next_token_ }
    : describe_fleet_attributes_output)

let make_describe_fleet_attributes_input ?fleet_ids:(fleet_ids_ : fleet_id_or_arn_list option)
    ?limit:(limit_ : positive_integer option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({ fleet_ids = fleet_ids_; limit = limit_; next_token = next_token_ }
    : describe_fleet_attributes_input)

let make_managed_capacity_configuration
    ?zero_capacity_strategy:(zero_capacity_strategy_ : zero_capacity_strategy option)
    ?scale_in_after_inactivity_minutes:
      (scale_in_after_inactivity_minutes_ : scale_in_after_inactivity_minutes option) () =
  ({
     zero_capacity_strategy = zero_capacity_strategy_;
     scale_in_after_inactivity_minutes = scale_in_after_inactivity_minutes_;
   }
    : managed_capacity_configuration)

let make_game_server_container_group_counts ?pendin_g:(pendin_g_ : whole_number option)
    ?activ_e:(activ_e_ : whole_number option) ?idl_e:(idl_e_ : whole_number option)
    ?terminatin_g:(terminatin_g_ : whole_number option) () =
  ({ pendin_g = pendin_g_; activ_e = activ_e_; idl_e = idl_e_; terminatin_g = terminatin_g_ }
    : game_server_container_group_counts)

let make_ec2_instance_counts ?desire_d:(desire_d_ : whole_number option)
    ?minimu_m:(minimu_m_ : whole_number option) ?maximu_m:(maximu_m_ : whole_number option)
    ?pendin_g:(pendin_g_ : whole_number option) ?activ_e:(activ_e_ : whole_number option)
    ?idl_e:(idl_e_ : whole_number option) ?terminatin_g:(terminatin_g_ : whole_number option) () =
  ({
     desire_d = desire_d_;
     minimu_m = minimu_m_;
     maximu_m = maximu_m_;
     pendin_g = pendin_g_;
     activ_e = activ_e_;
     idl_e = idl_e_;
     terminatin_g = terminatin_g_;
   }
    : ec2_instance_counts)

let make_fleet_capacity ?fleet_id:(fleet_id_ : fleet_id option)
    ?fleet_arn:(fleet_arn_ : fleet_arn option)
    ?instance_type:(instance_type_ : ec2_instance_type option)
    ?instance_counts:(instance_counts_ : ec2_instance_counts option)
    ?location:(location_ : location_string_model option)
    ?game_server_container_group_counts:
      (game_server_container_group_counts_ : game_server_container_group_counts option)
    ?managed_capacity_configuration:
      (managed_capacity_configuration_ : managed_capacity_configuration option) () =
  ({
     fleet_id = fleet_id_;
     fleet_arn = fleet_arn_;
     instance_type = instance_type_;
     instance_counts = instance_counts_;
     location = location_;
     game_server_container_group_counts = game_server_container_group_counts_;
     managed_capacity_configuration = managed_capacity_configuration_;
   }
    : fleet_capacity)

let make_describe_fleet_capacity_output
    ?fleet_capacity:(fleet_capacity_ : fleet_capacity_list option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({ fleet_capacity = fleet_capacity_; next_token = next_token_ } : describe_fleet_capacity_output)

let make_describe_fleet_capacity_input ?fleet_ids:(fleet_ids_ : fleet_id_or_arn_list option)
    ?limit:(limit_ : positive_integer option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({ fleet_ids = fleet_ids_; limit = limit_; next_token = next_token_ }
    : describe_fleet_capacity_input)

let make_locational_deployment ?deployment_status:(deployment_status_ : deployment_status option) ()
    =
  ({ deployment_status = deployment_status_ } : locational_deployment)

let make_fleet_deployment ?deployment_id:(deployment_id_ : deployment_id option)
    ?fleet_id:(fleet_id_ : fleet_id option)
    ?game_server_binary_arn:(game_server_binary_arn_ : fleet_binary_arn option)
    ?rollback_game_server_binary_arn:(rollback_game_server_binary_arn_ : fleet_binary_arn option)
    ?per_instance_binary_arn:(per_instance_binary_arn_ : fleet_binary_arn option)
    ?rollback_per_instance_binary_arn:(rollback_per_instance_binary_arn_ : fleet_binary_arn option)
    ?deployment_status:(deployment_status_ : deployment_status option)
    ?deployment_configuration:(deployment_configuration_ : deployment_configuration option)
    ?creation_time:(creation_time_ : timestamp option) () =
  ({
     deployment_id = deployment_id_;
     fleet_id = fleet_id_;
     game_server_binary_arn = game_server_binary_arn_;
     rollback_game_server_binary_arn = rollback_game_server_binary_arn_;
     per_instance_binary_arn = per_instance_binary_arn_;
     rollback_per_instance_binary_arn = rollback_per_instance_binary_arn_;
     deployment_status = deployment_status_;
     deployment_configuration = deployment_configuration_;
     creation_time = creation_time_;
   }
    : fleet_deployment)

let make_describe_fleet_deployment_output
    ?fleet_deployment:(fleet_deployment_ : fleet_deployment option)
    ?locational_deployments:(locational_deployments_ : locational_deployments option) () =
  ({ fleet_deployment = fleet_deployment_; locational_deployments = locational_deployments_ }
    : describe_fleet_deployment_output)

let make_describe_fleet_deployment_input ?deployment_id:(deployment_id_ : deployment_id option)
    ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({ fleet_id = fleet_id_; deployment_id = deployment_id_ } : describe_fleet_deployment_input)

let make_event ?event_id:(event_id_ : non_zero_and_max_string option)
    ?resource_id:(resource_id_ : non_zero_and_max_string option)
    ?event_code:(event_code_ : event_code option) ?message:(message_ : non_empty_string option)
    ?event_time:(event_time_ : timestamp option)
    ?pre_signed_log_url:(pre_signed_log_url_ : non_zero_and_max_string option)
    ?count:(count_ : event_count option) () =
  ({
     event_id = event_id_;
     resource_id = resource_id_;
     event_code = event_code_;
     message = message_;
     event_time = event_time_;
     pre_signed_log_url = pre_signed_log_url_;
     count = count_;
   }
    : event)

let make_describe_fleet_events_output ?events:(events_ : event_list option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({ events = events_; next_token = next_token_ } : describe_fleet_events_output)

let make_describe_fleet_events_input ?start_time:(start_time_ : timestamp option)
    ?end_time:(end_time_ : timestamp option) ?limit:(limit_ : positive_integer option)
    ?next_token:(next_token_ : non_zero_and_max_string option)
    ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({
     fleet_id = fleet_id_;
     start_time = start_time_;
     end_time = end_time_;
     limit = limit_;
     next_token = next_token_;
   }
    : describe_fleet_events_input)

let make_location_attributes ?location_state:(location_state_ : location_state option)
    ?stopped_actions:(stopped_actions_ : fleet_action_list option)
    ?update_status:(update_status_ : location_update_status option) () =
  ({
     location_state = location_state_;
     stopped_actions = stopped_actions_;
     update_status = update_status_;
   }
    : location_attributes)

let make_describe_fleet_location_attributes_output ?fleet_id:(fleet_id_ : fleet_id_or_arn option)
    ?fleet_arn:(fleet_arn_ : fleet_arn option)
    ?location_attributes:(location_attributes_ : location_attributes_list option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({
     fleet_id = fleet_id_;
     fleet_arn = fleet_arn_;
     location_attributes = location_attributes_;
     next_token = next_token_;
   }
    : describe_fleet_location_attributes_output)

let make_describe_fleet_location_attributes_input ?locations:(locations_ : location_list option)
    ?limit:(limit_ : positive_integer option)
    ?next_token:(next_token_ : non_zero_and_max_string option)
    ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({ fleet_id = fleet_id_; locations = locations_; limit = limit_; next_token = next_token_ }
    : describe_fleet_location_attributes_input)

let make_describe_fleet_location_capacity_output
    ?fleet_capacity:(fleet_capacity_ : fleet_capacity option) () =
  ({ fleet_capacity = fleet_capacity_ } : describe_fleet_location_capacity_output)

let make_describe_fleet_location_capacity_input ~fleet_id:(fleet_id_ : fleet_id_or_arn)
    ~location:(location_ : location_string_model) () =
  ({ fleet_id = fleet_id_; location = location_ } : describe_fleet_location_capacity_input)

let make_fleet_utilization ?fleet_id:(fleet_id_ : fleet_id option)
    ?fleet_arn:(fleet_arn_ : fleet_arn option)
    ?active_server_process_count:(active_server_process_count_ : whole_number option)
    ?active_game_session_count:(active_game_session_count_ : whole_number option)
    ?current_player_session_count:(current_player_session_count_ : whole_number option)
    ?maximum_player_session_count:(maximum_player_session_count_ : whole_number option)
    ?location:(location_ : location_string_model option) () =
  ({
     fleet_id = fleet_id_;
     fleet_arn = fleet_arn_;
     active_server_process_count = active_server_process_count_;
     active_game_session_count = active_game_session_count_;
     current_player_session_count = current_player_session_count_;
     maximum_player_session_count = maximum_player_session_count_;
     location = location_;
   }
    : fleet_utilization)

let make_describe_fleet_location_utilization_output
    ?fleet_utilization:(fleet_utilization_ : fleet_utilization option) () =
  ({ fleet_utilization = fleet_utilization_ } : describe_fleet_location_utilization_output)

let make_describe_fleet_location_utilization_input ~fleet_id:(fleet_id_ : fleet_id_or_arn)
    ~location:(location_ : location_string_model) () =
  ({ fleet_id = fleet_id_; location = location_ } : describe_fleet_location_utilization_input)

let make_describe_fleet_port_settings_output ?fleet_id:(fleet_id_ : fleet_id option)
    ?fleet_arn:(fleet_arn_ : fleet_arn option)
    ?inbound_permissions:(inbound_permissions_ : ip_permissions_list option)
    ?update_status:(update_status_ : location_update_status option)
    ?location:(location_ : location_string_model option) () =
  ({
     fleet_id = fleet_id_;
     fleet_arn = fleet_arn_;
     inbound_permissions = inbound_permissions_;
     update_status = update_status_;
     location = location_;
   }
    : describe_fleet_port_settings_output)

let make_describe_fleet_port_settings_input ?location:(location_ : location_string_model option)
    ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({ fleet_id = fleet_id_; location = location_ } : describe_fleet_port_settings_input)

let make_describe_fleet_utilization_output
    ?fleet_utilization:(fleet_utilization_ : fleet_utilization_list option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({ fleet_utilization = fleet_utilization_; next_token = next_token_ }
    : describe_fleet_utilization_output)

let make_describe_fleet_utilization_input ?fleet_ids:(fleet_ids_ : fleet_id_or_arn_list option)
    ?limit:(limit_ : positive_integer option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({ fleet_ids = fleet_ids_; limit = limit_; next_token = next_token_ }
    : describe_fleet_utilization_input)

let make_describe_game_server_output ?game_server:(game_server_ : game_server option) () =
  ({ game_server = game_server_ } : describe_game_server_output)

let make_describe_game_server_input
    ~game_server_group_name:(game_server_group_name_ : game_server_group_name_or_arn)
    ~game_server_id:(game_server_id_ : game_server_id) () =
  ({ game_server_group_name = game_server_group_name_; game_server_id = game_server_id_ }
    : describe_game_server_input)

let make_describe_game_server_group_output
    ?game_server_group:(game_server_group_ : game_server_group option) () =
  ({ game_server_group = game_server_group_ } : describe_game_server_group_output)

let make_describe_game_server_group_input
    ~game_server_group_name:(game_server_group_name_ : game_server_group_name_or_arn) () =
  ({ game_server_group_name = game_server_group_name_ } : describe_game_server_group_input)

let make_game_server_instance
    ?game_server_group_name:(game_server_group_name_ : game_server_group_name option)
    ?game_server_group_arn:(game_server_group_arn_ : game_server_group_arn option)
    ?instance_id:(instance_id_ : game_server_instance_id option)
    ?instance_status:(instance_status_ : game_server_instance_status option) () =
  ({
     game_server_group_name = game_server_group_name_;
     game_server_group_arn = game_server_group_arn_;
     instance_id = instance_id_;
     instance_status = instance_status_;
   }
    : game_server_instance)

let make_describe_game_server_instances_output
    ?game_server_instances:(game_server_instances_ : game_server_instances option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({ game_server_instances = game_server_instances_; next_token = next_token_ }
    : describe_game_server_instances_output)

let make_describe_game_server_instances_input
    ?instance_ids:(instance_ids_ : game_server_instance_ids option)
    ?limit:(limit_ : positive_integer option)
    ?next_token:(next_token_ : non_zero_and_max_string option)
    ~game_server_group_name:(game_server_group_name_ : game_server_group_name_or_arn) () =
  ({
     game_server_group_name = game_server_group_name_;
     instance_ids = instance_ids_;
     limit = limit_;
     next_token = next_token_;
   }
    : describe_game_server_instances_input)

let make_game_session_detail ?game_session:(game_session_ : game_session option)
    ?protection_policy:(protection_policy_ : protection_policy option) () =
  ({ game_session = game_session_; protection_policy = protection_policy_ } : game_session_detail)

let make_describe_game_session_details_output
    ?game_session_details:(game_session_details_ : game_session_detail_list option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({ game_session_details = game_session_details_; next_token = next_token_ }
    : describe_game_session_details_output)

let make_describe_game_session_details_input ?fleet_id:(fleet_id_ : fleet_id_or_arn option)
    ?game_session_id:(game_session_id_ : arn_string_model option)
    ?alias_id:(alias_id_ : alias_id_or_arn option)
    ?location:(location_ : location_string_model option)
    ?status_filter:(status_filter_ : non_zero_and_max_string option)
    ?limit:(limit_ : positive_integer option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({
     fleet_id = fleet_id_;
     game_session_id = game_session_id_;
     alias_id = alias_id_;
     location = location_;
     status_filter = status_filter_;
     limit = limit_;
     next_token = next_token_;
   }
    : describe_game_session_details_input)

let make_priority_configuration_override
    ?placement_fallback_strategy:(placement_fallback_strategy_ : placement_fallback_strategy option)
    ~location_order:(location_order_ : location_order_override_list) () =
  ({ placement_fallback_strategy = placement_fallback_strategy_; location_order = location_order_ }
    : priority_configuration_override)

let make_placed_player_session ?player_id:(player_id_ : player_id option)
    ?player_session_id:(player_session_id_ : player_session_id option) () =
  ({ player_id = player_id_; player_session_id = player_session_id_ } : placed_player_session)

let make_player_latency ?player_id:(player_id_ : player_id option)
    ?region_identifier:(region_identifier_ : non_zero_and_max_string option)
    ?latency_in_milliseconds:(latency_in_milliseconds_ : float_ option) () =
  ({
     player_id = player_id_;
     region_identifier = region_identifier_;
     latency_in_milliseconds = latency_in_milliseconds_;
   }
    : player_latency)

let make_game_session_placement ?placement_id:(placement_id_ : id_string_model option)
    ?game_session_queue_name:(game_session_queue_name_ : game_session_queue_name option)
    ?status:(status_ : game_session_placement_state option)
    ?game_properties:(game_properties_ : game_property_list option)
    ?maximum_player_session_count:(maximum_player_session_count_ : whole_number option)
    ?game_session_name:(game_session_name_ : non_zero_and_max_string option)
    ?game_session_id:(game_session_id_ : non_zero_and_max_string option)
    ?game_session_arn:(game_session_arn_ : non_zero_and_max_string option)
    ?game_session_region:(game_session_region_ : non_zero_and_max_string option)
    ?player_latencies:(player_latencies_ : player_latency_list option)
    ?start_time:(start_time_ : timestamp option) ?end_time:(end_time_ : timestamp option)
    ?ip_address:(ip_address_ : ip_address option) ?dns_name:(dns_name_ : dns_name option)
    ?port:(port_ : port_number option)
    ?placed_player_sessions:(placed_player_sessions_ : placed_player_session_list option)
    ?game_session_data:(game_session_data_ : large_game_session_data option)
    ?matchmaker_data:(matchmaker_data_ : matchmaker_data option)
    ?priority_configuration_override:
      (priority_configuration_override_ : priority_configuration_override option)
    ?player_gateway_status:(player_gateway_status_ : player_gateway_status option) () =
  ({
     placement_id = placement_id_;
     game_session_queue_name = game_session_queue_name_;
     status = status_;
     game_properties = game_properties_;
     maximum_player_session_count = maximum_player_session_count_;
     game_session_name = game_session_name_;
     game_session_id = game_session_id_;
     game_session_arn = game_session_arn_;
     game_session_region = game_session_region_;
     player_latencies = player_latencies_;
     start_time = start_time_;
     end_time = end_time_;
     ip_address = ip_address_;
     dns_name = dns_name_;
     port = port_;
     placed_player_sessions = placed_player_sessions_;
     game_session_data = game_session_data_;
     matchmaker_data = matchmaker_data_;
     priority_configuration_override = priority_configuration_override_;
     player_gateway_status = player_gateway_status_;
   }
    : game_session_placement)

let make_describe_game_session_placement_output
    ?game_session_placement:(game_session_placement_ : game_session_placement option) () =
  ({ game_session_placement = game_session_placement_ } : describe_game_session_placement_output)

let make_describe_game_session_placement_input ~placement_id:(placement_id_ : id_string_model) () =
  ({ placement_id = placement_id_ } : describe_game_session_placement_input)

let make_describe_game_session_queues_output
    ?game_session_queues:(game_session_queues_ : game_session_queue_list option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({ game_session_queues = game_session_queues_; next_token = next_token_ }
    : describe_game_session_queues_output)

let make_describe_game_session_queues_input
    ?names:(names_ : game_session_queue_name_or_arn_list option)
    ?limit:(limit_ : positive_integer option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({ names = names_; limit = limit_; next_token = next_token_ }
    : describe_game_session_queues_input)

let make_describe_game_sessions_output ?game_sessions:(game_sessions_ : game_session_list option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({ game_sessions = game_sessions_; next_token = next_token_ } : describe_game_sessions_output)

let make_describe_game_sessions_input ?fleet_id:(fleet_id_ : fleet_id_or_arn option)
    ?game_session_id:(game_session_id_ : arn_string_model option)
    ?alias_id:(alias_id_ : alias_id_or_arn option)
    ?location:(location_ : location_string_model option)
    ?status_filter:(status_filter_ : non_zero_and_max_string option)
    ?limit:(limit_ : positive_integer option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({
     fleet_id = fleet_id_;
     game_session_id = game_session_id_;
     alias_id = alias_id_;
     location = location_;
     status_filter = status_filter_;
     limit = limit_;
     next_token = next_token_;
   }
    : describe_game_sessions_input)

let make_instance ?fleet_id:(fleet_id_ : fleet_id option) ?fleet_arn:(fleet_arn_ : fleet_arn option)
    ?instance_id:(instance_id_ : instance_id option) ?ip_address:(ip_address_ : ip_address option)
    ?dns_name:(dns_name_ : dns_name option)
    ?operating_system:(operating_system_ : operating_system option)
    ?type_:(type__ : ec2_instance_type option) ?status:(status_ : instance_status option)
    ?creation_time:(creation_time_ : timestamp option)
    ?location:(location_ : location_string_model option) () =
  ({
     fleet_id = fleet_id_;
     fleet_arn = fleet_arn_;
     instance_id = instance_id_;
     ip_address = ip_address_;
     dns_name = dns_name_;
     operating_system = operating_system_;
     type_ = type__;
     status = status_;
     creation_time = creation_time_;
     location = location_;
   }
    : instance)

let make_describe_instances_output ?instances:(instances_ : instance_list option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({ instances = instances_; next_token = next_token_ } : describe_instances_output)

let make_describe_instances_input ?instance_id:(instance_id_ : instance_id option)
    ?limit:(limit_ : positive_integer option)
    ?next_token:(next_token_ : non_zero_and_max_string option)
    ?location:(location_ : location_string_model option) ~fleet_id:(fleet_id_ : fleet_id_or_arn) ()
    =
  ({
     fleet_id = fleet_id_;
     instance_id = instance_id_;
     limit = limit_;
     next_token = next_token_;
     location = location_;
   }
    : describe_instances_input)

let make_matched_player_session ?player_id:(player_id_ : player_id option)
    ?player_session_id:(player_session_id_ : player_session_id option) () =
  ({ player_id = player_id_; player_session_id = player_session_id_ } : matched_player_session)

let make_game_session_connection_info
    ?game_session_arn:(game_session_arn_ : arn_string_model option)
    ?ip_address:(ip_address_ : ip_address option) ?dns_name:(dns_name_ : dns_name option)
    ?port:(port_ : positive_integer option)
    ?matched_player_sessions:(matched_player_sessions_ : matched_player_session_list option)
    ?player_gateway_status:(player_gateway_status_ : player_gateway_status option) () =
  ({
     game_session_arn = game_session_arn_;
     ip_address = ip_address_;
     dns_name = dns_name_;
     port = port_;
     matched_player_sessions = matched_player_sessions_;
     player_gateway_status = player_gateway_status_;
   }
    : game_session_connection_info)

let make_player ?player_id:(player_id_ : player_id option)
    ?player_attributes:(player_attributes_ : player_attribute_map option)
    ?team:(team_ : non_zero_and_max_string option)
    ?latency_in_ms:(latency_in_ms_ : latency_map option) () =
  ({
     player_id = player_id_;
     player_attributes = player_attributes_;
     team = team_;
     latency_in_ms = latency_in_ms_;
   }
    : player)

let make_matchmaking_ticket ?ticket_id:(ticket_id_ : matchmaking_id_string_model option)
    ?configuration_name:(configuration_name_ : matchmaking_id_string_model option)
    ?configuration_arn:(configuration_arn_ : matchmaking_configuration_arn option)
    ?status:(status_ : matchmaking_configuration_status option)
    ?status_reason:(status_reason_ : string_model option)
    ?status_message:(status_message_ : string_model option)
    ?start_time:(start_time_ : timestamp option) ?end_time:(end_time_ : timestamp option)
    ?players:(players_ : player_list option)
    ?game_session_connection_info:
      (game_session_connection_info_ : game_session_connection_info option)
    ?estimated_wait_time:(estimated_wait_time_ : whole_number option) () =
  ({
     ticket_id = ticket_id_;
     configuration_name = configuration_name_;
     configuration_arn = configuration_arn_;
     status = status_;
     status_reason = status_reason_;
     status_message = status_message_;
     start_time = start_time_;
     end_time = end_time_;
     players = players_;
     game_session_connection_info = game_session_connection_info_;
     estimated_wait_time = estimated_wait_time_;
   }
    : matchmaking_ticket)

let make_describe_matchmaking_output ?ticket_list:(ticket_list_ : matchmaking_ticket_list option) ()
    =
  ({ ticket_list = ticket_list_ } : describe_matchmaking_output)

let make_describe_matchmaking_input ~ticket_ids:(ticket_ids_ : matchmaking_id_list) () =
  ({ ticket_ids = ticket_ids_ } : describe_matchmaking_input)

let make_describe_matchmaking_configurations_output
    ?configurations:(configurations_ : matchmaking_configuration_list option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({ configurations = configurations_; next_token = next_token_ }
    : describe_matchmaking_configurations_output)

let make_describe_matchmaking_configurations_input
    ?names:(names_ : matchmaking_configuration_name_list option)
    ?rule_set_name:(rule_set_name_ : matchmaking_rule_set_name option)
    ?limit:(limit_ : positive_integer option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({ names = names_; rule_set_name = rule_set_name_; limit = limit_; next_token = next_token_ }
    : describe_matchmaking_configurations_input)

let make_describe_matchmaking_rule_sets_output
    ?next_token:(next_token_ : non_zero_and_max_string option)
    ~rule_sets:(rule_sets_ : matchmaking_rule_set_list) () =
  ({ rule_sets = rule_sets_; next_token = next_token_ } : describe_matchmaking_rule_sets_output)

let make_describe_matchmaking_rule_sets_input
    ?names:(names_ : matchmaking_rule_set_name_list option) ?limit:(limit_ : rule_set_limit option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({ names = names_; limit = limit_; next_token = next_token_ }
    : describe_matchmaking_rule_sets_input)

let make_describe_player_sessions_output
    ?player_sessions:(player_sessions_ : player_session_list option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({ player_sessions = player_sessions_; next_token = next_token_ }
    : describe_player_sessions_output)

let make_describe_player_sessions_input
    ?game_session_id:(game_session_id_ : arn_string_model option)
    ?player_id:(player_id_ : player_id option)
    ?player_session_id:(player_session_id_ : player_session_id option)
    ?player_session_status_filter:(player_session_status_filter_ : non_zero_and_max_string option)
    ?limit:(limit_ : positive_integer option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({
     game_session_id = game_session_id_;
     player_id = player_id_;
     player_session_id = player_session_id_;
     player_session_status_filter = player_session_status_filter_;
     limit = limit_;
     next_token = next_token_;
   }
    : describe_player_sessions_input)

let make_describe_runtime_configuration_output
    ?runtime_configuration:(runtime_configuration_ : runtime_configuration option) () =
  ({ runtime_configuration = runtime_configuration_ } : describe_runtime_configuration_output)

let make_describe_runtime_configuration_input ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({ fleet_id = fleet_id_ } : describe_runtime_configuration_input)

let make_target_configuration ~target_value:(target_value_ : double) () =
  ({ target_value = target_value_ } : target_configuration)

let make_scaling_policy ?fleet_id:(fleet_id_ : fleet_id option)
    ?fleet_arn:(fleet_arn_ : fleet_arn option) ?name:(name_ : non_zero_and_max_string option)
    ?status:(status_ : scaling_status_type option)
    ?scaling_adjustment:(scaling_adjustment_ : integer option)
    ?scaling_adjustment_type:(scaling_adjustment_type_ : scaling_adjustment_type option)
    ?comparison_operator:(comparison_operator_ : comparison_operator_type option)
    ?threshold:(threshold_ : double option)
    ?evaluation_periods:(evaluation_periods_ : positive_integer option)
    ?metric_name:(metric_name_ : metric_name option)
    ?policy_type:(policy_type_ : policy_type option)
    ?target_configuration:(target_configuration_ : target_configuration option)
    ?update_status:(update_status_ : location_update_status option)
    ?location:(location_ : location_string_model option) () =
  ({
     fleet_id = fleet_id_;
     fleet_arn = fleet_arn_;
     name = name_;
     status = status_;
     scaling_adjustment = scaling_adjustment_;
     scaling_adjustment_type = scaling_adjustment_type_;
     comparison_operator = comparison_operator_;
     threshold = threshold_;
     evaluation_periods = evaluation_periods_;
     metric_name = metric_name_;
     policy_type = policy_type_;
     target_configuration = target_configuration_;
     update_status = update_status_;
     location = location_;
   }
    : scaling_policy)

let make_describe_scaling_policies_output
    ?scaling_policies:(scaling_policies_ : scaling_policy_list option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({ scaling_policies = scaling_policies_; next_token = next_token_ }
    : describe_scaling_policies_output)

let make_describe_scaling_policies_input
    ?status_filter:(status_filter_ : scaling_status_type option)
    ?limit:(limit_ : positive_integer option)
    ?next_token:(next_token_ : non_zero_and_max_string option)
    ?location:(location_ : location_string_model option) ~fleet_id:(fleet_id_ : fleet_id_or_arn) ()
    =
  ({
     fleet_id = fleet_id_;
     status_filter = status_filter_;
     limit = limit_;
     next_token = next_token_;
     location = location_;
   }
    : describe_scaling_policies_input)

let make_describe_script_output ?script:(script_ : script option) () =
  ({ script = script_ } : describe_script_output)

let make_describe_script_input ~script_id:(script_id_ : script_id_or_arn) () =
  ({ script_id = script_id_ } : describe_script_input)

let make_describe_vpc_peering_authorizations_output
    ?vpc_peering_authorizations:
      (vpc_peering_authorizations_ : vpc_peering_authorization_list option) () =
  ({ vpc_peering_authorizations = vpc_peering_authorizations_ }
    : describe_vpc_peering_authorizations_output)

let make_describe_vpc_peering_authorizations_input () = (() : unit)

let make_vpc_peering_connection_status ?code:(code_ : non_zero_and_max_string option)
    ?message:(message_ : non_zero_and_max_string option) () =
  ({ code = code_; message = message_ } : vpc_peering_connection_status)

let make_vpc_peering_connection ?fleet_id:(fleet_id_ : fleet_id option)
    ?fleet_arn:(fleet_arn_ : fleet_arn option)
    ?ip_v4_cidr_block:(ip_v4_cidr_block_ : non_zero_and_max_string option)
    ?vpc_peering_connection_id:(vpc_peering_connection_id_ : non_zero_and_max_string option)
    ?status:(status_ : vpc_peering_connection_status option)
    ?peer_vpc_id:(peer_vpc_id_ : non_zero_and_max_string option)
    ?game_lift_vpc_id:(game_lift_vpc_id_ : non_zero_and_max_string option) () =
  ({
     fleet_id = fleet_id_;
     fleet_arn = fleet_arn_;
     ip_v4_cidr_block = ip_v4_cidr_block_;
     vpc_peering_connection_id = vpc_peering_connection_id_;
     status = status_;
     peer_vpc_id = peer_vpc_id_;
     game_lift_vpc_id = game_lift_vpc_id_;
   }
    : vpc_peering_connection)

let make_describe_vpc_peering_connections_output
    ?vpc_peering_connections:(vpc_peering_connections_ : vpc_peering_connection_list option) () =
  ({ vpc_peering_connections = vpc_peering_connections_ } : describe_vpc_peering_connections_output)

let make_describe_vpc_peering_connections_input ?fleet_id:(fleet_id_ : fleet_id option) () =
  ({ fleet_id = fleet_id_ } : describe_vpc_peering_connections_input)

let make_desired_player_session ?player_id:(player_id_ : player_id option)
    ?player_data:(player_data_ : player_data option) () =
  ({ player_id = player_id_; player_data = player_data_ } : desired_player_session)

let make_validate_matchmaking_rule_set_output ?valid:(valid_ : boolean_model option) () =
  ({ valid = valid_ } : validate_matchmaking_rule_set_output)

let make_validate_matchmaking_rule_set_input ~rule_set_body:(rule_set_body_ : rule_set_body) () =
  ({ rule_set_body = rule_set_body_ } : validate_matchmaking_rule_set_input)

let make_update_script_output ?script:(script_ : script option) () =
  ({ script = script_ } : update_script_output)

let make_update_script_input ?name:(name_ : non_zero_and_max_string option)
    ?version:(version_ : non_zero_and_max_string option)
    ?storage_location:(storage_location_ : s3_location option)
    ?zip_file:(zip_file_ : zip_blob option) ~script_id:(script_id_ : script_id_or_arn) () =
  ({
     script_id = script_id_;
     name = name_;
     version = version_;
     storage_location = storage_location_;
     zip_file = zip_file_;
   }
    : update_script_input)

let make_update_runtime_configuration_output
    ?runtime_configuration:(runtime_configuration_ : runtime_configuration option) () =
  ({ runtime_configuration = runtime_configuration_ } : update_runtime_configuration_output)

let make_update_runtime_configuration_input ~fleet_id:(fleet_id_ : fleet_id_or_arn)
    ~runtime_configuration:(runtime_configuration_ : runtime_configuration) () =
  ({ fleet_id = fleet_id_; runtime_configuration = runtime_configuration_ }
    : update_runtime_configuration_input)

let make_update_matchmaking_configuration_output
    ?configuration:(configuration_ : matchmaking_configuration option) () =
  ({ configuration = configuration_ } : update_matchmaking_configuration_output)

let make_update_matchmaking_configuration_input
    ?description:(description_ : non_zero_and_max_string option)
    ?game_session_queue_arns:(game_session_queue_arns_ : queue_arns_list option)
    ?request_timeout_seconds:(request_timeout_seconds_ : matchmaking_request_timeout_integer option)
    ?acceptance_timeout_seconds:
      (acceptance_timeout_seconds_ : matchmaking_acceptance_timeout_integer option)
    ?acceptance_required:(acceptance_required_ : boolean_model option)
    ?rule_set_name:(rule_set_name_ : matchmaking_rule_set_name option)
    ?notification_target:(notification_target_ : sns_arn_string_model option)
    ?additional_player_count:(additional_player_count_ : whole_number option)
    ?custom_event_data:(custom_event_data_ : custom_event_data option)
    ?game_properties:(game_properties_ : game_property_list option)
    ?game_session_data:(game_session_data_ : game_session_data option)
    ?backfill_mode:(backfill_mode_ : backfill_mode option)
    ?flex_match_mode:(flex_match_mode_ : flex_match_mode option)
    ~name:(name_ : matchmaking_configuration_name) () =
  ({
     name = name_;
     description = description_;
     game_session_queue_arns = game_session_queue_arns_;
     request_timeout_seconds = request_timeout_seconds_;
     acceptance_timeout_seconds = acceptance_timeout_seconds_;
     acceptance_required = acceptance_required_;
     rule_set_name = rule_set_name_;
     notification_target = notification_target_;
     additional_player_count = additional_player_count_;
     custom_event_data = custom_event_data_;
     game_properties = game_properties_;
     game_session_data = game_session_data_;
     backfill_mode = backfill_mode_;
     flex_match_mode = flex_match_mode_;
   }
    : update_matchmaking_configuration_input)

let make_update_game_session_queue_output
    ?game_session_queue:(game_session_queue_ : game_session_queue option) () =
  ({ game_session_queue = game_session_queue_ } : update_game_session_queue_output)

let make_update_game_session_queue_input
    ?timeout_in_seconds:(timeout_in_seconds_ : whole_number option)
    ?player_latency_policies:(player_latency_policies_ : player_latency_policy_list option)
    ?destinations:(destinations_ : game_session_queue_destination_list option)
    ?filter_configuration:(filter_configuration_ : filter_configuration option)
    ?priority_configuration:(priority_configuration_ : priority_configuration option)
    ?custom_event_data:(custom_event_data_ : queue_custom_event_data option)
    ?notification_target:(notification_target_ : queue_sns_arn_string_model option)
    ~name:(name_ : game_session_queue_name_or_arn) () =
  ({
     name = name_;
     timeout_in_seconds = timeout_in_seconds_;
     player_latency_policies = player_latency_policies_;
     destinations = destinations_;
     filter_configuration = filter_configuration_;
     priority_configuration = priority_configuration_;
     custom_event_data = custom_event_data_;
     notification_target = notification_target_;
   }
    : update_game_session_queue_input)

let make_update_game_session_output ?game_session:(game_session_ : game_session option) () =
  ({ game_session = game_session_ } : update_game_session_output)

let make_update_game_session_input
    ?maximum_player_session_count:(maximum_player_session_count_ : whole_number option)
    ?name:(name_ : non_zero_and_max_string option)
    ?player_session_creation_policy:
      (player_session_creation_policy_ : player_session_creation_policy option)
    ?protection_policy:(protection_policy_ : protection_policy option)
    ?game_properties:(game_properties_ : game_property_list option)
    ~game_session_id:(game_session_id_ : arn_string_model) () =
  ({
     game_session_id = game_session_id_;
     maximum_player_session_count = maximum_player_session_count_;
     name = name_;
     player_session_creation_policy = player_session_creation_policy_;
     protection_policy = protection_policy_;
     game_properties = game_properties_;
   }
    : update_game_session_input)

let make_update_game_server_group_output
    ?game_server_group:(game_server_group_ : game_server_group option) () =
  ({ game_server_group = game_server_group_ } : update_game_server_group_output)

let make_update_game_server_group_input ?role_arn:(role_arn_ : iam_role_arn option)
    ?instance_definitions:(instance_definitions_ : instance_definitions option)
    ?game_server_protection_policy:
      (game_server_protection_policy_ : game_server_protection_policy option)
    ?balancing_strategy:(balancing_strategy_ : balancing_strategy option)
    ~game_server_group_name:(game_server_group_name_ : game_server_group_name_or_arn) () =
  ({
     game_server_group_name = game_server_group_name_;
     role_arn = role_arn_;
     instance_definitions = instance_definitions_;
     game_server_protection_policy = game_server_protection_policy_;
     balancing_strategy = balancing_strategy_;
   }
    : update_game_server_group_input)

let make_update_game_server_output ?game_server:(game_server_ : game_server option) () =
  ({ game_server = game_server_ } : update_game_server_output)

let make_update_game_server_input ?game_server_data:(game_server_data_ : game_server_data option)
    ?utilization_status:(utilization_status_ : game_server_utilization_status option)
    ?health_check:(health_check_ : game_server_health_check option)
    ~game_server_group_name:(game_server_group_name_ : game_server_group_name_or_arn)
    ~game_server_id:(game_server_id_ : game_server_id) () =
  ({
     game_server_group_name = game_server_group_name_;
     game_server_id = game_server_id_;
     game_server_data = game_server_data_;
     utilization_status = utilization_status_;
     health_check = health_check_;
   }
    : update_game_server_input)

let make_update_fleet_port_settings_output ?fleet_id:(fleet_id_ : fleet_id option)
    ?fleet_arn:(fleet_arn_ : fleet_arn option) () =
  ({ fleet_id = fleet_id_; fleet_arn = fleet_arn_ } : update_fleet_port_settings_output)

let make_update_fleet_port_settings_input
    ?inbound_permission_authorizations:
      (inbound_permission_authorizations_ : ip_permissions_list option)
    ?inbound_permission_revocations:(inbound_permission_revocations_ : ip_permissions_list option)
    ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({
     fleet_id = fleet_id_;
     inbound_permission_authorizations = inbound_permission_authorizations_;
     inbound_permission_revocations = inbound_permission_revocations_;
   }
    : update_fleet_port_settings_input)

let make_update_fleet_capacity_output ?fleet_id:(fleet_id_ : fleet_id option)
    ?fleet_arn:(fleet_arn_ : fleet_arn option) ?location:(location_ : location_string_model option)
    ?managed_capacity_configuration:
      (managed_capacity_configuration_ : managed_capacity_configuration option) () =
  ({
     fleet_id = fleet_id_;
     fleet_arn = fleet_arn_;
     location = location_;
     managed_capacity_configuration = managed_capacity_configuration_;
   }
    : update_fleet_capacity_output)

let make_update_fleet_capacity_input ?desired_instances:(desired_instances_ : whole_number option)
    ?min_size:(min_size_ : whole_number option) ?max_size:(max_size_ : whole_number option)
    ?location:(location_ : location_string_model option)
    ?managed_capacity_configuration:
      (managed_capacity_configuration_ : managed_capacity_configuration option)
    ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({
     fleet_id = fleet_id_;
     desired_instances = desired_instances_;
     min_size = min_size_;
     max_size = max_size_;
     location = location_;
     managed_capacity_configuration = managed_capacity_configuration_;
   }
    : update_fleet_capacity_input)

let make_update_fleet_attributes_output ?fleet_id:(fleet_id_ : fleet_id option)
    ?fleet_arn:(fleet_arn_ : fleet_arn option) () =
  ({ fleet_id = fleet_id_; fleet_arn = fleet_arn_ } : update_fleet_attributes_output)

let make_update_fleet_attributes_input ?name:(name_ : non_zero_and_max_string option)
    ?description:(description_ : non_zero_and_max_string option)
    ?new_game_session_protection_policy:
      (new_game_session_protection_policy_ : protection_policy option)
    ?resource_creation_limit_policy:
      (resource_creation_limit_policy_ : resource_creation_limit_policy option)
    ?metric_groups:(metric_groups_ : metric_group_list option)
    ?anywhere_configuration:(anywhere_configuration_ : anywhere_configuration option)
    ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({
     fleet_id = fleet_id_;
     name = name_;
     description = description_;
     new_game_session_protection_policy = new_game_session_protection_policy_;
     resource_creation_limit_policy = resource_creation_limit_policy_;
     metric_groups = metric_groups_;
     anywhere_configuration = anywhere_configuration_;
   }
    : update_fleet_attributes_input)

let make_update_container_group_definition_output
    ?container_group_definition:(container_group_definition_ : container_group_definition option) ()
    =
  ({ container_group_definition = container_group_definition_ }
    : update_container_group_definition_output)

let make_update_container_group_definition_input
    ?game_server_container_definition:
      (game_server_container_definition_ : game_server_container_definition_input option)
    ?support_container_definitions:
      (support_container_definitions_ : support_container_definition_input_list option)
    ?total_memory_limit_mebibytes:
      (total_memory_limit_mebibytes_ : container_total_memory_limit option)
    ?total_vcpu_limit:(total_vcpu_limit_ : container_total_vcpu_limit option)
    ?version_description:(version_description_ : non_zero_and_max_string option)
    ?source_version_number:(source_version_number_ : positive_integer option)
    ?operating_system:(operating_system_ : container_operating_system option)
    ~name:(name_ : container_group_definition_name_or_arn) () =
  ({
     name = name_;
     game_server_container_definition = game_server_container_definition_;
     support_container_definitions = support_container_definitions_;
     total_memory_limit_mebibytes = total_memory_limit_mebibytes_;
     total_vcpu_limit = total_vcpu_limit_;
     version_description = version_description_;
     source_version_number = source_version_number_;
     operating_system = operating_system_;
   }
    : update_container_group_definition_input)

let make_update_container_fleet_output ?container_fleet:(container_fleet_ : container_fleet option)
    () =
  ({ container_fleet = container_fleet_ } : update_container_fleet_output)

let make_update_container_fleet_input
    ?game_server_container_group_definition_name:
      (game_server_container_group_definition_name_ : container_group_definition_name_or_arn option)
    ?per_instance_container_group_definition_name:
      (per_instance_container_group_definition_name_ : container_group_definition_name_or_arn option)
    ?game_server_container_groups_per_instance:
      (game_server_container_groups_per_instance_ : game_server_container_groups_per_instance option)
    ?instance_connection_port_range:(instance_connection_port_range_ : connection_port_range option)
    ?instance_inbound_permission_authorizations:
      (instance_inbound_permission_authorizations_ : ip_permissions_list option)
    ?instance_inbound_permission_revocations:
      (instance_inbound_permission_revocations_ : ip_permissions_list option)
    ?deployment_configuration:(deployment_configuration_ : deployment_configuration option)
    ?description:(description_ : non_zero_and_max_string option)
    ?metric_groups:(metric_groups_ : metric_group_list option)
    ?new_game_session_protection_policy:
      (new_game_session_protection_policy_ : protection_policy option)
    ?game_session_creation_limit_policy:
      (game_session_creation_limit_policy_ : game_session_creation_limit_policy option)
    ?log_configuration:(log_configuration_ : log_configuration option)
    ?remove_attributes:(remove_attributes_ : container_fleet_remove_attribute_list option)
    ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({
     fleet_id = fleet_id_;
     game_server_container_group_definition_name = game_server_container_group_definition_name_;
     per_instance_container_group_definition_name = per_instance_container_group_definition_name_;
     game_server_container_groups_per_instance = game_server_container_groups_per_instance_;
     instance_connection_port_range = instance_connection_port_range_;
     instance_inbound_permission_authorizations = instance_inbound_permission_authorizations_;
     instance_inbound_permission_revocations = instance_inbound_permission_revocations_;
     deployment_configuration = deployment_configuration_;
     description = description_;
     metric_groups = metric_groups_;
     new_game_session_protection_policy = new_game_session_protection_policy_;
     game_session_creation_limit_policy = game_session_creation_limit_policy_;
     log_configuration = log_configuration_;
     remove_attributes = remove_attributes_;
   }
    : update_container_fleet_input)

let make_update_build_output ?build:(build_ : build option) () =
  ({ build = build_ } : update_build_output)

let make_update_build_input ?name:(name_ : non_zero_and_max_string option)
    ?version:(version_ : non_zero_and_max_string option) ~build_id:(build_id_ : build_id_or_arn) ()
    =
  ({ build_id = build_id_; name = name_; version = version_ } : update_build_input)

let make_update_alias_output ?alias:(alias_ : alias option) () =
  ({ alias = alias_ } : update_alias_output)

let make_update_alias_input ?name:(name_ : non_blank_and_length_constraint_string option)
    ?description:(description_ : non_zero_and_max_string option)
    ?routing_strategy:(routing_strategy_ : routing_strategy option)
    ~alias_id:(alias_id_ : alias_id_or_arn) () =
  ({
     alias_id = alias_id_;
     name = name_;
     description = description_;
     routing_strategy = routing_strategy_;
   }
    : update_alias_input)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_ar_n = resource_ar_n_; tag_keys = tag_keys_ } : untag_resource_request)

let make_terminate_game_session_output ?game_session:(game_session_ : game_session option) () =
  ({ game_session = game_session_ } : terminate_game_session_output)

let make_terminate_game_session_input ~game_session_id:(game_session_id_ : arn_string_model)
    ~termination_mode:(termination_mode_ : termination_mode) () =
  ({ game_session_id = game_session_id_; termination_mode = termination_mode_ }
    : terminate_game_session_input)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name)
    ~tags:(tags_ : tag_list) () =
  ({ resource_ar_n = resource_ar_n_; tags = tags_ } : tag_resource_request)

let make_suspend_game_server_group_output
    ?game_server_group:(game_server_group_ : game_server_group option) () =
  ({ game_server_group = game_server_group_ } : suspend_game_server_group_output)

let make_suspend_game_server_group_input
    ~game_server_group_name:(game_server_group_name_ : game_server_group_name_or_arn)
    ~suspend_actions:(suspend_actions_ : game_server_group_actions) () =
  ({ game_server_group_name = game_server_group_name_; suspend_actions = suspend_actions_ }
    : suspend_game_server_group_input)

let make_stop_matchmaking_output () = (() : unit)

let make_stop_matchmaking_input ~ticket_id:(ticket_id_ : matchmaking_id_string_model) () =
  ({ ticket_id = ticket_id_ } : stop_matchmaking_input)

let make_stop_game_session_placement_output
    ?game_session_placement:(game_session_placement_ : game_session_placement option) () =
  ({ game_session_placement = game_session_placement_ } : stop_game_session_placement_output)

let make_stop_game_session_placement_input ~placement_id:(placement_id_ : id_string_model) () =
  ({ placement_id = placement_id_ } : stop_game_session_placement_input)

let make_stop_fleet_actions_output ?fleet_id:(fleet_id_ : fleet_id option)
    ?fleet_arn:(fleet_arn_ : fleet_arn option) () =
  ({ fleet_id = fleet_id_; fleet_arn = fleet_arn_ } : stop_fleet_actions_output)

let make_stop_fleet_actions_input ?location:(location_ : location_string_model option)
    ~fleet_id:(fleet_id_ : fleet_id_or_arn) ~actions:(actions_ : fleet_action_list) () =
  ({ fleet_id = fleet_id_; actions = actions_; location = location_ } : stop_fleet_actions_input)

let make_start_matchmaking_output
    ?matchmaking_ticket:(matchmaking_ticket_ : matchmaking_ticket option) () =
  ({ matchmaking_ticket = matchmaking_ticket_ } : start_matchmaking_output)

let make_start_matchmaking_input ?ticket_id:(ticket_id_ : matchmaking_id_string_model option)
    ~configuration_name:(configuration_name_ : matchmaking_configuration_name)
    ~players:(players_ : player_list) () =
  ({ ticket_id = ticket_id_; configuration_name = configuration_name_; players = players_ }
    : start_matchmaking_input)

let make_start_match_backfill_output
    ?matchmaking_ticket:(matchmaking_ticket_ : matchmaking_ticket option) () =
  ({ matchmaking_ticket = matchmaking_ticket_ } : start_match_backfill_output)

let make_start_match_backfill_input ?ticket_id:(ticket_id_ : matchmaking_id_string_model option)
    ?game_session_arn:(game_session_arn_ : arn_string_model option)
    ~configuration_name:(configuration_name_ : matchmaking_configuration_name)
    ~players:(players_ : player_list) () =
  ({
     ticket_id = ticket_id_;
     configuration_name = configuration_name_;
     game_session_arn = game_session_arn_;
     players = players_;
   }
    : start_match_backfill_input)

let make_start_game_session_placement_output
    ?game_session_placement:(game_session_placement_ : game_session_placement option) () =
  ({ game_session_placement = game_session_placement_ } : start_game_session_placement_output)

let make_start_game_session_placement_input
    ?game_properties:(game_properties_ : game_property_list option)
    ?game_session_name:(game_session_name_ : non_zero_and_max_string option)
    ?player_latencies:(player_latencies_ : player_latency_list option)
    ?desired_player_sessions:(desired_player_sessions_ : desired_player_session_list option)
    ?game_session_data:(game_session_data_ : large_game_session_data option)
    ?priority_configuration_override:
      (priority_configuration_override_ : priority_configuration_override option)
    ~placement_id:(placement_id_ : id_string_model)
    ~game_session_queue_name:(game_session_queue_name_ : game_session_queue_name_or_arn)
    ~maximum_player_session_count:(maximum_player_session_count_ : whole_number) () =
  ({
     placement_id = placement_id_;
     game_session_queue_name = game_session_queue_name_;
     game_properties = game_properties_;
     maximum_player_session_count = maximum_player_session_count_;
     game_session_name = game_session_name_;
     player_latencies = player_latencies_;
     desired_player_sessions = desired_player_sessions_;
     game_session_data = game_session_data_;
     priority_configuration_override = priority_configuration_override_;
   }
    : start_game_session_placement_input)

let make_start_fleet_actions_output ?fleet_id:(fleet_id_ : fleet_id option)
    ?fleet_arn:(fleet_arn_ : fleet_arn option) () =
  ({ fleet_id = fleet_id_; fleet_arn = fleet_arn_ } : start_fleet_actions_output)

let make_start_fleet_actions_input ?location:(location_ : location_string_model option)
    ~fleet_id:(fleet_id_ : fleet_id_or_arn) ~actions:(actions_ : fleet_action_list) () =
  ({ fleet_id = fleet_id_; actions = actions_; location = location_ } : start_fleet_actions_input)

let make_search_game_sessions_output ?game_sessions:(game_sessions_ : game_session_list option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({ game_sessions = game_sessions_; next_token = next_token_ } : search_game_sessions_output)

let make_search_game_sessions_input ?fleet_id:(fleet_id_ : fleet_id_or_arn option)
    ?alias_id:(alias_id_ : alias_id_or_arn option)
    ?location:(location_ : location_string_model option)
    ?filter_expression:(filter_expression_ : non_zero_and_max_string option)
    ?sort_expression:(sort_expression_ : non_zero_and_max_string option)
    ?limit:(limit_ : positive_integer option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({
     fleet_id = fleet_id_;
     alias_id = alias_id_;
     location = location_;
     filter_expression = filter_expression_;
     sort_expression = sort_expression_;
     limit = limit_;
     next_token = next_token_;
   }
    : search_game_sessions_input)

let make_resume_game_server_group_output
    ?game_server_group:(game_server_group_ : game_server_group option) () =
  ({ game_server_group = game_server_group_ } : resume_game_server_group_output)

let make_resume_game_server_group_input
    ~game_server_group_name:(game_server_group_name_ : game_server_group_name_or_arn)
    ~resume_actions:(resume_actions_ : game_server_group_actions) () =
  ({ game_server_group_name = game_server_group_name_; resume_actions = resume_actions_ }
    : resume_game_server_group_input)

let make_resolve_alias_output ?fleet_id:(fleet_id_ : fleet_id option)
    ?fleet_arn:(fleet_arn_ : fleet_arn option) () =
  ({ fleet_id = fleet_id_; fleet_arn = fleet_arn_ } : resolve_alias_output)

let make_resolve_alias_input ~alias_id:(alias_id_ : alias_id_or_arn) () =
  ({ alias_id = alias_id_ } : resolve_alias_input)

let make_request_upload_credentials_output
    ?upload_credentials:(upload_credentials_ : aws_credentials option)
    ?storage_location:(storage_location_ : s3_location option) () =
  ({ upload_credentials = upload_credentials_; storage_location = storage_location_ }
    : request_upload_credentials_output)

let make_request_upload_credentials_input ~build_id:(build_id_ : build_id_or_arn) () =
  ({ build_id = build_id_ } : request_upload_credentials_input)

let make_register_game_server_output ?game_server:(game_server_ : game_server option) () =
  ({ game_server = game_server_ } : register_game_server_output)

let make_register_game_server_input
    ?connection_info:(connection_info_ : game_server_connection_info option)
    ?game_server_data:(game_server_data_ : game_server_data option)
    ~game_server_group_name:(game_server_group_name_ : game_server_group_name_or_arn)
    ~game_server_id:(game_server_id_ : game_server_id)
    ~instance_id:(instance_id_ : game_server_instance_id) () =
  ({
     game_server_group_name = game_server_group_name_;
     game_server_id = game_server_id_;
     instance_id = instance_id_;
     connection_info = connection_info_;
     game_server_data = game_server_data_;
   }
    : register_game_server_input)

let make_register_compute_output ?compute:(compute_ : compute option) () =
  ({ compute = compute_ } : register_compute_output)

let make_register_compute_input
    ?certificate_path:(certificate_path_ : non_zero_and_max_string option)
    ?dns_name:(dns_name_ : dns_name_input option) ?ip_address:(ip_address_ : ip_address option)
    ?location:(location_ : location_string_model option) ~fleet_id:(fleet_id_ : fleet_id_or_arn)
    ~compute_name:(compute_name_ : compute_name) () =
  ({
     fleet_id = fleet_id_;
     compute_name = compute_name_;
     certificate_path = certificate_path_;
     dns_name = dns_name_;
     ip_address = ip_address_;
     location = location_;
   }
    : register_compute_input)

let make_put_scaling_policy_output ?name:(name_ : non_zero_and_max_string option) () =
  ({ name = name_ } : put_scaling_policy_output)

let make_put_scaling_policy_input ?scaling_adjustment:(scaling_adjustment_ : integer option)
    ?scaling_adjustment_type:(scaling_adjustment_type_ : scaling_adjustment_type option)
    ?threshold:(threshold_ : double option)
    ?comparison_operator:(comparison_operator_ : comparison_operator_type option)
    ?evaluation_periods:(evaluation_periods_ : positive_integer option)
    ?policy_type:(policy_type_ : policy_type option)
    ?target_configuration:(target_configuration_ : target_configuration option)
    ~name:(name_ : non_zero_and_max_string) ~fleet_id:(fleet_id_ : fleet_id_or_arn)
    ~metric_name:(metric_name_ : metric_name) () =
  ({
     name = name_;
     fleet_id = fleet_id_;
     scaling_adjustment = scaling_adjustment_;
     scaling_adjustment_type = scaling_adjustment_type_;
     threshold = threshold_;
     comparison_operator = comparison_operator_;
     evaluation_periods = evaluation_periods_;
     metric_name = metric_name_;
     policy_type = policy_type_;
     target_configuration = target_configuration_;
   }
    : put_scaling_policy_input)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)

let make_list_scripts_output ?scripts:(scripts_ : script_list option)
    ?next_token:(next_token_ : non_empty_string option) () =
  ({ scripts = scripts_; next_token = next_token_ } : list_scripts_output)

let make_list_scripts_input ?limit:(limit_ : positive_integer option)
    ?next_token:(next_token_ : non_empty_string option) () =
  ({ limit = limit_; next_token = next_token_ } : list_scripts_input)

let make_list_locations_output ?locations:(locations_ : location_model_list option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({ locations = locations_; next_token = next_token_ } : list_locations_output)

let make_list_locations_input ?filters:(filters_ : location_filter_list option)
    ?limit:(limit_ : list_locations_limit option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({ filters = filters_; limit = limit_; next_token = next_token_ } : list_locations_input)

let make_list_game_servers_output ?game_servers:(game_servers_ : game_servers option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({ game_servers = game_servers_; next_token = next_token_ } : list_game_servers_output)

let make_list_game_servers_input ?sort_order:(sort_order_ : sort_order option)
    ?limit:(limit_ : positive_integer option)
    ?next_token:(next_token_ : non_zero_and_max_string option)
    ~game_server_group_name:(game_server_group_name_ : game_server_group_name_or_arn) () =
  ({
     game_server_group_name = game_server_group_name_;
     sort_order = sort_order_;
     limit = limit_;
     next_token = next_token_;
   }
    : list_game_servers_input)

let make_list_game_server_groups_output
    ?game_server_groups:(game_server_groups_ : game_server_groups option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({ game_server_groups = game_server_groups_; next_token = next_token_ }
    : list_game_server_groups_output)

let make_list_game_server_groups_input ?limit:(limit_ : positive_integer option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({ limit = limit_; next_token = next_token_ } : list_game_server_groups_input)

let make_list_fleets_output ?fleet_ids:(fleet_ids_ : fleet_id_list option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({ fleet_ids = fleet_ids_; next_token = next_token_ } : list_fleets_output)

let make_list_fleets_input ?build_id:(build_id_ : build_id_or_arn option)
    ?script_id:(script_id_ : script_id_or_arn option) ?limit:(limit_ : positive_integer option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({ build_id = build_id_; script_id = script_id_; limit = limit_; next_token = next_token_ }
    : list_fleets_input)

let make_list_fleet_deployments_output
    ?fleet_deployments:(fleet_deployments_ : fleet_deployments option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({ fleet_deployments = fleet_deployments_; next_token = next_token_ }
    : list_fleet_deployments_output)

let make_list_fleet_deployments_input ?fleet_id:(fleet_id_ : fleet_id_or_arn option)
    ?limit:(limit_ : positive_integer option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({ fleet_id = fleet_id_; limit = limit_; next_token = next_token_ }
    : list_fleet_deployments_input)

let make_list_container_group_definition_versions_output
    ?container_group_definitions:
      (container_group_definitions_ : container_group_definition_list option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({ container_group_definitions = container_group_definitions_; next_token = next_token_ }
    : list_container_group_definition_versions_output)

let make_list_container_group_definition_versions_input
    ?limit:(limit_ : list_container_group_definition_versions_limit option)
    ?next_token:(next_token_ : non_zero_and_max_string option)
    ~name:(name_ : container_group_definition_name_or_arn) () =
  ({ name = name_; limit = limit_; next_token = next_token_ }
    : list_container_group_definition_versions_input)

let make_list_container_group_definitions_output
    ?container_group_definitions:
      (container_group_definitions_ : container_group_definition_list option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({ container_group_definitions = container_group_definitions_; next_token = next_token_ }
    : list_container_group_definitions_output)

let make_list_container_group_definitions_input
    ?container_group_type:(container_group_type_ : container_group_type option)
    ?limit:(limit_ : list_container_group_definitions_limit option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({ container_group_type = container_group_type_; limit = limit_; next_token = next_token_ }
    : list_container_group_definitions_input)

let make_list_container_fleets_output
    ?container_fleets:(container_fleets_ : container_fleet_list option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({ container_fleets = container_fleets_; next_token = next_token_ }
    : list_container_fleets_output)

let make_list_container_fleets_input
    ?container_group_definition_name:
      (container_group_definition_name_ : container_group_definition_name_or_arn option)
    ?limit:(limit_ : positive_integer option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({
     container_group_definition_name = container_group_definition_name_;
     limit = limit_;
     next_token = next_token_;
   }
    : list_container_fleets_input)

let make_list_compute_output ?compute_list:(compute_list_ : compute_list option)
    ?next_token:(next_token_ : non_zero_and_max_string option) () =
  ({ compute_list = compute_list_; next_token = next_token_ } : list_compute_output)

let make_list_compute_input ?location:(location_ : location_string_model option)
    ?container_group_definition_name:
      (container_group_definition_name_ : container_group_definition_name_or_arn option)
    ?compute_status:(compute_status_ : list_compute_input_status option)
    ?limit:(limit_ : positive_integer option)
    ?next_token:(next_token_ : non_zero_and_max_string option)
    ~fleet_id:(fleet_id_ : fleet_id_or_arn) () =
  ({
     fleet_id = fleet_id_;
     location = location_;
     container_group_definition_name = container_group_definition_name_;
     compute_status = compute_status_;
     limit = limit_;
     next_token = next_token_;
   }
    : list_compute_input)

let make_list_builds_output ?builds:(builds_ : build_list option)
    ?next_token:(next_token_ : non_empty_string option) () =
  ({ builds = builds_; next_token = next_token_ } : list_builds_output)

let make_list_builds_input ?status:(status_ : build_status option)
    ?limit:(limit_ : positive_integer option) ?next_token:(next_token_ : non_empty_string option) ()
    =
  ({ status = status_; limit = limit_; next_token = next_token_ } : list_builds_input)

let make_list_aliases_output ?aliases:(aliases_ : alias_list option)
    ?next_token:(next_token_ : non_empty_string option) () =
  ({ aliases = aliases_; next_token = next_token_ } : list_aliases_output)

let make_list_aliases_input
    ?routing_strategy_type:(routing_strategy_type_ : routing_strategy_type option)
    ?name:(name_ : non_empty_string option) ?limit:(limit_ : positive_integer option)
    ?next_token:(next_token_ : non_empty_string option) () =
  ({
     routing_strategy_type = routing_strategy_type_;
     name = name_;
     limit = limit_;
     next_token = next_token_;
   }
    : list_aliases_input)

let make_player_connection_endpoint ?ip_address:(ip_address_ : ip_address option)
    ?port:(port_ : port_number option) () =
  ({ ip_address = ip_address_; port = port_ } : player_connection_endpoint)

let make_player_connection_detail ?player_id:(player_id_ : player_id option)
    ?endpoints:(endpoints_ : player_connection_endpoint_list option)
    ?player_gateway_token:(player_gateway_token_ : max_string option)
    ?expiration:(expiration_ : timestamp option) () =
  ({
     player_id = player_id_;
     endpoints = endpoints_;
     player_gateway_token = player_gateway_token_;
     expiration = expiration_;
   }
    : player_connection_detail)

let make_get_player_connection_details_output
    ?game_session_id:(game_session_id_ : arn_string_model option)
    ?player_connection_details:(player_connection_details_ : player_connection_detail_list option)
    () =
  ({ game_session_id = game_session_id_; player_connection_details = player_connection_details_ }
    : get_player_connection_details_output)

let make_get_player_connection_details_input ~game_session_id:(game_session_id_ : arn_string_model)
    ~player_ids:(player_ids_ : player_id_list) () =
  ({ game_session_id = game_session_id_; player_ids = player_ids_ }
    : get_player_connection_details_input)

let make_instance_credentials ?user_name:(user_name_ : non_empty_string option)
    ?secret:(secret_ : non_empty_string option) () =
  ({ user_name = user_name_; secret = secret_ } : instance_credentials)

let make_instance_access ?fleet_id:(fleet_id_ : fleet_id option)
    ?instance_id:(instance_id_ : instance_id option) ?ip_address:(ip_address_ : ip_address option)
    ?operating_system:(operating_system_ : operating_system option)
    ?credentials:(credentials_ : instance_credentials option) () =
  ({
     fleet_id = fleet_id_;
     instance_id = instance_id_;
     ip_address = ip_address_;
     operating_system = operating_system_;
     credentials = credentials_;
   }
    : instance_access)

let make_get_instance_access_output ?instance_access:(instance_access_ : instance_access option) ()
    =
  ({ instance_access = instance_access_ } : get_instance_access_output)

let make_get_instance_access_input ~fleet_id:(fleet_id_ : fleet_id_or_arn)
    ~instance_id:(instance_id_ : instance_id) () =
  ({ fleet_id = fleet_id_; instance_id = instance_id_ } : get_instance_access_input)

let make_get_game_session_log_url_output
    ?pre_signed_url:(pre_signed_url_ : non_zero_and_max_string option) () =
  ({ pre_signed_url = pre_signed_url_ } : get_game_session_log_url_output)

let make_get_game_session_log_url_input ~game_session_id:(game_session_id_ : arn_string_model) () =
  ({ game_session_id = game_session_id_ } : get_game_session_log_url_input)

let make_get_compute_auth_token_output ?fleet_id:(fleet_id_ : fleet_id_or_arn option)
    ?fleet_arn:(fleet_arn_ : fleet_arn option)
    ?compute_name:(compute_name_ : compute_name_or_arn option)
    ?compute_arn:(compute_arn_ : compute_arn option)
    ?auth_token:(auth_token_ : compute_auth_token option)
    ?expiration_timestamp:(expiration_timestamp_ : timestamp option) () =
  ({
     fleet_id = fleet_id_;
     fleet_arn = fleet_arn_;
     compute_name = compute_name_;
     compute_arn = compute_arn_;
     auth_token = auth_token_;
     expiration_timestamp = expiration_timestamp_;
   }
    : get_compute_auth_token_output)

let make_get_compute_auth_token_input ~fleet_id:(fleet_id_ : fleet_id_or_arn)
    ~compute_name:(compute_name_ : compute_name_or_arn) () =
  ({ fleet_id = fleet_id_; compute_name = compute_name_ } : get_compute_auth_token_input)

let make_get_compute_access_output ?fleet_id:(fleet_id_ : fleet_id_or_arn option)
    ?fleet_arn:(fleet_arn_ : fleet_arn option)
    ?compute_name:(compute_name_ : compute_name_or_arn option)
    ?compute_arn:(compute_arn_ : compute_arn option)
    ?credentials:(credentials_ : aws_credentials option) ?target:(target_ : session_target option)
    ?container_identifiers:(container_identifiers_ : container_identifier_list option) () =
  ({
     fleet_id = fleet_id_;
     fleet_arn = fleet_arn_;
     compute_name = compute_name_;
     compute_arn = compute_arn_;
     credentials = credentials_;
     target = target_;
     container_identifiers = container_identifiers_;
   }
    : get_compute_access_output)

let make_get_compute_access_input ~fleet_id:(fleet_id_ : fleet_id_or_arn)
    ~compute_name:(compute_name_ : compute_name_or_arn) () =
  ({ fleet_id = fleet_id_; compute_name = compute_name_ } : get_compute_access_input)
