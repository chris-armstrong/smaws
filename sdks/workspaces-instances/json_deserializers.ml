open Smaws_Lib.Json.DeserializeHelpers
open Types

let provision_state_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "ERROR_DEALLOCATING" -> ERROR_DEALLOCATING
    | `String "ERROR_ALLOCATING" -> ERROR_ALLOCATING
    | `String "DEALLOCATED" -> DEALLOCATED
    | `String "DEALLOCATING" -> DEALLOCATING
    | `String "ALLOCATED" -> ALLOCATED
    | `String "ALLOCATING" -> ALLOCATING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ProvisionStateEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "ProvisionStateEnum")
     : provision_state_enum)
    : provision_state_enum)

let workspace_instance_id_of_yojson = string_of_yojson

let ec2_managed_instance_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "InstanceId")
         _list path;
   }
    : ec2_managed_instance)

let workspace_instance_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ec2_managed_instance =
       option_of_yojson
         (value_for_key ec2_managed_instance_of_yojson "EC2ManagedInstance")
         _list path;
     workspace_instance_id =
       option_of_yojson
         (value_for_key workspace_instance_id_of_yojson "WorkspaceInstanceId")
         _list path;
     provision_state =
       option_of_yojson (value_for_key provision_state_enum_of_yojson "ProvisionState") _list path;
   }
    : workspace_instance)

let workspace_instances_of_yojson tree path = list_of_yojson workspace_instance_of_yojson tree path

let workspace_instance_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ErrorMessage")
         _list path;
     error_code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ErrorCode")
         _list path;
   }
    : workspace_instance_error)

let workspace_instance_errors_of_yojson tree path =
  list_of_yojson workspace_instance_error_of_yojson tree path

let volume_type_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "gp3" -> GP3
    | `String "st1" -> ST1
    | `String "sc1" -> SC1
    | `String "gp2" -> GP2
    | `String "io2" -> IO2
    | `String "io1" -> IO1
    | `String "standard" -> STANDARD
    | `String value -> raise (deserialize_unknown_enum_value_error path "VolumeTypeEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "VolumeTypeEnum")
     : volume_type_enum)
    : volume_type_enum)

let volume_id_of_yojson = string_of_yojson
let virtual_name_of_yojson = string_of_yojson

let validation_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "OTHER" -> OTHER
    | `String "DEPENDENCY_FAILURE" -> DEPENDENCY_FAILURE
    | `String "FIELD_VALIDATION_FAILED" -> FIELD_VALIDATION_FAILED
    | `String "CANNOT_PARSE" -> CANNOT_PARSE
    | `String "UNSUPPORTED_OPERATION" -> UNSUPPORTED_OPERATION
    | `String "UNKNOWN_OPERATION" -> UNKNOWN_OPERATION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ValidationExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidationExceptionReason")
     : validation_exception_reason)
    : validation_exception_reason)

let validation_exception_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message" _list path;
     reason =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Reason" _list path;
     name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Name" _list path;
   }
    : validation_exception_field)

let validation_exception_field_list_of_yojson tree path =
  list_of_yojson validation_exception_field_of_yojson tree path

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     field_list =
       option_of_yojson
         (value_for_key validation_exception_field_list_of_yojson "FieldList")
         _list path;
     reason = value_for_key validation_exception_reason_of_yojson "Reason" _list path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message" _list path;
   }
    : validation_exception)

let user_data_of_yojson = string_of_yojson

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
     workspace_instance_id =
       value_for_key workspace_instance_id_of_yojson "WorkspaceInstanceId" _list path;
   }
    : untag_resource_request)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retry_after_seconds =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "RetryAfterSeconds")
         _list path;
     quota_code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "QuotaCode")
         _list path;
     service_code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ServiceCode")
         _list path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message" _list path;
   }
    : throttling_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ResourceType" _list
         path;
     resource_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ResourceId" _list
         path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message" _list path;
   }
    : resource_not_found_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retry_after_seconds =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "RetryAfterSeconds")
         _list path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message" _list path;
   }
    : internal_server_exception)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message" _list path;
   }
    : access_denied_exception)

let tenancy_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "host" -> HOST
    | `String "dedicated" -> DEDICATED
    | `String "default" -> DEFAULT
    | `String value -> raise (deserialize_unknown_enum_value_error path "TenancyEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "TenancyEnum")
     : tenancy_enum)
    : tenancy_enum)

let tag_value_of_yojson = string_of_yojson

