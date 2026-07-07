open Types

let make_vpc_lattice_configuration ~port_name:(port_name_ : string_)
    ~target_group_arn:(target_group_arn_ : string_) ~role_arn:(role_arn_ : iam_role_arn) () =
  ({ port_name = port_name_; target_group_arn = target_group_arn_; role_arn = role_arn_ }
    : vpc_lattice_configuration)

let make_host_volume_properties ?source_path:(source_path_ : string_ option) () =
  ({ source_path = source_path_ } : host_volume_properties)

let make_docker_volume_configuration ?labels:(labels_ : string_map option)
    ?driver_opts:(driver_opts_ : string_map option) ?driver:(driver_ : string_ option)
    ?autoprovision:(autoprovision_ : boxed_boolean option) ?scope:(scope_ : scope option) () =
  ({
     labels = labels_;
     driver_opts = driver_opts_;
     driver = driver_;
     autoprovision = autoprovision_;
     scope = scope_;
   }
    : docker_volume_configuration)

let make_efs_authorization_config ?iam:(iam_ : efs_authorization_config_ia_m option)
    ?access_point_id:(access_point_id_ : string_ option) () =
  ({ iam = iam_; access_point_id = access_point_id_ } : efs_authorization_config)

let make_efs_volume_configuration
    ?authorization_config:(authorization_config_ : efs_authorization_config option)
    ?transit_encryption_port:(transit_encryption_port_ : boxed_integer option)
    ?transit_encryption:(transit_encryption_ : efs_transit_encryption option)
    ?root_directory:(root_directory_ : string_ option) ~file_system_id:(file_system_id_ : string_)
    () =
  ({
     authorization_config = authorization_config_;
     transit_encryption_port = transit_encryption_port_;
     transit_encryption = transit_encryption_;
     root_directory = root_directory_;
     file_system_id = file_system_id_;
   }
    : efs_volume_configuration)

let make_s3_files_volume_configuration ?access_point_arn:(access_point_arn_ : string_ option)
    ?transit_encryption_port:(transit_encryption_port_ : boxed_integer option)
    ?root_directory:(root_directory_ : string_ option) ~file_system_arn:(file_system_arn_ : string_)
    () =
  ({
     access_point_arn = access_point_arn_;
     transit_encryption_port = transit_encryption_port_;
     root_directory = root_directory_;
     file_system_arn = file_system_arn_;
   }
    : s3_files_volume_configuration)

let make_f_sx_windows_file_server_authorization_config ~domain:(domain_ : string_)
    ~credentials_parameter:(credentials_parameter_ : string_) () =
  ({ domain = domain_; credentials_parameter = credentials_parameter_ }
    : f_sx_windows_file_server_authorization_config)

let make_f_sx_windows_file_server_volume_configuration
    ~authorization_config:(authorization_config_ : f_sx_windows_file_server_authorization_config)
    ~root_directory:(root_directory_ : string_) ~file_system_id:(file_system_id_ : string_) () =
  ({
     authorization_config = authorization_config_;
     root_directory = root_directory_;
     file_system_id = file_system_id_;
   }
    : f_sx_windows_file_server_volume_configuration)

let make_volume ?configured_at_launch:(configured_at_launch_ : boxed_boolean option)
    ?fsx_windows_file_server_volume_configuration:
      (fsx_windows_file_server_volume_configuration_ :
         f_sx_windows_file_server_volume_configuration option)
    ?s3files_volume_configuration:
      (s3files_volume_configuration_ : s3_files_volume_configuration option)
    ?efs_volume_configuration:(efs_volume_configuration_ : efs_volume_configuration option)
    ?docker_volume_configuration:(docker_volume_configuration_ : docker_volume_configuration option)
    ?host:(host_ : host_volume_properties option) ?name:(name_ : string_ option) () =
  ({
     configured_at_launch = configured_at_launch_;
     fsx_windows_file_server_volume_configuration = fsx_windows_file_server_volume_configuration_;
     s3files_volume_configuration = s3files_volume_configuration_;
     efs_volume_configuration = efs_volume_configuration_;
     docker_volume_configuration = docker_volume_configuration_;
     host = host_;
     name = name_;
   }
    : volume)

let make_volume_from ?read_only:(read_only_ : boxed_boolean option)
    ?source_container:(source_container_ : string_ option) () =
  ({ read_only = read_only_; source_container = source_container_ } : volume_from)

let make_version_info ?docker_version:(docker_version_ : string_ option)
    ?agent_hash:(agent_hash_ : string_ option) ?agent_version:(agent_version_ : string_ option) () =
  ({ docker_version = docker_version_; agent_hash = agent_hash_; agent_version = agent_version_ }
    : version_info)

let make_v_cpu_count_range_request ?max:(max_ : boxed_integer option) ~min:(min_ : boxed_integer) ()
    =
  ({ max = max_; min = min_ } : v_cpu_count_range_request)

let make_express_gateway_service_status ?status_reason:(status_reason_ : string_ option)
    ?status_code:(status_code_ : express_gateway_service_status_code option) () =
  ({ status_reason = status_reason_; status_code = status_code_ } : express_gateway_service_status)

let make_express_gateway_service_network_configuration ?subnets:(subnets_ : string_list option)
    ?security_groups:(security_groups_ : string_list option) () =
  ({ subnets = subnets_; security_groups = security_groups_ }
    : express_gateway_service_network_configuration)

let make_express_gateway_service_aws_logs_configuration
    ~log_stream_prefix:(log_stream_prefix_ : string_) ~log_group:(log_group_ : string_) () =
  ({ log_stream_prefix = log_stream_prefix_; log_group = log_group_ }
    : express_gateway_service_aws_logs_configuration)

let make_express_gateway_repository_credentials
    ?credentials_parameter:(credentials_parameter_ : string_ option) () =
  ({ credentials_parameter = credentials_parameter_ } : express_gateway_repository_credentials)

let make_key_value_pair ?value:(value_ : string_ option) ?name:(name_ : string_ option) () =
  ({ value = value_; name = name_ } : key_value_pair)

let make_secret ~value_from:(value_from_ : string_) ~name:(name_ : string_) () =
  ({ value_from = value_from_; name = name_ } : secret)

let make_express_gateway_container ?secrets:(secrets_ : secret_list option)
    ?environment:(environment_ : environment_variables option)
    ?command:(command_ : string_list option)
    ?repository_credentials:
      (repository_credentials_ : express_gateway_repository_credentials option)
    ?aws_logs_configuration:
      (aws_logs_configuration_ : express_gateway_service_aws_logs_configuration option)
    ?container_port:(container_port_ : boxed_integer option) ~image:(image_ : string_) () =
  ({
     secrets = secrets_;
     environment = environment_;
     command = command_;
     repository_credentials = repository_credentials_;
     aws_logs_configuration = aws_logs_configuration_;
     container_port = container_port_;
     image = image_;
   }
    : express_gateway_container)

let make_express_gateway_scaling_target
    ?auto_scaling_target_value:(auto_scaling_target_value_ : boxed_integer option)
    ?auto_scaling_metric:(auto_scaling_metric_ : express_gateway_service_scaling_metric option)
    ?max_task_count:(max_task_count_ : boxed_integer option)
    ?min_task_count:(min_task_count_ : boxed_integer option) () =
  ({
     auto_scaling_target_value = auto_scaling_target_value_;
     auto_scaling_metric = auto_scaling_metric_;
     max_task_count = max_task_count_;
     min_task_count = min_task_count_;
   }
    : express_gateway_scaling_target)

let make_ingress_path_summary ~endpoint:(endpoint_ : string_)
    ~access_type:(access_type_ : access_type) () =
  ({ endpoint = endpoint_; access_type = access_type_ } : ingress_path_summary)

let make_express_gateway_service_configuration ?created_at:(created_at_ : timestamp option)
    ?ingress_paths:(ingress_paths_ : ingress_path_summaries option)
    ?scaling_target:(scaling_target_ : express_gateway_scaling_target option)
    ?primary_container:(primary_container_ : express_gateway_container option)
    ?health_check_path:(health_check_path_ : string_ option)
    ?network_configuration:
      (network_configuration_ : express_gateway_service_network_configuration option)
    ?memory:(memory_ : string_ option) ?cpu:(cpu_ : string_ option)
    ?task_definition_arn:(task_definition_arn_ : string_ option)
    ?task_role_arn:(task_role_arn_ : string_ option)
    ?execution_role_arn:(execution_role_arn_ : string_ option)
    ?service_revision_arn:(service_revision_arn_ : string_ option) () =
  ({
     created_at = created_at_;
     ingress_paths = ingress_paths_;
     scaling_target = scaling_target_;
     primary_container = primary_container_;
     health_check_path = health_check_path_;
     network_configuration = network_configuration_;
     memory = memory_;
     cpu = cpu_;
     task_definition_arn = task_definition_arn_;
     task_role_arn = task_role_arn_;
     execution_role_arn = execution_role_arn_;
     service_revision_arn = service_revision_arn_;
   }
    : express_gateway_service_configuration)

let make_updated_express_gateway_service ?updated_at:(updated_at_ : timestamp option)
    ?created_at:(created_at_ : timestamp option)
    ?target_configuration:(target_configuration_ : express_gateway_service_configuration option)
    ?status:(status_ : express_gateway_service_status option)
    ?service_name:(service_name_ : string_ option) ?cluster:(cluster_ : string_ option)
    ?service_arn:(service_arn_ : string_ option) () =
  ({
     updated_at = updated_at_;
     created_at = created_at_;
     target_configuration = target_configuration_;
     status = status_;
     service_name = service_name_;
     cluster = cluster_;
     service_arn = service_arn_;
   }
    : updated_express_gateway_service)

let make_capacity_provider_strategy_item ?base:(base_ : capacity_provider_strategy_item_base option)
    ?weight:(weight_ : capacity_provider_strategy_item_weight option)
    ~capacity_provider:(capacity_provider_ : string_) () =
  ({ base = base_; weight = weight_; capacity_provider = capacity_provider_ }
    : capacity_provider_strategy_item)

let make_aws_vpc_configuration ?assign_public_ip:(assign_public_ip_ : assign_public_ip option)
    ?security_groups:(security_groups_ : string_list option) ~subnets:(subnets_ : string_list) () =
  ({ assign_public_ip = assign_public_ip_; security_groups = security_groups_; subnets = subnets_ }
    : aws_vpc_configuration)

let make_network_configuration
    ?awsvpc_configuration:(awsvpc_configuration_ : aws_vpc_configuration option) () =
  ({ awsvpc_configuration = awsvpc_configuration_ } : network_configuration)

let make_advanced_configuration ?role_arn:(role_arn_ : string_ option)
    ?test_listener_rule:(test_listener_rule_ : string_ option)
    ?production_listener_rule:(production_listener_rule_ : string_ option)
    ?alternate_target_group_arn:(alternate_target_group_arn_ : string_ option) () =
  ({
     role_arn = role_arn_;
     test_listener_rule = test_listener_rule_;
     production_listener_rule = production_listener_rule_;
     alternate_target_group_arn = alternate_target_group_arn_;
   }
    : advanced_configuration)

let make_load_balancer
    ?advanced_configuration:(advanced_configuration_ : advanced_configuration option)
    ?container_port:(container_port_ : boxed_integer option)
    ?container_name:(container_name_ : string_ option)
    ?load_balancer_name:(load_balancer_name_ : string_ option)
    ?target_group_arn:(target_group_arn_ : string_ option) () =
  ({
     advanced_configuration = advanced_configuration_;
     container_port = container_port_;
     container_name = container_name_;
     load_balancer_name = load_balancer_name_;
     target_group_arn = target_group_arn_;
   }
    : load_balancer)

let make_service_registry ?container_port:(container_port_ : boxed_integer option)
    ?container_name:(container_name_ : string_ option) ?port:(port_ : boxed_integer option)
    ?registry_arn:(registry_arn_ : string_ option) () =
  ({
     container_port = container_port_;
     container_name = container_name_;
     port = port_;
     registry_arn = registry_arn_;
   }
    : service_registry)

let make_scale ?unit_:(unit__ : scale_unit option) ?value:(value_ : double option) () =
  ({ unit_ = unit__; value = value_ } : scale)

let make_tag ?value:(value_ : tag_value option) ?key:(key_ : tag_key option) () =
  ({ value = value_; key = key_ } : tag)

let make_deployment_ephemeral_storage ?kms_key_id:(kms_key_id_ : string_ option) () =
  ({ kms_key_id = kms_key_id_ } : deployment_ephemeral_storage)

let make_task_set
    ?fargate_ephemeral_storage:(fargate_ephemeral_storage_ : deployment_ephemeral_storage option)
    ?tags:(tags_ : tags option) ?stability_status_at:(stability_status_at_ : timestamp option)
    ?stability_status:(stability_status_ : stability_status option) ?scale:(scale_ : scale option)
    ?service_registries:(service_registries_ : service_registries option)
    ?load_balancers:(load_balancers_ : load_balancers option)
    ?network_configuration:(network_configuration_ : network_configuration option)
    ?platform_family:(platform_family_ : string_ option)
    ?platform_version:(platform_version_ : string_ option)
    ?capacity_provider_strategy:(capacity_provider_strategy_ : capacity_provider_strategy option)
    ?launch_type:(launch_type_ : launch_type option) ?updated_at:(updated_at_ : timestamp option)
    ?created_at:(created_at_ : timestamp option) ?running_count:(running_count_ : integer option)
    ?pending_count:(pending_count_ : integer option)
    ?computed_desired_count:(computed_desired_count_ : integer option)
    ?task_definition:(task_definition_ : string_ option) ?status:(status_ : string_ option)
    ?external_id:(external_id_ : string_ option) ?started_by:(started_by_ : string_ option)
    ?cluster_arn:(cluster_arn_ : string_ option) ?service_arn:(service_arn_ : string_ option)
    ?task_set_arn:(task_set_arn_ : string_ option) ?id:(id_ : string_ option) () =
  ({
     fargate_ephemeral_storage = fargate_ephemeral_storage_;
     tags = tags_;
     stability_status_at = stability_status_at_;
     stability_status = stability_status_;
     scale = scale_;
     service_registries = service_registries_;
     load_balancers = load_balancers_;
     network_configuration = network_configuration_;
     platform_family = platform_family_;
     platform_version = platform_version_;
     capacity_provider_strategy = capacity_provider_strategy_;
     launch_type = launch_type_;
     updated_at = updated_at_;
     created_at = created_at_;
     running_count = running_count_;
     pending_count = pending_count_;
     computed_desired_count = computed_desired_count_;
     task_definition = task_definition_;
     status = status_;
     external_id = external_id_;
     started_by = started_by_;
     cluster_arn = cluster_arn_;
     service_arn = service_arn_;
     task_set_arn = task_set_arn_;
     id = id_;
   }
    : task_set)

let make_update_task_set_response ?task_set:(task_set_ : task_set option) () =
  ({ task_set = task_set_ } : update_task_set_response)

let make_update_task_set_request ~scale:(scale_ : scale) ~task_set:(task_set_ : string_)
    ~service:(service_ : string_) ~cluster:(cluster_ : string_) () =
  ({ scale = scale_; task_set = task_set_; service = service_; cluster = cluster_ }
    : update_task_set_request)

let make_protected_task ?expiration_date:(expiration_date_ : timestamp option)
    ?protection_enabled:(protection_enabled_ : boolean_ option)
    ?task_arn:(task_arn_ : string_ option) () =
  ({
     expiration_date = expiration_date_;
     protection_enabled = protection_enabled_;
     task_arn = task_arn_;
   }
    : protected_task)

let make_failure ?detail:(detail_ : string_ option) ?reason:(reason_ : string_ option)
    ?arn:(arn_ : string_ option) () =
  ({ detail = detail_; reason = reason_; arn = arn_ } : failure)

let make_update_task_protection_response ?failures:(failures_ : failures option)
    ?protected_tasks:(protected_tasks_ : protected_tasks option) () =
  ({ failures = failures_; protected_tasks = protected_tasks_ } : update_task_protection_response)

let make_update_task_protection_request
    ?expires_in_minutes:(expires_in_minutes_ : boxed_integer option)
    ~protection_enabled:(protection_enabled_ : boolean_) ~tasks:(tasks_ : string_list)
    ~cluster:(cluster_ : string_) () =
  ({
     expires_in_minutes = expires_in_minutes_;
     protection_enabled = protection_enabled_;
     tasks = tasks_;
     cluster = cluster_;
   }
    : update_task_protection_request)

let make_threshold_configuration ~value:(value_ : integer) ~type_:(type__ : threshold_type) () =
  ({ value = value_; type_ = type__ } : threshold_configuration)

let make_deployment_circuit_breaker
    ?threshold_configuration:(threshold_configuration_ : threshold_configuration option)
    ?reset_on_healthy_task:(reset_on_healthy_task_ : boxed_boolean option)
    ~rollback:(rollback_ : boolean_) ~enable:(enable_ : boolean_) () =
  ({
     threshold_configuration = threshold_configuration_;
     reset_on_healthy_task = reset_on_healthy_task_;
     rollback = rollback_;
     enable = enable_;
   }
    : deployment_circuit_breaker)

let make_deployment_alarms ~enable:(enable_ : boolean_) ~rollback:(rollback_ : boolean_)
    ~alarm_names:(alarm_names_ : string_list) () =
  ({ enable = enable_; rollback = rollback_; alarm_names = alarm_names_ } : deployment_alarms)

let make_deployment_lifecycle_hook_timeout_configuration
    ?action:(action_ : deployment_lifecycle_hook_action option)
    ?timeout_in_minutes:(timeout_in_minutes_ : deployment_lifecycle_hook_duration option) () =
  ({ action = action_; timeout_in_minutes = timeout_in_minutes_ }
    : deployment_lifecycle_hook_timeout_configuration)

let make_deployment_lifecycle_hook
    ?timeout_configuration:
      (timeout_configuration_ : deployment_lifecycle_hook_timeout_configuration option)
    ?hook_details:(hook_details_ : hook_details option)
    ?lifecycle_stages:(lifecycle_stages_ : deployment_lifecycle_hook_stage_list option)
    ?role_arn:(role_arn_ : iam_role_arn option) ?hook_target_arn:(hook_target_arn_ : string_ option)
    ?target_type:(target_type_ : deployment_lifecycle_hook_target_type option) () =
  ({
     timeout_configuration = timeout_configuration_;
     hook_details = hook_details_;
     lifecycle_stages = lifecycle_stages_;
     role_arn = role_arn_;
     hook_target_arn = hook_target_arn_;
     target_type = target_type_;
   }
    : deployment_lifecycle_hook)

let make_linear_configuration
    ?step_bake_time_in_minutes:(step_bake_time_in_minutes_ : integer option)
    ?step_percent:(step_percent_ : double option) () =
  ({ step_bake_time_in_minutes = step_bake_time_in_minutes_; step_percent = step_percent_ }
    : linear_configuration)

let make_canary_configuration
    ?canary_bake_time_in_minutes:(canary_bake_time_in_minutes_ : integer option)
    ?canary_percent:(canary_percent_ : double option) () =
  ({ canary_bake_time_in_minutes = canary_bake_time_in_minutes_; canary_percent = canary_percent_ }
    : canary_configuration)

let make_deployment_configuration
    ?canary_configuration:(canary_configuration_ : canary_configuration option)
    ?linear_configuration:(linear_configuration_ : linear_configuration option)
    ?lifecycle_hooks:(lifecycle_hooks_ : deployment_lifecycle_hook_list option)
    ?bake_time_in_minutes:(bake_time_in_minutes_ : boxed_integer option)
    ?strategy:(strategy_ : deployment_strategy option) ?alarms:(alarms_ : deployment_alarms option)
    ?minimum_healthy_percent:(minimum_healthy_percent_ : boxed_integer option)
    ?maximum_percent:(maximum_percent_ : boxed_integer option)
    ?deployment_circuit_breaker:(deployment_circuit_breaker_ : deployment_circuit_breaker option) ()
    =
  ({
     canary_configuration = canary_configuration_;
     linear_configuration = linear_configuration_;
     lifecycle_hooks = lifecycle_hooks_;
     bake_time_in_minutes = bake_time_in_minutes_;
     strategy = strategy_;
     alarms = alarms_;
     minimum_healthy_percent = minimum_healthy_percent_;
     maximum_percent = maximum_percent_;
     deployment_circuit_breaker = deployment_circuit_breaker_;
   }
    : deployment_configuration)

let make_service_connect_test_traffic_header_match_rules ~exact:(exact_ : string_) () =
  ({ exact = exact_ } : service_connect_test_traffic_header_match_rules)

