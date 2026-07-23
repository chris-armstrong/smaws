open Types

let make_accelerator_count_request ?min:(min_ : boxed_integer option)
    ?max:(max_ : boxed_integer option) () =
  ({ min = min_; max = max_ } : accelerator_count_request)

let make_accelerator_total_memory_mi_b_request ?min:(min_ : boxed_integer option)
    ?max:(max_ : boxed_integer option) () =
  ({ min = min_; max = max_ } : accelerator_total_memory_mi_b_request)

let make_advanced_configuration
    ?alternate_target_group_arn:(alternate_target_group_arn_ : string_ option)
    ?production_listener_rule:(production_listener_rule_ : string_ option)
    ?test_listener_rule:(test_listener_rule_ : string_ option)
    ?role_arn:(role_arn_ : string_ option) () =
  ({
     alternate_target_group_arn = alternate_target_group_arn_;
     production_listener_rule = production_listener_rule_;
     test_listener_rule = test_listener_rule_;
     role_arn = role_arn_;
   }
    : advanced_configuration)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_arn:(resource_arn_ : string_)
    ~tag_keys:(tag_keys_ : tag_keys) () =
  ({ resource_arn = resource_arn_; tag_keys = tag_keys_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag ?key:(key_ : tag_key option) ?value:(value_ : tag_value option) () =
  ({ key = key_; value = value_ } : tag)

let make_tag_resource_request ~resource_arn:(resource_arn_ : string_) ~tags:(tags_ : tags) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : tag_resource_request)

let make_setting ?name:(name_ : setting_name option) ?value:(value_ : string_ option)
    ?principal_arn:(principal_arn_ : string_ option) ?type_:(type__ : setting_type option) () =
  ({ name = name_; value = value_; principal_arn = principal_arn_; type_ = type__ } : setting)

let make_put_account_setting_default_response ?setting:(setting_ : setting option) () =
  ({ setting = setting_ } : put_account_setting_default_response)

let make_put_account_setting_default_request ~name:(name_ : setting_name) ~value:(value_ : string_)
    () =
  ({ name = name_; value = value_ } : put_account_setting_default_request)

let make_put_account_setting_response ?setting:(setting_ : setting option) () =
  ({ setting = setting_ } : put_account_setting_response)

let make_put_account_setting_request ?principal_arn:(principal_arn_ : string_ option)
    ~name:(name_ : setting_name) ~value:(value_ : string_) () =
  ({ name = name_; value = value_; principal_arn = principal_arn_ } : put_account_setting_request)

let make_list_task_definition_families_response ?families:(families_ : string_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ families = families_; next_token = next_token_ } : list_task_definition_families_response)

let make_list_task_definition_families_request ?family_prefix:(family_prefix_ : string_ option)
    ?status:(status_ : task_definition_family_status option)
    ?next_token:(next_token_ : string_ option) ?max_results:(max_results_ : boxed_integer option) ()
    =
  ({
     family_prefix = family_prefix_;
     status = status_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_task_definition_families_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tags option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : string_) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_list_services_by_namespace_response ?service_arns:(service_arns_ : string_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ service_arns = service_arns_; next_token = next_token_ } : list_services_by_namespace_response)

let make_list_services_by_namespace_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : boxed_integer option) ~namespace:(namespace_ : string_) () =
  ({ namespace = namespace_; next_token = next_token_; max_results = max_results_ }
    : list_services_by_namespace_request)

let make_list_account_settings_response ?settings:(settings_ : settings option)
    ?next_token:(next_token_ : string_ option) () =
  ({ settings = settings_; next_token = next_token_ } : list_account_settings_response)

