open Smaws_Lib.Json.DeserializeHelpers
open Types

let aws_account_id_of_yojson = string_of_yojson
let error_message_of_yojson = string_of_yojson

let volume_not_found_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : volume_not_found)

let missing_volume_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : missing_volume_configuration)

let internal_server_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : internal_server_error)

let parameter_of_yojson = string_of_yojson

let incompatible_parameter_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parameter = value_for_key parameter_of_yojson "Parameter" _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
   }
    : incompatible_parameter_error)

let bad_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : bad_request)

let open_zfs_copy_strategy_of_yojson (tree : t) path =
  ((match tree with
    | `String "CLONE" -> CLONE
    | `String "FULL_COPY" -> FULL_COPY
    | `String "INCREMENTAL_COPY" -> INCREMENTAL_COPY
    | `String value -> raise (deserialize_unknown_enum_value_error path "OpenZFSCopyStrategy" value)
    | _ -> raise (deserialize_wrong_type_error path "OpenZFSCopyStrategy")
     : open_zfs_copy_strategy)
    : open_zfs_copy_strategy)

let snapshot_id_of_yojson = string_of_yojson
let resource_ar_n_of_yojson = string_of_yojson
let flag_of_yojson = bool_of_yojson
let integer_no_max_of_yojson = int_of_yojson

let open_zfs_quota_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "USER" -> USER
    | `String "GROUP" -> GROUP
    | `String value -> raise (deserialize_unknown_enum_value_error path "OpenZFSQuotaType" value)
    | _ -> raise (deserialize_wrong_type_error path "OpenZFSQuotaType")
     : open_zfs_quota_type)
    : open_zfs_quota_type)

let open_zfs_user_or_group_quota_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key open_zfs_quota_type_of_yojson "Type" _list path;
     id = value_for_key integer_no_max_of_yojson "Id" _list path;
     storage_capacity_quota_gi_b =
       value_for_key integer_no_max_of_yojson "StorageCapacityQuotaGiB" _list path;
   }
    : open_zfs_user_or_group_quota)

let open_zfs_user_and_group_quotas_of_yojson tree path =
  list_of_yojson open_zfs_user_or_group_quota_of_yojson tree path

let open_zfs_nfs_export_option_of_yojson = string_of_yojson

let open_zfs_nfs_export_options_of_yojson tree path =
  list_of_yojson open_zfs_nfs_export_option_of_yojson tree path

let open_zfs_clients_of_yojson = string_of_yojson

let open_zfs_client_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     clients = value_for_key open_zfs_clients_of_yojson "Clients" _list path;
     options = value_for_key open_zfs_nfs_export_options_of_yojson "Options" _list path;
   }
    : open_zfs_client_configuration)

let open_zfs_client_configurations_of_yojson tree path =
  list_of_yojson open_zfs_client_configuration_of_yojson tree path

let open_zfs_nfs_export_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_configurations =
       value_for_key open_zfs_client_configurations_of_yojson "ClientConfigurations" _list path;
   }
    : open_zfs_nfs_export)

let open_zfs_nfs_exports_of_yojson tree path =
  list_of_yojson open_zfs_nfs_export_of_yojson tree path

let read_only_of_yojson = bool_of_yojson

let open_zfs_origin_snapshot_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     snapshot_ar_n =
       option_of_yojson (value_for_key resource_ar_n_of_yojson "SnapshotARN") _list path;
     copy_strategy =
       option_of_yojson (value_for_key open_zfs_copy_strategy_of_yojson "CopyStrategy") _list path;
   }
    : open_zfs_origin_snapshot_configuration)

let open_zfs_data_compression_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "ZSTD" -> ZSTD
    | `String "LZ4" -> LZ4
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "OpenZFSDataCompressionType" value)
    | _ -> raise (deserialize_wrong_type_error path "OpenZFSDataCompressionType")
     : open_zfs_data_compression_type)
    : open_zfs_data_compression_type)

let integer_record_size_ki_b_of_yojson = int_of_yojson
let volume_path_of_yojson = string_of_yojson
let volume_id_of_yojson = string_of_yojson

let open_zfs_volume_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parent_volume_id =
       option_of_yojson (value_for_key volume_id_of_yojson "ParentVolumeId") _list path;
     volume_path = option_of_yojson (value_for_key volume_path_of_yojson "VolumePath") _list path;
     storage_capacity_reservation_gi_b =
       option_of_yojson
         (value_for_key integer_no_max_of_yojson "StorageCapacityReservationGiB")
         _list path;
     storage_capacity_quota_gi_b =
       option_of_yojson
         (value_for_key integer_no_max_of_yojson "StorageCapacityQuotaGiB")
         _list path;
     record_size_ki_b =
       option_of_yojson
         (value_for_key integer_record_size_ki_b_of_yojson "RecordSizeKiB")
         _list path;
     data_compression_type =
       option_of_yojson
         (value_for_key open_zfs_data_compression_type_of_yojson "DataCompressionType")
         _list path;
     copy_tags_to_snapshots =
       option_of_yojson (value_for_key flag_of_yojson "CopyTagsToSnapshots") _list path;
     origin_snapshot =
       option_of_yojson
         (value_for_key open_zfs_origin_snapshot_configuration_of_yojson "OriginSnapshot")
         _list path;
     read_only = option_of_yojson (value_for_key read_only_of_yojson "ReadOnly") _list path;
     nfs_exports =
       option_of_yojson (value_for_key open_zfs_nfs_exports_of_yojson "NfsExports") _list path;
     user_and_group_quotas =
       option_of_yojson
         (value_for_key open_zfs_user_and_group_quotas_of_yojson "UserAndGroupQuotas")
         _list path;
     restore_to_snapshot =
       option_of_yojson (value_for_key snapshot_id_of_yojson "RestoreToSnapshot") _list path;
     delete_intermediate_snaphots =
       option_of_yojson (value_for_key flag_of_yojson "DeleteIntermediateSnaphots") _list path;
     delete_cloned_volumes =
       option_of_yojson (value_for_key flag_of_yojson "DeleteClonedVolumes") _list path;
     delete_intermediate_data =
       option_of_yojson (value_for_key flag_of_yojson "DeleteIntermediateData") _list path;
     source_snapshot_ar_n =
       option_of_yojson (value_for_key resource_ar_n_of_yojson "SourceSnapshotARN") _list path;
     destination_snapshot =
       option_of_yojson (value_for_key snapshot_id_of_yojson "DestinationSnapshot") _list path;
     copy_strategy =
       option_of_yojson (value_for_key open_zfs_copy_strategy_of_yojson "CopyStrategy") _list path;
   }
    : open_zfs_volume_configuration)

let remaining_transfer_bytes_of_yojson = long_of_yojson
let total_transfer_bytes_of_yojson = long_of_yojson
let tag_value_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key tag_key_of_yojson "Key" _list path;
     value = value_for_key tag_value_of_yojson "Value" _list path;
   }
    : tag)

let tags_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let lifecycle_transition_reason_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : lifecycle_transition_reason)

let snapshot_lifecycle_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING" -> PENDING
    | `String "CREATING" -> CREATING
    | `String "DELETING" -> DELETING
    | `String "AVAILABLE" -> AVAILABLE
    | `String value -> raise (deserialize_unknown_enum_value_error path "SnapshotLifecycle" value)
    | _ -> raise (deserialize_wrong_type_error path "SnapshotLifecycle")
     : snapshot_lifecycle)
    : snapshot_lifecycle)

let creation_time_of_yojson = timestamp_epoch_seconds_of_yojson
let snapshot_name_of_yojson = string_of_yojson

let administrative_action_failure_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : administrative_action_failure_details)

let network_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "IPV4" -> IPV4
    | `String "DUAL" -> DUAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "NetworkType" value)
    | _ -> raise (deserialize_wrong_type_error path "NetworkType")
     : network_type)
    : network_type)

let storage_capacity_of_yojson = int_of_yojson

let open_zfs_read_cache_sizing_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "NO_CACHE" -> NO_CACHE
    | `String "USER_PROVISIONED" -> USER_PROVISIONED
    | `String "PROPORTIONAL_TO_THROUGHPUT_CAPACITY" -> PROPORTIONAL_TO_THROUGHPUT_CAPACITY
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "OpenZFSReadCacheSizingMode" value)
    | _ -> raise (deserialize_wrong_type_error path "OpenZFSReadCacheSizingMode")
     : open_zfs_read_cache_sizing_mode)
    : open_zfs_read_cache_sizing_mode)

let open_zfs_read_cache_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sizing_mode =
       option_of_yojson
         (value_for_key open_zfs_read_cache_sizing_mode_of_yojson "SizingMode")
         _list path;
     size_gi_b = option_of_yojson (value_for_key storage_capacity_of_yojson "SizeGiB") _list path;
   }
    : open_zfs_read_cache_configuration)

let ip_address_of_yojson = string_of_yojson
let route_table_id_of_yojson = string_of_yojson
let route_table_ids_of_yojson tree path = list_of_yojson route_table_id_of_yojson tree path
let ipv6_address_range_of_yojson = string_of_yojson
let ip_address_range_of_yojson = string_of_yojson
let subnet_id_of_yojson = string_of_yojson
let iops_of_yojson = long_of_yojson

let disk_iops_configuration_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "AUTOMATIC" -> AUTOMATIC
    | `String "USER_PROVISIONED" -> USER_PROVISIONED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DiskIopsConfigurationMode" value)
    | _ -> raise (deserialize_wrong_type_error path "DiskIopsConfigurationMode")
     : disk_iops_configuration_mode)
    : disk_iops_configuration_mode)

let disk_iops_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     mode =
       option_of_yojson (value_for_key disk_iops_configuration_mode_of_yojson "Mode") _list path;
     iops = option_of_yojson (value_for_key iops_of_yojson "Iops") _list path;
   }
    : disk_iops_configuration)

let weekly_time_of_yojson = string_of_yojson
let megabytes_per_second_of_yojson = int_of_yojson

let open_zfs_deployment_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SINGLE_AZ_1" -> SINGLE_AZ_1
    | `String "SINGLE_AZ_2" -> SINGLE_AZ_2
    | `String "SINGLE_AZ_HA_1" -> SINGLE_AZ_HA_1
    | `String "SINGLE_AZ_HA_2" -> SINGLE_AZ_HA_2
    | `String "MULTI_AZ_1" -> MULTI_AZ_1
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "OpenZFSDeploymentType" value)
    | _ -> raise (deserialize_wrong_type_error path "OpenZFSDeploymentType")
     : open_zfs_deployment_type)
    : open_zfs_deployment_type)

let daily_time_of_yojson = string_of_yojson
let automatic_backup_retention_days_of_yojson = int_of_yojson

let open_zfs_file_system_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     automatic_backup_retention_days =
       option_of_yojson
         (value_for_key automatic_backup_retention_days_of_yojson "AutomaticBackupRetentionDays")
         _list path;
     copy_tags_to_backups =
       option_of_yojson (value_for_key flag_of_yojson "CopyTagsToBackups") _list path;
     copy_tags_to_volumes =
       option_of_yojson (value_for_key flag_of_yojson "CopyTagsToVolumes") _list path;
     daily_automatic_backup_start_time =
       option_of_yojson
         (value_for_key daily_time_of_yojson "DailyAutomaticBackupStartTime")
         _list path;
     deployment_type =
       option_of_yojson
         (value_for_key open_zfs_deployment_type_of_yojson "DeploymentType")
         _list path;
     throughput_capacity =
       option_of_yojson
         (value_for_key megabytes_per_second_of_yojson "ThroughputCapacity")
         _list path;
     weekly_maintenance_start_time =
       option_of_yojson
         (value_for_key weekly_time_of_yojson "WeeklyMaintenanceStartTime")
         _list path;
     disk_iops_configuration =
       option_of_yojson
         (value_for_key disk_iops_configuration_of_yojson "DiskIopsConfiguration")
         _list path;
     root_volume_id = option_of_yojson (value_for_key volume_id_of_yojson "RootVolumeId") _list path;
     preferred_subnet_id =
       option_of_yojson (value_for_key subnet_id_of_yojson "PreferredSubnetId") _list path;
     endpoint_ip_address_range =
       option_of_yojson
         (value_for_key ip_address_range_of_yojson "EndpointIpAddressRange")
         _list path;
     endpoint_ipv6_address_range =
       option_of_yojson
         (value_for_key ipv6_address_range_of_yojson "EndpointIpv6AddressRange")
         _list path;
     route_table_ids =
       option_of_yojson (value_for_key route_table_ids_of_yojson "RouteTableIds") _list path;
     endpoint_ip_address =
       option_of_yojson (value_for_key ip_address_of_yojson "EndpointIpAddress") _list path;
     endpoint_ipv6_address =
       option_of_yojson (value_for_key ip_address_of_yojson "EndpointIpv6Address") _list path;
     read_cache_configuration =
       option_of_yojson
         (value_for_key open_zfs_read_cache_configuration_of_yojson "ReadCacheConfiguration")
         _list path;
   }
    : open_zfs_file_system_configuration)

let file_system_type_version_of_yojson = string_of_yojson
let throughput_capacity_per_ha_pair_of_yojson = int_of_yojson
let ha_pairs_of_yojson = int_of_yojson
let admin_password_of_yojson = string_of_yojson
let ontap_endpoint_ip_addresses_of_yojson tree path = list_of_yojson ip_address_of_yojson tree path
let dns_name_of_yojson = string_of_yojson

let file_system_endpoint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dns_name = option_of_yojson (value_for_key dns_name_of_yojson "DNSName") _list path;
     ip_addresses =
       option_of_yojson
         (value_for_key ontap_endpoint_ip_addresses_of_yojson "IpAddresses")
         _list path;
     ipv6_addresses =
       option_of_yojson
         (value_for_key ontap_endpoint_ip_addresses_of_yojson "Ipv6Addresses")
         _list path;
   }
    : file_system_endpoint)

let file_system_endpoints_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     intercluster =
       option_of_yojson (value_for_key file_system_endpoint_of_yojson "Intercluster") _list path;
     management =
       option_of_yojson (value_for_key file_system_endpoint_of_yojson "Management") _list path;
   }
    : file_system_endpoints)

let ontap_deployment_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "MULTI_AZ_1" -> MULTI_AZ_1
    | `String "SINGLE_AZ_1" -> SINGLE_AZ_1
    | `String "SINGLE_AZ_2" -> SINGLE_AZ_2
    | `String "MULTI_AZ_2" -> MULTI_AZ_2
    | `String value -> raise (deserialize_unknown_enum_value_error path "OntapDeploymentType" value)
    | _ -> raise (deserialize_wrong_type_error path "OntapDeploymentType")
     : ontap_deployment_type)
    : ontap_deployment_type)

let ontap_file_system_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     automatic_backup_retention_days =
       option_of_yojson
         (value_for_key automatic_backup_retention_days_of_yojson "AutomaticBackupRetentionDays")
         _list path;
     daily_automatic_backup_start_time =
       option_of_yojson
         (value_for_key daily_time_of_yojson "DailyAutomaticBackupStartTime")
         _list path;
     deployment_type =
       option_of_yojson (value_for_key ontap_deployment_type_of_yojson "DeploymentType") _list path;
     endpoint_ip_address_range =
       option_of_yojson
         (value_for_key ip_address_range_of_yojson "EndpointIpAddressRange")
         _list path;
     endpoints =
       option_of_yojson (value_for_key file_system_endpoints_of_yojson "Endpoints") _list path;
     disk_iops_configuration =
       option_of_yojson
         (value_for_key disk_iops_configuration_of_yojson "DiskIopsConfiguration")
         _list path;
     preferred_subnet_id =
       option_of_yojson (value_for_key subnet_id_of_yojson "PreferredSubnetId") _list path;
     route_table_ids =
       option_of_yojson (value_for_key route_table_ids_of_yojson "RouteTableIds") _list path;
     throughput_capacity =
       option_of_yojson
         (value_for_key megabytes_per_second_of_yojson "ThroughputCapacity")
         _list path;
     weekly_maintenance_start_time =
       option_of_yojson
         (value_for_key weekly_time_of_yojson "WeeklyMaintenanceStartTime")
         _list path;
     fsx_admin_password =
       option_of_yojson (value_for_key admin_password_of_yojson "FsxAdminPassword") _list path;
     ha_pairs = option_of_yojson (value_for_key ha_pairs_of_yojson "HAPairs") _list path;
     throughput_capacity_per_ha_pair =
       option_of_yojson
         (value_for_key throughput_capacity_per_ha_pair_of_yojson "ThroughputCapacityPerHAPair")
         _list path;
     endpoint_ipv6_address_range =
       option_of_yojson
         (value_for_key ipv6_address_range_of_yojson "EndpointIpv6AddressRange")
         _list path;
   }
    : ontap_file_system_configuration)

let lustre_read_cache_sizing_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "NO_CACHE" -> NO_CACHE
    | `String "USER_PROVISIONED" -> USER_PROVISIONED
    | `String "PROPORTIONAL_TO_THROUGHPUT_CAPACITY" -> PROPORTIONAL_TO_THROUGHPUT_CAPACITY
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LustreReadCacheSizingMode" value)
    | _ -> raise (deserialize_wrong_type_error path "LustreReadCacheSizingMode")
     : lustre_read_cache_sizing_mode)
    : lustre_read_cache_sizing_mode)

let lustre_read_cache_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sizing_mode =
       option_of_yojson
         (value_for_key lustre_read_cache_sizing_mode_of_yojson "SizingMode")
         _list path;
     size_gi_b = option_of_yojson (value_for_key storage_capacity_of_yojson "SizeGiB") _list path;
   }
    : lustre_read_cache_configuration)

let throughput_capacity_mbps_of_yojson = int_of_yojson

let metadata_configuration_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "AUTOMATIC" -> AUTOMATIC
    | `String "USER_PROVISIONED" -> USER_PROVISIONED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "MetadataConfigurationMode" value)
    | _ -> raise (deserialize_wrong_type_error path "MetadataConfigurationMode")
     : metadata_configuration_mode)
    : metadata_configuration_mode)

let metadata_iops_of_yojson = int_of_yojson

let file_system_lustre_metadata_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     iops = option_of_yojson (value_for_key metadata_iops_of_yojson "Iops") _list path;
     mode = value_for_key metadata_configuration_mode_of_yojson "Mode" _list path;
   }
    : file_system_lustre_metadata_configuration)

let lustre_no_squash_nid_of_yojson = string_of_yojson

let lustre_no_squash_nids_of_yojson tree path =
  list_of_yojson lustre_no_squash_nid_of_yojson tree path

let lustre_root_squash_of_yojson = string_of_yojson

let lustre_root_squash_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     root_squash =
       option_of_yojson (value_for_key lustre_root_squash_of_yojson "RootSquash") _list path;
     no_squash_nids =
       option_of_yojson (value_for_key lustre_no_squash_nids_of_yojson "NoSquashNids") _list path;
   }
    : lustre_root_squash_configuration)

let general_ar_n_of_yojson = string_of_yojson

let lustre_access_audit_log_level_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "WARN_ONLY" -> WARN_ONLY
    | `String "ERROR_ONLY" -> ERROR_ONLY
    | `String "WARN_ERROR" -> WARN_ERROR
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LustreAccessAuditLogLevel" value)
    | _ -> raise (deserialize_wrong_type_error path "LustreAccessAuditLogLevel")
     : lustre_access_audit_log_level)
    : lustre_access_audit_log_level)

let lustre_log_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     level = value_for_key lustre_access_audit_log_level_of_yojson "Level" _list path;
     destination = option_of_yojson (value_for_key general_ar_n_of_yojson "Destination") _list path;
   }
    : lustre_log_configuration)

let data_compression_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "LZ4" -> LZ4
    | `String value -> raise (deserialize_unknown_enum_value_error path "DataCompressionType" value)
    | _ -> raise (deserialize_wrong_type_error path "DataCompressionType")
     : data_compression_type)
    : data_compression_type)

let drive_cache_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "READ" -> READ
    | `String value -> raise (deserialize_unknown_enum_value_error path "DriveCacheType" value)
    | _ -> raise (deserialize_wrong_type_error path "DriveCacheType")
     : drive_cache_type)
    : drive_cache_type)

let lustre_file_system_mount_name_of_yojson = string_of_yojson
let per_unit_storage_throughput_of_yojson = int_of_yojson

