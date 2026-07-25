open Types

let make_add_instance_fleet_output ?cluster_id:(cluster_id_ : xml_string_max_len256 option)
    ?instance_fleet_id:(instance_fleet_id_ : instance_fleet_id option)
    ?cluster_arn:(cluster_arn_ : arn_type option) () =
  ({ cluster_id = cluster_id_; instance_fleet_id = instance_fleet_id_; cluster_arn = cluster_arn_ }
    : add_instance_fleet_output)

let make_on_demand_capacity_reservation_options
    ?usage_strategy:(usage_strategy_ : on_demand_capacity_reservation_usage_strategy option)
    ?capacity_reservation_preference:
      (capacity_reservation_preference_ : on_demand_capacity_reservation_preference option)
    ?capacity_reservation_resource_group_arn:
      (capacity_reservation_resource_group_arn_ : xml_string_max_len256 option) () =
  ({
     usage_strategy = usage_strategy_;
     capacity_reservation_preference = capacity_reservation_preference_;
     capacity_reservation_resource_group_arn = capacity_reservation_resource_group_arn_;
   }
    : on_demand_capacity_reservation_options)

let make_on_demand_resizing_specification
    ?timeout_duration_minutes:(timeout_duration_minutes_ : whole_number option)
    ?allocation_strategy:(allocation_strategy_ : on_demand_provisioning_allocation_strategy option)
    ?capacity_reservation_options:
      (capacity_reservation_options_ : on_demand_capacity_reservation_options option) () =
  ({
     timeout_duration_minutes = timeout_duration_minutes_;
     allocation_strategy = allocation_strategy_;
     capacity_reservation_options = capacity_reservation_options_;
   }
    : on_demand_resizing_specification)

let make_spot_resizing_specification
    ?timeout_duration_minutes:(timeout_duration_minutes_ : whole_number option)
    ?allocation_strategy:(allocation_strategy_ : spot_provisioning_allocation_strategy option) () =
  ({
     timeout_duration_minutes = timeout_duration_minutes_;
     allocation_strategy = allocation_strategy_;
   }
    : spot_resizing_specification)

let make_instance_fleet_resizing_specifications
    ?spot_resize_specification:(spot_resize_specification_ : spot_resizing_specification option)
    ?on_demand_resize_specification:
      (on_demand_resize_specification_ : on_demand_resizing_specification option) () =
  ({
     spot_resize_specification = spot_resize_specification_;
     on_demand_resize_specification = on_demand_resize_specification_;
   }
    : instance_fleet_resizing_specifications)

let make_on_demand_provisioning_specification
    ?capacity_reservation_options:
      (capacity_reservation_options_ : on_demand_capacity_reservation_options option)
    ~allocation_strategy:(allocation_strategy_ : on_demand_provisioning_allocation_strategy) () =
  ({
     allocation_strategy = allocation_strategy_;
     capacity_reservation_options = capacity_reservation_options_;
   }
    : on_demand_provisioning_specification)

let make_spot_provisioning_specification
    ?block_duration_minutes:(block_duration_minutes_ : whole_number option)
    ?allocation_strategy:(allocation_strategy_ : spot_provisioning_allocation_strategy option)
    ~timeout_duration_minutes:(timeout_duration_minutes_ : whole_number)
    ~timeout_action:(timeout_action_ : spot_provisioning_timeout_action) () =
  ({
     timeout_duration_minutes = timeout_duration_minutes_;
     timeout_action = timeout_action_;
     block_duration_minutes = block_duration_minutes_;
     allocation_strategy = allocation_strategy_;
   }
    : spot_provisioning_specification)

let make_instance_fleet_provisioning_specifications
    ?spot_specification:(spot_specification_ : spot_provisioning_specification option)
    ?on_demand_specification:
      (on_demand_specification_ : on_demand_provisioning_specification option) () =
  ({ spot_specification = spot_specification_; on_demand_specification = on_demand_specification_ }
    : instance_fleet_provisioning_specifications)

let make_configuration ?classification:(classification_ : string_ option)
    ?configurations:(configurations_ : configuration_list option)
    ?properties:(properties_ : string_map option) () =
  ({ classification = classification_; configurations = configurations_; properties = properties_ }
    : configuration)

let make_volume_specification ?iops:(iops_ : integer option)
    ?throughput:(throughput_ : throughput_val option) ~volume_type:(volume_type_ : string_)
    ~size_in_g_b:(size_in_g_b_ : integer) () =
  ({
     volume_type = volume_type_;
     iops = iops_;
     size_in_g_b = size_in_g_b_;
     throughput = throughput_;
   }
    : volume_specification)

let make_ebs_block_device_config ?volumes_per_instance:(volumes_per_instance_ : integer option)
    ~volume_specification:(volume_specification_ : volume_specification) () =
  ({ volume_specification = volume_specification_; volumes_per_instance = volumes_per_instance_ }
    : ebs_block_device_config)

let make_ebs_configuration
    ?ebs_block_device_configs:(ebs_block_device_configs_ : ebs_block_device_config_list option)
    ?ebs_optimized:(ebs_optimized_ : boolean_object option) () =
  ({ ebs_block_device_configs = ebs_block_device_configs_; ebs_optimized = ebs_optimized_ }
    : ebs_configuration)

let make_instance_type_config ?weighted_capacity:(weighted_capacity_ : whole_number option)
    ?bid_price:(bid_price_ : xml_string_max_len256 option)
    ?bid_price_as_percentage_of_on_demand_price:
      (bid_price_as_percentage_of_on_demand_price_ : non_negative_double option)
    ?ebs_configuration:(ebs_configuration_ : ebs_configuration option)
    ?configurations:(configurations_ : configuration_list option)
    ?custom_ami_id:(custom_ami_id_ : xml_string_max_len256 option)
    ?priority:(priority_ : non_negative_double option)
    ~instance_type:(instance_type_ : instance_type) () =
  ({
     instance_type = instance_type_;
     weighted_capacity = weighted_capacity_;
     bid_price = bid_price_;
     bid_price_as_percentage_of_on_demand_price = bid_price_as_percentage_of_on_demand_price_;
     ebs_configuration = ebs_configuration_;
     configurations = configurations_;
     custom_ami_id = custom_ami_id_;
     priority = priority_;
   }
    : instance_type_config)

let make_instance_fleet_config ?name:(name_ : xml_string_max_len256 option)
    ?target_on_demand_capacity:(target_on_demand_capacity_ : whole_number option)
    ?target_spot_capacity:(target_spot_capacity_ : whole_number option)
    ?instance_type_configs:(instance_type_configs_ : instance_type_config_list option)
    ?launch_specifications:
      (launch_specifications_ : instance_fleet_provisioning_specifications option)
    ?resize_specifications:(resize_specifications_ : instance_fleet_resizing_specifications option)
    ?context:(context_ : xml_string_max_len256 option)
    ~instance_fleet_type:(instance_fleet_type_ : instance_fleet_type) () =
  ({
     name = name_;
     instance_fleet_type = instance_fleet_type_;
     target_on_demand_capacity = target_on_demand_capacity_;
     target_spot_capacity = target_spot_capacity_;
     instance_type_configs = instance_type_configs_;
     launch_specifications = launch_specifications_;
     resize_specifications = resize_specifications_;
     context = context_;
   }
    : instance_fleet_config)

let make_add_instance_fleet_input ~cluster_id:(cluster_id_ : xml_string_max_len256)
    ~instance_fleet:(instance_fleet_ : instance_fleet_config) () =
  ({ cluster_id = cluster_id_; instance_fleet = instance_fleet_ } : add_instance_fleet_input)

let make_add_instance_groups_output ?job_flow_id:(job_flow_id_ : xml_string_max_len256 option)
    ?instance_group_ids:(instance_group_ids_ : instance_group_ids_list option)
    ?cluster_arn:(cluster_arn_ : arn_type option) () =
  ({
     job_flow_id = job_flow_id_;
     instance_group_ids = instance_group_ids_;
     cluster_arn = cluster_arn_;
   }
    : add_instance_groups_output)

let make_metric_dimension ?key:(key_ : string_ option) ?value:(value_ : string_ option) () =
  ({ key = key_; value = value_ } : metric_dimension)

let make_cloud_watch_alarm_definition ?evaluation_periods:(evaluation_periods_ : integer option)
    ?namespace:(namespace_ : string_ option) ?statistic:(statistic_ : statistic option)
    ?unit_:(unit__ : unit_ option) ?dimensions:(dimensions_ : metric_dimension_list option)
    ~comparison_operator:(comparison_operator_ : comparison_operator)
    ~metric_name:(metric_name_ : string_) ~period:(period_ : integer)
    ~threshold:(threshold_ : non_negative_double) () =
  ({
     comparison_operator = comparison_operator_;
     evaluation_periods = evaluation_periods_;
     metric_name = metric_name_;
     namespace = namespace_;
     period = period_;
     statistic = statistic_;
     threshold = threshold_;
     unit_ = unit__;
     dimensions = dimensions_;
   }
    : cloud_watch_alarm_definition)

let make_scaling_trigger
    ~cloud_watch_alarm_definition:(cloud_watch_alarm_definition_ : cloud_watch_alarm_definition) ()
    =
  ({ cloud_watch_alarm_definition = cloud_watch_alarm_definition_ } : scaling_trigger)

let make_simple_scaling_policy_configuration
    ?adjustment_type:(adjustment_type_ : adjustment_type option)
    ?cool_down:(cool_down_ : integer option) ~scaling_adjustment:(scaling_adjustment_ : integer) ()
    =
  ({
     adjustment_type = adjustment_type_;
     scaling_adjustment = scaling_adjustment_;
     cool_down = cool_down_;
   }
    : simple_scaling_policy_configuration)

let make_scaling_action ?market:(market_ : market_type option)
    ~simple_scaling_policy_configuration:
      (simple_scaling_policy_configuration_ : simple_scaling_policy_configuration) () =
  ({ market = market_; simple_scaling_policy_configuration = simple_scaling_policy_configuration_ }
    : scaling_action)

let make_scaling_rule ?description:(description_ : string_ option) ~name:(name_ : string_)
    ~action:(action_ : scaling_action) ~trigger:(trigger_ : scaling_trigger) () =
  ({ name = name_; description = description_; action = action_; trigger = trigger_ }
    : scaling_rule)

let make_scaling_constraints ~min_capacity:(min_capacity_ : integer)
    ~max_capacity:(max_capacity_ : integer) () =
  ({ min_capacity = min_capacity_; max_capacity = max_capacity_ } : scaling_constraints)

let make_auto_scaling_policy ~constraints:(constraints_ : scaling_constraints)
    ~rules:(rules_ : scaling_rule_list) () =
  ({ constraints = constraints_; rules = rules_ } : auto_scaling_policy)

let make_instance_group_config ?name:(name_ : xml_string_max_len256 option)
    ?market:(market_ : market_type option) ?bid_price:(bid_price_ : xml_string_max_len256 option)
    ?configurations:(configurations_ : configuration_list option)
    ?ebs_configuration:(ebs_configuration_ : ebs_configuration option)
    ?auto_scaling_policy:(auto_scaling_policy_ : auto_scaling_policy option)
    ?custom_ami_id:(custom_ami_id_ : xml_string_max_len256 option)
    ~instance_role:(instance_role_ : instance_role_type)
    ~instance_type:(instance_type_ : instance_type) ~instance_count:(instance_count_ : integer) () =
  ({
     name = name_;
     market = market_;
     instance_role = instance_role_;
     bid_price = bid_price_;
     instance_type = instance_type_;
     instance_count = instance_count_;
     configurations = configurations_;
     ebs_configuration = ebs_configuration_;
     auto_scaling_policy = auto_scaling_policy_;
     custom_ami_id = custom_ami_id_;
   }
    : instance_group_config)

let make_add_instance_groups_input ~instance_groups:(instance_groups_ : instance_group_config_list)
    ~job_flow_id:(job_flow_id_ : xml_string_max_len256) () =
  ({ instance_groups = instance_groups_; job_flow_id = job_flow_id_ } : add_instance_groups_input)

let make_add_job_flow_steps_output ?step_ids:(step_ids_ : step_ids_list option) () =
  ({ step_ids = step_ids_ } : add_job_flow_steps_output)

let make_s3_monitoring_configuration ?log_uri:(log_uri_ : xml_string option)
    ?encryption_key_arn:(encryption_key_arn_ : xml_string option) () =
  ({ log_uri = log_uri_; encryption_key_arn = encryption_key_arn_ } : s3_monitoring_configuration)

let make_step_monitoring_configuration
    ?s3_monitoring_configuration:(s3_monitoring_configuration_ : s3_monitoring_configuration option)
    () =
  ({ s3_monitoring_configuration = s3_monitoring_configuration_ } : step_monitoring_configuration)

let make_key_value ?key:(key_ : xml_string option) ?value:(value_ : xml_string option) () =
  ({ key = key_; value = value_ } : key_value)

let make_hadoop_jar_step_config ?properties:(properties_ : key_value_list option)
    ?main_class:(main_class_ : xml_string option) ?args:(args_ : xml_string_list option)
    ~jar:(jar_ : xml_string) () =
  ({ properties = properties_; jar = jar_; main_class = main_class_; args = args_ }
    : hadoop_jar_step_config)

