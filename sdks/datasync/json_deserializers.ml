open Smaws_Lib.Json.DeserializeHelpers
open Types

let string__of_yojson = string_of_yojson
let long_of_yojson = long_of_yojson
let vpc_endpoint_id_of_yojson = string_of_yojson

let verify_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "ONLY_FILES_TRANSFERRED" -> ONLY_FILES_TRANSFERRED
    | `String "POINT_IN_TIME_CONSISTENT" -> POINT_IN_TIME_CONSISTENT
    | `String value -> raise (deserialize_unknown_enum_value_error path "VerifyMode" value)
    | _ -> raise (deserialize_wrong_type_error path "VerifyMode")
     : verify_mode)
    : verify_mode)

let updated_efs_iam_role_arn_of_yojson = string_of_yojson
let updated_efs_access_point_arn_of_yojson = string_of_yojson

let update_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let task_arn_of_yojson = string_of_yojson

let overwrite_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "NEVER" -> NEVER
    | `String "ALWAYS" -> ALWAYS
    | `String value -> raise (deserialize_unknown_enum_value_error path "OverwriteMode" value)
    | _ -> raise (deserialize_wrong_type_error path "OverwriteMode")
     : overwrite_mode)
    : overwrite_mode)

let atime_of_yojson (tree : t) path =
  ((match tree with
    | `String "BEST_EFFORT" -> BEST_EFFORT
    | `String "NONE" -> NONE
    | `String value -> raise (deserialize_unknown_enum_value_error path "Atime" value)
    | _ -> raise (deserialize_wrong_type_error path "Atime")
     : atime)
    : atime)

let mtime_of_yojson (tree : t) path =
  ((match tree with
    | `String "PRESERVE" -> PRESERVE
    | `String "NONE" -> NONE
    | `String value -> raise (deserialize_unknown_enum_value_error path "Mtime" value)
    | _ -> raise (deserialize_wrong_type_error path "Mtime")
     : mtime)
    : mtime)

let uid_of_yojson (tree : t) path =
  ((match tree with
    | `String "BOTH" -> BOTH
    | `String "NAME" -> NAME
    | `String "INT_VALUE" -> INT_VALUE
    | `String "NONE" -> NONE
    | `String value -> raise (deserialize_unknown_enum_value_error path "Uid" value)
    | _ -> raise (deserialize_wrong_type_error path "Uid")
     : uid)
    : uid)

let gid_of_yojson (tree : t) path =
  ((match tree with
    | `String "BOTH" -> BOTH
    | `String "NAME" -> NAME
    | `String "INT_VALUE" -> INT_VALUE
    | `String "NONE" -> NONE
    | `String value -> raise (deserialize_unknown_enum_value_error path "Gid" value)
    | _ -> raise (deserialize_wrong_type_error path "Gid")
     : gid)
    : gid)

let preserve_deleted_files_of_yojson (tree : t) path =
  ((match tree with
    | `String "REMOVE" -> REMOVE
    | `String "PRESERVE" -> PRESERVE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PreserveDeletedFiles" value)
    | _ -> raise (deserialize_wrong_type_error path "PreserveDeletedFiles")
     : preserve_deleted_files)
    : preserve_deleted_files)

let preserve_devices_of_yojson (tree : t) path =
  ((match tree with
    | `String "PRESERVE" -> PRESERVE
    | `String "NONE" -> NONE
    | `String value -> raise (deserialize_unknown_enum_value_error path "PreserveDevices" value)
    | _ -> raise (deserialize_wrong_type_error path "PreserveDevices")
     : preserve_devices)
    : preserve_devices)

let posix_permissions_of_yojson (tree : t) path =
  ((match tree with
    | `String "PRESERVE" -> PRESERVE
    | `String "NONE" -> NONE
    | `String value -> raise (deserialize_unknown_enum_value_error path "PosixPermissions" value)
    | _ -> raise (deserialize_wrong_type_error path "PosixPermissions")
     : posix_permissions)
    : posix_permissions)

let bytes_per_second_of_yojson = long_of_yojson

let task_queueing_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "TaskQueueing" value)
    | _ -> raise (deserialize_wrong_type_error path "TaskQueueing")
     : task_queueing)
    : task_queueing)

let log_level_of_yojson (tree : t) path =
  ((match tree with
    | `String "TRANSFER" -> TRANSFER
    | `String "BASIC" -> BASIC
    | `String "OFF" -> OFF
    | `String value -> raise (deserialize_unknown_enum_value_error path "LogLevel" value)
    | _ -> raise (deserialize_wrong_type_error path "LogLevel")
     : log_level)
    : log_level)

let transfer_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "ALL" -> ALL
    | `String "CHANGED" -> CHANGED
    | `String value -> raise (deserialize_unknown_enum_value_error path "TransferMode" value)
    | _ -> raise (deserialize_wrong_type_error path "TransferMode")
     : transfer_mode)
    : transfer_mode)

let smb_security_descriptor_copy_flags_of_yojson (tree : t) path =
  ((match tree with
    | `String "OWNER_DACL_SACL" -> OWNER_DACL_SACL
    | `String "OWNER_DACL" -> OWNER_DACL
    | `String "NONE" -> NONE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SmbSecurityDescriptorCopyFlags" value)
    | _ -> raise (deserialize_wrong_type_error path "SmbSecurityDescriptorCopyFlags")
     : smb_security_descriptor_copy_flags)
    : smb_security_descriptor_copy_flags)

let object_tags_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "PRESERVE" -> PRESERVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ObjectTags" value)
    | _ -> raise (deserialize_wrong_type_error path "ObjectTags")
     : object_tags)
    : object_tags)

let options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     object_tags = option_of_yojson (value_for_key object_tags_of_yojson "ObjectTags") _list path;
     security_descriptor_copy_flags =
       option_of_yojson
         (value_for_key smb_security_descriptor_copy_flags_of_yojson "SecurityDescriptorCopyFlags")
         _list path;
     transfer_mode =
       option_of_yojson (value_for_key transfer_mode_of_yojson "TransferMode") _list path;
     log_level = option_of_yojson (value_for_key log_level_of_yojson "LogLevel") _list path;
     task_queueing =
       option_of_yojson (value_for_key task_queueing_of_yojson "TaskQueueing") _list path;
     bytes_per_second =
       option_of_yojson (value_for_key bytes_per_second_of_yojson "BytesPerSecond") _list path;
     posix_permissions =
       option_of_yojson (value_for_key posix_permissions_of_yojson "PosixPermissions") _list path;
     preserve_devices =
       option_of_yojson (value_for_key preserve_devices_of_yojson "PreserveDevices") _list path;
     preserve_deleted_files =
       option_of_yojson
         (value_for_key preserve_deleted_files_of_yojson "PreserveDeletedFiles")
         _list path;
     gid = option_of_yojson (value_for_key gid_of_yojson "Gid") _list path;
     uid = option_of_yojson (value_for_key uid_of_yojson "Uid") _list path;
     mtime = option_of_yojson (value_for_key mtime_of_yojson "Mtime") _list path;
     atime = option_of_yojson (value_for_key atime_of_yojson "Atime") _list path;
     overwrite_mode =
       option_of_yojson (value_for_key overwrite_mode_of_yojson "OverwriteMode") _list path;
     verify_mode = option_of_yojson (value_for_key verify_mode_of_yojson "VerifyMode") _list path;
   }
    : options)

let filter_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SIMPLE_PATTERN" -> SIMPLE_PATTERN
    | `String value -> raise (deserialize_unknown_enum_value_error path "FilterType" value)
    | _ -> raise (deserialize_wrong_type_error path "FilterType")
     : filter_type)
    : filter_type)

let filter_value_of_yojson = string_of_yojson

let filter_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key filter_value_of_yojson "Value") _list path;
     filter_type = option_of_yojson (value_for_key filter_type_of_yojson "FilterType") _list path;
   }
    : filter_rule)

let filter_list_of_yojson tree path = list_of_yojson filter_rule_of_yojson tree path
let schedule_expression_cron_of_yojson = string_of_yojson

let schedule_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "DISABLED" -> DISABLED
    | `String "ENABLED" -> ENABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "ScheduleStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ScheduleStatus")
     : schedule_status)
    : schedule_status)

let task_schedule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = option_of_yojson (value_for_key schedule_status_of_yojson "Status") _list path;
     schedule_expression =
       value_for_key schedule_expression_cron_of_yojson "ScheduleExpression" _list path;
   }
    : task_schedule)

let tag_value_of_yojson = string_of_yojson
let log_group_arn_of_yojson = string_of_yojson

let manifest_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "TRANSFER" -> TRANSFER
    | `String value -> raise (deserialize_unknown_enum_value_error path "ManifestAction" value)
    | _ -> raise (deserialize_wrong_type_error path "ManifestAction")
     : manifest_action)
    : manifest_action)

let manifest_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "CSV" -> CSV
    | `String value -> raise (deserialize_unknown_enum_value_error path "ManifestFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "ManifestFormat")
     : manifest_format)
    : manifest_format)

let s3_subdirectory_of_yojson = string_of_yojson
let iam_role_arn_of_yojson = string_of_yojson
let s3_bucket_arn_of_yojson = string_of_yojson
let s3_object_version_id_of_yojson = string_of_yojson

let s3_manifest_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     manifest_object_version_id =
       option_of_yojson
         (value_for_key s3_object_version_id_of_yojson "ManifestObjectVersionId")
         _list path;
     s3_bucket_arn = value_for_key s3_bucket_arn_of_yojson "S3BucketArn" _list path;
     bucket_access_role_arn = value_for_key iam_role_arn_of_yojson "BucketAccessRoleArn" _list path;
     manifest_object_path = value_for_key s3_subdirectory_of_yojson "ManifestObjectPath" _list path;
   }
    : s3_manifest_config)

let source_manifest_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ s3 = value_for_key s3_manifest_config_of_yojson "S3" _list path } : source_manifest_config)

let manifest_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source = option_of_yojson (value_for_key source_manifest_config_of_yojson "Source") _list path;
     format = option_of_yojson (value_for_key manifest_format_of_yojson "Format") _list path;
     action = option_of_yojson (value_for_key manifest_action_of_yojson "Action") _list path;
   }
    : manifest_config)

let report_destination_s3_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bucket_access_role_arn = value_for_key iam_role_arn_of_yojson "BucketAccessRoleArn" _list path;
     s3_bucket_arn = value_for_key s3_bucket_arn_of_yojson "S3BucketArn" _list path;
     subdirectory =
       option_of_yojson (value_for_key s3_subdirectory_of_yojson "Subdirectory") _list path;
   }
    : report_destination_s3)

let report_destination_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ s3 = option_of_yojson (value_for_key report_destination_s3_of_yojson "S3") _list path }
    : report_destination)

let report_output_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "STANDARD" -> STANDARD
    | `String "SUMMARY_ONLY" -> SUMMARY_ONLY
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReportOutputType" value)
    | _ -> raise (deserialize_wrong_type_error path "ReportOutputType")
     : report_output_type)
    : report_output_type)