let lustre_deployment_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SCRATCH_1" -> SCRATCH_1
    | `String "SCRATCH_2" -> SCRATCH_2
    | `String "PERSISTENT_1" -> PERSISTENT_1
    | `String "PERSISTENT_2" -> PERSISTENT_2
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LustreDeploymentType" value)
    | _ -> raise (deserialize_wrong_type_error path "LustreDeploymentType")
     : lustre_deployment_type)
    : lustre_deployment_type)

let data_repository_failure_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : data_repository_failure_details)

let auto_import_policy_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "NEW" -> NEW
    | `String "NEW_CHANGED" -> NEW_CHANGED
    | `String "NEW_CHANGED_DELETED" -> NEW_CHANGED_DELETED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AutoImportPolicyType" value)
    | _ -> raise (deserialize_wrong_type_error path "AutoImportPolicyType")
     : auto_import_policy_type)
    : auto_import_policy_type)

let megabytes_of_yojson = int_of_yojson
let archive_path_of_yojson = string_of_yojson

let data_repository_lifecycle_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATING" -> CREATING
    | `String "AVAILABLE" -> AVAILABLE
    | `String "MISCONFIGURED" -> MISCONFIGURED
    | `String "UPDATING" -> UPDATING
    | `String "DELETING" -> DELETING
    | `String "FAILED" -> FAILED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DataRepositoryLifecycle" value)
    | _ -> raise (deserialize_wrong_type_error path "DataRepositoryLifecycle")
     : data_repository_lifecycle)
    : data_repository_lifecycle)

let data_repository_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lifecycle =
       option_of_yojson (value_for_key data_repository_lifecycle_of_yojson "Lifecycle") _list path;
     import_path = option_of_yojson (value_for_key archive_path_of_yojson "ImportPath") _list path;
     export_path = option_of_yojson (value_for_key archive_path_of_yojson "ExportPath") _list path;
     imported_file_chunk_size =
       option_of_yojson (value_for_key megabytes_of_yojson "ImportedFileChunkSize") _list path;
     auto_import_policy =
       option_of_yojson
         (value_for_key auto_import_policy_type_of_yojson "AutoImportPolicy")
         _list path;
     failure_details =
       option_of_yojson
         (value_for_key data_repository_failure_details_of_yojson "FailureDetails")
         _list path;
   }
    : data_repository_configuration)

let lustre_file_system_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     weekly_maintenance_start_time =
       option_of_yojson
         (value_for_key weekly_time_of_yojson "WeeklyMaintenanceStartTime")
         _list path;
     data_repository_configuration =
       option_of_yojson
         (value_for_key data_repository_configuration_of_yojson "DataRepositoryConfiguration")
         _list path;
     deployment_type =
       option_of_yojson (value_for_key lustre_deployment_type_of_yojson "DeploymentType") _list path;
     per_unit_storage_throughput =
       option_of_yojson
         (value_for_key per_unit_storage_throughput_of_yojson "PerUnitStorageThroughput")
         _list path;
     mount_name =
       option_of_yojson
         (value_for_key lustre_file_system_mount_name_of_yojson "MountName")
         _list path;
     daily_automatic_backup_start_time =
       option_of_yojson
         (value_for_key daily_time_of_yojson "DailyAutomaticBackupStartTime")
         _list path;
     automatic_backup_retention_days =
       option_of_yojson
         (value_for_key automatic_backup_retention_days_of_yojson "AutomaticBackupRetentionDays")
         _list path;
     copy_tags_to_backups =
       option_of_yojson (value_for_key flag_of_yojson "CopyTagsToBackups") _list path;
     drive_cache_type =
       option_of_yojson (value_for_key drive_cache_type_of_yojson "DriveCacheType") _list path;
     data_compression_type =
       option_of_yojson
         (value_for_key data_compression_type_of_yojson "DataCompressionType")
         _list path;
     log_configuration =
       option_of_yojson
         (value_for_key lustre_log_configuration_of_yojson "LogConfiguration")
         _list path;
     root_squash_configuration =
       option_of_yojson
         (value_for_key lustre_root_squash_configuration_of_yojson "RootSquashConfiguration")
         _list path;
     metadata_configuration =
       option_of_yojson
         (value_for_key file_system_lustre_metadata_configuration_of_yojson "MetadataConfiguration")
         _list path;
     efa_enabled = option_of_yojson (value_for_key flag_of_yojson "EfaEnabled") _list path;
     throughput_capacity =
       option_of_yojson
         (value_for_key throughput_capacity_mbps_of_yojson "ThroughputCapacity")
         _list path;
     data_read_cache_configuration =
       option_of_yojson
         (value_for_key lustre_read_cache_configuration_of_yojson "DataReadCacheConfiguration")
         _list path;
   }
    : lustre_file_system_configuration)

let windows_fsrm_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fsrm_service_enabled = value_for_key flag_of_yojson "FsrmServiceEnabled" _list path;
     event_log_destination =
       option_of_yojson (value_for_key general_ar_n_of_yojson "EventLogDestination") _list path;
   }
    : windows_fsrm_configuration)

let windows_access_audit_log_level_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "SUCCESS_ONLY" -> SUCCESS_ONLY
    | `String "FAILURE_ONLY" -> FAILURE_ONLY
    | `String "SUCCESS_AND_FAILURE" -> SUCCESS_AND_FAILURE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "WindowsAccessAuditLogLevel" value)
    | _ -> raise (deserialize_wrong_type_error path "WindowsAccessAuditLogLevel")
     : windows_access_audit_log_level)
    : windows_access_audit_log_level)

let windows_audit_log_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_access_audit_log_level =
       value_for_key windows_access_audit_log_level_of_yojson "FileAccessAuditLogLevel" _list path;
     file_share_access_audit_log_level =
       value_for_key windows_access_audit_log_level_of_yojson "FileShareAccessAuditLogLevel" _list
         path;
     audit_log_destination =
       option_of_yojson (value_for_key general_ar_n_of_yojson "AuditLogDestination") _list path;
   }
    : windows_audit_log_configuration)

let alias_lifecycle_of_yojson (tree : t) path =
  ((match tree with
    | `String "AVAILABLE" -> AVAILABLE
    | `String "CREATING" -> CREATING
    | `String "DELETING" -> DELETING
    | `String "CREATE_FAILED" -> CREATE_FAILED
    | `String "DELETE_FAILED" -> DELETE_FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "AliasLifecycle" value)
    | _ -> raise (deserialize_wrong_type_error path "AliasLifecycle")
     : alias_lifecycle)
    : alias_lifecycle)

let alternate_dns_name_of_yojson = string_of_yojson

let alias_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key alternate_dns_name_of_yojson "Name") _list path;
     lifecycle = option_of_yojson (value_for_key alias_lifecycle_of_yojson "Lifecycle") _list path;
   }
    : alias)

let aliases_of_yojson tree path = list_of_yojson alias_of_yojson tree path

let file_system_maintenance_operation_of_yojson (tree : t) path =
  ((match tree with
    | `String "PATCHING" -> PATCHING
    | `String "BACKING_UP" -> BACKING_UP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "FileSystemMaintenanceOperation" value)
    | _ -> raise (deserialize_wrong_type_error path "FileSystemMaintenanceOperation")
     : file_system_maintenance_operation)
    : file_system_maintenance_operation)

let file_system_maintenance_operations_of_yojson tree path =
  list_of_yojson file_system_maintenance_operation_of_yojson tree path

let windows_deployment_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "MULTI_AZ_1" -> MULTI_AZ_1
    | `String "SINGLE_AZ_1" -> SINGLE_AZ_1
    | `String "SINGLE_AZ_2" -> SINGLE_AZ_2
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "WindowsDeploymentType" value)
    | _ -> raise (deserialize_wrong_type_error path "WindowsDeploymentType")
     : windows_deployment_type)
    : windows_deployment_type)

let customer_secrets_manager_ar_n_of_yojson = string_of_yojson
let dns_ips_of_yojson tree path = list_of_yojson ip_address_of_yojson tree path
let directory_user_name_of_yojson = string_of_yojson
let file_system_administrators_group_name_of_yojson = string_of_yojson
let organizational_unit_distinguished_name_of_yojson = string_of_yojson
let active_directory_fully_qualified_name_of_yojson = string_of_yojson

let self_managed_active_directory_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name =
       option_of_yojson
         (value_for_key active_directory_fully_qualified_name_of_yojson "DomainName")
         _list path;
     organizational_unit_distinguished_name =
       option_of_yojson
         (value_for_key organizational_unit_distinguished_name_of_yojson
            "OrganizationalUnitDistinguishedName")
         _list path;
     file_system_administrators_group =
       option_of_yojson
         (value_for_key file_system_administrators_group_name_of_yojson
            "FileSystemAdministratorsGroup")
         _list path;
     user_name =
       option_of_yojson (value_for_key directory_user_name_of_yojson "UserName") _list path;
     dns_ips = option_of_yojson (value_for_key dns_ips_of_yojson "DnsIps") _list path;
     domain_join_service_account_secret =
       option_of_yojson
         (value_for_key customer_secrets_manager_ar_n_of_yojson "DomainJoinServiceAccountSecret")
         _list path;
   }
    : self_managed_active_directory_attributes)

let directory_id_of_yojson = string_of_yojson

let windows_file_system_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     active_directory_id =
       option_of_yojson (value_for_key directory_id_of_yojson "ActiveDirectoryId") _list path;
     self_managed_active_directory_configuration =
       option_of_yojson
         (value_for_key self_managed_active_directory_attributes_of_yojson
            "SelfManagedActiveDirectoryConfiguration")
         _list path;
     deployment_type =
       option_of_yojson
         (value_for_key windows_deployment_type_of_yojson "DeploymentType")
         _list path;
     remote_administration_endpoint =
       option_of_yojson (value_for_key dns_name_of_yojson "RemoteAdministrationEndpoint") _list path;
     preferred_subnet_id =
       option_of_yojson (value_for_key subnet_id_of_yojson "PreferredSubnetId") _list path;
     preferred_file_server_ip =
       option_of_yojson (value_for_key ip_address_of_yojson "PreferredFileServerIp") _list path;
     throughput_capacity =
       option_of_yojson
         (value_for_key megabytes_per_second_of_yojson "ThroughputCapacity")
         _list path;
     maintenance_operations_in_progress =
       option_of_yojson
         (value_for_key file_system_maintenance_operations_of_yojson
            "MaintenanceOperationsInProgress")
         _list path;
     weekly_maintenance_start_time =
       option_of_yojson
         (value_for_key weekly_time_of_yojson "WeeklyMaintenanceStartTime")
         _list path;
     daily_automatic_backup_start_time =
       option_of_yojson
         (value_for_key daily_time_of_yojson "DailyAutomaticBackupStartTime")
         _list path;
     automatic_backup_retention_days =
       option_of_yojson
         (value_for_key automatic_backup_retention_days_of_yojson "AutomaticBackupRetentionDays")
         _list path;
     copy_tags_to_backups =
       option_of_yojson (value_for_key flag_of_yojson "CopyTagsToBackups") _list path;
     aliases = option_of_yojson (value_for_key aliases_of_yojson "Aliases") _list path;
     audit_log_configuration =
       option_of_yojson
         (value_for_key windows_audit_log_configuration_of_yojson "AuditLogConfiguration")
         _list path;
     disk_iops_configuration =
       option_of_yojson
         (value_for_key disk_iops_configuration_of_yojson "DiskIopsConfiguration")
         _list path;
     preferred_file_server_ipv6 =
       option_of_yojson (value_for_key ip_address_of_yojson "PreferredFileServerIpv6") _list path;
     fsrm_configuration =
       option_of_yojson
         (value_for_key windows_fsrm_configuration_of_yojson "FsrmConfiguration")
         _list path;
   }
    : windows_file_system_configuration)

let kms_key_id_of_yojson = string_of_yojson
let network_interface_id_of_yojson = string_of_yojson

let network_interface_ids_of_yojson tree path =
  list_of_yojson network_interface_id_of_yojson tree path

let subnet_ids_of_yojson tree path = list_of_yojson subnet_id_of_yojson tree path
let vpc_id_of_yojson = string_of_yojson

let storage_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SSD" -> SSD
    | `String "HDD" -> HDD
    | `String "INTELLIGENT_TIERING" -> INTELLIGENT_TIERING
    | `String value -> raise (deserialize_unknown_enum_value_error path "StorageType" value)
    | _ -> raise (deserialize_wrong_type_error path "StorageType")
     : storage_type)
    : storage_type)

let file_system_failure_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : file_system_failure_details)

let file_system_lifecycle_of_yojson (tree : t) path =
  ((match tree with
    | `String "AVAILABLE" -> AVAILABLE
    | `String "CREATING" -> CREATING
    | `String "FAILED" -> FAILED
    | `String "DELETING" -> DELETING
    | `String "MISCONFIGURED" -> MISCONFIGURED
    | `String "UPDATING" -> UPDATING
    | `String "MISCONFIGURED_UNAVAILABLE" -> MISCONFIGURED_UNAVAILABLE
    | `String value -> raise (deserialize_unknown_enum_value_error path "FileSystemLifecycle" value)
    | _ -> raise (deserialize_wrong_type_error path "FileSystemLifecycle")
     : file_system_lifecycle)
    : file_system_lifecycle)

let file_system_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "WINDOWS" -> WINDOWS
    | `String "LUSTRE" -> LUSTRE
    | `String "ONTAP" -> ONTAP
    | `String "OPENZFS" -> OPENZFS
    | `String value -> raise (deserialize_unknown_enum_value_error path "FileSystemType" value)
    | _ -> raise (deserialize_wrong_type_error path "FileSystemType")
     : file_system_type)
    : file_system_type)

let file_system_id_of_yojson = string_of_yojson

let status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "PENDING" -> PENDING
    | `String "COMPLETED" -> COMPLETED
    | `String "UPDATED_OPTIMIZING" -> UPDATED_OPTIMIZING
    | `String "OPTIMIZING" -> OPTIMIZING
    | `String "PAUSED" -> PAUSED
    | `String "CANCELLED" -> CANCELLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "Status" value)
    | _ -> raise (deserialize_wrong_type_error path "Status")
     : status)
    : status)

let request_time_of_yojson = timestamp_epoch_seconds_of_yojson
let progress_percent_of_yojson = int_of_yojson

let administrative_action_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "FILE_SYSTEM_UPDATE" -> FILE_SYSTEM_UPDATE
    | `String "STORAGE_OPTIMIZATION" -> STORAGE_OPTIMIZATION
    | `String "FILE_SYSTEM_ALIAS_ASSOCIATION" -> FILE_SYSTEM_ALIAS_ASSOCIATION
    | `String "FILE_SYSTEM_ALIAS_DISASSOCIATION" -> FILE_SYSTEM_ALIAS_DISASSOCIATION
    | `String "VOLUME_UPDATE" -> VOLUME_UPDATE
    | `String "SNAPSHOT_UPDATE" -> SNAPSHOT_UPDATE
    | `String "RELEASE_NFS_V3_LOCKS" -> RELEASE_NFS_V3_LOCKS
    | `String "VOLUME_RESTORE" -> VOLUME_RESTORE
    | `String "THROUGHPUT_OPTIMIZATION" -> THROUGHPUT_OPTIMIZATION
    | `String "IOPS_OPTIMIZATION" -> IOPS_OPTIMIZATION
    | `String "STORAGE_TYPE_OPTIMIZATION" -> STORAGE_TYPE_OPTIMIZATION
    | `String "MISCONFIGURED_STATE_RECOVERY" -> MISCONFIGURED_STATE_RECOVERY
    | `String "VOLUME_UPDATE_WITH_SNAPSHOT" -> VOLUME_UPDATE_WITH_SNAPSHOT
    | `String "VOLUME_INITIALIZE_WITH_SNAPSHOT" -> VOLUME_INITIALIZE_WITH_SNAPSHOT
    | `String "DOWNLOAD_DATA_FROM_BACKUP" -> DOWNLOAD_DATA_FROM_BACKUP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AdministrativeActionType" value)
    | _ -> raise (deserialize_wrong_type_error path "AdministrativeActionType")
     : administrative_action_type)
    : administrative_action_type)

let volume_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ONTAP" -> ONTAP
    | `String "OPENZFS" -> OPENZFS
    | `String value -> raise (deserialize_unknown_enum_value_error path "VolumeType" value)
    | _ -> raise (deserialize_wrong_type_error path "VolumeType")
     : volume_type)
    : volume_type)

let volume_capacity_bytes_of_yojson = long_of_yojson
let total_constituents_of_yojson = int_of_yojson
let aggregate_of_yojson = string_of_yojson
let aggregates_of_yojson tree path = list_of_yojson aggregate_of_yojson tree path

let aggregate_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aggregates = option_of_yojson (value_for_key aggregates_of_yojson "Aggregates") _list path;
     total_constituents =
       option_of_yojson (value_for_key total_constituents_of_yojson "TotalConstituents") _list path;
   }
    : aggregate_configuration)

let volume_style_of_yojson (tree : t) path =
  ((match tree with
    | `String "FLEXVOL" -> FLEXVOL
    | `String "FLEXGROUP" -> FLEXGROUP
    | `String value -> raise (deserialize_unknown_enum_value_error path "VolumeStyle" value)
    | _ -> raise (deserialize_wrong_type_error path "VolumeStyle")
     : volume_style)
    : volume_style)

let snaplock_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "COMPLIANCE" -> COMPLIANCE
    | `String "ENTERPRISE" -> ENTERPRISE
    | `String value -> raise (deserialize_unknown_enum_value_error path "SnaplockType" value)
    | _ -> raise (deserialize_wrong_type_error path "SnaplockType")
     : snaplock_type)
    : snaplock_type)

let retention_period_value_of_yojson = int_of_yojson

let retention_period_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SECONDS" -> SECONDS
    | `String "MINUTES" -> MINUTES
    | `String "HOURS" -> HOURS
    | `String "DAYS" -> DAYS
    | `String "MONTHS" -> MONTHS
    | `String "YEARS" -> YEARS
    | `String "INFINITE" -> INFINITE
    | `String "UNSPECIFIED" -> UNSPECIFIED
    | `String value -> raise (deserialize_unknown_enum_value_error path "RetentionPeriodType" value)
    | _ -> raise (deserialize_wrong_type_error path "RetentionPeriodType")
     : retention_period_type)
    : retention_period_type)

let retention_period_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key retention_period_type_of_yojson "Type" _list path;
     value = option_of_yojson (value_for_key retention_period_value_of_yojson "Value") _list path;
   }
    : retention_period)

let snaplock_retention_period_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     default_retention = value_for_key retention_period_of_yojson "DefaultRetention" _list path;
     minimum_retention = value_for_key retention_period_of_yojson "MinimumRetention" _list path;
     maximum_retention = value_for_key retention_period_of_yojson "MaximumRetention" _list path;
   }
    : snaplock_retention_period)

let privileged_delete_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String "PERMANENTLY_DISABLED" -> PERMANENTLY_DISABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "PrivilegedDelete" value)
    | _ -> raise (deserialize_wrong_type_error path "PrivilegedDelete")
     : privileged_delete)
    : privileged_delete)

let autocommit_period_value_of_yojson = int_of_yojson

let autocommit_period_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "MINUTES" -> MINUTES
    | `String "HOURS" -> HOURS
    | `String "DAYS" -> DAYS
    | `String "MONTHS" -> MONTHS
    | `String "YEARS" -> YEARS
    | `String "NONE" -> NONE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AutocommitPeriodType" value)
    | _ -> raise (deserialize_wrong_type_error path "AutocommitPeriodType")
     : autocommit_period_type)
    : autocommit_period_type)

let autocommit_period_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key autocommit_period_type_of_yojson "Type" _list path;
     value = option_of_yojson (value_for_key autocommit_period_value_of_yojson "Value") _list path;
   }
    : autocommit_period)

let snaplock_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     audit_log_volume = option_of_yojson (value_for_key flag_of_yojson "AuditLogVolume") _list path;
     autocommit_period =
       option_of_yojson (value_for_key autocommit_period_of_yojson "AutocommitPeriod") _list path;
     privileged_delete =
       option_of_yojson (value_for_key privileged_delete_of_yojson "PrivilegedDelete") _list path;
     retention_period =
       option_of_yojson
         (value_for_key snaplock_retention_period_of_yojson "RetentionPeriod")
         _list path;
     snaplock_type =
       option_of_yojson (value_for_key snaplock_type_of_yojson "SnaplockType") _list path;
     volume_append_mode_enabled =
       option_of_yojson (value_for_key flag_of_yojson "VolumeAppendModeEnabled") _list path;
   }
    : snaplock_configuration)

let snapshot_policy_of_yojson = string_of_yojson

let ontap_volume_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "RW" -> RW
    | `String "DP" -> DP
    | `String "LS" -> LS
    | `String value -> raise (deserialize_unknown_enum_value_error path "OntapVolumeType" value)
    | _ -> raise (deserialize_wrong_type_error path "OntapVolumeType")
     : ontap_volume_type)
    : ontap_volume_type)

