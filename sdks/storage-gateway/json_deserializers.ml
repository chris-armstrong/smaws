open Smaws_Lib.Json.DeserializeHelpers
open Types

let string__of_yojson = string_of_yojson
let long_of_yojson = long_of_yojson
let integer_of_yojson = int_of_yojson
let error_details_of_yojson tree path = map_of_yojson string__of_yojson string__of_yojson tree path
let double_of_yojson = double_of_yojson
let target_ar_n_of_yojson = string_of_yojson
let network_interface_id_of_yojson = string_of_yojson
let positive_int_object_of_yojson = int_of_yojson
let boolean2_of_yojson = bool_of_yojson

let volumei_scsi_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     chap_enabled = option_of_yojson (value_for_key boolean2_of_yojson "ChapEnabled") _list path;
     lun_number =
       option_of_yojson (value_for_key positive_int_object_of_yojson "LunNumber") _list path;
     network_interface_port =
       option_of_yojson (value_for_key integer_of_yojson "NetworkInterfacePort") _list path;
     network_interface_id =
       option_of_yojson
         (value_for_key network_interface_id_of_yojson "NetworkInterfaceId")
         _list path;
     target_ar_n = option_of_yojson (value_for_key target_ar_n_of_yojson "TargetARN") _list path;
   }
    : volumei_scsi_attributes)

let volume_used_in_bytes_of_yojson = long_of_yojson
let volume_type_of_yojson = string_of_yojson
let volume_status_of_yojson = string_of_yojson
let volume_ar_n_of_yojson = string_of_yojson

let volume_recovery_point_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     volume_recovery_point_time =
       option_of_yojson (value_for_key string__of_yojson "VolumeRecoveryPointTime") _list path;
     volume_usage_in_bytes =
       option_of_yojson (value_for_key long_of_yojson "VolumeUsageInBytes") _list path;
     volume_size_in_bytes =
       option_of_yojson (value_for_key long_of_yojson "VolumeSizeInBytes") _list path;
     volume_ar_n = option_of_yojson (value_for_key volume_ar_n_of_yojson "VolumeARN") _list path;
   }
    : volume_recovery_point_info)

let volume_recovery_point_infos_of_yojson tree path =
  list_of_yojson volume_recovery_point_info_of_yojson tree path

let volume_id_of_yojson = string_of_yojson
let gateway_ar_n_of_yojson = string_of_yojson
let gateway_id_of_yojson = string_of_yojson
let volume_attachment_status_of_yojson = string_of_yojson

let volume_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     volume_attachment_status =
       option_of_yojson
         (value_for_key volume_attachment_status_of_yojson "VolumeAttachmentStatus")
         _list path;
     volume_size_in_bytes =
       option_of_yojson (value_for_key long_of_yojson "VolumeSizeInBytes") _list path;
     volume_type = option_of_yojson (value_for_key volume_type_of_yojson "VolumeType") _list path;
     gateway_id = option_of_yojson (value_for_key gateway_id_of_yojson "GatewayId") _list path;
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
     volume_id = option_of_yojson (value_for_key volume_id_of_yojson "VolumeId") _list path;
     volume_ar_n = option_of_yojson (value_for_key volume_ar_n_of_yojson "VolumeARN") _list path;
   }
    : volume_info)

let volume_infos_of_yojson tree path = list_of_yojson volume_info_of_yojson tree path
let volume_ar_ns_of_yojson tree path = list_of_yojson volume_ar_n_of_yojson tree path
let vtl_device_ar_n_of_yojson = string_of_yojson
let vtl_device_type_of_yojson = string_of_yojson
let vtl_device_vendor_of_yojson = string_of_yojson
let vtl_device_product_identifier_of_yojson = string_of_yojson

let devicei_scsi_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     chap_enabled = option_of_yojson (value_for_key boolean2_of_yojson "ChapEnabled") _list path;
     network_interface_port =
       option_of_yojson (value_for_key integer_of_yojson "NetworkInterfacePort") _list path;
     network_interface_id =
       option_of_yojson
         (value_for_key network_interface_id_of_yojson "NetworkInterfaceId")
         _list path;
     target_ar_n = option_of_yojson (value_for_key target_ar_n_of_yojson "TargetARN") _list path;
   }
    : devicei_scsi_attributes)

let vtl_device_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     devicei_scsi_attributes =
       option_of_yojson
         (value_for_key devicei_scsi_attributes_of_yojson "DeviceiSCSIAttributes")
         _list path;
     vtl_device_product_identifier =
       option_of_yojson
         (value_for_key vtl_device_product_identifier_of_yojson "VTLDeviceProductIdentifier")
         _list path;
     vtl_device_vendor =
       option_of_yojson (value_for_key vtl_device_vendor_of_yojson "VTLDeviceVendor") _list path;
     vtl_device_type =
       option_of_yojson (value_for_key vtl_device_type_of_yojson "VTLDeviceType") _list path;
     vtl_device_ar_n =
       option_of_yojson (value_for_key vtl_device_ar_n_of_yojson "VTLDeviceARN") _list path;
   }
    : vtl_device)

let vtl_devices_of_yojson tree path = list_of_yojson vtl_device_of_yojson tree path
let vtl_device_ar_ns_of_yojson tree path = list_of_yojson vtl_device_ar_n_of_yojson tree path
let user_list_user_of_yojson = string_of_yojson
let user_list_of_yojson tree path = list_of_yojson user_list_user_of_yojson tree path

let update_vtl_device_type_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     vtl_device_ar_n =
       option_of_yojson (value_for_key vtl_device_ar_n_of_yojson "VTLDeviceARN") _list path;
   }
    : update_vtl_device_type_output)

let device_type_of_yojson = string_of_yojson

let update_vtl_device_type_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     device_type = value_for_key device_type_of_yojson "DeviceType" _list path;
     vtl_device_ar_n = value_for_key vtl_device_ar_n_of_yojson "VTLDeviceARN" _list path;
   }
    : update_vtl_device_type_input)

let error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "VolumeNotReady" -> VolumeNotReady
    | `String "VolumeNotFound" -> VolumeNotFound
    | `String "VolumeInUse" -> VolumeInUse
    | `String "VolumeIdInvalid" -> VolumeIdInvalid
    | `String "VolumeAlreadyExists" -> VolumeAlreadyExists
    | `String "UnauthorizedOperation" -> UnauthorizedOperation
    | `String "TargetNotFound" -> TargetNotFound
    | `String "TargetInvalid" -> TargetInvalid
    | `String "TargetAlreadyExists" -> TargetAlreadyExists
    | `String "TapeCartridgeNotFound" -> TapeCartridgeNotFound
    | `String "StorageFailure" -> StorageFailure
    | `String "StagingAreaFull" -> StagingAreaFull
    | `String "SnapshotScheduleNotFound" -> SnapshotScheduleNotFound
    | `String "SnapshotNotFound" -> SnapshotNotFound
    | `String "SnapshotInProgress" -> SnapshotInProgress
    | `String "SnapshotIdInvalid" -> SnapshotIdInvalid
    | `String "SnapshotDeleted" -> SnapshotDeleted
    | `String "ServiceUnavailable" -> ServiceUnavailable
    | `String "RequestTimeout" -> RequestTimeout
    | `String "RegionInvalid" -> RegionInvalid
    | `String "ParametersNotImplemented" -> ParametersNotImplemented
    | `String "OutdatedGateway" -> OutdatedGateway
    | `String "OperationAborted" -> OperationAborted
    | `String "NotSupported" -> NotSupported
    | `String "NotImplemented" -> NotImplemented
    | `String "NoDisksAvailable" -> NoDisksAvailable
    | `String "NetworkConfigurationChanged" -> NetworkConfigurationChanged
    | `String "MaximumVolumeCountExceeded" -> MaximumVolumeCountExceeded
    | `String "MaximumTapeCartridgeCountExceeded" -> MaximumTapeCartridgeCountExceeded
    | `String "MaximumContentLengthExceeded" -> MaximumContentLengthExceeded
    | `String "JoinDomainInProgress" -> JoinDomainInProgress
    | `String "LunInvalid" -> LunInvalid
    | `String "LunAlreadyAllocated " -> LunAlreadyAllocated_
    | `String "LocalStorageLimitExceeded" -> LocalStorageLimitExceeded
    | `String "InvalidSchedule" -> InvalidSchedule
    | `String "InvalidParameters" -> InvalidParameters
    | `String "InvalidEndpoint" -> InvalidEndpoint
    | `String "InvalidGateway" -> InvalidGateway
    | `String "InternalError" -> InternalError
    | `String "InitiatorNotFound" -> InitiatorNotFound
    | `String "InitiatorInvalid" -> InitiatorInvalid
    | `String "IAMNotSupported" -> IAMNotSupported
    | `String "EndpointNotFound" -> EndpointNotFound
    | `String "DuplicateSchedule" -> DuplicateSchedule
    | `String "DuplicateCertificateInfo" -> DuplicateCertificateInfo
    | `String "DiskSizeNotGigAligned" -> DiskSizeNotGigAligned
    | `String "DiskSizeLessThanVolumeSize" -> DiskSizeLessThanVolumeSize
    | `String "DiskSizeGreaterThanVolumeMaxSize" -> DiskSizeGreaterThanVolumeMaxSize
    | `String "DiskDoesNotExist" -> DiskDoesNotExist
    | `String "DiskAlreadyAllocated" -> DiskAlreadyAllocated
    | `String "ChapCredentialNotFound" -> ChapCredentialNotFound
    | `String "CannotExportSnapshot" -> CannotExportSnapshot
    | `String "Blocked" -> Blocked
    | `String "BandwidthThrottleScheduleNotFound" -> BandwidthThrottleScheduleNotFound
    | `String "AuthenticationFailure" -> AuthenticationFailure
    | `String "GatewayProxyNetworkConnectionBusy" -> GatewayProxyNetworkConnectionBusy
    | `String "GatewayNotFound" -> GatewayNotFound
    | `String "GatewayNotConnected" -> GatewayNotConnected
    | `String "GatewayInternalError" -> GatewayInternalError
    | `String "ActivationKeyNotFound" -> ActivationKeyNotFound
    | `String "ActivationKeyInvalid" -> ActivationKeyInvalid
    | `String "ActivationKeyExpired" -> ActivationKeyExpired
    | `String value -> raise (deserialize_unknown_enum_value_error path "ErrorCode" value)
    | _ -> raise (deserialize_wrong_type_error path "ErrorCode")
     : error_code)
    : error_code)

let storage_gateway_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_details =
       option_of_yojson (value_for_key error_details_of_yojson "errorDetails") _list path;
     error_code = option_of_yojson (value_for_key error_code_of_yojson "errorCode") _list path;
   }
    : storage_gateway_error)

let invalid_gateway_request_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error = option_of_yojson (value_for_key storage_gateway_error_of_yojson "error") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
   }
    : invalid_gateway_request_exception)

let internal_server_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error = option_of_yojson (value_for_key storage_gateway_error_of_yojson "error") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
   }
    : internal_server_error)

let update_snapshot_schedule_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ volume_ar_n = option_of_yojson (value_for_key volume_ar_n_of_yojson "VolumeARN") _list path }
    : update_snapshot_schedule_output)

let hour_of_day_of_yojson = int_of_yojson
let recurrence_in_hours_of_yojson = int_of_yojson
let description_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_value_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key tag_value_of_yojson "Value" _list path;
     key = value_for_key tag_key_of_yojson "Key" _list path;
   }
    : tag)

let tags_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let update_snapshot_schedule_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     recurrence_in_hours =
       value_for_key recurrence_in_hours_of_yojson "RecurrenceInHours" _list path;
     start_at = value_for_key hour_of_day_of_yojson "StartAt" _list path;
     volume_ar_n = value_for_key volume_ar_n_of_yojson "VolumeARN" _list path;
   }
    : update_snapshot_schedule_input)

let update_smb_security_strategy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : update_smb_security_strategy_output)

let smb_security_strategy_of_yojson (tree : t) path =
  ((match tree with
    | `String "MandatoryEncryptionNoAes128" -> MandatoryEncryptionNoAes128
    | `String "MandatoryEncryption" -> MandatoryEncryption
    | `String "MandatorySigning" -> MandatorySigning
    | `String "ClientSpecified" -> ClientSpecified
    | `String value -> raise (deserialize_unknown_enum_value_error path "SMBSecurityStrategy" value)
    | _ -> raise (deserialize_wrong_type_error path "SMBSecurityStrategy")
     : smb_security_strategy)
    : smb_security_strategy)

let update_smb_security_strategy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     smb_security_strategy =
       value_for_key smb_security_strategy_of_yojson "SMBSecurityStrategy" _list path;
     gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path;
   }
    : update_smb_security_strategy_input)

let update_smb_local_groups_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : update_smb_local_groups_output)

let smb_local_groups_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_admins =
       option_of_yojson (value_for_key user_list_of_yojson "GatewayAdmins") _list path;
   }
    : smb_local_groups)

let update_smb_local_groups_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     smb_local_groups = value_for_key smb_local_groups_of_yojson "SMBLocalGroups" _list path;
     gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path;
   }
    : update_smb_local_groups_input)

let update_smb_file_share_visibility_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : update_smb_file_share_visibility_output)

let boolean__of_yojson = bool_of_yojson

let update_smb_file_share_visibility_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_shares_visible = value_for_key boolean__of_yojson "FileSharesVisible" _list path;
     gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path;
   }
    : update_smb_file_share_visibility_input)

let file_share_ar_n_of_yojson = string_of_yojson

let update_smb_file_share_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_share_ar_n =
       option_of_yojson (value_for_key file_share_ar_n_of_yojson "FileShareARN") _list path;
   }
    : update_smb_file_share_output)

let encryption_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "DsseKms" -> DsseKms
    | `String "SseKms" -> SseKms
    | `String "SseS3" -> SseS3
    | `String value -> raise (deserialize_unknown_enum_value_error path "EncryptionType" value)
    | _ -> raise (deserialize_wrong_type_error path "EncryptionType")
     : encryption_type)
    : encryption_type)