let report_level_of_yojson (tree : t) path =
  ((match tree with
    | `String "SUCCESSES_AND_ERRORS" -> SUCCESSES_AND_ERRORS
    | `String "ERRORS_ONLY" -> ERRORS_ONLY
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReportLevel" value)
    | _ -> raise (deserialize_wrong_type_error path "ReportLevel")
     : report_level)
    : report_level)

let object_version_ids_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "INCLUDE" -> INCLUDE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ObjectVersionIds" value)
    | _ -> raise (deserialize_wrong_type_error path "ObjectVersionIds")
     : object_version_ids)
    : object_version_ids)

let report_override_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     report_level = option_of_yojson (value_for_key report_level_of_yojson "ReportLevel") _list path;
   }
    : report_override)

let report_overrides_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     skipped = option_of_yojson (value_for_key report_override_of_yojson "Skipped") _list path;
     deleted = option_of_yojson (value_for_key report_override_of_yojson "Deleted") _list path;
     verified = option_of_yojson (value_for_key report_override_of_yojson "Verified") _list path;
     transferred =
       option_of_yojson (value_for_key report_override_of_yojson "Transferred") _list path;
   }
    : report_overrides)

let task_report_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     overrides = option_of_yojson (value_for_key report_overrides_of_yojson "Overrides") _list path;
     object_version_ids =
       option_of_yojson (value_for_key object_version_ids_of_yojson "ObjectVersionIds") _list path;
     report_level = option_of_yojson (value_for_key report_level_of_yojson "ReportLevel") _list path;
     output_type =
       option_of_yojson (value_for_key report_output_type_of_yojson "OutputType") _list path;
     destination =
       option_of_yojson (value_for_key report_destination_of_yojson "Destination") _list path;
   }
    : task_report_config)

let update_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_report_config =
       option_of_yojson (value_for_key task_report_config_of_yojson "TaskReportConfig") _list path;
     manifest_config =
       option_of_yojson (value_for_key manifest_config_of_yojson "ManifestConfig") _list path;
     includes = option_of_yojson (value_for_key filter_list_of_yojson "Includes") _list path;
     cloud_watch_log_group_arn =
       option_of_yojson (value_for_key log_group_arn_of_yojson "CloudWatchLogGroupArn") _list path;
     name = option_of_yojson (value_for_key tag_value_of_yojson "Name") _list path;
     schedule = option_of_yojson (value_for_key task_schedule_of_yojson "Schedule") _list path;
     excludes = option_of_yojson (value_for_key filter_list_of_yojson "Excludes") _list path;
     options = option_of_yojson (value_for_key options_of_yojson "Options") _list path;
     task_arn = value_for_key task_arn_of_yojson "TaskArn" _list path;
   }
    : update_task_request)

let update_task_execution_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let task_execution_arn_of_yojson = string_of_yojson

let update_task_execution_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     options = value_for_key options_of_yojson "Options" _list path;
     task_execution_arn = value_for_key task_execution_arn_of_yojson "TaskExecutionArn" _list path;
   }
    : update_task_execution_request)

let invalid_request_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     datasync_error_code =
       option_of_yojson (value_for_key string__of_yojson "datasyncErrorCode") _list path;
     error_code = option_of_yojson (value_for_key string__of_yojson "errorCode") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
   }
    : invalid_request_exception)

let internal_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_code = option_of_yojson (value_for_key string__of_yojson "errorCode") _list path;
     message = option_of_yojson (value_for_key string__of_yojson "message") _list path;
   }
    : internal_exception)

let update_smb_domain_of_yojson = string_of_yojson

let update_location_smb_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let location_arn_of_yojson = string_of_yojson
let smb_subdirectory_of_yojson = string_of_yojson
let server_hostname_of_yojson = string_of_yojson
let smb_user_of_yojson = string_of_yojson
let smb_domain_of_yojson = string_of_yojson
let smb_password_of_yojson = string_of_yojson
let secret_arn_of_yojson = string_of_yojson
let kms_key_arn_of_yojson = string_of_yojson

let cmk_secret_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kms_key_arn = option_of_yojson (value_for_key kms_key_arn_of_yojson "KmsKeyArn") _list path;
     secret_arn = option_of_yojson (value_for_key secret_arn_of_yojson "SecretArn") _list path;
   }
    : cmk_secret_config)

let iam_role_arn_or_empty_string_of_yojson = string_of_yojson

let custom_secret_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     secret_access_role_arn =
       option_of_yojson
         (value_for_key iam_role_arn_or_empty_string_of_yojson "SecretAccessRoleArn")
         _list path;
     secret_arn = option_of_yojson (value_for_key secret_arn_of_yojson "SecretArn") _list path;
   }
    : custom_secret_config)

let agent_arn_of_yojson = string_of_yojson
let agent_arn_list_of_yojson tree path = list_of_yojson agent_arn_of_yojson tree path

let smb_version_of_yojson (tree : t) path =
  ((match tree with
    | `String "SMB2_0" -> SMB2_0
    | `String "SMB1" -> SMB1
    | `String "SMB3" -> SMB3
    | `String "SMB2" -> SMB2
    | `String "AUTOMATIC" -> AUTOMATIC
    | `String value -> raise (deserialize_unknown_enum_value_error path "SmbVersion" value)
    | _ -> raise (deserialize_wrong_type_error path "SmbVersion")
     : smb_version)
    : smb_version)

let smb_mount_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ version = option_of_yojson (value_for_key smb_version_of_yojson "Version") _list path }
    : smb_mount_options)

let smb_authentication_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "KERBEROS" -> KERBEROS
    | `String "NTLM" -> NTLM
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SmbAuthenticationType" value)
    | _ -> raise (deserialize_wrong_type_error path "SmbAuthenticationType")
     : smb_authentication_type)
    : smb_authentication_type)

let server_ip_address_of_yojson = string_of_yojson
let dns_ip_list_of_yojson tree path = list_of_yojson server_ip_address_of_yojson tree path
let kerberos_principal_of_yojson = string_of_yojson
let kerberos_keytab_file_of_yojson = blob_of_yojson
let kerberos_krb5_conf_file_of_yojson = blob_of_yojson

let update_location_smb_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kerberos_krb5_conf =
       option_of_yojson
         (value_for_key kerberos_krb5_conf_file_of_yojson "KerberosKrb5Conf")
         _list path;
     kerberos_keytab =
       option_of_yojson (value_for_key kerberos_keytab_file_of_yojson "KerberosKeytab") _list path;
     kerberos_principal =
       option_of_yojson (value_for_key kerberos_principal_of_yojson "KerberosPrincipal") _list path;
     dns_ip_addresses =
       option_of_yojson (value_for_key dns_ip_list_of_yojson "DnsIpAddresses") _list path;
     authentication_type =
       option_of_yojson
         (value_for_key smb_authentication_type_of_yojson "AuthenticationType")
         _list path;
     mount_options =
       option_of_yojson (value_for_key smb_mount_options_of_yojson "MountOptions") _list path;
     agent_arns = option_of_yojson (value_for_key agent_arn_list_of_yojson "AgentArns") _list path;
     custom_secret_config =
       option_of_yojson
         (value_for_key custom_secret_config_of_yojson "CustomSecretConfig")
         _list path;
     cmk_secret_config =
       option_of_yojson (value_for_key cmk_secret_config_of_yojson "CmkSecretConfig") _list path;
     password = option_of_yojson (value_for_key smb_password_of_yojson "Password") _list path;
     domain = option_of_yojson (value_for_key smb_domain_of_yojson "Domain") _list path;
     user = option_of_yojson (value_for_key smb_user_of_yojson "User") _list path;
     server_hostname =
       option_of_yojson (value_for_key server_hostname_of_yojson "ServerHostname") _list path;
     subdirectory =
       option_of_yojson (value_for_key smb_subdirectory_of_yojson "Subdirectory") _list path;
     location_arn = value_for_key location_arn_of_yojson "LocationArn" _list path;
   }
    : update_location_smb_request)

let update_location_s3_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let s3_storage_class_of_yojson (tree : t) path =
  ((match tree with
    | `String "GLACIER_INSTANT_RETRIEVAL" -> GLACIER_INSTANT_RETRIEVAL
    | `String "OUTPOSTS" -> OUTPOSTS
    | `String "DEEP_ARCHIVE" -> DEEP_ARCHIVE
    | `String "GLACIER" -> GLACIER
    | `String "INTELLIGENT_TIERING" -> INTELLIGENT_TIERING
    | `String "ONEZONE_IA" -> ONEZONE_IA
    | `String "STANDARD_IA" -> STANDARD_IA
    | `String "STANDARD" -> STANDARD
    | `String value -> raise (deserialize_unknown_enum_value_error path "S3StorageClass" value)
    | _ -> raise (deserialize_wrong_type_error path "S3StorageClass")
     : s3_storage_class)
    : s3_storage_class)

let s3_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     bucket_access_role_arn = value_for_key iam_role_arn_of_yojson "BucketAccessRoleArn" _list path;
   }
    : s3_config)

let update_location_s3_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_config = option_of_yojson (value_for_key s3_config_of_yojson "S3Config") _list path;
     s3_storage_class =
       option_of_yojson (value_for_key s3_storage_class_of_yojson "S3StorageClass") _list path;
     subdirectory =
       option_of_yojson (value_for_key s3_subdirectory_of_yojson "Subdirectory") _list path;
     location_arn = value_for_key location_arn_of_yojson "LocationArn" _list path;
   }
    : update_location_s3_request)

let update_location_object_storage_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let object_storage_server_port_of_yojson = int_of_yojson

let object_storage_server_protocol_of_yojson (tree : t) path =
  ((match tree with
    | `String "HTTP" -> HTTP
    | `String "HTTPS" -> HTTPS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ObjectStorageServerProtocol" value)
    | _ -> raise (deserialize_wrong_type_error path "ObjectStorageServerProtocol")
     : object_storage_server_protocol)
    : object_storage_server_protocol)

let object_storage_access_key_of_yojson = string_of_yojson
let object_storage_secret_key_of_yojson = string_of_yojson
let object_storage_certificate_of_yojson = blob_of_yojson

let update_location_object_storage_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_secret_config =
       option_of_yojson
         (value_for_key custom_secret_config_of_yojson "CustomSecretConfig")
         _list path;
     cmk_secret_config =
       option_of_yojson (value_for_key cmk_secret_config_of_yojson "CmkSecretConfig") _list path;
     server_certificate =
       option_of_yojson
         (value_for_key object_storage_certificate_of_yojson "ServerCertificate")
         _list path;
     agent_arns = option_of_yojson (value_for_key agent_arn_list_of_yojson "AgentArns") _list path;
     secret_key =
       option_of_yojson (value_for_key object_storage_secret_key_of_yojson "SecretKey") _list path;
     access_key =
       option_of_yojson (value_for_key object_storage_access_key_of_yojson "AccessKey") _list path;
     server_hostname =
       option_of_yojson (value_for_key server_hostname_of_yojson "ServerHostname") _list path;
     subdirectory =
       option_of_yojson (value_for_key s3_subdirectory_of_yojson "Subdirectory") _list path;
     server_protocol =
       option_of_yojson
         (value_for_key object_storage_server_protocol_of_yojson "ServerProtocol")
         _list path;
     server_port =
       option_of_yojson (value_for_key object_storage_server_port_of_yojson "ServerPort") _list path;
     location_arn = value_for_key location_arn_of_yojson "LocationArn" _list path;
   }
    : update_location_object_storage_request)