let make_step_config ?action_on_failure:(action_on_failure_ : action_on_failure option)
    ?step_monitoring_configuration:
      (step_monitoring_configuration_ : step_monitoring_configuration option)
    ~name:(name_ : xml_string_max_len256)
    ~hadoop_jar_step:(hadoop_jar_step_ : hadoop_jar_step_config) () =
  ({
     name = name_;
     action_on_failure = action_on_failure_;
     hadoop_jar_step = hadoop_jar_step_;
     step_monitoring_configuration = step_monitoring_configuration_;
   }
    : step_config)

let make_add_job_flow_steps_input ?execution_role_arn:(execution_role_arn_ : arn_type option)
    ~job_flow_id:(job_flow_id_ : xml_string_max_len256) ~steps:(steps_ : step_config_list) () =
  ({ job_flow_id = job_flow_id_; steps = steps_; execution_role_arn = execution_role_arn_ }
    : add_job_flow_steps_input)

let make_add_tags_output () = (() : unit)

let make_tag ?key:(key_ : string_ option) ?value:(value_ : string_ option) () =
  ({ key = key_; value = value_ } : tag)

let make_add_tags_input ?cluster_id:(cluster_id_ : cluster_id option)
    ~resource_id:(resource_id_ : resource_id) ~tags:(tags_ : tag_list) () =
  ({ resource_id = resource_id_; tags = tags_; cluster_id = cluster_id_ } : add_tags_input)

let make_application ?name:(name_ : string_ option) ?version:(version_ : string_ option)
    ?args:(args_ : string_list option) ?additional_info:(additional_info_ : string_map option) () =
  ({ name = name_; version = version_; args = args_; additional_info = additional_info_ }
    : application)

let make_auto_scaling_policy_state_change_reason
    ?code:(code_ : auto_scaling_policy_state_change_reason_code option)
    ?message:(message_ : string_ option) () =
  ({ code = code_; message = message_ } : auto_scaling_policy_state_change_reason)

let make_auto_scaling_policy_status ?state:(state_ : auto_scaling_policy_state option)
    ?state_change_reason:(state_change_reason_ : auto_scaling_policy_state_change_reason option) ()
    =
  ({ state = state_; state_change_reason = state_change_reason_ } : auto_scaling_policy_status)

let make_auto_scaling_policy_description ?status:(status_ : auto_scaling_policy_status option)
    ?constraints:(constraints_ : scaling_constraints option)
    ?rules:(rules_ : scaling_rule_list option) () =
  ({ status = status_; constraints = constraints_; rules = rules_ }
    : auto_scaling_policy_description)

let make_auto_termination_policy ?idle_timeout:(idle_timeout_ : long option) () =
  ({ idle_timeout = idle_timeout_ } : auto_termination_policy)

let make_port_range ?max_range:(max_range_ : port option) ~min_range:(min_range_ : port) () =
  ({ min_range = min_range_; max_range = max_range_ } : port_range)

let make_block_public_access_configuration
    ?permitted_public_security_group_rule_ranges:
      (permitted_public_security_group_rule_ranges_ : port_ranges option)
    ?classification:(classification_ : string_ option)
    ?configurations:(configurations_ : configuration_list option)
    ?properties:(properties_ : string_map option)
    ~block_public_security_group_rules:(block_public_security_group_rules_ : boolean_) () =
  ({
     block_public_security_group_rules = block_public_security_group_rules_;
     permitted_public_security_group_rule_ranges = permitted_public_security_group_rule_ranges_;
     classification = classification_;
     configurations = configurations_;
     properties = properties_;
   }
    : block_public_access_configuration)

let make_block_public_access_configuration_metadata ~creation_date_time:(creation_date_time_ : date)
    ~created_by_arn:(created_by_arn_ : arn_type) () =
  ({ creation_date_time = creation_date_time_; created_by_arn = created_by_arn_ }
    : block_public_access_configuration_metadata)

let make_script_bootstrap_action_config ?args:(args_ : xml_string_list option)
    ~path:(path_ : xml_string) () =
  ({ path = path_; args = args_ } : script_bootstrap_action_config)

let make_bootstrap_action_config ~name:(name_ : xml_string_max_len256)
    ~script_bootstrap_action:(script_bootstrap_action_ : script_bootstrap_action_config) () =
  ({ name = name_; script_bootstrap_action = script_bootstrap_action_ } : bootstrap_action_config)

let make_bootstrap_action_detail
    ?bootstrap_action_config:(bootstrap_action_config_ : bootstrap_action_config option) () =
  ({ bootstrap_action_config = bootstrap_action_config_ } : bootstrap_action_detail)

let make_cancel_steps_info ?step_id:(step_id_ : step_id option)
    ?status:(status_ : cancel_steps_request_status option) ?reason:(reason_ : string_ option) () =
  ({ step_id = step_id_; status = status_; reason = reason_ } : cancel_steps_info)

let make_cancel_steps_output
    ?cancel_steps_info_list:(cancel_steps_info_list_ : cancel_steps_info_list option) () =
  ({ cancel_steps_info_list = cancel_steps_info_list_ } : cancel_steps_output)

let make_cancel_steps_input
    ?step_cancellation_option:(step_cancellation_option_ : step_cancellation_option option)
    ~cluster_id:(cluster_id_ : xml_string_max_len256) ~step_ids:(step_ids_ : step_ids_list) () =
  ({
     cluster_id = cluster_id_;
     step_ids = step_ids_;
     step_cancellation_option = step_cancellation_option_;
   }
    : cancel_steps_input)

let make_certificate_authority ?certificate_arn:(certificate_arn_ : xml_string option)
    ?certificate_data:(certificate_data_ : xml_string option) () =
  ({ certificate_arn = certificate_arn_; certificate_data = certificate_data_ }
    : certificate_authority)

let make_cloud_watch_log_configuration ?log_group_name:(log_group_name_ : xml_string option)
    ?log_stream_name_prefix:(log_stream_name_prefix_ : xml_string option)
    ?encryption_key_arn:(encryption_key_arn_ : xml_string option)
    ?log_types:(log_types_ : log_types_map option) ~enabled:(enabled_ : boolean_) () =
  ({
     enabled = enabled_;
     log_group_name = log_group_name_;
     log_stream_name_prefix = log_stream_name_prefix_;
     encryption_key_arn = encryption_key_arn_;
     log_types = log_types_;
   }
    : cloud_watch_log_configuration)

let make_s3_logging_configuration
    ?log_type_upload_policy:(log_type_upload_policy_ : log_type_map option) () =
  ({ log_type_upload_policy = log_type_upload_policy_ } : s3_logging_configuration)

let make_monitoring_configuration
    ?cloud_watch_log_configuration:
      (cloud_watch_log_configuration_ : cloud_watch_log_configuration option)
    ?s3_logging_configuration:(s3_logging_configuration_ : s3_logging_configuration option) () =
  ({
     cloud_watch_log_configuration = cloud_watch_log_configuration_;
     s3_logging_configuration = s3_logging_configuration_;
   }
    : monitoring_configuration)

let make_placement_group_config
    ?placement_strategy:(placement_strategy_ : placement_group_strategy option)
    ~instance_role:(instance_role_ : instance_role_type) () =
  ({ instance_role = instance_role_; placement_strategy = placement_strategy_ }
    : placement_group_config)

let make_kerberos_attributes
    ?cross_realm_trust_principal_password:
      (cross_realm_trust_principal_password_ : xml_string_max_len256 option)
    ?ad_domain_join_user:(ad_domain_join_user_ : xml_string_max_len256 option)
    ?ad_domain_join_password:(ad_domain_join_password_ : xml_string_max_len256 option)
    ~realm:(realm_ : xml_string_max_len256)
    ~kdc_admin_password:(kdc_admin_password_ : xml_string_max_len256) () =
  ({
     realm = realm_;
     kdc_admin_password = kdc_admin_password_;
     cross_realm_trust_principal_password = cross_realm_trust_principal_password_;
     ad_domain_join_user = ad_domain_join_user_;
     ad_domain_join_password = ad_domain_join_password_;
   }
    : kerberos_attributes)

let make_ec2_instance_attributes ?ec2_key_name:(ec2_key_name_ : string_ option)
    ?ec2_subnet_id:(ec2_subnet_id_ : string_ option)
    ?requested_ec2_subnet_ids:(requested_ec2_subnet_ids_ : xml_string_max_len256_list option)
    ?ec2_availability_zone:(ec2_availability_zone_ : string_ option)
    ?requested_ec2_availability_zones:
      (requested_ec2_availability_zones_ : xml_string_max_len256_list option)
    ?iam_instance_profile:(iam_instance_profile_ : string_ option)
    ?emr_managed_master_security_group:(emr_managed_master_security_group_ : string_ option)
    ?emr_managed_slave_security_group:(emr_managed_slave_security_group_ : string_ option)
    ?service_access_security_group:(service_access_security_group_ : string_ option)
    ?additional_master_security_groups:(additional_master_security_groups_ : string_list option)
    ?additional_slave_security_groups:(additional_slave_security_groups_ : string_list option) () =
  ({
     ec2_key_name = ec2_key_name_;
     ec2_subnet_id = ec2_subnet_id_;
     requested_ec2_subnet_ids = requested_ec2_subnet_ids_;
     ec2_availability_zone = ec2_availability_zone_;
     requested_ec2_availability_zones = requested_ec2_availability_zones_;
     iam_instance_profile = iam_instance_profile_;
     emr_managed_master_security_group = emr_managed_master_security_group_;
     emr_managed_slave_security_group = emr_managed_slave_security_group_;
     service_access_security_group = service_access_security_group_;
     additional_master_security_groups = additional_master_security_groups_;
     additional_slave_security_groups = additional_slave_security_groups_;
   }
    : ec2_instance_attributes)

let make_error_detail ?error_code:(error_code_ : string_ option)
    ?error_data:(error_data_ : error_data option) ?error_message:(error_message_ : string_ option)
    () =
  ({ error_code = error_code_; error_data = error_data_; error_message = error_message_ }
    : error_detail)

let make_cluster_timeline ?creation_date_time:(creation_date_time_ : date option)
    ?ready_date_time:(ready_date_time_ : date option) ?end_date_time:(end_date_time_ : date option)
    () =
  ({
     creation_date_time = creation_date_time_;
     ready_date_time = ready_date_time_;
     end_date_time = end_date_time_;
   }
    : cluster_timeline)

let make_cluster_state_change_reason ?code:(code_ : cluster_state_change_reason_code option)
    ?message:(message_ : string_ option) () =
  ({ code = code_; message = message_ } : cluster_state_change_reason)

let make_cluster_status ?state:(state_ : cluster_state option)
    ?state_change_reason:(state_change_reason_ : cluster_state_change_reason option)
    ?timeline:(timeline_ : cluster_timeline option)
    ?error_details:(error_details_ : error_detail_list option) () =
  ({
     state = state_;
     state_change_reason = state_change_reason_;
     timeline = timeline_;
     error_details = error_details_;
   }
    : cluster_status)

let make_cluster ?id:(id_ : cluster_id option) ?name:(name_ : string_ option)
    ?status:(status_ : cluster_status option)
    ?ec2_instance_attributes:(ec2_instance_attributes_ : ec2_instance_attributes option)
    ?instance_collection_type:(instance_collection_type_ : instance_collection_type option)
    ?log_uri:(log_uri_ : string_ option)
    ?log_encryption_kms_key_id:(log_encryption_kms_key_id_ : string_ option)
    ?requested_ami_version:(requested_ami_version_ : string_ option)
    ?running_ami_version:(running_ami_version_ : string_ option)
    ?release_label:(release_label_ : string_ option)
    ?auto_terminate:(auto_terminate_ : boolean_ option)
    ?termination_protected:(termination_protected_ : boolean_ option)
    ?unhealthy_node_replacement:(unhealthy_node_replacement_ : boolean_object option)
    ?visible_to_all_users:(visible_to_all_users_ : boolean_ option)
    ?applications:(applications_ : application_list option) ?tags:(tags_ : tag_list option)
    ?service_role:(service_role_ : string_ option)
    ?normalized_instance_hours:(normalized_instance_hours_ : integer option)
    ?master_public_dns_name:(master_public_dns_name_ : string_ option)
    ?configurations:(configurations_ : configuration_list option)
    ?security_configuration:(security_configuration_ : xml_string option)
    ?auto_scaling_role:(auto_scaling_role_ : xml_string option)
    ?scale_down_behavior:(scale_down_behavior_ : scale_down_behavior option)
    ?custom_ami_id:(custom_ami_id_ : xml_string_max_len256 option)
    ?ebs_root_volume_size:(ebs_root_volume_size_ : integer option)
    ?repo_upgrade_on_boot:(repo_upgrade_on_boot_ : repo_upgrade_on_boot option)
    ?kerberos_attributes:(kerberos_attributes_ : kerberos_attributes option)
    ?cluster_arn:(cluster_arn_ : arn_type option)
    ?outpost_arn:(outpost_arn_ : optional_arn_type option)
    ?step_concurrency_level:(step_concurrency_level_ : integer option)
    ?placement_groups:(placement_groups_ : placement_group_config_list option)
    ?os_release_label:(os_release_label_ : string_ option)
    ?ebs_root_volume_iops:(ebs_root_volume_iops_ : integer option)
    ?ebs_root_volume_throughput:(ebs_root_volume_throughput_ : integer option)
    ?extended_support:(extended_support_ : boolean_object option)
    ?monitoring_configuration:(monitoring_configuration_ : monitoring_configuration option)
    ?session_enabled:(session_enabled_ : boolean_object option) () =
  ({
     id = id_;
     name = name_;
     status = status_;
     ec2_instance_attributes = ec2_instance_attributes_;
     instance_collection_type = instance_collection_type_;
     log_uri = log_uri_;
     log_encryption_kms_key_id = log_encryption_kms_key_id_;
     requested_ami_version = requested_ami_version_;
     running_ami_version = running_ami_version_;
     release_label = release_label_;
     auto_terminate = auto_terminate_;
     termination_protected = termination_protected_;
     unhealthy_node_replacement = unhealthy_node_replacement_;
     visible_to_all_users = visible_to_all_users_;
     applications = applications_;
     tags = tags_;
     service_role = service_role_;
     normalized_instance_hours = normalized_instance_hours_;
     master_public_dns_name = master_public_dns_name_;
     configurations = configurations_;
     security_configuration = security_configuration_;
     auto_scaling_role = auto_scaling_role_;
     scale_down_behavior = scale_down_behavior_;
     custom_ami_id = custom_ami_id_;
     ebs_root_volume_size = ebs_root_volume_size_;
     repo_upgrade_on_boot = repo_upgrade_on_boot_;
     kerberos_attributes = kerberos_attributes_;
     cluster_arn = cluster_arn_;
     outpost_arn = outpost_arn_;
     step_concurrency_level = step_concurrency_level_;
     placement_groups = placement_groups_;
     os_release_label = os_release_label_;
     ebs_root_volume_iops = ebs_root_volume_iops_;
     ebs_root_volume_throughput = ebs_root_volume_throughput_;
     extended_support = extended_support_;
     monitoring_configuration = monitoring_configuration_;
     session_enabled = session_enabled_;
   }
    : cluster)

