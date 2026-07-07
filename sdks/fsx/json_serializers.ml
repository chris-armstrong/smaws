open Smaws_Lib.Json.SerializeHelpers
open Types

let flag_to_yojson = bool_to_yojson
let general_ar_n_to_yojson = string_to_yojson

let windows_fsrm_configuration_to_yojson (x : windows_fsrm_configuration) =
  assoc_to_yojson
    [
      ("EventLogDestination", option_to_yojson general_ar_n_to_yojson x.event_log_destination);
      ("FsrmServiceEnabled", Some (flag_to_yojson x.fsrm_service_enabled));
    ]

let directory_id_to_yojson = string_to_yojson
let active_directory_fully_qualified_name_to_yojson = string_to_yojson
let organizational_unit_distinguished_name_to_yojson = string_to_yojson
let file_system_administrators_group_name_to_yojson = string_to_yojson
let directory_user_name_to_yojson = string_to_yojson
let ip_address_to_yojson = string_to_yojson
let dns_ips_to_yojson tree = list_to_yojson ip_address_to_yojson tree
let customer_secrets_manager_ar_n_to_yojson = string_to_yojson

let self_managed_active_directory_attributes_to_yojson
    (x : self_managed_active_directory_attributes) =
  assoc_to_yojson
    [
      ( "DomainJoinServiceAccountSecret",
        option_to_yojson customer_secrets_manager_ar_n_to_yojson
          x.domain_join_service_account_secret );
      ("DnsIps", option_to_yojson dns_ips_to_yojson x.dns_ips);
      ("UserName", option_to_yojson directory_user_name_to_yojson x.user_name);
      ( "FileSystemAdministratorsGroup",
        option_to_yojson file_system_administrators_group_name_to_yojson
          x.file_system_administrators_group );
      ( "OrganizationalUnitDistinguishedName",
        option_to_yojson organizational_unit_distinguished_name_to_yojson
          x.organizational_unit_distinguished_name );
      ("DomainName", option_to_yojson active_directory_fully_qualified_name_to_yojson x.domain_name);
    ]

let windows_deployment_type_to_yojson (x : windows_deployment_type) =
  match x with
  | SINGLE_AZ_2 -> `String "SINGLE_AZ_2"
  | SINGLE_AZ_1 -> `String "SINGLE_AZ_1"
  | MULTI_AZ_1 -> `String "MULTI_AZ_1"

let dns_name_to_yojson = string_to_yojson
let subnet_id_to_yojson = string_to_yojson
let megabytes_per_second_to_yojson = int_to_yojson

let file_system_maintenance_operation_to_yojson (x : file_system_maintenance_operation) =
  match x with BACKING_UP -> `String "BACKING_UP" | PATCHING -> `String "PATCHING"

let file_system_maintenance_operations_to_yojson tree =
  list_to_yojson file_system_maintenance_operation_to_yojson tree

let weekly_time_to_yojson = string_to_yojson
let daily_time_to_yojson = string_to_yojson
let automatic_backup_retention_days_to_yojson = int_to_yojson
let alternate_dns_name_to_yojson = string_to_yojson

let alias_lifecycle_to_yojson (x : alias_lifecycle) =
  match x with
  | DELETE_FAILED -> `String "DELETE_FAILED"
  | CREATE_FAILED -> `String "CREATE_FAILED"
  | DELETING -> `String "DELETING"
  | CREATING -> `String "CREATING"
  | AVAILABLE -> `String "AVAILABLE"

let alias_to_yojson (x : alias) =
  assoc_to_yojson
    [
      ("Lifecycle", option_to_yojson alias_lifecycle_to_yojson x.lifecycle);
      ("Name", option_to_yojson alternate_dns_name_to_yojson x.name);
    ]

let aliases_to_yojson tree = list_to_yojson alias_to_yojson tree

let windows_access_audit_log_level_to_yojson (x : windows_access_audit_log_level) =
  match x with
  | SUCCESS_AND_FAILURE -> `String "SUCCESS_AND_FAILURE"
  | FAILURE_ONLY -> `String "FAILURE_ONLY"
  | SUCCESS_ONLY -> `String "SUCCESS_ONLY"
  | DISABLED -> `String "DISABLED"

let windows_audit_log_configuration_to_yojson (x : windows_audit_log_configuration) =
  assoc_to_yojson
    [
      ("AuditLogDestination", option_to_yojson general_ar_n_to_yojson x.audit_log_destination);
      ( "FileShareAccessAuditLogLevel",
        Some (windows_access_audit_log_level_to_yojson x.file_share_access_audit_log_level) );
      ( "FileAccessAuditLogLevel",
        Some (windows_access_audit_log_level_to_yojson x.file_access_audit_log_level) );
    ]

let disk_iops_configuration_mode_to_yojson (x : disk_iops_configuration_mode) =
  match x with USER_PROVISIONED -> `String "USER_PROVISIONED" | AUTOMATIC -> `String "AUTOMATIC"

let iops_to_yojson = long_to_yojson

let disk_iops_configuration_to_yojson (x : disk_iops_configuration) =
  assoc_to_yojson
    [
      ("Iops", option_to_yojson iops_to_yojson x.iops);
      ("Mode", option_to_yojson disk_iops_configuration_mode_to_yojson x.mode);
    ]

let windows_file_system_configuration_to_yojson (x : windows_file_system_configuration) =
  assoc_to_yojson
    [
      ( "FsrmConfiguration",
        option_to_yojson windows_fsrm_configuration_to_yojson x.fsrm_configuration );
      ("PreferredFileServerIpv6", option_to_yojson ip_address_to_yojson x.preferred_file_server_ipv6);
      ( "DiskIopsConfiguration",
        option_to_yojson disk_iops_configuration_to_yojson x.disk_iops_configuration );
      ( "AuditLogConfiguration",
        option_to_yojson windows_audit_log_configuration_to_yojson x.audit_log_configuration );
      ("Aliases", option_to_yojson aliases_to_yojson x.aliases);
      ("CopyTagsToBackups", option_to_yojson flag_to_yojson x.copy_tags_to_backups);
      ( "AutomaticBackupRetentionDays",
        option_to_yojson automatic_backup_retention_days_to_yojson x.automatic_backup_retention_days
      );
      ( "DailyAutomaticBackupStartTime",
        option_to_yojson daily_time_to_yojson x.daily_automatic_backup_start_time );
      ( "WeeklyMaintenanceStartTime",
        option_to_yojson weekly_time_to_yojson x.weekly_maintenance_start_time );
      ( "MaintenanceOperationsInProgress",
        option_to_yojson file_system_maintenance_operations_to_yojson
          x.maintenance_operations_in_progress );
      ("ThroughputCapacity", option_to_yojson megabytes_per_second_to_yojson x.throughput_capacity);
      ("PreferredFileServerIp", option_to_yojson ip_address_to_yojson x.preferred_file_server_ip);
      ("PreferredSubnetId", option_to_yojson subnet_id_to_yojson x.preferred_subnet_id);
      ( "RemoteAdministrationEndpoint",
        option_to_yojson dns_name_to_yojson x.remote_administration_endpoint );
      ("DeploymentType", option_to_yojson windows_deployment_type_to_yojson x.deployment_type);
      ( "SelfManagedActiveDirectoryConfiguration",
        option_to_yojson self_managed_active_directory_attributes_to_yojson
          x.self_managed_active_directory_configuration );
      ("ActiveDirectoryId", option_to_yojson directory_id_to_yojson x.active_directory_id);
    ]

let windows_audit_log_create_configuration_to_yojson (x : windows_audit_log_create_configuration) =
  assoc_to_yojson
    [
      ("AuditLogDestination", option_to_yojson general_ar_n_to_yojson x.audit_log_destination);
      ( "FileShareAccessAuditLogLevel",
        Some (windows_access_audit_log_level_to_yojson x.file_share_access_audit_log_level) );
      ( "FileAccessAuditLogLevel",
        Some (windows_access_audit_log_level_to_yojson x.file_access_audit_log_level) );
    ]

let vpc_id_to_yojson = string_to_yojson
let creation_time_to_yojson = timestamp_epoch_seconds_to_yojson
let file_system_id_to_yojson = string_to_yojson

let volume_lifecycle_to_yojson (x : volume_lifecycle) =
  match x with
  | AVAILABLE -> `String "AVAILABLE"
  | PENDING -> `String "PENDING"
  | MISCONFIGURED -> `String "MISCONFIGURED"
  | FAILED -> `String "FAILED"
  | DELETING -> `String "DELETING"
  | CREATED -> `String "CREATED"
  | CREATING -> `String "CREATING"

let volume_name_to_yojson = string_to_yojson

let flex_cache_endpoint_type_to_yojson (x : flex_cache_endpoint_type) =
  match x with CACHE -> `String "CACHE" | ORIGIN -> `String "ORIGIN" | NONE -> `String "NONE"

let junction_path_to_yojson = string_to_yojson

let security_style_to_yojson (x : security_style) =
  match x with MIXED -> `String "MIXED" | NTFS -> `String "NTFS" | UNIX -> `String "UNIX"

let volume_capacity_to_yojson = int_to_yojson
let storage_virtual_machine_id_to_yojson = string_to_yojson
let cooling_period_to_yojson = int_to_yojson

let tiering_policy_name_to_yojson (x : tiering_policy_name) =
  match x with
  | NONE -> `String "NONE"
  | ALL -> `String "ALL"
  | AUTO -> `String "AUTO"
  | SNAPSHOT_ONLY -> `String "SNAPSHOT_ONLY"

let tiering_policy_to_yojson (x : tiering_policy) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson tiering_policy_name_to_yojson x.name);
      ("CoolingPeriod", option_to_yojson cooling_period_to_yojson x.cooling_period);
    ]

let uui_d_to_yojson = string_to_yojson

let ontap_volume_type_to_yojson (x : ontap_volume_type) =
  match x with LS -> `String "LS" | DP -> `String "DP" | RW -> `String "RW"

let snapshot_policy_to_yojson = string_to_yojson

let autocommit_period_type_to_yojson (x : autocommit_period_type) =
  match x with
  | NONE -> `String "NONE"
  | YEARS -> `String "YEARS"
  | MONTHS -> `String "MONTHS"
  | DAYS -> `String "DAYS"
  | HOURS -> `String "HOURS"
  | MINUTES -> `String "MINUTES"

let autocommit_period_value_to_yojson = int_to_yojson

let autocommit_period_to_yojson (x : autocommit_period) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson autocommit_period_value_to_yojson x.value);
      ("Type", Some (autocommit_period_type_to_yojson x.type_));
    ]

let privileged_delete_to_yojson (x : privileged_delete) =
  match x with
  | PERMANENTLY_DISABLED -> `String "PERMANENTLY_DISABLED"
  | ENABLED -> `String "ENABLED"
  | DISABLED -> `String "DISABLED"

let retention_period_type_to_yojson (x : retention_period_type) =
  match x with
  | UNSPECIFIED -> `String "UNSPECIFIED"
  | INFINITE -> `String "INFINITE"
  | YEARS -> `String "YEARS"
  | MONTHS -> `String "MONTHS"
  | DAYS -> `String "DAYS"
  | HOURS -> `String "HOURS"
  | MINUTES -> `String "MINUTES"
  | SECONDS -> `String "SECONDS"

let retention_period_value_to_yojson = int_to_yojson

let retention_period_to_yojson (x : retention_period) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson retention_period_value_to_yojson x.value);
      ("Type", Some (retention_period_type_to_yojson x.type_));
    ]

let snaplock_retention_period_to_yojson (x : snaplock_retention_period) =
  assoc_to_yojson
    [
      ("MaximumRetention", Some (retention_period_to_yojson x.maximum_retention));
      ("MinimumRetention", Some (retention_period_to_yojson x.minimum_retention));
      ("DefaultRetention", Some (retention_period_to_yojson x.default_retention));
    ]

let snaplock_type_to_yojson (x : snaplock_type) =
  match x with ENTERPRISE -> `String "ENTERPRISE" | COMPLIANCE -> `String "COMPLIANCE"

let snaplock_configuration_to_yojson (x : snaplock_configuration) =
  assoc_to_yojson
    [
      ("VolumeAppendModeEnabled", option_to_yojson flag_to_yojson x.volume_append_mode_enabled);
      ("SnaplockType", option_to_yojson snaplock_type_to_yojson x.snaplock_type);
      ("RetentionPeriod", option_to_yojson snaplock_retention_period_to_yojson x.retention_period);
      ("PrivilegedDelete", option_to_yojson privileged_delete_to_yojson x.privileged_delete);
      ("AutocommitPeriod", option_to_yojson autocommit_period_to_yojson x.autocommit_period);
      ("AuditLogVolume", option_to_yojson flag_to_yojson x.audit_log_volume);
    ]

let volume_style_to_yojson (x : volume_style) =
  match x with FLEXGROUP -> `String "FLEXGROUP" | FLEXVOL -> `String "FLEXVOL"

let aggregate_to_yojson = string_to_yojson
let aggregates_to_yojson tree = list_to_yojson aggregate_to_yojson tree
let total_constituents_to_yojson = int_to_yojson

let aggregate_configuration_to_yojson (x : aggregate_configuration) =
  assoc_to_yojson
    [
      ("TotalConstituents", option_to_yojson total_constituents_to_yojson x.total_constituents);
      ("Aggregates", option_to_yojson aggregates_to_yojson x.aggregates);
    ]

let volume_capacity_bytes_to_yojson = long_to_yojson

let ontap_volume_configuration_to_yojson (x : ontap_volume_configuration) =
  assoc_to_yojson
    [
      ("SizeInBytes", option_to_yojson volume_capacity_bytes_to_yojson x.size_in_bytes);
      ( "AggregateConfiguration",
        option_to_yojson aggregate_configuration_to_yojson x.aggregate_configuration );
      ("VolumeStyle", option_to_yojson volume_style_to_yojson x.volume_style);
      ( "SnaplockConfiguration",
        option_to_yojson snaplock_configuration_to_yojson x.snaplock_configuration );
      ("CopyTagsToBackups", option_to_yojson flag_to_yojson x.copy_tags_to_backups);
      ("SnapshotPolicy", option_to_yojson snapshot_policy_to_yojson x.snapshot_policy);
      ("OntapVolumeType", option_to_yojson ontap_volume_type_to_yojson x.ontap_volume_type);
      ("UUID", option_to_yojson uui_d_to_yojson x.uui_d);
      ("TieringPolicy", option_to_yojson tiering_policy_to_yojson x.tiering_policy);
      ("StorageVirtualMachineRoot", option_to_yojson flag_to_yojson x.storage_virtual_machine_root);
      ( "StorageVirtualMachineId",
        option_to_yojson storage_virtual_machine_id_to_yojson x.storage_virtual_machine_id );
      ("StorageEfficiencyEnabled", option_to_yojson flag_to_yojson x.storage_efficiency_enabled);
      ("SizeInMegabytes", option_to_yojson volume_capacity_to_yojson x.size_in_megabytes);
      ("SecurityStyle", option_to_yojson security_style_to_yojson x.security_style);
      ("JunctionPath", option_to_yojson junction_path_to_yojson x.junction_path);
      ( "FlexCacheEndpointType",
        option_to_yojson flex_cache_endpoint_type_to_yojson x.flex_cache_endpoint_type );
    ]

let resource_ar_n_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Value", Some (tag_value_to_yojson x.value)); ("Key", Some (tag_key_to_yojson x.key)) ]

let tags_to_yojson tree = list_to_yojson tag_to_yojson tree
let volume_id_to_yojson = string_to_yojson

let volume_type_to_yojson (x : volume_type) =
  match x with OPENZFS -> `String "OPENZFS" | ONTAP -> `String "ONTAP"

let error_message_to_yojson = string_to_yojson

let lifecycle_transition_reason_to_yojson (x : lifecycle_transition_reason) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let administrative_action_type_to_yojson (x : administrative_action_type) =
  match x with
  | DOWNLOAD_DATA_FROM_BACKUP -> `String "DOWNLOAD_DATA_FROM_BACKUP"
  | VOLUME_INITIALIZE_WITH_SNAPSHOT -> `String "VOLUME_INITIALIZE_WITH_SNAPSHOT"
  | VOLUME_UPDATE_WITH_SNAPSHOT -> `String "VOLUME_UPDATE_WITH_SNAPSHOT"
  | MISCONFIGURED_STATE_RECOVERY -> `String "MISCONFIGURED_STATE_RECOVERY"
  | STORAGE_TYPE_OPTIMIZATION -> `String "STORAGE_TYPE_OPTIMIZATION"
  | IOPS_OPTIMIZATION -> `String "IOPS_OPTIMIZATION"
  | THROUGHPUT_OPTIMIZATION -> `String "THROUGHPUT_OPTIMIZATION"
  | VOLUME_RESTORE -> `String "VOLUME_RESTORE"
  | RELEASE_NFS_V3_LOCKS -> `String "RELEASE_NFS_V3_LOCKS"
  | SNAPSHOT_UPDATE -> `String "SNAPSHOT_UPDATE"
  | VOLUME_UPDATE -> `String "VOLUME_UPDATE"
  | FILE_SYSTEM_ALIAS_DISASSOCIATION -> `String "FILE_SYSTEM_ALIAS_DISASSOCIATION"
  | FILE_SYSTEM_ALIAS_ASSOCIATION -> `String "FILE_SYSTEM_ALIAS_ASSOCIATION"
  | STORAGE_OPTIMIZATION -> `String "STORAGE_OPTIMIZATION"
  | FILE_SYSTEM_UPDATE -> `String "FILE_SYSTEM_UPDATE"

let progress_percent_to_yojson = int_to_yojson
let request_time_to_yojson = timestamp_epoch_seconds_to_yojson

let status_to_yojson (x : status) =
  match x with
  | CANCELLED -> `String "CANCELLED"
  | PAUSED -> `String "PAUSED"
  | OPTIMIZING -> `String "OPTIMIZING"
  | UPDATED_OPTIMIZING -> `String "UPDATED_OPTIMIZING"
  | COMPLETED -> `String "COMPLETED"
  | PENDING -> `String "PENDING"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | FAILED -> `String "FAILED"

let aws_account_id_to_yojson = string_to_yojson

let file_system_type_to_yojson (x : file_system_type) =
  match x with
  | OPENZFS -> `String "OPENZFS"
  | ONTAP -> `String "ONTAP"
  | LUSTRE -> `String "LUSTRE"
  | WINDOWS -> `String "WINDOWS"

let file_system_lifecycle_to_yojson (x : file_system_lifecycle) =
  match x with
  | MISCONFIGURED_UNAVAILABLE -> `String "MISCONFIGURED_UNAVAILABLE"
  | UPDATING -> `String "UPDATING"
  | MISCONFIGURED -> `String "MISCONFIGURED"
  | DELETING -> `String "DELETING"
  | FAILED -> `String "FAILED"
  | CREATING -> `String "CREATING"
  | AVAILABLE -> `String "AVAILABLE"