let resource_type_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "network-interface" -> NETWORK_INTERFACE
    | `String "spot-instances-request" -> SPOT_INSTANCES_REQUEST
    | `String "volume" -> VOLUME
    | `String "instance" -> INSTANCE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceTypeEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceTypeEnum")
     : resource_type_enum)
    : resource_type_enum)

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key tag_value_of_yojson "Value") _list path;
     key = option_of_yojson (value_for_key tag_key_of_yojson "Key") _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let tag_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_enum_of_yojson "ResourceType") _list path;
   }
    : tag_specification)

let tag_specifications_of_yojson tree path = list_of_yojson tag_specification_of_yojson tree path

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
     workspace_instance_id =
       value_for_key workspace_instance_id_of_yojson "WorkspaceInstanceId" _list path;
   }
    : tag_resource_request)

let billing_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "HOURLY" -> HOURLY
    | `String "MONTHLY" -> MONTHLY
    | `String value -> raise (deserialize_unknown_enum_value_error path "BillingMode" value)
    | _ -> raise (deserialize_wrong_type_error path "BillingMode")
     : billing_mode)
    : billing_mode)

let platform_type_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "SUSE Linux" -> SUSE
    | `String "Red Hat BYOL Linux" -> LINUX_BYOL
    | `String "Red Hat Enterprise Linux" -> RHEL
    | `String "Ubuntu Pro Linux" -> UBUNTU_PRO
    | `String "Linux/UNIX" -> LINUX_UNIX
    | `String "Windows BYOL" -> WINDOWS_BYOL
    | `String "Windows" -> WINDOWS
    | `String value -> raise (deserialize_unknown_enum_value_error path "PlatformTypeEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "PlatformTypeEnum")
     : platform_type_enum)
    : platform_type_enum)

let instance_configuration_tenancy_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "DEDICATED" -> DEDICATED
    | `String "SHARED" -> SHARED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InstanceConfigurationTenancyEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceConfigurationTenancyEnum")
     : instance_configuration_tenancy_enum)
    : instance_configuration_tenancy_enum)

let supported_instance_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tenancy =
       option_of_yojson
         (value_for_key instance_configuration_tenancy_enum_of_yojson "Tenancy")
         _list path;
     platform_type =
       option_of_yojson (value_for_key platform_type_enum_of_yojson "PlatformType") _list path;
     billing_mode = option_of_yojson (value_for_key billing_mode_of_yojson "BillingMode") _list path;
   }
    : supported_instance_configuration)

let supported_instance_configurations_of_yojson tree path =
  list_of_yojson supported_instance_configuration_of_yojson tree path

let subnet_id_of_yojson = string_of_yojson
let string64_of_yojson = string_of_yojson
let string128_of_yojson = string_of_yojson
let non_negative_integer_of_yojson = int_of_yojson

let instance_interruption_behavior_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "stop" -> STOP
    | `String "hibernate" -> HIBERNATE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InstanceInterruptionBehaviorEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceInterruptionBehaviorEnum")
     : instance_interruption_behavior_enum)
    : instance_interruption_behavior_enum)