let update_location_nfs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let nfs_subdirectory_of_yojson = string_of_yojson

let on_prem_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ agent_arns = value_for_key agent_arn_list_of_yojson "AgentArns" _list path } : on_prem_config)

let nfs_version_of_yojson (tree : t) path =
  ((match tree with
    | `String "NFS4_1" -> NFS4_1
    | `String "NFS4_0" -> NFS4_0
    | `String "NFS3" -> NFS3
    | `String "AUTOMATIC" -> AUTOMATIC
    | `String value -> raise (deserialize_unknown_enum_value_error path "NfsVersion" value)
    | _ -> raise (deserialize_wrong_type_error path "NfsVersion")
     : nfs_version)
    : nfs_version)

let nfs_mount_options_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ version = option_of_yojson (value_for_key nfs_version_of_yojson "Version") _list path }
    : nfs_mount_options)

let update_location_nfs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     mount_options =
       option_of_yojson (value_for_key nfs_mount_options_of_yojson "MountOptions") _list path;
     on_prem_config =
       option_of_yojson (value_for_key on_prem_config_of_yojson "OnPremConfig") _list path;
     server_hostname =
       option_of_yojson (value_for_key server_hostname_of_yojson "ServerHostname") _list path;
     subdirectory =
       option_of_yojson (value_for_key nfs_subdirectory_of_yojson "Subdirectory") _list path;
     location_arn = value_for_key location_arn_of_yojson "LocationArn" _list path;
   }
    : update_location_nfs_request)

let update_location_hdfs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let hdfs_subdirectory_of_yojson = string_of_yojson
let hdfs_server_hostname_of_yojson = string_of_yojson
let hdfs_server_port_of_yojson = int_of_yojson

let hdfs_name_node_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     port = value_for_key hdfs_server_port_of_yojson "Port" _list path;
     hostname = value_for_key hdfs_server_hostname_of_yojson "Hostname" _list path;
   }
    : hdfs_name_node)

let hdfs_name_node_list_of_yojson tree path = list_of_yojson hdfs_name_node_of_yojson tree path
let hdfs_block_size_of_yojson = int_of_yojson
let hdfs_replication_factor_of_yojson = int_of_yojson
let kms_key_provider_uri_of_yojson = string_of_yojson

let hdfs_rpc_protection_of_yojson (tree : t) path =
  ((match tree with
    | `String "PRIVACY" -> PRIVACY
    | `String "INTEGRITY" -> INTEGRITY
    | `String "AUTHENTICATION" -> AUTHENTICATION
    | `String "DISABLED" -> DISABLED
    | `String value -> raise (deserialize_unknown_enum_value_error path "HdfsRpcProtection" value)
    | _ -> raise (deserialize_wrong_type_error path "HdfsRpcProtection")
     : hdfs_rpc_protection)
    : hdfs_rpc_protection)

let hdfs_data_transfer_protection_of_yojson (tree : t) path =
  ((match tree with
    | `String "PRIVACY" -> PRIVACY
    | `String "INTEGRITY" -> INTEGRITY
    | `String "AUTHENTICATION" -> AUTHENTICATION
    | `String "DISABLED" -> DISABLED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "HdfsDataTransferProtection" value)
    | _ -> raise (deserialize_wrong_type_error path "HdfsDataTransferProtection")
     : hdfs_data_transfer_protection)
    : hdfs_data_transfer_protection)

let qop_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_transfer_protection =
       option_of_yojson
         (value_for_key hdfs_data_transfer_protection_of_yojson "DataTransferProtection")
         _list path;
     rpc_protection =
       option_of_yojson (value_for_key hdfs_rpc_protection_of_yojson "RpcProtection") _list path;
   }
    : qop_configuration)

let hdfs_authentication_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "KERBEROS" -> KERBEROS
    | `String "SIMPLE" -> SIMPLE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "HdfsAuthenticationType" value)
    | _ -> raise (deserialize_wrong_type_error path "HdfsAuthenticationType")
     : hdfs_authentication_type)
    : hdfs_authentication_type)

let hdfs_user_of_yojson = string_of_yojson

let update_location_hdfs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_secret_config =
       option_of_yojson
         (value_for_key custom_secret_config_of_yojson "CustomSecretConfig")
         _list path;
     cmk_secret_config =
       option_of_yojson (value_for_key cmk_secret_config_of_yojson "CmkSecretConfig") _list path;
     agent_arns = option_of_yojson (value_for_key agent_arn_list_of_yojson "AgentArns") _list path;
     kerberos_krb5_conf =
       option_of_yojson
         (value_for_key kerberos_krb5_conf_file_of_yojson "KerberosKrb5Conf")
         _list path;
     kerberos_keytab =
       option_of_yojson (value_for_key kerberos_keytab_file_of_yojson "KerberosKeytab") _list path;
     kerberos_principal =
       option_of_yojson (value_for_key kerberos_principal_of_yojson "KerberosPrincipal") _list path;
     simple_user = option_of_yojson (value_for_key hdfs_user_of_yojson "SimpleUser") _list path;
     authentication_type =
       option_of_yojson
         (value_for_key hdfs_authentication_type_of_yojson "AuthenticationType")
         _list path;
     qop_configuration =
       option_of_yojson (value_for_key qop_configuration_of_yojson "QopConfiguration") _list path;
     kms_key_provider_uri =
       option_of_yojson
         (value_for_key kms_key_provider_uri_of_yojson "KmsKeyProviderUri")
         _list path;
     replication_factor =
       option_of_yojson
         (value_for_key hdfs_replication_factor_of_yojson "ReplicationFactor")
         _list path;
     block_size = option_of_yojson (value_for_key hdfs_block_size_of_yojson "BlockSize") _list path;
     name_nodes =
       option_of_yojson (value_for_key hdfs_name_node_list_of_yojson "NameNodes") _list path;
     subdirectory =
       option_of_yojson (value_for_key hdfs_subdirectory_of_yojson "Subdirectory") _list path;
     location_arn = value_for_key location_arn_of_yojson "LocationArn" _list path;
   }
    : update_location_hdfs_request)

let update_location_fsx_windows_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let fsx_windows_subdirectory_of_yojson = string_of_yojson

let update_location_fsx_windows_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_secret_config =
       option_of_yojson
         (value_for_key custom_secret_config_of_yojson "CustomSecretConfig")
         _list path;
     cmk_secret_config =
       option_of_yojson (value_for_key cmk_secret_config_of_yojson "CmkSecretConfig") _list path;
     password = option_of_yojson (value_for_key smb_password_of_yojson "Password") _list path;
     user = option_of_yojson (value_for_key smb_user_of_yojson "User") _list path;
     domain = option_of_yojson (value_for_key update_smb_domain_of_yojson "Domain") _list path;
     subdirectory =
       option_of_yojson (value_for_key fsx_windows_subdirectory_of_yojson "Subdirectory") _list path;
     location_arn = value_for_key location_arn_of_yojson "LocationArn" _list path;
   }
    : update_location_fsx_windows_request)

let update_location_fsx_open_zfs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let fsx_protocol_nfs_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     mount_options =
       option_of_yojson (value_for_key nfs_mount_options_of_yojson "MountOptions") _list path;
   }
    : fsx_protocol_nfs)

let managed_secret_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ secret_arn = option_of_yojson (value_for_key secret_arn_of_yojson "SecretArn") _list path }
    : managed_secret_config)

let fsx_protocol_smb_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_secret_config =
       option_of_yojson
         (value_for_key custom_secret_config_of_yojson "CustomSecretConfig")
         _list path;
     cmk_secret_config =
       option_of_yojson (value_for_key cmk_secret_config_of_yojson "CmkSecretConfig") _list path;
     managed_secret_config =
       option_of_yojson
         (value_for_key managed_secret_config_of_yojson "ManagedSecretConfig")
         _list path;
     user = value_for_key smb_user_of_yojson "User" _list path;
     password = option_of_yojson (value_for_key smb_password_of_yojson "Password") _list path;
     mount_options =
       option_of_yojson (value_for_key smb_mount_options_of_yojson "MountOptions") _list path;
     domain = option_of_yojson (value_for_key smb_domain_of_yojson "Domain") _list path;
   }
    : fsx_protocol_smb)

let fsx_protocol_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sm_b = option_of_yojson (value_for_key fsx_protocol_smb_of_yojson "SMB") _list path;
     nf_s = option_of_yojson (value_for_key fsx_protocol_nfs_of_yojson "NFS") _list path;
   }
    : fsx_protocol)

let update_location_fsx_open_zfs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subdirectory =
       option_of_yojson (value_for_key smb_subdirectory_of_yojson "Subdirectory") _list path;
     protocol = option_of_yojson (value_for_key fsx_protocol_of_yojson "Protocol") _list path;
     location_arn = value_for_key location_arn_of_yojson "LocationArn" _list path;
   }
    : update_location_fsx_open_zfs_request)

let update_location_fsx_ontap_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let fsx_update_protocol_smb_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_secret_config =
       option_of_yojson
         (value_for_key custom_secret_config_of_yojson "CustomSecretConfig")
         _list path;
     cmk_secret_config =
       option_of_yojson (value_for_key cmk_secret_config_of_yojson "CmkSecretConfig") _list path;
     user = option_of_yojson (value_for_key smb_user_of_yojson "User") _list path;
     password = option_of_yojson (value_for_key smb_password_of_yojson "Password") _list path;
     mount_options =
       option_of_yojson (value_for_key smb_mount_options_of_yojson "MountOptions") _list path;
     domain = option_of_yojson (value_for_key update_smb_domain_of_yojson "Domain") _list path;
   }
    : fsx_update_protocol_smb)

let fsx_update_protocol_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sm_b = option_of_yojson (value_for_key fsx_update_protocol_smb_of_yojson "SMB") _list path;
     nf_s = option_of_yojson (value_for_key fsx_protocol_nfs_of_yojson "NFS") _list path;
   }
    : fsx_update_protocol)

let fsx_ontap_subdirectory_of_yojson = string_of_yojson

let update_location_fsx_ontap_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subdirectory =
       option_of_yojson (value_for_key fsx_ontap_subdirectory_of_yojson "Subdirectory") _list path;
     protocol = option_of_yojson (value_for_key fsx_update_protocol_of_yojson "Protocol") _list path;
     location_arn = value_for_key location_arn_of_yojson "LocationArn" _list path;
   }
    : update_location_fsx_ontap_request)

let update_location_fsx_lustre_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_location_fsx_lustre_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subdirectory =
       option_of_yojson (value_for_key smb_subdirectory_of_yojson "Subdirectory") _list path;
     location_arn = value_for_key location_arn_of_yojson "LocationArn" _list path;
   }
    : update_location_fsx_lustre_request)

let update_location_efs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let efs_subdirectory_of_yojson = string_of_yojson

let efs_in_transit_encryption_of_yojson (tree : t) path =
  ((match tree with
    | `String "TLS1_2" -> TLS1_2
    | `String "NONE" -> NONE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "EfsInTransitEncryption" value)
    | _ -> raise (deserialize_wrong_type_error path "EfsInTransitEncryption")
     : efs_in_transit_encryption)
    : efs_in_transit_encryption)

let update_location_efs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     in_transit_encryption =
       option_of_yojson
         (value_for_key efs_in_transit_encryption_of_yojson "InTransitEncryption")
         _list path;
     file_system_access_role_arn =
       option_of_yojson
         (value_for_key updated_efs_iam_role_arn_of_yojson "FileSystemAccessRoleArn")
         _list path;
     access_point_arn =
       option_of_yojson
         (value_for_key updated_efs_access_point_arn_of_yojson "AccessPointArn")
         _list path;
     subdirectory =
       option_of_yojson (value_for_key efs_subdirectory_of_yojson "Subdirectory") _list path;
     location_arn = value_for_key location_arn_of_yojson "LocationArn" _list path;
   }
    : update_location_efs_request)

let update_location_azure_blob_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let azure_blob_subdirectory_of_yojson = string_of_yojson

let azure_blob_authentication_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "NONE" -> NONE
    | `String "SAS" -> SAS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AzureBlobAuthenticationType" value)
    | _ -> raise (deserialize_wrong_type_error path "AzureBlobAuthenticationType")
     : azure_blob_authentication_type)
    : azure_blob_authentication_type)

