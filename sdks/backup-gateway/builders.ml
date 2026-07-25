open Types

let make_associate_gateway_to_server_output ?gateway_arn:(gateway_arn_ : gateway_arn option) () =
  ({ gateway_arn = gateway_arn_ } : associate_gateway_to_server_output)

let make_associate_gateway_to_server_input ~gateway_arn:(gateway_arn_ : gateway_arn)
    ~server_arn:(server_arn_ : server_arn) () =
  ({ gateway_arn = gateway_arn_; server_arn = server_arn_ } : associate_gateway_to_server_input)

let make_untag_resource_output ?resource_ar_n:(resource_ar_n_ : resource_arn option) () =
  ({ resource_ar_n = resource_ar_n_ } : untag_resource_output)

let make_untag_resource_input ~resource_ar_n:(resource_ar_n_ : resource_arn)
    ~tag_keys:(tag_keys_ : tag_keys) () =
  ({ resource_ar_n = resource_ar_n_; tag_keys = tag_keys_ } : untag_resource_input)

let make_tag_resource_output ?resource_ar_n:(resource_ar_n_ : resource_arn option) () =
  ({ resource_ar_n = resource_ar_n_ } : tag_resource_output)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_tag_resource_input ~resource_ar_n:(resource_ar_n_ : resource_arn) ~tags:(tags_ : tags) () =
  ({ resource_ar_n = resource_ar_n_; tags = tags_ } : tag_resource_input)

let make_list_tags_for_resource_output ?resource_arn:(resource_arn_ : resource_arn option)
    ?tags:(tags_ : tags option) () =
  ({ resource_arn = resource_arn_; tags = tags_ } : list_tags_for_resource_output)

let make_list_tags_for_resource_input ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_input)

let make_bandwidth_rate_limit_interval
    ?average_upload_rate_limit_in_bits_per_sec:
      (average_upload_rate_limit_in_bits_per_sec_ : average_upload_rate_limit option)
    ~start_hour_of_day:(start_hour_of_day_ : hour_of_day)
    ~end_hour_of_day:(end_hour_of_day_ : hour_of_day)
    ~start_minute_of_hour:(start_minute_of_hour_ : minute_of_hour)
    ~end_minute_of_hour:(end_minute_of_hour_ : minute_of_hour)
    ~days_of_week:(days_of_week_ : days_of_week) () =
  ({
     average_upload_rate_limit_in_bits_per_sec = average_upload_rate_limit_in_bits_per_sec_;
     start_hour_of_day = start_hour_of_day_;
     end_hour_of_day = end_hour_of_day_;
     start_minute_of_hour = start_minute_of_hour_;
     end_minute_of_hour = end_minute_of_hour_;
     days_of_week = days_of_week_;
   }
    : bandwidth_rate_limit_interval)

let make_create_gateway_output ?gateway_arn:(gateway_arn_ : gateway_arn option) () =
  ({ gateway_arn = gateway_arn_ } : create_gateway_output)

let make_create_gateway_input ?tags:(tags_ : tags option)
    ~activation_key:(activation_key_ : activation_key)
    ~gateway_display_name:(gateway_display_name_ : name)
    ~gateway_type:(gateway_type_ : gateway_type) () =
  ({
     activation_key = activation_key_;
     gateway_display_name = gateway_display_name_;
     gateway_type = gateway_type_;
     tags = tags_;
   }
    : create_gateway_input)

let make_delete_gateway_output ?gateway_arn:(gateway_arn_ : gateway_arn option) () =
  ({ gateway_arn = gateway_arn_ } : delete_gateway_output)

let make_delete_gateway_input ~gateway_arn:(gateway_arn_ : gateway_arn) () =
  ({ gateway_arn = gateway_arn_ } : delete_gateway_input)

let make_delete_hypervisor_output ?hypervisor_arn:(hypervisor_arn_ : server_arn option) () =
  ({ hypervisor_arn = hypervisor_arn_ } : delete_hypervisor_output)