let spot_instance_type_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "persistent" -> PERSISTENT
    | `String "one-time" -> ONE_TIME
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SpotInstanceTypeEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "SpotInstanceTypeEnum")
     : spot_instance_type_enum)
    : spot_instance_type_enum)

let spot_market_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     valid_until_utc =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "ValidUntilUtc")
         _list path;
     spot_instance_type =
       option_of_yojson
         (value_for_key spot_instance_type_enum_of_yojson "SpotInstanceType")
         _list path;
     max_price = option_of_yojson (value_for_key string64_of_yojson "MaxPrice") _list path;
     instance_interruption_behavior =
       option_of_yojson
         (value_for_key instance_interruption_behavior_enum_of_yojson "InstanceInterruptionBehavior")
         _list path;
     block_duration_minutes =
       option_of_yojson
         (value_for_key non_negative_integer_of_yojson "BlockDurationMinutes")
         _list path;
   }
    : spot_market_options)

let snapshot_id_of_yojson = string_of_yojson

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     quota_code =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "QuotaCode" _list
         path;
     service_code =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ServiceCode" _list
         path;
     resource_type =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ResourceType" _list
         path;
     resource_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ResourceId" _list
         path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message" _list path;
   }
    : service_quota_exceeded_exception)

let security_group_name_of_yojson = string_of_yojson

let security_group_names_of_yojson tree path =
  list_of_yojson security_group_name_of_yojson tree path

let security_group_id_of_yojson = string_of_yojson
let security_group_ids_of_yojson tree path = list_of_yojson security_group_id_of_yojson tree path

let run_instances_monitoring_enabled_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "Enabled")
         _list path;
   }
    : run_instances_monitoring_enabled)

let region_name_of_yojson = string_of_yojson

let region_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ region_name = option_of_yojson (value_for_key region_name_of_yojson "RegionName") _list path }
    : region)

let region_list_of_yojson tree path = list_of_yojson region_of_yojson tree path
let provision_states_of_yojson tree path = list_of_yojson provision_state_enum_of_yojson tree path
let ipv4_address_of_yojson = string_of_yojson

let private_ip_address_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     private_ip_address =
       option_of_yojson (value_for_key ipv4_address_of_yojson "PrivateIpAddress") _list path;
     primary =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "Primary")
         _list path;
   }
    : private_ip_address_specification)

let private_ip_addresses_of_yojson tree path =
  list_of_yojson private_ip_address_specification_of_yojson tree path

let hostname_type_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "resource-name" -> RESOURCE_NAME
    | `String "ip-name" -> IP_NAME
    | `String value -> raise (deserialize_unknown_enum_value_error path "HostnameTypeEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "HostnameTypeEnum")
     : hostname_type_enum)
    : hostname_type_enum)

let private_dns_name_options_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enable_resource_name_dns_aaaa_record =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "EnableResourceNameDnsAAAARecord")
         _list path;
     enable_resource_name_dns_a_record =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "EnableResourceNameDnsARecord")
         _list path;
     hostname_type =
       option_of_yojson (value_for_key hostname_type_enum_of_yojson "HostnameType") _list path;
   }
    : private_dns_name_options_request)

let placement_group_id_of_yojson = string_of_yojson
let availability_zone_of_yojson = string_of_yojson
let host_id_of_yojson = string_of_yojson
let ar_n_of_yojson = string_of_yojson

let placement_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tenancy = option_of_yojson (value_for_key tenancy_enum_of_yojson "Tenancy") _list path;
     partition_number =
       option_of_yojson (value_for_key non_negative_integer_of_yojson "PartitionNumber") _list path;
     host_resource_group_arn =
       option_of_yojson (value_for_key ar_n_of_yojson "HostResourceGroupArn") _list path;
     host_id = option_of_yojson (value_for_key host_id_of_yojson "HostId") _list path;
     group_name = option_of_yojson (value_for_key string64_of_yojson "GroupName") _list path;
     group_id = option_of_yojson (value_for_key placement_group_id_of_yojson "GroupId") _list path;
     availability_zone =
       option_of_yojson (value_for_key availability_zone_of_yojson "AvailabilityZone") _list path;
     affinity = option_of_yojson (value_for_key string64_of_yojson "Affinity") _list path;
   }
    : placement)

let next_token_of_yojson = string_of_yojson

let connection_tracking_specification_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     udp_timeout =
       option_of_yojson (value_for_key non_negative_integer_of_yojson "UdpTimeout") _list path;
     udp_stream_timeout =
       option_of_yojson (value_for_key non_negative_integer_of_yojson "UdpStreamTimeout") _list path;
     tcp_established_timeout =
       option_of_yojson
         (value_for_key non_negative_integer_of_yojson "TcpEstablishedTimeout")
         _list path;
   }
    : connection_tracking_specification_request)

let description_of_yojson = string_of_yojson

let ena_srd_udp_specification_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ena_srd_udp_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "EnaSrdUdpEnabled")
         _list path;
   }
    : ena_srd_udp_specification_request)

let ena_srd_specification_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ena_srd_udp_specification =
       option_of_yojson
         (value_for_key ena_srd_udp_specification_request_of_yojson "EnaSrdUdpSpecification")
         _list path;
     ena_srd_enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "EnaSrdEnabled")
         _list path;
   }
    : ena_srd_specification_request)

let interface_type_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "efa-only" -> EFA_ONLY
    | `String "efa" -> EFA
    | `String "interface" -> INTERFACE
    | `String value -> raise (deserialize_unknown_enum_value_error path "InterfaceTypeEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "InterfaceTypeEnum")
     : interface_type_enum)
    : interface_type_enum)

let ipv4_prefix_of_yojson = string_of_yojson

let ipv4_prefix_specification_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ ipv4_prefix = option_of_yojson (value_for_key ipv4_prefix_of_yojson "Ipv4Prefix") _list path }
    : ipv4_prefix_specification_request)