let make_list_account_settings_request ?name:(name_ : setting_name option)
    ?value:(value_ : string_ option) ?principal_arn:(principal_arn_ : string_ option)
    ?effective_settings:(effective_settings_ : boolean_ option)
    ?next_token:(next_token_ : string_ option) ?max_results:(max_results_ : integer option) () =
  ({
     name = name_;
     value = value_;
     principal_arn = principal_arn_;
     effective_settings = effective_settings_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_account_settings_request)

let make_discover_poll_endpoint_response ?endpoint:(endpoint_ : string_ option)
    ?telemetry_endpoint:(telemetry_endpoint_ : string_ option)
    ?service_connect_endpoint:(service_connect_endpoint_ : string_ option) () =
  ({
     endpoint = endpoint_;
     telemetry_endpoint = telemetry_endpoint_;
     service_connect_endpoint = service_connect_endpoint_;
   }
    : discover_poll_endpoint_response)

let make_discover_poll_endpoint_request ?container_instance:(container_instance_ : string_ option)
    ?cluster:(cluster_ : string_ option) () =
  ({ container_instance = container_instance_; cluster = cluster_ }
    : discover_poll_endpoint_request)

let make_ephemeral_storage ~size_in_gi_b:(size_in_gi_b_ : integer) () =
  ({ size_in_gi_b = size_in_gi_b_ } : ephemeral_storage)

let make_key_value_pair ?name:(name_ : string_ option) ?value:(value_ : string_ option) () =
  ({ name = name_; value = value_ } : key_value_pair)

let make_proxy_configuration ?type_:(type__ : proxy_configuration_type option)
    ?properties:(properties_ : proxy_configuration_properties option)
    ~container_name:(container_name_ : string_) () =
  ({ type_ = type__; container_name = container_name_; properties = properties_ }
    : proxy_configuration)

let make_inference_accelerator ~device_name:(device_name_ : string_)
    ~device_type:(device_type_ : string_) () =
  ({ device_name = device_name_; device_type = device_type_ } : inference_accelerator)

let make_runtime_platform ?cpu_architecture:(cpu_architecture_ : cpu_architecture option)
    ?operating_system_family:(operating_system_family_ : os_family option) () =
  ({ cpu_architecture = cpu_architecture_; operating_system_family = operating_system_family_ }
    : runtime_platform)

let make_task_definition_placement_constraint
    ?type_:(type__ : task_definition_placement_constraint_type option)
    ?expression:(expression_ : string_ option) () =
  ({ type_ = type__; expression = expression_ } : task_definition_placement_constraint)

let make_attribute ?value:(value_ : string_ option) ?target_type:(target_type_ : target_type option)
    ?target_id:(target_id_ : string_ option) ~name:(name_ : string_) () =
  ({ name = name_; value = value_; target_type = target_type_; target_id = target_id_ } : attribute)

let make_f_sx_windows_file_server_authorization_config
    ~credentials_parameter:(credentials_parameter_ : string_) ~domain:(domain_ : string_) () =
  ({ credentials_parameter = credentials_parameter_; domain = domain_ }
    : f_sx_windows_file_server_authorization_config)

let make_f_sx_windows_file_server_volume_configuration ~file_system_id:(file_system_id_ : string_)
    ~root_directory:(root_directory_ : string_)
    ~authorization_config:(authorization_config_ : f_sx_windows_file_server_authorization_config) ()
    =
  ({
     file_system_id = file_system_id_;
     root_directory = root_directory_;
     authorization_config = authorization_config_;
   }
    : f_sx_windows_file_server_volume_configuration)

let make_s3_files_volume_configuration ?root_directory:(root_directory_ : string_ option)
    ?transit_encryption_port:(transit_encryption_port_ : boxed_integer option)
    ?access_point_arn:(access_point_arn_ : string_ option)
    ~file_system_arn:(file_system_arn_ : string_) () =
  ({
     file_system_arn = file_system_arn_;
     root_directory = root_directory_;
     transit_encryption_port = transit_encryption_port_;
     access_point_arn = access_point_arn_;
   }
    : s3_files_volume_configuration)

let make_efs_authorization_config ?access_point_id:(access_point_id_ : string_ option)
    ?iam:(iam_ : efs_authorization_config_ia_m option) () =
  ({ access_point_id = access_point_id_; iam = iam_ } : efs_authorization_config)

let make_efs_volume_configuration ?root_directory:(root_directory_ : string_ option)
    ?transit_encryption:(transit_encryption_ : efs_transit_encryption option)
    ?transit_encryption_port:(transit_encryption_port_ : boxed_integer option)
    ?authorization_config:(authorization_config_ : efs_authorization_config option)
    ~file_system_id:(file_system_id_ : string_) () =
  ({
     file_system_id = file_system_id_;
     root_directory = root_directory_;
     transit_encryption = transit_encryption_;
     transit_encryption_port = transit_encryption_port_;
     authorization_config = authorization_config_;
   }
    : efs_volume_configuration)

let make_docker_volume_configuration ?scope:(scope_ : scope option)
    ?autoprovision:(autoprovision_ : boxed_boolean option) ?driver:(driver_ : string_ option)
    ?driver_opts:(driver_opts_ : string_map option) ?labels:(labels_ : string_map option) () =
  ({
     scope = scope_;
     autoprovision = autoprovision_;
     driver = driver_;
     driver_opts = driver_opts_;
     labels = labels_;
   }
    : docker_volume_configuration)

let make_host_volume_properties ?source_path:(source_path_ : string_ option) () =
  ({ source_path = source_path_ } : host_volume_properties)

let make_volume ?name:(name_ : string_ option) ?host:(host_ : host_volume_properties option)
    ?docker_volume_configuration:(docker_volume_configuration_ : docker_volume_configuration option)
    ?efs_volume_configuration:(efs_volume_configuration_ : efs_volume_configuration option)
    ?s3files_volume_configuration:
      (s3files_volume_configuration_ : s3_files_volume_configuration option)
    ?fsx_windows_file_server_volume_configuration:
      (fsx_windows_file_server_volume_configuration_ :
         f_sx_windows_file_server_volume_configuration option)
    ?configured_at_launch:(configured_at_launch_ : boxed_boolean option) () =
  ({
     name = name_;
     host = host_;
     docker_volume_configuration = docker_volume_configuration_;
     efs_volume_configuration = efs_volume_configuration_;
     s3files_volume_configuration = s3files_volume_configuration_;
     fsx_windows_file_server_volume_configuration = fsx_windows_file_server_volume_configuration_;
     configured_at_launch = configured_at_launch_;
   }
    : volume)

let make_firelens_configuration ?options:(options_ : firelens_configuration_options_map option)
    ~type_:(type__ : firelens_configuration_type) () =
  ({ type_ = type__; options = options_ } : firelens_configuration)

let make_resource_requirement ~value:(value_ : string_) ~type_:(type__ : resource_type) () =
  ({ value = value_; type_ = type__ } : resource_requirement)

let make_system_control ?namespace:(namespace_ : string_ option) ?value:(value_ : string_ option) ()
    =
  ({ namespace = namespace_; value = value_ } : system_control)

let make_health_check ?interval:(interval_ : boxed_integer option)
    ?timeout:(timeout_ : boxed_integer option) ?retries:(retries_ : boxed_integer option)
    ?start_period:(start_period_ : boxed_integer option) ~command:(command_ : string_list) () =
  ({
     command = command_;
     interval = interval_;
     timeout = timeout_;
     retries = retries_;
     start_period = start_period_;
   }
    : health_check)

let make_secret ~name:(name_ : string_) ~value_from:(value_from_ : string_) () =
  ({ name = name_; value_from = value_from_ } : secret)

let make_log_configuration ?options:(options_ : log_configuration_options_map option)
    ?secret_options:(secret_options_ : secret_list option) ~log_driver:(log_driver_ : log_driver) ()
    =
  ({ log_driver = log_driver_; options = options_; secret_options = secret_options_ }
    : log_configuration)

let make_ulimit ~name:(name_ : ulimit_name) ~soft_limit:(soft_limit_ : integer)
    ~hard_limit:(hard_limit_ : integer) () =
  ({ name = name_; soft_limit = soft_limit_; hard_limit = hard_limit_ } : ulimit)

let make_host_entry ~hostname:(hostname_ : string_) ~ip_address:(ip_address_ : string_) () =
  ({ hostname = hostname_; ip_address = ip_address_ } : host_entry)

let make_container_dependency ~container_name:(container_name_ : string_)
    ~condition:(condition_ : container_condition) () =
  ({ container_name = container_name_; condition = condition_ } : container_dependency)

let make_tmpfs ?mount_options:(mount_options_ : string_list option)
    ~container_path:(container_path_ : string_) ~size:(size_ : integer) () =
  ({ container_path = container_path_; size = size_; mount_options = mount_options_ } : tmpfs)

let make_device ?container_path:(container_path_ : string_ option)
    ?permissions:(permissions_ : device_cgroup_permissions option) ~host_path:(host_path_ : string_)
    () =
  ({ host_path = host_path_; container_path = container_path_; permissions = permissions_ }
    : device)

let make_kernel_capabilities ?add:(add_ : string_list option) ?drop:(drop_ : string_list option) ()
    =
  ({ add = add_; drop = drop_ } : kernel_capabilities)

let make_linux_parameters ?capabilities:(capabilities_ : kernel_capabilities option)
    ?devices:(devices_ : devices_list option)
    ?init_process_enabled:(init_process_enabled_ : boxed_boolean option)
    ?shared_memory_size:(shared_memory_size_ : boxed_integer option)
    ?tmpfs:(tmpfs_ : tmpfs_list option) ?max_swap:(max_swap_ : boxed_integer option)
    ?swappiness:(swappiness_ : boxed_integer option) () =
  ({
     capabilities = capabilities_;
     devices = devices_;
     init_process_enabled = init_process_enabled_;
     shared_memory_size = shared_memory_size_;
     tmpfs = tmpfs_;
     max_swap = max_swap_;
     swappiness = swappiness_;
   }
    : linux_parameters)

let make_volume_from ?source_container:(source_container_ : string_ option)
    ?read_only:(read_only_ : boxed_boolean option) () =
  ({ source_container = source_container_; read_only = read_only_ } : volume_from)

let make_mount_point ?source_volume:(source_volume_ : string_ option)
    ?container_path:(container_path_ : string_ option)
    ?read_only:(read_only_ : boxed_boolean option) () =
  ({ source_volume = source_volume_; container_path = container_path_; read_only = read_only_ }
    : mount_point)

let make_environment_file ~value:(value_ : string_) ~type_:(type__ : environment_file_type) () =
  ({ value = value_; type_ = type__ } : environment_file)

let make_container_restart_policy ?ignored_exit_codes:(ignored_exit_codes_ : integer_list option)
    ?restart_attempt_period:(restart_attempt_period_ : boxed_integer option)
    ~enabled:(enabled_ : boxed_boolean) () =
  ({
     enabled = enabled_;
     ignored_exit_codes = ignored_exit_codes_;
     restart_attempt_period = restart_attempt_period_;
   }
    : container_restart_policy)

let make_port_mapping ?container_port:(container_port_ : boxed_integer option)
    ?host_port:(host_port_ : boxed_integer option) ?protocol:(protocol_ : transport_protocol option)
    ?name:(name_ : string_ option) ?app_protocol:(app_protocol_ : application_protocol option)
    ?container_port_range:(container_port_range_ : string_ option) () =
  ({
     container_port = container_port_;
     host_port = host_port_;
     protocol = protocol_;
     name = name_;
     app_protocol = app_protocol_;
     container_port_range = container_port_range_;
   }
    : port_mapping)

let make_repository_credentials ~credentials_parameter:(credentials_parameter_ : string_) () =
  ({ credentials_parameter = credentials_parameter_ } : repository_credentials)

let make_container_definition ?name:(name_ : string_ option) ?image:(image_ : string_ option)
    ?repository_credentials:(repository_credentials_ : repository_credentials option)
    ?cpu:(cpu_ : integer option) ?memory:(memory_ : boxed_integer option)
    ?memory_reservation:(memory_reservation_ : boxed_integer option)
    ?links:(links_ : string_list option) ?port_mappings:(port_mappings_ : port_mapping_list option)
    ?essential:(essential_ : boxed_boolean option)
    ?restart_policy:(restart_policy_ : container_restart_policy option)
    ?entry_point:(entry_point_ : string_list option) ?command:(command_ : string_list option)
    ?environment:(environment_ : environment_variables option)
    ?environment_files:(environment_files_ : environment_files option)
    ?mount_points:(mount_points_ : mount_point_list option)
    ?volumes_from:(volumes_from_ : volume_from_list option)
    ?linux_parameters:(linux_parameters_ : linux_parameters option)
    ?secrets:(secrets_ : secret_list option)
    ?depends_on:(depends_on_ : container_dependencies option)
    ?start_timeout:(start_timeout_ : boxed_integer option)
    ?stop_timeout:(stop_timeout_ : boxed_integer option)
    ?version_consistency:(version_consistency_ : version_consistency option)
    ?hostname:(hostname_ : string_ option) ?user:(user_ : string_ option)
    ?working_directory:(working_directory_ : string_ option)
    ?disable_networking:(disable_networking_ : boxed_boolean option)
    ?privileged:(privileged_ : boxed_boolean option)
    ?readonly_root_filesystem:(readonly_root_filesystem_ : boxed_boolean option)
    ?dns_servers:(dns_servers_ : string_list option)
    ?dns_search_domains:(dns_search_domains_ : string_list option)
    ?extra_hosts:(extra_hosts_ : host_entry_list option)
    ?docker_security_options:(docker_security_options_ : string_list option)
    ?interactive:(interactive_ : boxed_boolean option)
    ?pseudo_terminal:(pseudo_terminal_ : boxed_boolean option)
    ?docker_labels:(docker_labels_ : docker_labels_map option)
    ?ulimits:(ulimits_ : ulimit_list option)
    ?log_configuration:(log_configuration_ : log_configuration option)
    ?health_check:(health_check_ : health_check option)
    ?system_controls:(system_controls_ : system_controls option)
    ?resource_requirements:(resource_requirements_ : resource_requirements option)
    ?firelens_configuration:(firelens_configuration_ : firelens_configuration option)
    ?credential_specs:(credential_specs_ : string_list option) () =
  ({
     name = name_;
     image = image_;
     repository_credentials = repository_credentials_;
     cpu = cpu_;
     memory = memory_;
     memory_reservation = memory_reservation_;
     links = links_;
     port_mappings = port_mappings_;
     essential = essential_;
     restart_policy = restart_policy_;
     entry_point = entry_point_;
     command = command_;
     environment = environment_;
     environment_files = environment_files_;
     mount_points = mount_points_;
     volumes_from = volumes_from_;
     linux_parameters = linux_parameters_;
     secrets = secrets_;
     depends_on = depends_on_;
     start_timeout = start_timeout_;
     stop_timeout = stop_timeout_;
     version_consistency = version_consistency_;
     hostname = hostname_;
     user = user_;
     working_directory = working_directory_;
     disable_networking = disable_networking_;
     privileged = privileged_;
     readonly_root_filesystem = readonly_root_filesystem_;
     dns_servers = dns_servers_;
     dns_search_domains = dns_search_domains_;
     extra_hosts = extra_hosts_;
     docker_security_options = docker_security_options_;
     interactive = interactive_;
     pseudo_terminal = pseudo_terminal_;
     docker_labels = docker_labels_;
     ulimits = ulimits_;
     log_configuration = log_configuration_;
     health_check = health_check_;
     system_controls = system_controls_;
     resource_requirements = resource_requirements_;
     firelens_configuration = firelens_configuration_;
     credential_specs = credential_specs_;
   }
    : container_definition)

let make_task_definition ?task_definition_arn:(task_definition_arn_ : string_ option)
    ?container_definitions:(container_definitions_ : container_definitions option)
    ?family:(family_ : string_ option) ?task_role_arn:(task_role_arn_ : string_ option)
    ?execution_role_arn:(execution_role_arn_ : string_ option)
    ?network_mode:(network_mode_ : network_mode option) ?revision:(revision_ : integer option)
    ?volumes:(volumes_ : volume_list option) ?status:(status_ : task_definition_status option)
    ?requires_attributes:(requires_attributes_ : requires_attributes option)
    ?placement_constraints:(placement_constraints_ : task_definition_placement_constraints option)
    ?compatibilities:(compatibilities_ : compatibility_list option)
    ?runtime_platform:(runtime_platform_ : runtime_platform option)
    ?requires_compatibilities:(requires_compatibilities_ : compatibility_list option)
    ?cpu:(cpu_ : string_ option) ?memory:(memory_ : string_ option)
    ?inference_accelerators:(inference_accelerators_ : inference_accelerators option)
    ?pid_mode:(pid_mode_ : pid_mode option) ?ipc_mode:(ipc_mode_ : ipc_mode option)
    ?proxy_configuration:(proxy_configuration_ : proxy_configuration option)
    ?registered_at:(registered_at_ : timestamp option)
    ?deregistered_at:(deregistered_at_ : timestamp option)
    ?delete_requested_at:(delete_requested_at_ : timestamp option)
    ?registered_by:(registered_by_ : string_ option)
    ?ephemeral_storage:(ephemeral_storage_ : ephemeral_storage option)
    ?enable_fault_injection:(enable_fault_injection_ : boxed_boolean option) () =
  ({
     task_definition_arn = task_definition_arn_;
     container_definitions = container_definitions_;
     family = family_;
     task_role_arn = task_role_arn_;
     execution_role_arn = execution_role_arn_;
     network_mode = network_mode_;
     revision = revision_;
     volumes = volumes_;
     status = status_;
     requires_attributes = requires_attributes_;
     placement_constraints = placement_constraints_;
     compatibilities = compatibilities_;
     runtime_platform = runtime_platform_;
     requires_compatibilities = requires_compatibilities_;
     cpu = cpu_;
     memory = memory_;
     inference_accelerators = inference_accelerators_;
     pid_mode = pid_mode_;
     ipc_mode = ipc_mode_;
     proxy_configuration = proxy_configuration_;
     registered_at = registered_at_;
     deregistered_at = deregistered_at_;
     delete_requested_at = delete_requested_at_;
     registered_by = registered_by_;
     ephemeral_storage = ephemeral_storage_;
     enable_fault_injection = enable_fault_injection_;
   }
    : task_definition)

let make_describe_task_definition_response
    ?task_definition:(task_definition_ : task_definition option) ?tags:(tags_ : tags option) () =
  ({ task_definition = task_definition_; tags = tags_ } : describe_task_definition_response)

let make_describe_task_definition_request ?include_:(include__ : task_definition_field_list option)
    ~task_definition:(task_definition_ : string_) () =
  ({ task_definition = task_definition_; include_ = include__ } : describe_task_definition_request)

let make_deregister_task_definition_response
    ?task_definition:(task_definition_ : task_definition option) () =
  ({ task_definition = task_definition_ } : deregister_task_definition_response)

let make_deregister_task_definition_request ~task_definition:(task_definition_ : string_) () =
  ({ task_definition = task_definition_ } : deregister_task_definition_request)

let make_delete_account_setting_response ?setting:(setting_ : setting option) () =
  ({ setting = setting_ } : delete_account_setting_response)

let make_delete_account_setting_request ?principal_arn:(principal_arn_ : string_ option)
    ~name:(name_ : setting_name) () =
  ({ name = name_; principal_arn = principal_arn_ } : delete_account_setting_request)

let make_continue_service_deployment_response
    ?service_deployment_arn:(service_deployment_arn_ : string_ option) () =
  ({ service_deployment_arn = service_deployment_arn_ } : continue_service_deployment_response)

let make_continue_service_deployment_request
    ?action:(action_ : deployment_lifecycle_hook_action option)
    ~service_deployment_arn:(service_deployment_arn_ : string_) ~hook_id:(hook_id_ : string_) () =
  ({ service_deployment_arn = service_deployment_arn_; hook_id = hook_id_; action = action_ }
    : continue_service_deployment_request)

let make_attachment ?id:(id_ : string_ option) ?type_:(type__ : string_ option)
    ?status:(status_ : string_ option) ?details:(details_ : attachment_details option) () =
  ({ id = id_; type_ = type__; status = status_; details = details_ } : attachment)

let make_attachment_state_change ~attachment_arn:(attachment_arn_ : string_)
    ~status:(status_ : string_) () =
  ({ attachment_arn = attachment_arn_; status = status_ } : attachment_state_change)

let make_auto_repair_configuration
    ?actions_status:(actions_status_ : auto_repair_actions_status option) () =
  ({ actions_status = actions_status_ } : auto_repair_configuration)

let make_managed_scaling ?status:(status_ : managed_scaling_status option)
    ?target_capacity:(target_capacity_ : managed_scaling_target_capacity option)
    ?minimum_scaling_step_size:(minimum_scaling_step_size_ : managed_scaling_step_size option)
    ?maximum_scaling_step_size:(maximum_scaling_step_size_ : managed_scaling_step_size option)
    ?instance_warmup_period:
      (instance_warmup_period_ : managed_scaling_instance_warmup_period option) () =
  ({
     status = status_;
     target_capacity = target_capacity_;
     minimum_scaling_step_size = minimum_scaling_step_size_;
     maximum_scaling_step_size = maximum_scaling_step_size_;
     instance_warmup_period = instance_warmup_period_;
   }
    : managed_scaling)

let make_auto_scaling_group_provider ?managed_scaling:(managed_scaling_ : managed_scaling option)
    ?managed_termination_protection:
      (managed_termination_protection_ : managed_termination_protection option)
    ?managed_draining:(managed_draining_ : managed_draining option)
    ~auto_scaling_group_arn:(auto_scaling_group_arn_ : string_) () =
  ({
     auto_scaling_group_arn = auto_scaling_group_arn_;
     managed_scaling = managed_scaling_;
     managed_termination_protection = managed_termination_protection_;
     managed_draining = managed_draining_;
   }
    : auto_scaling_group_provider)

let make_auto_scaling_group_provider_update
    ?managed_scaling:(managed_scaling_ : managed_scaling option)
    ?managed_termination_protection:
      (managed_termination_protection_ : managed_termination_protection option)
    ?managed_draining:(managed_draining_ : managed_draining option) () =
  ({
     managed_scaling = managed_scaling_;
     managed_termination_protection = managed_termination_protection_;
     managed_draining = managed_draining_;
   }
    : auto_scaling_group_provider_update)

let make_aws_vpc_configuration ?security_groups:(security_groups_ : string_list option)
    ?assign_public_ip:(assign_public_ip_ : assign_public_ip option)
    ~subnets:(subnets_ : string_list) () =
  ({ subnets = subnets_; security_groups = security_groups_; assign_public_ip = assign_public_ip_ }
    : aws_vpc_configuration)

let make_baseline_ebs_bandwidth_mbps_request ?min:(min_ : boxed_integer option)
    ?max:(max_ : boxed_integer option) () =
  ({ min = min_; max = max_ } : baseline_ebs_bandwidth_mbps_request)

let make_canary_configuration ?canary_percent:(canary_percent_ : double option)
    ?canary_bake_time_in_minutes:(canary_bake_time_in_minutes_ : integer option) () =
  ({ canary_percent = canary_percent_; canary_bake_time_in_minutes = canary_bake_time_in_minutes_ }
    : canary_configuration)

let make_infrastructure_optimization ?scale_in_after:(scale_in_after_ : boxed_integer option) () =
  ({ scale_in_after = scale_in_after_ } : infrastructure_optimization)

let make_capacity_reservation_request
    ?reservation_group_arn:(reservation_group_arn_ : string_ option)
    ?reservation_preference:(reservation_preference_ : capacity_reservation_preference option) () =
  ({
     reservation_group_arn = reservation_group_arn_;
     reservation_preference = reservation_preference_;
   }
    : capacity_reservation_request)

let make_network_bandwidth_gbps_request ?min:(min_ : boxed_double option)
    ?max:(max_ : boxed_double option) () =
  ({ min = min_; max = max_ } : network_bandwidth_gbps_request)

let make_total_local_storage_gb_request ?min:(min_ : boxed_double option)
    ?max:(max_ : boxed_double option) () =
  ({ min = min_; max = max_ } : total_local_storage_gb_request)

let make_network_interface_count_request ?min:(min_ : boxed_integer option)
    ?max:(max_ : boxed_integer option) () =
  ({ min = min_; max = max_ } : network_interface_count_request)

let make_memory_gi_b_per_v_cpu_request ?min:(min_ : boxed_double option)
    ?max:(max_ : boxed_double option) () =
  ({ min = min_; max = max_ } : memory_gi_b_per_v_cpu_request)

let make_memory_mi_b_request ?max:(max_ : boxed_integer option) ~min:(min_ : boxed_integer) () =
  ({ min = min_; max = max_ } : memory_mi_b_request)

let make_v_cpu_count_range_request ?max:(max_ : boxed_integer option) ~min:(min_ : boxed_integer) ()
    =
  ({ min = min_; max = max_ } : v_cpu_count_range_request)

let make_instance_requirements_request
    ?cpu_manufacturers:(cpu_manufacturers_ : cpu_manufacturer_set option)
    ?memory_gi_b_per_v_cpu:(memory_gi_b_per_v_cpu_ : memory_gi_b_per_v_cpu_request option)
    ?excluded_instance_types:(excluded_instance_types_ : excluded_instance_type_set option)
    ?instance_generations:(instance_generations_ : instance_generation_set option)
    ?spot_max_price_percentage_over_lowest_price:
      (spot_max_price_percentage_over_lowest_price_ : boxed_integer option)
    ?on_demand_max_price_percentage_over_lowest_price:
      (on_demand_max_price_percentage_over_lowest_price_ : boxed_integer option)
    ?bare_metal:(bare_metal_ : bare_metal option)
    ?burstable_performance:(burstable_performance_ : burstable_performance option)
    ?require_hibernate_support:(require_hibernate_support_ : boxed_boolean option)
    ?network_interface_count:(network_interface_count_ : network_interface_count_request option)
    ?local_storage:(local_storage_ : local_storage option)
    ?local_storage_types:(local_storage_types_ : local_storage_type_set option)
    ?total_local_storage_g_b:(total_local_storage_g_b_ : total_local_storage_gb_request option)
    ?baseline_ebs_bandwidth_mbps:
      (baseline_ebs_bandwidth_mbps_ : baseline_ebs_bandwidth_mbps_request option)
    ?accelerator_types:(accelerator_types_ : accelerator_type_set option)
    ?accelerator_count:(accelerator_count_ : accelerator_count_request option)
    ?accelerator_manufacturers:(accelerator_manufacturers_ : accelerator_manufacturer_set option)
    ?accelerator_names:(accelerator_names_ : accelerator_name_set option)
    ?accelerator_total_memory_mi_b:
      (accelerator_total_memory_mi_b_ : accelerator_total_memory_mi_b_request option)
    ?network_bandwidth_gbps:(network_bandwidth_gbps_ : network_bandwidth_gbps_request option)
    ?allowed_instance_types:(allowed_instance_types_ : allowed_instance_type_set option)
    ?max_spot_price_as_percentage_of_optimal_on_demand_price:
      (max_spot_price_as_percentage_of_optimal_on_demand_price_ : boxed_integer option)
    ~v_cpu_count:(v_cpu_count_ : v_cpu_count_range_request)
    ~memory_mi_b:(memory_mi_b_ : memory_mi_b_request) () =
  ({
     v_cpu_count = v_cpu_count_;
     memory_mi_b = memory_mi_b_;
     cpu_manufacturers = cpu_manufacturers_;
     memory_gi_b_per_v_cpu = memory_gi_b_per_v_cpu_;
     excluded_instance_types = excluded_instance_types_;
     instance_generations = instance_generations_;
     spot_max_price_percentage_over_lowest_price = spot_max_price_percentage_over_lowest_price_;
     on_demand_max_price_percentage_over_lowest_price =
       on_demand_max_price_percentage_over_lowest_price_;
     bare_metal = bare_metal_;
     burstable_performance = burstable_performance_;
     require_hibernate_support = require_hibernate_support_;
     network_interface_count = network_interface_count_;
     local_storage = local_storage_;
     local_storage_types = local_storage_types_;
     total_local_storage_g_b = total_local_storage_g_b_;
     baseline_ebs_bandwidth_mbps = baseline_ebs_bandwidth_mbps_;
     accelerator_types = accelerator_types_;
     accelerator_count = accelerator_count_;
     accelerator_manufacturers = accelerator_manufacturers_;
     accelerator_names = accelerator_names_;
     accelerator_total_memory_mi_b = accelerator_total_memory_mi_b_;
     network_bandwidth_gbps = network_bandwidth_gbps_;
     allowed_instance_types = allowed_instance_types_;
     max_spot_price_as_percentage_of_optimal_on_demand_price =
       max_spot_price_as_percentage_of_optimal_on_demand_price_;
   }
    : instance_requirements_request)

let make_managed_instances_local_storage_configuration
    ?use_local_storage:(use_local_storage_ : boolean_ option) () =
  ({ use_local_storage = use_local_storage_ } : managed_instances_local_storage_configuration)

let make_managed_instances_storage_configuration
    ?storage_size_gi_b:(storage_size_gi_b_ : task_volume_storage_gi_b option) () =
  ({ storage_size_gi_b = storage_size_gi_b_ } : managed_instances_storage_configuration)

let make_managed_instances_network_configuration ?subnets:(subnets_ : string_list option)
    ?security_groups:(security_groups_ : string_list option) () =
  ({ subnets = subnets_; security_groups = security_groups_ }
    : managed_instances_network_configuration)

let make_instance_launch_template
    ?storage_configuration:(storage_configuration_ : managed_instances_storage_configuration option)
    ?local_storage_configuration:
      (local_storage_configuration_ : managed_instances_local_storage_configuration option)
    ?monitoring:(monitoring_ : managed_instances_monitoring_options option)
    ?capacity_option_type:(capacity_option_type_ : capacity_option_type option)
    ?instance_metadata_tags_propagation:(instance_metadata_tags_propagation_ : boxed_boolean option)
    ?instance_requirements:(instance_requirements_ : instance_requirements_request option)
    ?fips_enabled:(fips_enabled_ : boxed_boolean option)
    ?capacity_reservations:(capacity_reservations_ : capacity_reservation_request option)
    ~ec2_instance_profile_arn:(ec2_instance_profile_arn_ : string_)
    ~network_configuration:(network_configuration_ : managed_instances_network_configuration) () =
  ({
     ec2_instance_profile_arn = ec2_instance_profile_arn_;
     network_configuration = network_configuration_;
     storage_configuration = storage_configuration_;
     local_storage_configuration = local_storage_configuration_;
     monitoring = monitoring_;
     capacity_option_type = capacity_option_type_;
     instance_metadata_tags_propagation = instance_metadata_tags_propagation_;
     instance_requirements = instance_requirements_;
     fips_enabled = fips_enabled_;
     capacity_reservations = capacity_reservations_;
   }
    : instance_launch_template)

let make_managed_instances_provider
    ?infrastructure_role_arn:(infrastructure_role_arn_ : string_ option)
    ?instance_launch_template:(instance_launch_template_ : instance_launch_template option)
    ?propagate_tags:(propagate_tags_ : propagate_mi_tags option)
    ?infrastructure_optimization:(infrastructure_optimization_ : infrastructure_optimization option)
    ?auto_repair_configuration:(auto_repair_configuration_ : auto_repair_configuration option) () =
  ({
     infrastructure_role_arn = infrastructure_role_arn_;
     instance_launch_template = instance_launch_template_;
     propagate_tags = propagate_tags_;
     infrastructure_optimization = infrastructure_optimization_;
     auto_repair_configuration = auto_repair_configuration_;
   }
    : managed_instances_provider)

let make_capacity_provider ?capacity_provider_arn:(capacity_provider_arn_ : string_ option)
    ?name:(name_ : string_ option) ?cluster:(cluster_ : string_ option)
    ?status:(status_ : capacity_provider_status option)
    ?auto_scaling_group_provider:(auto_scaling_group_provider_ : auto_scaling_group_provider option)
    ?managed_instances_provider:(managed_instances_provider_ : managed_instances_provider option)
    ?update_status:(update_status_ : capacity_provider_update_status option)
    ?update_status_reason:(update_status_reason_ : string_ option) ?tags:(tags_ : tags option)
    ?type_:(type__ : capacity_provider_type option) () =
  ({
     capacity_provider_arn = capacity_provider_arn_;
     name = name_;
     cluster = cluster_;
     status = status_;
     auto_scaling_group_provider = auto_scaling_group_provider_;
     managed_instances_provider = managed_instances_provider_;
     update_status = update_status_;
     update_status_reason = update_status_reason_;
     tags = tags_;
     type_ = type__;
   }
    : capacity_provider)

let make_capacity_provider_strategy_item
    ?weight:(weight_ : capacity_provider_strategy_item_weight option)
    ?base:(base_ : capacity_provider_strategy_item_base option)
    ~capacity_provider:(capacity_provider_ : string_) () =
  ({ capacity_provider = capacity_provider_; weight = weight_; base = base_ }
    : capacity_provider_strategy_item)

let make_cluster_service_connect_defaults ?namespace:(namespace_ : string_ option) () =
  ({ namespace = namespace_ } : cluster_service_connect_defaults)

let make_cluster_setting ?name:(name_ : cluster_setting_name option)
    ?value:(value_ : string_ option) () =
  ({ name = name_; value = value_ } : cluster_setting)

let make_managed_storage_configuration ?kms_key_id:(kms_key_id_ : string_ option)
    ?fargate_ephemeral_storage_kms_key_id:(fargate_ephemeral_storage_kms_key_id_ : string_ option)
    () =
  ({
     kms_key_id = kms_key_id_;
     fargate_ephemeral_storage_kms_key_id = fargate_ephemeral_storage_kms_key_id_;
   }
    : managed_storage_configuration)

let make_execute_command_log_configuration
    ?cloud_watch_log_group_name:(cloud_watch_log_group_name_ : string_ option)
    ?cloud_watch_encryption_enabled:(cloud_watch_encryption_enabled_ : boolean_ option)
    ?s3_bucket_name:(s3_bucket_name_ : string_ option)
    ?s3_encryption_enabled:(s3_encryption_enabled_ : boolean_ option)
    ?s3_key_prefix:(s3_key_prefix_ : string_ option) () =
  ({
     cloud_watch_log_group_name = cloud_watch_log_group_name_;
     cloud_watch_encryption_enabled = cloud_watch_encryption_enabled_;
     s3_bucket_name = s3_bucket_name_;
     s3_encryption_enabled = s3_encryption_enabled_;
     s3_key_prefix = s3_key_prefix_;
   }
    : execute_command_log_configuration)

let make_execute_command_configuration ?kms_key_id:(kms_key_id_ : string_ option)
    ?logging:(logging_ : execute_command_logging option)
    ?log_configuration:(log_configuration_ : execute_command_log_configuration option) () =
  ({ kms_key_id = kms_key_id_; logging = logging_; log_configuration = log_configuration_ }
    : execute_command_configuration)

let make_cluster_configuration
    ?execute_command_configuration:
      (execute_command_configuration_ : execute_command_configuration option)
    ?managed_storage_configuration:
      (managed_storage_configuration_ : managed_storage_configuration option) () =
  ({
     execute_command_configuration = execute_command_configuration_;
     managed_storage_configuration = managed_storage_configuration_;
   }
    : cluster_configuration)

let make_cluster ?cluster_arn:(cluster_arn_ : string_ option)
    ?cluster_name:(cluster_name_ : string_ option)
    ?configuration:(configuration_ : cluster_configuration option)
    ?status:(status_ : string_ option)
    ?registered_container_instances_count:(registered_container_instances_count_ : integer option)
    ?running_tasks_count:(running_tasks_count_ : integer option)
    ?pending_tasks_count:(pending_tasks_count_ : integer option)
    ?active_services_count:(active_services_count_ : integer option)
    ?statistics:(statistics_ : statistics option) ?tags:(tags_ : tags option)
    ?settings:(settings_ : cluster_settings option)
    ?capacity_providers:(capacity_providers_ : string_list option)
    ?default_capacity_provider_strategy:
      (default_capacity_provider_strategy_ : capacity_provider_strategy option)
    ?attachments:(attachments_ : attachments option)
    ?attachments_status:(attachments_status_ : string_ option)
    ?service_connect_defaults:(service_connect_defaults_ : cluster_service_connect_defaults option)
    () =
  ({
     cluster_arn = cluster_arn_;
     cluster_name = cluster_name_;
     configuration = configuration_;
     status = status_;
     registered_container_instances_count = registered_container_instances_count_;
     running_tasks_count = running_tasks_count_;
     pending_tasks_count = pending_tasks_count_;
     active_services_count = active_services_count_;
     statistics = statistics_;
     tags = tags_;
     settings = settings_;
     capacity_providers = capacity_providers_;
     default_capacity_provider_strategy = default_capacity_provider_strategy_;
     attachments = attachments_;
     attachments_status = attachments_status_;
     service_connect_defaults = service_connect_defaults_;
   }
    : cluster)

let make_cluster_service_connect_defaults_request ~namespace:(namespace_ : string_) () =
  ({ namespace = namespace_ } : cluster_service_connect_defaults_request)

let make_managed_agent ?last_started_at:(last_started_at_ : timestamp option)
    ?name:(name_ : managed_agent_name option) ?reason:(reason_ : string_ option)
    ?last_status:(last_status_ : string_ option) () =
  ({
     last_started_at = last_started_at_;
     name = name_;
     reason = reason_;
     last_status = last_status_;
   }
    : managed_agent)

let make_network_interface ?attachment_id:(attachment_id_ : string_ option)
    ?private_ipv4_address:(private_ipv4_address_ : string_ option)
    ?ipv6_address:(ipv6_address_ : string_ option) () =
  ({
     attachment_id = attachment_id_;
     private_ipv4_address = private_ipv4_address_;
     ipv6_address = ipv6_address_;
   }
    : network_interface)

let make_network_binding ?bind_i_p:(bind_i_p_ : string_ option)
    ?container_port:(container_port_ : boxed_integer option)
    ?host_port:(host_port_ : boxed_integer option) ?protocol:(protocol_ : transport_protocol option)
    ?container_port_range:(container_port_range_ : string_ option)
    ?host_port_range:(host_port_range_ : string_ option) () =
  ({
     bind_i_p = bind_i_p_;
     container_port = container_port_;
     host_port = host_port_;
     protocol = protocol_;
     container_port_range = container_port_range_;
     host_port_range = host_port_range_;
   }
    : network_binding)

let make_container ?container_arn:(container_arn_ : string_ option)
    ?task_arn:(task_arn_ : string_ option) ?name:(name_ : string_ option)
    ?image:(image_ : string_ option) ?image_digest:(image_digest_ : string_ option)
    ?runtime_id:(runtime_id_ : string_ option) ?last_status:(last_status_ : string_ option)
    ?exit_code:(exit_code_ : boxed_integer option) ?reason:(reason_ : string_ option)
    ?network_bindings:(network_bindings_ : network_bindings option)
    ?network_interfaces:(network_interfaces_ : network_interfaces option)
    ?health_status:(health_status_ : health_status option)
    ?managed_agents:(managed_agents_ : managed_agents option) ?cpu:(cpu_ : string_ option)
    ?memory:(memory_ : string_ option) ?memory_reservation:(memory_reservation_ : string_ option)
    ?gpu_ids:(gpu_ids_ : gpu_ids option)
    ?neuron_device_ids:(neuron_device_ids_ : neuron_device_ids option) () =
  ({
     container_arn = container_arn_;
     task_arn = task_arn_;
     name = name_;
     image = image_;
     image_digest = image_digest_;
     runtime_id = runtime_id_;
     last_status = last_status_;
     exit_code = exit_code_;
     reason = reason_;
     network_bindings = network_bindings_;
     network_interfaces = network_interfaces_;
     health_status = health_status_;
     managed_agents = managed_agents_;
     cpu = cpu_;
     memory = memory_;
     memory_reservation = memory_reservation_;
     gpu_ids = gpu_ids_;
     neuron_device_ids = neuron_device_ids_;
   }
    : container)

let make_container_image ?container_name:(container_name_ : string_ option)
    ?image_digest:(image_digest_ : string_ option) ?image:(image_ : string_ option) () =
  ({ container_name = container_name_; image_digest = image_digest_; image = image_ }
    : container_image)

let make_container_instance_health_status
    ?overall_status:(overall_status_ : instance_health_check_state option)
    ?details:(details_ : instance_health_check_result_list option) () =
  ({ overall_status = overall_status_; details = details_ } : container_instance_health_status)

let make_resource ?name:(name_ : string_ option) ?type_:(type__ : string_ option)
    ?double_value:(double_value_ : double option) ?long_value:(long_value_ : long option)
    ?integer_value:(integer_value_ : integer option)
    ?string_set_value:(string_set_value_ : string_list option) () =
  ({
     name = name_;
     type_ = type__;
     double_value = double_value_;
     long_value = long_value_;
     integer_value = integer_value_;
     string_set_value = string_set_value_;
   }
    : resource)

let make_version_info ?agent_version:(agent_version_ : string_ option)
    ?agent_hash:(agent_hash_ : string_ option) ?docker_version:(docker_version_ : string_ option) ()
    =
  ({ agent_version = agent_version_; agent_hash = agent_hash_; docker_version = docker_version_ }
    : version_info)

let make_container_instance ?container_instance_arn:(container_instance_arn_ : string_ option)
    ?ec2_instance_id:(ec2_instance_id_ : string_ option)
    ?capacity_provider_name:(capacity_provider_name_ : string_ option)
    ?version:(version_ : long option) ?version_info:(version_info_ : version_info option)
    ?remaining_resources:(remaining_resources_ : resources option)
    ?registered_resources:(registered_resources_ : resources option)
    ?status:(status_ : string_ option) ?status_reason:(status_reason_ : string_ option)
    ?agent_connected:(agent_connected_ : boolean_ option)
    ?running_tasks_count:(running_tasks_count_ : integer option)
    ?pending_tasks_count:(pending_tasks_count_ : integer option)
    ?agent_update_status:(agent_update_status_ : agent_update_status option)
    ?attributes:(attributes_ : attributes option) ?registered_at:(registered_at_ : timestamp option)
    ?attachments:(attachments_ : attachments option) ?tags:(tags_ : tags option)
    ?health_status:(health_status_ : container_instance_health_status option) () =
  ({
     container_instance_arn = container_instance_arn_;
     ec2_instance_id = ec2_instance_id_;
     capacity_provider_name = capacity_provider_name_;
     version = version_;
     version_info = version_info_;
     remaining_resources = remaining_resources_;
     registered_resources = registered_resources_;
     status = status_;
     status_reason = status_reason_;
     agent_connected = agent_connected_;
     running_tasks_count = running_tasks_count_;
     pending_tasks_count = pending_tasks_count_;
     agent_update_status = agent_update_status_;
     attributes = attributes_;
     registered_at = registered_at_;
     attachments = attachments_;
     tags = tags_;
     health_status = health_status_;
   }
    : container_instance)

let make_container_override ?name:(name_ : string_ option) ?command:(command_ : string_list option)
    ?environment:(environment_ : environment_variables option)
    ?environment_files:(environment_files_ : environment_files option)
    ?cpu:(cpu_ : boxed_integer option) ?memory:(memory_ : boxed_integer option)
    ?memory_reservation:(memory_reservation_ : boxed_integer option)
    ?resource_requirements:(resource_requirements_ : resource_requirements option) () =
  ({
     name = name_;
     command = command_;
     environment = environment_;
     environment_files = environment_files_;
     cpu = cpu_;
     memory = memory_;
     memory_reservation = memory_reservation_;
     resource_requirements = resource_requirements_;
   }
    : container_override)

let make_container_state_change ?container_name:(container_name_ : string_ option)
    ?image_digest:(image_digest_ : string_ option) ?runtime_id:(runtime_id_ : string_ option)
    ?exit_code:(exit_code_ : boxed_integer option)
    ?network_bindings:(network_bindings_ : network_bindings option)
    ?reason:(reason_ : string_ option) ?status:(status_ : string_ option) () =
  ({
     container_name = container_name_;
     image_digest = image_digest_;
     runtime_id = runtime_id_;
     exit_code = exit_code_;
     network_bindings = network_bindings_;
     reason = reason_;
     status = status_;
   }
    : container_state_change)

let make_create_capacity_provider_response
    ?capacity_provider:(capacity_provider_ : capacity_provider option) () =
  ({ capacity_provider = capacity_provider_ } : create_capacity_provider_response)

let make_create_managed_instances_provider_configuration
    ?propagate_tags:(propagate_tags_ : propagate_mi_tags option)
    ?infrastructure_optimization:(infrastructure_optimization_ : infrastructure_optimization option)
    ?auto_repair_configuration:(auto_repair_configuration_ : auto_repair_configuration option)
    ~infrastructure_role_arn:(infrastructure_role_arn_ : string_)
    ~instance_launch_template:(instance_launch_template_ : instance_launch_template) () =
  ({
     infrastructure_role_arn = infrastructure_role_arn_;
     instance_launch_template = instance_launch_template_;
     propagate_tags = propagate_tags_;
     infrastructure_optimization = infrastructure_optimization_;
     auto_repair_configuration = auto_repair_configuration_;
   }
    : create_managed_instances_provider_configuration)

let make_create_capacity_provider_request ?cluster:(cluster_ : string_ option)
    ?auto_scaling_group_provider:(auto_scaling_group_provider_ : auto_scaling_group_provider option)
    ?managed_instances_provider:
      (managed_instances_provider_ : create_managed_instances_provider_configuration option)
    ?tags:(tags_ : tags option) ~name:(name_ : string_) () =
  ({
     name = name_;
     cluster = cluster_;
     auto_scaling_group_provider = auto_scaling_group_provider_;
     managed_instances_provider = managed_instances_provider_;
     tags = tags_;
   }
    : create_capacity_provider_request)

let make_create_cluster_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : create_cluster_response)

