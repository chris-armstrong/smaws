open Smaws_Lib
open Types
let make_vmware_to_aws_tag_mapping ~aws_tag_value:(aws_tag_value_ : string) 
  ~aws_tag_key:(aws_tag_key_ : string) 
  ~vmware_tag_name:(vmware_tag_name_ : string) 
  ~vmware_category:(vmware_category_ : string)  () =
  ({
     aws_tag_value = aws_tag_value_;
     aws_tag_key = aws_tag_key_;
     vmware_tag_name = vmware_tag_name_;
     vmware_category = vmware_category_
   } : vmware_to_aws_tag_mapping)
let make_vmware_tag
  ?vmware_tag_description:(vmware_tag_description_ : string option) 
  ?vmware_tag_name:(vmware_tag_name_ : string option) 
  ?vmware_category:(vmware_category_ : string option)  () =
  ({
     vmware_tag_description = vmware_tag_description_;
     vmware_tag_name = vmware_tag_name_;
     vmware_category = vmware_category_
   } : vmware_tag)
let make_virtual_machine
  ?last_backup_date:(last_backup_date_ : CoreTypes.Timestamp.t option) 
  ?resource_arn:(resource_arn_ : string option) 
  ?path:(path_ : string option)  ?name:(name_ : string option) 
  ?hypervisor_id:(hypervisor_id_ : string option) 
  ?host_name:(host_name_ : string option)  () =
  ({
     last_backup_date = last_backup_date_;
     resource_arn = resource_arn_;
     path = path_;
     name = name_;
     hypervisor_id = hypervisor_id_;
     host_name = host_name_
   } : virtual_machine)
let make_virtual_machine_details
  ?vmware_tags:(vmware_tags_ : vmware_tag list option) 
  ?last_backup_date:(last_backup_date_ : CoreTypes.Timestamp.t option) 
  ?resource_arn:(resource_arn_ : string option) 
  ?path:(path_ : string option)  ?name:(name_ : string option) 
  ?hypervisor_id:(hypervisor_id_ : string option) 
  ?host_name:(host_name_ : string option)  () =
  ({
     vmware_tags = vmware_tags_;
     last_backup_date = last_backup_date_;
     resource_arn = resource_arn_;
     path = path_;
     name = name_;
     hypervisor_id = hypervisor_id_;
     host_name = host_name_
   } : virtual_machine_details)
let make_update_hypervisor_output
  ?hypervisor_arn:(hypervisor_arn_ : string option)  () =
  ({ hypervisor_arn = hypervisor_arn_ } : update_hypervisor_output)
let make_update_hypervisor_input
  ?log_group_arn:(log_group_arn_ : string option) 
  ?name:(name_ : string option)  ?password:(password_ : string option) 
  ?username:(username_ : string option)  ?host:(host_ : string option) 
  ~hypervisor_arn:(hypervisor_arn_ : string)  () =
  ({
     log_group_arn = log_group_arn_;
     name = name_;
     password = password_;
     username = username_;
     host = host_;
     hypervisor_arn = hypervisor_arn_
   } : update_hypervisor_input)
let make_update_gateway_software_now_output
  ?gateway_arn:(gateway_arn_ : string option)  () =
  ({ gateway_arn = gateway_arn_ } : update_gateway_software_now_output)
let make_update_gateway_software_now_input
  ~gateway_arn:(gateway_arn_ : string)  () =
  ({ gateway_arn = gateway_arn_ } : update_gateway_software_now_input)
let make_update_gateway_information_output
  ?gateway_arn:(gateway_arn_ : string option)  () =
  ({ gateway_arn = gateway_arn_ } : update_gateway_information_output)
let make_update_gateway_information_input
  ?gateway_display_name:(gateway_display_name_ : string option) 
  ~gateway_arn:(gateway_arn_ : string)  () =
  ({ gateway_display_name = gateway_display_name_; gateway_arn = gateway_arn_
   } : update_gateway_information_input)
let make_untag_resource_output
  ?resource_ar_n:(resource_ar_n_ : string option)  () =
  ({ resource_ar_n = resource_ar_n_ } : untag_resource_output)