let make_delete_hypervisor_input ~hypervisor_arn:(hypervisor_arn_ : server_arn) () =
  ({ hypervisor_arn = hypervisor_arn_ } : delete_hypervisor_input)

let make_disassociate_gateway_from_server_output ?gateway_arn:(gateway_arn_ : gateway_arn option) ()
    =
  ({ gateway_arn = gateway_arn_ } : disassociate_gateway_from_server_output)

let make_disassociate_gateway_from_server_input ~gateway_arn:(gateway_arn_ : gateway_arn) () =
  ({ gateway_arn = gateway_arn_ } : disassociate_gateway_from_server_input)

let make_gateway ?gateway_arn:(gateway_arn_ : gateway_arn option)
    ?gateway_display_name:(gateway_display_name_ : name option)
    ?gateway_type:(gateway_type_ : gateway_type option)
    ?hypervisor_id:(hypervisor_id_ : hypervisor_id option)
    ?last_seen_time:(last_seen_time_ : time option) () =
  ({
     gateway_arn = gateway_arn_;
     gateway_display_name = gateway_display_name_;
     gateway_type = gateway_type_;
     hypervisor_id = hypervisor_id_;
     last_seen_time = last_seen_time_;
   }
    : gateway)

let make_maintenance_start_time ?day_of_month:(day_of_month_ : day_of_month option)
    ?day_of_week:(day_of_week_ : day_of_week option) ~hour_of_day:(hour_of_day_ : hour_of_day)
    ~minute_of_hour:(minute_of_hour_ : minute_of_hour) () =
  ({
     day_of_month = day_of_month_;
     day_of_week = day_of_week_;
     hour_of_day = hour_of_day_;
     minute_of_hour = minute_of_hour_;
   }
    : maintenance_start_time)

let make_gateway_details ?gateway_arn:(gateway_arn_ : gateway_arn option)
    ?gateway_display_name:(gateway_display_name_ : name option)
    ?gateway_type:(gateway_type_ : gateway_type option)
    ?hypervisor_id:(hypervisor_id_ : hypervisor_id option)
    ?last_seen_time:(last_seen_time_ : time option)
    ?maintenance_start_time:(maintenance_start_time_ : maintenance_start_time option)
    ?next_update_availability_time:(next_update_availability_time_ : time option)
    ?vpc_endpoint:(vpc_endpoint_ : vpc_endpoint option)
    ?deprecation_date:(deprecation_date_ : time option)
    ?software_version:(software_version_ : name option) () =
  ({
     gateway_arn = gateway_arn_;
     gateway_display_name = gateway_display_name_;
     gateway_type = gateway_type_;
     hypervisor_id = hypervisor_id_;
     last_seen_time = last_seen_time_;
     maintenance_start_time = maintenance_start_time_;
     next_update_availability_time = next_update_availability_time_;
     vpc_endpoint = vpc_endpoint_;
     deprecation_date = deprecation_date_;
     software_version = software_version_;
   }
    : gateway_details)

let make_get_bandwidth_rate_limit_schedule_output ?gateway_arn:(gateway_arn_ : gateway_arn option)
    ?bandwidth_rate_limit_intervals:
      (bandwidth_rate_limit_intervals_ : bandwidth_rate_limit_intervals option) () =
  ({ gateway_arn = gateway_arn_; bandwidth_rate_limit_intervals = bandwidth_rate_limit_intervals_ }
    : get_bandwidth_rate_limit_schedule_output)

let make_get_bandwidth_rate_limit_schedule_input ~gateway_arn:(gateway_arn_ : gateway_arn) () =
  ({ gateway_arn = gateway_arn_ } : get_bandwidth_rate_limit_schedule_input)

let make_get_gateway_output ?gateway:(gateway_ : gateway_details option) () =
  ({ gateway = gateway_ } : get_gateway_output)

let make_get_gateway_input ~gateway_arn:(gateway_arn_ : gateway_arn) () =
  ({ gateway_arn = gateway_arn_ } : get_gateway_input)

