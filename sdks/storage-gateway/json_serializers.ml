open Smaws_Lib.Json.SerializeHelpers
open Types

let string__to_yojson = string_to_yojson
let long_to_yojson = long_to_yojson
let integer_to_yojson = int_to_yojson
let error_details_to_yojson tree = map_to_yojson string__to_yojson string__to_yojson tree
let double_to_yojson = double_to_yojson
let target_ar_n_to_yojson = string_to_yojson
let network_interface_id_to_yojson = string_to_yojson
let positive_int_object_to_yojson = int_to_yojson
let boolean2_to_yojson = bool_to_yojson

let volumei_scsi_attributes_to_yojson (x : volumei_scsi_attributes) =
  assoc_to_yojson
    [
      ("ChapEnabled", option_to_yojson boolean2_to_yojson x.chap_enabled);
      ("LunNumber", option_to_yojson positive_int_object_to_yojson x.lun_number);
      ("NetworkInterfacePort", option_to_yojson integer_to_yojson x.network_interface_port);
      ("NetworkInterfaceId", option_to_yojson network_interface_id_to_yojson x.network_interface_id);
      ("TargetARN", option_to_yojson target_ar_n_to_yojson x.target_ar_n);
    ]

let volume_used_in_bytes_to_yojson = long_to_yojson
let volume_type_to_yojson = string_to_yojson
let volume_status_to_yojson = string_to_yojson
let volume_ar_n_to_yojson = string_to_yojson

let volume_recovery_point_info_to_yojson (x : volume_recovery_point_info) =
  assoc_to_yojson
    [
      ("VolumeRecoveryPointTime", option_to_yojson string__to_yojson x.volume_recovery_point_time);
      ("VolumeUsageInBytes", option_to_yojson long_to_yojson x.volume_usage_in_bytes);
      ("VolumeSizeInBytes", option_to_yojson long_to_yojson x.volume_size_in_bytes);
      ("VolumeARN", option_to_yojson volume_ar_n_to_yojson x.volume_ar_n);
    ]

let volume_recovery_point_infos_to_yojson tree =
  list_to_yojson volume_recovery_point_info_to_yojson tree

let volume_id_to_yojson = string_to_yojson
let gateway_ar_n_to_yojson = string_to_yojson
let gateway_id_to_yojson = string_to_yojson
let volume_attachment_status_to_yojson = string_to_yojson

let volume_info_to_yojson (x : volume_info) =
  assoc_to_yojson
    [
      ( "VolumeAttachmentStatus",
        option_to_yojson volume_attachment_status_to_yojson x.volume_attachment_status );
      ("VolumeSizeInBytes", option_to_yojson long_to_yojson x.volume_size_in_bytes);
      ("VolumeType", option_to_yojson volume_type_to_yojson x.volume_type);
      ("GatewayId", option_to_yojson gateway_id_to_yojson x.gateway_id);
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
      ("VolumeId", option_to_yojson volume_id_to_yojson x.volume_id);
      ("VolumeARN", option_to_yojson volume_ar_n_to_yojson x.volume_ar_n);
    ]

let volume_infos_to_yojson tree = list_to_yojson volume_info_to_yojson tree
let volume_ar_ns_to_yojson tree = list_to_yojson volume_ar_n_to_yojson tree
let vtl_device_ar_n_to_yojson = string_to_yojson
let vtl_device_type_to_yojson = string_to_yojson
let vtl_device_vendor_to_yojson = string_to_yojson
let vtl_device_product_identifier_to_yojson = string_to_yojson

let devicei_scsi_attributes_to_yojson (x : devicei_scsi_attributes) =
  assoc_to_yojson
    [
      ("ChapEnabled", option_to_yojson boolean2_to_yojson x.chap_enabled);
      ("NetworkInterfacePort", option_to_yojson integer_to_yojson x.network_interface_port);
      ("NetworkInterfaceId", option_to_yojson network_interface_id_to_yojson x.network_interface_id);
      ("TargetARN", option_to_yojson target_ar_n_to_yojson x.target_ar_n);
    ]

let vtl_device_to_yojson (x : vtl_device) =
  assoc_to_yojson
    [
      ( "DeviceiSCSIAttributes",
        option_to_yojson devicei_scsi_attributes_to_yojson x.devicei_scsi_attributes );
      ( "VTLDeviceProductIdentifier",
        option_to_yojson vtl_device_product_identifier_to_yojson x.vtl_device_product_identifier );
      ("VTLDeviceVendor", option_to_yojson vtl_device_vendor_to_yojson x.vtl_device_vendor);
      ("VTLDeviceType", option_to_yojson vtl_device_type_to_yojson x.vtl_device_type);
      ("VTLDeviceARN", option_to_yojson vtl_device_ar_n_to_yojson x.vtl_device_ar_n);
    ]

let vtl_devices_to_yojson tree = list_to_yojson vtl_device_to_yojson tree
let vtl_device_ar_ns_to_yojson tree = list_to_yojson vtl_device_ar_n_to_yojson tree
let user_list_user_to_yojson = string_to_yojson
let user_list_to_yojson tree = list_to_yojson user_list_user_to_yojson tree

let update_vtl_device_type_output_to_yojson (x : update_vtl_device_type_output) =
  assoc_to_yojson [ ("VTLDeviceARN", option_to_yojson vtl_device_ar_n_to_yojson x.vtl_device_ar_n) ]

let device_type_to_yojson = string_to_yojson

let update_vtl_device_type_input_to_yojson (x : update_vtl_device_type_input) =
  assoc_to_yojson
    [
      ("DeviceType", Some (device_type_to_yojson x.device_type));
      ("VTLDeviceARN", Some (vtl_device_ar_n_to_yojson x.vtl_device_ar_n));
    ]

let error_code_to_yojson (x : error_code) =
  match x with
  | VolumeNotReady -> `String "VolumeNotReady"
  | VolumeNotFound -> `String "VolumeNotFound"
  | VolumeInUse -> `String "VolumeInUse"
  | VolumeIdInvalid -> `String "VolumeIdInvalid"
  | VolumeAlreadyExists -> `String "VolumeAlreadyExists"
  | UnauthorizedOperation -> `String "UnauthorizedOperation"
  | TargetNotFound -> `String "TargetNotFound"
  | TargetInvalid -> `String "TargetInvalid"
  | TargetAlreadyExists -> `String "TargetAlreadyExists"
  | TapeCartridgeNotFound -> `String "TapeCartridgeNotFound"
  | StorageFailure -> `String "StorageFailure"
  | StagingAreaFull -> `String "StagingAreaFull"
  | SnapshotScheduleNotFound -> `String "SnapshotScheduleNotFound"
  | SnapshotNotFound -> `String "SnapshotNotFound"
  | SnapshotInProgress -> `String "SnapshotInProgress"
  | SnapshotIdInvalid -> `String "SnapshotIdInvalid"
  | SnapshotDeleted -> `String "SnapshotDeleted"
  | ServiceUnavailable -> `String "ServiceUnavailable"
  | RequestTimeout -> `String "RequestTimeout"
  | RegionInvalid -> `String "RegionInvalid"
  | ParametersNotImplemented -> `String "ParametersNotImplemented"
  | OutdatedGateway -> `String "OutdatedGateway"
  | OperationAborted -> `String "OperationAborted"
  | NotSupported -> `String "NotSupported"
  | NotImplemented -> `String "NotImplemented"
  | NoDisksAvailable -> `String "NoDisksAvailable"
  | NetworkConfigurationChanged -> `String "NetworkConfigurationChanged"
  | MaximumVolumeCountExceeded -> `String "MaximumVolumeCountExceeded"
  | MaximumTapeCartridgeCountExceeded -> `String "MaximumTapeCartridgeCountExceeded"
  | MaximumContentLengthExceeded -> `String "MaximumContentLengthExceeded"
  | JoinDomainInProgress -> `String "JoinDomainInProgress"
  | LunInvalid -> `String "LunInvalid"
  | LunAlreadyAllocated_ -> `String "LunAlreadyAllocated "
  | LocalStorageLimitExceeded -> `String "LocalStorageLimitExceeded"
  | InvalidSchedule -> `String "InvalidSchedule"
  | InvalidParameters -> `String "InvalidParameters"
  | InvalidEndpoint -> `String "InvalidEndpoint"
  | InvalidGateway -> `String "InvalidGateway"
  | InternalError -> `String "InternalError"
  | InitiatorNotFound -> `String "InitiatorNotFound"
  | InitiatorInvalid -> `String "InitiatorInvalid"
  | IAMNotSupported -> `String "IAMNotSupported"
  | EndpointNotFound -> `String "EndpointNotFound"
  | DuplicateSchedule -> `String "DuplicateSchedule"
  | DuplicateCertificateInfo -> `String "DuplicateCertificateInfo"
  | DiskSizeNotGigAligned -> `String "DiskSizeNotGigAligned"
  | DiskSizeLessThanVolumeSize -> `String "DiskSizeLessThanVolumeSize"
  | DiskSizeGreaterThanVolumeMaxSize -> `String "DiskSizeGreaterThanVolumeMaxSize"
  | DiskDoesNotExist -> `String "DiskDoesNotExist"
  | DiskAlreadyAllocated -> `String "DiskAlreadyAllocated"
  | ChapCredentialNotFound -> `String "ChapCredentialNotFound"
  | CannotExportSnapshot -> `String "CannotExportSnapshot"
  | Blocked -> `String "Blocked"
  | BandwidthThrottleScheduleNotFound -> `String "BandwidthThrottleScheduleNotFound"
  | AuthenticationFailure -> `String "AuthenticationFailure"
  | GatewayProxyNetworkConnectionBusy -> `String "GatewayProxyNetworkConnectionBusy"
  | GatewayNotFound -> `String "GatewayNotFound"
  | GatewayNotConnected -> `String "GatewayNotConnected"
  | GatewayInternalError -> `String "GatewayInternalError"
  | ActivationKeyNotFound -> `String "ActivationKeyNotFound"
  | ActivationKeyInvalid -> `String "ActivationKeyInvalid"
  | ActivationKeyExpired -> `String "ActivationKeyExpired"

let storage_gateway_error_to_yojson (x : storage_gateway_error) =
  assoc_to_yojson
    [
      ("errorDetails", option_to_yojson error_details_to_yojson x.error_details);
      ("errorCode", option_to_yojson error_code_to_yojson x.error_code);
    ]

