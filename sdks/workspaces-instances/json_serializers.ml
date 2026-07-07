open Smaws_Lib.Json.SerializeHelpers
open Types

let provision_state_enum_to_yojson (x : provision_state_enum) =
  match x with
  | ERROR_DEALLOCATING -> `String "ERROR_DEALLOCATING"
  | ERROR_ALLOCATING -> `String "ERROR_ALLOCATING"
  | DEALLOCATED -> `String "DEALLOCATED"
  | DEALLOCATING -> `String "DEALLOCATING"
  | ALLOCATED -> `String "ALLOCATED"
  | ALLOCATING -> `String "ALLOCATING"

let workspace_instance_id_to_yojson = string_to_yojson

let ec2_managed_instance_to_yojson (x : ec2_managed_instance) =
  assoc_to_yojson
    [
      ( "InstanceId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.instance_id );
    ]

let workspace_instance_to_yojson (x : workspace_instance) =
  assoc_to_yojson
    [
      ("EC2ManagedInstance", option_to_yojson ec2_managed_instance_to_yojson x.ec2_managed_instance);
      ( "WorkspaceInstanceId",
        option_to_yojson workspace_instance_id_to_yojson x.workspace_instance_id );
      ("ProvisionState", option_to_yojson provision_state_enum_to_yojson x.provision_state);
    ]

let workspace_instances_to_yojson tree = list_to_yojson workspace_instance_to_yojson tree

let workspace_instance_error_to_yojson (x : workspace_instance_error) =
  assoc_to_yojson
    [
      ( "ErrorMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_message );
      ( "ErrorCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_code );
    ]

let workspace_instance_errors_to_yojson tree =
  list_to_yojson workspace_instance_error_to_yojson tree

let volume_type_enum_to_yojson (x : volume_type_enum) =
  match x with
  | GP3 -> `String "gp3"
  | ST1 -> `String "st1"
  | SC1 -> `String "sc1"
  | GP2 -> `String "gp2"
  | IO2 -> `String "io2"
  | IO1 -> `String "io1"
  | STANDARD -> `String "standard"

let volume_id_to_yojson = string_to_yojson
let virtual_name_to_yojson = string_to_yojson

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | OTHER -> `String "OTHER"
  | DEPENDENCY_FAILURE -> `String "DEPENDENCY_FAILURE"
  | FIELD_VALIDATION_FAILED -> `String "FIELD_VALIDATION_FAILED"
  | CANNOT_PARSE -> `String "CANNOT_PARSE"
  | UNSUPPORTED_OPERATION -> `String "UNSUPPORTED_OPERATION"
  | UNKNOWN_OPERATION -> `String "UNKNOWN_OPERATION"

let validation_exception_field_to_yojson (x : validation_exception_field) =
  assoc_to_yojson
    [
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("Reason", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.reason));
      ("Name", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name));
    ]

let validation_exception_field_list_to_yojson tree =
  list_to_yojson validation_exception_field_to_yojson tree

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("FieldList", option_to_yojson validation_exception_field_list_to_yojson x.field_list);
      ("Reason", Some (validation_exception_reason_to_yojson x.reason));
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let user_data_to_yojson = string_to_yojson
let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("WorkspaceInstanceId", Some (workspace_instance_id_to_yojson x.workspace_instance_id));
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ( "RetryAfterSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.retry_after_seconds );
      ( "QuotaCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.quota_code );
      ( "ServiceCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service_code );
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ( "ResourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
      ("ResourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [
      ( "RetryAfterSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.retry_after_seconds );
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [ ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let tenancy_enum_to_yojson (x : tenancy_enum) =
  match x with
  | HOST -> `String "host"
  | DEDICATED -> `String "dedicated"
  | DEFAULT -> `String "default"

let tag_value_to_yojson = string_to_yojson

let resource_type_enum_to_yojson (x : resource_type_enum) =
  match x with
  | NETWORK_INTERFACE -> `String "network-interface"
  | SPOT_INSTANCES_REQUEST -> `String "spot-instances-request"
  | VOLUME -> `String "volume"
  | INSTANCE -> `String "instance"

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson tag_value_to_yojson x.value);
      ("Key", option_to_yojson tag_key_to_yojson x.key);
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_specification_to_yojson (x : tag_specification) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ResourceType", option_to_yojson resource_type_enum_to_yojson x.resource_type);
    ]

let tag_specifications_to_yojson tree = list_to_yojson tag_specification_to_yojson tree
let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("WorkspaceInstanceId", Some (workspace_instance_id_to_yojson x.workspace_instance_id));
    ]