let ipv4_prefixes_of_yojson tree path =
  list_of_yojson ipv4_prefix_specification_request_of_yojson tree path

let ipv6_address_of_yojson = string_of_yojson

let instance_ipv6_address_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     is_primary_ipv6 =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "IsPrimaryIpv6")
         _list path;
     ipv6_address = option_of_yojson (value_for_key ipv6_address_of_yojson "Ipv6Address") _list path;
   }
    : instance_ipv6_address)

let ipv6_addresses_of_yojson tree path = list_of_yojson instance_ipv6_address_of_yojson tree path
let ipv6_prefix_of_yojson = string_of_yojson

let ipv6_prefix_specification_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ ipv6_prefix = option_of_yojson (value_for_key ipv6_prefix_of_yojson "Ipv6Prefix") _list path }
    : ipv6_prefix_specification_request)

let ipv6_prefixes_of_yojson tree path =
  list_of_yojson ipv6_prefix_specification_request_of_yojson tree path

let network_interface_id_of_yojson = string_of_yojson

let instance_network_interface_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subnet_id = option_of_yojson (value_for_key subnet_id_of_yojson "SubnetId") _list path;
     groups = option_of_yojson (value_for_key security_group_ids_of_yojson "Groups") _list path;
     secondary_private_ip_address_count =
       option_of_yojson
         (value_for_key non_negative_integer_of_yojson "SecondaryPrivateIpAddressCount")
         _list path;
     private_ip_addresses =
       option_of_yojson
         (value_for_key private_ip_addresses_of_yojson "PrivateIpAddresses")
         _list path;
     private_ip_address =
       option_of_yojson (value_for_key ipv4_address_of_yojson "PrivateIpAddress") _list path;
     primary_ipv6 =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "PrimaryIpv6")
         _list path;
     network_interface_id =
       option_of_yojson
         (value_for_key network_interface_id_of_yojson "NetworkInterfaceId")
         _list path;
     network_card_index =
       option_of_yojson (value_for_key non_negative_integer_of_yojson "NetworkCardIndex") _list path;
     ipv6_prefix_count =
       option_of_yojson (value_for_key non_negative_integer_of_yojson "Ipv6PrefixCount") _list path;
     ipv6_prefixes =
       option_of_yojson (value_for_key ipv6_prefixes_of_yojson "Ipv6Prefixes") _list path;
     ipv6_addresses =
       option_of_yojson (value_for_key ipv6_addresses_of_yojson "Ipv6Addresses") _list path;
     ipv6_address_count =
       option_of_yojson (value_for_key non_negative_integer_of_yojson "Ipv6AddressCount") _list path;
     ipv4_prefix_count =
       option_of_yojson (value_for_key non_negative_integer_of_yojson "Ipv4PrefixCount") _list path;
     ipv4_prefixes =
       option_of_yojson (value_for_key ipv4_prefixes_of_yojson "Ipv4Prefixes") _list path;
     interface_type =
       option_of_yojson (value_for_key interface_type_enum_of_yojson "InterfaceType") _list path;
     ena_srd_specification =
       option_of_yojson
         (value_for_key ena_srd_specification_request_of_yojson "EnaSrdSpecification")
         _list path;
     device_index =
       option_of_yojson (value_for_key non_negative_integer_of_yojson "DeviceIndex") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     connection_tracking_specification =
       option_of_yojson
         (value_for_key connection_tracking_specification_request_of_yojson
            "ConnectionTrackingSpecification")
         _list path;
     associate_public_ip_address =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "AssociatePublicIpAddress")
         _list path;
     associate_carrier_ip_address =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "AssociateCarrierIpAddress")
         _list path;
   }
    : instance_network_interface_specification)

let network_interfaces_of_yojson tree path =
  list_of_yojson instance_network_interface_specification_of_yojson tree path

let max_results_of_yojson = int_of_yojson

let market_type_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "capacity-block" -> CAPACITY_BLOCK
    | `String "spot" -> SPOT
    | `String value -> raise (deserialize_unknown_enum_value_error path "MarketTypeEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "MarketTypeEnum")
     : market_type_enum)
    : market_type_enum)

let device_name_of_yojson = string_of_yojson
let kms_key_id_of_yojson = string_of_yojson

let ebs_block_device_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     volume_size =
       option_of_yojson (value_for_key non_negative_integer_of_yojson "VolumeSize") _list path;
     throughput =
       option_of_yojson (value_for_key non_negative_integer_of_yojson "Throughput") _list path;
     iops = option_of_yojson (value_for_key non_negative_integer_of_yojson "Iops") _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "KmsKeyId") _list path;
     encrypted =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "Encrypted")
         _list path;
     volume_type =
       option_of_yojson (value_for_key volume_type_enum_of_yojson "VolumeType") _list path;
   }
    : ebs_block_device)