let kms_key_of_yojson = string_of_yojson
let storage_class_of_yojson = string_of_yojson

let object_ac_l_of_yojson (tree : t) path =
  ((match tree with
    | `String "aws-exec-read" -> Aws_exec_read
    | `String "bucket-owner-full-control" -> Bucket_owner_full_control
    | `String "bucket-owner-read" -> Bucket_owner_read
    | `String "authenticated-read" -> Authenticated_read
    | `String "public-read-write" -> Public_read_write
    | `String "public-read" -> Public_read
    | `String "private" -> Private
    | `String value -> raise (deserialize_unknown_enum_value_error path "ObjectACL" value)
    | _ -> raise (deserialize_wrong_type_error path "ObjectACL")
     : object_ac_l)
    : object_ac_l)

let audit_destination_ar_n_of_yojson = string_of_yojson

let case_sensitivity_of_yojson (tree : t) path =
  ((match tree with
    | `String "CaseSensitive" -> CaseSensitive
    | `String "ClientSpecified" -> ClientSpecified
    | `String value -> raise (deserialize_unknown_enum_value_error path "CaseSensitivity" value)
    | _ -> raise (deserialize_wrong_type_error path "CaseSensitivity")
     : case_sensitivity)
    : case_sensitivity)

let file_share_name_of_yojson = string_of_yojson
let cache_stale_timeout_in_seconds_of_yojson = int_of_yojson

let cache_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cache_stale_timeout_in_seconds =
       option_of_yojson
         (value_for_key cache_stale_timeout_in_seconds_of_yojson "CacheStaleTimeoutInSeconds")
         _list path;
   }
    : cache_attributes)

let notification_policy_of_yojson = string_of_yojson

let update_smb_file_share_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     oplocks_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "OplocksEnabled") _list path;
     notification_policy =
       option_of_yojson
         (value_for_key notification_policy_of_yojson "NotificationPolicy")
         _list path;
     cache_attributes =
       option_of_yojson (value_for_key cache_attributes_of_yojson "CacheAttributes") _list path;
     file_share_name =
       option_of_yojson (value_for_key file_share_name_of_yojson "FileShareName") _list path;
     case_sensitivity =
       option_of_yojson (value_for_key case_sensitivity_of_yojson "CaseSensitivity") _list path;
     audit_destination_ar_n =
       option_of_yojson
         (value_for_key audit_destination_ar_n_of_yojson "AuditDestinationARN")
         _list path;
     invalid_user_list =
       option_of_yojson (value_for_key user_list_of_yojson "InvalidUserList") _list path;
     valid_user_list =
       option_of_yojson (value_for_key user_list_of_yojson "ValidUserList") _list path;
     admin_user_list =
       option_of_yojson (value_for_key user_list_of_yojson "AdminUserList") _list path;
     access_based_enumeration =
       option_of_yojson (value_for_key boolean__of_yojson "AccessBasedEnumeration") _list path;
     smbacl_enabled = option_of_yojson (value_for_key boolean__of_yojson "SMBACLEnabled") _list path;
     requester_pays = option_of_yojson (value_for_key boolean__of_yojson "RequesterPays") _list path;
     guess_mime_type_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "GuessMIMETypeEnabled") _list path;
     read_only = option_of_yojson (value_for_key boolean__of_yojson "ReadOnly") _list path;
     object_ac_l = option_of_yojson (value_for_key object_ac_l_of_yojson "ObjectACL") _list path;
     default_storage_class =
       option_of_yojson (value_for_key storage_class_of_yojson "DefaultStorageClass") _list path;
     kms_key = option_of_yojson (value_for_key kms_key_of_yojson "KMSKey") _list path;
     kms_encrypted = option_of_yojson (value_for_key boolean__of_yojson "KMSEncrypted") _list path;
     encryption_type =
       option_of_yojson (value_for_key encryption_type_of_yojson "EncryptionType") _list path;
     file_share_ar_n = value_for_key file_share_ar_n_of_yojson "FileShareARN" _list path;
   }
    : update_smb_file_share_input)

let update_nfs_file_share_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_share_ar_n =
       option_of_yojson (value_for_key file_share_ar_n_of_yojson "FileShareARN") _list path;
   }
    : update_nfs_file_share_output)

let permission_mode_of_yojson = string_of_yojson
let permission_id_of_yojson = long_of_yojson

let nfs_file_share_defaults_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     owner_id = option_of_yojson (value_for_key permission_id_of_yojson "OwnerId") _list path;
     group_id = option_of_yojson (value_for_key permission_id_of_yojson "GroupId") _list path;
     directory_mode =
       option_of_yojson (value_for_key permission_mode_of_yojson "DirectoryMode") _list path;
     file_mode = option_of_yojson (value_for_key permission_mode_of_yojson "FileMode") _list path;
   }
    : nfs_file_share_defaults)

let ipv4_or_ipv6_address_cid_r_of_yojson = string_of_yojson

let file_share_client_list_of_yojson tree path =
  list_of_yojson ipv4_or_ipv6_address_cid_r_of_yojson tree path

let squash_of_yojson = string_of_yojson

let update_nfs_file_share_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     audit_destination_ar_n =
       option_of_yojson
         (value_for_key audit_destination_ar_n_of_yojson "AuditDestinationARN")
         _list path;
     notification_policy =
       option_of_yojson
         (value_for_key notification_policy_of_yojson "NotificationPolicy")
         _list path;
     cache_attributes =
       option_of_yojson (value_for_key cache_attributes_of_yojson "CacheAttributes") _list path;
     file_share_name =
       option_of_yojson (value_for_key file_share_name_of_yojson "FileShareName") _list path;
     requester_pays = option_of_yojson (value_for_key boolean__of_yojson "RequesterPays") _list path;
     guess_mime_type_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "GuessMIMETypeEnabled") _list path;
     read_only = option_of_yojson (value_for_key boolean__of_yojson "ReadOnly") _list path;
     squash = option_of_yojson (value_for_key squash_of_yojson "Squash") _list path;
     client_list =
       option_of_yojson (value_for_key file_share_client_list_of_yojson "ClientList") _list path;
     object_ac_l = option_of_yojson (value_for_key object_ac_l_of_yojson "ObjectACL") _list path;
     default_storage_class =
       option_of_yojson (value_for_key storage_class_of_yojson "DefaultStorageClass") _list path;
     nfs_file_share_defaults =
       option_of_yojson
         (value_for_key nfs_file_share_defaults_of_yojson "NFSFileShareDefaults")
         _list path;
     kms_key = option_of_yojson (value_for_key kms_key_of_yojson "KMSKey") _list path;
     kms_encrypted = option_of_yojson (value_for_key boolean__of_yojson "KMSEncrypted") _list path;
     encryption_type =
       option_of_yojson (value_for_key encryption_type_of_yojson "EncryptionType") _list path;
     file_share_ar_n = value_for_key file_share_ar_n_of_yojson "FileShareARN" _list path;
   }
    : update_nfs_file_share_input)

let update_maintenance_start_time_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : update_maintenance_start_time_output)

let minute_of_hour_of_yojson = int_of_yojson
let day_of_week_of_yojson = int_of_yojson
let day_of_month_of_yojson = int_of_yojson

let automatic_update_policy_of_yojson (tree : t) path =
  ((match tree with
    | `String "EMERGENCY_VERSIONS_ONLY" -> EMERGENCY_VERSIONS_ONLY
    | `String "ALL_VERSIONS" -> ALL_VERSIONS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AutomaticUpdatePolicy" value)
    | _ -> raise (deserialize_wrong_type_error path "AutomaticUpdatePolicy")
     : automatic_update_policy)
    : automatic_update_policy)

let software_update_preferences_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     automatic_update_policy =
       option_of_yojson
         (value_for_key automatic_update_policy_of_yojson "AutomaticUpdatePolicy")
         _list path;
   }
    : software_update_preferences)

let update_maintenance_start_time_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     software_update_preferences =
       option_of_yojson
         (value_for_key software_update_preferences_of_yojson "SoftwareUpdatePreferences")
         _list path;
     day_of_month = option_of_yojson (value_for_key day_of_month_of_yojson "DayOfMonth") _list path;
     day_of_week = option_of_yojson (value_for_key day_of_week_of_yojson "DayOfWeek") _list path;
     minute_of_hour =
       option_of_yojson (value_for_key minute_of_hour_of_yojson "MinuteOfHour") _list path;
     hour_of_day = option_of_yojson (value_for_key hour_of_day_of_yojson "HourOfDay") _list path;
     gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path;
   }
    : update_maintenance_start_time_input)

let update_gateway_software_now_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : update_gateway_software_now_output)

let update_gateway_software_now_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path }
    : update_gateway_software_now_input)

let update_gateway_information_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_name = option_of_yojson (value_for_key string__of_yojson "GatewayName") _list path;
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : update_gateway_information_output)

let gateway_name_of_yojson = string_of_yojson
let gateway_timezone_of_yojson = string_of_yojson
let cloud_watch_log_group_ar_n_of_yojson = string_of_yojson

let gateway_capacity_of_yojson (tree : t) path =
  ((match tree with
    | `String "Large" -> Large
    | `String "Medium" -> Medium
    | `String "Small" -> Small
    | `String value -> raise (deserialize_unknown_enum_value_error path "GatewayCapacity" value)
    | _ -> raise (deserialize_wrong_type_error path "GatewayCapacity")
     : gateway_capacity)
    : gateway_capacity)

let update_gateway_information_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_capacity =
       option_of_yojson (value_for_key gateway_capacity_of_yojson "GatewayCapacity") _list path;
     cloud_watch_log_group_ar_n =
       option_of_yojson
         (value_for_key cloud_watch_log_group_ar_n_of_yojson "CloudWatchLogGroupARN")
         _list path;
     gateway_timezone =
       option_of_yojson (value_for_key gateway_timezone_of_yojson "GatewayTimezone") _list path;
     gateway_name = option_of_yojson (value_for_key gateway_name_of_yojson "GatewayName") _list path;
     gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path;
   }
    : update_gateway_information_input)

let file_system_association_ar_n_of_yojson = string_of_yojson

let update_file_system_association_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_system_association_ar_n =
       option_of_yojson
         (value_for_key file_system_association_ar_n_of_yojson "FileSystemAssociationARN")
         _list path;
   }
    : update_file_system_association_output)

let domain_user_name_of_yojson = string_of_yojson
let domain_user_password_of_yojson = string_of_yojson

let update_file_system_association_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cache_attributes =
       option_of_yojson (value_for_key cache_attributes_of_yojson "CacheAttributes") _list path;
     audit_destination_ar_n =
       option_of_yojson
         (value_for_key audit_destination_ar_n_of_yojson "AuditDestinationARN")
         _list path;
     password =
       option_of_yojson (value_for_key domain_user_password_of_yojson "Password") _list path;
     user_name = option_of_yojson (value_for_key domain_user_name_of_yojson "UserName") _list path;
     file_system_association_ar_n =
       value_for_key file_system_association_ar_n_of_yojson "FileSystemAssociationARN" _list path;
   }
    : update_file_system_association_input)

let iqn_name_of_yojson = string_of_yojson

let update_chap_credentials_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     initiator_name = option_of_yojson (value_for_key iqn_name_of_yojson "InitiatorName") _list path;
     target_ar_n = option_of_yojson (value_for_key target_ar_n_of_yojson "TargetARN") _list path;
   }
    : update_chap_credentials_output)

let chap_secret_of_yojson = string_of_yojson

let update_chap_credentials_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     secret_to_authenticate_target =
       option_of_yojson
         (value_for_key chap_secret_of_yojson "SecretToAuthenticateTarget")
         _list path;
     initiator_name = value_for_key iqn_name_of_yojson "InitiatorName" _list path;
     secret_to_authenticate_initiator =
       value_for_key chap_secret_of_yojson "SecretToAuthenticateInitiator" _list path;
     target_ar_n = value_for_key target_ar_n_of_yojson "TargetARN" _list path;
   }
    : update_chap_credentials_input)

let update_bandwidth_rate_limit_schedule_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : update_bandwidth_rate_limit_schedule_output)

let days_of_week_of_yojson tree path = list_of_yojson day_of_week_of_yojson tree path
let bandwidth_upload_rate_limit_of_yojson = long_of_yojson
let bandwidth_download_rate_limit_of_yojson = long_of_yojson

let bandwidth_rate_limit_interval_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     average_download_rate_limit_in_bits_per_sec =
       option_of_yojson
         (value_for_key bandwidth_download_rate_limit_of_yojson
            "AverageDownloadRateLimitInBitsPerSec")
         _list path;
     average_upload_rate_limit_in_bits_per_sec =
       option_of_yojson
         (value_for_key bandwidth_upload_rate_limit_of_yojson "AverageUploadRateLimitInBitsPerSec")
         _list path;
     days_of_week = value_for_key days_of_week_of_yojson "DaysOfWeek" _list path;
     end_minute_of_hour = value_for_key minute_of_hour_of_yojson "EndMinuteOfHour" _list path;
     end_hour_of_day = value_for_key hour_of_day_of_yojson "EndHourOfDay" _list path;
     start_minute_of_hour = value_for_key minute_of_hour_of_yojson "StartMinuteOfHour" _list path;
     start_hour_of_day = value_for_key hour_of_day_of_yojson "StartHourOfDay" _list path;
   }
    : bandwidth_rate_limit_interval)

let bandwidth_rate_limit_intervals_of_yojson tree path =
  list_of_yojson bandwidth_rate_limit_interval_of_yojson tree path

let update_bandwidth_rate_limit_schedule_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bandwidth_rate_limit_intervals =
       value_for_key bandwidth_rate_limit_intervals_of_yojson "BandwidthRateLimitIntervals" _list
         path;
     gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path;
   }
    : update_bandwidth_rate_limit_schedule_input)

let update_bandwidth_rate_limit_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : update_bandwidth_rate_limit_output)

let update_bandwidth_rate_limit_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     average_download_rate_limit_in_bits_per_sec =
       option_of_yojson
         (value_for_key bandwidth_download_rate_limit_of_yojson
            "AverageDownloadRateLimitInBitsPerSec")
         _list path;
     average_upload_rate_limit_in_bits_per_sec =
       option_of_yojson
         (value_for_key bandwidth_upload_rate_limit_of_yojson "AverageUploadRateLimitInBitsPerSec")
         _list path;
     gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path;
   }
    : update_bandwidth_rate_limit_input)

let update_automatic_tape_creation_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : update_automatic_tape_creation_policy_output)

let tape_barcode_prefix_of_yojson = string_of_yojson
let pool_id_of_yojson = string_of_yojson
let tape_size_of_yojson = long_of_yojson
let minimum_num_tapes_of_yojson = int_of_yojson

let automatic_tape_creation_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     worm = option_of_yojson (value_for_key boolean2_of_yojson "Worm") _list path;
     minimum_num_tapes = value_for_key minimum_num_tapes_of_yojson "MinimumNumTapes" _list path;
     tape_size_in_bytes = value_for_key tape_size_of_yojson "TapeSizeInBytes" _list path;
     pool_id = value_for_key pool_id_of_yojson "PoolId" _list path;
     tape_barcode_prefix =
       value_for_key tape_barcode_prefix_of_yojson "TapeBarcodePrefix" _list path;
   }
    : automatic_tape_creation_rule)

let automatic_tape_creation_rules_of_yojson tree path =
  list_of_yojson automatic_tape_creation_rule_of_yojson tree path

let update_automatic_tape_creation_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path;
     automatic_tape_creation_rules =
       value_for_key automatic_tape_creation_rules_of_yojson "AutomaticTapeCreationRules" _list path;
   }
    : update_automatic_tape_creation_policy_input)

let timeout_in_seconds_of_yojson = int_of_yojson
let time_of_yojson = timestamp_epoch_seconds_of_yojson
let target_name_of_yojson = string_of_yojson
let tape_ar_n_of_yojson = string_of_yojson
let tape_barcode_of_yojson = string_of_yojson
let tape_status_of_yojson = string_of_yojson
let double_object_of_yojson = double_of_yojson
let tape_usage_of_yojson = long_of_yojson

let tape_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pool_entry_date = option_of_yojson (value_for_key time_of_yojson "PoolEntryDate") _list path;
     retention_start_date =
       option_of_yojson (value_for_key time_of_yojson "RetentionStartDate") _list path;
     worm = option_of_yojson (value_for_key boolean2_of_yojson "Worm") _list path;
     pool_id = option_of_yojson (value_for_key pool_id_of_yojson "PoolId") _list path;
     kms_key = option_of_yojson (value_for_key kms_key_of_yojson "KMSKey") _list path;
     tape_used_in_bytes =
       option_of_yojson (value_for_key tape_usage_of_yojson "TapeUsedInBytes") _list path;
     progress = option_of_yojson (value_for_key double_object_of_yojson "Progress") _list path;
     vtl_device = option_of_yojson (value_for_key vtl_device_ar_n_of_yojson "VTLDevice") _list path;
     tape_status = option_of_yojson (value_for_key tape_status_of_yojson "TapeStatus") _list path;
     tape_size_in_bytes =
       option_of_yojson (value_for_key tape_size_of_yojson "TapeSizeInBytes") _list path;
     tape_created_date =
       option_of_yojson (value_for_key time_of_yojson "TapeCreatedDate") _list path;
     tape_barcode = option_of_yojson (value_for_key tape_barcode_of_yojson "TapeBarcode") _list path;
     tape_ar_n = option_of_yojson (value_for_key tape_ar_n_of_yojson "TapeARN") _list path;
   }
    : tape)

let tapes_of_yojson tree path = list_of_yojson tape_of_yojson tree path

let tape_storage_class_of_yojson (tree : t) path =
  ((match tree with
    | `String "GLACIER" -> GLACIER
    | `String "DEEP_ARCHIVE" -> DEEP_ARCHIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "TapeStorageClass" value)
    | _ -> raise (deserialize_wrong_type_error path "TapeStorageClass")
     : tape_storage_class)
    : tape_storage_class)

let tape_recovery_point_status_of_yojson = string_of_yojson

let tape_recovery_point_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tape_status =
       option_of_yojson (value_for_key tape_recovery_point_status_of_yojson "TapeStatus") _list path;
     tape_size_in_bytes =
       option_of_yojson (value_for_key tape_size_of_yojson "TapeSizeInBytes") _list path;
     tape_recovery_point_time =
       option_of_yojson (value_for_key time_of_yojson "TapeRecoveryPointTime") _list path;
     tape_ar_n = option_of_yojson (value_for_key tape_ar_n_of_yojson "TapeARN") _list path;
   }
    : tape_recovery_point_info)

let tape_recovery_point_infos_of_yojson tree path =
  list_of_yojson tape_recovery_point_info_of_yojson tree path

let tape_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pool_entry_date = option_of_yojson (value_for_key time_of_yojson "PoolEntryDate") _list path;
     retention_start_date =
       option_of_yojson (value_for_key time_of_yojson "RetentionStartDate") _list path;
     pool_id = option_of_yojson (value_for_key pool_id_of_yojson "PoolId") _list path;
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
     tape_status = option_of_yojson (value_for_key tape_status_of_yojson "TapeStatus") _list path;
     tape_size_in_bytes =
       option_of_yojson (value_for_key tape_size_of_yojson "TapeSizeInBytes") _list path;
     tape_barcode = option_of_yojson (value_for_key tape_barcode_of_yojson "TapeBarcode") _list path;
     tape_ar_n = option_of_yojson (value_for_key tape_ar_n_of_yojson "TapeARN") _list path;
   }
    : tape_info)

let tape_infos_of_yojson tree path = list_of_yojson tape_info_of_yojson tree path
let tape_drive_type_of_yojson = string_of_yojson
let tape_archive_status_of_yojson = string_of_yojson

let tape_archive_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pool_entry_date = option_of_yojson (value_for_key time_of_yojson "PoolEntryDate") _list path;
     retention_start_date =
       option_of_yojson (value_for_key time_of_yojson "RetentionStartDate") _list path;
     worm = option_of_yojson (value_for_key boolean2_of_yojson "Worm") _list path;
     pool_id = option_of_yojson (value_for_key pool_id_of_yojson "PoolId") _list path;
     kms_key = option_of_yojson (value_for_key kms_key_of_yojson "KMSKey") _list path;
     tape_used_in_bytes =
       option_of_yojson (value_for_key tape_usage_of_yojson "TapeUsedInBytes") _list path;
     tape_status =
       option_of_yojson (value_for_key tape_archive_status_of_yojson "TapeStatus") _list path;
     retrieved_to = option_of_yojson (value_for_key gateway_ar_n_of_yojson "RetrievedTo") _list path;
     completion_time = option_of_yojson (value_for_key time_of_yojson "CompletionTime") _list path;
     tape_size_in_bytes =
       option_of_yojson (value_for_key tape_size_of_yojson "TapeSizeInBytes") _list path;
     tape_created_date =
       option_of_yojson (value_for_key time_of_yojson "TapeCreatedDate") _list path;
     tape_barcode = option_of_yojson (value_for_key tape_barcode_of_yojson "TapeBarcode") _list path;
     tape_ar_n = option_of_yojson (value_for_key tape_ar_n_of_yojson "TapeARN") _list path;
   }
    : tape_archive)

let tape_archives_of_yojson tree path = list_of_yojson tape_archive_of_yojson tree path
let tape_ar_ns_of_yojson tree path = list_of_yojson tape_ar_n_of_yojson tree path
let tag_keys_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let supported_gateway_capacities_of_yojson tree path =
  list_of_yojson gateway_capacity_of_yojson tree path

let disk_id_of_yojson = string_of_yojson
let snapshot_id_of_yojson = string_of_yojson
let created_date_of_yojson = timestamp_epoch_seconds_of_yojson

let storedi_scsi_volume_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_name = option_of_yojson (value_for_key target_name_of_yojson "TargetName") _list path;
     kms_key = option_of_yojson (value_for_key kms_key_of_yojson "KMSKey") _list path;
     volume_used_in_bytes =
       option_of_yojson
         (value_for_key volume_used_in_bytes_of_yojson "VolumeUsedInBytes")
         _list path;
     created_date = option_of_yojson (value_for_key created_date_of_yojson "CreatedDate") _list path;
     volumei_scsi_attributes =
       option_of_yojson
         (value_for_key volumei_scsi_attributes_of_yojson "VolumeiSCSIAttributes")
         _list path;
     preserved_existing_data =
       option_of_yojson (value_for_key boolean2_of_yojson "PreservedExistingData") _list path;
     source_snapshot_id =
       option_of_yojson (value_for_key snapshot_id_of_yojson "SourceSnapshotId") _list path;
     volume_disk_id = option_of_yojson (value_for_key disk_id_of_yojson "VolumeDiskId") _list path;
     volume_progress =
       option_of_yojson (value_for_key double_object_of_yojson "VolumeProgress") _list path;
     volume_size_in_bytes =
       option_of_yojson (value_for_key long_of_yojson "VolumeSizeInBytes") _list path;
     volume_attachment_status =
       option_of_yojson
         (value_for_key volume_attachment_status_of_yojson "VolumeAttachmentStatus")
         _list path;
     volume_status =
       option_of_yojson (value_for_key volume_status_of_yojson "VolumeStatus") _list path;
     volume_type = option_of_yojson (value_for_key volume_type_of_yojson "VolumeType") _list path;
     volume_id = option_of_yojson (value_for_key volume_id_of_yojson "VolumeId") _list path;
     volume_ar_n = option_of_yojson (value_for_key volume_ar_n_of_yojson "VolumeARN") _list path;
   }
    : storedi_scsi_volume)

let storedi_scsi_volumes_of_yojson tree path =
  list_of_yojson storedi_scsi_volume_of_yojson tree path

let start_gateway_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : start_gateway_output)

let start_gateway_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path }
    : start_gateway_input)

let cache_report_ar_n_of_yojson = string_of_yojson

let start_cache_report_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cache_report_ar_n =
       option_of_yojson (value_for_key cache_report_ar_n_of_yojson "CacheReportARN") _list path;
   }
    : start_cache_report_output)

let role_of_yojson = string_of_yojson
let location_ar_n_of_yojson = string_of_yojson
let region_id_of_yojson = string_of_yojson
let dns_host_name_of_yojson = string_of_yojson

let cache_report_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "UploadFailureReason" -> UploadFailureReason
    | `String "UploadState" -> UploadState
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "CacheReportFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "CacheReportFilterName")
     : cache_report_filter_name)
    : cache_report_filter_name)