let azure_blob_sas_token_of_yojson = string_of_yojson

let azure_blob_sas_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ token = value_for_key azure_blob_sas_token_of_yojson "Token" _list path }
    : azure_blob_sas_configuration)

let azure_blob_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "BLOCK" -> BLOCK
    | `String value -> raise (deserialize_unknown_enum_value_error path "AzureBlobType" value)
    | _ -> raise (deserialize_wrong_type_error path "AzureBlobType")
     : azure_blob_type)
    : azure_blob_type)

let azure_access_tier_of_yojson (tree : t) path =
  ((match tree with
    | `String "ARCHIVE" -> ARCHIVE
    | `String "COOL" -> COOL
    | `String "HOT" -> HOT
    | `String value -> raise (deserialize_unknown_enum_value_error path "AzureAccessTier" value)
    | _ -> raise (deserialize_wrong_type_error path "AzureAccessTier")
     : azure_access_tier)
    : azure_access_tier)

let update_location_azure_blob_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_secret_config =
       option_of_yojson
         (value_for_key custom_secret_config_of_yojson "CustomSecretConfig")
         _list path;
     cmk_secret_config =
       option_of_yojson (value_for_key cmk_secret_config_of_yojson "CmkSecretConfig") _list path;
     agent_arns = option_of_yojson (value_for_key agent_arn_list_of_yojson "AgentArns") _list path;
     access_tier =
       option_of_yojson (value_for_key azure_access_tier_of_yojson "AccessTier") _list path;
     blob_type = option_of_yojson (value_for_key azure_blob_type_of_yojson "BlobType") _list path;
     sas_configuration =
       option_of_yojson
         (value_for_key azure_blob_sas_configuration_of_yojson "SasConfiguration")
         _list path;
     authentication_type =
       option_of_yojson
         (value_for_key azure_blob_authentication_type_of_yojson "AuthenticationType")
         _list path;
     subdirectory =
       option_of_yojson (value_for_key azure_blob_subdirectory_of_yojson "Subdirectory") _list path;
     location_arn = value_for_key location_arn_of_yojson "LocationArn" _list path;
   }
    : update_location_azure_blob_request)

let update_agent_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let update_agent_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key tag_value_of_yojson "Name") _list path;
     agent_arn = value_for_key agent_arn_of_yojson "AgentArn" _list path;
   }
    : update_agent_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let taggable_resource_arn_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     keys = value_for_key tag_key_list_of_yojson "Keys" _list path;
     resource_arn = value_for_key taggable_resource_arn_of_yojson "ResourceArn" _list path;
   }
    : untag_resource_request)

let time_of_yojson = timestamp_epoch_seconds_of_yojson

let task_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "UNAVAILABLE" -> UNAVAILABLE
    | `String "RUNNING" -> RUNNING
    | `String "QUEUED" -> QUEUED
    | `String "CREATING" -> CREATING
    | `String "AVAILABLE" -> AVAILABLE
    | `String value -> raise (deserialize_unknown_enum_value_error path "TaskStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "TaskStatus")
     : task_status)
    : task_status)

let schedule_disabled_reason_of_yojson = string_of_yojson

let schedule_disabled_by_of_yojson (tree : t) path =
  ((match tree with
    | `String "SERVICE" -> SERVICE
    | `String "USER" -> USER
    | `String value -> raise (deserialize_unknown_enum_value_error path "ScheduleDisabledBy" value)
    | _ -> raise (deserialize_wrong_type_error path "ScheduleDisabledBy")
     : schedule_disabled_by)
    : schedule_disabled_by)

let task_schedule_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     disabled_by =
       option_of_yojson (value_for_key schedule_disabled_by_of_yojson "DisabledBy") _list path;
     disabled_reason =
       option_of_yojson
         (value_for_key schedule_disabled_reason_of_yojson "DisabledReason")
         _list path;
     status_update_time =
       option_of_yojson (value_for_key time_of_yojson "StatusUpdateTime") _list path;
   }
    : task_schedule_details)

let task_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "ENHANCED" -> ENHANCED
    | `String "BASIC" -> BASIC
    | `String value -> raise (deserialize_unknown_enum_value_error path "TaskMode" value)
    | _ -> raise (deserialize_wrong_type_error path "TaskMode")
     : task_mode)
    : task_mode)

let task_list_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_mode = option_of_yojson (value_for_key task_mode_of_yojson "TaskMode") _list path;
     name = option_of_yojson (value_for_key tag_value_of_yojson "Name") _list path;
     status = option_of_yojson (value_for_key task_status_of_yojson "Status") _list path;
     task_arn = option_of_yojson (value_for_key task_arn_of_yojson "TaskArn") _list path;
   }
    : task_list_entry)

let task_list_of_yojson tree path = list_of_yojson task_list_entry_of_yojson tree path

let task_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "CreationTime" -> CreationTime
    | `String "LocationId" -> LocationId
    | `String value -> raise (deserialize_unknown_enum_value_error path "TaskFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "TaskFilterName")
     : task_filter_name)
    : task_filter_name)

let filter_attribute_value_of_yojson = string_of_yojson
let filter_values_of_yojson tree path = list_of_yojson filter_attribute_value_of_yojson tree path

let operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "BeginsWith" -> BEGINS_WITH
    | `String "NotContains" -> NOT_CONTAINS
    | `String "Contains" -> CONTAINS
    | `String "GreaterThan" -> GT
    | `String "GreaterThanOrEqual" -> GE
    | `String "LessThan" -> LT
    | `String "LessThanOrEqual" -> LE
    | `String "In" -> IN
    | `String "NotEquals" -> NE
    | `String "Equals" -> EQ
    | `String value -> raise (deserialize_unknown_enum_value_error path "Operator" value)
    | _ -> raise (deserialize_wrong_type_error path "Operator")
     : operator)
    : operator)

let task_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operator = value_for_key operator_of_yojson "Operator" _list path;
     values = value_for_key filter_values_of_yojson "Values" _list path;
     name = value_for_key task_filter_name_of_yojson "Name" _list path;
   }
    : task_filter)

let task_filters_of_yojson tree path = list_of_yojson task_filter_of_yojson tree path

let task_execution_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ERROR" -> ERROR
    | `String "SUCCESS" -> SUCCESS
    | `String "VERIFYING" -> VERIFYING
    | `String "TRANSFERRING" -> TRANSFERRING
    | `String "PREPARING" -> PREPARING
    | `String "LAUNCHING" -> LAUNCHING
    | `String "CANCELLING" -> CANCELLING
    | `String "QUEUED" -> QUEUED
    | `String value -> raise (deserialize_unknown_enum_value_error path "TaskExecutionStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "TaskExecutionStatus")
     : task_execution_status)
    : task_execution_status)

let duration_of_yojson = long_of_yojson

let phase_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ERROR" -> ERROR
    | `String "SUCCESS" -> SUCCESS
    | `String "PENDING" -> PENDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "PhaseStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "PhaseStatus")
     : phase_status)
    : phase_status)

let task_execution_result_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_detail = option_of_yojson (value_for_key string__of_yojson "ErrorDetail") _list path;
     error_code = option_of_yojson (value_for_key string__of_yojson "ErrorCode") _list path;
     verify_status =
       option_of_yojson (value_for_key phase_status_of_yojson "VerifyStatus") _list path;
     verify_duration =
       option_of_yojson (value_for_key duration_of_yojson "VerifyDuration") _list path;
     transfer_status =
       option_of_yojson (value_for_key phase_status_of_yojson "TransferStatus") _list path;
     transfer_duration =
       option_of_yojson (value_for_key duration_of_yojson "TransferDuration") _list path;
     total_duration = option_of_yojson (value_for_key duration_of_yojson "TotalDuration") _list path;
     prepare_status =
       option_of_yojson (value_for_key phase_status_of_yojson "PrepareStatus") _list path;
     prepare_duration =
       option_of_yojson (value_for_key duration_of_yojson "PrepareDuration") _list path;
   }
    : task_execution_result_detail)

let task_execution_list_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_mode = option_of_yojson (value_for_key task_mode_of_yojson "TaskMode") _list path;
     status = option_of_yojson (value_for_key task_execution_status_of_yojson "Status") _list path;
     task_execution_arn =
       option_of_yojson (value_for_key task_execution_arn_of_yojson "TaskExecutionArn") _list path;
   }
    : task_execution_list_entry)

let task_execution_list_of_yojson tree path =
  list_of_yojson task_execution_list_entry_of_yojson tree path

let task_execution_folders_listed_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     at_destination_for_delete =
       option_of_yojson (value_for_key long_of_yojson "AtDestinationForDelete") _list path;
     at_source = option_of_yojson (value_for_key long_of_yojson "AtSource") _list path;
   }
    : task_execution_folders_listed_detail)

let task_execution_folders_failed_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delete = option_of_yojson (value_for_key long_of_yojson "Delete") _list path;
     verify = option_of_yojson (value_for_key long_of_yojson "Verify") _list path;
     transfer = option_of_yojson (value_for_key long_of_yojson "Transfer") _list path;
     prepare = option_of_yojson (value_for_key long_of_yojson "Prepare") _list path;
     list_ = option_of_yojson (value_for_key long_of_yojson "List") _list path;
   }
    : task_execution_folders_failed_detail)

let task_execution_files_listed_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     at_destination_for_delete =
       option_of_yojson (value_for_key long_of_yojson "AtDestinationForDelete") _list path;
     at_source = option_of_yojson (value_for_key long_of_yojson "AtSource") _list path;
   }
    : task_execution_files_listed_detail)

let task_execution_files_failed_detail_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     delete = option_of_yojson (value_for_key long_of_yojson "Delete") _list path;
     verify = option_of_yojson (value_for_key long_of_yojson "Verify") _list path;
     transfer = option_of_yojson (value_for_key long_of_yojson "Transfer") _list path;
     prepare = option_of_yojson (value_for_key long_of_yojson "Prepare") _list path;
   }
    : task_execution_files_failed_detail)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_list_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key tag_value_of_yojson "Value") _list path;
     key = value_for_key tag_key_of_yojson "Key" _list path;
   }
    : tag_list_entry)

let input_tag_list_of_yojson tree path = list_of_yojson tag_list_entry_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key input_tag_list_of_yojson "Tags" _list path;
     resource_arn = value_for_key taggable_resource_arn_of_yojson "ResourceArn" _list path;
   }
    : tag_resource_request)

let storage_virtual_machine_arn_of_yojson = string_of_yojson

let start_task_execution_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_execution_arn =
       option_of_yojson (value_for_key task_execution_arn_of_yojson "TaskExecutionArn") _list path;
   }
    : start_task_execution_response)

let start_task_execution_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key input_tag_list_of_yojson "Tags") _list path;
     task_report_config =
       option_of_yojson (value_for_key task_report_config_of_yojson "TaskReportConfig") _list path;
     manifest_config =
       option_of_yojson (value_for_key manifest_config_of_yojson "ManifestConfig") _list path;
     excludes = option_of_yojson (value_for_key filter_list_of_yojson "Excludes") _list path;
     includes = option_of_yojson (value_for_key filter_list_of_yojson "Includes") _list path;
     override_options =
       option_of_yojson (value_for_key options_of_yojson "OverrideOptions") _list path;
     task_arn = value_for_key task_arn_of_yojson "TaskArn" _list path;
   }
    : start_task_execution_request)

let network_interface_arn_of_yojson = string_of_yojson

let source_network_interface_arns_of_yojson tree path =
  list_of_yojson network_interface_arn_of_yojson tree path

let report_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_detail = option_of_yojson (value_for_key string__of_yojson "ErrorDetail") _list path;
     error_code = option_of_yojson (value_for_key string__of_yojson "ErrorCode") _list path;
     status = option_of_yojson (value_for_key phase_status_of_yojson "Status") _list path;
   }
    : report_result)

let endpoint_of_yojson = string_of_yojson
let ec2_subnet_arn_of_yojson = string_of_yojson
let pl_subnet_arn_list_of_yojson tree path = list_of_yojson ec2_subnet_arn_of_yojson tree path
let ec2_security_group_arn_of_yojson = string_of_yojson

let pl_security_group_arn_list_of_yojson tree path =
  list_of_yojson ec2_security_group_arn_of_yojson tree path

let private_link_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     security_group_arns =
       option_of_yojson
         (value_for_key pl_security_group_arn_list_of_yojson "SecurityGroupArns")
         _list path;
     subnet_arns =
       option_of_yojson (value_for_key pl_subnet_arn_list_of_yojson "SubnetArns") _list path;
     private_link_endpoint =
       option_of_yojson (value_for_key endpoint_of_yojson "PrivateLinkEndpoint") _list path;
     vpc_endpoint_id =
       option_of_yojson (value_for_key vpc_endpoint_id_of_yojson "VpcEndpointId") _list path;
   }
    : private_link_config)

let agent_version_of_yojson = string_of_yojson

let platform_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ version = option_of_yojson (value_for_key agent_version_of_yojson "Version") _list path }
    : platform)

let output_tag_list_of_yojson tree path = list_of_yojson tag_list_entry_of_yojson tree path
let object_storage_bucket_name_of_yojson = string_of_yojson
let next_token_of_yojson = string_of_yojson
let max_results_of_yojson = int_of_yojson
let location_uri_of_yojson = string_of_yojson

let location_list_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     location_uri = option_of_yojson (value_for_key location_uri_of_yojson "LocationUri") _list path;
     location_arn = option_of_yojson (value_for_key location_arn_of_yojson "LocationArn") _list path;
   }
    : location_list_entry)

let location_list_of_yojson tree path = list_of_yojson location_list_entry_of_yojson tree path

let location_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "CreationTime" -> CreationTime
    | `String "LocationType" -> LocationType
    | `String "LocationUri" -> LocationUri
    | `String value -> raise (deserialize_unknown_enum_value_error path "LocationFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "LocationFilterName")
     : location_filter_name)
    : location_filter_name)

let location_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     operator = value_for_key operator_of_yojson "Operator" _list path;
     values = value_for_key filter_values_of_yojson "Values" _list path;
     name = value_for_key location_filter_name_of_yojson "Name" _list path;
   }
    : location_filter)

