open Types

let make_volume_specification ?throughput:(throughput_ : throughput_val option)
    ?iops:(iops_ : integer option) ~size_in_g_b:(size_in_g_b_ : integer)
    ~volume_type:(volume_type_ : string_) () =
  ({
     throughput = throughput_;
     size_in_g_b = size_in_g_b_;
     iops = iops_;
     volume_type = volume_type_;
   }
    : volume_specification)

let make_username_password ?password:(password_ : xml_string_max_len256 option)
    ?username:(username_ : xml_string_max_len256 option) () =
  ({ password = password_; username = username_ } : username_password)

let make_update_studio_session_mapping_input
    ?identity_name:(identity_name_ : xml_string_max_len256 option)
    ?identity_id:(identity_id_ : xml_string_max_len256 option)
    ~session_policy_arn:(session_policy_arn_ : xml_string_max_len256)
    ~identity_type:(identity_type_ : identity_type) ~studio_id:(studio_id_ : xml_string_max_len256)
    () =
  ({
     session_policy_arn = session_policy_arn_;
     identity_type = identity_type_;
     identity_name = identity_name_;
     identity_id = identity_id_;
     studio_id = studio_id_;
   }
    : update_studio_session_mapping_input)

let make_update_studio_input ?encryption_key_arn:(encryption_key_arn_ : xml_string option)
    ?default_s3_location:(default_s3_location_ : xml_string option)
    ?subnet_ids:(subnet_ids_ : subnet_id_list option)
    ?description:(description_ : xml_string_max_len256 option)
    ?name:(name_ : xml_string_max_len256 option) ~studio_id:(studio_id_ : xml_string_max_len256) ()
    =
  ({
     encryption_key_arn = encryption_key_arn_;
     default_s3_location = default_s3_location_;
     subnet_ids = subnet_ids_;
     description = description_;
     name = name_;
     studio_id = studio_id_;
   }
    : update_studio_input)

let make_terminate_session_output ~state:(state_ : session_state)
    ~session_id:(session_id_ : session_id) ~cluster_id:(cluster_id_ : cluster_id) () =
  ({ state = state_; session_id = session_id_; cluster_id = cluster_id_ }
    : terminate_session_output)

let make_terminate_session_input ~session_id:(session_id_ : session_id)
    ~cluster_id:(cluster_id_ : cluster_id) () =
  ({ session_id = session_id_; cluster_id = cluster_id_ } : terminate_session_input)

let make_terminate_job_flows_input ~job_flow_ids:(job_flow_ids_ : xml_string_list) () =
  ({ job_flow_ids = job_flow_ids_ } : terminate_job_flows_input)

let make_tag ?value:(value_ : string_ option) ?key:(key_ : string_ option) () =
  ({ value = value_; key = key_ } : tag)

let make_supported_product_config ?args:(args_ : xml_string_list option)
    ?name:(name_ : xml_string_max_len256 option) () =
  ({ args = args_; name = name_ } : supported_product_config)

let make_supported_instance_type ?architecture:(architecture_ : string_ option)
    ?ebs_storage_only:(ebs_storage_only_ : boolean_ option)
    ?number_of_disks:(number_of_disks_ : integer option)
    ?ebs_optimized_by_default:(ebs_optimized_by_default_ : boolean_ option)
    ?ebs_optimized_available:(ebs_optimized_available_ : boolean_ option)
    ?instance_family_id:(instance_family_id_ : string_ option)
    ?is64_bits_only:(is64_bits_only_ : boolean_ option) ?vcp_u:(vcp_u_ : integer option)
    ?storage_g_b:(storage_g_b_ : integer option) ?memory_g_b:(memory_g_b_ : float_ option)
    ?type_:(type__ : string_ option) () =
  ({
     architecture = architecture_;
     ebs_storage_only = ebs_storage_only_;
     number_of_disks = number_of_disks_;
     ebs_optimized_by_default = ebs_optimized_by_default_;
     ebs_optimized_available = ebs_optimized_available_;
     instance_family_id = instance_family_id_;
     is64_bits_only = is64_bits_only_;
     vcp_u = vcp_u_;
     storage_g_b = storage_g_b_;
     memory_g_b = memory_g_b_;
     type_ = type__;
   }
    : supported_instance_type)

let make_studio_summary ?creation_time:(creation_time_ : date option)
    ?auth_mode:(auth_mode_ : auth_mode option) ?url:(url_ : xml_string_max_len256 option)
    ?description:(description_ : xml_string_max_len256 option)
    ?vpc_id:(vpc_id_ : xml_string_max_len256 option) ?name:(name_ : xml_string_max_len256 option)
    ?studio_id:(studio_id_ : xml_string_max_len256 option) () =
  ({
     creation_time = creation_time_;
     auth_mode = auth_mode_;
     url = url_;
     description = description_;
     vpc_id = vpc_id_;
     name = name_;
     studio_id = studio_id_;
   }
    : studio_summary)

let make_studio ?encryption_key_arn:(encryption_key_arn_ : xml_string option)
    ?idc_user_assignment:(idc_user_assignment_ : idc_user_assignment option)
    ?trusted_identity_propagation_enabled:
      (trusted_identity_propagation_enabled_ : boolean_object option)
    ?idc_instance_arn:(idc_instance_arn_ : arn_type option) ?tags:(tags_ : tag_list option)
    ?idp_relay_state_parameter_name:(idp_relay_state_parameter_name_ : xml_string_max_len256 option)
    ?idp_auth_url:(idp_auth_url_ : xml_string option)
    ?default_s3_location:(default_s3_location_ : xml_string option)
    ?creation_time:(creation_time_ : date option) ?url:(url_ : xml_string option)
    ?engine_security_group_id:(engine_security_group_id_ : xml_string_max_len256 option)
    ?workspace_security_group_id:(workspace_security_group_id_ : xml_string_max_len256 option)
    ?user_role:(user_role_ : xml_string option) ?service_role:(service_role_ : xml_string option)
    ?subnet_ids:(subnet_ids_ : subnet_id_list option)
    ?vpc_id:(vpc_id_ : xml_string_max_len256 option) ?auth_mode:(auth_mode_ : auth_mode option)
    ?description:(description_ : xml_string_max_len256 option)
    ?name:(name_ : xml_string_max_len256 option)
    ?studio_arn:(studio_arn_ : xml_string_max_len256 option)
    ?studio_id:(studio_id_ : xml_string_max_len256 option) () =
  ({
     encryption_key_arn = encryption_key_arn_;
     idc_user_assignment = idc_user_assignment_;
     trusted_identity_propagation_enabled = trusted_identity_propagation_enabled_;
     idc_instance_arn = idc_instance_arn_;
     tags = tags_;
     idp_relay_state_parameter_name = idp_relay_state_parameter_name_;
     idp_auth_url = idp_auth_url_;
     default_s3_location = default_s3_location_;
     creation_time = creation_time_;
     url = url_;
     engine_security_group_id = engine_security_group_id_;
     workspace_security_group_id = workspace_security_group_id_;
     user_role = user_role_;
     service_role = service_role_;
     subnet_ids = subnet_ids_;
     vpc_id = vpc_id_;
     auth_mode = auth_mode_;
     description = description_;
     name = name_;
     studio_arn = studio_arn_;
     studio_id = studio_id_;
   }
    : studio)

let make_stop_notebook_execution_input
    ~notebook_execution_id:(notebook_execution_id_ : xml_string_max_len256) () =
  ({ notebook_execution_id = notebook_execution_id_ } : stop_notebook_execution_input)

let make_step_timeline ?end_date_time:(end_date_time_ : date option)
    ?start_date_time:(start_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option) () =
  ({
     end_date_time = end_date_time_;
     start_date_time = start_date_time_;
     creation_date_time = creation_date_time_;
   }
    : step_timeline)

let make_hadoop_step_config ?args:(args_ : string_list option)
    ?main_class:(main_class_ : string_ option) ?properties:(properties_ : string_map option)
    ?jar:(jar_ : string_ option) () =
  ({ args = args_; main_class = main_class_; properties = properties_; jar = jar_ }
    : hadoop_step_config)

let make_step_state_change_reason ?message:(message_ : string_ option)
    ?code:(code_ : step_state_change_reason_code option) () =
  ({ message = message_; code = code_ } : step_state_change_reason)

let make_failure_details ?log_file:(log_file_ : string_ option) ?message:(message_ : string_ option)
    ?reason:(reason_ : string_ option) () =
  ({ log_file = log_file_; message = message_; reason = reason_ } : failure_details)

let make_step_status ?timeline:(timeline_ : step_timeline option)
    ?failure_details:(failure_details_ : failure_details option)
    ?state_change_reason:(state_change_reason_ : step_state_change_reason option)
    ?state:(state_ : step_state option) () =
  ({
     timeline = timeline_;
     failure_details = failure_details_;
     state_change_reason = state_change_reason_;
     state = state_;
   }
    : step_status)

let make_step_summary ?encryption_key_arn:(encryption_key_arn_ : string_ option)
    ?log_uri:(log_uri_ : string_ option) ?status:(status_ : step_status option)
    ?action_on_failure:(action_on_failure_ : action_on_failure option)
    ?config:(config_ : hadoop_step_config option) ?name:(name_ : string_ option)
    ?id:(id_ : step_id option) () =
  ({
     encryption_key_arn = encryption_key_arn_;
     log_uri = log_uri_;
     status = status_;
     action_on_failure = action_on_failure_;
     config = config_;
     name = name_;
     id = id_;
   }
    : step_summary)

let make_s3_monitoring_configuration ?encryption_key_arn:(encryption_key_arn_ : xml_string option)
    ?log_uri:(log_uri_ : xml_string option) () =
  ({ encryption_key_arn = encryption_key_arn_; log_uri = log_uri_ } : s3_monitoring_configuration)

let make_step_monitoring_configuration
    ?s3_monitoring_configuration:(s3_monitoring_configuration_ : s3_monitoring_configuration option)
    () =
  ({ s3_monitoring_configuration = s3_monitoring_configuration_ } : step_monitoring_configuration)

let make_step_execution_status_detail
    ?last_state_change_reason:(last_state_change_reason_ : xml_string option)
    ?end_date_time:(end_date_time_ : date option) ?start_date_time:(start_date_time_ : date option)
    ~creation_date_time:(creation_date_time_ : date) ~state:(state_ : step_execution_state) () =
  ({
     last_state_change_reason = last_state_change_reason_;
     end_date_time = end_date_time_;
     start_date_time = start_date_time_;
     creation_date_time = creation_date_time_;
     state = state_;
   }
    : step_execution_status_detail)

let make_key_value ?value:(value_ : xml_string option) ?key:(key_ : xml_string option) () =
  ({ value = value_; key = key_ } : key_value)

let make_hadoop_jar_step_config ?args:(args_ : xml_string_list option)
    ?main_class:(main_class_ : xml_string option) ?properties:(properties_ : key_value_list option)
    ~jar:(jar_ : xml_string) () =
  ({ args = args_; main_class = main_class_; jar = jar_; properties = properties_ }
    : hadoop_jar_step_config)

let make_step_config
    ?step_monitoring_configuration:
      (step_monitoring_configuration_ : step_monitoring_configuration option)
    ?action_on_failure:(action_on_failure_ : action_on_failure option)
    ~hadoop_jar_step:(hadoop_jar_step_ : hadoop_jar_step_config)
    ~name:(name_ : xml_string_max_len256) () =
  ({
     step_monitoring_configuration = step_monitoring_configuration_;
     hadoop_jar_step = hadoop_jar_step_;
     action_on_failure = action_on_failure_;
     name = name_;
   }
    : step_config)

let make_step_detail
    ~execution_status_detail:(execution_status_detail_ : step_execution_status_detail)
    ~step_config:(step_config_ : step_config) () =
  ({ execution_status_detail = execution_status_detail_; step_config = step_config_ } : step_detail)

let make_step ?encryption_key_arn:(encryption_key_arn_ : string_ option)
    ?log_uri:(log_uri_ : string_ option)
    ?execution_role_arn:(execution_role_arn_ : optional_arn_type option)
    ?status:(status_ : step_status option)
    ?action_on_failure:(action_on_failure_ : action_on_failure option)
    ?config:(config_ : hadoop_step_config option) ?name:(name_ : string_ option)
    ?id:(id_ : step_id option) () =
  ({
     encryption_key_arn = encryption_key_arn_;
     log_uri = log_uri_;
     execution_role_arn = execution_role_arn_;
     status = status_;
     action_on_failure = action_on_failure_;
     config = config_;
     name = name_;
     id = id_;
   }
    : step)

let make_start_session_output ?state:(state_ : session_state option)
    ?account_id:(account_id_ : xml_string_max_len256 option) ?arn:(arn_ : arn_type option)
    ?cluster_id:(cluster_id_ : cluster_id option) ~id:(id_ : session_id) () =
  ({ state = state_; account_id = account_id_; arn = arn_; cluster_id = cluster_id_; id = id_ }
    : start_session_output)

let make_configuration ?properties:(properties_ : string_map option)
    ?configurations:(configurations_ : configuration_list option)
    ?classification:(classification_ : string_ option) () =
  ({ properties = properties_; configurations = configurations_; classification = classification_ }
    : configuration)

