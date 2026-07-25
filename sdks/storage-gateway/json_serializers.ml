open Smaws_Lib.Json.SerializeHelpers
open Types

let string__to_yojson = string_to_yojson
let error_details_to_yojson tree = map_to_yojson string__to_yojson string__to_yojson tree

let error_code_to_yojson (x : error_code) =
  match x with
  | ActivationKeyExpired -> `String "ActivationKeyExpired"
  | ActivationKeyInvalid -> `String "ActivationKeyInvalid"
  | ActivationKeyNotFound -> `String "ActivationKeyNotFound"
  | GatewayInternalError -> `String "GatewayInternalError"
  | GatewayNotConnected -> `String "GatewayNotConnected"
  | GatewayNotFound -> `String "GatewayNotFound"
  | GatewayProxyNetworkConnectionBusy -> `String "GatewayProxyNetworkConnectionBusy"
  | AuthenticationFailure -> `String "AuthenticationFailure"
  | BandwidthThrottleScheduleNotFound -> `String "BandwidthThrottleScheduleNotFound"
  | Blocked -> `String "Blocked"
  | CannotExportSnapshot -> `String "CannotExportSnapshot"
  | ChapCredentialNotFound -> `String "ChapCredentialNotFound"
  | DiskAlreadyAllocated -> `String "DiskAlreadyAllocated"
  | DiskDoesNotExist -> `String "DiskDoesNotExist"
  | DiskSizeGreaterThanVolumeMaxSize -> `String "DiskSizeGreaterThanVolumeMaxSize"
  | DiskSizeLessThanVolumeSize -> `String "DiskSizeLessThanVolumeSize"
  | DiskSizeNotGigAligned -> `String "DiskSizeNotGigAligned"
  | DuplicateCertificateInfo -> `String "DuplicateCertificateInfo"
  | DuplicateSchedule -> `String "DuplicateSchedule"
  | EndpointNotFound -> `String "EndpointNotFound"
  | IAMNotSupported -> `String "IAMNotSupported"
  | InitiatorInvalid -> `String "InitiatorInvalid"
  | InitiatorNotFound -> `String "InitiatorNotFound"
  | InternalError -> `String "InternalError"
  | InvalidGateway -> `String "InvalidGateway"
  | InvalidEndpoint -> `String "InvalidEndpoint"
  | InvalidParameters -> `String "InvalidParameters"
  | InvalidSchedule -> `String "InvalidSchedule"
  | LocalStorageLimitExceeded -> `String "LocalStorageLimitExceeded"
  | LunAlreadyAllocated_ -> `String "LunAlreadyAllocated "
  | LunInvalid -> `String "LunInvalid"
  | JoinDomainInProgress -> `String "JoinDomainInProgress"
  | MaximumContentLengthExceeded -> `String "MaximumContentLengthExceeded"
  | MaximumTapeCartridgeCountExceeded -> `String "MaximumTapeCartridgeCountExceeded"
  | MaximumVolumeCountExceeded -> `String "MaximumVolumeCountExceeded"
  | NetworkConfigurationChanged -> `String "NetworkConfigurationChanged"
  | NoDisksAvailable -> `String "NoDisksAvailable"
  | NotImplemented -> `String "NotImplemented"
  | NotSupported -> `String "NotSupported"
  | OperationAborted -> `String "OperationAborted"
  | OutdatedGateway -> `String "OutdatedGateway"
  | ParametersNotImplemented -> `String "ParametersNotImplemented"
  | RegionInvalid -> `String "RegionInvalid"
  | RequestTimeout -> `String "RequestTimeout"
  | ServiceUnavailable -> `String "ServiceUnavailable"
  | SnapshotDeleted -> `String "SnapshotDeleted"
  | SnapshotIdInvalid -> `String "SnapshotIdInvalid"
  | SnapshotInProgress -> `String "SnapshotInProgress"
  | SnapshotNotFound -> `String "SnapshotNotFound"
  | SnapshotScheduleNotFound -> `String "SnapshotScheduleNotFound"
  | StagingAreaFull -> `String "StagingAreaFull"
  | StorageFailure -> `String "StorageFailure"
  | TapeCartridgeNotFound -> `String "TapeCartridgeNotFound"
  | TargetAlreadyExists -> `String "TargetAlreadyExists"
  | TargetInvalid -> `String "TargetInvalid"
  | TargetNotFound -> `String "TargetNotFound"
  | UnauthorizedOperation -> `String "UnauthorizedOperation"
  | VolumeAlreadyExists -> `String "VolumeAlreadyExists"
  | VolumeIdInvalid -> `String "VolumeIdInvalid"
  | VolumeInUse -> `String "VolumeInUse"
  | VolumeNotFound -> `String "VolumeNotFound"
  | VolumeNotReady -> `String "VolumeNotReady"

let storage_gateway_error_to_yojson (x : storage_gateway_error) =
  assoc_to_yojson
    [
      ("errorCode", option_to_yojson error_code_to_yojson x.error_code);
      ("errorDetails", option_to_yojson error_details_to_yojson x.error_details);
    ]

let invalid_gateway_request_exception_to_yojson (x : invalid_gateway_request_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson string__to_yojson x.message);
      ("error", option_to_yojson storage_gateway_error_to_yojson x.error);
    ]

let internal_server_error_to_yojson (x : internal_server_error) =
  assoc_to_yojson
    [
      ("message", option_to_yojson string__to_yojson x.message);
      ("error", option_to_yojson storage_gateway_error_to_yojson x.error);
    ]

let gateway_ar_n_to_yojson = string_to_yojson