let uui_d_of_yojson = string_of_yojson

let tiering_policy_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "SNAPSHOT_ONLY" -> SNAPSHOT_ONLY
    | `String "AUTO" -> AUTO
    | `String "ALL" -> ALL
    | `String "NONE" -> NONE
    | `String value -> raise (deserialize_unknown_enum_value_error path "TieringPolicyName" value)
    | _ -> raise (deserialize_wrong_type_error path "TieringPolicyName")
     : tiering_policy_name)
    : tiering_policy_name)

let cooling_period_of_yojson = int_of_yojson

let tiering_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cooling_period =
       option_of_yojson (value_for_key cooling_period_of_yojson "CoolingPeriod") _list path;
     name = option_of_yojson (value_for_key tiering_policy_name_of_yojson "Name") _list path;
   }
    : tiering_policy)

let storage_virtual_machine_id_of_yojson = string_of_yojson
let volume_capacity_of_yojson = int_of_yojson

let security_style_of_yojson (tree : t) path =
  ((match tree with
    | `String "UNIX" -> UNIX
    | `String "NTFS" -> NTFS
    | `String "MIXED" -> MIXED
    | `String value -> raise (deserialize_unknown_enum_value_error path "SecurityStyle" value)
    | _ -> raise (deserialize_wrong_type_error path "SecurityStyle")
     : security_style)
    : security_style)

let junction_path_of_yojson = string_of_yojson

let flex_cache_endpoint_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "ORIGIN" -> ORIGIN
    | `String "CACHE" -> CACHE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "FlexCacheEndpointType" value)
    | _ -> raise (deserialize_wrong_type_error path "FlexCacheEndpointType")
     : flex_cache_endpoint_type)
    : flex_cache_endpoint_type)

let ontap_volume_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     flex_cache_endpoint_type =
       option_of_yojson
         (value_for_key flex_cache_endpoint_type_of_yojson "FlexCacheEndpointType")
         _list path;
     junction_path =
       option_of_yojson (value_for_key junction_path_of_yojson "JunctionPath") _list path;
     security_style =
       option_of_yojson (value_for_key security_style_of_yojson "SecurityStyle") _list path;
     size_in_megabytes =
       option_of_yojson (value_for_key volume_capacity_of_yojson "SizeInMegabytes") _list path;
     storage_efficiency_enabled =
       option_of_yojson (value_for_key flag_of_yojson "StorageEfficiencyEnabled") _list path;
     storage_virtual_machine_id =
       option_of_yojson
         (value_for_key storage_virtual_machine_id_of_yojson "StorageVirtualMachineId")
         _list path;
     storage_virtual_machine_root =
       option_of_yojson (value_for_key flag_of_yojson "StorageVirtualMachineRoot") _list path;
     tiering_policy =
       option_of_yojson (value_for_key tiering_policy_of_yojson "TieringPolicy") _list path;
     uui_d = option_of_yojson (value_for_key uui_d_of_yojson "UUID") _list path;
     ontap_volume_type =
       option_of_yojson (value_for_key ontap_volume_type_of_yojson "OntapVolumeType") _list path;
     snapshot_policy =
       option_of_yojson (value_for_key snapshot_policy_of_yojson "SnapshotPolicy") _list path;
     copy_tags_to_backups =
       option_of_yojson (value_for_key flag_of_yojson "CopyTagsToBackups") _list path;
     snaplock_configuration =
       option_of_yojson
         (value_for_key snaplock_configuration_of_yojson "SnaplockConfiguration")
         _list path;
     volume_style = option_of_yojson (value_for_key volume_style_of_yojson "VolumeStyle") _list path;
     aggregate_configuration =
       option_of_yojson
         (value_for_key aggregate_configuration_of_yojson "AggregateConfiguration")
         _list path;
     size_in_bytes =
       option_of_yojson (value_for_key volume_capacity_bytes_of_yojson "SizeInBytes") _list path;
   }
    : ontap_volume_configuration)

let volume_name_of_yojson = string_of_yojson

let volume_lifecycle_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATING" -> CREATING
    | `String "CREATED" -> CREATED
    | `String "DELETING" -> DELETING
    | `String "FAILED" -> FAILED
    | `String "MISCONFIGURED" -> MISCONFIGURED
    | `String "PENDING" -> PENDING
    | `String "AVAILABLE" -> AVAILABLE
    | `String value -> raise (deserialize_unknown_enum_value_error path "VolumeLifecycle" value)
    | _ -> raise (deserialize_wrong_type_error path "VolumeLifecycle")
     : volume_lifecycle)
    : volume_lifecycle)

let rec volume_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_time =
       option_of_yojson (value_for_key creation_time_of_yojson "CreationTime") _list path;
     file_system_id =
       option_of_yojson (value_for_key file_system_id_of_yojson "FileSystemId") _list path;
     lifecycle = option_of_yojson (value_for_key volume_lifecycle_of_yojson "Lifecycle") _list path;
     name = option_of_yojson (value_for_key volume_name_of_yojson "Name") _list path;
     ontap_configuration =
       option_of_yojson
         (value_for_key ontap_volume_configuration_of_yojson "OntapConfiguration")
         _list path;
     resource_ar_n =
       option_of_yojson (value_for_key resource_ar_n_of_yojson "ResourceARN") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     volume_id = option_of_yojson (value_for_key volume_id_of_yojson "VolumeId") _list path;
     volume_type = option_of_yojson (value_for_key volume_type_of_yojson "VolumeType") _list path;
     lifecycle_transition_reason =
       option_of_yojson
         (value_for_key lifecycle_transition_reason_of_yojson "LifecycleTransitionReason")
         _list path;
     administrative_actions =
       option_of_yojson
         (value_for_key administrative_actions_of_yojson "AdministrativeActions")
         _list path;
     open_zfs_configuration =
       option_of_yojson
         (value_for_key open_zfs_volume_configuration_of_yojson "OpenZFSConfiguration")
         _list path;
   }
    : volume)

and snapshot_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n =
       option_of_yojson (value_for_key resource_ar_n_of_yojson "ResourceARN") _list path;
     snapshot_id = option_of_yojson (value_for_key snapshot_id_of_yojson "SnapshotId") _list path;
     name = option_of_yojson (value_for_key snapshot_name_of_yojson "Name") _list path;
     volume_id = option_of_yojson (value_for_key volume_id_of_yojson "VolumeId") _list path;
     creation_time =
       option_of_yojson (value_for_key creation_time_of_yojson "CreationTime") _list path;
     lifecycle =
       option_of_yojson (value_for_key snapshot_lifecycle_of_yojson "Lifecycle") _list path;
     lifecycle_transition_reason =
       option_of_yojson
         (value_for_key lifecycle_transition_reason_of_yojson "LifecycleTransitionReason")
         _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     administrative_actions =
       option_of_yojson
         (value_for_key administrative_actions_of_yojson "AdministrativeActions")
         _list path;
   }
    : snapshot)

and file_system_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     owner_id = option_of_yojson (value_for_key aws_account_id_of_yojson "OwnerId") _list path;
     creation_time =
       option_of_yojson (value_for_key creation_time_of_yojson "CreationTime") _list path;
     file_system_id =
       option_of_yojson (value_for_key file_system_id_of_yojson "FileSystemId") _list path;
     file_system_type =
       option_of_yojson (value_for_key file_system_type_of_yojson "FileSystemType") _list path;
     lifecycle =
       option_of_yojson (value_for_key file_system_lifecycle_of_yojson "Lifecycle") _list path;
     failure_details =
       option_of_yojson
         (value_for_key file_system_failure_details_of_yojson "FailureDetails")
         _list path;
     storage_capacity =
       option_of_yojson (value_for_key storage_capacity_of_yojson "StorageCapacity") _list path;
     storage_type = option_of_yojson (value_for_key storage_type_of_yojson "StorageType") _list path;
     vpc_id = option_of_yojson (value_for_key vpc_id_of_yojson "VpcId") _list path;
     subnet_ids = option_of_yojson (value_for_key subnet_ids_of_yojson "SubnetIds") _list path;
     network_interface_ids =
       option_of_yojson
         (value_for_key network_interface_ids_of_yojson "NetworkInterfaceIds")
         _list path;
     dns_name = option_of_yojson (value_for_key dns_name_of_yojson "DNSName") _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "KmsKeyId") _list path;
     resource_ar_n =
       option_of_yojson (value_for_key resource_ar_n_of_yojson "ResourceARN") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     windows_configuration =
       option_of_yojson
         (value_for_key windows_file_system_configuration_of_yojson "WindowsConfiguration")
         _list path;
     lustre_configuration =
       option_of_yojson
         (value_for_key lustre_file_system_configuration_of_yojson "LustreConfiguration")
         _list path;
     administrative_actions =
       option_of_yojson
         (value_for_key administrative_actions_of_yojson "AdministrativeActions")
         _list path;
     ontap_configuration =
       option_of_yojson
         (value_for_key ontap_file_system_configuration_of_yojson "OntapConfiguration")
         _list path;
     file_system_type_version =
       option_of_yojson
         (value_for_key file_system_type_version_of_yojson "FileSystemTypeVersion")
         _list path;
     open_zfs_configuration =
       option_of_yojson
         (value_for_key open_zfs_file_system_configuration_of_yojson "OpenZFSConfiguration")
         _list path;
     network_type = option_of_yojson (value_for_key network_type_of_yojson "NetworkType") _list path;
   }
    : file_system)

and administrative_actions_of_yojson tree path =
  list_of_yojson administrative_action_of_yojson tree path

and administrative_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     administrative_action_type =
       option_of_yojson
         (value_for_key administrative_action_type_of_yojson "AdministrativeActionType")
         _list path;
     progress_percent =
       option_of_yojson (value_for_key progress_percent_of_yojson "ProgressPercent") _list path;
     request_time = option_of_yojson (value_for_key request_time_of_yojson "RequestTime") _list path;
     status = option_of_yojson (value_for_key status_of_yojson "Status") _list path;
     target_file_system_values =
       option_of_yojson (value_for_key file_system_of_yojson "TargetFileSystemValues") _list path;
     failure_details =
       option_of_yojson
         (value_for_key administrative_action_failure_details_of_yojson "FailureDetails")
         _list path;
     target_volume_values =
       option_of_yojson (value_for_key volume_of_yojson "TargetVolumeValues") _list path;
     target_snapshot_values =
       option_of_yojson (value_for_key snapshot_of_yojson "TargetSnapshotValues") _list path;
     total_transfer_bytes =
       option_of_yojson
         (value_for_key total_transfer_bytes_of_yojson "TotalTransferBytes")
         _list path;
     remaining_transfer_bytes =
       option_of_yojson
         (value_for_key remaining_transfer_bytes_of_yojson "RemainingTransferBytes")
         _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
   }
    : administrative_action)

let update_volume_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ volume = option_of_yojson (value_for_key volume_of_yojson "Volume") _list path }
    : update_volume_response)

let integer_no_max_from_negative_one_of_yojson = int_of_yojson

let update_open_zfs_volume_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     storage_capacity_reservation_gi_b =
       option_of_yojson
         (value_for_key integer_no_max_from_negative_one_of_yojson "StorageCapacityReservationGiB")
         _list path;
     storage_capacity_quota_gi_b =
       option_of_yojson
         (value_for_key integer_no_max_from_negative_one_of_yojson "StorageCapacityQuotaGiB")
         _list path;
     record_size_ki_b =
       option_of_yojson
         (value_for_key integer_record_size_ki_b_of_yojson "RecordSizeKiB")
         _list path;
     data_compression_type =
       option_of_yojson
         (value_for_key open_zfs_data_compression_type_of_yojson "DataCompressionType")
         _list path;
     nfs_exports =
       option_of_yojson (value_for_key open_zfs_nfs_exports_of_yojson "NfsExports") _list path;
     user_and_group_quotas =
       option_of_yojson
         (value_for_key open_zfs_user_and_group_quotas_of_yojson "UserAndGroupQuotas")
         _list path;
     read_only = option_of_yojson (value_for_key read_only_of_yojson "ReadOnly") _list path;
   }
    : update_open_zfs_volume_configuration)

let update_snaplock_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     audit_log_volume = option_of_yojson (value_for_key flag_of_yojson "AuditLogVolume") _list path;
     autocommit_period =
       option_of_yojson (value_for_key autocommit_period_of_yojson "AutocommitPeriod") _list path;
     privileged_delete =
       option_of_yojson (value_for_key privileged_delete_of_yojson "PrivilegedDelete") _list path;
     retention_period =
       option_of_yojson
         (value_for_key snaplock_retention_period_of_yojson "RetentionPeriod")
         _list path;
     volume_append_mode_enabled =
       option_of_yojson (value_for_key flag_of_yojson "VolumeAppendModeEnabled") _list path;
   }
    : update_snaplock_configuration)

let update_ontap_volume_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     junction_path =
       option_of_yojson (value_for_key junction_path_of_yojson "JunctionPath") _list path;
     security_style =
       option_of_yojson (value_for_key security_style_of_yojson "SecurityStyle") _list path;
     size_in_megabytes =
       option_of_yojson (value_for_key volume_capacity_of_yojson "SizeInMegabytes") _list path;
     storage_efficiency_enabled =
       option_of_yojson (value_for_key flag_of_yojson "StorageEfficiencyEnabled") _list path;
     tiering_policy =
       option_of_yojson (value_for_key tiering_policy_of_yojson "TieringPolicy") _list path;
     snapshot_policy =
       option_of_yojson (value_for_key snapshot_policy_of_yojson "SnapshotPolicy") _list path;
     copy_tags_to_backups =
       option_of_yojson (value_for_key flag_of_yojson "CopyTagsToBackups") _list path;
     snaplock_configuration =
       option_of_yojson
         (value_for_key update_snaplock_configuration_of_yojson "SnaplockConfiguration")
         _list path;
     size_in_bytes =
       option_of_yojson (value_for_key volume_capacity_bytes_of_yojson "SizeInBytes") _list path;
   }
    : update_ontap_volume_configuration)

let client_request_token_of_yojson = string_of_yojson

let update_volume_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     volume_id = value_for_key volume_id_of_yojson "VolumeId" _list path;
     ontap_configuration =
       option_of_yojson
         (value_for_key update_ontap_volume_configuration_of_yojson "OntapConfiguration")
         _list path;
     name = option_of_yojson (value_for_key volume_name_of_yojson "Name") _list path;
     open_zfs_configuration =
       option_of_yojson
         (value_for_key update_open_zfs_volume_configuration_of_yojson "OpenZFSConfiguration")
         _list path;
   }
    : update_volume_request)

let unsupported_operation_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : unsupported_operation)

let storage_virtual_machine_not_found_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : storage_virtual_machine_not_found)

let storage_virtual_machine_root_volume_security_style_of_yojson (tree : t) path =
  ((match tree with
    | `String "UNIX" -> UNIX
    | `String "NTFS" -> NTFS
    | `String "MIXED" -> MIXED
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "StorageVirtualMachineRootVolumeSecurityStyle"
             value)
    | _ -> raise (deserialize_wrong_type_error path "StorageVirtualMachineRootVolumeSecurityStyle")
     : storage_virtual_machine_root_volume_security_style)
    : storage_virtual_machine_root_volume_security_style)

let storage_virtual_machine_subtype_of_yojson (tree : t) path =
  ((match tree with
    | `String "DEFAULT" -> DEFAULT
    | `String "DP_DESTINATION" -> DP_DESTINATION
    | `String "SYNC_DESTINATION" -> SYNC_DESTINATION
    | `String "SYNC_SOURCE" -> SYNC_SOURCE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "StorageVirtualMachineSubtype" value)
    | _ -> raise (deserialize_wrong_type_error path "StorageVirtualMachineSubtype")
     : storage_virtual_machine_subtype)
    : storage_virtual_machine_subtype)

let storage_virtual_machine_name_of_yojson = string_of_yojson

let storage_virtual_machine_lifecycle_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATED" -> CREATED
    | `String "CREATING" -> CREATING
    | `String "DELETING" -> DELETING
    | `String "FAILED" -> FAILED
    | `String "MISCONFIGURED" -> MISCONFIGURED
    | `String "PENDING" -> PENDING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "StorageVirtualMachineLifecycle" value)
    | _ -> raise (deserialize_wrong_type_error path "StorageVirtualMachineLifecycle")
     : storage_virtual_machine_lifecycle)
    : storage_virtual_machine_lifecycle)

let svm_endpoint_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     dns_name = option_of_yojson (value_for_key dns_name_of_yojson "DNSName") _list path;
     ip_addresses =
       option_of_yojson
         (value_for_key ontap_endpoint_ip_addresses_of_yojson "IpAddresses")
         _list path;
     ipv6_addresses =
       option_of_yojson
         (value_for_key ontap_endpoint_ip_addresses_of_yojson "Ipv6Addresses")
         _list path;
   }
    : svm_endpoint)

let svm_endpoints_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     iscsi = option_of_yojson (value_for_key svm_endpoint_of_yojson "Iscsi") _list path;
     management = option_of_yojson (value_for_key svm_endpoint_of_yojson "Management") _list path;
     nfs = option_of_yojson (value_for_key svm_endpoint_of_yojson "Nfs") _list path;
     smb = option_of_yojson (value_for_key svm_endpoint_of_yojson "Smb") _list path;
   }
    : svm_endpoints)

let net_bios_alias_of_yojson = string_of_yojson

let svm_active_directory_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     net_bios_name =
       option_of_yojson (value_for_key net_bios_alias_of_yojson "NetBiosName") _list path;
     self_managed_active_directory_configuration =
       option_of_yojson
         (value_for_key self_managed_active_directory_attributes_of_yojson
            "SelfManagedActiveDirectoryConfiguration")
         _list path;
   }
    : svm_active_directory_configuration)

let storage_virtual_machine_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     active_directory_configuration =
       option_of_yojson
         (value_for_key svm_active_directory_configuration_of_yojson "ActiveDirectoryConfiguration")
         _list path;
     creation_time =
       option_of_yojson (value_for_key creation_time_of_yojson "CreationTime") _list path;
     endpoints = option_of_yojson (value_for_key svm_endpoints_of_yojson "Endpoints") _list path;
     file_system_id =
       option_of_yojson (value_for_key file_system_id_of_yojson "FileSystemId") _list path;
     lifecycle =
       option_of_yojson
         (value_for_key storage_virtual_machine_lifecycle_of_yojson "Lifecycle")
         _list path;
     name =
       option_of_yojson (value_for_key storage_virtual_machine_name_of_yojson "Name") _list path;
     resource_ar_n =
       option_of_yojson (value_for_key resource_ar_n_of_yojson "ResourceARN") _list path;
     storage_virtual_machine_id =
       option_of_yojson
         (value_for_key storage_virtual_machine_id_of_yojson "StorageVirtualMachineId")
         _list path;
     subtype =
       option_of_yojson
         (value_for_key storage_virtual_machine_subtype_of_yojson "Subtype")
         _list path;
     uui_d = option_of_yojson (value_for_key uui_d_of_yojson "UUID") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     lifecycle_transition_reason =
       option_of_yojson
         (value_for_key lifecycle_transition_reason_of_yojson "LifecycleTransitionReason")
         _list path;
     root_volume_security_style =
       option_of_yojson
         (value_for_key storage_virtual_machine_root_volume_security_style_of_yojson
            "RootVolumeSecurityStyle")
         _list path;
   }
    : storage_virtual_machine)

let update_storage_virtual_machine_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     storage_virtual_machine =
       option_of_yojson
         (value_for_key storage_virtual_machine_of_yojson "StorageVirtualMachine")
         _list path;
   }
    : update_storage_virtual_machine_response)