let location_filters_of_yojson tree path = list_of_yojson location_filter_of_yojson tree path

let list_tasks_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     tasks = option_of_yojson (value_for_key task_list_of_yojson "Tasks") _list path;
   }
    : list_tasks_response)

let list_tasks_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key task_filters_of_yojson "Filters") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_tasks_request)

let list_task_executions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     task_executions =
       option_of_yojson (value_for_key task_execution_list_of_yojson "TaskExecutions") _list path;
   }
    : list_task_executions_response)

let list_task_executions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     task_arn = option_of_yojson (value_for_key task_arn_of_yojson "TaskArn") _list path;
   }
    : list_task_executions_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     tags = option_of_yojson (value_for_key output_tag_list_of_yojson "Tags") _list path;
   }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     resource_arn = value_for_key taggable_resource_arn_of_yojson "ResourceArn" _list path;
   }
    : list_tags_for_resource_request)

let list_locations_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     locations = option_of_yojson (value_for_key location_list_of_yojson "Locations") _list path;
   }
    : list_locations_response)

let list_locations_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key location_filters_of_yojson "Filters") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_locations_request)

let agent_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "OFFLINE" -> OFFLINE
    | `String "ONLINE" -> ONLINE
    | `String value -> raise (deserialize_unknown_enum_value_error path "AgentStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AgentStatus")
     : agent_status)
    : agent_status)

let agent_list_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     platform = option_of_yojson (value_for_key platform_of_yojson "Platform") _list path;
     status = option_of_yojson (value_for_key agent_status_of_yojson "Status") _list path;
     name = option_of_yojson (value_for_key tag_value_of_yojson "Name") _list path;
     agent_arn = option_of_yojson (value_for_key agent_arn_of_yojson "AgentArn") _list path;
   }
    : agent_list_entry)

let agent_list_of_yojson tree path = list_of_yojson agent_list_entry_of_yojson tree path

let list_agents_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     agents = option_of_yojson (value_for_key agent_list_of_yojson "Agents") _list path;
   }
    : list_agents_response)

let list_agents_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_agents_request)

let item_count_of_yojson = long_of_yojson
let fsx_open_zfs_subdirectory_of_yojson = string_of_yojson
let fsx_lustre_subdirectory_of_yojson = string_of_yojson
let fsx_filesystem_arn_of_yojson = string_of_yojson

let describe_task_execution_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     end_time = option_of_yojson (value_for_key time_of_yojson "EndTime") _list path;
     launch_time = option_of_yojson (value_for_key time_of_yojson "LaunchTime") _list path;
     folders_failed =
       option_of_yojson
         (value_for_key task_execution_folders_failed_detail_of_yojson "FoldersFailed")
         _list path;
     folders_listed =
       option_of_yojson
         (value_for_key task_execution_folders_listed_detail_of_yojson "FoldersListed")
         _list path;
     folders_deleted =
       option_of_yojson (value_for_key item_count_of_yojson "FoldersDeleted") _list path;
     folders_verified =
       option_of_yojson (value_for_key item_count_of_yojson "FoldersVerified") _list path;
     folders_transferred =
       option_of_yojson (value_for_key item_count_of_yojson "FoldersTransferred") _list path;
     folders_prepared =
       option_of_yojson (value_for_key item_count_of_yojson "FoldersPrepared") _list path;
     folders_skipped =
       option_of_yojson (value_for_key item_count_of_yojson "FoldersSkipped") _list path;
     estimated_folders_to_transfer =
       option_of_yojson (value_for_key item_count_of_yojson "EstimatedFoldersToTransfer") _list path;
     estimated_folders_to_delete =
       option_of_yojson (value_for_key item_count_of_yojson "EstimatedFoldersToDelete") _list path;
     files_failed =
       option_of_yojson
         (value_for_key task_execution_files_failed_detail_of_yojson "FilesFailed")
         _list path;
     files_listed =
       option_of_yojson
         (value_for_key task_execution_files_listed_detail_of_yojson "FilesListed")
         _list path;
     files_prepared = option_of_yojson (value_for_key long_of_yojson "FilesPrepared") _list path;
     task_mode = option_of_yojson (value_for_key task_mode_of_yojson "TaskMode") _list path;
     estimated_files_to_delete =
       option_of_yojson (value_for_key long_of_yojson "EstimatedFilesToDelete") _list path;
     report_result =
       option_of_yojson (value_for_key report_result_of_yojson "ReportResult") _list path;
     files_verified = option_of_yojson (value_for_key long_of_yojson "FilesVerified") _list path;
     files_skipped = option_of_yojson (value_for_key long_of_yojson "FilesSkipped") _list path;
     files_deleted = option_of_yojson (value_for_key long_of_yojson "FilesDeleted") _list path;
     task_report_config =
       option_of_yojson (value_for_key task_report_config_of_yojson "TaskReportConfig") _list path;
     result_ =
       option_of_yojson (value_for_key task_execution_result_detail_of_yojson "Result") _list path;
     bytes_compressed = option_of_yojson (value_for_key long_of_yojson "BytesCompressed") _list path;
     bytes_transferred =
       option_of_yojson (value_for_key long_of_yojson "BytesTransferred") _list path;
     bytes_written = option_of_yojson (value_for_key long_of_yojson "BytesWritten") _list path;
     files_transferred =
       option_of_yojson (value_for_key long_of_yojson "FilesTransferred") _list path;
     estimated_bytes_to_transfer =
       option_of_yojson (value_for_key long_of_yojson "EstimatedBytesToTransfer") _list path;
     estimated_files_to_transfer =
       option_of_yojson (value_for_key long_of_yojson "EstimatedFilesToTransfer") _list path;
     start_time = option_of_yojson (value_for_key time_of_yojson "StartTime") _list path;
     manifest_config =
       option_of_yojson (value_for_key manifest_config_of_yojson "ManifestConfig") _list path;
     includes = option_of_yojson (value_for_key filter_list_of_yojson "Includes") _list path;
     excludes = option_of_yojson (value_for_key filter_list_of_yojson "Excludes") _list path;
     options = option_of_yojson (value_for_key options_of_yojson "Options") _list path;
     status = option_of_yojson (value_for_key task_execution_status_of_yojson "Status") _list path;
     task_execution_arn =
       option_of_yojson (value_for_key task_execution_arn_of_yojson "TaskExecutionArn") _list path;
   }
    : describe_task_execution_response)

let describe_task_execution_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ task_execution_arn = value_for_key task_execution_arn_of_yojson "TaskExecutionArn" _list path }
    : describe_task_execution_request)

let destination_network_interface_arns_of_yojson tree path =
  list_of_yojson network_interface_arn_of_yojson tree path