let invalid_gateway_request_exception_to_yojson (x : invalid_gateway_request_exception) =
  assoc_to_yojson
    [
      ("error", option_to_yojson storage_gateway_error_to_yojson x.error);
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let internal_server_error_to_yojson (x : internal_server_error) =
  assoc_to_yojson
    [
      ("error", option_to_yojson storage_gateway_error_to_yojson x.error);
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let update_snapshot_schedule_output_to_yojson (x : update_snapshot_schedule_output) =
  assoc_to_yojson [ ("VolumeARN", option_to_yojson volume_ar_n_to_yojson x.volume_ar_n) ]

let hour_of_day_to_yojson = int_to_yojson
let recurrence_in_hours_to_yojson = int_to_yojson
let description_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Value", Some (tag_value_to_yojson x.value)); ("Key", Some (tag_key_to_yojson x.key)) ]

let tags_to_yojson tree = list_to_yojson tag_to_yojson tree

let update_snapshot_schedule_input_to_yojson (x : update_snapshot_schedule_input) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("RecurrenceInHours", Some (recurrence_in_hours_to_yojson x.recurrence_in_hours));
      ("StartAt", Some (hour_of_day_to_yojson x.start_at));
      ("VolumeARN", Some (volume_ar_n_to_yojson x.volume_ar_n));
    ]

let update_smb_security_strategy_output_to_yojson (x : update_smb_security_strategy_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let smb_security_strategy_to_yojson (x : smb_security_strategy) =
  match x with
  | MandatoryEncryptionNoAes128 -> `String "MandatoryEncryptionNoAes128"
  | MandatoryEncryption -> `String "MandatoryEncryption"
  | MandatorySigning -> `String "MandatorySigning"
  | ClientSpecified -> `String "ClientSpecified"

let update_smb_security_strategy_input_to_yojson (x : update_smb_security_strategy_input) =
  assoc_to_yojson
    [
      ("SMBSecurityStrategy", Some (smb_security_strategy_to_yojson x.smb_security_strategy));
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
    ]

let update_smb_local_groups_output_to_yojson (x : update_smb_local_groups_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let smb_local_groups_to_yojson (x : smb_local_groups) =
  assoc_to_yojson [ ("GatewayAdmins", option_to_yojson user_list_to_yojson x.gateway_admins) ]

let update_smb_local_groups_input_to_yojson (x : update_smb_local_groups_input) =
  assoc_to_yojson
    [
      ("SMBLocalGroups", Some (smb_local_groups_to_yojson x.smb_local_groups));
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
    ]

let update_smb_file_share_visibility_output_to_yojson (x : update_smb_file_share_visibility_output)
    =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let boolean__to_yojson = bool_to_yojson

let update_smb_file_share_visibility_input_to_yojson (x : update_smb_file_share_visibility_input) =
  assoc_to_yojson
    [
      ("FileSharesVisible", Some (boolean__to_yojson x.file_shares_visible));
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
    ]

let file_share_ar_n_to_yojson = string_to_yojson

let update_smb_file_share_output_to_yojson (x : update_smb_file_share_output) =
  assoc_to_yojson [ ("FileShareARN", option_to_yojson file_share_ar_n_to_yojson x.file_share_ar_n) ]

let encryption_type_to_yojson (x : encryption_type) =
  match x with
  | DsseKms -> `String "DsseKms"
  | SseKms -> `String "SseKms"
  | SseS3 -> `String "SseS3"

let kms_key_to_yojson = string_to_yojson
let storage_class_to_yojson = string_to_yojson

let object_ac_l_to_yojson (x : object_ac_l) =
  match x with
  | Aws_exec_read -> `String "aws-exec-read"
  | Bucket_owner_full_control -> `String "bucket-owner-full-control"
  | Bucket_owner_read -> `String "bucket-owner-read"
  | Authenticated_read -> `String "authenticated-read"
  | Public_read_write -> `String "public-read-write"
  | Public_read -> `String "public-read"
  | Private -> `String "private"

let audit_destination_ar_n_to_yojson = string_to_yojson

let case_sensitivity_to_yojson (x : case_sensitivity) =
  match x with
  | CaseSensitive -> `String "CaseSensitive"
  | ClientSpecified -> `String "ClientSpecified"

let file_share_name_to_yojson = string_to_yojson
let cache_stale_timeout_in_seconds_to_yojson = int_to_yojson

let cache_attributes_to_yojson (x : cache_attributes) =
  assoc_to_yojson
    [
      ( "CacheStaleTimeoutInSeconds",
        option_to_yojson cache_stale_timeout_in_seconds_to_yojson x.cache_stale_timeout_in_seconds
      );
    ]

let notification_policy_to_yojson = string_to_yojson

let update_smb_file_share_input_to_yojson (x : update_smb_file_share_input) =
  assoc_to_yojson
    [
      ("OplocksEnabled", option_to_yojson boolean__to_yojson x.oplocks_enabled);
      ("NotificationPolicy", option_to_yojson notification_policy_to_yojson x.notification_policy);
      ("CacheAttributes", option_to_yojson cache_attributes_to_yojson x.cache_attributes);
      ("FileShareName", option_to_yojson file_share_name_to_yojson x.file_share_name);
      ("CaseSensitivity", option_to_yojson case_sensitivity_to_yojson x.case_sensitivity);
      ( "AuditDestinationARN",
        option_to_yojson audit_destination_ar_n_to_yojson x.audit_destination_ar_n );
      ("InvalidUserList", option_to_yojson user_list_to_yojson x.invalid_user_list);
      ("ValidUserList", option_to_yojson user_list_to_yojson x.valid_user_list);
      ("AdminUserList", option_to_yojson user_list_to_yojson x.admin_user_list);
      ("AccessBasedEnumeration", option_to_yojson boolean__to_yojson x.access_based_enumeration);
      ("SMBACLEnabled", option_to_yojson boolean__to_yojson x.smbacl_enabled);
      ("RequesterPays", option_to_yojson boolean__to_yojson x.requester_pays);
      ("GuessMIMETypeEnabled", option_to_yojson boolean__to_yojson x.guess_mime_type_enabled);
      ("ReadOnly", option_to_yojson boolean__to_yojson x.read_only);
      ("ObjectACL", option_to_yojson object_ac_l_to_yojson x.object_ac_l);
      ("DefaultStorageClass", option_to_yojson storage_class_to_yojson x.default_storage_class);
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("KMSEncrypted", option_to_yojson boolean__to_yojson x.kms_encrypted);
      ("EncryptionType", option_to_yojson encryption_type_to_yojson x.encryption_type);
      ("FileShareARN", Some (file_share_ar_n_to_yojson x.file_share_ar_n));
    ]

let update_nfs_file_share_output_to_yojson (x : update_nfs_file_share_output) =
  assoc_to_yojson [ ("FileShareARN", option_to_yojson file_share_ar_n_to_yojson x.file_share_ar_n) ]

let permission_mode_to_yojson = string_to_yojson
let permission_id_to_yojson = long_to_yojson

let nfs_file_share_defaults_to_yojson (x : nfs_file_share_defaults) =
  assoc_to_yojson
    [
      ("OwnerId", option_to_yojson permission_id_to_yojson x.owner_id);
      ("GroupId", option_to_yojson permission_id_to_yojson x.group_id);
      ("DirectoryMode", option_to_yojson permission_mode_to_yojson x.directory_mode);
      ("FileMode", option_to_yojson permission_mode_to_yojson x.file_mode);
    ]

let ipv4_or_ipv6_address_cid_r_to_yojson = string_to_yojson
let file_share_client_list_to_yojson tree = list_to_yojson ipv4_or_ipv6_address_cid_r_to_yojson tree
let squash_to_yojson = string_to_yojson

let update_nfs_file_share_input_to_yojson (x : update_nfs_file_share_input) =
  assoc_to_yojson
    [
      ( "AuditDestinationARN",
        option_to_yojson audit_destination_ar_n_to_yojson x.audit_destination_ar_n );
      ("NotificationPolicy", option_to_yojson notification_policy_to_yojson x.notification_policy);
      ("CacheAttributes", option_to_yojson cache_attributes_to_yojson x.cache_attributes);
      ("FileShareName", option_to_yojson file_share_name_to_yojson x.file_share_name);
      ("RequesterPays", option_to_yojson boolean__to_yojson x.requester_pays);
      ("GuessMIMETypeEnabled", option_to_yojson boolean__to_yojson x.guess_mime_type_enabled);
      ("ReadOnly", option_to_yojson boolean__to_yojson x.read_only);
      ("Squash", option_to_yojson squash_to_yojson x.squash);
      ("ClientList", option_to_yojson file_share_client_list_to_yojson x.client_list);
      ("ObjectACL", option_to_yojson object_ac_l_to_yojson x.object_ac_l);
      ("DefaultStorageClass", option_to_yojson storage_class_to_yojson x.default_storage_class);
      ( "NFSFileShareDefaults",
        option_to_yojson nfs_file_share_defaults_to_yojson x.nfs_file_share_defaults );
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("KMSEncrypted", option_to_yojson boolean__to_yojson x.kms_encrypted);
      ("EncryptionType", option_to_yojson encryption_type_to_yojson x.encryption_type);
      ("FileShareARN", Some (file_share_ar_n_to_yojson x.file_share_ar_n));
    ]

let update_maintenance_start_time_output_to_yojson (x : update_maintenance_start_time_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let minute_of_hour_to_yojson = int_to_yojson
let day_of_week_to_yojson = int_to_yojson
let day_of_month_to_yojson = int_to_yojson

let automatic_update_policy_to_yojson (x : automatic_update_policy) =
  match x with
  | EMERGENCY_VERSIONS_ONLY -> `String "EMERGENCY_VERSIONS_ONLY"
  | ALL_VERSIONS -> `String "ALL_VERSIONS"

let software_update_preferences_to_yojson (x : software_update_preferences) =
  assoc_to_yojson
    [
      ( "AutomaticUpdatePolicy",
        option_to_yojson automatic_update_policy_to_yojson x.automatic_update_policy );
    ]

let update_maintenance_start_time_input_to_yojson (x : update_maintenance_start_time_input) =
  assoc_to_yojson
    [
      ( "SoftwareUpdatePreferences",
        option_to_yojson software_update_preferences_to_yojson x.software_update_preferences );
      ("DayOfMonth", option_to_yojson day_of_month_to_yojson x.day_of_month);
      ("DayOfWeek", option_to_yojson day_of_week_to_yojson x.day_of_week);
      ("MinuteOfHour", option_to_yojson minute_of_hour_to_yojson x.minute_of_hour);
      ("HourOfDay", option_to_yojson hour_of_day_to_yojson x.hour_of_day);
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
    ]

let update_gateway_software_now_output_to_yojson (x : update_gateway_software_now_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let update_gateway_software_now_input_to_yojson (x : update_gateway_software_now_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let update_gateway_information_output_to_yojson (x : update_gateway_information_output) =
  assoc_to_yojson
    [
      ("GatewayName", option_to_yojson string__to_yojson x.gateway_name);
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
    ]

let gateway_name_to_yojson = string_to_yojson
let gateway_timezone_to_yojson = string_to_yojson
let cloud_watch_log_group_ar_n_to_yojson = string_to_yojson

let gateway_capacity_to_yojson (x : gateway_capacity) =
  match x with Large -> `String "Large" | Medium -> `String "Medium" | Small -> `String "Small"

let update_gateway_information_input_to_yojson (x : update_gateway_information_input) =
  assoc_to_yojson
    [
      ("GatewayCapacity", option_to_yojson gateway_capacity_to_yojson x.gateway_capacity);
      ( "CloudWatchLogGroupARN",
        option_to_yojson cloud_watch_log_group_ar_n_to_yojson x.cloud_watch_log_group_ar_n );
      ("GatewayTimezone", option_to_yojson gateway_timezone_to_yojson x.gateway_timezone);
      ("GatewayName", option_to_yojson gateway_name_to_yojson x.gateway_name);
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
    ]

let file_system_association_ar_n_to_yojson = string_to_yojson

let update_file_system_association_output_to_yojson (x : update_file_system_association_output) =
  assoc_to_yojson
    [
      ( "FileSystemAssociationARN",
        option_to_yojson file_system_association_ar_n_to_yojson x.file_system_association_ar_n );
    ]

let domain_user_name_to_yojson = string_to_yojson
let domain_user_password_to_yojson = string_to_yojson

let update_file_system_association_input_to_yojson (x : update_file_system_association_input) =
  assoc_to_yojson
    [
      ("CacheAttributes", option_to_yojson cache_attributes_to_yojson x.cache_attributes);
      ( "AuditDestinationARN",
        option_to_yojson audit_destination_ar_n_to_yojson x.audit_destination_ar_n );
      ("Password", option_to_yojson domain_user_password_to_yojson x.password);
      ("UserName", option_to_yojson domain_user_name_to_yojson x.user_name);
      ( "FileSystemAssociationARN",
        Some (file_system_association_ar_n_to_yojson x.file_system_association_ar_n) );
    ]

let iqn_name_to_yojson = string_to_yojson

let update_chap_credentials_output_to_yojson (x : update_chap_credentials_output) =
  assoc_to_yojson
    [
      ("InitiatorName", option_to_yojson iqn_name_to_yojson x.initiator_name);
      ("TargetARN", option_to_yojson target_ar_n_to_yojson x.target_ar_n);
    ]

let chap_secret_to_yojson = string_to_yojson

let update_chap_credentials_input_to_yojson (x : update_chap_credentials_input) =
  assoc_to_yojson
    [
      ( "SecretToAuthenticateTarget",
        option_to_yojson chap_secret_to_yojson x.secret_to_authenticate_target );
      ("InitiatorName", Some (iqn_name_to_yojson x.initiator_name));
      ( "SecretToAuthenticateInitiator",
        Some (chap_secret_to_yojson x.secret_to_authenticate_initiator) );
      ("TargetARN", Some (target_ar_n_to_yojson x.target_ar_n));
    ]

let update_bandwidth_rate_limit_schedule_output_to_yojson
    (x : update_bandwidth_rate_limit_schedule_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let days_of_week_to_yojson tree = list_to_yojson day_of_week_to_yojson tree
let bandwidth_upload_rate_limit_to_yojson = long_to_yojson
let bandwidth_download_rate_limit_to_yojson = long_to_yojson

let bandwidth_rate_limit_interval_to_yojson (x : bandwidth_rate_limit_interval) =
  assoc_to_yojson
    [
      ( "AverageDownloadRateLimitInBitsPerSec",
        option_to_yojson bandwidth_download_rate_limit_to_yojson
          x.average_download_rate_limit_in_bits_per_sec );
      ( "AverageUploadRateLimitInBitsPerSec",
        option_to_yojson bandwidth_upload_rate_limit_to_yojson
          x.average_upload_rate_limit_in_bits_per_sec );
      ("DaysOfWeek", Some (days_of_week_to_yojson x.days_of_week));
      ("EndMinuteOfHour", Some (minute_of_hour_to_yojson x.end_minute_of_hour));
      ("EndHourOfDay", Some (hour_of_day_to_yojson x.end_hour_of_day));
      ("StartMinuteOfHour", Some (minute_of_hour_to_yojson x.start_minute_of_hour));
      ("StartHourOfDay", Some (hour_of_day_to_yojson x.start_hour_of_day));
    ]

let bandwidth_rate_limit_intervals_to_yojson tree =
  list_to_yojson bandwidth_rate_limit_interval_to_yojson tree

let update_bandwidth_rate_limit_schedule_input_to_yojson
    (x : update_bandwidth_rate_limit_schedule_input) =
  assoc_to_yojson
    [
      ( "BandwidthRateLimitIntervals",
        Some (bandwidth_rate_limit_intervals_to_yojson x.bandwidth_rate_limit_intervals) );
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
    ]

let update_bandwidth_rate_limit_output_to_yojson (x : update_bandwidth_rate_limit_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let update_bandwidth_rate_limit_input_to_yojson (x : update_bandwidth_rate_limit_input) =
  assoc_to_yojson
    [
      ( "AverageDownloadRateLimitInBitsPerSec",
        option_to_yojson bandwidth_download_rate_limit_to_yojson
          x.average_download_rate_limit_in_bits_per_sec );
      ( "AverageUploadRateLimitInBitsPerSec",
        option_to_yojson bandwidth_upload_rate_limit_to_yojson
          x.average_upload_rate_limit_in_bits_per_sec );
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
    ]

let update_automatic_tape_creation_policy_output_to_yojson
    (x : update_automatic_tape_creation_policy_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let tape_barcode_prefix_to_yojson = string_to_yojson
let pool_id_to_yojson = string_to_yojson
let tape_size_to_yojson = long_to_yojson
let minimum_num_tapes_to_yojson = int_to_yojson

let automatic_tape_creation_rule_to_yojson (x : automatic_tape_creation_rule) =
  assoc_to_yojson
    [
      ("Worm", option_to_yojson boolean2_to_yojson x.worm);
      ("MinimumNumTapes", Some (minimum_num_tapes_to_yojson x.minimum_num_tapes));
      ("TapeSizeInBytes", Some (tape_size_to_yojson x.tape_size_in_bytes));
      ("PoolId", Some (pool_id_to_yojson x.pool_id));
      ("TapeBarcodePrefix", Some (tape_barcode_prefix_to_yojson x.tape_barcode_prefix));
    ]

let automatic_tape_creation_rules_to_yojson tree =
  list_to_yojson automatic_tape_creation_rule_to_yojson tree

let update_automatic_tape_creation_policy_input_to_yojson
    (x : update_automatic_tape_creation_policy_input) =
  assoc_to_yojson
    [
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
      ( "AutomaticTapeCreationRules",
        Some (automatic_tape_creation_rules_to_yojson x.automatic_tape_creation_rules) );
    ]

let timeout_in_seconds_to_yojson = int_to_yojson
let time_to_yojson = timestamp_epoch_seconds_to_yojson
let target_name_to_yojson = string_to_yojson
let tape_ar_n_to_yojson = string_to_yojson
let tape_barcode_to_yojson = string_to_yojson
let tape_status_to_yojson = string_to_yojson
let double_object_to_yojson = double_to_yojson
let tape_usage_to_yojson = long_to_yojson

let tape_to_yojson (x : tape) =
  assoc_to_yojson
    [
      ("PoolEntryDate", option_to_yojson time_to_yojson x.pool_entry_date);
      ("RetentionStartDate", option_to_yojson time_to_yojson x.retention_start_date);
      ("Worm", option_to_yojson boolean2_to_yojson x.worm);
      ("PoolId", option_to_yojson pool_id_to_yojson x.pool_id);
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("TapeUsedInBytes", option_to_yojson tape_usage_to_yojson x.tape_used_in_bytes);
      ("Progress", option_to_yojson double_object_to_yojson x.progress);
      ("VTLDevice", option_to_yojson vtl_device_ar_n_to_yojson x.vtl_device);
      ("TapeStatus", option_to_yojson tape_status_to_yojson x.tape_status);
      ("TapeSizeInBytes", option_to_yojson tape_size_to_yojson x.tape_size_in_bytes);
      ("TapeCreatedDate", option_to_yojson time_to_yojson x.tape_created_date);
      ("TapeBarcode", option_to_yojson tape_barcode_to_yojson x.tape_barcode);
      ("TapeARN", option_to_yojson tape_ar_n_to_yojson x.tape_ar_n);
    ]

let tapes_to_yojson tree = list_to_yojson tape_to_yojson tree

let tape_storage_class_to_yojson (x : tape_storage_class) =
  match x with GLACIER -> `String "GLACIER" | DEEP_ARCHIVE -> `String "DEEP_ARCHIVE"

let tape_recovery_point_status_to_yojson = string_to_yojson

let tape_recovery_point_info_to_yojson (x : tape_recovery_point_info) =
  assoc_to_yojson
    [
      ("TapeStatus", option_to_yojson tape_recovery_point_status_to_yojson x.tape_status);
      ("TapeSizeInBytes", option_to_yojson tape_size_to_yojson x.tape_size_in_bytes);
      ("TapeRecoveryPointTime", option_to_yojson time_to_yojson x.tape_recovery_point_time);
      ("TapeARN", option_to_yojson tape_ar_n_to_yojson x.tape_ar_n);
    ]

let tape_recovery_point_infos_to_yojson tree =
  list_to_yojson tape_recovery_point_info_to_yojson tree

let tape_info_to_yojson (x : tape_info) =
  assoc_to_yojson
    [
      ("PoolEntryDate", option_to_yojson time_to_yojson x.pool_entry_date);
      ("RetentionStartDate", option_to_yojson time_to_yojson x.retention_start_date);
      ("PoolId", option_to_yojson pool_id_to_yojson x.pool_id);
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
      ("TapeStatus", option_to_yojson tape_status_to_yojson x.tape_status);
      ("TapeSizeInBytes", option_to_yojson tape_size_to_yojson x.tape_size_in_bytes);
      ("TapeBarcode", option_to_yojson tape_barcode_to_yojson x.tape_barcode);
      ("TapeARN", option_to_yojson tape_ar_n_to_yojson x.tape_ar_n);
    ]

let tape_infos_to_yojson tree = list_to_yojson tape_info_to_yojson tree
let tape_drive_type_to_yojson = string_to_yojson
let tape_archive_status_to_yojson = string_to_yojson

let tape_archive_to_yojson (x : tape_archive) =
  assoc_to_yojson
    [
      ("PoolEntryDate", option_to_yojson time_to_yojson x.pool_entry_date);
      ("RetentionStartDate", option_to_yojson time_to_yojson x.retention_start_date);
      ("Worm", option_to_yojson boolean2_to_yojson x.worm);
      ("PoolId", option_to_yojson pool_id_to_yojson x.pool_id);
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("TapeUsedInBytes", option_to_yojson tape_usage_to_yojson x.tape_used_in_bytes);
      ("TapeStatus", option_to_yojson tape_archive_status_to_yojson x.tape_status);
      ("RetrievedTo", option_to_yojson gateway_ar_n_to_yojson x.retrieved_to);
      ("CompletionTime", option_to_yojson time_to_yojson x.completion_time);
      ("TapeSizeInBytes", option_to_yojson tape_size_to_yojson x.tape_size_in_bytes);
      ("TapeCreatedDate", option_to_yojson time_to_yojson x.tape_created_date);
      ("TapeBarcode", option_to_yojson tape_barcode_to_yojson x.tape_barcode);
      ("TapeARN", option_to_yojson tape_ar_n_to_yojson x.tape_ar_n);
    ]

let tape_archives_to_yojson tree = list_to_yojson tape_archive_to_yojson tree
let tape_ar_ns_to_yojson tree = list_to_yojson tape_ar_n_to_yojson tree
let tag_keys_to_yojson tree = list_to_yojson tag_key_to_yojson tree
let supported_gateway_capacities_to_yojson tree = list_to_yojson gateway_capacity_to_yojson tree
let disk_id_to_yojson = string_to_yojson
let snapshot_id_to_yojson = string_to_yojson
let created_date_to_yojson = timestamp_epoch_seconds_to_yojson

let storedi_scsi_volume_to_yojson (x : storedi_scsi_volume) =
  assoc_to_yojson
    [
      ("TargetName", option_to_yojson target_name_to_yojson x.target_name);
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("VolumeUsedInBytes", option_to_yojson volume_used_in_bytes_to_yojson x.volume_used_in_bytes);
      ("CreatedDate", option_to_yojson created_date_to_yojson x.created_date);
      ( "VolumeiSCSIAttributes",
        option_to_yojson volumei_scsi_attributes_to_yojson x.volumei_scsi_attributes );
      ("PreservedExistingData", option_to_yojson boolean2_to_yojson x.preserved_existing_data);
      ("SourceSnapshotId", option_to_yojson snapshot_id_to_yojson x.source_snapshot_id);
      ("VolumeDiskId", option_to_yojson disk_id_to_yojson x.volume_disk_id);
      ("VolumeProgress", option_to_yojson double_object_to_yojson x.volume_progress);
      ("VolumeSizeInBytes", option_to_yojson long_to_yojson x.volume_size_in_bytes);
      ( "VolumeAttachmentStatus",
        option_to_yojson volume_attachment_status_to_yojson x.volume_attachment_status );
      ("VolumeStatus", option_to_yojson volume_status_to_yojson x.volume_status);
      ("VolumeType", option_to_yojson volume_type_to_yojson x.volume_type);
      ("VolumeId", option_to_yojson volume_id_to_yojson x.volume_id);
      ("VolumeARN", option_to_yojson volume_ar_n_to_yojson x.volume_ar_n);
    ]

let storedi_scsi_volumes_to_yojson tree = list_to_yojson storedi_scsi_volume_to_yojson tree

let start_gateway_output_to_yojson (x : start_gateway_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let start_gateway_input_to_yojson (x : start_gateway_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let cache_report_ar_n_to_yojson = string_to_yojson

let start_cache_report_output_to_yojson (x : start_cache_report_output) =
  assoc_to_yojson
    [ ("CacheReportARN", option_to_yojson cache_report_ar_n_to_yojson x.cache_report_ar_n) ]

let role_to_yojson = string_to_yojson
let location_ar_n_to_yojson = string_to_yojson
let region_id_to_yojson = string_to_yojson
let dns_host_name_to_yojson = string_to_yojson

let cache_report_filter_name_to_yojson (x : cache_report_filter_name) =
  match x with
  | UploadFailureReason -> `String "UploadFailureReason"
  | UploadState -> `String "UploadState"

let cache_report_filter_value_to_yojson = string_to_yojson

let cache_report_filter_values_to_yojson tree =
  list_to_yojson cache_report_filter_value_to_yojson tree

let cache_report_filter_to_yojson (x : cache_report_filter) =
  assoc_to_yojson
    [
      ("Values", Some (cache_report_filter_values_to_yojson x.values));
      ("Name", Some (cache_report_filter_name_to_yojson x.name));
    ]

let cache_report_filter_list_to_yojson tree = list_to_yojson cache_report_filter_to_yojson tree
let client_token_to_yojson = string_to_yojson

let start_cache_report_input_to_yojson (x : start_cache_report_input) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("ExclusionFilters", option_to_yojson cache_report_filter_list_to_yojson x.exclusion_filters);
      ("InclusionFilters", option_to_yojson cache_report_filter_list_to_yojson x.inclusion_filters);
      ("VPCEndpointDNSName", option_to_yojson dns_host_name_to_yojson x.vpc_endpoint_dns_name);
      ("BucketRegion", Some (region_id_to_yojson x.bucket_region));
      ("LocationARN", Some (location_ar_n_to_yojson x.location_ar_n));
      ("Role", Some (role_to_yojson x.role));
      ("FileShareARN", Some (file_share_ar_n_to_yojson x.file_share_ar_n));
    ]

let start_availability_monitor_test_output_to_yojson (x : start_availability_monitor_test_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let start_availability_monitor_test_input_to_yojson (x : start_availability_monitor_test_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let shutdown_gateway_output_to_yojson (x : shutdown_gateway_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let shutdown_gateway_input_to_yojson (x : shutdown_gateway_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let set_smb_guest_password_output_to_yojson (x : set_smb_guest_password_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let smb_guest_password_to_yojson = string_to_yojson

let set_smb_guest_password_input_to_yojson (x : set_smb_guest_password_input) =
  assoc_to_yojson
    [
      ("Password", Some (smb_guest_password_to_yojson x.password));
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
    ]

let set_local_console_password_output_to_yojson (x : set_local_console_password_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let local_console_password_to_yojson = string_to_yojson

let set_local_console_password_input_to_yojson (x : set_local_console_password_input) =
  assoc_to_yojson
    [
      ("LocalConsolePassword", Some (local_console_password_to_yojson x.local_console_password));
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
    ]

let retrieve_tape_recovery_point_output_to_yojson (x : retrieve_tape_recovery_point_output) =
  assoc_to_yojson [ ("TapeARN", option_to_yojson tape_ar_n_to_yojson x.tape_ar_n) ]

let retrieve_tape_recovery_point_input_to_yojson (x : retrieve_tape_recovery_point_input) =
  assoc_to_yojson
    [
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
      ("TapeARN", Some (tape_ar_n_to_yojson x.tape_ar_n));
    ]

let retrieve_tape_archive_output_to_yojson (x : retrieve_tape_archive_output) =
  assoc_to_yojson [ ("TapeARN", option_to_yojson tape_ar_n_to_yojson x.tape_ar_n) ]

let retrieve_tape_archive_input_to_yojson (x : retrieve_tape_archive_input) =
  assoc_to_yojson
    [
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
      ("TapeARN", Some (tape_ar_n_to_yojson x.tape_ar_n));
    ]

let reset_cache_output_to_yojson (x : reset_cache_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let reset_cache_input_to_yojson (x : reset_cache_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let resource_ar_n_to_yojson = string_to_yojson

let remove_tags_from_resource_output_to_yojson (x : remove_tags_from_resource_output) =
  assoc_to_yojson [ ("ResourceARN", option_to_yojson resource_ar_n_to_yojson x.resource_ar_n) ]

let remove_tags_from_resource_input_to_yojson (x : remove_tags_from_resource_input) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_keys_to_yojson x.tag_keys));
      ("ResourceARN", Some (resource_ar_n_to_yojson x.resource_ar_n));
    ]

let notification_id_to_yojson = string_to_yojson

let refresh_cache_output_to_yojson (x : refresh_cache_output) =
  assoc_to_yojson
    [
      ("NotificationId", option_to_yojson notification_id_to_yojson x.notification_id);
      ("FileShareARN", option_to_yojson file_share_ar_n_to_yojson x.file_share_ar_n);
    ]

let folder_to_yojson = string_to_yojson
let folder_list_to_yojson tree = list_to_yojson folder_to_yojson tree

let refresh_cache_input_to_yojson (x : refresh_cache_input) =
  assoc_to_yojson
    [
      ("Recursive", option_to_yojson boolean__to_yojson x.recursive);
      ("FolderList", option_to_yojson folder_list_to_yojson x.folder_list);
      ("FileShareARN", Some (file_share_ar_n_to_yojson x.file_share_ar_n));
    ]

let notify_when_uploaded_output_to_yojson (x : notify_when_uploaded_output) =
  assoc_to_yojson
    [
      ("NotificationId", option_to_yojson notification_id_to_yojson x.notification_id);
      ("FileShareARN", option_to_yojson file_share_ar_n_to_yojson x.file_share_ar_n);
    ]

let notify_when_uploaded_input_to_yojson (x : notify_when_uploaded_input) =
  assoc_to_yojson [ ("FileShareARN", Some (file_share_ar_n_to_yojson x.file_share_ar_n)) ]

let marker_to_yojson = string_to_yojson

let list_volumes_output_to_yojson (x : list_volumes_output) =
  assoc_to_yojson
    [
      ("VolumeInfos", option_to_yojson volume_infos_to_yojson x.volume_infos);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
    ]

let list_volumes_input_to_yojson (x : list_volumes_input) =
  assoc_to_yojson
    [
      ("Limit", option_to_yojson positive_int_object_to_yojson x.limit);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
    ]

let list_volume_recovery_points_output_to_yojson (x : list_volume_recovery_points_output) =
  assoc_to_yojson
    [
      ( "VolumeRecoveryPointInfos",
        option_to_yojson volume_recovery_point_infos_to_yojson x.volume_recovery_point_infos );
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
    ]

let list_volume_recovery_points_input_to_yojson (x : list_volume_recovery_points_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let initiator_to_yojson = string_to_yojson
let initiators_to_yojson tree = list_to_yojson initiator_to_yojson tree

let list_volume_initiators_output_to_yojson (x : list_volume_initiators_output) =
  assoc_to_yojson [ ("Initiators", option_to_yojson initiators_to_yojson x.initiators) ]

let list_volume_initiators_input_to_yojson (x : list_volume_initiators_input) =
  assoc_to_yojson [ ("VolumeARN", Some (volume_ar_n_to_yojson x.volume_ar_n)) ]

let list_tapes_output_to_yojson (x : list_tapes_output) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("TapeInfos", option_to_yojson tape_infos_to_yojson x.tape_infos);
    ]

let list_tapes_input_to_yojson (x : list_tapes_input) =
  assoc_to_yojson
    [
      ("Limit", option_to_yojson positive_int_object_to_yojson x.limit);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("TapeARNs", option_to_yojson tape_ar_ns_to_yojson x.tape_ar_ns);
    ]

let pool_ar_n_to_yojson = string_to_yojson
let pool_name_to_yojson = string_to_yojson

let retention_lock_type_to_yojson (x : retention_lock_type) =
  match x with
  | NONE -> `String "NONE"
  | GOVERNANCE -> `String "GOVERNANCE"
  | COMPLIANCE -> `String "COMPLIANCE"

let retention_lock_time_in_days_to_yojson = int_to_yojson

let pool_status_to_yojson (x : pool_status) =
  match x with DELETED -> `String "DELETED" | ACTIVE -> `String "ACTIVE"

let pool_info_to_yojson (x : pool_info) =
  assoc_to_yojson
    [
      ("PoolStatus", option_to_yojson pool_status_to_yojson x.pool_status);
      ( "RetentionLockTimeInDays",
        option_to_yojson retention_lock_time_in_days_to_yojson x.retention_lock_time_in_days );
      ("RetentionLockType", option_to_yojson retention_lock_type_to_yojson x.retention_lock_type);
      ("StorageClass", option_to_yojson tape_storage_class_to_yojson x.storage_class);
      ("PoolName", option_to_yojson pool_name_to_yojson x.pool_name);
      ("PoolARN", option_to_yojson pool_ar_n_to_yojson x.pool_ar_n);
    ]

let pool_infos_to_yojson tree = list_to_yojson pool_info_to_yojson tree

let list_tape_pools_output_to_yojson (x : list_tape_pools_output) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("PoolInfos", option_to_yojson pool_infos_to_yojson x.pool_infos);
    ]

let pool_ar_ns_to_yojson tree = list_to_yojson pool_ar_n_to_yojson tree

let list_tape_pools_input_to_yojson (x : list_tape_pools_input) =
  assoc_to_yojson
    [
      ("Limit", option_to_yojson positive_int_object_to_yojson x.limit);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("PoolARNs", option_to_yojson pool_ar_ns_to_yojson x.pool_ar_ns);
    ]

let list_tags_for_resource_output_to_yojson (x : list_tags_for_resource_output) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("ResourceARN", option_to_yojson resource_ar_n_to_yojson x.resource_ar_n);
    ]

let list_tags_for_resource_input_to_yojson (x : list_tags_for_resource_input) =
  assoc_to_yojson
    [
      ("Limit", option_to_yojson positive_int_object_to_yojson x.limit);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("ResourceARN", Some (resource_ar_n_to_yojson x.resource_ar_n));
    ]

let disk_allocation_type_to_yojson = string_to_yojson
let disk_attribute_to_yojson = string_to_yojson
let disk_attribute_list_to_yojson tree = list_to_yojson disk_attribute_to_yojson tree

let disk_to_yojson (x : disk) =
  assoc_to_yojson
    [
      ("DiskAttributeList", option_to_yojson disk_attribute_list_to_yojson x.disk_attribute_list);
      ("DiskAllocationResource", option_to_yojson string__to_yojson x.disk_allocation_resource);
      ("DiskAllocationType", option_to_yojson disk_allocation_type_to_yojson x.disk_allocation_type);
      ("DiskSizeInBytes", option_to_yojson long_to_yojson x.disk_size_in_bytes);
      ("DiskStatus", option_to_yojson string__to_yojson x.disk_status);
      ("DiskNode", option_to_yojson string__to_yojson x.disk_node);
      ("DiskPath", option_to_yojson string__to_yojson x.disk_path);
      ("DiskId", option_to_yojson disk_id_to_yojson x.disk_id);
    ]

let disks_to_yojson tree = list_to_yojson disk_to_yojson tree

let list_local_disks_output_to_yojson (x : list_local_disks_output) =
  assoc_to_yojson
    [
      ("Disks", option_to_yojson disks_to_yojson x.disks);
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
    ]

let list_local_disks_input_to_yojson (x : list_local_disks_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let gateway_type_to_yojson = string_to_yojson
let gateway_operational_state_to_yojson = string_to_yojson
let ec2_instance_id_to_yojson = string_to_yojson
let ec2_instance_region_to_yojson = string_to_yojson

let host_environment_to_yojson (x : host_environment) =
  match x with
  | SNOWBALL -> `String "SNOWBALL"
  | OTHER -> `String "OTHER"
  | KVM -> `String "KVM"
  | EC2 -> `String "EC2"
  | HYPER_V -> `String "HYPER-V"
  | VMWARE -> `String "VMWARE"

let host_environment_id_to_yojson = string_to_yojson
let deprecation_date_to_yojson = string_to_yojson
let software_version_to_yojson = string_to_yojson

let gateway_info_to_yojson (x : gateway_info) =
  assoc_to_yojson
    [
      ("SoftwareVersion", option_to_yojson software_version_to_yojson x.software_version);
      ("DeprecationDate", option_to_yojson deprecation_date_to_yojson x.deprecation_date);
      ("HostEnvironmentId", option_to_yojson host_environment_id_to_yojson x.host_environment_id);
      ("HostEnvironment", option_to_yojson host_environment_to_yojson x.host_environment);
      ("Ec2InstanceRegion", option_to_yojson ec2_instance_region_to_yojson x.ec2_instance_region);
      ("Ec2InstanceId", option_to_yojson ec2_instance_id_to_yojson x.ec2_instance_id);
      ("GatewayName", option_to_yojson string__to_yojson x.gateway_name);
      ( "GatewayOperationalState",
        option_to_yojson gateway_operational_state_to_yojson x.gateway_operational_state );
      ("GatewayType", option_to_yojson gateway_type_to_yojson x.gateway_type);
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
      ("GatewayId", option_to_yojson gateway_id_to_yojson x.gateway_id);
    ]

let gateways_to_yojson tree = list_to_yojson gateway_info_to_yojson tree

let list_gateways_output_to_yojson (x : list_gateways_output) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("Gateways", option_to_yojson gateways_to_yojson x.gateways);
    ]

let list_gateways_input_to_yojson (x : list_gateways_input) =
  assoc_to_yojson
    [
      ("Limit", option_to_yojson positive_int_object_to_yojson x.limit);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
    ]

let file_system_association_id_to_yojson = string_to_yojson
let file_system_association_status_to_yojson = string_to_yojson

let file_system_association_summary_to_yojson (x : file_system_association_summary) =
  assoc_to_yojson
    [
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
      ( "FileSystemAssociationStatus",
        option_to_yojson file_system_association_status_to_yojson x.file_system_association_status
      );
      ( "FileSystemAssociationARN",
        option_to_yojson file_system_association_ar_n_to_yojson x.file_system_association_ar_n );
      ( "FileSystemAssociationId",
        option_to_yojson file_system_association_id_to_yojson x.file_system_association_id );
    ]

let file_system_association_summary_list_to_yojson tree =
  list_to_yojson file_system_association_summary_to_yojson tree

let list_file_system_associations_output_to_yojson (x : list_file_system_associations_output) =
  assoc_to_yojson
    [
      ( "FileSystemAssociationSummaryList",
        option_to_yojson file_system_association_summary_list_to_yojson
          x.file_system_association_summary_list );
      ("NextMarker", option_to_yojson marker_to_yojson x.next_marker);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
    ]

let list_file_system_associations_input_to_yojson (x : list_file_system_associations_input) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("Limit", option_to_yojson positive_int_object_to_yojson x.limit);
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
    ]

let file_share_type_to_yojson (x : file_share_type) =
  match x with SMB -> `String "SMB" | NFS -> `String "NFS"

let file_share_id_to_yojson = string_to_yojson
let file_share_status_to_yojson = string_to_yojson

let file_share_info_to_yojson (x : file_share_info) =
  assoc_to_yojson
    [
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
      ("FileShareStatus", option_to_yojson file_share_status_to_yojson x.file_share_status);
      ("FileShareId", option_to_yojson file_share_id_to_yojson x.file_share_id);
      ("FileShareARN", option_to_yojson file_share_ar_n_to_yojson x.file_share_ar_n);
      ("FileShareType", option_to_yojson file_share_type_to_yojson x.file_share_type);
    ]

let file_share_info_list_to_yojson tree = list_to_yojson file_share_info_to_yojson tree

let list_file_shares_output_to_yojson (x : list_file_shares_output) =
  assoc_to_yojson
    [
      ("FileShareInfoList", option_to_yojson file_share_info_list_to_yojson x.file_share_info_list);
      ("NextMarker", option_to_yojson marker_to_yojson x.next_marker);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
    ]

let list_file_shares_input_to_yojson (x : list_file_shares_input) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("Limit", option_to_yojson positive_int_object_to_yojson x.limit);
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
    ]

let cache_report_status_to_yojson (x : cache_report_status) =
  match x with
  | ERROR -> `String "ERROR"
  | FAILED -> `String "FAILED"
  | CANCELED -> `String "CANCELED"
  | COMPLETED -> `String "COMPLETED"
  | IN_PROGRESS -> `String "IN_PROGRESS"

let report_completion_percent_to_yojson = int_to_yojson
let cache_report_name_to_yojson = string_to_yojson

let cache_report_info_to_yojson (x : cache_report_info) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("ReportName", option_to_yojson cache_report_name_to_yojson x.report_name);
      ("ExclusionFilters", option_to_yojson cache_report_filter_list_to_yojson x.exclusion_filters);
      ("InclusionFilters", option_to_yojson cache_report_filter_list_to_yojson x.inclusion_filters);
      ("StartTime", option_to_yojson time_to_yojson x.start_time);
      ("LocationARN", option_to_yojson location_ar_n_to_yojson x.location_ar_n);
      ("FileShareARN", option_to_yojson file_share_ar_n_to_yojson x.file_share_ar_n);
      ("Role", option_to_yojson role_to_yojson x.role);
      ("EndTime", option_to_yojson time_to_yojson x.end_time);
      ( "ReportCompletionPercent",
        option_to_yojson report_completion_percent_to_yojson x.report_completion_percent );
      ("CacheReportStatus", option_to_yojson cache_report_status_to_yojson x.cache_report_status);
      ("CacheReportARN", option_to_yojson cache_report_ar_n_to_yojson x.cache_report_ar_n);
    ]

let cache_report_list_to_yojson tree = list_to_yojson cache_report_info_to_yojson tree

let list_cache_reports_output_to_yojson (x : list_cache_reports_output) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("CacheReportList", option_to_yojson cache_report_list_to_yojson x.cache_report_list);
    ]

let list_cache_reports_input_to_yojson (x : list_cache_reports_input) =
  assoc_to_yojson [ ("Marker", option_to_yojson marker_to_yojson x.marker) ]

let automatic_tape_creation_policy_info_to_yojson (x : automatic_tape_creation_policy_info) =
  assoc_to_yojson
    [
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
      ( "AutomaticTapeCreationRules",
        option_to_yojson automatic_tape_creation_rules_to_yojson x.automatic_tape_creation_rules );
    ]

let automatic_tape_creation_policy_infos_to_yojson tree =
  list_to_yojson automatic_tape_creation_policy_info_to_yojson tree

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

let active_directory_status_to_yojson (x : active_directory_status) =
  match x with
  | INSUFFICIENT_PERMISSIONS -> `String "INSUFFICIENT_PERMISSIONS"
  | UNKNOWN_ERROR -> `String "UNKNOWN_ERROR"
  | TIMEOUT -> `String "TIMEOUT"
  | NETWORK_ERROR -> `String "NETWORK_ERROR"
  | JOINING -> `String "JOINING"
  | JOINED -> `String "JOINED"
  | DETACHED -> `String "DETACHED"
  | ACCESS_DENIED -> `String "ACCESS_DENIED"

let join_domain_output_to_yojson (x : join_domain_output) =
  assoc_to_yojson
    [
      ( "ActiveDirectoryStatus",
        option_to_yojson active_directory_status_to_yojson x.active_directory_status );
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
    ]

let domain_name_to_yojson = string_to_yojson
let organizational_unit_to_yojson = string_to_yojson
let host_to_yojson = string_to_yojson
let hosts_to_yojson tree = list_to_yojson host_to_yojson tree

let join_domain_input_to_yojson (x : join_domain_input) =
  assoc_to_yojson
    [
      ("Password", Some (domain_user_password_to_yojson x.password));
      ("UserName", Some (domain_user_name_to_yojson x.user_name));
      ("TimeoutInSeconds", option_to_yojson timeout_in_seconds_to_yojson x.timeout_in_seconds);
      ("DomainControllers", option_to_yojson hosts_to_yojson x.domain_controllers);
      ("OrganizationalUnit", option_to_yojson organizational_unit_to_yojson x.organizational_unit);
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
    ]

let evict_files_failing_upload_output_to_yojson (x : evict_files_failing_upload_output) =
  assoc_to_yojson [ ("NotificationId", option_to_yojson string__to_yojson x.notification_id) ]

let evict_files_failing_upload_input_to_yojson (x : evict_files_failing_upload_input) =
  assoc_to_yojson
    [
      ("ForceRemove", option_to_yojson boolean2_to_yojson x.force_remove);
      ("FileShareARN", Some (file_share_ar_n_to_yojson x.file_share_ar_n));
    ]

let disassociate_file_system_output_to_yojson (x : disassociate_file_system_output) =
  assoc_to_yojson
    [
      ( "FileSystemAssociationARN",
        option_to_yojson file_system_association_ar_n_to_yojson x.file_system_association_ar_n );
    ]

let disassociate_file_system_input_to_yojson (x : disassociate_file_system_input) =
  assoc_to_yojson
    [
      ("ForceDelete", option_to_yojson boolean2_to_yojson x.force_delete);
      ( "FileSystemAssociationARN",
        Some (file_system_association_ar_n_to_yojson x.file_system_association_ar_n) );
    ]

let disable_gateway_output_to_yojson (x : disable_gateway_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let disable_gateway_input_to_yojson (x : disable_gateway_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let detach_volume_output_to_yojson (x : detach_volume_output) =
  assoc_to_yojson [ ("VolumeARN", option_to_yojson volume_ar_n_to_yojson x.volume_ar_n) ]

let detach_volume_input_to_yojson (x : detach_volume_input) =
  assoc_to_yojson
    [
      ("ForceDetach", option_to_yojson boolean__to_yojson x.force_detach);
      ("VolumeARN", Some (volume_ar_n_to_yojson x.volume_ar_n));
    ]

let disk_ids_to_yojson tree = list_to_yojson disk_id_to_yojson tree

let describe_working_storage_output_to_yojson (x : describe_working_storage_output) =
  assoc_to_yojson
    [
      ( "WorkingStorageAllocatedInBytes",
        option_to_yojson long_to_yojson x.working_storage_allocated_in_bytes );
      ("WorkingStorageUsedInBytes", option_to_yojson long_to_yojson x.working_storage_used_in_bytes);
      ("DiskIds", option_to_yojson disk_ids_to_yojson x.disk_ids);
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
    ]

let describe_working_storage_input_to_yojson (x : describe_working_storage_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let describe_vtl_devices_output_to_yojson (x : describe_vtl_devices_output) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("VTLDevices", option_to_yojson vtl_devices_to_yojson x.vtl_devices);
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
    ]

let describe_vtl_devices_input_to_yojson (x : describe_vtl_devices_input) =
  assoc_to_yojson
    [
      ("Limit", option_to_yojson positive_int_object_to_yojson x.limit);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("VTLDeviceARNs", option_to_yojson vtl_device_ar_ns_to_yojson x.vtl_device_ar_ns);
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
    ]

let describe_upload_buffer_output_to_yojson (x : describe_upload_buffer_output) =
  assoc_to_yojson
    [
      ( "UploadBufferAllocatedInBytes",
        option_to_yojson long_to_yojson x.upload_buffer_allocated_in_bytes );
      ("UploadBufferUsedInBytes", option_to_yojson long_to_yojson x.upload_buffer_used_in_bytes);
      ("DiskIds", option_to_yojson disk_ids_to_yojson x.disk_ids);
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
    ]

let describe_upload_buffer_input_to_yojson (x : describe_upload_buffer_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let describe_tapes_output_to_yojson (x : describe_tapes_output) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("Tapes", option_to_yojson tapes_to_yojson x.tapes);
    ]

let describe_tapes_input_to_yojson (x : describe_tapes_input) =
  assoc_to_yojson
    [
      ("Limit", option_to_yojson positive_int_object_to_yojson x.limit);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("TapeARNs", option_to_yojson tape_ar_ns_to_yojson x.tape_ar_ns);
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
    ]

let describe_tape_recovery_points_output_to_yojson (x : describe_tape_recovery_points_output) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ( "TapeRecoveryPointInfos",
        option_to_yojson tape_recovery_point_infos_to_yojson x.tape_recovery_point_infos );
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
    ]

let describe_tape_recovery_points_input_to_yojson (x : describe_tape_recovery_points_input) =
  assoc_to_yojson
    [
      ("Limit", option_to_yojson positive_int_object_to_yojson x.limit);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
    ]

let describe_tape_archives_output_to_yojson (x : describe_tape_archives_output) =
  assoc_to_yojson
    [
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("TapeArchives", option_to_yojson tape_archives_to_yojson x.tape_archives);
    ]

let describe_tape_archives_input_to_yojson (x : describe_tape_archives_input) =
  assoc_to_yojson
    [
      ("Limit", option_to_yojson positive_int_object_to_yojson x.limit);
      ("Marker", option_to_yojson marker_to_yojson x.marker);
      ("TapeARNs", option_to_yojson tape_ar_ns_to_yojson x.tape_ar_ns);
    ]

let describe_storedi_scsi_volumes_output_to_yojson (x : describe_storedi_scsi_volumes_output) =
  assoc_to_yojson
    [
      ("StorediSCSIVolumes", option_to_yojson storedi_scsi_volumes_to_yojson x.storedi_scsi_volumes);
    ]

let describe_storedi_scsi_volumes_input_to_yojson (x : describe_storedi_scsi_volumes_input) =
  assoc_to_yojson [ ("VolumeARNs", Some (volume_ar_ns_to_yojson x.volume_ar_ns)) ]

let describe_snapshot_schedule_output_to_yojson (x : describe_snapshot_schedule_output) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("Timezone", option_to_yojson gateway_timezone_to_yojson x.timezone);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("RecurrenceInHours", option_to_yojson recurrence_in_hours_to_yojson x.recurrence_in_hours);
      ("StartAt", option_to_yojson hour_of_day_to_yojson x.start_at);
      ("VolumeARN", option_to_yojson volume_ar_n_to_yojson x.volume_ar_n);
    ]

let describe_snapshot_schedule_input_to_yojson (x : describe_snapshot_schedule_input) =
  assoc_to_yojson [ ("VolumeARN", Some (volume_ar_n_to_yojson x.volume_ar_n)) ]

let describe_smb_settings_output_to_yojson (x : describe_smb_settings_output) =
  assoc_to_yojson
    [
      ("SMBLocalGroups", option_to_yojson smb_local_groups_to_yojson x.smb_local_groups);
      ("FileSharesVisible", option_to_yojson boolean__to_yojson x.file_shares_visible);
      ( "SMBSecurityStrategy",
        option_to_yojson smb_security_strategy_to_yojson x.smb_security_strategy );
      ("SMBGuestPasswordSet", option_to_yojson boolean__to_yojson x.smb_guest_password_set);
      ( "ActiveDirectoryStatus",
        option_to_yojson active_directory_status_to_yojson x.active_directory_status );
      ("DomainName", option_to_yojson domain_name_to_yojson x.domain_name);
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
    ]

let describe_smb_settings_input_to_yojson (x : describe_smb_settings_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let path_to_yojson = string_to_yojson
let authentication_to_yojson = string_to_yojson

let smb_file_share_info_to_yojson (x : smb_file_share_info) =
  assoc_to_yojson
    [
      ("OplocksEnabled", option_to_yojson boolean__to_yojson x.oplocks_enabled);
      ("BucketRegion", option_to_yojson region_id_to_yojson x.bucket_region);
      ("VPCEndpointDNSName", option_to_yojson dns_host_name_to_yojson x.vpc_endpoint_dns_name);
      ("NotificationPolicy", option_to_yojson notification_policy_to_yojson x.notification_policy);
      ("CacheAttributes", option_to_yojson cache_attributes_to_yojson x.cache_attributes);
      ("FileShareName", option_to_yojson file_share_name_to_yojson x.file_share_name);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("CaseSensitivity", option_to_yojson case_sensitivity_to_yojson x.case_sensitivity);
      ("Authentication", option_to_yojson authentication_to_yojson x.authentication);
      ( "AuditDestinationARN",
        option_to_yojson audit_destination_ar_n_to_yojson x.audit_destination_ar_n );
      ("InvalidUserList", option_to_yojson user_list_to_yojson x.invalid_user_list);
      ("ValidUserList", option_to_yojson user_list_to_yojson x.valid_user_list);
      ("AdminUserList", option_to_yojson user_list_to_yojson x.admin_user_list);
      ("AccessBasedEnumeration", option_to_yojson boolean__to_yojson x.access_based_enumeration);
      ("SMBACLEnabled", option_to_yojson boolean__to_yojson x.smbacl_enabled);
      ("RequesterPays", option_to_yojson boolean__to_yojson x.requester_pays);
      ("GuessMIMETypeEnabled", option_to_yojson boolean__to_yojson x.guess_mime_type_enabled);
      ("ReadOnly", option_to_yojson boolean__to_yojson x.read_only);
      ("ObjectACL", option_to_yojson object_ac_l_to_yojson x.object_ac_l);
      ("DefaultStorageClass", option_to_yojson storage_class_to_yojson x.default_storage_class);
      ("LocationARN", option_to_yojson location_ar_n_to_yojson x.location_ar_n);
      ("Role", option_to_yojson role_to_yojson x.role);
      ("Path", option_to_yojson path_to_yojson x.path);
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("KMSEncrypted", option_to_yojson boolean2_to_yojson x.kms_encrypted);
      ("EncryptionType", option_to_yojson encryption_type_to_yojson x.encryption_type);
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
      ("FileShareStatus", option_to_yojson file_share_status_to_yojson x.file_share_status);
      ("FileShareId", option_to_yojson file_share_id_to_yojson x.file_share_id);
      ("FileShareARN", option_to_yojson file_share_ar_n_to_yojson x.file_share_ar_n);
    ]

let smb_file_share_info_list_to_yojson tree = list_to_yojson smb_file_share_info_to_yojson tree

let describe_smb_file_shares_output_to_yojson (x : describe_smb_file_shares_output) =
  assoc_to_yojson
    [
      ( "SMBFileShareInfoList",
        option_to_yojson smb_file_share_info_list_to_yojson x.smb_file_share_info_list );
    ]

let file_share_arn_list_to_yojson tree = list_to_yojson file_share_ar_n_to_yojson tree

let describe_smb_file_shares_input_to_yojson (x : describe_smb_file_shares_input) =
  assoc_to_yojson
    [ ("FileShareARNList", Some (file_share_arn_list_to_yojson x.file_share_arn_list)) ]

let nfs_file_share_info_to_yojson (x : nfs_file_share_info) =
  assoc_to_yojson
    [
      ( "AuditDestinationARN",
        option_to_yojson audit_destination_ar_n_to_yojson x.audit_destination_ar_n );
      ("BucketRegion", option_to_yojson region_id_to_yojson x.bucket_region);
      ("VPCEndpointDNSName", option_to_yojson dns_host_name_to_yojson x.vpc_endpoint_dns_name);
      ("NotificationPolicy", option_to_yojson notification_policy_to_yojson x.notification_policy);
      ("CacheAttributes", option_to_yojson cache_attributes_to_yojson x.cache_attributes);
      ("FileShareName", option_to_yojson file_share_name_to_yojson x.file_share_name);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("RequesterPays", option_to_yojson boolean__to_yojson x.requester_pays);
      ("GuessMIMETypeEnabled", option_to_yojson boolean__to_yojson x.guess_mime_type_enabled);
      ("ReadOnly", option_to_yojson boolean__to_yojson x.read_only);
      ("Squash", option_to_yojson squash_to_yojson x.squash);
      ("ClientList", option_to_yojson file_share_client_list_to_yojson x.client_list);
      ("ObjectACL", option_to_yojson object_ac_l_to_yojson x.object_ac_l);
      ("DefaultStorageClass", option_to_yojson storage_class_to_yojson x.default_storage_class);
      ("LocationARN", option_to_yojson location_ar_n_to_yojson x.location_ar_n);
      ("Role", option_to_yojson role_to_yojson x.role);
      ("Path", option_to_yojson path_to_yojson x.path);
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("KMSEncrypted", option_to_yojson boolean2_to_yojson x.kms_encrypted);
      ("EncryptionType", option_to_yojson encryption_type_to_yojson x.encryption_type);
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
      ("FileShareStatus", option_to_yojson file_share_status_to_yojson x.file_share_status);
      ("FileShareId", option_to_yojson file_share_id_to_yojson x.file_share_id);
      ("FileShareARN", option_to_yojson file_share_ar_n_to_yojson x.file_share_ar_n);
      ( "NFSFileShareDefaults",
        option_to_yojson nfs_file_share_defaults_to_yojson x.nfs_file_share_defaults );
    ]

let nfs_file_share_info_list_to_yojson tree = list_to_yojson nfs_file_share_info_to_yojson tree

let describe_nfs_file_shares_output_to_yojson (x : describe_nfs_file_shares_output) =
  assoc_to_yojson
    [
      ( "NFSFileShareInfoList",
        option_to_yojson nfs_file_share_info_list_to_yojson x.nfs_file_share_info_list );
    ]

let describe_nfs_file_shares_input_to_yojson (x : describe_nfs_file_shares_input) =
  assoc_to_yojson
    [ ("FileShareARNList", Some (file_share_arn_list_to_yojson x.file_share_arn_list)) ]

let describe_maintenance_start_time_output_to_yojson (x : describe_maintenance_start_time_output) =
  assoc_to_yojson
    [
      ( "SoftwareUpdatePreferences",
        option_to_yojson software_update_preferences_to_yojson x.software_update_preferences );
      ("Timezone", option_to_yojson gateway_timezone_to_yojson x.timezone);
      ("DayOfMonth", option_to_yojson day_of_month_to_yojson x.day_of_month);
      ("DayOfWeek", option_to_yojson day_of_week_to_yojson x.day_of_week);
      ("MinuteOfHour", option_to_yojson minute_of_hour_to_yojson x.minute_of_hour);
      ("HourOfDay", option_to_yojson hour_of_day_to_yojson x.hour_of_day);
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
    ]

let describe_maintenance_start_time_input_to_yojson (x : describe_maintenance_start_time_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let gateway_state_to_yojson = string_to_yojson

let network_interface_to_yojson (x : network_interface) =
  assoc_to_yojson
    [
      ("Ipv6Address", option_to_yojson string__to_yojson x.ipv6_address);
      ("MacAddress", option_to_yojson string__to_yojson x.mac_address);
      ("Ipv4Address", option_to_yojson string__to_yojson x.ipv4_address);
    ]

let gateway_network_interfaces_to_yojson tree = list_to_yojson network_interface_to_yojson tree
let next_update_availability_date_to_yojson = string_to_yojson
let last_software_update_to_yojson = string_to_yojson
let endpoint_type_to_yojson = string_to_yojson
let software_updates_end_date_to_yojson = string_to_yojson

let describe_gateway_information_output_to_yojson (x : describe_gateway_information_output) =
  assoc_to_yojson
    [
      ("SoftwareVersion", option_to_yojson software_version_to_yojson x.software_version);
      ("HostEnvironmentId", option_to_yojson host_environment_id_to_yojson x.host_environment_id);
      ( "SupportedGatewayCapacities",
        option_to_yojson supported_gateway_capacities_to_yojson x.supported_gateway_capacities );
      ("GatewayCapacity", option_to_yojson gateway_capacity_to_yojson x.gateway_capacity);
      ("DeprecationDate", option_to_yojson deprecation_date_to_yojson x.deprecation_date);
      ( "SoftwareUpdatesEndDate",
        option_to_yojson software_updates_end_date_to_yojson x.software_updates_end_date );
      ("EndpointType", option_to_yojson endpoint_type_to_yojson x.endpoint_type);
      ("HostEnvironment", option_to_yojson host_environment_to_yojson x.host_environment);
      ( "CloudWatchLogGroupARN",
        option_to_yojson cloud_watch_log_group_ar_n_to_yojson x.cloud_watch_log_group_ar_n );
      ("VPCEndpoint", option_to_yojson string__to_yojson x.vpc_endpoint);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("Ec2InstanceRegion", option_to_yojson ec2_instance_region_to_yojson x.ec2_instance_region);
      ("Ec2InstanceId", option_to_yojson ec2_instance_id_to_yojson x.ec2_instance_id);
      ("LastSoftwareUpdate", option_to_yojson last_software_update_to_yojson x.last_software_update);
      ( "NextUpdateAvailabilityDate",
        option_to_yojson next_update_availability_date_to_yojson x.next_update_availability_date );
      ("GatewayType", option_to_yojson gateway_type_to_yojson x.gateway_type);
      ( "GatewayNetworkInterfaces",
        option_to_yojson gateway_network_interfaces_to_yojson x.gateway_network_interfaces );
      ("GatewayState", option_to_yojson gateway_state_to_yojson x.gateway_state);
      ("GatewayTimezone", option_to_yojson gateway_timezone_to_yojson x.gateway_timezone);
      ("GatewayName", option_to_yojson string__to_yojson x.gateway_name);
      ("GatewayId", option_to_yojson gateway_id_to_yojson x.gateway_id);
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
    ]

let describe_gateway_information_input_to_yojson (x : describe_gateway_information_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let file_system_location_ar_n_to_yojson = string_to_yojson
let ipv4_address_to_yojson = string_to_yojson
let ip_address_list_to_yojson tree = list_to_yojson ipv4_address_to_yojson tree

let endpoint_network_configuration_to_yojson (x : endpoint_network_configuration) =
  assoc_to_yojson [ ("IpAddresses", option_to_yojson ip_address_list_to_yojson x.ip_addresses) ]

let file_system_association_sync_error_code_to_yojson = string_to_yojson

let file_system_association_status_detail_to_yojson (x : file_system_association_status_detail) =
  assoc_to_yojson
    [
      ("ErrorCode", option_to_yojson file_system_association_sync_error_code_to_yojson x.error_code);
    ]

let file_system_association_status_details_to_yojson tree =
  list_to_yojson file_system_association_status_detail_to_yojson tree

let file_system_association_info_to_yojson (x : file_system_association_info) =
  assoc_to_yojson
    [
      ( "FileSystemAssociationStatusDetails",
        option_to_yojson file_system_association_status_details_to_yojson
          x.file_system_association_status_details );
      ( "EndpointNetworkConfiguration",
        option_to_yojson endpoint_network_configuration_to_yojson x.endpoint_network_configuration
      );
      ("CacheAttributes", option_to_yojson cache_attributes_to_yojson x.cache_attributes);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
      ( "AuditDestinationARN",
        option_to_yojson audit_destination_ar_n_to_yojson x.audit_destination_ar_n );
      ( "FileSystemAssociationStatus",
        option_to_yojson file_system_association_status_to_yojson x.file_system_association_status
      );
      ("LocationARN", option_to_yojson file_system_location_ar_n_to_yojson x.location_ar_n);
      ( "FileSystemAssociationARN",
        option_to_yojson file_system_association_ar_n_to_yojson x.file_system_association_ar_n );
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

let chap_info_to_yojson (x : chap_info) =
  assoc_to_yojson
    [
      ( "SecretToAuthenticateTarget",
        option_to_yojson chap_secret_to_yojson x.secret_to_authenticate_target );
      ("InitiatorName", option_to_yojson iqn_name_to_yojson x.initiator_name);
      ( "SecretToAuthenticateInitiator",
        option_to_yojson chap_secret_to_yojson x.secret_to_authenticate_initiator );
      ("TargetARN", option_to_yojson target_ar_n_to_yojson x.target_ar_n);
    ]

let chap_credentials_to_yojson tree = list_to_yojson chap_info_to_yojson tree

let describe_chap_credentials_output_to_yojson (x : describe_chap_credentials_output) =
  assoc_to_yojson
    [ ("ChapCredentials", option_to_yojson chap_credentials_to_yojson x.chap_credentials) ]

let describe_chap_credentials_input_to_yojson (x : describe_chap_credentials_input) =
  assoc_to_yojson [ ("TargetARN", Some (target_ar_n_to_yojson x.target_ar_n)) ]

let describe_cache_report_output_to_yojson (x : describe_cache_report_output) =
  assoc_to_yojson
    [ ("CacheReportInfo", option_to_yojson cache_report_info_to_yojson x.cache_report_info) ]

let describe_cache_report_input_to_yojson (x : describe_cache_report_input) =
  assoc_to_yojson [ ("CacheReportARN", Some (cache_report_ar_n_to_yojson x.cache_report_ar_n)) ]

let cachedi_scsi_volume_to_yojson (x : cachedi_scsi_volume) =
  assoc_to_yojson
    [
      ("TargetName", option_to_yojson target_name_to_yojson x.target_name);
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("VolumeUsedInBytes", option_to_yojson volume_used_in_bytes_to_yojson x.volume_used_in_bytes);
      ("CreatedDate", option_to_yojson created_date_to_yojson x.created_date);
      ( "VolumeiSCSIAttributes",
        option_to_yojson volumei_scsi_attributes_to_yojson x.volumei_scsi_attributes );
      ("SourceSnapshotId", option_to_yojson snapshot_id_to_yojson x.source_snapshot_id);
      ("VolumeProgress", option_to_yojson double_object_to_yojson x.volume_progress);
      ("VolumeSizeInBytes", option_to_yojson long_to_yojson x.volume_size_in_bytes);
      ( "VolumeAttachmentStatus",
        option_to_yojson volume_attachment_status_to_yojson x.volume_attachment_status );
      ("VolumeStatus", option_to_yojson volume_status_to_yojson x.volume_status);
      ("VolumeType", option_to_yojson volume_type_to_yojson x.volume_type);
      ("VolumeId", option_to_yojson volume_id_to_yojson x.volume_id);
      ("VolumeARN", option_to_yojson volume_ar_n_to_yojson x.volume_ar_n);
    ]

let cachedi_scsi_volumes_to_yojson tree = list_to_yojson cachedi_scsi_volume_to_yojson tree

let describe_cachedi_scsi_volumes_output_to_yojson (x : describe_cachedi_scsi_volumes_output) =
  assoc_to_yojson
    [
      ("CachediSCSIVolumes", option_to_yojson cachedi_scsi_volumes_to_yojson x.cachedi_scsi_volumes);
    ]

let describe_cachedi_scsi_volumes_input_to_yojson (x : describe_cachedi_scsi_volumes_input) =
  assoc_to_yojson [ ("VolumeARNs", Some (volume_ar_ns_to_yojson x.volume_ar_ns)) ]

let describe_cache_output_to_yojson (x : describe_cache_output) =
  assoc_to_yojson
    [
      ("CacheMissPercentage", option_to_yojson double_to_yojson x.cache_miss_percentage);
      ("CacheHitPercentage", option_to_yojson double_to_yojson x.cache_hit_percentage);
      ("CacheDirtyPercentage", option_to_yojson double_to_yojson x.cache_dirty_percentage);
      ("CacheUsedPercentage", option_to_yojson double_to_yojson x.cache_used_percentage);
      ("CacheAllocatedInBytes", option_to_yojson long_to_yojson x.cache_allocated_in_bytes);
      ("DiskIds", option_to_yojson disk_ids_to_yojson x.disk_ids);
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
    ]

let describe_cache_input_to_yojson (x : describe_cache_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let describe_bandwidth_rate_limit_schedule_output_to_yojson
    (x : describe_bandwidth_rate_limit_schedule_output) =
  assoc_to_yojson
    [
      ( "BandwidthRateLimitIntervals",
        option_to_yojson bandwidth_rate_limit_intervals_to_yojson x.bandwidth_rate_limit_intervals
      );
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
    ]

let describe_bandwidth_rate_limit_schedule_input_to_yojson
    (x : describe_bandwidth_rate_limit_schedule_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let describe_bandwidth_rate_limit_output_to_yojson (x : describe_bandwidth_rate_limit_output) =
  assoc_to_yojson
    [
      ( "AverageDownloadRateLimitInBitsPerSec",
        option_to_yojson bandwidth_download_rate_limit_to_yojson
          x.average_download_rate_limit_in_bits_per_sec );
      ( "AverageUploadRateLimitInBitsPerSec",
        option_to_yojson bandwidth_upload_rate_limit_to_yojson
          x.average_upload_rate_limit_in_bits_per_sec );
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
    ]

let describe_bandwidth_rate_limit_input_to_yojson (x : describe_bandwidth_rate_limit_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let availability_monitor_test_status_to_yojson (x : availability_monitor_test_status) =
  match x with
  | PENDING -> `String "PENDING"
  | FAILED -> `String "FAILED"
  | COMPLETE -> `String "COMPLETE"

let describe_availability_monitor_test_output_to_yojson
    (x : describe_availability_monitor_test_output) =
  assoc_to_yojson
    [
      ("StartTime", option_to_yojson time_to_yojson x.start_time);
      ("Status", option_to_yojson availability_monitor_test_status_to_yojson x.status);
      ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n);
    ]

let describe_availability_monitor_test_input_to_yojson
    (x : describe_availability_monitor_test_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let delete_volume_output_to_yojson (x : delete_volume_output) =
  assoc_to_yojson [ ("VolumeARN", option_to_yojson volume_ar_n_to_yojson x.volume_ar_n) ]

let delete_volume_input_to_yojson (x : delete_volume_input) =
  assoc_to_yojson [ ("VolumeARN", Some (volume_ar_n_to_yojson x.volume_ar_n)) ]

let delete_tape_pool_output_to_yojson (x : delete_tape_pool_output) =
  assoc_to_yojson [ ("PoolARN", option_to_yojson pool_ar_n_to_yojson x.pool_ar_n) ]

let delete_tape_pool_input_to_yojson (x : delete_tape_pool_input) =
  assoc_to_yojson [ ("PoolARN", Some (pool_ar_n_to_yojson x.pool_ar_n)) ]

let delete_tape_archive_output_to_yojson (x : delete_tape_archive_output) =
  assoc_to_yojson [ ("TapeARN", option_to_yojson tape_ar_n_to_yojson x.tape_ar_n) ]

let delete_tape_archive_input_to_yojson (x : delete_tape_archive_input) =
  assoc_to_yojson
    [
      ( "BypassGovernanceRetention",
        option_to_yojson boolean2_to_yojson x.bypass_governance_retention );
      ("TapeARN", Some (tape_ar_n_to_yojson x.tape_ar_n));
    ]

let delete_tape_output_to_yojson (x : delete_tape_output) =
  assoc_to_yojson [ ("TapeARN", option_to_yojson tape_ar_n_to_yojson x.tape_ar_n) ]

let delete_tape_input_to_yojson (x : delete_tape_input) =
  assoc_to_yojson
    [
      ( "BypassGovernanceRetention",
        option_to_yojson boolean2_to_yojson x.bypass_governance_retention );
      ("TapeARN", Some (tape_ar_n_to_yojson x.tape_ar_n));
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
    ]

let delete_snapshot_schedule_output_to_yojson (x : delete_snapshot_schedule_output) =
  assoc_to_yojson [ ("VolumeARN", option_to_yojson volume_ar_n_to_yojson x.volume_ar_n) ]

let delete_snapshot_schedule_input_to_yojson (x : delete_snapshot_schedule_input) =
  assoc_to_yojson [ ("VolumeARN", Some (volume_ar_n_to_yojson x.volume_ar_n)) ]

let delete_gateway_output_to_yojson (x : delete_gateway_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let delete_gateway_input_to_yojson (x : delete_gateway_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let delete_file_share_output_to_yojson (x : delete_file_share_output) =
  assoc_to_yojson [ ("FileShareARN", option_to_yojson file_share_ar_n_to_yojson x.file_share_ar_n) ]

let delete_file_share_input_to_yojson (x : delete_file_share_input) =
  assoc_to_yojson
    [
      ("ForceDelete", option_to_yojson boolean2_to_yojson x.force_delete);
      ("FileShareARN", Some (file_share_ar_n_to_yojson x.file_share_ar_n));
    ]

let delete_chap_credentials_output_to_yojson (x : delete_chap_credentials_output) =
  assoc_to_yojson
    [
      ("InitiatorName", option_to_yojson iqn_name_to_yojson x.initiator_name);
      ("TargetARN", option_to_yojson target_ar_n_to_yojson x.target_ar_n);
    ]

let delete_chap_credentials_input_to_yojson (x : delete_chap_credentials_input) =
  assoc_to_yojson
    [
      ("InitiatorName", Some (iqn_name_to_yojson x.initiator_name));
      ("TargetARN", Some (target_ar_n_to_yojson x.target_ar_n));
    ]

let delete_cache_report_output_to_yojson (x : delete_cache_report_output) =
  assoc_to_yojson
    [ ("CacheReportARN", option_to_yojson cache_report_ar_n_to_yojson x.cache_report_ar_n) ]

let delete_cache_report_input_to_yojson (x : delete_cache_report_input) =
  assoc_to_yojson [ ("CacheReportARN", Some (cache_report_ar_n_to_yojson x.cache_report_ar_n)) ]

let delete_bandwidth_rate_limit_output_to_yojson (x : delete_bandwidth_rate_limit_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let bandwidth_type_to_yojson = string_to_yojson

let delete_bandwidth_rate_limit_input_to_yojson (x : delete_bandwidth_rate_limit_input) =
  assoc_to_yojson
    [
      ("BandwidthType", Some (bandwidth_type_to_yojson x.bandwidth_type));
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
    ]

let delete_automatic_tape_creation_policy_output_to_yojson
    (x : delete_automatic_tape_creation_policy_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let delete_automatic_tape_creation_policy_input_to_yojson
    (x : delete_automatic_tape_creation_policy_input) =
  assoc_to_yojson [ ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n)) ]

let create_tape_with_barcode_output_to_yojson (x : create_tape_with_barcode_output) =
  assoc_to_yojson [ ("TapeARN", option_to_yojson tape_ar_n_to_yojson x.tape_ar_n) ]

let create_tape_with_barcode_input_to_yojson (x : create_tape_with_barcode_input) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("Worm", option_to_yojson boolean2_to_yojson x.worm);
      ("PoolId", option_to_yojson pool_id_to_yojson x.pool_id);
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("KMSEncrypted", option_to_yojson boolean__to_yojson x.kms_encrypted);
      ("TapeBarcode", Some (tape_barcode_to_yojson x.tape_barcode));
      ("TapeSizeInBytes", Some (tape_size_to_yojson x.tape_size_in_bytes));
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
    ]

let create_tapes_output_to_yojson (x : create_tapes_output) =
  assoc_to_yojson [ ("TapeARNs", option_to_yojson tape_ar_ns_to_yojson x.tape_ar_ns) ]

let num_tapes_to_create_to_yojson = int_to_yojson

let create_tapes_input_to_yojson (x : create_tapes_input) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("Worm", option_to_yojson boolean2_to_yojson x.worm);
      ("PoolId", option_to_yojson pool_id_to_yojson x.pool_id);
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("KMSEncrypted", option_to_yojson boolean__to_yojson x.kms_encrypted);
      ("TapeBarcodePrefix", Some (tape_barcode_prefix_to_yojson x.tape_barcode_prefix));
      ("NumTapesToCreate", Some (num_tapes_to_create_to_yojson x.num_tapes_to_create));
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("TapeSizeInBytes", Some (tape_size_to_yojson x.tape_size_in_bytes));
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
    ]

let create_tape_pool_output_to_yojson (x : create_tape_pool_output) =
  assoc_to_yojson [ ("PoolARN", option_to_yojson pool_ar_n_to_yojson x.pool_ar_n) ]

let create_tape_pool_input_to_yojson (x : create_tape_pool_input) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ( "RetentionLockTimeInDays",
        option_to_yojson retention_lock_time_in_days_to_yojson x.retention_lock_time_in_days );
      ("RetentionLockType", option_to_yojson retention_lock_type_to_yojson x.retention_lock_type);
      ("StorageClass", Some (tape_storage_class_to_yojson x.storage_class));
      ("PoolName", Some (pool_name_to_yojson x.pool_name));
    ]

let create_storedi_scsi_volume_output_to_yojson (x : create_storedi_scsi_volume_output) =
  assoc_to_yojson
    [
      ("TargetARN", option_to_yojson target_ar_n_to_yojson x.target_ar_n);
      ("VolumeSizeInBytes", option_to_yojson long_to_yojson x.volume_size_in_bytes);
      ("VolumeARN", option_to_yojson volume_ar_n_to_yojson x.volume_ar_n);
    ]

let create_storedi_scsi_volume_input_to_yojson (x : create_storedi_scsi_volume_input) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("KMSEncrypted", option_to_yojson boolean__to_yojson x.kms_encrypted);
      ("NetworkInterfaceId", Some (network_interface_id_to_yojson x.network_interface_id));
      ("TargetName", Some (target_name_to_yojson x.target_name));
      ("PreserveExistingData", Some (boolean2_to_yojson x.preserve_existing_data));
      ("SnapshotId", option_to_yojson snapshot_id_to_yojson x.snapshot_id);
      ("DiskId", Some (disk_id_to_yojson x.disk_id));
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
    ]