let make_cluster_summary ?id:(id_ : cluster_id option) ?name:(name_ : string_ option)
    ?status:(status_ : cluster_status option)
    ?normalized_instance_hours:(normalized_instance_hours_ : integer option)
    ?cluster_arn:(cluster_arn_ : arn_type option)
    ?outpost_arn:(outpost_arn_ : optional_arn_type option) () =
  ({
     id = id_;
     name = name_;
     status = status_;
     normalized_instance_hours = normalized_instance_hours_;
     cluster_arn = cluster_arn_;
     outpost_arn = outpost_arn_;
   }
    : cluster_summary)

let make_command ?name:(name_ : string_ option) ?script_path:(script_path_ : string_ option)
    ?args:(args_ : string_list option) () =
  ({ name = name_; script_path = script_path_; args = args_ } : command)

let make_compute_limits
    ?maximum_on_demand_capacity_units:(maximum_on_demand_capacity_units_ : integer option)
    ?maximum_core_capacity_units:(maximum_core_capacity_units_ : integer option)
    ~unit_type:(unit_type_ : compute_limits_unit_type)
    ~minimum_capacity_units:(minimum_capacity_units_ : integer)
    ~maximum_capacity_units:(maximum_capacity_units_ : integer) () =
  ({
     unit_type = unit_type_;
     minimum_capacity_units = minimum_capacity_units_;
     maximum_capacity_units = maximum_capacity_units_;
     maximum_on_demand_capacity_units = maximum_on_demand_capacity_units_;
     maximum_core_capacity_units = maximum_core_capacity_units_;
   }
    : compute_limits)

let make_create_persistent_app_ui_output
    ?persistent_app_ui_id:(persistent_app_ui_id_ : xml_string_max_len256 option)
    ?runtime_role_enabled_cluster:(runtime_role_enabled_cluster_ : boolean_ option) () =
  ({
     persistent_app_ui_id = persistent_app_ui_id_;
     runtime_role_enabled_cluster = runtime_role_enabled_cluster_;
   }
    : create_persistent_app_ui_output)

let make_emr_containers_config ?job_run_id:(job_run_id_ : xml_string_max_len256 option) () =
  ({ job_run_id = job_run_id_ } : emr_containers_config)

let make_create_persistent_app_ui_input
    ?emr_containers_config:(emr_containers_config_ : emr_containers_config option)
    ?tags:(tags_ : tag_list option) ?x_referer:(x_referer_ : string_ option)
    ?profiler_type:(profiler_type_ : profiler_type option)
    ~target_resource_arn:(target_resource_arn_ : arn_type) () =
  ({
     target_resource_arn = target_resource_arn_;
     emr_containers_config = emr_containers_config_;
     tags = tags_;
     x_referer = x_referer_;
     profiler_type = profiler_type_;
   }
    : create_persistent_app_ui_input)

let make_create_security_configuration_output ~name:(name_ : xml_string)
    ~creation_date_time:(creation_date_time_ : date) () =
  ({ name = name_; creation_date_time = creation_date_time_ }
    : create_security_configuration_output)

let make_create_security_configuration_input ~name:(name_ : xml_string)
    ~security_configuration:(security_configuration_ : string_) () =
  ({ name = name_; security_configuration = security_configuration_ }
    : create_security_configuration_input)

let make_create_studio_output ?studio_id:(studio_id_ : xml_string_max_len256 option)
    ?url:(url_ : xml_string option) () =
  ({ studio_id = studio_id_; url = url_ } : create_studio_output)

let make_create_studio_input ?description:(description_ : xml_string_max_len256 option)
    ?user_role:(user_role_ : xml_string option) ?idp_auth_url:(idp_auth_url_ : xml_string option)
    ?idp_relay_state_parameter_name:(idp_relay_state_parameter_name_ : xml_string_max_len256 option)
    ?tags:(tags_ : tag_list option)
    ?trusted_identity_propagation_enabled:
      (trusted_identity_propagation_enabled_ : boolean_object option)
    ?idc_user_assignment:(idc_user_assignment_ : idc_user_assignment option)
    ?idc_instance_arn:(idc_instance_arn_ : arn_type option)
    ?encryption_key_arn:(encryption_key_arn_ : xml_string option)
    ~name:(name_ : xml_string_max_len256) ~auth_mode:(auth_mode_ : auth_mode)
    ~vpc_id:(vpc_id_ : xml_string_max_len256) ~subnet_ids:(subnet_ids_ : subnet_id_list)
    ~service_role:(service_role_ : xml_string)
    ~workspace_security_group_id:(workspace_security_group_id_ : xml_string_max_len256)
    ~engine_security_group_id:(engine_security_group_id_ : xml_string_max_len256)
    ~default_s3_location:(default_s3_location_ : xml_string) () =
  ({
     name = name_;
     description = description_;
     auth_mode = auth_mode_;
     vpc_id = vpc_id_;
     subnet_ids = subnet_ids_;
     service_role = service_role_;
     user_role = user_role_;
     workspace_security_group_id = workspace_security_group_id_;
     engine_security_group_id = engine_security_group_id_;
     default_s3_location = default_s3_location_;
     idp_auth_url = idp_auth_url_;
     idp_relay_state_parameter_name = idp_relay_state_parameter_name_;
     tags = tags_;
     trusted_identity_propagation_enabled = trusted_identity_propagation_enabled_;
     idc_user_assignment = idc_user_assignment_;
     idc_instance_arn = idc_instance_arn_;
     encryption_key_arn = encryption_key_arn_;
   }
    : create_studio_input)

let make_create_studio_session_mapping_input
    ?identity_id:(identity_id_ : xml_string_max_len256 option)
    ?identity_name:(identity_name_ : xml_string_max_len256 option)
    ~studio_id:(studio_id_ : xml_string_max_len256) ~identity_type:(identity_type_ : identity_type)
    ~session_policy_arn:(session_policy_arn_ : xml_string_max_len256) () =
  ({
     studio_id = studio_id_;
     identity_id = identity_id_;
     identity_name = identity_name_;
     identity_type = identity_type_;
     session_policy_arn = session_policy_arn_;
   }
    : create_studio_session_mapping_input)

let make_username_password ?username:(username_ : xml_string_max_len256 option)
    ?password:(password_ : xml_string_max_len256 option) () =
  ({ username = username_; password = password_ } : username_password)

let make_delete_security_configuration_output () = (() : unit)

let make_delete_security_configuration_input ~name:(name_ : xml_string) () =
  ({ name = name_ } : delete_security_configuration_input)

let make_delete_studio_input ~studio_id:(studio_id_ : xml_string_max_len256) () =
  ({ studio_id = studio_id_ } : delete_studio_input)

let make_delete_studio_session_mapping_input
    ?identity_id:(identity_id_ : xml_string_max_len256 option)
    ?identity_name:(identity_name_ : xml_string_max_len256 option)
    ~studio_id:(studio_id_ : xml_string_max_len256) ~identity_type:(identity_type_ : identity_type)
    () =
  ({
     studio_id = studio_id_;
     identity_id = identity_id_;
     identity_name = identity_name_;
     identity_type = identity_type_;
   }
    : delete_studio_session_mapping_input)

let make_describe_cluster_output ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : describe_cluster_output)

let make_describe_cluster_input ~cluster_id:(cluster_id_ : cluster_id) () =
  ({ cluster_id = cluster_id_ } : describe_cluster_input)

let make_step_execution_status_detail ?start_date_time:(start_date_time_ : date option)
    ?end_date_time:(end_date_time_ : date option)
    ?last_state_change_reason:(last_state_change_reason_ : xml_string option)
    ~state:(state_ : step_execution_state) ~creation_date_time:(creation_date_time_ : date) () =
  ({
     state = state_;
     creation_date_time = creation_date_time_;
     start_date_time = start_date_time_;
     end_date_time = end_date_time_;
     last_state_change_reason = last_state_change_reason_;
   }
    : step_execution_status_detail)

let make_step_detail ~step_config:(step_config_ : step_config)
    ~execution_status_detail:(execution_status_detail_ : step_execution_status_detail) () =
  ({ step_config = step_config_; execution_status_detail = execution_status_detail_ } : step_detail)

let make_placement_type ?availability_zone:(availability_zone_ : xml_string option)
    ?availability_zones:(availability_zones_ : xml_string_max_len256_list option) () =
  ({ availability_zone = availability_zone_; availability_zones = availability_zones_ }
    : placement_type)

let make_instance_group_detail
    ?instance_group_id:(instance_group_id_ : xml_string_max_len256 option)
    ?name:(name_ : xml_string_max_len256 option)
    ?bid_price:(bid_price_ : xml_string_max_len256 option)
    ?last_state_change_reason:(last_state_change_reason_ : xml_string option)
    ?start_date_time:(start_date_time_ : date option)
    ?ready_date_time:(ready_date_time_ : date option) ?end_date_time:(end_date_time_ : date option)
    ?custom_ami_id:(custom_ami_id_ : xml_string_max_len256 option) ~market:(market_ : market_type)
    ~instance_role:(instance_role_ : instance_role_type)
    ~instance_type:(instance_type_ : instance_type)
    ~instance_request_count:(instance_request_count_ : integer)
    ~instance_running_count:(instance_running_count_ : integer)
    ~state:(state_ : instance_group_state) ~creation_date_time:(creation_date_time_ : date) () =
  ({
     instance_group_id = instance_group_id_;
     name = name_;
     market = market_;
     instance_role = instance_role_;
     bid_price = bid_price_;
     instance_type = instance_type_;
     instance_request_count = instance_request_count_;
     instance_running_count = instance_running_count_;
     state = state_;
     last_state_change_reason = last_state_change_reason_;
     creation_date_time = creation_date_time_;
     start_date_time = start_date_time_;
     ready_date_time = ready_date_time_;
     end_date_time = end_date_time_;
     custom_ami_id = custom_ami_id_;
   }
    : instance_group_detail)

let make_job_flow_instances_detail
    ?master_public_dns_name:(master_public_dns_name_ : xml_string option)
    ?master_instance_id:(master_instance_id_ : xml_string option)
    ?instance_groups:(instance_groups_ : instance_group_detail_list option)
    ?normalized_instance_hours:(normalized_instance_hours_ : integer option)
    ?ec2_key_name:(ec2_key_name_ : xml_string_max_len256 option)
    ?ec2_subnet_id:(ec2_subnet_id_ : xml_string_max_len256 option)
    ?placement:(placement_ : placement_type option)
    ?keep_job_flow_alive_when_no_steps:(keep_job_flow_alive_when_no_steps_ : boolean_ option)
    ?termination_protected:(termination_protected_ : boolean_ option)
    ?unhealthy_node_replacement:(unhealthy_node_replacement_ : boolean_object option)
    ?hadoop_version:(hadoop_version_ : xml_string_max_len256 option)
    ~master_instance_type:(master_instance_type_ : instance_type)
    ~slave_instance_type:(slave_instance_type_ : instance_type)
    ~instance_count:(instance_count_ : integer) () =
  ({
     master_instance_type = master_instance_type_;
     master_public_dns_name = master_public_dns_name_;
     master_instance_id = master_instance_id_;
     slave_instance_type = slave_instance_type_;
     instance_count = instance_count_;
     instance_groups = instance_groups_;
     normalized_instance_hours = normalized_instance_hours_;
     ec2_key_name = ec2_key_name_;
     ec2_subnet_id = ec2_subnet_id_;
     placement = placement_;
     keep_job_flow_alive_when_no_steps = keep_job_flow_alive_when_no_steps_;
     termination_protected = termination_protected_;
     unhealthy_node_replacement = unhealthy_node_replacement_;
     hadoop_version = hadoop_version_;
   }
    : job_flow_instances_detail)