let cache_report_filter_value_of_yojson = string_of_yojson

let cache_report_filter_values_of_yojson tree path =
  list_of_yojson cache_report_filter_value_of_yojson tree path

let cache_report_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     values = value_for_key cache_report_filter_values_of_yojson "Values" _list path;
     name = value_for_key cache_report_filter_name_of_yojson "Name" _list path;
   }
    : cache_report_filter)

let cache_report_filter_list_of_yojson tree path =
  list_of_yojson cache_report_filter_of_yojson tree path

let client_token_of_yojson = string_of_yojson

let start_cache_report_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
     exclusion_filters =
       option_of_yojson
         (value_for_key cache_report_filter_list_of_yojson "ExclusionFilters")
         _list path;
     inclusion_filters =
       option_of_yojson
         (value_for_key cache_report_filter_list_of_yojson "InclusionFilters")
         _list path;
     vpc_endpoint_dns_name =
       option_of_yojson (value_for_key dns_host_name_of_yojson "VPCEndpointDNSName") _list path;
     bucket_region = value_for_key region_id_of_yojson "BucketRegion" _list path;
     location_ar_n = value_for_key location_ar_n_of_yojson "LocationARN" _list path;
     role = value_for_key role_of_yojson "Role" _list path;
     file_share_ar_n = value_for_key file_share_ar_n_of_yojson "FileShareARN" _list path;
   }
    : start_cache_report_input)

let start_availability_monitor_test_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : start_availability_monitor_test_output)