let make_untag_resource_input ~tag_keys:(tag_keys_ : string list) 
  ~resource_ar_n:(resource_ar_n_ : string)  () =
  ({ tag_keys = tag_keys_; resource_ar_n = resource_ar_n_ } : untag_resource_input)
let make_test_hypervisor_configuration_output () =
  (() : test_hypervisor_configuration_output)
let make_test_hypervisor_configuration_input
  ?password:(password_ : string option) 
  ?username:(username_ : string option)  ~host:(host_ : string) 
  ~gateway_arn:(gateway_arn_ : string)  () =
  ({
     password = password_;
     username = username_;
     host = host_;
     gateway_arn = gateway_arn_
   } : test_hypervisor_configuration_input)
let make_tag ~value:(value_ : string)  ~key:(key_ : string)  () =
  ({ value = value_; key = key_ } : tag)
let make_tag_resource_output ?resource_ar_n:(resource_ar_n_ : string option) 
  () = ({ resource_ar_n = resource_ar_n_ } : tag_resource_output)
let make_tag_resource_input ~tags:(tags_ : tag list) 
  ~resource_ar_n:(resource_ar_n_ : string)  () =
  ({ tags = tags_; resource_ar_n = resource_ar_n_ } : tag_resource_input)
let make_start_virtual_machines_metadata_sync_output
  ?hypervisor_arn:(hypervisor_arn_ : string option)  () =
  ({ hypervisor_arn = hypervisor_arn_ } : start_virtual_machines_metadata_sync_output)
let make_start_virtual_machines_metadata_sync_input
  ~hypervisor_arn:(hypervisor_arn_ : string)  () =
  ({ hypervisor_arn = hypervisor_arn_ } : start_virtual_machines_metadata_sync_input)
let make_put_maintenance_start_time_output
  ?gateway_arn:(gateway_arn_ : string option)  () =
  ({ gateway_arn = gateway_arn_ } : put_maintenance_start_time_output)
let make_put_maintenance_start_time_input
  ?day_of_month:(day_of_month_ : int option) 
  ?day_of_week:(day_of_week_ : int option) 
  ~minute_of_hour:(minute_of_hour_ : int)  ~hour_of_day:(hour_of_day_ : int) 
  ~gateway_arn:(gateway_arn_ : string)  () =
  ({
     day_of_month = day_of_month_;
     day_of_week = day_of_week_;
     minute_of_hour = minute_of_hour_;
     hour_of_day = hour_of_day_;
     gateway_arn = gateway_arn_
   } : put_maintenance_start_time_input)
let make_put_hypervisor_property_mappings_output
  ?hypervisor_arn:(hypervisor_arn_ : string option)  () =
  ({ hypervisor_arn = hypervisor_arn_ } : put_hypervisor_property_mappings_output)
let make_put_hypervisor_property_mappings_input
  ~iam_role_arn:(iam_role_arn_ : string) 
  ~vmware_to_aws_tag_mappings:(vmware_to_aws_tag_mappings_ :
                                vmware_to_aws_tag_mapping list)
   ~hypervisor_arn:(hypervisor_arn_ : string)  () =
  ({
     iam_role_arn = iam_role_arn_;
     vmware_to_aws_tag_mappings = vmware_to_aws_tag_mappings_;
     hypervisor_arn = hypervisor_arn_
   } : put_hypervisor_property_mappings_input)
let make_put_bandwidth_rate_limit_schedule_output
  ?gateway_arn:(gateway_arn_ : string option)  () =
  ({ gateway_arn = gateway_arn_ } : put_bandwidth_rate_limit_schedule_output)