let make_job_flow_execution_status_detail ?start_date_time:(start_date_time_ : date option)
    ?ready_date_time:(ready_date_time_ : date option) ?end_date_time:(end_date_time_ : date option)
    ?last_state_change_reason:(last_state_change_reason_ : xml_string option)
    ~state:(state_ : job_flow_execution_state) ~creation_date_time:(creation_date_time_ : date) () =
  ({
     state = state_;
     creation_date_time = creation_date_time_;
     start_date_time = start_date_time_;
     ready_date_time = ready_date_time_;
     end_date_time = end_date_time_;
     last_state_change_reason = last_state_change_reason_;
   }
    : job_flow_execution_status_detail)

let make_job_flow_detail ?log_uri:(log_uri_ : xml_string option)
    ?log_encryption_kms_key_id:(log_encryption_kms_key_id_ : xml_string option)
    ?ami_version:(ami_version_ : xml_string_max_len256 option)
    ?steps:(steps_ : step_detail_list option)
    ?bootstrap_actions:(bootstrap_actions_ : bootstrap_action_detail_list option)
    ?supported_products:(supported_products_ : supported_products_list option)
    ?visible_to_all_users:(visible_to_all_users_ : boolean_ option)
    ?job_flow_role:(job_flow_role_ : xml_string option)
    ?service_role:(service_role_ : xml_string option)
    ?auto_scaling_role:(auto_scaling_role_ : xml_string option)
    ?scale_down_behavior:(scale_down_behavior_ : scale_down_behavior option)
    ~job_flow_id:(job_flow_id_ : xml_string_max_len256) ~name:(name_ : xml_string_max_len256)
    ~execution_status_detail:(execution_status_detail_ : job_flow_execution_status_detail)
    ~instances:(instances_ : job_flow_instances_detail) () =
  ({
     job_flow_id = job_flow_id_;
     name = name_;
     log_uri = log_uri_;
     log_encryption_kms_key_id = log_encryption_kms_key_id_;
     ami_version = ami_version_;
     execution_status_detail = execution_status_detail_;
     instances = instances_;
     steps = steps_;
     bootstrap_actions = bootstrap_actions_;
     supported_products = supported_products_;
     visible_to_all_users = visible_to_all_users_;
     job_flow_role = job_flow_role_;
     service_role = service_role_;
     auto_scaling_role = auto_scaling_role_;
     scale_down_behavior = scale_down_behavior_;
   }
    : job_flow_detail)

let make_describe_job_flows_output ?job_flows:(job_flows_ : job_flow_detail_list option) () =
  ({ job_flows = job_flows_ } : describe_job_flows_output)

let make_describe_job_flows_input ?created_after:(created_after_ : date option)
    ?created_before:(created_before_ : date option)
    ?job_flow_ids:(job_flow_ids_ : xml_string_list option)
    ?job_flow_states:(job_flow_states_ : job_flow_execution_state_list option) () =
  ({
     created_after = created_after_;
     created_before = created_before_;
     job_flow_ids = job_flow_ids_;
     job_flow_states = job_flow_states_;
   }
    : describe_job_flows_input)

let make_output_notebook_s3_location_for_output ?bucket:(bucket_ : xml_string_max_len256 option)
    ?key:(key_ : uri_string option) () =
  ({ bucket = bucket_; key = key_ } : output_notebook_s3_location_for_output)

let make_notebook_s3_location_for_output ?bucket:(bucket_ : xml_string_max_len256 option)
    ?key:(key_ : uri_string option) () =
  ({ bucket = bucket_; key = key_ } : notebook_s3_location_for_output)

let make_execution_engine_config ?type_:(type__ : execution_engine_type option)
    ?master_instance_security_group_id:
      (master_instance_security_group_id_ : xml_string_max_len256 option)
    ?execution_role_arn:(execution_role_arn_ : iam_role_arn option)
    ~id:(id_ : xml_string_max_len256) () =
  ({
     id = id_;
     type_ = type__;
     master_instance_security_group_id = master_instance_security_group_id_;
     execution_role_arn = execution_role_arn_;
   }
    : execution_engine_config)

let make_notebook_execution
    ?notebook_execution_id:(notebook_execution_id_ : xml_string_max_len256 option)
    ?editor_id:(editor_id_ : xml_string_max_len256 option)
    ?execution_engine:(execution_engine_ : execution_engine_config option)
    ?notebook_execution_name:(notebook_execution_name_ : xml_string_max_len256 option)
    ?notebook_params:(notebook_params_ : xml_string option)
    ?status:(status_ : notebook_execution_status option) ?start_time:(start_time_ : date option)
    ?end_time:(end_time_ : date option) ?arn:(arn_ : xml_string_max_len256 option)
    ?output_notebook_ur_i:(output_notebook_ur_i_ : xml_string option)
    ?last_state_change_reason:(last_state_change_reason_ : xml_string option)
    ?notebook_instance_security_group_id:
      (notebook_instance_security_group_id_ : xml_string_max_len256 option)
    ?tags:(tags_ : tag_list option)
    ?notebook_s3_location:(notebook_s3_location_ : notebook_s3_location_for_output option)
    ?output_notebook_s3_location:
      (output_notebook_s3_location_ : output_notebook_s3_location_for_output option)
    ?output_notebook_format:(output_notebook_format_ : output_notebook_format option)
    ?environment_variables:(environment_variables_ : environment_variables_map option) () =
  ({
     notebook_execution_id = notebook_execution_id_;
     editor_id = editor_id_;
     execution_engine = execution_engine_;
     notebook_execution_name = notebook_execution_name_;
     notebook_params = notebook_params_;
     status = status_;
     start_time = start_time_;
     end_time = end_time_;
     arn = arn_;
     output_notebook_ur_i = output_notebook_ur_i_;
     last_state_change_reason = last_state_change_reason_;
     notebook_instance_security_group_id = notebook_instance_security_group_id_;
     tags = tags_;
     notebook_s3_location = notebook_s3_location_;
     output_notebook_s3_location = output_notebook_s3_location_;
     output_notebook_format = output_notebook_format_;
     environment_variables = environment_variables_;
   }
    : notebook_execution)

let make_describe_notebook_execution_output
    ?notebook_execution:(notebook_execution_ : notebook_execution option) () =
  ({ notebook_execution = notebook_execution_ } : describe_notebook_execution_output)

let make_describe_notebook_execution_input
    ~notebook_execution_id:(notebook_execution_id_ : xml_string_max_len256) () =
  ({ notebook_execution_id = notebook_execution_id_ } : describe_notebook_execution_input)

let make_persistent_app_u_i
    ?persistent_app_ui_id:(persistent_app_ui_id_ : xml_string_max_len256 option)
    ?persistent_app_ui_type_list:(persistent_app_ui_type_list_ : persistent_app_ui_type_list option)
    ?persistent_app_ui_status:(persistent_app_ui_status_ : xml_string_max_len256 option)
    ?author_id:(author_id_ : xml_string_max_len256 option)
    ?creation_time:(creation_time_ : date option)
    ?last_modified_time:(last_modified_time_ : date option)
    ?last_state_change_reason:(last_state_change_reason_ : xml_string option)
    ?tags:(tags_ : tag_list option) () =
  ({
     persistent_app_ui_id = persistent_app_ui_id_;
     persistent_app_ui_type_list = persistent_app_ui_type_list_;
     persistent_app_ui_status = persistent_app_ui_status_;
     author_id = author_id_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
     last_state_change_reason = last_state_change_reason_;
     tags = tags_;
   }
    : persistent_app_u_i)

let make_describe_persistent_app_ui_output
    ?persistent_app_u_i:(persistent_app_u_i_ : persistent_app_u_i option) () =
  ({ persistent_app_u_i = persistent_app_u_i_ } : describe_persistent_app_ui_output)

let make_describe_persistent_app_ui_input
    ~persistent_app_ui_id:(persistent_app_ui_id_ : xml_string_max_len256) () =
  ({ persistent_app_ui_id = persistent_app_ui_id_ } : describe_persistent_app_ui_input)

let make_os_release ?label:(label_ : string_ option) () = ({ label = label_ } : os_release)

let make_simplified_application ?name:(name_ : string_ option) ?version:(version_ : string_ option)
    () =
  ({ name = name_; version = version_ } : simplified_application)

let make_describe_release_label_output ?release_label:(release_label_ : string_ option)
    ?applications:(applications_ : simplified_application_list option)
    ?next_token:(next_token_ : string_ option)
    ?available_os_releases:(available_os_releases_ : os_release_list option) () =
  ({
     release_label = release_label_;
     applications = applications_;
     next_token = next_token_;
     available_os_releases = available_os_releases_;
   }
    : describe_release_label_output)

let make_describe_release_label_input ?release_label:(release_label_ : string_ option)
    ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : max_results_number option) () =
  ({ release_label = release_label_; next_token = next_token_; max_results = max_results_ }
    : describe_release_label_input)

let make_describe_security_configuration_output ?name:(name_ : xml_string option)
    ?security_configuration:(security_configuration_ : string_ option)
    ?creation_date_time:(creation_date_time_ : date option) () =
  ({
     name = name_;
     security_configuration = security_configuration_;
     creation_date_time = creation_date_time_;
   }
    : describe_security_configuration_output)

let make_describe_security_configuration_input ~name:(name_ : xml_string) () =
  ({ name = name_ } : describe_security_configuration_input)

let make_step_timeline ?creation_date_time:(creation_date_time_ : date option)
    ?start_date_time:(start_date_time_ : date option) ?end_date_time:(end_date_time_ : date option)
    () =
  ({
     creation_date_time = creation_date_time_;
     start_date_time = start_date_time_;
     end_date_time = end_date_time_;
   }
    : step_timeline)

let make_failure_details ?reason:(reason_ : string_ option) ?message:(message_ : string_ option)
    ?log_file:(log_file_ : string_ option) () =
  ({ reason = reason_; message = message_; log_file = log_file_ } : failure_details)

let make_step_state_change_reason ?code:(code_ : step_state_change_reason_code option)
    ?message:(message_ : string_ option) () =
  ({ code = code_; message = message_ } : step_state_change_reason)

let make_step_status ?state:(state_ : step_state option)
    ?state_change_reason:(state_change_reason_ : step_state_change_reason option)
    ?failure_details:(failure_details_ : failure_details option)
    ?timeline:(timeline_ : step_timeline option) () =
  ({
     state = state_;
     state_change_reason = state_change_reason_;
     failure_details = failure_details_;
     timeline = timeline_;
   }
    : step_status)

let make_hadoop_step_config ?jar:(jar_ : string_ option)
    ?properties:(properties_ : string_map option) ?main_class:(main_class_ : string_ option)
    ?args:(args_ : string_list option) () =
  ({ jar = jar_; properties = properties_; main_class = main_class_; args = args_ }
    : hadoop_step_config)

let make_step ?id:(id_ : step_id option) ?name:(name_ : string_ option)
    ?config:(config_ : hadoop_step_config option)
    ?action_on_failure:(action_on_failure_ : action_on_failure option)
    ?status:(status_ : step_status option)
    ?execution_role_arn:(execution_role_arn_ : optional_arn_type option)
    ?log_uri:(log_uri_ : string_ option) ?encryption_key_arn:(encryption_key_arn_ : string_ option)
    () =
  ({
     id = id_;
     name = name_;
     config = config_;
     action_on_failure = action_on_failure_;
     status = status_;
     execution_role_arn = execution_role_arn_;
     log_uri = log_uri_;
     encryption_key_arn = encryption_key_arn_;
   }
    : step)

let make_describe_step_output ?step:(step_ : step option) () =
  ({ step = step_ } : describe_step_output)

let make_describe_step_input ~cluster_id:(cluster_id_ : cluster_id) ~step_id:(step_id_ : step_id) ()
    =
  ({ cluster_id = cluster_id_; step_id = step_id_ } : describe_step_input)

let make_studio ?studio_id:(studio_id_ : xml_string_max_len256 option)
    ?studio_arn:(studio_arn_ : xml_string_max_len256 option)
    ?name:(name_ : xml_string_max_len256 option)
    ?description:(description_ : xml_string_max_len256 option)
    ?auth_mode:(auth_mode_ : auth_mode option) ?vpc_id:(vpc_id_ : xml_string_max_len256 option)
    ?subnet_ids:(subnet_ids_ : subnet_id_list option)
    ?service_role:(service_role_ : xml_string option) ?user_role:(user_role_ : xml_string option)
    ?workspace_security_group_id:(workspace_security_group_id_ : xml_string_max_len256 option)
    ?engine_security_group_id:(engine_security_group_id_ : xml_string_max_len256 option)
    ?url:(url_ : xml_string option) ?creation_time:(creation_time_ : date option)
    ?default_s3_location:(default_s3_location_ : xml_string option)
    ?idp_auth_url:(idp_auth_url_ : xml_string option)
    ?idp_relay_state_parameter_name:(idp_relay_state_parameter_name_ : xml_string_max_len256 option)
    ?tags:(tags_ : tag_list option) ?idc_instance_arn:(idc_instance_arn_ : arn_type option)
    ?trusted_identity_propagation_enabled:
      (trusted_identity_propagation_enabled_ : boolean_object option)
    ?idc_user_assignment:(idc_user_assignment_ : idc_user_assignment option)
    ?encryption_key_arn:(encryption_key_arn_ : xml_string option) () =
  ({
     studio_id = studio_id_;
     studio_arn = studio_arn_;
     name = name_;
     description = description_;
     auth_mode = auth_mode_;
     vpc_id = vpc_id_;
     subnet_ids = subnet_ids_;
     service_role = service_role_;
     user_role = user_role_;
     workspace_security_group_id = workspace_security_group_id_;
     engine_security_group_id = engine_security_group_id_;
     url = url_;
     creation_time = creation_time_;
     default_s3_location = default_s3_location_;
     idp_auth_url = idp_auth_url_;
     idp_relay_state_parameter_name = idp_relay_state_parameter_name_;
     tags = tags_;
     idc_instance_arn = idc_instance_arn_;
     trusted_identity_propagation_enabled = trusted_identity_propagation_enabled_;
     idc_user_assignment = idc_user_assignment_;
     encryption_key_arn = encryption_key_arn_;
   }
    : studio)