let billing_mode_to_yojson (x : billing_mode) =
  match x with HOURLY -> `String "HOURLY" | MONTHLY -> `String "MONTHLY"

let platform_type_enum_to_yojson (x : platform_type_enum) =
  match x with
  | SUSE -> `String "SUSE Linux"
  | LINUX_BYOL -> `String "Red Hat BYOL Linux"
  | RHEL -> `String "Red Hat Enterprise Linux"
  | UBUNTU_PRO -> `String "Ubuntu Pro Linux"
  | LINUX_UNIX -> `String "Linux/UNIX"
  | WINDOWS_BYOL -> `String "Windows BYOL"
  | WINDOWS -> `String "Windows"

let instance_configuration_tenancy_enum_to_yojson (x : instance_configuration_tenancy_enum) =
  match x with DEDICATED -> `String "DEDICATED" | SHARED -> `String "SHARED"

let supported_instance_configuration_to_yojson (x : supported_instance_configuration) =
  assoc_to_yojson
    [
      ("Tenancy", option_to_yojson instance_configuration_tenancy_enum_to_yojson x.tenancy);
      ("PlatformType", option_to_yojson platform_type_enum_to_yojson x.platform_type);
      ("BillingMode", option_to_yojson billing_mode_to_yojson x.billing_mode);
    ]

let supported_instance_configurations_to_yojson tree =
  list_to_yojson supported_instance_configuration_to_yojson tree

let subnet_id_to_yojson = string_to_yojson
let string64_to_yojson = string_to_yojson
let string128_to_yojson = string_to_yojson
let non_negative_integer_to_yojson = int_to_yojson

let instance_interruption_behavior_enum_to_yojson (x : instance_interruption_behavior_enum) =
  match x with STOP -> `String "stop" | HIBERNATE -> `String "hibernate"

let spot_instance_type_enum_to_yojson (x : spot_instance_type_enum) =
  match x with PERSISTENT -> `String "persistent" | ONE_TIME -> `String "one-time"

let spot_market_options_to_yojson (x : spot_market_options) =
  assoc_to_yojson
    [
      ( "ValidUntilUtc",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.valid_until_utc );
      ("SpotInstanceType", option_to_yojson spot_instance_type_enum_to_yojson x.spot_instance_type);
      ("MaxPrice", option_to_yojson string64_to_yojson x.max_price);
      ( "InstanceInterruptionBehavior",
        option_to_yojson instance_interruption_behavior_enum_to_yojson
          x.instance_interruption_behavior );
      ( "BlockDurationMinutes",
        option_to_yojson non_negative_integer_to_yojson x.block_duration_minutes );
    ]

let snapshot_id_to_yojson = string_to_yojson

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("QuotaCode", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.quota_code));
      ("ServiceCode", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service_code));
      ( "ResourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
      ("ResourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let security_group_name_to_yojson = string_to_yojson
let security_group_names_to_yojson tree = list_to_yojson security_group_name_to_yojson tree
let security_group_id_to_yojson = string_to_yojson
let security_group_ids_to_yojson tree = list_to_yojson security_group_id_to_yojson tree

let run_instances_monitoring_enabled_to_yojson (x : run_instances_monitoring_enabled) =
  assoc_to_yojson
    [
      ( "Enabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.enabled );
    ]

let region_name_to_yojson = string_to_yojson

let region_to_yojson (x : region) =
  assoc_to_yojson [ ("RegionName", option_to_yojson region_name_to_yojson x.region_name) ]

let region_list_to_yojson tree = list_to_yojson region_to_yojson tree
let provision_states_to_yojson tree = list_to_yojson provision_state_enum_to_yojson tree
let ipv4_address_to_yojson = string_to_yojson

let private_ip_address_specification_to_yojson (x : private_ip_address_specification) =
  assoc_to_yojson
    [
      ("PrivateIpAddress", option_to_yojson ipv4_address_to_yojson x.private_ip_address);
      ( "Primary",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.primary );
    ]

let private_ip_addresses_to_yojson tree =
  list_to_yojson private_ip_address_specification_to_yojson tree

let hostname_type_enum_to_yojson (x : hostname_type_enum) =
  match x with RESOURCE_NAME -> `String "resource-name" | IP_NAME -> `String "ip-name"

let private_dns_name_options_request_to_yojson (x : private_dns_name_options_request) =
  assoc_to_yojson
    [
      ( "EnableResourceNameDnsAAAARecord",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.enable_resource_name_dns_aaaa_record );
      ( "EnableResourceNameDnsARecord",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.enable_resource_name_dns_a_record );
      ("HostnameType", option_to_yojson hostname_type_enum_to_yojson x.hostname_type);
    ]

let placement_group_id_to_yojson = string_to_yojson
let availability_zone_to_yojson = string_to_yojson
let host_id_to_yojson = string_to_yojson
let ar_n_to_yojson = string_to_yojson

let placement_to_yojson (x : placement) =
  assoc_to_yojson
    [
      ("Tenancy", option_to_yojson tenancy_enum_to_yojson x.tenancy);
      ("PartitionNumber", option_to_yojson non_negative_integer_to_yojson x.partition_number);
      ("HostResourceGroupArn", option_to_yojson ar_n_to_yojson x.host_resource_group_arn);
      ("HostId", option_to_yojson host_id_to_yojson x.host_id);
      ("GroupName", option_to_yojson string64_to_yojson x.group_name);
      ("GroupId", option_to_yojson placement_group_id_to_yojson x.group_id);
      ("AvailabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ("Affinity", option_to_yojson string64_to_yojson x.affinity);
    ]

let next_token_to_yojson = string_to_yojson

let connection_tracking_specification_request_to_yojson
    (x : connection_tracking_specification_request) =
  assoc_to_yojson
    [
      ("UdpTimeout", option_to_yojson non_negative_integer_to_yojson x.udp_timeout);
      ("UdpStreamTimeout", option_to_yojson non_negative_integer_to_yojson x.udp_stream_timeout);
      ( "TcpEstablishedTimeout",
        option_to_yojson non_negative_integer_to_yojson x.tcp_established_timeout );
    ]

let description_to_yojson = string_to_yojson

let ena_srd_udp_specification_request_to_yojson (x : ena_srd_udp_specification_request) =
  assoc_to_yojson
    [
      ( "EnaSrdUdpEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.ena_srd_udp_enabled );
    ]

let ena_srd_specification_request_to_yojson (x : ena_srd_specification_request) =
  assoc_to_yojson
    [
      ( "EnaSrdUdpSpecification",
        option_to_yojson ena_srd_udp_specification_request_to_yojson x.ena_srd_udp_specification );
      ( "EnaSrdEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.ena_srd_enabled
      );
    ]

let interface_type_enum_to_yojson (x : interface_type_enum) =
  match x with
  | EFA_ONLY -> `String "efa-only"
  | EFA -> `String "efa"
  | INTERFACE -> `String "interface"