let service_unavailable_error_to_yojson (x : service_unavailable_error) =
  assoc_to_yojson
    [
      ("error", option_to_yojson storage_gateway_error_to_yojson x.error);
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let create_snapshot_from_volume_recovery_point_output_to_yojson
    (x : create_snapshot_from_volume_recovery_point_output) =
  assoc_to_yojson
    [
      ("VolumeRecoveryPointTime", option_to_yojson string__to_yojson x.volume_recovery_point_time);
      ("VolumeARN", option_to_yojson volume_ar_n_to_yojson x.volume_ar_n);
      ("SnapshotId", option_to_yojson snapshot_id_to_yojson x.snapshot_id);
    ]

let snapshot_description_to_yojson = string_to_yojson

let create_snapshot_from_volume_recovery_point_input_to_yojson
    (x : create_snapshot_from_volume_recovery_point_input) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("SnapshotDescription", Some (snapshot_description_to_yojson x.snapshot_description));
      ("VolumeARN", Some (volume_ar_n_to_yojson x.volume_ar_n));
    ]

let create_snapshot_output_to_yojson (x : create_snapshot_output) =
  assoc_to_yojson
    [
      ("SnapshotId", option_to_yojson snapshot_id_to_yojson x.snapshot_id);
      ("VolumeARN", option_to_yojson volume_ar_n_to_yojson x.volume_ar_n);
    ]