let make_describe_studio_output ?studio:(studio_ : studio option) () =
  ({ studio = studio_ } : describe_studio_output)

let make_describe_studio_input ~studio_id:(studio_id_ : xml_string_max_len256) () =
  ({ studio_id = studio_id_ } : describe_studio_input)

let make_ebs_block_device
    ?volume_specification:(volume_specification_ : volume_specification option)
    ?device:(device_ : string_ option) () =
  ({ volume_specification = volume_specification_; device = device_ } : ebs_block_device)

let make_ebs_volume ?device:(device_ : string_ option) ?volume_id:(volume_id_ : string_ option) () =
  ({ device = device_; volume_id = volume_id_ } : ebs_volume)

let make_update_studio_session_mapping_input
    ?identity_id:(identity_id_ : xml_string_max_len256 option)
    ?identity_name:(identity_name_ : xml_string_max_len256 option)
    ~studio_id:(studio_id_ : xml_string_max_len256) ~identity_type:(identity_type_ : identity_type)
    ~session_policy_arn:(session_policy_arn_ : xml_string_max_len256) () =
  ({
     studio_id = studio_id_;
     identity_id = identity_id_;
     identity_name = identity_name_;
     identity_type = identity_type_;
     session_policy_arn = session_policy_arn_;
   }
    : update_studio_session_mapping_input)

let make_update_studio_input ?name:(name_ : xml_string_max_len256 option)
    ?description:(description_ : xml_string_max_len256 option)
    ?subnet_ids:(subnet_ids_ : subnet_id_list option)
    ?default_s3_location:(default_s3_location_ : xml_string option)
    ?encryption_key_arn:(encryption_key_arn_ : xml_string option)
    ~studio_id:(studio_id_ : xml_string_max_len256) () =
  ({
     studio_id = studio_id_;
     name = name_;
     description = description_;
     subnet_ids = subnet_ids_;
     default_s3_location = default_s3_location_;
     encryption_key_arn = encryption_key_arn_;
   }
    : update_studio_input)

let make_terminate_session_output ~cluster_id:(cluster_id_ : cluster_id)
    ~session_id:(session_id_ : session_id) ~state:(state_ : session_state) () =
  ({ cluster_id = cluster_id_; session_id = session_id_; state = state_ }
    : terminate_session_output)

let make_terminate_session_input ~cluster_id:(cluster_id_ : cluster_id)
    ~session_id:(session_id_ : session_id) () =
  ({ cluster_id = cluster_id_; session_id = session_id_ } : terminate_session_input)

let make_terminate_job_flows_input ~job_flow_ids:(job_flow_ids_ : xml_string_list) () =
  ({ job_flow_ids = job_flow_ids_ } : terminate_job_flows_input)

let make_stop_notebook_execution_input
    ~notebook_execution_id:(notebook_execution_id_ : xml_string_max_len256) () =
  ({ notebook_execution_id = notebook_execution_id_ } : stop_notebook_execution_input)

let make_start_session_output ?cluster_id:(cluster_id_ : cluster_id option)
    ?arn:(arn_ : arn_type option) ?account_id:(account_id_ : xml_string_max_len256 option)
    ?state:(state_ : session_state option) ~id:(id_ : session_id) () =
  ({ id = id_; cluster_id = cluster_id_; arn = arn_; account_id = account_id_; state = state_ }
    : start_session_output)

let make_session_s3_logging_configuration ?enabled:(enabled_ : boolean_ option)
    ?log_uri:(log_uri_ : xml_string option)
    ?encryption_key_arn:(encryption_key_arn_ : xml_string option)
    ?log_types:(log_types_ : log_types_map option) () =
  ({
     enabled = enabled_;
     log_uri = log_uri_;
     encryption_key_arn = encryption_key_arn_;
     log_types = log_types_;
   }
    : session_s3_logging_configuration)

let make_session_managed_logging_configuration ?enabled:(enabled_ : boolean_ option)
    ?encryption_key_arn:(encryption_key_arn_ : xml_string option) () =
  ({ enabled = enabled_; encryption_key_arn = encryption_key_arn_ }
    : session_managed_logging_configuration)

let make_session_cloud_watch_logging_configuration ?enabled:(enabled_ : boolean_ option)
    ?log_group:(log_group_ : xml_string option)
    ?log_stream_name_prefix:(log_stream_name_prefix_ : xml_string option)
    ?encryption_key_arn:(encryption_key_arn_ : xml_string option)
    ?log_types:(log_types_ : log_types_map option) () =
  ({
     enabled = enabled_;
     log_group = log_group_;
     log_stream_name_prefix = log_stream_name_prefix_;
     encryption_key_arn = encryption_key_arn_;
     log_types = log_types_;
   }
    : session_cloud_watch_logging_configuration)

let make_session_monitoring_configuration
    ?cloud_watch_logging_configuration:
      (cloud_watch_logging_configuration_ : session_cloud_watch_logging_configuration option)
    ?managed_logging_configuration:
      (managed_logging_configuration_ : session_managed_logging_configuration option)
    ?s3_logging_configuration:(s3_logging_configuration_ : session_s3_logging_configuration option)
    () =
  ({
     cloud_watch_logging_configuration = cloud_watch_logging_configuration_;
     managed_logging_configuration = managed_logging_configuration_;
     s3_logging_configuration = s3_logging_configuration_;
   }
    : session_monitoring_configuration)