let directory_password_of_yojson = string_of_yojson

let self_managed_active_directory_configuration_updates_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_name =
       option_of_yojson (value_for_key directory_user_name_of_yojson "UserName") _list path;
     password = option_of_yojson (value_for_key directory_password_of_yojson "Password") _list path;
     dns_ips = option_of_yojson (value_for_key dns_ips_of_yojson "DnsIps") _list path;
     domain_name =
       option_of_yojson
         (value_for_key active_directory_fully_qualified_name_of_yojson "DomainName")
         _list path;
     organizational_unit_distinguished_name =
       option_of_yojson
         (value_for_key organizational_unit_distinguished_name_of_yojson
            "OrganizationalUnitDistinguishedName")
         _list path;
     file_system_administrators_group =
       option_of_yojson
         (value_for_key file_system_administrators_group_name_of_yojson
            "FileSystemAdministratorsGroup")
         _list path;
     domain_join_service_account_secret =
       option_of_yojson
         (value_for_key customer_secrets_manager_ar_n_of_yojson "DomainJoinServiceAccountSecret")
         _list path;
   }
    : self_managed_active_directory_configuration_updates)

let update_svm_active_directory_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     self_managed_active_directory_configuration =
       option_of_yojson
         (value_for_key self_managed_active_directory_configuration_updates_of_yojson
            "SelfManagedActiveDirectoryConfiguration")
         _list path;
     net_bios_name =
       option_of_yojson (value_for_key net_bios_alias_of_yojson "NetBiosName") _list path;
   }
    : update_svm_active_directory_configuration)

let update_storage_virtual_machine_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     active_directory_configuration =
       option_of_yojson
         (value_for_key update_svm_active_directory_configuration_of_yojson
            "ActiveDirectoryConfiguration")
         _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     storage_virtual_machine_id =
       value_for_key storage_virtual_machine_id_of_yojson "StorageVirtualMachineId" _list path;
     svm_admin_password =
       option_of_yojson (value_for_key admin_password_of_yojson "SvmAdminPassword") _list path;
   }
    : update_storage_virtual_machine_request)

let snapshot_not_found_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : snapshot_not_found)

let update_snapshot_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ snapshot = option_of_yojson (value_for_key snapshot_of_yojson "Snapshot") _list path }
    : update_snapshot_response)

let update_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     name = value_for_key snapshot_name_of_yojson "Name" _list path;
     snapshot_id = value_for_key snapshot_id_of_yojson "SnapshotId" _list path;
   }
    : update_snapshot_request)

let verbose_flag_of_yojson = string_of_yojson

let update_shared_vpc_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enable_fsx_route_table_updates_from_participant_accounts =
       option_of_yojson
         (value_for_key verbose_flag_of_yojson "EnableFsxRouteTableUpdatesFromParticipantAccounts")
         _list path;
   }
    : update_shared_vpc_configuration_response)

let update_shared_vpc_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enable_fsx_route_table_updates_from_participant_accounts =
       option_of_yojson
         (value_for_key verbose_flag_of_yojson "EnableFsxRouteTableUpdatesFromParticipantAccounts")
         _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
   }
    : update_shared_vpc_configuration_request)

let service_limit_of_yojson (tree : t) path =
  ((match tree with
    | `String "FILE_SYSTEM_COUNT" -> FILE_SYSTEM_COUNT
    | `String "TOTAL_THROUGHPUT_CAPACITY" -> TOTAL_THROUGHPUT_CAPACITY
    | `String "TOTAL_STORAGE" -> TOTAL_STORAGE
    | `String "TOTAL_USER_INITIATED_BACKUPS" -> TOTAL_USER_INITIATED_BACKUPS
    | `String "TOTAL_USER_TAGS" -> TOTAL_USER_TAGS
    | `String "TOTAL_IN_PROGRESS_COPY_BACKUPS" -> TOTAL_IN_PROGRESS_COPY_BACKUPS
    | `String "STORAGE_VIRTUAL_MACHINES_PER_FILE_SYSTEM" -> STORAGE_VIRTUAL_MACHINES_PER_FILE_SYSTEM
    | `String "VOLUMES_PER_FILE_SYSTEM" -> VOLUMES_PER_FILE_SYSTEM
    | `String "TOTAL_SSD_IOPS" -> TOTAL_SSD_IOPS
    | `String "FILE_CACHE_COUNT" -> FILE_CACHE_COUNT
    | `String value -> raise (deserialize_unknown_enum_value_error path "ServiceLimit" value)
    | _ -> raise (deserialize_wrong_type_error path "ServiceLimit")
     : service_limit)
    : service_limit)

let service_limit_exceeded_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = value_for_key service_limit_of_yojson "Limit" _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
   }
    : service_limit_exceeded)

let missing_file_system_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : missing_file_system_configuration)

let security_group_id_of_yojson = string_of_yojson

let invalid_network_settings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
     invalid_subnet_id =
       option_of_yojson (value_for_key subnet_id_of_yojson "InvalidSubnetId") _list path;
     invalid_security_group_id =
       option_of_yojson
         (value_for_key security_group_id_of_yojson "InvalidSecurityGroupId")
         _list path;
     invalid_route_table_id =
       option_of_yojson (value_for_key route_table_id_of_yojson "InvalidRouteTableId") _list path;
   }
    : invalid_network_settings)

let file_system_not_found_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : file_system_not_found)

let update_file_system_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ file_system = option_of_yojson (value_for_key file_system_of_yojson "FileSystem") _list path }
    : update_file_system_response)

let update_file_system_open_zfs_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     automatic_backup_retention_days =
       option_of_yojson
         (value_for_key automatic_backup_retention_days_of_yojson "AutomaticBackupRetentionDays")
         _list path;
     copy_tags_to_backups =
       option_of_yojson (value_for_key flag_of_yojson "CopyTagsToBackups") _list path;
     copy_tags_to_volumes =
       option_of_yojson (value_for_key flag_of_yojson "CopyTagsToVolumes") _list path;
     daily_automatic_backup_start_time =
       option_of_yojson
         (value_for_key daily_time_of_yojson "DailyAutomaticBackupStartTime")
         _list path;
     throughput_capacity =
       option_of_yojson
         (value_for_key megabytes_per_second_of_yojson "ThroughputCapacity")
         _list path;
     weekly_maintenance_start_time =
       option_of_yojson
         (value_for_key weekly_time_of_yojson "WeeklyMaintenanceStartTime")
         _list path;
     disk_iops_configuration =
       option_of_yojson
         (value_for_key disk_iops_configuration_of_yojson "DiskIopsConfiguration")
         _list path;
     add_route_table_ids =
       option_of_yojson (value_for_key route_table_ids_of_yojson "AddRouteTableIds") _list path;
     remove_route_table_ids =
       option_of_yojson (value_for_key route_table_ids_of_yojson "RemoveRouteTableIds") _list path;
     read_cache_configuration =
       option_of_yojson
         (value_for_key open_zfs_read_cache_configuration_of_yojson "ReadCacheConfiguration")
         _list path;
     endpoint_ipv6_address_range =
       option_of_yojson
         (value_for_key ipv6_address_range_of_yojson "EndpointIpv6AddressRange")
         _list path;
   }
    : update_file_system_open_zfs_configuration)

let update_file_system_ontap_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     automatic_backup_retention_days =
       option_of_yojson
         (value_for_key automatic_backup_retention_days_of_yojson "AutomaticBackupRetentionDays")
         _list path;
     daily_automatic_backup_start_time =
       option_of_yojson
         (value_for_key daily_time_of_yojson "DailyAutomaticBackupStartTime")
         _list path;
     fsx_admin_password =
       option_of_yojson (value_for_key admin_password_of_yojson "FsxAdminPassword") _list path;
     weekly_maintenance_start_time =
       option_of_yojson
         (value_for_key weekly_time_of_yojson "WeeklyMaintenanceStartTime")
         _list path;
     disk_iops_configuration =
       option_of_yojson
         (value_for_key disk_iops_configuration_of_yojson "DiskIopsConfiguration")
         _list path;
     throughput_capacity =
       option_of_yojson
         (value_for_key megabytes_per_second_of_yojson "ThroughputCapacity")
         _list path;
     add_route_table_ids =
       option_of_yojson (value_for_key route_table_ids_of_yojson "AddRouteTableIds") _list path;
     remove_route_table_ids =
       option_of_yojson (value_for_key route_table_ids_of_yojson "RemoveRouteTableIds") _list path;
     throughput_capacity_per_ha_pair =
       option_of_yojson
         (value_for_key throughput_capacity_per_ha_pair_of_yojson "ThroughputCapacityPerHAPair")
         _list path;
     ha_pairs = option_of_yojson (value_for_key ha_pairs_of_yojson "HAPairs") _list path;
     endpoint_ipv6_address_range =
       option_of_yojson
         (value_for_key ipv6_address_range_of_yojson "EndpointIpv6AddressRange")
         _list path;
   }
    : update_file_system_ontap_configuration)

let update_file_system_lustre_metadata_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     iops = option_of_yojson (value_for_key metadata_iops_of_yojson "Iops") _list path;
     mode = option_of_yojson (value_for_key metadata_configuration_mode_of_yojson "Mode") _list path;
   }
    : update_file_system_lustre_metadata_configuration)

let lustre_log_create_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     level = value_for_key lustre_access_audit_log_level_of_yojson "Level" _list path;
     destination = option_of_yojson (value_for_key general_ar_n_of_yojson "Destination") _list path;
   }
    : lustre_log_create_configuration)

let update_file_system_lustre_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     weekly_maintenance_start_time =
       option_of_yojson
         (value_for_key weekly_time_of_yojson "WeeklyMaintenanceStartTime")
         _list path;
     daily_automatic_backup_start_time =
       option_of_yojson
         (value_for_key daily_time_of_yojson "DailyAutomaticBackupStartTime")
         _list path;
     automatic_backup_retention_days =
       option_of_yojson
         (value_for_key automatic_backup_retention_days_of_yojson "AutomaticBackupRetentionDays")
         _list path;
     auto_import_policy =
       option_of_yojson
         (value_for_key auto_import_policy_type_of_yojson "AutoImportPolicy")
         _list path;
     data_compression_type =
       option_of_yojson
         (value_for_key data_compression_type_of_yojson "DataCompressionType")
         _list path;
     log_configuration =
       option_of_yojson
         (value_for_key lustre_log_create_configuration_of_yojson "LogConfiguration")
         _list path;
     root_squash_configuration =
       option_of_yojson
         (value_for_key lustre_root_squash_configuration_of_yojson "RootSquashConfiguration")
         _list path;
     per_unit_storage_throughput =
       option_of_yojson
         (value_for_key per_unit_storage_throughput_of_yojson "PerUnitStorageThroughput")
         _list path;
     metadata_configuration =
       option_of_yojson
         (value_for_key update_file_system_lustre_metadata_configuration_of_yojson
            "MetadataConfiguration")
         _list path;
     throughput_capacity =
       option_of_yojson
         (value_for_key throughput_capacity_mbps_of_yojson "ThroughputCapacity")
         _list path;
     data_read_cache_configuration =
       option_of_yojson
         (value_for_key lustre_read_cache_configuration_of_yojson "DataReadCacheConfiguration")
         _list path;
   }
    : update_file_system_lustre_configuration)

let windows_audit_log_create_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_access_audit_log_level =
       value_for_key windows_access_audit_log_level_of_yojson "FileAccessAuditLogLevel" _list path;
     file_share_access_audit_log_level =
       value_for_key windows_access_audit_log_level_of_yojson "FileShareAccessAuditLogLevel" _list
         path;
     audit_log_destination =
       option_of_yojson (value_for_key general_ar_n_of_yojson "AuditLogDestination") _list path;
   }
    : windows_audit_log_create_configuration)

let update_file_system_windows_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     weekly_maintenance_start_time =
       option_of_yojson
         (value_for_key weekly_time_of_yojson "WeeklyMaintenanceStartTime")
         _list path;
     daily_automatic_backup_start_time =
       option_of_yojson
         (value_for_key daily_time_of_yojson "DailyAutomaticBackupStartTime")
         _list path;
     automatic_backup_retention_days =
       option_of_yojson
         (value_for_key automatic_backup_retention_days_of_yojson "AutomaticBackupRetentionDays")
         _list path;
     throughput_capacity =
       option_of_yojson
         (value_for_key megabytes_per_second_of_yojson "ThroughputCapacity")
         _list path;
     self_managed_active_directory_configuration =
       option_of_yojson
         (value_for_key self_managed_active_directory_configuration_updates_of_yojson
            "SelfManagedActiveDirectoryConfiguration")
         _list path;
     audit_log_configuration =
       option_of_yojson
         (value_for_key windows_audit_log_create_configuration_of_yojson "AuditLogConfiguration")
         _list path;
     disk_iops_configuration =
       option_of_yojson
         (value_for_key disk_iops_configuration_of_yojson "DiskIopsConfiguration")
         _list path;
     fsrm_configuration =
       option_of_yojson
         (value_for_key windows_fsrm_configuration_of_yojson "FsrmConfiguration")
         _list path;
   }
    : update_file_system_windows_configuration)

let update_file_system_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_system_id = value_for_key file_system_id_of_yojson "FileSystemId" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     storage_capacity =
       option_of_yojson (value_for_key storage_capacity_of_yojson "StorageCapacity") _list path;
     windows_configuration =
       option_of_yojson
         (value_for_key update_file_system_windows_configuration_of_yojson "WindowsConfiguration")
         _list path;
     lustre_configuration =
       option_of_yojson
         (value_for_key update_file_system_lustre_configuration_of_yojson "LustreConfiguration")
         _list path;
     ontap_configuration =
       option_of_yojson
         (value_for_key update_file_system_ontap_configuration_of_yojson "OntapConfiguration")
         _list path;
     open_zfs_configuration =
       option_of_yojson
         (value_for_key update_file_system_open_zfs_configuration_of_yojson "OpenZFSConfiguration")
         _list path;
     storage_type = option_of_yojson (value_for_key storage_type_of_yojson "StorageType") _list path;
     file_system_type_version =
       option_of_yojson
         (value_for_key file_system_type_version_of_yojson "FileSystemTypeVersion")
         _list path;
     network_type = option_of_yojson (value_for_key network_type_of_yojson "NetworkType") _list path;
   }
    : update_file_system_request)

let missing_file_cache_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : missing_file_cache_configuration)

let file_cache_not_found_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : file_cache_not_found)

let data_repository_association_id_of_yojson = string_of_yojson

let data_repository_association_ids_of_yojson tree path =
  list_of_yojson data_repository_association_id_of_yojson tree path

let metadata_storage_capacity_of_yojson = int_of_yojson

let file_cache_lustre_metadata_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     storage_capacity =
       value_for_key metadata_storage_capacity_of_yojson "StorageCapacity" _list path;
   }
    : file_cache_lustre_metadata_configuration)

let file_cache_lustre_deployment_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CACHE_1" -> CACHE_1
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "FileCacheLustreDeploymentType" value)
    | _ -> raise (deserialize_wrong_type_error path "FileCacheLustreDeploymentType")
     : file_cache_lustre_deployment_type)
    : file_cache_lustre_deployment_type)

let file_cache_lustre_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     per_unit_storage_throughput =
       option_of_yojson
         (value_for_key per_unit_storage_throughput_of_yojson "PerUnitStorageThroughput")
         _list path;
     deployment_type =
       option_of_yojson
         (value_for_key file_cache_lustre_deployment_type_of_yojson "DeploymentType")
         _list path;
     mount_name =
       option_of_yojson
         (value_for_key lustre_file_system_mount_name_of_yojson "MountName")
         _list path;
     weekly_maintenance_start_time =
       option_of_yojson
         (value_for_key weekly_time_of_yojson "WeeklyMaintenanceStartTime")
         _list path;
     metadata_configuration =
       option_of_yojson
         (value_for_key file_cache_lustre_metadata_configuration_of_yojson "MetadataConfiguration")
         _list path;
     log_configuration =
       option_of_yojson
         (value_for_key lustre_log_configuration_of_yojson "LogConfiguration")
         _list path;
   }
    : file_cache_lustre_configuration)

let file_cache_failure_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : file_cache_failure_details)

let file_cache_lifecycle_of_yojson (tree : t) path =
  ((match tree with
    | `String "AVAILABLE" -> AVAILABLE
    | `String "CREATING" -> CREATING
    | `String "DELETING" -> DELETING
    | `String "UPDATING" -> UPDATING
    | `String "FAILED" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "FileCacheLifecycle" value)
    | _ -> raise (deserialize_wrong_type_error path "FileCacheLifecycle")
     : file_cache_lifecycle)
    : file_cache_lifecycle)

let file_cache_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "LUSTRE" -> LUSTRE
    | `String value -> raise (deserialize_unknown_enum_value_error path "FileCacheType" value)
    | _ -> raise (deserialize_wrong_type_error path "FileCacheType")
     : file_cache_type)
    : file_cache_type)

let file_cache_id_of_yojson = string_of_yojson

let file_cache_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     owner_id = option_of_yojson (value_for_key aws_account_id_of_yojson "OwnerId") _list path;
     creation_time =
       option_of_yojson (value_for_key creation_time_of_yojson "CreationTime") _list path;
     file_cache_id =
       option_of_yojson (value_for_key file_cache_id_of_yojson "FileCacheId") _list path;
     file_cache_type =
       option_of_yojson (value_for_key file_cache_type_of_yojson "FileCacheType") _list path;
     file_cache_type_version =
       option_of_yojson
         (value_for_key file_system_type_version_of_yojson "FileCacheTypeVersion")
         _list path;
     lifecycle =
       option_of_yojson (value_for_key file_cache_lifecycle_of_yojson "Lifecycle") _list path;
     failure_details =
       option_of_yojson
         (value_for_key file_cache_failure_details_of_yojson "FailureDetails")
         _list path;
     storage_capacity =
       option_of_yojson (value_for_key storage_capacity_of_yojson "StorageCapacity") _list path;
     vpc_id = option_of_yojson (value_for_key vpc_id_of_yojson "VpcId") _list path;
     subnet_ids = option_of_yojson (value_for_key subnet_ids_of_yojson "SubnetIds") _list path;
     network_interface_ids =
       option_of_yojson
         (value_for_key network_interface_ids_of_yojson "NetworkInterfaceIds")
         _list path;
     dns_name = option_of_yojson (value_for_key dns_name_of_yojson "DNSName") _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "KmsKeyId") _list path;
     resource_ar_n =
       option_of_yojson (value_for_key resource_ar_n_of_yojson "ResourceARN") _list path;
     lustre_configuration =
       option_of_yojson
         (value_for_key file_cache_lustre_configuration_of_yojson "LustreConfiguration")
         _list path;
     data_repository_association_ids =
       option_of_yojson
         (value_for_key data_repository_association_ids_of_yojson "DataRepositoryAssociationIds")
         _list path;
   }
    : file_cache)

let update_file_cache_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ file_cache = option_of_yojson (value_for_key file_cache_of_yojson "FileCache") _list path }
    : update_file_cache_response)

let update_file_cache_lustre_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     weekly_maintenance_start_time =
       option_of_yojson
         (value_for_key weekly_time_of_yojson "WeeklyMaintenanceStartTime")
         _list path;
   }
    : update_file_cache_lustre_configuration)

let update_file_cache_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_cache_id = value_for_key file_cache_id_of_yojson "FileCacheId" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     lustre_configuration =
       option_of_yojson
         (value_for_key update_file_cache_lustre_configuration_of_yojson "LustreConfiguration")
         _list path;
   }
    : update_file_cache_request)

let data_repository_association_not_found_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : data_repository_association_not_found)

let event_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "NEW" -> NEW
    | `String "CHANGED" -> CHANGED
    | `String "DELETED" -> DELETED
    | `String value -> raise (deserialize_unknown_enum_value_error path "EventType" value)
    | _ -> raise (deserialize_wrong_type_error path "EventType")
     : event_type)
    : event_type)

let event_types_of_yojson tree path = list_of_yojson event_type_of_yojson tree path

let auto_export_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ events = option_of_yojson (value_for_key event_types_of_yojson "Events") _list path }
    : auto_export_policy)

let repository_dns_ips_of_yojson tree path = list_of_yojson ip_address_of_yojson tree path