let make_create_cluster_request ?cluster_name:(cluster_name_ : string_ option)
    ?tags:(tags_ : tags option) ?settings:(settings_ : cluster_settings option)
    ?configuration:(configuration_ : cluster_configuration option)
    ?capacity_providers:(capacity_providers_ : string_list option)
    ?default_capacity_provider_strategy:
      (default_capacity_provider_strategy_ : capacity_provider_strategy option)
    ?service_connect_defaults:
      (service_connect_defaults_ : cluster_service_connect_defaults_request option) () =
  ({
     cluster_name = cluster_name_;
     tags = tags_;
     settings = settings_;
     configuration = configuration_;
     capacity_providers = capacity_providers_;
     default_capacity_provider_strategy = default_capacity_provider_strategy_;
     service_connect_defaults = service_connect_defaults_;
   }
    : create_cluster_request)

let make_create_daemon_response ?daemon_arn:(daemon_arn_ : string_ option)
    ?status:(status_ : daemon_status option) ?created_at:(created_at_ : timestamp option)
    ?deployment_arn:(deployment_arn_ : string_ option) () =
  ({
     daemon_arn = daemon_arn_;
     status = status_;
     created_at = created_at_;
     deployment_arn = deployment_arn_;
   }
    : create_daemon_response)

let make_daemon_alarm_configuration ?alarm_names:(alarm_names_ : string_list option)
    ?enable:(enable_ : boolean_ option) () =
  ({ alarm_names = alarm_names_; enable = enable_ } : daemon_alarm_configuration)

let make_daemon_deployment_configuration
    ?drain_percent:(drain_percent_ : daemon_drain_percent option)
    ?alarms:(alarms_ : daemon_alarm_configuration option)
    ?bake_time_in_minutes:(bake_time_in_minutes_ : integer option) () =
  ({
     drain_percent = drain_percent_;
     alarms = alarms_;
     bake_time_in_minutes = bake_time_in_minutes_;
   }
    : daemon_deployment_configuration)

let make_create_daemon_request ?cluster_arn:(cluster_arn_ : string_ option)
    ?deployment_configuration:(deployment_configuration_ : daemon_deployment_configuration option)
    ?tags:(tags_ : tags option) ?propagate_tags:(propagate_tags_ : daemon_propagate_tags option)
    ?enable_ecs_managed_tags:(enable_ecs_managed_tags_ : boolean_ option)
    ?enable_execute_command:(enable_execute_command_ : boolean_ option)
    ?client_token:(client_token_ : string_ option) ~daemon_name:(daemon_name_ : string_)
    ~daemon_task_definition_arn:(daemon_task_definition_arn_ : string_)
    ~capacity_provider_arns:(capacity_provider_arns_ : string_list) () =
  ({
     daemon_name = daemon_name_;
     cluster_arn = cluster_arn_;
     daemon_task_definition_arn = daemon_task_definition_arn_;
     capacity_provider_arns = capacity_provider_arns_;
     deployment_configuration = deployment_configuration_;
     tags = tags_;
     propagate_tags = propagate_tags_;
     enable_ecs_managed_tags = enable_ecs_managed_tags_;
     enable_execute_command = enable_execute_command_;
     client_token = client_token_;
   }
    : create_daemon_request)

let make_ingress_path_summary ~access_type:(access_type_ : access_type)
    ~endpoint:(endpoint_ : string_) () =
  ({ access_type = access_type_; endpoint = endpoint_ } : ingress_path_summary)

let make_express_gateway_scaling_target ?min_task_count:(min_task_count_ : boxed_integer option)
    ?max_task_count:(max_task_count_ : boxed_integer option)
    ?auto_scaling_metric:(auto_scaling_metric_ : express_gateway_service_scaling_metric option)
    ?auto_scaling_target_value:(auto_scaling_target_value_ : boxed_integer option) () =
  ({
     min_task_count = min_task_count_;
     max_task_count = max_task_count_;
     auto_scaling_metric = auto_scaling_metric_;
     auto_scaling_target_value = auto_scaling_target_value_;
   }
    : express_gateway_scaling_target)

let make_express_gateway_repository_credentials
    ?credentials_parameter:(credentials_parameter_ : string_ option) () =
  ({ credentials_parameter = credentials_parameter_ } : express_gateway_repository_credentials)

let make_express_gateway_service_aws_logs_configuration ~log_group:(log_group_ : string_)
    ~log_stream_prefix:(log_stream_prefix_ : string_) () =
  ({ log_group = log_group_; log_stream_prefix = log_stream_prefix_ }
    : express_gateway_service_aws_logs_configuration)

let make_express_gateway_container ?container_port:(container_port_ : boxed_integer option)
    ?aws_logs_configuration:
      (aws_logs_configuration_ : express_gateway_service_aws_logs_configuration option)
    ?repository_credentials:
      (repository_credentials_ : express_gateway_repository_credentials option)
    ?command:(command_ : string_list option)
    ?environment:(environment_ : environment_variables option)
    ?secrets:(secrets_ : secret_list option) ~image:(image_ : string_) () =
  ({
     image = image_;
     container_port = container_port_;
     aws_logs_configuration = aws_logs_configuration_;
     repository_credentials = repository_credentials_;
     command = command_;
     environment = environment_;
     secrets = secrets_;
   }
    : express_gateway_container)

let make_express_gateway_service_network_configuration
    ?security_groups:(security_groups_ : string_list option)
    ?subnets:(subnets_ : string_list option) () =
  ({ security_groups = security_groups_; subnets = subnets_ }
    : express_gateway_service_network_configuration)

let make_express_gateway_service_configuration
    ?service_revision_arn:(service_revision_arn_ : string_ option)
    ?execution_role_arn:(execution_role_arn_ : string_ option)
    ?task_role_arn:(task_role_arn_ : string_ option)
    ?task_definition_arn:(task_definition_arn_ : string_ option) ?cpu:(cpu_ : string_ option)
    ?memory:(memory_ : string_ option)
    ?network_configuration:
      (network_configuration_ : express_gateway_service_network_configuration option)
    ?health_check_path:(health_check_path_ : string_ option)
    ?primary_container:(primary_container_ : express_gateway_container option)
    ?scaling_target:(scaling_target_ : express_gateway_scaling_target option)
    ?ingress_paths:(ingress_paths_ : ingress_path_summaries option)
    ?created_at:(created_at_ : timestamp option) () =
  ({
     service_revision_arn = service_revision_arn_;
     execution_role_arn = execution_role_arn_;
     task_role_arn = task_role_arn_;
     task_definition_arn = task_definition_arn_;
     cpu = cpu_;
     memory = memory_;
     network_configuration = network_configuration_;
     health_check_path = health_check_path_;
     primary_container = primary_container_;
     scaling_target = scaling_target_;
     ingress_paths = ingress_paths_;
     created_at = created_at_;
   }
    : express_gateway_service_configuration)

let make_express_gateway_service_status
    ?status_code:(status_code_ : express_gateway_service_status_code option)
    ?status_reason:(status_reason_ : string_ option) () =
  ({ status_code = status_code_; status_reason = status_reason_ } : express_gateway_service_status)

let make_ecs_express_gateway_service ?cluster:(cluster_ : string_ option)
    ?service_name:(service_name_ : string_ option) ?service_arn:(service_arn_ : string_ option)
    ?infrastructure_role_arn:(infrastructure_role_arn_ : string_ option)
    ?status:(status_ : express_gateway_service_status option)
    ?current_deployment:(current_deployment_ : string_ option)
    ?active_configurations:(active_configurations_ : express_gateway_service_configurations option)
    ?tags:(tags_ : tags option) ?created_at:(created_at_ : timestamp option)
    ?updated_at:(updated_at_ : timestamp option) () =
  ({
     cluster = cluster_;
     service_name = service_name_;
     service_arn = service_arn_;
     infrastructure_role_arn = infrastructure_role_arn_;
     status = status_;
     current_deployment = current_deployment_;
     active_configurations = active_configurations_;
     tags = tags_;
     created_at = created_at_;
     updated_at = updated_at_;
   }
    : ecs_express_gateway_service)

let make_create_express_gateway_service_response
    ?service:(service_ : ecs_express_gateway_service option) () =
  ({ service = service_ } : create_express_gateway_service_response)

let make_create_express_gateway_service_request
    ?execution_role_arn:(execution_role_arn_ : string_ option)
    ?service_name:(service_name_ : string_ option) ?cluster:(cluster_ : string_ option)
    ?health_check_path:(health_check_path_ : string_ option)
    ?primary_container:(primary_container_ : express_gateway_container option)
    ?task_role_arn:(task_role_arn_ : string_ option)
    ?network_configuration:
      (network_configuration_ : express_gateway_service_network_configuration option)
    ?cpu:(cpu_ : string_ option) ?memory:(memory_ : string_ option)
    ?scaling_target:(scaling_target_ : express_gateway_scaling_target option)
    ?tags:(tags_ : tags option) ?task_definition_arn:(task_definition_arn_ : string_ option)
    ~infrastructure_role_arn:(infrastructure_role_arn_ : string_) () =
  ({
     execution_role_arn = execution_role_arn_;
     infrastructure_role_arn = infrastructure_role_arn_;
     service_name = service_name_;
     cluster = cluster_;
     health_check_path = health_check_path_;
     primary_container = primary_container_;
     task_role_arn = task_role_arn_;
     network_configuration = network_configuration_;
     cpu = cpu_;
     memory = memory_;
     scaling_target = scaling_target_;
     tags = tags_;
     task_definition_arn = task_definition_arn_;
   }
    : create_express_gateway_service_request)

let make_deployment_controller ~type_:(type__ : deployment_controller_type) () =
  ({ type_ = type__ } : deployment_controller)

let make_network_configuration
    ?awsvpc_configuration:(awsvpc_configuration_ : aws_vpc_configuration option) () =
  ({ awsvpc_configuration = awsvpc_configuration_ } : network_configuration)

let make_placement_strategy ?type_:(type__ : placement_strategy_type option)
    ?field:(field_ : string_ option) () =
  ({ type_ = type__; field = field_ } : placement_strategy)

let make_placement_constraint ?type_:(type__ : placement_constraint_type option)
    ?expression:(expression_ : string_ option) () =
  ({ type_ = type__; expression = expression_ } : placement_constraint)

let make_service_current_revision_summary ?arn:(arn_ : string_ option)
    ?requested_task_count:(requested_task_count_ : integer option)
    ?running_task_count:(running_task_count_ : integer option)
    ?pending_task_count:(pending_task_count_ : integer option) () =
  ({
     arn = arn_;
     requested_task_count = requested_task_count_;
     running_task_count = running_task_count_;
     pending_task_count = pending_task_count_;
   }
    : service_current_revision_summary)

let make_service_event ?id:(id_ : string_ option) ?created_at:(created_at_ : timestamp option)
    ?message:(message_ : string_ option) () =
  ({ id = id_; created_at = created_at_; message = message_ } : service_event)

let make_vpc_lattice_configuration ~role_arn:(role_arn_ : iam_role_arn)
    ~target_group_arn:(target_group_arn_ : string_) ~port_name:(port_name_ : string_) () =
  ({ role_arn = role_arn_; target_group_arn = target_group_arn_; port_name = port_name_ }
    : vpc_lattice_configuration)

let make_deployment_ephemeral_storage ?kms_key_id:(kms_key_id_ : string_ option) () =
  ({ kms_key_id = kms_key_id_ } : deployment_ephemeral_storage)

let make_ebs_tag_specification ?tags:(tags_ : tags option)
    ?propagate_tags:(propagate_tags_ : propagate_tags option)
    ~resource_type:(resource_type_ : ebs_resource_type) () =
  ({ resource_type = resource_type_; tags = tags_; propagate_tags = propagate_tags_ }
    : ebs_tag_specification)