let start_availability_monitor_test_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path }
    : start_availability_monitor_test_input)

let shutdown_gateway_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : shutdown_gateway_output)

let shutdown_gateway_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path }
    : shutdown_gateway_input)

let set_smb_guest_password_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : set_smb_guest_password_output)

let smb_guest_password_of_yojson = string_of_yojson

let set_smb_guest_password_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     password = value_for_key smb_guest_password_of_yojson "Password" _list path;
     gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path;
   }
    : set_smb_guest_password_input)

let set_local_console_password_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : set_local_console_password_output)

let local_console_password_of_yojson = string_of_yojson

let set_local_console_password_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     local_console_password =
       value_for_key local_console_password_of_yojson "LocalConsolePassword" _list path;
     gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path;
   }
    : set_local_console_password_input)

let retrieve_tape_recovery_point_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tape_ar_n = option_of_yojson (value_for_key tape_ar_n_of_yojson "TapeARN") _list path }
    : retrieve_tape_recovery_point_output)

let retrieve_tape_recovery_point_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path;
     tape_ar_n = value_for_key tape_ar_n_of_yojson "TapeARN" _list path;
   }
    : retrieve_tape_recovery_point_input)

let retrieve_tape_archive_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tape_ar_n = option_of_yojson (value_for_key tape_ar_n_of_yojson "TapeARN") _list path }
    : retrieve_tape_archive_output)

let retrieve_tape_archive_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path;
     tape_ar_n = value_for_key tape_ar_n_of_yojson "TapeARN" _list path;
   }
    : retrieve_tape_archive_input)

let reset_cache_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : reset_cache_output)

let reset_cache_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path }
    : reset_cache_input)

let resource_ar_n_of_yojson = string_of_yojson

let remove_tags_from_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n =
       option_of_yojson (value_for_key resource_ar_n_of_yojson "ResourceARN") _list path;
   }
    : remove_tags_from_resource_output)

let remove_tags_from_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_keys_of_yojson "TagKeys" _list path;
     resource_ar_n = value_for_key resource_ar_n_of_yojson "ResourceARN" _list path;
   }
    : remove_tags_from_resource_input)

let notification_id_of_yojson = string_of_yojson

let refresh_cache_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     notification_id =
       option_of_yojson (value_for_key notification_id_of_yojson "NotificationId") _list path;
     file_share_ar_n =
       option_of_yojson (value_for_key file_share_ar_n_of_yojson "FileShareARN") _list path;
   }
    : refresh_cache_output)

let folder_of_yojson = string_of_yojson
let folder_list_of_yojson tree path = list_of_yojson folder_of_yojson tree path

let refresh_cache_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recursive = option_of_yojson (value_for_key boolean__of_yojson "Recursive") _list path;
     folder_list = option_of_yojson (value_for_key folder_list_of_yojson "FolderList") _list path;
     file_share_ar_n = value_for_key file_share_ar_n_of_yojson "FileShareARN" _list path;
   }
    : refresh_cache_input)

let notify_when_uploaded_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     notification_id =
       option_of_yojson (value_for_key notification_id_of_yojson "NotificationId") _list path;
     file_share_ar_n =
       option_of_yojson (value_for_key file_share_ar_n_of_yojson "FileShareARN") _list path;
   }
    : notify_when_uploaded_output)

let notify_when_uploaded_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ file_share_ar_n = value_for_key file_share_ar_n_of_yojson "FileShareARN" _list path }
    : notify_when_uploaded_input)

let marker_of_yojson = string_of_yojson

let list_volumes_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     volume_infos = option_of_yojson (value_for_key volume_infos_of_yojson "VolumeInfos") _list path;
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : list_volumes_output)

let list_volumes_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key positive_int_object_of_yojson "Limit") _list path;
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : list_volumes_input)

let list_volume_recovery_points_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     volume_recovery_point_infos =
       option_of_yojson
         (value_for_key volume_recovery_point_infos_of_yojson "VolumeRecoveryPointInfos")
         _list path;
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : list_volume_recovery_points_output)

let list_volume_recovery_points_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path }
    : list_volume_recovery_points_input)

let initiator_of_yojson = string_of_yojson
let initiators_of_yojson tree path = list_of_yojson initiator_of_yojson tree path

let list_volume_initiators_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ initiators = option_of_yojson (value_for_key initiators_of_yojson "Initiators") _list path }
    : list_volume_initiators_output)

let list_volume_initiators_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ volume_ar_n = value_for_key volume_ar_n_of_yojson "VolumeARN" _list path }
    : list_volume_initiators_input)

let list_tapes_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     tape_infos = option_of_yojson (value_for_key tape_infos_of_yojson "TapeInfos") _list path;
   }
    : list_tapes_output)

let list_tapes_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key positive_int_object_of_yojson "Limit") _list path;
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     tape_ar_ns = option_of_yojson (value_for_key tape_ar_ns_of_yojson "TapeARNs") _list path;
   }
    : list_tapes_input)

let pool_ar_n_of_yojson = string_of_yojson
let pool_name_of_yojson = string_of_yojson

let retention_lock_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "GOVERNANCE" -> GOVERNANCE
    | `String "COMPLIANCE" -> COMPLIANCE
    | `String value -> raise (deserialize_unknown_enum_value_error path "RetentionLockType" value)
    | _ -> raise (deserialize_wrong_type_error path "RetentionLockType")
     : retention_lock_type)
    : retention_lock_type)

let retention_lock_time_in_days_of_yojson = int_of_yojson

let pool_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DELETED" -> DELETED
    | `String "ACTIVE" -> ACTIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "PoolStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "PoolStatus")
     : pool_status)
    : pool_status)

let pool_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     pool_status = option_of_yojson (value_for_key pool_status_of_yojson "PoolStatus") _list path;
     retention_lock_time_in_days =
       option_of_yojson
         (value_for_key retention_lock_time_in_days_of_yojson "RetentionLockTimeInDays")
         _list path;
     retention_lock_type =
       option_of_yojson (value_for_key retention_lock_type_of_yojson "RetentionLockType") _list path;
     storage_class =
       option_of_yojson (value_for_key tape_storage_class_of_yojson "StorageClass") _list path;
     pool_name = option_of_yojson (value_for_key pool_name_of_yojson "PoolName") _list path;
     pool_ar_n = option_of_yojson (value_for_key pool_ar_n_of_yojson "PoolARN") _list path;
   }
    : pool_info)

let pool_infos_of_yojson tree path = list_of_yojson pool_info_of_yojson tree path

let list_tape_pools_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     pool_infos = option_of_yojson (value_for_key pool_infos_of_yojson "PoolInfos") _list path;
   }
    : list_tape_pools_output)

let pool_ar_ns_of_yojson tree path = list_of_yojson pool_ar_n_of_yojson tree path

let list_tape_pools_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key positive_int_object_of_yojson "Limit") _list path;
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     pool_ar_ns = option_of_yojson (value_for_key pool_ar_ns_of_yojson "PoolARNs") _list path;
   }
    : list_tape_pools_input)

let list_tags_for_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     resource_ar_n =
       option_of_yojson (value_for_key resource_ar_n_of_yojson "ResourceARN") _list path;
   }
    : list_tags_for_resource_output)

let list_tags_for_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key positive_int_object_of_yojson "Limit") _list path;
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     resource_ar_n = value_for_key resource_ar_n_of_yojson "ResourceARN" _list path;
   }
    : list_tags_for_resource_input)

let disk_allocation_type_of_yojson = string_of_yojson
let disk_attribute_of_yojson = string_of_yojson
let disk_attribute_list_of_yojson tree path = list_of_yojson disk_attribute_of_yojson tree path

let disk_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     disk_attribute_list =
       option_of_yojson (value_for_key disk_attribute_list_of_yojson "DiskAttributeList") _list path;
     disk_allocation_resource =
       option_of_yojson (value_for_key string__of_yojson "DiskAllocationResource") _list path;
     disk_allocation_type =
       option_of_yojson
         (value_for_key disk_allocation_type_of_yojson "DiskAllocationType")
         _list path;
     disk_size_in_bytes =
       option_of_yojson (value_for_key long_of_yojson "DiskSizeInBytes") _list path;
     disk_status = option_of_yojson (value_for_key string__of_yojson "DiskStatus") _list path;
     disk_node = option_of_yojson (value_for_key string__of_yojson "DiskNode") _list path;
     disk_path = option_of_yojson (value_for_key string__of_yojson "DiskPath") _list path;
     disk_id = option_of_yojson (value_for_key disk_id_of_yojson "DiskId") _list path;
   }
    : disk)

let disks_of_yojson tree path = list_of_yojson disk_of_yojson tree path

let list_local_disks_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     disks = option_of_yojson (value_for_key disks_of_yojson "Disks") _list path;
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : list_local_disks_output)

let list_local_disks_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path }
    : list_local_disks_input)

let gateway_type_of_yojson = string_of_yojson
let gateway_operational_state_of_yojson = string_of_yojson
let ec2_instance_id_of_yojson = string_of_yojson
let ec2_instance_region_of_yojson = string_of_yojson

let host_environment_of_yojson (tree : t) path =
  ((match tree with
    | `String "SNOWBALL" -> SNOWBALL
    | `String "OTHER" -> OTHER
    | `String "KVM" -> KVM
    | `String "EC2" -> EC2
    | `String "HYPER-V" -> HYPER_V
    | `String "VMWARE" -> VMWARE
    | `String value -> raise (deserialize_unknown_enum_value_error path "HostEnvironment" value)
    | _ -> raise (deserialize_wrong_type_error path "HostEnvironment")
     : host_environment)
    : host_environment)

let host_environment_id_of_yojson = string_of_yojson
let deprecation_date_of_yojson = string_of_yojson
let software_version_of_yojson = string_of_yojson

let gateway_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     software_version =
       option_of_yojson (value_for_key software_version_of_yojson "SoftwareVersion") _list path;
     deprecation_date =
       option_of_yojson (value_for_key deprecation_date_of_yojson "DeprecationDate") _list path;
     host_environment_id =
       option_of_yojson (value_for_key host_environment_id_of_yojson "HostEnvironmentId") _list path;
     host_environment =
       option_of_yojson (value_for_key host_environment_of_yojson "HostEnvironment") _list path;
     ec2_instance_region =
       option_of_yojson (value_for_key ec2_instance_region_of_yojson "Ec2InstanceRegion") _list path;
     ec2_instance_id =
       option_of_yojson (value_for_key ec2_instance_id_of_yojson "Ec2InstanceId") _list path;
     gateway_name = option_of_yojson (value_for_key string__of_yojson "GatewayName") _list path;
     gateway_operational_state =
       option_of_yojson
         (value_for_key gateway_operational_state_of_yojson "GatewayOperationalState")
         _list path;
     gateway_type = option_of_yojson (value_for_key gateway_type_of_yojson "GatewayType") _list path;
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
     gateway_id = option_of_yojson (value_for_key gateway_id_of_yojson "GatewayId") _list path;
   }
    : gateway_info)

let gateways_of_yojson tree path = list_of_yojson gateway_info_of_yojson tree path

let list_gateways_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     gateways = option_of_yojson (value_for_key gateways_of_yojson "Gateways") _list path;
   }
    : list_gateways_output)

let list_gateways_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key positive_int_object_of_yojson "Limit") _list path;
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
   }
    : list_gateways_input)

let file_system_association_id_of_yojson = string_of_yojson
let file_system_association_status_of_yojson = string_of_yojson

let file_system_association_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
     file_system_association_status =
       option_of_yojson
         (value_for_key file_system_association_status_of_yojson "FileSystemAssociationStatus")
         _list path;
     file_system_association_ar_n =
       option_of_yojson
         (value_for_key file_system_association_ar_n_of_yojson "FileSystemAssociationARN")
         _list path;
     file_system_association_id =
       option_of_yojson
         (value_for_key file_system_association_id_of_yojson "FileSystemAssociationId")
         _list path;
   }
    : file_system_association_summary)

let file_system_association_summary_list_of_yojson tree path =
  list_of_yojson file_system_association_summary_of_yojson tree path

let list_file_system_associations_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_system_association_summary_list =
       option_of_yojson
         (value_for_key file_system_association_summary_list_of_yojson
            "FileSystemAssociationSummaryList")
         _list path;
     next_marker = option_of_yojson (value_for_key marker_of_yojson "NextMarker") _list path;
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
   }
    : list_file_system_associations_output)

let list_file_system_associations_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     limit = option_of_yojson (value_for_key positive_int_object_of_yojson "Limit") _list path;
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : list_file_system_associations_input)

let file_share_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SMB" -> SMB
    | `String "NFS" -> NFS
    | `String value -> raise (deserialize_unknown_enum_value_error path "FileShareType" value)
    | _ -> raise (deserialize_wrong_type_error path "FileShareType")
     : file_share_type)
    : file_share_type)

let file_share_id_of_yojson = string_of_yojson
let file_share_status_of_yojson = string_of_yojson

let file_share_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
     file_share_status =
       option_of_yojson (value_for_key file_share_status_of_yojson "FileShareStatus") _list path;
     file_share_id =
       option_of_yojson (value_for_key file_share_id_of_yojson "FileShareId") _list path;
     file_share_ar_n =
       option_of_yojson (value_for_key file_share_ar_n_of_yojson "FileShareARN") _list path;
     file_share_type =
       option_of_yojson (value_for_key file_share_type_of_yojson "FileShareType") _list path;
   }
    : file_share_info)