let make_hypervisor_details ?host:(host_ : host option)
    ?hypervisor_arn:(hypervisor_arn_ : server_arn option)
    ?kms_key_arn:(kms_key_arn_ : kms_key_arn option) ?name:(name_ : name option)
    ?log_group_arn:(log_group_arn_ : log_group_arn option) ?state:(state_ : hypervisor_state option)
    ?last_successful_metadata_sync_time:(last_successful_metadata_sync_time_ : time option)
    ?latest_metadata_sync_status_message:(latest_metadata_sync_status_message_ : string_ option)
    ?latest_metadata_sync_status:(latest_metadata_sync_status_ : sync_metadata_status option) () =
  ({
     host = host_;
     hypervisor_arn = hypervisor_arn_;
     kms_key_arn = kms_key_arn_;
     name = name_;
     log_group_arn = log_group_arn_;
     state = state_;
     last_successful_metadata_sync_time = last_successful_metadata_sync_time_;
     latest_metadata_sync_status_message = latest_metadata_sync_status_message_;
     latest_metadata_sync_status = latest_metadata_sync_status_;
   }
    : hypervisor_details)

let make_get_hypervisor_output ?hypervisor:(hypervisor_ : hypervisor_details option) () =
  ({ hypervisor = hypervisor_ } : get_hypervisor_output)

let make_get_hypervisor_input ~hypervisor_arn:(hypervisor_arn_ : server_arn) () =
  ({ hypervisor_arn = hypervisor_arn_ } : get_hypervisor_input)

let make_vmware_to_aws_tag_mapping ~vmware_category:(vmware_category_ : vmware_category)
    ~vmware_tag_name:(vmware_tag_name_ : vmware_tag_name) ~aws_tag_key:(aws_tag_key_ : tag_key)
    ~aws_tag_value:(aws_tag_value_ : tag_value) () =
  ({
     vmware_category = vmware_category_;
     vmware_tag_name = vmware_tag_name_;
     aws_tag_key = aws_tag_key_;
     aws_tag_value = aws_tag_value_;
   }
    : vmware_to_aws_tag_mapping)

let make_get_hypervisor_property_mappings_output
    ?hypervisor_arn:(hypervisor_arn_ : server_arn option)
    ?vmware_to_aws_tag_mappings:(vmware_to_aws_tag_mappings_ : vmware_to_aws_tag_mappings option)
    ?iam_role_arn:(iam_role_arn_ : iam_role_arn option) () =
  ({
     hypervisor_arn = hypervisor_arn_;
     vmware_to_aws_tag_mappings = vmware_to_aws_tag_mappings_;
     iam_role_arn = iam_role_arn_;
   }
    : get_hypervisor_property_mappings_output)

let make_get_hypervisor_property_mappings_input ~hypervisor_arn:(hypervisor_arn_ : server_arn) () =
  ({ hypervisor_arn = hypervisor_arn_ } : get_hypervisor_property_mappings_input)

let make_vmware_tag ?vmware_category:(vmware_category_ : vmware_category option)
    ?vmware_tag_name:(vmware_tag_name_ : vmware_tag_name option)
    ?vmware_tag_description:(vmware_tag_description_ : string_ option) () =
  ({
     vmware_category = vmware_category_;
     vmware_tag_name = vmware_tag_name_;
     vmware_tag_description = vmware_tag_description_;
   }
    : vmware_tag)

let make_virtual_machine_details ?host_name:(host_name_ : name option)
    ?hypervisor_id:(hypervisor_id_ : string_ option) ?name:(name_ : name option)
    ?path:(path_ : path option) ?resource_arn:(resource_arn_ : resource_arn option)
    ?last_backup_date:(last_backup_date_ : time option)
    ?vmware_tags:(vmware_tags_ : vmware_tags option) () =
  ({
     host_name = host_name_;
     hypervisor_id = hypervisor_id_;
     name = name_;
     path = path_;
     resource_arn = resource_arn_;
     last_backup_date = last_backup_date_;
     vmware_tags = vmware_tags_;
   }
    : virtual_machine_details)