let make_service_managed_ebs_volume_configuration ?encrypted:(encrypted_ : boxed_boolean option)
    ?kms_key_id:(kms_key_id_ : ebskms_key_id option)
    ?volume_type:(volume_type_ : ebs_volume_type option)
    ?size_in_gi_b:(size_in_gi_b_ : boxed_integer option)
    ?snapshot_id:(snapshot_id_ : ebs_snapshot_id option)
    ?volume_initialization_rate:(volume_initialization_rate_ : boxed_integer option)
    ?iops:(iops_ : boxed_integer option) ?throughput:(throughput_ : boxed_integer option)
    ?tag_specifications:(tag_specifications_ : ebs_tag_specifications option)
    ?filesystem_type:(filesystem_type_ : task_filesystem_type option)
    ~role_arn:(role_arn_ : iam_role_arn) () =
  ({
     encrypted = encrypted_;
     kms_key_id = kms_key_id_;
     volume_type = volume_type_;
     size_in_gi_b = size_in_gi_b_;
     snapshot_id = snapshot_id_;
     volume_initialization_rate = volume_initialization_rate_;
     iops = iops_;
     throughput = throughput_;
     tag_specifications = tag_specifications_;
     role_arn = role_arn_;
     filesystem_type = filesystem_type_;
   }
    : service_managed_ebs_volume_configuration)

let make_service_volume_configuration
    ?managed_ebs_volume:(managed_ebs_volume_ : service_managed_ebs_volume_configuration option)
    ~name:(name_ : ecs_volume_name) () =
  ({ name = name_; managed_ebs_volume = managed_ebs_volume_ } : service_volume_configuration)

let make_service_connect_service_resource ?discovery_name:(discovery_name_ : string_ option)
    ?discovery_arn:(discovery_arn_ : string_ option) () =
  ({ discovery_name = discovery_name_; discovery_arn = discovery_arn_ }
    : service_connect_service_resource)

let make_service_connect_access_log_configuration
    ?include_query_parameters:
      (include_query_parameters_ : service_connect_include_query_parameters option)
    ~format:(format_ : service_connect_access_logging_format) () =
  ({ format = format_; include_query_parameters = include_query_parameters_ }
    : service_connect_access_log_configuration)

let make_service_connect_tls_certificate_authority
    ?aws_pca_authority_arn:(aws_pca_authority_arn_ : string_ option) () =
  ({ aws_pca_authority_arn = aws_pca_authority_arn_ } : service_connect_tls_certificate_authority)

let make_service_connect_tls_configuration ?kms_key:(kms_key_ : string_ option)
    ?role_arn:(role_arn_ : string_ option)
    ~issuer_certificate_authority:
      (issuer_certificate_authority_ : service_connect_tls_certificate_authority) () =
  ({
     issuer_certificate_authority = issuer_certificate_authority_;
     kms_key = kms_key_;
     role_arn = role_arn_;
   }
    : service_connect_tls_configuration)

let make_timeout_configuration ?idle_timeout_seconds:(idle_timeout_seconds_ : duration option)
    ?per_request_timeout_seconds:(per_request_timeout_seconds_ : duration option) () =
  ({
     idle_timeout_seconds = idle_timeout_seconds_;
     per_request_timeout_seconds = per_request_timeout_seconds_;
   }
    : timeout_configuration)

let make_service_connect_test_traffic_header_match_rules ~exact:(exact_ : string_) () =
  ({ exact = exact_ } : service_connect_test_traffic_header_match_rules)

let make_service_connect_test_traffic_header_rules
    ?value:(value_ : service_connect_test_traffic_header_match_rules option) ~name:(name_ : string_)
    () =
  ({ name = name_; value = value_ } : service_connect_test_traffic_header_rules)

let make_service_connect_test_traffic_rules
    ~header:(header_ : service_connect_test_traffic_header_rules) () =
  ({ header = header_ } : service_connect_test_traffic_rules)

let make_service_connect_client_alias ?dns_name:(dns_name_ : string_ option)
    ?test_traffic_rules:(test_traffic_rules_ : service_connect_test_traffic_rules option)
    ~port:(port_ : port_number) () =
  ({ port = port_; dns_name = dns_name_; test_traffic_rules = test_traffic_rules_ }
    : service_connect_client_alias)

let make_service_connect_service ?discovery_name:(discovery_name_ : string_ option)
    ?client_aliases:(client_aliases_ : service_connect_client_alias_list option)
    ?ingress_port_override:(ingress_port_override_ : port_number option)
    ?timeout:(timeout_ : timeout_configuration option)
    ?tls:(tls_ : service_connect_tls_configuration option) ~port_name:(port_name_ : string_) () =
  ({
     port_name = port_name_;
     discovery_name = discovery_name_;
     client_aliases = client_aliases_;
     ingress_port_override = ingress_port_override_;
     timeout = timeout_;
     tls = tls_;
   }
    : service_connect_service)

let make_service_connect_configuration ?namespace:(namespace_ : string_ option)
    ?services:(services_ : service_connect_service_list option)
    ?log_configuration:(log_configuration_ : log_configuration option)
    ?access_log_configuration:
      (access_log_configuration_ : service_connect_access_log_configuration option)
    ~enabled:(enabled_ : boolean_) () =
  ({
     enabled = enabled_;
     namespace = namespace_;
     services = services_;
     log_configuration = log_configuration_;
     access_log_configuration = access_log_configuration_;
   }
    : service_connect_configuration)

let make_deployment ?id:(id_ : string_ option) ?status:(status_ : string_ option)
    ?task_definition:(task_definition_ : string_ option)
    ?desired_count:(desired_count_ : integer option)
    ?pending_count:(pending_count_ : integer option)
    ?running_count:(running_count_ : integer option) ?failed_tasks:(failed_tasks_ : integer option)
    ?created_at:(created_at_ : timestamp option) ?updated_at:(updated_at_ : timestamp option)
    ?capacity_provider_strategy:(capacity_provider_strategy_ : capacity_provider_strategy option)
    ?launch_type:(launch_type_ : launch_type option)
    ?platform_version:(platform_version_ : string_ option)
    ?platform_family:(platform_family_ : string_ option)
    ?network_configuration:(network_configuration_ : network_configuration option)
    ?rollout_state:(rollout_state_ : deployment_rollout_state option)
    ?rollout_state_reason:(rollout_state_reason_ : string_ option)
    ?service_connect_configuration:
      (service_connect_configuration_ : service_connect_configuration option)
    ?service_connect_resources:
      (service_connect_resources_ : service_connect_service_resource_list option)
    ?volume_configurations:(volume_configurations_ : service_volume_configurations option)
    ?fargate_ephemeral_storage:(fargate_ephemeral_storage_ : deployment_ephemeral_storage option)
    ?vpc_lattice_configurations:(vpc_lattice_configurations_ : vpc_lattice_configurations option) ()
    =
  ({
     id = id_;
     status = status_;
     task_definition = task_definition_;
     desired_count = desired_count_;
     pending_count = pending_count_;
     running_count = running_count_;
     failed_tasks = failed_tasks_;
     created_at = created_at_;
     updated_at = updated_at_;
     capacity_provider_strategy = capacity_provider_strategy_;
     launch_type = launch_type_;
     platform_version = platform_version_;
     platform_family = platform_family_;
     network_configuration = network_configuration_;
     rollout_state = rollout_state_;
     rollout_state_reason = rollout_state_reason_;
     service_connect_configuration = service_connect_configuration_;
     service_connect_resources = service_connect_resources_;
     volume_configurations = volume_configurations_;
     fargate_ephemeral_storage = fargate_ephemeral_storage_;
     vpc_lattice_configurations = vpc_lattice_configurations_;
   }
    : deployment)

let make_scale ?value:(value_ : double option) ?unit_:(unit__ : scale_unit option) () =
  ({ value = value_; unit_ = unit__ } : scale)

let make_service_registry ?registry_arn:(registry_arn_ : string_ option)
    ?port:(port_ : boxed_integer option) ?container_name:(container_name_ : string_ option)
    ?container_port:(container_port_ : boxed_integer option) () =
  ({
     registry_arn = registry_arn_;
     port = port_;
     container_name = container_name_;
     container_port = container_port_;
   }
    : service_registry)

let make_load_balancer ?target_group_arn:(target_group_arn_ : string_ option)
    ?load_balancer_name:(load_balancer_name_ : string_ option)
    ?container_name:(container_name_ : string_ option)
    ?container_port:(container_port_ : boxed_integer option)
    ?advanced_configuration:(advanced_configuration_ : advanced_configuration option) () =
  ({
     target_group_arn = target_group_arn_;
     load_balancer_name = load_balancer_name_;
     container_name = container_name_;
     container_port = container_port_;
     advanced_configuration = advanced_configuration_;
   }
    : load_balancer)

let make_task_set ?id:(id_ : string_ option) ?task_set_arn:(task_set_arn_ : string_ option)
    ?service_arn:(service_arn_ : string_ option) ?cluster_arn:(cluster_arn_ : string_ option)
    ?started_by:(started_by_ : string_ option) ?external_id:(external_id_ : string_ option)
    ?status:(status_ : string_ option) ?task_definition:(task_definition_ : string_ option)
    ?computed_desired_count:(computed_desired_count_ : integer option)
    ?pending_count:(pending_count_ : integer option)
    ?running_count:(running_count_ : integer option) ?created_at:(created_at_ : timestamp option)
    ?updated_at:(updated_at_ : timestamp option) ?launch_type:(launch_type_ : launch_type option)
    ?capacity_provider_strategy:(capacity_provider_strategy_ : capacity_provider_strategy option)
    ?platform_version:(platform_version_ : string_ option)
    ?platform_family:(platform_family_ : string_ option)
    ?network_configuration:(network_configuration_ : network_configuration option)
    ?load_balancers:(load_balancers_ : load_balancers option)
    ?service_registries:(service_registries_ : service_registries option)
    ?scale:(scale_ : scale option) ?stability_status:(stability_status_ : stability_status option)
    ?stability_status_at:(stability_status_at_ : timestamp option) ?tags:(tags_ : tags option)
    ?fargate_ephemeral_storage:(fargate_ephemeral_storage_ : deployment_ephemeral_storage option) ()
    =
  ({
     id = id_;
     task_set_arn = task_set_arn_;
     service_arn = service_arn_;
     cluster_arn = cluster_arn_;
     started_by = started_by_;
     external_id = external_id_;
     status = status_;
     task_definition = task_definition_;
     computed_desired_count = computed_desired_count_;
     pending_count = pending_count_;
     running_count = running_count_;
     created_at = created_at_;
     updated_at = updated_at_;
     launch_type = launch_type_;
     capacity_provider_strategy = capacity_provider_strategy_;
     platform_version = platform_version_;
     platform_family = platform_family_;
     network_configuration = network_configuration_;
     load_balancers = load_balancers_;
     service_registries = service_registries_;
     scale = scale_;
     stability_status = stability_status_;
     stability_status_at = stability_status_at_;
     tags = tags_;
     fargate_ephemeral_storage = fargate_ephemeral_storage_;
   }
    : task_set)

let make_linear_configuration ?step_percent:(step_percent_ : double option)
    ?step_bake_time_in_minutes:(step_bake_time_in_minutes_ : integer option) () =
  ({ step_percent = step_percent_; step_bake_time_in_minutes = step_bake_time_in_minutes_ }
    : linear_configuration)

let make_deployment_lifecycle_hook_timeout_configuration
    ?timeout_in_minutes:(timeout_in_minutes_ : deployment_lifecycle_hook_duration option)
    ?action:(action_ : deployment_lifecycle_hook_action option) () =
  ({ timeout_in_minutes = timeout_in_minutes_; action = action_ }
    : deployment_lifecycle_hook_timeout_configuration)

let make_deployment_lifecycle_hook
    ?target_type:(target_type_ : deployment_lifecycle_hook_target_type option)
    ?hook_target_arn:(hook_target_arn_ : string_ option) ?role_arn:(role_arn_ : iam_role_arn option)
    ?lifecycle_stages:(lifecycle_stages_ : deployment_lifecycle_hook_stage_list option)
    ?hook_details:(hook_details_ : hook_details option)
    ?timeout_configuration:
      (timeout_configuration_ : deployment_lifecycle_hook_timeout_configuration option) () =
  ({
     target_type = target_type_;
     hook_target_arn = hook_target_arn_;
     role_arn = role_arn_;
     lifecycle_stages = lifecycle_stages_;
     hook_details = hook_details_;
     timeout_configuration = timeout_configuration_;
   }
    : deployment_lifecycle_hook)

let make_deployment_alarms ~alarm_names:(alarm_names_ : string_list)
    ~rollback:(rollback_ : boolean_) ~enable:(enable_ : boolean_) () =
  ({ alarm_names = alarm_names_; rollback = rollback_; enable = enable_ } : deployment_alarms)

let make_threshold_configuration ~type_:(type__ : threshold_type) ~value:(value_ : integer) () =
  ({ type_ = type__; value = value_ } : threshold_configuration)

let make_deployment_circuit_breaker
    ?reset_on_healthy_task:(reset_on_healthy_task_ : boxed_boolean option)
    ?threshold_configuration:(threshold_configuration_ : threshold_configuration option)
    ~enable:(enable_ : boolean_) ~rollback:(rollback_ : boolean_) () =
  ({
     enable = enable_;
     rollback = rollback_;
     reset_on_healthy_task = reset_on_healthy_task_;
     threshold_configuration = threshold_configuration_;
   }
    : deployment_circuit_breaker)

let make_deployment_configuration
    ?deployment_circuit_breaker:(deployment_circuit_breaker_ : deployment_circuit_breaker option)
    ?maximum_percent:(maximum_percent_ : boxed_integer option)
    ?minimum_healthy_percent:(minimum_healthy_percent_ : boxed_integer option)
    ?alarms:(alarms_ : deployment_alarms option) ?strategy:(strategy_ : deployment_strategy option)
    ?bake_time_in_minutes:(bake_time_in_minutes_ : boxed_integer option)
    ?lifecycle_hooks:(lifecycle_hooks_ : deployment_lifecycle_hook_list option)
    ?linear_configuration:(linear_configuration_ : linear_configuration option)
    ?canary_configuration:(canary_configuration_ : canary_configuration option) () =
  ({
     deployment_circuit_breaker = deployment_circuit_breaker_;
     maximum_percent = maximum_percent_;
     minimum_healthy_percent = minimum_healthy_percent_;
     alarms = alarms_;
     strategy = strategy_;
     bake_time_in_minutes = bake_time_in_minutes_;
     lifecycle_hooks = lifecycle_hooks_;
     linear_configuration = linear_configuration_;
     canary_configuration = canary_configuration_;
   }
    : deployment_configuration)

let make_service ?service_arn:(service_arn_ : string_ option)
    ?service_name:(service_name_ : string_ option) ?cluster_arn:(cluster_arn_ : string_ option)
    ?load_balancers:(load_balancers_ : load_balancers option)
    ?service_registries:(service_registries_ : service_registries option)
    ?status:(status_ : string_ option) ?desired_count:(desired_count_ : integer option)
    ?running_count:(running_count_ : integer option)
    ?pending_count:(pending_count_ : integer option)
    ?launch_type:(launch_type_ : launch_type option)
    ?capacity_provider_strategy:(capacity_provider_strategy_ : capacity_provider_strategy option)
    ?platform_version:(platform_version_ : string_ option)
    ?platform_family:(platform_family_ : string_ option)
    ?task_definition:(task_definition_ : string_ option)
    ?deployment_configuration:(deployment_configuration_ : deployment_configuration option)
    ?task_sets:(task_sets_ : task_sets option) ?deployments:(deployments_ : deployments option)
    ?role_arn:(role_arn_ : string_ option) ?events:(events_ : service_events option)
    ?created_at:(created_at_ : timestamp option)
    ?current_service_deployment:(current_service_deployment_ : string_ option)
    ?current_service_revisions:
      (current_service_revisions_ : service_current_revision_summary_list option)
    ?placement_constraints:(placement_constraints_ : placement_constraints option)
    ?placement_strategy:(placement_strategy_ : placement_strategies option)
    ?network_configuration:(network_configuration_ : network_configuration option)
    ?health_check_grace_period_seconds:(health_check_grace_period_seconds_ : boxed_integer option)
    ?scheduling_strategy:(scheduling_strategy_ : scheduling_strategy option)
    ?deployment_controller:(deployment_controller_ : deployment_controller option)
    ?tags:(tags_ : tags option) ?created_by:(created_by_ : string_ option)
    ?enable_ecs_managed_tags:(enable_ecs_managed_tags_ : boolean_ option)
    ?propagate_tags:(propagate_tags_ : propagate_tags option)
    ?enable_execute_command:(enable_execute_command_ : boolean_ option)
    ?availability_zone_rebalancing:
      (availability_zone_rebalancing_ : availability_zone_rebalancing option)
    ?resource_management_type:(resource_management_type_ : resource_management_type option) () =
  ({
     service_arn = service_arn_;
     service_name = service_name_;
     cluster_arn = cluster_arn_;
     load_balancers = load_balancers_;
     service_registries = service_registries_;
     status = status_;
     desired_count = desired_count_;
     running_count = running_count_;
     pending_count = pending_count_;
     launch_type = launch_type_;
     capacity_provider_strategy = capacity_provider_strategy_;
     platform_version = platform_version_;
     platform_family = platform_family_;
     task_definition = task_definition_;
     deployment_configuration = deployment_configuration_;
     task_sets = task_sets_;
     deployments = deployments_;
     role_arn = role_arn_;
     events = events_;
     created_at = created_at_;
     current_service_deployment = current_service_deployment_;
     current_service_revisions = current_service_revisions_;
     placement_constraints = placement_constraints_;
     placement_strategy = placement_strategy_;
     network_configuration = network_configuration_;
     health_check_grace_period_seconds = health_check_grace_period_seconds_;
     scheduling_strategy = scheduling_strategy_;
     deployment_controller = deployment_controller_;
     tags = tags_;
     created_by = created_by_;
     enable_ecs_managed_tags = enable_ecs_managed_tags_;
     propagate_tags = propagate_tags_;
     enable_execute_command = enable_execute_command_;
     availability_zone_rebalancing = availability_zone_rebalancing_;
     resource_management_type = resource_management_type_;
   }
    : service)

let make_create_service_response ?service:(service_ : service option) () =
  ({ service = service_ } : create_service_response)

let make_metric_configuration ~metric_names:(metric_names_ : metric_names_list)
    ~resolution_seconds:(resolution_seconds_ : metric_resolution_seconds) () =
  ({ metric_names = metric_names_; resolution_seconds = resolution_seconds_ }
    : metric_configuration)

let make_monitoring_configuration
    ?metric_configurations:(metric_configurations_ : metric_configuration_list option) () =
  ({ metric_configurations = metric_configurations_ } : monitoring_configuration)