let create_snapshot_input_to_yojson (x : create_snapshot_input) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("SnapshotDescription", Some (snapshot_description_to_yojson x.snapshot_description));
      ("VolumeARN", Some (volume_ar_n_to_yojson x.volume_ar_n));
    ]

let create_smb_file_share_output_to_yojson (x : create_smb_file_share_output) =
  assoc_to_yojson [ ("FileShareARN", option_to_yojson file_share_ar_n_to_yojson x.file_share_ar_n) ]

let create_smb_file_share_input_to_yojson (x : create_smb_file_share_input) =
  assoc_to_yojson
    [
      ("OplocksEnabled", option_to_yojson boolean__to_yojson x.oplocks_enabled);
      ("BucketRegion", option_to_yojson region_id_to_yojson x.bucket_region);
      ("VPCEndpointDNSName", option_to_yojson dns_host_name_to_yojson x.vpc_endpoint_dns_name);
      ("NotificationPolicy", option_to_yojson notification_policy_to_yojson x.notification_policy);
      ("CacheAttributes", option_to_yojson cache_attributes_to_yojson x.cache_attributes);
      ("FileShareName", option_to_yojson file_share_name_to_yojson x.file_share_name);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("CaseSensitivity", option_to_yojson case_sensitivity_to_yojson x.case_sensitivity);
      ("Authentication", option_to_yojson authentication_to_yojson x.authentication);
      ( "AuditDestinationARN",
        option_to_yojson audit_destination_ar_n_to_yojson x.audit_destination_ar_n );
      ("InvalidUserList", option_to_yojson user_list_to_yojson x.invalid_user_list);
      ("ValidUserList", option_to_yojson user_list_to_yojson x.valid_user_list);
      ("AdminUserList", option_to_yojson user_list_to_yojson x.admin_user_list);
      ("AccessBasedEnumeration", option_to_yojson boolean__to_yojson x.access_based_enumeration);
      ("SMBACLEnabled", option_to_yojson boolean__to_yojson x.smbacl_enabled);
      ("RequesterPays", option_to_yojson boolean__to_yojson x.requester_pays);
      ("GuessMIMETypeEnabled", option_to_yojson boolean__to_yojson x.guess_mime_type_enabled);
      ("ReadOnly", option_to_yojson boolean__to_yojson x.read_only);
      ("ObjectACL", option_to_yojson object_ac_l_to_yojson x.object_ac_l);
      ("DefaultStorageClass", option_to_yojson storage_class_to_yojson x.default_storage_class);
      ("LocationARN", Some (location_ar_n_to_yojson x.location_ar_n));
      ("Role", Some (role_to_yojson x.role));
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("KMSEncrypted", option_to_yojson boolean__to_yojson x.kms_encrypted);
      ("EncryptionType", option_to_yojson encryption_type_to_yojson x.encryption_type);
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
      ("ClientToken", Some (client_token_to_yojson x.client_token));
    ]