let file_system_failure_details_to_yojson (x : file_system_failure_details) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let storage_capacity_to_yojson = int_to_yojson

let storage_type_to_yojson (x : storage_type) =
  match x with
  | INTELLIGENT_TIERING -> `String "INTELLIGENT_TIERING"
  | HDD -> `String "HDD"
  | SSD -> `String "SSD"

let subnet_ids_to_yojson tree = list_to_yojson subnet_id_to_yojson tree
let network_interface_id_to_yojson = string_to_yojson
let network_interface_ids_to_yojson tree = list_to_yojson network_interface_id_to_yojson tree
let kms_key_id_to_yojson = string_to_yojson

let data_repository_lifecycle_to_yojson (x : data_repository_lifecycle) =
  match x with
  | FAILED -> `String "FAILED"
  | DELETING -> `String "DELETING"
  | UPDATING -> `String "UPDATING"
  | MISCONFIGURED -> `String "MISCONFIGURED"
  | AVAILABLE -> `String "AVAILABLE"
  | CREATING -> `String "CREATING"

let archive_path_to_yojson = string_to_yojson
let megabytes_to_yojson = int_to_yojson

let auto_import_policy_type_to_yojson (x : auto_import_policy_type) =
  match x with
  | NEW_CHANGED_DELETED -> `String "NEW_CHANGED_DELETED"
  | NEW_CHANGED -> `String "NEW_CHANGED"
  | NEW -> `String "NEW"
  | NONE -> `String "NONE"

let data_repository_failure_details_to_yojson (x : data_repository_failure_details) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let data_repository_configuration_to_yojson (x : data_repository_configuration) =
  assoc_to_yojson
    [
      ( "FailureDetails",
        option_to_yojson data_repository_failure_details_to_yojson x.failure_details );
      ("AutoImportPolicy", option_to_yojson auto_import_policy_type_to_yojson x.auto_import_policy);
      ("ImportedFileChunkSize", option_to_yojson megabytes_to_yojson x.imported_file_chunk_size);
      ("ExportPath", option_to_yojson archive_path_to_yojson x.export_path);
      ("ImportPath", option_to_yojson archive_path_to_yojson x.import_path);
      ("Lifecycle", option_to_yojson data_repository_lifecycle_to_yojson x.lifecycle);
    ]

let lustre_deployment_type_to_yojson (x : lustre_deployment_type) =
  match x with
  | PERSISTENT_2 -> `String "PERSISTENT_2"
  | PERSISTENT_1 -> `String "PERSISTENT_1"
  | SCRATCH_2 -> `String "SCRATCH_2"
  | SCRATCH_1 -> `String "SCRATCH_1"

let per_unit_storage_throughput_to_yojson = int_to_yojson
let lustre_file_system_mount_name_to_yojson = string_to_yojson

let drive_cache_type_to_yojson (x : drive_cache_type) =
  match x with READ -> `String "READ" | NONE -> `String "NONE"

let data_compression_type_to_yojson (x : data_compression_type) =
  match x with LZ4 -> `String "LZ4" | NONE -> `String "NONE"

let lustre_access_audit_log_level_to_yojson (x : lustre_access_audit_log_level) =
  match x with
  | WARN_ERROR -> `String "WARN_ERROR"
  | ERROR_ONLY -> `String "ERROR_ONLY"
  | WARN_ONLY -> `String "WARN_ONLY"
  | DISABLED -> `String "DISABLED"

let lustre_log_configuration_to_yojson (x : lustre_log_configuration) =
  assoc_to_yojson
    [
      ("Destination", option_to_yojson general_ar_n_to_yojson x.destination);
      ("Level", Some (lustre_access_audit_log_level_to_yojson x.level));
    ]

let lustre_root_squash_to_yojson = string_to_yojson
let lustre_no_squash_nid_to_yojson = string_to_yojson
let lustre_no_squash_nids_to_yojson tree = list_to_yojson lustre_no_squash_nid_to_yojson tree

let lustre_root_squash_configuration_to_yojson (x : lustre_root_squash_configuration) =
  assoc_to_yojson
    [
      ("NoSquashNids", option_to_yojson lustre_no_squash_nids_to_yojson x.no_squash_nids);
      ("RootSquash", option_to_yojson lustre_root_squash_to_yojson x.root_squash);
    ]

let metadata_iops_to_yojson = int_to_yojson

let metadata_configuration_mode_to_yojson (x : metadata_configuration_mode) =
  match x with USER_PROVISIONED -> `String "USER_PROVISIONED" | AUTOMATIC -> `String "AUTOMATIC"

let file_system_lustre_metadata_configuration_to_yojson
    (x : file_system_lustre_metadata_configuration) =
  assoc_to_yojson
    [
      ("Mode", Some (metadata_configuration_mode_to_yojson x.mode));
      ("Iops", option_to_yojson metadata_iops_to_yojson x.iops);
    ]

let throughput_capacity_mbps_to_yojson = int_to_yojson

let lustre_read_cache_sizing_mode_to_yojson (x : lustre_read_cache_sizing_mode) =
  match x with
  | PROPORTIONAL_TO_THROUGHPUT_CAPACITY -> `String "PROPORTIONAL_TO_THROUGHPUT_CAPACITY"
  | USER_PROVISIONED -> `String "USER_PROVISIONED"
  | NO_CACHE -> `String "NO_CACHE"

let lustre_read_cache_configuration_to_yojson (x : lustre_read_cache_configuration) =
  assoc_to_yojson
    [
      ("SizeGiB", option_to_yojson storage_capacity_to_yojson x.size_gi_b);
      ("SizingMode", option_to_yojson lustre_read_cache_sizing_mode_to_yojson x.sizing_mode);
    ]

let lustre_file_system_configuration_to_yojson (x : lustre_file_system_configuration) =
  assoc_to_yojson
    [
      ( "DataReadCacheConfiguration",
        option_to_yojson lustre_read_cache_configuration_to_yojson x.data_read_cache_configuration
      );
      ( "ThroughputCapacity",
        option_to_yojson throughput_capacity_mbps_to_yojson x.throughput_capacity );
      ("EfaEnabled", option_to_yojson flag_to_yojson x.efa_enabled);
      ( "MetadataConfiguration",
        option_to_yojson file_system_lustre_metadata_configuration_to_yojson
          x.metadata_configuration );
      ( "RootSquashConfiguration",
        option_to_yojson lustre_root_squash_configuration_to_yojson x.root_squash_configuration );
      ("LogConfiguration", option_to_yojson lustre_log_configuration_to_yojson x.log_configuration);
      ( "DataCompressionType",
        option_to_yojson data_compression_type_to_yojson x.data_compression_type );
      ("DriveCacheType", option_to_yojson drive_cache_type_to_yojson x.drive_cache_type);
      ("CopyTagsToBackups", option_to_yojson flag_to_yojson x.copy_tags_to_backups);
      ( "AutomaticBackupRetentionDays",
        option_to_yojson automatic_backup_retention_days_to_yojson x.automatic_backup_retention_days
      );
      ( "DailyAutomaticBackupStartTime",
        option_to_yojson daily_time_to_yojson x.daily_automatic_backup_start_time );
      ("MountName", option_to_yojson lustre_file_system_mount_name_to_yojson x.mount_name);
      ( "PerUnitStorageThroughput",
        option_to_yojson per_unit_storage_throughput_to_yojson x.per_unit_storage_throughput );
      ("DeploymentType", option_to_yojson lustre_deployment_type_to_yojson x.deployment_type);
      ( "DataRepositoryConfiguration",
        option_to_yojson data_repository_configuration_to_yojson x.data_repository_configuration );
      ( "WeeklyMaintenanceStartTime",
        option_to_yojson weekly_time_to_yojson x.weekly_maintenance_start_time );
    ]

let ontap_deployment_type_to_yojson (x : ontap_deployment_type) =
  match x with
  | MULTI_AZ_2 -> `String "MULTI_AZ_2"
  | SINGLE_AZ_2 -> `String "SINGLE_AZ_2"
  | SINGLE_AZ_1 -> `String "SINGLE_AZ_1"
  | MULTI_AZ_1 -> `String "MULTI_AZ_1"

let ip_address_range_to_yojson = string_to_yojson
let ontap_endpoint_ip_addresses_to_yojson tree = list_to_yojson ip_address_to_yojson tree

let file_system_endpoint_to_yojson (x : file_system_endpoint) =
  assoc_to_yojson
    [
      ("Ipv6Addresses", option_to_yojson ontap_endpoint_ip_addresses_to_yojson x.ipv6_addresses);
      ("IpAddresses", option_to_yojson ontap_endpoint_ip_addresses_to_yojson x.ip_addresses);
      ("DNSName", option_to_yojson dns_name_to_yojson x.dns_name);
    ]

let file_system_endpoints_to_yojson (x : file_system_endpoints) =
  assoc_to_yojson
    [
      ("Management", option_to_yojson file_system_endpoint_to_yojson x.management);
      ("Intercluster", option_to_yojson file_system_endpoint_to_yojson x.intercluster);
    ]

let route_table_id_to_yojson = string_to_yojson
let route_table_ids_to_yojson tree = list_to_yojson route_table_id_to_yojson tree
let admin_password_to_yojson = string_to_yojson
let ha_pairs_to_yojson = int_to_yojson
let throughput_capacity_per_ha_pair_to_yojson = int_to_yojson
let ipv6_address_range_to_yojson = string_to_yojson

let ontap_file_system_configuration_to_yojson (x : ontap_file_system_configuration) =
  assoc_to_yojson
    [
      ( "EndpointIpv6AddressRange",
        option_to_yojson ipv6_address_range_to_yojson x.endpoint_ipv6_address_range );
      ( "ThroughputCapacityPerHAPair",
        option_to_yojson throughput_capacity_per_ha_pair_to_yojson x.throughput_capacity_per_ha_pair
      );
      ("HAPairs", option_to_yojson ha_pairs_to_yojson x.ha_pairs);
      ("FsxAdminPassword", option_to_yojson admin_password_to_yojson x.fsx_admin_password);
      ( "WeeklyMaintenanceStartTime",
        option_to_yojson weekly_time_to_yojson x.weekly_maintenance_start_time );
      ("ThroughputCapacity", option_to_yojson megabytes_per_second_to_yojson x.throughput_capacity);
      ("RouteTableIds", option_to_yojson route_table_ids_to_yojson x.route_table_ids);
      ("PreferredSubnetId", option_to_yojson subnet_id_to_yojson x.preferred_subnet_id);
      ( "DiskIopsConfiguration",
        option_to_yojson disk_iops_configuration_to_yojson x.disk_iops_configuration );
      ("Endpoints", option_to_yojson file_system_endpoints_to_yojson x.endpoints);
      ( "EndpointIpAddressRange",
        option_to_yojson ip_address_range_to_yojson x.endpoint_ip_address_range );
      ("DeploymentType", option_to_yojson ontap_deployment_type_to_yojson x.deployment_type);
      ( "DailyAutomaticBackupStartTime",
        option_to_yojson daily_time_to_yojson x.daily_automatic_backup_start_time );
      ( "AutomaticBackupRetentionDays",
        option_to_yojson automatic_backup_retention_days_to_yojson x.automatic_backup_retention_days
      );
    ]

let file_system_type_version_to_yojson = string_to_yojson

let open_zfs_deployment_type_to_yojson (x : open_zfs_deployment_type) =
  match x with
  | MULTI_AZ_1 -> `String "MULTI_AZ_1"
  | SINGLE_AZ_HA_2 -> `String "SINGLE_AZ_HA_2"
  | SINGLE_AZ_HA_1 -> `String "SINGLE_AZ_HA_1"
  | SINGLE_AZ_2 -> `String "SINGLE_AZ_2"
  | SINGLE_AZ_1 -> `String "SINGLE_AZ_1"

let open_zfs_read_cache_sizing_mode_to_yojson (x : open_zfs_read_cache_sizing_mode) =
  match x with
  | PROPORTIONAL_TO_THROUGHPUT_CAPACITY -> `String "PROPORTIONAL_TO_THROUGHPUT_CAPACITY"
  | USER_PROVISIONED -> `String "USER_PROVISIONED"
  | NO_CACHE -> `String "NO_CACHE"

let open_zfs_read_cache_configuration_to_yojson (x : open_zfs_read_cache_configuration) =
  assoc_to_yojson
    [
      ("SizeGiB", option_to_yojson storage_capacity_to_yojson x.size_gi_b);
      ("SizingMode", option_to_yojson open_zfs_read_cache_sizing_mode_to_yojson x.sizing_mode);
    ]

let open_zfs_file_system_configuration_to_yojson (x : open_zfs_file_system_configuration) =
  assoc_to_yojson
    [
      ( "ReadCacheConfiguration",
        option_to_yojson open_zfs_read_cache_configuration_to_yojson x.read_cache_configuration );
      ("EndpointIpv6Address", option_to_yojson ip_address_to_yojson x.endpoint_ipv6_address);
      ("EndpointIpAddress", option_to_yojson ip_address_to_yojson x.endpoint_ip_address);
      ("RouteTableIds", option_to_yojson route_table_ids_to_yojson x.route_table_ids);
      ( "EndpointIpv6AddressRange",
        option_to_yojson ipv6_address_range_to_yojson x.endpoint_ipv6_address_range );
      ( "EndpointIpAddressRange",
        option_to_yojson ip_address_range_to_yojson x.endpoint_ip_address_range );
      ("PreferredSubnetId", option_to_yojson subnet_id_to_yojson x.preferred_subnet_id);
      ("RootVolumeId", option_to_yojson volume_id_to_yojson x.root_volume_id);
      ( "DiskIopsConfiguration",
        option_to_yojson disk_iops_configuration_to_yojson x.disk_iops_configuration );
      ( "WeeklyMaintenanceStartTime",
        option_to_yojson weekly_time_to_yojson x.weekly_maintenance_start_time );
      ("ThroughputCapacity", option_to_yojson megabytes_per_second_to_yojson x.throughput_capacity);
      ("DeploymentType", option_to_yojson open_zfs_deployment_type_to_yojson x.deployment_type);
      ( "DailyAutomaticBackupStartTime",
        option_to_yojson daily_time_to_yojson x.daily_automatic_backup_start_time );
      ("CopyTagsToVolumes", option_to_yojson flag_to_yojson x.copy_tags_to_volumes);
      ("CopyTagsToBackups", option_to_yojson flag_to_yojson x.copy_tags_to_backups);
      ( "AutomaticBackupRetentionDays",
        option_to_yojson automatic_backup_retention_days_to_yojson x.automatic_backup_retention_days
      );
    ]

let network_type_to_yojson (x : network_type) =
  match x with DUAL -> `String "DUAL" | IPV4 -> `String "IPV4"

let administrative_action_failure_details_to_yojson (x : administrative_action_failure_details) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let snapshot_id_to_yojson = string_to_yojson
let snapshot_name_to_yojson = string_to_yojson

let snapshot_lifecycle_to_yojson (x : snapshot_lifecycle) =
  match x with
  | AVAILABLE -> `String "AVAILABLE"
  | DELETING -> `String "DELETING"
  | CREATING -> `String "CREATING"
  | PENDING -> `String "PENDING"

let total_transfer_bytes_to_yojson = long_to_yojson
let remaining_transfer_bytes_to_yojson = long_to_yojson
let volume_path_to_yojson = string_to_yojson
let integer_no_max_to_yojson = int_to_yojson
let integer_record_size_ki_b_to_yojson = int_to_yojson

let open_zfs_data_compression_type_to_yojson (x : open_zfs_data_compression_type) =
  match x with LZ4 -> `String "LZ4" | ZSTD -> `String "ZSTD" | NONE -> `String "NONE"

let open_zfs_copy_strategy_to_yojson (x : open_zfs_copy_strategy) =
  match x with
  | INCREMENTAL_COPY -> `String "INCREMENTAL_COPY"
  | FULL_COPY -> `String "FULL_COPY"
  | CLONE -> `String "CLONE"

let open_zfs_origin_snapshot_configuration_to_yojson (x : open_zfs_origin_snapshot_configuration) =
  assoc_to_yojson
    [
      ("CopyStrategy", option_to_yojson open_zfs_copy_strategy_to_yojson x.copy_strategy);
      ("SnapshotARN", option_to_yojson resource_ar_n_to_yojson x.snapshot_ar_n);
    ]

let read_only_to_yojson = bool_to_yojson
let open_zfs_clients_to_yojson = string_to_yojson
let open_zfs_nfs_export_option_to_yojson = string_to_yojson

let open_zfs_nfs_export_options_to_yojson tree =
  list_to_yojson open_zfs_nfs_export_option_to_yojson tree

let open_zfs_client_configuration_to_yojson (x : open_zfs_client_configuration) =
  assoc_to_yojson
    [
      ("Options", Some (open_zfs_nfs_export_options_to_yojson x.options));
      ("Clients", Some (open_zfs_clients_to_yojson x.clients));
    ]

let open_zfs_client_configurations_to_yojson tree =
  list_to_yojson open_zfs_client_configuration_to_yojson tree

let open_zfs_nfs_export_to_yojson (x : open_zfs_nfs_export) =
  assoc_to_yojson
    [
      ( "ClientConfigurations",
        Some (open_zfs_client_configurations_to_yojson x.client_configurations) );
    ]

let open_zfs_nfs_exports_to_yojson tree = list_to_yojson open_zfs_nfs_export_to_yojson tree

let open_zfs_quota_type_to_yojson (x : open_zfs_quota_type) =
  match x with GROUP -> `String "GROUP" | USER -> `String "USER"

let open_zfs_user_or_group_quota_to_yojson (x : open_zfs_user_or_group_quota) =
  assoc_to_yojson
    [
      ("StorageCapacityQuotaGiB", Some (integer_no_max_to_yojson x.storage_capacity_quota_gi_b));
      ("Id", Some (integer_no_max_to_yojson x.id));
      ("Type", Some (open_zfs_quota_type_to_yojson x.type_));
    ]