let make_create_service_request ?cluster:(cluster_ : string_ option)
    ?task_definition:(task_definition_ : string_ option)
    ?availability_zone_rebalancing:
      (availability_zone_rebalancing_ : availability_zone_rebalancing option)
    ?load_balancers:(load_balancers_ : load_balancers option)
    ?service_registries:(service_registries_ : service_registries option)
    ?desired_count:(desired_count_ : boxed_integer option)
    ?client_token:(client_token_ : string_ option) ?launch_type:(launch_type_ : launch_type option)
    ?capacity_provider_strategy:(capacity_provider_strategy_ : capacity_provider_strategy option)
    ?platform_version:(platform_version_ : string_ option) ?role:(role_ : string_ option)
    ?deployment_configuration:(deployment_configuration_ : deployment_configuration option)
    ?placement_constraints:(placement_constraints_ : placement_constraints option)
    ?placement_strategy:(placement_strategy_ : placement_strategies option)
    ?network_configuration:(network_configuration_ : network_configuration option)
    ?health_check_grace_period_seconds:(health_check_grace_period_seconds_ : boxed_integer option)
    ?scheduling_strategy:(scheduling_strategy_ : scheduling_strategy option)
    ?deployment_controller:(deployment_controller_ : deployment_controller option)
    ?tags:(tags_ : tags option)
    ?enable_ecs_managed_tags:(enable_ecs_managed_tags_ : boolean_ option)
    ?propagate_tags:(propagate_tags_ : propagate_tags option)
    ?enable_execute_command:(enable_execute_command_ : boolean_ option)
    ?service_connect_configuration:
      (service_connect_configuration_ : service_connect_configuration option)
    ?volume_configurations:(volume_configurations_ : service_volume_configurations option)
    ?vpc_lattice_configurations:(vpc_lattice_configurations_ : vpc_lattice_configurations option)
    ?monitoring:(monitoring_ : monitoring_configuration option)
    ~service_name:(service_name_ : string_) () =
  ({
     cluster = cluster_;
     service_name = service_name_;
     task_definition = task_definition_;
     availability_zone_rebalancing = availability_zone_rebalancing_;
     load_balancers = load_balancers_;
     service_registries = service_registries_;
     desired_count = desired_count_;
     client_token = client_token_;
     launch_type = launch_type_;
     capacity_provider_strategy = capacity_provider_strategy_;
     platform_version = platform_version_;
     role = role_;
     deployment_configuration = deployment_configuration_;
     placement_constraints = placement_constraints_;
     placement_strategy = placement_strategy_;
     network_configuration = network_configuration_;
     health_check_grace_period_seconds = health_check_grace_period_seconds_;
     scheduling_strategy = scheduling_strategy_;
     deployment_controller = deployment_controller_;
     tags = tags_;
     enable_ecs_managed_tags = enable_ecs_managed_tags_;
     propagate_tags = propagate_tags_;
     enable_execute_command = enable_execute_command_;
     service_connect_configuration = service_connect_configuration_;
     volume_configurations = volume_configurations_;
     vpc_lattice_configurations = vpc_lattice_configurations_;
     monitoring = monitoring_;
   }
    : create_service_request)

let make_create_task_set_response ?task_set:(task_set_ : task_set option) () =
  ({ task_set = task_set_ } : create_task_set_response)

let make_create_task_set_request ?external_id:(external_id_ : string_ option)
    ?network_configuration:(network_configuration_ : network_configuration option)
    ?load_balancers:(load_balancers_ : load_balancers option)
    ?service_registries:(service_registries_ : service_registries option)
    ?launch_type:(launch_type_ : launch_type option)
    ?capacity_provider_strategy:(capacity_provider_strategy_ : capacity_provider_strategy option)
    ?platform_version:(platform_version_ : string_ option) ?scale:(scale_ : scale option)
    ?client_token:(client_token_ : string_ option) ?tags:(tags_ : tags option)
    ~service:(service_ : string_) ~cluster:(cluster_ : string_)
    ~task_definition:(task_definition_ : string_) () =
  ({
     service = service_;
     cluster = cluster_;
     external_id = external_id_;
     task_definition = task_definition_;
     network_configuration = network_configuration_;
     load_balancers = load_balancers_;
     service_registries = service_registries_;
     launch_type = launch_type_;
     capacity_provider_strategy = capacity_provider_strategy_;
     platform_version = platform_version_;
     scale = scale_;
     client_token = client_token_;
     tags = tags_;
   }
    : create_task_set_request)

let make_created_at ?before:(before_ : timestamp option) ?after:(after_ : timestamp option) () =
  ({ before = before_; after = after_ } : created_at)

let make_daemon_capacity_provider ?arn:(arn_ : string_ option)
    ?running_count:(running_count_ : integer option) () =
  ({ arn = arn_; running_count = running_count_ } : daemon_capacity_provider)

let make_daemon_circuit_breaker ?failure_count:(failure_count_ : integer option)
    ?status:(status_ : daemon_deployment_rollback_monitors_status option)
    ?threshold:(threshold_ : integer option) () =
  ({ failure_count = failure_count_; status = status_; threshold = threshold_ }
    : daemon_circuit_breaker)

let make_daemon_linux_parameters ?capabilities:(capabilities_ : kernel_capabilities option)
    ?devices:(devices_ : devices_list option)
    ?init_process_enabled:(init_process_enabled_ : boxed_boolean option)
    ?tmpfs:(tmpfs_ : tmpfs_list option) () =
  ({
     capabilities = capabilities_;
     devices = devices_;
     init_process_enabled = init_process_enabled_;
     tmpfs = tmpfs_;
   }
    : daemon_linux_parameters)

let make_daemon_container_definition ?name:(name_ : string_ option)
    ?memory:(memory_ : boxed_integer option)
    ?memory_reservation:(memory_reservation_ : boxed_integer option)
    ?repository_credentials:(repository_credentials_ : repository_credentials option)
    ?health_check:(health_check_ : health_check option) ?cpu:(cpu_ : integer option)
    ?essential:(essential_ : boxed_boolean option) ?entry_point:(entry_point_ : string_list option)
    ?command:(command_ : string_list option)
    ?working_directory:(working_directory_ : string_ option)
    ?environment_files:(environment_files_ : environment_files option)
    ?environment:(environment_ : environment_variables option)
    ?secrets:(secrets_ : secret_list option)
    ?readonly_root_filesystem:(readonly_root_filesystem_ : boxed_boolean option)
    ?mount_points:(mount_points_ : mount_point_list option)
    ?log_configuration:(log_configuration_ : log_configuration option)
    ?firelens_configuration:(firelens_configuration_ : firelens_configuration option)
    ?privileged:(privileged_ : boxed_boolean option) ?user:(user_ : string_ option)
    ?ulimits:(ulimits_ : ulimit_list option)
    ?linux_parameters:(linux_parameters_ : daemon_linux_parameters option)
    ?depends_on:(depends_on_ : container_dependencies option)
    ?start_timeout:(start_timeout_ : boxed_integer option)
    ?stop_timeout:(stop_timeout_ : boxed_integer option)
    ?system_controls:(system_controls_ : system_controls option)
    ?interactive:(interactive_ : boxed_boolean option)
    ?pseudo_terminal:(pseudo_terminal_ : boxed_boolean option)
    ?restart_policy:(restart_policy_ : container_restart_policy option) ~image:(image_ : string_) ()
    =
  ({
     name = name_;
     image = image_;
     memory = memory_;
     memory_reservation = memory_reservation_;
     repository_credentials = repository_credentials_;
     health_check = health_check_;
     cpu = cpu_;
     essential = essential_;
     entry_point = entry_point_;
     command = command_;
     working_directory = working_directory_;
     environment_files = environment_files_;
     environment = environment_;
     secrets = secrets_;
     readonly_root_filesystem = readonly_root_filesystem_;
     mount_points = mount_points_;
     log_configuration = log_configuration_;
     firelens_configuration = firelens_configuration_;
     privileged = privileged_;
     user = user_;
     ulimits = ulimits_;
     linux_parameters = linux_parameters_;
     depends_on = depends_on_;
     start_timeout = start_timeout_;
     stop_timeout = stop_timeout_;
     system_controls = system_controls_;
     interactive = interactive_;
     pseudo_terminal = pseudo_terminal_;
     restart_policy = restart_policy_;
   }
    : daemon_container_definition)

let make_daemon_container_image ?container_name:(container_name_ : string_ option)
    ?image_digest:(image_digest_ : string_ option) ?image:(image_ : string_ option) () =
  ({ container_name = container_name_; image_digest = image_digest_; image = image_ }
    : daemon_container_image)

let make_daemon_rollback ?reason:(reason_ : string_ option)
    ?started_at:(started_at_ : timestamp option)
    ?rollback_target_daemon_revision_arn:(rollback_target_daemon_revision_arn_ : string_ option)
    ?rollback_capacity_providers:(rollback_capacity_providers_ : string_list option) () =
  ({
     reason = reason_;
     started_at = started_at_;
     rollback_target_daemon_revision_arn = rollback_target_daemon_revision_arn_;
     rollback_capacity_providers = rollback_capacity_providers_;
   }
    : daemon_rollback)

let make_daemon_deployment_alarms
    ?status:(status_ : daemon_deployment_rollback_monitors_status option)
    ?alarm_names:(alarm_names_ : string_list option)
    ?triggered_alarm_names:(triggered_alarm_names_ : string_list option) () =
  ({ status = status_; alarm_names = alarm_names_; triggered_alarm_names = triggered_alarm_names_ }
    : daemon_deployment_alarms)

let make_daemon_deployment_capacity_provider ?arn:(arn_ : string_ option)
    ?running_instance_count:(running_instance_count_ : boxed_integer option)
    ?draining_instance_count:(draining_instance_count_ : boxed_integer option) () =
  ({
     arn = arn_;
     running_instance_count = running_instance_count_;
     draining_instance_count = draining_instance_count_;
   }
    : daemon_deployment_capacity_provider)

let make_daemon_deployment_revision_detail ?arn:(arn_ : string_ option)
    ?capacity_providers:(capacity_providers_ : daemon_deployment_capacity_provider_list option)
    ?total_running_instance_count:(total_running_instance_count_ : boxed_integer option)
    ?total_draining_instance_count:(total_draining_instance_count_ : boxed_integer option) () =
  ({
     arn = arn_;
     capacity_providers = capacity_providers_;
     total_running_instance_count = total_running_instance_count_;
     total_draining_instance_count = total_draining_instance_count_;
   }
    : daemon_deployment_revision_detail)

let make_daemon_deployment ?daemon_deployment_arn:(daemon_deployment_arn_ : string_ option)
    ?cluster_arn:(cluster_arn_ : string_ option) ?status:(status_ : daemon_deployment_status option)
    ?status_reason:(status_reason_ : string_ option)
    ?target_daemon_revision:(target_daemon_revision_ : daemon_deployment_revision_detail option)
    ?source_daemon_revisions:
      (source_daemon_revisions_ : daemon_deployment_revision_detail_list option)
    ?circuit_breaker:(circuit_breaker_ : daemon_circuit_breaker option)
    ?alarms:(alarms_ : daemon_deployment_alarms option)
    ?rollback:(rollback_ : daemon_rollback option)
    ?deployment_configuration:(deployment_configuration_ : daemon_deployment_configuration option)
    ?created_at:(created_at_ : timestamp option) ?started_at:(started_at_ : timestamp option)
    ?stopped_at:(stopped_at_ : timestamp option) ?finished_at:(finished_at_ : timestamp option) () =
  ({
     daemon_deployment_arn = daemon_deployment_arn_;
     cluster_arn = cluster_arn_;
     status = status_;
     status_reason = status_reason_;
     target_daemon_revision = target_daemon_revision_;
     source_daemon_revisions = source_daemon_revisions_;
     circuit_breaker = circuit_breaker_;
     alarms = alarms_;
     rollback = rollback_;
     deployment_configuration = deployment_configuration_;
     created_at = created_at_;
     started_at = started_at_;
     stopped_at = stopped_at_;
     finished_at = finished_at_;
   }
    : daemon_deployment)

let make_daemon_deployment_summary ?daemon_deployment_arn:(daemon_deployment_arn_ : string_ option)
    ?daemon_arn:(daemon_arn_ : string_ option) ?cluster_arn:(cluster_arn_ : string_ option)
    ?status:(status_ : daemon_deployment_status option)
    ?status_reason:(status_reason_ : string_ option)
    ?target_daemon_revision_arn:(target_daemon_revision_arn_ : string_ option)
    ?created_at:(created_at_ : timestamp option) ?started_at:(started_at_ : timestamp option)
    ?stopped_at:(stopped_at_ : timestamp option) ?finished_at:(finished_at_ : timestamp option) () =
  ({
     daemon_deployment_arn = daemon_deployment_arn_;
     daemon_arn = daemon_arn_;
     cluster_arn = cluster_arn_;
     status = status_;
     status_reason = status_reason_;
     target_daemon_revision_arn = target_daemon_revision_arn_;
     created_at = created_at_;
     started_at = started_at_;
     stopped_at = stopped_at_;
     finished_at = finished_at_;
   }
    : daemon_deployment_summary)

let make_daemon_revision_detail ?arn:(arn_ : string_ option)
    ?capacity_providers:(capacity_providers_ : daemon_capacity_provider_list option)
    ?total_running_count:(total_running_count_ : integer option) () =
  ({
     arn = arn_;
     capacity_providers = capacity_providers_;
     total_running_count = total_running_count_;
   }
    : daemon_revision_detail)

let make_daemon_detail ?daemon_arn:(daemon_arn_ : string_ option)
    ?cluster_arn:(cluster_arn_ : string_ option) ?status:(status_ : daemon_status option)
    ?current_revisions:(current_revisions_ : daemon_revision_detail_list option)
    ?deployment_arn:(deployment_arn_ : string_ option) ?created_at:(created_at_ : timestamp option)
    ?updated_at:(updated_at_ : timestamp option) () =
  ({
     daemon_arn = daemon_arn_;
     cluster_arn = cluster_arn_;
     status = status_;
     current_revisions = current_revisions_;
     deployment_arn = deployment_arn_;
     created_at = created_at_;
     updated_at = updated_at_;
   }
    : daemon_detail)

let make_daemon_revision ?daemon_revision_arn:(daemon_revision_arn_ : string_ option)
    ?cluster_arn:(cluster_arn_ : string_ option) ?daemon_arn:(daemon_arn_ : string_ option)
    ?daemon_task_definition_arn:(daemon_task_definition_arn_ : string_ option)
    ?created_at:(created_at_ : timestamp option)
    ?container_images:(container_images_ : daemon_container_images option)
    ?propagate_tags:(propagate_tags_ : daemon_propagate_tags option)
    ?enable_ecs_managed_tags:(enable_ecs_managed_tags_ : boxed_boolean option)
    ?enable_execute_command:(enable_execute_command_ : boxed_boolean option) () =
  ({
     daemon_revision_arn = daemon_revision_arn_;
     cluster_arn = cluster_arn_;
     daemon_arn = daemon_arn_;
     daemon_task_definition_arn = daemon_task_definition_arn_;
     created_at = created_at_;
     container_images = container_images_;
     propagate_tags = propagate_tags_;
     enable_ecs_managed_tags = enable_ecs_managed_tags_;
     enable_execute_command = enable_execute_command_;
   }
    : daemon_revision)

let make_daemon_summary ?daemon_arn:(daemon_arn_ : string_ option)
    ?status:(status_ : daemon_status option) ?created_at:(created_at_ : timestamp option)
    ?updated_at:(updated_at_ : timestamp option) () =
  ({
     daemon_arn = daemon_arn_;
     status = status_;
     created_at = created_at_;
     updated_at = updated_at_;
   }
    : daemon_summary)

let make_daemon_volume ?name:(name_ : string_ option) ?host:(host_ : host_volume_properties option)
    () =
  ({ name = name_; host = host_ } : daemon_volume)

let make_daemon_task_definition
    ?daemon_task_definition_arn:(daemon_task_definition_arn_ : string_ option)
    ?family:(family_ : string_ option) ?revision:(revision_ : integer option)
    ?task_role_arn:(task_role_arn_ : string_ option)
    ?execution_role_arn:(execution_role_arn_ : string_ option)
    ?container_definitions:(container_definitions_ : daemon_container_definition_list option)
    ?volumes:(volumes_ : daemon_volume_list option) ?cpu:(cpu_ : string_ option)
    ?memory:(memory_ : string_ option) ?status:(status_ : daemon_task_definition_status option)
    ?registered_at:(registered_at_ : timestamp option)
    ?delete_requested_at:(delete_requested_at_ : timestamp option)
    ?registered_by:(registered_by_ : string_ option) ?pid_mode:(pid_mode_ : daemon_pid_mode option)
    ?ipc_mode:(ipc_mode_ : daemon_ipc_mode option) () =
  ({
     daemon_task_definition_arn = daemon_task_definition_arn_;
     family = family_;
     revision = revision_;
     task_role_arn = task_role_arn_;
     execution_role_arn = execution_role_arn_;
     container_definitions = container_definitions_;
     volumes = volumes_;
     cpu = cpu_;
     memory = memory_;
     status = status_;
     registered_at = registered_at_;
     delete_requested_at = delete_requested_at_;
     registered_by = registered_by_;
     pid_mode = pid_mode_;
     ipc_mode = ipc_mode_;
   }
    : daemon_task_definition)

let make_daemon_task_definition_summary ?arn:(arn_ : string_ option)
    ?registered_at:(registered_at_ : timestamp option)
    ?registered_by:(registered_by_ : string_ option)
    ?delete_requested_at:(delete_requested_at_ : timestamp option)
    ?status:(status_ : daemon_task_definition_status option) () =
  ({
     arn = arn_;
     registered_at = registered_at_;
     registered_by = registered_by_;
     delete_requested_at = delete_requested_at_;
     status = status_;
   }
    : daemon_task_definition_summary)

let make_delete_attributes_response ?attributes:(attributes_ : attributes option) () =
  ({ attributes = attributes_ } : delete_attributes_response)

let make_delete_attributes_request ?cluster:(cluster_ : string_ option)
    ~attributes:(attributes_ : attributes) () =
  ({ cluster = cluster_; attributes = attributes_ } : delete_attributes_request)

let make_delete_capacity_provider_response
    ?capacity_provider:(capacity_provider_ : capacity_provider option) () =
  ({ capacity_provider = capacity_provider_ } : delete_capacity_provider_response)

let make_delete_capacity_provider_request ?cluster:(cluster_ : string_ option)
    ~capacity_provider:(capacity_provider_ : string_) () =
  ({ capacity_provider = capacity_provider_; cluster = cluster_ }
    : delete_capacity_provider_request)

let make_delete_cluster_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : delete_cluster_response)

let make_delete_cluster_request ~cluster:(cluster_ : string_) () =
  ({ cluster = cluster_ } : delete_cluster_request)

let make_delete_daemon_response ?daemon_arn:(daemon_arn_ : string_ option)
    ?status:(status_ : daemon_status option) ?created_at:(created_at_ : timestamp option)
    ?updated_at:(updated_at_ : timestamp option) ?deployment_arn:(deployment_arn_ : string_ option)
    () =
  ({
     daemon_arn = daemon_arn_;
     status = status_;
     created_at = created_at_;
     updated_at = updated_at_;
     deployment_arn = deployment_arn_;
   }
    : delete_daemon_response)

let make_delete_daemon_request ~daemon_arn:(daemon_arn_ : string_) () =
  ({ daemon_arn = daemon_arn_ } : delete_daemon_request)

let make_delete_daemon_task_definition_response
    ?daemon_task_definition_arn:(daemon_task_definition_arn_ : string_ option) () =
  ({ daemon_task_definition_arn = daemon_task_definition_arn_ }
    : delete_daemon_task_definition_response)

let make_delete_daemon_task_definition_request
    ~daemon_task_definition:(daemon_task_definition_ : string_) () =
  ({ daemon_task_definition = daemon_task_definition_ } : delete_daemon_task_definition_request)

let make_delete_express_gateway_service_response
    ?service:(service_ : ecs_express_gateway_service option) () =
  ({ service = service_ } : delete_express_gateway_service_response)

let make_delete_express_gateway_service_request ~service_arn:(service_arn_ : string_) () =
  ({ service_arn = service_arn_ } : delete_express_gateway_service_request)

let make_delete_service_response ?service:(service_ : service option) () =
  ({ service = service_ } : delete_service_response)

let make_delete_service_request ?cluster:(cluster_ : string_ option)
    ?force:(force_ : boxed_boolean option) ~service:(service_ : string_) () =
  ({ cluster = cluster_; service = service_; force = force_ } : delete_service_request)

let make_failure ?arn:(arn_ : string_ option) ?reason:(reason_ : string_ option)
    ?detail:(detail_ : string_ option) () =
  ({ arn = arn_; reason = reason_; detail = detail_ } : failure)

let make_delete_task_definitions_response
    ?task_definitions:(task_definitions_ : task_definition_list option)
    ?failures:(failures_ : failures option) () =
  ({ task_definitions = task_definitions_; failures = failures_ }
    : delete_task_definitions_response)

let make_delete_task_definitions_request ~task_definitions:(task_definitions_ : string_list) () =
  ({ task_definitions = task_definitions_ } : delete_task_definitions_request)

let make_delete_task_set_response ?task_set:(task_set_ : task_set option) () =
  ({ task_set = task_set_ } : delete_task_set_response)

let make_delete_task_set_request ?force:(force_ : boxed_boolean option)
    ~cluster:(cluster_ : string_) ~service:(service_ : string_) ~task_set:(task_set_ : string_) () =
  ({ cluster = cluster_; service = service_; task_set = task_set_; force = force_ }
    : delete_task_set_request)