let make_start_session_input ?name:(name_ : xml_string_max_len256 option)
    ?execution_role_arn:(execution_role_arn_ : iam_role_arn option)
    ?engine_configurations:(engine_configurations_ : configuration_list option)
    ?monitoring_configuration:(monitoring_configuration_ : session_monitoring_configuration option)
    ?session_idle_timeout_in_minutes:(session_idle_timeout_in_minutes_ : long option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?tags:(tags_ : tag_list option) ~cluster_id:(cluster_id_ : cluster_id) () =
  ({
     name = name_;
     cluster_id = cluster_id_;
     execution_role_arn = execution_role_arn_;
     engine_configurations = engine_configurations_;
     monitoring_configuration = monitoring_configuration_;
     session_idle_timeout_in_minutes = session_idle_timeout_in_minutes_;
     client_request_token = client_request_token_;
     tags = tags_;
   }
    : start_session_input)

let make_start_notebook_execution_output
    ?notebook_execution_id:(notebook_execution_id_ : xml_string_max_len256 option) () =
  ({ notebook_execution_id = notebook_execution_id_ } : start_notebook_execution_output)

let make_output_notebook_s3_location_from_input ?bucket:(bucket_ : xml_string_max_len256 option)
    ?key:(key_ : uri_string option) () =
  ({ bucket = bucket_; key = key_ } : output_notebook_s3_location_from_input)

let make_notebook_s3_location_from_input ?bucket:(bucket_ : xml_string_max_len256 option)
    ?key:(key_ : uri_string option) () =
  ({ bucket = bucket_; key = key_ } : notebook_s3_location_from_input)

let make_start_notebook_execution_input ?editor_id:(editor_id_ : xml_string_max_len256 option)
    ?relative_path:(relative_path_ : xml_string option)
    ?notebook_execution_name:(notebook_execution_name_ : xml_string_max_len256 option)
    ?notebook_params:(notebook_params_ : xml_string option)
    ?notebook_instance_security_group_id:
      (notebook_instance_security_group_id_ : xml_string_max_len256 option)
    ?tags:(tags_ : tag_list option)
    ?notebook_s3_location:(notebook_s3_location_ : notebook_s3_location_from_input option)
    ?output_notebook_s3_location:
      (output_notebook_s3_location_ : output_notebook_s3_location_from_input option)
    ?output_notebook_format:(output_notebook_format_ : output_notebook_format option)
    ?environment_variables:(environment_variables_ : environment_variables_map option)
    ~execution_engine:(execution_engine_ : execution_engine_config)
    ~service_role:(service_role_ : xml_string) () =
  ({
     editor_id = editor_id_;
     relative_path = relative_path_;
     notebook_execution_name = notebook_execution_name_;
     notebook_params = notebook_params_;
     execution_engine = execution_engine_;
     service_role = service_role_;
     notebook_instance_security_group_id = notebook_instance_security_group_id_;
     tags = tags_;
     notebook_s3_location = notebook_s3_location_;
     output_notebook_s3_location = output_notebook_s3_location_;
     output_notebook_format = output_notebook_format_;
     environment_variables = environment_variables_;
   }
    : start_notebook_execution_input)

let make_set_visible_to_all_users_input ~job_flow_ids:(job_flow_ids_ : xml_string_list)
    ~visible_to_all_users:(visible_to_all_users_ : boolean_) () =
  ({ job_flow_ids = job_flow_ids_; visible_to_all_users = visible_to_all_users_ }
    : set_visible_to_all_users_input)

let make_set_unhealthy_node_replacement_input ~job_flow_ids:(job_flow_ids_ : xml_string_list)
    ~unhealthy_node_replacement:(unhealthy_node_replacement_ : boolean_object) () =
  ({ job_flow_ids = job_flow_ids_; unhealthy_node_replacement = unhealthy_node_replacement_ }
    : set_unhealthy_node_replacement_input)

let make_set_termination_protection_input ~job_flow_ids:(job_flow_ids_ : xml_string_list)
    ~termination_protected:(termination_protected_ : boolean_) () =
  ({ job_flow_ids = job_flow_ids_; termination_protected = termination_protected_ }
    : set_termination_protection_input)

let make_set_keep_job_flow_alive_when_no_steps_input ~job_flow_ids:(job_flow_ids_ : xml_string_list)
    ~keep_job_flow_alive_when_no_steps:(keep_job_flow_alive_when_no_steps_ : boolean_) () =
  ({
     job_flow_ids = job_flow_ids_;
     keep_job_flow_alive_when_no_steps = keep_job_flow_alive_when_no_steps_;
   }
    : set_keep_job_flow_alive_when_no_steps_input)

let make_run_job_flow_output ?job_flow_id:(job_flow_id_ : xml_string_max_len256 option)
    ?cluster_arn:(cluster_arn_ : arn_type option) () =
  ({ job_flow_id = job_flow_id_; cluster_arn = cluster_arn_ } : run_job_flow_output)

let make_managed_scaling_policy ?compute_limits:(compute_limits_ : compute_limits option)
    ?utilization_performance_index:
      (utilization_performance_index_ : utilization_performance_index_integer option)
    ?scaling_strategy:(scaling_strategy_ : scaling_strategy option) () =
  ({
     compute_limits = compute_limits_;
     utilization_performance_index = utilization_performance_index_;
     scaling_strategy = scaling_strategy_;
   }
    : managed_scaling_policy)

let make_supported_product_config ?name:(name_ : xml_string_max_len256 option)
    ?args:(args_ : xml_string_list option) () =
  ({ name = name_; args = args_ } : supported_product_config)

let make_job_flow_instances_config
    ?master_instance_type:(master_instance_type_ : instance_type option)
    ?slave_instance_type:(slave_instance_type_ : instance_type option)
    ?instance_count:(instance_count_ : integer option)
    ?instance_groups:(instance_groups_ : instance_group_config_list option)
    ?instance_fleets:(instance_fleets_ : instance_fleet_config_list option)
    ?ec2_key_name:(ec2_key_name_ : xml_string_max_len256 option)
    ?placement:(placement_ : placement_type option)
    ?keep_job_flow_alive_when_no_steps:(keep_job_flow_alive_when_no_steps_ : boolean_ option)
    ?termination_protected:(termination_protected_ : boolean_ option)
    ?unhealthy_node_replacement:(unhealthy_node_replacement_ : boolean_object option)
    ?hadoop_version:(hadoop_version_ : xml_string_max_len256 option)
    ?ec2_subnet_id:(ec2_subnet_id_ : xml_string_max_len256 option)
    ?ec2_subnet_ids:(ec2_subnet_ids_ : xml_string_max_len256_list option)
    ?emr_managed_master_security_group:
      (emr_managed_master_security_group_ : xml_string_max_len256 option)
    ?emr_managed_slave_security_group:
      (emr_managed_slave_security_group_ : xml_string_max_len256 option)
    ?service_access_security_group:(service_access_security_group_ : xml_string_max_len256 option)
    ?additional_master_security_groups:
      (additional_master_security_groups_ : security_groups_list option)
    ?additional_slave_security_groups:
      (additional_slave_security_groups_ : security_groups_list option) () =
  ({
     master_instance_type = master_instance_type_;
     slave_instance_type = slave_instance_type_;
     instance_count = instance_count_;
     instance_groups = instance_groups_;
     instance_fleets = instance_fleets_;
     ec2_key_name = ec2_key_name_;
     placement = placement_;
     keep_job_flow_alive_when_no_steps = keep_job_flow_alive_when_no_steps_;
     termination_protected = termination_protected_;
     unhealthy_node_replacement = unhealthy_node_replacement_;
     hadoop_version = hadoop_version_;
     ec2_subnet_id = ec2_subnet_id_;
     ec2_subnet_ids = ec2_subnet_ids_;
     emr_managed_master_security_group = emr_managed_master_security_group_;
     emr_managed_slave_security_group = emr_managed_slave_security_group_;
     service_access_security_group = service_access_security_group_;
     additional_master_security_groups = additional_master_security_groups_;
     additional_slave_security_groups = additional_slave_security_groups_;
   }
    : job_flow_instances_config)

let make_run_job_flow_input ?log_uri:(log_uri_ : xml_string option)
    ?log_encryption_kms_key_id:(log_encryption_kms_key_id_ : xml_string option)
    ?additional_info:(additional_info_ : xml_string option)
    ?ami_version:(ami_version_ : xml_string_max_len256 option)
    ?release_label:(release_label_ : xml_string_max_len256 option)
    ?steps:(steps_ : step_config_list option)
    ?step_execution_role_arn:(step_execution_role_arn_ : arn_type option)
    ?bootstrap_actions:(bootstrap_actions_ : bootstrap_action_config_list option)
    ?supported_products:(supported_products_ : supported_products_list option)
    ?new_supported_products:(new_supported_products_ : new_supported_products_list option)
    ?applications:(applications_ : application_list option)
    ?configurations:(configurations_ : configuration_list option)
    ?visible_to_all_users:(visible_to_all_users_ : boolean_ option)
    ?job_flow_role:(job_flow_role_ : xml_string option)
    ?service_role:(service_role_ : xml_string option) ?tags:(tags_ : tag_list option)
    ?security_configuration:(security_configuration_ : xml_string option)
    ?auto_scaling_role:(auto_scaling_role_ : xml_string option)
    ?scale_down_behavior:(scale_down_behavior_ : scale_down_behavior option)
    ?custom_ami_id:(custom_ami_id_ : xml_string_max_len256 option)
    ?ebs_root_volume_size:(ebs_root_volume_size_ : integer option)
    ?repo_upgrade_on_boot:(repo_upgrade_on_boot_ : repo_upgrade_on_boot option)
    ?kerberos_attributes:(kerberos_attributes_ : kerberos_attributes option)
    ?step_concurrency_level:(step_concurrency_level_ : integer option)
    ?managed_scaling_policy:(managed_scaling_policy_ : managed_scaling_policy option)
    ?placement_group_configs:(placement_group_configs_ : placement_group_config_list option)
    ?auto_termination_policy:(auto_termination_policy_ : auto_termination_policy option)
    ?os_release_label:(os_release_label_ : xml_string_max_len256 option)
    ?ebs_root_volume_iops:(ebs_root_volume_iops_ : integer option)
    ?ebs_root_volume_throughput:(ebs_root_volume_throughput_ : integer option)
    ?extended_support:(extended_support_ : boolean_object option)
    ?monitoring_configuration:(monitoring_configuration_ : monitoring_configuration option)
    ?session_enabled:(session_enabled_ : boolean_object option)
    ~name:(name_ : xml_string_max_len256) ~instances:(instances_ : job_flow_instances_config) () =
  ({
     name = name_;
     log_uri = log_uri_;
     log_encryption_kms_key_id = log_encryption_kms_key_id_;
     additional_info = additional_info_;
     ami_version = ami_version_;
     release_label = release_label_;
     instances = instances_;
     steps = steps_;
     step_execution_role_arn = step_execution_role_arn_;
     bootstrap_actions = bootstrap_actions_;
     supported_products = supported_products_;
     new_supported_products = new_supported_products_;
     applications = applications_;
     configurations = configurations_;
     visible_to_all_users = visible_to_all_users_;
     job_flow_role = job_flow_role_;
     service_role = service_role_;
     tags = tags_;
     security_configuration = security_configuration_;
     auto_scaling_role = auto_scaling_role_;
     scale_down_behavior = scale_down_behavior_;
     custom_ami_id = custom_ami_id_;
     ebs_root_volume_size = ebs_root_volume_size_;
     repo_upgrade_on_boot = repo_upgrade_on_boot_;
     kerberos_attributes = kerberos_attributes_;
     step_concurrency_level = step_concurrency_level_;
     managed_scaling_policy = managed_scaling_policy_;
     placement_group_configs = placement_group_configs_;
     auto_termination_policy = auto_termination_policy_;
     os_release_label = os_release_label_;
     ebs_root_volume_iops = ebs_root_volume_iops_;
     ebs_root_volume_throughput = ebs_root_volume_throughput_;
     extended_support = extended_support_;
     monitoring_configuration = monitoring_configuration_;
     session_enabled = session_enabled_;
   }
    : run_job_flow_input)

let make_remove_tags_output () = (() : unit)

let make_remove_tags_input ?cluster_id:(cluster_id_ : cluster_id option)
    ~resource_id:(resource_id_ : resource_id) ~tag_keys:(tag_keys_ : string_list) () =
  ({ resource_id = resource_id_; tag_keys = tag_keys_; cluster_id = cluster_id_ }
    : remove_tags_input)

let make_remove_managed_scaling_policy_output () = (() : unit)

let make_remove_managed_scaling_policy_input ~cluster_id:(cluster_id_ : cluster_id) () =
  ({ cluster_id = cluster_id_ } : remove_managed_scaling_policy_input)

let make_remove_auto_termination_policy_output () = (() : unit)

let make_remove_auto_termination_policy_input ~cluster_id:(cluster_id_ : cluster_id) () =
  ({ cluster_id = cluster_id_ } : remove_auto_termination_policy_input)

let make_remove_auto_scaling_policy_output () = (() : unit)

let make_remove_auto_scaling_policy_input ~cluster_id:(cluster_id_ : cluster_id)
    ~instance_group_id:(instance_group_id_ : instance_group_id) () =
  ({ cluster_id = cluster_id_; instance_group_id = instance_group_id_ }
    : remove_auto_scaling_policy_input)

let make_put_managed_scaling_policy_output () = (() : unit)

let make_put_managed_scaling_policy_input ~cluster_id:(cluster_id_ : cluster_id)
    ~managed_scaling_policy:(managed_scaling_policy_ : managed_scaling_policy) () =
  ({ cluster_id = cluster_id_; managed_scaling_policy = managed_scaling_policy_ }
    : put_managed_scaling_policy_input)

let make_put_block_public_access_configuration_output () = (() : unit)

let make_put_block_public_access_configuration_input
    ~block_public_access_configuration:
      (block_public_access_configuration_ : block_public_access_configuration) () =
  ({ block_public_access_configuration = block_public_access_configuration_ }
    : put_block_public_access_configuration_input)

let make_put_auto_termination_policy_output () = (() : unit)

let make_put_auto_termination_policy_input
    ?auto_termination_policy:(auto_termination_policy_ : auto_termination_policy option)
    ~cluster_id:(cluster_id_ : cluster_id) () =
  ({ cluster_id = cluster_id_; auto_termination_policy = auto_termination_policy_ }
    : put_auto_termination_policy_input)

let make_put_auto_scaling_policy_output ?cluster_id:(cluster_id_ : cluster_id option)
    ?instance_group_id:(instance_group_id_ : instance_group_id option)
    ?auto_scaling_policy:(auto_scaling_policy_ : auto_scaling_policy_description option)
    ?cluster_arn:(cluster_arn_ : arn_type option) () =
  ({
     cluster_id = cluster_id_;
     instance_group_id = instance_group_id_;
     auto_scaling_policy = auto_scaling_policy_;
     cluster_arn = cluster_arn_;
   }
    : put_auto_scaling_policy_output)

let make_put_auto_scaling_policy_input ~cluster_id:(cluster_id_ : cluster_id)
    ~instance_group_id:(instance_group_id_ : instance_group_id)
    ~auto_scaling_policy:(auto_scaling_policy_ : auto_scaling_policy) () =
  ({
     cluster_id = cluster_id_;
     instance_group_id = instance_group_id_;
     auto_scaling_policy = auto_scaling_policy_;
   }
    : put_auto_scaling_policy_input)

let make_instance_resize_policy
    ?instances_to_terminate:(instances_to_terminate_ : ec2_instance_ids_list option)
    ?instances_to_protect:(instances_to_protect_ : ec2_instance_ids_list option)
    ?instance_termination_timeout:(instance_termination_timeout_ : integer option) () =
  ({
     instances_to_terminate = instances_to_terminate_;
     instances_to_protect = instances_to_protect_;
     instance_termination_timeout = instance_termination_timeout_;
   }
    : instance_resize_policy)

let make_shrink_policy ?decommission_timeout:(decommission_timeout_ : integer option)
    ?instance_resize_policy:(instance_resize_policy_ : instance_resize_policy option) () =
  ({
     decommission_timeout = decommission_timeout_;
     instance_resize_policy = instance_resize_policy_;
   }
    : shrink_policy)

let make_instance_group_modify_config ?instance_count:(instance_count_ : integer option)
    ?ec2_instance_ids_to_terminate:
      (ec2_instance_ids_to_terminate_ : ec2_instance_ids_to_terminate_list option)
    ?shrink_policy:(shrink_policy_ : shrink_policy option)
    ?reconfiguration_type:(reconfiguration_type_ : reconfiguration_type option)
    ?configurations:(configurations_ : configuration_list option)
    ~instance_group_id:(instance_group_id_ : xml_string_max_len256) () =
  ({
     instance_group_id = instance_group_id_;
     instance_count = instance_count_;
     ec2_instance_ids_to_terminate = ec2_instance_ids_to_terminate_;
     shrink_policy = shrink_policy_;
     reconfiguration_type = reconfiguration_type_;
     configurations = configurations_;
   }
    : instance_group_modify_config)

let make_modify_instance_groups_input ?cluster_id:(cluster_id_ : cluster_id option)
    ?instance_groups:(instance_groups_ : instance_group_modify_config_list option) () =
  ({ cluster_id = cluster_id_; instance_groups = instance_groups_ } : modify_instance_groups_input)

let make_instance_fleet_modify_config
    ?target_on_demand_capacity:(target_on_demand_capacity_ : whole_number option)
    ?target_spot_capacity:(target_spot_capacity_ : whole_number option)
    ?resize_specifications:(resize_specifications_ : instance_fleet_resizing_specifications option)
    ?instance_type_configs:(instance_type_configs_ : instance_type_config_list option)
    ?context:(context_ : xml_string_max_len256 option)
    ~instance_fleet_id:(instance_fleet_id_ : instance_fleet_id) () =
  ({
     instance_fleet_id = instance_fleet_id_;
     target_on_demand_capacity = target_on_demand_capacity_;
     target_spot_capacity = target_spot_capacity_;
     resize_specifications = resize_specifications_;
     instance_type_configs = instance_type_configs_;
     context = context_;
   }
    : instance_fleet_modify_config)

let make_modify_instance_fleet_input ~cluster_id:(cluster_id_ : cluster_id)
    ~instance_fleet:(instance_fleet_ : instance_fleet_modify_config) () =
  ({ cluster_id = cluster_id_; instance_fleet = instance_fleet_ } : modify_instance_fleet_input)

let make_modify_cluster_output ?step_concurrency_level:(step_concurrency_level_ : integer option)
    ?extended_support:(extended_support_ : boolean_object option) () =
  ({ step_concurrency_level = step_concurrency_level_; extended_support = extended_support_ }
    : modify_cluster_output)

let make_modify_cluster_input ?step_concurrency_level:(step_concurrency_level_ : integer option)
    ?extended_support:(extended_support_ : boolean_object option)
    ~cluster_id:(cluster_id_ : string_) () =
  ({
     cluster_id = cluster_id_;
     step_concurrency_level = step_concurrency_level_;
     extended_support = extended_support_;
   }
    : modify_cluster_input)

let make_supported_instance_type ?type_:(type__ : string_ option)
    ?memory_g_b:(memory_g_b_ : float_ option) ?storage_g_b:(storage_g_b_ : integer option)
    ?vcp_u:(vcp_u_ : integer option) ?is64_bits_only:(is64_bits_only_ : boolean_ option)
    ?instance_family_id:(instance_family_id_ : string_ option)
    ?ebs_optimized_available:(ebs_optimized_available_ : boolean_ option)
    ?ebs_optimized_by_default:(ebs_optimized_by_default_ : boolean_ option)
    ?number_of_disks:(number_of_disks_ : integer option)
    ?ebs_storage_only:(ebs_storage_only_ : boolean_ option)
    ?architecture:(architecture_ : string_ option) () =
  ({
     type_ = type__;
     memory_g_b = memory_g_b_;
     storage_g_b = storage_g_b_;
     vcp_u = vcp_u_;
     is64_bits_only = is64_bits_only_;
     instance_family_id = instance_family_id_;
     ebs_optimized_available = ebs_optimized_available_;
     ebs_optimized_by_default = ebs_optimized_by_default_;
     number_of_disks = number_of_disks_;
     ebs_storage_only = ebs_storage_only_;
     architecture = architecture_;
   }
    : supported_instance_type)

let make_list_supported_instance_types_output
    ?supported_instance_types:(supported_instance_types_ : supported_instance_types_list option)
    ?marker:(marker_ : string_ option) () =
  ({ supported_instance_types = supported_instance_types_; marker = marker_ }
    : list_supported_instance_types_output)

let make_list_supported_instance_types_input ?marker:(marker_ : string_ option)
    ~release_label:(release_label_ : string_) () =
  ({ release_label = release_label_; marker = marker_ } : list_supported_instance_types_input)

let make_session_mapping_summary ?studio_id:(studio_id_ : xml_string_max_len256 option)
    ?identity_id:(identity_id_ : xml_string_max_len256 option)
    ?identity_name:(identity_name_ : xml_string_max_len256 option)
    ?identity_type:(identity_type_ : identity_type option)
    ?session_policy_arn:(session_policy_arn_ : xml_string_max_len256 option)
    ?creation_time:(creation_time_ : date option) () =
  ({
     studio_id = studio_id_;
     identity_id = identity_id_;
     identity_name = identity_name_;
     identity_type = identity_type_;
     session_policy_arn = session_policy_arn_;
     creation_time = creation_time_;
   }
    : session_mapping_summary)

let make_list_studio_session_mappings_output
    ?session_mappings:(session_mappings_ : session_mapping_summary_list option)
    ?marker:(marker_ : marker option) () =
  ({ session_mappings = session_mappings_; marker = marker_ } : list_studio_session_mappings_output)

let make_list_studio_session_mappings_input ?studio_id:(studio_id_ : xml_string_max_len256 option)
    ?identity_type:(identity_type_ : identity_type option) ?marker:(marker_ : marker option) () =
  ({ studio_id = studio_id_; identity_type = identity_type_; marker = marker_ }
    : list_studio_session_mappings_input)

let make_studio_summary ?studio_id:(studio_id_ : xml_string_max_len256 option)
    ?name:(name_ : xml_string_max_len256 option) ?vpc_id:(vpc_id_ : xml_string_max_len256 option)
    ?description:(description_ : xml_string_max_len256 option)
    ?url:(url_ : xml_string_max_len256 option) ?auth_mode:(auth_mode_ : auth_mode option)
    ?creation_time:(creation_time_ : date option) () =
  ({
     studio_id = studio_id_;
     name = name_;
     vpc_id = vpc_id_;
     description = description_;
     url = url_;
     auth_mode = auth_mode_;
     creation_time = creation_time_;
   }
    : studio_summary)

let make_list_studios_output ?studios:(studios_ : studio_summary_list option)
    ?marker:(marker_ : marker option) () =
  ({ studios = studios_; marker = marker_ } : list_studios_output)

let make_list_studios_input ?marker:(marker_ : marker option) () =
  ({ marker = marker_ } : list_studios_input)

let make_step_summary ?id:(id_ : step_id option) ?name:(name_ : string_ option)
    ?config:(config_ : hadoop_step_config option)
    ?action_on_failure:(action_on_failure_ : action_on_failure option)
    ?status:(status_ : step_status option) ?log_uri:(log_uri_ : string_ option)
    ?encryption_key_arn:(encryption_key_arn_ : string_ option) () =
  ({
     id = id_;
     name = name_;
     config = config_;
     action_on_failure = action_on_failure_;
     status = status_;
     log_uri = log_uri_;
     encryption_key_arn = encryption_key_arn_;
   }
    : step_summary)

let make_list_steps_output ?steps:(steps_ : step_summary_list option)
    ?marker:(marker_ : marker option) () =
  ({ steps = steps_; marker = marker_ } : list_steps_output)

let make_list_steps_input ?step_states:(step_states_ : step_state_list option)
    ?step_ids:(step_ids_ : xml_string_list option) ?marker:(marker_ : marker option)
    ~cluster_id:(cluster_id_ : cluster_id) () =
  ({ cluster_id = cluster_id_; step_states = step_states_; step_ids = step_ids_; marker = marker_ }
    : list_steps_input)

let make_session ?name:(name_ : xml_string_max_len256 option)
    ?state_change_reason:(state_change_reason_ : xml_string option)
    ?release_label:(release_label_ : xml_string_max_len256 option)
    ?execution_role_arn:(execution_role_arn_ : iam_role_arn option)
    ?account_id:(account_id_ : xml_string_max_len256 option) ?created_at:(created_at_ : date option)
    ?updated_at:(updated_at_ : date option) ?started_at:(started_at_ : date option)
    ?ended_at:(ended_at_ : date option) ?idle_since:(idle_since_ : date option)
    ?engine_configurations:(engine_configurations_ : configuration_list option)
    ?monitoring_configuration:(monitoring_configuration_ : session_monitoring_configuration option)
    ?session_idle_timeout_in_minutes:(session_idle_timeout_in_minutes_ : long option)
    ?certificate_authority:(certificate_authority_ : certificate_authority option)
    ?server_url:(server_url_ : xml_string option) ?tags:(tags_ : tag_list option)
    ~id:(id_ : session_id) ~cluster_id:(cluster_id_ : cluster_id) ~arn:(arn_ : arn_type)
    ~state:(state_ : session_state) () =
  ({
     id = id_;
     cluster_id = cluster_id_;
     name = name_;
     arn = arn_;
     state = state_;
     state_change_reason = state_change_reason_;
     release_label = release_label_;
     execution_role_arn = execution_role_arn_;
     account_id = account_id_;
     created_at = created_at_;
     updated_at = updated_at_;
     started_at = started_at_;
     ended_at = ended_at_;
     idle_since = idle_since_;
     engine_configurations = engine_configurations_;
     monitoring_configuration = monitoring_configuration_;
     session_idle_timeout_in_minutes = session_idle_timeout_in_minutes_;
     certificate_authority = certificate_authority_;
     server_url = server_url_;
     tags = tags_;
   }
    : session)

let make_list_sessions_output ?sessions:(sessions_ : session_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ sessions = sessions_; next_token = next_token_ } : list_sessions_output)