let file_share_info_list_of_yojson tree path = list_of_yojson file_share_info_of_yojson tree path

let list_file_shares_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_share_info_list =
       option_of_yojson
         (value_for_key file_share_info_list_of_yojson "FileShareInfoList")
         _list path;
     next_marker = option_of_yojson (value_for_key marker_of_yojson "NextMarker") _list path;
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
   }
    : list_file_shares_output)

let list_file_shares_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     limit = option_of_yojson (value_for_key positive_int_object_of_yojson "Limit") _list path;
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : list_file_shares_input)

let cache_report_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ERROR" -> ERROR
    | `String "FAILED" -> FAILED
    | `String "CANCELED" -> CANCELED
    | `String "COMPLETED" -> COMPLETED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "CacheReportStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "CacheReportStatus")
     : cache_report_status)
    : cache_report_status)

let report_completion_percent_of_yojson = int_of_yojson
let cache_report_name_of_yojson = string_of_yojson

let cache_report_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     report_name =
       option_of_yojson (value_for_key cache_report_name_of_yojson "ReportName") _list path;
     exclusion_filters =
       option_of_yojson
         (value_for_key cache_report_filter_list_of_yojson "ExclusionFilters")
         _list path;
     inclusion_filters =
       option_of_yojson
         (value_for_key cache_report_filter_list_of_yojson "InclusionFilters")
         _list path;
     start_time = option_of_yojson (value_for_key time_of_yojson "StartTime") _list path;
     location_ar_n =
       option_of_yojson (value_for_key location_ar_n_of_yojson "LocationARN") _list path;
     file_share_ar_n =
       option_of_yojson (value_for_key file_share_ar_n_of_yojson "FileShareARN") _list path;
     role = option_of_yojson (value_for_key role_of_yojson "Role") _list path;
     end_time = option_of_yojson (value_for_key time_of_yojson "EndTime") _list path;
     report_completion_percent =
       option_of_yojson
         (value_for_key report_completion_percent_of_yojson "ReportCompletionPercent")
         _list path;
     cache_report_status =
       option_of_yojson (value_for_key cache_report_status_of_yojson "CacheReportStatus") _list path;
     cache_report_ar_n =
       option_of_yojson (value_for_key cache_report_ar_n_of_yojson "CacheReportARN") _list path;
   }
    : cache_report_info)

let cache_report_list_of_yojson tree path = list_of_yojson cache_report_info_of_yojson tree path

let list_cache_reports_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     cache_report_list =
       option_of_yojson (value_for_key cache_report_list_of_yojson "CacheReportList") _list path;
   }
    : list_cache_reports_output)

let list_cache_reports_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path }
    : list_cache_reports_input)

let automatic_tape_creation_policy_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
     automatic_tape_creation_rules =
       option_of_yojson
         (value_for_key automatic_tape_creation_rules_of_yojson "AutomaticTapeCreationRules")
         _list path;
   }
    : automatic_tape_creation_policy_info)

let automatic_tape_creation_policy_infos_of_yojson tree path =
  list_of_yojson automatic_tape_creation_policy_info_of_yojson tree path

let list_automatic_tape_creation_policies_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     automatic_tape_creation_policy_infos =
       option_of_yojson
         (value_for_key automatic_tape_creation_policy_infos_of_yojson
            "AutomaticTapeCreationPolicyInfos")
         _list path;
   }
    : list_automatic_tape_creation_policies_output)

let list_automatic_tape_creation_policies_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : list_automatic_tape_creation_policies_input)

let active_directory_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "INSUFFICIENT_PERMISSIONS" -> INSUFFICIENT_PERMISSIONS
    | `String "UNKNOWN_ERROR" -> UNKNOWN_ERROR
    | `String "TIMEOUT" -> TIMEOUT
    | `String "NETWORK_ERROR" -> NETWORK_ERROR
    | `String "JOINING" -> JOINING
    | `String "JOINED" -> JOINED
    | `String "DETACHED" -> DETACHED
    | `String "ACCESS_DENIED" -> ACCESS_DENIED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ActiveDirectoryStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ActiveDirectoryStatus")
     : active_directory_status)
    : active_directory_status)

let join_domain_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     active_directory_status =
       option_of_yojson
         (value_for_key active_directory_status_of_yojson "ActiveDirectoryStatus")
         _list path;
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : join_domain_output)

let domain_name_of_yojson = string_of_yojson
let organizational_unit_of_yojson = string_of_yojson
let host_of_yojson = string_of_yojson
let hosts_of_yojson tree path = list_of_yojson host_of_yojson tree path

let join_domain_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     password = value_for_key domain_user_password_of_yojson "Password" _list path;
     user_name = value_for_key domain_user_name_of_yojson "UserName" _list path;
     timeout_in_seconds =
       option_of_yojson (value_for_key timeout_in_seconds_of_yojson "TimeoutInSeconds") _list path;
     domain_controllers =
       option_of_yojson (value_for_key hosts_of_yojson "DomainControllers") _list path;
     organizational_unit =
       option_of_yojson
         (value_for_key organizational_unit_of_yojson "OrganizationalUnit")
         _list path;
     domain_name = value_for_key domain_name_of_yojson "DomainName" _list path;
     gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path;
   }
    : join_domain_input)

let evict_files_failing_upload_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     notification_id =
       option_of_yojson (value_for_key string__of_yojson "NotificationId") _list path;
   }
    : evict_files_failing_upload_output)

let evict_files_failing_upload_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     force_remove = option_of_yojson (value_for_key boolean2_of_yojson "ForceRemove") _list path;
     file_share_ar_n = value_for_key file_share_ar_n_of_yojson "FileShareARN" _list path;
   }
    : evict_files_failing_upload_input)

let disassociate_file_system_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_system_association_ar_n =
       option_of_yojson
         (value_for_key file_system_association_ar_n_of_yojson "FileSystemAssociationARN")
         _list path;
   }
    : disassociate_file_system_output)

let disassociate_file_system_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     force_delete = option_of_yojson (value_for_key boolean2_of_yojson "ForceDelete") _list path;
     file_system_association_ar_n =
       value_for_key file_system_association_ar_n_of_yojson "FileSystemAssociationARN" _list path;
   }
    : disassociate_file_system_input)

let disable_gateway_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : disable_gateway_output)

let disable_gateway_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path }
    : disable_gateway_input)

let detach_volume_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ volume_ar_n = option_of_yojson (value_for_key volume_ar_n_of_yojson "VolumeARN") _list path }
    : detach_volume_output)

let detach_volume_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     force_detach = option_of_yojson (value_for_key boolean__of_yojson "ForceDetach") _list path;
     volume_ar_n = value_for_key volume_ar_n_of_yojson "VolumeARN" _list path;
   }
    : detach_volume_input)

let disk_ids_of_yojson tree path = list_of_yojson disk_id_of_yojson tree path

let describe_working_storage_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     working_storage_allocated_in_bytes =
       option_of_yojson (value_for_key long_of_yojson "WorkingStorageAllocatedInBytes") _list path;
     working_storage_used_in_bytes =
       option_of_yojson (value_for_key long_of_yojson "WorkingStorageUsedInBytes") _list path;
     disk_ids = option_of_yojson (value_for_key disk_ids_of_yojson "DiskIds") _list path;
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : describe_working_storage_output)

let describe_working_storage_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path }
    : describe_working_storage_input)

let describe_vtl_devices_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     vtl_devices = option_of_yojson (value_for_key vtl_devices_of_yojson "VTLDevices") _list path;
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : describe_vtl_devices_output)

let describe_vtl_devices_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key positive_int_object_of_yojson "Limit") _list path;
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     vtl_device_ar_ns =
       option_of_yojson (value_for_key vtl_device_ar_ns_of_yojson "VTLDeviceARNs") _list path;
     gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path;
   }
    : describe_vtl_devices_input)

let describe_upload_buffer_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     upload_buffer_allocated_in_bytes =
       option_of_yojson (value_for_key long_of_yojson "UploadBufferAllocatedInBytes") _list path;
     upload_buffer_used_in_bytes =
       option_of_yojson (value_for_key long_of_yojson "UploadBufferUsedInBytes") _list path;
     disk_ids = option_of_yojson (value_for_key disk_ids_of_yojson "DiskIds") _list path;
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : describe_upload_buffer_output)

let describe_upload_buffer_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path }
    : describe_upload_buffer_input)

let describe_tapes_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     tapes = option_of_yojson (value_for_key tapes_of_yojson "Tapes") _list path;
   }
    : describe_tapes_output)

let describe_tapes_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key positive_int_object_of_yojson "Limit") _list path;
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     tape_ar_ns = option_of_yojson (value_for_key tape_ar_ns_of_yojson "TapeARNs") _list path;
     gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path;
   }
    : describe_tapes_input)

let describe_tape_recovery_points_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     tape_recovery_point_infos =
       option_of_yojson
         (value_for_key tape_recovery_point_infos_of_yojson "TapeRecoveryPointInfos")
         _list path;
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : describe_tape_recovery_points_output)

let describe_tape_recovery_points_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key positive_int_object_of_yojson "Limit") _list path;
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path;
   }
    : describe_tape_recovery_points_input)

let describe_tape_archives_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     tape_archives =
       option_of_yojson (value_for_key tape_archives_of_yojson "TapeArchives") _list path;
   }
    : describe_tape_archives_output)

let describe_tape_archives_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     limit = option_of_yojson (value_for_key positive_int_object_of_yojson "Limit") _list path;
     marker = option_of_yojson (value_for_key marker_of_yojson "Marker") _list path;
     tape_ar_ns = option_of_yojson (value_for_key tape_ar_ns_of_yojson "TapeARNs") _list path;
   }
    : describe_tape_archives_input)

let describe_storedi_scsi_volumes_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     storedi_scsi_volumes =
       option_of_yojson
         (value_for_key storedi_scsi_volumes_of_yojson "StorediSCSIVolumes")
         _list path;
   }
    : describe_storedi_scsi_volumes_output)

let describe_storedi_scsi_volumes_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ volume_ar_ns = value_for_key volume_ar_ns_of_yojson "VolumeARNs" _list path }
    : describe_storedi_scsi_volumes_input)

let describe_snapshot_schedule_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     timezone = option_of_yojson (value_for_key gateway_timezone_of_yojson "Timezone") _list path;
     description = option_of_yojson (value_for_key description_of_yojson "Description") _list path;
     recurrence_in_hours =
       option_of_yojson (value_for_key recurrence_in_hours_of_yojson "RecurrenceInHours") _list path;
     start_at = option_of_yojson (value_for_key hour_of_day_of_yojson "StartAt") _list path;
     volume_ar_n = option_of_yojson (value_for_key volume_ar_n_of_yojson "VolumeARN") _list path;
   }
    : describe_snapshot_schedule_output)

let describe_snapshot_schedule_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ volume_ar_n = value_for_key volume_ar_n_of_yojson "VolumeARN" _list path }
    : describe_snapshot_schedule_input)

let describe_smb_settings_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     smb_local_groups =
       option_of_yojson (value_for_key smb_local_groups_of_yojson "SMBLocalGroups") _list path;
     file_shares_visible =
       option_of_yojson (value_for_key boolean__of_yojson "FileSharesVisible") _list path;
     smb_security_strategy =
       option_of_yojson
         (value_for_key smb_security_strategy_of_yojson "SMBSecurityStrategy")
         _list path;
     smb_guest_password_set =
       option_of_yojson (value_for_key boolean__of_yojson "SMBGuestPasswordSet") _list path;
     active_directory_status =
       option_of_yojson
         (value_for_key active_directory_status_of_yojson "ActiveDirectoryStatus")
         _list path;
     domain_name = option_of_yojson (value_for_key domain_name_of_yojson "DomainName") _list path;
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : describe_smb_settings_output)

let describe_smb_settings_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path }
    : describe_smb_settings_input)

let path_of_yojson = string_of_yojson
let authentication_of_yojson = string_of_yojson