let describe_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_mode = option_of_yojson (value_for_key task_mode_of_yojson "TaskMode") _list path;
     schedule_details =
       option_of_yojson (value_for_key task_schedule_details_of_yojson "ScheduleDetails") _list path;
     task_report_config =
       option_of_yojson (value_for_key task_report_config_of_yojson "TaskReportConfig") _list path;
     manifest_config =
       option_of_yojson (value_for_key manifest_config_of_yojson "ManifestConfig") _list path;
     includes = option_of_yojson (value_for_key filter_list_of_yojson "Includes") _list path;
     creation_time = option_of_yojson (value_for_key time_of_yojson "CreationTime") _list path;
     error_detail = option_of_yojson (value_for_key string__of_yojson "ErrorDetail") _list path;
     error_code = option_of_yojson (value_for_key string__of_yojson "ErrorCode") _list path;
     schedule = option_of_yojson (value_for_key task_schedule_of_yojson "Schedule") _list path;
     excludes = option_of_yojson (value_for_key filter_list_of_yojson "Excludes") _list path;
     options = option_of_yojson (value_for_key options_of_yojson "Options") _list path;
     destination_network_interface_arns =
       option_of_yojson
         (value_for_key destination_network_interface_arns_of_yojson
            "DestinationNetworkInterfaceArns")
         _list path;
     source_network_interface_arns =
       option_of_yojson
         (value_for_key source_network_interface_arns_of_yojson "SourceNetworkInterfaceArns")
         _list path;
     cloud_watch_log_group_arn =
       option_of_yojson (value_for_key log_group_arn_of_yojson "CloudWatchLogGroupArn") _list path;
     destination_location_arn =
       option_of_yojson (value_for_key location_arn_of_yojson "DestinationLocationArn") _list path;
     source_location_arn =
       option_of_yojson (value_for_key location_arn_of_yojson "SourceLocationArn") _list path;
     current_task_execution_arn =
       option_of_yojson
         (value_for_key task_execution_arn_of_yojson "CurrentTaskExecutionArn")
         _list path;
     name = option_of_yojson (value_for_key tag_value_of_yojson "Name") _list path;
     status = option_of_yojson (value_for_key task_status_of_yojson "Status") _list path;
     task_arn = option_of_yojson (value_for_key task_arn_of_yojson "TaskArn") _list path;
   }
    : describe_task_response)

let describe_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ task_arn = value_for_key task_arn_of_yojson "TaskArn" _list path } : describe_task_request)

let describe_location_smb_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_secret_config =
       option_of_yojson
         (value_for_key custom_secret_config_of_yojson "CustomSecretConfig")
         _list path;
     cmk_secret_config =
       option_of_yojson (value_for_key cmk_secret_config_of_yojson "CmkSecretConfig") _list path;
     managed_secret_config =
       option_of_yojson
         (value_for_key managed_secret_config_of_yojson "ManagedSecretConfig")
         _list path;
     authentication_type =
       option_of_yojson
         (value_for_key smb_authentication_type_of_yojson "AuthenticationType")
         _list path;
     kerberos_principal =
       option_of_yojson (value_for_key kerberos_principal_of_yojson "KerberosPrincipal") _list path;
     dns_ip_addresses =
       option_of_yojson (value_for_key dns_ip_list_of_yojson "DnsIpAddresses") _list path;
     creation_time = option_of_yojson (value_for_key time_of_yojson "CreationTime") _list path;
     mount_options =
       option_of_yojson (value_for_key smb_mount_options_of_yojson "MountOptions") _list path;
     domain = option_of_yojson (value_for_key smb_domain_of_yojson "Domain") _list path;
     user = option_of_yojson (value_for_key smb_user_of_yojson "User") _list path;
     agent_arns = option_of_yojson (value_for_key agent_arn_list_of_yojson "AgentArns") _list path;
     location_uri = option_of_yojson (value_for_key location_uri_of_yojson "LocationUri") _list path;
     location_arn = option_of_yojson (value_for_key location_arn_of_yojson "LocationArn") _list path;
   }
    : describe_location_smb_response)

let describe_location_smb_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ location_arn = value_for_key location_arn_of_yojson "LocationArn" _list path }
    : describe_location_smb_request)

let describe_location_s3_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_time = option_of_yojson (value_for_key time_of_yojson "CreationTime") _list path;
     agent_arns = option_of_yojson (value_for_key agent_arn_list_of_yojson "AgentArns") _list path;
     s3_config = option_of_yojson (value_for_key s3_config_of_yojson "S3Config") _list path;
     s3_storage_class =
       option_of_yojson (value_for_key s3_storage_class_of_yojson "S3StorageClass") _list path;
     location_uri = option_of_yojson (value_for_key location_uri_of_yojson "LocationUri") _list path;
     location_arn = option_of_yojson (value_for_key location_arn_of_yojson "LocationArn") _list path;
   }
    : describe_location_s3_response)

let describe_location_s3_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ location_arn = value_for_key location_arn_of_yojson "LocationArn" _list path }
    : describe_location_s3_request)

let describe_location_object_storage_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_secret_config =
       option_of_yojson
         (value_for_key custom_secret_config_of_yojson "CustomSecretConfig")
         _list path;
     cmk_secret_config =
       option_of_yojson (value_for_key cmk_secret_config_of_yojson "CmkSecretConfig") _list path;
     managed_secret_config =
       option_of_yojson
         (value_for_key managed_secret_config_of_yojson "ManagedSecretConfig")
         _list path;
     server_certificate =
       option_of_yojson
         (value_for_key object_storage_certificate_of_yojson "ServerCertificate")
         _list path;
     creation_time = option_of_yojson (value_for_key time_of_yojson "CreationTime") _list path;
     agent_arns = option_of_yojson (value_for_key agent_arn_list_of_yojson "AgentArns") _list path;
     server_protocol =
       option_of_yojson
         (value_for_key object_storage_server_protocol_of_yojson "ServerProtocol")
         _list path;
     server_port =
       option_of_yojson (value_for_key object_storage_server_port_of_yojson "ServerPort") _list path;
     access_key =
       option_of_yojson (value_for_key object_storage_access_key_of_yojson "AccessKey") _list path;
     location_uri = option_of_yojson (value_for_key location_uri_of_yojson "LocationUri") _list path;
     location_arn = option_of_yojson (value_for_key location_arn_of_yojson "LocationArn") _list path;
   }
    : describe_location_object_storage_response)

let describe_location_object_storage_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ location_arn = value_for_key location_arn_of_yojson "LocationArn" _list path }
    : describe_location_object_storage_request)

let describe_location_nfs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_time = option_of_yojson (value_for_key time_of_yojson "CreationTime") _list path;
     mount_options =
       option_of_yojson (value_for_key nfs_mount_options_of_yojson "MountOptions") _list path;
     on_prem_config =
       option_of_yojson (value_for_key on_prem_config_of_yojson "OnPremConfig") _list path;
     location_uri = option_of_yojson (value_for_key location_uri_of_yojson "LocationUri") _list path;
     location_arn = option_of_yojson (value_for_key location_arn_of_yojson "LocationArn") _list path;
   }
    : describe_location_nfs_response)

let describe_location_nfs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ location_arn = value_for_key location_arn_of_yojson "LocationArn" _list path }
    : describe_location_nfs_request)

let describe_location_hdfs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_secret_config =
       option_of_yojson
         (value_for_key custom_secret_config_of_yojson "CustomSecretConfig")
         _list path;
     cmk_secret_config =
       option_of_yojson (value_for_key cmk_secret_config_of_yojson "CmkSecretConfig") _list path;
     managed_secret_config =
       option_of_yojson
         (value_for_key managed_secret_config_of_yojson "ManagedSecretConfig")
         _list path;
     creation_time = option_of_yojson (value_for_key time_of_yojson "CreationTime") _list path;
     agent_arns = option_of_yojson (value_for_key agent_arn_list_of_yojson "AgentArns") _list path;
     kerberos_principal =
       option_of_yojson (value_for_key kerberos_principal_of_yojson "KerberosPrincipal") _list path;
     simple_user = option_of_yojson (value_for_key hdfs_user_of_yojson "SimpleUser") _list path;
     authentication_type =
       option_of_yojson
         (value_for_key hdfs_authentication_type_of_yojson "AuthenticationType")
         _list path;
     qop_configuration =
       option_of_yojson (value_for_key qop_configuration_of_yojson "QopConfiguration") _list path;
     kms_key_provider_uri =
       option_of_yojson
         (value_for_key kms_key_provider_uri_of_yojson "KmsKeyProviderUri")
         _list path;
     replication_factor =
       option_of_yojson
         (value_for_key hdfs_replication_factor_of_yojson "ReplicationFactor")
         _list path;
     block_size = option_of_yojson (value_for_key hdfs_block_size_of_yojson "BlockSize") _list path;
     name_nodes =
       option_of_yojson (value_for_key hdfs_name_node_list_of_yojson "NameNodes") _list path;
     location_uri = option_of_yojson (value_for_key location_uri_of_yojson "LocationUri") _list path;
     location_arn = option_of_yojson (value_for_key location_arn_of_yojson "LocationArn") _list path;
   }
    : describe_location_hdfs_response)

let describe_location_hdfs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ location_arn = value_for_key location_arn_of_yojson "LocationArn" _list path }
    : describe_location_hdfs_request)

let ec2_security_group_arn_list_of_yojson tree path =
  list_of_yojson ec2_security_group_arn_of_yojson tree path

let describe_location_fsx_windows_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_secret_config =
       option_of_yojson
         (value_for_key custom_secret_config_of_yojson "CustomSecretConfig")
         _list path;
     cmk_secret_config =
       option_of_yojson (value_for_key cmk_secret_config_of_yojson "CmkSecretConfig") _list path;
     managed_secret_config =
       option_of_yojson
         (value_for_key managed_secret_config_of_yojson "ManagedSecretConfig")
         _list path;
     domain = option_of_yojson (value_for_key smb_domain_of_yojson "Domain") _list path;
     user = option_of_yojson (value_for_key smb_user_of_yojson "User") _list path;
     creation_time = option_of_yojson (value_for_key time_of_yojson "CreationTime") _list path;
     security_group_arns =
       option_of_yojson
         (value_for_key ec2_security_group_arn_list_of_yojson "SecurityGroupArns")
         _list path;
     location_uri = option_of_yojson (value_for_key location_uri_of_yojson "LocationUri") _list path;
     location_arn = option_of_yojson (value_for_key location_arn_of_yojson "LocationArn") _list path;
   }
    : describe_location_fsx_windows_response)

let describe_location_fsx_windows_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ location_arn = value_for_key location_arn_of_yojson "LocationArn" _list path }
    : describe_location_fsx_windows_request)

let describe_location_fsx_open_zfs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_time = option_of_yojson (value_for_key time_of_yojson "CreationTime") _list path;
     protocol = option_of_yojson (value_for_key fsx_protocol_of_yojson "Protocol") _list path;
     security_group_arns =
       option_of_yojson
         (value_for_key ec2_security_group_arn_list_of_yojson "SecurityGroupArns")
         _list path;
     location_uri = option_of_yojson (value_for_key location_uri_of_yojson "LocationUri") _list path;
     location_arn = option_of_yojson (value_for_key location_arn_of_yojson "LocationArn") _list path;
   }
    : describe_location_fsx_open_zfs_response)

let describe_location_fsx_open_zfs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ location_arn = value_for_key location_arn_of_yojson "LocationArn" _list path }
    : describe_location_fsx_open_zfs_request)