let make_session_cloud_watch_logging_configuration ?log_types:(log_types_ : log_types_map option)
    ?encryption_key_arn:(encryption_key_arn_ : xml_string option)
    ?log_stream_name_prefix:(log_stream_name_prefix_ : xml_string option)
    ?log_group:(log_group_ : xml_string option) ?enabled:(enabled_ : boolean_ option) () =
  ({
     log_types = log_types_;
     encryption_key_arn = encryption_key_arn_;
     log_stream_name_prefix = log_stream_name_prefix_;
     log_group = log_group_;
     enabled = enabled_;
   }
    : session_cloud_watch_logging_configuration)

let make_session_managed_logging_configuration
    ?encryption_key_arn:(encryption_key_arn_ : xml_string option)
    ?enabled:(enabled_ : boolean_ option) () =
  ({ encryption_key_arn = encryption_key_arn_; enabled = enabled_ }
    : session_managed_logging_configuration)

let make_session_s3_logging_configuration ?log_types:(log_types_ : log_types_map option)
    ?encryption_key_arn:(encryption_key_arn_ : xml_string option)
    ?log_uri:(log_uri_ : xml_string option) ?enabled:(enabled_ : boolean_ option) () =
  ({
     log_types = log_types_;
     encryption_key_arn = encryption_key_arn_;
     log_uri = log_uri_;
     enabled = enabled_;
   }
    : session_s3_logging_configuration)

let make_session_monitoring_configuration
    ?s3_logging_configuration:(s3_logging_configuration_ : session_s3_logging_configuration option)
    ?managed_logging_configuration:
      (managed_logging_configuration_ : session_managed_logging_configuration option)
    ?cloud_watch_logging_configuration:
      (cloud_watch_logging_configuration_ : session_cloud_watch_logging_configuration option) () =
  ({
     s3_logging_configuration = s3_logging_configuration_;
     managed_logging_configuration = managed_logging_configuration_;
     cloud_watch_logging_configuration = cloud_watch_logging_configuration_;
   }
    : session_monitoring_configuration)

