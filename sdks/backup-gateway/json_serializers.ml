open Smaws_Lib.Json.SerializeHelpers
open Types

let string__to_yojson = string_to_yojson

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [
      ("ErrorCode", Some (string__to_yojson x.error_code));
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let activation_key_to_yojson = string_to_yojson

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("ErrorCode", Some (string__to_yojson x.error_code));
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let gateway_arn_to_yojson = string_to_yojson

let associate_gateway_to_server_output_to_yojson (x : associate_gateway_to_server_output) =
  assoc_to_yojson [ ("GatewayArn", option_to_yojson gateway_arn_to_yojson x.gateway_arn) ]

let server_arn_to_yojson = string_to_yojson

let associate_gateway_to_server_input_to_yojson (x : associate_gateway_to_server_input) =
  assoc_to_yojson
    [
      ("GatewayArn", Some (gateway_arn_to_yojson x.gateway_arn));
      ("ServerArn", Some (server_arn_to_yojson x.server_arn));
    ]

let average_upload_rate_limit_to_yojson = long_to_yojson

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("ErrorCode", option_to_yojson string__to_yojson x.error_code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let resource_arn_to_yojson = string_to_yojson

let untag_resource_output_to_yojson (x : untag_resource_output) =
  assoc_to_yojson [ ("ResourceARN", option_to_yojson resource_arn_to_yojson x.resource_ar_n) ]

let tag_key_to_yojson = string_to_yojson
let tag_keys_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_input_to_yojson (x : untag_resource_input) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (resource_arn_to_yojson x.resource_ar_n));
      ("TagKeys", Some (tag_keys_to_yojson x.tag_keys));
    ]

let tag_resource_output_to_yojson (x : tag_resource_output) =
  assoc_to_yojson [ ("ResourceARN", option_to_yojson resource_arn_to_yojson x.resource_ar_n) ]

let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tags_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_input_to_yojson (x : tag_resource_input) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (resource_arn_to_yojson x.resource_ar_n));
      ("Tags", Some (tags_to_yojson x.tags));
    ]