let make_deployment_lifecycle_hook_detail ?hook_id:(hook_id_ : string_ option)
    ?target_type:(target_type_ : deployment_lifecycle_hook_target_type option)
    ?target_arn:(target_arn_ : string_ option)
    ?status:(status_ : deployment_lifecycle_hook_status option)
    ?expires_at:(expires_at_ : timestamp option)
    ?timeout_action:(timeout_action_ : deployment_lifecycle_hook_action option) () =
  ({
     hook_id = hook_id_;
     target_type = target_type_;
     target_arn = target_arn_;
     status = status_;
     expires_at = expires_at_;
     timeout_action = timeout_action_;
   }
    : deployment_lifecycle_hook_detail)

let make_deregister_container_instance_response
    ?container_instance:(container_instance_ : container_instance option) () =
  ({ container_instance = container_instance_ } : deregister_container_instance_response)

let make_deregister_container_instance_request ?cluster:(cluster_ : string_ option)
    ?force:(force_ : boxed_boolean option) ~container_instance:(container_instance_ : string_) () =
  ({ cluster = cluster_; container_instance = container_instance_; force = force_ }
    : deregister_container_instance_request)

let make_describe_capacity_providers_response
    ?capacity_providers:(capacity_providers_ : capacity_providers option)
    ?failures:(failures_ : failures option) ?next_token:(next_token_ : string_ option) () =
  ({ capacity_providers = capacity_providers_; failures = failures_; next_token = next_token_ }
    : describe_capacity_providers_response)

let make_describe_capacity_providers_request
    ?capacity_providers:(capacity_providers_ : string_list option)
    ?cluster:(cluster_ : string_ option) ?include_:(include__ : capacity_provider_field_list option)
    ?max_results:(max_results_ : boxed_integer option) ?next_token:(next_token_ : string_ option) ()
    =
  ({
     capacity_providers = capacity_providers_;
     cluster = cluster_;
     include_ = include__;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_capacity_providers_request)

let make_describe_clusters_response ?clusters:(clusters_ : clusters option)
    ?failures:(failures_ : failures option) () =
  ({ clusters = clusters_; failures = failures_ } : describe_clusters_response)

let make_describe_clusters_request ?clusters:(clusters_ : string_list option)
    ?include_:(include__ : cluster_field_list option) () =
  ({ clusters = clusters_; include_ = include__ } : describe_clusters_request)

let make_describe_container_instances_response
    ?container_instances:(container_instances_ : container_instances option)
    ?failures:(failures_ : failures option) () =
  ({ container_instances = container_instances_; failures = failures_ }
    : describe_container_instances_response)

let make_describe_container_instances_request ?cluster:(cluster_ : string_ option)
    ?include_:(include__ : container_instance_field_list option)
    ~container_instances:(container_instances_ : string_list) () =
  ({ cluster = cluster_; container_instances = container_instances_; include_ = include__ }
    : describe_container_instances_request)

let make_describe_daemon_response ?daemon:(daemon_ : daemon_detail option) () =
  ({ daemon = daemon_ } : describe_daemon_response)

let make_describe_daemon_request ~daemon_arn:(daemon_arn_ : string_) () =
  ({ daemon_arn = daemon_arn_ } : describe_daemon_request)

let make_describe_daemon_deployments_response ?failures:(failures_ : failures option)
    ?daemon_deployments:(daemon_deployments_ : daemon_deployment_list option) () =
  ({ failures = failures_; daemon_deployments = daemon_deployments_ }
    : describe_daemon_deployments_response)

let make_describe_daemon_deployments_request
    ~daemon_deployment_arns:(daemon_deployment_arns_ : string_list) () =
  ({ daemon_deployment_arns = daemon_deployment_arns_ } : describe_daemon_deployments_request)

let make_describe_daemon_revisions_response
    ?daemon_revisions:(daemon_revisions_ : daemon_revisions option)
    ?failures:(failures_ : failures option) () =
  ({ daemon_revisions = daemon_revisions_; failures = failures_ }
    : describe_daemon_revisions_response)

let make_describe_daemon_revisions_request
    ~daemon_revision_arns:(daemon_revision_arns_ : string_list) () =
  ({ daemon_revision_arns = daemon_revision_arns_ } : describe_daemon_revisions_request)

let make_describe_daemon_task_definition_response
    ?daemon_task_definition:(daemon_task_definition_ : daemon_task_definition option) () =
  ({ daemon_task_definition = daemon_task_definition_ } : describe_daemon_task_definition_response)

let make_describe_daemon_task_definition_request
    ~daemon_task_definition:(daemon_task_definition_ : string_) () =
  ({ daemon_task_definition = daemon_task_definition_ } : describe_daemon_task_definition_request)

let make_describe_express_gateway_service_response
    ?service:(service_ : ecs_express_gateway_service option) () =
  ({ service = service_ } : describe_express_gateway_service_response)

let make_describe_express_gateway_service_request
    ?include_:(include__ : express_gateway_service_include_list option)
    ~service_arn:(service_arn_ : string_) () =
  ({ service_arn = service_arn_; include_ = include__ } : describe_express_gateway_service_request)

let make_service_deployment_alarms
    ?status:(status_ : service_deployment_rollback_monitors_status option)
    ?alarm_names:(alarm_names_ : string_list option)
    ?triggered_alarm_names:(triggered_alarm_names_ : string_list option) () =
  ({ status = status_; alarm_names = alarm_names_; triggered_alarm_names = triggered_alarm_names_ }
    : service_deployment_alarms)

let make_service_deployment_circuit_breaker
    ?status:(status_ : service_deployment_rollback_monitors_status option)
    ?failure_count:(failure_count_ : integer option) ?threshold:(threshold_ : integer option) () =
  ({ status = status_; failure_count = failure_count_; threshold = threshold_ }
    : service_deployment_circuit_breaker)

let make_rollback ?reason:(reason_ : string_ option) ?started_at:(started_at_ : timestamp option)
    ?service_revision_arn:(service_revision_arn_ : string_ option) () =
  ({ reason = reason_; started_at = started_at_; service_revision_arn = service_revision_arn_ }
    : rollback)

let make_service_revision_summary ?arn:(arn_ : string_ option)
    ?requested_task_count:(requested_task_count_ : integer option)
    ?running_task_count:(running_task_count_ : integer option)
    ?pending_task_count:(pending_task_count_ : integer option)
    ?requested_test_traffic_weight:(requested_test_traffic_weight_ : double option)
    ?requested_production_traffic_weight:(requested_production_traffic_weight_ : double option) () =
  ({
     arn = arn_;
     requested_task_count = requested_task_count_;
     running_task_count = running_task_count_;
     pending_task_count = pending_task_count_;
     requested_test_traffic_weight = requested_test_traffic_weight_;
     requested_production_traffic_weight = requested_production_traffic_weight_;
   }
    : service_revision_summary)

let make_service_deployment ?service_deployment_arn:(service_deployment_arn_ : string_ option)
    ?service_arn:(service_arn_ : string_ option) ?cluster_arn:(cluster_arn_ : string_ option)
    ?created_at:(created_at_ : timestamp option) ?started_at:(started_at_ : timestamp option)
    ?finished_at:(finished_at_ : timestamp option) ?stopped_at:(stopped_at_ : timestamp option)
    ?updated_at:(updated_at_ : timestamp option)
    ?source_service_revisions:(source_service_revisions_ : service_revisions_summary_list option)
    ?target_service_revision:(target_service_revision_ : service_revision_summary option)
    ?status:(status_ : service_deployment_status option)
    ?status_reason:(status_reason_ : string_ option)
    ?lifecycle_stage:(lifecycle_stage_ : service_deployment_lifecycle_stage option)
    ?lifecycle_hook_details:(lifecycle_hook_details_ : deployment_lifecycle_hook_detail_list option)
    ?deployment_configuration:(deployment_configuration_ : deployment_configuration option)
    ?rollback:(rollback_ : rollback option)
    ?deployment_circuit_breaker:
      (deployment_circuit_breaker_ : service_deployment_circuit_breaker option)
    ?alarms:(alarms_ : service_deployment_alarms option) () =
  ({
     service_deployment_arn = service_deployment_arn_;
     service_arn = service_arn_;
     cluster_arn = cluster_arn_;
     created_at = created_at_;
     started_at = started_at_;
     finished_at = finished_at_;
     stopped_at = stopped_at_;
     updated_at = updated_at_;
     source_service_revisions = source_service_revisions_;
     target_service_revision = target_service_revision_;
     status = status_;
     status_reason = status_reason_;
     lifecycle_stage = lifecycle_stage_;
     lifecycle_hook_details = lifecycle_hook_details_;
     deployment_configuration = deployment_configuration_;
     rollback = rollback_;
     deployment_circuit_breaker = deployment_circuit_breaker_;
     alarms = alarms_;
   }
    : service_deployment)

let make_describe_service_deployments_response
    ?service_deployments:(service_deployments_ : service_deployments option)
    ?failures:(failures_ : failures option) () =
  ({ service_deployments = service_deployments_; failures = failures_ }
    : describe_service_deployments_response)

let make_describe_service_deployments_request
    ~service_deployment_arns:(service_deployment_arns_ : string_list) () =
  ({ service_deployment_arns = service_deployment_arns_ } : describe_service_deployments_request)

let make_managed_log_group ?arn:(arn_ : string_ option)
    ?status_reason:(status_reason_ : string_ option) ~status:(status_ : managed_resource_status)
    ~updated_at:(updated_at_ : timestamp) ~log_group_name:(log_group_name_ : string_) () =
  ({
     arn = arn_;
     status = status_;
     status_reason = status_reason_;
     updated_at = updated_at_;
     log_group_name = log_group_name_;
   }
    : managed_log_group)

let make_managed_security_group ?arn:(arn_ : string_ option)
    ?status_reason:(status_reason_ : string_ option) ~status:(status_ : managed_resource_status)
    ~updated_at:(updated_at_ : timestamp) () =
  ({ arn = arn_; status = status_; status_reason = status_reason_; updated_at = updated_at_ }
    : managed_security_group)

let make_managed_metric_alarm ?arn:(arn_ : string_ option)
    ?status_reason:(status_reason_ : string_ option) ~status:(status_ : managed_resource_status)
    ~updated_at:(updated_at_ : timestamp) () =
  ({ arn = arn_; status = status_; status_reason = status_reason_; updated_at = updated_at_ }
    : managed_metric_alarm)

let make_managed_application_auto_scaling_policy ?arn:(arn_ : string_ option)
    ?status_reason:(status_reason_ : string_ option) ~status:(status_ : managed_resource_status)
    ~updated_at:(updated_at_ : timestamp) ~policy_type:(policy_type_ : string_)
    ~target_value:(target_value_ : double) ~metric:(metric_ : string_) () =
  ({
     arn = arn_;
     status = status_;
     status_reason = status_reason_;
     updated_at = updated_at_;
     policy_type = policy_type_;
     target_value = target_value_;
     metric = metric_;
   }
    : managed_application_auto_scaling_policy)

let make_managed_scalable_target ?arn:(arn_ : string_ option)
    ?status_reason:(status_reason_ : string_ option) ~status:(status_ : managed_resource_status)
    ~updated_at:(updated_at_ : timestamp) ~min_capacity:(min_capacity_ : integer)
    ~max_capacity:(max_capacity_ : integer) () =
  ({
     arn = arn_;
     status = status_;
     status_reason = status_reason_;
     updated_at = updated_at_;
     min_capacity = min_capacity_;
     max_capacity = max_capacity_;
   }
    : managed_scalable_target)

let make_managed_auto_scaling ?scalable_target:(scalable_target_ : managed_scalable_target option)
    ?application_auto_scaling_policies:
      (application_auto_scaling_policies_ : managed_application_auto_scaling_policies option) () =
  ({
     scalable_target = scalable_target_;
     application_auto_scaling_policies = application_auto_scaling_policies_;
   }
    : managed_auto_scaling)

let make_managed_target_group ?arn:(arn_ : string_ option)
    ?status_reason:(status_reason_ : string_ option) ~status:(status_ : managed_resource_status)
    ~updated_at:(updated_at_ : timestamp) ~health_check_path:(health_check_path_ : string_)
    ~health_check_port:(health_check_port_ : integer) ~port:(port_ : integer) () =
  ({
     arn = arn_;
     status = status_;
     status_reason = status_reason_;
     updated_at = updated_at_;
     health_check_path = health_check_path_;
     health_check_port = health_check_port_;
     port = port_;
   }
    : managed_target_group)

let make_managed_listener_rule ?arn:(arn_ : string_ option)
    ?status_reason:(status_reason_ : string_ option) ~status:(status_ : managed_resource_status)
    ~updated_at:(updated_at_ : timestamp) () =
  ({ arn = arn_; status = status_; status_reason = status_reason_; updated_at = updated_at_ }
    : managed_listener_rule)

let make_managed_listener ?arn:(arn_ : string_ option)
    ?status_reason:(status_reason_ : string_ option) ~status:(status_ : managed_resource_status)
    ~updated_at:(updated_at_ : timestamp) () =
  ({ arn = arn_; status = status_; status_reason = status_reason_; updated_at = updated_at_ }
    : managed_listener)

let make_managed_certificate ?arn:(arn_ : string_ option)
    ?status_reason:(status_reason_ : string_ option) ~status:(status_ : managed_resource_status)
    ~updated_at:(updated_at_ : timestamp) ~domain_name:(domain_name_ : string_) () =
  ({
     arn = arn_;
     status = status_;
     status_reason = status_reason_;
     updated_at = updated_at_;
     domain_name = domain_name_;
   }
    : managed_certificate)

let make_managed_load_balancer ?arn:(arn_ : string_ option)
    ?status_reason:(status_reason_ : string_ option) ?subnet_ids:(subnet_ids_ : string_list option)
    ?security_group_ids:(security_group_ids_ : string_list option)
    ~status:(status_ : managed_resource_status) ~updated_at:(updated_at_ : timestamp)
    ~scheme:(scheme_ : string_) () =
  ({
     arn = arn_;
     status = status_;
     status_reason = status_reason_;
     updated_at = updated_at_;
     scheme = scheme_;
     subnet_ids = subnet_ids_;
     security_group_ids = security_group_ids_;
   }
    : managed_load_balancer)

let make_managed_ingress_path ?load_balancer:(load_balancer_ : managed_load_balancer option)
    ?load_balancer_security_groups:(load_balancer_security_groups_ : managed_security_groups option)
    ?certificate:(certificate_ : managed_certificate option)
    ?listener:(listener_ : managed_listener option) ?rule:(rule_ : managed_listener_rule option)
    ?target_groups:(target_groups_ : managed_target_groups option)
    ~access_type:(access_type_ : access_type) ~endpoint:(endpoint_ : string_) () =
  ({
     access_type = access_type_;
     endpoint = endpoint_;
     load_balancer = load_balancer_;
     load_balancer_security_groups = load_balancer_security_groups_;
     certificate = certificate_;
     listener = listener_;
     rule = rule_;
     target_groups = target_groups_;
   }
    : managed_ingress_path)

let make_ecs_managed_resources ?ingress_paths:(ingress_paths_ : managed_ingress_paths option)
    ?auto_scaling:(auto_scaling_ : managed_auto_scaling option)
    ?metric_alarms:(metric_alarms_ : managed_metric_alarms option)
    ?service_security_groups:(service_security_groups_ : managed_security_groups option)
    ?log_groups:(log_groups_ : managed_log_groups option) () =
  ({
     ingress_paths = ingress_paths_;
     auto_scaling = auto_scaling_;
     metric_alarms = metric_alarms_;
     service_security_groups = service_security_groups_;
     log_groups = log_groups_;
   }
    : ecs_managed_resources)

let make_service_revision_load_balancer ?target_group_arn:(target_group_arn_ : string_ option)
    ?production_listener_rule:(production_listener_rule_ : string_ option) () =
  ({ target_group_arn = target_group_arn_; production_listener_rule = production_listener_rule_ }
    : service_revision_load_balancer)

let make_resolved_configuration
    ?load_balancers:(load_balancers_ : service_revision_load_balancers option) () =
  ({ load_balancers = load_balancers_ } : resolved_configuration)

let make_service_revision ?service_revision_arn:(service_revision_arn_ : string_ option)
    ?service_arn:(service_arn_ : string_ option) ?cluster_arn:(cluster_arn_ : string_ option)
    ?task_definition:(task_definition_ : string_ option)
    ?capacity_provider_strategy:(capacity_provider_strategy_ : capacity_provider_strategy option)
    ?launch_type:(launch_type_ : launch_type option)
    ?platform_version:(platform_version_ : string_ option)
    ?platform_family:(platform_family_ : string_ option)
    ?load_balancers:(load_balancers_ : load_balancers option)
    ?service_registries:(service_registries_ : service_registries option)
    ?network_configuration:(network_configuration_ : network_configuration option)
    ?container_images:(container_images_ : container_images option)
    ?guard_duty_enabled:(guard_duty_enabled_ : boolean_ option)
    ?service_connect_configuration:
      (service_connect_configuration_ : service_connect_configuration option)
    ?volume_configurations:(volume_configurations_ : service_volume_configurations option)
    ?fargate_ephemeral_storage:(fargate_ephemeral_storage_ : deployment_ephemeral_storage option)
    ?created_at:(created_at_ : timestamp option)
    ?vpc_lattice_configurations:(vpc_lattice_configurations_ : vpc_lattice_configurations option)
    ?resolved_configuration:(resolved_configuration_ : resolved_configuration option)
    ?ecs_managed_resources:(ecs_managed_resources_ : ecs_managed_resources option)
    ?monitoring:(monitoring_ : monitoring_configuration option) () =
  ({
     service_revision_arn = service_revision_arn_;
     service_arn = service_arn_;
     cluster_arn = cluster_arn_;
     task_definition = task_definition_;
     capacity_provider_strategy = capacity_provider_strategy_;
     launch_type = launch_type_;
     platform_version = platform_version_;
     platform_family = platform_family_;
     load_balancers = load_balancers_;
     service_registries = service_registries_;
     network_configuration = network_configuration_;
     container_images = container_images_;
     guard_duty_enabled = guard_duty_enabled_;
     service_connect_configuration = service_connect_configuration_;
     volume_configurations = volume_configurations_;
     fargate_ephemeral_storage = fargate_ephemeral_storage_;
     created_at = created_at_;
     vpc_lattice_configurations = vpc_lattice_configurations_;
     resolved_configuration = resolved_configuration_;
     ecs_managed_resources = ecs_managed_resources_;
     monitoring = monitoring_;
   }
    : service_revision)

let make_describe_service_revisions_response
    ?service_revisions:(service_revisions_ : service_revisions option)
    ?failures:(failures_ : failures option) () =
  ({ service_revisions = service_revisions_; failures = failures_ }
    : describe_service_revisions_response)

let make_describe_service_revisions_request
    ~service_revision_arns:(service_revision_arns_ : string_list) () =
  ({ service_revision_arns = service_revision_arns_ } : describe_service_revisions_request)

let make_describe_services_response ?services:(services_ : services option)
    ?failures:(failures_ : failures option) () =
  ({ services = services_; failures = failures_ } : describe_services_response)

let make_describe_services_request ?cluster:(cluster_ : string_ option)
    ?include_:(include__ : service_field_list option) ~services:(services_ : string_list) () =
  ({ cluster = cluster_; services = services_; include_ = include__ } : describe_services_request)

let make_describe_task_sets_response ?task_sets:(task_sets_ : task_sets option)
    ?failures:(failures_ : failures option) () =
  ({ task_sets = task_sets_; failures = failures_ } : describe_task_sets_response)

let make_describe_task_sets_request ?task_sets:(task_sets_ : string_list option)
    ?include_:(include__ : task_set_field_list option) ~cluster:(cluster_ : string_)
    ~service:(service_ : string_) () =
  ({ cluster = cluster_; service = service_; task_sets = task_sets_; include_ = include__ }
    : describe_task_sets_request)

let make_task_ephemeral_storage ?size_in_gi_b:(size_in_gi_b_ : integer option)
    ?kms_key_id:(kms_key_id_ : string_ option) () =
  ({ size_in_gi_b = size_in_gi_b_; kms_key_id = kms_key_id_ } : task_ephemeral_storage)

let make_inference_accelerator_override ?device_name:(device_name_ : string_ option)
    ?device_type:(device_type_ : string_ option) () =
  ({ device_name = device_name_; device_type = device_type_ } : inference_accelerator_override)

let make_task_override ?container_overrides:(container_overrides_ : container_overrides option)
    ?cpu:(cpu_ : string_ option)
    ?inference_accelerator_overrides:
      (inference_accelerator_overrides_ : inference_accelerator_overrides option)
    ?execution_role_arn:(execution_role_arn_ : string_ option) ?memory:(memory_ : string_ option)
    ?task_role_arn:(task_role_arn_ : string_ option)
    ?ephemeral_storage:(ephemeral_storage_ : ephemeral_storage option) () =
  ({
     container_overrides = container_overrides_;
     cpu = cpu_;
     inference_accelerator_overrides = inference_accelerator_overrides_;
     execution_role_arn = execution_role_arn_;
     memory = memory_;
     task_role_arn = task_role_arn_;
     ephemeral_storage = ephemeral_storage_;
   }
    : task_override)

let make_task ?attachments:(attachments_ : attachments option)
    ?attributes:(attributes_ : attributes option)
    ?availability_zone:(availability_zone_ : string_ option)
    ?capacity_provider_name:(capacity_provider_name_ : string_ option)
    ?cluster_arn:(cluster_arn_ : string_ option) ?connectivity:(connectivity_ : connectivity option)
    ?connectivity_at:(connectivity_at_ : timestamp option)
    ?container_instance_arn:(container_instance_arn_ : string_ option)
    ?containers:(containers_ : containers option) ?cpu:(cpu_ : string_ option)
    ?created_at:(created_at_ : timestamp option) ?desired_status:(desired_status_ : string_ option)
    ?enable_execute_command:(enable_execute_command_ : boolean_ option)
    ?execution_stopped_at:(execution_stopped_at_ : timestamp option)
    ?group:(group_ : string_ option) ?health_status:(health_status_ : health_status option)
    ?inference_accelerators:(inference_accelerators_ : inference_accelerators option)
    ?last_status:(last_status_ : string_ option) ?launch_type:(launch_type_ : launch_type option)
    ?memory:(memory_ : string_ option) ?overrides:(overrides_ : task_override option)
    ?platform_version:(platform_version_ : string_ option)
    ?platform_family:(platform_family_ : string_ option)
    ?pull_started_at:(pull_started_at_ : timestamp option)
    ?pull_stopped_at:(pull_stopped_at_ : timestamp option)
    ?started_at:(started_at_ : timestamp option) ?started_by:(started_by_ : string_ option)
    ?stop_code:(stop_code_ : task_stop_code option) ?stopped_at:(stopped_at_ : timestamp option)
    ?stopped_reason:(stopped_reason_ : string_ option)
    ?stopping_at:(stopping_at_ : timestamp option) ?tags:(tags_ : tags option)
    ?task_arn:(task_arn_ : string_ option)
    ?task_definition_arn:(task_definition_arn_ : string_ option) ?version:(version_ : long option)
    ?ephemeral_storage:(ephemeral_storage_ : ephemeral_storage option)
    ?fargate_ephemeral_storage:(fargate_ephemeral_storage_ : task_ephemeral_storage option) () =
  ({
     attachments = attachments_;
     attributes = attributes_;
     availability_zone = availability_zone_;
     capacity_provider_name = capacity_provider_name_;
     cluster_arn = cluster_arn_;
     connectivity = connectivity_;
     connectivity_at = connectivity_at_;
     container_instance_arn = container_instance_arn_;
     containers = containers_;
     cpu = cpu_;
     created_at = created_at_;
     desired_status = desired_status_;
     enable_execute_command = enable_execute_command_;
     execution_stopped_at = execution_stopped_at_;
     group = group_;
     health_status = health_status_;
     inference_accelerators = inference_accelerators_;
     last_status = last_status_;
     launch_type = launch_type_;
     memory = memory_;
     overrides = overrides_;
     platform_version = platform_version_;
     platform_family = platform_family_;
     pull_started_at = pull_started_at_;
     pull_stopped_at = pull_stopped_at_;
     started_at = started_at_;
     started_by = started_by_;
     stop_code = stop_code_;
     stopped_at = stopped_at_;
     stopped_reason = stopped_reason_;
     stopping_at = stopping_at_;
     tags = tags_;
     task_arn = task_arn_;
     task_definition_arn = task_definition_arn_;
     version = version_;
     ephemeral_storage = ephemeral_storage_;
     fargate_ephemeral_storage = fargate_ephemeral_storage_;
   }
    : task)

let make_describe_tasks_response ?tasks:(tasks_ : tasks option)
    ?failures:(failures_ : failures option) () =
  ({ tasks = tasks_; failures = failures_ } : describe_tasks_response)

let make_describe_tasks_request ?cluster:(cluster_ : string_ option)
    ?include_:(include__ : task_field_list option) ~tasks:(tasks_ : string_list) () =
  ({ cluster = cluster_; tasks = tasks_; include_ = include__ } : describe_tasks_request)

let make_session ?session_id:(session_id_ : string_ option)
    ?stream_url:(stream_url_ : string_ option) ?token_value:(token_value_ : sensitive_string option)
    () =
  ({ session_id = session_id_; stream_url = stream_url_; token_value = token_value_ } : session)

let make_execute_command_response ?cluster_arn:(cluster_arn_ : string_ option)
    ?container_arn:(container_arn_ : string_ option)
    ?container_name:(container_name_ : string_ option) ?interactive:(interactive_ : boolean_ option)
    ?session:(session_ : session option) ?task_arn:(task_arn_ : string_ option) () =
  ({
     cluster_arn = cluster_arn_;
     container_arn = container_arn_;
     container_name = container_name_;
     interactive = interactive_;
     session = session_;
     task_arn = task_arn_;
   }
    : execute_command_response)

let make_execute_command_request ?cluster:(cluster_ : string_ option)
    ?container:(container_ : string_ option) ~command:(command_ : string_)
    ~interactive:(interactive_ : boolean_) ~task:(task_ : string_) () =
  ({
     cluster = cluster_;
     container = container_;
     command = command_;
     interactive = interactive_;
     task = task_;
   }
    : execute_command_request)

let make_protected_task ?task_arn:(task_arn_ : string_ option)
    ?protection_enabled:(protection_enabled_ : boolean_ option)
    ?expiration_date:(expiration_date_ : timestamp option) () =
  ({
     task_arn = task_arn_;
     protection_enabled = protection_enabled_;
     expiration_date = expiration_date_;
   }
    : protected_task)

let make_get_task_protection_response ?protected_tasks:(protected_tasks_ : protected_tasks option)
    ?failures:(failures_ : failures option) () =
  ({ protected_tasks = protected_tasks_; failures = failures_ } : get_task_protection_response)

let make_get_task_protection_request ?tasks:(tasks_ : string_list option)
    ~cluster:(cluster_ : string_) () =
  ({ cluster = cluster_; tasks = tasks_ } : get_task_protection_request)

let make_instance_launch_template_update
    ?ec2_instance_profile_arn:(ec2_instance_profile_arn_ : string_ option)
    ?network_configuration:(network_configuration_ : managed_instances_network_configuration option)
    ?storage_configuration:(storage_configuration_ : managed_instances_storage_configuration option)
    ?instance_metadata_tags_propagation:(instance_metadata_tags_propagation_ : boxed_boolean option)
    ?local_storage_configuration:
      (local_storage_configuration_ : managed_instances_local_storage_configuration option)
    ?monitoring:(monitoring_ : managed_instances_monitoring_options option)
    ?instance_requirements:(instance_requirements_ : instance_requirements_request option)
    ?capacity_reservations:(capacity_reservations_ : capacity_reservation_request option) () =
  ({
     ec2_instance_profile_arn = ec2_instance_profile_arn_;
     network_configuration = network_configuration_;
     storage_configuration = storage_configuration_;
     instance_metadata_tags_propagation = instance_metadata_tags_propagation_;
     local_storage_configuration = local_storage_configuration_;
     monitoring = monitoring_;
     instance_requirements = instance_requirements_;
     capacity_reservations = capacity_reservations_;
   }
    : instance_launch_template_update)

let make_list_attributes_response ?attributes:(attributes_ : attributes option)
    ?next_token:(next_token_ : string_ option) () =
  ({ attributes = attributes_; next_token = next_token_ } : list_attributes_response)

let make_list_attributes_request ?cluster:(cluster_ : string_ option)
    ?attribute_name:(attribute_name_ : string_ option)
    ?attribute_value:(attribute_value_ : string_ option) ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : boxed_integer option) ~target_type:(target_type_ : target_type) ()
    =
  ({
     cluster = cluster_;
     target_type = target_type_;
     attribute_name = attribute_name_;
     attribute_value = attribute_value_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_attributes_request)

let make_list_clusters_response ?cluster_arns:(cluster_arns_ : string_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ cluster_arns = cluster_arns_; next_token = next_token_ } : list_clusters_response)