let ipv4_prefix_to_yojson = string_to_yojson

let ipv4_prefix_specification_request_to_yojson (x : ipv4_prefix_specification_request) =
  assoc_to_yojson [ ("Ipv4Prefix", option_to_yojson ipv4_prefix_to_yojson x.ipv4_prefix) ]

let ipv4_prefixes_to_yojson tree = list_to_yojson ipv4_prefix_specification_request_to_yojson tree
let ipv6_address_to_yojson = string_to_yojson

let instance_ipv6_address_to_yojson (x : instance_ipv6_address) =
  assoc_to_yojson
    [
      ( "IsPrimaryIpv6",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.is_primary_ipv6
      );
      ("Ipv6Address", option_to_yojson ipv6_address_to_yojson x.ipv6_address);
    ]

let ipv6_addresses_to_yojson tree = list_to_yojson instance_ipv6_address_to_yojson tree
let ipv6_prefix_to_yojson = string_to_yojson

let ipv6_prefix_specification_request_to_yojson (x : ipv6_prefix_specification_request) =
  assoc_to_yojson [ ("Ipv6Prefix", option_to_yojson ipv6_prefix_to_yojson x.ipv6_prefix) ]

let ipv6_prefixes_to_yojson tree = list_to_yojson ipv6_prefix_specification_request_to_yojson tree
let network_interface_id_to_yojson = string_to_yojson