let block_device_mapping_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     virtual_name = option_of_yojson (value_for_key virtual_name_of_yojson "VirtualName") _list path;
     no_device = option_of_yojson (value_for_key device_name_of_yojson "NoDevice") _list path;
     ebs = option_of_yojson (value_for_key ebs_block_device_of_yojson "Ebs") _list path;
     device_name = option_of_yojson (value_for_key device_name_of_yojson "DeviceName") _list path;
   }
    : block_device_mapping_request)

let block_device_mappings_of_yojson tree path =
  list_of_yojson block_device_mapping_request_of_yojson tree path

let capacity_reservation_preference_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "none" -> NONE
    | `String "open" -> OPEN
    | `String "capacity-reservations-only" -> CAPACITY_RESERVATIONS_ONLY
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CapacityReservationPreferenceEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "CapacityReservationPreferenceEnum")
     : capacity_reservation_preference_enum)
    : capacity_reservation_preference_enum)

let capacity_reservation_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capacity_reservation_resource_group_arn =
       option_of_yojson
         (value_for_key ar_n_of_yojson "CapacityReservationResourceGroupArn")
         _list path;
     capacity_reservation_id =
       option_of_yojson (value_for_key string128_of_yojson "CapacityReservationId") _list path;
   }
    : capacity_reservation_target)

let capacity_reservation_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     capacity_reservation_target =
       option_of_yojson
         (value_for_key capacity_reservation_target_of_yojson "CapacityReservationTarget")
         _list path;
     capacity_reservation_preference =
       option_of_yojson
         (value_for_key capacity_reservation_preference_enum_of_yojson
            "CapacityReservationPreference")
         _list path;
   }
    : capacity_reservation_specification)

let amd_sev_snp_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "disabled" -> DISABLED
    | `String "enabled" -> ENABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "AmdSevSnpEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "AmdSevSnpEnum")
     : amd_sev_snp_enum)
    : amd_sev_snp_enum)

let cpu_options_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     threads_per_core =
       option_of_yojson (value_for_key non_negative_integer_of_yojson "ThreadsPerCore") _list path;
     core_count =
       option_of_yojson (value_for_key non_negative_integer_of_yojson "CoreCount") _list path;
     amd_sev_snp =
       option_of_yojson (value_for_key amd_sev_snp_enum_of_yojson "AmdSevSnp") _list path;
   }
    : cpu_options_request)

let cpu_credits_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "unlimited" -> UNLIMITED
    | `String "standard" -> STANDARD
    | `String value -> raise (deserialize_unknown_enum_value_error path "CpuCreditsEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "CpuCreditsEnum")
     : cpu_credits_enum)
    : cpu_credits_enum)

let credit_specification_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cpu_credits =
       option_of_yojson (value_for_key cpu_credits_enum_of_yojson "CpuCredits") _list path;
   }
    : credit_specification_request)

let enclave_options_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enabled =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "Enabled")
         _list path;
   }
    : enclave_options_request)

let hibernation_options_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configured =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "Configured")
         _list path;
   }
    : hibernation_options_request)

let iam_instance_profile_specification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key string64_of_yojson "Name") _list path;
     arn = option_of_yojson (value_for_key ar_n_of_yojson "Arn") _list path;
   }
    : iam_instance_profile_specification)

let image_id_of_yojson = string_of_yojson

let instance_market_options_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     spot_options =
       option_of_yojson (value_for_key spot_market_options_of_yojson "SpotOptions") _list path;
     market_type =
       option_of_yojson (value_for_key market_type_enum_of_yojson "MarketType") _list path;
   }
    : instance_market_options_request)

let instance_type_of_yojson = string_of_yojson

let license_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     license_configuration_arn =
       option_of_yojson (value_for_key ar_n_of_yojson "LicenseConfigurationArn") _list path;
   }
    : license_configuration_request)

let license_specifications_of_yojson tree path =
  list_of_yojson license_configuration_request_of_yojson tree path

let auto_recovery_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "default" -> DEFAULT
    | `String "disabled" -> DISABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "AutoRecoveryEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "AutoRecoveryEnum")
     : auto_recovery_enum)
    : auto_recovery_enum)

