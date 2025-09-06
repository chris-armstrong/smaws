open Types

let make_vmware_to_aws_tag_mapping ~aws_tag_value:(aws_tag_value_ : tag_value)
    ~aws_tag_key:(aws_tag_key_ : tag_key) ~vmware_tag_name:(vmware_tag_name_ : vmware_tag_name)
    ~vmware_category:(vmware_category_ : vmware_category) () =
  ({
     aws_tag_value = aws_tag_value_;
     aws_tag_key = aws_tag_key_;
     vmware_tag_name = vmware_tag_name_;
     vmware_category = vmware_category_;
   }
    : vmware_to_aws_tag_mapping)

let make_vmware_tag ?vmware_tag_description:(vmware_tag_description_ : string_ option)
    ?vmware_tag_name:(vmware_tag_name_ : vmware_tag_name option)
    ?vmware_category:(vmware_category_ : vmware_category option) () =
  ({
     vmware_tag_description = vmware_tag_description_;
     vmware_tag_name = vmware_tag_name_;
     vmware_category = vmware_category_;
   }
    : vmware_tag)

let make_virtual_machine ?last_backup_date:(last_backup_date_ : time option)
    ?resource_arn:(resource_arn_ : resource_arn option) ?path:(path_ : path option)
    ?name:(name_ : name option) ?hypervisor_id:(hypervisor_id_ : string_ option)
    ?host_name:(host_name_ : name option) () =
  ({
     last_backup_date = last_backup_date_;
     resource_arn = resource_arn_;
     path = path_;
     name = name_;
     hypervisor_id = hypervisor_id_;
     host_name = host_name_;
   }
    : virtual_machine)

let make_virtual_machine_details ?vmware_tags:(vmware_tags_ : vmware_tags option)
    ?last_backup_date:(last_backup_date_ : time option)
    ?resource_arn:(resource_arn_ : resource_arn option) ?path:(path_ : path option)
    ?name:(name_ : name option) ?hypervisor_id:(hypervisor_id_ : string_ option)
    ?host_name:(host_name_ : name option) () =
  ({
     vmware_tags = vmware_tags_;
     last_backup_date = last_backup_date_;
     resource_arn = resource_arn_;
     path = path_;
     name = name_;
     hypervisor_id = hypervisor_id_;
     host_name = host_name_;
   }
    : virtual_machine_details)

let make_update_hypervisor_output ?hypervisor_arn:(hypervisor_arn_ : server_arn option) () =
  ({ hypervisor_arn = hypervisor_arn_ } : update_hypervisor_output)

let make_update_hypervisor_input ?log_group_arn:(log_group_arn_ : log_group_arn option)
    ?name:(name_ : name option) ?password:(password_ : password option)
    ?username:(username_ : username option) ?host:(host_ : host option)
    ~hypervisor_arn:(hypervisor_arn_ : server_arn) () =
  ({
     log_group_arn = log_group_arn_;
     name = name_;
     password = password_;
     username = username_;
     host = host_;
     hypervisor_arn = hypervisor_arn_;
   }
    : update_hypervisor_input)

let make_update_gateway_software_now_output ?gateway_arn:(gateway_arn_ : gateway_arn option) () =
  ({ gateway_arn = gateway_arn_ } : update_gateway_software_now_output)

let make_update_gateway_software_now_input ~gateway_arn:(gateway_arn_ : gateway_arn) () =
  ({ gateway_arn = gateway_arn_ } : update_gateway_software_now_input)

let make_update_gateway_information_output ?gateway_arn:(gateway_arn_ : gateway_arn option) () =
  ({ gateway_arn = gateway_arn_ } : update_gateway_information_output)

let make_update_gateway_information_input
    ?gateway_display_name:(gateway_display_name_ : name option)
    ~gateway_arn:(gateway_arn_ : gateway_arn) () =
  ({ gateway_display_name = gateway_display_name_; gateway_arn = gateway_arn_ }
    : update_gateway_information_input)