let smb_file_share_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     oplocks_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "OplocksEnabled") _list path;
     bucket_region = option_of_yojson (value_for_key region_id_of_yojson "BucketRegion") _list path;
     vpc_endpoint_dns_name =
       option_of_yojson (value_for_key dns_host_name_of_yojson "VPCEndpointDNSName") _list path;
     notification_policy =
       option_of_yojson
         (value_for_key notification_policy_of_yojson "NotificationPolicy")
         _list path;
     cache_attributes =
       option_of_yojson (value_for_key cache_attributes_of_yojson "CacheAttributes") _list path;
     file_share_name =
       option_of_yojson (value_for_key file_share_name_of_yojson "FileShareName") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     case_sensitivity =
       option_of_yojson (value_for_key case_sensitivity_of_yojson "CaseSensitivity") _list path;
     authentication =
       option_of_yojson (value_for_key authentication_of_yojson "Authentication") _list path;
     audit_destination_ar_n =
       option_of_yojson
         (value_for_key audit_destination_ar_n_of_yojson "AuditDestinationARN")
         _list path;
     invalid_user_list =
       option_of_yojson (value_for_key user_list_of_yojson "InvalidUserList") _list path;
     valid_user_list =
       option_of_yojson (value_for_key user_list_of_yojson "ValidUserList") _list path;
     admin_user_list =
       option_of_yojson (value_for_key user_list_of_yojson "AdminUserList") _list path;
     access_based_enumeration =
       option_of_yojson (value_for_key boolean__of_yojson "AccessBasedEnumeration") _list path;
     smbacl_enabled = option_of_yojson (value_for_key boolean__of_yojson "SMBACLEnabled") _list path;
     requester_pays = option_of_yojson (value_for_key boolean__of_yojson "RequesterPays") _list path;
     guess_mime_type_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "GuessMIMETypeEnabled") _list path;
     read_only = option_of_yojson (value_for_key boolean__of_yojson "ReadOnly") _list path;
     object_ac_l = option_of_yojson (value_for_key object_ac_l_of_yojson "ObjectACL") _list path;
     default_storage_class =
       option_of_yojson (value_for_key storage_class_of_yojson "DefaultStorageClass") _list path;
     location_ar_n =
       option_of_yojson (value_for_key location_ar_n_of_yojson "LocationARN") _list path;
     role = option_of_yojson (value_for_key role_of_yojson "Role") _list path;
     path = option_of_yojson (value_for_key path_of_yojson "Path") _list path;
     kms_key = option_of_yojson (value_for_key kms_key_of_yojson "KMSKey") _list path;
     kms_encrypted = option_of_yojson (value_for_key boolean2_of_yojson "KMSEncrypted") _list path;
     encryption_type =
       option_of_yojson (value_for_key encryption_type_of_yojson "EncryptionType") _list path;
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
     file_share_status =
       option_of_yojson (value_for_key file_share_status_of_yojson "FileShareStatus") _list path;
     file_share_id =
       option_of_yojson (value_for_key file_share_id_of_yojson "FileShareId") _list path;
     file_share_ar_n =
       option_of_yojson (value_for_key file_share_ar_n_of_yojson "FileShareARN") _list path;
   }
    : smb_file_share_info)

let smb_file_share_info_list_of_yojson tree path =
  list_of_yojson smb_file_share_info_of_yojson tree path

let describe_smb_file_shares_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     smb_file_share_info_list =
       option_of_yojson
         (value_for_key smb_file_share_info_list_of_yojson "SMBFileShareInfoList")
         _list path;
   }
    : describe_smb_file_shares_output)

let file_share_arn_list_of_yojson tree path = list_of_yojson file_share_ar_n_of_yojson tree path

let describe_smb_file_shares_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_share_arn_list = value_for_key file_share_arn_list_of_yojson "FileShareARNList" _list path;
   }
    : describe_smb_file_shares_input)

let nfs_file_share_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     audit_destination_ar_n =
       option_of_yojson
         (value_for_key audit_destination_ar_n_of_yojson "AuditDestinationARN")
         _list path;
     bucket_region = option_of_yojson (value_for_key region_id_of_yojson "BucketRegion") _list path;
     vpc_endpoint_dns_name =
       option_of_yojson (value_for_key dns_host_name_of_yojson "VPCEndpointDNSName") _list path;
     notification_policy =
       option_of_yojson
         (value_for_key notification_policy_of_yojson "NotificationPolicy")
         _list path;
     cache_attributes =
       option_of_yojson (value_for_key cache_attributes_of_yojson "CacheAttributes") _list path;
     file_share_name =
       option_of_yojson (value_for_key file_share_name_of_yojson "FileShareName") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     requester_pays = option_of_yojson (value_for_key boolean__of_yojson "RequesterPays") _list path;
     guess_mime_type_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "GuessMIMETypeEnabled") _list path;
     read_only = option_of_yojson (value_for_key boolean__of_yojson "ReadOnly") _list path;
     squash = option_of_yojson (value_for_key squash_of_yojson "Squash") _list path;
     client_list =
       option_of_yojson (value_for_key file_share_client_list_of_yojson "ClientList") _list path;
     object_ac_l = option_of_yojson (value_for_key object_ac_l_of_yojson "ObjectACL") _list path;
     default_storage_class =
       option_of_yojson (value_for_key storage_class_of_yojson "DefaultStorageClass") _list path;
     location_ar_n =
       option_of_yojson (value_for_key location_ar_n_of_yojson "LocationARN") _list path;
     role = option_of_yojson (value_for_key role_of_yojson "Role") _list path;
     path = option_of_yojson (value_for_key path_of_yojson "Path") _list path;
     kms_key = option_of_yojson (value_for_key kms_key_of_yojson "KMSKey") _list path;
     kms_encrypted = option_of_yojson (value_for_key boolean2_of_yojson "KMSEncrypted") _list path;
     encryption_type =
       option_of_yojson (value_for_key encryption_type_of_yojson "EncryptionType") _list path;
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
     file_share_status =
       option_of_yojson (value_for_key file_share_status_of_yojson "FileShareStatus") _list path;
     file_share_id =
       option_of_yojson (value_for_key file_share_id_of_yojson "FileShareId") _list path;
     file_share_ar_n =
       option_of_yojson (value_for_key file_share_ar_n_of_yojson "FileShareARN") _list path;
     nfs_file_share_defaults =
       option_of_yojson
         (value_for_key nfs_file_share_defaults_of_yojson "NFSFileShareDefaults")
         _list path;
   }
    : nfs_file_share_info)

let nfs_file_share_info_list_of_yojson tree path =
  list_of_yojson nfs_file_share_info_of_yojson tree path

let describe_nfs_file_shares_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     nfs_file_share_info_list =
       option_of_yojson
         (value_for_key nfs_file_share_info_list_of_yojson "NFSFileShareInfoList")
         _list path;
   }
    : describe_nfs_file_shares_output)

let describe_nfs_file_shares_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_share_arn_list = value_for_key file_share_arn_list_of_yojson "FileShareARNList" _list path;
   }
    : describe_nfs_file_shares_input)

let describe_maintenance_start_time_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     software_update_preferences =
       option_of_yojson
         (value_for_key software_update_preferences_of_yojson "SoftwareUpdatePreferences")
         _list path;
     timezone = option_of_yojson (value_for_key gateway_timezone_of_yojson "Timezone") _list path;
     day_of_month = option_of_yojson (value_for_key day_of_month_of_yojson "DayOfMonth") _list path;
     day_of_week = option_of_yojson (value_for_key day_of_week_of_yojson "DayOfWeek") _list path;
     minute_of_hour =
       option_of_yojson (value_for_key minute_of_hour_of_yojson "MinuteOfHour") _list path;
     hour_of_day = option_of_yojson (value_for_key hour_of_day_of_yojson "HourOfDay") _list path;
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : describe_maintenance_start_time_output)

let describe_maintenance_start_time_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path }
    : describe_maintenance_start_time_input)

let gateway_state_of_yojson = string_of_yojson

let network_interface_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ipv6_address = option_of_yojson (value_for_key string__of_yojson "Ipv6Address") _list path;
     mac_address = option_of_yojson (value_for_key string__of_yojson "MacAddress") _list path;
     ipv4_address = option_of_yojson (value_for_key string__of_yojson "Ipv4Address") _list path;
   }
    : network_interface)

let gateway_network_interfaces_of_yojson tree path =
  list_of_yojson network_interface_of_yojson tree path

let next_update_availability_date_of_yojson = string_of_yojson
let last_software_update_of_yojson = string_of_yojson
let endpoint_type_of_yojson = string_of_yojson
let software_updates_end_date_of_yojson = string_of_yojson

let describe_gateway_information_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     software_version =
       option_of_yojson (value_for_key software_version_of_yojson "SoftwareVersion") _list path;
     host_environment_id =
       option_of_yojson (value_for_key host_environment_id_of_yojson "HostEnvironmentId") _list path;
     supported_gateway_capacities =
       option_of_yojson
         (value_for_key supported_gateway_capacities_of_yojson "SupportedGatewayCapacities")
         _list path;
     gateway_capacity =
       option_of_yojson (value_for_key gateway_capacity_of_yojson "GatewayCapacity") _list path;
     deprecation_date =
       option_of_yojson (value_for_key deprecation_date_of_yojson "DeprecationDate") _list path;
     software_updates_end_date =
       option_of_yojson
         (value_for_key software_updates_end_date_of_yojson "SoftwareUpdatesEndDate")
         _list path;
     endpoint_type =
       option_of_yojson (value_for_key endpoint_type_of_yojson "EndpointType") _list path;
     host_environment =
       option_of_yojson (value_for_key host_environment_of_yojson "HostEnvironment") _list path;
     cloud_watch_log_group_ar_n =
       option_of_yojson
         (value_for_key cloud_watch_log_group_ar_n_of_yojson "CloudWatchLogGroupARN")
         _list path;
     vpc_endpoint = option_of_yojson (value_for_key string__of_yojson "VPCEndpoint") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     ec2_instance_region =
       option_of_yojson (value_for_key ec2_instance_region_of_yojson "Ec2InstanceRegion") _list path;
     ec2_instance_id =
       option_of_yojson (value_for_key ec2_instance_id_of_yojson "Ec2InstanceId") _list path;
     last_software_update =
       option_of_yojson
         (value_for_key last_software_update_of_yojson "LastSoftwareUpdate")
         _list path;
     next_update_availability_date =
       option_of_yojson
         (value_for_key next_update_availability_date_of_yojson "NextUpdateAvailabilityDate")
         _list path;
     gateway_type = option_of_yojson (value_for_key gateway_type_of_yojson "GatewayType") _list path;
     gateway_network_interfaces =
       option_of_yojson
         (value_for_key gateway_network_interfaces_of_yojson "GatewayNetworkInterfaces")
         _list path;
     gateway_state =
       option_of_yojson (value_for_key gateway_state_of_yojson "GatewayState") _list path;
     gateway_timezone =
       option_of_yojson (value_for_key gateway_timezone_of_yojson "GatewayTimezone") _list path;
     gateway_name = option_of_yojson (value_for_key string__of_yojson "GatewayName") _list path;
     gateway_id = option_of_yojson (value_for_key gateway_id_of_yojson "GatewayId") _list path;
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : describe_gateway_information_output)

let describe_gateway_information_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path }
    : describe_gateway_information_input)

let file_system_location_ar_n_of_yojson = string_of_yojson
let ipv4_address_of_yojson = string_of_yojson
let ip_address_list_of_yojson tree path = list_of_yojson ipv4_address_of_yojson tree path

let endpoint_network_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ip_addresses =
       option_of_yojson (value_for_key ip_address_list_of_yojson "IpAddresses") _list path;
   }
    : endpoint_network_configuration)

let file_system_association_sync_error_code_of_yojson = string_of_yojson

let file_system_association_status_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_code =
       option_of_yojson
         (value_for_key file_system_association_sync_error_code_of_yojson "ErrorCode")
         _list path;
   }
    : file_system_association_status_detail)

let file_system_association_status_details_of_yojson tree path =
  list_of_yojson file_system_association_status_detail_of_yojson tree path

let file_system_association_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_system_association_status_details =
       option_of_yojson
         (value_for_key file_system_association_status_details_of_yojson
            "FileSystemAssociationStatusDetails")
         _list path;
     endpoint_network_configuration =
       option_of_yojson
         (value_for_key endpoint_network_configuration_of_yojson "EndpointNetworkConfiguration")
         _list path;
     cache_attributes =
       option_of_yojson (value_for_key cache_attributes_of_yojson "CacheAttributes") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
     audit_destination_ar_n =
       option_of_yojson
         (value_for_key audit_destination_ar_n_of_yojson "AuditDestinationARN")
         _list path;
     file_system_association_status =
       option_of_yojson
         (value_for_key file_system_association_status_of_yojson "FileSystemAssociationStatus")
         _list path;
     location_ar_n =
       option_of_yojson (value_for_key file_system_location_ar_n_of_yojson "LocationARN") _list path;
     file_system_association_ar_n =
       option_of_yojson
         (value_for_key file_system_association_ar_n_of_yojson "FileSystemAssociationARN")
         _list path;
   }
    : file_system_association_info)

let file_system_association_info_list_of_yojson tree path =
  list_of_yojson file_system_association_info_of_yojson tree path

let describe_file_system_associations_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_system_association_info_list =
       option_of_yojson
         (value_for_key file_system_association_info_list_of_yojson "FileSystemAssociationInfoList")
         _list path;
   }
    : describe_file_system_associations_output)

let file_system_association_arn_list_of_yojson tree path =
  list_of_yojson file_system_association_ar_n_of_yojson tree path

let describe_file_system_associations_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_system_association_arn_list =
       value_for_key file_system_association_arn_list_of_yojson "FileSystemAssociationARNList" _list
         path;
   }
    : describe_file_system_associations_input)

let chap_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     secret_to_authenticate_target =
       option_of_yojson
         (value_for_key chap_secret_of_yojson "SecretToAuthenticateTarget")
         _list path;
     initiator_name = option_of_yojson (value_for_key iqn_name_of_yojson "InitiatorName") _list path;
     secret_to_authenticate_initiator =
       option_of_yojson
         (value_for_key chap_secret_of_yojson "SecretToAuthenticateInitiator")
         _list path;
     target_ar_n = option_of_yojson (value_for_key target_ar_n_of_yojson "TargetARN") _list path;
   }
    : chap_info)

let chap_credentials_of_yojson tree path = list_of_yojson chap_info_of_yojson tree path

let describe_chap_credentials_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     chap_credentials =
       option_of_yojson (value_for_key chap_credentials_of_yojson "ChapCredentials") _list path;
   }
    : describe_chap_credentials_output)