let instance_maintenance_options_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auto_recovery =
       option_of_yojson (value_for_key auto_recovery_enum_of_yojson "AutoRecovery") _list path;
   }
    : instance_maintenance_options_request)

let http_endpoint_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "disabled" -> DISABLED
    | `String "enabled" -> ENABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "HttpEndpointEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "HttpEndpointEnum")
     : http_endpoint_enum)
    : http_endpoint_enum)

let http_protocol_ipv6_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "disabled" -> DISABLED
    | `String "enabled" -> ENABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "HttpProtocolIpv6Enum" value)
    | _ -> raise (deserialize_wrong_type_error path "HttpProtocolIpv6Enum")
     : http_protocol_ipv6_enum)
    : http_protocol_ipv6_enum)

let http_put_response_hop_limit_of_yojson = int_of_yojson

let http_tokens_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "required" -> REQUIRED
    | `String "optional" -> OPTIONAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "HttpTokensEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "HttpTokensEnum")
     : http_tokens_enum)
    : http_tokens_enum)

let instance_metadata_tags_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "disabled" -> DISABLED
    | `String "enabled" -> ENABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InstanceMetadataTagsEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "InstanceMetadataTagsEnum")
     : instance_metadata_tags_enum)
    : instance_metadata_tags_enum)

let instance_metadata_options_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_metadata_tags =
       option_of_yojson
         (value_for_key instance_metadata_tags_enum_of_yojson "InstanceMetadataTags")
         _list path;
     http_tokens =
       option_of_yojson (value_for_key http_tokens_enum_of_yojson "HttpTokens") _list path;
     http_put_response_hop_limit =
       option_of_yojson
         (value_for_key http_put_response_hop_limit_of_yojson "HttpPutResponseHopLimit")
         _list path;
     http_protocol_ipv6 =
       option_of_yojson
         (value_for_key http_protocol_ipv6_enum_of_yojson "HttpProtocolIpv6")
         _list path;
     http_endpoint =
       option_of_yojson (value_for_key http_endpoint_enum_of_yojson "HttpEndpoint") _list path;
   }
    : instance_metadata_options_request)

let bandwidth_weighting_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "ebs-1" -> EBS_1
    | `String "vpc-1" -> VPC_1
    | `String "default" -> DEFAULT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "BandwidthWeightingEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "BandwidthWeightingEnum")
     : bandwidth_weighting_enum)
    : bandwidth_weighting_enum)

let instance_network_performance_options_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bandwidth_weighting =
       option_of_yojson
         (value_for_key bandwidth_weighting_enum_of_yojson "BandwidthWeighting")
         _list path;
   }
    : instance_network_performance_options_request)