let activate_gateway_output_to_yojson (x : activate_gateway_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tags_to_yojson tree = list_to_yojson tag_to_yojson tree
let medium_changer_type_to_yojson = string_to_yojson
let tape_drive_type_to_yojson = string_to_yojson
let gateway_type_to_yojson = string_to_yojson
let region_id_to_yojson = string_to_yojson
let gateway_timezone_to_yojson = string_to_yojson
let gateway_name_to_yojson = string_to_yojson
let activation_key_to_yojson = string_to_yojson

let activate_gateway_input_to_yojson (x : activate_gateway_input) =
  assoc_to_yojson
    [
      ("ActivationKey", Some (activation_key_to_yojson x.activation_key));
      ("GatewayName", Some (gateway_name_to_yojson x.gateway_name));
      ("GatewayTimezone", Some (gateway_timezone_to_yojson x.gateway_timezone));
      ("GatewayRegion", Some (region_id_to_yojson x.gateway_region));
      ("GatewayType", option_to_yojson gateway_type_to_yojson x.gateway_type);
      ("TapeDriveType", option_to_yojson tape_drive_type_to_yojson x.tape_drive_type);
      ("MediumChangerType", option_to_yojson medium_changer_type_to_yojson x.medium_changer_type);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let active_directory_status_to_yojson (x : active_directory_status) =
  match x with
  | ACCESS_DENIED -> `String "ACCESS_DENIED"
  | DETACHED -> `String "DETACHED"
  | JOINED -> `String "JOINED"
  | JOINING -> `String "JOINING"
  | NETWORK_ERROR -> `String "NETWORK_ERROR"
  | TIMEOUT -> `String "TIMEOUT"
  | UNKNOWN_ERROR -> `String "UNKNOWN_ERROR"
  | INSUFFICIENT_PERMISSIONS -> `String "INSUFFICIENT_PERMISSIONS"

let add_cache_output_to_yojson (x : add_cache_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let disk_id_to_yojson = string_to_yojson
let disk_ids_to_yojson tree = list_to_yojson disk_id_to_yojson tree

let add_cache_input_to_yojson (x : add_cache_input) =
  assoc_to_yojson
    [
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
      ("DiskIds", Some (disk_ids_to_yojson x.disk_ids));
    ]

let resource_ar_n_to_yojson = string_to_yojson

let add_tags_to_resource_output_to_yojson (x : add_tags_to_resource_output) =
  assoc_to_yojson [ ("ResourceARN", option_to_yojson resource_ar_n_to_yojson x.resource_ar_n) ]

let add_tags_to_resource_input_to_yojson (x : add_tags_to_resource_input) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (resource_ar_n_to_yojson x.resource_ar_n));
      ("Tags", Some (tags_to_yojson x.tags));
    ]

let add_upload_buffer_output_to_yojson (x : add_upload_buffer_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let add_upload_buffer_input_to_yojson (x : add_upload_buffer_input) =
  assoc_to_yojson
    [
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
      ("DiskIds", Some (disk_ids_to_yojson x.disk_ids));
    ]

let add_working_storage_output_to_yojson (x : add_working_storage_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let add_working_storage_input_to_yojson (x : add_working_storage_input) =
  assoc_to_yojson
    [
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
      ("DiskIds", Some (disk_ids_to_yojson x.disk_ids));
    ]

let tape_ar_n_to_yojson = string_to_yojson

let assign_tape_pool_output_to_yojson (x : assign_tape_pool_output) =
  assoc_to_yojson [ ("TapeARN", option_to_yojson tape_ar_n_to_yojson x.tape_ar_n) ]

let boolean2_to_yojson = bool_to_yojson
let pool_id_to_yojson = string_to_yojson

let assign_tape_pool_input_to_yojson (x : assign_tape_pool_input) =
  assoc_to_yojson
    [
      ("TapeARN", Some (tape_ar_n_to_yojson x.tape_ar_n));
      ("PoolId", Some (pool_id_to_yojson x.pool_id));
      ( "BypassGovernanceRetention",
        option_to_yojson boolean2_to_yojson x.bypass_governance_retention );
    ]

let file_system_association_ar_n_to_yojson = string_to_yojson

let associate_file_system_output_to_yojson (x : associate_file_system_output) =
  assoc_to_yojson
    [
      ( "FileSystemAssociationARN",
        option_to_yojson file_system_association_ar_n_to_yojson x.file_system_association_ar_n );
    ]

let ipv4_address_to_yojson = string_to_yojson
let ip_address_list_to_yojson tree = list_to_yojson ipv4_address_to_yojson tree

let endpoint_network_configuration_to_yojson (x : endpoint_network_configuration) =
  assoc_to_yojson [ ("IpAddresses", option_to_yojson ip_address_list_to_yojson x.ip_addresses) ]

let cache_stale_timeout_in_seconds_to_yojson = int_to_yojson

let cache_attributes_to_yojson (x : cache_attributes) =
  assoc_to_yojson
    [
      ( "CacheStaleTimeoutInSeconds",
        option_to_yojson cache_stale_timeout_in_seconds_to_yojson x.cache_stale_timeout_in_seconds
      );
    ]

let audit_destination_ar_n_to_yojson = string_to_yojson
let file_system_location_ar_n_to_yojson = string_to_yojson
let client_token_to_yojson = string_to_yojson
let domain_user_password_to_yojson = string_to_yojson
let domain_user_name_to_yojson = string_to_yojson

let associate_file_system_input_to_yojson (x : associate_file_system_input) =
  assoc_to_yojson
    [
      ("UserName", Some (domain_user_name_to_yojson x.user_name));
      ("Password", Some (domain_user_password_to_yojson x.password));
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
      ("LocationARN", Some (file_system_location_ar_n_to_yojson x.location_ar_n));
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ( "AuditDestinationARN",
        option_to_yojson audit_destination_ar_n_to_yojson x.audit_destination_ar_n );
      ("CacheAttributes", option_to_yojson cache_attributes_to_yojson x.cache_attributes);
      ( "EndpointNetworkConfiguration",
        option_to_yojson endpoint_network_configuration_to_yojson x.endpoint_network_configuration
      );
    ]

let target_ar_n_to_yojson = string_to_yojson
let volume_ar_n_to_yojson = string_to_yojson

let attach_volume_output_to_yojson (x : attach_volume_output) =
  assoc_to_yojson
    [
      ("VolumeARN", option_to_yojson volume_ar_n_to_yojson x.volume_ar_n);
      ("TargetARN", option_to_yojson target_ar_n_to_yojson x.target_ar_n);
    ]

let network_interface_id_to_yojson = string_to_yojson
let target_name_to_yojson = string_to_yojson

let attach_volume_input_to_yojson (x : attach_volume_input) =
  assoc_to_yojson
    [
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
      ("TargetName", option_to_yojson target_name_to_yojson x.target_name);
      ("VolumeARN", Some (volume_ar_n_to_yojson x.volume_ar_n));
      ("NetworkInterfaceId", Some (network_interface_id_to_yojson x.network_interface_id));
      ("DiskId", option_to_yojson disk_id_to_yojson x.disk_id);
    ]

let authentication_to_yojson = string_to_yojson
let minimum_num_tapes_to_yojson = int_to_yojson
let tape_size_to_yojson = long_to_yojson
let tape_barcode_prefix_to_yojson = string_to_yojson

let automatic_tape_creation_rule_to_yojson (x : automatic_tape_creation_rule) =
  assoc_to_yojson
    [
      ("TapeBarcodePrefix", Some (tape_barcode_prefix_to_yojson x.tape_barcode_prefix));
      ("PoolId", Some (pool_id_to_yojson x.pool_id));
      ("TapeSizeInBytes", Some (tape_size_to_yojson x.tape_size_in_bytes));
      ("MinimumNumTapes", Some (minimum_num_tapes_to_yojson x.minimum_num_tapes));
      ("Worm", option_to_yojson boolean2_to_yojson x.worm);
    ]

let automatic_tape_creation_rules_to_yojson tree =
  list_to_yojson automatic_tape_creation_rule_to_yojson tree

let automatic_tape_creation_policy_info_to_yojson (x : automatic_tape_creation_policy_info) =
  assoc_to_yojson
    [
      ( "AutomaticTapeCreationRules",
        option_to_yojson automatic_tape_creation_rules_to_yojson x.automatic_tape_creation_rules );
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
    ]

let automatic_tape_creation_policy_infos_to_yojson tree =
  list_to_yojson automatic_tape_creation_policy_info_to_yojson tree

let automatic_update_policy_to_yojson (x : automatic_update_policy) =
  match x with
  | ALL_VERSIONS -> `String "ALL_VERSIONS"
  | EMERGENCY_VERSIONS_ONLY -> `String "EMERGENCY_VERSIONS_ONLY"

let availability_monitor_test_status_to_yojson (x : availability_monitor_test_status) =
  match x with
  | COMPLETE -> `String "COMPLETE"
  | FAILED -> `String "FAILED"
  | PENDING -> `String "PENDING"

let bandwidth_download_rate_limit_to_yojson = long_to_yojson
let bandwidth_upload_rate_limit_to_yojson = long_to_yojson
let day_of_week_to_yojson = int_to_yojson
let days_of_week_to_yojson tree = list_to_yojson day_of_week_to_yojson tree
let minute_of_hour_to_yojson = int_to_yojson
let hour_of_day_to_yojson = int_to_yojson

let bandwidth_rate_limit_interval_to_yojson (x : bandwidth_rate_limit_interval) =
  assoc_to_yojson
    [
      ("StartHourOfDay", Some (hour_of_day_to_yojson x.start_hour_of_day));
      ("StartMinuteOfHour", Some (minute_of_hour_to_yojson x.start_minute_of_hour));
      ("EndHourOfDay", Some (hour_of_day_to_yojson x.end_hour_of_day));
      ("EndMinuteOfHour", Some (minute_of_hour_to_yojson x.end_minute_of_hour));
      ("DaysOfWeek", Some (days_of_week_to_yojson x.days_of_week));
      ( "AverageUploadRateLimitInBitsPerSec",
        option_to_yojson bandwidth_upload_rate_limit_to_yojson
          x.average_upload_rate_limit_in_bits_per_sec );
      ( "AverageDownloadRateLimitInBitsPerSec",
        option_to_yojson bandwidth_download_rate_limit_to_yojson
          x.average_download_rate_limit_in_bits_per_sec );
    ]

let bandwidth_rate_limit_intervals_to_yojson tree =
  list_to_yojson bandwidth_rate_limit_interval_to_yojson tree

let bandwidth_type_to_yojson = string_to_yojson
let boolean__to_yojson = bool_to_yojson
let cache_report_ar_n_to_yojson = string_to_yojson
let cache_report_filter_value_to_yojson = string_to_yojson

let cache_report_filter_values_to_yojson tree =
  list_to_yojson cache_report_filter_value_to_yojson tree

let cache_report_filter_name_to_yojson (x : cache_report_filter_name) =
  match x with
  | UploadState -> `String "UploadState"
  | UploadFailureReason -> `String "UploadFailureReason"

let cache_report_filter_to_yojson (x : cache_report_filter) =
  assoc_to_yojson
    [
      ("Name", Some (cache_report_filter_name_to_yojson x.name));
      ("Values", Some (cache_report_filter_values_to_yojson x.values));
    ]

let cache_report_filter_list_to_yojson tree = list_to_yojson cache_report_filter_to_yojson tree
let cache_report_name_to_yojson = string_to_yojson
let time_to_yojson = timestamp_epoch_seconds_to_yojson
let location_ar_n_to_yojson = string_to_yojson
let file_share_ar_n_to_yojson = string_to_yojson
let role_to_yojson = string_to_yojson
let report_completion_percent_to_yojson = int_to_yojson

let cache_report_status_to_yojson (x : cache_report_status) =
  match x with
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | COMPLETED -> `String "COMPLETED"
  | CANCELED -> `String "CANCELED"
  | FAILED -> `String "FAILED"
  | ERROR -> `String "ERROR"

let cache_report_info_to_yojson (x : cache_report_info) =
  assoc_to_yojson
    [
      ("CacheReportARN", option_to_yojson cache_report_ar_n_to_yojson x.cache_report_ar_n);
      ("CacheReportStatus", option_to_yojson cache_report_status_to_yojson x.cache_report_status);
      ( "ReportCompletionPercent",
        option_to_yojson report_completion_percent_to_yojson x.report_completion_percent );
      ("EndTime", option_to_yojson time_to_yojson x.end_time);
      ("Role", option_to_yojson role_to_yojson x.role);
      ("FileShareARN", option_to_yojson file_share_ar_n_to_yojson x.file_share_ar_n);
      ("LocationARN", option_to_yojson location_ar_n_to_yojson x.location_ar_n);
      ("StartTime", option_to_yojson time_to_yojson x.start_time);
      ("InclusionFilters", option_to_yojson cache_report_filter_list_to_yojson x.inclusion_filters);
      ("ExclusionFilters", option_to_yojson cache_report_filter_list_to_yojson x.exclusion_filters);
      ("ReportName", option_to_yojson cache_report_name_to_yojson x.report_name);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let cache_report_list_to_yojson tree = list_to_yojson cache_report_info_to_yojson tree
let kms_key_to_yojson = string_to_yojson
let volume_used_in_bytes_to_yojson = long_to_yojson
let created_date_to_yojson = timestamp_epoch_seconds_to_yojson
let positive_int_object_to_yojson = int_to_yojson
let integer_to_yojson = int_to_yojson

let volumei_scsi_attributes_to_yojson (x : volumei_scsi_attributes) =
  assoc_to_yojson
    [
      ("TargetARN", option_to_yojson target_ar_n_to_yojson x.target_ar_n);
      ("NetworkInterfaceId", option_to_yojson network_interface_id_to_yojson x.network_interface_id);
      ("NetworkInterfacePort", option_to_yojson integer_to_yojson x.network_interface_port);
      ("LunNumber", option_to_yojson positive_int_object_to_yojson x.lun_number);
      ("ChapEnabled", option_to_yojson boolean2_to_yojson x.chap_enabled);
    ]

let snapshot_id_to_yojson = string_to_yojson
let double_object_to_yojson = double_to_yojson
let long_to_yojson = long_to_yojson
let volume_attachment_status_to_yojson = string_to_yojson
let volume_status_to_yojson = string_to_yojson
let volume_type_to_yojson = string_to_yojson
let volume_id_to_yojson = string_to_yojson

let cachedi_scsi_volume_to_yojson (x : cachedi_scsi_volume) =
  assoc_to_yojson
    [
      ("VolumeARN", option_to_yojson volume_ar_n_to_yojson x.volume_ar_n);
      ("VolumeId", option_to_yojson volume_id_to_yojson x.volume_id);
      ("VolumeType", option_to_yojson volume_type_to_yojson x.volume_type);
      ("VolumeStatus", option_to_yojson volume_status_to_yojson x.volume_status);
      ( "VolumeAttachmentStatus",
        option_to_yojson volume_attachment_status_to_yojson x.volume_attachment_status );
      ("VolumeSizeInBytes", option_to_yojson long_to_yojson x.volume_size_in_bytes);
      ("VolumeProgress", option_to_yojson double_object_to_yojson x.volume_progress);
      ("SourceSnapshotId", option_to_yojson snapshot_id_to_yojson x.source_snapshot_id);
      ( "VolumeiSCSIAttributes",
        option_to_yojson volumei_scsi_attributes_to_yojson x.volumei_scsi_attributes );
      ("CreatedDate", option_to_yojson created_date_to_yojson x.created_date);
      ("VolumeUsedInBytes", option_to_yojson volume_used_in_bytes_to_yojson x.volume_used_in_bytes);
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("TargetName", option_to_yojson target_name_to_yojson x.target_name);
    ]

let cachedi_scsi_volumes_to_yojson tree = list_to_yojson cachedi_scsi_volume_to_yojson tree

let cancel_archival_output_to_yojson (x : cancel_archival_output) =
  assoc_to_yojson [ ("TapeARN", option_to_yojson tape_ar_n_to_yojson x.tape_ar_n) ]

let cancel_archival_input_to_yojson (x : cancel_archival_input) =
  assoc_to_yojson
    [
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
      ("TapeARN", Some (tape_ar_n_to_yojson x.tape_ar_n));
    ]

let cancel_cache_report_output_to_yojson (x : cancel_cache_report_output) =
  assoc_to_yojson
    [ ("CacheReportARN", option_to_yojson cache_report_ar_n_to_yojson x.cache_report_ar_n) ]

let cancel_cache_report_input_to_yojson (x : cancel_cache_report_input) =
  assoc_to_yojson [ ("CacheReportARN", Some (cache_report_ar_n_to_yojson x.cache_report_ar_n)) ]

let cancel_retrieval_output_to_yojson (x : cancel_retrieval_output) =
  assoc_to_yojson [ ("TapeARN", option_to_yojson tape_ar_n_to_yojson x.tape_ar_n) ]

let cancel_retrieval_input_to_yojson (x : cancel_retrieval_input) =
  assoc_to_yojson
    [
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
      ("TapeARN", Some (tape_ar_n_to_yojson x.tape_ar_n));
    ]

let case_sensitivity_to_yojson (x : case_sensitivity) =
  match x with
  | ClientSpecified -> `String "ClientSpecified"
  | CaseSensitive -> `String "CaseSensitive"

let chap_secret_to_yojson = string_to_yojson
let iqn_name_to_yojson = string_to_yojson

let chap_info_to_yojson (x : chap_info) =
  assoc_to_yojson
    [
      ("TargetARN", option_to_yojson target_ar_n_to_yojson x.target_ar_n);
      ( "SecretToAuthenticateInitiator",
        option_to_yojson chap_secret_to_yojson x.secret_to_authenticate_initiator );
      ("InitiatorName", option_to_yojson iqn_name_to_yojson x.initiator_name);
      ( "SecretToAuthenticateTarget",
        option_to_yojson chap_secret_to_yojson x.secret_to_authenticate_target );
    ]

let chap_credentials_to_yojson tree = list_to_yojson chap_info_to_yojson tree
let cloud_watch_log_group_ar_n_to_yojson = string_to_yojson

let create_cachedi_scsi_volume_output_to_yojson (x : create_cachedi_scsi_volume_output) =
  assoc_to_yojson
    [
      ("VolumeARN", option_to_yojson volume_ar_n_to_yojson x.volume_ar_n);
      ("TargetARN", option_to_yojson target_ar_n_to_yojson x.target_ar_n);
    ]

let create_cachedi_scsi_volume_input_to_yojson (x : create_cachedi_scsi_volume_input) =
  assoc_to_yojson
    [
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
      ("VolumeSizeInBytes", Some (long_to_yojson x.volume_size_in_bytes));
      ("SnapshotId", option_to_yojson snapshot_id_to_yojson x.snapshot_id);
      ("TargetName", Some (target_name_to_yojson x.target_name));
      ("SourceVolumeARN", option_to_yojson volume_ar_n_to_yojson x.source_volume_ar_n);
      ("NetworkInterfaceId", Some (network_interface_id_to_yojson x.network_interface_id));
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("KMSEncrypted", option_to_yojson boolean__to_yojson x.kms_encrypted);
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let create_nfs_file_share_output_to_yojson (x : create_nfs_file_share_output) =
  assoc_to_yojson [ ("FileShareARN", option_to_yojson file_share_ar_n_to_yojson x.file_share_ar_n) ]

let dns_host_name_to_yojson = string_to_yojson
let notification_policy_to_yojson = string_to_yojson
let file_share_name_to_yojson = string_to_yojson
let squash_to_yojson = string_to_yojson
let ipv4_or_ipv6_address_cid_r_to_yojson = string_to_yojson
let file_share_client_list_to_yojson tree = list_to_yojson ipv4_or_ipv6_address_cid_r_to_yojson tree

let object_ac_l_to_yojson (x : object_ac_l) =
  match x with
  | Private -> `String "private"
  | Public_read -> `String "public-read"
  | Public_read_write -> `String "public-read-write"
  | Authenticated_read -> `String "authenticated-read"
  | Bucket_owner_read -> `String "bucket-owner-read"
  | Bucket_owner_full_control -> `String "bucket-owner-full-control"
  | Aws_exec_read -> `String "aws-exec-read"

let storage_class_to_yojson = string_to_yojson

let encryption_type_to_yojson (x : encryption_type) =
  match x with
  | SseS3 -> `String "SseS3"
  | SseKms -> `String "SseKms"
  | DsseKms -> `String "DsseKms"

let permission_id_to_yojson = long_to_yojson
let permission_mode_to_yojson = string_to_yojson

let nfs_file_share_defaults_to_yojson (x : nfs_file_share_defaults) =
  assoc_to_yojson
    [
      ("FileMode", option_to_yojson permission_mode_to_yojson x.file_mode);
      ("DirectoryMode", option_to_yojson permission_mode_to_yojson x.directory_mode);
      ("GroupId", option_to_yojson permission_id_to_yojson x.group_id);
      ("OwnerId", option_to_yojson permission_id_to_yojson x.owner_id);
    ]

let create_nfs_file_share_input_to_yojson (x : create_nfs_file_share_input) =
  assoc_to_yojson
    [
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ( "NFSFileShareDefaults",
        option_to_yojson nfs_file_share_defaults_to_yojson x.nfs_file_share_defaults );
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
      ("EncryptionType", option_to_yojson encryption_type_to_yojson x.encryption_type);
      ("KMSEncrypted", option_to_yojson boolean__to_yojson x.kms_encrypted);
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("Role", Some (role_to_yojson x.role));
      ("LocationARN", Some (location_ar_n_to_yojson x.location_ar_n));
      ("DefaultStorageClass", option_to_yojson storage_class_to_yojson x.default_storage_class);
      ("ObjectACL", option_to_yojson object_ac_l_to_yojson x.object_ac_l);
      ("ClientList", option_to_yojson file_share_client_list_to_yojson x.client_list);
      ("Squash", option_to_yojson squash_to_yojson x.squash);
      ("ReadOnly", option_to_yojson boolean__to_yojson x.read_only);
      ("GuessMIMETypeEnabled", option_to_yojson boolean__to_yojson x.guess_mime_type_enabled);
      ("RequesterPays", option_to_yojson boolean__to_yojson x.requester_pays);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("FileShareName", option_to_yojson file_share_name_to_yojson x.file_share_name);
      ("CacheAttributes", option_to_yojson cache_attributes_to_yojson x.cache_attributes);
      ("NotificationPolicy", option_to_yojson notification_policy_to_yojson x.notification_policy);
      ("VPCEndpointDNSName", option_to_yojson dns_host_name_to_yojson x.vpc_endpoint_dns_name);
      ("BucketRegion", option_to_yojson region_id_to_yojson x.bucket_region);
      ( "AuditDestinationARN",
        option_to_yojson audit_destination_ar_n_to_yojson x.audit_destination_ar_n );
    ]

let create_smb_file_share_output_to_yojson (x : create_smb_file_share_output) =
  assoc_to_yojson [ ("FileShareARN", option_to_yojson file_share_ar_n_to_yojson x.file_share_ar_n) ]

let user_list_user_to_yojson = string_to_yojson
let user_list_to_yojson tree = list_to_yojson user_list_user_to_yojson tree

let create_smb_file_share_input_to_yojson (x : create_smb_file_share_input) =
  assoc_to_yojson
    [
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
      ("EncryptionType", option_to_yojson encryption_type_to_yojson x.encryption_type);
      ("KMSEncrypted", option_to_yojson boolean__to_yojson x.kms_encrypted);
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("Role", Some (role_to_yojson x.role));
      ("LocationARN", Some (location_ar_n_to_yojson x.location_ar_n));
      ("DefaultStorageClass", option_to_yojson storage_class_to_yojson x.default_storage_class);
      ("ObjectACL", option_to_yojson object_ac_l_to_yojson x.object_ac_l);
      ("ReadOnly", option_to_yojson boolean__to_yojson x.read_only);
      ("GuessMIMETypeEnabled", option_to_yojson boolean__to_yojson x.guess_mime_type_enabled);
      ("RequesterPays", option_to_yojson boolean__to_yojson x.requester_pays);
      ("SMBACLEnabled", option_to_yojson boolean__to_yojson x.smbacl_enabled);
      ("AccessBasedEnumeration", option_to_yojson boolean__to_yojson x.access_based_enumeration);
      ("AdminUserList", option_to_yojson user_list_to_yojson x.admin_user_list);
      ("ValidUserList", option_to_yojson user_list_to_yojson x.valid_user_list);
      ("InvalidUserList", option_to_yojson user_list_to_yojson x.invalid_user_list);
      ( "AuditDestinationARN",
        option_to_yojson audit_destination_ar_n_to_yojson x.audit_destination_ar_n );
      ("Authentication", option_to_yojson authentication_to_yojson x.authentication);
      ("CaseSensitivity", option_to_yojson case_sensitivity_to_yojson x.case_sensitivity);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("FileShareName", option_to_yojson file_share_name_to_yojson x.file_share_name);
      ("CacheAttributes", option_to_yojson cache_attributes_to_yojson x.cache_attributes);
      ("NotificationPolicy", option_to_yojson notification_policy_to_yojson x.notification_policy);
      ("VPCEndpointDNSName", option_to_yojson dns_host_name_to_yojson x.vpc_endpoint_dns_name);
      ("BucketRegion", option_to_yojson region_id_to_yojson x.bucket_region);
      ("OplocksEnabled", option_to_yojson boolean__to_yojson x.oplocks_enabled);
    ]

let service_unavailable_error_to_yojson (x : service_unavailable_error) =
  assoc_to_yojson
    [
      ("message", option_to_yojson string__to_yojson x.message);
      ("error", option_to_yojson storage_gateway_error_to_yojson x.error);
    ]

let create_snapshot_output_to_yojson (x : create_snapshot_output) =
  assoc_to_yojson
    [
      ("VolumeARN", option_to_yojson volume_ar_n_to_yojson x.volume_ar_n);
      ("SnapshotId", option_to_yojson snapshot_id_to_yojson x.snapshot_id);
    ]

let snapshot_description_to_yojson = string_to_yojson

let create_snapshot_input_to_yojson (x : create_snapshot_input) =
  assoc_to_yojson
    [
      ("VolumeARN", Some (volume_ar_n_to_yojson x.volume_ar_n));
      ("SnapshotDescription", Some (snapshot_description_to_yojson x.snapshot_description));
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let create_snapshot_from_volume_recovery_point_output_to_yojson
    (x : create_snapshot_from_volume_recovery_point_output) =
  assoc_to_yojson
    [
      ("SnapshotId", option_to_yojson snapshot_id_to_yojson x.snapshot_id);
      ("VolumeARN", option_to_yojson volume_ar_n_to_yojson x.volume_ar_n);
      ("VolumeRecoveryPointTime", option_to_yojson string__to_yojson x.volume_recovery_point_time);
    ]

let create_snapshot_from_volume_recovery_point_input_to_yojson
    (x : create_snapshot_from_volume_recovery_point_input) =
  assoc_to_yojson
    [
      ("VolumeARN", Some (volume_ar_n_to_yojson x.volume_ar_n));
      ("SnapshotDescription", Some (snapshot_description_to_yojson x.snapshot_description));
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let create_storedi_scsi_volume_output_to_yojson (x : create_storedi_scsi_volume_output) =
  assoc_to_yojson
    [
      ("VolumeARN", option_to_yojson volume_ar_n_to_yojson x.volume_ar_n);
      ("VolumeSizeInBytes", option_to_yojson long_to_yojson x.volume_size_in_bytes);
      ("TargetARN", option_to_yojson target_ar_n_to_yojson x.target_ar_n);
    ]

let create_storedi_scsi_volume_input_to_yojson (x : create_storedi_scsi_volume_input) =
  assoc_to_yojson
    [
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
      ("DiskId", Some (disk_id_to_yojson x.disk_id));
      ("SnapshotId", option_to_yojson snapshot_id_to_yojson x.snapshot_id);
      ("PreserveExistingData", Some (boolean2_to_yojson x.preserve_existing_data));
      ("TargetName", Some (target_name_to_yojson x.target_name));
      ("NetworkInterfaceId", Some (network_interface_id_to_yojson x.network_interface_id));
      ("KMSEncrypted", option_to_yojson boolean__to_yojson x.kms_encrypted);
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let pool_ar_n_to_yojson = string_to_yojson

let create_tape_pool_output_to_yojson (x : create_tape_pool_output) =
  assoc_to_yojson [ ("PoolARN", option_to_yojson pool_ar_n_to_yojson x.pool_ar_n) ]

let retention_lock_time_in_days_to_yojson = int_to_yojson

let retention_lock_type_to_yojson (x : retention_lock_type) =
  match x with
  | COMPLIANCE -> `String "COMPLIANCE"
  | GOVERNANCE -> `String "GOVERNANCE"
  | NONE -> `String "NONE"

let tape_storage_class_to_yojson (x : tape_storage_class) =
  match x with DEEP_ARCHIVE -> `String "DEEP_ARCHIVE" | GLACIER -> `String "GLACIER"

let pool_name_to_yojson = string_to_yojson

let create_tape_pool_input_to_yojson (x : create_tape_pool_input) =
  assoc_to_yojson
    [
      ("PoolName", Some (pool_name_to_yojson x.pool_name));
      ("StorageClass", Some (tape_storage_class_to_yojson x.storage_class));
      ("RetentionLockType", option_to_yojson retention_lock_type_to_yojson x.retention_lock_type);
      ( "RetentionLockTimeInDays",
        option_to_yojson retention_lock_time_in_days_to_yojson x.retention_lock_time_in_days );
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let create_tape_with_barcode_output_to_yojson (x : create_tape_with_barcode_output) =
  assoc_to_yojson [ ("TapeARN", option_to_yojson tape_ar_n_to_yojson x.tape_ar_n) ]

let tape_barcode_to_yojson = string_to_yojson

let create_tape_with_barcode_input_to_yojson (x : create_tape_with_barcode_input) =
  assoc_to_yojson
    [
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
      ("TapeSizeInBytes", Some (tape_size_to_yojson x.tape_size_in_bytes));
      ("TapeBarcode", Some (tape_barcode_to_yojson x.tape_barcode));
      ("KMSEncrypted", option_to_yojson boolean__to_yojson x.kms_encrypted);
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("PoolId", option_to_yojson pool_id_to_yojson x.pool_id);
      ("Worm", option_to_yojson boolean2_to_yojson x.worm);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let tape_ar_ns_to_yojson tree = list_to_yojson tape_ar_n_to_yojson tree

let create_tapes_output_to_yojson (x : create_tapes_output) =
  assoc_to_yojson [ ("TapeARNs", option_to_yojson tape_ar_ns_to_yojson x.tape_ar_ns) ]

let num_tapes_to_create_to_yojson = int_to_yojson

let create_tapes_input_to_yojson (x : create_tapes_input) =
  assoc_to_yojson
    [
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
      ("TapeSizeInBytes", Some (tape_size_to_yojson x.tape_size_in_bytes));
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("NumTapesToCreate", Some (num_tapes_to_create_to_yojson x.num_tapes_to_create));
      ("TapeBarcodePrefix", Some (tape_barcode_prefix_to_yojson x.tape_barcode_prefix));
      ("KMSEncrypted", option_to_yojson boolean__to_yojson x.kms_encrypted);
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("PoolId", option_to_yojson pool_id_to_yojson x.pool_id);
      ("Worm", option_to_yojson boolean2_to_yojson x.worm);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let day_of_month_to_yojson = int_to_yojson

let delete_automatic_tape_creation_policy_output_to_yojson
    (x : delete_automatic_tape_creation_policy_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let delete_automatic_tape_creation_policy_input_to_yojson
    (x : delete_automatic_tape_creation_policy_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let delete_bandwidth_rate_limit_output_to_yojson (x : delete_bandwidth_rate_limit_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let delete_bandwidth_rate_limit_input_to_yojson (x : delete_bandwidth_rate_limit_input) =
  assoc_to_yojson
    [
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
      ("BandwidthType", Some (bandwidth_type_to_yojson x.bandwidth_type));
    ]

let delete_cache_report_output_to_yojson (x : delete_cache_report_output) =
  assoc_to_yojson
    [ ("CacheReportARN", option_to_yojson cache_report_ar_n_to_yojson x.cache_report_ar_n) ]

let delete_cache_report_input_to_yojson (x : delete_cache_report_input) =
  assoc_to_yojson [ ("CacheReportARN", Some (cache_report_ar_n_to_yojson x.cache_report_ar_n)) ]

let delete_chap_credentials_output_to_yojson (x : delete_chap_credentials_output) =
  assoc_to_yojson
    [
      ("TargetARN", option_to_yojson target_ar_n_to_yojson x.target_ar_n);
      ("InitiatorName", option_to_yojson iqn_name_to_yojson x.initiator_name);
    ]

let delete_chap_credentials_input_to_yojson (x : delete_chap_credentials_input) =
  assoc_to_yojson
    [
      ("TargetARN", Some (target_ar_n_to_yojson x.target_ar_n));
      ("InitiatorName", Some (iqn_name_to_yojson x.initiator_name));
    ]

let delete_file_share_output_to_yojson (x : delete_file_share_output) =
  assoc_to_yojson [ ("FileShareARN", option_to_yojson file_share_ar_n_to_yojson x.file_share_ar_n) ]

let delete_file_share_input_to_yojson (x : delete_file_share_input) =
  assoc_to_yojson
    [
      ("FileShareARN", Some (file_share_ar_n_to_yojson x.file_share_ar_n));
      ("ForceDelete", option_to_yojson boolean2_to_yojson x.force_delete);
    ]

let delete_gateway_output_to_yojson (x : delete_gateway_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let delete_gateway_input_to_yojson (x : delete_gateway_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let delete_snapshot_schedule_output_to_yojson (x : delete_snapshot_schedule_output) =
  assoc_to_yojson [ ("VolumeARN", option_to_yojson volume_ar_n_to_yojson x.volume_ar_n) ]

let delete_snapshot_schedule_input_to_yojson (x : delete_snapshot_schedule_input) =
  assoc_to_yojson [ ("VolumeARN", Some (volume_ar_n_to_yojson x.volume_ar_n)) ]

let delete_tape_output_to_yojson (x : delete_tape_output) =
  assoc_to_yojson [ ("TapeARN", option_to_yojson tape_ar_n_to_yojson x.tape_ar_n) ]

let delete_tape_input_to_yojson (x : delete_tape_input) =
  assoc_to_yojson
    [
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
      ("TapeARN", Some (tape_ar_n_to_yojson x.tape_ar_n));
      ( "BypassGovernanceRetention",
        option_to_yojson boolean2_to_yojson x.bypass_governance_retention );
    ]

let delete_tape_archive_output_to_yojson (x : delete_tape_archive_output) =
  assoc_to_yojson [ ("TapeARN", option_to_yojson tape_ar_n_to_yojson x.tape_ar_n) ]

let delete_tape_archive_input_to_yojson (x : delete_tape_archive_input) =
  assoc_to_yojson
    [
      ("TapeARN", Some (tape_ar_n_to_yojson x.tape_ar_n));
      ( "BypassGovernanceRetention",
        option_to_yojson boolean2_to_yojson x.bypass_governance_retention );
    ]

let delete_tape_pool_output_to_yojson (x : delete_tape_pool_output) =
  assoc_to_yojson [ ("PoolARN", option_to_yojson pool_ar_n_to_yojson x.pool_ar_n) ]

let delete_tape_pool_input_to_yojson (x : delete_tape_pool_input) =
  assoc_to_yojson [ ("PoolARN", Some (pool_ar_n_to_yojson x.pool_ar_n)) ]

let delete_volume_output_to_yojson (x : delete_volume_output) =
  assoc_to_yojson [ ("VolumeARN", option_to_yojson volume_ar_n_to_yojson x.volume_ar_n) ]

let delete_volume_input_to_yojson (x : delete_volume_input) =
  assoc_to_yojson [ ("VolumeARN", Some (volume_ar_n_to_yojson x.volume_ar_n)) ]

let deprecation_date_to_yojson = string_to_yojson

let describe_availability_monitor_test_output_to_yojson
    (x : describe_availability_monitor_test_output) =
  assoc_to_yojson
    [
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
      ("Status", option_to_yojson availability_monitor_test_status_to_yojson x.status);
      ("StartTime", option_to_yojson time_to_yojson x.start_time);
    ]

let describe_availability_monitor_test_input_to_yojson
    (x : describe_availability_monitor_test_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let describe_bandwidth_rate_limit_output_to_yojson (x : describe_bandwidth_rate_limit_output) =
  assoc_to_yojson
    [
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
      ( "AverageUploadRateLimitInBitsPerSec",
        option_to_yojson bandwidth_upload_rate_limit_to_yojson
          x.average_upload_rate_limit_in_bits_per_sec );
      ( "AverageDownloadRateLimitInBitsPerSec",
        option_to_yojson bandwidth_download_rate_limit_to_yojson
          x.average_download_rate_limit_in_bits_per_sec );
    ]

let describe_bandwidth_rate_limit_input_to_yojson (x : describe_bandwidth_rate_limit_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let describe_bandwidth_rate_limit_schedule_output_to_yojson
    (x : describe_bandwidth_rate_limit_schedule_output) =
  assoc_to_yojson
    [
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
      ( "BandwidthRateLimitIntervals",
        option_to_yojson bandwidth_rate_limit_intervals_to_yojson x.bandwidth_rate_limit_intervals
      );
    ]

let describe_bandwidth_rate_limit_schedule_input_to_yojson
    (x : describe_bandwidth_rate_limit_schedule_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let double_to_yojson = double_to_yojson

let describe_cache_output_to_yojson (x : describe_cache_output) =
  assoc_to_yojson
    [
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
      ("DiskIds", option_to_yojson disk_ids_to_yojson x.disk_ids);
      ("CacheAllocatedInBytes", option_to_yojson long_to_yojson x.cache_allocated_in_bytes);
      ("CacheUsedPercentage", option_to_yojson double_to_yojson x.cache_used_percentage);
      ("CacheDirtyPercentage", option_to_yojson double_to_yojson x.cache_dirty_percentage);
      ("CacheHitPercentage", option_to_yojson double_to_yojson x.cache_hit_percentage);
      ("CacheMissPercentage", option_to_yojson double_to_yojson x.cache_miss_percentage);
    ]

let describe_cache_input_to_yojson (x : describe_cache_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let describe_cache_report_output_to_yojson (x : describe_cache_report_output) =
  assoc_to_yojson
    [ ("CacheReportInfo", option_to_yojson cache_report_info_to_yojson x.cache_report_info) ]

let describe_cache_report_input_to_yojson (x : describe_cache_report_input) =
  assoc_to_yojson [ ("CacheReportARN", Some (cache_report_ar_n_to_yojson x.cache_report_ar_n)) ]

let describe_cachedi_scsi_volumes_output_to_yojson (x : describe_cachedi_scsi_volumes_output) =
  assoc_to_yojson
    [
      ("CachediSCSIVolumes", option_to_yojson cachedi_scsi_volumes_to_yojson x.cachedi_scsi_volumes);
    ]

let volume_ar_ns_to_yojson tree = list_to_yojson volume_ar_n_to_yojson tree

let describe_cachedi_scsi_volumes_input_to_yojson (x : describe_cachedi_scsi_volumes_input) =
  assoc_to_yojson [ ("VolumeARNs", Some (volume_ar_ns_to_yojson x.volume_ar_ns)) ]

let describe_chap_credentials_output_to_yojson (x : describe_chap_credentials_output) =
  assoc_to_yojson
    [ ("ChapCredentials", option_to_yojson chap_credentials_to_yojson x.chap_credentials) ]

let describe_chap_credentials_input_to_yojson (x : describe_chap_credentials_input) =
  assoc_to_yojson [ ("TargetARN", Some (target_ar_n_to_yojson x.target_ar_n)) ]

let file_system_association_sync_error_code_to_yojson = string_to_yojson

let file_system_association_status_detail_to_yojson (x : file_system_association_status_detail) =
  assoc_to_yojson
    [
      ("ErrorCode", option_to_yojson file_system_association_sync_error_code_to_yojson x.error_code);
    ]

let file_system_association_status_details_to_yojson tree =
  list_to_yojson file_system_association_status_detail_to_yojson tree

let file_system_association_status_to_yojson = string_to_yojson

let file_system_association_info_to_yojson (x : file_system_association_info) =
  assoc_to_yojson
    [
      ( "FileSystemAssociationARN",
        option_to_yojson file_system_association_ar_n_to_yojson x.file_system_association_ar_n );
      ("LocationARN", option_to_yojson file_system_location_ar_n_to_yojson x.location_ar_n);
      ( "FileSystemAssociationStatus",
        option_to_yojson file_system_association_status_to_yojson x.file_system_association_status
      );
      ( "AuditDestinationARN",
        option_to_yojson audit_destination_ar_n_to_yojson x.audit_destination_ar_n );
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("CacheAttributes", option_to_yojson cache_attributes_to_yojson x.cache_attributes);
      ( "EndpointNetworkConfiguration",
        option_to_yojson endpoint_network_configuration_to_yojson x.endpoint_network_configuration
      );
      ( "FileSystemAssociationStatusDetails",
        option_to_yojson file_system_association_status_details_to_yojson
          x.file_system_association_status_details );
    ]

let file_system_association_info_list_to_yojson tree =
  list_to_yojson file_system_association_info_to_yojson tree

let describe_file_system_associations_output_to_yojson
    (x : describe_file_system_associations_output) =
  assoc_to_yojson
    [
      ( "FileSystemAssociationInfoList",
        option_to_yojson file_system_association_info_list_to_yojson
          x.file_system_association_info_list );
    ]

let file_system_association_arn_list_to_yojson tree =
  list_to_yojson file_system_association_ar_n_to_yojson tree

let describe_file_system_associations_input_to_yojson (x : describe_file_system_associations_input)
    =
  assoc_to_yojson
    [
      ( "FileSystemAssociationARNList",
        Some (file_system_association_arn_list_to_yojson x.file_system_association_arn_list) );
    ]

let software_version_to_yojson = string_to_yojson
let host_environment_id_to_yojson = string_to_yojson

let gateway_capacity_to_yojson (x : gateway_capacity) =
  match x with Small -> `String "Small" | Medium -> `String "Medium" | Large -> `String "Large"

let supported_gateway_capacities_to_yojson tree = list_to_yojson gateway_capacity_to_yojson tree
let software_updates_end_date_to_yojson = string_to_yojson
let endpoint_type_to_yojson = string_to_yojson

let host_environment_to_yojson (x : host_environment) =
  match x with
  | VMWARE -> `String "VMWARE"
  | HYPER_V -> `String "HYPER-V"
  | EC2 -> `String "EC2"
  | KVM -> `String "KVM"
  | OTHER -> `String "OTHER"
  | SNOWBALL -> `String "SNOWBALL"

let ec2_instance_region_to_yojson = string_to_yojson
let ec2_instance_id_to_yojson = string_to_yojson
let last_software_update_to_yojson = string_to_yojson
let next_update_availability_date_to_yojson = string_to_yojson

let network_interface_to_yojson (x : network_interface) =
  assoc_to_yojson
    [
      ("Ipv4Address", option_to_yojson string__to_yojson x.ipv4_address);
      ("MacAddress", option_to_yojson string__to_yojson x.mac_address);
      ("Ipv6Address", option_to_yojson string__to_yojson x.ipv6_address);
    ]

let gateway_network_interfaces_to_yojson tree = list_to_yojson network_interface_to_yojson tree
let gateway_state_to_yojson = string_to_yojson
let gateway_id_to_yojson = string_to_yojson

let describe_gateway_information_output_to_yojson (x : describe_gateway_information_output) =
  assoc_to_yojson
    [
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
      ("GatewayId", option_to_yojson gateway_id_to_yojson x.gateway_id);
      ("GatewayName", option_to_yojson string__to_yojson x.gateway_name);
      ("GatewayTimezone", option_to_yojson gateway_timezone_to_yojson x.gateway_timezone);
      ("GatewayState", option_to_yojson gateway_state_to_yojson x.gateway_state);
      ( "GatewayNetworkInterfaces",
        option_to_yojson gateway_network_interfaces_to_yojson x.gateway_network_interfaces );
      ("GatewayType", option_to_yojson gateway_type_to_yojson x.gateway_type);
      ( "NextUpdateAvailabilityDate",
        option_to_yojson next_update_availability_date_to_yojson x.next_update_availability_date );
      ("LastSoftwareUpdate", option_to_yojson last_software_update_to_yojson x.last_software_update);
      ("Ec2InstanceId", option_to_yojson ec2_instance_id_to_yojson x.ec2_instance_id);
      ("Ec2InstanceRegion", option_to_yojson ec2_instance_region_to_yojson x.ec2_instance_region);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("VPCEndpoint", option_to_yojson string__to_yojson x.vpc_endpoint);
      ( "CloudWatchLogGroupARN",
        option_to_yojson cloud_watch_log_group_ar_n_to_yojson x.cloud_watch_log_group_ar_n );
      ("HostEnvironment", option_to_yojson host_environment_to_yojson x.host_environment);
      ("EndpointType", option_to_yojson endpoint_type_to_yojson x.endpoint_type);
      ( "SoftwareUpdatesEndDate",
        option_to_yojson software_updates_end_date_to_yojson x.software_updates_end_date );
      ("DeprecationDate", option_to_yojson deprecation_date_to_yojson x.deprecation_date);
      ("GatewayCapacity", option_to_yojson gateway_capacity_to_yojson x.gateway_capacity);
      ( "SupportedGatewayCapacities",
        option_to_yojson supported_gateway_capacities_to_yojson x.supported_gateway_capacities );
      ("HostEnvironmentId", option_to_yojson host_environment_id_to_yojson x.host_environment_id);
      ("SoftwareVersion", option_to_yojson software_version_to_yojson x.software_version);
    ]

let describe_gateway_information_input_to_yojson (x : describe_gateway_information_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let software_update_preferences_to_yojson (x : software_update_preferences) =
  assoc_to_yojson
    [
      ( "AutomaticUpdatePolicy",
        option_to_yojson automatic_update_policy_to_yojson x.automatic_update_policy );
    ]

let describe_maintenance_start_time_output_to_yojson (x : describe_maintenance_start_time_output) =
  assoc_to_yojson
    [
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
      ("HourOfDay", option_to_yojson hour_of_day_to_yojson x.hour_of_day);
      ("MinuteOfHour", option_to_yojson minute_of_hour_to_yojson x.minute_of_hour);
      ("DayOfWeek", option_to_yojson day_of_week_to_yojson x.day_of_week);
      ("DayOfMonth", option_to_yojson day_of_month_to_yojson x.day_of_month);
      ("Timezone", option_to_yojson gateway_timezone_to_yojson x.timezone);
      ( "SoftwareUpdatePreferences",
        option_to_yojson software_update_preferences_to_yojson x.software_update_preferences );
    ]

let describe_maintenance_start_time_input_to_yojson (x : describe_maintenance_start_time_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let path_to_yojson = string_to_yojson
let file_share_status_to_yojson = string_to_yojson
let file_share_id_to_yojson = string_to_yojson

let nfs_file_share_info_to_yojson (x : nfs_file_share_info) =
  assoc_to_yojson
    [
      ( "NFSFileShareDefaults",
        option_to_yojson nfs_file_share_defaults_to_yojson x.nfs_file_share_defaults );
      ("FileShareARN", option_to_yojson file_share_ar_n_to_yojson x.file_share_ar_n);
      ("FileShareId", option_to_yojson file_share_id_to_yojson x.file_share_id);
      ("FileShareStatus", option_to_yojson file_share_status_to_yojson x.file_share_status);
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
      ("EncryptionType", option_to_yojson encryption_type_to_yojson x.encryption_type);
      ("KMSEncrypted", option_to_yojson boolean2_to_yojson x.kms_encrypted);
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("Path", option_to_yojson path_to_yojson x.path);
      ("Role", option_to_yojson role_to_yojson x.role);
      ("LocationARN", option_to_yojson location_ar_n_to_yojson x.location_ar_n);
      ("DefaultStorageClass", option_to_yojson storage_class_to_yojson x.default_storage_class);
      ("ObjectACL", option_to_yojson object_ac_l_to_yojson x.object_ac_l);
      ("ClientList", option_to_yojson file_share_client_list_to_yojson x.client_list);
      ("Squash", option_to_yojson squash_to_yojson x.squash);
      ("ReadOnly", option_to_yojson boolean__to_yojson x.read_only);
      ("GuessMIMETypeEnabled", option_to_yojson boolean__to_yojson x.guess_mime_type_enabled);
      ("RequesterPays", option_to_yojson boolean__to_yojson x.requester_pays);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("FileShareName", option_to_yojson file_share_name_to_yojson x.file_share_name);
      ("CacheAttributes", option_to_yojson cache_attributes_to_yojson x.cache_attributes);
      ("NotificationPolicy", option_to_yojson notification_policy_to_yojson x.notification_policy);
      ("VPCEndpointDNSName", option_to_yojson dns_host_name_to_yojson x.vpc_endpoint_dns_name);
      ("BucketRegion", option_to_yojson region_id_to_yojson x.bucket_region);
      ( "AuditDestinationARN",
        option_to_yojson audit_destination_ar_n_to_yojson x.audit_destination_ar_n );
    ]

let nfs_file_share_info_list_to_yojson tree = list_to_yojson nfs_file_share_info_to_yojson tree

let describe_nfs_file_shares_output_to_yojson (x : describe_nfs_file_shares_output) =
  assoc_to_yojson
    [
      ( "NFSFileShareInfoList",
        option_to_yojson nfs_file_share_info_list_to_yojson x.nfs_file_share_info_list );
    ]

let file_share_arn_list_to_yojson tree = list_to_yojson file_share_ar_n_to_yojson tree

let describe_nfs_file_shares_input_to_yojson (x : describe_nfs_file_shares_input) =
  assoc_to_yojson
    [ ("FileShareARNList", Some (file_share_arn_list_to_yojson x.file_share_arn_list)) ]

let smb_file_share_info_to_yojson (x : smb_file_share_info) =
  assoc_to_yojson
    [
      ("FileShareARN", option_to_yojson file_share_ar_n_to_yojson x.file_share_ar_n);
      ("FileShareId", option_to_yojson file_share_id_to_yojson x.file_share_id);
      ("FileShareStatus", option_to_yojson file_share_status_to_yojson x.file_share_status);
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
      ("EncryptionType", option_to_yojson encryption_type_to_yojson x.encryption_type);
      ("KMSEncrypted", option_to_yojson boolean2_to_yojson x.kms_encrypted);
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("Path", option_to_yojson path_to_yojson x.path);
      ("Role", option_to_yojson role_to_yojson x.role);
      ("LocationARN", option_to_yojson location_ar_n_to_yojson x.location_ar_n);
      ("DefaultStorageClass", option_to_yojson storage_class_to_yojson x.default_storage_class);
      ("ObjectACL", option_to_yojson object_ac_l_to_yojson x.object_ac_l);
      ("ReadOnly", option_to_yojson boolean__to_yojson x.read_only);
      ("GuessMIMETypeEnabled", option_to_yojson boolean__to_yojson x.guess_mime_type_enabled);
      ("RequesterPays", option_to_yojson boolean__to_yojson x.requester_pays);
      ("SMBACLEnabled", option_to_yojson boolean__to_yojson x.smbacl_enabled);
      ("AccessBasedEnumeration", option_to_yojson boolean__to_yojson x.access_based_enumeration);
      ("AdminUserList", option_to_yojson user_list_to_yojson x.admin_user_list);
      ("ValidUserList", option_to_yojson user_list_to_yojson x.valid_user_list);
      ("InvalidUserList", option_to_yojson user_list_to_yojson x.invalid_user_list);
      ( "AuditDestinationARN",
        option_to_yojson audit_destination_ar_n_to_yojson x.audit_destination_ar_n );
      ("Authentication", option_to_yojson authentication_to_yojson x.authentication);
      ("CaseSensitivity", option_to_yojson case_sensitivity_to_yojson x.case_sensitivity);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("FileShareName", option_to_yojson file_share_name_to_yojson x.file_share_name);
      ("CacheAttributes", option_to_yojson cache_attributes_to_yojson x.cache_attributes);
      ("NotificationPolicy", option_to_yojson notification_policy_to_yojson x.notification_policy);
      ("VPCEndpointDNSName", option_to_yojson dns_host_name_to_yojson x.vpc_endpoint_dns_name);
      ("BucketRegion", option_to_yojson region_id_to_yojson x.bucket_region);
      ("OplocksEnabled", option_to_yojson boolean__to_yojson x.oplocks_enabled);
    ]

let smb_file_share_info_list_to_yojson tree = list_to_yojson smb_file_share_info_to_yojson tree

let describe_smb_file_shares_output_to_yojson (x : describe_smb_file_shares_output) =
  assoc_to_yojson
    [
      ( "SMBFileShareInfoList",
        option_to_yojson smb_file_share_info_list_to_yojson x.smb_file_share_info_list );
    ]

let describe_smb_file_shares_input_to_yojson (x : describe_smb_file_shares_input) =
  assoc_to_yojson
    [ ("FileShareARNList", Some (file_share_arn_list_to_yojson x.file_share_arn_list)) ]

let smb_local_groups_to_yojson (x : smb_local_groups) =
  assoc_to_yojson [ ("GatewayAdmins", option_to_yojson user_list_to_yojson x.gateway_admins) ]

let smb_security_strategy_to_yojson (x : smb_security_strategy) =
  match x with
  | ClientSpecified -> `String "ClientSpecified"
  | MandatorySigning -> `String "MandatorySigning"
  | MandatoryEncryption -> `String "MandatoryEncryption"
  | MandatoryEncryptionNoAes128 -> `String "MandatoryEncryptionNoAes128"

let domain_name_to_yojson = string_to_yojson

let describe_smb_settings_output_to_yojson (x : describe_smb_settings_output) =
  assoc_to_yojson
    [
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
      ("DomainName", option_to_yojson domain_name_to_yojson x.domain_name);
      ( "ActiveDirectoryStatus",
        option_to_yojson active_directory_status_to_yojson x.active_directory_status );
      ("SMBGuestPasswordSet", option_to_yojson boolean__to_yojson x.smb_guest_password_set);
      ( "SMBSecurityStrategy",
        option_to_yojson smb_security_strategy_to_yojson x.smb_security_strategy );
      ("FileSharesVisible", option_to_yojson boolean__to_yojson x.file_shares_visible);
      ("SMBLocalGroups", option_to_yojson smb_local_groups_to_yojson x.smb_local_groups);
    ]

let describe_smb_settings_input_to_yojson (x : describe_smb_settings_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let description_to_yojson = string_to_yojson
let recurrence_in_hours_to_yojson = int_to_yojson

let describe_snapshot_schedule_output_to_yojson (x : describe_snapshot_schedule_output) =
  assoc_to_yojson
    [
      ("VolumeARN", option_to_yojson volume_ar_n_to_yojson x.volume_ar_n);
      ("StartAt", option_to_yojson hour_of_day_to_yojson x.start_at);
      ("RecurrenceInHours", option_to_yojson recurrence_in_hours_to_yojson x.recurrence_in_hours);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Timezone", option_to_yojson gateway_timezone_to_yojson x.timezone);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let describe_snapshot_schedule_input_to_yojson (x : describe_snapshot_schedule_input) =
  assoc_to_yojson [ ("VolumeARN", Some (volume_ar_n_to_yojson x.volume_ar_n)) ]

let storedi_scsi_volume_to_yojson (x : storedi_scsi_volume) =
  assoc_to_yojson
    [
      ("VolumeARN", option_to_yojson volume_ar_n_to_yojson x.volume_ar_n);
      ("VolumeId", option_to_yojson volume_id_to_yojson x.volume_id);
      ("VolumeType", option_to_yojson volume_type_to_yojson x.volume_type);
      ("VolumeStatus", option_to_yojson volume_status_to_yojson x.volume_status);
      ( "VolumeAttachmentStatus",
        option_to_yojson volume_attachment_status_to_yojson x.volume_attachment_status );
      ("VolumeSizeInBytes", option_to_yojson long_to_yojson x.volume_size_in_bytes);
      ("VolumeProgress", option_to_yojson double_object_to_yojson x.volume_progress);
      ("VolumeDiskId", option_to_yojson disk_id_to_yojson x.volume_disk_id);
      ("SourceSnapshotId", option_to_yojson snapshot_id_to_yojson x.source_snapshot_id);
      ("PreservedExistingData", option_to_yojson boolean2_to_yojson x.preserved_existing_data);
      ( "VolumeiSCSIAttributes",
        option_to_yojson volumei_scsi_attributes_to_yojson x.volumei_scsi_attributes );
      ("CreatedDate", option_to_yojson created_date_to_yojson x.created_date);
      ("VolumeUsedInBytes", option_to_yojson volume_used_in_bytes_to_yojson x.volume_used_in_bytes);
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("TargetName", option_to_yojson target_name_to_yojson x.target_name);
    ]

let storedi_scsi_volumes_to_yojson tree = list_to_yojson storedi_scsi_volume_to_yojson tree

let describe_storedi_scsi_volumes_output_to_yojson (x : describe_storedi_scsi_volumes_output) =
  assoc_to_yojson
    [
      ("StorediSCSIVolumes", option_to_yojson storedi_scsi_volumes_to_yojson x.storedi_scsi_volumes);
    ]

let describe_storedi_scsi_volumes_input_to_yojson (x : describe_storedi_scsi_volumes_input) =
  assoc_to_yojson [ ("VolumeARNs", Some (volume_ar_ns_to_yojson x.volume_ar_ns)) ]

let marker_to_yojson = string_to_yojson
let tape_usage_to_yojson = long_to_yojson
let tape_archive_status_to_yojson = string_to_yojson

let tape_archive_to_yojson (x : tape_archive) =
  assoc_to_yojson
    [
      ("TapeARN", option_to_yojson tape_ar_n_to_yojson x.tape_ar_n);
      ("TapeBarcode", option_to_yojson tape_barcode_to_yojson x.tape_barcode);
      ("TapeCreatedDate", option_to_yojson time_to_yojson x.tape_created_date);
      ("TapeSizeInBytes", option_to_yojson tape_size_to_yojson x.tape_size_in_bytes);
      ("CompletionTime", option_to_yojson time_to_yojson x.completion_time);
      ("RetrievedTo", option_to_yojson gateway_ar_n_to_yojson x.retrieved_to);
      ("TapeStatus", option_to_yojson tape_archive_status_to_yojson x.tape_status);
      ("TapeUsedInBytes", option_to_yojson tape_usage_to_yojson x.tape_used_in_bytes);
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("PoolId", option_to_yojson pool_id_to_yojson x.pool_id);
      ("Worm", option_to_yojson boolean2_to_yojson x.worm);
      ("RetentionStartDate", option_to_yojson time_to_yojson x.retention_start_date);
      ("PoolEntryDate", option_to_yojson time_to_yojson x.pool_entry_date);
    ]

let tape_archives_to_yojson tree = list_to_yojson tape_archive_to_yojson tree

let describe_tape_archives_output_to_yojson (x : describe_tape_archives_output) =
  assoc_to_yojson
    [
      ("TapeArchives", option_to_yojson tape_archives_to_yojson x.tape_archives);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
    ]

let describe_tape_archives_input_to_yojson (x : describe_tape_archives_input) =
  assoc_to_yojson
    [
      ("TapeARNs", option_to_yojson tape_ar_ns_to_yojson x.tape_ar_ns);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("Limit", option_to_yojson positive_int_object_to_yojson x.limit);
    ]

let tape_recovery_point_status_to_yojson = string_to_yojson

let tape_recovery_point_info_to_yojson (x : tape_recovery_point_info) =
  assoc_to_yojson
    [
      ("TapeARN", option_to_yojson tape_ar_n_to_yojson x.tape_ar_n);
      ("TapeRecoveryPointTime", option_to_yojson time_to_yojson x.tape_recovery_point_time);
      ("TapeSizeInBytes", option_to_yojson tape_size_to_yojson x.tape_size_in_bytes);
      ("TapeStatus", option_to_yojson tape_recovery_point_status_to_yojson x.tape_status);
    ]

let tape_recovery_point_infos_to_yojson tree =
  list_to_yojson tape_recovery_point_info_to_yojson tree

let describe_tape_recovery_points_output_to_yojson (x : describe_tape_recovery_points_output) =
  assoc_to_yojson
    [
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
      ( "TapeRecoveryPointInfos",
        option_to_yojson tape_recovery_point_infos_to_yojson x.tape_recovery_point_infos );
      ("Marker", option_to_yojson marker_to_yojson x.marker);
    ]

let describe_tape_recovery_points_input_to_yojson (x : describe_tape_recovery_points_input) =
  assoc_to_yojson
    [
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("Limit", option_to_yojson positive_int_object_to_yojson x.limit);
    ]

let vtl_device_ar_n_to_yojson = string_to_yojson
let tape_status_to_yojson = string_to_yojson

let tape_to_yojson (x : tape) =
  assoc_to_yojson
    [
      ("TapeARN", option_to_yojson tape_ar_n_to_yojson x.tape_ar_n);
      ("TapeBarcode", option_to_yojson tape_barcode_to_yojson x.tape_barcode);
      ("TapeCreatedDate", option_to_yojson time_to_yojson x.tape_created_date);
      ("TapeSizeInBytes", option_to_yojson tape_size_to_yojson x.tape_size_in_bytes);
      ("TapeStatus", option_to_yojson tape_status_to_yojson x.tape_status);
      ("VTLDevice", option_to_yojson vtl_device_ar_n_to_yojson x.vtl_device);
      ("Progress", option_to_yojson double_object_to_yojson x.progress);
      ("TapeUsedInBytes", option_to_yojson tape_usage_to_yojson x.tape_used_in_bytes);
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("PoolId", option_to_yojson pool_id_to_yojson x.pool_id);
      ("Worm", option_to_yojson boolean2_to_yojson x.worm);
      ("RetentionStartDate", option_to_yojson time_to_yojson x.retention_start_date);
      ("PoolEntryDate", option_to_yojson time_to_yojson x.pool_entry_date);
    ]

let tapes_to_yojson tree = list_to_yojson tape_to_yojson tree

let describe_tapes_output_to_yojson (x : describe_tapes_output) =
  assoc_to_yojson
    [
      ("Tapes", option_to_yojson tapes_to_yojson x.tapes);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
    ]

let describe_tapes_input_to_yojson (x : describe_tapes_input) =
  assoc_to_yojson
    [
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
      ("TapeARNs", option_to_yojson tape_ar_ns_to_yojson x.tape_ar_ns);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("Limit", option_to_yojson positive_int_object_to_yojson x.limit);
    ]

let describe_upload_buffer_output_to_yojson (x : describe_upload_buffer_output) =
  assoc_to_yojson
    [
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
      ("DiskIds", option_to_yojson disk_ids_to_yojson x.disk_ids);
      ("UploadBufferUsedInBytes", option_to_yojson long_to_yojson x.upload_buffer_used_in_bytes);
      ( "UploadBufferAllocatedInBytes",
        option_to_yojson long_to_yojson x.upload_buffer_allocated_in_bytes );
    ]

let describe_upload_buffer_input_to_yojson (x : describe_upload_buffer_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let devicei_scsi_attributes_to_yojson (x : devicei_scsi_attributes) =
  assoc_to_yojson
    [
      ("TargetARN", option_to_yojson target_ar_n_to_yojson x.target_ar_n);
      ("NetworkInterfaceId", option_to_yojson network_interface_id_to_yojson x.network_interface_id);
      ("NetworkInterfacePort", option_to_yojson integer_to_yojson x.network_interface_port);
      ("ChapEnabled", option_to_yojson boolean2_to_yojson x.chap_enabled);
    ]

let vtl_device_product_identifier_to_yojson = string_to_yojson
let vtl_device_vendor_to_yojson = string_to_yojson
let vtl_device_type_to_yojson = string_to_yojson

let vtl_device_to_yojson (x : vtl_device) =
  assoc_to_yojson
    [
      ("VTLDeviceARN", option_to_yojson vtl_device_ar_n_to_yojson x.vtl_device_ar_n);
      ("VTLDeviceType", option_to_yojson vtl_device_type_to_yojson x.vtl_device_type);
      ("VTLDeviceVendor", option_to_yojson vtl_device_vendor_to_yojson x.vtl_device_vendor);
      ( "VTLDeviceProductIdentifier",
        option_to_yojson vtl_device_product_identifier_to_yojson x.vtl_device_product_identifier );
      ( "DeviceiSCSIAttributes",
        option_to_yojson devicei_scsi_attributes_to_yojson x.devicei_scsi_attributes );
    ]

let vtl_devices_to_yojson tree = list_to_yojson vtl_device_to_yojson tree

let describe_vtl_devices_output_to_yojson (x : describe_vtl_devices_output) =
  assoc_to_yojson
    [
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
      ("VTLDevices", option_to_yojson vtl_devices_to_yojson x.vtl_devices);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
    ]

let vtl_device_ar_ns_to_yojson tree = list_to_yojson vtl_device_ar_n_to_yojson tree

let describe_vtl_devices_input_to_yojson (x : describe_vtl_devices_input) =
  assoc_to_yojson
    [
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
      ("VTLDeviceARNs", option_to_yojson vtl_device_ar_ns_to_yojson x.vtl_device_ar_ns);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("Limit", option_to_yojson positive_int_object_to_yojson x.limit);
    ]

let describe_working_storage_output_to_yojson (x : describe_working_storage_output) =
  assoc_to_yojson
    [
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
      ("DiskIds", option_to_yojson disk_ids_to_yojson x.disk_ids);
      ("WorkingStorageUsedInBytes", option_to_yojson long_to_yojson x.working_storage_used_in_bytes);
      ( "WorkingStorageAllocatedInBytes",
        option_to_yojson long_to_yojson x.working_storage_allocated_in_bytes );
    ]

let describe_working_storage_input_to_yojson (x : describe_working_storage_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let detach_volume_output_to_yojson (x : detach_volume_output) =
  assoc_to_yojson [ ("VolumeARN", option_to_yojson volume_ar_n_to_yojson x.volume_ar_n) ]

let detach_volume_input_to_yojson (x : detach_volume_input) =
  assoc_to_yojson
    [
      ("VolumeARN", Some (volume_ar_n_to_yojson x.volume_ar_n));
      ("ForceDetach", option_to_yojson boolean__to_yojson x.force_detach);
    ]

let device_type_to_yojson = string_to_yojson

let disable_gateway_output_to_yojson (x : disable_gateway_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let disable_gateway_input_to_yojson (x : disable_gateway_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let disassociate_file_system_output_to_yojson (x : disassociate_file_system_output) =
  assoc_to_yojson
    [
      ( "FileSystemAssociationARN",
        option_to_yojson file_system_association_ar_n_to_yojson x.file_system_association_ar_n );
    ]

let disassociate_file_system_input_to_yojson (x : disassociate_file_system_input) =
  assoc_to_yojson
    [
      ( "FileSystemAssociationARN",
        Some (file_system_association_ar_n_to_yojson x.file_system_association_ar_n) );
      ("ForceDelete", option_to_yojson boolean2_to_yojson x.force_delete);
    ]

let disk_attribute_to_yojson = string_to_yojson
let disk_attribute_list_to_yojson tree = list_to_yojson disk_attribute_to_yojson tree
let disk_allocation_type_to_yojson = string_to_yojson

let disk_to_yojson (x : disk) =
  assoc_to_yojson
    [
      ("DiskId", option_to_yojson disk_id_to_yojson x.disk_id);
      ("DiskPath", option_to_yojson string__to_yojson x.disk_path);
      ("DiskNode", option_to_yojson string__to_yojson x.disk_node);
      ("DiskStatus", option_to_yojson string__to_yojson x.disk_status);
      ("DiskSizeInBytes", option_to_yojson long_to_yojson x.disk_size_in_bytes);
      ("DiskAllocationType", option_to_yojson disk_allocation_type_to_yojson x.disk_allocation_type);
      ("DiskAllocationResource", option_to_yojson string__to_yojson x.disk_allocation_resource);
      ("DiskAttributeList", option_to_yojson disk_attribute_list_to_yojson x.disk_attribute_list);
    ]

let disks_to_yojson tree = list_to_yojson disk_to_yojson tree

let evict_files_failing_upload_output_to_yojson (x : evict_files_failing_upload_output) =
  assoc_to_yojson [ ("NotificationId", option_to_yojson string__to_yojson x.notification_id) ]

let evict_files_failing_upload_input_to_yojson (x : evict_files_failing_upload_input) =
  assoc_to_yojson
    [
      ("FileShareARN", Some (file_share_ar_n_to_yojson x.file_share_ar_n));
      ("ForceRemove", option_to_yojson boolean2_to_yojson x.force_remove);
    ]

let file_share_type_to_yojson (x : file_share_type) =
  match x with NFS -> `String "NFS" | SMB -> `String "SMB"

let file_share_info_to_yojson (x : file_share_info) =
  assoc_to_yojson
    [
      ("FileShareType", option_to_yojson file_share_type_to_yojson x.file_share_type);
      ("FileShareARN", option_to_yojson file_share_ar_n_to_yojson x.file_share_ar_n);
      ("FileShareId", option_to_yojson file_share_id_to_yojson x.file_share_id);
      ("FileShareStatus", option_to_yojson file_share_status_to_yojson x.file_share_status);
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
    ]

let file_share_info_list_to_yojson tree = list_to_yojson file_share_info_to_yojson tree
let file_system_association_id_to_yojson = string_to_yojson

let file_system_association_summary_to_yojson (x : file_system_association_summary) =
  assoc_to_yojson
    [
      ( "FileSystemAssociationId",
        option_to_yojson file_system_association_id_to_yojson x.file_system_association_id );
      ( "FileSystemAssociationARN",
        option_to_yojson file_system_association_ar_n_to_yojson x.file_system_association_ar_n );
      ( "FileSystemAssociationStatus",
        option_to_yojson file_system_association_status_to_yojson x.file_system_association_status
      );
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
    ]

let file_system_association_summary_list_to_yojson tree =
  list_to_yojson file_system_association_summary_to_yojson tree

let folder_to_yojson = string_to_yojson
let folder_list_to_yojson tree = list_to_yojson folder_to_yojson tree
let gateway_operational_state_to_yojson = string_to_yojson

let gateway_info_to_yojson (x : gateway_info) =
  assoc_to_yojson
    [
      ("GatewayId", option_to_yojson gateway_id_to_yojson x.gateway_id);
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
      ("GatewayType", option_to_yojson gateway_type_to_yojson x.gateway_type);
      ( "GatewayOperationalState",
        option_to_yojson gateway_operational_state_to_yojson x.gateway_operational_state );
      ("GatewayName", option_to_yojson string__to_yojson x.gateway_name);
      ("Ec2InstanceId", option_to_yojson ec2_instance_id_to_yojson x.ec2_instance_id);
      ("Ec2InstanceRegion", option_to_yojson ec2_instance_region_to_yojson x.ec2_instance_region);
      ("HostEnvironment", option_to_yojson host_environment_to_yojson x.host_environment);
      ("HostEnvironmentId", option_to_yojson host_environment_id_to_yojson x.host_environment_id);
      ("DeprecationDate", option_to_yojson deprecation_date_to_yojson x.deprecation_date);
      ("SoftwareVersion", option_to_yojson software_version_to_yojson x.software_version);
    ]

let gateways_to_yojson tree = list_to_yojson gateway_info_to_yojson tree
let host_to_yojson = string_to_yojson
let hosts_to_yojson tree = list_to_yojson host_to_yojson tree
let initiator_to_yojson = string_to_yojson
let initiators_to_yojson tree = list_to_yojson initiator_to_yojson tree

let join_domain_output_to_yojson (x : join_domain_output) =
  assoc_to_yojson
    [
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
      ( "ActiveDirectoryStatus",
        option_to_yojson active_directory_status_to_yojson x.active_directory_status );
    ]

let timeout_in_seconds_to_yojson = int_to_yojson
let organizational_unit_to_yojson = string_to_yojson

let join_domain_input_to_yojson (x : join_domain_input) =
  assoc_to_yojson
    [
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
      ("OrganizationalUnit", option_to_yojson organizational_unit_to_yojson x.organizational_unit);
      ("DomainControllers", option_to_yojson hosts_to_yojson x.domain_controllers);
      ("TimeoutInSeconds", option_to_yojson timeout_in_seconds_to_yojson x.timeout_in_seconds);
      ("UserName", Some (domain_user_name_to_yojson x.user_name));
      ("Password", Some (domain_user_password_to_yojson x.password));
    ]

let list_automatic_tape_creation_policies_output_to_yojson
    (x : list_automatic_tape_creation_policies_output) =
  assoc_to_yojson
    [
      ( "AutomaticTapeCreationPolicyInfos",
        option_to_yojson automatic_tape_creation_policy_infos_to_yojson
          x.automatic_tape_creation_policy_infos );
    ]

let list_automatic_tape_creation_policies_input_to_yojson
    (x : list_automatic_tape_creation_policies_input) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let list_cache_reports_output_to_yojson (x : list_cache_reports_output) =
  assoc_to_yojson
    [
      ("CacheReportList", option_to_yojson cache_report_list_to_yojson x.cache_report_list);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
    ]

let list_cache_reports_input_to_yojson (x : list_cache_reports_input) =
  assoc_to_yojson [ ("Marker", option_to_yojson marker_to_yojson x.marker) ]

let list_file_shares_output_to_yojson (x : list_file_shares_output) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("NextMarker", option_to_yojson marker_to_yojson x.next_marker);
      ("FileShareInfoList", option_to_yojson file_share_info_list_to_yojson x.file_share_info_list);
    ]

let list_file_shares_input_to_yojson (x : list_file_shares_input) =
  assoc_to_yojson
    [
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
      ("Limit", option_to_yojson positive_int_object_to_yojson x.limit);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
    ]

let list_file_system_associations_output_to_yojson (x : list_file_system_associations_output) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("NextMarker", option_to_yojson marker_to_yojson x.next_marker);
      ( "FileSystemAssociationSummaryList",
        option_to_yojson file_system_association_summary_list_to_yojson
          x.file_system_association_summary_list );
    ]

let list_file_system_associations_input_to_yojson (x : list_file_system_associations_input) =
  assoc_to_yojson
    [
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
      ("Limit", option_to_yojson positive_int_object_to_yojson x.limit);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
    ]

let list_gateways_output_to_yojson (x : list_gateways_output) =
  assoc_to_yojson
    [
      ("Gateways", option_to_yojson gateways_to_yojson x.gateways);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
    ]

let list_gateways_input_to_yojson (x : list_gateways_input) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("Limit", option_to_yojson positive_int_object_to_yojson x.limit);
    ]

let list_local_disks_output_to_yojson (x : list_local_disks_output) =
  assoc_to_yojson
    [
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
      ("Disks", option_to_yojson disks_to_yojson x.disks);
    ]

let list_local_disks_input_to_yojson (x : list_local_disks_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let list_tags_for_resource_output_to_yojson (x : list_tags_for_resource_output) =
  assoc_to_yojson
    [
      ("ResourceARN", option_to_yojson resource_ar_n_to_yojson x.resource_ar_n);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let list_tags_for_resource_input_to_yojson (x : list_tags_for_resource_input) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (resource_ar_n_to_yojson x.resource_ar_n));
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("Limit", option_to_yojson positive_int_object_to_yojson x.limit);
    ]

let pool_status_to_yojson (x : pool_status) =
  match x with ACTIVE -> `String "ACTIVE" | DELETED -> `String "DELETED"

let pool_info_to_yojson (x : pool_info) =
  assoc_to_yojson
    [
      ("PoolARN", option_to_yojson pool_ar_n_to_yojson x.pool_ar_n);
      ("PoolName", option_to_yojson pool_name_to_yojson x.pool_name);
      ("StorageClass", option_to_yojson tape_storage_class_to_yojson x.storage_class);
      ("RetentionLockType", option_to_yojson retention_lock_type_to_yojson x.retention_lock_type);
      ( "RetentionLockTimeInDays",
        option_to_yojson retention_lock_time_in_days_to_yojson x.retention_lock_time_in_days );
      ("PoolStatus", option_to_yojson pool_status_to_yojson x.pool_status);
    ]

let pool_infos_to_yojson tree = list_to_yojson pool_info_to_yojson tree

let list_tape_pools_output_to_yojson (x : list_tape_pools_output) =
  assoc_to_yojson
    [
      ("PoolInfos", option_to_yojson pool_infos_to_yojson x.pool_infos);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
    ]

let pool_ar_ns_to_yojson tree = list_to_yojson pool_ar_n_to_yojson tree

let list_tape_pools_input_to_yojson (x : list_tape_pools_input) =
  assoc_to_yojson
    [
      ("PoolARNs", option_to_yojson pool_ar_ns_to_yojson x.pool_ar_ns);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("Limit", option_to_yojson positive_int_object_to_yojson x.limit);
    ]

let tape_info_to_yojson (x : tape_info) =
  assoc_to_yojson
    [
      ("TapeARN", option_to_yojson tape_ar_n_to_yojson x.tape_ar_n);
      ("TapeBarcode", option_to_yojson tape_barcode_to_yojson x.tape_barcode);
      ("TapeSizeInBytes", option_to_yojson tape_size_to_yojson x.tape_size_in_bytes);
      ("TapeStatus", option_to_yojson tape_status_to_yojson x.tape_status);
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
      ("PoolId", option_to_yojson pool_id_to_yojson x.pool_id);
      ("RetentionStartDate", option_to_yojson time_to_yojson x.retention_start_date);
      ("PoolEntryDate", option_to_yojson time_to_yojson x.pool_entry_date);
    ]

let tape_infos_to_yojson tree = list_to_yojson tape_info_to_yojson tree

let list_tapes_output_to_yojson (x : list_tapes_output) =
  assoc_to_yojson
    [
      ("TapeInfos", option_to_yojson tape_infos_to_yojson x.tape_infos);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
    ]

let list_tapes_input_to_yojson (x : list_tapes_input) =
  assoc_to_yojson
    [
      ("TapeARNs", option_to_yojson tape_ar_ns_to_yojson x.tape_ar_ns);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("Limit", option_to_yojson positive_int_object_to_yojson x.limit);
    ]

let list_volume_initiators_output_to_yojson (x : list_volume_initiators_output) =
  assoc_to_yojson [ ("Initiators", option_to_yojson initiators_to_yojson x.initiators) ]

let list_volume_initiators_input_to_yojson (x : list_volume_initiators_input) =
  assoc_to_yojson [ ("VolumeARN", Some (volume_ar_n_to_yojson x.volume_ar_n)) ]

let volume_recovery_point_info_to_yojson (x : volume_recovery_point_info) =
  assoc_to_yojson
    [
      ("VolumeARN", option_to_yojson volume_ar_n_to_yojson x.volume_ar_n);
      ("VolumeSizeInBytes", option_to_yojson long_to_yojson x.volume_size_in_bytes);
      ("VolumeUsageInBytes", option_to_yojson long_to_yojson x.volume_usage_in_bytes);
      ("VolumeRecoveryPointTime", option_to_yojson string__to_yojson x.volume_recovery_point_time);
    ]

let volume_recovery_point_infos_to_yojson tree =
  list_to_yojson volume_recovery_point_info_to_yojson tree

let list_volume_recovery_points_output_to_yojson (x : list_volume_recovery_points_output) =
  assoc_to_yojson
    [
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
      ( "VolumeRecoveryPointInfos",
        option_to_yojson volume_recovery_point_infos_to_yojson x.volume_recovery_point_infos );
    ]

let list_volume_recovery_points_input_to_yojson (x : list_volume_recovery_points_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let volume_info_to_yojson (x : volume_info) =
  assoc_to_yojson
    [
      ("VolumeARN", option_to_yojson volume_ar_n_to_yojson x.volume_ar_n);
      ("VolumeId", option_to_yojson volume_id_to_yojson x.volume_id);
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
      ("GatewayId", option_to_yojson gateway_id_to_yojson x.gateway_id);
      ("VolumeType", option_to_yojson volume_type_to_yojson x.volume_type);
      ("VolumeSizeInBytes", option_to_yojson long_to_yojson x.volume_size_in_bytes);
      ( "VolumeAttachmentStatus",
        option_to_yojson volume_attachment_status_to_yojson x.volume_attachment_status );
    ]

let volume_infos_to_yojson tree = list_to_yojson volume_info_to_yojson tree

let list_volumes_output_to_yojson (x : list_volumes_output) =
  assoc_to_yojson
    [
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("VolumeInfos", option_to_yojson volume_infos_to_yojson x.volume_infos);
    ]

let list_volumes_input_to_yojson (x : list_volumes_input) =
  assoc_to_yojson
    [
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("Limit", option_to_yojson positive_int_object_to_yojson x.limit);
    ]

let local_console_password_to_yojson = string_to_yojson
let notification_id_to_yojson = string_to_yojson

let notify_when_uploaded_output_to_yojson (x : notify_when_uploaded_output) =
  assoc_to_yojson
    [
      ("FileShareARN", option_to_yojson file_share_ar_n_to_yojson x.file_share_ar_n);
      ("NotificationId", option_to_yojson notification_id_to_yojson x.notification_id);
    ]

let notify_when_uploaded_input_to_yojson (x : notify_when_uploaded_input) =
  assoc_to_yojson [ ("FileShareARN", Some (file_share_ar_n_to_yojson x.file_share_ar_n)) ]

let refresh_cache_output_to_yojson (x : refresh_cache_output) =
  assoc_to_yojson
    [
      ("FileShareARN", option_to_yojson file_share_ar_n_to_yojson x.file_share_ar_n);
      ("NotificationId", option_to_yojson notification_id_to_yojson x.notification_id);
    ]

let refresh_cache_input_to_yojson (x : refresh_cache_input) =
  assoc_to_yojson
    [
      ("FileShareARN", Some (file_share_ar_n_to_yojson x.file_share_ar_n));
      ("FolderList", option_to_yojson folder_list_to_yojson x.folder_list);
      ("Recursive", option_to_yojson boolean__to_yojson x.recursive);
    ]

let remove_tags_from_resource_output_to_yojson (x : remove_tags_from_resource_output) =
  assoc_to_yojson [ ("ResourceARN", option_to_yojson resource_ar_n_to_yojson x.resource_ar_n) ]

let tag_keys_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let remove_tags_from_resource_input_to_yojson (x : remove_tags_from_resource_input) =
  assoc_to_yojson
    [
      ("ResourceARN", Some (resource_ar_n_to_yojson x.resource_ar_n));
      ("TagKeys", Some (tag_keys_to_yojson x.tag_keys));
    ]

let reset_cache_output_to_yojson (x : reset_cache_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let reset_cache_input_to_yojson (x : reset_cache_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let retrieve_tape_archive_output_to_yojson (x : retrieve_tape_archive_output) =
  assoc_to_yojson [ ("TapeARN", option_to_yojson tape_ar_n_to_yojson x.tape_ar_n) ]

let retrieve_tape_archive_input_to_yojson (x : retrieve_tape_archive_input) =
  assoc_to_yojson
    [
      ("TapeARN", Some (tape_ar_n_to_yojson x.tape_ar_n));
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
    ]

let retrieve_tape_recovery_point_output_to_yojson (x : retrieve_tape_recovery_point_output) =
  assoc_to_yojson [ ("TapeARN", option_to_yojson tape_ar_n_to_yojson x.tape_ar_n) ]

let retrieve_tape_recovery_point_input_to_yojson (x : retrieve_tape_recovery_point_input) =
  assoc_to_yojson
    [
      ("TapeARN", Some (tape_ar_n_to_yojson x.tape_ar_n));
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
    ]

let smb_guest_password_to_yojson = string_to_yojson

let set_local_console_password_output_to_yojson (x : set_local_console_password_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let set_local_console_password_input_to_yojson (x : set_local_console_password_input) =
  assoc_to_yojson
    [
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
      ("LocalConsolePassword", Some (local_console_password_to_yojson x.local_console_password));
    ]

let set_smb_guest_password_output_to_yojson (x : set_smb_guest_password_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let set_smb_guest_password_input_to_yojson (x : set_smb_guest_password_input) =
  assoc_to_yojson
    [
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
      ("Password", Some (smb_guest_password_to_yojson x.password));
    ]

let shutdown_gateway_output_to_yojson (x : shutdown_gateway_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let shutdown_gateway_input_to_yojson (x : shutdown_gateway_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let start_availability_monitor_test_output_to_yojson (x : start_availability_monitor_test_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let start_availability_monitor_test_input_to_yojson (x : start_availability_monitor_test_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let start_cache_report_output_to_yojson (x : start_cache_report_output) =
  assoc_to_yojson
    [ ("CacheReportARN", option_to_yojson cache_report_ar_n_to_yojson x.cache_report_ar_n) ]

let start_cache_report_input_to_yojson (x : start_cache_report_input) =
  assoc_to_yojson
    [
      ("FileShareARN", Some (file_share_ar_n_to_yojson x.file_share_ar_n));
      ("Role", Some (role_to_yojson x.role));
      ("LocationARN", Some (location_ar_n_to_yojson x.location_ar_n));
      ("BucketRegion", Some (region_id_to_yojson x.bucket_region));
      ("VPCEndpointDNSName", option_to_yojson dns_host_name_to_yojson x.vpc_endpoint_dns_name);
      ("InclusionFilters", option_to_yojson cache_report_filter_list_to_yojson x.inclusion_filters);
      ("ExclusionFilters", option_to_yojson cache_report_filter_list_to_yojson x.exclusion_filters);
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let start_gateway_output_to_yojson (x : start_gateway_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let start_gateway_input_to_yojson (x : start_gateway_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let update_vtl_device_type_output_to_yojson (x : update_vtl_device_type_output) =
  assoc_to_yojson [ ("VTLDeviceARN", option_to_yojson vtl_device_ar_n_to_yojson x.vtl_device_ar_n) ]

let update_vtl_device_type_input_to_yojson (x : update_vtl_device_type_input) =
  assoc_to_yojson
    [
      ("VTLDeviceARN", Some (vtl_device_ar_n_to_yojson x.vtl_device_ar_n));
      ("DeviceType", Some (device_type_to_yojson x.device_type));
    ]

let update_snapshot_schedule_output_to_yojson (x : update_snapshot_schedule_output) =
  assoc_to_yojson [ ("VolumeARN", option_to_yojson volume_ar_n_to_yojson x.volume_ar_n) ]

let update_snapshot_schedule_input_to_yojson (x : update_snapshot_schedule_input) =
  assoc_to_yojson
    [
      ("VolumeARN", Some (volume_ar_n_to_yojson x.volume_ar_n));
      ("StartAt", Some (hour_of_day_to_yojson x.start_at));
      ("RecurrenceInHours", Some (recurrence_in_hours_to_yojson x.recurrence_in_hours));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let update_smb_security_strategy_output_to_yojson (x : update_smb_security_strategy_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let update_smb_security_strategy_input_to_yojson (x : update_smb_security_strategy_input) =
  assoc_to_yojson
    [
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
      ("SMBSecurityStrategy", Some (smb_security_strategy_to_yojson x.smb_security_strategy));
    ]

let update_smb_local_groups_output_to_yojson (x : update_smb_local_groups_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let update_smb_local_groups_input_to_yojson (x : update_smb_local_groups_input) =
  assoc_to_yojson
    [
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
      ("SMBLocalGroups", Some (smb_local_groups_to_yojson x.smb_local_groups));
    ]

let update_smb_file_share_visibility_output_to_yojson (x : update_smb_file_share_visibility_output)
    =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let update_smb_file_share_visibility_input_to_yojson (x : update_smb_file_share_visibility_input) =
  assoc_to_yojson
    [
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
      ("FileSharesVisible", Some (boolean__to_yojson x.file_shares_visible));
    ]

let update_smb_file_share_output_to_yojson (x : update_smb_file_share_output) =
  assoc_to_yojson [ ("FileShareARN", option_to_yojson file_share_ar_n_to_yojson x.file_share_ar_n) ]

let update_smb_file_share_input_to_yojson (x : update_smb_file_share_input) =
  assoc_to_yojson
    [
      ("FileShareARN", Some (file_share_ar_n_to_yojson x.file_share_ar_n));
      ("EncryptionType", option_to_yojson encryption_type_to_yojson x.encryption_type);
      ("KMSEncrypted", option_to_yojson boolean__to_yojson x.kms_encrypted);
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("DefaultStorageClass", option_to_yojson storage_class_to_yojson x.default_storage_class);
      ("ObjectACL", option_to_yojson object_ac_l_to_yojson x.object_ac_l);
      ("ReadOnly", option_to_yojson boolean__to_yojson x.read_only);
      ("GuessMIMETypeEnabled", option_to_yojson boolean__to_yojson x.guess_mime_type_enabled);
      ("RequesterPays", option_to_yojson boolean__to_yojson x.requester_pays);
      ("SMBACLEnabled", option_to_yojson boolean__to_yojson x.smbacl_enabled);
      ("AccessBasedEnumeration", option_to_yojson boolean__to_yojson x.access_based_enumeration);
      ("AdminUserList", option_to_yojson user_list_to_yojson x.admin_user_list);
      ("ValidUserList", option_to_yojson user_list_to_yojson x.valid_user_list);
      ("InvalidUserList", option_to_yojson user_list_to_yojson x.invalid_user_list);
      ( "AuditDestinationARN",
        option_to_yojson audit_destination_ar_n_to_yojson x.audit_destination_ar_n );
      ("CaseSensitivity", option_to_yojson case_sensitivity_to_yojson x.case_sensitivity);
      ("FileShareName", option_to_yojson file_share_name_to_yojson x.file_share_name);
      ("CacheAttributes", option_to_yojson cache_attributes_to_yojson x.cache_attributes);
      ("NotificationPolicy", option_to_yojson notification_policy_to_yojson x.notification_policy);
      ("OplocksEnabled", option_to_yojson boolean__to_yojson x.oplocks_enabled);
    ]

let update_nfs_file_share_output_to_yojson (x : update_nfs_file_share_output) =
  assoc_to_yojson [ ("FileShareARN", option_to_yojson file_share_ar_n_to_yojson x.file_share_ar_n) ]

let update_nfs_file_share_input_to_yojson (x : update_nfs_file_share_input) =
  assoc_to_yojson
    [
      ("FileShareARN", Some (file_share_ar_n_to_yojson x.file_share_ar_n));
      ("EncryptionType", option_to_yojson encryption_type_to_yojson x.encryption_type);
      ("KMSEncrypted", option_to_yojson boolean__to_yojson x.kms_encrypted);
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ( "NFSFileShareDefaults",
        option_to_yojson nfs_file_share_defaults_to_yojson x.nfs_file_share_defaults );
      ("DefaultStorageClass", option_to_yojson storage_class_to_yojson x.default_storage_class);
      ("ObjectACL", option_to_yojson object_ac_l_to_yojson x.object_ac_l);
      ("ClientList", option_to_yojson file_share_client_list_to_yojson x.client_list);
      ("Squash", option_to_yojson squash_to_yojson x.squash);
      ("ReadOnly", option_to_yojson boolean__to_yojson x.read_only);
      ("GuessMIMETypeEnabled", option_to_yojson boolean__to_yojson x.guess_mime_type_enabled);
      ("RequesterPays", option_to_yojson boolean__to_yojson x.requester_pays);
      ("FileShareName", option_to_yojson file_share_name_to_yojson x.file_share_name);
      ("CacheAttributes", option_to_yojson cache_attributes_to_yojson x.cache_attributes);
      ("NotificationPolicy", option_to_yojson notification_policy_to_yojson x.notification_policy);
      ( "AuditDestinationARN",
        option_to_yojson audit_destination_ar_n_to_yojson x.audit_destination_ar_n );
    ]

let update_maintenance_start_time_output_to_yojson (x : update_maintenance_start_time_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let update_maintenance_start_time_input_to_yojson (x : update_maintenance_start_time_input) =
  assoc_to_yojson
    [
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
      ("HourOfDay", option_to_yojson hour_of_day_to_yojson x.hour_of_day);
      ("MinuteOfHour", option_to_yojson minute_of_hour_to_yojson x.minute_of_hour);
      ("DayOfWeek", option_to_yojson day_of_week_to_yojson x.day_of_week);
      ("DayOfMonth", option_to_yojson day_of_month_to_yojson x.day_of_month);
      ( "SoftwareUpdatePreferences",
        option_to_yojson software_update_preferences_to_yojson x.software_update_preferences );
    ]

let update_gateway_software_now_output_to_yojson (x : update_gateway_software_now_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let update_gateway_software_now_input_to_yojson (x : update_gateway_software_now_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let update_gateway_information_output_to_yojson (x : update_gateway_information_output) =
  assoc_to_yojson
    [
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
      ("GatewayName", option_to_yojson string__to_yojson x.gateway_name);
    ]

let update_gateway_information_input_to_yojson (x : update_gateway_information_input) =
  assoc_to_yojson
    [
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
      ("GatewayName", option_to_yojson gateway_name_to_yojson x.gateway_name);
      ("GatewayTimezone", option_to_yojson gateway_timezone_to_yojson x.gateway_timezone);
      ( "CloudWatchLogGroupARN",
        option_to_yojson cloud_watch_log_group_ar_n_to_yojson x.cloud_watch_log_group_ar_n );
      ("GatewayCapacity", option_to_yojson gateway_capacity_to_yojson x.gateway_capacity);
    ]

let update_file_system_association_output_to_yojson (x : update_file_system_association_output) =
  assoc_to_yojson
    [
      ( "FileSystemAssociationARN",
        option_to_yojson file_system_association_ar_n_to_yojson x.file_system_association_ar_n );
    ]

let update_file_system_association_input_to_yojson (x : update_file_system_association_input) =
  assoc_to_yojson
    [
      ( "FileSystemAssociationARN",
        Some (file_system_association_ar_n_to_yojson x.file_system_association_ar_n) );
      ("UserName", option_to_yojson domain_user_name_to_yojson x.user_name);
      ("Password", option_to_yojson domain_user_password_to_yojson x.password);
      ( "AuditDestinationARN",
        option_to_yojson audit_destination_ar_n_to_yojson x.audit_destination_ar_n );
      ("CacheAttributes", option_to_yojson cache_attributes_to_yojson x.cache_attributes);
    ]

let update_chap_credentials_output_to_yojson (x : update_chap_credentials_output) =
  assoc_to_yojson
    [
      ("TargetARN", option_to_yojson target_ar_n_to_yojson x.target_ar_n);
      ("InitiatorName", option_to_yojson iqn_name_to_yojson x.initiator_name);
    ]

let update_chap_credentials_input_to_yojson (x : update_chap_credentials_input) =
  assoc_to_yojson
    [
      ("TargetARN", Some (target_ar_n_to_yojson x.target_ar_n));
      ( "SecretToAuthenticateInitiator",
        Some (chap_secret_to_yojson x.secret_to_authenticate_initiator) );
      ("InitiatorName", Some (iqn_name_to_yojson x.initiator_name));
      ( "SecretToAuthenticateTarget",
        option_to_yojson chap_secret_to_yojson x.secret_to_authenticate_target );
    ]

let update_bandwidth_rate_limit_schedule_output_to_yojson
    (x : update_bandwidth_rate_limit_schedule_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let update_bandwidth_rate_limit_schedule_input_to_yojson
    (x : update_bandwidth_rate_limit_schedule_input) =
  assoc_to_yojson
    [
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
      ( "BandwidthRateLimitIntervals",
        Some (bandwidth_rate_limit_intervals_to_yojson x.bandwidth_rate_limit_intervals) );
    ]

let update_bandwidth_rate_limit_output_to_yojson (x : update_bandwidth_rate_limit_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let update_bandwidth_rate_limit_input_to_yojson (x : update_bandwidth_rate_limit_input) =
  assoc_to_yojson
    [
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
      ( "AverageUploadRateLimitInBitsPerSec",
        option_to_yojson bandwidth_upload_rate_limit_to_yojson
          x.average_upload_rate_limit_in_bits_per_sec );
      ( "AverageDownloadRateLimitInBitsPerSec",
        option_to_yojson bandwidth_download_rate_limit_to_yojson
          x.average_download_rate_limit_in_bits_per_sec );
    ]

let update_automatic_tape_creation_policy_output_to_yojson
    (x : update_automatic_tape_creation_policy_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let update_automatic_tape_creation_policy_input_to_yojson
    (x : update_automatic_tape_creation_policy_input) =
  assoc_to_yojson
    [
      ( "AutomaticTapeCreationRules",
        Some (automatic_tape_creation_rules_to_yojson x.automatic_tape_creation_rules) );
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
    ]