let nfs_version_of_yojson (tree : t) path =
  ((match tree with
    | `String "NFS3" -> NFS3
    | `String value -> raise (deserialize_unknown_enum_value_error path "NfsVersion" value)
    | _ -> raise (deserialize_wrong_type_error path "NfsVersion")
     : nfs_version)
    : nfs_version)

let nfs_data_repository_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     version = value_for_key nfs_version_of_yojson "Version" _list path;
     dns_ips = option_of_yojson (value_for_key repository_dns_ips_of_yojson "DnsIps") _list path;
     auto_export_policy =
       option_of_yojson (value_for_key auto_export_policy_of_yojson "AutoExportPolicy") _list path;
   }
    : nfs_data_repository_configuration)

let namespace_of_yojson = string_of_yojson
let sub_directories_paths_of_yojson tree path = list_of_yojson namespace_of_yojson tree path

let auto_import_policy_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ events = option_of_yojson (value_for_key event_types_of_yojson "Events") _list path }
    : auto_import_policy)

let s3_data_repository_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     auto_import_policy =
       option_of_yojson (value_for_key auto_import_policy_of_yojson "AutoImportPolicy") _list path;
     auto_export_policy =
       option_of_yojson (value_for_key auto_export_policy_of_yojson "AutoExportPolicy") _list path;
   }
    : s3_data_repository_configuration)

let batch_import_meta_data_on_create_of_yojson = bool_of_yojson

let data_repository_association_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     association_id =
       option_of_yojson
         (value_for_key data_repository_association_id_of_yojson "AssociationId")
         _list path;
     resource_ar_n =
       option_of_yojson (value_for_key resource_ar_n_of_yojson "ResourceARN") _list path;
     file_system_id =
       option_of_yojson (value_for_key file_system_id_of_yojson "FileSystemId") _list path;
     lifecycle =
       option_of_yojson (value_for_key data_repository_lifecycle_of_yojson "Lifecycle") _list path;
     failure_details =
       option_of_yojson
         (value_for_key data_repository_failure_details_of_yojson "FailureDetails")
         _list path;
     file_system_path =
       option_of_yojson (value_for_key namespace_of_yojson "FileSystemPath") _list path;
     data_repository_path =
       option_of_yojson (value_for_key archive_path_of_yojson "DataRepositoryPath") _list path;
     batch_import_meta_data_on_create =
       option_of_yojson
         (value_for_key batch_import_meta_data_on_create_of_yojson "BatchImportMetaDataOnCreate")
         _list path;
     imported_file_chunk_size =
       option_of_yojson (value_for_key megabytes_of_yojson "ImportedFileChunkSize") _list path;
     s3 =
       option_of_yojson (value_for_key s3_data_repository_configuration_of_yojson "S3") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     creation_time =
       option_of_yojson (value_for_key creation_time_of_yojson "CreationTime") _list path;
     file_cache_id =
       option_of_yojson (value_for_key file_cache_id_of_yojson "FileCacheId") _list path;
     file_cache_path =
       option_of_yojson (value_for_key namespace_of_yojson "FileCachePath") _list path;
     data_repository_subdirectories =
       option_of_yojson
         (value_for_key sub_directories_paths_of_yojson "DataRepositorySubdirectories")
         _list path;
     nf_s =
       option_of_yojson (value_for_key nfs_data_repository_configuration_of_yojson "NFS") _list path;
   }
    : data_repository_association)

let update_data_repository_association_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     association =
       option_of_yojson
         (value_for_key data_repository_association_of_yojson "Association")
         _list path;
   }
    : update_data_repository_association_response)

let update_data_repository_association_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     association_id =
       value_for_key data_repository_association_id_of_yojson "AssociationId" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     imported_file_chunk_size =
       option_of_yojson (value_for_key megabytes_of_yojson "ImportedFileChunkSize") _list path;
     s3 =
       option_of_yojson (value_for_key s3_data_repository_configuration_of_yojson "S3") _list path;
   }
    : update_data_repository_association_request)

let resource_not_found_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n = value_for_key resource_ar_n_of_yojson "ResourceARN" _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
   }
    : resource_not_found)

let resource_does_not_support_tagging_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n = value_for_key resource_ar_n_of_yojson "ResourceARN" _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
   }
    : resource_does_not_support_tagging)

let not_service_resource_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n = value_for_key resource_ar_n_of_yojson "ResourceARN" _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
   }
    : not_service_resource_error)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_keys_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n = value_for_key resource_ar_n_of_yojson "ResourceARN" _list path;
     tag_keys = value_for_key tag_keys_of_yojson "TagKeys" _list path;
   }
    : untag_resource_request)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n = value_for_key resource_ar_n_of_yojson "ResourceARN" _list path;
     tags = value_for_key tags_of_yojson "Tags" _list path;
   }
    : tag_resource_request)

let start_misconfigured_state_recovery_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ file_system = option_of_yojson (value_for_key file_system_of_yojson "FileSystem") _list path }
    : start_misconfigured_state_recovery_response)

let start_misconfigured_state_recovery_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     file_system_id = value_for_key file_system_id_of_yojson "FileSystemId" _list path;
   }
    : start_misconfigured_state_recovery_request)

let restore_volume_from_snapshot_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     volume_id = option_of_yojson (value_for_key volume_id_of_yojson "VolumeId") _list path;
     lifecycle = option_of_yojson (value_for_key volume_lifecycle_of_yojson "Lifecycle") _list path;
     administrative_actions =
       option_of_yojson
         (value_for_key administrative_actions_of_yojson "AdministrativeActions")
         _list path;
   }
    : restore_volume_from_snapshot_response)

let restore_open_zfs_volume_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "DELETE_INTERMEDIATE_SNAPSHOTS" -> DELETE_INTERMEDIATE_SNAPSHOTS
    | `String "DELETE_CLONED_VOLUMES" -> DELETE_CLONED_VOLUMES
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RestoreOpenZFSVolumeOption" value)
    | _ -> raise (deserialize_wrong_type_error path "RestoreOpenZFSVolumeOption")
     : restore_open_zfs_volume_option)
    : restore_open_zfs_volume_option)

let restore_open_zfs_volume_options_of_yojson tree path =
  list_of_yojson restore_open_zfs_volume_option_of_yojson tree path

let restore_volume_from_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     volume_id = value_for_key volume_id_of_yojson "VolumeId" _list path;
     snapshot_id = value_for_key snapshot_id_of_yojson "SnapshotId" _list path;
     options =
       option_of_yojson
         (value_for_key restore_open_zfs_volume_options_of_yojson "Options")
         _list path;
   }
    : restore_volume_from_snapshot_request)

let release_file_system_nfs_v3_locks_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ file_system = option_of_yojson (value_for_key file_system_of_yojson "FileSystem") _list path }
    : release_file_system_nfs_v3_locks_response)

let release_file_system_nfs_v3_locks_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_system_id = value_for_key file_system_id_of_yojson "FileSystemId" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
   }
    : release_file_system_nfs_v3_locks_request)

let next_token_of_yojson = string_of_yojson

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_tags_for_resource_response)

let max_results_of_yojson = int_of_yojson

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n = value_for_key resource_ar_n_of_yojson "ResourceARN" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : list_tags_for_resource_request)

let disassociate_file_system_aliases_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ aliases = option_of_yojson (value_for_key aliases_of_yojson "Aliases") _list path }
    : disassociate_file_system_aliases_response)

let alternate_dns_names_of_yojson tree path = list_of_yojson alternate_dns_name_of_yojson tree path

let disassociate_file_system_aliases_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     file_system_id = value_for_key file_system_id_of_yojson "FileSystemId" _list path;
     aliases = value_for_key alternate_dns_names_of_yojson "Aliases" _list path;
   }
    : disassociate_file_system_aliases_request)

let s3_access_point_attachment_not_found_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : s3_access_point_attachment_not_found)

let s3_access_point_attachment_name_of_yojson = string_of_yojson

let s3_access_point_attachment_lifecycle_of_yojson (tree : t) path =
  ((match tree with
    | `String "AVAILABLE" -> AVAILABLE
    | `String "CREATING" -> CREATING
    | `String "DELETING" -> DELETING
    | `String "UPDATING" -> UPDATING
    | `String "FAILED" -> FAILED
    | `String "MISCONFIGURED" -> MISCONFIGURED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "S3AccessPointAttachmentLifecycle" value)
    | _ -> raise (deserialize_wrong_type_error path "S3AccessPointAttachmentLifecycle")
     : s3_access_point_attachment_lifecycle)
    : s3_access_point_attachment_lifecycle)

let detach_and_delete_s3_access_point_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lifecycle =
       option_of_yojson
         (value_for_key s3_access_point_attachment_lifecycle_of_yojson "Lifecycle")
         _list path;
     name =
       option_of_yojson (value_for_key s3_access_point_attachment_name_of_yojson "Name") _list path;
   }
    : detach_and_delete_s3_access_point_response)

let detach_and_delete_s3_access_point_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     name = value_for_key s3_access_point_attachment_name_of_yojson "Name" _list path;
   }
    : detach_and_delete_s3_access_point_request)

let volumes_of_yojson tree path = list_of_yojson volume_of_yojson tree path

let describe_volumes_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     volumes = option_of_yojson (value_for_key volumes_of_yojson "Volumes") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_volumes_response)

let volume_filter_value_of_yojson = string_of_yojson

let volume_filter_values_of_yojson tree path =
  list_of_yojson volume_filter_value_of_yojson tree path

let volume_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "file-system-id" -> FILE_SYSTEM_ID
    | `String "storage-virtual-machine-id" -> STORAGE_VIRTUAL_MACHINE_ID
    | `String value -> raise (deserialize_unknown_enum_value_error path "VolumeFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "VolumeFilterName")
     : volume_filter_name)
    : volume_filter_name)

let volume_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key volume_filter_name_of_yojson "Name") _list path;
     values = option_of_yojson (value_for_key volume_filter_values_of_yojson "Values") _list path;
   }
    : volume_filter)

let volume_filters_of_yojson tree path = list_of_yojson volume_filter_of_yojson tree path
let volume_ids_of_yojson tree path = list_of_yojson volume_id_of_yojson tree path

let describe_volumes_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     volume_ids = option_of_yojson (value_for_key volume_ids_of_yojson "VolumeIds") _list path;
     filters = option_of_yojson (value_for_key volume_filters_of_yojson "Filters") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_volumes_request)

let storage_virtual_machines_of_yojson tree path =
  list_of_yojson storage_virtual_machine_of_yojson tree path

let describe_storage_virtual_machines_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     storage_virtual_machines =
       option_of_yojson
         (value_for_key storage_virtual_machines_of_yojson "StorageVirtualMachines")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_storage_virtual_machines_response)

let storage_virtual_machine_filter_value_of_yojson = string_of_yojson

let storage_virtual_machine_filter_values_of_yojson tree path =
  list_of_yojson storage_virtual_machine_filter_value_of_yojson tree path

let storage_virtual_machine_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "file-system-id" -> FILE_SYSTEM_ID
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "StorageVirtualMachineFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "StorageVirtualMachineFilterName")
     : storage_virtual_machine_filter_name)
    : storage_virtual_machine_filter_name)

let storage_virtual_machine_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name =
       option_of_yojson
         (value_for_key storage_virtual_machine_filter_name_of_yojson "Name")
         _list path;
     values =
       option_of_yojson
         (value_for_key storage_virtual_machine_filter_values_of_yojson "Values")
         _list path;
   }
    : storage_virtual_machine_filter)

let storage_virtual_machine_filters_of_yojson tree path =
  list_of_yojson storage_virtual_machine_filter_of_yojson tree path

let storage_virtual_machine_ids_of_yojson tree path =
  list_of_yojson storage_virtual_machine_id_of_yojson tree path

let describe_storage_virtual_machines_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     storage_virtual_machine_ids =
       option_of_yojson
         (value_for_key storage_virtual_machine_ids_of_yojson "StorageVirtualMachineIds")
         _list path;
     filters =
       option_of_yojson
         (value_for_key storage_virtual_machine_filters_of_yojson "Filters")
         _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_storage_virtual_machines_request)

let snapshots_of_yojson tree path = list_of_yojson snapshot_of_yojson tree path

let describe_snapshots_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     snapshots = option_of_yojson (value_for_key snapshots_of_yojson "Snapshots") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_snapshots_response)

let include_shared_of_yojson = bool_of_yojson
let snapshot_filter_value_of_yojson = string_of_yojson

let snapshot_filter_values_of_yojson tree path =
  list_of_yojson snapshot_filter_value_of_yojson tree path

let snapshot_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "file-system-id" -> FILE_SYSTEM_ID
    | `String "volume-id" -> VOLUME_ID
    | `String value -> raise (deserialize_unknown_enum_value_error path "SnapshotFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "SnapshotFilterName")
     : snapshot_filter_name)
    : snapshot_filter_name)

let snapshot_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key snapshot_filter_name_of_yojson "Name") _list path;
     values = option_of_yojson (value_for_key snapshot_filter_values_of_yojson "Values") _list path;
   }
    : snapshot_filter)

let snapshot_filters_of_yojson tree path = list_of_yojson snapshot_filter_of_yojson tree path
let snapshot_ids_of_yojson tree path = list_of_yojson snapshot_id_of_yojson tree path

let describe_snapshots_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     snapshot_ids = option_of_yojson (value_for_key snapshot_ids_of_yojson "SnapshotIds") _list path;
     filters = option_of_yojson (value_for_key snapshot_filters_of_yojson "Filters") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     include_shared =
       option_of_yojson (value_for_key include_shared_of_yojson "IncludeShared") _list path;
   }
    : describe_snapshots_request)

let describe_shared_vpc_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enable_fsx_route_table_updates_from_participant_accounts =
       option_of_yojson
         (value_for_key verbose_flag_of_yojson "EnableFsxRouteTableUpdatesFromParticipantAccounts")
         _list path;
   }
    : describe_shared_vpc_configuration_response)

let describe_shared_vpc_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let s3_access_point_vpc_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ vpc_id = option_of_yojson (value_for_key vpc_id_of_yojson "VpcId") _list path }
    : s3_access_point_vpc_configuration)

let s3_access_point_alias_of_yojson = string_of_yojson

let s3_access_point_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n =
       option_of_yojson (value_for_key general_ar_n_of_yojson "ResourceARN") _list path;
     alias = option_of_yojson (value_for_key s3_access_point_alias_of_yojson "Alias") _list path;
     vpc_configuration =
       option_of_yojson
         (value_for_key s3_access_point_vpc_configuration_of_yojson "VpcConfiguration")
         _list path;
   }
    : s3_access_point)

let ontap_file_system_user_name_of_yojson = string_of_yojson

let ontap_windows_file_system_user_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key ontap_file_system_user_name_of_yojson "Name" _list path }
    : ontap_windows_file_system_user)

let ontap_unix_file_system_user_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ name = value_for_key ontap_file_system_user_name_of_yojson "Name" _list path }
    : ontap_unix_file_system_user)

let ontap_file_system_user_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "UNIX" -> UNIX
    | `String "WINDOWS" -> WINDOWS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "OntapFileSystemUserType" value)
    | _ -> raise (deserialize_wrong_type_error path "OntapFileSystemUserType")
     : ontap_file_system_user_type)
    : ontap_file_system_user_type)

let ontap_file_system_identity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key ontap_file_system_user_type_of_yojson "Type" _list path;
     unix_user =
       option_of_yojson (value_for_key ontap_unix_file_system_user_of_yojson "UnixUser") _list path;
     windows_user =
       option_of_yojson
         (value_for_key ontap_windows_file_system_user_of_yojson "WindowsUser")
         _list path;
   }
    : ontap_file_system_identity)

let s3_access_point_ontap_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     volume_id = option_of_yojson (value_for_key volume_id_of_yojson "VolumeId") _list path;
     file_system_identity =
       option_of_yojson
         (value_for_key ontap_file_system_identity_of_yojson "FileSystemIdentity")
         _list path;
   }
    : s3_access_point_ontap_configuration)

let file_system_gi_d_of_yojson = long_of_yojson

let file_system_secondary_gi_ds_of_yojson tree path =
  list_of_yojson file_system_gi_d_of_yojson tree path

let file_system_ui_d_of_yojson = long_of_yojson

let open_zfs_posix_file_system_user_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     uid = value_for_key file_system_ui_d_of_yojson "Uid" _list path;
     gid = value_for_key file_system_gi_d_of_yojson "Gid" _list path;
     secondary_gids =
       option_of_yojson
         (value_for_key file_system_secondary_gi_ds_of_yojson "SecondaryGids")
         _list path;
   }
    : open_zfs_posix_file_system_user)

let open_zfs_file_system_user_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "POSIX" -> POSIX
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "OpenZFSFileSystemUserType" value)
    | _ -> raise (deserialize_wrong_type_error path "OpenZFSFileSystemUserType")
     : open_zfs_file_system_user_type)
    : open_zfs_file_system_user_type)

let open_zfs_file_system_identity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key open_zfs_file_system_user_type_of_yojson "Type" _list path;
     posix_user =
       option_of_yojson
         (value_for_key open_zfs_posix_file_system_user_of_yojson "PosixUser")
         _list path;
   }
    : open_zfs_file_system_identity)

let s3_access_point_open_zfs_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     volume_id = option_of_yojson (value_for_key volume_id_of_yojson "VolumeId") _list path;
     file_system_identity =
       option_of_yojson
         (value_for_key open_zfs_file_system_identity_of_yojson "FileSystemIdentity")
         _list path;
   }
    : s3_access_point_open_zfs_configuration)