let open_zfs_user_and_group_quotas_to_yojson tree =
  list_to_yojson open_zfs_user_or_group_quota_to_yojson tree

let open_zfs_volume_configuration_to_yojson (x : open_zfs_volume_configuration) =
  assoc_to_yojson
    [
      ("CopyStrategy", option_to_yojson open_zfs_copy_strategy_to_yojson x.copy_strategy);
      ("DestinationSnapshot", option_to_yojson snapshot_id_to_yojson x.destination_snapshot);
      ("SourceSnapshotARN", option_to_yojson resource_ar_n_to_yojson x.source_snapshot_ar_n);
      ("DeleteIntermediateData", option_to_yojson flag_to_yojson x.delete_intermediate_data);
      ("DeleteClonedVolumes", option_to_yojson flag_to_yojson x.delete_cloned_volumes);
      ("DeleteIntermediateSnaphots", option_to_yojson flag_to_yojson x.delete_intermediate_snaphots);
      ("RestoreToSnapshot", option_to_yojson snapshot_id_to_yojson x.restore_to_snapshot);
      ( "UserAndGroupQuotas",
        option_to_yojson open_zfs_user_and_group_quotas_to_yojson x.user_and_group_quotas );
      ("NfsExports", option_to_yojson open_zfs_nfs_exports_to_yojson x.nfs_exports);
      ("ReadOnly", option_to_yojson read_only_to_yojson x.read_only);
      ( "OriginSnapshot",
        option_to_yojson open_zfs_origin_snapshot_configuration_to_yojson x.origin_snapshot );
      ("CopyTagsToSnapshots", option_to_yojson flag_to_yojson x.copy_tags_to_snapshots);
      ( "DataCompressionType",
        option_to_yojson open_zfs_data_compression_type_to_yojson x.data_compression_type );
      ("RecordSizeKiB", option_to_yojson integer_record_size_ki_b_to_yojson x.record_size_ki_b);
      ( "StorageCapacityQuotaGiB",
        option_to_yojson integer_no_max_to_yojson x.storage_capacity_quota_gi_b );
      ( "StorageCapacityReservationGiB",
        option_to_yojson integer_no_max_to_yojson x.storage_capacity_reservation_gi_b );
      ("VolumePath", option_to_yojson volume_path_to_yojson x.volume_path);
      ("ParentVolumeId", option_to_yojson volume_id_to_yojson x.parent_volume_id);
    ]

let rec administrative_action_to_yojson (x : administrative_action) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ( "RemainingTransferBytes",
        option_to_yojson remaining_transfer_bytes_to_yojson x.remaining_transfer_bytes );
      ("TotalTransferBytes", option_to_yojson total_transfer_bytes_to_yojson x.total_transfer_bytes);
      ("TargetSnapshotValues", option_to_yojson snapshot_to_yojson x.target_snapshot_values);
      ("TargetVolumeValues", option_to_yojson volume_to_yojson x.target_volume_values);
      ( "FailureDetails",
        option_to_yojson administrative_action_failure_details_to_yojson x.failure_details );
      ("TargetFileSystemValues", option_to_yojson file_system_to_yojson x.target_file_system_values);
      ("Status", option_to_yojson status_to_yojson x.status);
      ("RequestTime", option_to_yojson request_time_to_yojson x.request_time);
      ("ProgressPercent", option_to_yojson progress_percent_to_yojson x.progress_percent);
      ( "AdministrativeActionType",
        option_to_yojson administrative_action_type_to_yojson x.administrative_action_type );
    ]

and administrative_actions_to_yojson tree = list_to_yojson administrative_action_to_yojson tree

and file_system_to_yojson (x : file_system) =
  assoc_to_yojson
    [
      ("NetworkType", option_to_yojson network_type_to_yojson x.network_type);
      ( "OpenZFSConfiguration",
        option_to_yojson open_zfs_file_system_configuration_to_yojson x.open_zfs_configuration );
      ( "FileSystemTypeVersion",
        option_to_yojson file_system_type_version_to_yojson x.file_system_type_version );
      ( "OntapConfiguration",
        option_to_yojson ontap_file_system_configuration_to_yojson x.ontap_configuration );
      ( "AdministrativeActions",
        option_to_yojson administrative_actions_to_yojson x.administrative_actions );
      ( "LustreConfiguration",
        option_to_yojson lustre_file_system_configuration_to_yojson x.lustre_configuration );
      ( "WindowsConfiguration",
        option_to_yojson windows_file_system_configuration_to_yojson x.windows_configuration );
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("ResourceARN", option_to_yojson resource_ar_n_to_yojson x.resource_ar_n);
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("DNSName", option_to_yojson dns_name_to_yojson x.dns_name);
      ( "NetworkInterfaceIds",
        option_to_yojson network_interface_ids_to_yojson x.network_interface_ids );
      ("SubnetIds", option_to_yojson subnet_ids_to_yojson x.subnet_ids);
      ("VpcId", option_to_yojson vpc_id_to_yojson x.vpc_id);
      ("StorageType", option_to_yojson storage_type_to_yojson x.storage_type);
      ("StorageCapacity", option_to_yojson storage_capacity_to_yojson x.storage_capacity);
      ("FailureDetails", option_to_yojson file_system_failure_details_to_yojson x.failure_details);
      ("Lifecycle", option_to_yojson file_system_lifecycle_to_yojson x.lifecycle);
      ("FileSystemType", option_to_yojson file_system_type_to_yojson x.file_system_type);
      ("FileSystemId", option_to_yojson file_system_id_to_yojson x.file_system_id);
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
      ("OwnerId", option_to_yojson aws_account_id_to_yojson x.owner_id);
    ]

and snapshot_to_yojson (x : snapshot) =
  assoc_to_yojson
    [
      ( "AdministrativeActions",
        option_to_yojson administrative_actions_to_yojson x.administrative_actions );
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ( "LifecycleTransitionReason",
        option_to_yojson lifecycle_transition_reason_to_yojson x.lifecycle_transition_reason );
      ("Lifecycle", option_to_yojson snapshot_lifecycle_to_yojson x.lifecycle);
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
      ("VolumeId", option_to_yojson volume_id_to_yojson x.volume_id);
      ("Name", option_to_yojson snapshot_name_to_yojson x.name);
      ("SnapshotId", option_to_yojson snapshot_id_to_yojson x.snapshot_id);
      ("ResourceARN", option_to_yojson resource_ar_n_to_yojson x.resource_ar_n);
    ]

and volume_to_yojson (x : volume) =
  assoc_to_yojson
    [
      ( "OpenZFSConfiguration",
        option_to_yojson open_zfs_volume_configuration_to_yojson x.open_zfs_configuration );
      ( "AdministrativeActions",
        option_to_yojson administrative_actions_to_yojson x.administrative_actions );
      ( "LifecycleTransitionReason",
        option_to_yojson lifecycle_transition_reason_to_yojson x.lifecycle_transition_reason );
      ("VolumeType", option_to_yojson volume_type_to_yojson x.volume_type);
      ("VolumeId", option_to_yojson volume_id_to_yojson x.volume_id);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("ResourceARN", option_to_yojson resource_ar_n_to_yojson x.resource_ar_n);
      ( "OntapConfiguration",
        option_to_yojson ontap_volume_configuration_to_yojson x.ontap_configuration );
      ("Name", option_to_yojson volume_name_to_yojson x.name);
      ("Lifecycle", option_to_yojson volume_lifecycle_to_yojson x.lifecycle);
      ("FileSystemId", option_to_yojson file_system_id_to_yojson x.file_system_id);
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
    ]

let volumes_to_yojson tree = list_to_yojson volume_to_yojson tree

let volume_not_found_to_yojson (x : volume_not_found) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let volume_ids_to_yojson tree = list_to_yojson volume_id_to_yojson tree

let volume_filter_name_to_yojson (x : volume_filter_name) =
  match x with
  | STORAGE_VIRTUAL_MACHINE_ID -> `String "storage-virtual-machine-id"
  | FILE_SYSTEM_ID -> `String "file-system-id"

let volume_filter_value_to_yojson = string_to_yojson
let volume_filter_values_to_yojson tree = list_to_yojson volume_filter_value_to_yojson tree

let volume_filter_to_yojson (x : volume_filter) =
  assoc_to_yojson
    [
      ("Values", option_to_yojson volume_filter_values_to_yojson x.values);
      ("Name", option_to_yojson volume_filter_name_to_yojson x.name);
    ]

let volume_filters_to_yojson tree = list_to_yojson volume_filter_to_yojson tree
let verbose_flag_to_yojson = string_to_yojson
let value_to_yojson = long_to_yojson

let update_volume_response_to_yojson (x : update_volume_response) =
  assoc_to_yojson [ ("Volume", option_to_yojson volume_to_yojson x.volume) ]

let client_request_token_to_yojson = string_to_yojson

let update_snaplock_configuration_to_yojson (x : update_snaplock_configuration) =
  assoc_to_yojson
    [
      ("VolumeAppendModeEnabled", option_to_yojson flag_to_yojson x.volume_append_mode_enabled);
      ("RetentionPeriod", option_to_yojson snaplock_retention_period_to_yojson x.retention_period);
      ("PrivilegedDelete", option_to_yojson privileged_delete_to_yojson x.privileged_delete);
      ("AutocommitPeriod", option_to_yojson autocommit_period_to_yojson x.autocommit_period);
      ("AuditLogVolume", option_to_yojson flag_to_yojson x.audit_log_volume);
    ]

let update_ontap_volume_configuration_to_yojson (x : update_ontap_volume_configuration) =
  assoc_to_yojson
    [
      ("SizeInBytes", option_to_yojson volume_capacity_bytes_to_yojson x.size_in_bytes);
      ( "SnaplockConfiguration",
        option_to_yojson update_snaplock_configuration_to_yojson x.snaplock_configuration );
      ("CopyTagsToBackups", option_to_yojson flag_to_yojson x.copy_tags_to_backups);
      ("SnapshotPolicy", option_to_yojson snapshot_policy_to_yojson x.snapshot_policy);
      ("TieringPolicy", option_to_yojson tiering_policy_to_yojson x.tiering_policy);
      ("StorageEfficiencyEnabled", option_to_yojson flag_to_yojson x.storage_efficiency_enabled);
      ("SizeInMegabytes", option_to_yojson volume_capacity_to_yojson x.size_in_megabytes);
      ("SecurityStyle", option_to_yojson security_style_to_yojson x.security_style);
      ("JunctionPath", option_to_yojson junction_path_to_yojson x.junction_path);
    ]

let integer_no_max_from_negative_one_to_yojson = int_to_yojson

let update_open_zfs_volume_configuration_to_yojson (x : update_open_zfs_volume_configuration) =
  assoc_to_yojson
    [
      ("ReadOnly", option_to_yojson read_only_to_yojson x.read_only);
      ( "UserAndGroupQuotas",
        option_to_yojson open_zfs_user_and_group_quotas_to_yojson x.user_and_group_quotas );
      ("NfsExports", option_to_yojson open_zfs_nfs_exports_to_yojson x.nfs_exports);
      ( "DataCompressionType",
        option_to_yojson open_zfs_data_compression_type_to_yojson x.data_compression_type );
      ("RecordSizeKiB", option_to_yojson integer_record_size_ki_b_to_yojson x.record_size_ki_b);
      ( "StorageCapacityQuotaGiB",
        option_to_yojson integer_no_max_from_negative_one_to_yojson x.storage_capacity_quota_gi_b );
      ( "StorageCapacityReservationGiB",
        option_to_yojson integer_no_max_from_negative_one_to_yojson
          x.storage_capacity_reservation_gi_b );
    ]

let update_volume_request_to_yojson (x : update_volume_request) =
  assoc_to_yojson
    [
      ( "OpenZFSConfiguration",
        option_to_yojson update_open_zfs_volume_configuration_to_yojson x.open_zfs_configuration );
      ("Name", option_to_yojson volume_name_to_yojson x.name);
      ( "OntapConfiguration",
        option_to_yojson update_ontap_volume_configuration_to_yojson x.ontap_configuration );
      ("VolumeId", Some (volume_id_to_yojson x.volume_id));
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let missing_volume_configuration_to_yojson (x : missing_volume_configuration) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let internal_server_error_to_yojson (x : internal_server_error) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let parameter_to_yojson = string_to_yojson

let incompatible_parameter_error_to_yojson (x : incompatible_parameter_error) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("Parameter", Some (parameter_to_yojson x.parameter));
    ]

let bad_request_to_yojson (x : bad_request) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let directory_password_to_yojson = string_to_yojson

let self_managed_active_directory_configuration_updates_to_yojson
    (x : self_managed_active_directory_configuration_updates) =
  assoc_to_yojson
    [
      ( "DomainJoinServiceAccountSecret",
        option_to_yojson customer_secrets_manager_ar_n_to_yojson
          x.domain_join_service_account_secret );
      ( "FileSystemAdministratorsGroup",
        option_to_yojson file_system_administrators_group_name_to_yojson
          x.file_system_administrators_group );
      ( "OrganizationalUnitDistinguishedName",
        option_to_yojson organizational_unit_distinguished_name_to_yojson
          x.organizational_unit_distinguished_name );
      ("DomainName", option_to_yojson active_directory_fully_qualified_name_to_yojson x.domain_name);
      ("DnsIps", option_to_yojson dns_ips_to_yojson x.dns_ips);
      ("Password", option_to_yojson directory_password_to_yojson x.password);
      ("UserName", option_to_yojson directory_user_name_to_yojson x.user_name);
    ]

let net_bios_alias_to_yojson = string_to_yojson

let update_svm_active_directory_configuration_to_yojson
    (x : update_svm_active_directory_configuration) =
  assoc_to_yojson
    [
      ("NetBiosName", option_to_yojson net_bios_alias_to_yojson x.net_bios_name);
      ( "SelfManagedActiveDirectoryConfiguration",
        option_to_yojson self_managed_active_directory_configuration_updates_to_yojson
          x.self_managed_active_directory_configuration );
    ]

let svm_active_directory_configuration_to_yojson (x : svm_active_directory_configuration) =
  assoc_to_yojson
    [
      ( "SelfManagedActiveDirectoryConfiguration",
        option_to_yojson self_managed_active_directory_attributes_to_yojson
          x.self_managed_active_directory_configuration );
      ("NetBiosName", option_to_yojson net_bios_alias_to_yojson x.net_bios_name);
    ]

let svm_endpoint_to_yojson (x : svm_endpoint) =
  assoc_to_yojson
    [
      ("Ipv6Addresses", option_to_yojson ontap_endpoint_ip_addresses_to_yojson x.ipv6_addresses);
      ("IpAddresses", option_to_yojson ontap_endpoint_ip_addresses_to_yojson x.ip_addresses);
      ("DNSName", option_to_yojson dns_name_to_yojson x.dns_name);
    ]

let svm_endpoints_to_yojson (x : svm_endpoints) =
  assoc_to_yojson
    [
      ("Smb", option_to_yojson svm_endpoint_to_yojson x.smb);
      ("Nfs", option_to_yojson svm_endpoint_to_yojson x.nfs);
      ("Management", option_to_yojson svm_endpoint_to_yojson x.management);
      ("Iscsi", option_to_yojson svm_endpoint_to_yojson x.iscsi);
    ]

let storage_virtual_machine_lifecycle_to_yojson (x : storage_virtual_machine_lifecycle) =
  match x with
  | PENDING -> `String "PENDING"
  | MISCONFIGURED -> `String "MISCONFIGURED"
  | FAILED -> `String "FAILED"
  | DELETING -> `String "DELETING"
  | CREATING -> `String "CREATING"
  | CREATED -> `String "CREATED"

let storage_virtual_machine_name_to_yojson = string_to_yojson

let storage_virtual_machine_subtype_to_yojson (x : storage_virtual_machine_subtype) =
  match x with
  | SYNC_SOURCE -> `String "SYNC_SOURCE"
  | SYNC_DESTINATION -> `String "SYNC_DESTINATION"
  | DP_DESTINATION -> `String "DP_DESTINATION"
  | DEFAULT -> `String "DEFAULT"

let storage_virtual_machine_root_volume_security_style_to_yojson
    (x : storage_virtual_machine_root_volume_security_style) =
  match x with MIXED -> `String "MIXED" | NTFS -> `String "NTFS" | UNIX -> `String "UNIX"

let storage_virtual_machine_to_yojson (x : storage_virtual_machine) =
  assoc_to_yojson
    [
      ( "RootVolumeSecurityStyle",
        option_to_yojson storage_virtual_machine_root_volume_security_style_to_yojson
          x.root_volume_security_style );
      ( "LifecycleTransitionReason",
        option_to_yojson lifecycle_transition_reason_to_yojson x.lifecycle_transition_reason );
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("UUID", option_to_yojson uui_d_to_yojson x.uui_d);
      ("Subtype", option_to_yojson storage_virtual_machine_subtype_to_yojson x.subtype);
      ( "StorageVirtualMachineId",
        option_to_yojson storage_virtual_machine_id_to_yojson x.storage_virtual_machine_id );
      ("ResourceARN", option_to_yojson resource_ar_n_to_yojson x.resource_ar_n);
      ("Name", option_to_yojson storage_virtual_machine_name_to_yojson x.name);
      ("Lifecycle", option_to_yojson storage_virtual_machine_lifecycle_to_yojson x.lifecycle);
      ("FileSystemId", option_to_yojson file_system_id_to_yojson x.file_system_id);
      ("Endpoints", option_to_yojson svm_endpoints_to_yojson x.endpoints);
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
      ( "ActiveDirectoryConfiguration",
        option_to_yojson svm_active_directory_configuration_to_yojson
          x.active_directory_configuration );
    ]

let update_storage_virtual_machine_response_to_yojson (x : update_storage_virtual_machine_response)
    =
  assoc_to_yojson
    [
      ( "StorageVirtualMachine",
        option_to_yojson storage_virtual_machine_to_yojson x.storage_virtual_machine );
    ]

let update_storage_virtual_machine_request_to_yojson (x : update_storage_virtual_machine_request) =
  assoc_to_yojson
    [
      ("SvmAdminPassword", option_to_yojson admin_password_to_yojson x.svm_admin_password);
      ( "StorageVirtualMachineId",
        Some (storage_virtual_machine_id_to_yojson x.storage_virtual_machine_id) );
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "ActiveDirectoryConfiguration",
        option_to_yojson update_svm_active_directory_configuration_to_yojson
          x.active_directory_configuration );
    ]

let unsupported_operation_to_yojson (x : unsupported_operation) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let storage_virtual_machine_not_found_to_yojson (x : storage_virtual_machine_not_found) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let update_snapshot_response_to_yojson (x : update_snapshot_response) =
  assoc_to_yojson [ ("Snapshot", option_to_yojson snapshot_to_yojson x.snapshot) ]

let update_snapshot_request_to_yojson (x : update_snapshot_request) =
  assoc_to_yojson
    [
      ("SnapshotId", Some (snapshot_id_to_yojson x.snapshot_id));
      ("Name", Some (snapshot_name_to_yojson x.name));
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let snapshot_not_found_to_yojson (x : snapshot_not_found) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let update_shared_vpc_configuration_response_to_yojson
    (x : update_shared_vpc_configuration_response) =
  assoc_to_yojson
    [
      ( "EnableFsxRouteTableUpdatesFromParticipantAccounts",
        option_to_yojson verbose_flag_to_yojson
          x.enable_fsx_route_table_updates_from_participant_accounts );
    ]

let update_shared_vpc_configuration_request_to_yojson (x : update_shared_vpc_configuration_request)
    =
  assoc_to_yojson
    [
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "EnableFsxRouteTableUpdatesFromParticipantAccounts",
        option_to_yojson verbose_flag_to_yojson
          x.enable_fsx_route_table_updates_from_participant_accounts );
    ]

let update_open_zfs_volume_option_to_yojson (x : update_open_zfs_volume_option) =
  match x with
  | DELETE_INTERMEDIATE_DATA -> `String "DELETE_INTERMEDIATE_DATA"
  | DELETE_CLONED_VOLUMES -> `String "DELETE_CLONED_VOLUMES"
  | DELETE_INTERMEDIATE_SNAPSHOTS -> `String "DELETE_INTERMEDIATE_SNAPSHOTS"