let make_service_connect_test_traffic_header_rules
    ?value:(value_ : service_connect_test_traffic_header_match_rules option) ~name:(name_ : string_)
    () =
  ({ value = value_; name = name_ } : service_connect_test_traffic_header_rules)

let make_service_connect_test_traffic_rules
    ~header:(header_ : service_connect_test_traffic_header_rules) () =
  ({ header = header_ } : service_connect_test_traffic_rules)

let make_service_connect_client_alias
    ?test_traffic_rules:(test_traffic_rules_ : service_connect_test_traffic_rules option)
    ?dns_name:(dns_name_ : string_ option) ~port:(port_ : port_number) () =
  ({ test_traffic_rules = test_traffic_rules_; dns_name = dns_name_; port = port_ }
    : service_connect_client_alias)

let make_timeout_configuration
    ?per_request_timeout_seconds:(per_request_timeout_seconds_ : duration option)
    ?idle_timeout_seconds:(idle_timeout_seconds_ : duration option) () =
  ({
     per_request_timeout_seconds = per_request_timeout_seconds_;
     idle_timeout_seconds = idle_timeout_seconds_;
   }
    : timeout_configuration)

let make_service_connect_tls_certificate_authority
    ?aws_pca_authority_arn:(aws_pca_authority_arn_ : string_ option) () =
  ({ aws_pca_authority_arn = aws_pca_authority_arn_ } : service_connect_tls_certificate_authority)

let make_service_connect_tls_configuration ?role_arn:(role_arn_ : string_ option)
    ?kms_key:(kms_key_ : string_ option)
    ~issuer_certificate_authority:
      (issuer_certificate_authority_ : service_connect_tls_certificate_authority) () =
  ({
     role_arn = role_arn_;
     kms_key = kms_key_;
     issuer_certificate_authority = issuer_certificate_authority_;
   }
    : service_connect_tls_configuration)

let make_service_connect_service ?tls:(tls_ : service_connect_tls_configuration option)
    ?timeout:(timeout_ : timeout_configuration option)
    ?ingress_port_override:(ingress_port_override_ : port_number option)
    ?client_aliases:(client_aliases_ : service_connect_client_alias_list option)
    ?discovery_name:(discovery_name_ : string_ option) ~port_name:(port_name_ : string_) () =
  ({
     tls = tls_;
     timeout = timeout_;
     ingress_port_override = ingress_port_override_;
     client_aliases = client_aliases_;
     discovery_name = discovery_name_;
     port_name = port_name_;
   }
    : service_connect_service)

let make_log_configuration ?secret_options:(secret_options_ : secret_list option)
    ?options:(options_ : log_configuration_options_map option)
    ~log_driver:(log_driver_ : log_driver) () =
  ({ secret_options = secret_options_; options = options_; log_driver = log_driver_ }
    : log_configuration)

let make_service_connect_access_log_configuration
    ?include_query_parameters:
      (include_query_parameters_ : service_connect_include_query_parameters option)
    ~format:(format_ : service_connect_access_logging_format) () =
  ({ include_query_parameters = include_query_parameters_; format = format_ }
    : service_connect_access_log_configuration)

let make_service_connect_configuration
    ?access_log_configuration:
      (access_log_configuration_ : service_connect_access_log_configuration option)
    ?log_configuration:(log_configuration_ : log_configuration option)
    ?services:(services_ : service_connect_service_list option)
    ?namespace:(namespace_ : string_ option) ~enabled:(enabled_ : boolean_) () =
  ({
     access_log_configuration = access_log_configuration_;
     log_configuration = log_configuration_;
     services = services_;
     namespace = namespace_;
     enabled = enabled_;
   }
    : service_connect_configuration)

let make_service_connect_service_resource ?discovery_arn:(discovery_arn_ : string_ option)
    ?discovery_name:(discovery_name_ : string_ option) () =
  ({ discovery_arn = discovery_arn_; discovery_name = discovery_name_ }
    : service_connect_service_resource)

let make_ebs_tag_specification ?propagate_tags:(propagate_tags_ : propagate_tags option)
    ?tags:(tags_ : tags option) ~resource_type:(resource_type_ : ebs_resource_type) () =
  ({ propagate_tags = propagate_tags_; tags = tags_; resource_type = resource_type_ }
    : ebs_tag_specification)

let make_service_managed_ebs_volume_configuration
    ?filesystem_type:(filesystem_type_ : task_filesystem_type option)
    ?tag_specifications:(tag_specifications_ : ebs_tag_specifications option)
    ?throughput:(throughput_ : boxed_integer option) ?iops:(iops_ : boxed_integer option)
    ?volume_initialization_rate:(volume_initialization_rate_ : boxed_integer option)
    ?snapshot_id:(snapshot_id_ : ebs_snapshot_id option)
    ?size_in_gi_b:(size_in_gi_b_ : boxed_integer option)
    ?volume_type:(volume_type_ : ebs_volume_type option)
    ?kms_key_id:(kms_key_id_ : ebskms_key_id option) ?encrypted:(encrypted_ : boxed_boolean option)
    ~role_arn:(role_arn_ : iam_role_arn) () =
  ({
     filesystem_type = filesystem_type_;
     role_arn = role_arn_;
     tag_specifications = tag_specifications_;
     throughput = throughput_;
     iops = iops_;
     volume_initialization_rate = volume_initialization_rate_;
     snapshot_id = snapshot_id_;
     size_in_gi_b = size_in_gi_b_;
     volume_type = volume_type_;
     kms_key_id = kms_key_id_;
     encrypted = encrypted_;
   }
    : service_managed_ebs_volume_configuration)

let make_service_volume_configuration
    ?managed_ebs_volume:(managed_ebs_volume_ : service_managed_ebs_volume_configuration option)
    ~name:(name_ : ecs_volume_name) () =
  ({ managed_ebs_volume = managed_ebs_volume_; name = name_ } : service_volume_configuration)

let make_deployment
    ?vpc_lattice_configurations:(vpc_lattice_configurations_ : vpc_lattice_configurations option)
    ?fargate_ephemeral_storage:(fargate_ephemeral_storage_ : deployment_ephemeral_storage option)
    ?volume_configurations:(volume_configurations_ : service_volume_configurations option)
    ?service_connect_resources:
      (service_connect_resources_ : service_connect_service_resource_list option)
    ?service_connect_configuration:
      (service_connect_configuration_ : service_connect_configuration option)
    ?rollout_state_reason:(rollout_state_reason_ : string_ option)
    ?rollout_state:(rollout_state_ : deployment_rollout_state option)
    ?network_configuration:(network_configuration_ : network_configuration option)
    ?platform_family:(platform_family_ : string_ option)
    ?platform_version:(platform_version_ : string_ option)
    ?launch_type:(launch_type_ : launch_type option)
    ?capacity_provider_strategy:(capacity_provider_strategy_ : capacity_provider_strategy option)
    ?updated_at:(updated_at_ : timestamp option) ?created_at:(created_at_ : timestamp option)
    ?failed_tasks:(failed_tasks_ : integer option) ?running_count:(running_count_ : integer option)
    ?pending_count:(pending_count_ : integer option)
    ?desired_count:(desired_count_ : integer option)
    ?task_definition:(task_definition_ : string_ option) ?status:(status_ : string_ option)
    ?id:(id_ : string_ option) () =
  ({
     vpc_lattice_configurations = vpc_lattice_configurations_;
     fargate_ephemeral_storage = fargate_ephemeral_storage_;
     volume_configurations = volume_configurations_;
     service_connect_resources = service_connect_resources_;
     service_connect_configuration = service_connect_configuration_;
     rollout_state_reason = rollout_state_reason_;
     rollout_state = rollout_state_;
     network_configuration = network_configuration_;
     platform_family = platform_family_;
     platform_version = platform_version_;
     launch_type = launch_type_;
     capacity_provider_strategy = capacity_provider_strategy_;
     updated_at = updated_at_;
     created_at = created_at_;
     failed_tasks = failed_tasks_;
     running_count = running_count_;
     pending_count = pending_count_;
     desired_count = desired_count_;
     task_definition = task_definition_;
     status = status_;
     id = id_;
   }
    : deployment)

let make_service_event ?message:(message_ : string_ option)
    ?created_at:(created_at_ : timestamp option) ?id:(id_ : string_ option) () =
  ({ message = message_; created_at = created_at_; id = id_ } : service_event)

let make_service_current_revision_summary ?pending_task_count:(pending_task_count_ : integer option)
    ?running_task_count:(running_task_count_ : integer option)
    ?requested_task_count:(requested_task_count_ : integer option) ?arn:(arn_ : string_ option) () =
  ({
     pending_task_count = pending_task_count_;
     running_task_count = running_task_count_;
     requested_task_count = requested_task_count_;
     arn = arn_;
   }
    : service_current_revision_summary)

let make_placement_constraint ?expression:(expression_ : string_ option)
    ?type_:(type__ : placement_constraint_type option) () =
  ({ expression = expression_; type_ = type__ } : placement_constraint)

let make_placement_strategy ?field:(field_ : string_ option)
    ?type_:(type__ : placement_strategy_type option) () =
  ({ field = field_; type_ = type__ } : placement_strategy)

let make_deployment_controller ~type_:(type__ : deployment_controller_type) () =
  ({ type_ = type__ } : deployment_controller)

let make_service
    ?resource_management_type:(resource_management_type_ : resource_management_type option)
    ?availability_zone_rebalancing:
      (availability_zone_rebalancing_ : availability_zone_rebalancing option)
    ?enable_execute_command:(enable_execute_command_ : boolean_ option)
    ?propagate_tags:(propagate_tags_ : propagate_tags option)
    ?enable_ecs_managed_tags:(enable_ecs_managed_tags_ : boolean_ option)
    ?created_by:(created_by_ : string_ option) ?tags:(tags_ : tags option)
    ?deployment_controller:(deployment_controller_ : deployment_controller option)
    ?scheduling_strategy:(scheduling_strategy_ : scheduling_strategy option)
    ?health_check_grace_period_seconds:(health_check_grace_period_seconds_ : boxed_integer option)
    ?network_configuration:(network_configuration_ : network_configuration option)
    ?placement_strategy:(placement_strategy_ : placement_strategies option)
    ?placement_constraints:(placement_constraints_ : placement_constraints option)
    ?current_service_revisions:
      (current_service_revisions_ : service_current_revision_summary_list option)
    ?current_service_deployment:(current_service_deployment_ : string_ option)
    ?created_at:(created_at_ : timestamp option) ?events:(events_ : service_events option)
    ?role_arn:(role_arn_ : string_ option) ?deployments:(deployments_ : deployments option)
    ?task_sets:(task_sets_ : task_sets option)
    ?deployment_configuration:(deployment_configuration_ : deployment_configuration option)
    ?task_definition:(task_definition_ : string_ option)
    ?platform_family:(platform_family_ : string_ option)
    ?platform_version:(platform_version_ : string_ option)
    ?capacity_provider_strategy:(capacity_provider_strategy_ : capacity_provider_strategy option)
    ?launch_type:(launch_type_ : launch_type option)
    ?pending_count:(pending_count_ : integer option)
    ?running_count:(running_count_ : integer option)
    ?desired_count:(desired_count_ : integer option) ?status:(status_ : string_ option)
    ?service_registries:(service_registries_ : service_registries option)
    ?load_balancers:(load_balancers_ : load_balancers option)
    ?cluster_arn:(cluster_arn_ : string_ option) ?service_name:(service_name_ : string_ option)
    ?service_arn:(service_arn_ : string_ option) () =
  ({
     resource_management_type = resource_management_type_;
     availability_zone_rebalancing = availability_zone_rebalancing_;
     enable_execute_command = enable_execute_command_;
     propagate_tags = propagate_tags_;
     enable_ecs_managed_tags = enable_ecs_managed_tags_;
     created_by = created_by_;
     tags = tags_;
     deployment_controller = deployment_controller_;
     scheduling_strategy = scheduling_strategy_;
     health_check_grace_period_seconds = health_check_grace_period_seconds_;
     network_configuration = network_configuration_;
     placement_strategy = placement_strategy_;
     placement_constraints = placement_constraints_;
     current_service_revisions = current_service_revisions_;
     current_service_deployment = current_service_deployment_;
     created_at = created_at_;
     events = events_;
     role_arn = role_arn_;
     deployments = deployments_;
     task_sets = task_sets_;
     deployment_configuration = deployment_configuration_;
     task_definition = task_definition_;
     platform_family = platform_family_;
     platform_version = platform_version_;
     capacity_provider_strategy = capacity_provider_strategy_;
     launch_type = launch_type_;
     pending_count = pending_count_;
     running_count = running_count_;
     desired_count = desired_count_;
     status = status_;
     service_registries = service_registries_;
     load_balancers = load_balancers_;
     cluster_arn = cluster_arn_;
     service_name = service_name_;
     service_arn = service_arn_;
   }
    : service)

let make_update_service_response ?service:(service_ : service option) () =
  ({ service = service_ } : update_service_response)

let make_metric_configuration ~resolution_seconds:(resolution_seconds_ : metric_resolution_seconds)
    ~metric_names:(metric_names_ : metric_names_list) () =
  ({ resolution_seconds = resolution_seconds_; metric_names = metric_names_ }
    : metric_configuration)

let make_monitoring_configuration
    ?metric_configurations:(metric_configurations_ : metric_configuration_list option) () =
  ({ metric_configurations = metric_configurations_ } : monitoring_configuration)

let make_update_service_request ?monitoring:(monitoring_ : monitoring_configuration option)
    ?vpc_lattice_configurations:(vpc_lattice_configurations_ : vpc_lattice_configurations option)
    ?volume_configurations:(volume_configurations_ : service_volume_configurations option)
    ?service_connect_configuration:
      (service_connect_configuration_ : service_connect_configuration option)
    ?service_registries:(service_registries_ : service_registries option)
    ?propagate_tags:(propagate_tags_ : propagate_tags option)
    ?load_balancers:(load_balancers_ : load_balancers option)
    ?enable_ecs_managed_tags:(enable_ecs_managed_tags_ : boxed_boolean option)
    ?enable_execute_command:(enable_execute_command_ : boxed_boolean option)
    ?deployment_controller:(deployment_controller_ : deployment_controller option)
    ?health_check_grace_period_seconds:(health_check_grace_period_seconds_ : boxed_integer option)
    ?force_new_deployment:(force_new_deployment_ : boolean_ option)
    ?platform_version:(platform_version_ : string_ option)
    ?placement_strategy:(placement_strategy_ : placement_strategies option)
    ?placement_constraints:(placement_constraints_ : placement_constraints option)
    ?network_configuration:(network_configuration_ : network_configuration option)
    ?availability_zone_rebalancing:
      (availability_zone_rebalancing_ : availability_zone_rebalancing option)
    ?deployment_configuration:(deployment_configuration_ : deployment_configuration option)
    ?capacity_provider_strategy:(capacity_provider_strategy_ : capacity_provider_strategy option)
    ?task_definition:(task_definition_ : string_ option)
    ?desired_count:(desired_count_ : boxed_integer option) ?cluster:(cluster_ : string_ option)
    ~service:(service_ : string_) () =
  ({
     monitoring = monitoring_;
     vpc_lattice_configurations = vpc_lattice_configurations_;
     volume_configurations = volume_configurations_;
     service_connect_configuration = service_connect_configuration_;
     service_registries = service_registries_;
     propagate_tags = propagate_tags_;
     load_balancers = load_balancers_;
     enable_ecs_managed_tags = enable_ecs_managed_tags_;
     enable_execute_command = enable_execute_command_;
     deployment_controller = deployment_controller_;
     health_check_grace_period_seconds = health_check_grace_period_seconds_;
     force_new_deployment = force_new_deployment_;
     platform_version = platform_version_;
     placement_strategy = placement_strategy_;
     placement_constraints = placement_constraints_;
     network_configuration = network_configuration_;
     availability_zone_rebalancing = availability_zone_rebalancing_;
     deployment_configuration = deployment_configuration_;
     capacity_provider_strategy = capacity_provider_strategy_;
     task_definition = task_definition_;
     desired_count = desired_count_;
     service = service_;
     cluster = cluster_;
   }
    : update_service_request)

let make_update_service_primary_task_set_response ?task_set:(task_set_ : task_set option) () =
  ({ task_set = task_set_ } : update_service_primary_task_set_response)

let make_update_service_primary_task_set_request ~primary_task_set:(primary_task_set_ : string_)
    ~service:(service_ : string_) ~cluster:(cluster_ : string_) () =
  ({ primary_task_set = primary_task_set_; service = service_; cluster = cluster_ }
    : update_service_primary_task_set_request)

let make_managed_instances_network_configuration
    ?security_groups:(security_groups_ : string_list option)
    ?subnets:(subnets_ : string_list option) () =
  ({ security_groups = security_groups_; subnets = subnets_ }
    : managed_instances_network_configuration)

let make_managed_instances_storage_configuration
    ?storage_size_gi_b:(storage_size_gi_b_ : task_volume_storage_gi_b option) () =
  ({ storage_size_gi_b = storage_size_gi_b_ } : managed_instances_storage_configuration)

let make_managed_instances_local_storage_configuration
    ?use_local_storage:(use_local_storage_ : boolean_ option) () =
  ({ use_local_storage = use_local_storage_ } : managed_instances_local_storage_configuration)

let make_memory_mi_b_request ?max:(max_ : boxed_integer option) ~min:(min_ : boxed_integer) () =
  ({ max = max_; min = min_ } : memory_mi_b_request)

let make_memory_gi_b_per_v_cpu_request ?max:(max_ : boxed_double option)
    ?min:(min_ : boxed_double option) () =
  ({ max = max_; min = min_ } : memory_gi_b_per_v_cpu_request)

let make_network_interface_count_request ?max:(max_ : boxed_integer option)
    ?min:(min_ : boxed_integer option) () =
  ({ max = max_; min = min_ } : network_interface_count_request)

let make_total_local_storage_gb_request ?max:(max_ : boxed_double option)
    ?min:(min_ : boxed_double option) () =
  ({ max = max_; min = min_ } : total_local_storage_gb_request)

let make_baseline_ebs_bandwidth_mbps_request ?max:(max_ : boxed_integer option)
    ?min:(min_ : boxed_integer option) () =
  ({ max = max_; min = min_ } : baseline_ebs_bandwidth_mbps_request)

let make_accelerator_count_request ?max:(max_ : boxed_integer option)
    ?min:(min_ : boxed_integer option) () =
  ({ max = max_; min = min_ } : accelerator_count_request)

let make_accelerator_total_memory_mi_b_request ?max:(max_ : boxed_integer option)
    ?min:(min_ : boxed_integer option) () =
  ({ max = max_; min = min_ } : accelerator_total_memory_mi_b_request)

let make_network_bandwidth_gbps_request ?max:(max_ : boxed_double option)
    ?min:(min_ : boxed_double option) () =
  ({ max = max_; min = min_ } : network_bandwidth_gbps_request)