let list_tags_for_resource_output_to_yojson (x : list_tags_for_resource_output) =
  assoc_to_yojson
    [
      ("ResourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let list_tags_for_resource_input_to_yojson (x : list_tags_for_resource_input) =
  assoc_to_yojson [ ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let day_of_week_to_yojson = int_to_yojson
let days_of_week_to_yojson tree = list_to_yojson day_of_week_to_yojson tree
let minute_of_hour_to_yojson = int_to_yojson
let hour_of_day_to_yojson = int_to_yojson

let bandwidth_rate_limit_interval_to_yojson (x : bandwidth_rate_limit_interval) =
  assoc_to_yojson
    [
      ( "AverageUploadRateLimitInBitsPerSec",
        option_to_yojson average_upload_rate_limit_to_yojson
          x.average_upload_rate_limit_in_bits_per_sec );
      ("StartHourOfDay", Some (hour_of_day_to_yojson x.start_hour_of_day));
      ("EndHourOfDay", Some (hour_of_day_to_yojson x.end_hour_of_day));
      ("StartMinuteOfHour", Some (minute_of_hour_to_yojson x.start_minute_of_hour));
      ("EndMinuteOfHour", Some (minute_of_hour_to_yojson x.end_minute_of_hour));
      ("DaysOfWeek", Some (days_of_week_to_yojson x.days_of_week));
    ]

let bandwidth_rate_limit_intervals_to_yojson tree =
  list_to_yojson bandwidth_rate_limit_interval_to_yojson tree

let create_gateway_output_to_yojson (x : create_gateway_output) =
  assoc_to_yojson [ ("GatewayArn", option_to_yojson gateway_arn_to_yojson x.gateway_arn) ]

let gateway_type_to_yojson (x : gateway_type) = match x with BACKUP_VM -> `String "BACKUP_VM"
let name_to_yojson = string_to_yojson

let create_gateway_input_to_yojson (x : create_gateway_input) =
  assoc_to_yojson
    [
      ("ActivationKey", Some (activation_key_to_yojson x.activation_key));
      ("GatewayDisplayName", Some (name_to_yojson x.gateway_display_name));
      ("GatewayType", Some (gateway_type_to_yojson x.gateway_type));
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let day_of_month_to_yojson = int_to_yojson

let delete_gateway_output_to_yojson (x : delete_gateway_output) =
  assoc_to_yojson [ ("GatewayArn", option_to_yojson gateway_arn_to_yojson x.gateway_arn) ]

let delete_gateway_input_to_yojson (x : delete_gateway_input) =
  assoc_to_yojson [ ("GatewayArn", Some (gateway_arn_to_yojson x.gateway_arn)) ]

let delete_hypervisor_output_to_yojson (x : delete_hypervisor_output) =
  assoc_to_yojson [ ("HypervisorArn", option_to_yojson server_arn_to_yojson x.hypervisor_arn) ]

let delete_hypervisor_input_to_yojson (x : delete_hypervisor_input) =
  assoc_to_yojson [ ("HypervisorArn", Some (server_arn_to_yojson x.hypervisor_arn)) ]

let disassociate_gateway_from_server_output_to_yojson (x : disassociate_gateway_from_server_output)
    =
  assoc_to_yojson [ ("GatewayArn", option_to_yojson gateway_arn_to_yojson x.gateway_arn) ]

let disassociate_gateway_from_server_input_to_yojson (x : disassociate_gateway_from_server_input) =
  assoc_to_yojson [ ("GatewayArn", Some (gateway_arn_to_yojson x.gateway_arn)) ]

let time_to_yojson = timestamp_epoch_seconds_to_yojson
let hypervisor_id_to_yojson = string_to_yojson

let gateway_to_yojson (x : gateway) =
  assoc_to_yojson
    [
      ("GatewayArn", option_to_yojson gateway_arn_to_yojson x.gateway_arn);
      ("GatewayDisplayName", option_to_yojson name_to_yojson x.gateway_display_name);
      ("GatewayType", option_to_yojson gateway_type_to_yojson x.gateway_type);
      ("HypervisorId", option_to_yojson hypervisor_id_to_yojson x.hypervisor_id);
      ("LastSeenTime", option_to_yojson time_to_yojson x.last_seen_time);
    ]

let vpc_endpoint_to_yojson = string_to_yojson

let maintenance_start_time_to_yojson (x : maintenance_start_time) =
  assoc_to_yojson
    [
      ("DayOfMonth", option_to_yojson day_of_month_to_yojson x.day_of_month);
      ("DayOfWeek", option_to_yojson day_of_week_to_yojson x.day_of_week);
      ("HourOfDay", Some (hour_of_day_to_yojson x.hour_of_day));
      ("MinuteOfHour", Some (minute_of_hour_to_yojson x.minute_of_hour));
    ]

let gateway_details_to_yojson (x : gateway_details) =
  assoc_to_yojson
    [
      ("GatewayArn", option_to_yojson gateway_arn_to_yojson x.gateway_arn);
      ("GatewayDisplayName", option_to_yojson name_to_yojson x.gateway_display_name);
      ("GatewayType", option_to_yojson gateway_type_to_yojson x.gateway_type);
      ("HypervisorId", option_to_yojson hypervisor_id_to_yojson x.hypervisor_id);
      ("LastSeenTime", option_to_yojson time_to_yojson x.last_seen_time);
      ( "MaintenanceStartTime",
        option_to_yojson maintenance_start_time_to_yojson x.maintenance_start_time );
      ("NextUpdateAvailabilityTime", option_to_yojson time_to_yojson x.next_update_availability_time);
      ("VpcEndpoint", option_to_yojson vpc_endpoint_to_yojson x.vpc_endpoint);
      ("DeprecationDate", option_to_yojson time_to_yojson x.deprecation_date);
      ("SoftwareVersion", option_to_yojson name_to_yojson x.software_version);
    ]

let gateways_to_yojson tree = list_to_yojson gateway_to_yojson tree

let get_bandwidth_rate_limit_schedule_output_to_yojson
    (x : get_bandwidth_rate_limit_schedule_output) =
  assoc_to_yojson
    [
      ("GatewayArn", option_to_yojson gateway_arn_to_yojson x.gateway_arn);
      ( "BandwidthRateLimitIntervals",
        option_to_yojson bandwidth_rate_limit_intervals_to_yojson x.bandwidth_rate_limit_intervals
      );
    ]

let get_bandwidth_rate_limit_schedule_input_to_yojson (x : get_bandwidth_rate_limit_schedule_input)
    =
  assoc_to_yojson [ ("GatewayArn", Some (gateway_arn_to_yojson x.gateway_arn)) ]

let get_gateway_output_to_yojson (x : get_gateway_output) =
  assoc_to_yojson [ ("Gateway", option_to_yojson gateway_details_to_yojson x.gateway) ]

let get_gateway_input_to_yojson (x : get_gateway_input) =
  assoc_to_yojson [ ("GatewayArn", Some (gateway_arn_to_yojson x.gateway_arn)) ]

let sync_metadata_status_to_yojson (x : sync_metadata_status) =
  match x with
  | CREATED -> `String "CREATED"
  | RUNNING -> `String "RUNNING"
  | FAILED -> `String "FAILED"
  | PARTIALLY_FAILED -> `String "PARTIALLY_FAILED"
  | SUCCEEDED -> `String "SUCCEEDED"

let hypervisor_state_to_yojson (x : hypervisor_state) =
  match x with
  | PENDING -> `String "PENDING"
  | ONLINE -> `String "ONLINE"
  | OFFLINE -> `String "OFFLINE"
  | ERROR -> `String "ERROR"

let log_group_arn_to_yojson = string_to_yojson
let kms_key_arn_to_yojson = string_to_yojson
let host_to_yojson = string_to_yojson

let hypervisor_details_to_yojson (x : hypervisor_details) =
  assoc_to_yojson
    [
      ("Host", option_to_yojson host_to_yojson x.host);
      ("HypervisorArn", option_to_yojson server_arn_to_yojson x.hypervisor_arn);
      ("KmsKeyArn", option_to_yojson kms_key_arn_to_yojson x.kms_key_arn);
      ("Name", option_to_yojson name_to_yojson x.name);
      ("LogGroupArn", option_to_yojson log_group_arn_to_yojson x.log_group_arn);
      ("State", option_to_yojson hypervisor_state_to_yojson x.state);
      ( "LastSuccessfulMetadataSyncTime",
        option_to_yojson time_to_yojson x.last_successful_metadata_sync_time );
      ( "LatestMetadataSyncStatusMessage",
        option_to_yojson string__to_yojson x.latest_metadata_sync_status_message );
      ( "LatestMetadataSyncStatus",
        option_to_yojson sync_metadata_status_to_yojson x.latest_metadata_sync_status );
    ]

let get_hypervisor_output_to_yojson (x : get_hypervisor_output) =
  assoc_to_yojson [ ("Hypervisor", option_to_yojson hypervisor_details_to_yojson x.hypervisor) ]

let get_hypervisor_input_to_yojson (x : get_hypervisor_input) =
  assoc_to_yojson [ ("HypervisorArn", Some (server_arn_to_yojson x.hypervisor_arn)) ]

let iam_role_arn_to_yojson = string_to_yojson
let vmware_tag_name_to_yojson = string_to_yojson
let vmware_category_to_yojson = string_to_yojson

let vmware_to_aws_tag_mapping_to_yojson (x : vmware_to_aws_tag_mapping) =
  assoc_to_yojson
    [
      ("VmwareCategory", Some (vmware_category_to_yojson x.vmware_category));
      ("VmwareTagName", Some (vmware_tag_name_to_yojson x.vmware_tag_name));
      ("AwsTagKey", Some (tag_key_to_yojson x.aws_tag_key));
      ("AwsTagValue", Some (tag_value_to_yojson x.aws_tag_value));
    ]

let vmware_to_aws_tag_mappings_to_yojson tree =
  list_to_yojson vmware_to_aws_tag_mapping_to_yojson tree

let get_hypervisor_property_mappings_output_to_yojson (x : get_hypervisor_property_mappings_output)
    =
  assoc_to_yojson
    [
      ("HypervisorArn", option_to_yojson server_arn_to_yojson x.hypervisor_arn);
      ( "VmwareToAwsTagMappings",
        option_to_yojson vmware_to_aws_tag_mappings_to_yojson x.vmware_to_aws_tag_mappings );
      ("IamRoleArn", option_to_yojson iam_role_arn_to_yojson x.iam_role_arn);
    ]

let get_hypervisor_property_mappings_input_to_yojson (x : get_hypervisor_property_mappings_input) =
  assoc_to_yojson [ ("HypervisorArn", Some (server_arn_to_yojson x.hypervisor_arn)) ]

let vmware_tag_to_yojson (x : vmware_tag) =
  assoc_to_yojson
    [
      ("VmwareCategory", option_to_yojson vmware_category_to_yojson x.vmware_category);
      ("VmwareTagName", option_to_yojson vmware_tag_name_to_yojson x.vmware_tag_name);
      ("VmwareTagDescription", option_to_yojson string__to_yojson x.vmware_tag_description);
    ]

let vmware_tags_to_yojson tree = list_to_yojson vmware_tag_to_yojson tree
let path_to_yojson = string_to_yojson

let virtual_machine_details_to_yojson (x : virtual_machine_details) =
  assoc_to_yojson
    [
      ("HostName", option_to_yojson name_to_yojson x.host_name);
      ("HypervisorId", option_to_yojson string__to_yojson x.hypervisor_id);
      ("Name", option_to_yojson name_to_yojson x.name);
      ("Path", option_to_yojson path_to_yojson x.path);
      ("ResourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn);
      ("LastBackupDate", option_to_yojson time_to_yojson x.last_backup_date);
      ("VmwareTags", option_to_yojson vmware_tags_to_yojson x.vmware_tags);
    ]

let get_virtual_machine_output_to_yojson (x : get_virtual_machine_output) =
  assoc_to_yojson
    [ ("VirtualMachine", option_to_yojson virtual_machine_details_to_yojson x.virtual_machine) ]

let get_virtual_machine_input_to_yojson (x : get_virtual_machine_input) =
  assoc_to_yojson [ ("ResourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let hypervisor_to_yojson (x : hypervisor) =
  assoc_to_yojson
    [
      ("Host", option_to_yojson host_to_yojson x.host);
      ("HypervisorArn", option_to_yojson server_arn_to_yojson x.hypervisor_arn);
      ("KmsKeyArn", option_to_yojson kms_key_arn_to_yojson x.kms_key_arn);
      ("Name", option_to_yojson name_to_yojson x.name);
      ("State", option_to_yojson hypervisor_state_to_yojson x.state);
    ]

let hypervisors_to_yojson tree = list_to_yojson hypervisor_to_yojson tree

let import_hypervisor_configuration_output_to_yojson (x : import_hypervisor_configuration_output) =
  assoc_to_yojson [ ("HypervisorArn", option_to_yojson server_arn_to_yojson x.hypervisor_arn) ]

let password_to_yojson = string_to_yojson
let username_to_yojson = string_to_yojson

let import_hypervisor_configuration_input_to_yojson (x : import_hypervisor_configuration_input) =
  assoc_to_yojson
    [
      ("Name", Some (name_to_yojson x.name));
      ("Host", Some (host_to_yojson x.host));
      ("Username", option_to_yojson username_to_yojson x.username);
      ("Password", option_to_yojson password_to_yojson x.password);
      ("KmsKeyArn", option_to_yojson kms_key_arn_to_yojson x.kms_key_arn);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [
      ("ErrorCode", option_to_yojson string__to_yojson x.error_code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let next_token_to_yojson = string_to_yojson

let list_gateways_output_to_yojson (x : list_gateways_output) =
  assoc_to_yojson
    [
      ("Gateways", option_to_yojson gateways_to_yojson x.gateways);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson

let list_gateways_input_to_yojson (x : list_gateways_input) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_hypervisors_output_to_yojson (x : list_hypervisors_output) =
  assoc_to_yojson
    [
      ("Hypervisors", option_to_yojson hypervisors_to_yojson x.hypervisors);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_hypervisors_input_to_yojson (x : list_hypervisors_input) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let virtual_machine_to_yojson (x : virtual_machine) =
  assoc_to_yojson
    [
      ("HostName", option_to_yojson name_to_yojson x.host_name);
      ("HypervisorId", option_to_yojson string__to_yojson x.hypervisor_id);
      ("Name", option_to_yojson name_to_yojson x.name);
      ("Path", option_to_yojson path_to_yojson x.path);
      ("ResourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn);
      ("LastBackupDate", option_to_yojson time_to_yojson x.last_backup_date);
    ]

let virtual_machines_to_yojson tree = list_to_yojson virtual_machine_to_yojson tree

let list_virtual_machines_output_to_yojson (x : list_virtual_machines_output) =
  assoc_to_yojson
    [
      ("VirtualMachines", option_to_yojson virtual_machines_to_yojson x.virtual_machines);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_virtual_machines_input_to_yojson (x : list_virtual_machines_input) =
  assoc_to_yojson
    [
      ("HypervisorArn", option_to_yojson server_arn_to_yojson x.hypervisor_arn);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let put_bandwidth_rate_limit_schedule_output_to_yojson
    (x : put_bandwidth_rate_limit_schedule_output) =
  assoc_to_yojson [ ("GatewayArn", option_to_yojson gateway_arn_to_yojson x.gateway_arn) ]

let put_bandwidth_rate_limit_schedule_input_to_yojson (x : put_bandwidth_rate_limit_schedule_input)
    =
  assoc_to_yojson
    [
      ("GatewayArn", Some (gateway_arn_to_yojson x.gateway_arn));
      ( "BandwidthRateLimitIntervals",
        Some (bandwidth_rate_limit_intervals_to_yojson x.bandwidth_rate_limit_intervals) );
    ]

let put_hypervisor_property_mappings_output_to_yojson (x : put_hypervisor_property_mappings_output)
    =
  assoc_to_yojson [ ("HypervisorArn", option_to_yojson server_arn_to_yojson x.hypervisor_arn) ]

let put_hypervisor_property_mappings_input_to_yojson (x : put_hypervisor_property_mappings_input) =
  assoc_to_yojson
    [
      ("HypervisorArn", Some (server_arn_to_yojson x.hypervisor_arn));
      ( "VmwareToAwsTagMappings",
        Some (vmware_to_aws_tag_mappings_to_yojson x.vmware_to_aws_tag_mappings) );
      ("IamRoleArn", Some (iam_role_arn_to_yojson x.iam_role_arn));
    ]

let put_maintenance_start_time_output_to_yojson (x : put_maintenance_start_time_output) =
  assoc_to_yojson [ ("GatewayArn", option_to_yojson gateway_arn_to_yojson x.gateway_arn) ]

let put_maintenance_start_time_input_to_yojson (x : put_maintenance_start_time_input) =
  assoc_to_yojson
    [
      ("GatewayArn", Some (gateway_arn_to_yojson x.gateway_arn));
      ("HourOfDay", Some (hour_of_day_to_yojson x.hour_of_day));
      ("MinuteOfHour", Some (minute_of_hour_to_yojson x.minute_of_hour));
      ("DayOfWeek", option_to_yojson day_of_week_to_yojson x.day_of_week);
      ("DayOfMonth", option_to_yojson day_of_month_to_yojson x.day_of_month);
    ]

let start_virtual_machines_metadata_sync_output_to_yojson
    (x : start_virtual_machines_metadata_sync_output) =
  assoc_to_yojson [ ("HypervisorArn", option_to_yojson server_arn_to_yojson x.hypervisor_arn) ]

let start_virtual_machines_metadata_sync_input_to_yojson
    (x : start_virtual_machines_metadata_sync_input) =
  assoc_to_yojson [ ("HypervisorArn", Some (server_arn_to_yojson x.hypervisor_arn)) ]

let test_hypervisor_configuration_output_to_yojson = unit_to_yojson

let test_hypervisor_configuration_input_to_yojson (x : test_hypervisor_configuration_input) =
  assoc_to_yojson
    [
      ("GatewayArn", Some (gateway_arn_to_yojson x.gateway_arn));
      ("Host", Some (host_to_yojson x.host));
      ("Username", option_to_yojson username_to_yojson x.username);
      ("Password", option_to_yojson password_to_yojson x.password);
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("ErrorCode", Some (string__to_yojson x.error_code));
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let update_gateway_information_output_to_yojson (x : update_gateway_information_output) =
  assoc_to_yojson [ ("GatewayArn", option_to_yojson gateway_arn_to_yojson x.gateway_arn) ]

let update_gateway_information_input_to_yojson (x : update_gateway_information_input) =
  assoc_to_yojson
    [
      ("GatewayArn", Some (gateway_arn_to_yojson x.gateway_arn));
      ("GatewayDisplayName", option_to_yojson name_to_yojson x.gateway_display_name);
    ]

let update_gateway_software_now_output_to_yojson (x : update_gateway_software_now_output) =
  assoc_to_yojson [ ("GatewayArn", option_to_yojson gateway_arn_to_yojson x.gateway_arn) ]

let update_gateway_software_now_input_to_yojson (x : update_gateway_software_now_input) =
  assoc_to_yojson [ ("GatewayArn", Some (gateway_arn_to_yojson x.gateway_arn)) ]

let update_hypervisor_output_to_yojson (x : update_hypervisor_output) =
  assoc_to_yojson [ ("HypervisorArn", option_to_yojson server_arn_to_yojson x.hypervisor_arn) ]

let update_hypervisor_input_to_yojson (x : update_hypervisor_input) =
  assoc_to_yojson
    [
      ("HypervisorArn", Some (server_arn_to_yojson x.hypervisor_arn));
      ("Host", option_to_yojson host_to_yojson x.host);
      ("Username", option_to_yojson username_to_yojson x.username);
      ("Password", option_to_yojson password_to_yojson x.password);
      ("Name", option_to_yojson name_to_yojson x.name);
      ("LogGroupArn", option_to_yojson log_group_arn_to_yojson x.log_group_arn);
    ]

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("ErrorCode", option_to_yojson string__to_yojson x.error_code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]