let create_nfs_file_share_output_to_yojson (x : create_nfs_file_share_output) =
  assoc_to_yojson [ ("FileShareARN", option_to_yojson file_share_ar_n_to_yojson x.file_share_ar_n) ]

let create_nfs_file_share_input_to_yojson (x : create_nfs_file_share_input) =
  assoc_to_yojson
    [
      ( "AuditDestinationARN",
        option_to_yojson audit_destination_ar_n_to_yojson x.audit_destination_ar_n );
      ("BucketRegion", option_to_yojson region_id_to_yojson x.bucket_region);
      ("VPCEndpointDNSName", option_to_yojson dns_host_name_to_yojson x.vpc_endpoint_dns_name);
      ("NotificationPolicy", option_to_yojson notification_policy_to_yojson x.notification_policy);
      ("CacheAttributes", option_to_yojson cache_attributes_to_yojson x.cache_attributes);
      ("FileShareName", option_to_yojson file_share_name_to_yojson x.file_share_name);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("RequesterPays", option_to_yojson boolean__to_yojson x.requester_pays);
      ("GuessMIMETypeEnabled", option_to_yojson boolean__to_yojson x.guess_mime_type_enabled);
      ("ReadOnly", option_to_yojson boolean__to_yojson x.read_only);
      ("Squash", option_to_yojson squash_to_yojson x.squash);
      ("ClientList", option_to_yojson file_share_client_list_to_yojson x.client_list);
      ("ObjectACL", option_to_yojson object_ac_l_to_yojson x.object_ac_l);
      ("DefaultStorageClass", option_to_yojson storage_class_to_yojson x.default_storage_class);
      ("LocationARN", Some (location_ar_n_to_yojson x.location_ar_n));
      ("Role", Some (role_to_yojson x.role));
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("KMSEncrypted", option_to_yojson boolean__to_yojson x.kms_encrypted);
      ("EncryptionType", option_to_yojson encryption_type_to_yojson x.encryption_type);
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
      ( "NFSFileShareDefaults",
        option_to_yojson nfs_file_share_defaults_to_yojson x.nfs_file_share_defaults );
      ("ClientToken", Some (client_token_to_yojson x.client_token));
    ]