let make_instance_requirements_request
    ?max_spot_price_as_percentage_of_optimal_on_demand_price:
      (max_spot_price_as_percentage_of_optimal_on_demand_price_ : boxed_integer option)
    ?allowed_instance_types:(allowed_instance_types_ : allowed_instance_type_set option)
    ?network_bandwidth_gbps:(network_bandwidth_gbps_ : network_bandwidth_gbps_request option)
    ?accelerator_total_memory_mi_b:
      (accelerator_total_memory_mi_b_ : accelerator_total_memory_mi_b_request option)
    ?accelerator_names:(accelerator_names_ : accelerator_name_set option)
    ?accelerator_manufacturers:(accelerator_manufacturers_ : accelerator_manufacturer_set option)
    ?accelerator_count:(accelerator_count_ : accelerator_count_request option)
    ?accelerator_types:(accelerator_types_ : accelerator_type_set option)
    ?baseline_ebs_bandwidth_mbps:
      (baseline_ebs_bandwidth_mbps_ : baseline_ebs_bandwidth_mbps_request option)
    ?total_local_storage_g_b:(total_local_storage_g_b_ : total_local_storage_gb_request option)
    ?local_storage_types:(local_storage_types_ : local_storage_type_set option)
    ?local_storage:(local_storage_ : local_storage option)
    ?network_interface_count:(network_interface_count_ : network_interface_count_request option)
    ?require_hibernate_support:(require_hibernate_support_ : boxed_boolean option)
    ?burstable_performance:(burstable_performance_ : burstable_performance option)
    ?bare_metal:(bare_metal_ : bare_metal option)
    ?on_demand_max_price_percentage_over_lowest_price:
      (on_demand_max_price_percentage_over_lowest_price_ : boxed_integer option)
    ?spot_max_price_percentage_over_lowest_price:
      (spot_max_price_percentage_over_lowest_price_ : boxed_integer option)
    ?instance_generations:(instance_generations_ : instance_generation_set option)
    ?excluded_instance_types:(excluded_instance_types_ : excluded_instance_type_set option)
    ?memory_gi_b_per_v_cpu:(memory_gi_b_per_v_cpu_ : memory_gi_b_per_v_cpu_request option)
    ?cpu_manufacturers:(cpu_manufacturers_ : cpu_manufacturer_set option)
    ~memory_mi_b:(memory_mi_b_ : memory_mi_b_request)
    ~v_cpu_count:(v_cpu_count_ : v_cpu_count_range_request) () =
  ({
     max_spot_price_as_percentage_of_optimal_on_demand_price =
       max_spot_price_as_percentage_of_optimal_on_demand_price_;
     allowed_instance_types = allowed_instance_types_;
     network_bandwidth_gbps = network_bandwidth_gbps_;
     accelerator_total_memory_mi_b = accelerator_total_memory_mi_b_;
     accelerator_names = accelerator_names_;
     accelerator_manufacturers = accelerator_manufacturers_;
     accelerator_count = accelerator_count_;
     accelerator_types = accelerator_types_;
     baseline_ebs_bandwidth_mbps = baseline_ebs_bandwidth_mbps_;
     total_local_storage_g_b = total_local_storage_g_b_;
     local_storage_types = local_storage_types_;
     local_storage = local_storage_;
     network_interface_count = network_interface_count_;
     require_hibernate_support = require_hibernate_support_;
     burstable_performance = burstable_performance_;
     bare_metal = bare_metal_;
     on_demand_max_price_percentage_over_lowest_price =
       on_demand_max_price_percentage_over_lowest_price_;
     spot_max_price_percentage_over_lowest_price = spot_max_price_percentage_over_lowest_price_;
     instance_generations = instance_generations_;
     excluded_instance_types = excluded_instance_types_;
     memory_gi_b_per_v_cpu = memory_gi_b_per_v_cpu_;
     cpu_manufacturers = cpu_manufacturers_;
     memory_mi_b = memory_mi_b_;
     v_cpu_count = v_cpu_count_;
   }
    : instance_requirements_request)

let make_capacity_reservation_request
    ?reservation_preference:(reservation_preference_ : capacity_reservation_preference option)
    ?reservation_group_arn:(reservation_group_arn_ : string_ option) () =
  ({
     reservation_preference = reservation_preference_;
     reservation_group_arn = reservation_group_arn_;
   }
    : capacity_reservation_request)

let make_instance_launch_template_update
    ?capacity_reservations:(capacity_reservations_ : capacity_reservation_request option)
    ?instance_requirements:(instance_requirements_ : instance_requirements_request option)
    ?monitoring:(monitoring_ : managed_instances_monitoring_options option)
    ?local_storage_configuration:
      (local_storage_configuration_ : managed_instances_local_storage_configuration option)
    ?instance_metadata_tags_propagation:(instance_metadata_tags_propagation_ : boxed_boolean option)
    ?storage_configuration:(storage_configuration_ : managed_instances_storage_configuration option)
    ?network_configuration:(network_configuration_ : managed_instances_network_configuration option)
    ?ec2_instance_profile_arn:(ec2_instance_profile_arn_ : string_ option) () =
  ({
     capacity_reservations = capacity_reservations_;
     instance_requirements = instance_requirements_;
     monitoring = monitoring_;
     local_storage_configuration = local_storage_configuration_;
     instance_metadata_tags_propagation = instance_metadata_tags_propagation_;
     storage_configuration = storage_configuration_;
     network_configuration = network_configuration_;
     ec2_instance_profile_arn = ec2_instance_profile_arn_;
   }
    : instance_launch_template_update)

let make_infrastructure_optimization ?scale_in_after:(scale_in_after_ : boxed_integer option) () =
  ({ scale_in_after = scale_in_after_ } : infrastructure_optimization)

let make_auto_repair_configuration
    ?actions_status:(actions_status_ : auto_repair_actions_status option) () =
  ({ actions_status = actions_status_ } : auto_repair_configuration)

let make_update_managed_instances_provider_configuration
    ?auto_repair_configuration:(auto_repair_configuration_ : auto_repair_configuration option)
    ?infrastructure_optimization:(infrastructure_optimization_ : infrastructure_optimization option)
    ?propagate_tags:(propagate_tags_ : propagate_mi_tags option)
    ~instance_launch_template:(instance_launch_template_ : instance_launch_template_update)
    ~infrastructure_role_arn:(infrastructure_role_arn_ : string_) () =
  ({
     auto_repair_configuration = auto_repair_configuration_;
     infrastructure_optimization = infrastructure_optimization_;
     propagate_tags = propagate_tags_;
     instance_launch_template = instance_launch_template_;
     infrastructure_role_arn = infrastructure_role_arn_;
   }
    : update_managed_instances_provider_configuration)

let make_update_express_gateway_service_response
    ?service:(service_ : updated_express_gateway_service option) () =
  ({ service = service_ } : update_express_gateway_service_response)

let make_update_express_gateway_service_request
    ?task_definition_arn:(task_definition_arn_ : string_ option)
    ?scaling_target:(scaling_target_ : express_gateway_scaling_target option)
    ?memory:(memory_ : string_ option) ?cpu:(cpu_ : string_ option)
    ?network_configuration:
      (network_configuration_ : express_gateway_service_network_configuration option)
    ?task_role_arn:(task_role_arn_ : string_ option)
    ?primary_container:(primary_container_ : express_gateway_container option)
    ?health_check_path:(health_check_path_ : string_ option)
    ?execution_role_arn:(execution_role_arn_ : string_ option) ~service_arn:(service_arn_ : string_)
    () =
  ({
     task_definition_arn = task_definition_arn_;
     scaling_target = scaling_target_;
     memory = memory_;
     cpu = cpu_;
     network_configuration = network_configuration_;
     task_role_arn = task_role_arn_;
     primary_container = primary_container_;
     health_check_path = health_check_path_;
     execution_role_arn = execution_role_arn_;
     service_arn = service_arn_;
   }
    : update_express_gateway_service_request)

let make_update_daemon_response ?deployment_arn:(deployment_arn_ : string_ option)
    ?updated_at:(updated_at_ : timestamp option) ?created_at:(created_at_ : timestamp option)
    ?status:(status_ : daemon_status option) ?daemon_arn:(daemon_arn_ : string_ option) () =
  ({
     deployment_arn = deployment_arn_;
     updated_at = updated_at_;
     created_at = created_at_;
     status = status_;
     daemon_arn = daemon_arn_;
   }
    : update_daemon_response)

let make_daemon_alarm_configuration ?enable:(enable_ : boolean_ option)
    ?alarm_names:(alarm_names_ : string_list option) () =
  ({ enable = enable_; alarm_names = alarm_names_ } : daemon_alarm_configuration)

let make_daemon_deployment_configuration
    ?bake_time_in_minutes:(bake_time_in_minutes_ : integer option)
    ?alarms:(alarms_ : daemon_alarm_configuration option)
    ?drain_percent:(drain_percent_ : daemon_drain_percent option) () =
  ({
     bake_time_in_minutes = bake_time_in_minutes_;
     alarms = alarms_;
     drain_percent = drain_percent_;
   }
    : daemon_deployment_configuration)

let make_update_daemon_request ?enable_execute_command:(enable_execute_command_ : boolean_ option)
    ?enable_ecs_managed_tags:(enable_ecs_managed_tags_ : boolean_ option)
    ?propagate_tags:(propagate_tags_ : daemon_propagate_tags option)
    ?deployment_configuration:(deployment_configuration_ : daemon_deployment_configuration option)
    ~capacity_provider_arns:(capacity_provider_arns_ : string_list)
    ~daemon_task_definition_arn:(daemon_task_definition_arn_ : string_)
    ~daemon_arn:(daemon_arn_ : string_) () =
  ({
     enable_execute_command = enable_execute_command_;
     enable_ecs_managed_tags = enable_ecs_managed_tags_;
     propagate_tags = propagate_tags_;
     deployment_configuration = deployment_configuration_;
     capacity_provider_arns = capacity_provider_arns_;
     daemon_task_definition_arn = daemon_task_definition_arn_;
     daemon_arn = daemon_arn_;
   }
    : update_daemon_request)

let make_resource ?string_set_value:(string_set_value_ : string_list option)
    ?integer_value:(integer_value_ : integer option) ?long_value:(long_value_ : long option)
    ?double_value:(double_value_ : double option) ?type_:(type__ : string_ option)
    ?name:(name_ : string_ option) () =
  ({
     string_set_value = string_set_value_;
     integer_value = integer_value_;
     long_value = long_value_;
     double_value = double_value_;
     type_ = type__;
     name = name_;
   }
    : resource)

let make_attribute ?target_id:(target_id_ : string_ option)
    ?target_type:(target_type_ : target_type option) ?value:(value_ : string_ option)
    ~name:(name_ : string_) () =
  ({ target_id = target_id_; target_type = target_type_; value = value_; name = name_ } : attribute)

let make_attachment ?details:(details_ : attachment_details option)
    ?status:(status_ : string_ option) ?type_:(type__ : string_ option) ?id:(id_ : string_ option)
    () =
  ({ details = details_; status = status_; type_ = type__; id = id_ } : attachment)

let make_container_instance_health_status
    ?details:(details_ : instance_health_check_result_list option)
    ?overall_status:(overall_status_ : instance_health_check_state option) () =
  ({ details = details_; overall_status = overall_status_ } : container_instance_health_status)

let make_container_instance
    ?health_status:(health_status_ : container_instance_health_status option)
    ?tags:(tags_ : tags option) ?attachments:(attachments_ : attachments option)
    ?registered_at:(registered_at_ : timestamp option) ?attributes:(attributes_ : attributes option)
    ?agent_update_status:(agent_update_status_ : agent_update_status option)
    ?pending_tasks_count:(pending_tasks_count_ : integer option)
    ?running_tasks_count:(running_tasks_count_ : integer option)
    ?agent_connected:(agent_connected_ : boolean_ option)
    ?status_reason:(status_reason_ : string_ option) ?status:(status_ : string_ option)
    ?registered_resources:(registered_resources_ : resources option)
    ?remaining_resources:(remaining_resources_ : resources option)
    ?version_info:(version_info_ : version_info option) ?version:(version_ : long option)
    ?capacity_provider_name:(capacity_provider_name_ : string_ option)
    ?ec2_instance_id:(ec2_instance_id_ : string_ option)
    ?container_instance_arn:(container_instance_arn_ : string_ option) () =
  ({
     health_status = health_status_;
     tags = tags_;
     attachments = attachments_;
     registered_at = registered_at_;
     attributes = attributes_;
     agent_update_status = agent_update_status_;
     pending_tasks_count = pending_tasks_count_;
     running_tasks_count = running_tasks_count_;
     agent_connected = agent_connected_;
     status_reason = status_reason_;
     status = status_;
     registered_resources = registered_resources_;
     remaining_resources = remaining_resources_;
     version_info = version_info_;
     version = version_;
     capacity_provider_name = capacity_provider_name_;
     ec2_instance_id = ec2_instance_id_;
     container_instance_arn = container_instance_arn_;
   }
    : container_instance)

let make_update_container_instances_state_response ?failures:(failures_ : failures option)
    ?container_instances:(container_instances_ : container_instances option) () =
  ({ failures = failures_; container_instances = container_instances_ }
    : update_container_instances_state_response)

let make_update_container_instances_state_request ?cluster:(cluster_ : string_ option)
    ~status:(status_ : container_instance_status)
    ~container_instances:(container_instances_ : string_list) () =
  ({ status = status_; container_instances = container_instances_; cluster = cluster_ }
    : update_container_instances_state_request)

let make_update_container_agent_response
    ?container_instance:(container_instance_ : container_instance option) () =
  ({ container_instance = container_instance_ } : update_container_agent_response)

let make_update_container_agent_request ?cluster:(cluster_ : string_ option)
    ~container_instance:(container_instance_ : string_) () =
  ({ container_instance = container_instance_; cluster = cluster_ }
    : update_container_agent_request)

let make_execute_command_log_configuration ?s3_key_prefix:(s3_key_prefix_ : string_ option)
    ?s3_encryption_enabled:(s3_encryption_enabled_ : boolean_ option)
    ?s3_bucket_name:(s3_bucket_name_ : string_ option)
    ?cloud_watch_encryption_enabled:(cloud_watch_encryption_enabled_ : boolean_ option)
    ?cloud_watch_log_group_name:(cloud_watch_log_group_name_ : string_ option) () =
  ({
     s3_key_prefix = s3_key_prefix_;
     s3_encryption_enabled = s3_encryption_enabled_;
     s3_bucket_name = s3_bucket_name_;
     cloud_watch_encryption_enabled = cloud_watch_encryption_enabled_;
     cloud_watch_log_group_name = cloud_watch_log_group_name_;
   }
    : execute_command_log_configuration)

let make_execute_command_configuration
    ?log_configuration:(log_configuration_ : execute_command_log_configuration option)
    ?logging:(logging_ : execute_command_logging option) ?kms_key_id:(kms_key_id_ : string_ option)
    () =
  ({ log_configuration = log_configuration_; logging = logging_; kms_key_id = kms_key_id_ }
    : execute_command_configuration)

let make_managed_storage_configuration
    ?fargate_ephemeral_storage_kms_key_id:(fargate_ephemeral_storage_kms_key_id_ : string_ option)
    ?kms_key_id:(kms_key_id_ : string_ option) () =
  ({
     fargate_ephemeral_storage_kms_key_id = fargate_ephemeral_storage_kms_key_id_;
     kms_key_id = kms_key_id_;
   }
    : managed_storage_configuration)

let make_cluster_configuration
    ?managed_storage_configuration:
      (managed_storage_configuration_ : managed_storage_configuration option)
    ?execute_command_configuration:
      (execute_command_configuration_ : execute_command_configuration option) () =
  ({
     managed_storage_configuration = managed_storage_configuration_;
     execute_command_configuration = execute_command_configuration_;
   }
    : cluster_configuration)

let make_cluster_setting ?value:(value_ : string_ option)
    ?name:(name_ : cluster_setting_name option) () =
  ({ value = value_; name = name_ } : cluster_setting)

let make_cluster_service_connect_defaults ?namespace:(namespace_ : string_ option) () =
  ({ namespace = namespace_ } : cluster_service_connect_defaults)

let make_cluster
    ?service_connect_defaults:(service_connect_defaults_ : cluster_service_connect_defaults option)
    ?attachments_status:(attachments_status_ : string_ option)
    ?attachments:(attachments_ : attachments option)
    ?default_capacity_provider_strategy:
      (default_capacity_provider_strategy_ : capacity_provider_strategy option)
    ?capacity_providers:(capacity_providers_ : string_list option)
    ?settings:(settings_ : cluster_settings option) ?tags:(tags_ : tags option)
    ?statistics:(statistics_ : statistics option)
    ?active_services_count:(active_services_count_ : integer option)
    ?pending_tasks_count:(pending_tasks_count_ : integer option)
    ?running_tasks_count:(running_tasks_count_ : integer option)
    ?registered_container_instances_count:(registered_container_instances_count_ : integer option)
    ?status:(status_ : string_ option)
    ?configuration:(configuration_ : cluster_configuration option)
    ?cluster_name:(cluster_name_ : string_ option) ?cluster_arn:(cluster_arn_ : string_ option) () =
  ({
     service_connect_defaults = service_connect_defaults_;
     attachments_status = attachments_status_;
     attachments = attachments_;
     default_capacity_provider_strategy = default_capacity_provider_strategy_;
     capacity_providers = capacity_providers_;
     settings = settings_;
     tags = tags_;
     statistics = statistics_;
     active_services_count = active_services_count_;
     pending_tasks_count = pending_tasks_count_;
     running_tasks_count = running_tasks_count_;
     registered_container_instances_count = registered_container_instances_count_;
     status = status_;
     configuration = configuration_;
     cluster_name = cluster_name_;
     cluster_arn = cluster_arn_;
   }
    : cluster)

let make_update_cluster_settings_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : update_cluster_settings_response)

let make_update_cluster_settings_request ~settings:(settings_ : cluster_settings)
    ~cluster:(cluster_ : string_) () =
  ({ settings = settings_; cluster = cluster_ } : update_cluster_settings_request)

let make_update_cluster_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : update_cluster_response)

let make_cluster_service_connect_defaults_request ~namespace:(namespace_ : string_) () =
  ({ namespace = namespace_ } : cluster_service_connect_defaults_request)

let make_update_cluster_request
    ?service_connect_defaults:
      (service_connect_defaults_ : cluster_service_connect_defaults_request option)
    ?configuration:(configuration_ : cluster_configuration option)
    ?settings:(settings_ : cluster_settings option) ~cluster:(cluster_ : string_) () =
  ({
     service_connect_defaults = service_connect_defaults_;
     configuration = configuration_;
     settings = settings_;
     cluster = cluster_;
   }
    : update_cluster_request)

let make_managed_scaling
    ?instance_warmup_period:
      (instance_warmup_period_ : managed_scaling_instance_warmup_period option)
    ?maximum_scaling_step_size:(maximum_scaling_step_size_ : managed_scaling_step_size option)
    ?minimum_scaling_step_size:(minimum_scaling_step_size_ : managed_scaling_step_size option)
    ?target_capacity:(target_capacity_ : managed_scaling_target_capacity option)
    ?status:(status_ : managed_scaling_status option) () =
  ({
     instance_warmup_period = instance_warmup_period_;
     maximum_scaling_step_size = maximum_scaling_step_size_;
     minimum_scaling_step_size = minimum_scaling_step_size_;
     target_capacity = target_capacity_;
     status = status_;
   }
    : managed_scaling)

let make_auto_scaling_group_provider ?managed_draining:(managed_draining_ : managed_draining option)
    ?managed_termination_protection:
      (managed_termination_protection_ : managed_termination_protection option)
    ?managed_scaling:(managed_scaling_ : managed_scaling option)
    ~auto_scaling_group_arn:(auto_scaling_group_arn_ : string_) () =
  ({
     managed_draining = managed_draining_;
     managed_termination_protection = managed_termination_protection_;
     managed_scaling = managed_scaling_;
     auto_scaling_group_arn = auto_scaling_group_arn_;
   }
    : auto_scaling_group_provider)

let make_instance_launch_template
    ?capacity_reservations:(capacity_reservations_ : capacity_reservation_request option)
    ?fips_enabled:(fips_enabled_ : boxed_boolean option)
    ?instance_requirements:(instance_requirements_ : instance_requirements_request option)
    ?instance_metadata_tags_propagation:(instance_metadata_tags_propagation_ : boxed_boolean option)
    ?capacity_option_type:(capacity_option_type_ : capacity_option_type option)
    ?monitoring:(monitoring_ : managed_instances_monitoring_options option)
    ?local_storage_configuration:
      (local_storage_configuration_ : managed_instances_local_storage_configuration option)
    ?storage_configuration:(storage_configuration_ : managed_instances_storage_configuration option)
    ~network_configuration:(network_configuration_ : managed_instances_network_configuration)
    ~ec2_instance_profile_arn:(ec2_instance_profile_arn_ : string_) () =
  ({
     capacity_reservations = capacity_reservations_;
     fips_enabled = fips_enabled_;
     instance_requirements = instance_requirements_;
     instance_metadata_tags_propagation = instance_metadata_tags_propagation_;
     capacity_option_type = capacity_option_type_;
     monitoring = monitoring_;
     local_storage_configuration = local_storage_configuration_;
     storage_configuration = storage_configuration_;
     network_configuration = network_configuration_;
     ec2_instance_profile_arn = ec2_instance_profile_arn_;
   }
    : instance_launch_template)

let make_managed_instances_provider
    ?auto_repair_configuration:(auto_repair_configuration_ : auto_repair_configuration option)
    ?infrastructure_optimization:(infrastructure_optimization_ : infrastructure_optimization option)
    ?propagate_tags:(propagate_tags_ : propagate_mi_tags option)
    ?instance_launch_template:(instance_launch_template_ : instance_launch_template option)
    ?infrastructure_role_arn:(infrastructure_role_arn_ : string_ option) () =
  ({
     auto_repair_configuration = auto_repair_configuration_;
     infrastructure_optimization = infrastructure_optimization_;
     propagate_tags = propagate_tags_;
     instance_launch_template = instance_launch_template_;
     infrastructure_role_arn = infrastructure_role_arn_;
   }
    : managed_instances_provider)