let make_bandwidth_rate_limit_interval
  ?average_upload_rate_limit_in_bits_per_sec:(average_upload_rate_limit_in_bits_per_sec_
                                               : int option)
   ~days_of_week:(days_of_week_ : int list) 
  ~end_minute_of_hour:(end_minute_of_hour_ : int) 
  ~start_minute_of_hour:(start_minute_of_hour_ : int) 
  ~end_hour_of_day:(end_hour_of_day_ : int) 
  ~start_hour_of_day:(start_hour_of_day_ : int)  () =
  ({
     days_of_week = days_of_week_;
     end_minute_of_hour = end_minute_of_hour_;
     start_minute_of_hour = start_minute_of_hour_;
     end_hour_of_day = end_hour_of_day_;
     start_hour_of_day = start_hour_of_day_;
     average_upload_rate_limit_in_bits_per_sec =
       average_upload_rate_limit_in_bits_per_sec_
   } : bandwidth_rate_limit_interval)
let make_put_bandwidth_rate_limit_schedule_input
  ~bandwidth_rate_limit_intervals:(bandwidth_rate_limit_intervals_ :
                                    bandwidth_rate_limit_interval list)
   ~gateway_arn:(gateway_arn_ : string)  () =
  ({
     bandwidth_rate_limit_intervals = bandwidth_rate_limit_intervals_;
     gateway_arn = gateway_arn_
   } : put_bandwidth_rate_limit_schedule_input)
let make_maintenance_start_time ?day_of_week:(day_of_week_ : int option) 
  ?day_of_month:(day_of_month_ : int option) 
  ~minute_of_hour:(minute_of_hour_ : int)  ~hour_of_day:(hour_of_day_ : int) 
  () =
  ({
     minute_of_hour = minute_of_hour_;
     hour_of_day = hour_of_day_;
     day_of_week = day_of_week_;
     day_of_month = day_of_month_
   } : maintenance_start_time)
let make_list_virtual_machines_output
  ?next_token:(next_token_ : string option) 
  ?virtual_machines:(virtual_machines_ : virtual_machine list option)  () =
  ({ next_token = next_token_; virtual_machines = virtual_machines_ } : 
  list_virtual_machines_output)
let make_list_virtual_machines_input
  ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option) 
  ?hypervisor_arn:(hypervisor_arn_ : string option)  () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     hypervisor_arn = hypervisor_arn_
   } : list_virtual_machines_input)
let make_list_tags_for_resource_output ?tags:(tags_ : tag list option) 
  ?resource_arn:(resource_arn_ : string option)  () =
  ({ tags = tags_; resource_arn = resource_arn_ } : list_tags_for_resource_output)
let make_list_tags_for_resource_input ~resource_arn:(resource_arn_ : string) 
  () = ({ resource_arn = resource_arn_ } : list_tags_for_resource_input)
let make_hypervisor ?state:(state_ : hypervisor_state option) 
  ?name:(name_ : string option)  ?kms_key_arn:(kms_key_arn_ : string option) 
  ?hypervisor_arn:(hypervisor_arn_ : string option) 
  ?host:(host_ : string option)  () =
  ({
     state = state_;
     name = name_;
     kms_key_arn = kms_key_arn_;
     hypervisor_arn = hypervisor_arn_;
     host = host_
   } : hypervisor)
let make_list_hypervisors_output ?next_token:(next_token_ : string option) 
  ?hypervisors:(hypervisors_ : hypervisor list option)  () =
  ({ next_token = next_token_; hypervisors = hypervisors_ } : list_hypervisors_output)
let make_list_hypervisors_input ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option)  () =
  ({ next_token = next_token_; max_results = max_results_ } : list_hypervisors_input)
let make_gateway
  ?last_seen_time:(last_seen_time_ : CoreTypes.Timestamp.t option) 
  ?hypervisor_id:(hypervisor_id_ : string option) 
  ?gateway_type:(gateway_type_ : gateway_type option) 
  ?gateway_display_name:(gateway_display_name_ : string option) 
  ?gateway_arn:(gateway_arn_ : string option)  () =
  ({
     last_seen_time = last_seen_time_;
     hypervisor_id = hypervisor_id_;
     gateway_type = gateway_type_;
     gateway_display_name = gateway_display_name_;
     gateway_arn = gateway_arn_
   } : gateway)
let make_list_gateways_output ?next_token:(next_token_ : string option) 
  ?gateways:(gateways_ : gateway list option)  () =
  ({ next_token = next_token_; gateways = gateways_ } : list_gateways_output)