let update_open_zfs_volume_options_to_yojson tree =
  list_to_yojson update_open_zfs_volume_option_to_yojson tree

let update_file_system_windows_configuration_to_yojson
    (x : update_file_system_windows_configuration) =
  assoc_to_yojson
    [
      ( "FsrmConfiguration",
        option_to_yojson windows_fsrm_configuration_to_yojson x.fsrm_configuration );
      ( "DiskIopsConfiguration",
        option_to_yojson disk_iops_configuration_to_yojson x.disk_iops_configuration );
      ( "AuditLogConfiguration",
        option_to_yojson windows_audit_log_create_configuration_to_yojson x.audit_log_configuration
      );
      ( "SelfManagedActiveDirectoryConfiguration",
        option_to_yojson self_managed_active_directory_configuration_updates_to_yojson
          x.self_managed_active_directory_configuration );
      ("ThroughputCapacity", option_to_yojson megabytes_per_second_to_yojson x.throughput_capacity);
      ( "AutomaticBackupRetentionDays",
        option_to_yojson automatic_backup_retention_days_to_yojson x.automatic_backup_retention_days
      );
      ( "DailyAutomaticBackupStartTime",
        option_to_yojson daily_time_to_yojson x.daily_automatic_backup_start_time );
      ( "WeeklyMaintenanceStartTime",
        option_to_yojson weekly_time_to_yojson x.weekly_maintenance_start_time );
    ]

let update_file_system_response_to_yojson (x : update_file_system_response) =
  assoc_to_yojson [ ("FileSystem", option_to_yojson file_system_to_yojson x.file_system) ]

let lustre_log_create_configuration_to_yojson (x : lustre_log_create_configuration) =
  assoc_to_yojson
    [
      ("Destination", option_to_yojson general_ar_n_to_yojson x.destination);
      ("Level", Some (lustre_access_audit_log_level_to_yojson x.level));
    ]

let update_file_system_lustre_metadata_configuration_to_yojson
    (x : update_file_system_lustre_metadata_configuration) =
  assoc_to_yojson
    [
      ("Mode", option_to_yojson metadata_configuration_mode_to_yojson x.mode);
      ("Iops", option_to_yojson metadata_iops_to_yojson x.iops);
    ]

let update_file_system_lustre_configuration_to_yojson (x : update_file_system_lustre_configuration)
    =
  assoc_to_yojson
    [
      ( "DataReadCacheConfiguration",
        option_to_yojson lustre_read_cache_configuration_to_yojson x.data_read_cache_configuration
      );
      ( "ThroughputCapacity",
        option_to_yojson throughput_capacity_mbps_to_yojson x.throughput_capacity );
      ( "MetadataConfiguration",
        option_to_yojson update_file_system_lustre_metadata_configuration_to_yojson
          x.metadata_configuration );
      ( "PerUnitStorageThroughput",
        option_to_yojson per_unit_storage_throughput_to_yojson x.per_unit_storage_throughput );
      ( "RootSquashConfiguration",
        option_to_yojson lustre_root_squash_configuration_to_yojson x.root_squash_configuration );
      ( "LogConfiguration",
        option_to_yojson lustre_log_create_configuration_to_yojson x.log_configuration );
      ( "DataCompressionType",
        option_to_yojson data_compression_type_to_yojson x.data_compression_type );
      ("AutoImportPolicy", option_to_yojson auto_import_policy_type_to_yojson x.auto_import_policy);
      ( "AutomaticBackupRetentionDays",
        option_to_yojson automatic_backup_retention_days_to_yojson x.automatic_backup_retention_days
      );
      ( "DailyAutomaticBackupStartTime",
        option_to_yojson daily_time_to_yojson x.daily_automatic_backup_start_time );
      ( "WeeklyMaintenanceStartTime",
        option_to_yojson weekly_time_to_yojson x.weekly_maintenance_start_time );
    ]

let update_file_system_ontap_configuration_to_yojson (x : update_file_system_ontap_configuration) =
  assoc_to_yojson
    [
      ( "EndpointIpv6AddressRange",
        option_to_yojson ipv6_address_range_to_yojson x.endpoint_ipv6_address_range );
      ("HAPairs", option_to_yojson ha_pairs_to_yojson x.ha_pairs);
      ( "ThroughputCapacityPerHAPair",
        option_to_yojson throughput_capacity_per_ha_pair_to_yojson x.throughput_capacity_per_ha_pair
      );
      ("RemoveRouteTableIds", option_to_yojson route_table_ids_to_yojson x.remove_route_table_ids);
      ("AddRouteTableIds", option_to_yojson route_table_ids_to_yojson x.add_route_table_ids);
      ("ThroughputCapacity", option_to_yojson megabytes_per_second_to_yojson x.throughput_capacity);
      ( "DiskIopsConfiguration",
        option_to_yojson disk_iops_configuration_to_yojson x.disk_iops_configuration );
      ( "WeeklyMaintenanceStartTime",
        option_to_yojson weekly_time_to_yojson x.weekly_maintenance_start_time );
      ("FsxAdminPassword", option_to_yojson admin_password_to_yojson x.fsx_admin_password);
      ( "DailyAutomaticBackupStartTime",
        option_to_yojson daily_time_to_yojson x.daily_automatic_backup_start_time );
      ( "AutomaticBackupRetentionDays",
        option_to_yojson automatic_backup_retention_days_to_yojson x.automatic_backup_retention_days
      );
    ]

let update_file_system_open_zfs_configuration_to_yojson
    (x : update_file_system_open_zfs_configuration) =
  assoc_to_yojson
    [
      ( "EndpointIpv6AddressRange",
        option_to_yojson ipv6_address_range_to_yojson x.endpoint_ipv6_address_range );
      ( "ReadCacheConfiguration",
        option_to_yojson open_zfs_read_cache_configuration_to_yojson x.read_cache_configuration );
      ("RemoveRouteTableIds", option_to_yojson route_table_ids_to_yojson x.remove_route_table_ids);
      ("AddRouteTableIds", option_to_yojson route_table_ids_to_yojson x.add_route_table_ids);
      ( "DiskIopsConfiguration",
        option_to_yojson disk_iops_configuration_to_yojson x.disk_iops_configuration );
      ( "WeeklyMaintenanceStartTime",
        option_to_yojson weekly_time_to_yojson x.weekly_maintenance_start_time );
      ("ThroughputCapacity", option_to_yojson megabytes_per_second_to_yojson x.throughput_capacity);
      ( "DailyAutomaticBackupStartTime",
        option_to_yojson daily_time_to_yojson x.daily_automatic_backup_start_time );
      ("CopyTagsToVolumes", option_to_yojson flag_to_yojson x.copy_tags_to_volumes);
      ("CopyTagsToBackups", option_to_yojson flag_to_yojson x.copy_tags_to_backups);
      ( "AutomaticBackupRetentionDays",
        option_to_yojson automatic_backup_retention_days_to_yojson x.automatic_backup_retention_days
      );
    ]

let update_file_system_request_to_yojson (x : update_file_system_request) =
  assoc_to_yojson
    [
      ("NetworkType", option_to_yojson network_type_to_yojson x.network_type);
      ( "FileSystemTypeVersion",
        option_to_yojson file_system_type_version_to_yojson x.file_system_type_version );
      ("StorageType", option_to_yojson storage_type_to_yojson x.storage_type);
      ( "OpenZFSConfiguration",
        option_to_yojson update_file_system_open_zfs_configuration_to_yojson
          x.open_zfs_configuration );
      ( "OntapConfiguration",
        option_to_yojson update_file_system_ontap_configuration_to_yojson x.ontap_configuration );
      ( "LustreConfiguration",
        option_to_yojson update_file_system_lustre_configuration_to_yojson x.lustre_configuration );
      ( "WindowsConfiguration",
        option_to_yojson update_file_system_windows_configuration_to_yojson x.windows_configuration
      );
      ("StorageCapacity", option_to_yojson storage_capacity_to_yojson x.storage_capacity);
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("FileSystemId", Some (file_system_id_to_yojson x.file_system_id));
    ]

let service_limit_to_yojson (x : service_limit) =
  match x with
  | FILE_CACHE_COUNT -> `String "FILE_CACHE_COUNT"
  | TOTAL_SSD_IOPS -> `String "TOTAL_SSD_IOPS"
  | VOLUMES_PER_FILE_SYSTEM -> `String "VOLUMES_PER_FILE_SYSTEM"
  | STORAGE_VIRTUAL_MACHINES_PER_FILE_SYSTEM -> `String "STORAGE_VIRTUAL_MACHINES_PER_FILE_SYSTEM"
  | TOTAL_IN_PROGRESS_COPY_BACKUPS -> `String "TOTAL_IN_PROGRESS_COPY_BACKUPS"
  | TOTAL_USER_TAGS -> `String "TOTAL_USER_TAGS"
  | TOTAL_USER_INITIATED_BACKUPS -> `String "TOTAL_USER_INITIATED_BACKUPS"
  | TOTAL_STORAGE -> `String "TOTAL_STORAGE"
  | TOTAL_THROUGHPUT_CAPACITY -> `String "TOTAL_THROUGHPUT_CAPACITY"
  | FILE_SYSTEM_COUNT -> `String "FILE_SYSTEM_COUNT"

let service_limit_exceeded_to_yojson (x : service_limit_exceeded) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("Limit", Some (service_limit_to_yojson x.limit));
    ]

let missing_file_system_configuration_to_yojson (x : missing_file_system_configuration) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let security_group_id_to_yojson = string_to_yojson

let invalid_network_settings_to_yojson (x : invalid_network_settings) =
  assoc_to_yojson
    [
      ("InvalidRouteTableId", option_to_yojson route_table_id_to_yojson x.invalid_route_table_id);
      ( "InvalidSecurityGroupId",
        option_to_yojson security_group_id_to_yojson x.invalid_security_group_id );
      ("InvalidSubnetId", option_to_yojson subnet_id_to_yojson x.invalid_subnet_id);
      ("Message", option_to_yojson error_message_to_yojson x.message);
    ]

let file_system_not_found_to_yojson (x : file_system_not_found) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let file_cache_id_to_yojson = string_to_yojson
let file_cache_type_to_yojson (x : file_cache_type) = match x with LUSTRE -> `String "LUSTRE"

let file_cache_lifecycle_to_yojson (x : file_cache_lifecycle) =
  match x with
  | FAILED -> `String "FAILED"
  | UPDATING -> `String "UPDATING"
  | DELETING -> `String "DELETING"
  | CREATING -> `String "CREATING"
  | AVAILABLE -> `String "AVAILABLE"

let file_cache_failure_details_to_yojson (x : file_cache_failure_details) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let file_cache_lustre_deployment_type_to_yojson (x : file_cache_lustre_deployment_type) =
  match x with CACHE_1 -> `String "CACHE_1"

let metadata_storage_capacity_to_yojson = int_to_yojson

let file_cache_lustre_metadata_configuration_to_yojson
    (x : file_cache_lustre_metadata_configuration) =
  assoc_to_yojson
    [ ("StorageCapacity", Some (metadata_storage_capacity_to_yojson x.storage_capacity)) ]

let file_cache_lustre_configuration_to_yojson (x : file_cache_lustre_configuration) =
  assoc_to_yojson
    [
      ("LogConfiguration", option_to_yojson lustre_log_configuration_to_yojson x.log_configuration);
      ( "MetadataConfiguration",
        option_to_yojson file_cache_lustre_metadata_configuration_to_yojson x.metadata_configuration
      );
      ( "WeeklyMaintenanceStartTime",
        option_to_yojson weekly_time_to_yojson x.weekly_maintenance_start_time );
      ("MountName", option_to_yojson lustre_file_system_mount_name_to_yojson x.mount_name);
      ( "DeploymentType",
        option_to_yojson file_cache_lustre_deployment_type_to_yojson x.deployment_type );
      ( "PerUnitStorageThroughput",
        option_to_yojson per_unit_storage_throughput_to_yojson x.per_unit_storage_throughput );
    ]

let data_repository_association_id_to_yojson = string_to_yojson

let data_repository_association_ids_to_yojson tree =
  list_to_yojson data_repository_association_id_to_yojson tree

let file_cache_to_yojson (x : file_cache) =
  assoc_to_yojson
    [
      ( "DataRepositoryAssociationIds",
        option_to_yojson data_repository_association_ids_to_yojson x.data_repository_association_ids
      );
      ( "LustreConfiguration",
        option_to_yojson file_cache_lustre_configuration_to_yojson x.lustre_configuration );
      ("ResourceARN", option_to_yojson resource_ar_n_to_yojson x.resource_ar_n);
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("DNSName", option_to_yojson dns_name_to_yojson x.dns_name);
      ( "NetworkInterfaceIds",
        option_to_yojson network_interface_ids_to_yojson x.network_interface_ids );
      ("SubnetIds", option_to_yojson subnet_ids_to_yojson x.subnet_ids);
      ("VpcId", option_to_yojson vpc_id_to_yojson x.vpc_id);
      ("StorageCapacity", option_to_yojson storage_capacity_to_yojson x.storage_capacity);
      ("FailureDetails", option_to_yojson file_cache_failure_details_to_yojson x.failure_details);
      ("Lifecycle", option_to_yojson file_cache_lifecycle_to_yojson x.lifecycle);
      ( "FileCacheTypeVersion",
        option_to_yojson file_system_type_version_to_yojson x.file_cache_type_version );
      ("FileCacheType", option_to_yojson file_cache_type_to_yojson x.file_cache_type);
      ("FileCacheId", option_to_yojson file_cache_id_to_yojson x.file_cache_id);
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
      ("OwnerId", option_to_yojson aws_account_id_to_yojson x.owner_id);
    ]

let update_file_cache_response_to_yojson (x : update_file_cache_response) =
  assoc_to_yojson [ ("FileCache", option_to_yojson file_cache_to_yojson x.file_cache) ]

let update_file_cache_lustre_configuration_to_yojson (x : update_file_cache_lustre_configuration) =
  assoc_to_yojson
    [
      ( "WeeklyMaintenanceStartTime",
        option_to_yojson weekly_time_to_yojson x.weekly_maintenance_start_time );
    ]

let update_file_cache_request_to_yojson (x : update_file_cache_request) =
  assoc_to_yojson
    [
      ( "LustreConfiguration",
        option_to_yojson update_file_cache_lustre_configuration_to_yojson x.lustre_configuration );
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("FileCacheId", Some (file_cache_id_to_yojson x.file_cache_id));
    ]

let missing_file_cache_configuration_to_yojson (x : missing_file_cache_configuration) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let file_cache_not_found_to_yojson (x : file_cache_not_found) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let namespace_to_yojson = string_to_yojson
let batch_import_meta_data_on_create_to_yojson = bool_to_yojson

let event_type_to_yojson (x : event_type) =
  match x with DELETED -> `String "DELETED" | CHANGED -> `String "CHANGED" | NEW -> `String "NEW"

let event_types_to_yojson tree = list_to_yojson event_type_to_yojson tree

let auto_import_policy_to_yojson (x : auto_import_policy) =
  assoc_to_yojson [ ("Events", option_to_yojson event_types_to_yojson x.events) ]

let auto_export_policy_to_yojson (x : auto_export_policy) =
  assoc_to_yojson [ ("Events", option_to_yojson event_types_to_yojson x.events) ]

let s3_data_repository_configuration_to_yojson (x : s3_data_repository_configuration) =
  assoc_to_yojson
    [
      ("AutoExportPolicy", option_to_yojson auto_export_policy_to_yojson x.auto_export_policy);
      ("AutoImportPolicy", option_to_yojson auto_import_policy_to_yojson x.auto_import_policy);
    ]