let managed_instance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_data = option_of_yojson (value_for_key user_data_of_yojson "UserData") _list path;
     tag_specifications =
       option_of_yojson (value_for_key tag_specifications_of_yojson "TagSpecifications") _list path;
     subnet_id = option_of_yojson (value_for_key subnet_id_of_yojson "SubnetId") _list path;
     security_groups =
       option_of_yojson (value_for_key security_group_names_of_yojson "SecurityGroups") _list path;
     security_group_ids =
       option_of_yojson (value_for_key security_group_ids_of_yojson "SecurityGroupIds") _list path;
     ramdisk_id = option_of_yojson (value_for_key string128_of_yojson "RamdiskId") _list path;
     private_ip_address =
       option_of_yojson (value_for_key ipv4_address_of_yojson "PrivateIpAddress") _list path;
     private_dns_name_options =
       option_of_yojson
         (value_for_key private_dns_name_options_request_of_yojson "PrivateDnsNameOptions")
         _list path;
     placement = option_of_yojson (value_for_key placement_of_yojson "Placement") _list path;
     network_performance_options =
       option_of_yojson
         (value_for_key instance_network_performance_options_request_of_yojson
            "NetworkPerformanceOptions")
         _list path;
     network_interfaces =
       option_of_yojson (value_for_key network_interfaces_of_yojson "NetworkInterfaces") _list path;
     monitoring =
       option_of_yojson
         (value_for_key run_instances_monitoring_enabled_of_yojson "Monitoring")
         _list path;
     metadata_options =
       option_of_yojson
         (value_for_key instance_metadata_options_request_of_yojson "MetadataOptions")
         _list path;
     maintenance_options =
       option_of_yojson
         (value_for_key instance_maintenance_options_request_of_yojson "MaintenanceOptions")
         _list path;
     license_specifications =
       option_of_yojson
         (value_for_key license_specifications_of_yojson "LicenseSpecifications")
         _list path;
     key_name = option_of_yojson (value_for_key string64_of_yojson "KeyName") _list path;
     kernel_id = option_of_yojson (value_for_key string128_of_yojson "KernelId") _list path;
     ipv6_address_count =
       option_of_yojson (value_for_key non_negative_integer_of_yojson "Ipv6AddressCount") _list path;
     ipv6_addresses =
       option_of_yojson (value_for_key ipv6_addresses_of_yojson "Ipv6Addresses") _list path;
     instance_type =
       option_of_yojson (value_for_key instance_type_of_yojson "InstanceType") _list path;
     instance_market_options =
       option_of_yojson
         (value_for_key instance_market_options_request_of_yojson "InstanceMarketOptions")
         _list path;
     image_id = option_of_yojson (value_for_key image_id_of_yojson "ImageId") _list path;
     iam_instance_profile =
       option_of_yojson
         (value_for_key iam_instance_profile_specification_of_yojson "IamInstanceProfile")
         _list path;
     hibernation_options =
       option_of_yojson
         (value_for_key hibernation_options_request_of_yojson "HibernationOptions")
         _list path;
     enclave_options =
       option_of_yojson
         (value_for_key enclave_options_request_of_yojson "EnclaveOptions")
         _list path;
     enable_primary_ipv6 =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson
            "EnablePrimaryIpv6")
         _list path;
     ebs_optimized =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "EbsOptimized")
         _list path;
     disable_api_stop =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "DisableApiStop")
         _list path;
     credit_specification =
       option_of_yojson
         (value_for_key credit_specification_request_of_yojson "CreditSpecification")
         _list path;
     cpu_options =
       option_of_yojson (value_for_key cpu_options_request_of_yojson "CpuOptions") _list path;
     capacity_reservation_specification =
       option_of_yojson
         (value_for_key capacity_reservation_specification_of_yojson
            "CapacityReservationSpecification")
         _list path;
     block_device_mappings =
       option_of_yojson
         (value_for_key block_device_mappings_of_yojson "BlockDeviceMappings")
         _list path;
   }
    : managed_instance_request)

let list_workspace_instances_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     workspace_instances =
       value_for_key workspace_instances_of_yojson "WorkspaceInstances" _list path;
   }
    : list_workspace_instances_response)

let list_workspace_instances_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     provision_states =
       option_of_yojson (value_for_key provision_states_of_yojson "ProvisionStates") _list path;
   }
    : list_workspace_instances_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workspace_instance_id =
       value_for_key workspace_instance_id_of_yojson "WorkspaceInstanceId" _list path;
   }
    : list_tags_for_resource_request)

let list_regions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     regions = value_for_key region_list_of_yojson "Regions" _list path;
   }
    : list_regions_response)

let list_regions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_regions_request)

let instance_type_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     supported_instance_configurations =
       option_of_yojson
         (value_for_key supported_instance_configurations_of_yojson
            "SupportedInstanceConfigurations")
         _list path;
     instance_type =
       option_of_yojson (value_for_key instance_type_of_yojson "InstanceType") _list path;
   }
    : instance_type_info)

let instance_types_of_yojson tree path = list_of_yojson instance_type_info_of_yojson tree path

let list_instance_types_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     instance_types = value_for_key instance_types_of_yojson "InstanceTypes" _list path;
   }
    : list_instance_types_response)

let list_instance_types_max_results_of_yojson = int_of_yojson

let instance_configuration_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tenancy = value_for_key instance_configuration_tenancy_enum_of_yojson "Tenancy" _list path;
     platform_type = value_for_key platform_type_enum_of_yojson "PlatformType" _list path;
     billing_mode = value_for_key billing_mode_of_yojson "BillingMode" _list path;
   }
    : instance_configuration_filter)

let list_instance_types_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_configuration_filter =
       option_of_yojson
         (value_for_key instance_configuration_filter_of_yojson "InstanceConfigurationFilter")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results =
       option_of_yojson
         (value_for_key list_instance_types_max_results_of_yojson "MaxResults")
         _list path;
   }
    : list_instance_types_request)

let ec2_instance_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ec2_error_message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "EC2ErrorMessage")
         _list path;
     ec2_exception_type =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "EC2ExceptionType")
         _list path;
     ec2_error_code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "EC2ErrorCode")
         _list path;
   }
    : ec2_instance_error)

let ec2_instance_errors_of_yojson tree path = list_of_yojson ec2_instance_error_of_yojson tree path