let make_start_session_input ?tags:(tags_ : tag_list option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?session_idle_timeout_in_minutes:(session_idle_timeout_in_minutes_ : long option)
    ?monitoring_configuration:(monitoring_configuration_ : session_monitoring_configuration option)
    ?engine_configurations:(engine_configurations_ : configuration_list option)
    ?execution_role_arn:(execution_role_arn_ : iam_role_arn option)
    ?name:(name_ : xml_string_max_len256 option) ~cluster_id:(cluster_id_ : cluster_id) () =
  ({
     tags = tags_;
     client_request_token = client_request_token_;
     session_idle_timeout_in_minutes = session_idle_timeout_in_minutes_;
     monitoring_configuration = monitoring_configuration_;
     engine_configurations = engine_configurations_;
     execution_role_arn = execution_role_arn_;
     cluster_id = cluster_id_;
     name = name_;
   }
    : start_session_input)

let make_start_notebook_execution_output
    ?notebook_execution_id:(notebook_execution_id_ : xml_string_max_len256 option) () =
  ({ notebook_execution_id = notebook_execution_id_ } : start_notebook_execution_output)

let make_execution_engine_config ?execution_role_arn:(execution_role_arn_ : iam_role_arn option)
    ?master_instance_security_group_id:
      (master_instance_security_group_id_ : xml_string_max_len256 option)
    ?type_:(type__ : execution_engine_type option) ~id:(id_ : xml_string_max_len256) () =
  ({
     execution_role_arn = execution_role_arn_;
     master_instance_security_group_id = master_instance_security_group_id_;
     type_ = type__;
     id = id_;
   }
    : execution_engine_config)

let make_notebook_s3_location_from_input ?key:(key_ : uri_string option)
    ?bucket:(bucket_ : xml_string_max_len256 option) () =
  ({ key = key_; bucket = bucket_ } : notebook_s3_location_from_input)

let make_output_notebook_s3_location_from_input ?key:(key_ : uri_string option)
    ?bucket:(bucket_ : xml_string_max_len256 option) () =
  ({ key = key_; bucket = bucket_ } : output_notebook_s3_location_from_input)

let make_start_notebook_execution_input
    ?environment_variables:(environment_variables_ : environment_variables_map option)
    ?output_notebook_format:(output_notebook_format_ : output_notebook_format option)
    ?output_notebook_s3_location:
      (output_notebook_s3_location_ : output_notebook_s3_location_from_input option)
    ?notebook_s3_location:(notebook_s3_location_ : notebook_s3_location_from_input option)
    ?tags:(tags_ : tag_list option)
    ?notebook_instance_security_group_id:
      (notebook_instance_security_group_id_ : xml_string_max_len256 option)
    ?notebook_params:(notebook_params_ : xml_string option)
    ?notebook_execution_name:(notebook_execution_name_ : xml_string_max_len256 option)
    ?relative_path:(relative_path_ : xml_string option)
    ?editor_id:(editor_id_ : xml_string_max_len256 option)
    ~service_role:(service_role_ : xml_string)
    ~execution_engine:(execution_engine_ : execution_engine_config) () =
  ({
     environment_variables = environment_variables_;
     output_notebook_format = output_notebook_format_;
     output_notebook_s3_location = output_notebook_s3_location_;
     notebook_s3_location = notebook_s3_location_;
     tags = tags_;
     notebook_instance_security_group_id = notebook_instance_security_group_id_;
     service_role = service_role_;
     execution_engine = execution_engine_;
     notebook_params = notebook_params_;
     notebook_execution_name = notebook_execution_name_;
     relative_path = relative_path_;
     editor_id = editor_id_;
   }
    : start_notebook_execution_input)

let make_spot_resizing_specification
    ?allocation_strategy:(allocation_strategy_ : spot_provisioning_allocation_strategy option)
    ?timeout_duration_minutes:(timeout_duration_minutes_ : whole_number option) () =
  ({
     allocation_strategy = allocation_strategy_;
     timeout_duration_minutes = timeout_duration_minutes_;
   }
    : spot_resizing_specification)

let make_spot_provisioning_specification
    ?allocation_strategy:(allocation_strategy_ : spot_provisioning_allocation_strategy option)
    ?block_duration_minutes:(block_duration_minutes_ : whole_number option)
    ~timeout_action:(timeout_action_ : spot_provisioning_timeout_action)
    ~timeout_duration_minutes:(timeout_duration_minutes_ : whole_number) () =
  ({
     allocation_strategy = allocation_strategy_;
     block_duration_minutes = block_duration_minutes_;
     timeout_action = timeout_action_;
     timeout_duration_minutes = timeout_duration_minutes_;
   }
    : spot_provisioning_specification)

let make_simplified_application ?version:(version_ : string_ option) ?name:(name_ : string_ option)
    () =
  ({ version = version_; name = name_ } : simplified_application)

let make_simple_scaling_policy_configuration ?cool_down:(cool_down_ : integer option)
    ?adjustment_type:(adjustment_type_ : adjustment_type option)
    ~scaling_adjustment:(scaling_adjustment_ : integer) () =
  ({
     cool_down = cool_down_;
     scaling_adjustment = scaling_adjustment_;
     adjustment_type = adjustment_type_;
   }
    : simple_scaling_policy_configuration)

let make_instance_resize_policy
    ?instance_termination_timeout:(instance_termination_timeout_ : integer option)
    ?instances_to_protect:(instances_to_protect_ : ec2_instance_ids_list option)
    ?instances_to_terminate:(instances_to_terminate_ : ec2_instance_ids_list option) () =
  ({
     instance_termination_timeout = instance_termination_timeout_;
     instances_to_protect = instances_to_protect_;
     instances_to_terminate = instances_to_terminate_;
   }
    : instance_resize_policy)

let make_shrink_policy
    ?instance_resize_policy:(instance_resize_policy_ : instance_resize_policy option)
    ?decommission_timeout:(decommission_timeout_ : integer option) () =
  ({
     instance_resize_policy = instance_resize_policy_;
     decommission_timeout = decommission_timeout_;
   }
    : shrink_policy)

let make_set_visible_to_all_users_input ~visible_to_all_users:(visible_to_all_users_ : boolean_)
    ~job_flow_ids:(job_flow_ids_ : xml_string_list) () =
  ({ visible_to_all_users = visible_to_all_users_; job_flow_ids = job_flow_ids_ }
    : set_visible_to_all_users_input)

let make_set_unhealthy_node_replacement_input
    ~unhealthy_node_replacement:(unhealthy_node_replacement_ : boolean_object)
    ~job_flow_ids:(job_flow_ids_ : xml_string_list) () =
  ({ unhealthy_node_replacement = unhealthy_node_replacement_; job_flow_ids = job_flow_ids_ }
    : set_unhealthy_node_replacement_input)

let make_set_termination_protection_input ~termination_protected:(termination_protected_ : boolean_)
    ~job_flow_ids:(job_flow_ids_ : xml_string_list) () =
  ({ termination_protected = termination_protected_; job_flow_ids = job_flow_ids_ }
    : set_termination_protection_input)

let make_set_keep_job_flow_alive_when_no_steps_input
    ~keep_job_flow_alive_when_no_steps:(keep_job_flow_alive_when_no_steps_ : boolean_)
    ~job_flow_ids:(job_flow_ids_ : xml_string_list) () =
  ({
     keep_job_flow_alive_when_no_steps = keep_job_flow_alive_when_no_steps_;
     job_flow_ids = job_flow_ids_;
   }
    : set_keep_job_flow_alive_when_no_steps_input)

let make_session_mapping_summary ?creation_time:(creation_time_ : date option)
    ?session_policy_arn:(session_policy_arn_ : xml_string_max_len256 option)
    ?identity_type:(identity_type_ : identity_type option)
    ?identity_name:(identity_name_ : xml_string_max_len256 option)
    ?identity_id:(identity_id_ : xml_string_max_len256 option)
    ?studio_id:(studio_id_ : xml_string_max_len256 option) () =
  ({
     creation_time = creation_time_;
     session_policy_arn = session_policy_arn_;
     identity_type = identity_type_;
     identity_name = identity_name_;
     identity_id = identity_id_;
     studio_id = studio_id_;
   }
    : session_mapping_summary)

let make_session_mapping_detail ?last_modified_time:(last_modified_time_ : date option)
    ?creation_time:(creation_time_ : date option)
    ?session_policy_arn:(session_policy_arn_ : xml_string_max_len256 option)
    ?identity_type:(identity_type_ : identity_type option)
    ?identity_name:(identity_name_ : xml_string_max_len256 option)
    ?identity_id:(identity_id_ : xml_string_max_len256 option)
    ?studio_id:(studio_id_ : xml_string_max_len256 option) () =
  ({
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     session_policy_arn = session_policy_arn_;
     identity_type = identity_type_;
     identity_name = identity_name_;
     identity_id = identity_id_;
     studio_id = studio_id_;
   }
    : session_mapping_detail)

let make_certificate_authority ?certificate_data:(certificate_data_ : xml_string option)
    ?certificate_arn:(certificate_arn_ : xml_string option) () =
  ({ certificate_data = certificate_data_; certificate_arn = certificate_arn_ }
    : certificate_authority)

let make_session ?tags:(tags_ : tag_list option) ?server_url:(server_url_ : xml_string option)
    ?certificate_authority:(certificate_authority_ : certificate_authority option)
    ?session_idle_timeout_in_minutes:(session_idle_timeout_in_minutes_ : long option)
    ?monitoring_configuration:(monitoring_configuration_ : session_monitoring_configuration option)
    ?engine_configurations:(engine_configurations_ : configuration_list option)
    ?idle_since:(idle_since_ : date option) ?ended_at:(ended_at_ : date option)
    ?started_at:(started_at_ : date option) ?updated_at:(updated_at_ : date option)
    ?created_at:(created_at_ : date option) ?account_id:(account_id_ : xml_string_max_len256 option)
    ?execution_role_arn:(execution_role_arn_ : iam_role_arn option)
    ?release_label:(release_label_ : xml_string_max_len256 option)
    ?state_change_reason:(state_change_reason_ : xml_string option)
    ?name:(name_ : xml_string_max_len256 option) ~state:(state_ : session_state)
    ~arn:(arn_ : arn_type) ~cluster_id:(cluster_id_ : cluster_id) ~id:(id_ : session_id) () =
  ({
     tags = tags_;
     server_url = server_url_;
     certificate_authority = certificate_authority_;
     session_idle_timeout_in_minutes = session_idle_timeout_in_minutes_;
     monitoring_configuration = monitoring_configuration_;
     engine_configurations = engine_configurations_;
     idle_since = idle_since_;
     ended_at = ended_at_;
     started_at = started_at_;
     updated_at = updated_at_;
     created_at = created_at_;
     account_id = account_id_;
     execution_role_arn = execution_role_arn_;
     release_label = release_label_;
     state_change_reason = state_change_reason_;
     state = state_;
     arn = arn_;
     name = name_;
     cluster_id = cluster_id_;
     id = id_;
   }
    : session)

let make_security_configuration_summary ?creation_date_time:(creation_date_time_ : date option)
    ?name:(name_ : xml_string option) () =
  ({ creation_date_time = creation_date_time_; name = name_ } : security_configuration_summary)

let make_script_bootstrap_action_config ?args:(args_ : xml_string_list option)
    ~path:(path_ : xml_string) () =
  ({ args = args_; path = path_ } : script_bootstrap_action_config)

let make_metric_dimension ?value:(value_ : string_ option) ?key:(key_ : string_ option) () =
  ({ value = value_; key = key_ } : metric_dimension)

let make_cloud_watch_alarm_definition ?dimensions:(dimensions_ : metric_dimension_list option)
    ?unit_:(unit__ : unit_ option) ?statistic:(statistic_ : statistic option)
    ?namespace:(namespace_ : string_ option)
    ?evaluation_periods:(evaluation_periods_ : integer option)
    ~threshold:(threshold_ : non_negative_double) ~period:(period_ : integer)
    ~metric_name:(metric_name_ : string_)
    ~comparison_operator:(comparison_operator_ : comparison_operator) () =
  ({
     dimensions = dimensions_;
     unit_ = unit__;
     threshold = threshold_;
     statistic = statistic_;
     period = period_;
     namespace = namespace_;
     metric_name = metric_name_;
     evaluation_periods = evaluation_periods_;
     comparison_operator = comparison_operator_;
   }
    : cloud_watch_alarm_definition)

let make_scaling_trigger
    ~cloud_watch_alarm_definition:(cloud_watch_alarm_definition_ : cloud_watch_alarm_definition) ()
    =
  ({ cloud_watch_alarm_definition = cloud_watch_alarm_definition_ } : scaling_trigger)

let make_scaling_action ?market:(market_ : market_type option)
    ~simple_scaling_policy_configuration:
      (simple_scaling_policy_configuration_ : simple_scaling_policy_configuration) () =
  ({ simple_scaling_policy_configuration = simple_scaling_policy_configuration_; market = market_ }
    : scaling_action)

let make_scaling_rule ?description:(description_ : string_ option)
    ~trigger:(trigger_ : scaling_trigger) ~action:(action_ : scaling_action) ~name:(name_ : string_)
    () =
  ({ trigger = trigger_; action = action_; description = description_; name = name_ }
    : scaling_rule)

let make_scaling_constraints ~max_capacity:(max_capacity_ : integer)
    ~min_capacity:(min_capacity_ : integer) () =
  ({ max_capacity = max_capacity_; min_capacity = min_capacity_ } : scaling_constraints)

let make_s3_logging_configuration
    ?log_type_upload_policy:(log_type_upload_policy_ : log_type_map option) () =
  ({ log_type_upload_policy = log_type_upload_policy_ } : s3_logging_configuration)

let make_run_job_flow_output ?cluster_arn:(cluster_arn_ : arn_type option)
    ?job_flow_id:(job_flow_id_ : xml_string_max_len256 option) () =
  ({ cluster_arn = cluster_arn_; job_flow_id = job_flow_id_ } : run_job_flow_output)

let make_ebs_block_device_config ?volumes_per_instance:(volumes_per_instance_ : integer option)
    ~volume_specification:(volume_specification_ : volume_specification) () =
  ({ volumes_per_instance = volumes_per_instance_; volume_specification = volume_specification_ }
    : ebs_block_device_config)

let make_ebs_configuration ?ebs_optimized:(ebs_optimized_ : boolean_object option)
    ?ebs_block_device_configs:(ebs_block_device_configs_ : ebs_block_device_config_list option) () =
  ({ ebs_optimized = ebs_optimized_; ebs_block_device_configs = ebs_block_device_configs_ }
    : ebs_configuration)

let make_auto_scaling_policy ~rules:(rules_ : scaling_rule_list)
    ~constraints:(constraints_ : scaling_constraints) () =
  ({ rules = rules_; constraints = constraints_ } : auto_scaling_policy)

let make_instance_group_config ?custom_ami_id:(custom_ami_id_ : xml_string_max_len256 option)
    ?auto_scaling_policy:(auto_scaling_policy_ : auto_scaling_policy option)
    ?ebs_configuration:(ebs_configuration_ : ebs_configuration option)
    ?configurations:(configurations_ : configuration_list option)
    ?bid_price:(bid_price_ : xml_string_max_len256 option) ?market:(market_ : market_type option)
    ?name:(name_ : xml_string_max_len256 option) ~instance_count:(instance_count_ : integer)
    ~instance_type:(instance_type_ : instance_type)
    ~instance_role:(instance_role_ : instance_role_type) () =
  ({
     custom_ami_id = custom_ami_id_;
     auto_scaling_policy = auto_scaling_policy_;
     ebs_configuration = ebs_configuration_;
     configurations = configurations_;
     instance_count = instance_count_;
     instance_type = instance_type_;
     bid_price = bid_price_;
     instance_role = instance_role_;
     market = market_;
     name = name_;
   }
    : instance_group_config)

let make_instance_type_config ?priority:(priority_ : non_negative_double option)
    ?custom_ami_id:(custom_ami_id_ : xml_string_max_len256 option)
    ?configurations:(configurations_ : configuration_list option)
    ?ebs_configuration:(ebs_configuration_ : ebs_configuration option)
    ?bid_price_as_percentage_of_on_demand_price:
      (bid_price_as_percentage_of_on_demand_price_ : non_negative_double option)
    ?bid_price:(bid_price_ : xml_string_max_len256 option)
    ?weighted_capacity:(weighted_capacity_ : whole_number option)
    ~instance_type:(instance_type_ : instance_type) () =
  ({
     priority = priority_;
     custom_ami_id = custom_ami_id_;
     configurations = configurations_;
     ebs_configuration = ebs_configuration_;
     bid_price_as_percentage_of_on_demand_price = bid_price_as_percentage_of_on_demand_price_;
     bid_price = bid_price_;
     weighted_capacity = weighted_capacity_;
     instance_type = instance_type_;
   }
    : instance_type_config)

let make_on_demand_capacity_reservation_options
    ?capacity_reservation_resource_group_arn:
      (capacity_reservation_resource_group_arn_ : xml_string_max_len256 option)
    ?capacity_reservation_preference:
      (capacity_reservation_preference_ : on_demand_capacity_reservation_preference option)
    ?usage_strategy:(usage_strategy_ : on_demand_capacity_reservation_usage_strategy option) () =
  ({
     capacity_reservation_resource_group_arn = capacity_reservation_resource_group_arn_;
     capacity_reservation_preference = capacity_reservation_preference_;
     usage_strategy = usage_strategy_;
   }
    : on_demand_capacity_reservation_options)

let make_on_demand_provisioning_specification
    ?capacity_reservation_options:
      (capacity_reservation_options_ : on_demand_capacity_reservation_options option)
    ~allocation_strategy:(allocation_strategy_ : on_demand_provisioning_allocation_strategy) () =
  ({
     capacity_reservation_options = capacity_reservation_options_;
     allocation_strategy = allocation_strategy_;
   }
    : on_demand_provisioning_specification)

let make_instance_fleet_provisioning_specifications
    ?on_demand_specification:
      (on_demand_specification_ : on_demand_provisioning_specification option)
    ?spot_specification:(spot_specification_ : spot_provisioning_specification option) () =
  ({ on_demand_specification = on_demand_specification_; spot_specification = spot_specification_ }
    : instance_fleet_provisioning_specifications)

let make_on_demand_resizing_specification
    ?capacity_reservation_options:
      (capacity_reservation_options_ : on_demand_capacity_reservation_options option)
    ?allocation_strategy:(allocation_strategy_ : on_demand_provisioning_allocation_strategy option)
    ?timeout_duration_minutes:(timeout_duration_minutes_ : whole_number option) () =
  ({
     capacity_reservation_options = capacity_reservation_options_;
     allocation_strategy = allocation_strategy_;
     timeout_duration_minutes = timeout_duration_minutes_;
   }
    : on_demand_resizing_specification)

let make_instance_fleet_resizing_specifications
    ?on_demand_resize_specification:
      (on_demand_resize_specification_ : on_demand_resizing_specification option)
    ?spot_resize_specification:(spot_resize_specification_ : spot_resizing_specification option) ()
    =
  ({
     on_demand_resize_specification = on_demand_resize_specification_;
     spot_resize_specification = spot_resize_specification_;
   }
    : instance_fleet_resizing_specifications)

let make_instance_fleet_config ?context:(context_ : xml_string_max_len256 option)
    ?resize_specifications:(resize_specifications_ : instance_fleet_resizing_specifications option)
    ?launch_specifications:
      (launch_specifications_ : instance_fleet_provisioning_specifications option)
    ?instance_type_configs:(instance_type_configs_ : instance_type_config_list option)
    ?target_spot_capacity:(target_spot_capacity_ : whole_number option)
    ?target_on_demand_capacity:(target_on_demand_capacity_ : whole_number option)
    ?name:(name_ : xml_string_max_len256 option)
    ~instance_fleet_type:(instance_fleet_type_ : instance_fleet_type) () =
  ({
     context = context_;
     resize_specifications = resize_specifications_;
     launch_specifications = launch_specifications_;
     instance_type_configs = instance_type_configs_;
     target_spot_capacity = target_spot_capacity_;
     target_on_demand_capacity = target_on_demand_capacity_;
     instance_fleet_type = instance_fleet_type_;
     name = name_;
   }
    : instance_fleet_config)

let make_placement_type
    ?availability_zones:(availability_zones_ : xml_string_max_len256_list option)
    ?availability_zone:(availability_zone_ : xml_string option) () =
  ({ availability_zones = availability_zones_; availability_zone = availability_zone_ }
    : placement_type)

let make_job_flow_instances_config
    ?additional_slave_security_groups:
      (additional_slave_security_groups_ : security_groups_list option)
    ?additional_master_security_groups:
      (additional_master_security_groups_ : security_groups_list option)
    ?service_access_security_group:(service_access_security_group_ : xml_string_max_len256 option)
    ?emr_managed_slave_security_group:
      (emr_managed_slave_security_group_ : xml_string_max_len256 option)
    ?emr_managed_master_security_group:
      (emr_managed_master_security_group_ : xml_string_max_len256 option)
    ?ec2_subnet_ids:(ec2_subnet_ids_ : xml_string_max_len256_list option)
    ?ec2_subnet_id:(ec2_subnet_id_ : xml_string_max_len256 option)
    ?hadoop_version:(hadoop_version_ : xml_string_max_len256 option)
    ?unhealthy_node_replacement:(unhealthy_node_replacement_ : boolean_object option)
    ?termination_protected:(termination_protected_ : boolean_ option)
    ?keep_job_flow_alive_when_no_steps:(keep_job_flow_alive_when_no_steps_ : boolean_ option)
    ?placement:(placement_ : placement_type option)
    ?ec2_key_name:(ec2_key_name_ : xml_string_max_len256 option)
    ?instance_fleets:(instance_fleets_ : instance_fleet_config_list option)
    ?instance_groups:(instance_groups_ : instance_group_config_list option)
    ?instance_count:(instance_count_ : integer option)
    ?slave_instance_type:(slave_instance_type_ : instance_type option)
    ?master_instance_type:(master_instance_type_ : instance_type option) () =
  ({
     additional_slave_security_groups = additional_slave_security_groups_;
     additional_master_security_groups = additional_master_security_groups_;
     service_access_security_group = service_access_security_group_;
     emr_managed_slave_security_group = emr_managed_slave_security_group_;
     emr_managed_master_security_group = emr_managed_master_security_group_;
     ec2_subnet_ids = ec2_subnet_ids_;
     ec2_subnet_id = ec2_subnet_id_;
     hadoop_version = hadoop_version_;
     unhealthy_node_replacement = unhealthy_node_replacement_;
     termination_protected = termination_protected_;
     keep_job_flow_alive_when_no_steps = keep_job_flow_alive_when_no_steps_;
     placement = placement_;
     ec2_key_name = ec2_key_name_;
     instance_fleets = instance_fleets_;
     instance_groups = instance_groups_;
     instance_count = instance_count_;
     slave_instance_type = slave_instance_type_;
     master_instance_type = master_instance_type_;
   }
    : job_flow_instances_config)

let make_bootstrap_action_config
    ~script_bootstrap_action:(script_bootstrap_action_ : script_bootstrap_action_config)
    ~name:(name_ : xml_string_max_len256) () =
  ({ script_bootstrap_action = script_bootstrap_action_; name = name_ } : bootstrap_action_config)

let make_application ?additional_info:(additional_info_ : string_map option)
    ?args:(args_ : string_list option) ?version:(version_ : string_ option)
    ?name:(name_ : string_ option) () =
  ({ additional_info = additional_info_; args = args_; version = version_; name = name_ }
    : application)

let make_kerberos_attributes
    ?ad_domain_join_password:(ad_domain_join_password_ : xml_string_max_len256 option)
    ?ad_domain_join_user:(ad_domain_join_user_ : xml_string_max_len256 option)
    ?cross_realm_trust_principal_password:
      (cross_realm_trust_principal_password_ : xml_string_max_len256 option)
    ~kdc_admin_password:(kdc_admin_password_ : xml_string_max_len256)
    ~realm:(realm_ : xml_string_max_len256) () =
  ({
     ad_domain_join_password = ad_domain_join_password_;
     ad_domain_join_user = ad_domain_join_user_;
     cross_realm_trust_principal_password = cross_realm_trust_principal_password_;
     kdc_admin_password = kdc_admin_password_;
     realm = realm_;
   }
    : kerberos_attributes)

let make_compute_limits ?maximum_core_capacity_units:(maximum_core_capacity_units_ : integer option)
    ?maximum_on_demand_capacity_units:(maximum_on_demand_capacity_units_ : integer option)
    ~maximum_capacity_units:(maximum_capacity_units_ : integer)
    ~minimum_capacity_units:(minimum_capacity_units_ : integer)
    ~unit_type:(unit_type_ : compute_limits_unit_type) () =
  ({
     maximum_core_capacity_units = maximum_core_capacity_units_;
     maximum_on_demand_capacity_units = maximum_on_demand_capacity_units_;
     maximum_capacity_units = maximum_capacity_units_;
     minimum_capacity_units = minimum_capacity_units_;
     unit_type = unit_type_;
   }
    : compute_limits)

let make_managed_scaling_policy ?scaling_strategy:(scaling_strategy_ : scaling_strategy option)
    ?utilization_performance_index:
      (utilization_performance_index_ : utilization_performance_index_integer option)
    ?compute_limits:(compute_limits_ : compute_limits option) () =
  ({
     scaling_strategy = scaling_strategy_;
     utilization_performance_index = utilization_performance_index_;
     compute_limits = compute_limits_;
   }
    : managed_scaling_policy)

let make_placement_group_config
    ?placement_strategy:(placement_strategy_ : placement_group_strategy option)
    ~instance_role:(instance_role_ : instance_role_type) () =
  ({ placement_strategy = placement_strategy_; instance_role = instance_role_ }
    : placement_group_config)

let make_auto_termination_policy ?idle_timeout:(idle_timeout_ : long option) () =
  ({ idle_timeout = idle_timeout_ } : auto_termination_policy)

let make_cloud_watch_log_configuration ?log_types:(log_types_ : log_types_map option)
    ?encryption_key_arn:(encryption_key_arn_ : xml_string option)
    ?log_stream_name_prefix:(log_stream_name_prefix_ : xml_string option)
    ?log_group_name:(log_group_name_ : xml_string option) ~enabled:(enabled_ : boolean_) () =
  ({
     log_types = log_types_;
     encryption_key_arn = encryption_key_arn_;
     log_stream_name_prefix = log_stream_name_prefix_;
     log_group_name = log_group_name_;
     enabled = enabled_;
   }
    : cloud_watch_log_configuration)

let make_monitoring_configuration
    ?s3_logging_configuration:(s3_logging_configuration_ : s3_logging_configuration option)
    ?cloud_watch_log_configuration:
      (cloud_watch_log_configuration_ : cloud_watch_log_configuration option) () =
  ({
     s3_logging_configuration = s3_logging_configuration_;
     cloud_watch_log_configuration = cloud_watch_log_configuration_;
   }
    : monitoring_configuration)

let make_run_job_flow_input ?session_enabled:(session_enabled_ : boolean_object option)
    ?monitoring_configuration:(monitoring_configuration_ : monitoring_configuration option)
    ?extended_support:(extended_support_ : boolean_object option)
    ?ebs_root_volume_throughput:(ebs_root_volume_throughput_ : integer option)
    ?ebs_root_volume_iops:(ebs_root_volume_iops_ : integer option)
    ?os_release_label:(os_release_label_ : xml_string_max_len256 option)
    ?auto_termination_policy:(auto_termination_policy_ : auto_termination_policy option)
    ?placement_group_configs:(placement_group_configs_ : placement_group_config_list option)
    ?managed_scaling_policy:(managed_scaling_policy_ : managed_scaling_policy option)
    ?step_concurrency_level:(step_concurrency_level_ : integer option)
    ?kerberos_attributes:(kerberos_attributes_ : kerberos_attributes option)
    ?repo_upgrade_on_boot:(repo_upgrade_on_boot_ : repo_upgrade_on_boot option)
    ?ebs_root_volume_size:(ebs_root_volume_size_ : integer option)
    ?custom_ami_id:(custom_ami_id_ : xml_string_max_len256 option)
    ?scale_down_behavior:(scale_down_behavior_ : scale_down_behavior option)
    ?auto_scaling_role:(auto_scaling_role_ : xml_string option)
    ?security_configuration:(security_configuration_ : xml_string option)
    ?tags:(tags_ : tag_list option) ?service_role:(service_role_ : xml_string option)
    ?job_flow_role:(job_flow_role_ : xml_string option)
    ?visible_to_all_users:(visible_to_all_users_ : boolean_ option)
    ?configurations:(configurations_ : configuration_list option)
    ?applications:(applications_ : application_list option)
    ?new_supported_products:(new_supported_products_ : new_supported_products_list option)
    ?supported_products:(supported_products_ : supported_products_list option)
    ?bootstrap_actions:(bootstrap_actions_ : bootstrap_action_config_list option)
    ?step_execution_role_arn:(step_execution_role_arn_ : arn_type option)
    ?steps:(steps_ : step_config_list option)
    ?release_label:(release_label_ : xml_string_max_len256 option)
    ?ami_version:(ami_version_ : xml_string_max_len256 option)
    ?additional_info:(additional_info_ : xml_string option)
    ?log_encryption_kms_key_id:(log_encryption_kms_key_id_ : xml_string option)
    ?log_uri:(log_uri_ : xml_string option) ~instances:(instances_ : job_flow_instances_config)
    ~name:(name_ : xml_string_max_len256) () =
  ({
     session_enabled = session_enabled_;
     monitoring_configuration = monitoring_configuration_;
     extended_support = extended_support_;
     ebs_root_volume_throughput = ebs_root_volume_throughput_;
     ebs_root_volume_iops = ebs_root_volume_iops_;
     os_release_label = os_release_label_;
     auto_termination_policy = auto_termination_policy_;
     placement_group_configs = placement_group_configs_;
     managed_scaling_policy = managed_scaling_policy_;
     step_concurrency_level = step_concurrency_level_;
     kerberos_attributes = kerberos_attributes_;
     repo_upgrade_on_boot = repo_upgrade_on_boot_;
     ebs_root_volume_size = ebs_root_volume_size_;
     custom_ami_id = custom_ami_id_;
     scale_down_behavior = scale_down_behavior_;
     auto_scaling_role = auto_scaling_role_;
     security_configuration = security_configuration_;
     tags = tags_;
     service_role = service_role_;
     job_flow_role = job_flow_role_;
     visible_to_all_users = visible_to_all_users_;
     configurations = configurations_;
     applications = applications_;
     new_supported_products = new_supported_products_;
     supported_products = supported_products_;
     bootstrap_actions = bootstrap_actions_;
     step_execution_role_arn = step_execution_role_arn_;
     steps = steps_;
     instances = instances_;
     release_label = release_label_;
     ami_version = ami_version_;
     additional_info = additional_info_;
     log_encryption_kms_key_id = log_encryption_kms_key_id_;
     log_uri = log_uri_;
     name = name_;
   }
    : run_job_flow_input)

let make_remove_tags_output () = (() : unit)

let make_remove_tags_input ?cluster_id:(cluster_id_ : cluster_id option)
    ~tag_keys:(tag_keys_ : string_list) ~resource_id:(resource_id_ : resource_id) () =
  ({ cluster_id = cluster_id_; tag_keys = tag_keys_; resource_id = resource_id_ }
    : remove_tags_input)

let make_remove_managed_scaling_policy_output () = (() : unit)

let make_remove_managed_scaling_policy_input ~cluster_id:(cluster_id_ : cluster_id) () =
  ({ cluster_id = cluster_id_ } : remove_managed_scaling_policy_input)

let make_remove_auto_termination_policy_output () = (() : unit)

let make_remove_auto_termination_policy_input ~cluster_id:(cluster_id_ : cluster_id) () =
  ({ cluster_id = cluster_id_ } : remove_auto_termination_policy_input)

let make_remove_auto_scaling_policy_output () = (() : unit)

let make_remove_auto_scaling_policy_input
    ~instance_group_id:(instance_group_id_ : instance_group_id)
    ~cluster_id:(cluster_id_ : cluster_id) () =
  ({ instance_group_id = instance_group_id_; cluster_id = cluster_id_ }
    : remove_auto_scaling_policy_input)

let make_release_label_filter ?application:(application_ : string_ option)
    ?prefix:(prefix_ : string_ option) () =
  ({ application = application_; prefix = prefix_ } : release_label_filter)

let make_put_managed_scaling_policy_output () = (() : unit)

let make_put_managed_scaling_policy_input
    ~managed_scaling_policy:(managed_scaling_policy_ : managed_scaling_policy)
    ~cluster_id:(cluster_id_ : cluster_id) () =
  ({ managed_scaling_policy = managed_scaling_policy_; cluster_id = cluster_id_ }
    : put_managed_scaling_policy_input)

let make_put_block_public_access_configuration_output () = (() : unit)

let make_port_range ?max_range:(max_range_ : port option) ~min_range:(min_range_ : port) () =
  ({ max_range = max_range_; min_range = min_range_ } : port_range)

let make_block_public_access_configuration ?properties:(properties_ : string_map option)
    ?configurations:(configurations_ : configuration_list option)
    ?classification:(classification_ : string_ option)
    ?permitted_public_security_group_rule_ranges:
      (permitted_public_security_group_rule_ranges_ : port_ranges option)
    ~block_public_security_group_rules:(block_public_security_group_rules_ : boolean_) () =
  ({
     properties = properties_;
     configurations = configurations_;
     classification = classification_;
     permitted_public_security_group_rule_ranges = permitted_public_security_group_rule_ranges_;
     block_public_security_group_rules = block_public_security_group_rules_;
   }
    : block_public_access_configuration)

let make_put_block_public_access_configuration_input
    ~block_public_access_configuration:
      (block_public_access_configuration_ : block_public_access_configuration) () =
  ({ block_public_access_configuration = block_public_access_configuration_ }
    : put_block_public_access_configuration_input)

let make_put_auto_termination_policy_output () = (() : unit)

let make_put_auto_termination_policy_input
    ?auto_termination_policy:(auto_termination_policy_ : auto_termination_policy option)
    ~cluster_id:(cluster_id_ : cluster_id) () =
  ({ auto_termination_policy = auto_termination_policy_; cluster_id = cluster_id_ }
    : put_auto_termination_policy_input)

let make_auto_scaling_policy_state_change_reason ?message:(message_ : string_ option)
    ?code:(code_ : auto_scaling_policy_state_change_reason_code option) () =
  ({ message = message_; code = code_ } : auto_scaling_policy_state_change_reason)

let make_auto_scaling_policy_status
    ?state_change_reason:(state_change_reason_ : auto_scaling_policy_state_change_reason option)
    ?state:(state_ : auto_scaling_policy_state option) () =
  ({ state_change_reason = state_change_reason_; state = state_ } : auto_scaling_policy_status)

let make_auto_scaling_policy_description ?rules:(rules_ : scaling_rule_list option)
    ?constraints:(constraints_ : scaling_constraints option)
    ?status:(status_ : auto_scaling_policy_status option) () =
  ({ rules = rules_; constraints = constraints_; status = status_ }
    : auto_scaling_policy_description)

let make_put_auto_scaling_policy_output ?cluster_arn:(cluster_arn_ : arn_type option)
    ?auto_scaling_policy:(auto_scaling_policy_ : auto_scaling_policy_description option)
    ?instance_group_id:(instance_group_id_ : instance_group_id option)
    ?cluster_id:(cluster_id_ : cluster_id option) () =
  ({
     cluster_arn = cluster_arn_;
     auto_scaling_policy = auto_scaling_policy_;
     instance_group_id = instance_group_id_;
     cluster_id = cluster_id_;
   }
    : put_auto_scaling_policy_output)

let make_put_auto_scaling_policy_input
    ~auto_scaling_policy:(auto_scaling_policy_ : auto_scaling_policy)
    ~instance_group_id:(instance_group_id_ : instance_group_id)
    ~cluster_id:(cluster_id_ : cluster_id) () =
  ({
     auto_scaling_policy = auto_scaling_policy_;
     instance_group_id = instance_group_id_;
     cluster_id = cluster_id_;
   }
    : put_auto_scaling_policy_input)

let make_persistent_app_u_i ?tags:(tags_ : tag_list option)
    ?last_state_change_reason:(last_state_change_reason_ : xml_string option)
    ?last_modified_time:(last_modified_time_ : date option)
    ?creation_time:(creation_time_ : date option)
    ?author_id:(author_id_ : xml_string_max_len256 option)
    ?persistent_app_ui_status:(persistent_app_ui_status_ : xml_string_max_len256 option)
    ?persistent_app_ui_type_list:(persistent_app_ui_type_list_ : persistent_app_ui_type_list option)
    ?persistent_app_ui_id:(persistent_app_ui_id_ : xml_string_max_len256 option) () =
  ({
     tags = tags_;
     last_state_change_reason = last_state_change_reason_;
     last_modified_time = last_modified_time_;
     creation_time = creation_time_;
     author_id = author_id_;
     persistent_app_ui_status = persistent_app_ui_status_;
     persistent_app_ui_type_list = persistent_app_ui_type_list_;
     persistent_app_ui_id = persistent_app_ui_id_;
   }
    : persistent_app_u_i)

let make_output_notebook_s3_location_for_output ?key:(key_ : uri_string option)
    ?bucket:(bucket_ : xml_string_max_len256 option) () =
  ({ key = key_; bucket = bucket_ } : output_notebook_s3_location_for_output)

let make_os_release ?label:(label_ : string_ option) () = ({ label = label_ } : os_release)

let make_notebook_s3_location_for_output ?key:(key_ : uri_string option)
    ?bucket:(bucket_ : xml_string_max_len256 option) () =
  ({ key = key_; bucket = bucket_ } : notebook_s3_location_for_output)

let make_notebook_execution_summary ?execution_engine_id:(execution_engine_id_ : xml_string option)
    ?notebook_s3_location:(notebook_s3_location_ : notebook_s3_location_for_output option)
    ?end_time:(end_time_ : date option) ?start_time:(start_time_ : date option)
    ?status:(status_ : notebook_execution_status option)
    ?notebook_execution_name:(notebook_execution_name_ : xml_string_max_len256 option)
    ?editor_id:(editor_id_ : xml_string_max_len256 option)
    ?notebook_execution_id:(notebook_execution_id_ : xml_string_max_len256 option) () =
  ({
     execution_engine_id = execution_engine_id_;
     notebook_s3_location = notebook_s3_location_;
     end_time = end_time_;
     start_time = start_time_;
     status = status_;
     notebook_execution_name = notebook_execution_name_;
     editor_id = editor_id_;
     notebook_execution_id = notebook_execution_id_;
   }
    : notebook_execution_summary)

let make_notebook_execution
    ?environment_variables:(environment_variables_ : environment_variables_map option)
    ?output_notebook_format:(output_notebook_format_ : output_notebook_format option)
    ?output_notebook_s3_location:
      (output_notebook_s3_location_ : output_notebook_s3_location_for_output option)
    ?notebook_s3_location:(notebook_s3_location_ : notebook_s3_location_for_output option)
    ?tags:(tags_ : tag_list option)
    ?notebook_instance_security_group_id:
      (notebook_instance_security_group_id_ : xml_string_max_len256 option)
    ?last_state_change_reason:(last_state_change_reason_ : xml_string option)
    ?output_notebook_ur_i:(output_notebook_ur_i_ : xml_string option)
    ?arn:(arn_ : xml_string_max_len256 option) ?end_time:(end_time_ : date option)
    ?start_time:(start_time_ : date option) ?status:(status_ : notebook_execution_status option)
    ?notebook_params:(notebook_params_ : xml_string option)
    ?notebook_execution_name:(notebook_execution_name_ : xml_string_max_len256 option)
    ?execution_engine:(execution_engine_ : execution_engine_config option)
    ?editor_id:(editor_id_ : xml_string_max_len256 option)
    ?notebook_execution_id:(notebook_execution_id_ : xml_string_max_len256 option) () =
  ({
     environment_variables = environment_variables_;
     output_notebook_format = output_notebook_format_;
     output_notebook_s3_location = output_notebook_s3_location_;
     notebook_s3_location = notebook_s3_location_;
     tags = tags_;
     notebook_instance_security_group_id = notebook_instance_security_group_id_;
     last_state_change_reason = last_state_change_reason_;
     output_notebook_ur_i = output_notebook_ur_i_;
     arn = arn_;
     end_time = end_time_;
     start_time = start_time_;
     status = status_;
     notebook_params = notebook_params_;
     notebook_execution_name = notebook_execution_name_;
     execution_engine = execution_engine_;
     editor_id = editor_id_;
     notebook_execution_id = notebook_execution_id_;
   }
    : notebook_execution)

let make_instance_group_modify_config ?configurations:(configurations_ : configuration_list option)
    ?reconfiguration_type:(reconfiguration_type_ : reconfiguration_type option)
    ?shrink_policy:(shrink_policy_ : shrink_policy option)
    ?ec2_instance_ids_to_terminate:
      (ec2_instance_ids_to_terminate_ : ec2_instance_ids_to_terminate_list option)
    ?instance_count:(instance_count_ : integer option)
    ~instance_group_id:(instance_group_id_ : xml_string_max_len256) () =
  ({
     configurations = configurations_;
     reconfiguration_type = reconfiguration_type_;
     shrink_policy = shrink_policy_;
     ec2_instance_ids_to_terminate = ec2_instance_ids_to_terminate_;
     instance_count = instance_count_;
     instance_group_id = instance_group_id_;
   }
    : instance_group_modify_config)

let make_modify_instance_groups_input
    ?instance_groups:(instance_groups_ : instance_group_modify_config_list option)
    ?cluster_id:(cluster_id_ : cluster_id option) () =
  ({ instance_groups = instance_groups_; cluster_id = cluster_id_ } : modify_instance_groups_input)

let make_instance_fleet_modify_config ?context:(context_ : xml_string_max_len256 option)
    ?instance_type_configs:(instance_type_configs_ : instance_type_config_list option)
    ?resize_specifications:(resize_specifications_ : instance_fleet_resizing_specifications option)
    ?target_spot_capacity:(target_spot_capacity_ : whole_number option)
    ?target_on_demand_capacity:(target_on_demand_capacity_ : whole_number option)
    ~instance_fleet_id:(instance_fleet_id_ : instance_fleet_id) () =
  ({
     context = context_;
     instance_type_configs = instance_type_configs_;
     resize_specifications = resize_specifications_;
     target_spot_capacity = target_spot_capacity_;
     target_on_demand_capacity = target_on_demand_capacity_;
     instance_fleet_id = instance_fleet_id_;
   }
    : instance_fleet_modify_config)

let make_modify_instance_fleet_input
    ~instance_fleet:(instance_fleet_ : instance_fleet_modify_config)
    ~cluster_id:(cluster_id_ : cluster_id) () =
  ({ instance_fleet = instance_fleet_; cluster_id = cluster_id_ } : modify_instance_fleet_input)

let make_modify_cluster_output ?extended_support:(extended_support_ : boolean_object option)
    ?step_concurrency_level:(step_concurrency_level_ : integer option) () =
  ({ extended_support = extended_support_; step_concurrency_level = step_concurrency_level_ }
    : modify_cluster_output)

let make_modify_cluster_input ?extended_support:(extended_support_ : boolean_object option)
    ?step_concurrency_level:(step_concurrency_level_ : integer option)
    ~cluster_id:(cluster_id_ : string_) () =
  ({
     extended_support = extended_support_;
     step_concurrency_level = step_concurrency_level_;
     cluster_id = cluster_id_;
   }
    : modify_cluster_input)

let make_list_supported_instance_types_output ?marker:(marker_ : string_ option)
    ?supported_instance_types:(supported_instance_types_ : supported_instance_types_list option) ()
    =
  ({ marker = marker_; supported_instance_types = supported_instance_types_ }
    : list_supported_instance_types_output)

let make_list_supported_instance_types_input ?marker:(marker_ : string_ option)
    ~release_label:(release_label_ : string_) () =
  ({ marker = marker_; release_label = release_label_ } : list_supported_instance_types_input)

let make_list_studios_output ?marker:(marker_ : marker option)
    ?studios:(studios_ : studio_summary_list option) () =
  ({ marker = marker_; studios = studios_ } : list_studios_output)

let make_list_studios_input ?marker:(marker_ : marker option) () =
  ({ marker = marker_ } : list_studios_input)

let make_list_studio_session_mappings_output ?marker:(marker_ : marker option)
    ?session_mappings:(session_mappings_ : session_mapping_summary_list option) () =
  ({ marker = marker_; session_mappings = session_mappings_ } : list_studio_session_mappings_output)

let make_list_studio_session_mappings_input ?marker:(marker_ : marker option)
    ?identity_type:(identity_type_ : identity_type option)
    ?studio_id:(studio_id_ : xml_string_max_len256 option) () =
  ({ marker = marker_; identity_type = identity_type_; studio_id = studio_id_ }
    : list_studio_session_mappings_input)

let make_list_steps_output ?marker:(marker_ : marker option)
    ?steps:(steps_ : step_summary_list option) () =
  ({ marker = marker_; steps = steps_ } : list_steps_output)

let make_list_steps_input ?marker:(marker_ : marker option)
    ?step_ids:(step_ids_ : xml_string_list option)
    ?step_states:(step_states_ : step_state_list option) ~cluster_id:(cluster_id_ : cluster_id) () =
  ({ marker = marker_; step_ids = step_ids_; step_states = step_states_; cluster_id = cluster_id_ }
    : list_steps_input)

let make_list_sessions_output ?next_token:(next_token_ : string_ option)
    ?sessions:(sessions_ : session_list option) () =
  ({ next_token = next_token_; sessions = sessions_ } : list_sessions_output)

let make_list_sessions_input ?max_results:(max_results_ : max_results_number option)
    ?next_token:(next_token_ : string_ option)
    ?session_states:(session_states_ : session_state_list option)
    ~cluster_id:(cluster_id_ : cluster_id) () =
  ({
     max_results = max_results_;
     next_token = next_token_;
     session_states = session_states_;
     cluster_id = cluster_id_;
   }
    : list_sessions_input)

let make_list_security_configurations_output ?marker:(marker_ : marker option)
    ?security_configurations:(security_configurations_ : security_configuration_list option) () =
  ({ marker = marker_; security_configurations = security_configurations_ }
    : list_security_configurations_output)

let make_list_security_configurations_input ?marker:(marker_ : marker option) () =
  ({ marker = marker_ } : list_security_configurations_input)

let make_list_release_labels_output ?next_token:(next_token_ : string_ option)
    ?release_labels:(release_labels_ : string_list option) () =
  ({ next_token = next_token_; release_labels = release_labels_ } : list_release_labels_output)

let make_list_release_labels_input ?max_results:(max_results_ : max_results_number option)
    ?next_token:(next_token_ : string_ option) ?filters:(filters_ : release_label_filter option) ()
    =
  ({ max_results = max_results_; next_token = next_token_; filters = filters_ }
    : list_release_labels_input)

let make_list_notebook_executions_output ?marker:(marker_ : marker option)
    ?notebook_executions:(notebook_executions_ : notebook_execution_summary_list option) () =
  ({ marker = marker_; notebook_executions = notebook_executions_ }
    : list_notebook_executions_output)

let make_list_notebook_executions_input
    ?execution_engine_id:(execution_engine_id_ : xml_string option)
    ?marker:(marker_ : marker option) ?to_:(to__ : date option) ?from_:(from__ : date option)
    ?status:(status_ : notebook_execution_status option)
    ?editor_id:(editor_id_ : xml_string_max_len256 option) () =
  ({
     execution_engine_id = execution_engine_id_;
     marker = marker_;
     to_ = to__;
     from_ = from__;
     status = status_;
     editor_id = editor_id_;
   }
    : list_notebook_executions_input)

let make_instance_state_change_reason ?message:(message_ : string_ option)
    ?code:(code_ : instance_state_change_reason_code option) () =
  ({ message = message_; code = code_ } : instance_state_change_reason)

let make_instance_timeline ?end_date_time:(end_date_time_ : date option)
    ?ready_date_time:(ready_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option) () =
  ({
     end_date_time = end_date_time_;
     ready_date_time = ready_date_time_;
     creation_date_time = creation_date_time_;
   }
    : instance_timeline)

let make_instance_status ?timeline:(timeline_ : instance_timeline option)
    ?state_change_reason:(state_change_reason_ : instance_state_change_reason option)
    ?state:(state_ : instance_state option) () =
  ({ timeline = timeline_; state_change_reason = state_change_reason_; state = state_ }
    : instance_status)

let make_ebs_volume ?volume_id:(volume_id_ : string_ option) ?device:(device_ : string_ option) () =
  ({ volume_id = volume_id_; device = device_ } : ebs_volume)

let make_instance ?ebs_volumes:(ebs_volumes_ : ebs_volume_list option)
    ?instance_type:(instance_type_ : instance_type option) ?market:(market_ : market_type option)
    ?instance_fleet_id:(instance_fleet_id_ : instance_fleet_id option)
    ?instance_group_id:(instance_group_id_ : string_ option)
    ?status:(status_ : instance_status option)
    ?private_ip_address:(private_ip_address_ : string_ option)
    ?private_dns_name:(private_dns_name_ : string_ option)
    ?public_ip_address:(public_ip_address_ : string_ option)
    ?public_dns_name:(public_dns_name_ : string_ option)
    ?ec2_instance_id:(ec2_instance_id_ : instance_id option) ?id:(id_ : instance_id option) () =
  ({
     ebs_volumes = ebs_volumes_;
     instance_type = instance_type_;
     market = market_;
     instance_fleet_id = instance_fleet_id_;
     instance_group_id = instance_group_id_;
     status = status_;
     private_ip_address = private_ip_address_;
     private_dns_name = private_dns_name_;
     public_ip_address = public_ip_address_;
     public_dns_name = public_dns_name_;
     ec2_instance_id = ec2_instance_id_;
     id = id_;
   }
    : instance)

let make_list_instances_output ?marker:(marker_ : marker option)
    ?instances:(instances_ : instance_list option) () =
  ({ marker = marker_; instances = instances_ } : list_instances_output)

let make_list_instances_input ?marker:(marker_ : marker option)
    ?instance_states:(instance_states_ : instance_state_list option)
    ?instance_fleet_type:(instance_fleet_type_ : instance_fleet_type option)
    ?instance_fleet_id:(instance_fleet_id_ : instance_fleet_id option)
    ?instance_group_types:(instance_group_types_ : instance_group_type_list option)
    ?instance_group_id:(instance_group_id_ : instance_group_id option)
    ~cluster_id:(cluster_id_ : cluster_id) () =
  ({
     marker = marker_;
     instance_states = instance_states_;
     instance_fleet_type = instance_fleet_type_;
     instance_fleet_id = instance_fleet_id_;
     instance_group_types = instance_group_types_;
     instance_group_id = instance_group_id_;
     cluster_id = cluster_id_;
   }
    : list_instances_input)

let make_instance_group_state_change_reason ?message:(message_ : string_ option)
    ?code:(code_ : instance_group_state_change_reason_code option) () =
  ({ message = message_; code = code_ } : instance_group_state_change_reason)

let make_instance_group_timeline ?end_date_time:(end_date_time_ : date option)
    ?ready_date_time:(ready_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option) () =
  ({
     end_date_time = end_date_time_;
     ready_date_time = ready_date_time_;
     creation_date_time = creation_date_time_;
   }
    : instance_group_timeline)

let make_instance_group_status ?timeline:(timeline_ : instance_group_timeline option)
    ?state_change_reason:(state_change_reason_ : instance_group_state_change_reason option)
    ?state:(state_ : instance_group_state option) () =
  ({ timeline = timeline_; state_change_reason = state_change_reason_; state = state_ }
    : instance_group_status)

let make_ebs_block_device ?device:(device_ : string_ option)
    ?volume_specification:(volume_specification_ : volume_specification option) () =
  ({ device = device_; volume_specification = volume_specification_ } : ebs_block_device)

let make_instance_group ?custom_ami_id:(custom_ami_id_ : xml_string_max_len256 option)
    ?auto_scaling_policy:(auto_scaling_policy_ : auto_scaling_policy_description option)
    ?shrink_policy:(shrink_policy_ : shrink_policy option)
    ?ebs_optimized:(ebs_optimized_ : boolean_object option)
    ?ebs_block_devices:(ebs_block_devices_ : ebs_block_device_list option)
    ?last_successfully_applied_configurations_version:
      (last_successfully_applied_configurations_version_ : long option)
    ?last_successfully_applied_configurations:
      (last_successfully_applied_configurations_ : configuration_list option)
    ?configurations_version:(configurations_version_ : long option)
    ?configurations:(configurations_ : configuration_list option)
    ?status:(status_ : instance_group_status option)
    ?running_instance_count:(running_instance_count_ : integer option)
    ?requested_instance_count:(requested_instance_count_ : integer option)
    ?instance_type:(instance_type_ : instance_type option) ?bid_price:(bid_price_ : string_ option)
    ?instance_group_type:(instance_group_type_ : instance_group_type option)
    ?market:(market_ : market_type option) ?name:(name_ : string_ option)
    ?id:(id_ : instance_group_id option) () =
  ({
     custom_ami_id = custom_ami_id_;
     auto_scaling_policy = auto_scaling_policy_;
     shrink_policy = shrink_policy_;
     ebs_optimized = ebs_optimized_;
     ebs_block_devices = ebs_block_devices_;
     last_successfully_applied_configurations_version =
       last_successfully_applied_configurations_version_;
     last_successfully_applied_configurations = last_successfully_applied_configurations_;
     configurations_version = configurations_version_;
     configurations = configurations_;
     status = status_;
     running_instance_count = running_instance_count_;
     requested_instance_count = requested_instance_count_;
     instance_type = instance_type_;
     bid_price = bid_price_;
     instance_group_type = instance_group_type_;
     market = market_;
     name = name_;
     id = id_;
   }
    : instance_group)

let make_list_instance_groups_output ?marker:(marker_ : marker option)
    ?instance_groups:(instance_groups_ : instance_group_list option) () =
  ({ marker = marker_; instance_groups = instance_groups_ } : list_instance_groups_output)

let make_list_instance_groups_input ?marker:(marker_ : marker option)
    ~cluster_id:(cluster_id_ : cluster_id) () =
  ({ marker = marker_; cluster_id = cluster_id_ } : list_instance_groups_input)

let make_instance_fleet_state_change_reason ?message:(message_ : string_ option)
    ?code:(code_ : instance_fleet_state_change_reason_code option) () =
  ({ message = message_; code = code_ } : instance_fleet_state_change_reason)

let make_instance_fleet_timeline ?end_date_time:(end_date_time_ : date option)
    ?ready_date_time:(ready_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option) () =
  ({
     end_date_time = end_date_time_;
     ready_date_time = ready_date_time_;
     creation_date_time = creation_date_time_;
   }
    : instance_fleet_timeline)

let make_instance_fleet_status ?timeline:(timeline_ : instance_fleet_timeline option)
    ?state_change_reason:(state_change_reason_ : instance_fleet_state_change_reason option)
    ?state:(state_ : instance_fleet_state option) () =
  ({ timeline = timeline_; state_change_reason = state_change_reason_; state = state_ }
    : instance_fleet_status)

let make_instance_type_specification ?priority:(priority_ : non_negative_double option)
    ?custom_ami_id:(custom_ami_id_ : xml_string_max_len256 option)
    ?ebs_optimized:(ebs_optimized_ : boolean_object option)
    ?ebs_block_devices:(ebs_block_devices_ : ebs_block_device_list option)
    ?configurations:(configurations_ : configuration_list option)
    ?bid_price_as_percentage_of_on_demand_price:
      (bid_price_as_percentage_of_on_demand_price_ : non_negative_double option)
    ?bid_price:(bid_price_ : xml_string_max_len256 option)
    ?weighted_capacity:(weighted_capacity_ : whole_number option)
    ?instance_type:(instance_type_ : instance_type option) () =
  ({
     priority = priority_;
     custom_ami_id = custom_ami_id_;
     ebs_optimized = ebs_optimized_;
     ebs_block_devices = ebs_block_devices_;
     configurations = configurations_;
     bid_price_as_percentage_of_on_demand_price = bid_price_as_percentage_of_on_demand_price_;
     bid_price = bid_price_;
     weighted_capacity = weighted_capacity_;
     instance_type = instance_type_;
   }
    : instance_type_specification)

let make_instance_fleet ?context:(context_ : xml_string_max_len256 option)
    ?resize_specifications:(resize_specifications_ : instance_fleet_resizing_specifications option)
    ?launch_specifications:
      (launch_specifications_ : instance_fleet_provisioning_specifications option)
    ?instance_type_specifications:
      (instance_type_specifications_ : instance_type_specification_list option)
    ?provisioned_spot_capacity:(provisioned_spot_capacity_ : whole_number option)
    ?provisioned_on_demand_capacity:(provisioned_on_demand_capacity_ : whole_number option)
    ?target_spot_capacity:(target_spot_capacity_ : whole_number option)
    ?target_on_demand_capacity:(target_on_demand_capacity_ : whole_number option)
    ?instance_fleet_type:(instance_fleet_type_ : instance_fleet_type option)
    ?status:(status_ : instance_fleet_status option) ?name:(name_ : xml_string_max_len256 option)
    ?id:(id_ : instance_fleet_id option) () =
  ({
     context = context_;
     resize_specifications = resize_specifications_;
     launch_specifications = launch_specifications_;
     instance_type_specifications = instance_type_specifications_;
     provisioned_spot_capacity = provisioned_spot_capacity_;
     provisioned_on_demand_capacity = provisioned_on_demand_capacity_;
     target_spot_capacity = target_spot_capacity_;
     target_on_demand_capacity = target_on_demand_capacity_;
     instance_fleet_type = instance_fleet_type_;
     status = status_;
     name = name_;
     id = id_;
   }
    : instance_fleet)

let make_list_instance_fleets_output ?marker:(marker_ : marker option)
    ?instance_fleets:(instance_fleets_ : instance_fleet_list option) () =
  ({ marker = marker_; instance_fleets = instance_fleets_ } : list_instance_fleets_output)

let make_list_instance_fleets_input ?marker:(marker_ : marker option)
    ~cluster_id:(cluster_id_ : cluster_id) () =
  ({ marker = marker_; cluster_id = cluster_id_ } : list_instance_fleets_input)

let make_cluster_state_change_reason ?message:(message_ : string_ option)
    ?code:(code_ : cluster_state_change_reason_code option) () =
  ({ message = message_; code = code_ } : cluster_state_change_reason)

let make_cluster_timeline ?end_date_time:(end_date_time_ : date option)
    ?ready_date_time:(ready_date_time_ : date option)
    ?creation_date_time:(creation_date_time_ : date option) () =
  ({
     end_date_time = end_date_time_;
     ready_date_time = ready_date_time_;
     creation_date_time = creation_date_time_;
   }
    : cluster_timeline)

let make_error_detail ?error_message:(error_message_ : string_ option)
    ?error_data:(error_data_ : error_data option) ?error_code:(error_code_ : string_ option) () =
  ({ error_message = error_message_; error_data = error_data_; error_code = error_code_ }
    : error_detail)

let make_cluster_status ?error_details:(error_details_ : error_detail_list option)
    ?timeline:(timeline_ : cluster_timeline option)
    ?state_change_reason:(state_change_reason_ : cluster_state_change_reason option)
    ?state:(state_ : cluster_state option) () =
  ({
     error_details = error_details_;
     timeline = timeline_;
     state_change_reason = state_change_reason_;
     state = state_;
   }
    : cluster_status)

let make_cluster_summary ?outpost_arn:(outpost_arn_ : optional_arn_type option)
    ?cluster_arn:(cluster_arn_ : arn_type option)
    ?normalized_instance_hours:(normalized_instance_hours_ : integer option)
    ?status:(status_ : cluster_status option) ?name:(name_ : string_ option)
    ?id:(id_ : cluster_id option) () =
  ({
     outpost_arn = outpost_arn_;
     cluster_arn = cluster_arn_;
     normalized_instance_hours = normalized_instance_hours_;
     status = status_;
     name = name_;
     id = id_;
   }
    : cluster_summary)

let make_list_clusters_output ?marker:(marker_ : marker option)
    ?clusters:(clusters_ : cluster_summary_list option) () =
  ({ marker = marker_; clusters = clusters_ } : list_clusters_output)

let make_list_clusters_input ?marker:(marker_ : marker option)
    ?cluster_states:(cluster_states_ : cluster_state_list option)
    ?created_before:(created_before_ : date option) ?created_after:(created_after_ : date option) ()
    =
  ({
     marker = marker_;
     cluster_states = cluster_states_;
     created_before = created_before_;
     created_after = created_after_;
   }
    : list_clusters_input)

let make_command ?args:(args_ : string_list option) ?script_path:(script_path_ : string_ option)
    ?name:(name_ : string_ option) () =
  ({ args = args_; script_path = script_path_; name = name_ } : command)

let make_list_bootstrap_actions_output ?marker:(marker_ : marker option)
    ?bootstrap_actions:(bootstrap_actions_ : command_list option) () =
  ({ marker = marker_; bootstrap_actions = bootstrap_actions_ } : list_bootstrap_actions_output)

let make_list_bootstrap_actions_input ?marker:(marker_ : marker option)
    ~cluster_id:(cluster_id_ : cluster_id) () =
  ({ marker = marker_; cluster_id = cluster_id_ } : list_bootstrap_actions_input)

let make_instance_group_detail ?custom_ami_id:(custom_ami_id_ : xml_string_max_len256 option)
    ?end_date_time:(end_date_time_ : date option) ?ready_date_time:(ready_date_time_ : date option)
    ?start_date_time:(start_date_time_ : date option)
    ?last_state_change_reason:(last_state_change_reason_ : xml_string option)
    ?bid_price:(bid_price_ : xml_string_max_len256 option)
    ?name:(name_ : xml_string_max_len256 option)
    ?instance_group_id:(instance_group_id_ : xml_string_max_len256 option)
    ~creation_date_time:(creation_date_time_ : date) ~state:(state_ : instance_group_state)
    ~instance_running_count:(instance_running_count_ : integer)
    ~instance_request_count:(instance_request_count_ : integer)
    ~instance_type:(instance_type_ : instance_type)
    ~instance_role:(instance_role_ : instance_role_type) ~market:(market_ : market_type) () =
  ({
     custom_ami_id = custom_ami_id_;
     end_date_time = end_date_time_;
     ready_date_time = ready_date_time_;
     start_date_time = start_date_time_;
     creation_date_time = creation_date_time_;
     last_state_change_reason = last_state_change_reason_;
     state = state_;
     instance_running_count = instance_running_count_;
     instance_request_count = instance_request_count_;
     instance_type = instance_type_;
     bid_price = bid_price_;
     instance_role = instance_role_;
     market = market_;
     name = name_;
     instance_group_id = instance_group_id_;
   }
    : instance_group_detail)

let make_job_flow_instances_detail ?hadoop_version:(hadoop_version_ : xml_string_max_len256 option)
    ?unhealthy_node_replacement:(unhealthy_node_replacement_ : boolean_object option)
    ?termination_protected:(termination_protected_ : boolean_ option)
    ?keep_job_flow_alive_when_no_steps:(keep_job_flow_alive_when_no_steps_ : boolean_ option)
    ?placement:(placement_ : placement_type option)
    ?ec2_subnet_id:(ec2_subnet_id_ : xml_string_max_len256 option)
    ?ec2_key_name:(ec2_key_name_ : xml_string_max_len256 option)
    ?normalized_instance_hours:(normalized_instance_hours_ : integer option)
    ?instance_groups:(instance_groups_ : instance_group_detail_list option)
    ?master_instance_id:(master_instance_id_ : xml_string option)
    ?master_public_dns_name:(master_public_dns_name_ : xml_string option)
    ~instance_count:(instance_count_ : integer)
    ~slave_instance_type:(slave_instance_type_ : instance_type)
    ~master_instance_type:(master_instance_type_ : instance_type) () =
  ({
     hadoop_version = hadoop_version_;
     unhealthy_node_replacement = unhealthy_node_replacement_;
     termination_protected = termination_protected_;
     keep_job_flow_alive_when_no_steps = keep_job_flow_alive_when_no_steps_;
     placement = placement_;
     ec2_subnet_id = ec2_subnet_id_;
     ec2_key_name = ec2_key_name_;
     normalized_instance_hours = normalized_instance_hours_;
     instance_groups = instance_groups_;
     instance_count = instance_count_;
     slave_instance_type = slave_instance_type_;
     master_instance_id = master_instance_id_;
     master_public_dns_name = master_public_dns_name_;
     master_instance_type = master_instance_type_;
   }
    : job_flow_instances_detail)

let make_job_flow_execution_status_detail
    ?last_state_change_reason:(last_state_change_reason_ : xml_string option)
    ?end_date_time:(end_date_time_ : date option) ?ready_date_time:(ready_date_time_ : date option)
    ?start_date_time:(start_date_time_ : date option)
    ~creation_date_time:(creation_date_time_ : date) ~state:(state_ : job_flow_execution_state) () =
  ({
     last_state_change_reason = last_state_change_reason_;
     end_date_time = end_date_time_;
     ready_date_time = ready_date_time_;
     start_date_time = start_date_time_;
     creation_date_time = creation_date_time_;
     state = state_;
   }
    : job_flow_execution_status_detail)

let make_bootstrap_action_detail
    ?bootstrap_action_config:(bootstrap_action_config_ : bootstrap_action_config option) () =
  ({ bootstrap_action_config = bootstrap_action_config_ } : bootstrap_action_detail)

let make_job_flow_detail ?scale_down_behavior:(scale_down_behavior_ : scale_down_behavior option)
    ?auto_scaling_role:(auto_scaling_role_ : xml_string option)
    ?service_role:(service_role_ : xml_string option)
    ?job_flow_role:(job_flow_role_ : xml_string option)
    ?visible_to_all_users:(visible_to_all_users_ : boolean_ option)
    ?supported_products:(supported_products_ : supported_products_list option)
    ?bootstrap_actions:(bootstrap_actions_ : bootstrap_action_detail_list option)
    ?steps:(steps_ : step_detail_list option)
    ?ami_version:(ami_version_ : xml_string_max_len256 option)
    ?log_encryption_kms_key_id:(log_encryption_kms_key_id_ : xml_string option)
    ?log_uri:(log_uri_ : xml_string option) ~instances:(instances_ : job_flow_instances_detail)
    ~execution_status_detail:(execution_status_detail_ : job_flow_execution_status_detail)
    ~name:(name_ : xml_string_max_len256) ~job_flow_id:(job_flow_id_ : xml_string_max_len256) () =
  ({
     scale_down_behavior = scale_down_behavior_;
     auto_scaling_role = auto_scaling_role_;
     service_role = service_role_;
     job_flow_role = job_flow_role_;
     visible_to_all_users = visible_to_all_users_;
     supported_products = supported_products_;
     bootstrap_actions = bootstrap_actions_;
     steps = steps_;
     instances = instances_;
     execution_status_detail = execution_status_detail_;
     ami_version = ami_version_;
     log_encryption_kms_key_id = log_encryption_kms_key_id_;
     log_uri = log_uri_;
     name = name_;
     job_flow_id = job_flow_id_;
   }
    : job_flow_detail)

let make_get_studio_session_mapping_output
    ?session_mapping:(session_mapping_ : session_mapping_detail option) () =
  ({ session_mapping = session_mapping_ } : get_studio_session_mapping_output)

let make_get_studio_session_mapping_input
    ?identity_name:(identity_name_ : xml_string_max_len256 option)
    ?identity_id:(identity_id_ : xml_string_max_len256 option)
    ~identity_type:(identity_type_ : identity_type) ~studio_id:(studio_id_ : xml_string_max_len256)
    () =
  ({
     identity_type = identity_type_;
     identity_name = identity_name_;
     identity_id = identity_id_;
     studio_id = studio_id_;
   }
    : get_studio_session_mapping_input)

let make_get_session_output ~session:(session_ : session) () =
  ({ session = session_ } : get_session_output)

let make_get_session_input ~session_id:(session_id_ : session_id)
    ~cluster_id:(cluster_id_ : cluster_id) () =
  ({ session_id = session_id_; cluster_id = cluster_id_ } : get_session_input)

let make_get_session_endpoint_output ?credentials:(credentials_ : credentials option)
    ?auth_token_expiration_time:(auth_token_expiration_time_ : date option)
    ?auth_token:(auth_token_ : sensitive_string option) ~endpoint:(endpoint_ : xml_string) () =
  ({
     credentials = credentials_;
     auth_token_expiration_time = auth_token_expiration_time_;
     auth_token = auth_token_;
     endpoint = endpoint_;
   }
    : get_session_endpoint_output)

let make_get_session_endpoint_input ~session_id:(session_id_ : session_id)
    ~cluster_id:(cluster_id_ : cluster_id) () =
  ({ session_id = session_id_; cluster_id = cluster_id_ } : get_session_endpoint_input)

let make_get_persistent_app_ui_presigned_url_output
    ?presigned_ur_l:(presigned_ur_l_ : xml_string option)
    ?presigned_url_ready:(presigned_url_ready_ : boolean_ option) () =
  ({ presigned_ur_l = presigned_ur_l_; presigned_url_ready = presigned_url_ready_ }
    : get_persistent_app_ui_presigned_url_output)

let make_get_persistent_app_ui_presigned_url_input
    ?execution_role_arn:(execution_role_arn_ : arn_type option)
    ?auth_proxy_call:(auth_proxy_call_ : boolean_object option)
    ?application_id:(application_id_ : xml_string_max_len256 option)
    ?persistent_app_ui_type:(persistent_app_ui_type_ : persistent_app_ui_type option)
    ~persistent_app_ui_id:(persistent_app_ui_id_ : xml_string_max_len256) () =
  ({
     execution_role_arn = execution_role_arn_;
     auth_proxy_call = auth_proxy_call_;
     application_id = application_id_;
     persistent_app_ui_type = persistent_app_ui_type_;
     persistent_app_ui_id = persistent_app_ui_id_;
   }
    : get_persistent_app_ui_presigned_url_input)

let make_get_on_cluster_app_ui_presigned_url_output
    ?presigned_ur_l:(presigned_ur_l_ : xml_string option)
    ?presigned_url_ready:(presigned_url_ready_ : boolean_ option) () =
  ({ presigned_ur_l = presigned_ur_l_; presigned_url_ready = presigned_url_ready_ }
    : get_on_cluster_app_ui_presigned_url_output)

let make_get_on_cluster_app_ui_presigned_url_input
    ?execution_role_arn:(execution_role_arn_ : arn_type option)
    ?dry_run:(dry_run_ : boolean_object option)
    ?application_id:(application_id_ : xml_string_max_len256 option)
    ?on_cluster_app_ui_type:(on_cluster_app_ui_type_ : on_cluster_app_ui_type option)
    ~cluster_id:(cluster_id_ : xml_string_max_len256) () =
  ({
     execution_role_arn = execution_role_arn_;
     dry_run = dry_run_;
     application_id = application_id_;
     on_cluster_app_ui_type = on_cluster_app_ui_type_;
     cluster_id = cluster_id_;
   }
    : get_on_cluster_app_ui_presigned_url_input)

let make_get_managed_scaling_policy_output
    ?managed_scaling_policy:(managed_scaling_policy_ : managed_scaling_policy option) () =
  ({ managed_scaling_policy = managed_scaling_policy_ } : get_managed_scaling_policy_output)

let make_get_managed_scaling_policy_input ~cluster_id:(cluster_id_ : cluster_id) () =
  ({ cluster_id = cluster_id_ } : get_managed_scaling_policy_input)

let make_get_cluster_session_credentials_output ?expires_at:(expires_at_ : date option)
    ?credentials:(credentials_ : credentials option) () =
  ({ expires_at = expires_at_; credentials = credentials_ }
    : get_cluster_session_credentials_output)

let make_get_cluster_session_credentials_input
    ?execution_role_arn:(execution_role_arn_ : arn_type option)
    ~cluster_id:(cluster_id_ : xml_string_max_len256) () =
  ({ execution_role_arn = execution_role_arn_; cluster_id = cluster_id_ }
    : get_cluster_session_credentials_input)

let make_block_public_access_configuration_metadata ~created_by_arn:(created_by_arn_ : arn_type)
    ~creation_date_time:(creation_date_time_ : date) () =
  ({ created_by_arn = created_by_arn_; creation_date_time = creation_date_time_ }
    : block_public_access_configuration_metadata)

let make_get_block_public_access_configuration_output
    ~block_public_access_configuration_metadata:
      (block_public_access_configuration_metadata_ : block_public_access_configuration_metadata)
    ~block_public_access_configuration:
      (block_public_access_configuration_ : block_public_access_configuration) () =
  ({
     block_public_access_configuration_metadata = block_public_access_configuration_metadata_;
     block_public_access_configuration = block_public_access_configuration_;
   }
    : get_block_public_access_configuration_output)

let make_get_block_public_access_configuration_input () = (() : unit)

let make_get_auto_termination_policy_output
    ?auto_termination_policy:(auto_termination_policy_ : auto_termination_policy option) () =
  ({ auto_termination_policy = auto_termination_policy_ } : get_auto_termination_policy_output)

let make_get_auto_termination_policy_input ~cluster_id:(cluster_id_ : cluster_id) () =
  ({ cluster_id = cluster_id_ } : get_auto_termination_policy_input)

let make_describe_studio_output ?studio:(studio_ : studio option) () =
  ({ studio = studio_ } : describe_studio_output)

let make_describe_studio_input ~studio_id:(studio_id_ : xml_string_max_len256) () =
  ({ studio_id = studio_id_ } : describe_studio_input)

let make_describe_step_output ?step:(step_ : step option) () =
  ({ step = step_ } : describe_step_output)

let make_describe_step_input ~step_id:(step_id_ : step_id) ~cluster_id:(cluster_id_ : cluster_id) ()
    =
  ({ step_id = step_id_; cluster_id = cluster_id_ } : describe_step_input)

let make_describe_security_configuration_output
    ?creation_date_time:(creation_date_time_ : date option)
    ?security_configuration:(security_configuration_ : string_ option)
    ?name:(name_ : xml_string option) () =
  ({
     creation_date_time = creation_date_time_;
     security_configuration = security_configuration_;
     name = name_;
   }
    : describe_security_configuration_output)

let make_describe_security_configuration_input ~name:(name_ : xml_string) () =
  ({ name = name_ } : describe_security_configuration_input)

let make_describe_release_label_output
    ?available_os_releases:(available_os_releases_ : os_release_list option)
    ?next_token:(next_token_ : string_ option)
    ?applications:(applications_ : simplified_application_list option)
    ?release_label:(release_label_ : string_ option) () =
  ({
     available_os_releases = available_os_releases_;
     next_token = next_token_;
     applications = applications_;
     release_label = release_label_;
   }
    : describe_release_label_output)

let make_describe_release_label_input ?max_results:(max_results_ : max_results_number option)
    ?next_token:(next_token_ : string_ option) ?release_label:(release_label_ : string_ option) () =
  ({ max_results = max_results_; next_token = next_token_; release_label = release_label_ }
    : describe_release_label_input)

let make_describe_persistent_app_ui_output
    ?persistent_app_u_i:(persistent_app_u_i_ : persistent_app_u_i option) () =
  ({ persistent_app_u_i = persistent_app_u_i_ } : describe_persistent_app_ui_output)

let make_describe_persistent_app_ui_input
    ~persistent_app_ui_id:(persistent_app_ui_id_ : xml_string_max_len256) () =
  ({ persistent_app_ui_id = persistent_app_ui_id_ } : describe_persistent_app_ui_input)

let make_describe_notebook_execution_output
    ?notebook_execution:(notebook_execution_ : notebook_execution option) () =
  ({ notebook_execution = notebook_execution_ } : describe_notebook_execution_output)

let make_describe_notebook_execution_input
    ~notebook_execution_id:(notebook_execution_id_ : xml_string_max_len256) () =
  ({ notebook_execution_id = notebook_execution_id_ } : describe_notebook_execution_input)

let make_describe_job_flows_output ?job_flows:(job_flows_ : job_flow_detail_list option) () =
  ({ job_flows = job_flows_ } : describe_job_flows_output)

let make_describe_job_flows_input
    ?job_flow_states:(job_flow_states_ : job_flow_execution_state_list option)
    ?job_flow_ids:(job_flow_ids_ : xml_string_list option)
    ?created_before:(created_before_ : date option) ?created_after:(created_after_ : date option) ()
    =
  ({
     job_flow_states = job_flow_states_;
     job_flow_ids = job_flow_ids_;
     created_before = created_before_;
     created_after = created_after_;
   }
    : describe_job_flows_input)

let make_ec2_instance_attributes
    ?additional_slave_security_groups:(additional_slave_security_groups_ : string_list option)
    ?additional_master_security_groups:(additional_master_security_groups_ : string_list option)
    ?service_access_security_group:(service_access_security_group_ : string_ option)
    ?emr_managed_slave_security_group:(emr_managed_slave_security_group_ : string_ option)
    ?emr_managed_master_security_group:(emr_managed_master_security_group_ : string_ option)
    ?iam_instance_profile:(iam_instance_profile_ : string_ option)
    ?requested_ec2_availability_zones:
      (requested_ec2_availability_zones_ : xml_string_max_len256_list option)
    ?ec2_availability_zone:(ec2_availability_zone_ : string_ option)
    ?requested_ec2_subnet_ids:(requested_ec2_subnet_ids_ : xml_string_max_len256_list option)
    ?ec2_subnet_id:(ec2_subnet_id_ : string_ option) ?ec2_key_name:(ec2_key_name_ : string_ option)
    () =
  ({
     additional_slave_security_groups = additional_slave_security_groups_;
     additional_master_security_groups = additional_master_security_groups_;
     service_access_security_group = service_access_security_group_;
     emr_managed_slave_security_group = emr_managed_slave_security_group_;
     emr_managed_master_security_group = emr_managed_master_security_group_;
     iam_instance_profile = iam_instance_profile_;
     requested_ec2_availability_zones = requested_ec2_availability_zones_;
     ec2_availability_zone = ec2_availability_zone_;
     requested_ec2_subnet_ids = requested_ec2_subnet_ids_;
     ec2_subnet_id = ec2_subnet_id_;
     ec2_key_name = ec2_key_name_;
   }
    : ec2_instance_attributes)

let make_cluster ?session_enabled:(session_enabled_ : boolean_object option)
    ?monitoring_configuration:(monitoring_configuration_ : monitoring_configuration option)
    ?extended_support:(extended_support_ : boolean_object option)
    ?ebs_root_volume_throughput:(ebs_root_volume_throughput_ : integer option)
    ?ebs_root_volume_iops:(ebs_root_volume_iops_ : integer option)
    ?os_release_label:(os_release_label_ : string_ option)
    ?placement_groups:(placement_groups_ : placement_group_config_list option)
    ?step_concurrency_level:(step_concurrency_level_ : integer option)
    ?outpost_arn:(outpost_arn_ : optional_arn_type option)
    ?cluster_arn:(cluster_arn_ : arn_type option)
    ?kerberos_attributes:(kerberos_attributes_ : kerberos_attributes option)
    ?repo_upgrade_on_boot:(repo_upgrade_on_boot_ : repo_upgrade_on_boot option)
    ?ebs_root_volume_size:(ebs_root_volume_size_ : integer option)
    ?custom_ami_id:(custom_ami_id_ : xml_string_max_len256 option)
    ?scale_down_behavior:(scale_down_behavior_ : scale_down_behavior option)
    ?auto_scaling_role:(auto_scaling_role_ : xml_string option)
    ?security_configuration:(security_configuration_ : xml_string option)
    ?configurations:(configurations_ : configuration_list option)
    ?master_public_dns_name:(master_public_dns_name_ : string_ option)
    ?normalized_instance_hours:(normalized_instance_hours_ : integer option)
    ?service_role:(service_role_ : string_ option) ?tags:(tags_ : tag_list option)
    ?applications:(applications_ : application_list option)
    ?visible_to_all_users:(visible_to_all_users_ : boolean_ option)
    ?unhealthy_node_replacement:(unhealthy_node_replacement_ : boolean_object option)
    ?termination_protected:(termination_protected_ : boolean_ option)
    ?auto_terminate:(auto_terminate_ : boolean_ option)
    ?release_label:(release_label_ : string_ option)
    ?running_ami_version:(running_ami_version_ : string_ option)
    ?requested_ami_version:(requested_ami_version_ : string_ option)
    ?log_encryption_kms_key_id:(log_encryption_kms_key_id_ : string_ option)
    ?log_uri:(log_uri_ : string_ option)
    ?instance_collection_type:(instance_collection_type_ : instance_collection_type option)
    ?ec2_instance_attributes:(ec2_instance_attributes_ : ec2_instance_attributes option)
    ?status:(status_ : cluster_status option) ?name:(name_ : string_ option)
    ?id:(id_ : cluster_id option) () =
  ({
     session_enabled = session_enabled_;
     monitoring_configuration = monitoring_configuration_;
     extended_support = extended_support_;
     ebs_root_volume_throughput = ebs_root_volume_throughput_;
     ebs_root_volume_iops = ebs_root_volume_iops_;
     os_release_label = os_release_label_;
     placement_groups = placement_groups_;
     step_concurrency_level = step_concurrency_level_;
     outpost_arn = outpost_arn_;
     cluster_arn = cluster_arn_;
     kerberos_attributes = kerberos_attributes_;
     repo_upgrade_on_boot = repo_upgrade_on_boot_;
     ebs_root_volume_size = ebs_root_volume_size_;
     custom_ami_id = custom_ami_id_;
     scale_down_behavior = scale_down_behavior_;
     auto_scaling_role = auto_scaling_role_;
     security_configuration = security_configuration_;
     configurations = configurations_;
     master_public_dns_name = master_public_dns_name_;
     normalized_instance_hours = normalized_instance_hours_;
     service_role = service_role_;
     tags = tags_;
     applications = applications_;
     visible_to_all_users = visible_to_all_users_;
     unhealthy_node_replacement = unhealthy_node_replacement_;
     termination_protected = termination_protected_;
     auto_terminate = auto_terminate_;
     release_label = release_label_;
     running_ami_version = running_ami_version_;
     requested_ami_version = requested_ami_version_;
     log_encryption_kms_key_id = log_encryption_kms_key_id_;
     log_uri = log_uri_;
     instance_collection_type = instance_collection_type_;
     ec2_instance_attributes = ec2_instance_attributes_;
     status = status_;
     name = name_;
     id = id_;
   }
    : cluster)

let make_describe_cluster_output ?cluster:(cluster_ : cluster option) () =
  ({ cluster = cluster_ } : describe_cluster_output)

let make_describe_cluster_input ~cluster_id:(cluster_id_ : cluster_id) () =
  ({ cluster_id = cluster_id_ } : describe_cluster_input)

let make_delete_studio_session_mapping_input
    ?identity_name:(identity_name_ : xml_string_max_len256 option)
    ?identity_id:(identity_id_ : xml_string_max_len256 option)
    ~identity_type:(identity_type_ : identity_type) ~studio_id:(studio_id_ : xml_string_max_len256)
    () =
  ({
     identity_type = identity_type_;
     identity_name = identity_name_;
     identity_id = identity_id_;
     studio_id = studio_id_;
   }
    : delete_studio_session_mapping_input)

let make_delete_studio_input ~studio_id:(studio_id_ : xml_string_max_len256) () =
  ({ studio_id = studio_id_ } : delete_studio_input)

let make_delete_security_configuration_output () = (() : unit)

let make_delete_security_configuration_input ~name:(name_ : xml_string) () =
  ({ name = name_ } : delete_security_configuration_input)

let make_create_studio_session_mapping_input
    ?identity_name:(identity_name_ : xml_string_max_len256 option)
    ?identity_id:(identity_id_ : xml_string_max_len256 option)
    ~session_policy_arn:(session_policy_arn_ : xml_string_max_len256)
    ~identity_type:(identity_type_ : identity_type) ~studio_id:(studio_id_ : xml_string_max_len256)
    () =
  ({
     session_policy_arn = session_policy_arn_;
     identity_type = identity_type_;
     identity_name = identity_name_;
     identity_id = identity_id_;
     studio_id = studio_id_;
   }
    : create_studio_session_mapping_input)

let make_create_studio_output ?url:(url_ : xml_string option)
    ?studio_id:(studio_id_ : xml_string_max_len256 option) () =
  ({ url = url_; studio_id = studio_id_ } : create_studio_output)

let make_create_studio_input ?encryption_key_arn:(encryption_key_arn_ : xml_string option)
    ?idc_instance_arn:(idc_instance_arn_ : arn_type option)
    ?idc_user_assignment:(idc_user_assignment_ : idc_user_assignment option)
    ?trusted_identity_propagation_enabled:
      (trusted_identity_propagation_enabled_ : boolean_object option)
    ?tags:(tags_ : tag_list option)
    ?idp_relay_state_parameter_name:(idp_relay_state_parameter_name_ : xml_string_max_len256 option)
    ?idp_auth_url:(idp_auth_url_ : xml_string option) ?user_role:(user_role_ : xml_string option)
    ?description:(description_ : xml_string_max_len256 option)
    ~default_s3_location:(default_s3_location_ : xml_string)
    ~engine_security_group_id:(engine_security_group_id_ : xml_string_max_len256)
    ~workspace_security_group_id:(workspace_security_group_id_ : xml_string_max_len256)
    ~service_role:(service_role_ : xml_string) ~subnet_ids:(subnet_ids_ : subnet_id_list)
    ~vpc_id:(vpc_id_ : xml_string_max_len256) ~auth_mode:(auth_mode_ : auth_mode)
    ~name:(name_ : xml_string_max_len256) () =
  ({
     encryption_key_arn = encryption_key_arn_;
     idc_instance_arn = idc_instance_arn_;
     idc_user_assignment = idc_user_assignment_;
     trusted_identity_propagation_enabled = trusted_identity_propagation_enabled_;
     tags = tags_;
     idp_relay_state_parameter_name = idp_relay_state_parameter_name_;
     idp_auth_url = idp_auth_url_;
     default_s3_location = default_s3_location_;
     engine_security_group_id = engine_security_group_id_;
     workspace_security_group_id = workspace_security_group_id_;
     user_role = user_role_;
     service_role = service_role_;
     subnet_ids = subnet_ids_;
     vpc_id = vpc_id_;
     auth_mode = auth_mode_;
     description = description_;
     name = name_;
   }
    : create_studio_input)

let make_create_security_configuration_output ~creation_date_time:(creation_date_time_ : date)
    ~name:(name_ : xml_string) () =
  ({ creation_date_time = creation_date_time_; name = name_ }
    : create_security_configuration_output)

let make_create_security_configuration_input
    ~security_configuration:(security_configuration_ : string_) ~name:(name_ : xml_string) () =
  ({ security_configuration = security_configuration_; name = name_ }
    : create_security_configuration_input)

let make_create_persistent_app_ui_output
    ?runtime_role_enabled_cluster:(runtime_role_enabled_cluster_ : boolean_ option)
    ?persistent_app_ui_id:(persistent_app_ui_id_ : xml_string_max_len256 option) () =
  ({
     runtime_role_enabled_cluster = runtime_role_enabled_cluster_;
     persistent_app_ui_id = persistent_app_ui_id_;
   }
    : create_persistent_app_ui_output)

let make_emr_containers_config ?job_run_id:(job_run_id_ : xml_string_max_len256 option) () =
  ({ job_run_id = job_run_id_ } : emr_containers_config)

let make_create_persistent_app_ui_input ?profiler_type:(profiler_type_ : profiler_type option)
    ?x_referer:(x_referer_ : string_ option) ?tags:(tags_ : tag_list option)
    ?emr_containers_config:(emr_containers_config_ : emr_containers_config option)
    ~target_resource_arn:(target_resource_arn_ : arn_type) () =
  ({
     profiler_type = profiler_type_;
     x_referer = x_referer_;
     tags = tags_;
     emr_containers_config = emr_containers_config_;
     target_resource_arn = target_resource_arn_;
   }
    : create_persistent_app_ui_input)

let make_cancel_steps_info ?reason:(reason_ : string_ option)
    ?status:(status_ : cancel_steps_request_status option) ?step_id:(step_id_ : step_id option) () =
  ({ reason = reason_; status = status_; step_id = step_id_ } : cancel_steps_info)

let make_cancel_steps_output
    ?cancel_steps_info_list:(cancel_steps_info_list_ : cancel_steps_info_list option) () =
  ({ cancel_steps_info_list = cancel_steps_info_list_ } : cancel_steps_output)

let make_cancel_steps_input
    ?step_cancellation_option:(step_cancellation_option_ : step_cancellation_option option)
    ~step_ids:(step_ids_ : step_ids_list) ~cluster_id:(cluster_id_ : xml_string_max_len256) () =
  ({
     step_cancellation_option = step_cancellation_option_;
     step_ids = step_ids_;
     cluster_id = cluster_id_;
   }
    : cancel_steps_input)

let make_add_tags_output () = (() : unit)

let make_add_tags_input ?cluster_id:(cluster_id_ : cluster_id option) ~tags:(tags_ : tag_list)
    ~resource_id:(resource_id_ : resource_id) () =
  ({ cluster_id = cluster_id_; tags = tags_; resource_id = resource_id_ } : add_tags_input)

let make_add_job_flow_steps_output ?step_ids:(step_ids_ : step_ids_list option) () =
  ({ step_ids = step_ids_ } : add_job_flow_steps_output)

let make_add_job_flow_steps_input ?execution_role_arn:(execution_role_arn_ : arn_type option)
    ~steps:(steps_ : step_config_list) ~job_flow_id:(job_flow_id_ : xml_string_max_len256) () =
  ({ execution_role_arn = execution_role_arn_; steps = steps_; job_flow_id = job_flow_id_ }
    : add_job_flow_steps_input)

let make_add_instance_groups_output ?cluster_arn:(cluster_arn_ : arn_type option)
    ?instance_group_ids:(instance_group_ids_ : instance_group_ids_list option)
    ?job_flow_id:(job_flow_id_ : xml_string_max_len256 option) () =
  ({
     cluster_arn = cluster_arn_;
     instance_group_ids = instance_group_ids_;
     job_flow_id = job_flow_id_;
   }
    : add_instance_groups_output)

let make_add_instance_groups_input ~job_flow_id:(job_flow_id_ : xml_string_max_len256)
    ~instance_groups:(instance_groups_ : instance_group_config_list) () =
  ({ job_flow_id = job_flow_id_; instance_groups = instance_groups_ } : add_instance_groups_input)

let make_add_instance_fleet_output ?cluster_arn:(cluster_arn_ : arn_type option)
    ?instance_fleet_id:(instance_fleet_id_ : instance_fleet_id option)
    ?cluster_id:(cluster_id_ : xml_string_max_len256 option) () =
  ({ cluster_arn = cluster_arn_; instance_fleet_id = instance_fleet_id_; cluster_id = cluster_id_ }
    : add_instance_fleet_output)

let make_add_instance_fleet_input ~instance_fleet:(instance_fleet_ : instance_fleet_config)
    ~cluster_id:(cluster_id_ : xml_string_max_len256) () =
  ({ instance_fleet = instance_fleet_; cluster_id = cluster_id_ } : add_instance_fleet_input)