let make_list_gateways_input ?next_token:(next_token_ : string option) 
  ?max_results:(max_results_ : int option)  () =
  ({ next_token = next_token_; max_results = max_results_ } : list_gateways_input)
let make_import_hypervisor_configuration_output
  ?hypervisor_arn:(hypervisor_arn_ : string option)  () =
  ({ hypervisor_arn = hypervisor_arn_ } : import_hypervisor_configuration_output)
let make_import_hypervisor_configuration_input
  ?tags:(tags_ : tag list option) 
  ?kms_key_arn:(kms_key_arn_ : string option) 
  ?password:(password_ : string option) 
  ?username:(username_ : string option)  ~host:(host_ : string) 
  ~name:(name_ : string)  () =
  ({
     tags = tags_;
     kms_key_arn = kms_key_arn_;
     password = password_;
     username = username_;
     host = host_;
     name = name_
   } : import_hypervisor_configuration_input)
let make_hypervisor_details
  ?latest_metadata_sync_status:(latest_metadata_sync_status_ :
                                 sync_metadata_status option)
   ?latest_metadata_sync_status_message:(latest_metadata_sync_status_message_
                                          : string option)
   ?last_successful_metadata_sync_time:(last_successful_metadata_sync_time_ :
                                         CoreTypes.Timestamp.t option)
   ?state:(state_ : hypervisor_state option) 
  ?log_group_arn:(log_group_arn_ : string option) 
  ?name:(name_ : string option)  ?kms_key_arn:(kms_key_arn_ : string option) 
  ?hypervisor_arn:(hypervisor_arn_ : string option) 
  ?host:(host_ : string option)  () =
  ({
     latest_metadata_sync_status = latest_metadata_sync_status_;
     latest_metadata_sync_status_message =
       latest_metadata_sync_status_message_;
     last_successful_metadata_sync_time = last_successful_metadata_sync_time_;
     state = state_;
     log_group_arn = log_group_arn_;
     name = name_;
     kms_key_arn = kms_key_arn_;
     hypervisor_arn = hypervisor_arn_;
     host = host_
   } : hypervisor_details)
let make_get_virtual_machine_output
  ?virtual_machine:(virtual_machine_ : virtual_machine_details option)  () =
  ({ virtual_machine = virtual_machine_ } : get_virtual_machine_output)
let make_get_virtual_machine_input ~resource_arn:(resource_arn_ : string)  ()
  = ({ resource_arn = resource_arn_ } : get_virtual_machine_input)
let make_get_hypervisor_property_mappings_output
  ?iam_role_arn:(iam_role_arn_ : string option) 
  ?vmware_to_aws_tag_mappings:(vmware_to_aws_tag_mappings_ :
                                vmware_to_aws_tag_mapping list option)
   ?hypervisor_arn:(hypervisor_arn_ : string option)  () =
  ({
     iam_role_arn = iam_role_arn_;
     vmware_to_aws_tag_mappings = vmware_to_aws_tag_mappings_;
     hypervisor_arn = hypervisor_arn_
   } : get_hypervisor_property_mappings_output)
let make_get_hypervisor_property_mappings_input
  ~hypervisor_arn:(hypervisor_arn_ : string)  () =
  ({ hypervisor_arn = hypervisor_arn_ } : get_hypervisor_property_mappings_input)
let make_get_hypervisor_output
  ?hypervisor:(hypervisor_ : hypervisor_details option)  () =
  ({ hypervisor = hypervisor_ } : get_hypervisor_output)
let make_get_hypervisor_input ~hypervisor_arn:(hypervisor_arn_ : string)  ()
  = ({ hypervisor_arn = hypervisor_arn_ } : get_hypervisor_input)