let make_capacity_provider ?type_:(type__ : capacity_provider_type option)
    ?tags:(tags_ : tags option) ?update_status_reason:(update_status_reason_ : string_ option)
    ?update_status:(update_status_ : capacity_provider_update_status option)
    ?managed_instances_provider:(managed_instances_provider_ : managed_instances_provider option)
    ?auto_scaling_group_provider:(auto_scaling_group_provider_ : auto_scaling_group_provider option)
    ?status:(status_ : capacity_provider_status option) ?cluster:(cluster_ : string_ option)
    ?name:(name_ : string_ option) ?capacity_provider_arn:(capacity_provider_arn_ : string_ option)
    () =
  ({
     type_ = type__;
     tags = tags_;
     update_status_reason = update_status_reason_;
     update_status = update_status_;
     managed_instances_provider = managed_instances_provider_;
     auto_scaling_group_provider = auto_scaling_group_provider_;
     status = status_;
     cluster = cluster_;
     name = name_;
     capacity_provider_arn = capacity_provider_arn_;
   }
    : capacity_provider)

let make_update_capacity_provider_response
    ?capacity_provider:(capacity_provider_ : capacity_provider option) () =
  ({ capacity_provider = capacity_provider_ } : update_capacity_provider_response)

let make_auto_scaling_group_provider_update
    ?managed_draining:(managed_draining_ : managed_draining option)
    ?managed_termination_protection:
      (managed_termination_protection_ : managed_termination_protection option)
    ?managed_scaling:(managed_scaling_ : managed_scaling option) () =
  ({
     managed_draining = managed_draining_;
     managed_termination_protection = managed_termination_protection_;
     managed_scaling = managed_scaling_;
   }
    : auto_scaling_group_provider_update)

let make_update_capacity_provider_request
    ?managed_instances_provider:
      (managed_instances_provider_ : update_managed_instances_provider_configuration option)
    ?auto_scaling_group_provider:
      (auto_scaling_group_provider_ : auto_scaling_group_provider_update option)
    ?cluster:(cluster_ : string_ option) ~name:(name_ : string_) () =
  ({
     managed_instances_provider = managed_instances_provider_;
     auto_scaling_group_provider = auto_scaling_group_provider_;
     cluster = cluster_;
     name = name_;
   }
    : update_capacity_provider_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_keys)
    ~resource_arn:(resource_arn_ : string_) () =
  ({ tag_keys = tag_keys_; resource_arn = resource_arn_ } : untag_resource_request)

let make_ulimit ~hard_limit:(hard_limit_ : integer) ~soft_limit:(soft_limit_ : integer)
    ~name:(name_ : ulimit_name) () =
  ({ hard_limit = hard_limit_; soft_limit = soft_limit_; name = name_ } : ulimit)

let make_tmpfs ?mount_options:(mount_options_ : string_list option) ~size:(size_ : integer)
    ~container_path:(container_path_ : string_) () =
  ({ mount_options = mount_options_; size = size_; container_path = container_path_ } : tmpfs)

let make_network_binding ?host_port_range:(host_port_range_ : string_ option)
    ?container_port_range:(container_port_range_ : string_ option)
    ?protocol:(protocol_ : transport_protocol option) ?host_port:(host_port_ : boxed_integer option)
    ?container_port:(container_port_ : boxed_integer option) ?bind_i_p:(bind_i_p_ : string_ option)
    () =
  ({
     host_port_range = host_port_range_;
     container_port_range = container_port_range_;
     protocol = protocol_;
     host_port = host_port_;
     container_port = container_port_;
     bind_i_p = bind_i_p_;
   }
    : network_binding)

let make_network_interface ?ipv6_address:(ipv6_address_ : string_ option)
    ?private_ipv4_address:(private_ipv4_address_ : string_ option)
    ?attachment_id:(attachment_id_ : string_ option) () =
  ({
     ipv6_address = ipv6_address_;
     private_ipv4_address = private_ipv4_address_;
     attachment_id = attachment_id_;
   }
    : network_interface)

let make_managed_agent ?last_status:(last_status_ : string_ option)
    ?reason:(reason_ : string_ option) ?name:(name_ : managed_agent_name option)
    ?last_started_at:(last_started_at_ : timestamp option) () =
  ({
     last_status = last_status_;
     reason = reason_;
     name = name_;
     last_started_at = last_started_at_;
   }
    : managed_agent)

let make_container ?neuron_device_ids:(neuron_device_ids_ : neuron_device_ids option)
    ?gpu_ids:(gpu_ids_ : gpu_ids option) ?memory_reservation:(memory_reservation_ : string_ option)
    ?memory:(memory_ : string_ option) ?cpu:(cpu_ : string_ option)
    ?managed_agents:(managed_agents_ : managed_agents option)
    ?health_status:(health_status_ : health_status option)
    ?network_interfaces:(network_interfaces_ : network_interfaces option)
    ?network_bindings:(network_bindings_ : network_bindings option)
    ?reason:(reason_ : string_ option) ?exit_code:(exit_code_ : boxed_integer option)
    ?last_status:(last_status_ : string_ option) ?runtime_id:(runtime_id_ : string_ option)
    ?image_digest:(image_digest_ : string_ option) ?image:(image_ : string_ option)
    ?name:(name_ : string_ option) ?task_arn:(task_arn_ : string_ option)
    ?container_arn:(container_arn_ : string_ option) () =
  ({
     neuron_device_ids = neuron_device_ids_;
     gpu_ids = gpu_ids_;
     memory_reservation = memory_reservation_;
     memory = memory_;
     cpu = cpu_;
     managed_agents = managed_agents_;
     health_status = health_status_;
     network_interfaces = network_interfaces_;
     network_bindings = network_bindings_;
     reason = reason_;
     exit_code = exit_code_;
     last_status = last_status_;
     runtime_id = runtime_id_;
     image_digest = image_digest_;
     image = image_;
     name = name_;
     task_arn = task_arn_;
     container_arn = container_arn_;
   }
    : container)

let make_inference_accelerator ~device_type:(device_type_ : string_)
    ~device_name:(device_name_ : string_) () =
  ({ device_type = device_type_; device_name = device_name_ } : inference_accelerator)

let make_environment_file ~type_:(type__ : environment_file_type) ~value:(value_ : string_) () =
  ({ type_ = type__; value = value_ } : environment_file)

let make_resource_requirement ~type_:(type__ : resource_type) ~value:(value_ : string_) () =
  ({ type_ = type__; value = value_ } : resource_requirement)

let make_container_override
    ?resource_requirements:(resource_requirements_ : resource_requirements option)
    ?memory_reservation:(memory_reservation_ : boxed_integer option)
    ?memory:(memory_ : boxed_integer option) ?cpu:(cpu_ : boxed_integer option)
    ?environment_files:(environment_files_ : environment_files option)
    ?environment:(environment_ : environment_variables option)
    ?command:(command_ : string_list option) ?name:(name_ : string_ option) () =
  ({
     resource_requirements = resource_requirements_;
     memory_reservation = memory_reservation_;
     memory = memory_;
     cpu = cpu_;
     environment_files = environment_files_;
     environment = environment_;
     command = command_;
     name = name_;
   }
    : container_override)

let make_inference_accelerator_override ?device_type:(device_type_ : string_ option)
    ?device_name:(device_name_ : string_ option) () =
  ({ device_type = device_type_; device_name = device_name_ } : inference_accelerator_override)

let make_ephemeral_storage ~size_in_gi_b:(size_in_gi_b_ : integer) () =
  ({ size_in_gi_b = size_in_gi_b_ } : ephemeral_storage)

let make_task_override ?ephemeral_storage:(ephemeral_storage_ : ephemeral_storage option)
    ?task_role_arn:(task_role_arn_ : string_ option) ?memory:(memory_ : string_ option)
    ?execution_role_arn:(execution_role_arn_ : string_ option)
    ?inference_accelerator_overrides:
      (inference_accelerator_overrides_ : inference_accelerator_overrides option)
    ?cpu:(cpu_ : string_ option)
    ?container_overrides:(container_overrides_ : container_overrides option) () =
  ({
     ephemeral_storage = ephemeral_storage_;
     task_role_arn = task_role_arn_;
     memory = memory_;
     execution_role_arn = execution_role_arn_;
     inference_accelerator_overrides = inference_accelerator_overrides_;
     cpu = cpu_;
     container_overrides = container_overrides_;
   }
    : task_override)

let make_task_ephemeral_storage ?kms_key_id:(kms_key_id_ : string_ option)
    ?size_in_gi_b:(size_in_gi_b_ : integer option) () =
  ({ kms_key_id = kms_key_id_; size_in_gi_b = size_in_gi_b_ } : task_ephemeral_storage)

let make_task
    ?fargate_ephemeral_storage:(fargate_ephemeral_storage_ : task_ephemeral_storage option)
    ?ephemeral_storage:(ephemeral_storage_ : ephemeral_storage option)
    ?version:(version_ : long option) ?task_definition_arn:(task_definition_arn_ : string_ option)
    ?task_arn:(task_arn_ : string_ option) ?tags:(tags_ : tags option)
    ?stopping_at:(stopping_at_ : timestamp option)
    ?stopped_reason:(stopped_reason_ : string_ option) ?stopped_at:(stopped_at_ : timestamp option)
    ?stop_code:(stop_code_ : task_stop_code option) ?started_by:(started_by_ : string_ option)
    ?started_at:(started_at_ : timestamp option)
    ?pull_stopped_at:(pull_stopped_at_ : timestamp option)
    ?pull_started_at:(pull_started_at_ : timestamp option)
    ?platform_family:(platform_family_ : string_ option)
    ?platform_version:(platform_version_ : string_ option)
    ?overrides:(overrides_ : task_override option) ?memory:(memory_ : string_ option)
    ?launch_type:(launch_type_ : launch_type option) ?last_status:(last_status_ : string_ option)
    ?inference_accelerators:(inference_accelerators_ : inference_accelerators option)
    ?health_status:(health_status_ : health_status option) ?group:(group_ : string_ option)
    ?execution_stopped_at:(execution_stopped_at_ : timestamp option)
    ?enable_execute_command:(enable_execute_command_ : boolean_ option)
    ?desired_status:(desired_status_ : string_ option) ?created_at:(created_at_ : timestamp option)
    ?cpu:(cpu_ : string_ option) ?containers:(containers_ : containers option)
    ?container_instance_arn:(container_instance_arn_ : string_ option)
    ?connectivity_at:(connectivity_at_ : timestamp option)
    ?connectivity:(connectivity_ : connectivity option) ?cluster_arn:(cluster_arn_ : string_ option)
    ?capacity_provider_name:(capacity_provider_name_ : string_ option)
    ?availability_zone:(availability_zone_ : string_ option)
    ?attributes:(attributes_ : attributes option) ?attachments:(attachments_ : attachments option)
    () =
  ({
     fargate_ephemeral_storage = fargate_ephemeral_storage_;
     ephemeral_storage = ephemeral_storage_;
     version = version_;
     task_definition_arn = task_definition_arn_;
     task_arn = task_arn_;
     tags = tags_;
     stopping_at = stopping_at_;
     stopped_reason = stopped_reason_;
     stopped_at = stopped_at_;
     stop_code = stop_code_;
     started_by = started_by_;
     started_at = started_at_;
     pull_stopped_at = pull_stopped_at_;
     pull_started_at = pull_started_at_;
     platform_family = platform_family_;
     platform_version = platform_version_;
     overrides = overrides_;
     memory = memory_;
     launch_type = launch_type_;
     last_status = last_status_;
     inference_accelerators = inference_accelerators_;
     health_status = health_status_;
     group = group_;
     execution_stopped_at = execution_stopped_at_;
     enable_execute_command = enable_execute_command_;
     desired_status = desired_status_;
     created_at = created_at_;
     cpu = cpu_;
     containers = containers_;
     container_instance_arn = container_instance_arn_;
     connectivity_at = connectivity_at_;
     connectivity = connectivity_;
     cluster_arn = cluster_arn_;
     capacity_provider_name = capacity_provider_name_;
     availability_zone = availability_zone_;
     attributes = attributes_;
     attachments = attachments_;
   }
    : task)

let make_task_managed_ebs_volume_termination_policy
    ~delete_on_termination:(delete_on_termination_ : boxed_boolean) () =
  ({ delete_on_termination = delete_on_termination_ } : task_managed_ebs_volume_termination_policy)

let make_task_managed_ebs_volume_configuration
    ?filesystem_type:(filesystem_type_ : task_filesystem_type option)
    ?termination_policy:(termination_policy_ : task_managed_ebs_volume_termination_policy option)
    ?tag_specifications:(tag_specifications_ : ebs_tag_specifications option)
    ?throughput:(throughput_ : boxed_integer option) ?iops:(iops_ : boxed_integer option)
    ?volume_initialization_rate:(volume_initialization_rate_ : boxed_integer option)
    ?snapshot_id:(snapshot_id_ : ebs_snapshot_id option)
    ?size_in_gi_b:(size_in_gi_b_ : boxed_integer option)
    ?volume_type:(volume_type_ : ebs_volume_type option)
    ?kms_key_id:(kms_key_id_ : ebskms_key_id option) ?encrypted:(encrypted_ : boxed_boolean option)
    ~role_arn:(role_arn_ : iam_role_arn) () =
  ({
     filesystem_type = filesystem_type_;
     termination_policy = termination_policy_;
     role_arn = role_arn_;
     tag_specifications = tag_specifications_;
     throughput = throughput_;
     iops = iops_;
     volume_initialization_rate = volume_initialization_rate_;
     snapshot_id = snapshot_id_;
     size_in_gi_b = size_in_gi_b_;
     volume_type = volume_type_;
     kms_key_id = kms_key_id_;
     encrypted = encrypted_;
   }
    : task_managed_ebs_volume_configuration)

let make_task_volume_configuration
    ?managed_ebs_volume:(managed_ebs_volume_ : task_managed_ebs_volume_configuration option)
    ~name:(name_ : ecs_volume_name) () =
  ({ managed_ebs_volume = managed_ebs_volume_; name = name_ } : task_volume_configuration)

let make_task_definition_placement_constraint ?expression:(expression_ : string_ option)
    ?type_:(type__ : task_definition_placement_constraint_type option) () =
  ({ expression = expression_; type_ = type__ } : task_definition_placement_constraint)

let make_repository_credentials ~credentials_parameter:(credentials_parameter_ : string_) () =
  ({ credentials_parameter = credentials_parameter_ } : repository_credentials)

let make_port_mapping ?container_port_range:(container_port_range_ : string_ option)
    ?app_protocol:(app_protocol_ : application_protocol option) ?name:(name_ : string_ option)
    ?protocol:(protocol_ : transport_protocol option) ?host_port:(host_port_ : boxed_integer option)
    ?container_port:(container_port_ : boxed_integer option) () =
  ({
     container_port_range = container_port_range_;
     app_protocol = app_protocol_;
     name = name_;
     protocol = protocol_;
     host_port = host_port_;
     container_port = container_port_;
   }
    : port_mapping)

let make_container_restart_policy
    ?restart_attempt_period:(restart_attempt_period_ : boxed_integer option)
    ?ignored_exit_codes:(ignored_exit_codes_ : integer_list option)
    ~enabled:(enabled_ : boxed_boolean) () =
  ({
     restart_attempt_period = restart_attempt_period_;
     ignored_exit_codes = ignored_exit_codes_;
     enabled = enabled_;
   }
    : container_restart_policy)

let make_mount_point ?read_only:(read_only_ : boxed_boolean option)
    ?container_path:(container_path_ : string_ option)
    ?source_volume:(source_volume_ : string_ option) () =
  ({ read_only = read_only_; container_path = container_path_; source_volume = source_volume_ }
    : mount_point)

let make_kernel_capabilities ?drop:(drop_ : string_list option) ?add:(add_ : string_list option) ()
    =
  ({ drop = drop_; add = add_ } : kernel_capabilities)

let make_device ?permissions:(permissions_ : device_cgroup_permissions option)
    ?container_path:(container_path_ : string_ option) ~host_path:(host_path_ : string_) () =
  ({ permissions = permissions_; container_path = container_path_; host_path = host_path_ }
    : device)

let make_linux_parameters ?swappiness:(swappiness_ : boxed_integer option)
    ?max_swap:(max_swap_ : boxed_integer option) ?tmpfs:(tmpfs_ : tmpfs_list option)
    ?shared_memory_size:(shared_memory_size_ : boxed_integer option)
    ?init_process_enabled:(init_process_enabled_ : boxed_boolean option)
    ?devices:(devices_ : devices_list option)
    ?capabilities:(capabilities_ : kernel_capabilities option) () =
  ({
     swappiness = swappiness_;
     max_swap = max_swap_;
     tmpfs = tmpfs_;
     shared_memory_size = shared_memory_size_;
     init_process_enabled = init_process_enabled_;
     devices = devices_;
     capabilities = capabilities_;
   }
    : linux_parameters)

let make_container_dependency ~condition:(condition_ : container_condition)
    ~container_name:(container_name_ : string_) () =
  ({ condition = condition_; container_name = container_name_ } : container_dependency)

let make_host_entry ~ip_address:(ip_address_ : string_) ~hostname:(hostname_ : string_) () =
  ({ ip_address = ip_address_; hostname = hostname_ } : host_entry)

let make_health_check ?start_period:(start_period_ : boxed_integer option)
    ?retries:(retries_ : boxed_integer option) ?timeout:(timeout_ : boxed_integer option)
    ?interval:(interval_ : boxed_integer option) ~command:(command_ : string_list) () =
  ({
     start_period = start_period_;
     retries = retries_;
     timeout = timeout_;
     interval = interval_;
     command = command_;
   }
    : health_check)

let make_system_control ?value:(value_ : string_ option) ?namespace:(namespace_ : string_ option) ()
    =
  ({ value = value_; namespace = namespace_ } : system_control)

let make_firelens_configuration ?options:(options_ : firelens_configuration_options_map option)
    ~type_:(type__ : firelens_configuration_type) () =
  ({ options = options_; type_ = type__ } : firelens_configuration)

let make_container_definition ?credential_specs:(credential_specs_ : string_list option)
    ?firelens_configuration:(firelens_configuration_ : firelens_configuration option)
    ?resource_requirements:(resource_requirements_ : resource_requirements option)
    ?system_controls:(system_controls_ : system_controls option)
    ?health_check:(health_check_ : health_check option)
    ?log_configuration:(log_configuration_ : log_configuration option)
    ?ulimits:(ulimits_ : ulimit_list option)
    ?docker_labels:(docker_labels_ : docker_labels_map option)
    ?pseudo_terminal:(pseudo_terminal_ : boxed_boolean option)
    ?interactive:(interactive_ : boxed_boolean option)
    ?docker_security_options:(docker_security_options_ : string_list option)
    ?extra_hosts:(extra_hosts_ : host_entry_list option)
    ?dns_search_domains:(dns_search_domains_ : string_list option)
    ?dns_servers:(dns_servers_ : string_list option)
    ?readonly_root_filesystem:(readonly_root_filesystem_ : boxed_boolean option)
    ?privileged:(privileged_ : boxed_boolean option)
    ?disable_networking:(disable_networking_ : boxed_boolean option)
    ?working_directory:(working_directory_ : string_ option) ?user:(user_ : string_ option)
    ?hostname:(hostname_ : string_ option)
    ?version_consistency:(version_consistency_ : version_consistency option)
    ?stop_timeout:(stop_timeout_ : boxed_integer option)
    ?start_timeout:(start_timeout_ : boxed_integer option)
    ?depends_on:(depends_on_ : container_dependencies option)
    ?secrets:(secrets_ : secret_list option)
    ?linux_parameters:(linux_parameters_ : linux_parameters option)
    ?volumes_from:(volumes_from_ : volume_from_list option)
    ?mount_points:(mount_points_ : mount_point_list option)
    ?environment_files:(environment_files_ : environment_files option)
    ?environment:(environment_ : environment_variables option)
    ?command:(command_ : string_list option) ?entry_point:(entry_point_ : string_list option)
    ?restart_policy:(restart_policy_ : container_restart_policy option)
    ?essential:(essential_ : boxed_boolean option)
    ?port_mappings:(port_mappings_ : port_mapping_list option) ?links:(links_ : string_list option)
    ?memory_reservation:(memory_reservation_ : boxed_integer option)
    ?memory:(memory_ : boxed_integer option) ?cpu:(cpu_ : integer option)
    ?repository_credentials:(repository_credentials_ : repository_credentials option)
    ?image:(image_ : string_ option) ?name:(name_ : string_ option) () =
  ({
     credential_specs = credential_specs_;
     firelens_configuration = firelens_configuration_;
     resource_requirements = resource_requirements_;
     system_controls = system_controls_;
     health_check = health_check_;
     log_configuration = log_configuration_;
     ulimits = ulimits_;
     docker_labels = docker_labels_;
     pseudo_terminal = pseudo_terminal_;
     interactive = interactive_;
     docker_security_options = docker_security_options_;
     extra_hosts = extra_hosts_;
     dns_search_domains = dns_search_domains_;
     dns_servers = dns_servers_;
     readonly_root_filesystem = readonly_root_filesystem_;
     privileged = privileged_;
     disable_networking = disable_networking_;
     working_directory = working_directory_;
     user = user_;
     hostname = hostname_;
     version_consistency = version_consistency_;
     stop_timeout = stop_timeout_;
     start_timeout = start_timeout_;
     depends_on = depends_on_;
     secrets = secrets_;
     linux_parameters = linux_parameters_;
     volumes_from = volumes_from_;
     mount_points = mount_points_;
     environment_files = environment_files_;
     environment = environment_;
     command = command_;
     entry_point = entry_point_;
     restart_policy = restart_policy_;
     essential = essential_;
     port_mappings = port_mappings_;
     links = links_;
     memory_reservation = memory_reservation_;
     memory = memory_;
     cpu = cpu_;
     repository_credentials = repository_credentials_;
     image = image_;
     name = name_;
   }
    : container_definition)