let make_untag_resource_output ?resource_ar_n:(resource_ar_n_ : resource_arn option) () =
  ({ resource_ar_n = resource_ar_n_ } : untag_resource_output)

let make_untag_resource_input ~tag_keys:(tag_keys_ : tag_keys)
    ~resource_ar_n:(resource_ar_n_ : resource_arn) () =
  ({ tag_keys = tag_keys_; resource_ar_n = resource_ar_n_ } : untag_resource_input)

let make_test_hypervisor_configuration_output () = (() : unit)

let make_test_hypervisor_configuration_input ?password:(password_ : password option)
    ?username:(username_ : username option) ~host:(host_ : host)
    ~gateway_arn:(gateway_arn_ : gateway_arn) () =
  ({ password = password_; username = username_; host = host_; gateway_arn = gateway_arn_ }
    : test_hypervisor_configuration_input)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_output ?resource_ar_n:(resource_ar_n_ : resource_arn option) () =
  ({ resource_ar_n = resource_ar_n_ } : tag_resource_output)

let make_tag_resource_input ~tags:(tags_ : tags) ~resource_ar_n:(resource_ar_n_ : resource_arn) () =
  ({ tags = tags_; resource_ar_n = resource_ar_n_ } : tag_resource_input)

let make_start_virtual_machines_metadata_sync_output
    ?hypervisor_arn:(hypervisor_arn_ : server_arn option) () =
  ({ hypervisor_arn = hypervisor_arn_ } : start_virtual_machines_metadata_sync_output)

let make_start_virtual_machines_metadata_sync_input ~hypervisor_arn:(hypervisor_arn_ : server_arn)
    () =
  ({ hypervisor_arn = hypervisor_arn_ } : start_virtual_machines_metadata_sync_input)

let make_put_maintenance_start_time_output ?gateway_arn:(gateway_arn_ : gateway_arn option) () =
  ({ gateway_arn = gateway_arn_ } : put_maintenance_start_time_output)

let make_put_maintenance_start_time_input ?day_of_month:(day_of_month_ : day_of_month option)
    ?day_of_week:(day_of_week_ : day_of_week option)
    ~minute_of_hour:(minute_of_hour_ : minute_of_hour) ~hour_of_day:(hour_of_day_ : hour_of_day)
    ~gateway_arn:(gateway_arn_ : gateway_arn) () =
  ({
     day_of_month = day_of_month_;
     day_of_week = day_of_week_;
     minute_of_hour = minute_of_hour_;
     hour_of_day = hour_of_day_;
     gateway_arn = gateway_arn_;
   }
    : put_maintenance_start_time_input)

let make_put_hypervisor_property_mappings_output
    ?hypervisor_arn:(hypervisor_arn_ : server_arn option) () =
  ({ hypervisor_arn = hypervisor_arn_ } : put_hypervisor_property_mappings_output)

let make_put_hypervisor_property_mappings_input ~iam_role_arn:(iam_role_arn_ : iam_role_arn)
    ~vmware_to_aws_tag_mappings:(vmware_to_aws_tag_mappings_ : vmware_to_aws_tag_mappings)
    ~hypervisor_arn:(hypervisor_arn_ : server_arn) () =
  ({
     iam_role_arn = iam_role_arn_;
     vmware_to_aws_tag_mappings = vmware_to_aws_tag_mappings_;
     hypervisor_arn = hypervisor_arn_;
   }
    : put_hypervisor_property_mappings_input)

let make_put_bandwidth_rate_limit_schedule_output ?gateway_arn:(gateway_arn_ : gateway_arn option)
    () =
  ({ gateway_arn = gateway_arn_ } : put_bandwidth_rate_limit_schedule_output)