let s3_access_point_attachment_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "OPENZFS" -> OPENZFS
    | `String "ONTAP" -> ONTAP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "S3AccessPointAttachmentType" value)
    | _ -> raise (deserialize_wrong_type_error path "S3AccessPointAttachmentType")
     : s3_access_point_attachment_type)
    : s3_access_point_attachment_type)

let s3_access_point_attachment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lifecycle =
       option_of_yojson
         (value_for_key s3_access_point_attachment_lifecycle_of_yojson "Lifecycle")
         _list path;
     lifecycle_transition_reason =
       option_of_yojson
         (value_for_key lifecycle_transition_reason_of_yojson "LifecycleTransitionReason")
         _list path;
     creation_time =
       option_of_yojson (value_for_key creation_time_of_yojson "CreationTime") _list path;
     name =
       option_of_yojson (value_for_key s3_access_point_attachment_name_of_yojson "Name") _list path;
     type_ =
       option_of_yojson (value_for_key s3_access_point_attachment_type_of_yojson "Type") _list path;
     open_zfs_configuration =
       option_of_yojson
         (value_for_key s3_access_point_open_zfs_configuration_of_yojson "OpenZFSConfiguration")
         _list path;
     ontap_configuration =
       option_of_yojson
         (value_for_key s3_access_point_ontap_configuration_of_yojson "OntapConfiguration")
         _list path;
     s3_access_point =
       option_of_yojson (value_for_key s3_access_point_of_yojson "S3AccessPoint") _list path;
   }
    : s3_access_point_attachment)

let s3_access_point_attachments_of_yojson tree path =
  list_of_yojson s3_access_point_attachment_of_yojson tree path

let describe_s3_access_point_attachments_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_access_point_attachments =
       option_of_yojson
         (value_for_key s3_access_point_attachments_of_yojson "S3AccessPointAttachments")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_s3_access_point_attachments_response)

let s3_access_point_attachments_filter_value_of_yojson = string_of_yojson

let s3_access_point_attachments_filter_values_of_yojson tree path =
  list_of_yojson s3_access_point_attachments_filter_value_of_yojson tree path

let s3_access_point_attachments_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "file-system-id" -> FILE_SYSTEM_ID
    | `String "volume-id" -> VOLUME_ID
    | `String "type" -> TYPE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "S3AccessPointAttachmentsFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "S3AccessPointAttachmentsFilterName")
     : s3_access_point_attachments_filter_name)
    : s3_access_point_attachments_filter_name)

let s3_access_point_attachments_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name =
       option_of_yojson
         (value_for_key s3_access_point_attachments_filter_name_of_yojson "Name")
         _list path;
     values =
       option_of_yojson
         (value_for_key s3_access_point_attachments_filter_values_of_yojson "Values")
         _list path;
   }
    : s3_access_point_attachments_filter)

let s3_access_point_attachments_filters_of_yojson tree path =
  list_of_yojson s3_access_point_attachments_filter_of_yojson tree path

let s3_access_point_attachment_names_of_yojson tree path =
  list_of_yojson s3_access_point_attachment_name_of_yojson tree path

let describe_s3_access_point_attachments_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     names =
       option_of_yojson
         (value_for_key s3_access_point_attachment_names_of_yojson "Names")
         _list path;
     filters =
       option_of_yojson
         (value_for_key s3_access_point_attachments_filters_of_yojson "Filters")
         _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_s3_access_point_attachments_request)

let file_systems_of_yojson tree path = list_of_yojson file_system_of_yojson tree path

let describe_file_systems_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_systems = option_of_yojson (value_for_key file_systems_of_yojson "FileSystems") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_file_systems_response)

let file_system_ids_of_yojson tree path = list_of_yojson file_system_id_of_yojson tree path

let describe_file_systems_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_system_ids =
       option_of_yojson (value_for_key file_system_ids_of_yojson "FileSystemIds") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_file_systems_request)

let describe_file_system_aliases_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aliases = option_of_yojson (value_for_key aliases_of_yojson "Aliases") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_file_system_aliases_response)

let describe_file_system_aliases_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     file_system_id = value_for_key file_system_id_of_yojson "FileSystemId" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_file_system_aliases_request)

let file_caches_of_yojson tree path = list_of_yojson file_cache_of_yojson tree path

let describe_file_caches_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_caches = option_of_yojson (value_for_key file_caches_of_yojson "FileCaches") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_file_caches_response)

let file_cache_ids_of_yojson tree path = list_of_yojson file_cache_id_of_yojson tree path

let describe_file_caches_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_cache_ids =
       option_of_yojson (value_for_key file_cache_ids_of_yojson "FileCacheIds") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_file_caches_request)

let data_repository_task_not_found_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : data_repository_task_not_found)

let value_of_yojson = long_of_yojson

let unit__of_yojson (tree : t) path =
  ((match tree with
    | `String "DAYS" -> DAYS
    | `String value -> raise (deserialize_unknown_enum_value_error path "Unit" value)
    | _ -> raise (deserialize_wrong_type_error path "Unit")
     : unit_)
    : unit_)

let duration_since_last_access_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     unit_ = option_of_yojson (value_for_key unit__of_yojson "Unit") _list path;
     value = option_of_yojson (value_for_key value_of_yojson "Value") _list path;
   }
    : duration_since_last_access)

let release_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     duration_since_last_access =
       option_of_yojson
         (value_for_key duration_since_last_access_of_yojson "DurationSinceLastAccess")
         _list path;
   }
    : release_configuration)

let capacity_to_release_of_yojson = long_of_yojson

let report_scope_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED_FILES_ONLY" -> FAILED_FILES_ONLY
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReportScope" value)
    | _ -> raise (deserialize_wrong_type_error path "ReportScope")
     : report_scope)
    : report_scope)

let report_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "REPORT_CSV_20191124" -> REPORT_CSV_20191124
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReportFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "ReportFormat")
     : report_format)
    : report_format)

let completion_report_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     enabled = value_for_key flag_of_yojson "Enabled" _list path;
     path = option_of_yojson (value_for_key archive_path_of_yojson "Path") _list path;
     format = option_of_yojson (value_for_key report_format_of_yojson "Format") _list path;
     scope = option_of_yojson (value_for_key report_scope_of_yojson "Scope") _list path;
   }
    : completion_report)

let released_capacity_of_yojson = long_of_yojson
let last_updated_time_of_yojson = timestamp_epoch_seconds_of_yojson
let failed_count_of_yojson = long_of_yojson
let succeeded_count_of_yojson = long_of_yojson
let total_count_of_yojson = long_of_yojson

let data_repository_task_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     total_count = option_of_yojson (value_for_key total_count_of_yojson "TotalCount") _list path;
     succeeded_count =
       option_of_yojson (value_for_key succeeded_count_of_yojson "SucceededCount") _list path;
     failed_count = option_of_yojson (value_for_key failed_count_of_yojson "FailedCount") _list path;
     last_updated_time =
       option_of_yojson (value_for_key last_updated_time_of_yojson "LastUpdatedTime") _list path;
     released_capacity =
       option_of_yojson (value_for_key released_capacity_of_yojson "ReleasedCapacity") _list path;
   }
    : data_repository_task_status)

let data_repository_task_failure_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : data_repository_task_failure_details)

let data_repository_task_path_of_yojson = string_of_yojson

let data_repository_task_paths_of_yojson tree path =
  list_of_yojson data_repository_task_path_of_yojson tree path

let end_time_of_yojson = timestamp_epoch_seconds_of_yojson
let start_time_of_yojson = timestamp_epoch_seconds_of_yojson

let data_repository_task_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "EXPORT_TO_REPOSITORY" -> EXPORT
    | `String "IMPORT_METADATA_FROM_REPOSITORY" -> IMPORT
    | `String "RELEASE_DATA_FROM_FILESYSTEM" -> EVICTION
    | `String "AUTO_RELEASE_DATA" -> AUTO_TRIGGERED_EVICTION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DataRepositoryTaskType" value)
    | _ -> raise (deserialize_wrong_type_error path "DataRepositoryTaskType")
     : data_repository_task_type)
    : data_repository_task_type)

let data_repository_task_lifecycle_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING" -> PENDING
    | `String "EXECUTING" -> EXECUTING
    | `String "FAILED" -> FAILED
    | `String "SUCCEEDED" -> SUCCEEDED
    | `String "CANCELED" -> CANCELED
    | `String "CANCELING" -> CANCELING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DataRepositoryTaskLifecycle" value)
    | _ -> raise (deserialize_wrong_type_error path "DataRepositoryTaskLifecycle")
     : data_repository_task_lifecycle)
    : data_repository_task_lifecycle)

let task_id_of_yojson = string_of_yojson

let data_repository_task_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_id = value_for_key task_id_of_yojson "TaskId" _list path;
     lifecycle = value_for_key data_repository_task_lifecycle_of_yojson "Lifecycle" _list path;
     type_ = value_for_key data_repository_task_type_of_yojson "Type" _list path;
     creation_time = value_for_key creation_time_of_yojson "CreationTime" _list path;
     start_time = option_of_yojson (value_for_key start_time_of_yojson "StartTime") _list path;
     end_time = option_of_yojson (value_for_key end_time_of_yojson "EndTime") _list path;
     resource_ar_n =
       option_of_yojson (value_for_key resource_ar_n_of_yojson "ResourceARN") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     file_system_id =
       option_of_yojson (value_for_key file_system_id_of_yojson "FileSystemId") _list path;
     paths =
       option_of_yojson (value_for_key data_repository_task_paths_of_yojson "Paths") _list path;
     failure_details =
       option_of_yojson
         (value_for_key data_repository_task_failure_details_of_yojson "FailureDetails")
         _list path;
     status =
       option_of_yojson (value_for_key data_repository_task_status_of_yojson "Status") _list path;
     report = option_of_yojson (value_for_key completion_report_of_yojson "Report") _list path;
     capacity_to_release =
       option_of_yojson (value_for_key capacity_to_release_of_yojson "CapacityToRelease") _list path;
     file_cache_id =
       option_of_yojson (value_for_key file_cache_id_of_yojson "FileCacheId") _list path;
     release_configuration =
       option_of_yojson
         (value_for_key release_configuration_of_yojson "ReleaseConfiguration")
         _list path;
   }
    : data_repository_task)

let data_repository_tasks_of_yojson tree path =
  list_of_yojson data_repository_task_of_yojson tree path

let describe_data_repository_tasks_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_repository_tasks =
       option_of_yojson
         (value_for_key data_repository_tasks_of_yojson "DataRepositoryTasks")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_data_repository_tasks_response)

let data_repository_task_filter_value_of_yojson = string_of_yojson

let data_repository_task_filter_values_of_yojson tree path =
  list_of_yojson data_repository_task_filter_value_of_yojson tree path

let data_repository_task_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "file-system-id" -> FILE_SYSTEM_ID
    | `String "task-lifecycle" -> TASK_LIFECYCLE
    | `String "data-repository-association-id" -> DATA_REPO_ASSOCIATION_ID
    | `String "file-cache-id" -> FILE_CACHE_ID
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DataRepositoryTaskFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "DataRepositoryTaskFilterName")
     : data_repository_task_filter_name)
    : data_repository_task_filter_name)

let data_repository_task_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name =
       option_of_yojson (value_for_key data_repository_task_filter_name_of_yojson "Name") _list path;
     values =
       option_of_yojson
         (value_for_key data_repository_task_filter_values_of_yojson "Values")
         _list path;
   }
    : data_repository_task_filter)

let data_repository_task_filters_of_yojson tree path =
  list_of_yojson data_repository_task_filter_of_yojson tree path

let task_ids_of_yojson tree path = list_of_yojson task_id_of_yojson tree path

let describe_data_repository_tasks_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_ids = option_of_yojson (value_for_key task_ids_of_yojson "TaskIds") _list path;
     filters =
       option_of_yojson (value_for_key data_repository_task_filters_of_yojson "Filters") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_data_repository_tasks_request)

let invalid_data_repository_type_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_data_repository_type)

let data_repository_associations_of_yojson tree path =
  list_of_yojson data_repository_association_of_yojson tree path

let describe_data_repository_associations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     associations =
       option_of_yojson
         (value_for_key data_repository_associations_of_yojson "Associations")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_data_repository_associations_response)

let limited_max_results_of_yojson = int_of_yojson
let filter_value_of_yojson = string_of_yojson
let filter_values_of_yojson tree path = list_of_yojson filter_value_of_yojson tree path

let filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "file-system-id" -> FILE_SYSTEM_ID
    | `String "backup-type" -> BACKUP_TYPE
    | `String "file-system-type" -> FILE_SYSTEM_TYPE
    | `String "volume-id" -> VOLUME_ID
    | `String "data-repository-type" -> DATA_REPOSITORY_TYPE
    | `String "file-cache-id" -> FILE_CACHE_ID
    | `String "file-cache-type" -> FILE_CACHE_TYPE
    | `String value -> raise (deserialize_unknown_enum_value_error path "FilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "FilterName")
     : filter_name)
    : filter_name)

let filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key filter_name_of_yojson "Name") _list path;
     values = option_of_yojson (value_for_key filter_values_of_yojson "Values") _list path;
   }
    : filter)

let filters_of_yojson tree path = list_of_yojson filter_of_yojson tree path

let describe_data_repository_associations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     association_ids =
       option_of_yojson
         (value_for_key data_repository_association_ids_of_yojson "AssociationIds")
         _list path;
     filters = option_of_yojson (value_for_key filters_of_yojson "Filters") _list path;
     max_results =
       option_of_yojson (value_for_key limited_max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_data_repository_associations_request)

let backup_not_found_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : backup_not_found)

let size_in_bytes_of_yojson = long_of_yojson

let resource_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "FILE_SYSTEM" -> FILE_SYSTEM
    | `String "VOLUME" -> VOLUME
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceType")
     : resource_type)
    : resource_type)

let region_of_yojson = string_of_yojson
let backup_id_of_yojson = string_of_yojson

let active_directory_backup_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name =
       option_of_yojson
         (value_for_key active_directory_fully_qualified_name_of_yojson "DomainName")
         _list path;
     active_directory_id =
       option_of_yojson (value_for_key directory_id_of_yojson "ActiveDirectoryId") _list path;
     resource_ar_n =
       option_of_yojson (value_for_key resource_ar_n_of_yojson "ResourceARN") _list path;
   }
    : active_directory_backup_attributes)

let backup_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "AUTOMATIC" -> AUTOMATIC
    | `String "USER_INITIATED" -> USER_INITIATED
    | `String "AWS_BACKUP" -> AWS_BACKUP
    | `String value -> raise (deserialize_unknown_enum_value_error path "BackupType" value)
    | _ -> raise (deserialize_wrong_type_error path "BackupType")
     : backup_type)
    : backup_type)

let backup_failure_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : backup_failure_details)

let backup_lifecycle_of_yojson (tree : t) path =
  ((match tree with
    | `String "AVAILABLE" -> AVAILABLE
    | `String "CREATING" -> CREATING
    | `String "TRANSFERRING" -> TRANSFERRING
    | `String "DELETED" -> DELETED
    | `String "FAILED" -> FAILED
    | `String "PENDING" -> PENDING
    | `String "COPYING" -> COPYING
    | `String value -> raise (deserialize_unknown_enum_value_error path "BackupLifecycle" value)
    | _ -> raise (deserialize_wrong_type_error path "BackupLifecycle")
     : backup_lifecycle)
    : backup_lifecycle)

let backup_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     backup_id = value_for_key backup_id_of_yojson "BackupId" _list path;
     lifecycle = value_for_key backup_lifecycle_of_yojson "Lifecycle" _list path;
     failure_details =
       option_of_yojson (value_for_key backup_failure_details_of_yojson "FailureDetails") _list path;
     type_ = value_for_key backup_type_of_yojson "Type" _list path;
     progress_percent =
       option_of_yojson (value_for_key progress_percent_of_yojson "ProgressPercent") _list path;
     creation_time = value_for_key creation_time_of_yojson "CreationTime" _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "KmsKeyId") _list path;
     resource_ar_n =
       option_of_yojson (value_for_key resource_ar_n_of_yojson "ResourceARN") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     file_system = value_for_key file_system_of_yojson "FileSystem" _list path;
     directory_information =
       option_of_yojson
         (value_for_key active_directory_backup_attributes_of_yojson "DirectoryInformation")
         _list path;
     owner_id = option_of_yojson (value_for_key aws_account_id_of_yojson "OwnerId") _list path;
     source_backup_id =
       option_of_yojson (value_for_key backup_id_of_yojson "SourceBackupId") _list path;
     source_backup_region =
       option_of_yojson (value_for_key region_of_yojson "SourceBackupRegion") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "ResourceType") _list path;
     volume = option_of_yojson (value_for_key volume_of_yojson "Volume") _list path;
     size_in_bytes =
       option_of_yojson (value_for_key size_in_bytes_of_yojson "SizeInBytes") _list path;
   }
    : backup)

let backups_of_yojson tree path = list_of_yojson backup_of_yojson tree path

let describe_backups_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     backups = option_of_yojson (value_for_key backups_of_yojson "Backups") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_backups_response)

let backup_ids_of_yojson tree path = list_of_yojson backup_id_of_yojson tree path

let describe_backups_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     backup_ids = option_of_yojson (value_for_key backup_ids_of_yojson "BackupIds") _list path;
     filters = option_of_yojson (value_for_key filters_of_yojson "Filters") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
   }
    : describe_backups_request)

let delete_volume_ontap_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     final_backup_id =
       option_of_yojson (value_for_key backup_id_of_yojson "FinalBackupId") _list path;
     final_backup_tags =
       option_of_yojson (value_for_key tags_of_yojson "FinalBackupTags") _list path;
   }
    : delete_volume_ontap_response)

let delete_volume_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     volume_id = option_of_yojson (value_for_key volume_id_of_yojson "VolumeId") _list path;
     lifecycle = option_of_yojson (value_for_key volume_lifecycle_of_yojson "Lifecycle") _list path;
     ontap_response =
       option_of_yojson
         (value_for_key delete_volume_ontap_response_of_yojson "OntapResponse")
         _list path;
   }
    : delete_volume_response)

let delete_open_zfs_volume_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "DELETE_CHILD_VOLUMES_AND_SNAPSHOTS" -> DELETE_CHILD_VOLUMES_AND_SNAPSHOTS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DeleteOpenZFSVolumeOption" value)
    | _ -> raise (deserialize_wrong_type_error path "DeleteOpenZFSVolumeOption")
     : delete_open_zfs_volume_option)
    : delete_open_zfs_volume_option)

let delete_open_zfs_volume_options_of_yojson tree path =
  list_of_yojson delete_open_zfs_volume_option_of_yojson tree path

let delete_volume_open_zfs_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     options =
       option_of_yojson
         (value_for_key delete_open_zfs_volume_options_of_yojson "Options")
         _list path;
   }
    : delete_volume_open_zfs_configuration)

let delete_volume_ontap_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     skip_final_backup =
       option_of_yojson (value_for_key flag_of_yojson "SkipFinalBackup") _list path;
     final_backup_tags =
       option_of_yojson (value_for_key tags_of_yojson "FinalBackupTags") _list path;
     bypass_snaplock_enterprise_retention =
       option_of_yojson
         (value_for_key flag_of_yojson "BypassSnaplockEnterpriseRetention")
         _list path;
   }
    : delete_volume_ontap_configuration)

let delete_volume_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     volume_id = value_for_key volume_id_of_yojson "VolumeId" _list path;
     ontap_configuration =
       option_of_yojson
         (value_for_key delete_volume_ontap_configuration_of_yojson "OntapConfiguration")
         _list path;
     open_zfs_configuration =
       option_of_yojson
         (value_for_key delete_volume_open_zfs_configuration_of_yojson "OpenZFSConfiguration")
         _list path;
   }
    : delete_volume_request)

let delete_storage_virtual_machine_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     storage_virtual_machine_id =
       option_of_yojson
         (value_for_key storage_virtual_machine_id_of_yojson "StorageVirtualMachineId")
         _list path;
     lifecycle =
       option_of_yojson
         (value_for_key storage_virtual_machine_lifecycle_of_yojson "Lifecycle")
         _list path;
   }
    : delete_storage_virtual_machine_response)

let delete_storage_virtual_machine_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     storage_virtual_machine_id =
       value_for_key storage_virtual_machine_id_of_yojson "StorageVirtualMachineId" _list path;
   }
    : delete_storage_virtual_machine_request)

let delete_snapshot_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     snapshot_id = option_of_yojson (value_for_key snapshot_id_of_yojson "SnapshotId") _list path;
     lifecycle =
       option_of_yojson (value_for_key snapshot_lifecycle_of_yojson "Lifecycle") _list path;
   }
    : delete_snapshot_response)

let delete_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     snapshot_id = value_for_key snapshot_id_of_yojson "SnapshotId" _list path;
   }
    : delete_snapshot_request)

let delete_file_system_open_zfs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     final_backup_id =
       option_of_yojson (value_for_key backup_id_of_yojson "FinalBackupId") _list path;
     final_backup_tags =
       option_of_yojson (value_for_key tags_of_yojson "FinalBackupTags") _list path;
   }
    : delete_file_system_open_zfs_response)

let delete_file_system_lustre_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     final_backup_id =
       option_of_yojson (value_for_key backup_id_of_yojson "FinalBackupId") _list path;
     final_backup_tags =
       option_of_yojson (value_for_key tags_of_yojson "FinalBackupTags") _list path;
   }
    : delete_file_system_lustre_response)

let delete_file_system_windows_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     final_backup_id =
       option_of_yojson (value_for_key backup_id_of_yojson "FinalBackupId") _list path;
     final_backup_tags =
       option_of_yojson (value_for_key tags_of_yojson "FinalBackupTags") _list path;
   }
    : delete_file_system_windows_response)

let delete_file_system_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_system_id =
       option_of_yojson (value_for_key file_system_id_of_yojson "FileSystemId") _list path;
     lifecycle =
       option_of_yojson (value_for_key file_system_lifecycle_of_yojson "Lifecycle") _list path;
     windows_response =
       option_of_yojson
         (value_for_key delete_file_system_windows_response_of_yojson "WindowsResponse")
         _list path;
     lustre_response =
       option_of_yojson
         (value_for_key delete_file_system_lustre_response_of_yojson "LustreResponse")
         _list path;
     open_zfs_response =
       option_of_yojson
         (value_for_key delete_file_system_open_zfs_response_of_yojson "OpenZFSResponse")
         _list path;
   }
    : delete_file_system_response)

let delete_file_system_open_zfs_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "DELETE_CHILD_VOLUMES_AND_SNAPSHOTS" -> DELETE_CHILD_VOLUMES_AND_SNAPSHOTS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "DeleteFileSystemOpenZFSOption" value)
    | _ -> raise (deserialize_wrong_type_error path "DeleteFileSystemOpenZFSOption")
     : delete_file_system_open_zfs_option)
    : delete_file_system_open_zfs_option)

let delete_file_system_open_zfs_options_of_yojson tree path =
  list_of_yojson delete_file_system_open_zfs_option_of_yojson tree path

let delete_file_system_open_zfs_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     skip_final_backup =
       option_of_yojson (value_for_key flag_of_yojson "SkipFinalBackup") _list path;
     final_backup_tags =
       option_of_yojson (value_for_key tags_of_yojson "FinalBackupTags") _list path;
     options =
       option_of_yojson
         (value_for_key delete_file_system_open_zfs_options_of_yojson "Options")
         _list path;
   }
    : delete_file_system_open_zfs_configuration)

let delete_file_system_lustre_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     skip_final_backup =
       option_of_yojson (value_for_key flag_of_yojson "SkipFinalBackup") _list path;
     final_backup_tags =
       option_of_yojson (value_for_key tags_of_yojson "FinalBackupTags") _list path;
   }
    : delete_file_system_lustre_configuration)

let delete_file_system_windows_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     skip_final_backup =
       option_of_yojson (value_for_key flag_of_yojson "SkipFinalBackup") _list path;
     final_backup_tags =
       option_of_yojson (value_for_key tags_of_yojson "FinalBackupTags") _list path;
   }
    : delete_file_system_windows_configuration)

let delete_file_system_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_system_id = value_for_key file_system_id_of_yojson "FileSystemId" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     windows_configuration =
       option_of_yojson
         (value_for_key delete_file_system_windows_configuration_of_yojson "WindowsConfiguration")
         _list path;
     lustre_configuration =
       option_of_yojson
         (value_for_key delete_file_system_lustre_configuration_of_yojson "LustreConfiguration")
         _list path;
     open_zfs_configuration =
       option_of_yojson
         (value_for_key delete_file_system_open_zfs_configuration_of_yojson "OpenZFSConfiguration")
         _list path;
   }
    : delete_file_system_request)

let delete_file_cache_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_cache_id =
       option_of_yojson (value_for_key file_cache_id_of_yojson "FileCacheId") _list path;
     lifecycle =
       option_of_yojson (value_for_key file_cache_lifecycle_of_yojson "Lifecycle") _list path;
   }
    : delete_file_cache_response)

let delete_file_cache_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_cache_id = value_for_key file_cache_id_of_yojson "FileCacheId" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
   }
    : delete_file_cache_request)

let delete_data_in_file_system_of_yojson = bool_of_yojson

let delete_data_repository_association_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     association_id =
       option_of_yojson
         (value_for_key data_repository_association_id_of_yojson "AssociationId")
         _list path;
     lifecycle =
       option_of_yojson (value_for_key data_repository_lifecycle_of_yojson "Lifecycle") _list path;
     delete_data_in_file_system =
       option_of_yojson
         (value_for_key delete_data_in_file_system_of_yojson "DeleteDataInFileSystem")
         _list path;
   }
    : delete_data_repository_association_response)

let delete_data_repository_association_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     association_id =
       value_for_key data_repository_association_id_of_yojson "AssociationId" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     delete_data_in_file_system =
       option_of_yojson
         (value_for_key delete_data_in_file_system_of_yojson "DeleteDataInFileSystem")
         _list path;
   }
    : delete_data_repository_association_request)

let backup_restoring_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
     file_system_id =
       option_of_yojson (value_for_key file_system_id_of_yojson "FileSystemId") _list path;
   }
    : backup_restoring)

let backup_in_progress_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : backup_in_progress)

let backup_being_copied_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
     backup_id = option_of_yojson (value_for_key backup_id_of_yojson "BackupId") _list path;
   }
    : backup_being_copied)

let delete_backup_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     backup_id = option_of_yojson (value_for_key backup_id_of_yojson "BackupId") _list path;
     lifecycle = option_of_yojson (value_for_key backup_lifecycle_of_yojson "Lifecycle") _list path;
   }
    : delete_backup_response)

let delete_backup_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     backup_id = value_for_key backup_id_of_yojson "BackupId" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
   }
    : delete_backup_request)

let create_volume_from_backup_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ volume = option_of_yojson (value_for_key volume_of_yojson "Volume") _list path }
    : create_volume_from_backup_response)

let aggregate_list_multiplier_of_yojson = int_of_yojson

let create_aggregate_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     aggregates = option_of_yojson (value_for_key aggregates_of_yojson "Aggregates") _list path;
     constituents_per_aggregate =
       option_of_yojson
         (value_for_key aggregate_list_multiplier_of_yojson "ConstituentsPerAggregate")
         _list path;
   }
    : create_aggregate_configuration)

let create_snaplock_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     audit_log_volume = option_of_yojson (value_for_key flag_of_yojson "AuditLogVolume") _list path;
     autocommit_period =
       option_of_yojson (value_for_key autocommit_period_of_yojson "AutocommitPeriod") _list path;
     privileged_delete =
       option_of_yojson (value_for_key privileged_delete_of_yojson "PrivilegedDelete") _list path;
     retention_period =
       option_of_yojson
         (value_for_key snaplock_retention_period_of_yojson "RetentionPeriod")
         _list path;
     snaplock_type = value_for_key snaplock_type_of_yojson "SnaplockType" _list path;
     volume_append_mode_enabled =
       option_of_yojson (value_for_key flag_of_yojson "VolumeAppendModeEnabled") _list path;
   }
    : create_snaplock_configuration)

let input_ontap_volume_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "RW" -> RW
    | `String "DP" -> DP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InputOntapVolumeType" value)
    | _ -> raise (deserialize_wrong_type_error path "InputOntapVolumeType")
     : input_ontap_volume_type)
    : input_ontap_volume_type)