let make_runtime_platform ?operating_system_family:(operating_system_family_ : os_family option)
    ?cpu_architecture:(cpu_architecture_ : cpu_architecture option) () =
  ({ operating_system_family = operating_system_family_; cpu_architecture = cpu_architecture_ }
    : runtime_platform)

let make_proxy_configuration ?properties:(properties_ : proxy_configuration_properties option)
    ?type_:(type__ : proxy_configuration_type option) ~container_name:(container_name_ : string_) ()
    =
  ({ properties = properties_; container_name = container_name_; type_ = type__ }
    : proxy_configuration)

let make_task_definition ?enable_fault_injection:(enable_fault_injection_ : boxed_boolean option)
    ?ephemeral_storage:(ephemeral_storage_ : ephemeral_storage option)
    ?registered_by:(registered_by_ : string_ option)
    ?delete_requested_at:(delete_requested_at_ : timestamp option)
    ?deregistered_at:(deregistered_at_ : timestamp option)
    ?registered_at:(registered_at_ : timestamp option)
    ?proxy_configuration:(proxy_configuration_ : proxy_configuration option)
    ?ipc_mode:(ipc_mode_ : ipc_mode option) ?pid_mode:(pid_mode_ : pid_mode option)
    ?inference_accelerators:(inference_accelerators_ : inference_accelerators option)
    ?memory:(memory_ : string_ option) ?cpu:(cpu_ : string_ option)
    ?requires_compatibilities:(requires_compatibilities_ : compatibility_list option)
    ?runtime_platform:(runtime_platform_ : runtime_platform option)
    ?compatibilities:(compatibilities_ : compatibility_list option)
    ?placement_constraints:(placement_constraints_ : task_definition_placement_constraints option)
    ?requires_attributes:(requires_attributes_ : requires_attributes option)
    ?status:(status_ : task_definition_status option) ?volumes:(volumes_ : volume_list option)
    ?revision:(revision_ : integer option) ?network_mode:(network_mode_ : network_mode option)
    ?execution_role_arn:(execution_role_arn_ : string_ option)
    ?task_role_arn:(task_role_arn_ : string_ option) ?family:(family_ : string_ option)
    ?container_definitions:(container_definitions_ : container_definitions option)
    ?task_definition_arn:(task_definition_arn_ : string_ option) () =
  ({
     enable_fault_injection = enable_fault_injection_;
     ephemeral_storage = ephemeral_storage_;
     registered_by = registered_by_;
     delete_requested_at = delete_requested_at_;
     deregistered_at = deregistered_at_;
     registered_at = registered_at_;
     proxy_configuration = proxy_configuration_;
     ipc_mode = ipc_mode_;
     pid_mode = pid_mode_;
     inference_accelerators = inference_accelerators_;
     memory = memory_;
     cpu = cpu_;
     requires_compatibilities = requires_compatibilities_;
     runtime_platform = runtime_platform_;
     compatibilities = compatibilities_;
     placement_constraints = placement_constraints_;
     requires_attributes = requires_attributes_;
     status = status_;
     volumes = volumes_;
     revision = revision_;
     network_mode = network_mode_;
     execution_role_arn = execution_role_arn_;
     task_role_arn = task_role_arn_;
     family = family_;
     container_definitions = container_definitions_;
     task_definition_arn = task_definition_arn_;
   }
    : task_definition)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~tags:(tags_ : tags) ~resource_arn:(resource_arn_ : string_) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : tag_resource_request)

let make_submit_task_state_change_response ?acknowledgment:(acknowledgment_ : string_ option) () =
  ({ acknowledgment = acknowledgment_ } : submit_task_state_change_response)

let make_container_state_change ?status:(status_ : string_ option)
    ?reason:(reason_ : string_ option)
    ?network_bindings:(network_bindings_ : network_bindings option)
    ?exit_code:(exit_code_ : boxed_integer option) ?runtime_id:(runtime_id_ : string_ option)
    ?image_digest:(image_digest_ : string_ option)
    ?container_name:(container_name_ : string_ option) () =
  ({
     status = status_;
     reason = reason_;
     network_bindings = network_bindings_;
     exit_code = exit_code_;
     runtime_id = runtime_id_;
     image_digest = image_digest_;
     container_name = container_name_;
   }
    : container_state_change)

let make_attachment_state_change ~status:(status_ : string_)
    ~attachment_arn:(attachment_arn_ : string_) () =
  ({ status = status_; attachment_arn = attachment_arn_ } : attachment_state_change)

let make_managed_agent_state_change ?reason:(reason_ : string_ option) ~status:(status_ : string_)
    ~managed_agent_name:(managed_agent_name_ : managed_agent_name)
    ~container_name:(container_name_ : string_) () =
  ({
     reason = reason_;
     status = status_;
     managed_agent_name = managed_agent_name_;
     container_name = container_name_;
   }
    : managed_agent_state_change)

let make_submit_task_state_change_request
    ?execution_stopped_at:(execution_stopped_at_ : timestamp option)
    ?pull_stopped_at:(pull_stopped_at_ : timestamp option)
    ?pull_started_at:(pull_started_at_ : timestamp option)
    ?managed_agents:(managed_agents_ : managed_agent_state_changes option)
    ?attachments:(attachments_ : attachment_state_changes option)
    ?containers:(containers_ : container_state_changes option) ?reason:(reason_ : string_ option)
    ?status:(status_ : string_ option) ?task:(task_ : string_ option)
    ?cluster:(cluster_ : string_ option) () =
  ({
     execution_stopped_at = execution_stopped_at_;
     pull_stopped_at = pull_stopped_at_;
     pull_started_at = pull_started_at_;
     managed_agents = managed_agents_;
     attachments = attachments_;
     containers = containers_;
     reason = reason_;
     status = status_;
     task = task_;
     cluster = cluster_;
   }
    : submit_task_state_change_request)

let make_submit_container_state_change_response ?acknowledgment:(acknowledgment_ : string_ option)
    () =
  ({ acknowledgment = acknowledgment_ } : submit_container_state_change_response)

let make_submit_container_state_change_request
    ?network_bindings:(network_bindings_ : network_bindings option)
    ?reason:(reason_ : string_ option) ?exit_code:(exit_code_ : boxed_integer option)
    ?status:(status_ : string_ option) ?runtime_id:(runtime_id_ : string_ option)
    ?container_name:(container_name_ : string_ option) ?task:(task_ : string_ option)
    ?cluster:(cluster_ : string_ option) () =
  ({
     network_bindings = network_bindings_;
     reason = reason_;
     exit_code = exit_code_;
     status = status_;
     runtime_id = runtime_id_;
     container_name = container_name_;
     task = task_;
     cluster = cluster_;
   }
    : submit_container_state_change_request)

let make_submit_attachment_state_changes_response ?acknowledgment:(acknowledgment_ : string_ option)
    () =
  ({ acknowledgment = acknowledgment_ } : submit_attachment_state_changes_response)

let make_submit_attachment_state_changes_request ?cluster:(cluster_ : string_ option)
    ~attachments:(attachments_ : attachment_state_changes) () =
  ({ attachments = attachments_; cluster = cluster_ } : submit_attachment_state_changes_request)

let make_stop_task_response ?task:(task_ : task option) () = ({ task = task_ } : stop_task_response)

let make_stop_task_request ?reason:(reason_ : string_ option) ?cluster:(cluster_ : string_ option)
    ~task:(task_ : string_) () =
  ({ reason = reason_; task = task_; cluster = cluster_ } : stop_task_request)

let make_stop_service_deployment_response
    ?service_deployment_arn:(service_deployment_arn_ : string_ option) () =
  ({ service_deployment_arn = service_deployment_arn_ } : stop_service_deployment_response)

let make_stop_service_deployment_request
    ?stop_type:(stop_type_ : stop_service_deployment_stop_type option)
    ~service_deployment_arn:(service_deployment_arn_ : string_) () =
  ({ stop_type = stop_type_; service_deployment_arn = service_deployment_arn_ }
    : stop_service_deployment_request)

let make_start_task_response ?failures:(failures_ : failures option) ?tasks:(tasks_ : tasks option)
    () =
  ({ failures = failures_; tasks = tasks_ } : start_task_response)

let make_start_task_request
    ?volume_configurations:(volume_configurations_ : task_volume_configurations option)
    ?tags:(tags_ : tags option) ?started_by:(started_by_ : string_ option)
    ?reference_id:(reference_id_ : string_ option)
    ?propagate_tags:(propagate_tags_ : propagate_tags option)
    ?overrides:(overrides_ : task_override option)
    ?network_configuration:(network_configuration_ : network_configuration option)
    ?group:(group_ : string_ option)
    ?enable_execute_command:(enable_execute_command_ : boolean_ option)
    ?enable_ecs_managed_tags:(enable_ecs_managed_tags_ : boolean_ option)
    ?cluster:(cluster_ : string_ option) ~task_definition:(task_definition_ : string_)
    ~container_instances:(container_instances_ : string_list) () =
  ({
     volume_configurations = volume_configurations_;
     task_definition = task_definition_;
     tags = tags_;
     started_by = started_by_;
     reference_id = reference_id_;
     propagate_tags = propagate_tags_;
     overrides = overrides_;
     network_configuration = network_configuration_;
     group = group_;
     enable_execute_command = enable_execute_command_;
     enable_ecs_managed_tags = enable_ecs_managed_tags_;
     container_instances = container_instances_;
     cluster = cluster_;
   }
    : start_task_request)

let make_setting ?type_:(type__ : setting_type option)
    ?principal_arn:(principal_arn_ : string_ option) ?value:(value_ : string_ option)
    ?name:(name_ : setting_name option) () =
  ({ type_ = type__; principal_arn = principal_arn_; value = value_; name = name_ } : setting)

let make_session ?token_value:(token_value_ : sensitive_string option)
    ?stream_url:(stream_url_ : string_ option) ?session_id:(session_id_ : string_ option) () =
  ({ token_value = token_value_; stream_url = stream_url_; session_id = session_id_ } : session)

let make_service_revision_summary
    ?requested_production_traffic_weight:(requested_production_traffic_weight_ : double option)
    ?requested_test_traffic_weight:(requested_test_traffic_weight_ : double option)
    ?pending_task_count:(pending_task_count_ : integer option)
    ?running_task_count:(running_task_count_ : integer option)
    ?requested_task_count:(requested_task_count_ : integer option) ?arn:(arn_ : string_ option) () =
  ({
     requested_production_traffic_weight = requested_production_traffic_weight_;
     requested_test_traffic_weight = requested_test_traffic_weight_;
     pending_task_count = pending_task_count_;
     running_task_count = running_task_count_;
     requested_task_count = requested_task_count_;
     arn = arn_;
   }
    : service_revision_summary)

let make_container_image ?image:(image_ : string_ option)
    ?image_digest:(image_digest_ : string_ option)
    ?container_name:(container_name_ : string_ option) () =
  ({ image = image_; image_digest = image_digest_; container_name = container_name_ }
    : container_image)

let make_service_revision_load_balancer
    ?production_listener_rule:(production_listener_rule_ : string_ option)
    ?target_group_arn:(target_group_arn_ : string_ option) () =
  ({ production_listener_rule = production_listener_rule_; target_group_arn = target_group_arn_ }
    : service_revision_load_balancer)

let make_resolved_configuration
    ?load_balancers:(load_balancers_ : service_revision_load_balancers option) () =
  ({ load_balancers = load_balancers_ } : resolved_configuration)

let make_managed_load_balancer ?security_group_ids:(security_group_ids_ : string_list option)
    ?subnet_ids:(subnet_ids_ : string_list option) ?status_reason:(status_reason_ : string_ option)
    ?arn:(arn_ : string_ option) ~scheme:(scheme_ : string_) ~updated_at:(updated_at_ : timestamp)
    ~status:(status_ : managed_resource_status) () =
  ({
     security_group_ids = security_group_ids_;
     subnet_ids = subnet_ids_;
     scheme = scheme_;
     updated_at = updated_at_;
     status_reason = status_reason_;
     status = status_;
     arn = arn_;
   }
    : managed_load_balancer)

let make_managed_security_group ?status_reason:(status_reason_ : string_ option)
    ?arn:(arn_ : string_ option) ~updated_at:(updated_at_ : timestamp)
    ~status:(status_ : managed_resource_status) () =
  ({ updated_at = updated_at_; status_reason = status_reason_; status = status_; arn = arn_ }
    : managed_security_group)

let make_managed_certificate ?status_reason:(status_reason_ : string_ option)
    ?arn:(arn_ : string_ option) ~domain_name:(domain_name_ : string_)
    ~updated_at:(updated_at_ : timestamp) ~status:(status_ : managed_resource_status) () =
  ({
     domain_name = domain_name_;
     updated_at = updated_at_;
     status_reason = status_reason_;
     status = status_;
     arn = arn_;
   }
    : managed_certificate)

let make_managed_listener ?status_reason:(status_reason_ : string_ option)
    ?arn:(arn_ : string_ option) ~updated_at:(updated_at_ : timestamp)
    ~status:(status_ : managed_resource_status) () =
  ({ updated_at = updated_at_; status_reason = status_reason_; status = status_; arn = arn_ }
    : managed_listener)

let make_managed_listener_rule ?status_reason:(status_reason_ : string_ option)
    ?arn:(arn_ : string_ option) ~updated_at:(updated_at_ : timestamp)
    ~status:(status_ : managed_resource_status) () =
  ({ updated_at = updated_at_; status_reason = status_reason_; status = status_; arn = arn_ }
    : managed_listener_rule)

let make_managed_target_group ?status_reason:(status_reason_ : string_ option)
    ?arn:(arn_ : string_ option) ~port:(port_ : integer)
    ~health_check_port:(health_check_port_ : integer)
    ~health_check_path:(health_check_path_ : string_) ~updated_at:(updated_at_ : timestamp)
    ~status:(status_ : managed_resource_status) () =
  ({
     port = port_;
     health_check_port = health_check_port_;
     health_check_path = health_check_path_;
     updated_at = updated_at_;
     status_reason = status_reason_;
     status = status_;
     arn = arn_;
   }
    : managed_target_group)

let make_managed_ingress_path ?target_groups:(target_groups_ : managed_target_groups option)
    ?rule:(rule_ : managed_listener_rule option) ?listener:(listener_ : managed_listener option)
    ?certificate:(certificate_ : managed_certificate option)
    ?load_balancer_security_groups:(load_balancer_security_groups_ : managed_security_groups option)
    ?load_balancer:(load_balancer_ : managed_load_balancer option) ~endpoint:(endpoint_ : string_)
    ~access_type:(access_type_ : access_type) () =
  ({
     target_groups = target_groups_;
     rule = rule_;
     listener = listener_;
     certificate = certificate_;
     load_balancer_security_groups = load_balancer_security_groups_;
     load_balancer = load_balancer_;
     endpoint = endpoint_;
     access_type = access_type_;
   }
    : managed_ingress_path)

let make_managed_scalable_target ?status_reason:(status_reason_ : string_ option)
    ?arn:(arn_ : string_ option) ~max_capacity:(max_capacity_ : integer)
    ~min_capacity:(min_capacity_ : integer) ~updated_at:(updated_at_ : timestamp)
    ~status:(status_ : managed_resource_status) () =
  ({
     max_capacity = max_capacity_;
     min_capacity = min_capacity_;
     updated_at = updated_at_;
     status_reason = status_reason_;
     status = status_;
     arn = arn_;
   }
    : managed_scalable_target)

let make_managed_application_auto_scaling_policy ?status_reason:(status_reason_ : string_ option)
    ?arn:(arn_ : string_ option) ~metric:(metric_ : string_) ~target_value:(target_value_ : double)
    ~policy_type:(policy_type_ : string_) ~updated_at:(updated_at_ : timestamp)
    ~status:(status_ : managed_resource_status) () =
  ({
     metric = metric_;
     target_value = target_value_;
     policy_type = policy_type_;
     updated_at = updated_at_;
     status_reason = status_reason_;
     status = status_;
     arn = arn_;
   }
    : managed_application_auto_scaling_policy)

let make_managed_auto_scaling
    ?application_auto_scaling_policies:
      (application_auto_scaling_policies_ : managed_application_auto_scaling_policies option)
    ?scalable_target:(scalable_target_ : managed_scalable_target option) () =
  ({
     application_auto_scaling_policies = application_auto_scaling_policies_;
     scalable_target = scalable_target_;
   }
    : managed_auto_scaling)

let make_managed_metric_alarm ?status_reason:(status_reason_ : string_ option)
    ?arn:(arn_ : string_ option) ~updated_at:(updated_at_ : timestamp)
    ~status:(status_ : managed_resource_status) () =
  ({ updated_at = updated_at_; status_reason = status_reason_; status = status_; arn = arn_ }
    : managed_metric_alarm)

let make_managed_log_group ?status_reason:(status_reason_ : string_ option)
    ?arn:(arn_ : string_ option) ~log_group_name:(log_group_name_ : string_)
    ~updated_at:(updated_at_ : timestamp) ~status:(status_ : managed_resource_status) () =
  ({
     log_group_name = log_group_name_;
     updated_at = updated_at_;
     status_reason = status_reason_;
     status = status_;
     arn = arn_;
   }
    : managed_log_group)

let make_ecs_managed_resources ?log_groups:(log_groups_ : managed_log_groups option)
    ?service_security_groups:(service_security_groups_ : managed_security_groups option)
    ?metric_alarms:(metric_alarms_ : managed_metric_alarms option)
    ?auto_scaling:(auto_scaling_ : managed_auto_scaling option)
    ?ingress_paths:(ingress_paths_ : managed_ingress_paths option) () =
  ({
     log_groups = log_groups_;
     service_security_groups = service_security_groups_;
     metric_alarms = metric_alarms_;
     auto_scaling = auto_scaling_;
     ingress_paths = ingress_paths_;
   }
    : ecs_managed_resources)

