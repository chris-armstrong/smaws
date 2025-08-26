open Smaws_Lib.Json.DeserializeHelpers
open Types
let string__of_yojson = string_of_yojson
let vpc_endpoint_of_yojson = string_of_yojson
let vmware_category_of_yojson = string_of_yojson
let vmware_tag_name_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_value_of_yojson = string_of_yojson
let vmware_to_aws_tag_mapping_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aws_tag_value =
       (value_for_key tag_value_of_yojson "AwsTagValue" _list path);
     aws_tag_key = (value_for_key tag_key_of_yojson "AwsTagKey" _list path);
     vmware_tag_name =
       (value_for_key vmware_tag_name_of_yojson "VmwareTagName" _list path);
     vmware_category =
       (value_for_key vmware_category_of_yojson "VmwareCategory" _list path)
   } : vmware_to_aws_tag_mapping)
let vmware_to_aws_tag_mappings_of_yojson tree path =
  list_of_yojson vmware_to_aws_tag_mapping_of_yojson tree path
let vmware_tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vmware_tag_description =
       (option_of_yojson
          (value_for_key string__of_yojson "VmwareTagDescription") _list path);
     vmware_tag_name =
       (option_of_yojson
          (value_for_key vmware_tag_name_of_yojson "VmwareTagName") _list
          path);
     vmware_category =
       (option_of_yojson
          (value_for_key vmware_category_of_yojson "VmwareCategory") _list
          path)
   } : vmware_tag)
let vmware_tags_of_yojson tree path =
  list_of_yojson vmware_tag_of_yojson tree path
let name_of_yojson = string_of_yojson
let path_of_yojson = string_of_yojson
let resource_arn_of_yojson = string_of_yojson
let time_of_yojson = timestamp_epoch_seconds_of_yojson
let virtual_machine_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_backup_date =
       (option_of_yojson (value_for_key time_of_yojson "LastBackupDate")
          _list path);
     resource_arn =
       (option_of_yojson (value_for_key resource_arn_of_yojson "ResourceArn")
          _list path);
     path =
       (option_of_yojson (value_for_key path_of_yojson "Path") _list path);
     name =
       (option_of_yojson (value_for_key name_of_yojson "Name") _list path);
     hypervisor_id =
       (option_of_yojson (value_for_key string__of_yojson "HypervisorId")
          _list path);
     host_name =
       (option_of_yojson (value_for_key name_of_yojson "HostName") _list path)
   } : virtual_machine)
let virtual_machines_of_yojson tree path =
  list_of_yojson virtual_machine_of_yojson tree path
let virtual_machine_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vmware_tags =
       (option_of_yojson (value_for_key vmware_tags_of_yojson "VmwareTags")
          _list path);
     last_backup_date =
       (option_of_yojson (value_for_key time_of_yojson "LastBackupDate")
          _list path);
     resource_arn =
       (option_of_yojson (value_for_key resource_arn_of_yojson "ResourceArn")
          _list path);
     path =
       (option_of_yojson (value_for_key path_of_yojson "Path") _list path);
     name =
       (option_of_yojson (value_for_key name_of_yojson "Name") _list path);
     hypervisor_id =
       (option_of_yojson (value_for_key string__of_yojson "HypervisorId")
          _list path);
     host_name =
       (option_of_yojson (value_for_key name_of_yojson "HostName") _list path)
   } : virtual_machine_details)
let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "Message") _list
          path);
     error_code =
       (option_of_yojson (value_for_key string__of_yojson "ErrorCode") _list
          path)
   } : validation_exception)
let username_of_yojson = string_of_yojson
let server_arn_of_yojson = string_of_yojson
let update_hypervisor_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hypervisor_arn =
       (option_of_yojson (value_for_key server_arn_of_yojson "HypervisorArn")
          _list path)
   } : update_hypervisor_output)