let make_bandwidth_rate_limit_interval
    ?average_upload_rate_limit_in_bits_per_sec:
      (average_upload_rate_limit_in_bits_per_sec_ : average_upload_rate_limit option)
    ~days_of_week:(days_of_week_ : days_of_week)
    ~end_minute_of_hour:(end_minute_of_hour_ : minute_of_hour)
    ~start_minute_of_hour:(start_minute_of_hour_ : minute_of_hour)
    ~end_hour_of_day:(end_hour_of_day_ : hour_of_day)
    ~start_hour_of_day:(start_hour_of_day_ : hour_of_day) () =
  ({
     days_of_week = days_of_week_;
     end_minute_of_hour = end_minute_of_hour_;
     start_minute_of_hour = start_minute_of_hour_;
     end_hour_of_day = end_hour_of_day_;
     start_hour_of_day = start_hour_of_day_;
     average_upload_rate_limit_in_bits_per_sec = average_upload_rate_limit_in_bits_per_sec_;
   }
    : bandwidth_rate_limit_interval)

let make_put_bandwidth_rate_limit_schedule_input
    ~bandwidth_rate_limit_intervals:
      (bandwidth_rate_limit_intervals_ : bandwidth_rate_limit_intervals)
    ~gateway_arn:(gateway_arn_ : gateway_arn) () =
  ({ bandwidth_rate_limit_intervals = bandwidth_rate_limit_intervals_; gateway_arn = gateway_arn_ }
    : put_bandwidth_rate_limit_schedule_input)

let make_maintenance_start_time ?day_of_week:(day_of_week_ : day_of_week option)
    ?day_of_month:(day_of_month_ : day_of_month option)
    ~minute_of_hour:(minute_of_hour_ : minute_of_hour) ~hour_of_day:(hour_of_day_ : hour_of_day) ()
    =
  ({
     minute_of_hour = minute_of_hour_;
     hour_of_day = hour_of_day_;
     day_of_week = day_of_week_;
     day_of_month = day_of_month_;
   }
    : maintenance_start_time)

let make_list_virtual_machines_output ?next_token:(next_token_ : next_token option)
    ?virtual_machines:(virtual_machines_ : virtual_machines option) () =
  ({ next_token = next_token_; virtual_machines = virtual_machines_ }
    : list_virtual_machines_output)

let make_list_virtual_machines_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option)
    ?hypervisor_arn:(hypervisor_arn_ : server_arn option) () =
  ({ next_token = next_token_; max_results = max_results_; hypervisor_arn = hypervisor_arn_ }
    : list_virtual_machines_input)

let make_list_tags_for_resource_output ?tags:(tags_ : tags option)
    ?resource_arn:(resource_arn_ : resource_arn option) () =
  ({ tags = tags_; resource_arn = resource_arn_ } : list_tags_for_resource_output)

let make_list_tags_for_resource_input ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : list_tags_for_resource_input)

let make_hypervisor ?state:(state_ : hypervisor_state option) ?name:(name_ : name option)
    ?kms_key_arn:(kms_key_arn_ : kms_key_arn option)
    ?hypervisor_arn:(hypervisor_arn_ : server_arn option) ?host:(host_ : host option) () =
  ({
     state = state_;
     name = name_;
     kms_key_arn = kms_key_arn_;
     hypervisor_arn = hypervisor_arn_;
     host = host_;
   }
    : hypervisor)

let make_list_hypervisors_output ?next_token:(next_token_ : next_token option)
    ?hypervisors:(hypervisors_ : hypervisors option) () =
  ({ next_token = next_token_; hypervisors = hypervisors_ } : list_hypervisors_output)

let make_list_hypervisors_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_hypervisors_input)

let make_gateway ?last_seen_time:(last_seen_time_ : time option)
    ?hypervisor_id:(hypervisor_id_ : hypervisor_id option)
    ?gateway_type:(gateway_type_ : gateway_type option)
    ?gateway_display_name:(gateway_display_name_ : name option)
    ?gateway_arn:(gateway_arn_ : gateway_arn option) () =
  ({
     last_seen_time = last_seen_time_;
     hypervisor_id = hypervisor_id_;
     gateway_type = gateway_type_;
     gateway_display_name = gateway_display_name_;
     gateway_arn = gateway_arn_;
   }
    : gateway)