let make_service_revision ?monitoring:(monitoring_ : monitoring_configuration option)
    ?ecs_managed_resources:(ecs_managed_resources_ : ecs_managed_resources option)
    ?resolved_configuration:(resolved_configuration_ : resolved_configuration option)
    ?vpc_lattice_configurations:(vpc_lattice_configurations_ : vpc_lattice_configurations option)
    ?created_at:(created_at_ : timestamp option)
    ?fargate_ephemeral_storage:(fargate_ephemeral_storage_ : deployment_ephemeral_storage option)
    ?volume_configurations:(volume_configurations_ : service_volume_configurations option)
    ?service_connect_configuration:
      (service_connect_configuration_ : service_connect_configuration option)
    ?guard_duty_enabled:(guard_duty_enabled_ : boolean_ option)
    ?container_images:(container_images_ : container_images option)
    ?network_configuration:(network_configuration_ : network_configuration option)
    ?service_registries:(service_registries_ : service_registries option)
    ?load_balancers:(load_balancers_ : load_balancers option)
    ?platform_family:(platform_family_ : string_ option)
    ?platform_version:(platform_version_ : string_ option)
    ?launch_type:(launch_type_ : launch_type option)
    ?capacity_provider_strategy:(capacity_provider_strategy_ : capacity_provider_strategy option)
    ?task_definition:(task_definition_ : string_ option)
    ?cluster_arn:(cluster_arn_ : string_ option) ?service_arn:(service_arn_ : string_ option)
    ?service_revision_arn:(service_revision_arn_ : string_ option) () =
  ({
     monitoring = monitoring_;
     ecs_managed_resources = ecs_managed_resources_;
     resolved_configuration = resolved_configuration_;
     vpc_lattice_configurations = vpc_lattice_configurations_;
     created_at = created_at_;
     fargate_ephemeral_storage = fargate_ephemeral_storage_;
     volume_configurations = volume_configurations_;
     service_connect_configuration = service_connect_configuration_;
     guard_duty_enabled = guard_duty_enabled_;
     container_images = container_images_;
     network_configuration = network_configuration_;
     service_registries = service_registries_;
     load_balancers = load_balancers_;
     platform_family = platform_family_;
     platform_version = platform_version_;
     launch_type = launch_type_;
     capacity_provider_strategy = capacity_provider_strategy_;
     task_definition = task_definition_;
     cluster_arn = cluster_arn_;
     service_arn = service_arn_;
     service_revision_arn = service_revision_arn_;
   }
    : service_revision)

let make_service_deployment_brief ?status_reason:(status_reason_ : string_ option)
    ?status:(status_ : service_deployment_status option)
    ?target_service_revision_arn:(target_service_revision_arn_ : string_ option)
    ?finished_at:(finished_at_ : timestamp option) ?created_at:(created_at_ : timestamp option)
    ?started_at:(started_at_ : timestamp option) ?cluster_arn:(cluster_arn_ : string_ option)
    ?service_arn:(service_arn_ : string_ option)
    ?service_deployment_arn:(service_deployment_arn_ : string_ option) () =
  ({
     status_reason = status_reason_;
     status = status_;
     target_service_revision_arn = target_service_revision_arn_;
     finished_at = finished_at_;
     created_at = created_at_;
     started_at = started_at_;
     cluster_arn = cluster_arn_;
     service_arn = service_arn_;
     service_deployment_arn = service_deployment_arn_;
   }
    : service_deployment_brief)

let make_deployment_lifecycle_hook_detail
    ?timeout_action:(timeout_action_ : deployment_lifecycle_hook_action option)
    ?expires_at:(expires_at_ : timestamp option)
    ?status:(status_ : deployment_lifecycle_hook_status option)
    ?target_arn:(target_arn_ : string_ option)
    ?target_type:(target_type_ : deployment_lifecycle_hook_target_type option)
    ?hook_id:(hook_id_ : string_ option) () =
  ({
     timeout_action = timeout_action_;
     expires_at = expires_at_;
     status = status_;
     target_arn = target_arn_;
     target_type = target_type_;
     hook_id = hook_id_;
   }
    : deployment_lifecycle_hook_detail)

let make_rollback ?service_revision_arn:(service_revision_arn_ : string_ option)
    ?started_at:(started_at_ : timestamp option) ?reason:(reason_ : string_ option) () =
  ({ service_revision_arn = service_revision_arn_; started_at = started_at_; reason = reason_ }
    : rollback)

let make_service_deployment_circuit_breaker ?threshold:(threshold_ : integer option)
    ?failure_count:(failure_count_ : integer option)
    ?status:(status_ : service_deployment_rollback_monitors_status option) () =
  ({ threshold = threshold_; failure_count = failure_count_; status = status_ }
    : service_deployment_circuit_breaker)

let make_service_deployment_alarms
    ?triggered_alarm_names:(triggered_alarm_names_ : string_list option)
    ?alarm_names:(alarm_names_ : string_list option)
    ?status:(status_ : service_deployment_rollback_monitors_status option) () =
  ({ triggered_alarm_names = triggered_alarm_names_; alarm_names = alarm_names_; status = status_ }
    : service_deployment_alarms)

let make_service_deployment ?alarms:(alarms_ : service_deployment_alarms option)
    ?deployment_circuit_breaker:
      (deployment_circuit_breaker_ : service_deployment_circuit_breaker option)
    ?rollback:(rollback_ : rollback option)
    ?deployment_configuration:(deployment_configuration_ : deployment_configuration option)
    ?lifecycle_hook_details:(lifecycle_hook_details_ : deployment_lifecycle_hook_detail_list option)
    ?lifecycle_stage:(lifecycle_stage_ : service_deployment_lifecycle_stage option)
    ?status_reason:(status_reason_ : string_ option)
    ?status:(status_ : service_deployment_status option)
    ?target_service_revision:(target_service_revision_ : service_revision_summary option)
    ?source_service_revisions:(source_service_revisions_ : service_revisions_summary_list option)
    ?updated_at:(updated_at_ : timestamp option) ?stopped_at:(stopped_at_ : timestamp option)
    ?finished_at:(finished_at_ : timestamp option) ?started_at:(started_at_ : timestamp option)
    ?created_at:(created_at_ : timestamp option) ?cluster_arn:(cluster_arn_ : string_ option)
    ?service_arn:(service_arn_ : string_ option)
    ?service_deployment_arn:(service_deployment_arn_ : string_ option) () =
  ({
     alarms = alarms_;
     deployment_circuit_breaker = deployment_circuit_breaker_;
     rollback = rollback_;
     deployment_configuration = deployment_configuration_;
     lifecycle_hook_details = lifecycle_hook_details_;
     lifecycle_stage = lifecycle_stage_;
     status_reason = status_reason_;
     status = status_;
     target_service_revision = target_service_revision_;
     source_service_revisions = source_service_revisions_;
     updated_at = updated_at_;
     stopped_at = stopped_at_;
     finished_at = finished_at_;
     started_at = started_at_;
     created_at = created_at_;
     cluster_arn = cluster_arn_;
     service_arn = service_arn_;
     service_deployment_arn = service_deployment_arn_;
   }
    : service_deployment)

let make_run_task_response ?failures:(failures_ : failures option) ?tasks:(tasks_ : tasks option) ()
    =
  ({ failures = failures_; tasks = tasks_ } : run_task_response)

let make_run_task_request
    ?volume_configurations:(volume_configurations_ : task_volume_configurations option)
    ?client_token:(client_token_ : string_ option) ?tags:(tags_ : tags option)
    ?started_by:(started_by_ : string_ option) ?reference_id:(reference_id_ : string_ option)
    ?propagate_tags:(propagate_tags_ : propagate_tags option)
    ?platform_version:(platform_version_ : string_ option)
    ?placement_strategy:(placement_strategy_ : placement_strategies option)
    ?placement_constraints:(placement_constraints_ : placement_constraints option)
    ?overrides:(overrides_ : task_override option)
    ?network_configuration:(network_configuration_ : network_configuration option)
    ?launch_type:(launch_type_ : launch_type option) ?group:(group_ : string_ option)
    ?enable_execute_command:(enable_execute_command_ : boolean_ option)
    ?enable_ecs_managed_tags:(enable_ecs_managed_tags_ : boolean_ option)
    ?count:(count_ : boxed_integer option) ?cluster:(cluster_ : string_ option)
    ?capacity_provider_strategy:(capacity_provider_strategy_ : capacity_provider_strategy option)
    ~task_definition:(task_definition_ : string_) () =
  ({
     volume_configurations = volume_configurations_;
     client_token = client_token_;
     task_definition = task_definition_;
     tags = tags_;
     started_by = started_by_;
     reference_id = reference_id_;
     propagate_tags = propagate_tags_;
     platform_version = platform_version_;
     placement_strategy = placement_strategy_;
     placement_constraints = placement_constraints_;
     overrides = overrides_;
     network_configuration = network_configuration_;
     launch_type = launch_type_;
     group = group_;
     enable_execute_command = enable_execute_command_;
     enable_ecs_managed_tags = enable_ecs_managed_tags_;
     count = count_;
     cluster = cluster_;
     capacity_provider_strategy = capacity_provider_strategy_;
   }
    : run_task_request)

let make_register_task_definition_response ?tags:(tags_ : tags option)
    ?task_definition:(task_definition_ : task_definition option) () =
  ({ tags = tags_; task_definition = task_definition_ } : register_task_definition_response)

let make_register_task_definition_request
    ?enable_fault_injection:(enable_fault_injection_ : boxed_boolean option)
    ?runtime_platform:(runtime_platform_ : runtime_platform option)
    ?ephemeral_storage:(ephemeral_storage_ : ephemeral_storage option)
    ?inference_accelerators:(inference_accelerators_ : inference_accelerators option)
    ?proxy_configuration:(proxy_configuration_ : proxy_configuration option)
    ?ipc_mode:(ipc_mode_ : ipc_mode option) ?pid_mode:(pid_mode_ : pid_mode option)
    ?tags:(tags_ : tags option) ?memory:(memory_ : string_ option) ?cpu:(cpu_ : string_ option)
    ?requires_compatibilities:(requires_compatibilities_ : compatibility_list option)
    ?placement_constraints:(placement_constraints_ : task_definition_placement_constraints option)
    ?volumes:(volumes_ : volume_list option) ?network_mode:(network_mode_ : network_mode option)
    ?execution_role_arn:(execution_role_arn_ : string_ option)
    ?task_role_arn:(task_role_arn_ : string_ option)
    ~container_definitions:(container_definitions_ : container_definitions)
    ~family:(family_ : string_) () =
  ({
     enable_fault_injection = enable_fault_injection_;
     runtime_platform = runtime_platform_;
     ephemeral_storage = ephemeral_storage_;
     inference_accelerators = inference_accelerators_;
     proxy_configuration = proxy_configuration_;
     ipc_mode = ipc_mode_;
     pid_mode = pid_mode_;
     tags = tags_;
     memory = memory_;
     cpu = cpu_;
     requires_compatibilities = requires_compatibilities_;
     placement_constraints = placement_constraints_;
     volumes = volumes_;
     container_definitions = container_definitions_;
     network_mode = network_mode_;
     execution_role_arn = execution_role_arn_;
     task_role_arn = task_role_arn_;
     family = family_;
   }
    : register_task_definition_request)

let make_register_daemon_task_definition_response
    ?daemon_task_definition_arn:(daemon_task_definition_arn_ : string_ option) () =
  ({ daemon_task_definition_arn = daemon_task_definition_arn_ }
    : register_daemon_task_definition_response)

let make_daemon_linux_parameters ?tmpfs:(tmpfs_ : tmpfs_list option)
    ?init_process_enabled:(init_process_enabled_ : boxed_boolean option)
    ?devices:(devices_ : devices_list option)
    ?capabilities:(capabilities_ : kernel_capabilities option) () =
  ({
     tmpfs = tmpfs_;
     init_process_enabled = init_process_enabled_;
     devices = devices_;
     capabilities = capabilities_;
   }
    : daemon_linux_parameters)

let make_daemon_container_definition
    ?restart_policy:(restart_policy_ : container_restart_policy option)
    ?pseudo_terminal:(pseudo_terminal_ : boxed_boolean option)
    ?interactive:(interactive_ : boxed_boolean option)
    ?system_controls:(system_controls_ : system_controls option)
    ?stop_timeout:(stop_timeout_ : boxed_integer option)
    ?start_timeout:(start_timeout_ : boxed_integer option)
    ?depends_on:(depends_on_ : container_dependencies option)
    ?linux_parameters:(linux_parameters_ : daemon_linux_parameters option)
    ?ulimits:(ulimits_ : ulimit_list option) ?user:(user_ : string_ option)
    ?privileged:(privileged_ : boxed_boolean option)
    ?firelens_configuration:(firelens_configuration_ : firelens_configuration option)
    ?log_configuration:(log_configuration_ : log_configuration option)
    ?mount_points:(mount_points_ : mount_point_list option)
    ?readonly_root_filesystem:(readonly_root_filesystem_ : boxed_boolean option)
    ?secrets:(secrets_ : secret_list option)
    ?environment:(environment_ : environment_variables option)
    ?environment_files:(environment_files_ : environment_files option)
    ?working_directory:(working_directory_ : string_ option)
    ?command:(command_ : string_list option) ?entry_point:(entry_point_ : string_list option)
    ?essential:(essential_ : boxed_boolean option) ?cpu:(cpu_ : integer option)
    ?health_check:(health_check_ : health_check option)
    ?repository_credentials:(repository_credentials_ : repository_credentials option)
    ?memory_reservation:(memory_reservation_ : boxed_integer option)
    ?memory:(memory_ : boxed_integer option) ?name:(name_ : string_ option)
    ~image:(image_ : string_) () =
  ({
     restart_policy = restart_policy_;
     pseudo_terminal = pseudo_terminal_;
     interactive = interactive_;
     system_controls = system_controls_;
     stop_timeout = stop_timeout_;
     start_timeout = start_timeout_;
     depends_on = depends_on_;
     linux_parameters = linux_parameters_;
     ulimits = ulimits_;
     user = user_;
     privileged = privileged_;
     firelens_configuration = firelens_configuration_;
     log_configuration = log_configuration_;
     mount_points = mount_points_;
     readonly_root_filesystem = readonly_root_filesystem_;
     secrets = secrets_;
     environment = environment_;
     environment_files = environment_files_;
     working_directory = working_directory_;
     command = command_;
     entry_point = entry_point_;
     essential = essential_;
     cpu = cpu_;
     health_check = health_check_;
     repository_credentials = repository_credentials_;
     memory_reservation = memory_reservation_;
     memory = memory_;
     image = image_;
     name = name_;
   }
    : daemon_container_definition)

let make_daemon_volume ?host:(host_ : host_volume_properties option) ?name:(name_ : string_ option)
    () =
  ({ host = host_; name = name_ } : daemon_volume)

let make_register_daemon_task_definition_request ?ipc_mode:(ipc_mode_ : daemon_ipc_mode option)
    ?pid_mode:(pid_mode_ : daemon_pid_mode option) ?tags:(tags_ : tags option)
    ?volumes:(volumes_ : daemon_volume_list option) ?memory:(memory_ : string_ option)
    ?cpu:(cpu_ : string_ option) ?execution_role_arn:(execution_role_arn_ : string_ option)
    ?task_role_arn:(task_role_arn_ : string_ option)
    ~container_definitions:(container_definitions_ : daemon_container_definition_list)
    ~family:(family_ : string_) () =
  ({
     ipc_mode = ipc_mode_;
     pid_mode = pid_mode_;
     tags = tags_;
     volumes = volumes_;
     memory = memory_;
     cpu = cpu_;
     container_definitions = container_definitions_;
     execution_role_arn = execution_role_arn_;
     task_role_arn = task_role_arn_;
     family = family_;
   }
    : register_daemon_task_definition_request)

let make_register_container_instance_response
    ?container_instance:(container_instance_ : container_instance option) () =
  ({ container_instance = container_instance_ } : register_container_instance_response)

let make_platform_device ~type_:(type__ : platform_device_type) ~id:(id_ : string_) () =
  ({ type_ = type__; id = id_ } : platform_device)

let make_register_container_instance_request ?tags:(tags_ : tags option)
    ?platform_devices:(platform_devices_ : platform_devices option)
    ?attributes:(attributes_ : attributes option)
    ?container_instance_arn:(container_instance_arn_ : string_ option)
    ?version_info:(version_info_ : version_info option)
    ?total_resources:(total_resources_ : resources option)
    ?instance_identity_document_signature:(instance_identity_document_signature_ : string_ option)
    ?instance_identity_document:(instance_identity_document_ : string_ option)
    ?cluster:(cluster_ : string_ option) () =
  ({
     tags = tags_;
     platform_devices = platform_devices_;
     attributes = attributes_;
     container_instance_arn = container_instance_arn_;
     version_info = version_info_;
     total_resources = total_resources_;
     instance_identity_document_signature = instance_identity_document_signature_;
     instance_identity_document = instance_identity_document_;
     cluster = cluster_;
   }
    : register_container_instance_request)

let make_put_cluster_capacity_providers_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : put_cluster_capacity_providers_response)

let make_put_cluster_capacity_providers_request
    ~default_capacity_provider_strategy:
      (default_capacity_provider_strategy_ : capacity_provider_strategy)
    ~capacity_providers:(capacity_providers_ : string_list) ~cluster:(cluster_ : string_) () =
  ({
     default_capacity_provider_strategy = default_capacity_provider_strategy_;
     capacity_providers = capacity_providers_;
     cluster = cluster_;
   }
    : put_cluster_capacity_providers_request)

let make_put_attributes_response ?attributes:(attributes_ : attributes option) () =
  ({ attributes = attributes_ } : put_attributes_response)

let make_put_attributes_request ?cluster:(cluster_ : string_ option)
    ~attributes:(attributes_ : attributes) () =
  ({ attributes = attributes_; cluster = cluster_ } : put_attributes_request)

let make_put_account_setting_response ?setting:(setting_ : setting option) () =
  ({ setting = setting_ } : put_account_setting_response)

let make_put_account_setting_request ?principal_arn:(principal_arn_ : string_ option)
    ~value:(value_ : string_) ~name:(name_ : setting_name) () =
  ({ principal_arn = principal_arn_; value = value_; name = name_ } : put_account_setting_request)

let make_put_account_setting_default_response ?setting:(setting_ : setting option) () =
  ({ setting = setting_ } : put_account_setting_default_response)

let make_put_account_setting_default_request ~value:(value_ : string_) ~name:(name_ : setting_name)
    () =
  ({ value = value_; name = name_ } : put_account_setting_default_request)

let make_list_tasks_response ?next_token:(next_token_ : string_ option)
    ?task_arns:(task_arns_ : string_list option) () =
  ({ next_token = next_token_; task_arns = task_arns_ } : list_tasks_response)

let make_list_tasks_request ?daemon_name:(daemon_name_ : string_ option)
    ?launch_type:(launch_type_ : launch_type option)
    ?desired_status:(desired_status_ : desired_status option)
    ?service_name:(service_name_ : string_ option) ?started_by:(started_by_ : string_ option)
    ?max_results:(max_results_ : boxed_integer option) ?next_token:(next_token_ : string_ option)
    ?family:(family_ : string_ option) ?container_instance:(container_instance_ : string_ option)
    ?cluster:(cluster_ : string_ option) () =
  ({
     daemon_name = daemon_name_;
     launch_type = launch_type_;
     desired_status = desired_status_;
     service_name = service_name_;
     started_by = started_by_;
     max_results = max_results_;
     next_token = next_token_;
     family = family_;
     container_instance = container_instance_;
     cluster = cluster_;
   }
    : list_tasks_request)

let make_list_task_definitions_response ?next_token:(next_token_ : string_ option)
    ?task_definition_arns:(task_definition_arns_ : string_list option) () =
  ({ next_token = next_token_; task_definition_arns = task_definition_arns_ }
    : list_task_definitions_response)

let make_list_task_definitions_request ?max_results:(max_results_ : boxed_integer option)
    ?next_token:(next_token_ : string_ option) ?sort:(sort_ : sort_order option)
    ?status:(status_ : task_definition_status option)
    ?family_prefix:(family_prefix_ : string_ option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     sort = sort_;
     status = status_;
     family_prefix = family_prefix_;
   }
    : list_task_definitions_request)

let make_list_task_definition_families_response ?next_token:(next_token_ : string_ option)
    ?families:(families_ : string_list option) () =
  ({ next_token = next_token_; families = families_ } : list_task_definition_families_response)

let make_list_task_definition_families_request ?max_results:(max_results_ : boxed_integer option)
    ?next_token:(next_token_ : string_ option)
    ?status:(status_ : task_definition_family_status option)
    ?family_prefix:(family_prefix_ : string_ option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     status = status_;
     family_prefix = family_prefix_;
   }
    : list_task_definition_families_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tags option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_arn:(resource_arn_ : string_) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_request)

let make_list_services_response ?next_token:(next_token_ : string_ option)
    ?service_arns:(service_arns_ : string_list option) () =
  ({ next_token = next_token_; service_arns = service_arns_ } : list_services_response)

let make_list_services_request
    ?resource_management_type:(resource_management_type_ : resource_management_type option)
    ?scheduling_strategy:(scheduling_strategy_ : scheduling_strategy option)
    ?launch_type:(launch_type_ : launch_type option)
    ?max_results:(max_results_ : boxed_integer option) ?next_token:(next_token_ : string_ option)
    ?cluster:(cluster_ : string_ option) () =
  ({
     resource_management_type = resource_management_type_;
     scheduling_strategy = scheduling_strategy_;
     launch_type = launch_type_;
     max_results = max_results_;
     next_token = next_token_;
     cluster = cluster_;
   }
    : list_services_request)