let create_cachedi_scsi_volume_output_to_yojson (x : create_cachedi_scsi_volume_output) =
  assoc_to_yojson
    [
      ("TargetARN", option_to_yojson target_ar_n_to_yojson x.target_ar_n);
      ("VolumeARN", option_to_yojson volume_ar_n_to_yojson x.volume_ar_n);
    ]

let create_cachedi_scsi_volume_input_to_yojson (x : create_cachedi_scsi_volume_input) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("KMSKey", option_to_yojson kms_key_to_yojson x.kms_key);
      ("KMSEncrypted", option_to_yojson boolean__to_yojson x.kms_encrypted);
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("NetworkInterfaceId", Some (network_interface_id_to_yojson x.network_interface_id));
      ("SourceVolumeARN", option_to_yojson volume_ar_n_to_yojson x.source_volume_ar_n);
      ("TargetName", Some (target_name_to_yojson x.target_name));
      ("SnapshotId", option_to_yojson snapshot_id_to_yojson x.snapshot_id);
      ("VolumeSizeInBytes", Some (long_to_yojson x.volume_size_in_bytes));
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
    ]

let cancel_retrieval_output_to_yojson (x : cancel_retrieval_output) =
  assoc_to_yojson [ ("TapeARN", option_to_yojson tape_ar_n_to_yojson x.tape_ar_n) ]