let make_list_clusters_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : boxed_integer option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_clusters_request)

let make_list_container_instances_response
    ?container_instance_arns:(container_instance_arns_ : string_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ container_instance_arns = container_instance_arns_; next_token = next_token_ }
    : list_container_instances_response)

let make_list_container_instances_request ?cluster:(cluster_ : string_ option)
    ?filter:(filter_ : string_ option) ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : boxed_integer option)
    ?status:(status_ : container_instance_status option) () =
  ({
     cluster = cluster_;
     filter = filter_;
     next_token = next_token_;
     max_results = max_results_;
     status = status_;
   }
    : list_container_instances_request)

let make_list_daemon_deployments_response ?next_token:(next_token_ : string_ option)
    ?daemon_deployments:(daemon_deployments_ : daemon_deployment_summary_list option) () =
  ({ next_token = next_token_; daemon_deployments = daemon_deployments_ }
    : list_daemon_deployments_response)

let make_list_daemon_deployments_request ?status:(status_ : daemon_deployment_status_list option)
    ?created_at:(created_at_ : created_at option) ?max_results:(max_results_ : boxed_integer option)
    ?next_token:(next_token_ : string_ option) ~daemon_arn:(daemon_arn_ : string_) () =
  ({
     daemon_arn = daemon_arn_;
     status = status_;
     created_at = created_at_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_daemon_deployments_request)

let make_list_daemon_task_definitions_response
    ?daemon_task_definitions:(daemon_task_definitions_ : daemon_task_definition_summaries option)
    ?next_token:(next_token_ : string_ option) () =
  ({ daemon_task_definitions = daemon_task_definitions_; next_token = next_token_ }
    : list_daemon_task_definitions_response)

let make_list_daemon_task_definitions_request ?family_prefix:(family_prefix_ : string_ option)
    ?family:(family_ : string_ option)
    ?revision:(revision_ : daemon_task_definition_revision_filter option)
    ?status:(status_ : daemon_task_definition_status_filter option)
    ?sort:(sort_ : sort_order option) ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : boxed_integer option) () =
  ({
     family_prefix = family_prefix_;
     family = family_;
     revision = revision_;
     status = status_;
     sort = sort_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_daemon_task_definitions_request)

let make_list_daemons_response
    ?daemon_summaries_list:(daemon_summaries_list_ : daemon_summaries_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ daemon_summaries_list = daemon_summaries_list_; next_token = next_token_ }
    : list_daemons_response)

let make_list_daemons_request ?cluster_arn:(cluster_arn_ : string_ option)
    ?capacity_provider_arns:(capacity_provider_arns_ : string_list option)
    ?max_results:(max_results_ : boxed_integer option) ?next_token:(next_token_ : string_ option) ()
    =
  ({
     cluster_arn = cluster_arn_;
     capacity_provider_arns = capacity_provider_arns_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_daemons_request)

let make_service_deployment_brief ?service_deployment_arn:(service_deployment_arn_ : string_ option)
    ?service_arn:(service_arn_ : string_ option) ?cluster_arn:(cluster_arn_ : string_ option)
    ?started_at:(started_at_ : timestamp option) ?created_at:(created_at_ : timestamp option)
    ?finished_at:(finished_at_ : timestamp option)
    ?target_service_revision_arn:(target_service_revision_arn_ : string_ option)
    ?status:(status_ : service_deployment_status option)
    ?status_reason:(status_reason_ : string_ option) () =
  ({
     service_deployment_arn = service_deployment_arn_;
     service_arn = service_arn_;
     cluster_arn = cluster_arn_;
     started_at = started_at_;
     created_at = created_at_;
     finished_at = finished_at_;
     target_service_revision_arn = target_service_revision_arn_;
     status = status_;
     status_reason = status_reason_;
   }
    : service_deployment_brief)

let make_list_service_deployments_response
    ?service_deployments:(service_deployments_ : service_deployments_brief option)
    ?next_token:(next_token_ : string_ option) () =
  ({ service_deployments = service_deployments_; next_token = next_token_ }
    : list_service_deployments_response)

let make_list_service_deployments_request ?cluster:(cluster_ : string_ option)
    ?status:(status_ : service_deployment_status_list option)
    ?created_at:(created_at_ : created_at option) ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : boxed_integer option) ~service:(service_ : string_) () =
  ({
     service = service_;
     cluster = cluster_;
     status = status_;
     created_at = created_at_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_service_deployments_request)

let make_list_services_response ?service_arns:(service_arns_ : string_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ service_arns = service_arns_; next_token = next_token_ } : list_services_response)

let make_list_services_request ?cluster:(cluster_ : string_ option)
    ?next_token:(next_token_ : string_ option) ?max_results:(max_results_ : boxed_integer option)
    ?launch_type:(launch_type_ : launch_type option)
    ?scheduling_strategy:(scheduling_strategy_ : scheduling_strategy option)
    ?resource_management_type:(resource_management_type_ : resource_management_type option) () =
  ({
     cluster = cluster_;
     next_token = next_token_;
     max_results = max_results_;
     launch_type = launch_type_;
     scheduling_strategy = scheduling_strategy_;
     resource_management_type = resource_management_type_;
   }
    : list_services_request)

let make_list_task_definitions_response
    ?task_definition_arns:(task_definition_arns_ : string_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ task_definition_arns = task_definition_arns_; next_token = next_token_ }
    : list_task_definitions_response)

let make_list_task_definitions_request ?family_prefix:(family_prefix_ : string_ option)
    ?status:(status_ : task_definition_status option) ?sort:(sort_ : sort_order option)
    ?next_token:(next_token_ : string_ option) ?max_results:(max_results_ : boxed_integer option) ()
    =
  ({
     family_prefix = family_prefix_;
     status = status_;
     sort = sort_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_task_definitions_request)

let make_list_tasks_response ?task_arns:(task_arns_ : string_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ task_arns = task_arns_; next_token = next_token_ } : list_tasks_response)

let make_list_tasks_request ?cluster:(cluster_ : string_ option)
    ?container_instance:(container_instance_ : string_ option) ?family:(family_ : string_ option)
    ?next_token:(next_token_ : string_ option) ?max_results:(max_results_ : boxed_integer option)
    ?started_by:(started_by_ : string_ option) ?service_name:(service_name_ : string_ option)
    ?desired_status:(desired_status_ : desired_status option)
    ?launch_type:(launch_type_ : launch_type option) ?daemon_name:(daemon_name_ : string_ option) ()
    =
  ({
     cluster = cluster_;
     container_instance = container_instance_;
     family = family_;
     next_token = next_token_;
     max_results = max_results_;
     started_by = started_by_;
     service_name = service_name_;
     desired_status = desired_status_;
     launch_type = launch_type_;
     daemon_name = daemon_name_;
   }
    : list_tasks_request)

let make_managed_agent_state_change ?reason:(reason_ : string_ option)
    ~container_name:(container_name_ : string_)
    ~managed_agent_name:(managed_agent_name_ : managed_agent_name) ~status:(status_ : string_) () =
  ({
     container_name = container_name_;
     managed_agent_name = managed_agent_name_;
     status = status_;
     reason = reason_;
   }
    : managed_agent_state_change)

let make_platform_device ~id:(id_ : string_) ~type_:(type__ : platform_device_type) () =
  ({ id = id_; type_ = type__ } : platform_device)

let make_put_attributes_response ?attributes:(attributes_ : attributes option) () =
  ({ attributes = attributes_ } : put_attributes_response)

let make_put_attributes_request ?cluster:(cluster_ : string_ option)
    ~attributes:(attributes_ : attributes) () =
  ({ cluster = cluster_; attributes = attributes_ } : put_attributes_request)

let make_put_cluster_capacity_providers_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : put_cluster_capacity_providers_response)

let make_put_cluster_capacity_providers_request ~cluster:(cluster_ : string_)
    ~capacity_providers:(capacity_providers_ : string_list)
    ~default_capacity_provider_strategy:
      (default_capacity_provider_strategy_ : capacity_provider_strategy) () =
  ({
     cluster = cluster_;
     capacity_providers = capacity_providers_;
     default_capacity_provider_strategy = default_capacity_provider_strategy_;
   }
    : put_cluster_capacity_providers_request)

let make_register_container_instance_response
    ?container_instance:(container_instance_ : container_instance option) () =
  ({ container_instance = container_instance_ } : register_container_instance_response)

let make_register_container_instance_request ?cluster:(cluster_ : string_ option)
    ?instance_identity_document:(instance_identity_document_ : string_ option)
    ?instance_identity_document_signature:(instance_identity_document_signature_ : string_ option)
    ?total_resources:(total_resources_ : resources option)
    ?version_info:(version_info_ : version_info option)
    ?container_instance_arn:(container_instance_arn_ : string_ option)
    ?attributes:(attributes_ : attributes option)
    ?platform_devices:(platform_devices_ : platform_devices option) ?tags:(tags_ : tags option) () =
  ({
     cluster = cluster_;
     instance_identity_document = instance_identity_document_;
     instance_identity_document_signature = instance_identity_document_signature_;
     total_resources = total_resources_;
     version_info = version_info_;
     container_instance_arn = container_instance_arn_;
     attributes = attributes_;
     platform_devices = platform_devices_;
     tags = tags_;
   }
    : register_container_instance_request)

let make_register_daemon_task_definition_response
    ?daemon_task_definition_arn:(daemon_task_definition_arn_ : string_ option) () =
  ({ daemon_task_definition_arn = daemon_task_definition_arn_ }
    : register_daemon_task_definition_response)

let make_register_daemon_task_definition_request ?task_role_arn:(task_role_arn_ : string_ option)
    ?execution_role_arn:(execution_role_arn_ : string_ option) ?cpu:(cpu_ : string_ option)
    ?memory:(memory_ : string_ option) ?volumes:(volumes_ : daemon_volume_list option)
    ?tags:(tags_ : tags option) ?pid_mode:(pid_mode_ : daemon_pid_mode option)
    ?ipc_mode:(ipc_mode_ : daemon_ipc_mode option) ~family:(family_ : string_)
    ~container_definitions:(container_definitions_ : daemon_container_definition_list) () =
  ({
     family = family_;
     task_role_arn = task_role_arn_;
     execution_role_arn = execution_role_arn_;
     container_definitions = container_definitions_;
     cpu = cpu_;
     memory = memory_;
     volumes = volumes_;
     tags = tags_;
     pid_mode = pid_mode_;
     ipc_mode = ipc_mode_;
   }
    : register_daemon_task_definition_request)

let make_register_task_definition_response
    ?task_definition:(task_definition_ : task_definition option) ?tags:(tags_ : tags option) () =
  ({ task_definition = task_definition_; tags = tags_ } : register_task_definition_response)

let make_register_task_definition_request ?task_role_arn:(task_role_arn_ : string_ option)
    ?execution_role_arn:(execution_role_arn_ : string_ option)
    ?network_mode:(network_mode_ : network_mode option) ?volumes:(volumes_ : volume_list option)
    ?placement_constraints:(placement_constraints_ : task_definition_placement_constraints option)
    ?requires_compatibilities:(requires_compatibilities_ : compatibility_list option)
    ?cpu:(cpu_ : string_ option) ?memory:(memory_ : string_ option) ?tags:(tags_ : tags option)
    ?pid_mode:(pid_mode_ : pid_mode option) ?ipc_mode:(ipc_mode_ : ipc_mode option)
    ?proxy_configuration:(proxy_configuration_ : proxy_configuration option)
    ?inference_accelerators:(inference_accelerators_ : inference_accelerators option)
    ?ephemeral_storage:(ephemeral_storage_ : ephemeral_storage option)
    ?runtime_platform:(runtime_platform_ : runtime_platform option)
    ?enable_fault_injection:(enable_fault_injection_ : boxed_boolean option)
    ~family:(family_ : string_)
    ~container_definitions:(container_definitions_ : container_definitions) () =
  ({
     family = family_;
     task_role_arn = task_role_arn_;
     execution_role_arn = execution_role_arn_;
     network_mode = network_mode_;
     container_definitions = container_definitions_;
     volumes = volumes_;
     placement_constraints = placement_constraints_;
     requires_compatibilities = requires_compatibilities_;
     cpu = cpu_;
     memory = memory_;
     tags = tags_;
     pid_mode = pid_mode_;
     ipc_mode = ipc_mode_;
     proxy_configuration = proxy_configuration_;
     inference_accelerators = inference_accelerators_;
     ephemeral_storage = ephemeral_storage_;
     runtime_platform = runtime_platform_;
     enable_fault_injection = enable_fault_injection_;
   }
    : register_task_definition_request)