let make_list_services_by_namespace_response ?next_token:(next_token_ : string_ option)
    ?service_arns:(service_arns_ : string_list option) () =
  ({ next_token = next_token_; service_arns = service_arns_ } : list_services_by_namespace_response)

let make_list_services_by_namespace_request ?max_results:(max_results_ : boxed_integer option)
    ?next_token:(next_token_ : string_ option) ~namespace:(namespace_ : string_) () =
  ({ max_results = max_results_; next_token = next_token_; namespace = namespace_ }
    : list_services_by_namespace_request)

let make_list_service_deployments_response ?next_token:(next_token_ : string_ option)
    ?service_deployments:(service_deployments_ : service_deployments_brief option) () =
  ({ next_token = next_token_; service_deployments = service_deployments_ }
    : list_service_deployments_response)

let make_created_at ?after:(after_ : timestamp option) ?before:(before_ : timestamp option) () =
  ({ after = after_; before = before_ } : created_at)

let make_list_service_deployments_request ?max_results:(max_results_ : boxed_integer option)
    ?next_token:(next_token_ : string_ option) ?created_at:(created_at_ : created_at option)
    ?status:(status_ : service_deployment_status_list option) ?cluster:(cluster_ : string_ option)
    ~service:(service_ : string_) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     created_at = created_at_;
     status = status_;
     cluster = cluster_;
     service = service_;
   }
    : list_service_deployments_request)

let make_daemon_summary ?updated_at:(updated_at_ : timestamp option)
    ?created_at:(created_at_ : timestamp option) ?status:(status_ : daemon_status option)
    ?daemon_arn:(daemon_arn_ : string_ option) () =
  ({
     updated_at = updated_at_;
     created_at = created_at_;
     status = status_;
     daemon_arn = daemon_arn_;
   }
    : daemon_summary)

let make_list_daemons_response ?next_token:(next_token_ : string_ option)
    ?daemon_summaries_list:(daemon_summaries_list_ : daemon_summaries_list option) () =
  ({ next_token = next_token_; daemon_summaries_list = daemon_summaries_list_ }
    : list_daemons_response)

let make_list_daemons_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : boxed_integer option)
    ?capacity_provider_arns:(capacity_provider_arns_ : string_list option)
    ?cluster_arn:(cluster_arn_ : string_ option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     capacity_provider_arns = capacity_provider_arns_;
     cluster_arn = cluster_arn_;
   }
    : list_daemons_request)

let make_daemon_task_definition_summary ?status:(status_ : daemon_task_definition_status option)
    ?delete_requested_at:(delete_requested_at_ : timestamp option)
    ?registered_by:(registered_by_ : string_ option)
    ?registered_at:(registered_at_ : timestamp option) ?arn:(arn_ : string_ option) () =
  ({
     status = status_;
     delete_requested_at = delete_requested_at_;
     registered_by = registered_by_;
     registered_at = registered_at_;
     arn = arn_;
   }
    : daemon_task_definition_summary)

let make_list_daemon_task_definitions_response ?next_token:(next_token_ : string_ option)
    ?daemon_task_definitions:(daemon_task_definitions_ : daemon_task_definition_summaries option) ()
    =
  ({ next_token = next_token_; daemon_task_definitions = daemon_task_definitions_ }
    : list_daemon_task_definitions_response)

let make_list_daemon_task_definitions_request ?max_results:(max_results_ : boxed_integer option)
    ?next_token:(next_token_ : string_ option) ?sort:(sort_ : sort_order option)
    ?status:(status_ : daemon_task_definition_status_filter option)
    ?revision:(revision_ : daemon_task_definition_revision_filter option)
    ?family:(family_ : string_ option) ?family_prefix:(family_prefix_ : string_ option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     sort = sort_;
     status = status_;
     revision = revision_;
     family = family_;
     family_prefix = family_prefix_;
   }
    : list_daemon_task_definitions_request)

let make_daemon_deployment_summary ?finished_at:(finished_at_ : timestamp option)
    ?stopped_at:(stopped_at_ : timestamp option) ?started_at:(started_at_ : timestamp option)
    ?created_at:(created_at_ : timestamp option)
    ?target_daemon_revision_arn:(target_daemon_revision_arn_ : string_ option)
    ?status_reason:(status_reason_ : string_ option)
    ?status:(status_ : daemon_deployment_status option) ?cluster_arn:(cluster_arn_ : string_ option)
    ?daemon_arn:(daemon_arn_ : string_ option)
    ?daemon_deployment_arn:(daemon_deployment_arn_ : string_ option) () =
  ({
     finished_at = finished_at_;
     stopped_at = stopped_at_;
     started_at = started_at_;
     created_at = created_at_;
     target_daemon_revision_arn = target_daemon_revision_arn_;
     status_reason = status_reason_;
     status = status_;
     cluster_arn = cluster_arn_;
     daemon_arn = daemon_arn_;
     daemon_deployment_arn = daemon_deployment_arn_;
   }
    : daemon_deployment_summary)

let make_list_daemon_deployments_response
    ?daemon_deployments:(daemon_deployments_ : daemon_deployment_summary_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ daemon_deployments = daemon_deployments_; next_token = next_token_ }
    : list_daemon_deployments_response)

let make_list_daemon_deployments_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : boxed_integer option) ?created_at:(created_at_ : created_at option)
    ?status:(status_ : daemon_deployment_status_list option) ~daemon_arn:(daemon_arn_ : string_) ()
    =
  ({
     next_token = next_token_;
     max_results = max_results_;
     created_at = created_at_;
     status = status_;
     daemon_arn = daemon_arn_;
   }
    : list_daemon_deployments_request)

let make_list_container_instances_response ?next_token:(next_token_ : string_ option)
    ?container_instance_arns:(container_instance_arns_ : string_list option) () =
  ({ next_token = next_token_; container_instance_arns = container_instance_arns_ }
    : list_container_instances_response)

let make_list_container_instances_request ?status:(status_ : container_instance_status option)
    ?max_results:(max_results_ : boxed_integer option) ?next_token:(next_token_ : string_ option)
    ?filter:(filter_ : string_ option) ?cluster:(cluster_ : string_ option) () =
  ({
     status = status_;
     max_results = max_results_;
     next_token = next_token_;
     filter = filter_;
     cluster = cluster_;
   }
    : list_container_instances_request)

let make_list_clusters_response ?next_token:(next_token_ : string_ option)
    ?cluster_arns:(cluster_arns_ : string_list option) () =
  ({ next_token = next_token_; cluster_arns = cluster_arns_ } : list_clusters_response)

let make_list_clusters_request ?max_results:(max_results_ : boxed_integer option)
    ?next_token:(next_token_ : string_ option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_clusters_request)

let make_list_attributes_response ?next_token:(next_token_ : string_ option)
    ?attributes:(attributes_ : attributes option) () =
  ({ next_token = next_token_; attributes = attributes_ } : list_attributes_response)

let make_list_attributes_request ?max_results:(max_results_ : boxed_integer option)
    ?next_token:(next_token_ : string_ option) ?attribute_value:(attribute_value_ : string_ option)
    ?attribute_name:(attribute_name_ : string_ option) ?cluster:(cluster_ : string_ option)
    ~target_type:(target_type_ : target_type) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     attribute_value = attribute_value_;
     attribute_name = attribute_name_;
     target_type = target_type_;
     cluster = cluster_;
   }
    : list_attributes_request)

let make_list_account_settings_response ?next_token:(next_token_ : string_ option)
    ?settings:(settings_ : settings option) () =
  ({ next_token = next_token_; settings = settings_ } : list_account_settings_response)

let make_list_account_settings_request ?max_results:(max_results_ : integer option)
    ?next_token:(next_token_ : string_ option)
    ?effective_settings:(effective_settings_ : boolean_ option)
    ?principal_arn:(principal_arn_ : string_ option) ?value:(value_ : string_ option)
    ?name:(name_ : setting_name option) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     effective_settings = effective_settings_;
     principal_arn = principal_arn_;
     value = value_;
     name = name_;
   }
    : list_account_settings_request)

let make_get_task_protection_response ?failures:(failures_ : failures option)
    ?protected_tasks:(protected_tasks_ : protected_tasks option) () =
  ({ failures = failures_; protected_tasks = protected_tasks_ } : get_task_protection_response)

let make_get_task_protection_request ?tasks:(tasks_ : string_list option)
    ~cluster:(cluster_ : string_) () =
  ({ tasks = tasks_; cluster = cluster_ } : get_task_protection_request)

let make_execute_command_response ?task_arn:(task_arn_ : string_ option)
    ?session:(session_ : session option) ?interactive:(interactive_ : boolean_ option)
    ?container_name:(container_name_ : string_ option)
    ?container_arn:(container_arn_ : string_ option) ?cluster_arn:(cluster_arn_ : string_ option) ()
    =
  ({
     task_arn = task_arn_;
     session = session_;
     interactive = interactive_;
     container_name = container_name_;
     container_arn = container_arn_;
     cluster_arn = cluster_arn_;
   }
    : execute_command_response)

let make_execute_command_request ?container:(container_ : string_ option)
    ?cluster:(cluster_ : string_ option) ~task:(task_ : string_)
    ~interactive:(interactive_ : boolean_) ~command:(command_ : string_) () =
  ({
     task = task_;
     interactive = interactive_;
     command = command_;
     container = container_;
     cluster = cluster_;
   }
    : execute_command_request)

let make_ecs_express_gateway_service ?updated_at:(updated_at_ : timestamp option)
    ?created_at:(created_at_ : timestamp option) ?tags:(tags_ : tags option)
    ?active_configurations:(active_configurations_ : express_gateway_service_configurations option)
    ?current_deployment:(current_deployment_ : string_ option)
    ?status:(status_ : express_gateway_service_status option)
    ?infrastructure_role_arn:(infrastructure_role_arn_ : string_ option)
    ?service_arn:(service_arn_ : string_ option) ?service_name:(service_name_ : string_ option)
    ?cluster:(cluster_ : string_ option) () =
  ({
     updated_at = updated_at_;
     created_at = created_at_;
     tags = tags_;
     active_configurations = active_configurations_;
     current_deployment = current_deployment_;
     status = status_;
     infrastructure_role_arn = infrastructure_role_arn_;
     service_arn = service_arn_;
     service_name = service_name_;
     cluster = cluster_;
   }
    : ecs_express_gateway_service)

let make_discover_poll_endpoint_response
    ?service_connect_endpoint:(service_connect_endpoint_ : string_ option)
    ?telemetry_endpoint:(telemetry_endpoint_ : string_ option)
    ?endpoint:(endpoint_ : string_ option) () =
  ({
     service_connect_endpoint = service_connect_endpoint_;
     telemetry_endpoint = telemetry_endpoint_;
     endpoint = endpoint_;
   }
    : discover_poll_endpoint_response)

let make_discover_poll_endpoint_request ?cluster:(cluster_ : string_ option)
    ?container_instance:(container_instance_ : string_ option) () =
  ({ cluster = cluster_; container_instance = container_instance_ }
    : discover_poll_endpoint_request)

let make_describe_tasks_response ?failures:(failures_ : failures option)
    ?tasks:(tasks_ : tasks option) () =
  ({ failures = failures_; tasks = tasks_ } : describe_tasks_response)

let make_describe_tasks_request ?include_:(include__ : task_field_list option)
    ?cluster:(cluster_ : string_ option) ~tasks:(tasks_ : string_list) () =
  ({ include_ = include__; tasks = tasks_; cluster = cluster_ } : describe_tasks_request)

let make_describe_task_sets_response ?failures:(failures_ : failures option)
    ?task_sets:(task_sets_ : task_sets option) () =
  ({ failures = failures_; task_sets = task_sets_ } : describe_task_sets_response)

let make_describe_task_sets_request ?include_:(include__ : task_set_field_list option)
    ?task_sets:(task_sets_ : string_list option) ~service:(service_ : string_)
    ~cluster:(cluster_ : string_) () =
  ({ include_ = include__; task_sets = task_sets_; service = service_; cluster = cluster_ }
    : describe_task_sets_request)

let make_describe_task_definition_response ?tags:(tags_ : tags option)
    ?task_definition:(task_definition_ : task_definition option) () =
  ({ tags = tags_; task_definition = task_definition_ } : describe_task_definition_response)

let make_describe_task_definition_request ?include_:(include__ : task_definition_field_list option)
    ~task_definition:(task_definition_ : string_) () =
  ({ include_ = include__; task_definition = task_definition_ } : describe_task_definition_request)

let make_describe_services_response ?failures:(failures_ : failures option)
    ?services:(services_ : services option) () =
  ({ failures = failures_; services = services_ } : describe_services_response)

let make_describe_services_request ?include_:(include__ : service_field_list option)
    ?cluster:(cluster_ : string_ option) ~services:(services_ : string_list) () =
  ({ include_ = include__; services = services_; cluster = cluster_ } : describe_services_request)

let make_describe_service_revisions_response ?failures:(failures_ : failures option)
    ?service_revisions:(service_revisions_ : service_revisions option) () =
  ({ failures = failures_; service_revisions = service_revisions_ }
    : describe_service_revisions_response)

let make_describe_service_revisions_request
    ~service_revision_arns:(service_revision_arns_ : string_list) () =
  ({ service_revision_arns = service_revision_arns_ } : describe_service_revisions_request)

let make_describe_service_deployments_response ?failures:(failures_ : failures option)
    ?service_deployments:(service_deployments_ : service_deployments option) () =
  ({ failures = failures_; service_deployments = service_deployments_ }
    : describe_service_deployments_response)

let make_describe_service_deployments_request
    ~service_deployment_arns:(service_deployment_arns_ : string_list) () =
  ({ service_deployment_arns = service_deployment_arns_ } : describe_service_deployments_request)

let make_describe_express_gateway_service_response
    ?service:(service_ : ecs_express_gateway_service option) () =
  ({ service = service_ } : describe_express_gateway_service_response)

let make_describe_express_gateway_service_request
    ?include_:(include__ : express_gateway_service_include_list option)
    ~service_arn:(service_arn_ : string_) () =
  ({ include_ = include__; service_arn = service_arn_ } : describe_express_gateway_service_request)

let make_daemon_task_definition ?ipc_mode:(ipc_mode_ : daemon_ipc_mode option)
    ?pid_mode:(pid_mode_ : daemon_pid_mode option) ?registered_by:(registered_by_ : string_ option)
    ?delete_requested_at:(delete_requested_at_ : timestamp option)
    ?registered_at:(registered_at_ : timestamp option)
    ?status:(status_ : daemon_task_definition_status option) ?memory:(memory_ : string_ option)
    ?cpu:(cpu_ : string_ option) ?volumes:(volumes_ : daemon_volume_list option)
    ?container_definitions:(container_definitions_ : daemon_container_definition_list option)
    ?execution_role_arn:(execution_role_arn_ : string_ option)
    ?task_role_arn:(task_role_arn_ : string_ option) ?revision:(revision_ : integer option)
    ?family:(family_ : string_ option)
    ?daemon_task_definition_arn:(daemon_task_definition_arn_ : string_ option) () =
  ({
     ipc_mode = ipc_mode_;
     pid_mode = pid_mode_;
     registered_by = registered_by_;
     delete_requested_at = delete_requested_at_;
     registered_at = registered_at_;
     status = status_;
     memory = memory_;
     cpu = cpu_;
     volumes = volumes_;
     container_definitions = container_definitions_;
     execution_role_arn = execution_role_arn_;
     task_role_arn = task_role_arn_;
     revision = revision_;
     family = family_;
     daemon_task_definition_arn = daemon_task_definition_arn_;
   }
    : daemon_task_definition)

let make_describe_daemon_task_definition_response
    ?daemon_task_definition:(daemon_task_definition_ : daemon_task_definition option) () =
  ({ daemon_task_definition = daemon_task_definition_ } : describe_daemon_task_definition_response)

let make_describe_daemon_task_definition_request
    ~daemon_task_definition:(daemon_task_definition_ : string_) () =
  ({ daemon_task_definition = daemon_task_definition_ } : describe_daemon_task_definition_request)

let make_daemon_container_image ?image:(image_ : string_ option)
    ?image_digest:(image_digest_ : string_ option)
    ?container_name:(container_name_ : string_ option) () =
  ({ image = image_; image_digest = image_digest_; container_name = container_name_ }
    : daemon_container_image)

let make_daemon_revision ?enable_execute_command:(enable_execute_command_ : boxed_boolean option)
    ?enable_ecs_managed_tags:(enable_ecs_managed_tags_ : boxed_boolean option)
    ?propagate_tags:(propagate_tags_ : daemon_propagate_tags option)
    ?container_images:(container_images_ : daemon_container_images option)
    ?created_at:(created_at_ : timestamp option)
    ?daemon_task_definition_arn:(daemon_task_definition_arn_ : string_ option)
    ?daemon_arn:(daemon_arn_ : string_ option) ?cluster_arn:(cluster_arn_ : string_ option)
    ?daemon_revision_arn:(daemon_revision_arn_ : string_ option) () =
  ({
     enable_execute_command = enable_execute_command_;
     enable_ecs_managed_tags = enable_ecs_managed_tags_;
     propagate_tags = propagate_tags_;
     container_images = container_images_;
     created_at = created_at_;
     daemon_task_definition_arn = daemon_task_definition_arn_;
     daemon_arn = daemon_arn_;
     cluster_arn = cluster_arn_;
     daemon_revision_arn = daemon_revision_arn_;
   }
    : daemon_revision)

let make_describe_daemon_revisions_response ?failures:(failures_ : failures option)
    ?daemon_revisions:(daemon_revisions_ : daemon_revisions option) () =
  ({ failures = failures_; daemon_revisions = daemon_revisions_ }
    : describe_daemon_revisions_response)

let make_describe_daemon_revisions_request
    ~daemon_revision_arns:(daemon_revision_arns_ : string_list) () =
  ({ daemon_revision_arns = daemon_revision_arns_ } : describe_daemon_revisions_request)

let make_daemon_capacity_provider ?running_count:(running_count_ : integer option)
    ?arn:(arn_ : string_ option) () =
  ({ running_count = running_count_; arn = arn_ } : daemon_capacity_provider)

let make_daemon_revision_detail ?total_running_count:(total_running_count_ : integer option)
    ?capacity_providers:(capacity_providers_ : daemon_capacity_provider_list option)
    ?arn:(arn_ : string_ option) () =
  ({
     total_running_count = total_running_count_;
     capacity_providers = capacity_providers_;
     arn = arn_;
   }
    : daemon_revision_detail)

let make_daemon_detail ?updated_at:(updated_at_ : timestamp option)
    ?created_at:(created_at_ : timestamp option) ?deployment_arn:(deployment_arn_ : string_ option)
    ?current_revisions:(current_revisions_ : daemon_revision_detail_list option)
    ?status:(status_ : daemon_status option) ?cluster_arn:(cluster_arn_ : string_ option)
    ?daemon_arn:(daemon_arn_ : string_ option) () =
  ({
     updated_at = updated_at_;
     created_at = created_at_;
     deployment_arn = deployment_arn_;
     current_revisions = current_revisions_;
     status = status_;
     cluster_arn = cluster_arn_;
     daemon_arn = daemon_arn_;
   }
    : daemon_detail)

let make_describe_daemon_response ?daemon:(daemon_ : daemon_detail option) () =
  ({ daemon = daemon_ } : describe_daemon_response)

let make_describe_daemon_request ~daemon_arn:(daemon_arn_ : string_) () =
  ({ daemon_arn = daemon_arn_ } : describe_daemon_request)

let make_daemon_deployment_capacity_provider
    ?draining_instance_count:(draining_instance_count_ : boxed_integer option)
    ?running_instance_count:(running_instance_count_ : boxed_integer option)
    ?arn:(arn_ : string_ option) () =
  ({
     draining_instance_count = draining_instance_count_;
     running_instance_count = running_instance_count_;
     arn = arn_;
   }
    : daemon_deployment_capacity_provider)

let make_daemon_deployment_revision_detail
    ?total_draining_instance_count:(total_draining_instance_count_ : boxed_integer option)
    ?total_running_instance_count:(total_running_instance_count_ : boxed_integer option)
    ?capacity_providers:(capacity_providers_ : daemon_deployment_capacity_provider_list option)
    ?arn:(arn_ : string_ option) () =
  ({
     total_draining_instance_count = total_draining_instance_count_;
     total_running_instance_count = total_running_instance_count_;
     capacity_providers = capacity_providers_;
     arn = arn_;
   }
    : daemon_deployment_revision_detail)