let make_list_sessions_input ?session_states:(session_states_ : session_state_list option)
    ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : max_results_number option) ~cluster_id:(cluster_id_ : cluster_id)
    () =
  ({
     cluster_id = cluster_id_;
     session_states = session_states_;
     next_token = next_token_;
     max_results = max_results_;
   }
    : list_sessions_input)

let make_security_configuration_summary ?name:(name_ : xml_string option)
    ?creation_date_time:(creation_date_time_ : date option) () =
  ({ name = name_; creation_date_time = creation_date_time_ } : security_configuration_summary)

let make_list_security_configurations_output
    ?security_configurations:(security_configurations_ : security_configuration_list option)
    ?marker:(marker_ : marker option) () =
  ({ security_configurations = security_configurations_; marker = marker_ }
    : list_security_configurations_output)

let make_list_security_configurations_input ?marker:(marker_ : marker option) () =
  ({ marker = marker_ } : list_security_configurations_input)

let make_list_release_labels_output ?release_labels:(release_labels_ : string_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ release_labels = release_labels_; next_token = next_token_ } : list_release_labels_output)

let make_release_label_filter ?prefix:(prefix_ : string_ option)
    ?application:(application_ : string_ option) () =
  ({ prefix = prefix_; application = application_ } : release_label_filter)

let make_list_release_labels_input ?filters:(filters_ : release_label_filter option)
    ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : max_results_number option) () =
  ({ filters = filters_; next_token = next_token_; max_results = max_results_ }
    : list_release_labels_input)

let make_notebook_execution_summary
    ?notebook_execution_id:(notebook_execution_id_ : xml_string_max_len256 option)
    ?editor_id:(editor_id_ : xml_string_max_len256 option)
    ?notebook_execution_name:(notebook_execution_name_ : xml_string_max_len256 option)
    ?status:(status_ : notebook_execution_status option) ?start_time:(start_time_ : date option)
    ?end_time:(end_time_ : date option)
    ?notebook_s3_location:(notebook_s3_location_ : notebook_s3_location_for_output option)
    ?execution_engine_id:(execution_engine_id_ : xml_string option) () =
  ({
     notebook_execution_id = notebook_execution_id_;
     editor_id = editor_id_;
     notebook_execution_name = notebook_execution_name_;
     status = status_;
     start_time = start_time_;
     end_time = end_time_;
     notebook_s3_location = notebook_s3_location_;
     execution_engine_id = execution_engine_id_;
   }
    : notebook_execution_summary)

let make_list_notebook_executions_output
    ?notebook_executions:(notebook_executions_ : notebook_execution_summary_list option)
    ?marker:(marker_ : marker option) () =
  ({ notebook_executions = notebook_executions_; marker = marker_ }
    : list_notebook_executions_output)

let make_list_notebook_executions_input ?editor_id:(editor_id_ : xml_string_max_len256 option)
    ?status:(status_ : notebook_execution_status option) ?from_:(from__ : date option)
    ?to_:(to__ : date option) ?marker:(marker_ : marker option)
    ?execution_engine_id:(execution_engine_id_ : xml_string option) () =
  ({
     editor_id = editor_id_;
     status = status_;
     from_ = from__;
     to_ = to__;
     marker = marker_;
     execution_engine_id = execution_engine_id_;
   }
    : list_notebook_executions_input)

let make_instance_timeline ?creation_date_time:(creation_date_time_ : date option)
    ?ready_date_time:(ready_date_time_ : date option) ?end_date_time:(end_date_time_ : date option)
    () =
  ({
     creation_date_time = creation_date_time_;
     ready_date_time = ready_date_time_;
     end_date_time = end_date_time_;
   }
    : instance_timeline)

let make_instance_state_change_reason ?code:(code_ : instance_state_change_reason_code option)
    ?message:(message_ : string_ option) () =
  ({ code = code_; message = message_ } : instance_state_change_reason)

let make_instance_status ?state:(state_ : instance_state option)
    ?state_change_reason:(state_change_reason_ : instance_state_change_reason option)
    ?timeline:(timeline_ : instance_timeline option) () =
  ({ state = state_; state_change_reason = state_change_reason_; timeline = timeline_ }
    : instance_status)

let make_instance ?id:(id_ : instance_id option)
    ?ec2_instance_id:(ec2_instance_id_ : instance_id option)
    ?public_dns_name:(public_dns_name_ : string_ option)
    ?public_ip_address:(public_ip_address_ : string_ option)
    ?private_dns_name:(private_dns_name_ : string_ option)
    ?private_ip_address:(private_ip_address_ : string_ option)
    ?status:(status_ : instance_status option)
    ?instance_group_id:(instance_group_id_ : string_ option)
    ?instance_fleet_id:(instance_fleet_id_ : instance_fleet_id option)
    ?market:(market_ : market_type option) ?instance_type:(instance_type_ : instance_type option)
    ?ebs_volumes:(ebs_volumes_ : ebs_volume_list option) () =
  ({
     id = id_;
     ec2_instance_id = ec2_instance_id_;
     public_dns_name = public_dns_name_;
     public_ip_address = public_ip_address_;
     private_dns_name = private_dns_name_;
     private_ip_address = private_ip_address_;
     status = status_;
     instance_group_id = instance_group_id_;
     instance_fleet_id = instance_fleet_id_;
     market = market_;
     instance_type = instance_type_;
     ebs_volumes = ebs_volumes_;
   }
    : instance)

let make_list_instances_output ?instances:(instances_ : instance_list option)
    ?marker:(marker_ : marker option) () =
  ({ instances = instances_; marker = marker_ } : list_instances_output)

let make_list_instances_input ?instance_group_id:(instance_group_id_ : instance_group_id option)
    ?instance_group_types:(instance_group_types_ : instance_group_type_list option)
    ?instance_fleet_id:(instance_fleet_id_ : instance_fleet_id option)
    ?instance_fleet_type:(instance_fleet_type_ : instance_fleet_type option)
    ?instance_states:(instance_states_ : instance_state_list option)
    ?marker:(marker_ : marker option) ~cluster_id:(cluster_id_ : cluster_id) () =
  ({
     cluster_id = cluster_id_;
     instance_group_id = instance_group_id_;
     instance_group_types = instance_group_types_;
     instance_fleet_id = instance_fleet_id_;
     instance_fleet_type = instance_fleet_type_;
     instance_states = instance_states_;
     marker = marker_;
   }
    : list_instances_input)

let make_instance_group_timeline ?creation_date_time:(creation_date_time_ : date option)
    ?ready_date_time:(ready_date_time_ : date option) ?end_date_time:(end_date_time_ : date option)
    () =
  ({
     creation_date_time = creation_date_time_;
     ready_date_time = ready_date_time_;
     end_date_time = end_date_time_;
   }
    : instance_group_timeline)

let make_instance_group_state_change_reason
    ?code:(code_ : instance_group_state_change_reason_code option)
    ?message:(message_ : string_ option) () =
  ({ code = code_; message = message_ } : instance_group_state_change_reason)

let make_instance_group_status ?state:(state_ : instance_group_state option)
    ?state_change_reason:(state_change_reason_ : instance_group_state_change_reason option)
    ?timeline:(timeline_ : instance_group_timeline option) () =
  ({ state = state_; state_change_reason = state_change_reason_; timeline = timeline_ }
    : instance_group_status)