let instance_network_interface_specification_to_yojson
    (x : instance_network_interface_specification) =
  assoc_to_yojson
    [
      ("SubnetId", option_to_yojson subnet_id_to_yojson x.subnet_id);
      ("Groups", option_to_yojson security_group_ids_to_yojson x.groups);
      ( "SecondaryPrivateIpAddressCount",
        option_to_yojson non_negative_integer_to_yojson x.secondary_private_ip_address_count );
      ("PrivateIpAddresses", option_to_yojson private_ip_addresses_to_yojson x.private_ip_addresses);
      ("PrivateIpAddress", option_to_yojson ipv4_address_to_yojson x.private_ip_address);
      ( "PrimaryIpv6",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.primary_ipv6 );
      ("NetworkInterfaceId", option_to_yojson network_interface_id_to_yojson x.network_interface_id);
      ("NetworkCardIndex", option_to_yojson non_negative_integer_to_yojson x.network_card_index);
      ("Ipv6PrefixCount", option_to_yojson non_negative_integer_to_yojson x.ipv6_prefix_count);
      ("Ipv6Prefixes", option_to_yojson ipv6_prefixes_to_yojson x.ipv6_prefixes);
      ("Ipv6Addresses", option_to_yojson ipv6_addresses_to_yojson x.ipv6_addresses);
      ("Ipv6AddressCount", option_to_yojson non_negative_integer_to_yojson x.ipv6_address_count);
      ("Ipv4PrefixCount", option_to_yojson non_negative_integer_to_yojson x.ipv4_prefix_count);
      ("Ipv4Prefixes", option_to_yojson ipv4_prefixes_to_yojson x.ipv4_prefixes);
      ("InterfaceType", option_to_yojson interface_type_enum_to_yojson x.interface_type);
      ( "EnaSrdSpecification",
        option_to_yojson ena_srd_specification_request_to_yojson x.ena_srd_specification );
      ("DeviceIndex", option_to_yojson non_negative_integer_to_yojson x.device_index);
      ("Description", option_to_yojson description_to_yojson x.description);
      ( "ConnectionTrackingSpecification",
        option_to_yojson connection_tracking_specification_request_to_yojson
          x.connection_tracking_specification );
      ( "AssociatePublicIpAddress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.associate_public_ip_address );
      ( "AssociateCarrierIpAddress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.associate_carrier_ip_address );
    ]

let network_interfaces_to_yojson tree =
  list_to_yojson instance_network_interface_specification_to_yojson tree

let max_results_to_yojson = int_to_yojson

let market_type_enum_to_yojson (x : market_type_enum) =
  match x with CAPACITY_BLOCK -> `String "capacity-block" | SPOT -> `String "spot"

let device_name_to_yojson = string_to_yojson
let kms_key_id_to_yojson = string_to_yojson

let ebs_block_device_to_yojson (x : ebs_block_device) =
  assoc_to_yojson
    [
      ("VolumeSize", option_to_yojson non_negative_integer_to_yojson x.volume_size);
      ("Throughput", option_to_yojson non_negative_integer_to_yojson x.throughput);
      ("Iops", option_to_yojson non_negative_integer_to_yojson x.iops);
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ( "Encrypted",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.encrypted );
      ("VolumeType", option_to_yojson volume_type_enum_to_yojson x.volume_type);
    ]

let block_device_mapping_request_to_yojson (x : block_device_mapping_request) =
  assoc_to_yojson
    [
      ("VirtualName", option_to_yojson virtual_name_to_yojson x.virtual_name);
      ("NoDevice", option_to_yojson device_name_to_yojson x.no_device);
      ("Ebs", option_to_yojson ebs_block_device_to_yojson x.ebs);
      ("DeviceName", option_to_yojson device_name_to_yojson x.device_name);
    ]

let block_device_mappings_to_yojson tree =
  list_to_yojson block_device_mapping_request_to_yojson tree

let capacity_reservation_preference_enum_to_yojson (x : capacity_reservation_preference_enum) =
  match x with
  | NONE -> `String "none"
  | OPEN -> `String "open"
  | CAPACITY_RESERVATIONS_ONLY -> `String "capacity-reservations-only"

let capacity_reservation_target_to_yojson (x : capacity_reservation_target) =
  assoc_to_yojson
    [
      ( "CapacityReservationResourceGroupArn",
        option_to_yojson ar_n_to_yojson x.capacity_reservation_resource_group_arn );
      ("CapacityReservationId", option_to_yojson string128_to_yojson x.capacity_reservation_id);
    ]

let capacity_reservation_specification_to_yojson (x : capacity_reservation_specification) =
  assoc_to_yojson
    [
      ( "CapacityReservationTarget",
        option_to_yojson capacity_reservation_target_to_yojson x.capacity_reservation_target );
      ( "CapacityReservationPreference",
        option_to_yojson capacity_reservation_preference_enum_to_yojson
          x.capacity_reservation_preference );
    ]

let amd_sev_snp_enum_to_yojson (x : amd_sev_snp_enum) =
  match x with DISABLED -> `String "disabled" | ENABLED -> `String "enabled"

let cpu_options_request_to_yojson (x : cpu_options_request) =
  assoc_to_yojson
    [
      ("ThreadsPerCore", option_to_yojson non_negative_integer_to_yojson x.threads_per_core);
      ("CoreCount", option_to_yojson non_negative_integer_to_yojson x.core_count);
      ("AmdSevSnp", option_to_yojson amd_sev_snp_enum_to_yojson x.amd_sev_snp);
    ]

let cpu_credits_enum_to_yojson (x : cpu_credits_enum) =
  match x with UNLIMITED -> `String "unlimited" | STANDARD -> `String "standard"

let credit_specification_request_to_yojson (x : credit_specification_request) =
  assoc_to_yojson [ ("CpuCredits", option_to_yojson cpu_credits_enum_to_yojson x.cpu_credits) ]

let enclave_options_request_to_yojson (x : enclave_options_request) =
  assoc_to_yojson
    [
      ( "Enabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.enabled );
    ]

let hibernation_options_request_to_yojson (x : hibernation_options_request) =
  assoc_to_yojson
    [
      ( "Configured",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.configured );
    ]

let iam_instance_profile_specification_to_yojson (x : iam_instance_profile_specification) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string64_to_yojson x.name);
      ("Arn", option_to_yojson ar_n_to_yojson x.arn);
    ]

let image_id_to_yojson = string_to_yojson

let instance_market_options_request_to_yojson (x : instance_market_options_request) =
  assoc_to_yojson
    [
      ("SpotOptions", option_to_yojson spot_market_options_to_yojson x.spot_options);
      ("MarketType", option_to_yojson market_type_enum_to_yojson x.market_type);
    ]

let instance_type_to_yojson = string_to_yojson

let license_configuration_request_to_yojson (x : license_configuration_request) =
  assoc_to_yojson
    [ ("LicenseConfigurationArn", option_to_yojson ar_n_to_yojson x.license_configuration_arn) ]

let license_specifications_to_yojson tree =
  list_to_yojson license_configuration_request_to_yojson tree

let auto_recovery_enum_to_yojson (x : auto_recovery_enum) =
  match x with DEFAULT -> `String "default" | DISABLED -> `String "disabled"

let instance_maintenance_options_request_to_yojson (x : instance_maintenance_options_request) =
  assoc_to_yojson
    [ ("AutoRecovery", option_to_yojson auto_recovery_enum_to_yojson x.auto_recovery) ]

let http_endpoint_enum_to_yojson (x : http_endpoint_enum) =
  match x with DISABLED -> `String "disabled" | ENABLED -> `String "enabled"

let http_protocol_ipv6_enum_to_yojson (x : http_protocol_ipv6_enum) =
  match x with DISABLED -> `String "disabled" | ENABLED -> `String "enabled"

let http_put_response_hop_limit_to_yojson = int_to_yojson

let http_tokens_enum_to_yojson (x : http_tokens_enum) =
  match x with REQUIRED -> `String "required" | OPTIONAL -> `String "optional"

let instance_metadata_tags_enum_to_yojson (x : instance_metadata_tags_enum) =
  match x with DISABLED -> `String "disabled" | ENABLED -> `String "enabled"

let instance_metadata_options_request_to_yojson (x : instance_metadata_options_request) =
  assoc_to_yojson
    [
      ( "InstanceMetadataTags",
        option_to_yojson instance_metadata_tags_enum_to_yojson x.instance_metadata_tags );
      ("HttpTokens", option_to_yojson http_tokens_enum_to_yojson x.http_tokens);
      ( "HttpPutResponseHopLimit",
        option_to_yojson http_put_response_hop_limit_to_yojson x.http_put_response_hop_limit );
      ("HttpProtocolIpv6", option_to_yojson http_protocol_ipv6_enum_to_yojson x.http_protocol_ipv6);
      ("HttpEndpoint", option_to_yojson http_endpoint_enum_to_yojson x.http_endpoint);
    ]

let bandwidth_weighting_enum_to_yojson (x : bandwidth_weighting_enum) =
  match x with EBS_1 -> `String "ebs-1" | VPC_1 -> `String "vpc-1" | DEFAULT -> `String "default"

let instance_network_performance_options_request_to_yojson
    (x : instance_network_performance_options_request) =
  assoc_to_yojson
    [
      ( "BandwidthWeighting",
        option_to_yojson bandwidth_weighting_enum_to_yojson x.bandwidth_weighting );
    ]

let managed_instance_request_to_yojson (x : managed_instance_request) =
  assoc_to_yojson
    [
      ("UserData", option_to_yojson user_data_to_yojson x.user_data);
      ("TagSpecifications", option_to_yojson tag_specifications_to_yojson x.tag_specifications);
      ("SubnetId", option_to_yojson subnet_id_to_yojson x.subnet_id);
      ("SecurityGroups", option_to_yojson security_group_names_to_yojson x.security_groups);
      ("SecurityGroupIds", option_to_yojson security_group_ids_to_yojson x.security_group_ids);
      ("RamdiskId", option_to_yojson string128_to_yojson x.ramdisk_id);
      ("PrivateIpAddress", option_to_yojson ipv4_address_to_yojson x.private_ip_address);
      ( "PrivateDnsNameOptions",
        option_to_yojson private_dns_name_options_request_to_yojson x.private_dns_name_options );
      ("Placement", option_to_yojson placement_to_yojson x.placement);
      ( "NetworkPerformanceOptions",
        option_to_yojson instance_network_performance_options_request_to_yojson
          x.network_performance_options );
      ("NetworkInterfaces", option_to_yojson network_interfaces_to_yojson x.network_interfaces);
      ("Monitoring", option_to_yojson run_instances_monitoring_enabled_to_yojson x.monitoring);
      ( "MetadataOptions",
        option_to_yojson instance_metadata_options_request_to_yojson x.metadata_options );
      ( "MaintenanceOptions",
        option_to_yojson instance_maintenance_options_request_to_yojson x.maintenance_options );
      ( "LicenseSpecifications",
        option_to_yojson license_specifications_to_yojson x.license_specifications );
      ("KeyName", option_to_yojson string64_to_yojson x.key_name);
      ("KernelId", option_to_yojson string128_to_yojson x.kernel_id);
      ("Ipv6AddressCount", option_to_yojson non_negative_integer_to_yojson x.ipv6_address_count);
      ("Ipv6Addresses", option_to_yojson ipv6_addresses_to_yojson x.ipv6_addresses);
      ("InstanceType", option_to_yojson instance_type_to_yojson x.instance_type);
      ( "InstanceMarketOptions",
        option_to_yojson instance_market_options_request_to_yojson x.instance_market_options );
      ("ImageId", option_to_yojson image_id_to_yojson x.image_id);
      ( "IamInstanceProfile",
        option_to_yojson iam_instance_profile_specification_to_yojson x.iam_instance_profile );
      ( "HibernationOptions",
        option_to_yojson hibernation_options_request_to_yojson x.hibernation_options );
      ("EnclaveOptions", option_to_yojson enclave_options_request_to_yojson x.enclave_options);
      ( "EnablePrimaryIpv6",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.enable_primary_ipv6 );
      ( "EbsOptimized",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.ebs_optimized );
      ( "DisableApiStop",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.disable_api_stop
      );
      ( "CreditSpecification",
        option_to_yojson credit_specification_request_to_yojson x.credit_specification );
      ("CpuOptions", option_to_yojson cpu_options_request_to_yojson x.cpu_options);
      ( "CapacityReservationSpecification",
        option_to_yojson capacity_reservation_specification_to_yojson
          x.capacity_reservation_specification );
      ( "BlockDeviceMappings",
        option_to_yojson block_device_mappings_to_yojson x.block_device_mappings );
    ]

let list_workspace_instances_response_to_yojson (x : list_workspace_instances_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("WorkspaceInstances", Some (workspace_instances_to_yojson x.workspace_instances));
    ]

let list_workspace_instances_request_to_yojson (x : list_workspace_instances_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("ProvisionStates", option_to_yojson provision_states_to_yojson x.provision_states);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson
    [ ("WorkspaceInstanceId", Some (workspace_instance_id_to_yojson x.workspace_instance_id)) ]

let list_regions_response_to_yojson (x : list_regions_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Regions", Some (region_list_to_yojson x.regions));
    ]

let list_regions_request_to_yojson (x : list_regions_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let instance_type_info_to_yojson (x : instance_type_info) =
  assoc_to_yojson
    [
      ( "SupportedInstanceConfigurations",
        option_to_yojson supported_instance_configurations_to_yojson
          x.supported_instance_configurations );
      ("InstanceType", option_to_yojson instance_type_to_yojson x.instance_type);
    ]

let instance_types_to_yojson tree = list_to_yojson instance_type_info_to_yojson tree

let list_instance_types_response_to_yojson (x : list_instance_types_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("InstanceTypes", Some (instance_types_to_yojson x.instance_types));
    ]

let list_instance_types_max_results_to_yojson = int_to_yojson

let instance_configuration_filter_to_yojson (x : instance_configuration_filter) =
  assoc_to_yojson
    [
      ("Tenancy", Some (instance_configuration_tenancy_enum_to_yojson x.tenancy));
      ("PlatformType", Some (platform_type_enum_to_yojson x.platform_type));
      ("BillingMode", Some (billing_mode_to_yojson x.billing_mode));
    ]

let list_instance_types_request_to_yojson (x : list_instance_types_request) =
  assoc_to_yojson
    [
      ( "InstanceConfigurationFilter",
        option_to_yojson instance_configuration_filter_to_yojson x.instance_configuration_filter );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson list_instance_types_max_results_to_yojson x.max_results);
    ]

let ec2_instance_error_to_yojson (x : ec2_instance_error) =
  assoc_to_yojson
    [
      ( "EC2ErrorMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ec2_error_message
      );
      ( "EC2ExceptionType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.ec2_exception_type );
      ( "EC2ErrorCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ec2_error_code );
    ]

let ec2_instance_errors_to_yojson tree = list_to_yojson ec2_instance_error_to_yojson tree

let billing_configuration_to_yojson (x : billing_configuration) =
  assoc_to_yojson [ ("BillingMode", Some (billing_mode_to_yojson x.billing_mode)) ]

let get_workspace_instance_response_to_yojson (x : get_workspace_instance_response) =
  assoc_to_yojson
    [
      ( "BillingConfiguration",
        option_to_yojson billing_configuration_to_yojson x.billing_configuration );
      ("EC2ManagedInstance", option_to_yojson ec2_managed_instance_to_yojson x.ec2_managed_instance);
      ( "WorkspaceInstanceId",
        option_to_yojson workspace_instance_id_to_yojson x.workspace_instance_id );
      ("ProvisionState", option_to_yojson provision_state_enum_to_yojson x.provision_state);
      ("EC2InstanceErrors", option_to_yojson ec2_instance_errors_to_yojson x.ec2_instance_errors);
      ( "WorkspaceInstanceErrors",
        option_to_yojson workspace_instance_errors_to_yojson x.workspace_instance_errors );
    ]

let get_workspace_instance_request_to_yojson (x : get_workspace_instance_request) =
  assoc_to_yojson
    [ ("WorkspaceInstanceId", Some (workspace_instance_id_to_yojson x.workspace_instance_id)) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ( "ResourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
      ("ResourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let disassociate_volume_response_to_yojson = unit_to_yojson

let disassociate_mode_enum_to_yojson (x : disassociate_mode_enum) =
  match x with NO_FORCE -> `String "NO_FORCE" | FORCE -> `String "FORCE"

let disassociate_volume_request_to_yojson (x : disassociate_volume_request) =
  assoc_to_yojson
    [
      ("DisassociateMode", option_to_yojson disassociate_mode_enum_to_yojson x.disassociate_mode);
      ("Device", option_to_yojson device_name_to_yojson x.device);
      ("VolumeId", Some (volume_id_to_yojson x.volume_id));
      ("WorkspaceInstanceId", Some (workspace_instance_id_to_yojson x.workspace_instance_id));
    ]

let delete_workspace_instance_response_to_yojson = unit_to_yojson

let delete_workspace_instance_request_to_yojson (x : delete_workspace_instance_request) =
  assoc_to_yojson
    [ ("WorkspaceInstanceId", Some (workspace_instance_id_to_yojson x.workspace_instance_id)) ]

let delete_volume_response_to_yojson = unit_to_yojson

let delete_volume_request_to_yojson (x : delete_volume_request) =
  assoc_to_yojson [ ("VolumeId", Some (volume_id_to_yojson x.volume_id)) ]

let create_workspace_instance_response_to_yojson (x : create_workspace_instance_response) =
  assoc_to_yojson
    [
      ( "WorkspaceInstanceId",
        option_to_yojson workspace_instance_id_to_yojson x.workspace_instance_id );
    ]

let client_token_to_yojson = string_to_yojson

let create_workspace_instance_request_to_yojson (x : create_workspace_instance_request) =
  assoc_to_yojson
    [
      ( "BillingConfiguration",
        option_to_yojson billing_configuration_to_yojson x.billing_configuration );
      ("ManagedInstance", Some (managed_instance_request_to_yojson x.managed_instance));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_volume_response_to_yojson (x : create_volume_response) =
  assoc_to_yojson [ ("VolumeId", option_to_yojson volume_id_to_yojson x.volume_id) ]

let create_volume_request_to_yojson (x : create_volume_request) =
  assoc_to_yojson
    [
      ("VolumeType", option_to_yojson volume_type_enum_to_yojson x.volume_type);
      ("Throughput", option_to_yojson non_negative_integer_to_yojson x.throughput);
      ("TagSpecifications", option_to_yojson tag_specifications_to_yojson x.tag_specifications);
      ("SnapshotId", option_to_yojson snapshot_id_to_yojson x.snapshot_id);
      ("SizeInGB", option_to_yojson non_negative_integer_to_yojson x.size_in_g_b);
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("Iops", option_to_yojson non_negative_integer_to_yojson x.iops);
      ( "Encrypted",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.encrypted );
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("AvailabilityZone", Some (string64_to_yojson x.availability_zone));
    ]

let associate_volume_response_to_yojson = unit_to_yojson

let associate_volume_request_to_yojson (x : associate_volume_request) =
  assoc_to_yojson
    [
      ("Device", Some (device_name_to_yojson x.device));
      ("VolumeId", Some (volume_id_to_yojson x.volume_id));
      ("WorkspaceInstanceId", Some (workspace_instance_id_to_yojson x.workspace_instance_id));
    ]
