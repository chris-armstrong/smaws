open Smaws_Lib.Json.SerializeHelpers
open Types

let ar_n_to_yojson = string_to_yojson

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [ ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let amd_sev_snp_enum_to_yojson (x : amd_sev_snp_enum) =
  match x with ENABLED -> `String "enabled" | DISABLED -> `String "disabled"

let validation_exception_field_to_yojson (x : validation_exception_field) =
  assoc_to_yojson
    [
      ("Name", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name));
      ("Reason", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.reason));
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let validation_exception_field_list_to_yojson tree =
  list_to_yojson validation_exception_field_to_yojson tree

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | UNKNOWN_OPERATION -> `String "UNKNOWN_OPERATION"
  | UNSUPPORTED_OPERATION -> `String "UNSUPPORTED_OPERATION"
  | CANNOT_PARSE -> `String "CANNOT_PARSE"
  | FIELD_VALIDATION_FAILED -> `String "FIELD_VALIDATION_FAILED"
  | DEPENDENCY_FAILURE -> `String "DEPENDENCY_FAILURE"
  | OTHER -> `String "OTHER"

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("Reason", Some (validation_exception_reason_to_yojson x.reason));
      ("FieldList", option_to_yojson validation_exception_field_list_to_yojson x.field_list);
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ( "ServiceCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service_code );
      ( "QuotaCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.quota_code );
      ( "RetryAfterSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.retry_after_seconds );
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("ResourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ( "ResourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ( "RetryAfterSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.retry_after_seconds );
    ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("ResourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ( "ResourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
    ]

let associate_volume_response_to_yojson = unit_to_yojson
let device_name_to_yojson = string_to_yojson
let volume_id_to_yojson = string_to_yojson
let workspace_instance_id_to_yojson = string_to_yojson

let associate_volume_request_to_yojson (x : associate_volume_request) =
  assoc_to_yojson
    [
      ("WorkspaceInstanceId", Some (workspace_instance_id_to_yojson x.workspace_instance_id));
      ("VolumeId", Some (volume_id_to_yojson x.volume_id));
      ("Device", Some (device_name_to_yojson x.device));
    ]

let auto_recovery_enum_to_yojson (x : auto_recovery_enum) =
  match x with DISABLED -> `String "disabled" | DEFAULT -> `String "default"

let availability_zone_to_yojson = string_to_yojson

let bandwidth_weighting_enum_to_yojson (x : bandwidth_weighting_enum) =
  match x with DEFAULT -> `String "default" | VPC_1 -> `String "vpc-1" | EBS_1 -> `String "ebs-1"

let billing_mode_to_yojson (x : billing_mode) =
  match x with MONTHLY -> `String "MONTHLY" | HOURLY -> `String "HOURLY"

let billing_configuration_to_yojson (x : billing_configuration) =
  assoc_to_yojson [ ("BillingMode", Some (billing_mode_to_yojson x.billing_mode)) ]

let virtual_name_to_yojson = string_to_yojson
let non_negative_integer_to_yojson = int_to_yojson
let kms_key_id_to_yojson = string_to_yojson

let volume_type_enum_to_yojson (x : volume_type_enum) =
  match x with
  | STANDARD -> `String "standard"
  | IO1 -> `String "io1"
  | IO2 -> `String "io2"
  | GP2 -> `String "gp2"
  | SC1 -> `String "sc1"
  | ST1 -> `String "st1"
  | GP3 -> `String "gp3"

let ebs_block_device_to_yojson (x : ebs_block_device) =
  assoc_to_yojson
    [
      ("VolumeType", option_to_yojson volume_type_enum_to_yojson x.volume_type);
      ( "Encrypted",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.encrypted );
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("Iops", option_to_yojson non_negative_integer_to_yojson x.iops);
      ("Throughput", option_to_yojson non_negative_integer_to_yojson x.throughput);
      ("VolumeSize", option_to_yojson non_negative_integer_to_yojson x.volume_size);
    ]

let block_device_mapping_request_to_yojson (x : block_device_mapping_request) =
  assoc_to_yojson
    [
      ("DeviceName", option_to_yojson device_name_to_yojson x.device_name);
      ("Ebs", option_to_yojson ebs_block_device_to_yojson x.ebs);
      ("NoDevice", option_to_yojson device_name_to_yojson x.no_device);
      ("VirtualName", option_to_yojson virtual_name_to_yojson x.virtual_name);
    ]

let block_device_mappings_to_yojson tree =
  list_to_yojson block_device_mapping_request_to_yojson tree

let capacity_reservation_preference_enum_to_yojson (x : capacity_reservation_preference_enum) =
  match x with
  | CAPACITY_RESERVATIONS_ONLY -> `String "capacity-reservations-only"
  | OPEN -> `String "open"
  | NONE -> `String "none"

let string128_to_yojson = string_to_yojson

let capacity_reservation_target_to_yojson (x : capacity_reservation_target) =
  assoc_to_yojson
    [
      ("CapacityReservationId", option_to_yojson string128_to_yojson x.capacity_reservation_id);
      ( "CapacityReservationResourceGroupArn",
        option_to_yojson ar_n_to_yojson x.capacity_reservation_resource_group_arn );
    ]

let capacity_reservation_specification_to_yojson (x : capacity_reservation_specification) =
  assoc_to_yojson
    [
      ( "CapacityReservationPreference",
        option_to_yojson capacity_reservation_preference_enum_to_yojson
          x.capacity_reservation_preference );
      ( "CapacityReservationTarget",
        option_to_yojson capacity_reservation_target_to_yojson x.capacity_reservation_target );
    ]

let client_token_to_yojson = string_to_yojson

let connection_tracking_specification_request_to_yojson
    (x : connection_tracking_specification_request) =
  assoc_to_yojson
    [
      ( "TcpEstablishedTimeout",
        option_to_yojson non_negative_integer_to_yojson x.tcp_established_timeout );
      ("UdpStreamTimeout", option_to_yojson non_negative_integer_to_yojson x.udp_stream_timeout);
      ("UdpTimeout", option_to_yojson non_negative_integer_to_yojson x.udp_timeout);
    ]

let cpu_credits_enum_to_yojson (x : cpu_credits_enum) =
  match x with STANDARD -> `String "standard" | UNLIMITED -> `String "unlimited"

let cpu_options_request_to_yojson (x : cpu_options_request) =
  assoc_to_yojson
    [
      ("AmdSevSnp", option_to_yojson amd_sev_snp_enum_to_yojson x.amd_sev_snp);
      ("CoreCount", option_to_yojson non_negative_integer_to_yojson x.core_count);
      ("ThreadsPerCore", option_to_yojson non_negative_integer_to_yojson x.threads_per_core);
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("Message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("ResourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ( "ResourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
      ("ServiceCode", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service_code));
      ("QuotaCode", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.quota_code));
    ]

let create_volume_response_to_yojson (x : create_volume_response) =
  assoc_to_yojson [ ("VolumeId", option_to_yojson volume_id_to_yojson x.volume_id) ]

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson tag_key_to_yojson x.key);
      ("Value", option_to_yojson tag_value_to_yojson x.value);
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let resource_type_enum_to_yojson (x : resource_type_enum) =
  match x with
  | INSTANCE -> `String "instance"
  | VOLUME -> `String "volume"
  | SPOT_INSTANCES_REQUEST -> `String "spot-instances-request"
  | NETWORK_INTERFACE -> `String "network-interface"

let tag_specification_to_yojson (x : tag_specification) =
  assoc_to_yojson
    [
      ("ResourceType", option_to_yojson resource_type_enum_to_yojson x.resource_type);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let tag_specifications_to_yojson tree = list_to_yojson tag_specification_to_yojson tree
let snapshot_id_to_yojson = string_to_yojson
let string64_to_yojson = string_to_yojson

let create_volume_request_to_yojson (x : create_volume_request) =
  assoc_to_yojson
    [
      ("AvailabilityZone", Some (string64_to_yojson x.availability_zone));
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "Encrypted",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.encrypted );
      ("Iops", option_to_yojson non_negative_integer_to_yojson x.iops);
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("SizeInGB", option_to_yojson non_negative_integer_to_yojson x.size_in_g_b);
      ("SnapshotId", option_to_yojson snapshot_id_to_yojson x.snapshot_id);
      ("TagSpecifications", option_to_yojson tag_specifications_to_yojson x.tag_specifications);
      ("Throughput", option_to_yojson non_negative_integer_to_yojson x.throughput);
      ("VolumeType", option_to_yojson volume_type_enum_to_yojson x.volume_type);
    ]

let create_workspace_instance_response_to_yojson (x : create_workspace_instance_response) =
  assoc_to_yojson
    [
      ( "WorkspaceInstanceId",
        option_to_yojson workspace_instance_id_to_yojson x.workspace_instance_id );
    ]

let user_data_to_yojson = string_to_yojson
let subnet_id_to_yojson = string_to_yojson
let security_group_name_to_yojson = string_to_yojson
let security_group_names_to_yojson tree = list_to_yojson security_group_name_to_yojson tree
let security_group_id_to_yojson = string_to_yojson
let security_group_ids_to_yojson tree = list_to_yojson security_group_id_to_yojson tree
let ipv4_address_to_yojson = string_to_yojson

let hostname_type_enum_to_yojson (x : hostname_type_enum) =
  match x with IP_NAME -> `String "ip-name" | RESOURCE_NAME -> `String "resource-name"

let private_dns_name_options_request_to_yojson (x : private_dns_name_options_request) =
  assoc_to_yojson
    [
      ("HostnameType", option_to_yojson hostname_type_enum_to_yojson x.hostname_type);
      ( "EnableResourceNameDnsARecord",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.enable_resource_name_dns_a_record );
      ( "EnableResourceNameDnsAAAARecord",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.enable_resource_name_dns_aaaa_record );
    ]

let tenancy_enum_to_yojson (x : tenancy_enum) =
  match x with
  | DEFAULT -> `String "default"
  | DEDICATED -> `String "dedicated"
  | HOST -> `String "host"

let host_id_to_yojson = string_to_yojson
let placement_group_id_to_yojson = string_to_yojson

let placement_to_yojson (x : placement) =
  assoc_to_yojson
    [
      ("Affinity", option_to_yojson string64_to_yojson x.affinity);
      ("AvailabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ("GroupId", option_to_yojson placement_group_id_to_yojson x.group_id);
      ("GroupName", option_to_yojson string64_to_yojson x.group_name);
      ("HostId", option_to_yojson host_id_to_yojson x.host_id);
      ("HostResourceGroupArn", option_to_yojson ar_n_to_yojson x.host_resource_group_arn);
      ("PartitionNumber", option_to_yojson non_negative_integer_to_yojson x.partition_number);
      ("Tenancy", option_to_yojson tenancy_enum_to_yojson x.tenancy);
    ]

let instance_network_performance_options_request_to_yojson
    (x : instance_network_performance_options_request) =
  assoc_to_yojson
    [
      ( "BandwidthWeighting",
        option_to_yojson bandwidth_weighting_enum_to_yojson x.bandwidth_weighting );
    ]

let private_ip_address_specification_to_yojson (x : private_ip_address_specification) =
  assoc_to_yojson
    [
      ( "Primary",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.primary );
      ("PrivateIpAddress", option_to_yojson ipv4_address_to_yojson x.private_ip_address);
    ]

let private_ip_addresses_to_yojson tree =
  list_to_yojson private_ip_address_specification_to_yojson tree

let network_interface_id_to_yojson = string_to_yojson
let ipv6_prefix_to_yojson = string_to_yojson

let ipv6_prefix_specification_request_to_yojson (x : ipv6_prefix_specification_request) =
  assoc_to_yojson [ ("Ipv6Prefix", option_to_yojson ipv6_prefix_to_yojson x.ipv6_prefix) ]

let ipv6_prefixes_to_yojson tree = list_to_yojson ipv6_prefix_specification_request_to_yojson tree
let ipv6_address_to_yojson = string_to_yojson

let instance_ipv6_address_to_yojson (x : instance_ipv6_address) =
  assoc_to_yojson
    [
      ("Ipv6Address", option_to_yojson ipv6_address_to_yojson x.ipv6_address);
      ( "IsPrimaryIpv6",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.is_primary_ipv6
      );
    ]

let ipv6_addresses_to_yojson tree = list_to_yojson instance_ipv6_address_to_yojson tree
let ipv4_prefix_to_yojson = string_to_yojson

let ipv4_prefix_specification_request_to_yojson (x : ipv4_prefix_specification_request) =
  assoc_to_yojson [ ("Ipv4Prefix", option_to_yojson ipv4_prefix_to_yojson x.ipv4_prefix) ]

let ipv4_prefixes_to_yojson tree = list_to_yojson ipv4_prefix_specification_request_to_yojson tree

let interface_type_enum_to_yojson (x : interface_type_enum) =
  match x with
  | INTERFACE -> `String "interface"
  | EFA -> `String "efa"
  | EFA_ONLY -> `String "efa-only"

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
      ( "EnaSrdEnabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.ena_srd_enabled
      );
      ( "EnaSrdUdpSpecification",
        option_to_yojson ena_srd_udp_specification_request_to_yojson x.ena_srd_udp_specification );
    ]

let description_to_yojson = string_to_yojson

let instance_network_interface_specification_to_yojson
    (x : instance_network_interface_specification) =
  assoc_to_yojson
    [
      ( "AssociateCarrierIpAddress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.associate_carrier_ip_address );
      ( "AssociatePublicIpAddress",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.associate_public_ip_address );
      ( "ConnectionTrackingSpecification",
        option_to_yojson connection_tracking_specification_request_to_yojson
          x.connection_tracking_specification );
      ("Description", option_to_yojson description_to_yojson x.description);
      ("DeviceIndex", option_to_yojson non_negative_integer_to_yojson x.device_index);
      ( "EnaSrdSpecification",
        option_to_yojson ena_srd_specification_request_to_yojson x.ena_srd_specification );
      ("InterfaceType", option_to_yojson interface_type_enum_to_yojson x.interface_type);
      ("Ipv4Prefixes", option_to_yojson ipv4_prefixes_to_yojson x.ipv4_prefixes);
      ("Ipv4PrefixCount", option_to_yojson non_negative_integer_to_yojson x.ipv4_prefix_count);
      ("Ipv6AddressCount", option_to_yojson non_negative_integer_to_yojson x.ipv6_address_count);
      ("Ipv6Addresses", option_to_yojson ipv6_addresses_to_yojson x.ipv6_addresses);
      ("Ipv6Prefixes", option_to_yojson ipv6_prefixes_to_yojson x.ipv6_prefixes);
      ("Ipv6PrefixCount", option_to_yojson non_negative_integer_to_yojson x.ipv6_prefix_count);
      ("NetworkCardIndex", option_to_yojson non_negative_integer_to_yojson x.network_card_index);
      ("NetworkInterfaceId", option_to_yojson network_interface_id_to_yojson x.network_interface_id);
      ( "PrimaryIpv6",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.primary_ipv6 );
      ("PrivateIpAddress", option_to_yojson ipv4_address_to_yojson x.private_ip_address);
      ("PrivateIpAddresses", option_to_yojson private_ip_addresses_to_yojson x.private_ip_addresses);
      ( "SecondaryPrivateIpAddressCount",
        option_to_yojson non_negative_integer_to_yojson x.secondary_private_ip_address_count );
      ("Groups", option_to_yojson security_group_ids_to_yojson x.groups);
      ("SubnetId", option_to_yojson subnet_id_to_yojson x.subnet_id);
    ]

let network_interfaces_to_yojson tree =
  list_to_yojson instance_network_interface_specification_to_yojson tree

let run_instances_monitoring_enabled_to_yojson (x : run_instances_monitoring_enabled) =
  assoc_to_yojson
    [
      ( "Enabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.enabled );
    ]

let instance_metadata_tags_enum_to_yojson (x : instance_metadata_tags_enum) =
  match x with ENABLED -> `String "enabled" | DISABLED -> `String "disabled"

let http_tokens_enum_to_yojson (x : http_tokens_enum) =
  match x with OPTIONAL -> `String "optional" | REQUIRED -> `String "required"

let http_put_response_hop_limit_to_yojson = int_to_yojson

let http_protocol_ipv6_enum_to_yojson (x : http_protocol_ipv6_enum) =
  match x with ENABLED -> `String "enabled" | DISABLED -> `String "disabled"

let http_endpoint_enum_to_yojson (x : http_endpoint_enum) =
  match x with ENABLED -> `String "enabled" | DISABLED -> `String "disabled"

let instance_metadata_options_request_to_yojson (x : instance_metadata_options_request) =
  assoc_to_yojson
    [
      ("HttpEndpoint", option_to_yojson http_endpoint_enum_to_yojson x.http_endpoint);
      ("HttpProtocolIpv6", option_to_yojson http_protocol_ipv6_enum_to_yojson x.http_protocol_ipv6);
      ( "HttpPutResponseHopLimit",
        option_to_yojson http_put_response_hop_limit_to_yojson x.http_put_response_hop_limit );
      ("HttpTokens", option_to_yojson http_tokens_enum_to_yojson x.http_tokens);
      ( "InstanceMetadataTags",
        option_to_yojson instance_metadata_tags_enum_to_yojson x.instance_metadata_tags );
    ]

let instance_maintenance_options_request_to_yojson (x : instance_maintenance_options_request) =
  assoc_to_yojson
    [ ("AutoRecovery", option_to_yojson auto_recovery_enum_to_yojson x.auto_recovery) ]

let license_configuration_request_to_yojson (x : license_configuration_request) =
  assoc_to_yojson
    [ ("LicenseConfigurationArn", option_to_yojson ar_n_to_yojson x.license_configuration_arn) ]

let license_specifications_to_yojson tree =
  list_to_yojson license_configuration_request_to_yojson tree

let instance_type_to_yojson = string_to_yojson

let spot_instance_type_enum_to_yojson (x : spot_instance_type_enum) =
  match x with ONE_TIME -> `String "one-time" | PERSISTENT -> `String "persistent"

let instance_interruption_behavior_enum_to_yojson (x : instance_interruption_behavior_enum) =
  match x with HIBERNATE -> `String "hibernate" | STOP -> `String "stop"

let spot_market_options_to_yojson (x : spot_market_options) =
  assoc_to_yojson
    [
      ( "BlockDurationMinutes",
        option_to_yojson non_negative_integer_to_yojson x.block_duration_minutes );
      ( "InstanceInterruptionBehavior",
        option_to_yojson instance_interruption_behavior_enum_to_yojson
          x.instance_interruption_behavior );
      ("MaxPrice", option_to_yojson string64_to_yojson x.max_price);
      ("SpotInstanceType", option_to_yojson spot_instance_type_enum_to_yojson x.spot_instance_type);
      ( "ValidUntilUtc",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.valid_until_utc );
    ]

let market_type_enum_to_yojson (x : market_type_enum) =
  match x with SPOT -> `String "spot" | CAPACITY_BLOCK -> `String "capacity-block"

let instance_market_options_request_to_yojson (x : instance_market_options_request) =
  assoc_to_yojson
    [
      ("MarketType", option_to_yojson market_type_enum_to_yojson x.market_type);
      ("SpotOptions", option_to_yojson spot_market_options_to_yojson x.spot_options);
    ]

let image_id_to_yojson = string_to_yojson

let iam_instance_profile_specification_to_yojson (x : iam_instance_profile_specification) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson ar_n_to_yojson x.arn);
      ("Name", option_to_yojson string64_to_yojson x.name);
    ]

let hibernation_options_request_to_yojson (x : hibernation_options_request) =
  assoc_to_yojson
    [
      ( "Configured",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.configured );
    ]

let enclave_options_request_to_yojson (x : enclave_options_request) =
  assoc_to_yojson
    [
      ( "Enabled",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.enabled );
    ]

let credit_specification_request_to_yojson (x : credit_specification_request) =
  assoc_to_yojson [ ("CpuCredits", option_to_yojson cpu_credits_enum_to_yojson x.cpu_credits) ]

let managed_instance_request_to_yojson (x : managed_instance_request) =
  assoc_to_yojson
    [
      ( "BlockDeviceMappings",
        option_to_yojson block_device_mappings_to_yojson x.block_device_mappings );
      ( "CapacityReservationSpecification",
        option_to_yojson capacity_reservation_specification_to_yojson
          x.capacity_reservation_specification );
      ("CpuOptions", option_to_yojson cpu_options_request_to_yojson x.cpu_options);
      ( "CreditSpecification",
        option_to_yojson credit_specification_request_to_yojson x.credit_specification );
      ( "DisableApiStop",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.disable_api_stop
      );
      ( "EbsOptimized",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.ebs_optimized );
      ( "EnablePrimaryIpv6",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson
          x.enable_primary_ipv6 );
      ("EnclaveOptions", option_to_yojson enclave_options_request_to_yojson x.enclave_options);
      ( "HibernationOptions",
        option_to_yojson hibernation_options_request_to_yojson x.hibernation_options );
      ( "IamInstanceProfile",
        option_to_yojson iam_instance_profile_specification_to_yojson x.iam_instance_profile );
      ("ImageId", option_to_yojson image_id_to_yojson x.image_id);
      ( "InstanceMarketOptions",
        option_to_yojson instance_market_options_request_to_yojson x.instance_market_options );
      ("InstanceType", option_to_yojson instance_type_to_yojson x.instance_type);
      ("Ipv6Addresses", option_to_yojson ipv6_addresses_to_yojson x.ipv6_addresses);
      ("Ipv6AddressCount", option_to_yojson non_negative_integer_to_yojson x.ipv6_address_count);
      ("KernelId", option_to_yojson string128_to_yojson x.kernel_id);
      ("KeyName", option_to_yojson string64_to_yojson x.key_name);
      ( "LicenseSpecifications",
        option_to_yojson license_specifications_to_yojson x.license_specifications );
      ( "MaintenanceOptions",
        option_to_yojson instance_maintenance_options_request_to_yojson x.maintenance_options );
      ( "MetadataOptions",
        option_to_yojson instance_metadata_options_request_to_yojson x.metadata_options );
      ("Monitoring", option_to_yojson run_instances_monitoring_enabled_to_yojson x.monitoring);
      ("NetworkInterfaces", option_to_yojson network_interfaces_to_yojson x.network_interfaces);
      ( "NetworkPerformanceOptions",
        option_to_yojson instance_network_performance_options_request_to_yojson
          x.network_performance_options );
      ("Placement", option_to_yojson placement_to_yojson x.placement);
      ( "PrivateDnsNameOptions",
        option_to_yojson private_dns_name_options_request_to_yojson x.private_dns_name_options );
      ("PrivateIpAddress", option_to_yojson ipv4_address_to_yojson x.private_ip_address);
      ("RamdiskId", option_to_yojson string128_to_yojson x.ramdisk_id);
      ("SecurityGroupIds", option_to_yojson security_group_ids_to_yojson x.security_group_ids);
      ("SecurityGroups", option_to_yojson security_group_names_to_yojson x.security_groups);
      ("SubnetId", option_to_yojson subnet_id_to_yojson x.subnet_id);
      ("TagSpecifications", option_to_yojson tag_specifications_to_yojson x.tag_specifications);
      ("UserData", option_to_yojson user_data_to_yojson x.user_data);
    ]

let create_workspace_instance_request_to_yojson (x : create_workspace_instance_request) =
  assoc_to_yojson
    [
      ( "ClientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ManagedInstance", Some (managed_instance_request_to_yojson x.managed_instance));
      ( "BillingConfiguration",
        option_to_yojson billing_configuration_to_yojson x.billing_configuration );
    ]

let delete_volume_response_to_yojson = unit_to_yojson

let delete_volume_request_to_yojson (x : delete_volume_request) =
  assoc_to_yojson [ ("VolumeId", Some (volume_id_to_yojson x.volume_id)) ]

let delete_workspace_instance_response_to_yojson = unit_to_yojson

let delete_workspace_instance_request_to_yojson (x : delete_workspace_instance_request) =
  assoc_to_yojson
    [ ("WorkspaceInstanceId", Some (workspace_instance_id_to_yojson x.workspace_instance_id)) ]

let disassociate_mode_enum_to_yojson (x : disassociate_mode_enum) =
  match x with FORCE -> `String "FORCE" | NO_FORCE -> `String "NO_FORCE"

let disassociate_volume_response_to_yojson = unit_to_yojson

let disassociate_volume_request_to_yojson (x : disassociate_volume_request) =
  assoc_to_yojson
    [
      ("WorkspaceInstanceId", Some (workspace_instance_id_to_yojson x.workspace_instance_id));
      ("VolumeId", Some (volume_id_to_yojson x.volume_id));
      ("Device", option_to_yojson device_name_to_yojson x.device);
      ("DisassociateMode", option_to_yojson disassociate_mode_enum_to_yojson x.disassociate_mode);
    ]

let ec2_instance_error_to_yojson (x : ec2_instance_error) =
  assoc_to_yojson
    [
      ( "EC2ErrorCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ec2_error_code );
      ( "EC2ExceptionType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.ec2_exception_type );
      ( "EC2ErrorMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.ec2_error_message
      );
    ]

let ec2_instance_errors_to_yojson tree = list_to_yojson ec2_instance_error_to_yojson tree

let ec2_managed_instance_to_yojson (x : ec2_managed_instance) =
  assoc_to_yojson
    [
      ( "InstanceId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.instance_id );
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("WorkspaceInstanceId", Some (workspace_instance_id_to_yojson x.workspace_instance_id));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("WorkspaceInstanceId", Some (workspace_instance_id_to_yojson x.workspace_instance_id));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let next_token_to_yojson = string_to_yojson

let provision_state_enum_to_yojson (x : provision_state_enum) =
  match x with
  | ALLOCATING -> `String "ALLOCATING"
  | ALLOCATED -> `String "ALLOCATED"
  | DEALLOCATING -> `String "DEALLOCATING"
  | DEALLOCATED -> `String "DEALLOCATED"
  | ERROR_ALLOCATING -> `String "ERROR_ALLOCATING"
  | ERROR_DEALLOCATING -> `String "ERROR_DEALLOCATING"

let workspace_instance_to_yojson (x : workspace_instance) =
  assoc_to_yojson
    [
      ("ProvisionState", option_to_yojson provision_state_enum_to_yojson x.provision_state);
      ( "WorkspaceInstanceId",
        option_to_yojson workspace_instance_id_to_yojson x.workspace_instance_id );
      ("EC2ManagedInstance", option_to_yojson ec2_managed_instance_to_yojson x.ec2_managed_instance);
    ]

let workspace_instances_to_yojson tree = list_to_yojson workspace_instance_to_yojson tree

let list_workspace_instances_response_to_yojson (x : list_workspace_instances_response) =
  assoc_to_yojson
    [
      ("WorkspaceInstances", Some (workspace_instances_to_yojson x.workspace_instances));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson
let provision_states_to_yojson tree = list_to_yojson provision_state_enum_to_yojson tree

let list_workspace_instances_request_to_yojson (x : list_workspace_instances_request) =
  assoc_to_yojson
    [
      ("ProvisionStates", option_to_yojson provision_states_to_yojson x.provision_states);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson
    [ ("WorkspaceInstanceId", Some (workspace_instance_id_to_yojson x.workspace_instance_id)) ]

let region_name_to_yojson = string_to_yojson

let region_to_yojson (x : region) =
  assoc_to_yojson [ ("RegionName", option_to_yojson region_name_to_yojson x.region_name) ]

let region_list_to_yojson tree = list_to_yojson region_to_yojson tree

let list_regions_response_to_yojson (x : list_regions_response) =
  assoc_to_yojson
    [
      ("Regions", Some (region_list_to_yojson x.regions));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_regions_request_to_yojson (x : list_regions_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let instance_configuration_tenancy_enum_to_yojson (x : instance_configuration_tenancy_enum) =
  match x with SHARED -> `String "SHARED" | DEDICATED -> `String "DEDICATED"

let platform_type_enum_to_yojson (x : platform_type_enum) =
  match x with
  | WINDOWS -> `String "Windows"
  | WINDOWS_BYOL -> `String "Windows BYOL"
  | LINUX_UNIX -> `String "Linux/UNIX"
  | UBUNTU_PRO -> `String "Ubuntu Pro Linux"
  | RHEL -> `String "Red Hat Enterprise Linux"
  | LINUX_BYOL -> `String "Red Hat BYOL Linux"
  | SUSE -> `String "SUSE Linux"

let supported_instance_configuration_to_yojson (x : supported_instance_configuration) =
  assoc_to_yojson
    [
      ("BillingMode", option_to_yojson billing_mode_to_yojson x.billing_mode);
      ("PlatformType", option_to_yojson platform_type_enum_to_yojson x.platform_type);
      ("Tenancy", option_to_yojson instance_configuration_tenancy_enum_to_yojson x.tenancy);
    ]

let supported_instance_configurations_to_yojson tree =
  list_to_yojson supported_instance_configuration_to_yojson tree

let instance_type_info_to_yojson (x : instance_type_info) =
  assoc_to_yojson
    [
      ("InstanceType", option_to_yojson instance_type_to_yojson x.instance_type);
      ( "SupportedInstanceConfigurations",
        option_to_yojson supported_instance_configurations_to_yojson
          x.supported_instance_configurations );
    ]

let instance_types_to_yojson tree = list_to_yojson instance_type_info_to_yojson tree

let list_instance_types_response_to_yojson (x : list_instance_types_response) =
  assoc_to_yojson
    [
      ("InstanceTypes", Some (instance_types_to_yojson x.instance_types));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let instance_configuration_filter_to_yojson (x : instance_configuration_filter) =
  assoc_to_yojson
    [
      ("BillingMode", Some (billing_mode_to_yojson x.billing_mode));
      ("PlatformType", Some (platform_type_enum_to_yojson x.platform_type));
      ("Tenancy", Some (instance_configuration_tenancy_enum_to_yojson x.tenancy));
    ]

let list_instance_types_max_results_to_yojson = int_to_yojson

let list_instance_types_request_to_yojson (x : list_instance_types_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson list_instance_types_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "InstanceConfigurationFilter",
        option_to_yojson instance_configuration_filter_to_yojson x.instance_configuration_filter );
    ]

let workspace_instance_error_to_yojson (x : workspace_instance_error) =
  assoc_to_yojson
    [
      ( "ErrorCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_code );
      ( "ErrorMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_message );
    ]

let workspace_instance_errors_to_yojson tree =
  list_to_yojson workspace_instance_error_to_yojson tree

let get_workspace_instance_response_to_yojson (x : get_workspace_instance_response) =
  assoc_to_yojson
    [
      ( "WorkspaceInstanceErrors",
        option_to_yojson workspace_instance_errors_to_yojson x.workspace_instance_errors );
      ("EC2InstanceErrors", option_to_yojson ec2_instance_errors_to_yojson x.ec2_instance_errors);
      ("ProvisionState", option_to_yojson provision_state_enum_to_yojson x.provision_state);
      ( "WorkspaceInstanceId",
        option_to_yojson workspace_instance_id_to_yojson x.workspace_instance_id );
      ("EC2ManagedInstance", option_to_yojson ec2_managed_instance_to_yojson x.ec2_managed_instance);
      ( "BillingConfiguration",
        option_to_yojson billing_configuration_to_yojson x.billing_configuration );
    ]

let get_workspace_instance_request_to_yojson (x : get_workspace_instance_request) =
  assoc_to_yojson
    [ ("WorkspaceInstanceId", Some (workspace_instance_id_to_yojson x.workspace_instance_id)) ]