let describe_chap_credentials_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ target_ar_n = value_for_key target_ar_n_of_yojson "TargetARN" _list path }
    : describe_chap_credentials_input)

let describe_cache_report_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cache_report_info =
       option_of_yojson (value_for_key cache_report_info_of_yojson "CacheReportInfo") _list path;
   }
    : describe_cache_report_output)

let describe_cache_report_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cache_report_ar_n = value_for_key cache_report_ar_n_of_yojson "CacheReportARN" _list path }
    : describe_cache_report_input)

let cachedi_scsi_volume_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_name = option_of_yojson (value_for_key target_name_of_yojson "TargetName") _list path;
     kms_key = option_of_yojson (value_for_key kms_key_of_yojson "KMSKey") _list path;
     volume_used_in_bytes =
       option_of_yojson
         (value_for_key volume_used_in_bytes_of_yojson "VolumeUsedInBytes")
         _list path;
     created_date = option_of_yojson (value_for_key created_date_of_yojson "CreatedDate") _list path;
     volumei_scsi_attributes =
       option_of_yojson
         (value_for_key volumei_scsi_attributes_of_yojson "VolumeiSCSIAttributes")
         _list path;
     source_snapshot_id =
       option_of_yojson (value_for_key snapshot_id_of_yojson "SourceSnapshotId") _list path;
     volume_progress =
       option_of_yojson (value_for_key double_object_of_yojson "VolumeProgress") _list path;
     volume_size_in_bytes =
       option_of_yojson (value_for_key long_of_yojson "VolumeSizeInBytes") _list path;
     volume_attachment_status =
       option_of_yojson
         (value_for_key volume_attachment_status_of_yojson "VolumeAttachmentStatus")
         _list path;
     volume_status =
       option_of_yojson (value_for_key volume_status_of_yojson "VolumeStatus") _list path;
     volume_type = option_of_yojson (value_for_key volume_type_of_yojson "VolumeType") _list path;
     volume_id = option_of_yojson (value_for_key volume_id_of_yojson "VolumeId") _list path;
     volume_ar_n = option_of_yojson (value_for_key volume_ar_n_of_yojson "VolumeARN") _list path;
   }
    : cachedi_scsi_volume)

let cachedi_scsi_volumes_of_yojson tree path =
  list_of_yojson cachedi_scsi_volume_of_yojson tree path

let describe_cachedi_scsi_volumes_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cachedi_scsi_volumes =
       option_of_yojson
         (value_for_key cachedi_scsi_volumes_of_yojson "CachediSCSIVolumes")
         _list path;
   }
    : describe_cachedi_scsi_volumes_output)

let describe_cachedi_scsi_volumes_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ volume_ar_ns = value_for_key volume_ar_ns_of_yojson "VolumeARNs" _list path }
    : describe_cachedi_scsi_volumes_input)

let describe_cache_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cache_miss_percentage =
       option_of_yojson (value_for_key double_of_yojson "CacheMissPercentage") _list path;
     cache_hit_percentage =
       option_of_yojson (value_for_key double_of_yojson "CacheHitPercentage") _list path;
     cache_dirty_percentage =
       option_of_yojson (value_for_key double_of_yojson "CacheDirtyPercentage") _list path;
     cache_used_percentage =
       option_of_yojson (value_for_key double_of_yojson "CacheUsedPercentage") _list path;
     cache_allocated_in_bytes =
       option_of_yojson (value_for_key long_of_yojson "CacheAllocatedInBytes") _list path;
     disk_ids = option_of_yojson (value_for_key disk_ids_of_yojson "DiskIds") _list path;
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : describe_cache_output)

let describe_cache_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path }
    : describe_cache_input)

let describe_bandwidth_rate_limit_schedule_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bandwidth_rate_limit_intervals =
       option_of_yojson
         (value_for_key bandwidth_rate_limit_intervals_of_yojson "BandwidthRateLimitIntervals")
         _list path;
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : describe_bandwidth_rate_limit_schedule_output)

let describe_bandwidth_rate_limit_schedule_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path }
    : describe_bandwidth_rate_limit_schedule_input)

let describe_bandwidth_rate_limit_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     average_download_rate_limit_in_bits_per_sec =
       option_of_yojson
         (value_for_key bandwidth_download_rate_limit_of_yojson
            "AverageDownloadRateLimitInBitsPerSec")
         _list path;
     average_upload_rate_limit_in_bits_per_sec =
       option_of_yojson
         (value_for_key bandwidth_upload_rate_limit_of_yojson "AverageUploadRateLimitInBitsPerSec")
         _list path;
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : describe_bandwidth_rate_limit_output)

let describe_bandwidth_rate_limit_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path }
    : describe_bandwidth_rate_limit_input)

let availability_monitor_test_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "PENDING" -> PENDING
    | `String "FAILED" -> FAILED
    | `String "COMPLETE" -> COMPLETE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AvailabilityMonitorTestStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AvailabilityMonitorTestStatus")
     : availability_monitor_test_status)
    : availability_monitor_test_status)

let describe_availability_monitor_test_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     start_time = option_of_yojson (value_for_key time_of_yojson "StartTime") _list path;
     status =
       option_of_yojson
         (value_for_key availability_monitor_test_status_of_yojson "Status")
         _list path;
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : describe_availability_monitor_test_output)

let describe_availability_monitor_test_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path }
    : describe_availability_monitor_test_input)

let delete_volume_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ volume_ar_n = option_of_yojson (value_for_key volume_ar_n_of_yojson "VolumeARN") _list path }
    : delete_volume_output)

let delete_volume_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ volume_ar_n = value_for_key volume_ar_n_of_yojson "VolumeARN" _list path }
    : delete_volume_input)

let delete_tape_pool_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ pool_ar_n = option_of_yojson (value_for_key pool_ar_n_of_yojson "PoolARN") _list path }
    : delete_tape_pool_output)

let delete_tape_pool_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ pool_ar_n = value_for_key pool_ar_n_of_yojson "PoolARN" _list path } : delete_tape_pool_input)

let delete_tape_archive_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tape_ar_n = option_of_yojson (value_for_key tape_ar_n_of_yojson "TapeARN") _list path }
    : delete_tape_archive_output)

let delete_tape_archive_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bypass_governance_retention =
       option_of_yojson (value_for_key boolean2_of_yojson "BypassGovernanceRetention") _list path;
     tape_ar_n = value_for_key tape_ar_n_of_yojson "TapeARN" _list path;
   }
    : delete_tape_archive_input)

let delete_tape_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tape_ar_n = option_of_yojson (value_for_key tape_ar_n_of_yojson "TapeARN") _list path }
    : delete_tape_output)

let delete_tape_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bypass_governance_retention =
       option_of_yojson (value_for_key boolean2_of_yojson "BypassGovernanceRetention") _list path;
     tape_ar_n = value_for_key tape_ar_n_of_yojson "TapeARN" _list path;
     gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path;
   }
    : delete_tape_input)

let delete_snapshot_schedule_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ volume_ar_n = option_of_yojson (value_for_key volume_ar_n_of_yojson "VolumeARN") _list path }
    : delete_snapshot_schedule_output)

let delete_snapshot_schedule_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ volume_ar_n = value_for_key volume_ar_n_of_yojson "VolumeARN" _list path }
    : delete_snapshot_schedule_input)

let delete_gateway_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : delete_gateway_output)

let delete_gateway_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path }
    : delete_gateway_input)

let delete_file_share_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_share_ar_n =
       option_of_yojson (value_for_key file_share_ar_n_of_yojson "FileShareARN") _list path;
   }
    : delete_file_share_output)

let delete_file_share_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     force_delete = option_of_yojson (value_for_key boolean2_of_yojson "ForceDelete") _list path;
     file_share_ar_n = value_for_key file_share_ar_n_of_yojson "FileShareARN" _list path;
   }
    : delete_file_share_input)

let delete_chap_credentials_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     initiator_name = option_of_yojson (value_for_key iqn_name_of_yojson "InitiatorName") _list path;
     target_ar_n = option_of_yojson (value_for_key target_ar_n_of_yojson "TargetARN") _list path;
   }
    : delete_chap_credentials_output)

let delete_chap_credentials_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     initiator_name = value_for_key iqn_name_of_yojson "InitiatorName" _list path;
     target_ar_n = value_for_key target_ar_n_of_yojson "TargetARN" _list path;
   }
    : delete_chap_credentials_input)

let delete_cache_report_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cache_report_ar_n =
       option_of_yojson (value_for_key cache_report_ar_n_of_yojson "CacheReportARN") _list path;
   }
    : delete_cache_report_output)

let delete_cache_report_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cache_report_ar_n = value_for_key cache_report_ar_n_of_yojson "CacheReportARN" _list path }
    : delete_cache_report_input)

let delete_bandwidth_rate_limit_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : delete_bandwidth_rate_limit_output)

let bandwidth_type_of_yojson = string_of_yojson

let delete_bandwidth_rate_limit_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bandwidth_type = value_for_key bandwidth_type_of_yojson "BandwidthType" _list path;
     gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path;
   }
    : delete_bandwidth_rate_limit_input)

let delete_automatic_tape_creation_policy_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : delete_automatic_tape_creation_policy_output)

let delete_automatic_tape_creation_policy_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path }
    : delete_automatic_tape_creation_policy_input)

let create_tape_with_barcode_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tape_ar_n = option_of_yojson (value_for_key tape_ar_n_of_yojson "TapeARN") _list path }
    : create_tape_with_barcode_output)

let create_tape_with_barcode_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     worm = option_of_yojson (value_for_key boolean2_of_yojson "Worm") _list path;
     pool_id = option_of_yojson (value_for_key pool_id_of_yojson "PoolId") _list path;
     kms_key = option_of_yojson (value_for_key kms_key_of_yojson "KMSKey") _list path;
     kms_encrypted = option_of_yojson (value_for_key boolean__of_yojson "KMSEncrypted") _list path;
     tape_barcode = value_for_key tape_barcode_of_yojson "TapeBarcode" _list path;
     tape_size_in_bytes = value_for_key tape_size_of_yojson "TapeSizeInBytes" _list path;
     gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path;
   }
    : create_tape_with_barcode_input)

let create_tapes_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tape_ar_ns = option_of_yojson (value_for_key tape_ar_ns_of_yojson "TapeARNs") _list path }
    : create_tapes_output)

let num_tapes_to_create_of_yojson = int_of_yojson

let create_tapes_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     worm = option_of_yojson (value_for_key boolean2_of_yojson "Worm") _list path;
     pool_id = option_of_yojson (value_for_key pool_id_of_yojson "PoolId") _list path;
     kms_key = option_of_yojson (value_for_key kms_key_of_yojson "KMSKey") _list path;
     kms_encrypted = option_of_yojson (value_for_key boolean__of_yojson "KMSEncrypted") _list path;
     tape_barcode_prefix =
       value_for_key tape_barcode_prefix_of_yojson "TapeBarcodePrefix" _list path;
     num_tapes_to_create = value_for_key num_tapes_to_create_of_yojson "NumTapesToCreate" _list path;
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
     tape_size_in_bytes = value_for_key tape_size_of_yojson "TapeSizeInBytes" _list path;
     gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path;
   }
    : create_tapes_input)

let create_tape_pool_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ pool_ar_n = option_of_yojson (value_for_key pool_ar_n_of_yojson "PoolARN") _list path }
    : create_tape_pool_output)

let create_tape_pool_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     retention_lock_time_in_days =
       option_of_yojson
         (value_for_key retention_lock_time_in_days_of_yojson "RetentionLockTimeInDays")
         _list path;
     retention_lock_type =
       option_of_yojson (value_for_key retention_lock_type_of_yojson "RetentionLockType") _list path;
     storage_class = value_for_key tape_storage_class_of_yojson "StorageClass" _list path;
     pool_name = value_for_key pool_name_of_yojson "PoolName" _list path;
   }
    : create_tape_pool_input)

let create_storedi_scsi_volume_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_ar_n = option_of_yojson (value_for_key target_ar_n_of_yojson "TargetARN") _list path;
     volume_size_in_bytes =
       option_of_yojson (value_for_key long_of_yojson "VolumeSizeInBytes") _list path;
     volume_ar_n = option_of_yojson (value_for_key volume_ar_n_of_yojson "VolumeARN") _list path;
   }
    : create_storedi_scsi_volume_output)

let create_storedi_scsi_volume_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     kms_key = option_of_yojson (value_for_key kms_key_of_yojson "KMSKey") _list path;
     kms_encrypted = option_of_yojson (value_for_key boolean__of_yojson "KMSEncrypted") _list path;
     network_interface_id =
       value_for_key network_interface_id_of_yojson "NetworkInterfaceId" _list path;
     target_name = value_for_key target_name_of_yojson "TargetName" _list path;
     preserve_existing_data = value_for_key boolean2_of_yojson "PreserveExistingData" _list path;
     snapshot_id = option_of_yojson (value_for_key snapshot_id_of_yojson "SnapshotId") _list path;
     disk_id = value_for_key disk_id_of_yojson "DiskId" _list path;
     gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path;
   }
    : create_storedi_scsi_volume_input)

let service_unavailable_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error = option_of_yojson (value_for_key storage_gateway_error_of_yojson "error") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
   }
    : service_unavailable_error)