let make_daemon_circuit_breaker ?threshold:(threshold_ : integer option)
    ?status:(status_ : daemon_deployment_rollback_monitors_status option)
    ?failure_count:(failure_count_ : integer option) () =
  ({ threshold = threshold_; status = status_; failure_count = failure_count_ }
    : daemon_circuit_breaker)

let make_daemon_deployment_alarms
    ?triggered_alarm_names:(triggered_alarm_names_ : string_list option)
    ?alarm_names:(alarm_names_ : string_list option)
    ?status:(status_ : daemon_deployment_rollback_monitors_status option) () =
  ({ triggered_alarm_names = triggered_alarm_names_; alarm_names = alarm_names_; status = status_ }
    : daemon_deployment_alarms)

let make_daemon_rollback
    ?rollback_capacity_providers:(rollback_capacity_providers_ : string_list option)
    ?rollback_target_daemon_revision_arn:(rollback_target_daemon_revision_arn_ : string_ option)
    ?started_at:(started_at_ : timestamp option) ?reason:(reason_ : string_ option) () =
  ({
     rollback_capacity_providers = rollback_capacity_providers_;
     rollback_target_daemon_revision_arn = rollback_target_daemon_revision_arn_;
     started_at = started_at_;
     reason = reason_;
   }
    : daemon_rollback)

let make_daemon_deployment ?finished_at:(finished_at_ : timestamp option)
    ?stopped_at:(stopped_at_ : timestamp option) ?started_at:(started_at_ : timestamp option)
    ?created_at:(created_at_ : timestamp option)
    ?deployment_configuration:(deployment_configuration_ : daemon_deployment_configuration option)
    ?rollback:(rollback_ : daemon_rollback option)
    ?alarms:(alarms_ : daemon_deployment_alarms option)
    ?circuit_breaker:(circuit_breaker_ : daemon_circuit_breaker option)
    ?source_daemon_revisions:
      (source_daemon_revisions_ : daemon_deployment_revision_detail_list option)
    ?target_daemon_revision:(target_daemon_revision_ : daemon_deployment_revision_detail option)
    ?status_reason:(status_reason_ : string_ option)
    ?status:(status_ : daemon_deployment_status option) ?cluster_arn:(cluster_arn_ : string_ option)
    ?daemon_deployment_arn:(daemon_deployment_arn_ : string_ option) () =
  ({
     finished_at = finished_at_;
     stopped_at = stopped_at_;
     started_at = started_at_;
     created_at = created_at_;
     deployment_configuration = deployment_configuration_;
     rollback = rollback_;
     alarms = alarms_;
     circuit_breaker = circuit_breaker_;
     source_daemon_revisions = source_daemon_revisions_;
     target_daemon_revision = target_daemon_revision_;
     status_reason = status_reason_;
     status = status_;
     cluster_arn = cluster_arn_;
     daemon_deployment_arn = daemon_deployment_arn_;
   }
    : daemon_deployment)

let make_describe_daemon_deployments_response
    ?daemon_deployments:(daemon_deployments_ : daemon_deployment_list option)
    ?failures:(failures_ : failures option) () =
  ({ daemon_deployments = daemon_deployments_; failures = failures_ }
    : describe_daemon_deployments_response)

let make_describe_daemon_deployments_request
    ~daemon_deployment_arns:(daemon_deployment_arns_ : string_list) () =
  ({ daemon_deployment_arns = daemon_deployment_arns_ } : describe_daemon_deployments_request)

let make_describe_container_instances_response ?failures:(failures_ : failures option)
    ?container_instances:(container_instances_ : container_instances option) () =
  ({ failures = failures_; container_instances = container_instances_ }
    : describe_container_instances_response)

let make_describe_container_instances_request
    ?include_:(include__ : container_instance_field_list option)
    ?cluster:(cluster_ : string_ option) ~container_instances:(container_instances_ : string_list)
    () =
  ({ include_ = include__; container_instances = container_instances_; cluster = cluster_ }
    : describe_container_instances_request)

let make_describe_clusters_response ?failures:(failures_ : failures option)
    ?clusters:(clusters_ : clusters option) () =
  ({ failures = failures_; clusters = clusters_ } : describe_clusters_response)

let make_describe_clusters_request ?include_:(include__ : cluster_field_list option)
    ?clusters:(clusters_ : string_list option) () =
  ({ include_ = include__; clusters = clusters_ } : describe_clusters_request)

let make_describe_capacity_providers_response ?next_token:(next_token_ : string_ option)
    ?failures:(failures_ : failures option)
    ?capacity_providers:(capacity_providers_ : capacity_providers option) () =
  ({ next_token = next_token_; failures = failures_; capacity_providers = capacity_providers_ }
    : describe_capacity_providers_response)

let make_describe_capacity_providers_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : boxed_integer option)
    ?include_:(include__ : capacity_provider_field_list option) ?cluster:(cluster_ : string_ option)
    ?capacity_providers:(capacity_providers_ : string_list option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     include_ = include__;
     cluster = cluster_;
     capacity_providers = capacity_providers_;
   }
    : describe_capacity_providers_request)

let make_deregister_task_definition_response
    ?task_definition:(task_definition_ : task_definition option) () =
  ({ task_definition = task_definition_ } : deregister_task_definition_response)

let make_deregister_task_definition_request ~task_definition:(task_definition_ : string_) () =
  ({ task_definition = task_definition_ } : deregister_task_definition_request)

let make_deregister_container_instance_response
    ?container_instance:(container_instance_ : container_instance option) () =
  ({ container_instance = container_instance_ } : deregister_container_instance_response)

let make_deregister_container_instance_request ?force:(force_ : boxed_boolean option)
    ?cluster:(cluster_ : string_ option) ~container_instance:(container_instance_ : string_) () =
  ({ force = force_; container_instance = container_instance_; cluster = cluster_ }
    : deregister_container_instance_request)

let make_delete_task_set_response ?task_set:(task_set_ : task_set option) () =
  ({ task_set = task_set_ } : delete_task_set_response)

let make_delete_task_set_request ?force:(force_ : boxed_boolean option)
    ~task_set:(task_set_ : string_) ~service:(service_ : string_) ~cluster:(cluster_ : string_) () =
  ({ force = force_; task_set = task_set_; service = service_; cluster = cluster_ }
    : delete_task_set_request)

let make_delete_task_definitions_response ?failures:(failures_ : failures option)
    ?task_definitions:(task_definitions_ : task_definition_list option) () =
  ({ failures = failures_; task_definitions = task_definitions_ }
    : delete_task_definitions_response)

let make_delete_task_definitions_request ~task_definitions:(task_definitions_ : string_list) () =
  ({ task_definitions = task_definitions_ } : delete_task_definitions_request)

let make_delete_service_response ?service:(service_ : service option) () =
  ({ service = service_ } : delete_service_response)

let make_delete_service_request ?force:(force_ : boxed_boolean option)
    ?cluster:(cluster_ : string_ option) ~service:(service_ : string_) () =
  ({ force = force_; service = service_; cluster = cluster_ } : delete_service_request)

let make_delete_express_gateway_service_response
    ?service:(service_ : ecs_express_gateway_service option) () =
  ({ service = service_ } : delete_express_gateway_service_response)

let make_delete_express_gateway_service_request ~service_arn:(service_arn_ : string_) () =
  ({ service_arn = service_arn_ } : delete_express_gateway_service_request)

let make_delete_daemon_task_definition_response
    ?daemon_task_definition_arn:(daemon_task_definition_arn_ : string_ option) () =
  ({ daemon_task_definition_arn = daemon_task_definition_arn_ }
    : delete_daemon_task_definition_response)

let make_delete_daemon_task_definition_request
    ~daemon_task_definition:(daemon_task_definition_ : string_) () =
  ({ daemon_task_definition = daemon_task_definition_ } : delete_daemon_task_definition_request)

let make_delete_daemon_response ?deployment_arn:(deployment_arn_ : string_ option)
    ?updated_at:(updated_at_ : timestamp option) ?created_at:(created_at_ : timestamp option)
    ?status:(status_ : daemon_status option) ?daemon_arn:(daemon_arn_ : string_ option) () =
  ({
     deployment_arn = deployment_arn_;
     updated_at = updated_at_;
     created_at = created_at_;
     status = status_;
     daemon_arn = daemon_arn_;
   }
    : delete_daemon_response)

let make_delete_daemon_request ~daemon_arn:(daemon_arn_ : string_) () =
  ({ daemon_arn = daemon_arn_ } : delete_daemon_request)

let make_delete_cluster_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : delete_cluster_response)

let make_delete_cluster_request ~cluster:(cluster_ : string_) () =
  ({ cluster = cluster_ } : delete_cluster_request)

let make_delete_capacity_provider_response
    ?capacity_provider:(capacity_provider_ : capacity_provider option) () =
  ({ capacity_provider = capacity_provider_ } : delete_capacity_provider_response)

let make_delete_capacity_provider_request ?cluster:(cluster_ : string_ option)
    ~capacity_provider:(capacity_provider_ : string_) () =
  ({ cluster = cluster_; capacity_provider = capacity_provider_ }
    : delete_capacity_provider_request)

let make_delete_attributes_response ?attributes:(attributes_ : attributes option) () =
  ({ attributes = attributes_ } : delete_attributes_response)

let make_delete_attributes_request ?cluster:(cluster_ : string_ option)
    ~attributes:(attributes_ : attributes) () =
  ({ attributes = attributes_; cluster = cluster_ } : delete_attributes_request)

let make_delete_account_setting_response ?setting:(setting_ : setting option) () =
  ({ setting = setting_ } : delete_account_setting_response)

let make_delete_account_setting_request ?principal_arn:(principal_arn_ : string_ option)
    ~name:(name_ : setting_name) () =
  ({ principal_arn = principal_arn_; name = name_ } : delete_account_setting_request)

let make_create_task_set_response ?task_set:(task_set_ : task_set option) () =
  ({ task_set = task_set_ } : create_task_set_response)

let make_create_task_set_request ?tags:(tags_ : tags option)
    ?client_token:(client_token_ : string_ option) ?scale:(scale_ : scale option)
    ?platform_version:(platform_version_ : string_ option)
    ?capacity_provider_strategy:(capacity_provider_strategy_ : capacity_provider_strategy option)
    ?launch_type:(launch_type_ : launch_type option)
    ?service_registries:(service_registries_ : service_registries option)
    ?load_balancers:(load_balancers_ : load_balancers option)
    ?network_configuration:(network_configuration_ : network_configuration option)
    ?external_id:(external_id_ : string_ option) ~task_definition:(task_definition_ : string_)
    ~cluster:(cluster_ : string_) ~service:(service_ : string_) () =
  ({
     tags = tags_;
     client_token = client_token_;
     scale = scale_;
     platform_version = platform_version_;
     capacity_provider_strategy = capacity_provider_strategy_;
     launch_type = launch_type_;
     service_registries = service_registries_;
     load_balancers = load_balancers_;
     network_configuration = network_configuration_;
     task_definition = task_definition_;
     external_id = external_id_;
     cluster = cluster_;
     service = service_;
   }
    : create_task_set_request)

let make_create_service_response ?service:(service_ : service option) () =
  ({ service = service_ } : create_service_response)

let make_create_service_request ?monitoring:(monitoring_ : monitoring_configuration option)
    ?vpc_lattice_configurations:(vpc_lattice_configurations_ : vpc_lattice_configurations option)
    ?volume_configurations:(volume_configurations_ : service_volume_configurations option)
    ?service_connect_configuration:
      (service_connect_configuration_ : service_connect_configuration option)
    ?enable_execute_command:(enable_execute_command_ : boolean_ option)
    ?propagate_tags:(propagate_tags_ : propagate_tags option)
    ?enable_ecs_managed_tags:(enable_ecs_managed_tags_ : boolean_ option)
    ?tags:(tags_ : tags option)
    ?deployment_controller:(deployment_controller_ : deployment_controller option)
    ?scheduling_strategy:(scheduling_strategy_ : scheduling_strategy option)
    ?health_check_grace_period_seconds:(health_check_grace_period_seconds_ : boxed_integer option)
    ?network_configuration:(network_configuration_ : network_configuration option)
    ?placement_strategy:(placement_strategy_ : placement_strategies option)
    ?placement_constraints:(placement_constraints_ : placement_constraints option)
    ?deployment_configuration:(deployment_configuration_ : deployment_configuration option)
    ?role:(role_ : string_ option) ?platform_version:(platform_version_ : string_ option)
    ?capacity_provider_strategy:(capacity_provider_strategy_ : capacity_provider_strategy option)
    ?launch_type:(launch_type_ : launch_type option) ?client_token:(client_token_ : string_ option)
    ?desired_count:(desired_count_ : boxed_integer option)
    ?service_registries:(service_registries_ : service_registries option)
    ?load_balancers:(load_balancers_ : load_balancers option)
    ?availability_zone_rebalancing:
      (availability_zone_rebalancing_ : availability_zone_rebalancing option)
    ?task_definition:(task_definition_ : string_ option) ?cluster:(cluster_ : string_ option)
    ~service_name:(service_name_ : string_) () =
  ({
     monitoring = monitoring_;
     vpc_lattice_configurations = vpc_lattice_configurations_;
     volume_configurations = volume_configurations_;
     service_connect_configuration = service_connect_configuration_;
     enable_execute_command = enable_execute_command_;
     propagate_tags = propagate_tags_;
     enable_ecs_managed_tags = enable_ecs_managed_tags_;
     tags = tags_;
     deployment_controller = deployment_controller_;
     scheduling_strategy = scheduling_strategy_;
     health_check_grace_period_seconds = health_check_grace_period_seconds_;
     network_configuration = network_configuration_;
     placement_strategy = placement_strategy_;
     placement_constraints = placement_constraints_;
     deployment_configuration = deployment_configuration_;
     role = role_;
     platform_version = platform_version_;
     capacity_provider_strategy = capacity_provider_strategy_;
     launch_type = launch_type_;
     client_token = client_token_;
     desired_count = desired_count_;
     service_registries = service_registries_;
     load_balancers = load_balancers_;
     availability_zone_rebalancing = availability_zone_rebalancing_;
     task_definition = task_definition_;
     service_name = service_name_;
     cluster = cluster_;
   }
    : create_service_request)

let make_create_managed_instances_provider_configuration
    ?auto_repair_configuration:(auto_repair_configuration_ : auto_repair_configuration option)
    ?infrastructure_optimization:(infrastructure_optimization_ : infrastructure_optimization option)
    ?propagate_tags:(propagate_tags_ : propagate_mi_tags option)
    ~instance_launch_template:(instance_launch_template_ : instance_launch_template)
    ~infrastructure_role_arn:(infrastructure_role_arn_ : string_) () =
  ({
     auto_repair_configuration = auto_repair_configuration_;
     infrastructure_optimization = infrastructure_optimization_;
     propagate_tags = propagate_tags_;
     instance_launch_template = instance_launch_template_;
     infrastructure_role_arn = infrastructure_role_arn_;
   }
    : create_managed_instances_provider_configuration)

let make_create_express_gateway_service_response
    ?service:(service_ : ecs_express_gateway_service option) () =
  ({ service = service_ } : create_express_gateway_service_response)

let make_create_express_gateway_service_request
    ?task_definition_arn:(task_definition_arn_ : string_ option) ?tags:(tags_ : tags option)
    ?scaling_target:(scaling_target_ : express_gateway_scaling_target option)
    ?memory:(memory_ : string_ option) ?cpu:(cpu_ : string_ option)
    ?network_configuration:
      (network_configuration_ : express_gateway_service_network_configuration option)
    ?task_role_arn:(task_role_arn_ : string_ option)
    ?primary_container:(primary_container_ : express_gateway_container option)
    ?health_check_path:(health_check_path_ : string_ option) ?cluster:(cluster_ : string_ option)
    ?service_name:(service_name_ : string_ option)
    ?execution_role_arn:(execution_role_arn_ : string_ option)
    ~infrastructure_role_arn:(infrastructure_role_arn_ : string_) () =
  ({
     task_definition_arn = task_definition_arn_;
     tags = tags_;
     scaling_target = scaling_target_;
     memory = memory_;
     cpu = cpu_;
     network_configuration = network_configuration_;
     task_role_arn = task_role_arn_;
     primary_container = primary_container_;
     health_check_path = health_check_path_;
     cluster = cluster_;
     service_name = service_name_;
     infrastructure_role_arn = infrastructure_role_arn_;
     execution_role_arn = execution_role_arn_;
   }
    : create_express_gateway_service_request)

let make_create_daemon_response ?deployment_arn:(deployment_arn_ : string_ option)
    ?created_at:(created_at_ : timestamp option) ?status:(status_ : daemon_status option)
    ?daemon_arn:(daemon_arn_ : string_ option) () =
  ({
     deployment_arn = deployment_arn_;
     created_at = created_at_;
     status = status_;
     daemon_arn = daemon_arn_;
   }
    : create_daemon_response)

let make_create_daemon_request ?client_token:(client_token_ : string_ option)
    ?enable_execute_command:(enable_execute_command_ : boolean_ option)
    ?enable_ecs_managed_tags:(enable_ecs_managed_tags_ : boolean_ option)
    ?propagate_tags:(propagate_tags_ : daemon_propagate_tags option) ?tags:(tags_ : tags option)
    ?deployment_configuration:(deployment_configuration_ : daemon_deployment_configuration option)
    ?cluster_arn:(cluster_arn_ : string_ option)
    ~capacity_provider_arns:(capacity_provider_arns_ : string_list)
    ~daemon_task_definition_arn:(daemon_task_definition_arn_ : string_)
    ~daemon_name:(daemon_name_ : string_) () =
  ({
     client_token = client_token_;
     enable_execute_command = enable_execute_command_;
     enable_ecs_managed_tags = enable_ecs_managed_tags_;
     propagate_tags = propagate_tags_;
     tags = tags_;
     deployment_configuration = deployment_configuration_;
     capacity_provider_arns = capacity_provider_arns_;
     daemon_task_definition_arn = daemon_task_definition_arn_;
     cluster_arn = cluster_arn_;
     daemon_name = daemon_name_;
   }
    : create_daemon_request)

let make_create_cluster_response ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : create_cluster_response)

let make_create_cluster_request
    ?service_connect_defaults:
      (service_connect_defaults_ : cluster_service_connect_defaults_request option)
    ?default_capacity_provider_strategy:
      (default_capacity_provider_strategy_ : capacity_provider_strategy option)
    ?capacity_providers:(capacity_providers_ : string_list option)
    ?configuration:(configuration_ : cluster_configuration option)
    ?settings:(settings_ : cluster_settings option) ?tags:(tags_ : tags option)
    ?cluster_name:(cluster_name_ : string_ option) () =
  ({
     service_connect_defaults = service_connect_defaults_;
     default_capacity_provider_strategy = default_capacity_provider_strategy_;
     capacity_providers = capacity_providers_;
     configuration = configuration_;
     settings = settings_;
     tags = tags_;
     cluster_name = cluster_name_;
   }
    : create_cluster_request)

let make_create_capacity_provider_response
    ?capacity_provider:(capacity_provider_ : capacity_provider option) () =
  ({ capacity_provider = capacity_provider_ } : create_capacity_provider_response)

let make_create_capacity_provider_request ?tags:(tags_ : tags option)
    ?managed_instances_provider:
      (managed_instances_provider_ : create_managed_instances_provider_configuration option)
    ?auto_scaling_group_provider:(auto_scaling_group_provider_ : auto_scaling_group_provider option)
    ?cluster:(cluster_ : string_ option) ~name:(name_ : string_) () =
  ({
     tags = tags_;
     managed_instances_provider = managed_instances_provider_;
     auto_scaling_group_provider = auto_scaling_group_provider_;
     cluster = cluster_;
     name = name_;
   }
    : create_capacity_provider_request)

let make_continue_service_deployment_response
    ?service_deployment_arn:(service_deployment_arn_ : string_ option) () =
  ({ service_deployment_arn = service_deployment_arn_ } : continue_service_deployment_response)

let make_continue_service_deployment_request
    ?action:(action_ : deployment_lifecycle_hook_action option) ~hook_id:(hook_id_ : string_)
    ~service_deployment_arn:(service_deployment_arn_ : string_) () =
  ({ action = action_; hook_id = hook_id_; service_deployment_arn = service_deployment_arn_ }
    : continue_service_deployment_request)