let sub_directories_paths_to_yojson tree = list_to_yojson namespace_to_yojson tree
let nfs_version_to_yojson (x : nfs_version) = match x with NFS3 -> `String "NFS3"
let repository_dns_ips_to_yojson tree = list_to_yojson ip_address_to_yojson tree

let nfs_data_repository_configuration_to_yojson (x : nfs_data_repository_configuration) =
  assoc_to_yojson
    [
      ("AutoExportPolicy", option_to_yojson auto_export_policy_to_yojson x.auto_export_policy);
      ("DnsIps", option_to_yojson repository_dns_ips_to_yojson x.dns_ips);
      ("Version", Some (nfs_version_to_yojson x.version));
    ]

let data_repository_association_to_yojson (x : data_repository_association) =
  assoc_to_yojson
    [
      ("NFS", option_to_yojson nfs_data_repository_configuration_to_yojson x.nf_s);
      ( "DataRepositorySubdirectories",
        option_to_yojson sub_directories_paths_to_yojson x.data_repository_subdirectories );
      ("FileCachePath", option_to_yojson namespace_to_yojson x.file_cache_path);
      ("FileCacheId", option_to_yojson file_cache_id_to_yojson x.file_cache_id);
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("S3", option_to_yojson s3_data_repository_configuration_to_yojson x.s3);
      ("ImportedFileChunkSize", option_to_yojson megabytes_to_yojson x.imported_file_chunk_size);
      ( "BatchImportMetaDataOnCreate",
        option_to_yojson batch_import_meta_data_on_create_to_yojson
          x.batch_import_meta_data_on_create );
      ("DataRepositoryPath", option_to_yojson archive_path_to_yojson x.data_repository_path);
      ("FileSystemPath", option_to_yojson namespace_to_yojson x.file_system_path);
      ( "FailureDetails",
        option_to_yojson data_repository_failure_details_to_yojson x.failure_details );
      ("Lifecycle", option_to_yojson data_repository_lifecycle_to_yojson x.lifecycle);
      ("FileSystemId", option_to_yojson file_system_id_to_yojson x.file_system_id);
      ("ResourceARN", option_to_yojson resource_ar_n_to_yojson x.resource_ar_n);
      ("AssociationId", option_to_yojson data_repository_association_id_to_yojson x.association_id);
    ]

let update_data_repository_association_response_to_yojson
    (x : update_data_repository_association_response) =
  assoc_to_yojson
    [ ("Association", option_to_yojson data_repository_association_to_yojson x.association) ]

let update_data_repository_association_request_to_yojson
    (x : update_data_repository_association_request) =
  assoc_to_yojson
    [
      ("S3", option_to_yojson s3_data_repository_configuration_to_yojson x.s3);
      ("ImportedFileChunkSize", option_to_yojson megabytes_to_yojson x.imported_file_chunk_size);
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("AssociationId", Some (data_repository_association_id_to_yojson x.association_id));
    ]

let data_repository_association_not_found_to_yojson (x : data_repository_association_not_found) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_keys_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_keys_to_yojson x.tag_keys));
      ("ResourceARN", Some (resource_ar_n_to_yojson x.resource_ar_n));
    ]

let resource_not_found_to_yojson (x : resource_not_found) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("ResourceARN", Some (resource_ar_n_to_yojson x.resource_ar_n));
    ]

let resource_does_not_support_tagging_to_yojson (x : resource_does_not_support_tagging) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("ResourceARN", Some (resource_ar_n_to_yojson x.resource_ar_n));
    ]

let not_service_resource_error_to_yojson (x : not_service_resource_error) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("ResourceARN", Some (resource_ar_n_to_yojson x.resource_ar_n));
    ]

let unit__to_yojson (x : unit_) = match x with DAYS -> `String "DAYS"
let total_count_to_yojson = long_to_yojson
let error_code_to_yojson = string_to_yojson

let too_many_access_points_to_yojson (x : too_many_access_points) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
    ]

let task_id_to_yojson = string_to_yojson
let task_ids_to_yojson tree = list_to_yojson task_id_to_yojson tree
let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("Tags", Some (tags_to_yojson x.tags));
      ("ResourceARN", Some (resource_ar_n_to_yojson x.resource_ar_n));
    ]

let succeeded_count_to_yojson = long_to_yojson
let storage_virtual_machines_to_yojson tree = list_to_yojson storage_virtual_machine_to_yojson tree

let storage_virtual_machine_ids_to_yojson tree =
  list_to_yojson storage_virtual_machine_id_to_yojson tree

let storage_virtual_machine_filter_name_to_yojson (x : storage_virtual_machine_filter_name) =
  match x with FILE_SYSTEM_ID -> `String "file-system-id"

let storage_virtual_machine_filter_value_to_yojson = string_to_yojson

let storage_virtual_machine_filter_values_to_yojson tree =
  list_to_yojson storage_virtual_machine_filter_value_to_yojson tree

let storage_virtual_machine_filter_to_yojson (x : storage_virtual_machine_filter) =
  assoc_to_yojson
    [
      ("Values", option_to_yojson storage_virtual_machine_filter_values_to_yojson x.values);
      ("Name", option_to_yojson storage_virtual_machine_filter_name_to_yojson x.name);
    ]

let storage_virtual_machine_filters_to_yojson tree =
  list_to_yojson storage_virtual_machine_filter_to_yojson tree

let start_time_to_yojson = timestamp_epoch_seconds_to_yojson

let start_misconfigured_state_recovery_response_to_yojson
    (x : start_misconfigured_state_recovery_response) =
  assoc_to_yojson [ ("FileSystem", option_to_yojson file_system_to_yojson x.file_system) ]

let start_misconfigured_state_recovery_request_to_yojson
    (x : start_misconfigured_state_recovery_request) =
  assoc_to_yojson
    [
      ("FileSystemId", Some (file_system_id_to_yojson x.file_system_id));
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let backup_id_to_yojson = string_to_yojson

let source_backup_unavailable_to_yojson (x : source_backup_unavailable) =
  assoc_to_yojson
    [
      ("BackupId", option_to_yojson backup_id_to_yojson x.backup_id);
      ("Message", option_to_yojson error_message_to_yojson x.message);
    ]

let source_backup_id_to_yojson = string_to_yojson
let snapshots_to_yojson tree = list_to_yojson snapshot_to_yojson tree
let snapshot_ids_to_yojson tree = list_to_yojson snapshot_id_to_yojson tree

let snapshot_filter_name_to_yojson (x : snapshot_filter_name) =
  match x with VOLUME_ID -> `String "volume-id" | FILE_SYSTEM_ID -> `String "file-system-id"

let snapshot_filter_value_to_yojson = string_to_yojson
let snapshot_filter_values_to_yojson tree = list_to_yojson snapshot_filter_value_to_yojson tree

let snapshot_filter_to_yojson (x : snapshot_filter) =
  assoc_to_yojson
    [
      ("Values", option_to_yojson snapshot_filter_values_to_yojson x.values);
      ("Name", option_to_yojson snapshot_filter_name_to_yojson x.name);
    ]

let snapshot_filters_to_yojson tree = list_to_yojson snapshot_filter_to_yojson tree
let size_in_bytes_to_yojson = long_to_yojson

let self_managed_active_directory_configuration_to_yojson
    (x : self_managed_active_directory_configuration) =
  assoc_to_yojson
    [
      ( "DomainJoinServiceAccountSecret",
        option_to_yojson customer_secrets_manager_ar_n_to_yojson
          x.domain_join_service_account_secret );
      ("DnsIps", Some (dns_ips_to_yojson x.dns_ips));
      ("Password", option_to_yojson directory_password_to_yojson x.password);
      ("UserName", option_to_yojson directory_user_name_to_yojson x.user_name);
      ( "FileSystemAdministratorsGroup",
        option_to_yojson file_system_administrators_group_name_to_yojson
          x.file_system_administrators_group );
      ( "OrganizationalUnitDistinguishedName",
        option_to_yojson organizational_unit_distinguished_name_to_yojson
          x.organizational_unit_distinguished_name );
      ("DomainName", Some (active_directory_fully_qualified_name_to_yojson x.domain_name));
    ]

let security_group_ids_to_yojson tree = list_to_yojson security_group_id_to_yojson tree

let s3_access_point_vpc_configuration_to_yojson (x : s3_access_point_vpc_configuration) =
  assoc_to_yojson [ ("VpcId", option_to_yojson vpc_id_to_yojson x.vpc_id) ]

let open_zfs_file_system_user_type_to_yojson (x : open_zfs_file_system_user_type) =
  match x with POSIX -> `String "POSIX"

let file_system_ui_d_to_yojson = long_to_yojson
let file_system_gi_d_to_yojson = long_to_yojson
let file_system_secondary_gi_ds_to_yojson tree = list_to_yojson file_system_gi_d_to_yojson tree

let open_zfs_posix_file_system_user_to_yojson (x : open_zfs_posix_file_system_user) =
  assoc_to_yojson
    [
      ("SecondaryGids", option_to_yojson file_system_secondary_gi_ds_to_yojson x.secondary_gids);
      ("Gid", Some (file_system_gi_d_to_yojson x.gid));
      ("Uid", Some (file_system_ui_d_to_yojson x.uid));
    ]

let open_zfs_file_system_identity_to_yojson (x : open_zfs_file_system_identity) =
  assoc_to_yojson
    [
      ("PosixUser", option_to_yojson open_zfs_posix_file_system_user_to_yojson x.posix_user);
      ("Type", Some (open_zfs_file_system_user_type_to_yojson x.type_));
    ]

let s3_access_point_open_zfs_configuration_to_yojson (x : s3_access_point_open_zfs_configuration) =
  assoc_to_yojson
    [
      ( "FileSystemIdentity",
        option_to_yojson open_zfs_file_system_identity_to_yojson x.file_system_identity );
      ("VolumeId", option_to_yojson volume_id_to_yojson x.volume_id);
    ]

let ontap_file_system_user_type_to_yojson (x : ontap_file_system_user_type) =
  match x with WINDOWS -> `String "WINDOWS" | UNIX -> `String "UNIX"

let ontap_file_system_user_name_to_yojson = string_to_yojson

let ontap_unix_file_system_user_to_yojson (x : ontap_unix_file_system_user) =
  assoc_to_yojson [ ("Name", Some (ontap_file_system_user_name_to_yojson x.name)) ]

let ontap_windows_file_system_user_to_yojson (x : ontap_windows_file_system_user) =
  assoc_to_yojson [ ("Name", Some (ontap_file_system_user_name_to_yojson x.name)) ]

let ontap_file_system_identity_to_yojson (x : ontap_file_system_identity) =
  assoc_to_yojson
    [
      ("WindowsUser", option_to_yojson ontap_windows_file_system_user_to_yojson x.windows_user);
      ("UnixUser", option_to_yojson ontap_unix_file_system_user_to_yojson x.unix_user);
      ("Type", Some (ontap_file_system_user_type_to_yojson x.type_));
    ]

let s3_access_point_ontap_configuration_to_yojson (x : s3_access_point_ontap_configuration) =
  assoc_to_yojson
    [
      ( "FileSystemIdentity",
        option_to_yojson ontap_file_system_identity_to_yojson x.file_system_identity );
      ("VolumeId", option_to_yojson volume_id_to_yojson x.volume_id);
    ]

let s3_access_point_attachments_filter_name_to_yojson (x : s3_access_point_attachments_filter_name)
    =
  match x with
  | TYPE -> `String "type"
  | VOLUME_ID -> `String "volume-id"
  | FILE_SYSTEM_ID -> `String "file-system-id"

let s3_access_point_attachments_filter_value_to_yojson = string_to_yojson

let s3_access_point_attachments_filter_values_to_yojson tree =
  list_to_yojson s3_access_point_attachments_filter_value_to_yojson tree

let s3_access_point_attachments_filter_to_yojson (x : s3_access_point_attachments_filter) =
  assoc_to_yojson
    [
      ("Values", option_to_yojson s3_access_point_attachments_filter_values_to_yojson x.values);
      ("Name", option_to_yojson s3_access_point_attachments_filter_name_to_yojson x.name);
    ]

let s3_access_point_attachments_filters_to_yojson tree =
  list_to_yojson s3_access_point_attachments_filter_to_yojson tree

let s3_access_point_attachment_lifecycle_to_yojson (x : s3_access_point_attachment_lifecycle) =
  match x with
  | MISCONFIGURED -> `String "MISCONFIGURED"
  | FAILED -> `String "FAILED"
  | UPDATING -> `String "UPDATING"
  | DELETING -> `String "DELETING"
  | CREATING -> `String "CREATING"
  | AVAILABLE -> `String "AVAILABLE"

let s3_access_point_attachment_name_to_yojson = string_to_yojson

let s3_access_point_attachment_type_to_yojson (x : s3_access_point_attachment_type) =
  match x with ONTAP -> `String "ONTAP" | OPENZFS -> `String "OPENZFS"

let s3_access_point_alias_to_yojson = string_to_yojson

let s3_access_point_to_yojson (x : s3_access_point) =
  assoc_to_yojson
    [
      ( "VpcConfiguration",
        option_to_yojson s3_access_point_vpc_configuration_to_yojson x.vpc_configuration );
      ("Alias", option_to_yojson s3_access_point_alias_to_yojson x.alias);
      ("ResourceARN", option_to_yojson general_ar_n_to_yojson x.resource_ar_n);
    ]

let s3_access_point_attachment_to_yojson (x : s3_access_point_attachment) =
  assoc_to_yojson
    [
      ("S3AccessPoint", option_to_yojson s3_access_point_to_yojson x.s3_access_point);
      ( "OntapConfiguration",
        option_to_yojson s3_access_point_ontap_configuration_to_yojson x.ontap_configuration );
      ( "OpenZFSConfiguration",
        option_to_yojson s3_access_point_open_zfs_configuration_to_yojson x.open_zfs_configuration
      );
      ("Type", option_to_yojson s3_access_point_attachment_type_to_yojson x.type_);
      ("Name", option_to_yojson s3_access_point_attachment_name_to_yojson x.name);
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
      ( "LifecycleTransitionReason",
        option_to_yojson lifecycle_transition_reason_to_yojson x.lifecycle_transition_reason );
      ("Lifecycle", option_to_yojson s3_access_point_attachment_lifecycle_to_yojson x.lifecycle);
    ]

let s3_access_point_attachments_to_yojson tree =
  list_to_yojson s3_access_point_attachment_to_yojson tree

let s3_access_point_attachment_not_found_to_yojson (x : s3_access_point_attachment_not_found) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let s3_access_point_attachment_names_to_yojson tree =
  list_to_yojson s3_access_point_attachment_name_to_yojson tree

let restore_volume_from_snapshot_response_to_yojson (x : restore_volume_from_snapshot_response) =
  assoc_to_yojson
    [
      ( "AdministrativeActions",
        option_to_yojson administrative_actions_to_yojson x.administrative_actions );
      ("Lifecycle", option_to_yojson volume_lifecycle_to_yojson x.lifecycle);
      ("VolumeId", option_to_yojson volume_id_to_yojson x.volume_id);
    ]

let restore_open_zfs_volume_option_to_yojson (x : restore_open_zfs_volume_option) =
  match x with
  | DELETE_CLONED_VOLUMES -> `String "DELETE_CLONED_VOLUMES"
  | DELETE_INTERMEDIATE_SNAPSHOTS -> `String "DELETE_INTERMEDIATE_SNAPSHOTS"

let restore_open_zfs_volume_options_to_yojson tree =
  list_to_yojson restore_open_zfs_volume_option_to_yojson tree

let restore_volume_from_snapshot_request_to_yojson (x : restore_volume_from_snapshot_request) =
  assoc_to_yojson
    [
      ("Options", option_to_yojson restore_open_zfs_volume_options_to_yojson x.options);
      ("SnapshotId", Some (snapshot_id_to_yojson x.snapshot_id));
      ("VolumeId", Some (volume_id_to_yojson x.volume_id));
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let resource_type_to_yojson (x : resource_type) =
  match x with VOLUME -> `String "VOLUME" | FILE_SYSTEM -> `String "FILE_SYSTEM"

let report_scope_to_yojson (x : report_scope) =
  match x with FAILED_FILES_ONLY -> `String "FAILED_FILES_ONLY"

let report_format_to_yojson (x : report_format) =
  match x with REPORT_CSV_20191124 -> `String "REPORT_CSV_20191124"

let released_capacity_to_yojson = long_to_yojson

let release_file_system_nfs_v3_locks_response_to_yojson
    (x : release_file_system_nfs_v3_locks_response) =
  assoc_to_yojson [ ("FileSystem", option_to_yojson file_system_to_yojson x.file_system) ]

let release_file_system_nfs_v3_locks_request_to_yojson
    (x : release_file_system_nfs_v3_locks_request) =
  assoc_to_yojson
    [
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("FileSystemId", Some (file_system_id_to_yojson x.file_system_id));
    ]

let duration_since_last_access_to_yojson (x : duration_since_last_access) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson value_to_yojson x.value);
      ("Unit", option_to_yojson unit__to_yojson x.unit_);
    ]

let release_configuration_to_yojson (x : release_configuration) =
  assoc_to_yojson
    [
      ( "DurationSinceLastAccess",
        option_to_yojson duration_since_last_access_to_yojson x.duration_since_last_access );
    ]

let region_to_yojson = string_to_yojson

let open_zfs_create_root_volume_configuration_to_yojson
    (x : open_zfs_create_root_volume_configuration) =
  assoc_to_yojson
    [
      ("ReadOnly", option_to_yojson read_only_to_yojson x.read_only);
      ("CopyTagsToSnapshots", option_to_yojson flag_to_yojson x.copy_tags_to_snapshots);
      ( "UserAndGroupQuotas",
        option_to_yojson open_zfs_user_and_group_quotas_to_yojson x.user_and_group_quotas );
      ("NfsExports", option_to_yojson open_zfs_nfs_exports_to_yojson x.nfs_exports);
      ( "DataCompressionType",
        option_to_yojson open_zfs_data_compression_type_to_yojson x.data_compression_type );
      ("RecordSizeKiB", option_to_yojson integer_record_size_ki_b_to_yojson x.record_size_ki_b);
    ]

let next_token_to_yojson = string_to_yojson
let max_results_to_yojson = int_to_yojson

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("ResourceARN", Some (resource_ar_n_to_yojson x.resource_ar_n));
    ]

let limited_max_results_to_yojson = int_to_yojson
let last_updated_time_to_yojson = timestamp_epoch_seconds_to_yojson

let invalid_source_kms_key_to_yojson (x : invalid_source_kms_key) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_request_to_yojson (x : invalid_request) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
    ]

let invalid_region_to_yojson (x : invalid_region) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_per_unit_storage_throughput_to_yojson (x : invalid_per_unit_storage_throughput) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_import_path_to_yojson (x : invalid_import_path) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_export_path_to_yojson (x : invalid_export_path) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_destination_kms_key_to_yojson (x : invalid_destination_kms_key) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_data_repository_type_to_yojson (x : invalid_data_repository_type) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_access_point_to_yojson (x : invalid_access_point) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
    ]

let input_ontap_volume_type_to_yojson (x : input_ontap_volume_type) =
  match x with DP -> `String "DP" | RW -> `String "RW"

let incompatible_region_for_multi_a_z_to_yojson (x : incompatible_region_for_multi_a_z) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let include_shared_to_yojson = bool_to_yojson

let filter_name_to_yojson (x : filter_name) =
  match x with
  | FILE_CACHE_TYPE -> `String "file-cache-type"
  | FILE_CACHE_ID -> `String "file-cache-id"
  | DATA_REPOSITORY_TYPE -> `String "data-repository-type"
  | VOLUME_ID -> `String "volume-id"
  | FILE_SYSTEM_TYPE -> `String "file-system-type"
  | BACKUP_TYPE -> `String "backup-type"
  | FILE_SYSTEM_ID -> `String "file-system-id"