let make_list_gateways_output ?next_token:(next_token_ : next_token option)
    ?gateways:(gateways_ : gateways option) () =
  ({ next_token = next_token_; gateways = gateways_ } : list_gateways_output)

let make_list_gateways_input ?next_token:(next_token_ : next_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_gateways_input)

let make_import_hypervisor_configuration_output
    ?hypervisor_arn:(hypervisor_arn_ : server_arn option) () =
  ({ hypervisor_arn = hypervisor_arn_ } : import_hypervisor_configuration_output)

let make_import_hypervisor_configuration_input ?tags:(tags_ : tags option)
    ?kms_key_arn:(kms_key_arn_ : kms_key_arn option) ?password:(password_ : password option)
    ?username:(username_ : username option) ~host:(host_ : host) ~name:(name_ : name) () =
  ({
     tags = tags_;
     kms_key_arn = kms_key_arn_;
     password = password_;
     username = username_;
     host = host_;
     name = name_;
   }
    : import_hypervisor_configuration_input)

let make_hypervisor_details
    ?latest_metadata_sync_status:(latest_metadata_sync_status_ : sync_metadata_status option)
    ?latest_metadata_sync_status_message:(latest_metadata_sync_status_message_ : string_ option)
    ?last_successful_metadata_sync_time:(last_successful_metadata_sync_time_ : time option)
    ?state:(state_ : hypervisor_state option) ?log_group_arn:(log_group_arn_ : log_group_arn option)
    ?name:(name_ : name option) ?kms_key_arn:(kms_key_arn_ : kms_key_arn option)
    ?hypervisor_arn:(hypervisor_arn_ : server_arn option) ?host:(host_ : host option) () =
  ({
     latest_metadata_sync_status = latest_metadata_sync_status_;
     latest_metadata_sync_status_message = latest_metadata_sync_status_message_;
     last_successful_metadata_sync_time = last_successful_metadata_sync_time_;
     state = state_;
     log_group_arn = log_group_arn_;
     name = name_;
     kms_key_arn = kms_key_arn_;
     hypervisor_arn = hypervisor_arn_;
     host = host_;
   }
    : hypervisor_details)

let make_get_virtual_machine_output
    ?virtual_machine:(virtual_machine_ : virtual_machine_details option) () =
  ({ virtual_machine = virtual_machine_ } : get_virtual_machine_output)

let make_get_virtual_machine_input ~resource_arn:(resource_arn_ : resource_arn) () =
  ({ resource_arn = resource_arn_ } : get_virtual_machine_input)

let make_get_hypervisor_property_mappings_output ?iam_role_arn:(iam_role_arn_ : iam_role_arn option)
    ?vmware_to_aws_tag_mappings:(vmware_to_aws_tag_mappings_ : vmware_to_aws_tag_mappings option)
    ?hypervisor_arn:(hypervisor_arn_ : server_arn option) () =
  ({
     iam_role_arn = iam_role_arn_;
     vmware_to_aws_tag_mappings = vmware_to_aws_tag_mappings_;
     hypervisor_arn = hypervisor_arn_;
   }
    : get_hypervisor_property_mappings_output)

let make_get_hypervisor_property_mappings_input ~hypervisor_arn:(hypervisor_arn_ : server_arn) () =
  ({ hypervisor_arn = hypervisor_arn_ } : get_hypervisor_property_mappings_input)

let make_get_hypervisor_output ?hypervisor:(hypervisor_ : hypervisor_details option) () =
  ({ hypervisor = hypervisor_ } : get_hypervisor_output)

let make_get_hypervisor_input ~hypervisor_arn:(hypervisor_arn_ : server_arn) () =
  ({ hypervisor_arn = hypervisor_arn_ } : get_hypervisor_input)