let create_ontap_volume_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     junction_path =
       option_of_yojson (value_for_key junction_path_of_yojson "JunctionPath") _list path;
     security_style =
       option_of_yojson (value_for_key security_style_of_yojson "SecurityStyle") _list path;
     size_in_megabytes =
       option_of_yojson (value_for_key volume_capacity_of_yojson "SizeInMegabytes") _list path;
     storage_efficiency_enabled =
       option_of_yojson (value_for_key flag_of_yojson "StorageEfficiencyEnabled") _list path;
     storage_virtual_machine_id =
       value_for_key storage_virtual_machine_id_of_yojson "StorageVirtualMachineId" _list path;
     tiering_policy =
       option_of_yojson (value_for_key tiering_policy_of_yojson "TieringPolicy") _list path;
     ontap_volume_type =
       option_of_yojson
         (value_for_key input_ontap_volume_type_of_yojson "OntapVolumeType")
         _list path;
     snapshot_policy =
       option_of_yojson (value_for_key snapshot_policy_of_yojson "SnapshotPolicy") _list path;
     copy_tags_to_backups =
       option_of_yojson (value_for_key flag_of_yojson "CopyTagsToBackups") _list path;
     snaplock_configuration =
       option_of_yojson
         (value_for_key create_snaplock_configuration_of_yojson "SnaplockConfiguration")
         _list path;
     volume_style = option_of_yojson (value_for_key volume_style_of_yojson "VolumeStyle") _list path;
     aggregate_configuration =
       option_of_yojson
         (value_for_key create_aggregate_configuration_of_yojson "AggregateConfiguration")
         _list path;
     size_in_bytes =
       option_of_yojson (value_for_key volume_capacity_bytes_of_yojson "SizeInBytes") _list path;
   }
    : create_ontap_volume_configuration)

let create_volume_from_backup_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     backup_id = value_for_key backup_id_of_yojson "BackupId" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     name = value_for_key volume_name_of_yojson "Name" _list path;
     ontap_configuration =
       option_of_yojson
         (value_for_key create_ontap_volume_configuration_of_yojson "OntapConfiguration")
         _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
   }
    : create_volume_from_backup_request)

let create_volume_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ volume = option_of_yojson (value_for_key volume_of_yojson "Volume") _list path }
    : create_volume_response)

let create_open_zfs_origin_snapshot_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     snapshot_ar_n = value_for_key resource_ar_n_of_yojson "SnapshotARN" _list path;
     copy_strategy = value_for_key open_zfs_copy_strategy_of_yojson "CopyStrategy" _list path;
   }
    : create_open_zfs_origin_snapshot_configuration)

let create_open_zfs_volume_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     parent_volume_id = value_for_key volume_id_of_yojson "ParentVolumeId" _list path;
     storage_capacity_reservation_gi_b =
       option_of_yojson
         (value_for_key integer_no_max_from_negative_one_of_yojson "StorageCapacityReservationGiB")
         _list path;
     storage_capacity_quota_gi_b =
       option_of_yojson
         (value_for_key integer_no_max_from_negative_one_of_yojson "StorageCapacityQuotaGiB")
         _list path;
     record_size_ki_b =
       option_of_yojson
         (value_for_key integer_record_size_ki_b_of_yojson "RecordSizeKiB")
         _list path;
     data_compression_type =
       option_of_yojson
         (value_for_key open_zfs_data_compression_type_of_yojson "DataCompressionType")
         _list path;
     copy_tags_to_snapshots =
       option_of_yojson (value_for_key flag_of_yojson "CopyTagsToSnapshots") _list path;
     origin_snapshot =
       option_of_yojson
         (value_for_key create_open_zfs_origin_snapshot_configuration_of_yojson "OriginSnapshot")
         _list path;
     read_only = option_of_yojson (value_for_key read_only_of_yojson "ReadOnly") _list path;
     nfs_exports =
       option_of_yojson (value_for_key open_zfs_nfs_exports_of_yojson "NfsExports") _list path;
     user_and_group_quotas =
       option_of_yojson
         (value_for_key open_zfs_user_and_group_quotas_of_yojson "UserAndGroupQuotas")
         _list path;
   }
    : create_open_zfs_volume_configuration)

let create_volume_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     volume_type = value_for_key volume_type_of_yojson "VolumeType" _list path;
     name = value_for_key volume_name_of_yojson "Name" _list path;
     ontap_configuration =
       option_of_yojson
         (value_for_key create_ontap_volume_configuration_of_yojson "OntapConfiguration")
         _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     open_zfs_configuration =
       option_of_yojson
         (value_for_key create_open_zfs_volume_configuration_of_yojson "OpenZFSConfiguration")
         _list path;
   }
    : create_volume_request)

let active_directory_error_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DOMAIN_NOT_FOUND" -> DOMAIN_NOT_FOUND
    | `String "INCOMPATIBLE_DOMAIN_MODE" -> INCOMPATIBLE_DOMAIN_MODE
    | `String "WRONG_VPC" -> WRONG_VPC
    | `String "INVALID_NETWORK_TYPE" -> INVALID_NETWORK_TYPE
    | `String "INVALID_DOMAIN_STAGE" -> INVALID_DOMAIN_STAGE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ActiveDirectoryErrorType" value)
    | _ -> raise (deserialize_wrong_type_error path "ActiveDirectoryErrorType")
     : active_directory_error_type)
    : active_directory_error_type)

let active_directory_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     active_directory_id = value_for_key directory_id_of_yojson "ActiveDirectoryId" _list path;
     type_ =
       option_of_yojson (value_for_key active_directory_error_type_of_yojson "Type") _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
   }
    : active_directory_error)

let create_storage_virtual_machine_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     storage_virtual_machine =
       option_of_yojson
         (value_for_key storage_virtual_machine_of_yojson "StorageVirtualMachine")
         _list path;
   }
    : create_storage_virtual_machine_response)

let self_managed_active_directory_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     domain_name =
       value_for_key active_directory_fully_qualified_name_of_yojson "DomainName" _list path;
     organizational_unit_distinguished_name =
       option_of_yojson
         (value_for_key organizational_unit_distinguished_name_of_yojson
            "OrganizationalUnitDistinguishedName")
         _list path;
     file_system_administrators_group =
       option_of_yojson
         (value_for_key file_system_administrators_group_name_of_yojson
            "FileSystemAdministratorsGroup")
         _list path;
     user_name =
       option_of_yojson (value_for_key directory_user_name_of_yojson "UserName") _list path;
     password = option_of_yojson (value_for_key directory_password_of_yojson "Password") _list path;
     dns_ips = value_for_key dns_ips_of_yojson "DnsIps" _list path;
     domain_join_service_account_secret =
       option_of_yojson
         (value_for_key customer_secrets_manager_ar_n_of_yojson "DomainJoinServiceAccountSecret")
         _list path;
   }
    : self_managed_active_directory_configuration)

let create_svm_active_directory_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     net_bios_name = value_for_key net_bios_alias_of_yojson "NetBiosName" _list path;
     self_managed_active_directory_configuration =
       option_of_yojson
         (value_for_key self_managed_active_directory_configuration_of_yojson
            "SelfManagedActiveDirectoryConfiguration")
         _list path;
   }
    : create_svm_active_directory_configuration)

let create_storage_virtual_machine_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     active_directory_configuration =
       option_of_yojson
         (value_for_key create_svm_active_directory_configuration_of_yojson
            "ActiveDirectoryConfiguration")
         _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     file_system_id = value_for_key file_system_id_of_yojson "FileSystemId" _list path;
     name = value_for_key storage_virtual_machine_name_of_yojson "Name" _list path;
     svm_admin_password =
       option_of_yojson (value_for_key admin_password_of_yojson "SvmAdminPassword") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     root_volume_security_style =
       option_of_yojson
         (value_for_key storage_virtual_machine_root_volume_security_style_of_yojson
            "RootVolumeSecurityStyle")
         _list path;
   }
    : create_storage_virtual_machine_request)

let create_snapshot_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ snapshot = option_of_yojson (value_for_key snapshot_of_yojson "Snapshot") _list path }
    : create_snapshot_response)

let create_snapshot_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     name = value_for_key snapshot_name_of_yojson "Name" _list path;
     volume_id = value_for_key volume_id_of_yojson "VolumeId" _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
   }
    : create_snapshot_request)

let invalid_per_unit_storage_throughput_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_per_unit_storage_throughput)

let create_file_system_from_backup_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ file_system = option_of_yojson (value_for_key file_system_of_yojson "FileSystem") _list path }
    : create_file_system_from_backup_response)

let open_zfs_create_root_volume_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     record_size_ki_b =
       option_of_yojson
         (value_for_key integer_record_size_ki_b_of_yojson "RecordSizeKiB")
         _list path;
     data_compression_type =
       option_of_yojson
         (value_for_key open_zfs_data_compression_type_of_yojson "DataCompressionType")
         _list path;
     nfs_exports =
       option_of_yojson (value_for_key open_zfs_nfs_exports_of_yojson "NfsExports") _list path;
     user_and_group_quotas =
       option_of_yojson
         (value_for_key open_zfs_user_and_group_quotas_of_yojson "UserAndGroupQuotas")
         _list path;
     copy_tags_to_snapshots =
       option_of_yojson (value_for_key flag_of_yojson "CopyTagsToSnapshots") _list path;
     read_only = option_of_yojson (value_for_key read_only_of_yojson "ReadOnly") _list path;
   }
    : open_zfs_create_root_volume_configuration)

let create_file_system_open_zfs_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     automatic_backup_retention_days =
       option_of_yojson
         (value_for_key automatic_backup_retention_days_of_yojson "AutomaticBackupRetentionDays")
         _list path;
     copy_tags_to_backups =
       option_of_yojson (value_for_key flag_of_yojson "CopyTagsToBackups") _list path;
     copy_tags_to_volumes =
       option_of_yojson (value_for_key flag_of_yojson "CopyTagsToVolumes") _list path;
     daily_automatic_backup_start_time =
       option_of_yojson
         (value_for_key daily_time_of_yojson "DailyAutomaticBackupStartTime")
         _list path;
     deployment_type = value_for_key open_zfs_deployment_type_of_yojson "DeploymentType" _list path;
     throughput_capacity =
       value_for_key megabytes_per_second_of_yojson "ThroughputCapacity" _list path;
     weekly_maintenance_start_time =
       option_of_yojson
         (value_for_key weekly_time_of_yojson "WeeklyMaintenanceStartTime")
         _list path;
     disk_iops_configuration =
       option_of_yojson
         (value_for_key disk_iops_configuration_of_yojson "DiskIopsConfiguration")
         _list path;
     root_volume_configuration =
       option_of_yojson
         (value_for_key open_zfs_create_root_volume_configuration_of_yojson
            "RootVolumeConfiguration")
         _list path;
     preferred_subnet_id =
       option_of_yojson (value_for_key subnet_id_of_yojson "PreferredSubnetId") _list path;
     endpoint_ip_address_range =
       option_of_yojson
         (value_for_key ip_address_range_of_yojson "EndpointIpAddressRange")
         _list path;
     endpoint_ipv6_address_range =
       option_of_yojson
         (value_for_key ipv6_address_range_of_yojson "EndpointIpv6AddressRange")
         _list path;
     route_table_ids =
       option_of_yojson (value_for_key route_table_ids_of_yojson "RouteTableIds") _list path;
     read_cache_configuration =
       option_of_yojson
         (value_for_key open_zfs_read_cache_configuration_of_yojson "ReadCacheConfiguration")
         _list path;
   }
    : create_file_system_open_zfs_configuration)

let create_file_system_lustre_metadata_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     iops = option_of_yojson (value_for_key metadata_iops_of_yojson "Iops") _list path;
     mode = value_for_key metadata_configuration_mode_of_yojson "Mode" _list path;
   }
    : create_file_system_lustre_metadata_configuration)

let create_file_system_lustre_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     weekly_maintenance_start_time =
       option_of_yojson
         (value_for_key weekly_time_of_yojson "WeeklyMaintenanceStartTime")
         _list path;
     import_path = option_of_yojson (value_for_key archive_path_of_yojson "ImportPath") _list path;
     export_path = option_of_yojson (value_for_key archive_path_of_yojson "ExportPath") _list path;
     imported_file_chunk_size =
       option_of_yojson (value_for_key megabytes_of_yojson "ImportedFileChunkSize") _list path;
     deployment_type =
       option_of_yojson (value_for_key lustre_deployment_type_of_yojson "DeploymentType") _list path;
     auto_import_policy =
       option_of_yojson
         (value_for_key auto_import_policy_type_of_yojson "AutoImportPolicy")
         _list path;
     per_unit_storage_throughput =
       option_of_yojson
         (value_for_key per_unit_storage_throughput_of_yojson "PerUnitStorageThroughput")
         _list path;
     daily_automatic_backup_start_time =
       option_of_yojson
         (value_for_key daily_time_of_yojson "DailyAutomaticBackupStartTime")
         _list path;
     automatic_backup_retention_days =
       option_of_yojson
         (value_for_key automatic_backup_retention_days_of_yojson "AutomaticBackupRetentionDays")
         _list path;
     copy_tags_to_backups =
       option_of_yojson (value_for_key flag_of_yojson "CopyTagsToBackups") _list path;
     drive_cache_type =
       option_of_yojson (value_for_key drive_cache_type_of_yojson "DriveCacheType") _list path;
     data_compression_type =
       option_of_yojson
         (value_for_key data_compression_type_of_yojson "DataCompressionType")
         _list path;
     efa_enabled = option_of_yojson (value_for_key flag_of_yojson "EfaEnabled") _list path;
     log_configuration =
       option_of_yojson
         (value_for_key lustre_log_create_configuration_of_yojson "LogConfiguration")
         _list path;
     root_squash_configuration =
       option_of_yojson
         (value_for_key lustre_root_squash_configuration_of_yojson "RootSquashConfiguration")
         _list path;
     metadata_configuration =
       option_of_yojson
         (value_for_key create_file_system_lustre_metadata_configuration_of_yojson
            "MetadataConfiguration")
         _list path;
     throughput_capacity =
       option_of_yojson
         (value_for_key throughput_capacity_mbps_of_yojson "ThroughputCapacity")
         _list path;
     data_read_cache_configuration =
       option_of_yojson
         (value_for_key lustre_read_cache_configuration_of_yojson "DataReadCacheConfiguration")
         _list path;
   }
    : create_file_system_lustre_configuration)