let filter_value_to_yojson = string_to_yojson
let filter_values_to_yojson tree = list_to_yojson filter_value_to_yojson tree

let filter_to_yojson (x : filter) =
  assoc_to_yojson
    [
      ("Values", option_to_yojson filter_values_to_yojson x.values);
      ("Name", option_to_yojson filter_name_to_yojson x.name);
    ]

let filters_to_yojson tree = list_to_yojson filter_to_yojson tree
let file_systems_to_yojson tree = list_to_yojson file_system_to_yojson tree
let file_system_ids_to_yojson tree = list_to_yojson file_system_id_to_yojson tree
let file_caches_to_yojson tree = list_to_yojson file_cache_to_yojson tree

let file_cache_nfs_configuration_to_yojson (x : file_cache_nfs_configuration) =
  assoc_to_yojson
    [
      ("DnsIps", option_to_yojson repository_dns_ips_to_yojson x.dns_ips);
      ("Version", Some (nfs_version_to_yojson x.version));
    ]

let file_cache_ids_to_yojson tree = list_to_yojson file_cache_id_to_yojson tree

let file_cache_data_repository_association_to_yojson (x : file_cache_data_repository_association) =
  assoc_to_yojson
    [
      ("NFS", option_to_yojson file_cache_nfs_configuration_to_yojson x.nf_s);
      ( "DataRepositorySubdirectories",
        option_to_yojson sub_directories_paths_to_yojson x.data_repository_subdirectories );
      ("DataRepositoryPath", Some (archive_path_to_yojson x.data_repository_path));
      ("FileCachePath", Some (namespace_to_yojson x.file_cache_path));
    ]

let copy_tags_to_data_repository_associations_to_yojson = bool_to_yojson

let file_cache_creating_to_yojson (x : file_cache_creating) =
  assoc_to_yojson
    [
      ( "DataRepositoryAssociationIds",
        option_to_yojson data_repository_association_ids_to_yojson x.data_repository_association_ids
      );
      ( "LustreConfiguration",
        option_to_yojson file_cache_lustre_configuration_to_yojson x.lustre_configuration );
      ( "CopyTagsToDataRepositoryAssociations",
        option_to_yojson copy_tags_to_data_repository_associations_to_yojson
          x.copy_tags_to_data_repository_associations );
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("ResourceARN", option_to_yojson resource_ar_n_to_yojson x.resource_ar_n);
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("DNSName", option_to_yojson dns_name_to_yojson x.dns_name);
      ( "NetworkInterfaceIds",
        option_to_yojson network_interface_ids_to_yojson x.network_interface_ids );
      ("SubnetIds", option_to_yojson subnet_ids_to_yojson x.subnet_ids);
      ("VpcId", option_to_yojson vpc_id_to_yojson x.vpc_id);
      ("StorageCapacity", option_to_yojson storage_capacity_to_yojson x.storage_capacity);
      ("FailureDetails", option_to_yojson file_cache_failure_details_to_yojson x.failure_details);
      ("Lifecycle", option_to_yojson file_cache_lifecycle_to_yojson x.lifecycle);
      ( "FileCacheTypeVersion",
        option_to_yojson file_system_type_version_to_yojson x.file_cache_type_version );
      ("FileCacheType", option_to_yojson file_cache_type_to_yojson x.file_cache_type);
      ("FileCacheId", option_to_yojson file_cache_id_to_yojson x.file_cache_id);
      ("CreationTime", option_to_yojson creation_time_to_yojson x.creation_time);
      ("OwnerId", option_to_yojson aws_account_id_to_yojson x.owner_id);
    ]

let failed_count_to_yojson = long_to_yojson
let end_time_to_yojson = timestamp_epoch_seconds_to_yojson

let disassociate_file_system_aliases_response_to_yojson
    (x : disassociate_file_system_aliases_response) =
  assoc_to_yojson [ ("Aliases", option_to_yojson aliases_to_yojson x.aliases) ]

let alternate_dns_names_to_yojson tree = list_to_yojson alternate_dns_name_to_yojson tree

let disassociate_file_system_aliases_request_to_yojson
    (x : disassociate_file_system_aliases_request) =
  assoc_to_yojson
    [
      ("Aliases", Some (alternate_dns_names_to_yojson x.aliases));
      ("FileSystemId", Some (file_system_id_to_yojson x.file_system_id));
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let detach_and_delete_s3_access_point_response_to_yojson
    (x : detach_and_delete_s3_access_point_response) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson s3_access_point_attachment_name_to_yojson x.name);
      ("Lifecycle", option_to_yojson s3_access_point_attachment_lifecycle_to_yojson x.lifecycle);
    ]

let detach_and_delete_s3_access_point_request_to_yojson
    (x : detach_and_delete_s3_access_point_request) =
  assoc_to_yojson
    [
      ("Name", Some (s3_access_point_attachment_name_to_yojson x.name));
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let describe_volumes_response_to_yojson (x : describe_volumes_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Volumes", option_to_yojson volumes_to_yojson x.volumes);
    ]

let describe_volumes_request_to_yojson (x : describe_volumes_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("Filters", option_to_yojson volume_filters_to_yojson x.filters);
      ("VolumeIds", option_to_yojson volume_ids_to_yojson x.volume_ids);
    ]

let describe_storage_virtual_machines_response_to_yojson
    (x : describe_storage_virtual_machines_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "StorageVirtualMachines",
        option_to_yojson storage_virtual_machines_to_yojson x.storage_virtual_machines );
    ]

let describe_storage_virtual_machines_request_to_yojson
    (x : describe_storage_virtual_machines_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("Filters", option_to_yojson storage_virtual_machine_filters_to_yojson x.filters);
      ( "StorageVirtualMachineIds",
        option_to_yojson storage_virtual_machine_ids_to_yojson x.storage_virtual_machine_ids );
    ]

let describe_snapshots_response_to_yojson (x : describe_snapshots_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Snapshots", option_to_yojson snapshots_to_yojson x.snapshots);
    ]

let describe_snapshots_request_to_yojson (x : describe_snapshots_request) =
  assoc_to_yojson
    [
      ("IncludeShared", option_to_yojson include_shared_to_yojson x.include_shared);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("Filters", option_to_yojson snapshot_filters_to_yojson x.filters);
      ("SnapshotIds", option_to_yojson snapshot_ids_to_yojson x.snapshot_ids);
    ]

let describe_shared_vpc_configuration_response_to_yojson
    (x : describe_shared_vpc_configuration_response) =
  assoc_to_yojson
    [
      ( "EnableFsxRouteTableUpdatesFromParticipantAccounts",
        option_to_yojson verbose_flag_to_yojson
          x.enable_fsx_route_table_updates_from_participant_accounts );
    ]

let describe_shared_vpc_configuration_request_to_yojson = unit_to_yojson

let describe_s3_access_point_attachments_response_to_yojson
    (x : describe_s3_access_point_attachments_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "S3AccessPointAttachments",
        option_to_yojson s3_access_point_attachments_to_yojson x.s3_access_point_attachments );
    ]

let describe_s3_access_point_attachments_request_to_yojson
    (x : describe_s3_access_point_attachments_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("Filters", option_to_yojson s3_access_point_attachments_filters_to_yojson x.filters);
      ("Names", option_to_yojson s3_access_point_attachment_names_to_yojson x.names);
    ]

let describe_file_systems_response_to_yojson (x : describe_file_systems_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("FileSystems", option_to_yojson file_systems_to_yojson x.file_systems);
    ]

let describe_file_systems_request_to_yojson (x : describe_file_systems_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("FileSystemIds", option_to_yojson file_system_ids_to_yojson x.file_system_ids);
    ]

let describe_file_system_aliases_response_to_yojson (x : describe_file_system_aliases_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Aliases", option_to_yojson aliases_to_yojson x.aliases);
    ]

let describe_file_system_aliases_request_to_yojson (x : describe_file_system_aliases_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("FileSystemId", Some (file_system_id_to_yojson x.file_system_id));
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let describe_file_caches_response_to_yojson (x : describe_file_caches_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("FileCaches", option_to_yojson file_caches_to_yojson x.file_caches);
    ]

let describe_file_caches_request_to_yojson (x : describe_file_caches_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("FileCacheIds", option_to_yojson file_cache_ids_to_yojson x.file_cache_ids);
    ]

let data_repository_task_lifecycle_to_yojson (x : data_repository_task_lifecycle) =
  match x with
  | CANCELING -> `String "CANCELING"
  | CANCELED -> `String "CANCELED"
  | SUCCEEDED -> `String "SUCCEEDED"
  | FAILED -> `String "FAILED"
  | EXECUTING -> `String "EXECUTING"
  | PENDING -> `String "PENDING"

let data_repository_task_type_to_yojson (x : data_repository_task_type) =
  match x with
  | AUTO_TRIGGERED_EVICTION -> `String "AUTO_RELEASE_DATA"
  | EVICTION -> `String "RELEASE_DATA_FROM_FILESYSTEM"
  | IMPORT -> `String "IMPORT_METADATA_FROM_REPOSITORY"
  | EXPORT -> `String "EXPORT_TO_REPOSITORY"

let data_repository_task_path_to_yojson = string_to_yojson

let data_repository_task_paths_to_yojson tree =
  list_to_yojson data_repository_task_path_to_yojson tree

let data_repository_task_failure_details_to_yojson (x : data_repository_task_failure_details) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let data_repository_task_status_to_yojson (x : data_repository_task_status) =
  assoc_to_yojson
    [
      ("ReleasedCapacity", option_to_yojson released_capacity_to_yojson x.released_capacity);
      ("LastUpdatedTime", option_to_yojson last_updated_time_to_yojson x.last_updated_time);
      ("FailedCount", option_to_yojson failed_count_to_yojson x.failed_count);
      ("SucceededCount", option_to_yojson succeeded_count_to_yojson x.succeeded_count);
      ("TotalCount", option_to_yojson total_count_to_yojson x.total_count);
    ]

let completion_report_to_yojson (x : completion_report) =
  assoc_to_yojson
    [
      ("Scope", option_to_yojson report_scope_to_yojson x.scope);
      ("Format", option_to_yojson report_format_to_yojson x.format);
      ("Path", option_to_yojson archive_path_to_yojson x.path);
      ("Enabled", Some (flag_to_yojson x.enabled));
    ]

let capacity_to_release_to_yojson = long_to_yojson

let data_repository_task_to_yojson (x : data_repository_task) =
  assoc_to_yojson
    [
      ( "ReleaseConfiguration",
        option_to_yojson release_configuration_to_yojson x.release_configuration );
      ("FileCacheId", option_to_yojson file_cache_id_to_yojson x.file_cache_id);
      ("CapacityToRelease", option_to_yojson capacity_to_release_to_yojson x.capacity_to_release);
      ("Report", option_to_yojson completion_report_to_yojson x.report);
      ("Status", option_to_yojson data_repository_task_status_to_yojson x.status);
      ( "FailureDetails",
        option_to_yojson data_repository_task_failure_details_to_yojson x.failure_details );
      ("Paths", option_to_yojson data_repository_task_paths_to_yojson x.paths);
      ("FileSystemId", option_to_yojson file_system_id_to_yojson x.file_system_id);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("ResourceARN", option_to_yojson resource_ar_n_to_yojson x.resource_ar_n);
      ("EndTime", option_to_yojson end_time_to_yojson x.end_time);
      ("StartTime", option_to_yojson start_time_to_yojson x.start_time);
      ("CreationTime", Some (creation_time_to_yojson x.creation_time));
      ("Type", Some (data_repository_task_type_to_yojson x.type_));
      ("Lifecycle", Some (data_repository_task_lifecycle_to_yojson x.lifecycle));
      ("TaskId", Some (task_id_to_yojson x.task_id));
    ]

let data_repository_tasks_to_yojson tree = list_to_yojson data_repository_task_to_yojson tree

let describe_data_repository_tasks_response_to_yojson (x : describe_data_repository_tasks_response)
    =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "DataRepositoryTasks",
        option_to_yojson data_repository_tasks_to_yojson x.data_repository_tasks );
    ]

let data_repository_task_filter_name_to_yojson (x : data_repository_task_filter_name) =
  match x with
  | FILE_CACHE_ID -> `String "file-cache-id"
  | DATA_REPO_ASSOCIATION_ID -> `String "data-repository-association-id"
  | TASK_LIFECYCLE -> `String "task-lifecycle"
  | FILE_SYSTEM_ID -> `String "file-system-id"

let data_repository_task_filter_value_to_yojson = string_to_yojson

let data_repository_task_filter_values_to_yojson tree =
  list_to_yojson data_repository_task_filter_value_to_yojson tree

let data_repository_task_filter_to_yojson (x : data_repository_task_filter) =
  assoc_to_yojson
    [
      ("Values", option_to_yojson data_repository_task_filter_values_to_yojson x.values);
      ("Name", option_to_yojson data_repository_task_filter_name_to_yojson x.name);
    ]

let data_repository_task_filters_to_yojson tree =
  list_to_yojson data_repository_task_filter_to_yojson tree

let describe_data_repository_tasks_request_to_yojson (x : describe_data_repository_tasks_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("Filters", option_to_yojson data_repository_task_filters_to_yojson x.filters);
      ("TaskIds", option_to_yojson task_ids_to_yojson x.task_ids);
    ]

let data_repository_task_not_found_to_yojson (x : data_repository_task_not_found) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let data_repository_associations_to_yojson tree =
  list_to_yojson data_repository_association_to_yojson tree

let describe_data_repository_associations_response_to_yojson
    (x : describe_data_repository_associations_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Associations", option_to_yojson data_repository_associations_to_yojson x.associations);
    ]

let describe_data_repository_associations_request_to_yojson
    (x : describe_data_repository_associations_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson limited_max_results_to_yojson x.max_results);
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ( "AssociationIds",
        option_to_yojson data_repository_association_ids_to_yojson x.association_ids );
    ]

let backup_lifecycle_to_yojson (x : backup_lifecycle) =
  match x with
  | COPYING -> `String "COPYING"
  | PENDING -> `String "PENDING"
  | FAILED -> `String "FAILED"
  | DELETED -> `String "DELETED"
  | TRANSFERRING -> `String "TRANSFERRING"
  | CREATING -> `String "CREATING"
  | AVAILABLE -> `String "AVAILABLE"

let backup_failure_details_to_yojson (x : backup_failure_details) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let backup_type_to_yojson (x : backup_type) =
  match x with
  | AWS_BACKUP -> `String "AWS_BACKUP"
  | USER_INITIATED -> `String "USER_INITIATED"
  | AUTOMATIC -> `String "AUTOMATIC"

let active_directory_backup_attributes_to_yojson (x : active_directory_backup_attributes) =
  assoc_to_yojson
    [
      ("ResourceARN", option_to_yojson resource_ar_n_to_yojson x.resource_ar_n);
      ("ActiveDirectoryId", option_to_yojson directory_id_to_yojson x.active_directory_id);
      ("DomainName", option_to_yojson active_directory_fully_qualified_name_to_yojson x.domain_name);
    ]

let backup_to_yojson (x : backup) =
  assoc_to_yojson
    [
      ("SizeInBytes", option_to_yojson size_in_bytes_to_yojson x.size_in_bytes);
      ("Volume", option_to_yojson volume_to_yojson x.volume);
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("SourceBackupRegion", option_to_yojson region_to_yojson x.source_backup_region);
      ("SourceBackupId", option_to_yojson backup_id_to_yojson x.source_backup_id);
      ("OwnerId", option_to_yojson aws_account_id_to_yojson x.owner_id);
      ( "DirectoryInformation",
        option_to_yojson active_directory_backup_attributes_to_yojson x.directory_information );
      ("FileSystem", Some (file_system_to_yojson x.file_system));
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("ResourceARN", option_to_yojson resource_ar_n_to_yojson x.resource_ar_n);
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("CreationTime", Some (creation_time_to_yojson x.creation_time));
      ("ProgressPercent", option_to_yojson progress_percent_to_yojson x.progress_percent);
      ("Type", Some (backup_type_to_yojson x.type_));
      ("FailureDetails", option_to_yojson backup_failure_details_to_yojson x.failure_details);
      ("Lifecycle", Some (backup_lifecycle_to_yojson x.lifecycle));
      ("BackupId", Some (backup_id_to_yojson x.backup_id));
    ]

let backups_to_yojson tree = list_to_yojson backup_to_yojson tree

let describe_backups_response_to_yojson (x : describe_backups_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Backups", option_to_yojson backups_to_yojson x.backups);
    ]

let backup_ids_to_yojson tree = list_to_yojson backup_id_to_yojson tree

let describe_backups_request_to_yojson (x : describe_backups_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ("BackupIds", option_to_yojson backup_ids_to_yojson x.backup_ids);
    ]

let backup_not_found_to_yojson (x : backup_not_found) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let delete_volume_ontap_response_to_yojson (x : delete_volume_ontap_response) =
  assoc_to_yojson
    [
      ("FinalBackupTags", option_to_yojson tags_to_yojson x.final_backup_tags);
      ("FinalBackupId", option_to_yojson backup_id_to_yojson x.final_backup_id);
    ]

let delete_volume_response_to_yojson (x : delete_volume_response) =
  assoc_to_yojson
    [
      ("OntapResponse", option_to_yojson delete_volume_ontap_response_to_yojson x.ontap_response);
      ("Lifecycle", option_to_yojson volume_lifecycle_to_yojson x.lifecycle);
      ("VolumeId", option_to_yojson volume_id_to_yojson x.volume_id);
    ]

let delete_volume_ontap_configuration_to_yojson (x : delete_volume_ontap_configuration) =
  assoc_to_yojson
    [
      ( "BypassSnaplockEnterpriseRetention",
        option_to_yojson flag_to_yojson x.bypass_snaplock_enterprise_retention );
      ("FinalBackupTags", option_to_yojson tags_to_yojson x.final_backup_tags);
      ("SkipFinalBackup", option_to_yojson flag_to_yojson x.skip_final_backup);
    ]