let make_get_virtual_machine_output
    ?virtual_machine:(virtual_machine_ : virtual_machine_details option) () =
  ({ virtual_machine = virtual_machine_ } : get_virtual_machine_output)

let make_get_virtual_machine_input ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : get_virtual_machine_input)

let make_hypervisor ?host:(host_ : host option)
    ?hypervisor_arn:(hypervisor_arn_ : server_arn option)
    ?kms_key_arn:(kms_key_arn_ : kms_key_arn option) ?name:(name_ : name option)
    ?state:(state_ : hypervisor_state option) () =
  ({
     host = host_;
     hypervisor_arn = hypervisor_arn_;
     kms_key_arn = kms_key_arn_;
     name = name_;
     state = state_;
   }
    : hypervisor)

let make_import_hypervisor_configuration_output
    ?hypervisor_arn:(hypervisor_arn_ : server_arn option) () =
  ({ hypervisor_arn = hypervisor_arn_ } : import_hypervisor_configuration_output)

let make_import_hypervisor_configuration_input ?username:(username_ : username option)
    ?password:(password_ : password option) ?kms_key_arn:(kms_key_arn_ : kms_key_arn option)
    ?tags:(tags_ : tags option) ~name:(name_ : name) ~host:(host_ : host) () =
  ({
     name = name_;
     host = host_;
     username = username_;
     password = password_;
     kms_key_arn = kms_key_arn_;
     tags = tags_;
   }
    : import_hypervisor_configuration_input)

let make_list_gateways_output ?gateways:(gateways_ : gateways option)
    ?next_token:(next_token_ : next_token option) () =
  ({ gateways = gateways_; next_token = next_token_ } : list_gateways_output)

let make_list_gateways_input ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_gateways_input)

let make_list_hypervisors_output ?hypervisors:(hypervisors_ : hypervisors option)
    ?next_token:(next_token_ : next_token option) () =
  ({ hypervisors = hypervisors_; next_token = next_token_ } : list_hypervisors_output)

let make_list_hypervisors_input ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : next_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_hypervisors_input)

let make_virtual_machine ?host_name:(host_name_ : name option)
    ?hypervisor_id:(hypervisor_id_ : string_ option) ?name:(name_ : name option)
    ?path:(path_ : path option) ?resource_arn:(resource_arn_ : resource_arn option)
    ?last_backup_date:(last_backup_date_ : time option) () =
  ({
     host_name = host_name_;
     hypervisor_id = hypervisor_id_;
     name = name_;
     path = path_;
     resource_arn = resource_arn_;
     last_backup_date = last_backup_date_;
   }
    : virtual_machine)

let make_list_virtual_machines_output
    ?virtual_machines:(virtual_machines_ : virtual_machines option)
    ?next_token:(next_token_ : next_token option) () =
  ({ virtual_machines = virtual_machines_; next_token = next_token_ }
    : list_virtual_machines_output)

let make_list_virtual_machines_input ?hypervisor_arn:(hypervisor_arn_ : server_arn option)
    ?max_results:(max_results_ : max_results option) ?next_token:(next_token_ : next_token option)
    () =
  ({ hypervisor_arn = hypervisor_arn_; max_results = max_results_; next_token = next_token_ }
    : list_virtual_machines_input)

let make_put_bandwidth_rate_limit_schedule_output ?gateway_arn:(gateway_arn_ : gateway_arn option)
    () =
  ({ gateway_arn = gateway_arn_ } : put_bandwidth_rate_limit_schedule_output)

let make_put_bandwidth_rate_limit_schedule_input ~gateway_arn:(gateway_arn_ : gateway_arn)
    ~bandwidth_rate_limit_intervals:
      (bandwidth_rate_limit_intervals_ : bandwidth_rate_limit_intervals) () =
  ({ gateway_arn = gateway_arn_; bandwidth_rate_limit_intervals = bandwidth_rate_limit_intervals_ }
    : put_bandwidth_rate_limit_schedule_input)

let make_put_hypervisor_property_mappings_output
    ?hypervisor_arn:(hypervisor_arn_ : server_arn option) () =
  ({ hypervisor_arn = hypervisor_arn_ } : put_hypervisor_property_mappings_output)