let make_gateway_details ?vpc_endpoint:(vpc_endpoint_ : string option) 
  ?next_update_availability_time:(next_update_availability_time_ :
                                   CoreTypes.Timestamp.t option)
   ?maintenance_start_time:(maintenance_start_time_ :
                             maintenance_start_time option)
   ?last_seen_time:(last_seen_time_ : CoreTypes.Timestamp.t option) 
  ?hypervisor_id:(hypervisor_id_ : string option) 
  ?gateway_type:(gateway_type_ : gateway_type option) 
  ?gateway_display_name:(gateway_display_name_ : string option) 
  ?gateway_arn:(gateway_arn_ : string option)  () =
  ({
     vpc_endpoint = vpc_endpoint_;
     next_update_availability_time = next_update_availability_time_;
     maintenance_start_time = maintenance_start_time_;
     last_seen_time = last_seen_time_;
     hypervisor_id = hypervisor_id_;
     gateway_type = gateway_type_;
     gateway_display_name = gateway_display_name_;
     gateway_arn = gateway_arn_
   } : gateway_details)
let make_get_gateway_output ?gateway:(gateway_ : gateway_details option)  ()
  = ({ gateway = gateway_ } : get_gateway_output)
let make_get_gateway_input ~gateway_arn:(gateway_arn_ : string)  () =
  ({ gateway_arn = gateway_arn_ } : get_gateway_input)
let make_get_bandwidth_rate_limit_schedule_output
  ?bandwidth_rate_limit_intervals:(bandwidth_rate_limit_intervals_ :
                                    bandwidth_rate_limit_interval list option)
   ?gateway_arn:(gateway_arn_ : string option)  () =
  ({
     bandwidth_rate_limit_intervals = bandwidth_rate_limit_intervals_;
     gateway_arn = gateway_arn_
   } : get_bandwidth_rate_limit_schedule_output)
let make_get_bandwidth_rate_limit_schedule_input
  ~gateway_arn:(gateway_arn_ : string)  () =
  ({ gateway_arn = gateway_arn_ } : get_bandwidth_rate_limit_schedule_input)
let make_disassociate_gateway_from_server_output
  ?gateway_arn:(gateway_arn_ : string option)  () =
  ({ gateway_arn = gateway_arn_ } : disassociate_gateway_from_server_output)
let make_disassociate_gateway_from_server_input
  ~gateway_arn:(gateway_arn_ : string)  () =
  ({ gateway_arn = gateway_arn_ } : disassociate_gateway_from_server_input)
let make_delete_hypervisor_output
  ?hypervisor_arn:(hypervisor_arn_ : string option)  () =
  ({ hypervisor_arn = hypervisor_arn_ } : delete_hypervisor_output)
let make_delete_hypervisor_input ~hypervisor_arn:(hypervisor_arn_ : string) 
  () = ({ hypervisor_arn = hypervisor_arn_ } : delete_hypervisor_input)
let make_delete_gateway_output ?gateway_arn:(gateway_arn_ : string option) 
  () = ({ gateway_arn = gateway_arn_ } : delete_gateway_output)
let make_delete_gateway_input ~gateway_arn:(gateway_arn_ : string)  () =
  ({ gateway_arn = gateway_arn_ } : delete_gateway_input)
let make_create_gateway_output ?gateway_arn:(gateway_arn_ : string option) 
  () = ({ gateway_arn = gateway_arn_ } : create_gateway_output)
let make_create_gateway_input ?tags:(tags_ : tag list option) 
  ~gateway_type:(gateway_type_ : gateway_type) 
  ~gateway_display_name:(gateway_display_name_ : string) 
  ~activation_key:(activation_key_ : string)  () =
  ({
     tags = tags_;
     gateway_type = gateway_type_;
     gateway_display_name = gateway_display_name_;
     activation_key = activation_key_
   } : create_gateway_input)
let make_associate_gateway_to_server_output
  ?gateway_arn:(gateway_arn_ : string option)  () =
  ({ gateway_arn = gateway_arn_ } : associate_gateway_to_server_output)
let make_associate_gateway_to_server_input ~server_arn:(server_arn_ : string)
   ~gateway_arn:(gateway_arn_ : string)  () =
  ({ server_arn = server_arn_; gateway_arn = gateway_arn_ } : associate_gateway_to_server_input)