let billing_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ billing_mode = value_for_key billing_mode_of_yojson "BillingMode" _list path }
    : billing_configuration)

let get_workspace_instance_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     billing_configuration =
       option_of_yojson
         (value_for_key billing_configuration_of_yojson "BillingConfiguration")
         _list path;
     ec2_managed_instance =
       option_of_yojson
         (value_for_key ec2_managed_instance_of_yojson "EC2ManagedInstance")
         _list path;
     workspace_instance_id =
       option_of_yojson
         (value_for_key workspace_instance_id_of_yojson "WorkspaceInstanceId")
         _list path;
     provision_state =
       option_of_yojson (value_for_key provision_state_enum_of_yojson "ProvisionState") _list path;
     ec2_instance_errors =
       option_of_yojson (value_for_key ec2_instance_errors_of_yojson "EC2InstanceErrors") _list path;
     workspace_instance_errors =
       option_of_yojson
         (value_for_key workspace_instance_errors_of_yojson "WorkspaceInstanceErrors")
         _list path;
   }
    : get_workspace_instance_response)

let get_workspace_instance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workspace_instance_id =
       value_for_key workspace_instance_id_of_yojson "WorkspaceInstanceId" _list path;
   }
    : get_workspace_instance_request)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ResourceType" _list
         path;
     resource_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "ResourceId" _list
         path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "Message" _list path;
   }
    : conflict_exception)

let disassociate_volume_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let disassociate_mode_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "NO_FORCE" -> NO_FORCE
    | `String "FORCE" -> FORCE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DisassociateModeEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "DisassociateModeEnum")
     : disassociate_mode_enum)
    : disassociate_mode_enum)

let disassociate_volume_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     disassociate_mode =
       option_of_yojson
         (value_for_key disassociate_mode_enum_of_yojson "DisassociateMode")
         _list path;
     device = option_of_yojson (value_for_key device_name_of_yojson "Device") _list path;
     volume_id = value_for_key volume_id_of_yojson "VolumeId" _list path;
     workspace_instance_id =
       value_for_key workspace_instance_id_of_yojson "WorkspaceInstanceId" _list path;
   }
    : disassociate_volume_request)

let delete_workspace_instance_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_workspace_instance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workspace_instance_id =
       value_for_key workspace_instance_id_of_yojson "WorkspaceInstanceId" _list path;
   }
    : delete_workspace_instance_request)

let delete_volume_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_volume_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ volume_id = value_for_key volume_id_of_yojson "VolumeId" _list path } : delete_volume_request)

let create_workspace_instance_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     workspace_instance_id =
       option_of_yojson
         (value_for_key workspace_instance_id_of_yojson "WorkspaceInstanceId")
         _list path;
   }
    : create_workspace_instance_response)

let client_token_of_yojson = string_of_yojson

let create_workspace_instance_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     billing_configuration =
       option_of_yojson
         (value_for_key billing_configuration_of_yojson "BillingConfiguration")
         _list path;
     managed_instance =
       value_for_key managed_instance_request_of_yojson "ManagedInstance" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
   }
    : create_workspace_instance_request)

let create_volume_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ volume_id = option_of_yojson (value_for_key volume_id_of_yojson "VolumeId") _list path }
    : create_volume_response)

let create_volume_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     volume_type =
       option_of_yojson (value_for_key volume_type_enum_of_yojson "VolumeType") _list path;
     throughput =
       option_of_yojson (value_for_key non_negative_integer_of_yojson "Throughput") _list path;
     tag_specifications =
       option_of_yojson (value_for_key tag_specifications_of_yojson "TagSpecifications") _list path;
     snapshot_id = option_of_yojson (value_for_key snapshot_id_of_yojson "SnapshotId") _list path;
     size_in_g_b =
       option_of_yojson (value_for_key non_negative_integer_of_yojson "SizeInGB") _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "KmsKeyId") _list path;
     iops = option_of_yojson (value_for_key non_negative_integer_of_yojson "Iops") _list path;
     encrypted =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "Encrypted")
         _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "ClientToken") _list path;
     availability_zone = value_for_key string64_of_yojson "AvailabilityZone" _list path;
   }
    : create_volume_request)

let associate_volume_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let associate_volume_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     device = value_for_key device_name_of_yojson "Device" _list path;
     volume_id = value_for_key volume_id_of_yojson "VolumeId" _list path;
     workspace_instance_id =
       value_for_key workspace_instance_id_of_yojson "WorkspaceInstanceId" _list path;
   }
    : associate_volume_request)