let make_put_hypervisor_property_mappings_input ~hypervisor_arn:(hypervisor_arn_ : server_arn)
    ~vmware_to_aws_tag_mappings:(vmware_to_aws_tag_mappings_ : vmware_to_aws_tag_mappings)
    ~iam_role_arn:(iam_role_arn_ : iam_role_arn) () =
  ({
     hypervisor_arn = hypervisor_arn_;
     vmware_to_aws_tag_mappings = vmware_to_aws_tag_mappings_;
     iam_role_arn = iam_role_arn_;
   }
    : put_hypervisor_property_mappings_input)

let make_put_maintenance_start_time_output ?gateway_arn:(gateway_arn_ : gateway_arn option) () =
  ({ gateway_arn = gateway_arn_ } : put_maintenance_start_time_output)

let make_put_maintenance_start_time_input ?day_of_week:(day_of_week_ : day_of_week option)
    ?day_of_month:(day_of_month_ : day_of_month option) ~gateway_arn:(gateway_arn_ : gateway_arn)
    ~hour_of_day:(hour_of_day_ : hour_of_day) ~minute_of_hour:(minute_of_hour_ : minute_of_hour) ()
    =
  ({
     gateway_arn = gateway_arn_;
     hour_of_day = hour_of_day_;
     minute_of_hour = minute_of_hour_;
     day_of_week = day_of_week_;
     day_of_month = day_of_month_;
   }
    : put_maintenance_start_time_input)

let make_start_virtual_machines_metadata_sync_output
    ?hypervisor_arn:(hypervisor_arn_ : server_arn option) () =
  ({ hypervisor_arn = hypervisor_arn_ } : start_virtual_machines_metadata_sync_output)

let make_start_virtual_machines_metadata_sync_input ~hypervisor_arn:(hypervisor_arn_ : server_arn)
    () =
  ({ hypervisor_arn = hypervisor_arn_ } : start_virtual_machines_metadata_sync_input)

let make_test_hypervisor_configuration_output () = (() : unit)

let make_test_hypervisor_configuration_input ?username:(username_ : username option)
    ?password:(password_ : password option) ~gateway_arn:(gateway_arn_ : gateway_arn)
    ~host:(host_ : host) () =
  ({ gateway_arn = gateway_arn_; host = host_; username = username_; password = password_ }
    : test_hypervisor_configuration_input)

let make_update_gateway_information_output ?gateway_arn:(gateway_arn_ : gateway_arn option) () =
  ({ gateway_arn = gateway_arn_ } : update_gateway_information_output)

let make_update_gateway_information_input
    ?gateway_display_name:(gateway_display_name_ : name option)
    ~gateway_arn:(gateway_arn_ : gateway_arn) () =
  ({ gateway_arn = gateway_arn_; gateway_display_name = gateway_display_name_ }
    : update_gateway_information_input)

let make_update_gateway_software_now_output ?gateway_arn:(gateway_arn_ : gateway_arn option) () =
  ({ gateway_arn = gateway_arn_ } : update_gateway_software_now_output)

let make_update_gateway_software_now_input ~gateway_arn:(gateway_arn_ : gateway_arn) () =
  ({ gateway_arn = gateway_arn_ } : update_gateway_software_now_input)

let make_update_hypervisor_output ?hypervisor_arn:(hypervisor_arn_ : server_arn option) () =
  ({ hypervisor_arn = hypervisor_arn_ } : update_hypervisor_output)

let make_update_hypervisor_input ?host:(host_ : host option) ?username:(username_ : username option)
    ?password:(password_ : password option) ?name:(name_ : name option)
    ?log_group_arn:(log_group_arn_ : log_group_arn option)
    ~hypervisor_arn:(hypervisor_arn_ : server_arn) () =
  ({
     hypervisor_arn = hypervisor_arn_;
     host = host_;
     username = username_;
     password = password_;
     name = name_;
     log_group_arn = log_group_arn_;
   }
    : update_hypervisor_input)