let cancel_retrieval_input_to_yojson (x : cancel_retrieval_input) =
  assoc_to_yojson
    [
      ("TapeARN", Some (tape_ar_n_to_yojson x.tape_ar_n));
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
    ]

let cancel_cache_report_output_to_yojson (x : cancel_cache_report_output) =
  assoc_to_yojson
    [ ("CacheReportARN", option_to_yojson cache_report_ar_n_to_yojson x.cache_report_ar_n) ]

let cancel_cache_report_input_to_yojson (x : cancel_cache_report_input) =
  assoc_to_yojson [ ("CacheReportARN", Some (cache_report_ar_n_to_yojson x.cache_report_ar_n)) ]

let cancel_archival_output_to_yojson (x : cancel_archival_output) =
  assoc_to_yojson [ ("TapeARN", option_to_yojson tape_ar_n_to_yojson x.tape_ar_n) ]

let cancel_archival_input_to_yojson (x : cancel_archival_input) =
  assoc_to_yojson
    [
      ("TapeARN", Some (tape_ar_n_to_yojson x.tape_ar_n));
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
    ]

let attach_volume_output_to_yojson (x : attach_volume_output) =
  assoc_to_yojson
    [
      ("TargetARN", option_to_yojson target_ar_n_to_yojson x.target_ar_n);
      ("VolumeARN", option_to_yojson volume_ar_n_to_yojson x.volume_ar_n);
    ]