let make_run_task_response ?tasks:(tasks_ : tasks option) ?failures:(failures_ : failures option) ()
    =
  ({ tasks = tasks_; failures = failures_ } : run_task_response)

let make_task_managed_ebs_volume_termination_policy
    ~delete_on_termination:(delete_on_termination_ : boxed_boolean) () =
  ({ delete_on_termination = delete_on_termination_ } : task_managed_ebs_volume_termination_policy)

let make_task_managed_ebs_volume_configuration ?encrypted:(encrypted_ : boxed_boolean option)
    ?kms_key_id:(kms_key_id_ : ebskms_key_id option)
    ?volume_type:(volume_type_ : ebs_volume_type option)
    ?size_in_gi_b:(size_in_gi_b_ : boxed_integer option)
    ?snapshot_id:(snapshot_id_ : ebs_snapshot_id option)
    ?volume_initialization_rate:(volume_initialization_rate_ : boxed_integer option)
    ?iops:(iops_ : boxed_integer option) ?throughput:(throughput_ : boxed_integer option)
    ?tag_specifications:(tag_specifications_ : ebs_tag_specifications option)
    ?termination_policy:(termination_policy_ : task_managed_ebs_volume_termination_policy option)
    ?filesystem_type:(filesystem_type_ : task_filesystem_type option)
    ~role_arn:(role_arn_ : iam_role_arn) () =
  ({
     encrypted = encrypted_;
     kms_key_id = kms_key_id_;
     volume_type = volume_type_;
     size_in_gi_b = size_in_gi_b_;
     snapshot_id = snapshot_id_;
     volume_initialization_rate = volume_initialization_rate_;
     iops = iops_;
     throughput = throughput_;
     tag_specifications = tag_specifications_;
     role_arn = role_arn_;
     termination_policy = termination_policy_;
     filesystem_type = filesystem_type_;
   }
    : task_managed_ebs_volume_configuration)

let make_task_volume_configuration
    ?managed_ebs_volume:(managed_ebs_volume_ : task_managed_ebs_volume_configuration option)
    ~name:(name_ : ecs_volume_name) () =
  ({ name = name_; managed_ebs_volume = managed_ebs_volume_ } : task_volume_configuration)

let make_run_task_request
    ?capacity_provider_strategy:(capacity_provider_strategy_ : capacity_provider_strategy option)
    ?cluster:(cluster_ : string_ option) ?count:(count_ : boxed_integer option)
    ?enable_ecs_managed_tags:(enable_ecs_managed_tags_ : boolean_ option)
    ?enable_execute_command:(enable_execute_command_ : boolean_ option)
    ?group:(group_ : string_ option) ?launch_type:(launch_type_ : launch_type option)
    ?network_configuration:(network_configuration_ : network_configuration option)
    ?overrides:(overrides_ : task_override option)
    ?placement_constraints:(placement_constraints_ : placement_constraints option)
    ?placement_strategy:(placement_strategy_ : placement_strategies option)
    ?platform_version:(platform_version_ : string_ option)
    ?propagate_tags:(propagate_tags_ : propagate_tags option)
    ?reference_id:(reference_id_ : string_ option) ?started_by:(started_by_ : string_ option)
    ?tags:(tags_ : tags option) ?client_token:(client_token_ : string_ option)
    ?volume_configurations:(volume_configurations_ : task_volume_configurations option)
    ~task_definition:(task_definition_ : string_) () =
  ({
     capacity_provider_strategy = capacity_provider_strategy_;
     cluster = cluster_;
     count = count_;
     enable_ecs_managed_tags = enable_ecs_managed_tags_;
     enable_execute_command = enable_execute_command_;
     group = group_;
     launch_type = launch_type_;
     network_configuration = network_configuration_;
     overrides = overrides_;
     placement_constraints = placement_constraints_;
     placement_strategy = placement_strategy_;
     platform_version = platform_version_;
     propagate_tags = propagate_tags_;
     reference_id = reference_id_;
     started_by = started_by_;
     tags = tags_;
     task_definition = task_definition_;
     client_token = client_token_;
     volume_configurations = volume_configurations_;
   }
    : run_task_request)

let make_start_task_response ?tasks:(tasks_ : tasks option) ?failures:(failures_ : failures option)
    () =
  ({ tasks = tasks_; failures = failures_ } : start_task_response)

let make_start_task_request ?cluster:(cluster_ : string_ option)
    ?enable_ecs_managed_tags:(enable_ecs_managed_tags_ : boolean_ option)
    ?enable_execute_command:(enable_execute_command_ : boolean_ option)
    ?group:(group_ : string_ option)
    ?network_configuration:(network_configuration_ : network_configuration option)
    ?overrides:(overrides_ : task_override option)
    ?propagate_tags:(propagate_tags_ : propagate_tags option)
    ?reference_id:(reference_id_ : string_ option) ?started_by:(started_by_ : string_ option)
    ?tags:(tags_ : tags option)
    ?volume_configurations:(volume_configurations_ : task_volume_configurations option)
    ~container_instances:(container_instances_ : string_list)
    ~task_definition:(task_definition_ : string_) () =
  ({
     cluster = cluster_;
     container_instances = container_instances_;
     enable_ecs_managed_tags = enable_ecs_managed_tags_;
     enable_execute_command = enable_execute_command_;
     group = group_;
     network_configuration = network_configuration_;
     overrides = overrides_;
     propagate_tags = propagate_tags_;
     reference_id = reference_id_;
     started_by = started_by_;
     tags = tags_;
     task_definition = task_definition_;
     volume_configurations = volume_configurations_;
   }
    : start_task_request)

let make_stop_service_deployment_response
    ?service_deployment_arn:(service_deployment_arn_ : string_ option) () =
  ({ service_deployment_arn = service_deployment_arn_ } : stop_service_deployment_response)

let make_stop_service_deployment_request
    ?stop_type:(stop_type_ : stop_service_deployment_stop_type option)
    ~service_deployment_arn:(service_deployment_arn_ : string_) () =
  ({ service_deployment_arn = service_deployment_arn_; stop_type = stop_type_ }
    : stop_service_deployment_request)

let make_stop_task_response ?task:(task_ : task option) () = ({ task = task_ } : stop_task_response)

let make_stop_task_request ?cluster:(cluster_ : string_ option) ?reason:(reason_ : string_ option)
    ~task:(task_ : string_) () =
  ({ cluster = cluster_; task = task_; reason = reason_ } : stop_task_request)

let make_submit_attachment_state_changes_response ?acknowledgment:(acknowledgment_ : string_ option)
    () =
  ({ acknowledgment = acknowledgment_ } : submit_attachment_state_changes_response)

let make_submit_attachment_state_changes_request ?cluster:(cluster_ : string_ option)
    ~attachments:(attachments_ : attachment_state_changes) () =
  ({ cluster = cluster_; attachments = attachments_ } : submit_attachment_state_changes_request)

let make_submit_container_state_change_response ?acknowledgment:(acknowledgment_ : string_ option)
    () =
  ({ acknowledgment = acknowledgment_ } : submit_container_state_change_response)

let make_submit_container_state_change_request ?cluster:(cluster_ : string_ option)
    ?task:(task_ : string_ option) ?container_name:(container_name_ : string_ option)
    ?runtime_id:(runtime_id_ : string_ option) ?status:(status_ : string_ option)
    ?exit_code:(exit_code_ : boxed_integer option) ?reason:(reason_ : string_ option)
    ?network_bindings:(network_bindings_ : network_bindings option) () =
  ({
     cluster = cluster_;
     task = task_;
     container_name = container_name_;
     runtime_id = runtime_id_;
     status = status_;
     exit_code = exit_code_;
     reason = reason_;
     network_bindings = network_bindings_;
   }
    : submit_container_state_change_request)

let make_submit_task_state_change_response ?acknowledgment:(acknowledgment_ : string_ option) () =
  ({ acknowledgment = acknowledgment_ } : submit_task_state_change_response)

let make_submit_task_state_change_request ?cluster:(cluster_ : string_ option)
    ?task:(task_ : string_ option) ?status:(status_ : string_ option)
    ?reason:(reason_ : string_ option) ?containers:(containers_ : container_state_changes option)
    ?attachments:(attachments_ : attachment_state_changes option)
    ?managed_agents:(managed_agents_ : managed_agent_state_changes option)
    ?pull_started_at:(pull_started_at_ : timestamp option)
    ?pull_stopped_at:(pull_stopped_at_ : timestamp option)
    ?execution_stopped_at:(execution_stopped_at_ : timestamp option) () =
  ({
     cluster = cluster_;
     task = task_;
     status = status_;
     reason = reason_;
     containers = containers_;
     attachments = attachments_;
     managed_agents = managed_agents_;
     pull_started_at = pull_started_at_;
     pull_stopped_at = pull_stopped_at_;
     execution_stopped_at = execution_stopped_at_;
   }
    : submit_task_state_change_request)

let make_update_capacity_provider_response
    ?capacity_provider:(capacity_provider_ : capacity_provider option) () =
  ({ capacity_provider = capacity_provider_ } : update_capacity_provider_response)

let make_update_managed_instances_provider_configuration
    ?propagate_tags:(propagate_tags_ : propagate_mi_tags option)
    ?infrastructure_optimization:(infrastructure_optimization_ : infrastructure_optimization option)
    ?auto_repair_configuration:(auto_repair_configuration_ : auto_repair_configuration option)
    ~infrastructure_role_arn:(infrastructure_role_arn_ : string_)
    ~instance_launch_template:(instance_launch_template_ : instance_launch_template_update) () =
  ({
     infrastructure_role_arn = infrastructure_role_arn_;
     instance_launch_template = instance_launch_template_;
     propagate_tags = propagate_tags_;
     infrastructure_optimization = infrastructure_optimization_;
     auto_repair_configuration = auto_repair_configuration_;
   }
    : update_managed_instances_provider_configuration)

let make_update_capacity_provider_request ?cluster:(cluster_ : string_ option)
    ?auto_scaling_group_provider:
      (auto_scaling_group_provider_ : auto_scaling_group_provider_update option)
    ?managed_instances_provider:
      (managed_instances_provider_ : update_managed_instances_provider_configuration option)
    ~name:(name_ : string_) () =
  ({
     name = name_;
     cluster = cluster_;
     auto_scaling_group_provider = auto_scaling_group_provider_;
     managed_instances_provider = managed_instances_provider_;
   }
    : update_capacity_provider_request)

let make_update_cluster_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : update_cluster_response)

let make_update_cluster_request ?settings:(settings_ : cluster_settings option)
    ?configuration:(configuration_ : cluster_configuration option)
    ?service_connect_defaults:
      (service_connect_defaults_ : cluster_service_connect_defaults_request option)
    ~cluster:(cluster_ : string_) () =
  ({
     cluster = cluster_;
     settings = settings_;
     configuration = configuration_;
     service_connect_defaults = service_connect_defaults_;
   }
    : update_cluster_request)

let make_update_cluster_settings_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : update_cluster_settings_response)

let make_update_cluster_settings_request ~cluster:(cluster_ : string_)
    ~settings:(settings_ : cluster_settings) () =
  ({ cluster = cluster_; settings = settings_ } : update_cluster_settings_request)

let make_update_container_agent_response
    ?container_instance:(container_instance_ : container_instance option) () =
  ({ container_instance = container_instance_ } : update_container_agent_response)

let make_update_container_agent_request ?cluster:(cluster_ : string_ option)
    ~container_instance:(container_instance_ : string_) () =
  ({ cluster = cluster_; container_instance = container_instance_ }
    : update_container_agent_request)

let make_update_container_instances_state_response
    ?container_instances:(container_instances_ : container_instances option)
    ?failures:(failures_ : failures option) () =
  ({ container_instances = container_instances_; failures = failures_ }
    : update_container_instances_state_response)

let make_update_container_instances_state_request ?cluster:(cluster_ : string_ option)
    ~container_instances:(container_instances_ : string_list)
    ~status:(status_ : container_instance_status) () =
  ({ cluster = cluster_; container_instances = container_instances_; status = status_ }
    : update_container_instances_state_request)

let make_update_daemon_response ?daemon_arn:(daemon_arn_ : string_ option)
    ?status:(status_ : daemon_status option) ?created_at:(created_at_ : timestamp option)
    ?updated_at:(updated_at_ : timestamp option) ?deployment_arn:(deployment_arn_ : string_ option)
    () =
  ({
     daemon_arn = daemon_arn_;
     status = status_;
     created_at = created_at_;
     updated_at = updated_at_;
     deployment_arn = deployment_arn_;
   }
    : update_daemon_response)

let make_update_daemon_request
    ?deployment_configuration:(deployment_configuration_ : daemon_deployment_configuration option)
    ?propagate_tags:(propagate_tags_ : daemon_propagate_tags option)
    ?enable_ecs_managed_tags:(enable_ecs_managed_tags_ : boolean_ option)
    ?enable_execute_command:(enable_execute_command_ : boolean_ option)
    ~daemon_arn:(daemon_arn_ : string_)
    ~daemon_task_definition_arn:(daemon_task_definition_arn_ : string_)
    ~capacity_provider_arns:(capacity_provider_arns_ : string_list) () =
  ({
     daemon_arn = daemon_arn_;
     daemon_task_definition_arn = daemon_task_definition_arn_;
     capacity_provider_arns = capacity_provider_arns_;
     deployment_configuration = deployment_configuration_;
     propagate_tags = propagate_tags_;
     enable_ecs_managed_tags = enable_ecs_managed_tags_;
     enable_execute_command = enable_execute_command_;
   }
    : update_daemon_request)

let make_updated_express_gateway_service ?service_arn:(service_arn_ : string_ option)
    ?cluster:(cluster_ : string_ option) ?service_name:(service_name_ : string_ option)
    ?status:(status_ : express_gateway_service_status option)
    ?target_configuration:(target_configuration_ : express_gateway_service_configuration option)
    ?created_at:(created_at_ : timestamp option) ?updated_at:(updated_at_ : timestamp option) () =
  ({
     service_arn = service_arn_;
     cluster = cluster_;
     service_name = service_name_;
     status = status_;
     target_configuration = target_configuration_;
     created_at = created_at_;
     updated_at = updated_at_;
   }
    : updated_express_gateway_service)

let make_update_express_gateway_service_response
    ?service:(service_ : updated_express_gateway_service option) () =
  ({ service = service_ } : update_express_gateway_service_response)

let make_update_express_gateway_service_request
    ?execution_role_arn:(execution_role_arn_ : string_ option)
    ?health_check_path:(health_check_path_ : string_ option)
    ?primary_container:(primary_container_ : express_gateway_container option)
    ?task_role_arn:(task_role_arn_ : string_ option)
    ?network_configuration:
      (network_configuration_ : express_gateway_service_network_configuration option)
    ?cpu:(cpu_ : string_ option) ?memory:(memory_ : string_ option)
    ?scaling_target:(scaling_target_ : express_gateway_scaling_target option)
    ?task_definition_arn:(task_definition_arn_ : string_ option)
    ~service_arn:(service_arn_ : string_) () =
  ({
     service_arn = service_arn_;
     execution_role_arn = execution_role_arn_;
     health_check_path = health_check_path_;
     primary_container = primary_container_;
     task_role_arn = task_role_arn_;
     network_configuration = network_configuration_;
     cpu = cpu_;
     memory = memory_;
     scaling_target = scaling_target_;
     task_definition_arn = task_definition_arn_;
   }
    : update_express_gateway_service_request)

let make_update_service_response ?service:(service_ : service option) () =
  ({ service = service_ } : update_service_response)

let make_update_service_request ?cluster:(cluster_ : string_ option)
    ?desired_count:(desired_count_ : boxed_integer option)
    ?task_definition:(task_definition_ : string_ option)
    ?capacity_provider_strategy:(capacity_provider_strategy_ : capacity_provider_strategy option)
    ?deployment_configuration:(deployment_configuration_ : deployment_configuration option)
    ?availability_zone_rebalancing:
      (availability_zone_rebalancing_ : availability_zone_rebalancing option)
    ?network_configuration:(network_configuration_ : network_configuration option)
    ?placement_constraints:(placement_constraints_ : placement_constraints option)
    ?placement_strategy:(placement_strategy_ : placement_strategies option)
    ?platform_version:(platform_version_ : string_ option)
    ?force_new_deployment:(force_new_deployment_ : boolean_ option)
    ?health_check_grace_period_seconds:(health_check_grace_period_seconds_ : boxed_integer option)
    ?deployment_controller:(deployment_controller_ : deployment_controller option)
    ?enable_execute_command:(enable_execute_command_ : boxed_boolean option)
    ?enable_ecs_managed_tags:(enable_ecs_managed_tags_ : boxed_boolean option)
    ?load_balancers:(load_balancers_ : load_balancers option)
    ?propagate_tags:(propagate_tags_ : propagate_tags option)
    ?service_registries:(service_registries_ : service_registries option)
    ?service_connect_configuration:
      (service_connect_configuration_ : service_connect_configuration option)
    ?volume_configurations:(volume_configurations_ : service_volume_configurations option)
    ?vpc_lattice_configurations:(vpc_lattice_configurations_ : vpc_lattice_configurations option)
    ?monitoring:(monitoring_ : monitoring_configuration option) ~service:(service_ : string_) () =
  ({
     cluster = cluster_;
     service = service_;
     desired_count = desired_count_;
     task_definition = task_definition_;
     capacity_provider_strategy = capacity_provider_strategy_;
     deployment_configuration = deployment_configuration_;
     availability_zone_rebalancing = availability_zone_rebalancing_;
     network_configuration = network_configuration_;
     placement_constraints = placement_constraints_;
     placement_strategy = placement_strategy_;
     platform_version = platform_version_;
     force_new_deployment = force_new_deployment_;
     health_check_grace_period_seconds = health_check_grace_period_seconds_;
     deployment_controller = deployment_controller_;
     enable_execute_command = enable_execute_command_;
     enable_ecs_managed_tags = enable_ecs_managed_tags_;
     load_balancers = load_balancers_;
     propagate_tags = propagate_tags_;
     service_registries = service_registries_;
     service_connect_configuration = service_connect_configuration_;
     volume_configurations = volume_configurations_;
     vpc_lattice_configurations = vpc_lattice_configurations_;
     monitoring = monitoring_;
   }
    : update_service_request)

let make_update_service_primary_task_set_response ?task_set:(task_set_ : task_set option) () =
  ({ task_set = task_set_ } : update_service_primary_task_set_response)

let make_update_service_primary_task_set_request ~cluster:(cluster_ : string_)
    ~service:(service_ : string_) ~primary_task_set:(primary_task_set_ : string_) () =
  ({ cluster = cluster_; service = service_; primary_task_set = primary_task_set_ }
    : update_service_primary_task_set_request)

let make_update_task_protection_response
    ?protected_tasks:(protected_tasks_ : protected_tasks option)
    ?failures:(failures_ : failures option) () =
  ({ protected_tasks = protected_tasks_; failures = failures_ } : update_task_protection_response)

let make_update_task_protection_request
    ?expires_in_minutes:(expires_in_minutes_ : boxed_integer option) ~cluster:(cluster_ : string_)
    ~tasks:(tasks_ : string_list) ~protection_enabled:(protection_enabled_ : boolean_) () =
  ({
     cluster = cluster_;
     tasks = tasks_;
     protection_enabled = protection_enabled_;
     expires_in_minutes = expires_in_minutes_;
   }
    : update_task_protection_request)

let make_update_task_set_response ?task_set:(task_set_ : task_set option) () =
  ({ task_set = task_set_ } : update_task_set_response)

let make_update_task_set_request ~cluster:(cluster_ : string_) ~service:(service_ : string_)
    ~task_set:(task_set_ : string_) ~scale:(scale_ : scale) () =
  ({ cluster = cluster_; service = service_; task_set = task_set_; scale = scale_ }
    : update_task_set_request)