let create_file_system_windows_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     active_directory_id =
       option_of_yojson (value_for_key directory_id_of_yojson "ActiveDirectoryId") _list path;
     self_managed_active_directory_configuration =
       option_of_yojson
         (value_for_key self_managed_active_directory_configuration_of_yojson
            "SelfManagedActiveDirectoryConfiguration")
         _list path;
     deployment_type =
       option_of_yojson
         (value_for_key windows_deployment_type_of_yojson "DeploymentType")
         _list path;
     preferred_subnet_id =
       option_of_yojson (value_for_key subnet_id_of_yojson "PreferredSubnetId") _list path;
     throughput_capacity =
       value_for_key megabytes_per_second_of_yojson "ThroughputCapacity" _list path;
     weekly_maintenance_start_time =
       option_of_yojson
         (value_for_key weekly_time_of_yojson "WeeklyMaintenanceStartTime")
         _list path;
     daily_automatic_backup_start_time =
       option_of_yojson
         (value_for_key daily_time_of_yojson "DailyAutomaticBackupStartTime")
         _list path;
     automatic_backup_retention_days =
       option_of_yojson
         (value_for_key automatic_backup_retention_days_of_yojson "AutomaticBackupRetentionDays")
         _list path;
     copy_tags_to_backups =
       option_of_yojson (value_for_key flag_of_yojson "CopyTagsToBackups") _list path;
     aliases = option_of_yojson (value_for_key alternate_dns_names_of_yojson "Aliases") _list path;
     audit_log_configuration =
       option_of_yojson
         (value_for_key windows_audit_log_create_configuration_of_yojson "AuditLogConfiguration")
         _list path;
     disk_iops_configuration =
       option_of_yojson
         (value_for_key disk_iops_configuration_of_yojson "DiskIopsConfiguration")
         _list path;
     fsrm_configuration =
       option_of_yojson
         (value_for_key windows_fsrm_configuration_of_yojson "FsrmConfiguration")
         _list path;
   }
    : create_file_system_windows_configuration)

let security_group_ids_of_yojson tree path = list_of_yojson security_group_id_of_yojson tree path

let create_file_system_from_backup_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     backup_id = value_for_key backup_id_of_yojson "BackupId" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     subnet_ids = value_for_key subnet_ids_of_yojson "SubnetIds" _list path;
     security_group_ids =
       option_of_yojson (value_for_key security_group_ids_of_yojson "SecurityGroupIds") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     windows_configuration =
       option_of_yojson
         (value_for_key create_file_system_windows_configuration_of_yojson "WindowsConfiguration")
         _list path;
     lustre_configuration =
       option_of_yojson
         (value_for_key create_file_system_lustre_configuration_of_yojson "LustreConfiguration")
         _list path;
     storage_type = option_of_yojson (value_for_key storage_type_of_yojson "StorageType") _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "KmsKeyId") _list path;
     file_system_type_version =
       option_of_yojson
         (value_for_key file_system_type_version_of_yojson "FileSystemTypeVersion")
         _list path;
     open_zfs_configuration =
       option_of_yojson
         (value_for_key create_file_system_open_zfs_configuration_of_yojson "OpenZFSConfiguration")
         _list path;
     storage_capacity =
       option_of_yojson (value_for_key storage_capacity_of_yojson "StorageCapacity") _list path;
     network_type = option_of_yojson (value_for_key network_type_of_yojson "NetworkType") _list path;
   }
    : create_file_system_from_backup_request)

let invalid_import_path_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_import_path)

let invalid_export_path_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_export_path)

let create_file_system_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ file_system = option_of_yojson (value_for_key file_system_of_yojson "FileSystem") _list path }
    : create_file_system_response)

let create_file_system_ontap_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     automatic_backup_retention_days =
       option_of_yojson
         (value_for_key automatic_backup_retention_days_of_yojson "AutomaticBackupRetentionDays")
         _list path;
     daily_automatic_backup_start_time =
       option_of_yojson
         (value_for_key daily_time_of_yojson "DailyAutomaticBackupStartTime")
         _list path;
     deployment_type = value_for_key ontap_deployment_type_of_yojson "DeploymentType" _list path;
     endpoint_ip_address_range =
       option_of_yojson
         (value_for_key ip_address_range_of_yojson "EndpointIpAddressRange")
         _list path;
     fsx_admin_password =
       option_of_yojson (value_for_key admin_password_of_yojson "FsxAdminPassword") _list path;
     disk_iops_configuration =
       option_of_yojson
         (value_for_key disk_iops_configuration_of_yojson "DiskIopsConfiguration")
         _list path;
     preferred_subnet_id =
       option_of_yojson (value_for_key subnet_id_of_yojson "PreferredSubnetId") _list path;
     route_table_ids =
       option_of_yojson (value_for_key route_table_ids_of_yojson "RouteTableIds") _list path;
     throughput_capacity =
       option_of_yojson
         (value_for_key megabytes_per_second_of_yojson "ThroughputCapacity")
         _list path;
     weekly_maintenance_start_time =
       option_of_yojson
         (value_for_key weekly_time_of_yojson "WeeklyMaintenanceStartTime")
         _list path;
     ha_pairs = option_of_yojson (value_for_key ha_pairs_of_yojson "HAPairs") _list path;
     throughput_capacity_per_ha_pair =
       option_of_yojson
         (value_for_key throughput_capacity_per_ha_pair_of_yojson "ThroughputCapacityPerHAPair")
         _list path;
     endpoint_ipv6_address_range =
       option_of_yojson
         (value_for_key ipv6_address_range_of_yojson "EndpointIpv6AddressRange")
         _list path;
   }
    : create_file_system_ontap_configuration)

let create_file_system_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     file_system_type = value_for_key file_system_type_of_yojson "FileSystemType" _list path;
     storage_capacity =
       option_of_yojson (value_for_key storage_capacity_of_yojson "StorageCapacity") _list path;
     storage_type = option_of_yojson (value_for_key storage_type_of_yojson "StorageType") _list path;
     subnet_ids = value_for_key subnet_ids_of_yojson "SubnetIds" _list path;
     security_group_ids =
       option_of_yojson (value_for_key security_group_ids_of_yojson "SecurityGroupIds") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "KmsKeyId") _list path;
     windows_configuration =
       option_of_yojson
         (value_for_key create_file_system_windows_configuration_of_yojson "WindowsConfiguration")
         _list path;
     lustre_configuration =
       option_of_yojson
         (value_for_key create_file_system_lustre_configuration_of_yojson "LustreConfiguration")
         _list path;
     ontap_configuration =
       option_of_yojson
         (value_for_key create_file_system_ontap_configuration_of_yojson "OntapConfiguration")
         _list path;
     file_system_type_version =
       option_of_yojson
         (value_for_key file_system_type_version_of_yojson "FileSystemTypeVersion")
         _list path;
     open_zfs_configuration =
       option_of_yojson
         (value_for_key create_file_system_open_zfs_configuration_of_yojson "OpenZFSConfiguration")
         _list path;
     network_type = option_of_yojson (value_for_key network_type_of_yojson "NetworkType") _list path;
   }
    : create_file_system_request)

let copy_tags_to_data_repository_associations_of_yojson = bool_of_yojson

let file_cache_creating_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     owner_id = option_of_yojson (value_for_key aws_account_id_of_yojson "OwnerId") _list path;
     creation_time =
       option_of_yojson (value_for_key creation_time_of_yojson "CreationTime") _list path;
     file_cache_id =
       option_of_yojson (value_for_key file_cache_id_of_yojson "FileCacheId") _list path;
     file_cache_type =
       option_of_yojson (value_for_key file_cache_type_of_yojson "FileCacheType") _list path;
     file_cache_type_version =
       option_of_yojson
         (value_for_key file_system_type_version_of_yojson "FileCacheTypeVersion")
         _list path;
     lifecycle =
       option_of_yojson (value_for_key file_cache_lifecycle_of_yojson "Lifecycle") _list path;
     failure_details =
       option_of_yojson
         (value_for_key file_cache_failure_details_of_yojson "FailureDetails")
         _list path;
     storage_capacity =
       option_of_yojson (value_for_key storage_capacity_of_yojson "StorageCapacity") _list path;
     vpc_id = option_of_yojson (value_for_key vpc_id_of_yojson "VpcId") _list path;
     subnet_ids = option_of_yojson (value_for_key subnet_ids_of_yojson "SubnetIds") _list path;
     network_interface_ids =
       option_of_yojson
         (value_for_key network_interface_ids_of_yojson "NetworkInterfaceIds")
         _list path;
     dns_name = option_of_yojson (value_for_key dns_name_of_yojson "DNSName") _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "KmsKeyId") _list path;
     resource_ar_n =
       option_of_yojson (value_for_key resource_ar_n_of_yojson "ResourceARN") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     copy_tags_to_data_repository_associations =
       option_of_yojson
         (value_for_key copy_tags_to_data_repository_associations_of_yojson
            "CopyTagsToDataRepositoryAssociations")
         _list path;
     lustre_configuration =
       option_of_yojson
         (value_for_key file_cache_lustre_configuration_of_yojson "LustreConfiguration")
         _list path;
     data_repository_association_ids =
       option_of_yojson
         (value_for_key data_repository_association_ids_of_yojson "DataRepositoryAssociationIds")
         _list path;
   }
    : file_cache_creating)

let create_file_cache_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_cache =
       option_of_yojson (value_for_key file_cache_creating_of_yojson "FileCache") _list path;
   }
    : create_file_cache_response)

let file_cache_nfs_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     version = value_for_key nfs_version_of_yojson "Version" _list path;
     dns_ips = option_of_yojson (value_for_key repository_dns_ips_of_yojson "DnsIps") _list path;
   }
    : file_cache_nfs_configuration)

let file_cache_data_repository_association_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_cache_path = value_for_key namespace_of_yojson "FileCachePath" _list path;
     data_repository_path = value_for_key archive_path_of_yojson "DataRepositoryPath" _list path;
     data_repository_subdirectories =
       option_of_yojson
         (value_for_key sub_directories_paths_of_yojson "DataRepositorySubdirectories")
         _list path;
     nf_s = option_of_yojson (value_for_key file_cache_nfs_configuration_of_yojson "NFS") _list path;
   }
    : file_cache_data_repository_association)

let create_file_cache_data_repository_associations_of_yojson tree path =
  list_of_yojson file_cache_data_repository_association_of_yojson tree path

let create_file_cache_lustre_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     per_unit_storage_throughput =
       value_for_key per_unit_storage_throughput_of_yojson "PerUnitStorageThroughput" _list path;
     deployment_type =
       value_for_key file_cache_lustre_deployment_type_of_yojson "DeploymentType" _list path;
     weekly_maintenance_start_time =
       option_of_yojson
         (value_for_key weekly_time_of_yojson "WeeklyMaintenanceStartTime")
         _list path;
     metadata_configuration =
       value_for_key file_cache_lustre_metadata_configuration_of_yojson "MetadataConfiguration"
         _list path;
   }
    : create_file_cache_lustre_configuration)

let create_file_cache_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     file_cache_type = value_for_key file_cache_type_of_yojson "FileCacheType" _list path;
     file_cache_type_version =
       value_for_key file_system_type_version_of_yojson "FileCacheTypeVersion" _list path;
     storage_capacity = value_for_key storage_capacity_of_yojson "StorageCapacity" _list path;
     subnet_ids = value_for_key subnet_ids_of_yojson "SubnetIds" _list path;
     security_group_ids =
       option_of_yojson (value_for_key security_group_ids_of_yojson "SecurityGroupIds") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     copy_tags_to_data_repository_associations =
       option_of_yojson
         (value_for_key copy_tags_to_data_repository_associations_of_yojson
            "CopyTagsToDataRepositoryAssociations")
         _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "KmsKeyId") _list path;
     lustre_configuration =
       option_of_yojson
         (value_for_key create_file_cache_lustre_configuration_of_yojson "LustreConfiguration")
         _list path;
     data_repository_associations =
       option_of_yojson
         (value_for_key create_file_cache_data_repository_associations_of_yojson
            "DataRepositoryAssociations")
         _list path;
   }
    : create_file_cache_request)

let data_repository_task_executing_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : data_repository_task_executing)

let create_data_repository_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_repository_task =
       option_of_yojson
         (value_for_key data_repository_task_of_yojson "DataRepositoryTask")
         _list path;
   }
    : create_data_repository_task_response)

let create_data_repository_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ = value_for_key data_repository_task_type_of_yojson "Type" _list path;
     paths =
       option_of_yojson (value_for_key data_repository_task_paths_of_yojson "Paths") _list path;
     file_system_id = value_for_key file_system_id_of_yojson "FileSystemId" _list path;
     report = value_for_key completion_report_of_yojson "Report" _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     capacity_to_release =
       option_of_yojson (value_for_key capacity_to_release_of_yojson "CapacityToRelease") _list path;
     release_configuration =
       option_of_yojson
         (value_for_key release_configuration_of_yojson "ReleaseConfiguration")
         _list path;
   }
    : create_data_repository_task_request)

let create_data_repository_association_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     association =
       option_of_yojson
         (value_for_key data_repository_association_of_yojson "Association")
         _list path;
   }
    : create_data_repository_association_response)

let create_data_repository_association_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_system_id = value_for_key file_system_id_of_yojson "FileSystemId" _list path;
     file_system_path =
       option_of_yojson (value_for_key namespace_of_yojson "FileSystemPath") _list path;
     data_repository_path = value_for_key archive_path_of_yojson "DataRepositoryPath" _list path;
     batch_import_meta_data_on_create =
       option_of_yojson
         (value_for_key batch_import_meta_data_on_create_of_yojson "BatchImportMetaDataOnCreate")
         _list path;
     imported_file_chunk_size =
       option_of_yojson (value_for_key megabytes_of_yojson "ImportedFileChunkSize") _list path;
     s3 =
       option_of_yojson (value_for_key s3_data_repository_configuration_of_yojson "S3") _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
   }
    : create_data_repository_association_request)

let create_backup_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ backup = option_of_yojson (value_for_key backup_of_yojson "Backup") _list path }
    : create_backup_response)

let create_backup_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_system_id =
       option_of_yojson (value_for_key file_system_id_of_yojson "FileSystemId") _list path;
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     volume_id = option_of_yojson (value_for_key volume_id_of_yojson "VolumeId") _list path;
   }
    : create_backup_request)

let error_code_of_yojson = string_of_yojson

let too_many_access_points_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_code = option_of_yojson (value_for_key error_code_of_yojson "ErrorCode") _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
   }
    : too_many_access_points)

let invalid_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_code = option_of_yojson (value_for_key error_code_of_yojson "ErrorCode") _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
   }
    : invalid_request)

let invalid_access_point_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_code = option_of_yojson (value_for_key error_code_of_yojson "ErrorCode") _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
   }
    : invalid_access_point)

let access_point_already_owned_by_you_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_code = option_of_yojson (value_for_key error_code_of_yojson "ErrorCode") _list path;
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
   }
    : access_point_already_owned_by_you)

let create_and_attach_s3_access_point_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_access_point_attachment =
       option_of_yojson
         (value_for_key s3_access_point_attachment_of_yojson "S3AccessPointAttachment")
         _list path;
   }
    : create_and_attach_s3_access_point_response)

let access_point_policy_of_yojson = string_of_yojson

let create_and_attach_s3_access_point_s3_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vpc_configuration =
       option_of_yojson
         (value_for_key s3_access_point_vpc_configuration_of_yojson "VpcConfiguration")
         _list path;
     policy = option_of_yojson (value_for_key access_point_policy_of_yojson "Policy") _list path;
   }
    : create_and_attach_s3_access_point_s3_configuration)

let create_and_attach_s3_access_point_ontap_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     volume_id = value_for_key volume_id_of_yojson "VolumeId" _list path;
     file_system_identity =
       value_for_key ontap_file_system_identity_of_yojson "FileSystemIdentity" _list path;
   }
    : create_and_attach_s3_access_point_ontap_configuration)

let create_and_attach_s3_access_point_open_zfs_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     volume_id = value_for_key volume_id_of_yojson "VolumeId" _list path;
     file_system_identity =
       value_for_key open_zfs_file_system_identity_of_yojson "FileSystemIdentity" _list path;
   }
    : create_and_attach_s3_access_point_open_zfs_configuration)

let create_and_attach_s3_access_point_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     name = value_for_key s3_access_point_attachment_name_of_yojson "Name" _list path;
     type_ = value_for_key s3_access_point_attachment_type_of_yojson "Type" _list path;
     open_zfs_configuration =
       option_of_yojson
         (value_for_key create_and_attach_s3_access_point_open_zfs_configuration_of_yojson
            "OpenZFSConfiguration")
         _list path;
     ontap_configuration =
       option_of_yojson
         (value_for_key create_and_attach_s3_access_point_ontap_configuration_of_yojson
            "OntapConfiguration")
         _list path;
     s3_access_point =
       option_of_yojson
         (value_for_key create_and_attach_s3_access_point_s3_configuration_of_yojson "S3AccessPoint")
         _list path;
   }
    : create_and_attach_s3_access_point_request)

let copy_snapshot_and_update_volume_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     volume_id = option_of_yojson (value_for_key volume_id_of_yojson "VolumeId") _list path;
     lifecycle = option_of_yojson (value_for_key volume_lifecycle_of_yojson "Lifecycle") _list path;
     administrative_actions =
       option_of_yojson
         (value_for_key administrative_actions_of_yojson "AdministrativeActions")
         _list path;
   }
    : copy_snapshot_and_update_volume_response)

let update_open_zfs_volume_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "DELETE_INTERMEDIATE_SNAPSHOTS" -> DELETE_INTERMEDIATE_SNAPSHOTS
    | `String "DELETE_CLONED_VOLUMES" -> DELETE_CLONED_VOLUMES
    | `String "DELETE_INTERMEDIATE_DATA" -> DELETE_INTERMEDIATE_DATA
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "UpdateOpenZFSVolumeOption" value)
    | _ -> raise (deserialize_wrong_type_error path "UpdateOpenZFSVolumeOption")
     : update_open_zfs_volume_option)
    : update_open_zfs_volume_option)

let update_open_zfs_volume_options_of_yojson tree path =
  list_of_yojson update_open_zfs_volume_option_of_yojson tree path

let copy_snapshot_and_update_volume_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     volume_id = value_for_key volume_id_of_yojson "VolumeId" _list path;
     source_snapshot_ar_n = value_for_key resource_ar_n_of_yojson "SourceSnapshotARN" _list path;
     copy_strategy =
       option_of_yojson (value_for_key open_zfs_copy_strategy_of_yojson "CopyStrategy") _list path;
     options =
       option_of_yojson
         (value_for_key update_open_zfs_volume_options_of_yojson "Options")
         _list path;
   }
    : copy_snapshot_and_update_volume_request)

let source_backup_unavailable_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path;
     backup_id = option_of_yojson (value_for_key backup_id_of_yojson "BackupId") _list path;
   }
    : source_backup_unavailable)

let invalid_source_kms_key_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_source_kms_key)

let invalid_region_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_region)

let invalid_destination_kms_key_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : invalid_destination_kms_key)

let incompatible_region_for_multi_a_z_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : incompatible_region_for_multi_a_z)

let copy_backup_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ backup = option_of_yojson (value_for_key backup_of_yojson "Backup") _list path }
    : copy_backup_response)

let source_backup_id_of_yojson = string_of_yojson

let copy_backup_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     source_backup_id = value_for_key source_backup_id_of_yojson "SourceBackupId" _list path;
     source_region = option_of_yojson (value_for_key region_of_yojson "SourceRegion") _list path;
     kms_key_id = option_of_yojson (value_for_key kms_key_id_of_yojson "KmsKeyId") _list path;
     copy_tags = option_of_yojson (value_for_key flag_of_yojson "CopyTags") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
   }
    : copy_backup_request)

let data_repository_task_ended_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : data_repository_task_ended)

let cancel_data_repository_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     lifecycle =
       option_of_yojson
         (value_for_key data_repository_task_lifecycle_of_yojson "Lifecycle")
         _list path;
     task_id = option_of_yojson (value_for_key task_id_of_yojson "TaskId") _list path;
   }
    : cancel_data_repository_task_response)

let cancel_data_repository_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ task_id = value_for_key task_id_of_yojson "TaskId" _list path }
    : cancel_data_repository_task_request)

let associate_file_system_aliases_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ aliases = option_of_yojson (value_for_key aliases_of_yojson "Aliases") _list path }
    : associate_file_system_aliases_response)

let associate_file_system_aliases_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_request_token =
       option_of_yojson
         (value_for_key client_request_token_of_yojson "ClientRequestToken")
         _list path;
     file_system_id = value_for_key file_system_id_of_yojson "FileSystemId" _list path;
     aliases = value_for_key alternate_dns_names_of_yojson "Aliases" _list path;
   }
    : associate_file_system_aliases_request)