let make_instance_group ?id:(id_ : instance_group_id option) ?name:(name_ : string_ option)
    ?market:(market_ : market_type option)
    ?instance_group_type:(instance_group_type_ : instance_group_type option)
    ?bid_price:(bid_price_ : string_ option) ?instance_type:(instance_type_ : instance_type option)
    ?requested_instance_count:(requested_instance_count_ : integer option)
    ?running_instance_count:(running_instance_count_ : integer option)
    ?status:(status_ : instance_group_status option)
    ?configurations:(configurations_ : configuration_list option)
    ?configurations_version:(configurations_version_ : long option)
    ?last_successfully_applied_configurations:
      (last_successfully_applied_configurations_ : configuration_list option)
    ?last_successfully_applied_configurations_version:
      (last_successfully_applied_configurations_version_ : long option)
    ?ebs_block_devices:(ebs_block_devices_ : ebs_block_device_list option)
    ?ebs_optimized:(ebs_optimized_ : boolean_object option)
    ?shrink_policy:(shrink_policy_ : shrink_policy option)
    ?auto_scaling_policy:(auto_scaling_policy_ : auto_scaling_policy_description option)
    ?custom_ami_id:(custom_ami_id_ : xml_string_max_len256 option) () =
  ({
     id = id_;
     name = name_;
     market = market_;
     instance_group_type = instance_group_type_;
     bid_price = bid_price_;
     instance_type = instance_type_;
     requested_instance_count = requested_instance_count_;
     running_instance_count = running_instance_count_;
     status = status_;
     configurations = configurations_;
     configurations_version = configurations_version_;
     last_successfully_applied_configurations = last_successfully_applied_configurations_;
     last_successfully_applied_configurations_version =
       last_successfully_applied_configurations_version_;
     ebs_block_devices = ebs_block_devices_;
     ebs_optimized = ebs_optimized_;
     shrink_policy = shrink_policy_;
     auto_scaling_policy = auto_scaling_policy_;
     custom_ami_id = custom_ami_id_;
   }
    : instance_group)

let make_list_instance_groups_output
    ?instance_groups:(instance_groups_ : instance_group_list option)
    ?marker:(marker_ : marker option) () =
  ({ instance_groups = instance_groups_; marker = marker_ } : list_instance_groups_output)

let make_list_instance_groups_input ?marker:(marker_ : marker option)
    ~cluster_id:(cluster_id_ : cluster_id) () =
  ({ cluster_id = cluster_id_; marker = marker_ } : list_instance_groups_input)

let make_instance_type_specification ?instance_type:(instance_type_ : instance_type option)
    ?weighted_capacity:(weighted_capacity_ : whole_number option)
    ?bid_price:(bid_price_ : xml_string_max_len256 option)
    ?bid_price_as_percentage_of_on_demand_price:
      (bid_price_as_percentage_of_on_demand_price_ : non_negative_double option)
    ?configurations:(configurations_ : configuration_list option)
    ?ebs_block_devices:(ebs_block_devices_ : ebs_block_device_list option)
    ?ebs_optimized:(ebs_optimized_ : boolean_object option)
    ?custom_ami_id:(custom_ami_id_ : xml_string_max_len256 option)
    ?priority:(priority_ : non_negative_double option) () =
  ({
     instance_type = instance_type_;
     weighted_capacity = weighted_capacity_;
     bid_price = bid_price_;
     bid_price_as_percentage_of_on_demand_price = bid_price_as_percentage_of_on_demand_price_;
     configurations = configurations_;
     ebs_block_devices = ebs_block_devices_;
     ebs_optimized = ebs_optimized_;
     custom_ami_id = custom_ami_id_;
     priority = priority_;
   }
    : instance_type_specification)

let make_instance_fleet_timeline ?creation_date_time:(creation_date_time_ : date option)
    ?ready_date_time:(ready_date_time_ : date option) ?end_date_time:(end_date_time_ : date option)
    () =
  ({
     creation_date_time = creation_date_time_;
     ready_date_time = ready_date_time_;
     end_date_time = end_date_time_;
   }
    : instance_fleet_timeline)

let make_instance_fleet_state_change_reason
    ?code:(code_ : instance_fleet_state_change_reason_code option)
    ?message:(message_ : string_ option) () =
  ({ code = code_; message = message_ } : instance_fleet_state_change_reason)

let make_instance_fleet_status ?state:(state_ : instance_fleet_state option)
    ?state_change_reason:(state_change_reason_ : instance_fleet_state_change_reason option)
    ?timeline:(timeline_ : instance_fleet_timeline option) () =
  ({ state = state_; state_change_reason = state_change_reason_; timeline = timeline_ }
    : instance_fleet_status)

let make_instance_fleet ?id:(id_ : instance_fleet_id option)
    ?name:(name_ : xml_string_max_len256 option) ?status:(status_ : instance_fleet_status option)
    ?instance_fleet_type:(instance_fleet_type_ : instance_fleet_type option)
    ?target_on_demand_capacity:(target_on_demand_capacity_ : whole_number option)
    ?target_spot_capacity:(target_spot_capacity_ : whole_number option)
    ?provisioned_on_demand_capacity:(provisioned_on_demand_capacity_ : whole_number option)
    ?provisioned_spot_capacity:(provisioned_spot_capacity_ : whole_number option)
    ?instance_type_specifications:
      (instance_type_specifications_ : instance_type_specification_list option)
    ?launch_specifications:
      (launch_specifications_ : instance_fleet_provisioning_specifications option)
    ?resize_specifications:(resize_specifications_ : instance_fleet_resizing_specifications option)
    ?context:(context_ : xml_string_max_len256 option) () =
  ({
     id = id_;
     name = name_;
     status = status_;
     instance_fleet_type = instance_fleet_type_;
     target_on_demand_capacity = target_on_demand_capacity_;
     target_spot_capacity = target_spot_capacity_;
     provisioned_on_demand_capacity = provisioned_on_demand_capacity_;
     provisioned_spot_capacity = provisioned_spot_capacity_;
     instance_type_specifications = instance_type_specifications_;
     launch_specifications = launch_specifications_;
     resize_specifications = resize_specifications_;
     context = context_;
   }
    : instance_fleet)

let make_list_instance_fleets_output
    ?instance_fleets:(instance_fleets_ : instance_fleet_list option)
    ?marker:(marker_ : marker option) () =
  ({ instance_fleets = instance_fleets_; marker = marker_ } : list_instance_fleets_output)

let make_list_instance_fleets_input ?marker:(marker_ : marker option)
    ~cluster_id:(cluster_id_ : cluster_id) () =
  ({ cluster_id = cluster_id_; marker = marker_ } : list_instance_fleets_input)

let make_list_clusters_output ?clusters:(clusters_ : cluster_summary_list option)
    ?marker:(marker_ : marker option) () =
  ({ clusters = clusters_; marker = marker_ } : list_clusters_output)

let make_list_clusters_input ?created_after:(created_after_ : date option)
    ?created_before:(created_before_ : date option)
    ?cluster_states:(cluster_states_ : cluster_state_list option) ?marker:(marker_ : marker option)
    () =
  ({
     created_after = created_after_;
     created_before = created_before_;
     cluster_states = cluster_states_;
     marker = marker_;
   }
    : list_clusters_input)

let make_list_bootstrap_actions_output ?bootstrap_actions:(bootstrap_actions_ : command_list option)
    ?marker:(marker_ : marker option) () =
  ({ bootstrap_actions = bootstrap_actions_; marker = marker_ } : list_bootstrap_actions_output)

let make_list_bootstrap_actions_input ?marker:(marker_ : marker option)
    ~cluster_id:(cluster_id_ : cluster_id) () =
  ({ cluster_id = cluster_id_; marker = marker_ } : list_bootstrap_actions_input)

let make_session_mapping_detail ?studio_id:(studio_id_ : xml_string_max_len256 option)
    ?identity_id:(identity_id_ : xml_string_max_len256 option)
    ?identity_name:(identity_name_ : xml_string_max_len256 option)
    ?identity_type:(identity_type_ : identity_type option)
    ?session_policy_arn:(session_policy_arn_ : xml_string_max_len256 option)
    ?creation_time:(creation_time_ : date option)
    ?last_modified_time:(last_modified_time_ : date option) () =
  ({
     studio_id = studio_id_;
     identity_id = identity_id_;
     identity_name = identity_name_;
     identity_type = identity_type_;
     session_policy_arn = session_policy_arn_;
     creation_time = creation_time_;
     last_modified_time = last_modified_time_;
   }
    : session_mapping_detail)

let make_get_studio_session_mapping_output
    ?session_mapping:(session_mapping_ : session_mapping_detail option) () =
  ({ session_mapping = session_mapping_ } : get_studio_session_mapping_output)

let make_get_studio_session_mapping_input ?identity_id:(identity_id_ : xml_string_max_len256 option)
    ?identity_name:(identity_name_ : xml_string_max_len256 option)
    ~studio_id:(studio_id_ : xml_string_max_len256) ~identity_type:(identity_type_ : identity_type)
    () =
  ({
     studio_id = studio_id_;
     identity_id = identity_id_;
     identity_name = identity_name_;
     identity_type = identity_type_;
   }
    : get_studio_session_mapping_input)

let make_get_session_endpoint_output ?auth_token:(auth_token_ : sensitive_string option)
    ?auth_token_expiration_time:(auth_token_expiration_time_ : date option)
    ?credentials:(credentials_ : credentials option) ~endpoint:(endpoint_ : xml_string) () =
  ({
     endpoint = endpoint_;
     auth_token = auth_token_;
     auth_token_expiration_time = auth_token_expiration_time_;
     credentials = credentials_;
   }
    : get_session_endpoint_output)

let make_get_session_endpoint_input ~cluster_id:(cluster_id_ : cluster_id)
    ~session_id:(session_id_ : session_id) () =
  ({ cluster_id = cluster_id_; session_id = session_id_ } : get_session_endpoint_input)

let make_get_session_output ~session:(session_ : session) () =
  ({ session = session_ } : get_session_output)

let make_get_session_input ~cluster_id:(cluster_id_ : cluster_id)
    ~session_id:(session_id_ : session_id) () =
  ({ cluster_id = cluster_id_; session_id = session_id_ } : get_session_input)

let make_get_persistent_app_ui_presigned_url_output
    ?presigned_url_ready:(presigned_url_ready_ : boolean_ option)
    ?presigned_ur_l:(presigned_ur_l_ : xml_string option) () =
  ({ presigned_url_ready = presigned_url_ready_; presigned_ur_l = presigned_ur_l_ }
    : get_persistent_app_ui_presigned_url_output)

let make_get_persistent_app_ui_presigned_url_input
    ?persistent_app_ui_type:(persistent_app_ui_type_ : persistent_app_ui_type option)
    ?application_id:(application_id_ : xml_string_max_len256 option)
    ?auth_proxy_call:(auth_proxy_call_ : boolean_object option)
    ?execution_role_arn:(execution_role_arn_ : arn_type option)
    ~persistent_app_ui_id:(persistent_app_ui_id_ : xml_string_max_len256) () =
  ({
     persistent_app_ui_id = persistent_app_ui_id_;
     persistent_app_ui_type = persistent_app_ui_type_;
     application_id = application_id_;
     auth_proxy_call = auth_proxy_call_;
     execution_role_arn = execution_role_arn_;
   }
    : get_persistent_app_ui_presigned_url_input)

let make_get_on_cluster_app_ui_presigned_url_output
    ?presigned_url_ready:(presigned_url_ready_ : boolean_ option)
    ?presigned_ur_l:(presigned_ur_l_ : xml_string option) () =
  ({ presigned_url_ready = presigned_url_ready_; presigned_ur_l = presigned_ur_l_ }
    : get_on_cluster_app_ui_presigned_url_output)

let make_get_on_cluster_app_ui_presigned_url_input
    ?on_cluster_app_ui_type:(on_cluster_app_ui_type_ : on_cluster_app_ui_type option)
    ?application_id:(application_id_ : xml_string_max_len256 option)
    ?dry_run:(dry_run_ : boolean_object option)
    ?execution_role_arn:(execution_role_arn_ : arn_type option)
    ~cluster_id:(cluster_id_ : xml_string_max_len256) () =
  ({
     cluster_id = cluster_id_;
     on_cluster_app_ui_type = on_cluster_app_ui_type_;
     application_id = application_id_;
     dry_run = dry_run_;
     execution_role_arn = execution_role_arn_;
   }
    : get_on_cluster_app_ui_presigned_url_input)

let make_get_managed_scaling_policy_output
    ?managed_scaling_policy:(managed_scaling_policy_ : managed_scaling_policy option) () =
  ({ managed_scaling_policy = managed_scaling_policy_ } : get_managed_scaling_policy_output)

let make_get_managed_scaling_policy_input ~cluster_id:(cluster_id_ : cluster_id) () =
  ({ cluster_id = cluster_id_ } : get_managed_scaling_policy_input)

let make_get_cluster_session_credentials_output ?credentials:(credentials_ : credentials option)
    ?expires_at:(expires_at_ : date option) () =
  ({ credentials = credentials_; expires_at = expires_at_ }
    : get_cluster_session_credentials_output)

let make_get_cluster_session_credentials_input
    ?execution_role_arn:(execution_role_arn_ : arn_type option)
    ~cluster_id:(cluster_id_ : xml_string_max_len256) () =
  ({ cluster_id = cluster_id_; execution_role_arn = execution_role_arn_ }
    : get_cluster_session_credentials_input)

let make_get_block_public_access_configuration_output
    ~block_public_access_configuration:
      (block_public_access_configuration_ : block_public_access_configuration)
    ~block_public_access_configuration_metadata:
      (block_public_access_configuration_metadata_ : block_public_access_configuration_metadata) ()
    =
  ({
     block_public_access_configuration = block_public_access_configuration_;
     block_public_access_configuration_metadata = block_public_access_configuration_metadata_;
   }
    : get_block_public_access_configuration_output)

let make_get_block_public_access_configuration_input () = (() : unit)

let make_get_auto_termination_policy_output
    ?auto_termination_policy:(auto_termination_policy_ : auto_termination_policy option) () =
  ({ auto_termination_policy = auto_termination_policy_ } : get_auto_termination_policy_output)

let make_get_auto_termination_policy_input ~cluster_id:(cluster_id_ : cluster_id) () =
  ({ cluster_id = cluster_id_ } : get_auto_termination_policy_input)