let host_of_yojson = string_of_yojson
let password_of_yojson = string_of_yojson
let log_group_arn_of_yojson = string_of_yojson
let update_hypervisor_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     log_group_arn =
       (option_of_yojson
          (value_for_key log_group_arn_of_yojson "LogGroupArn") _list path);
     name =
       (option_of_yojson (value_for_key name_of_yojson "Name") _list path);
     password =
       (option_of_yojson (value_for_key password_of_yojson "Password") _list
          path);
     username =
       (option_of_yojson (value_for_key username_of_yojson "Username") _list
          path);
     host =
       (option_of_yojson (value_for_key host_of_yojson "Host") _list path);
     hypervisor_arn =
       (value_for_key server_arn_of_yojson "HypervisorArn" _list path)
   } : update_hypervisor_input)
let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "Message") _list
          path);
     error_code =
       (option_of_yojson (value_for_key string__of_yojson "ErrorCode") _list
          path)
   } : resource_not_found_exception)
let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "Message") _list
          path);
     error_code = (value_for_key string__of_yojson "ErrorCode" _list path)
   } : conflict_exception)
let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "Message") _list
          path);
     error_code = (value_for_key string__of_yojson "ErrorCode" _list path)
   } : access_denied_exception)
let gateway_arn_of_yojson = string_of_yojson
let update_gateway_software_now_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_arn =
       (option_of_yojson (value_for_key gateway_arn_of_yojson "GatewayArn")
          _list path)
   } : update_gateway_software_now_output)
let update_gateway_software_now_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_arn =
       (value_for_key gateway_arn_of_yojson "GatewayArn" _list path)
   } : update_gateway_software_now_input)
let update_gateway_information_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_arn =
       (option_of_yojson (value_for_key gateway_arn_of_yojson "GatewayArn")
          _list path)
   } : update_gateway_information_output)
let update_gateway_information_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_display_name =
       (option_of_yojson (value_for_key name_of_yojson "GatewayDisplayName")
          _list path);
     gateway_arn =
       (value_for_key gateway_arn_of_yojson "GatewayArn" _list path)
   } : update_gateway_information_input)
let untag_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n =
       (option_of_yojson (value_for_key resource_arn_of_yojson "ResourceARN")
          _list path)
   } : untag_resource_output)
let tag_keys_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path
let untag_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = (value_for_key tag_keys_of_yojson "TagKeys" _list path);
     resource_ar_n =
       (value_for_key resource_arn_of_yojson "ResourceARN" _list path)
   } : untag_resource_input)
let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "Message") _list
          path);
     error_code = (value_for_key string__of_yojson "ErrorCode" _list path)
   } : throttling_exception)
let test_hypervisor_configuration_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in (() : unit)
let test_hypervisor_configuration_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     password =
       (option_of_yojson (value_for_key password_of_yojson "Password") _list
          path);
     username =
       (option_of_yojson (value_for_key username_of_yojson "Username") _list
          path);
     host = (value_for_key host_of_yojson "Host" _list path);
     gateway_arn =
       (value_for_key gateway_arn_of_yojson "GatewayArn" _list path)
   } : test_hypervisor_configuration_input)
let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = (value_for_key tag_value_of_yojson "Value" _list path);
     key = (value_for_key tag_key_of_yojson "Key" _list path)
   } : tag)
let tags_of_yojson tree path = list_of_yojson tag_of_yojson tree path
let tag_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n =
       (option_of_yojson (value_for_key resource_arn_of_yojson "ResourceARN")
          _list path)
   } : tag_resource_output)
let tag_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = (value_for_key tags_of_yojson "Tags" _list path);
     resource_ar_n =
       (value_for_key resource_arn_of_yojson "ResourceARN" _list path)
   } : tag_resource_input)