let delete_open_zfs_volume_option_to_yojson (x : delete_open_zfs_volume_option) =
  match x with DELETE_CHILD_VOLUMES_AND_SNAPSHOTS -> `String "DELETE_CHILD_VOLUMES_AND_SNAPSHOTS"

let delete_open_zfs_volume_options_to_yojson tree =
  list_to_yojson delete_open_zfs_volume_option_to_yojson tree

let delete_volume_open_zfs_configuration_to_yojson (x : delete_volume_open_zfs_configuration) =
  assoc_to_yojson
    [ ("Options", option_to_yojson delete_open_zfs_volume_options_to_yojson x.options) ]

let delete_volume_request_to_yojson (x : delete_volume_request) =
  assoc_to_yojson
    [
      ( "OpenZFSConfiguration",
        option_to_yojson delete_volume_open_zfs_configuration_to_yojson x.open_zfs_configuration );
      ( "OntapConfiguration",
        option_to_yojson delete_volume_ontap_configuration_to_yojson x.ontap_configuration );
      ("VolumeId", Some (volume_id_to_yojson x.volume_id));
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let delete_storage_virtual_machine_response_to_yojson (x : delete_storage_virtual_machine_response)
    =
  assoc_to_yojson
    [
      ("Lifecycle", option_to_yojson storage_virtual_machine_lifecycle_to_yojson x.lifecycle);
      ( "StorageVirtualMachineId",
        option_to_yojson storage_virtual_machine_id_to_yojson x.storage_virtual_machine_id );
    ]

let delete_storage_virtual_machine_request_to_yojson (x : delete_storage_virtual_machine_request) =
  assoc_to_yojson
    [
      ( "StorageVirtualMachineId",
        Some (storage_virtual_machine_id_to_yojson x.storage_virtual_machine_id) );
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let delete_snapshot_response_to_yojson (x : delete_snapshot_response) =
  assoc_to_yojson
    [
      ("Lifecycle", option_to_yojson snapshot_lifecycle_to_yojson x.lifecycle);
      ("SnapshotId", option_to_yojson snapshot_id_to_yojson x.snapshot_id);
    ]

let delete_snapshot_request_to_yojson (x : delete_snapshot_request) =
  assoc_to_yojson
    [
      ("SnapshotId", Some (snapshot_id_to_yojson x.snapshot_id));
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let delete_file_system_windows_response_to_yojson (x : delete_file_system_windows_response) =
  assoc_to_yojson
    [
      ("FinalBackupTags", option_to_yojson tags_to_yojson x.final_backup_tags);
      ("FinalBackupId", option_to_yojson backup_id_to_yojson x.final_backup_id);
    ]

let delete_file_system_windows_configuration_to_yojson
    (x : delete_file_system_windows_configuration) =
  assoc_to_yojson
    [
      ("FinalBackupTags", option_to_yojson tags_to_yojson x.final_backup_tags);
      ("SkipFinalBackup", option_to_yojson flag_to_yojson x.skip_final_backup);
    ]

let delete_file_system_lustre_response_to_yojson (x : delete_file_system_lustre_response) =
  assoc_to_yojson
    [
      ("FinalBackupTags", option_to_yojson tags_to_yojson x.final_backup_tags);
      ("FinalBackupId", option_to_yojson backup_id_to_yojson x.final_backup_id);
    ]

let delete_file_system_open_zfs_response_to_yojson (x : delete_file_system_open_zfs_response) =
  assoc_to_yojson
    [
      ("FinalBackupTags", option_to_yojson tags_to_yojson x.final_backup_tags);
      ("FinalBackupId", option_to_yojson backup_id_to_yojson x.final_backup_id);
    ]

let delete_file_system_response_to_yojson (x : delete_file_system_response) =
  assoc_to_yojson
    [
      ( "OpenZFSResponse",
        option_to_yojson delete_file_system_open_zfs_response_to_yojson x.open_zfs_response );
      ( "LustreResponse",
        option_to_yojson delete_file_system_lustre_response_to_yojson x.lustre_response );
      ( "WindowsResponse",
        option_to_yojson delete_file_system_windows_response_to_yojson x.windows_response );
      ("Lifecycle", option_to_yojson file_system_lifecycle_to_yojson x.lifecycle);
      ("FileSystemId", option_to_yojson file_system_id_to_yojson x.file_system_id);
    ]

let delete_file_system_lustre_configuration_to_yojson (x : delete_file_system_lustre_configuration)
    =
  assoc_to_yojson
    [
      ("FinalBackupTags", option_to_yojson tags_to_yojson x.final_backup_tags);
      ("SkipFinalBackup", option_to_yojson flag_to_yojson x.skip_final_backup);
    ]

let delete_file_system_open_zfs_option_to_yojson (x : delete_file_system_open_zfs_option) =
  match x with DELETE_CHILD_VOLUMES_AND_SNAPSHOTS -> `String "DELETE_CHILD_VOLUMES_AND_SNAPSHOTS"

let delete_file_system_open_zfs_options_to_yojson tree =
  list_to_yojson delete_file_system_open_zfs_option_to_yojson tree

let delete_file_system_open_zfs_configuration_to_yojson
    (x : delete_file_system_open_zfs_configuration) =
  assoc_to_yojson
    [
      ("Options", option_to_yojson delete_file_system_open_zfs_options_to_yojson x.options);
      ("FinalBackupTags", option_to_yojson tags_to_yojson x.final_backup_tags);
      ("SkipFinalBackup", option_to_yojson flag_to_yojson x.skip_final_backup);
    ]

let delete_file_system_request_to_yojson (x : delete_file_system_request) =
  assoc_to_yojson
    [
      ( "OpenZFSConfiguration",
        option_to_yojson delete_file_system_open_zfs_configuration_to_yojson
          x.open_zfs_configuration );
      ( "LustreConfiguration",
        option_to_yojson delete_file_system_lustre_configuration_to_yojson x.lustre_configuration );
      ( "WindowsConfiguration",
        option_to_yojson delete_file_system_windows_configuration_to_yojson x.windows_configuration
      );
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("FileSystemId", Some (file_system_id_to_yojson x.file_system_id));
    ]

let delete_file_cache_response_to_yojson (x : delete_file_cache_response) =
  assoc_to_yojson
    [
      ("Lifecycle", option_to_yojson file_cache_lifecycle_to_yojson x.lifecycle);
      ("FileCacheId", option_to_yojson file_cache_id_to_yojson x.file_cache_id);
    ]

let delete_file_cache_request_to_yojson (x : delete_file_cache_request) =
  assoc_to_yojson
    [
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("FileCacheId", Some (file_cache_id_to_yojson x.file_cache_id));
    ]

let delete_data_in_file_system_to_yojson = bool_to_yojson

let delete_data_repository_association_response_to_yojson
    (x : delete_data_repository_association_response) =
  assoc_to_yojson
    [
      ( "DeleteDataInFileSystem",
        option_to_yojson delete_data_in_file_system_to_yojson x.delete_data_in_file_system );
      ("Lifecycle", option_to_yojson data_repository_lifecycle_to_yojson x.lifecycle);
      ("AssociationId", option_to_yojson data_repository_association_id_to_yojson x.association_id);
    ]

let delete_data_repository_association_request_to_yojson
    (x : delete_data_repository_association_request) =
  assoc_to_yojson
    [
      ( "DeleteDataInFileSystem",
        option_to_yojson delete_data_in_file_system_to_yojson x.delete_data_in_file_system );
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("AssociationId", Some (data_repository_association_id_to_yojson x.association_id));
    ]

let delete_backup_response_to_yojson (x : delete_backup_response) =
  assoc_to_yojson
    [
      ("Lifecycle", option_to_yojson backup_lifecycle_to_yojson x.lifecycle);
      ("BackupId", option_to_yojson backup_id_to_yojson x.backup_id);
    ]

let delete_backup_request_to_yojson (x : delete_backup_request) =
  assoc_to_yojson
    [
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("BackupId", Some (backup_id_to_yojson x.backup_id));
    ]

let backup_restoring_to_yojson (x : backup_restoring) =
  assoc_to_yojson
    [
      ("FileSystemId", option_to_yojson file_system_id_to_yojson x.file_system_id);
      ("Message", option_to_yojson error_message_to_yojson x.message);
    ]

let backup_in_progress_to_yojson (x : backup_in_progress) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let backup_being_copied_to_yojson (x : backup_being_copied) =
  assoc_to_yojson
    [
      ("BackupId", option_to_yojson backup_id_to_yojson x.backup_id);
      ("Message", option_to_yojson error_message_to_yojson x.message);
    ]

let data_repository_task_executing_to_yojson (x : data_repository_task_executing) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let data_repository_task_ended_to_yojson (x : data_repository_task_ended) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let create_volume_response_to_yojson (x : create_volume_response) =
  assoc_to_yojson [ ("Volume", option_to_yojson volume_to_yojson x.volume) ]

let create_snaplock_configuration_to_yojson (x : create_snaplock_configuration) =
  assoc_to_yojson
    [
      ("VolumeAppendModeEnabled", option_to_yojson flag_to_yojson x.volume_append_mode_enabled);
      ("SnaplockType", Some (snaplock_type_to_yojson x.snaplock_type));
      ("RetentionPeriod", option_to_yojson snaplock_retention_period_to_yojson x.retention_period);
      ("PrivilegedDelete", option_to_yojson privileged_delete_to_yojson x.privileged_delete);
      ("AutocommitPeriod", option_to_yojson autocommit_period_to_yojson x.autocommit_period);
      ("AuditLogVolume", option_to_yojson flag_to_yojson x.audit_log_volume);
    ]

let aggregate_list_multiplier_to_yojson = int_to_yojson

let create_aggregate_configuration_to_yojson (x : create_aggregate_configuration) =
  assoc_to_yojson
    [
      ( "ConstituentsPerAggregate",
        option_to_yojson aggregate_list_multiplier_to_yojson x.constituents_per_aggregate );
      ("Aggregates", option_to_yojson aggregates_to_yojson x.aggregates);
    ]

let create_ontap_volume_configuration_to_yojson (x : create_ontap_volume_configuration) =
  assoc_to_yojson
    [
      ("SizeInBytes", option_to_yojson volume_capacity_bytes_to_yojson x.size_in_bytes);
      ( "AggregateConfiguration",
        option_to_yojson create_aggregate_configuration_to_yojson x.aggregate_configuration );
      ("VolumeStyle", option_to_yojson volume_style_to_yojson x.volume_style);
      ( "SnaplockConfiguration",
        option_to_yojson create_snaplock_configuration_to_yojson x.snaplock_configuration );
      ("CopyTagsToBackups", option_to_yojson flag_to_yojson x.copy_tags_to_backups);
      ("SnapshotPolicy", option_to_yojson snapshot_policy_to_yojson x.snapshot_policy);
      ("OntapVolumeType", option_to_yojson input_ontap_volume_type_to_yojson x.ontap_volume_type);
      ("TieringPolicy", option_to_yojson tiering_policy_to_yojson x.tiering_policy);
      ( "StorageVirtualMachineId",
        Some (storage_virtual_machine_id_to_yojson x.storage_virtual_machine_id) );
      ("StorageEfficiencyEnabled", option_to_yojson flag_to_yojson x.storage_efficiency_enabled);
      ("SizeInMegabytes", option_to_yojson volume_capacity_to_yojson x.size_in_megabytes);
      ("SecurityStyle", option_to_yojson security_style_to_yojson x.security_style);
      ("JunctionPath", option_to_yojson junction_path_to_yojson x.junction_path);
    ]

let create_open_zfs_origin_snapshot_configuration_to_yojson
    (x : create_open_zfs_origin_snapshot_configuration) =
  assoc_to_yojson
    [
      ("CopyStrategy", Some (open_zfs_copy_strategy_to_yojson x.copy_strategy));
      ("SnapshotARN", Some (resource_ar_n_to_yojson x.snapshot_ar_n));
    ]

let create_open_zfs_volume_configuration_to_yojson (x : create_open_zfs_volume_configuration) =
  assoc_to_yojson
    [
      ( "UserAndGroupQuotas",
        option_to_yojson open_zfs_user_and_group_quotas_to_yojson x.user_and_group_quotas );
      ("NfsExports", option_to_yojson open_zfs_nfs_exports_to_yojson x.nfs_exports);
      ("ReadOnly", option_to_yojson read_only_to_yojson x.read_only);
      ( "OriginSnapshot",
        option_to_yojson create_open_zfs_origin_snapshot_configuration_to_yojson x.origin_snapshot
      );
      ("CopyTagsToSnapshots", option_to_yojson flag_to_yojson x.copy_tags_to_snapshots);
      ( "DataCompressionType",
        option_to_yojson open_zfs_data_compression_type_to_yojson x.data_compression_type );
      ("RecordSizeKiB", option_to_yojson integer_record_size_ki_b_to_yojson x.record_size_ki_b);
      ( "StorageCapacityQuotaGiB",
        option_to_yojson integer_no_max_from_negative_one_to_yojson x.storage_capacity_quota_gi_b );
      ( "StorageCapacityReservationGiB",
        option_to_yojson integer_no_max_from_negative_one_to_yojson
          x.storage_capacity_reservation_gi_b );
      ("ParentVolumeId", Some (volume_id_to_yojson x.parent_volume_id));
    ]

let create_volume_request_to_yojson (x : create_volume_request) =
  assoc_to_yojson
    [
      ( "OpenZFSConfiguration",
        option_to_yojson create_open_zfs_volume_configuration_to_yojson x.open_zfs_configuration );
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ( "OntapConfiguration",
        option_to_yojson create_ontap_volume_configuration_to_yojson x.ontap_configuration );
      ("Name", Some (volume_name_to_yojson x.name));
      ("VolumeType", Some (volume_type_to_yojson x.volume_type));
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_volume_from_backup_response_to_yojson (x : create_volume_from_backup_response) =
  assoc_to_yojson [ ("Volume", option_to_yojson volume_to_yojson x.volume) ]

let create_volume_from_backup_request_to_yojson (x : create_volume_from_backup_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ( "OntapConfiguration",
        option_to_yojson create_ontap_volume_configuration_to_yojson x.ontap_configuration );
      ("Name", Some (volume_name_to_yojson x.name));
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("BackupId", Some (backup_id_to_yojson x.backup_id));
    ]

let create_svm_active_directory_configuration_to_yojson
    (x : create_svm_active_directory_configuration) =
  assoc_to_yojson
    [
      ( "SelfManagedActiveDirectoryConfiguration",
        option_to_yojson self_managed_active_directory_configuration_to_yojson
          x.self_managed_active_directory_configuration );
      ("NetBiosName", Some (net_bios_alias_to_yojson x.net_bios_name));
    ]

let create_storage_virtual_machine_response_to_yojson (x : create_storage_virtual_machine_response)
    =
  assoc_to_yojson
    [
      ( "StorageVirtualMachine",
        option_to_yojson storage_virtual_machine_to_yojson x.storage_virtual_machine );
    ]

let create_storage_virtual_machine_request_to_yojson (x : create_storage_virtual_machine_request) =
  assoc_to_yojson
    [
      ( "RootVolumeSecurityStyle",
        option_to_yojson storage_virtual_machine_root_volume_security_style_to_yojson
          x.root_volume_security_style );
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("SvmAdminPassword", option_to_yojson admin_password_to_yojson x.svm_admin_password);
      ("Name", Some (storage_virtual_machine_name_to_yojson x.name));
      ("FileSystemId", Some (file_system_id_to_yojson x.file_system_id));
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "ActiveDirectoryConfiguration",
        option_to_yojson create_svm_active_directory_configuration_to_yojson
          x.active_directory_configuration );
    ]