let describe_location_fsx_ontap_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     fsx_filesystem_arn =
       option_of_yojson (value_for_key fsx_filesystem_arn_of_yojson "FsxFilesystemArn") _list path;
     storage_virtual_machine_arn =
       option_of_yojson
         (value_for_key storage_virtual_machine_arn_of_yojson "StorageVirtualMachineArn")
         _list path;
     security_group_arns =
       option_of_yojson
         (value_for_key ec2_security_group_arn_list_of_yojson "SecurityGroupArns")
         _list path;
     protocol = option_of_yojson (value_for_key fsx_protocol_of_yojson "Protocol") _list path;
     location_uri = option_of_yojson (value_for_key location_uri_of_yojson "LocationUri") _list path;
     location_arn = option_of_yojson (value_for_key location_arn_of_yojson "LocationArn") _list path;
     creation_time = option_of_yojson (value_for_key time_of_yojson "CreationTime") _list path;
   }
    : describe_location_fsx_ontap_response)

let describe_location_fsx_ontap_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ location_arn = value_for_key location_arn_of_yojson "LocationArn" _list path }
    : describe_location_fsx_ontap_request)

let describe_location_fsx_lustre_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_time = option_of_yojson (value_for_key time_of_yojson "CreationTime") _list path;
     security_group_arns =
       option_of_yojson
         (value_for_key ec2_security_group_arn_list_of_yojson "SecurityGroupArns")
         _list path;
     location_uri = option_of_yojson (value_for_key location_uri_of_yojson "LocationUri") _list path;
     location_arn = option_of_yojson (value_for_key location_arn_of_yojson "LocationArn") _list path;
   }
    : describe_location_fsx_lustre_response)

let describe_location_fsx_lustre_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ location_arn = value_for_key location_arn_of_yojson "LocationArn" _list path }
    : describe_location_fsx_lustre_request)

let ec2_config_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     security_group_arns =
       value_for_key ec2_security_group_arn_list_of_yojson "SecurityGroupArns" _list path;
     subnet_arn = value_for_key ec2_subnet_arn_of_yojson "SubnetArn" _list path;
   }
    : ec2_config)

let efs_access_point_arn_of_yojson = string_of_yojson

let describe_location_efs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     in_transit_encryption =
       option_of_yojson
         (value_for_key efs_in_transit_encryption_of_yojson "InTransitEncryption")
         _list path;
     file_system_access_role_arn =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "FileSystemAccessRoleArn") _list path;
     access_point_arn =
       option_of_yojson (value_for_key efs_access_point_arn_of_yojson "AccessPointArn") _list path;
     creation_time = option_of_yojson (value_for_key time_of_yojson "CreationTime") _list path;
     ec2_config = option_of_yojson (value_for_key ec2_config_of_yojson "Ec2Config") _list path;
     location_uri = option_of_yojson (value_for_key location_uri_of_yojson "LocationUri") _list path;
     location_arn = option_of_yojson (value_for_key location_arn_of_yojson "LocationArn") _list path;
   }
    : describe_location_efs_response)

let describe_location_efs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ location_arn = value_for_key location_arn_of_yojson "LocationArn" _list path }
    : describe_location_efs_request)

let describe_location_azure_blob_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_secret_config =
       option_of_yojson
         (value_for_key custom_secret_config_of_yojson "CustomSecretConfig")
         _list path;
     cmk_secret_config =
       option_of_yojson (value_for_key cmk_secret_config_of_yojson "CmkSecretConfig") _list path;
     managed_secret_config =
       option_of_yojson
         (value_for_key managed_secret_config_of_yojson "ManagedSecretConfig")
         _list path;
     creation_time = option_of_yojson (value_for_key time_of_yojson "CreationTime") _list path;
     agent_arns = option_of_yojson (value_for_key agent_arn_list_of_yojson "AgentArns") _list path;
     access_tier =
       option_of_yojson (value_for_key azure_access_tier_of_yojson "AccessTier") _list path;
     blob_type = option_of_yojson (value_for_key azure_blob_type_of_yojson "BlobType") _list path;
     authentication_type =
       option_of_yojson
         (value_for_key azure_blob_authentication_type_of_yojson "AuthenticationType")
         _list path;
     location_uri = option_of_yojson (value_for_key location_uri_of_yojson "LocationUri") _list path;
     location_arn = option_of_yojson (value_for_key location_arn_of_yojson "LocationArn") _list path;
   }
    : describe_location_azure_blob_response)

let describe_location_azure_blob_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ location_arn = value_for_key location_arn_of_yojson "LocationArn" _list path }
    : describe_location_azure_blob_request)

let endpoint_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "FIPS_PRIVATE_LINK" -> FIPS_PRIVATE_LINK
    | `String "FIPS" -> FIPS
    | `String "PRIVATE_LINK" -> PRIVATE_LINK
    | `String "PUBLIC" -> PUBLIC
    | `String value -> raise (deserialize_unknown_enum_value_error path "EndpointType" value)
    | _ -> raise (deserialize_wrong_type_error path "EndpointType")
     : endpoint_type)
    : endpoint_type)

let describe_agent_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     platform = option_of_yojson (value_for_key platform_of_yojson "Platform") _list path;
     private_link_config =
       option_of_yojson (value_for_key private_link_config_of_yojson "PrivateLinkConfig") _list path;
     endpoint_type =
       option_of_yojson (value_for_key endpoint_type_of_yojson "EndpointType") _list path;
     creation_time = option_of_yojson (value_for_key time_of_yojson "CreationTime") _list path;
     last_connection_time =
       option_of_yojson (value_for_key time_of_yojson "LastConnectionTime") _list path;
     status = option_of_yojson (value_for_key agent_status_of_yojson "Status") _list path;
     name = option_of_yojson (value_for_key tag_value_of_yojson "Name") _list path;
     agent_arn = option_of_yojson (value_for_key agent_arn_of_yojson "AgentArn") _list path;
   }
    : describe_agent_response)

let describe_agent_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ agent_arn = value_for_key agent_arn_of_yojson "AgentArn" _list path } : describe_agent_request)

let delete_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ task_arn = value_for_key task_arn_of_yojson "TaskArn" _list path } : delete_task_request)

let delete_location_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_location_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ location_arn = value_for_key location_arn_of_yojson "LocationArn" _list path }
    : delete_location_request)

let delete_agent_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_agent_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ agent_arn = value_for_key agent_arn_of_yojson "AgentArn" _list path } : delete_agent_request)

let create_task_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ task_arn = option_of_yojson (value_for_key task_arn_of_yojson "TaskArn") _list path }
    : create_task_response)

let create_task_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     task_mode = option_of_yojson (value_for_key task_mode_of_yojson "TaskMode") _list path;
     task_report_config =
       option_of_yojson (value_for_key task_report_config_of_yojson "TaskReportConfig") _list path;
     manifest_config =
       option_of_yojson (value_for_key manifest_config_of_yojson "ManifestConfig") _list path;
     includes = option_of_yojson (value_for_key filter_list_of_yojson "Includes") _list path;
     tags = option_of_yojson (value_for_key input_tag_list_of_yojson "Tags") _list path;
     schedule = option_of_yojson (value_for_key task_schedule_of_yojson "Schedule") _list path;
     excludes = option_of_yojson (value_for_key filter_list_of_yojson "Excludes") _list path;
     options = option_of_yojson (value_for_key options_of_yojson "Options") _list path;
     name = option_of_yojson (value_for_key tag_value_of_yojson "Name") _list path;
     cloud_watch_log_group_arn =
       option_of_yojson (value_for_key log_group_arn_of_yojson "CloudWatchLogGroupArn") _list path;
     destination_location_arn =
       value_for_key location_arn_of_yojson "DestinationLocationArn" _list path;
     source_location_arn = value_for_key location_arn_of_yojson "SourceLocationArn" _list path;
   }
    : create_task_request)

let create_location_smb_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     location_arn = option_of_yojson (value_for_key location_arn_of_yojson "LocationArn") _list path;
   }
    : create_location_smb_response)

let create_location_smb_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     kerberos_krb5_conf =
       option_of_yojson
         (value_for_key kerberos_krb5_conf_file_of_yojson "KerberosKrb5Conf")
         _list path;
     kerberos_keytab =
       option_of_yojson (value_for_key kerberos_keytab_file_of_yojson "KerberosKeytab") _list path;
     kerberos_principal =
       option_of_yojson (value_for_key kerberos_principal_of_yojson "KerberosPrincipal") _list path;
     dns_ip_addresses =
       option_of_yojson (value_for_key dns_ip_list_of_yojson "DnsIpAddresses") _list path;
     authentication_type =
       option_of_yojson
         (value_for_key smb_authentication_type_of_yojson "AuthenticationType")
         _list path;
     tags = option_of_yojson (value_for_key input_tag_list_of_yojson "Tags") _list path;
     mount_options =
       option_of_yojson (value_for_key smb_mount_options_of_yojson "MountOptions") _list path;
     agent_arns = value_for_key agent_arn_list_of_yojson "AgentArns" _list path;
     custom_secret_config =
       option_of_yojson
         (value_for_key custom_secret_config_of_yojson "CustomSecretConfig")
         _list path;
     cmk_secret_config =
       option_of_yojson (value_for_key cmk_secret_config_of_yojson "CmkSecretConfig") _list path;
     password = option_of_yojson (value_for_key smb_password_of_yojson "Password") _list path;
     domain = option_of_yojson (value_for_key smb_domain_of_yojson "Domain") _list path;
     user = option_of_yojson (value_for_key smb_user_of_yojson "User") _list path;
     server_hostname = value_for_key server_hostname_of_yojson "ServerHostname" _list path;
     subdirectory = value_for_key smb_subdirectory_of_yojson "Subdirectory" _list path;
   }
    : create_location_smb_request)

let create_location_s3_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     location_arn = option_of_yojson (value_for_key location_arn_of_yojson "LocationArn") _list path;
   }
    : create_location_s3_response)

let create_location_s3_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key input_tag_list_of_yojson "Tags") _list path;
     agent_arns = option_of_yojson (value_for_key agent_arn_list_of_yojson "AgentArns") _list path;
     s3_config = value_for_key s3_config_of_yojson "S3Config" _list path;
     s3_storage_class =
       option_of_yojson (value_for_key s3_storage_class_of_yojson "S3StorageClass") _list path;
     s3_bucket_arn = value_for_key s3_bucket_arn_of_yojson "S3BucketArn" _list path;
     subdirectory =
       option_of_yojson (value_for_key s3_subdirectory_of_yojson "Subdirectory") _list path;
   }
    : create_location_s3_request)

let create_location_object_storage_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     location_arn = option_of_yojson (value_for_key location_arn_of_yojson "LocationArn") _list path;
   }
    : create_location_object_storage_response)