let base_unit_of_yojson = unit_of_yojson
let sync_metadata_status_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "CREATED" -> CREATED
    | `String "RUNNING" -> RUNNING
    | `String "FAILED" -> FAILED
    | `String "PARTIALLY_FAILED" -> PARTIALLY_FAILED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "SyncMetadataStatus"
             value)
    | _ -> raise (deserialize_wrong_type_error path "SyncMetadataStatus") : 
     sync_metadata_status) : sync_metadata_status)
let start_virtual_machines_metadata_sync_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hypervisor_arn =
       (option_of_yojson (value_for_key server_arn_of_yojson "HypervisorArn")
          _list path)
   } : start_virtual_machines_metadata_sync_output)
let start_virtual_machines_metadata_sync_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hypervisor_arn =
       (value_for_key server_arn_of_yojson "HypervisorArn" _list path)
   } : start_virtual_machines_metadata_sync_input)
let put_maintenance_start_time_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_arn =
       (option_of_yojson (value_for_key gateway_arn_of_yojson "GatewayArn")
          _list path)
   } : put_maintenance_start_time_output)
let hour_of_day_of_yojson = int_of_yojson
let minute_of_hour_of_yojson = int_of_yojson
let day_of_week_of_yojson = int_of_yojson
let day_of_month_of_yojson = int_of_yojson
let put_maintenance_start_time_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     day_of_month =
       (option_of_yojson (value_for_key day_of_month_of_yojson "DayOfMonth")
          _list path);
     day_of_week =
       (option_of_yojson (value_for_key day_of_week_of_yojson "DayOfWeek")
          _list path);
     minute_of_hour =
       (value_for_key minute_of_hour_of_yojson "MinuteOfHour" _list path);
     hour_of_day =
       (value_for_key hour_of_day_of_yojson "HourOfDay" _list path);
     gateway_arn =
       (value_for_key gateway_arn_of_yojson "GatewayArn" _list path)
   } : put_maintenance_start_time_input)
let put_hypervisor_property_mappings_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hypervisor_arn =
       (option_of_yojson (value_for_key server_arn_of_yojson "HypervisorArn")
          _list path)
   } : put_hypervisor_property_mappings_output)
let iam_role_arn_of_yojson = string_of_yojson
let put_hypervisor_property_mappings_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     iam_role_arn =
       (value_for_key iam_role_arn_of_yojson "IamRoleArn" _list path);
     vmware_to_aws_tag_mappings =
       (value_for_key vmware_to_aws_tag_mappings_of_yojson
          "VmwareToAwsTagMappings" _list path);
     hypervisor_arn =
       (value_for_key server_arn_of_yojson "HypervisorArn" _list path)
   } : put_hypervisor_property_mappings_input)
let put_bandwidth_rate_limit_schedule_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_arn =
       (option_of_yojson (value_for_key gateway_arn_of_yojson "GatewayArn")
          _list path)
   } : put_bandwidth_rate_limit_schedule_output)
let average_upload_rate_limit_of_yojson = long_of_yojson
let days_of_week_of_yojson tree path =
  list_of_yojson day_of_week_of_yojson tree path
let bandwidth_rate_limit_interval_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     days_of_week =
       (value_for_key days_of_week_of_yojson "DaysOfWeek" _list path);
     end_minute_of_hour =
       (value_for_key minute_of_hour_of_yojson "EndMinuteOfHour" _list path);
     start_minute_of_hour =
       (value_for_key minute_of_hour_of_yojson "StartMinuteOfHour" _list path);
     end_hour_of_day =
       (value_for_key hour_of_day_of_yojson "EndHourOfDay" _list path);
     start_hour_of_day =
       (value_for_key hour_of_day_of_yojson "StartHourOfDay" _list path);
     average_upload_rate_limit_in_bits_per_sec =
       (option_of_yojson
          (value_for_key average_upload_rate_limit_of_yojson
             "AverageUploadRateLimitInBitsPerSec") _list path)
   } : bandwidth_rate_limit_interval)
let bandwidth_rate_limit_intervals_of_yojson tree path =
  list_of_yojson bandwidth_rate_limit_interval_of_yojson tree path
let put_bandwidth_rate_limit_schedule_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bandwidth_rate_limit_intervals =
       (value_for_key bandwidth_rate_limit_intervals_of_yojson
          "BandwidthRateLimitIntervals" _list path);
     gateway_arn =
       (value_for_key gateway_arn_of_yojson "GatewayArn" _list path)
   } : put_bandwidth_rate_limit_schedule_input)
let next_token_of_yojson = string_of_yojson
let max_results_of_yojson = int_of_yojson
let maintenance_start_time_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     minute_of_hour =
       (value_for_key minute_of_hour_of_yojson "MinuteOfHour" _list path);
     hour_of_day =
       (value_for_key hour_of_day_of_yojson "HourOfDay" _list path);
     day_of_week =
       (option_of_yojson (value_for_key day_of_week_of_yojson "DayOfWeek")
          _list path);
     day_of_month =
       (option_of_yojson (value_for_key day_of_month_of_yojson "DayOfMonth")
          _list path)
   } : maintenance_start_time)
let list_virtual_machines_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     virtual_machines =
       (option_of_yojson
          (value_for_key virtual_machines_of_yojson "VirtualMachines") _list
          path)
   } : list_virtual_machines_output)
let list_virtual_machines_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     max_results =
       (option_of_yojson (value_for_key max_results_of_yojson "MaxResults")
          _list path);
     hypervisor_arn =
       (option_of_yojson (value_for_key server_arn_of_yojson "HypervisorArn")
          _list path)
   } : list_virtual_machines_input)
let list_tags_for_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags =
       (option_of_yojson (value_for_key tags_of_yojson "Tags") _list path);
     resource_arn =
       (option_of_yojson (value_for_key resource_arn_of_yojson "ResourceArn")
          _list path)
   } : list_tags_for_resource_output)
let list_tags_for_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn =
       (value_for_key resource_arn_of_yojson "ResourceArn" _list path)
   } : list_tags_for_resource_input)
let kms_key_arn_of_yojson = string_of_yojson
let hypervisor_state_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "PENDING" -> PENDING
    | `String "ONLINE" -> ONLINE
    | `String "OFFLINE" -> OFFLINE
    | `String "ERROR" -> ERROR
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "HypervisorState" value)
    | _ -> raise (deserialize_wrong_type_error path "HypervisorState") : 
     hypervisor_state) : hypervisor_state)