let active_directory_error_type_to_yojson (x : active_directory_error_type) =
  match x with
  | INVALID_DOMAIN_STAGE -> `String "INVALID_DOMAIN_STAGE"
  | INVALID_NETWORK_TYPE -> `String "INVALID_NETWORK_TYPE"
  | WRONG_VPC -> `String "WRONG_VPC"
  | INCOMPATIBLE_DOMAIN_MODE -> `String "INCOMPATIBLE_DOMAIN_MODE"
  | DOMAIN_NOT_FOUND -> `String "DOMAIN_NOT_FOUND"

let active_directory_error_to_yojson (x : active_directory_error) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("Type", option_to_yojson active_directory_error_type_to_yojson x.type_);
      ("ActiveDirectoryId", Some (directory_id_to_yojson x.active_directory_id));
    ]

let create_snapshot_response_to_yojson (x : create_snapshot_response) =
  assoc_to_yojson [ ("Snapshot", option_to_yojson snapshot_to_yojson x.snapshot) ]

let create_snapshot_request_to_yojson (x : create_snapshot_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("VolumeId", Some (volume_id_to_yojson x.volume_id));
      ("Name", Some (snapshot_name_to_yojson x.name));
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_file_system_windows_configuration_to_yojson
    (x : create_file_system_windows_configuration) =
  assoc_to_yojson
    [
      ( "FsrmConfiguration",
        option_to_yojson windows_fsrm_configuration_to_yojson x.fsrm_configuration );
      ( "DiskIopsConfiguration",
        option_to_yojson disk_iops_configuration_to_yojson x.disk_iops_configuration );
      ( "AuditLogConfiguration",
        option_to_yojson windows_audit_log_create_configuration_to_yojson x.audit_log_configuration
      );
      ("Aliases", option_to_yojson alternate_dns_names_to_yojson x.aliases);
      ("CopyTagsToBackups", option_to_yojson flag_to_yojson x.copy_tags_to_backups);
      ( "AutomaticBackupRetentionDays",
        option_to_yojson automatic_backup_retention_days_to_yojson x.automatic_backup_retention_days
      );
      ( "DailyAutomaticBackupStartTime",
        option_to_yojson daily_time_to_yojson x.daily_automatic_backup_start_time );
      ( "WeeklyMaintenanceStartTime",
        option_to_yojson weekly_time_to_yojson x.weekly_maintenance_start_time );
      ("ThroughputCapacity", Some (megabytes_per_second_to_yojson x.throughput_capacity));
      ("PreferredSubnetId", option_to_yojson subnet_id_to_yojson x.preferred_subnet_id);
      ("DeploymentType", option_to_yojson windows_deployment_type_to_yojson x.deployment_type);
      ( "SelfManagedActiveDirectoryConfiguration",
        option_to_yojson self_managed_active_directory_configuration_to_yojson
          x.self_managed_active_directory_configuration );
      ("ActiveDirectoryId", option_to_yojson directory_id_to_yojson x.active_directory_id);
    ]

let create_file_system_response_to_yojson (x : create_file_system_response) =
  assoc_to_yojson [ ("FileSystem", option_to_yojson file_system_to_yojson x.file_system) ]

let create_file_system_lustre_metadata_configuration_to_yojson
    (x : create_file_system_lustre_metadata_configuration) =
  assoc_to_yojson
    [
      ("Mode", Some (metadata_configuration_mode_to_yojson x.mode));
      ("Iops", option_to_yojson metadata_iops_to_yojson x.iops);
    ]

let create_file_system_lustre_configuration_to_yojson (x : create_file_system_lustre_configuration)
    =
  assoc_to_yojson
    [
      ( "DataReadCacheConfiguration",
        option_to_yojson lustre_read_cache_configuration_to_yojson x.data_read_cache_configuration
      );
      ( "ThroughputCapacity",
        option_to_yojson throughput_capacity_mbps_to_yojson x.throughput_capacity );
      ( "MetadataConfiguration",
        option_to_yojson create_file_system_lustre_metadata_configuration_to_yojson
          x.metadata_configuration );
      ( "RootSquashConfiguration",
        option_to_yojson lustre_root_squash_configuration_to_yojson x.root_squash_configuration );
      ( "LogConfiguration",
        option_to_yojson lustre_log_create_configuration_to_yojson x.log_configuration );
      ("EfaEnabled", option_to_yojson flag_to_yojson x.efa_enabled);
      ( "DataCompressionType",
        option_to_yojson data_compression_type_to_yojson x.data_compression_type );
      ("DriveCacheType", option_to_yojson drive_cache_type_to_yojson x.drive_cache_type);
      ("CopyTagsToBackups", option_to_yojson flag_to_yojson x.copy_tags_to_backups);
      ( "AutomaticBackupRetentionDays",
        option_to_yojson automatic_backup_retention_days_to_yojson x.automatic_backup_retention_days
      );
      ( "DailyAutomaticBackupStartTime",
        option_to_yojson daily_time_to_yojson x.daily_automatic_backup_start_time );
      ( "PerUnitStorageThroughput",
        option_to_yojson per_unit_storage_throughput_to_yojson x.per_unit_storage_throughput );
      ("AutoImportPolicy", option_to_yojson auto_import_policy_type_to_yojson x.auto_import_policy);
      ("DeploymentType", option_to_yojson lustre_deployment_type_to_yojson x.deployment_type);
      ("ImportedFileChunkSize", option_to_yojson megabytes_to_yojson x.imported_file_chunk_size);
      ("ExportPath", option_to_yojson archive_path_to_yojson x.export_path);
      ("ImportPath", option_to_yojson archive_path_to_yojson x.import_path);
      ( "WeeklyMaintenanceStartTime",
        option_to_yojson weekly_time_to_yojson x.weekly_maintenance_start_time );
    ]

let create_file_system_ontap_configuration_to_yojson (x : create_file_system_ontap_configuration) =
  assoc_to_yojson
    [
      ( "EndpointIpv6AddressRange",
        option_to_yojson ipv6_address_range_to_yojson x.endpoint_ipv6_address_range );
      ( "ThroughputCapacityPerHAPair",
        option_to_yojson throughput_capacity_per_ha_pair_to_yojson x.throughput_capacity_per_ha_pair
      );
      ("HAPairs", option_to_yojson ha_pairs_to_yojson x.ha_pairs);
      ( "WeeklyMaintenanceStartTime",
        option_to_yojson weekly_time_to_yojson x.weekly_maintenance_start_time );
      ("ThroughputCapacity", option_to_yojson megabytes_per_second_to_yojson x.throughput_capacity);
      ("RouteTableIds", option_to_yojson route_table_ids_to_yojson x.route_table_ids);
      ("PreferredSubnetId", option_to_yojson subnet_id_to_yojson x.preferred_subnet_id);
      ( "DiskIopsConfiguration",
        option_to_yojson disk_iops_configuration_to_yojson x.disk_iops_configuration );
      ("FsxAdminPassword", option_to_yojson admin_password_to_yojson x.fsx_admin_password);
      ( "EndpointIpAddressRange",
        option_to_yojson ip_address_range_to_yojson x.endpoint_ip_address_range );
      ("DeploymentType", Some (ontap_deployment_type_to_yojson x.deployment_type));
      ( "DailyAutomaticBackupStartTime",
        option_to_yojson daily_time_to_yojson x.daily_automatic_backup_start_time );
      ( "AutomaticBackupRetentionDays",
        option_to_yojson automatic_backup_retention_days_to_yojson x.automatic_backup_retention_days
      );
    ]

let create_file_system_open_zfs_configuration_to_yojson
    (x : create_file_system_open_zfs_configuration) =
  assoc_to_yojson
    [
      ( "ReadCacheConfiguration",
        option_to_yojson open_zfs_read_cache_configuration_to_yojson x.read_cache_configuration );
      ("RouteTableIds", option_to_yojson route_table_ids_to_yojson x.route_table_ids);
      ( "EndpointIpv6AddressRange",
        option_to_yojson ipv6_address_range_to_yojson x.endpoint_ipv6_address_range );
      ( "EndpointIpAddressRange",
        option_to_yojson ip_address_range_to_yojson x.endpoint_ip_address_range );
      ("PreferredSubnetId", option_to_yojson subnet_id_to_yojson x.preferred_subnet_id);
      ( "RootVolumeConfiguration",
        option_to_yojson open_zfs_create_root_volume_configuration_to_yojson
          x.root_volume_configuration );
      ( "DiskIopsConfiguration",
        option_to_yojson disk_iops_configuration_to_yojson x.disk_iops_configuration );
      ( "WeeklyMaintenanceStartTime",
        option_to_yojson weekly_time_to_yojson x.weekly_maintenance_start_time );
      ("ThroughputCapacity", Some (megabytes_per_second_to_yojson x.throughput_capacity));
      ("DeploymentType", Some (open_zfs_deployment_type_to_yojson x.deployment_type));
      ( "DailyAutomaticBackupStartTime",
        option_to_yojson daily_time_to_yojson x.daily_automatic_backup_start_time );
      ("CopyTagsToVolumes", option_to_yojson flag_to_yojson x.copy_tags_to_volumes);
      ("CopyTagsToBackups", option_to_yojson flag_to_yojson x.copy_tags_to_backups);
      ( "AutomaticBackupRetentionDays",
        option_to_yojson automatic_backup_retention_days_to_yojson x.automatic_backup_retention_days
      );
    ]

let create_file_system_request_to_yojson (x : create_file_system_request) =
  assoc_to_yojson
    [
      ("NetworkType", option_to_yojson network_type_to_yojson x.network_type);
      ( "OpenZFSConfiguration",
        option_to_yojson create_file_system_open_zfs_configuration_to_yojson
          x.open_zfs_configuration );
      ( "FileSystemTypeVersion",
        option_to_yojson file_system_type_version_to_yojson x.file_system_type_version );
      ( "OntapConfiguration",
        option_to_yojson create_file_system_ontap_configuration_to_yojson x.ontap_configuration );
      ( "LustreConfiguration",
        option_to_yojson create_file_system_lustre_configuration_to_yojson x.lustre_configuration );
      ( "WindowsConfiguration",
        option_to_yojson create_file_system_windows_configuration_to_yojson x.windows_configuration
      );
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("SecurityGroupIds", option_to_yojson security_group_ids_to_yojson x.security_group_ids);
      ("SubnetIds", Some (subnet_ids_to_yojson x.subnet_ids));
      ("StorageType", option_to_yojson storage_type_to_yojson x.storage_type);
      ("StorageCapacity", option_to_yojson storage_capacity_to_yojson x.storage_capacity);
      ("FileSystemType", Some (file_system_type_to_yojson x.file_system_type));
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_file_system_from_backup_response_to_yojson (x : create_file_system_from_backup_response)
    =
  assoc_to_yojson [ ("FileSystem", option_to_yojson file_system_to_yojson x.file_system) ]

let create_file_system_from_backup_request_to_yojson (x : create_file_system_from_backup_request) =
  assoc_to_yojson
    [
      ("NetworkType", option_to_yojson network_type_to_yojson x.network_type);
      ("StorageCapacity", option_to_yojson storage_capacity_to_yojson x.storage_capacity);
      ( "OpenZFSConfiguration",
        option_to_yojson create_file_system_open_zfs_configuration_to_yojson
          x.open_zfs_configuration );
      ( "FileSystemTypeVersion",
        option_to_yojson file_system_type_version_to_yojson x.file_system_type_version );
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("StorageType", option_to_yojson storage_type_to_yojson x.storage_type);
      ( "LustreConfiguration",
        option_to_yojson create_file_system_lustre_configuration_to_yojson x.lustre_configuration );
      ( "WindowsConfiguration",
        option_to_yojson create_file_system_windows_configuration_to_yojson x.windows_configuration
      );
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("SecurityGroupIds", option_to_yojson security_group_ids_to_yojson x.security_group_ids);
      ("SubnetIds", Some (subnet_ids_to_yojson x.subnet_ids));
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("BackupId", Some (backup_id_to_yojson x.backup_id));
    ]

let create_file_cache_response_to_yojson (x : create_file_cache_response) =
  assoc_to_yojson [ ("FileCache", option_to_yojson file_cache_creating_to_yojson x.file_cache) ]

let create_file_cache_lustre_configuration_to_yojson (x : create_file_cache_lustre_configuration) =
  assoc_to_yojson
    [
      ( "MetadataConfiguration",
        Some (file_cache_lustre_metadata_configuration_to_yojson x.metadata_configuration) );
      ( "WeeklyMaintenanceStartTime",
        option_to_yojson weekly_time_to_yojson x.weekly_maintenance_start_time );
      ("DeploymentType", Some (file_cache_lustre_deployment_type_to_yojson x.deployment_type));
      ( "PerUnitStorageThroughput",
        Some (per_unit_storage_throughput_to_yojson x.per_unit_storage_throughput) );
    ]

let create_file_cache_data_repository_associations_to_yojson tree =
  list_to_yojson file_cache_data_repository_association_to_yojson tree

let create_file_cache_request_to_yojson (x : create_file_cache_request) =
  assoc_to_yojson
    [
      ( "DataRepositoryAssociations",
        option_to_yojson create_file_cache_data_repository_associations_to_yojson
          x.data_repository_associations );
      ( "LustreConfiguration",
        option_to_yojson create_file_cache_lustre_configuration_to_yojson x.lustre_configuration );
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ( "CopyTagsToDataRepositoryAssociations",
        option_to_yojson copy_tags_to_data_repository_associations_to_yojson
          x.copy_tags_to_data_repository_associations );
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("SecurityGroupIds", option_to_yojson security_group_ids_to_yojson x.security_group_ids);
      ("SubnetIds", Some (subnet_ids_to_yojson x.subnet_ids));
      ("StorageCapacity", Some (storage_capacity_to_yojson x.storage_capacity));
      ("FileCacheTypeVersion", Some (file_system_type_version_to_yojson x.file_cache_type_version));
      ("FileCacheType", Some (file_cache_type_to_yojson x.file_cache_type));
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_data_repository_task_response_to_yojson (x : create_data_repository_task_response) =
  assoc_to_yojson
    [
      ("DataRepositoryTask", option_to_yojson data_repository_task_to_yojson x.data_repository_task);
    ]

let create_data_repository_task_request_to_yojson (x : create_data_repository_task_request) =
  assoc_to_yojson
    [
      ( "ReleaseConfiguration",
        option_to_yojson release_configuration_to_yojson x.release_configuration );
      ("CapacityToRelease", option_to_yojson capacity_to_release_to_yojson x.capacity_to_release);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("Report", Some (completion_report_to_yojson x.report));
      ("FileSystemId", Some (file_system_id_to_yojson x.file_system_id));
      ("Paths", option_to_yojson data_repository_task_paths_to_yojson x.paths);
      ("Type", Some (data_repository_task_type_to_yojson x.type_));
    ]

let create_data_repository_association_response_to_yojson
    (x : create_data_repository_association_response) =
  assoc_to_yojson
    [ ("Association", option_to_yojson data_repository_association_to_yojson x.association) ]

let create_data_repository_association_request_to_yojson
    (x : create_data_repository_association_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("S3", option_to_yojson s3_data_repository_configuration_to_yojson x.s3);
      ("ImportedFileChunkSize", option_to_yojson megabytes_to_yojson x.imported_file_chunk_size);
      ( "BatchImportMetaDataOnCreate",
        option_to_yojson batch_import_meta_data_on_create_to_yojson
          x.batch_import_meta_data_on_create );
      ("DataRepositoryPath", Some (archive_path_to_yojson x.data_repository_path));
      ("FileSystemPath", option_to_yojson namespace_to_yojson x.file_system_path);
      ("FileSystemId", Some (file_system_id_to_yojson x.file_system_id));
    ]

let create_backup_response_to_yojson (x : create_backup_response) =
  assoc_to_yojson [ ("Backup", option_to_yojson backup_to_yojson x.backup) ]

let create_backup_request_to_yojson (x : create_backup_request) =
  assoc_to_yojson
    [
      ("VolumeId", option_to_yojson volume_id_to_yojson x.volume_id);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("FileSystemId", option_to_yojson file_system_id_to_yojson x.file_system_id);
    ]

let access_point_policy_to_yojson = string_to_yojson

let create_and_attach_s3_access_point_s3_configuration_to_yojson
    (x : create_and_attach_s3_access_point_s3_configuration) =
  assoc_to_yojson
    [
      ("Policy", option_to_yojson access_point_policy_to_yojson x.policy);
      ( "VpcConfiguration",
        option_to_yojson s3_access_point_vpc_configuration_to_yojson x.vpc_configuration );
    ]

let create_and_attach_s3_access_point_response_to_yojson
    (x : create_and_attach_s3_access_point_response) =
  assoc_to_yojson
    [
      ( "S3AccessPointAttachment",
        option_to_yojson s3_access_point_attachment_to_yojson x.s3_access_point_attachment );
    ]

let create_and_attach_s3_access_point_open_zfs_configuration_to_yojson
    (x : create_and_attach_s3_access_point_open_zfs_configuration) =
  assoc_to_yojson
    [
      ("FileSystemIdentity", Some (open_zfs_file_system_identity_to_yojson x.file_system_identity));
      ("VolumeId", Some (volume_id_to_yojson x.volume_id));
    ]

let create_and_attach_s3_access_point_ontap_configuration_to_yojson
    (x : create_and_attach_s3_access_point_ontap_configuration) =
  assoc_to_yojson
    [
      ("FileSystemIdentity", Some (ontap_file_system_identity_to_yojson x.file_system_identity));
      ("VolumeId", Some (volume_id_to_yojson x.volume_id));
    ]

let create_and_attach_s3_access_point_request_to_yojson
    (x : create_and_attach_s3_access_point_request) =
  assoc_to_yojson
    [
      ( "S3AccessPoint",
        option_to_yojson create_and_attach_s3_access_point_s3_configuration_to_yojson
          x.s3_access_point );
      ( "OntapConfiguration",
        option_to_yojson create_and_attach_s3_access_point_ontap_configuration_to_yojson
          x.ontap_configuration );
      ( "OpenZFSConfiguration",
        option_to_yojson create_and_attach_s3_access_point_open_zfs_configuration_to_yojson
          x.open_zfs_configuration );
      ("Type", Some (s3_access_point_attachment_type_to_yojson x.type_));
      ("Name", Some (s3_access_point_attachment_name_to_yojson x.name));
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let access_point_already_owned_by_you_to_yojson (x : access_point_already_owned_by_you) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson error_message_to_yojson x.message);
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
    ]

let copy_snapshot_and_update_volume_response_to_yojson
    (x : copy_snapshot_and_update_volume_response) =
  assoc_to_yojson
    [
      ( "AdministrativeActions",
        option_to_yojson administrative_actions_to_yojson x.administrative_actions );
      ("Lifecycle", option_to_yojson volume_lifecycle_to_yojson x.lifecycle);
      ("VolumeId", option_to_yojson volume_id_to_yojson x.volume_id);
    ]

let copy_snapshot_and_update_volume_request_to_yojson (x : copy_snapshot_and_update_volume_request)
    =
  assoc_to_yojson
    [
      ("Options", option_to_yojson update_open_zfs_volume_options_to_yojson x.options);
      ("CopyStrategy", option_to_yojson open_zfs_copy_strategy_to_yojson x.copy_strategy);
      ("SourceSnapshotARN", Some (resource_ar_n_to_yojson x.source_snapshot_ar_n));
      ("VolumeId", Some (volume_id_to_yojson x.volume_id));
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let copy_backup_response_to_yojson (x : copy_backup_response) =
  assoc_to_yojson [ ("Backup", option_to_yojson backup_to_yojson x.backup) ]

let copy_backup_request_to_yojson (x : copy_backup_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("CopyTags", option_to_yojson flag_to_yojson x.copy_tags);
      ("KmsKeyId", option_to_yojson kms_key_id_to_yojson x.kms_key_id);
      ("SourceRegion", option_to_yojson region_to_yojson x.source_region);
      ("SourceBackupId", Some (source_backup_id_to_yojson x.source_backup_id));
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let cancel_data_repository_task_response_to_yojson (x : cancel_data_repository_task_response) =
  assoc_to_yojson
    [
      ("TaskId", option_to_yojson task_id_to_yojson x.task_id);
      ("Lifecycle", option_to_yojson data_repository_task_lifecycle_to_yojson x.lifecycle);
    ]

let cancel_data_repository_task_request_to_yojson (x : cancel_data_repository_task_request) =
  assoc_to_yojson [ ("TaskId", Some (task_id_to_yojson x.task_id)) ]

let associate_file_system_aliases_response_to_yojson (x : associate_file_system_aliases_response) =
  assoc_to_yojson [ ("Aliases", option_to_yojson aliases_to_yojson x.aliases) ]

let associate_file_system_aliases_request_to_yojson (x : associate_file_system_aliases_request) =
  assoc_to_yojson
    [
      ("Aliases", Some (alternate_dns_names_to_yojson x.aliases));
      ("FileSystemId", Some (file_system_id_to_yojson x.file_system_id));
      ( "ClientRequestToken",
        Some
          (client_request_token_to_yojson
             (Option.value x.client_request_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]