let make_gateway_details ?vpc_endpoint:(vpc_endpoint_ : vpc_endpoint option)
    ?next_update_availability_time:(next_update_availability_time_ : time option)
    ?maintenance_start_time:(maintenance_start_time_ : maintenance_start_time option)
    ?last_seen_time:(last_seen_time_ : time option)
    ?hypervisor_id:(hypervisor_id_ : hypervisor_id option)
    ?gateway_type:(gateway_type_ : gateway_type option)
    ?gateway_display_name:(gateway_display_name_ : name option)
    ?gateway_arn:(gateway_arn_ : gateway_arn option) () =
  ({
     vpc_endpoint = vpc_endpoint_;
     next_update_availability_time = next_update_availability_time_;
     maintenance_start_time = maintenance_start_time_;
     last_seen_time = last_seen_time_;
     hypervisor_id = hypervisor_id_;
     gateway_type = gateway_type_;
     gateway_display_name = gateway_display_name_;
     gateway_arn = gateway_arn_;
   }
    : gateway_details)

let make_get_gateway_output ?gateway:(gateway_ : gateway_details option) () =
  ({ gateway = gateway_ } : get_gateway_output)

let make_get_gateway_input ~gateway_arn:(gateway_arn_ : gateway_arn) () =
  ({ gateway_arn = gateway_arn_ } : get_gateway_input)

let make_get_bandwidth_rate_limit_schedule_output
    ?bandwidth_rate_limit_intervals:
      (bandwidth_rate_limit_intervals_ : bandwidth_rate_limit_intervals option)
    ?gateway_arn:(gateway_arn_ : gateway_arn option) () =
  ({ bandwidth_rate_limit_intervals = bandwidth_rate_limit_intervals_; gateway_arn = gateway_arn_ }
    : get_bandwidth_rate_limit_schedule_output)

let make_get_bandwidth_rate_limit_schedule_input ~gateway_arn:(gateway_arn_ : gateway_arn) () =
  ({ gateway_arn = gateway_arn_ } : get_bandwidth_rate_limit_schedule_input)

let make_disassociate_gateway_from_server_output ?gateway_arn:(gateway_arn_ : gateway_arn option) ()
    =
  ({ gateway_arn = gateway_arn_ } : disassociate_gateway_from_server_output)

let make_disassociate_gateway_from_server_input ~gateway_arn:(gateway_arn_ : gateway_arn) () =
  ({ gateway_arn = gateway_arn_ } : disassociate_gateway_from_server_input)

let make_delete_hypervisor_output ?hypervisor_arn:(hypervisor_arn_ : server_arn option) () =
  ({ hypervisor_arn = hypervisor_arn_ } : delete_hypervisor_output)

let make_delete_hypervisor_input ~hypervisor_arn:(hypervisor_arn_ : server_arn) () =
  ({ hypervisor_arn = hypervisor_arn_ } : delete_hypervisor_input)

let make_delete_gateway_output ?gateway_arn:(gateway_arn_ : gateway_arn option) () =
  ({ gateway_arn = gateway_arn_ } : delete_gateway_output)

let make_delete_gateway_input ~gateway_arn:(gateway_arn_ : gateway_arn) () =
  ({ gateway_arn = gateway_arn_ } : delete_gateway_input)

let make_create_gateway_output ?gateway_arn:(gateway_arn_ : gateway_arn option) () =
  ({ gateway_arn = gateway_arn_ } : create_gateway_output)

let make_create_gateway_input ?tags:(tags_ : tags option)
    ~gateway_type:(gateway_type_ : gateway_type)
    ~gateway_display_name:(gateway_display_name_ : name)
    ~activation_key:(activation_key_ : activation_key) () =
  ({
     tags = tags_;
     gateway_type = gateway_type_;
     gateway_display_name = gateway_display_name_;
     activation_key = activation_key_;
   }
    : create_gateway_input)

let make_associate_gateway_to_server_output ?gateway_arn:(gateway_arn_ : gateway_arn option) () =
  ({ gateway_arn = gateway_arn_ } : associate_gateway_to_server_output)

let make_associate_gateway_to_server_input ~server_arn:(server_arn_ : server_arn)
    ~gateway_arn:(gateway_arn_ : gateway_arn) () =
  ({ server_arn = server_arn_; gateway_arn = gateway_arn_ } : associate_gateway_to_server_input)