let create_location_object_storage_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_secret_config =
       option_of_yojson
         (value_for_key custom_secret_config_of_yojson "CustomSecretConfig")
         _list path;
     cmk_secret_config =
       option_of_yojson (value_for_key cmk_secret_config_of_yojson "CmkSecretConfig") _list path;
     server_certificate =
       option_of_yojson
         (value_for_key object_storage_certificate_of_yojson "ServerCertificate")
         _list path;
     tags = option_of_yojson (value_for_key input_tag_list_of_yojson "Tags") _list path;
     agent_arns = option_of_yojson (value_for_key agent_arn_list_of_yojson "AgentArns") _list path;
     secret_key =
       option_of_yojson (value_for_key object_storage_secret_key_of_yojson "SecretKey") _list path;
     access_key =
       option_of_yojson (value_for_key object_storage_access_key_of_yojson "AccessKey") _list path;
     bucket_name = value_for_key object_storage_bucket_name_of_yojson "BucketName" _list path;
     subdirectory =
       option_of_yojson (value_for_key s3_subdirectory_of_yojson "Subdirectory") _list path;
     server_protocol =
       option_of_yojson
         (value_for_key object_storage_server_protocol_of_yojson "ServerProtocol")
         _list path;
     server_port =
       option_of_yojson (value_for_key object_storage_server_port_of_yojson "ServerPort") _list path;
     server_hostname = value_for_key server_hostname_of_yojson "ServerHostname" _list path;
   }
    : create_location_object_storage_request)

let create_location_nfs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     location_arn = option_of_yojson (value_for_key location_arn_of_yojson "LocationArn") _list path;
   }
    : create_location_nfs_response)

let create_location_nfs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key input_tag_list_of_yojson "Tags") _list path;
     mount_options =
       option_of_yojson (value_for_key nfs_mount_options_of_yojson "MountOptions") _list path;
     on_prem_config = value_for_key on_prem_config_of_yojson "OnPremConfig" _list path;
     server_hostname = value_for_key server_hostname_of_yojson "ServerHostname" _list path;
     subdirectory = value_for_key nfs_subdirectory_of_yojson "Subdirectory" _list path;
   }
    : create_location_nfs_request)

let create_location_hdfs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     location_arn = option_of_yojson (value_for_key location_arn_of_yojson "LocationArn") _list path;
   }
    : create_location_hdfs_response)

let create_location_hdfs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_secret_config =
       option_of_yojson
         (value_for_key custom_secret_config_of_yojson "CustomSecretConfig")
         _list path;
     cmk_secret_config =
       option_of_yojson (value_for_key cmk_secret_config_of_yojson "CmkSecretConfig") _list path;
     tags = option_of_yojson (value_for_key input_tag_list_of_yojson "Tags") _list path;
     agent_arns = value_for_key agent_arn_list_of_yojson "AgentArns" _list path;
     kerberos_krb5_conf =
       option_of_yojson
         (value_for_key kerberos_krb5_conf_file_of_yojson "KerberosKrb5Conf")
         _list path;
     kerberos_keytab =
       option_of_yojson (value_for_key kerberos_keytab_file_of_yojson "KerberosKeytab") _list path;
     kerberos_principal =
       option_of_yojson (value_for_key kerberos_principal_of_yojson "KerberosPrincipal") _list path;
     simple_user = option_of_yojson (value_for_key hdfs_user_of_yojson "SimpleUser") _list path;
     authentication_type =
       value_for_key hdfs_authentication_type_of_yojson "AuthenticationType" _list path;
     qop_configuration =
       option_of_yojson (value_for_key qop_configuration_of_yojson "QopConfiguration") _list path;
     kms_key_provider_uri =
       option_of_yojson
         (value_for_key kms_key_provider_uri_of_yojson "KmsKeyProviderUri")
         _list path;
     replication_factor =
       option_of_yojson
         (value_for_key hdfs_replication_factor_of_yojson "ReplicationFactor")
         _list path;
     block_size = option_of_yojson (value_for_key hdfs_block_size_of_yojson "BlockSize") _list path;
     name_nodes = value_for_key hdfs_name_node_list_of_yojson "NameNodes" _list path;
     subdirectory =
       option_of_yojson (value_for_key hdfs_subdirectory_of_yojson "Subdirectory") _list path;
   }
    : create_location_hdfs_request)

let create_location_fsx_windows_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     location_arn = option_of_yojson (value_for_key location_arn_of_yojson "LocationArn") _list path;
   }
    : create_location_fsx_windows_response)

let create_location_fsx_windows_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_secret_config =
       option_of_yojson
         (value_for_key custom_secret_config_of_yojson "CustomSecretConfig")
         _list path;
     cmk_secret_config =
       option_of_yojson (value_for_key cmk_secret_config_of_yojson "CmkSecretConfig") _list path;
     password = option_of_yojson (value_for_key smb_password_of_yojson "Password") _list path;
     domain = option_of_yojson (value_for_key smb_domain_of_yojson "Domain") _list path;
     user = value_for_key smb_user_of_yojson "User" _list path;
     tags = option_of_yojson (value_for_key input_tag_list_of_yojson "Tags") _list path;
     security_group_arns =
       value_for_key ec2_security_group_arn_list_of_yojson "SecurityGroupArns" _list path;
     fsx_filesystem_arn = value_for_key fsx_filesystem_arn_of_yojson "FsxFilesystemArn" _list path;
     subdirectory =
       option_of_yojson (value_for_key fsx_windows_subdirectory_of_yojson "Subdirectory") _list path;
   }
    : create_location_fsx_windows_request)

let create_location_fsx_open_zfs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     location_arn = option_of_yojson (value_for_key location_arn_of_yojson "LocationArn") _list path;
   }
    : create_location_fsx_open_zfs_response)

let create_location_fsx_open_zfs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key input_tag_list_of_yojson "Tags") _list path;
     subdirectory =
       option_of_yojson
         (value_for_key fsx_open_zfs_subdirectory_of_yojson "Subdirectory")
         _list path;
     security_group_arns =
       value_for_key ec2_security_group_arn_list_of_yojson "SecurityGroupArns" _list path;
     protocol = value_for_key fsx_protocol_of_yojson "Protocol" _list path;
     fsx_filesystem_arn = value_for_key fsx_filesystem_arn_of_yojson "FsxFilesystemArn" _list path;
   }
    : create_location_fsx_open_zfs_request)

let create_location_fsx_ontap_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     location_arn = option_of_yojson (value_for_key location_arn_of_yojson "LocationArn") _list path;
   }
    : create_location_fsx_ontap_response)

let create_location_fsx_ontap_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key input_tag_list_of_yojson "Tags") _list path;
     subdirectory =
       option_of_yojson (value_for_key fsx_ontap_subdirectory_of_yojson "Subdirectory") _list path;
     storage_virtual_machine_arn =
       value_for_key storage_virtual_machine_arn_of_yojson "StorageVirtualMachineArn" _list path;
     security_group_arns =
       value_for_key ec2_security_group_arn_list_of_yojson "SecurityGroupArns" _list path;
     protocol = value_for_key fsx_protocol_of_yojson "Protocol" _list path;
   }
    : create_location_fsx_ontap_request)

let create_location_fsx_lustre_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     location_arn = option_of_yojson (value_for_key location_arn_of_yojson "LocationArn") _list path;
   }
    : create_location_fsx_lustre_response)

let create_location_fsx_lustre_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key input_tag_list_of_yojson "Tags") _list path;
     subdirectory =
       option_of_yojson (value_for_key fsx_lustre_subdirectory_of_yojson "Subdirectory") _list path;
     security_group_arns =
       value_for_key ec2_security_group_arn_list_of_yojson "SecurityGroupArns" _list path;
     fsx_filesystem_arn = value_for_key fsx_filesystem_arn_of_yojson "FsxFilesystemArn" _list path;
   }
    : create_location_fsx_lustre_request)

let create_location_efs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     location_arn = option_of_yojson (value_for_key location_arn_of_yojson "LocationArn") _list path;
   }
    : create_location_efs_response)

let efs_filesystem_arn_of_yojson = string_of_yojson

let create_location_efs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     in_transit_encryption =
       option_of_yojson
         (value_for_key efs_in_transit_encryption_of_yojson "InTransitEncryption")
         _list path;
     file_system_access_role_arn =
       option_of_yojson (value_for_key iam_role_arn_of_yojson "FileSystemAccessRoleArn") _list path;
     access_point_arn =
       option_of_yojson (value_for_key efs_access_point_arn_of_yojson "AccessPointArn") _list path;
     tags = option_of_yojson (value_for_key input_tag_list_of_yojson "Tags") _list path;
     ec2_config = value_for_key ec2_config_of_yojson "Ec2Config" _list path;
     efs_filesystem_arn = value_for_key efs_filesystem_arn_of_yojson "EfsFilesystemArn" _list path;
     subdirectory =
       option_of_yojson (value_for_key efs_subdirectory_of_yojson "Subdirectory") _list path;
   }
    : create_location_efs_request)

let create_location_azure_blob_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     location_arn = option_of_yojson (value_for_key location_arn_of_yojson "LocationArn") _list path;
   }
    : create_location_azure_blob_response)

let azure_blob_container_url_of_yojson = string_of_yojson

let create_location_azure_blob_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     custom_secret_config =
       option_of_yojson
         (value_for_key custom_secret_config_of_yojson "CustomSecretConfig")
         _list path;
     cmk_secret_config =
       option_of_yojson (value_for_key cmk_secret_config_of_yojson "CmkSecretConfig") _list path;
     tags = option_of_yojson (value_for_key input_tag_list_of_yojson "Tags") _list path;
     agent_arns = option_of_yojson (value_for_key agent_arn_list_of_yojson "AgentArns") _list path;
     subdirectory =
       option_of_yojson (value_for_key azure_blob_subdirectory_of_yojson "Subdirectory") _list path;
     access_tier =
       option_of_yojson (value_for_key azure_access_tier_of_yojson "AccessTier") _list path;
     blob_type = option_of_yojson (value_for_key azure_blob_type_of_yojson "BlobType") _list path;
     sas_configuration =
       option_of_yojson
         (value_for_key azure_blob_sas_configuration_of_yojson "SasConfiguration")
         _list path;
     authentication_type =
       value_for_key azure_blob_authentication_type_of_yojson "AuthenticationType" _list path;
     container_url = value_for_key azure_blob_container_url_of_yojson "ContainerUrl" _list path;
   }
    : create_location_azure_blob_request)

let create_agent_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ agent_arn = option_of_yojson (value_for_key agent_arn_of_yojson "AgentArn") _list path }
    : create_agent_response)

let activation_key_of_yojson = string_of_yojson

let create_agent_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     security_group_arns =
       option_of_yojson
         (value_for_key pl_security_group_arn_list_of_yojson "SecurityGroupArns")
         _list path;
     subnet_arns =
       option_of_yojson (value_for_key pl_subnet_arn_list_of_yojson "SubnetArns") _list path;
     vpc_endpoint_id =
       option_of_yojson (value_for_key vpc_endpoint_id_of_yojson "VpcEndpointId") _list path;
     tags = option_of_yojson (value_for_key input_tag_list_of_yojson "Tags") _list path;
     agent_name = option_of_yojson (value_for_key tag_value_of_yojson "AgentName") _list path;
     activation_key = value_for_key activation_key_of_yojson "ActivationKey" _list path;
   }
    : create_agent_request)

let cancel_task_execution_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let cancel_task_execution_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ task_execution_arn = value_for_key task_execution_arn_of_yojson "TaskExecutionArn" _list path }
    : cancel_task_execution_request)