let create_snapshot_from_volume_recovery_point_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     volume_recovery_point_time =
       option_of_yojson (value_for_key string__of_yojson "VolumeRecoveryPointTime") _list path;
     volume_ar_n = option_of_yojson (value_for_key volume_ar_n_of_yojson "VolumeARN") _list path;
     snapshot_id = option_of_yojson (value_for_key snapshot_id_of_yojson "SnapshotId") _list path;
   }
    : create_snapshot_from_volume_recovery_point_output)

let snapshot_description_of_yojson = string_of_yojson

let create_snapshot_from_volume_recovery_point_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     snapshot_description =
       value_for_key snapshot_description_of_yojson "SnapshotDescription" _list path;
     volume_ar_n = value_for_key volume_ar_n_of_yojson "VolumeARN" _list path;
   }
    : create_snapshot_from_volume_recovery_point_input)

let create_snapshot_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     snapshot_id = option_of_yojson (value_for_key snapshot_id_of_yojson "SnapshotId") _list path;
     volume_ar_n = option_of_yojson (value_for_key volume_ar_n_of_yojson "VolumeARN") _list path;
   }
    : create_snapshot_output)

let create_snapshot_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     snapshot_description =
       value_for_key snapshot_description_of_yojson "SnapshotDescription" _list path;
     volume_ar_n = value_for_key volume_ar_n_of_yojson "VolumeARN" _list path;
   }
    : create_snapshot_input)

let create_smb_file_share_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_share_ar_n =
       option_of_yojson (value_for_key file_share_ar_n_of_yojson "FileShareARN") _list path;
   }
    : create_smb_file_share_output)

let create_smb_file_share_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     oplocks_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "OplocksEnabled") _list path;
     bucket_region = option_of_yojson (value_for_key region_id_of_yojson "BucketRegion") _list path;
     vpc_endpoint_dns_name =
       option_of_yojson (value_for_key dns_host_name_of_yojson "VPCEndpointDNSName") _list path;
     notification_policy =
       option_of_yojson
         (value_for_key notification_policy_of_yojson "NotificationPolicy")
         _list path;
     cache_attributes =
       option_of_yojson (value_for_key cache_attributes_of_yojson "CacheAttributes") _list path;
     file_share_name =
       option_of_yojson (value_for_key file_share_name_of_yojson "FileShareName") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     case_sensitivity =
       option_of_yojson (value_for_key case_sensitivity_of_yojson "CaseSensitivity") _list path;
     authentication =
       option_of_yojson (value_for_key authentication_of_yojson "Authentication") _list path;
     audit_destination_ar_n =
       option_of_yojson
         (value_for_key audit_destination_ar_n_of_yojson "AuditDestinationARN")
         _list path;
     invalid_user_list =
       option_of_yojson (value_for_key user_list_of_yojson "InvalidUserList") _list path;
     valid_user_list =
       option_of_yojson (value_for_key user_list_of_yojson "ValidUserList") _list path;
     admin_user_list =
       option_of_yojson (value_for_key user_list_of_yojson "AdminUserList") _list path;
     access_based_enumeration =
       option_of_yojson (value_for_key boolean__of_yojson "AccessBasedEnumeration") _list path;
     smbacl_enabled = option_of_yojson (value_for_key boolean__of_yojson "SMBACLEnabled") _list path;
     requester_pays = option_of_yojson (value_for_key boolean__of_yojson "RequesterPays") _list path;
     guess_mime_type_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "GuessMIMETypeEnabled") _list path;
     read_only = option_of_yojson (value_for_key boolean__of_yojson "ReadOnly") _list path;
     object_ac_l = option_of_yojson (value_for_key object_ac_l_of_yojson "ObjectACL") _list path;
     default_storage_class =
       option_of_yojson (value_for_key storage_class_of_yojson "DefaultStorageClass") _list path;
     location_ar_n = value_for_key location_ar_n_of_yojson "LocationARN" _list path;
     role = value_for_key role_of_yojson "Role" _list path;
     kms_key = option_of_yojson (value_for_key kms_key_of_yojson "KMSKey") _list path;
     kms_encrypted = option_of_yojson (value_for_key boolean__of_yojson "KMSEncrypted") _list path;
     encryption_type =
       option_of_yojson (value_for_key encryption_type_of_yojson "EncryptionType") _list path;
     gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path;
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
   }
    : create_smb_file_share_input)

let create_nfs_file_share_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_share_ar_n =
       option_of_yojson (value_for_key file_share_ar_n_of_yojson "FileShareARN") _list path;
   }
    : create_nfs_file_share_output)

let create_nfs_file_share_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     audit_destination_ar_n =
       option_of_yojson
         (value_for_key audit_destination_ar_n_of_yojson "AuditDestinationARN")
         _list path;
     bucket_region = option_of_yojson (value_for_key region_id_of_yojson "BucketRegion") _list path;
     vpc_endpoint_dns_name =
       option_of_yojson (value_for_key dns_host_name_of_yojson "VPCEndpointDNSName") _list path;
     notification_policy =
       option_of_yojson
         (value_for_key notification_policy_of_yojson "NotificationPolicy")
         _list path;
     cache_attributes =
       option_of_yojson (value_for_key cache_attributes_of_yojson "CacheAttributes") _list path;
     file_share_name =
       option_of_yojson (value_for_key file_share_name_of_yojson "FileShareName") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     requester_pays = option_of_yojson (value_for_key boolean__of_yojson "RequesterPays") _list path;
     guess_mime_type_enabled =
       option_of_yojson (value_for_key boolean__of_yojson "GuessMIMETypeEnabled") _list path;
     read_only = option_of_yojson (value_for_key boolean__of_yojson "ReadOnly") _list path;
     squash = option_of_yojson (value_for_key squash_of_yojson "Squash") _list path;
     client_list =
       option_of_yojson (value_for_key file_share_client_list_of_yojson "ClientList") _list path;
     object_ac_l = option_of_yojson (value_for_key object_ac_l_of_yojson "ObjectACL") _list path;
     default_storage_class =
       option_of_yojson (value_for_key storage_class_of_yojson "DefaultStorageClass") _list path;
     location_ar_n = value_for_key location_ar_n_of_yojson "LocationARN" _list path;
     role = value_for_key role_of_yojson "Role" _list path;
     kms_key = option_of_yojson (value_for_key kms_key_of_yojson "KMSKey") _list path;
     kms_encrypted = option_of_yojson (value_for_key boolean__of_yojson "KMSEncrypted") _list path;
     encryption_type =
       option_of_yojson (value_for_key encryption_type_of_yojson "EncryptionType") _list path;
     gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path;
     nfs_file_share_defaults =
       option_of_yojson
         (value_for_key nfs_file_share_defaults_of_yojson "NFSFileShareDefaults")
         _list path;
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
   }
    : create_nfs_file_share_input)

let create_cachedi_scsi_volume_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_ar_n = option_of_yojson (value_for_key target_ar_n_of_yojson "TargetARN") _list path;
     volume_ar_n = option_of_yojson (value_for_key volume_ar_n_of_yojson "VolumeARN") _list path;
   }
    : create_cachedi_scsi_volume_output)

let create_cachedi_scsi_volume_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     kms_key = option_of_yojson (value_for_key kms_key_of_yojson "KMSKey") _list path;
     kms_encrypted = option_of_yojson (value_for_key boolean__of_yojson "KMSEncrypted") _list path;
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
     network_interface_id =
       value_for_key network_interface_id_of_yojson "NetworkInterfaceId" _list path;
     source_volume_ar_n =
       option_of_yojson (value_for_key volume_ar_n_of_yojson "SourceVolumeARN") _list path;
     target_name = value_for_key target_name_of_yojson "TargetName" _list path;
     snapshot_id = option_of_yojson (value_for_key snapshot_id_of_yojson "SnapshotId") _list path;
     volume_size_in_bytes = value_for_key long_of_yojson "VolumeSizeInBytes" _list path;
     gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path;
   }
    : create_cachedi_scsi_volume_input)

let cancel_retrieval_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tape_ar_n = option_of_yojson (value_for_key tape_ar_n_of_yojson "TapeARN") _list path }
    : cancel_retrieval_output)

let cancel_retrieval_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tape_ar_n = value_for_key tape_ar_n_of_yojson "TapeARN" _list path;
     gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path;
   }
    : cancel_retrieval_input)

let cancel_cache_report_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cache_report_ar_n =
       option_of_yojson (value_for_key cache_report_ar_n_of_yojson "CacheReportARN") _list path;
   }
    : cancel_cache_report_output)

let cancel_cache_report_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ cache_report_ar_n = value_for_key cache_report_ar_n_of_yojson "CacheReportARN" _list path }
    : cancel_cache_report_input)

let cancel_archival_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tape_ar_n = option_of_yojson (value_for_key tape_ar_n_of_yojson "TapeARN") _list path }
    : cancel_archival_output)

let cancel_archival_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tape_ar_n = value_for_key tape_ar_n_of_yojson "TapeARN" _list path;
     gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path;
   }
    : cancel_archival_input)

let attach_volume_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     target_ar_n = option_of_yojson (value_for_key target_ar_n_of_yojson "TargetARN") _list path;
     volume_ar_n = option_of_yojson (value_for_key volume_ar_n_of_yojson "VolumeARN") _list path;
   }
    : attach_volume_output)

let attach_volume_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     disk_id = option_of_yojson (value_for_key disk_id_of_yojson "DiskId") _list path;
     network_interface_id =
       value_for_key network_interface_id_of_yojson "NetworkInterfaceId" _list path;
     volume_ar_n = value_for_key volume_ar_n_of_yojson "VolumeARN" _list path;
     target_name = option_of_yojson (value_for_key target_name_of_yojson "TargetName") _list path;
     gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path;
   }
    : attach_volume_input)

let associate_file_system_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     file_system_association_ar_n =
       option_of_yojson
         (value_for_key file_system_association_ar_n_of_yojson "FileSystemAssociationARN")
         _list path;
   }
    : associate_file_system_output)

let associate_file_system_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     endpoint_network_configuration =
       option_of_yojson
         (value_for_key endpoint_network_configuration_of_yojson "EndpointNetworkConfiguration")
         _list path;
     cache_attributes =
       option_of_yojson (value_for_key cache_attributes_of_yojson "CacheAttributes") _list path;
     audit_destination_ar_n =
       option_of_yojson
         (value_for_key audit_destination_ar_n_of_yojson "AuditDestinationARN")
         _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     location_ar_n = value_for_key file_system_location_ar_n_of_yojson "LocationARN" _list path;
     gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path;
     client_token = value_for_key client_token_of_yojson "ClientToken" _list path;
     password = value_for_key domain_user_password_of_yojson "Password" _list path;
     user_name = value_for_key domain_user_name_of_yojson "UserName" _list path;
   }
    : associate_file_system_input)

let assign_tape_pool_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tape_ar_n = option_of_yojson (value_for_key tape_ar_n_of_yojson "TapeARN") _list path }
    : assign_tape_pool_output)

let assign_tape_pool_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bypass_governance_retention =
       option_of_yojson (value_for_key boolean2_of_yojson "BypassGovernanceRetention") _list path;
     pool_id = value_for_key pool_id_of_yojson "PoolId" _list path;
     tape_ar_n = value_for_key tape_ar_n_of_yojson "TapeARN" _list path;
   }
    : assign_tape_pool_input)

let add_working_storage_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : add_working_storage_output)

let add_working_storage_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     disk_ids = value_for_key disk_ids_of_yojson "DiskIds" _list path;
     gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path;
   }
    : add_working_storage_input)

let add_upload_buffer_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : add_upload_buffer_output)

let add_upload_buffer_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     disk_ids = value_for_key disk_ids_of_yojson "DiskIds" _list path;
     gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path;
   }
    : add_upload_buffer_input)

let add_tags_to_resource_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_ar_n =
       option_of_yojson (value_for_key resource_ar_n_of_yojson "ResourceARN") _list path;
   }
    : add_tags_to_resource_output)

let add_tags_to_resource_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tags_of_yojson "Tags" _list path;
     resource_ar_n = value_for_key resource_ar_n_of_yojson "ResourceARN" _list path;
   }
    : add_tags_to_resource_input)

let add_cache_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : add_cache_output)

let add_cache_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     disk_ids = value_for_key disk_ids_of_yojson "DiskIds" _list path;
     gateway_ar_n = value_for_key gateway_ar_n_of_yojson "GatewayARN" _list path;
   }
    : add_cache_input)

let activate_gateway_output_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     gateway_ar_n = option_of_yojson (value_for_key gateway_ar_n_of_yojson "GatewayARN") _list path;
   }
    : activate_gateway_output)

let activation_key_of_yojson = string_of_yojson
let medium_changer_type_of_yojson = string_of_yojson

let activate_gateway_input_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "Tags") _list path;
     medium_changer_type =
       option_of_yojson (value_for_key medium_changer_type_of_yojson "MediumChangerType") _list path;
     tape_drive_type =
       option_of_yojson (value_for_key tape_drive_type_of_yojson "TapeDriveType") _list path;
     gateway_type = option_of_yojson (value_for_key gateway_type_of_yojson "GatewayType") _list path;
     gateway_region = value_for_key region_id_of_yojson "GatewayRegion" _list path;
     gateway_timezone = value_for_key gateway_timezone_of_yojson "GatewayTimezone" _list path;
     gateway_name = value_for_key gateway_name_of_yojson "GatewayName" _list path;
     activation_key = value_for_key activation_key_of_yojson "ActivationKey" _list path;
   }
    : activate_gateway_input)