let hypervisor_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state =
       (option_of_yojson (value_for_key hypervisor_state_of_yojson "State")
          _list path);
     name =
       (option_of_yojson (value_for_key name_of_yojson "Name") _list path);
     kms_key_arn =
       (option_of_yojson (value_for_key kms_key_arn_of_yojson "KmsKeyArn")
          _list path);
     hypervisor_arn =
       (option_of_yojson (value_for_key server_arn_of_yojson "HypervisorArn")
          _list path);
     host =
       (option_of_yojson (value_for_key host_of_yojson "Host") _list path)
   } : hypervisor)
let hypervisors_of_yojson tree path =
  list_of_yojson hypervisor_of_yojson tree path
let list_hypervisors_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     hypervisors =
       (option_of_yojson (value_for_key hypervisors_of_yojson "Hypervisors")
          _list path)
   } : list_hypervisors_output)
let list_hypervisors_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     max_results =
       (option_of_yojson (value_for_key max_results_of_yojson "MaxResults")
          _list path)
   } : list_hypervisors_input)
let gateway_type_of_yojson (tree : t) path =
  (let _list = assoc_of_yojson tree path in
   (match tree with
    | `String "BACKUP_VM" -> BACKUP_VM
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "GatewayType" value)
    | _ -> raise (deserialize_wrong_type_error path "GatewayType") : 
     gateway_type) : gateway_type)
let hypervisor_id_of_yojson = string_of_yojson
let gateway_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_seen_time =
       (option_of_yojson (value_for_key time_of_yojson "LastSeenTime") _list
          path);
     hypervisor_id =
       (option_of_yojson
          (value_for_key hypervisor_id_of_yojson "HypervisorId") _list path);
     gateway_type =
       (option_of_yojson (value_for_key gateway_type_of_yojson "GatewayType")
          _list path);
     gateway_display_name =
       (option_of_yojson (value_for_key name_of_yojson "GatewayDisplayName")
          _list path);
     gateway_arn =
       (option_of_yojson (value_for_key gateway_arn_of_yojson "GatewayArn")
          _list path)
   } : gateway)
let gateways_of_yojson tree path = list_of_yojson gateway_of_yojson tree path
let list_gateways_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     gateways =
       (option_of_yojson (value_for_key gateways_of_yojson "Gateways") _list
          path)
   } : list_gateways_output)
let list_gateways_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token =
       (option_of_yojson (value_for_key next_token_of_yojson "NextToken")
          _list path);
     max_results =
       (option_of_yojson (value_for_key max_results_of_yojson "MaxResults")
          _list path)
   } : list_gateways_input)
let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       (option_of_yojson (value_for_key string__of_yojson "Message") _list
          path);
     error_code =
       (option_of_yojson (value_for_key string__of_yojson "ErrorCode") _list
          path)
   } : internal_server_exception)
let import_hypervisor_configuration_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hypervisor_arn =
       (option_of_yojson (value_for_key server_arn_of_yojson "HypervisorArn")
          _list path)
   } : import_hypervisor_configuration_output)
let import_hypervisor_configuration_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags =
       (option_of_yojson (value_for_key tags_of_yojson "Tags") _list path);
     kms_key_arn =
       (option_of_yojson (value_for_key kms_key_arn_of_yojson "KmsKeyArn")
          _list path);
     password =
       (option_of_yojson (value_for_key password_of_yojson "Password") _list
          path);
     username =
       (option_of_yojson (value_for_key username_of_yojson "Username") _list
          path);
     host = (value_for_key host_of_yojson "Host" _list path);
     name = (value_for_key name_of_yojson "Name" _list path)
   } : import_hypervisor_configuration_input)
let hypervisor_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     latest_metadata_sync_status =
       (option_of_yojson
          (value_for_key sync_metadata_status_of_yojson
             "LatestMetadataSyncStatus") _list path);
     latest_metadata_sync_status_message =
       (option_of_yojson
          (value_for_key string__of_yojson "LatestMetadataSyncStatusMessage")
          _list path);
     last_successful_metadata_sync_time =
       (option_of_yojson
          (value_for_key time_of_yojson "LastSuccessfulMetadataSyncTime")
          _list path);
     state =
       (option_of_yojson (value_for_key hypervisor_state_of_yojson "State")
          _list path);
     log_group_arn =
       (option_of_yojson
          (value_for_key log_group_arn_of_yojson "LogGroupArn") _list path);
     name =
       (option_of_yojson (value_for_key name_of_yojson "Name") _list path);
     kms_key_arn =
       (option_of_yojson (value_for_key kms_key_arn_of_yojson "KmsKeyArn")
          _list path);
     hypervisor_arn =
       (option_of_yojson (value_for_key server_arn_of_yojson "HypervisorArn")
          _list path);
     host =
       (option_of_yojson (value_for_key host_of_yojson "Host") _list path)
   } : hypervisor_details)
let get_virtual_machine_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     virtual_machine =
       (option_of_yojson
          (value_for_key virtual_machine_details_of_yojson "VirtualMachine")
          _list path)
   } : get_virtual_machine_output)
let get_virtual_machine_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn =
       (value_for_key resource_arn_of_yojson "ResourceArn" _list path)
   } : get_virtual_machine_input)
let get_hypervisor_property_mappings_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     iam_role_arn =
       (option_of_yojson (value_for_key iam_role_arn_of_yojson "IamRoleArn")
          _list path);
     vmware_to_aws_tag_mappings =
       (option_of_yojson
          (value_for_key vmware_to_aws_tag_mappings_of_yojson
             "VmwareToAwsTagMappings") _list path);
     hypervisor_arn =
       (option_of_yojson (value_for_key server_arn_of_yojson "HypervisorArn")
          _list path)
   } : get_hypervisor_property_mappings_output)
let get_hypervisor_property_mappings_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hypervisor_arn =
       (value_for_key server_arn_of_yojson "HypervisorArn" _list path)
   } : get_hypervisor_property_mappings_input)
let get_hypervisor_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hypervisor =
       (option_of_yojson
          (value_for_key hypervisor_details_of_yojson "Hypervisor") _list
          path)
   } : get_hypervisor_output)
let get_hypervisor_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hypervisor_arn =
       (value_for_key server_arn_of_yojson "HypervisorArn" _list path)
   } : get_hypervisor_input)
let gateway_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_endpoint =
       (option_of_yojson (value_for_key vpc_endpoint_of_yojson "VpcEndpoint")
          _list path);
     next_update_availability_time =
       (option_of_yojson
          (value_for_key time_of_yojson "NextUpdateAvailabilityTime") _list
          path);
     maintenance_start_time =
       (option_of_yojson
          (value_for_key maintenance_start_time_of_yojson
             "MaintenanceStartTime") _list path);
     last_seen_time =
       (option_of_yojson (value_for_key time_of_yojson "LastSeenTime") _list
          path);
     hypervisor_id =
       (option_of_yojson
          (value_for_key hypervisor_id_of_yojson "HypervisorId") _list path);
     gateway_type =
       (option_of_yojson (value_for_key gateway_type_of_yojson "GatewayType")
          _list path);
     gateway_display_name =
       (option_of_yojson (value_for_key name_of_yojson "GatewayDisplayName")
          _list path);
     gateway_arn =
       (option_of_yojson (value_for_key gateway_arn_of_yojson "GatewayArn")
          _list path)
   } : gateway_details)
let get_gateway_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway =
       (option_of_yojson (value_for_key gateway_details_of_yojson "Gateway")
          _list path)
   } : get_gateway_output)
let get_gateway_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_arn =
       (value_for_key gateway_arn_of_yojson "GatewayArn" _list path)
   } : get_gateway_input)
let get_bandwidth_rate_limit_schedule_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bandwidth_rate_limit_intervals =
       (option_of_yojson
          (value_for_key bandwidth_rate_limit_intervals_of_yojson
             "BandwidthRateLimitIntervals") _list path);
     gateway_arn =
       (option_of_yojson (value_for_key gateway_arn_of_yojson "GatewayArn")
          _list path)
   } : get_bandwidth_rate_limit_schedule_output)
let get_bandwidth_rate_limit_schedule_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_arn =
       (value_for_key gateway_arn_of_yojson "GatewayArn" _list path)
   } : get_bandwidth_rate_limit_schedule_input)
let disassociate_gateway_from_server_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_arn =
       (option_of_yojson (value_for_key gateway_arn_of_yojson "GatewayArn")
          _list path)
   } : disassociate_gateway_from_server_output)
let disassociate_gateway_from_server_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_arn =
       (value_for_key gateway_arn_of_yojson "GatewayArn" _list path)
   } : disassociate_gateway_from_server_input)
let delete_hypervisor_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hypervisor_arn =
       (option_of_yojson (value_for_key server_arn_of_yojson "HypervisorArn")
          _list path)
   } : delete_hypervisor_output)
let delete_hypervisor_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     hypervisor_arn =
       (value_for_key server_arn_of_yojson "HypervisorArn" _list path)
   } : delete_hypervisor_input)
let delete_gateway_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_arn =
       (option_of_yojson (value_for_key gateway_arn_of_yojson "GatewayArn")
          _list path)
   } : delete_gateway_output)
let delete_gateway_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_arn =
       (value_for_key gateway_arn_of_yojson "GatewayArn" _list path)
   } : delete_gateway_input)
let create_gateway_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_arn =
       (option_of_yojson (value_for_key gateway_arn_of_yojson "GatewayArn")
          _list path)
   } : create_gateway_output)
let activation_key_of_yojson = string_of_yojson
let create_gateway_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags =
       (option_of_yojson (value_for_key tags_of_yojson "Tags") _list path);
     gateway_type =
       (value_for_key gateway_type_of_yojson "GatewayType" _list path);
     gateway_display_name =
       (value_for_key name_of_yojson "GatewayDisplayName" _list path);
     activation_key =
       (value_for_key activation_key_of_yojson "ActivationKey" _list path)
   } : create_gateway_input)
let associate_gateway_to_server_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_arn =
       (option_of_yojson (value_for_key gateway_arn_of_yojson "GatewayArn")
          _list path)
   } : associate_gateway_to_server_output)
let associate_gateway_to_server_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     server_arn = (value_for_key server_arn_of_yojson "ServerArn" _list path);
     gateway_arn =
       (value_for_key gateway_arn_of_yojson "GatewayArn" _list path)
   } : associate_gateway_to_server_input)
let base_string_of_yojson = string_of_yojson
let base_boolean_of_yojson = bool_of_yojson
let base_integer_of_yojson = int_of_yojson
let base_timestamp_of_yojson = timestamp_epoch_seconds_of_yojson
let base_long_of_yojson = long_of_yojson
let base_document_of_yojson = json_of_yojson
let base_float_of_yojson = float_of_yojson
let base_double_of_yojson = double_of_yojson
let base_short_of_yojson = short_of_yojson
let base_blob_of_yojson = blob_of_yojson
let base_byte_of_yojson = byte_of_yojson