let attach_volume_input_to_yojson (x : attach_volume_input) =
  assoc_to_yojson
    [
      ("DiskId", option_to_yojson disk_id_to_yojson x.disk_id);
      ("NetworkInterfaceId", Some (network_interface_id_to_yojson x.network_interface_id));
      ("VolumeARN", Some (volume_ar_n_to_yojson x.volume_ar_n));
      ("TargetName", option_to_yojson target_name_to_yojson x.target_name);
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
    ]

let associate_file_system_output_to_yojson (x : associate_file_system_output) =
  assoc_to_yojson
    [
      ( "FileSystemAssociationARN",
        option_to_yojson file_system_association_ar_n_to_yojson x.file_system_association_ar_n );
    ]

let associate_file_system_input_to_yojson (x : associate_file_system_input) =
  assoc_to_yojson
    [
      ( "EndpointNetworkConfiguration",
        option_to_yojson endpoint_network_configuration_to_yojson x.endpoint_network_configuration
      );
      ("CacheAttributes", option_to_yojson cache_attributes_to_yojson x.cache_attributes);
      ( "AuditDestinationARN",
        option_to_yojson audit_destination_ar_n_to_yojson x.audit_destination_ar_n );
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("LocationARN", Some (file_system_location_ar_n_to_yojson x.location_ar_n));
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
      ("ClientToken", Some (client_token_to_yojson x.client_token));
      ("Password", Some (domain_user_password_to_yojson x.password));
      ("UserName", Some (domain_user_name_to_yojson x.user_name));
    ]

let assign_tape_pool_output_to_yojson (x : assign_tape_pool_output) =
  assoc_to_yojson [ ("TapeARN", option_to_yojson tape_ar_n_to_yojson x.tape_ar_n) ]

let assign_tape_pool_input_to_yojson (x : assign_tape_pool_input) =
  assoc_to_yojson
    [
      ( "BypassGovernanceRetention",
        option_to_yojson boolean2_to_yojson x.bypass_governance_retention );
      ("PoolId", Some (pool_id_to_yojson x.pool_id));
      ("TapeARN", Some (tape_ar_n_to_yojson x.tape_ar_n));
    ]

let add_working_storage_output_to_yojson (x : add_working_storage_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let add_working_storage_input_to_yojson (x : add_working_storage_input) =
  assoc_to_yojson
    [
      ("DiskIds", Some (disk_ids_to_yojson x.disk_ids));
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
    ]

let add_upload_buffer_output_to_yojson (x : add_upload_buffer_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let add_upload_buffer_input_to_yojson (x : add_upload_buffer_input) =
  assoc_to_yojson
    [
      ("DiskIds", Some (disk_ids_to_yojson x.disk_ids));
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
    ]

let add_tags_to_resource_output_to_yojson (x : add_tags_to_resource_output) =
  assoc_to_yojson [ ("ResourceARN", option_to_yojson resource_ar_n_to_yojson x.resource_ar_n) ]

let add_tags_to_resource_input_to_yojson (x : add_tags_to_resource_input) =
  assoc_to_yojson
    [
      ("Tags", Some (tags_to_yojson x.tags));
      ("ResourceARN", Some (resource_ar_n_to_yojson x.resource_ar_n));
    ]

let add_cache_output_to_yojson (x : add_cache_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let add_cache_input_to_yojson (x : add_cache_input) =
  assoc_to_yojson
    [
      ("DiskIds", Some (disk_ids_to_yojson x.disk_ids));
      ("GatewayARN", Some (gateway_ar_n_to_yojson x.gateway_ar_n));
    ]

let activate_gateway_output_to_yojson (x : activate_gateway_output) =
  assoc_to_yojson [ ("GatewayARN", option_to_yojson gateway_ar_n_to_yojson x.gateway_ar_n) ]

let activation_key_to_yojson = string_to_yojson
let medium_changer_type_to_yojson = string_to_yojson

let activate_gateway_input_to_yojson (x : activate_gateway_input) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("MediumChangerType", option_to_yojson medium_changer_type_to_yojson x.medium_changer_type);
      ("TapeDriveType", option_to_yojson tape_drive_type_to_yojson x.tape_drive_type);
      ("GatewayType", option_to_yojson gateway_type_to_yojson x.gateway_type);
      ("GatewayRegion", Some (region_id_to_yojson x.gateway_region));
      ("GatewayTimezone", Some (gateway_timezone_to_yojson x.gateway_timezone));
      ("GatewayName", Some (gateway_name_to_yojson x.gateway_name));
      ("ActivationKey", Some (activation_key_to_yojson x.activation_key));
    ]
