open Smaws_Lib.Json.SerializeHelpers
open Types

let string__to_yojson = string_to_yojson
let long_to_yojson = long_to_yojson
let vpc_endpoint_id_to_yojson = string_to_yojson

let verify_mode_to_yojson (x : verify_mode) =
  match x with
  | NONE -> `String "NONE"
  | ONLY_FILES_TRANSFERRED -> `String "ONLY_FILES_TRANSFERRED"
  | POINT_IN_TIME_CONSISTENT -> `String "POINT_IN_TIME_CONSISTENT"

let updated_efs_iam_role_arn_to_yojson = string_to_yojson
let updated_efs_access_point_arn_to_yojson = string_to_yojson
let update_task_response_to_yojson = unit_to_yojson
let task_arn_to_yojson = string_to_yojson

let overwrite_mode_to_yojson (x : overwrite_mode) =
  match x with NEVER -> `String "NEVER" | ALWAYS -> `String "ALWAYS"

let atime_to_yojson (x : atime) =
  match x with BEST_EFFORT -> `String "BEST_EFFORT" | NONE -> `String "NONE"

let mtime_to_yojson (x : mtime) =
  match x with PRESERVE -> `String "PRESERVE" | NONE -> `String "NONE"

let uid_to_yojson (x : uid) =
  match x with
  | BOTH -> `String "BOTH"
  | NAME -> `String "NAME"
  | INT_VALUE -> `String "INT_VALUE"
  | NONE -> `String "NONE"

let gid_to_yojson (x : gid) =
  match x with
  | BOTH -> `String "BOTH"
  | NAME -> `String "NAME"
  | INT_VALUE -> `String "INT_VALUE"
  | NONE -> `String "NONE"

let preserve_deleted_files_to_yojson (x : preserve_deleted_files) =
  match x with REMOVE -> `String "REMOVE" | PRESERVE -> `String "PRESERVE"

let preserve_devices_to_yojson (x : preserve_devices) =
  match x with PRESERVE -> `String "PRESERVE" | NONE -> `String "NONE"

let posix_permissions_to_yojson (x : posix_permissions) =
  match x with PRESERVE -> `String "PRESERVE" | NONE -> `String "NONE"

let bytes_per_second_to_yojson = long_to_yojson

let task_queueing_to_yojson (x : task_queueing) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let log_level_to_yojson (x : log_level) =
  match x with TRANSFER -> `String "TRANSFER" | BASIC -> `String "BASIC" | OFF -> `String "OFF"

let transfer_mode_to_yojson (x : transfer_mode) =
  match x with ALL -> `String "ALL" | CHANGED -> `String "CHANGED"

let smb_security_descriptor_copy_flags_to_yojson (x : smb_security_descriptor_copy_flags) =
  match x with
  | OWNER_DACL_SACL -> `String "OWNER_DACL_SACL"
  | OWNER_DACL -> `String "OWNER_DACL"
  | NONE -> `String "NONE"

let object_tags_to_yojson (x : object_tags) =
  match x with NONE -> `String "NONE" | PRESERVE -> `String "PRESERVE"

let options_to_yojson (x : options) =
  assoc_to_yojson
    [
      ("ObjectTags", option_to_yojson object_tags_to_yojson x.object_tags);
      ( "SecurityDescriptorCopyFlags",
        option_to_yojson smb_security_descriptor_copy_flags_to_yojson
          x.security_descriptor_copy_flags );
      ("TransferMode", option_to_yojson transfer_mode_to_yojson x.transfer_mode);
      ("LogLevel", option_to_yojson log_level_to_yojson x.log_level);
      ("TaskQueueing", option_to_yojson task_queueing_to_yojson x.task_queueing);
      ("BytesPerSecond", option_to_yojson bytes_per_second_to_yojson x.bytes_per_second);
      ("PosixPermissions", option_to_yojson posix_permissions_to_yojson x.posix_permissions);
      ("PreserveDevices", option_to_yojson preserve_devices_to_yojson x.preserve_devices);
      ( "PreserveDeletedFiles",
        option_to_yojson preserve_deleted_files_to_yojson x.preserve_deleted_files );
      ("Gid", option_to_yojson gid_to_yojson x.gid);
      ("Uid", option_to_yojson uid_to_yojson x.uid);
      ("Mtime", option_to_yojson mtime_to_yojson x.mtime);
      ("Atime", option_to_yojson atime_to_yojson x.atime);
      ("OverwriteMode", option_to_yojson overwrite_mode_to_yojson x.overwrite_mode);
      ("VerifyMode", option_to_yojson verify_mode_to_yojson x.verify_mode);
    ]

let filter_type_to_yojson (x : filter_type) =
  match x with SIMPLE_PATTERN -> `String "SIMPLE_PATTERN"

let filter_value_to_yojson = string_to_yojson

let filter_rule_to_yojson (x : filter_rule) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson filter_value_to_yojson x.value);
      ("FilterType", option_to_yojson filter_type_to_yojson x.filter_type);
    ]

let filter_list_to_yojson tree = list_to_yojson filter_rule_to_yojson tree
let schedule_expression_cron_to_yojson = string_to_yojson

let schedule_status_to_yojson (x : schedule_status) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let task_schedule_to_yojson (x : task_schedule) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson schedule_status_to_yojson x.status);
      ("ScheduleExpression", Some (schedule_expression_cron_to_yojson x.schedule_expression));
    ]

let tag_value_to_yojson = string_to_yojson
let log_group_arn_to_yojson = string_to_yojson
let manifest_action_to_yojson (x : manifest_action) = match x with TRANSFER -> `String "TRANSFER"
let manifest_format_to_yojson (x : manifest_format) = match x with CSV -> `String "CSV"
let s3_subdirectory_to_yojson = string_to_yojson
let iam_role_arn_to_yojson = string_to_yojson
let s3_bucket_arn_to_yojson = string_to_yojson
let s3_object_version_id_to_yojson = string_to_yojson

let s3_manifest_config_to_yojson (x : s3_manifest_config) =
  assoc_to_yojson
    [
      ( "ManifestObjectVersionId",
        option_to_yojson s3_object_version_id_to_yojson x.manifest_object_version_id );
      ("S3BucketArn", Some (s3_bucket_arn_to_yojson x.s3_bucket_arn));
      ("BucketAccessRoleArn", Some (iam_role_arn_to_yojson x.bucket_access_role_arn));
      ("ManifestObjectPath", Some (s3_subdirectory_to_yojson x.manifest_object_path));
    ]

let source_manifest_config_to_yojson (x : source_manifest_config) =
  assoc_to_yojson [ ("S3", Some (s3_manifest_config_to_yojson x.s3)) ]

let manifest_config_to_yojson (x : manifest_config) =
  assoc_to_yojson
    [
      ("Source", option_to_yojson source_manifest_config_to_yojson x.source);
      ("Format", option_to_yojson manifest_format_to_yojson x.format);
      ("Action", option_to_yojson manifest_action_to_yojson x.action);
    ]

let report_destination_s3_to_yojson (x : report_destination_s3) =
  assoc_to_yojson
    [
      ("BucketAccessRoleArn", Some (iam_role_arn_to_yojson x.bucket_access_role_arn));
      ("S3BucketArn", Some (s3_bucket_arn_to_yojson x.s3_bucket_arn));
      ("Subdirectory", option_to_yojson s3_subdirectory_to_yojson x.subdirectory);
    ]

let report_destination_to_yojson (x : report_destination) =
  assoc_to_yojson [ ("S3", option_to_yojson report_destination_s3_to_yojson x.s3) ]

let report_output_type_to_yojson (x : report_output_type) =
  match x with STANDARD -> `String "STANDARD" | SUMMARY_ONLY -> `String "SUMMARY_ONLY"

let report_level_to_yojson (x : report_level) =
  match x with
  | SUCCESSES_AND_ERRORS -> `String "SUCCESSES_AND_ERRORS"
  | ERRORS_ONLY -> `String "ERRORS_ONLY"

let object_version_ids_to_yojson (x : object_version_ids) =
  match x with NONE -> `String "NONE" | INCLUDE -> `String "INCLUDE"

let report_override_to_yojson (x : report_override) =
  assoc_to_yojson [ ("ReportLevel", option_to_yojson report_level_to_yojson x.report_level) ]

let report_overrides_to_yojson (x : report_overrides) =
  assoc_to_yojson
    [
      ("Skipped", option_to_yojson report_override_to_yojson x.skipped);
      ("Deleted", option_to_yojson report_override_to_yojson x.deleted);
      ("Verified", option_to_yojson report_override_to_yojson x.verified);
      ("Transferred", option_to_yojson report_override_to_yojson x.transferred);
    ]

let task_report_config_to_yojson (x : task_report_config) =
  assoc_to_yojson
    [
      ("Overrides", option_to_yojson report_overrides_to_yojson x.overrides);
      ("ObjectVersionIds", option_to_yojson object_version_ids_to_yojson x.object_version_ids);
      ("ReportLevel", option_to_yojson report_level_to_yojson x.report_level);
      ("OutputType", option_to_yojson report_output_type_to_yojson x.output_type);
      ("Destination", option_to_yojson report_destination_to_yojson x.destination);
    ]

let update_task_request_to_yojson (x : update_task_request) =
  assoc_to_yojson
    [
      ("TaskReportConfig", option_to_yojson task_report_config_to_yojson x.task_report_config);
      ("ManifestConfig", option_to_yojson manifest_config_to_yojson x.manifest_config);
      ("Includes", option_to_yojson filter_list_to_yojson x.includes);
      ("CloudWatchLogGroupArn", option_to_yojson log_group_arn_to_yojson x.cloud_watch_log_group_arn);
      ("Name", option_to_yojson tag_value_to_yojson x.name);
      ("Schedule", option_to_yojson task_schedule_to_yojson x.schedule);
      ("Excludes", option_to_yojson filter_list_to_yojson x.excludes);
      ("Options", option_to_yojson options_to_yojson x.options);
      ("TaskArn", Some (task_arn_to_yojson x.task_arn));
    ]

let update_task_execution_response_to_yojson = unit_to_yojson
let task_execution_arn_to_yojson = string_to_yojson

let update_task_execution_request_to_yojson (x : update_task_execution_request) =
  assoc_to_yojson
    [
      ("Options", Some (options_to_yojson x.options));
      ("TaskExecutionArn", Some (task_execution_arn_to_yojson x.task_execution_arn));
    ]

let invalid_request_exception_to_yojson (x : invalid_request_exception) =
  assoc_to_yojson
    [
      ("datasyncErrorCode", option_to_yojson string__to_yojson x.datasync_error_code);
      ("errorCode", option_to_yojson string__to_yojson x.error_code);
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let internal_exception_to_yojson (x : internal_exception) =
  assoc_to_yojson
    [
      ("errorCode", option_to_yojson string__to_yojson x.error_code);
      ("message", option_to_yojson string__to_yojson x.message);
    ]

let update_smb_domain_to_yojson = string_to_yojson
let update_location_smb_response_to_yojson = unit_to_yojson
let location_arn_to_yojson = string_to_yojson
let smb_subdirectory_to_yojson = string_to_yojson
let server_hostname_to_yojson = string_to_yojson
let smb_user_to_yojson = string_to_yojson
let smb_domain_to_yojson = string_to_yojson
let smb_password_to_yojson = string_to_yojson
let secret_arn_to_yojson = string_to_yojson
let kms_key_arn_to_yojson = string_to_yojson

let cmk_secret_config_to_yojson (x : cmk_secret_config) =
  assoc_to_yojson
    [
      ("KmsKeyArn", option_to_yojson kms_key_arn_to_yojson x.kms_key_arn);
      ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn);
    ]

let iam_role_arn_or_empty_string_to_yojson = string_to_yojson

let custom_secret_config_to_yojson (x : custom_secret_config) =
  assoc_to_yojson
    [
      ( "SecretAccessRoleArn",
        option_to_yojson iam_role_arn_or_empty_string_to_yojson x.secret_access_role_arn );
      ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn);
    ]

let agent_arn_to_yojson = string_to_yojson
let agent_arn_list_to_yojson tree = list_to_yojson agent_arn_to_yojson tree

let smb_version_to_yojson (x : smb_version) =
  match x with
  | SMB2_0 -> `String "SMB2_0"
  | SMB1 -> `String "SMB1"
  | SMB3 -> `String "SMB3"
  | SMB2 -> `String "SMB2"
  | AUTOMATIC -> `String "AUTOMATIC"

let smb_mount_options_to_yojson (x : smb_mount_options) =
  assoc_to_yojson [ ("Version", option_to_yojson smb_version_to_yojson x.version) ]

let smb_authentication_type_to_yojson (x : smb_authentication_type) =
  match x with KERBEROS -> `String "KERBEROS" | NTLM -> `String "NTLM"

let server_ip_address_to_yojson = string_to_yojson
let dns_ip_list_to_yojson tree = list_to_yojson server_ip_address_to_yojson tree
let kerberos_principal_to_yojson = string_to_yojson
let kerberos_keytab_file_to_yojson = blob_to_yojson
let kerberos_krb5_conf_file_to_yojson = blob_to_yojson

let update_location_smb_request_to_yojson (x : update_location_smb_request) =
  assoc_to_yojson
    [
      ("KerberosKrb5Conf", option_to_yojson kerberos_krb5_conf_file_to_yojson x.kerberos_krb5_conf);
      ("KerberosKeytab", option_to_yojson kerberos_keytab_file_to_yojson x.kerberos_keytab);
      ("KerberosPrincipal", option_to_yojson kerberos_principal_to_yojson x.kerberos_principal);
      ("DnsIpAddresses", option_to_yojson dns_ip_list_to_yojson x.dns_ip_addresses);
      ( "AuthenticationType",
        option_to_yojson smb_authentication_type_to_yojson x.authentication_type );
      ("MountOptions", option_to_yojson smb_mount_options_to_yojson x.mount_options);
      ("AgentArns", option_to_yojson agent_arn_list_to_yojson x.agent_arns);
      ("CustomSecretConfig", option_to_yojson custom_secret_config_to_yojson x.custom_secret_config);
      ("CmkSecretConfig", option_to_yojson cmk_secret_config_to_yojson x.cmk_secret_config);
      ("Password", option_to_yojson smb_password_to_yojson x.password);
      ("Domain", option_to_yojson smb_domain_to_yojson x.domain);
      ("User", option_to_yojson smb_user_to_yojson x.user);
      ("ServerHostname", option_to_yojson server_hostname_to_yojson x.server_hostname);
      ("Subdirectory", option_to_yojson smb_subdirectory_to_yojson x.subdirectory);
      ("LocationArn", Some (location_arn_to_yojson x.location_arn));
    ]

let update_location_s3_response_to_yojson = unit_to_yojson

let s3_storage_class_to_yojson (x : s3_storage_class) =
  match x with
  | GLACIER_INSTANT_RETRIEVAL -> `String "GLACIER_INSTANT_RETRIEVAL"
  | OUTPOSTS -> `String "OUTPOSTS"
  | DEEP_ARCHIVE -> `String "DEEP_ARCHIVE"
  | GLACIER -> `String "GLACIER"
  | INTELLIGENT_TIERING -> `String "INTELLIGENT_TIERING"
  | ONEZONE_IA -> `String "ONEZONE_IA"
  | STANDARD_IA -> `String "STANDARD_IA"
  | STANDARD -> `String "STANDARD"

let s3_config_to_yojson (x : s3_config) =
  assoc_to_yojson
    [ ("BucketAccessRoleArn", Some (iam_role_arn_to_yojson x.bucket_access_role_arn)) ]

let update_location_s3_request_to_yojson (x : update_location_s3_request) =
  assoc_to_yojson
    [
      ("S3Config", option_to_yojson s3_config_to_yojson x.s3_config);
      ("S3StorageClass", option_to_yojson s3_storage_class_to_yojson x.s3_storage_class);
      ("Subdirectory", option_to_yojson s3_subdirectory_to_yojson x.subdirectory);
      ("LocationArn", Some (location_arn_to_yojson x.location_arn));
    ]

let update_location_object_storage_response_to_yojson = unit_to_yojson
let object_storage_server_port_to_yojson = int_to_yojson

let object_storage_server_protocol_to_yojson (x : object_storage_server_protocol) =
  match x with HTTP -> `String "HTTP" | HTTPS -> `String "HTTPS"

let object_storage_access_key_to_yojson = string_to_yojson
let object_storage_secret_key_to_yojson = string_to_yojson
let object_storage_certificate_to_yojson = blob_to_yojson

let update_location_object_storage_request_to_yojson (x : update_location_object_storage_request) =
  assoc_to_yojson
    [
      ("CustomSecretConfig", option_to_yojson custom_secret_config_to_yojson x.custom_secret_config);
      ("CmkSecretConfig", option_to_yojson cmk_secret_config_to_yojson x.cmk_secret_config);
      ( "ServerCertificate",
        option_to_yojson object_storage_certificate_to_yojson x.server_certificate );
      ("AgentArns", option_to_yojson agent_arn_list_to_yojson x.agent_arns);
      ("SecretKey", option_to_yojson object_storage_secret_key_to_yojson x.secret_key);
      ("AccessKey", option_to_yojson object_storage_access_key_to_yojson x.access_key);
      ("ServerHostname", option_to_yojson server_hostname_to_yojson x.server_hostname);
      ("Subdirectory", option_to_yojson s3_subdirectory_to_yojson x.subdirectory);
      ("ServerProtocol", option_to_yojson object_storage_server_protocol_to_yojson x.server_protocol);
      ("ServerPort", option_to_yojson object_storage_server_port_to_yojson x.server_port);
      ("LocationArn", Some (location_arn_to_yojson x.location_arn));
    ]

let update_location_nfs_response_to_yojson = unit_to_yojson
let nfs_subdirectory_to_yojson = string_to_yojson

let on_prem_config_to_yojson (x : on_prem_config) =
  assoc_to_yojson [ ("AgentArns", Some (agent_arn_list_to_yojson x.agent_arns)) ]

let nfs_version_to_yojson (x : nfs_version) =
  match x with
  | NFS4_1 -> `String "NFS4_1"
  | NFS4_0 -> `String "NFS4_0"
  | NFS3 -> `String "NFS3"
  | AUTOMATIC -> `String "AUTOMATIC"

let nfs_mount_options_to_yojson (x : nfs_mount_options) =
  assoc_to_yojson [ ("Version", option_to_yojson nfs_version_to_yojson x.version) ]

let update_location_nfs_request_to_yojson (x : update_location_nfs_request) =
  assoc_to_yojson
    [
      ("MountOptions", option_to_yojson nfs_mount_options_to_yojson x.mount_options);
      ("OnPremConfig", option_to_yojson on_prem_config_to_yojson x.on_prem_config);
      ("ServerHostname", option_to_yojson server_hostname_to_yojson x.server_hostname);
      ("Subdirectory", option_to_yojson nfs_subdirectory_to_yojson x.subdirectory);
      ("LocationArn", Some (location_arn_to_yojson x.location_arn));
    ]

let update_location_hdfs_response_to_yojson = unit_to_yojson
let hdfs_subdirectory_to_yojson = string_to_yojson
let hdfs_server_hostname_to_yojson = string_to_yojson
let hdfs_server_port_to_yojson = int_to_yojson

let hdfs_name_node_to_yojson (x : hdfs_name_node) =
  assoc_to_yojson
    [
      ("Port", Some (hdfs_server_port_to_yojson x.port));
      ("Hostname", Some (hdfs_server_hostname_to_yojson x.hostname));
    ]

let hdfs_name_node_list_to_yojson tree = list_to_yojson hdfs_name_node_to_yojson tree
let hdfs_block_size_to_yojson = int_to_yojson
let hdfs_replication_factor_to_yojson = int_to_yojson
let kms_key_provider_uri_to_yojson = string_to_yojson

let hdfs_rpc_protection_to_yojson (x : hdfs_rpc_protection) =
  match x with
  | PRIVACY -> `String "PRIVACY"
  | INTEGRITY -> `String "INTEGRITY"
  | AUTHENTICATION -> `String "AUTHENTICATION"
  | DISABLED -> `String "DISABLED"

let hdfs_data_transfer_protection_to_yojson (x : hdfs_data_transfer_protection) =
  match x with
  | PRIVACY -> `String "PRIVACY"
  | INTEGRITY -> `String "INTEGRITY"
  | AUTHENTICATION -> `String "AUTHENTICATION"
  | DISABLED -> `String "DISABLED"

let qop_configuration_to_yojson (x : qop_configuration) =
  assoc_to_yojson
    [
      ( "DataTransferProtection",
        option_to_yojson hdfs_data_transfer_protection_to_yojson x.data_transfer_protection );
      ("RpcProtection", option_to_yojson hdfs_rpc_protection_to_yojson x.rpc_protection);
    ]

let hdfs_authentication_type_to_yojson (x : hdfs_authentication_type) =
  match x with KERBEROS -> `String "KERBEROS" | SIMPLE -> `String "SIMPLE"

let hdfs_user_to_yojson = string_to_yojson

let update_location_hdfs_request_to_yojson (x : update_location_hdfs_request) =
  assoc_to_yojson
    [
      ("CustomSecretConfig", option_to_yojson custom_secret_config_to_yojson x.custom_secret_config);
      ("CmkSecretConfig", option_to_yojson cmk_secret_config_to_yojson x.cmk_secret_config);
      ("AgentArns", option_to_yojson agent_arn_list_to_yojson x.agent_arns);
      ("KerberosKrb5Conf", option_to_yojson kerberos_krb5_conf_file_to_yojson x.kerberos_krb5_conf);
      ("KerberosKeytab", option_to_yojson kerberos_keytab_file_to_yojson x.kerberos_keytab);
      ("KerberosPrincipal", option_to_yojson kerberos_principal_to_yojson x.kerberos_principal);
      ("SimpleUser", option_to_yojson hdfs_user_to_yojson x.simple_user);
      ( "AuthenticationType",
        option_to_yojson hdfs_authentication_type_to_yojson x.authentication_type );
      ("QopConfiguration", option_to_yojson qop_configuration_to_yojson x.qop_configuration);
      ("KmsKeyProviderUri", option_to_yojson kms_key_provider_uri_to_yojson x.kms_key_provider_uri);
      ("ReplicationFactor", option_to_yojson hdfs_replication_factor_to_yojson x.replication_factor);
      ("BlockSize", option_to_yojson hdfs_block_size_to_yojson x.block_size);
      ("NameNodes", option_to_yojson hdfs_name_node_list_to_yojson x.name_nodes);
      ("Subdirectory", option_to_yojson hdfs_subdirectory_to_yojson x.subdirectory);
      ("LocationArn", Some (location_arn_to_yojson x.location_arn));
    ]

let update_location_fsx_windows_response_to_yojson = unit_to_yojson
let fsx_windows_subdirectory_to_yojson = string_to_yojson

let update_location_fsx_windows_request_to_yojson (x : update_location_fsx_windows_request) =
  assoc_to_yojson
    [
      ("CustomSecretConfig", option_to_yojson custom_secret_config_to_yojson x.custom_secret_config);
      ("CmkSecretConfig", option_to_yojson cmk_secret_config_to_yojson x.cmk_secret_config);
      ("Password", option_to_yojson smb_password_to_yojson x.password);
      ("User", option_to_yojson smb_user_to_yojson x.user);
      ("Domain", option_to_yojson update_smb_domain_to_yojson x.domain);
      ("Subdirectory", option_to_yojson fsx_windows_subdirectory_to_yojson x.subdirectory);
      ("LocationArn", Some (location_arn_to_yojson x.location_arn));
    ]

let update_location_fsx_open_zfs_response_to_yojson = unit_to_yojson

let fsx_protocol_nfs_to_yojson (x : fsx_protocol_nfs) =
  assoc_to_yojson [ ("MountOptions", option_to_yojson nfs_mount_options_to_yojson x.mount_options) ]

let managed_secret_config_to_yojson (x : managed_secret_config) =
  assoc_to_yojson [ ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn) ]

let fsx_protocol_smb_to_yojson (x : fsx_protocol_smb) =
  assoc_to_yojson
    [
      ("CustomSecretConfig", option_to_yojson custom_secret_config_to_yojson x.custom_secret_config);
      ("CmkSecretConfig", option_to_yojson cmk_secret_config_to_yojson x.cmk_secret_config);
      ( "ManagedSecretConfig",
        option_to_yojson managed_secret_config_to_yojson x.managed_secret_config );
      ("User", Some (smb_user_to_yojson x.user));
      ("Password", option_to_yojson smb_password_to_yojson x.password);
      ("MountOptions", option_to_yojson smb_mount_options_to_yojson x.mount_options);
      ("Domain", option_to_yojson smb_domain_to_yojson x.domain);
    ]

let fsx_protocol_to_yojson (x : fsx_protocol) =
  assoc_to_yojson
    [
      ("SMB", option_to_yojson fsx_protocol_smb_to_yojson x.sm_b);
      ("NFS", option_to_yojson fsx_protocol_nfs_to_yojson x.nf_s);
    ]

let update_location_fsx_open_zfs_request_to_yojson (x : update_location_fsx_open_zfs_request) =
  assoc_to_yojson
    [
      ("Subdirectory", option_to_yojson smb_subdirectory_to_yojson x.subdirectory);
      ("Protocol", option_to_yojson fsx_protocol_to_yojson x.protocol);
      ("LocationArn", Some (location_arn_to_yojson x.location_arn));
    ]

let update_location_fsx_ontap_response_to_yojson = unit_to_yojson

let fsx_update_protocol_smb_to_yojson (x : fsx_update_protocol_smb) =
  assoc_to_yojson
    [
      ("CustomSecretConfig", option_to_yojson custom_secret_config_to_yojson x.custom_secret_config);
      ("CmkSecretConfig", option_to_yojson cmk_secret_config_to_yojson x.cmk_secret_config);
      ("User", option_to_yojson smb_user_to_yojson x.user);
      ("Password", option_to_yojson smb_password_to_yojson x.password);
      ("MountOptions", option_to_yojson smb_mount_options_to_yojson x.mount_options);
      ("Domain", option_to_yojson update_smb_domain_to_yojson x.domain);
    ]

let fsx_update_protocol_to_yojson (x : fsx_update_protocol) =
  assoc_to_yojson
    [
      ("SMB", option_to_yojson fsx_update_protocol_smb_to_yojson x.sm_b);
      ("NFS", option_to_yojson fsx_protocol_nfs_to_yojson x.nf_s);
    ]

let fsx_ontap_subdirectory_to_yojson = string_to_yojson

let update_location_fsx_ontap_request_to_yojson (x : update_location_fsx_ontap_request) =
  assoc_to_yojson
    [
      ("Subdirectory", option_to_yojson fsx_ontap_subdirectory_to_yojson x.subdirectory);
      ("Protocol", option_to_yojson fsx_update_protocol_to_yojson x.protocol);
      ("LocationArn", Some (location_arn_to_yojson x.location_arn));
    ]

let update_location_fsx_lustre_response_to_yojson = unit_to_yojson

let update_location_fsx_lustre_request_to_yojson (x : update_location_fsx_lustre_request) =
  assoc_to_yojson
    [
      ("Subdirectory", option_to_yojson smb_subdirectory_to_yojson x.subdirectory);
      ("LocationArn", Some (location_arn_to_yojson x.location_arn));
    ]

let update_location_efs_response_to_yojson = unit_to_yojson
let efs_subdirectory_to_yojson = string_to_yojson

let efs_in_transit_encryption_to_yojson (x : efs_in_transit_encryption) =
  match x with TLS1_2 -> `String "TLS1_2" | NONE -> `String "NONE"

let update_location_efs_request_to_yojson (x : update_location_efs_request) =
  assoc_to_yojson
    [
      ( "InTransitEncryption",
        option_to_yojson efs_in_transit_encryption_to_yojson x.in_transit_encryption );
      ( "FileSystemAccessRoleArn",
        option_to_yojson updated_efs_iam_role_arn_to_yojson x.file_system_access_role_arn );
      ("AccessPointArn", option_to_yojson updated_efs_access_point_arn_to_yojson x.access_point_arn);
      ("Subdirectory", option_to_yojson efs_subdirectory_to_yojson x.subdirectory);
      ("LocationArn", Some (location_arn_to_yojson x.location_arn));
    ]

let update_location_azure_blob_response_to_yojson = unit_to_yojson
let azure_blob_subdirectory_to_yojson = string_to_yojson

let azure_blob_authentication_type_to_yojson (x : azure_blob_authentication_type) =
  match x with NONE -> `String "NONE" | SAS -> `String "SAS"

let azure_blob_sas_token_to_yojson = string_to_yojson

let azure_blob_sas_configuration_to_yojson (x : azure_blob_sas_configuration) =
  assoc_to_yojson [ ("Token", Some (azure_blob_sas_token_to_yojson x.token)) ]

let azure_blob_type_to_yojson (x : azure_blob_type) = match x with BLOCK -> `String "BLOCK"

let azure_access_tier_to_yojson (x : azure_access_tier) =
  match x with ARCHIVE -> `String "ARCHIVE" | COOL -> `String "COOL" | HOT -> `String "HOT"

let update_location_azure_blob_request_to_yojson (x : update_location_azure_blob_request) =
  assoc_to_yojson
    [
      ("CustomSecretConfig", option_to_yojson custom_secret_config_to_yojson x.custom_secret_config);
      ("CmkSecretConfig", option_to_yojson cmk_secret_config_to_yojson x.cmk_secret_config);
      ("AgentArns", option_to_yojson agent_arn_list_to_yojson x.agent_arns);
      ("AccessTier", option_to_yojson azure_access_tier_to_yojson x.access_tier);
      ("BlobType", option_to_yojson azure_blob_type_to_yojson x.blob_type);
      ( "SasConfiguration",
        option_to_yojson azure_blob_sas_configuration_to_yojson x.sas_configuration );
      ( "AuthenticationType",
        option_to_yojson azure_blob_authentication_type_to_yojson x.authentication_type );
      ("Subdirectory", option_to_yojson azure_blob_subdirectory_to_yojson x.subdirectory);
      ("LocationArn", Some (location_arn_to_yojson x.location_arn));
    ]

let update_agent_response_to_yojson = unit_to_yojson

let update_agent_request_to_yojson (x : update_agent_request) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson tag_value_to_yojson x.name);
      ("AgentArn", Some (agent_arn_to_yojson x.agent_arn));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let taggable_resource_arn_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("Keys", Some (tag_key_list_to_yojson x.keys));
      ("ResourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn));
    ]

let time_to_yojson = timestamp_epoch_seconds_to_yojson

let task_status_to_yojson (x : task_status) =
  match x with
  | UNAVAILABLE -> `String "UNAVAILABLE"
  | RUNNING -> `String "RUNNING"
  | QUEUED -> `String "QUEUED"
  | CREATING -> `String "CREATING"
  | AVAILABLE -> `String "AVAILABLE"

let schedule_disabled_reason_to_yojson = string_to_yojson

let schedule_disabled_by_to_yojson (x : schedule_disabled_by) =
  match x with SERVICE -> `String "SERVICE" | USER -> `String "USER"

let task_schedule_details_to_yojson (x : task_schedule_details) =
  assoc_to_yojson
    [
      ("DisabledBy", option_to_yojson schedule_disabled_by_to_yojson x.disabled_by);
      ("DisabledReason", option_to_yojson schedule_disabled_reason_to_yojson x.disabled_reason);
      ("StatusUpdateTime", option_to_yojson time_to_yojson x.status_update_time);
    ]

let task_mode_to_yojson (x : task_mode) =
  match x with ENHANCED -> `String "ENHANCED" | BASIC -> `String "BASIC"

let task_list_entry_to_yojson (x : task_list_entry) =
  assoc_to_yojson
    [
      ("TaskMode", option_to_yojson task_mode_to_yojson x.task_mode);
      ("Name", option_to_yojson tag_value_to_yojson x.name);
      ("Status", option_to_yojson task_status_to_yojson x.status);
      ("TaskArn", option_to_yojson task_arn_to_yojson x.task_arn);
    ]

let task_list_to_yojson tree = list_to_yojson task_list_entry_to_yojson tree

let task_filter_name_to_yojson (x : task_filter_name) =
  match x with CreationTime -> `String "CreationTime" | LocationId -> `String "LocationId"

let filter_attribute_value_to_yojson = string_to_yojson
let filter_values_to_yojson tree = list_to_yojson filter_attribute_value_to_yojson tree

let operator_to_yojson (x : operator) =
  match x with
  | BEGINS_WITH -> `String "BeginsWith"
  | NOT_CONTAINS -> `String "NotContains"
  | CONTAINS -> `String "Contains"
  | GT -> `String "GreaterThan"
  | GE -> `String "GreaterThanOrEqual"
  | LT -> `String "LessThan"
  | LE -> `String "LessThanOrEqual"
  | IN -> `String "In"
  | NE -> `String "NotEquals"
  | EQ -> `String "Equals"

let task_filter_to_yojson (x : task_filter) =
  assoc_to_yojson
    [
      ("Operator", Some (operator_to_yojson x.operator));
      ("Values", Some (filter_values_to_yojson x.values));
      ("Name", Some (task_filter_name_to_yojson x.name));
    ]

let task_filters_to_yojson tree = list_to_yojson task_filter_to_yojson tree

let task_execution_status_to_yojson (x : task_execution_status) =
  match x with
  | ERROR -> `String "ERROR"
  | SUCCESS -> `String "SUCCESS"
  | VERIFYING -> `String "VERIFYING"
  | TRANSFERRING -> `String "TRANSFERRING"
  | PREPARING -> `String "PREPARING"
  | LAUNCHING -> `String "LAUNCHING"
  | CANCELLING -> `String "CANCELLING"
  | QUEUED -> `String "QUEUED"

let duration_to_yojson = long_to_yojson

let phase_status_to_yojson (x : phase_status) =
  match x with
  | ERROR -> `String "ERROR"
  | SUCCESS -> `String "SUCCESS"
  | PENDING -> `String "PENDING"

let task_execution_result_detail_to_yojson (x : task_execution_result_detail) =
  assoc_to_yojson
    [
      ("ErrorDetail", option_to_yojson string__to_yojson x.error_detail);
      ("ErrorCode", option_to_yojson string__to_yojson x.error_code);
      ("VerifyStatus", option_to_yojson phase_status_to_yojson x.verify_status);
      ("VerifyDuration", option_to_yojson duration_to_yojson x.verify_duration);
      ("TransferStatus", option_to_yojson phase_status_to_yojson x.transfer_status);
      ("TransferDuration", option_to_yojson duration_to_yojson x.transfer_duration);
      ("TotalDuration", option_to_yojson duration_to_yojson x.total_duration);
      ("PrepareStatus", option_to_yojson phase_status_to_yojson x.prepare_status);
      ("PrepareDuration", option_to_yojson duration_to_yojson x.prepare_duration);
    ]

let task_execution_list_entry_to_yojson (x : task_execution_list_entry) =
  assoc_to_yojson
    [
      ("TaskMode", option_to_yojson task_mode_to_yojson x.task_mode);
      ("Status", option_to_yojson task_execution_status_to_yojson x.status);
      ("TaskExecutionArn", option_to_yojson task_execution_arn_to_yojson x.task_execution_arn);
    ]

let task_execution_list_to_yojson tree = list_to_yojson task_execution_list_entry_to_yojson tree

let task_execution_folders_listed_detail_to_yojson (x : task_execution_folders_listed_detail) =
  assoc_to_yojson
    [
      ("AtDestinationForDelete", option_to_yojson long_to_yojson x.at_destination_for_delete);
      ("AtSource", option_to_yojson long_to_yojson x.at_source);
    ]

let task_execution_folders_failed_detail_to_yojson (x : task_execution_folders_failed_detail) =
  assoc_to_yojson
    [
      ("Delete", option_to_yojson long_to_yojson x.delete);
      ("Verify", option_to_yojson long_to_yojson x.verify);
      ("Transfer", option_to_yojson long_to_yojson x.transfer);
      ("Prepare", option_to_yojson long_to_yojson x.prepare);
      ("List", option_to_yojson long_to_yojson x.list_);
    ]

let task_execution_files_listed_detail_to_yojson (x : task_execution_files_listed_detail) =
  assoc_to_yojson
    [
      ("AtDestinationForDelete", option_to_yojson long_to_yojson x.at_destination_for_delete);
      ("AtSource", option_to_yojson long_to_yojson x.at_source);
    ]

let task_execution_files_failed_detail_to_yojson (x : task_execution_files_failed_detail) =
  assoc_to_yojson
    [
      ("Delete", option_to_yojson long_to_yojson x.delete);
      ("Verify", option_to_yojson long_to_yojson x.verify);
      ("Transfer", option_to_yojson long_to_yojson x.transfer);
      ("Prepare", option_to_yojson long_to_yojson x.prepare);
    ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_list_entry_to_yojson (x : tag_list_entry) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson tag_value_to_yojson x.value);
      ("Key", Some (tag_key_to_yojson x.key));
    ]

let input_tag_list_to_yojson tree = list_to_yojson tag_list_entry_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("Tags", Some (input_tag_list_to_yojson x.tags));
      ("ResourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn));
    ]

let storage_virtual_machine_arn_to_yojson = string_to_yojson

let start_task_execution_response_to_yojson (x : start_task_execution_response) =
  assoc_to_yojson
    [ ("TaskExecutionArn", option_to_yojson task_execution_arn_to_yojson x.task_execution_arn) ]

let start_task_execution_request_to_yojson (x : start_task_execution_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson input_tag_list_to_yojson x.tags);
      ("TaskReportConfig", option_to_yojson task_report_config_to_yojson x.task_report_config);
      ("ManifestConfig", option_to_yojson manifest_config_to_yojson x.manifest_config);
      ("Excludes", option_to_yojson filter_list_to_yojson x.excludes);
      ("Includes", option_to_yojson filter_list_to_yojson x.includes);
      ("OverrideOptions", option_to_yojson options_to_yojson x.override_options);
      ("TaskArn", Some (task_arn_to_yojson x.task_arn));
    ]

let network_interface_arn_to_yojson = string_to_yojson

let source_network_interface_arns_to_yojson tree =
  list_to_yojson network_interface_arn_to_yojson tree

let report_result_to_yojson (x : report_result) =
  assoc_to_yojson
    [
      ("ErrorDetail", option_to_yojson string__to_yojson x.error_detail);
      ("ErrorCode", option_to_yojson string__to_yojson x.error_code);
      ("Status", option_to_yojson phase_status_to_yojson x.status);
    ]

let endpoint_to_yojson = string_to_yojson
let ec2_subnet_arn_to_yojson = string_to_yojson
let pl_subnet_arn_list_to_yojson tree = list_to_yojson ec2_subnet_arn_to_yojson tree
let ec2_security_group_arn_to_yojson = string_to_yojson
let pl_security_group_arn_list_to_yojson tree = list_to_yojson ec2_security_group_arn_to_yojson tree

let private_link_config_to_yojson (x : private_link_config) =
  assoc_to_yojson
    [
      ( "SecurityGroupArns",
        option_to_yojson pl_security_group_arn_list_to_yojson x.security_group_arns );
      ("SubnetArns", option_to_yojson pl_subnet_arn_list_to_yojson x.subnet_arns);
      ("PrivateLinkEndpoint", option_to_yojson endpoint_to_yojson x.private_link_endpoint);
      ("VpcEndpointId", option_to_yojson vpc_endpoint_id_to_yojson x.vpc_endpoint_id);
    ]

let agent_version_to_yojson = string_to_yojson

let platform_to_yojson (x : platform) =
  assoc_to_yojson [ ("Version", option_to_yojson agent_version_to_yojson x.version) ]

let output_tag_list_to_yojson tree = list_to_yojson tag_list_entry_to_yojson tree
let object_storage_bucket_name_to_yojson = string_to_yojson
let next_token_to_yojson = string_to_yojson
let max_results_to_yojson = int_to_yojson
let location_uri_to_yojson = string_to_yojson

let location_list_entry_to_yojson (x : location_list_entry) =
  assoc_to_yojson
    [
      ("LocationUri", option_to_yojson location_uri_to_yojson x.location_uri);
      ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn);
    ]

let location_list_to_yojson tree = list_to_yojson location_list_entry_to_yojson tree

let location_filter_name_to_yojson (x : location_filter_name) =
  match x with
  | CreationTime -> `String "CreationTime"
  | LocationType -> `String "LocationType"
  | LocationUri -> `String "LocationUri"

let location_filter_to_yojson (x : location_filter) =
  assoc_to_yojson
    [
      ("Operator", Some (operator_to_yojson x.operator));
      ("Values", Some (filter_values_to_yojson x.values));
      ("Name", Some (location_filter_name_to_yojson x.name));
    ]

let location_filters_to_yojson tree = list_to_yojson location_filter_to_yojson tree

let list_tasks_response_to_yojson (x : list_tasks_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Tasks", option_to_yojson task_list_to_yojson x.tasks);
    ]

let list_tasks_request_to_yojson (x : list_tasks_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson task_filters_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_task_executions_response_to_yojson (x : list_task_executions_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("TaskExecutions", option_to_yojson task_execution_list_to_yojson x.task_executions);
    ]

let list_task_executions_request_to_yojson (x : list_task_executions_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("TaskArn", option_to_yojson task_arn_to_yojson x.task_arn);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Tags", option_to_yojson output_tag_list_to_yojson x.tags);
    ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("ResourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn));
    ]

let list_locations_response_to_yojson (x : list_locations_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Locations", option_to_yojson location_list_to_yojson x.locations);
    ]

let list_locations_request_to_yojson (x : list_locations_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson location_filters_to_yojson x.filters);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let agent_status_to_yojson (x : agent_status) =
  match x with OFFLINE -> `String "OFFLINE" | ONLINE -> `String "ONLINE"

let agent_list_entry_to_yojson (x : agent_list_entry) =
  assoc_to_yojson
    [
      ("Platform", option_to_yojson platform_to_yojson x.platform);
      ("Status", option_to_yojson agent_status_to_yojson x.status);
      ("Name", option_to_yojson tag_value_to_yojson x.name);
      ("AgentArn", option_to_yojson agent_arn_to_yojson x.agent_arn);
    ]

let agent_list_to_yojson tree = list_to_yojson agent_list_entry_to_yojson tree

let list_agents_response_to_yojson (x : list_agents_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Agents", option_to_yojson agent_list_to_yojson x.agents);
    ]

let list_agents_request_to_yojson (x : list_agents_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let item_count_to_yojson = long_to_yojson
let fsx_open_zfs_subdirectory_to_yojson = string_to_yojson
let fsx_lustre_subdirectory_to_yojson = string_to_yojson
let fsx_filesystem_arn_to_yojson = string_to_yojson

let describe_task_execution_response_to_yojson (x : describe_task_execution_response) =
  assoc_to_yojson
    [
      ("EndTime", option_to_yojson time_to_yojson x.end_time);
      ("LaunchTime", option_to_yojson time_to_yojson x.launch_time);
      ( "FoldersFailed",
        option_to_yojson task_execution_folders_failed_detail_to_yojson x.folders_failed );
      ( "FoldersListed",
        option_to_yojson task_execution_folders_listed_detail_to_yojson x.folders_listed );
      ("FoldersDeleted", option_to_yojson item_count_to_yojson x.folders_deleted);
      ("FoldersVerified", option_to_yojson item_count_to_yojson x.folders_verified);
      ("FoldersTransferred", option_to_yojson item_count_to_yojson x.folders_transferred);
      ("FoldersPrepared", option_to_yojson item_count_to_yojson x.folders_prepared);
      ("FoldersSkipped", option_to_yojson item_count_to_yojson x.folders_skipped);
      ( "EstimatedFoldersToTransfer",
        option_to_yojson item_count_to_yojson x.estimated_folders_to_transfer );
      ( "EstimatedFoldersToDelete",
        option_to_yojson item_count_to_yojson x.estimated_folders_to_delete );
      ("FilesFailed", option_to_yojson task_execution_files_failed_detail_to_yojson x.files_failed);
      ("FilesListed", option_to_yojson task_execution_files_listed_detail_to_yojson x.files_listed);
      ("FilesPrepared", option_to_yojson long_to_yojson x.files_prepared);
      ("TaskMode", option_to_yojson task_mode_to_yojson x.task_mode);
      ("EstimatedFilesToDelete", option_to_yojson long_to_yojson x.estimated_files_to_delete);
      ("ReportResult", option_to_yojson report_result_to_yojson x.report_result);
      ("FilesVerified", option_to_yojson long_to_yojson x.files_verified);
      ("FilesSkipped", option_to_yojson long_to_yojson x.files_skipped);
      ("FilesDeleted", option_to_yojson long_to_yojson x.files_deleted);
      ("TaskReportConfig", option_to_yojson task_report_config_to_yojson x.task_report_config);
      ("Result", option_to_yojson task_execution_result_detail_to_yojson x.result_);
      ("BytesCompressed", option_to_yojson long_to_yojson x.bytes_compressed);
      ("BytesTransferred", option_to_yojson long_to_yojson x.bytes_transferred);
      ("BytesWritten", option_to_yojson long_to_yojson x.bytes_written);
      ("FilesTransferred", option_to_yojson long_to_yojson x.files_transferred);
      ("EstimatedBytesToTransfer", option_to_yojson long_to_yojson x.estimated_bytes_to_transfer);
      ("EstimatedFilesToTransfer", option_to_yojson long_to_yojson x.estimated_files_to_transfer);
      ("StartTime", option_to_yojson time_to_yojson x.start_time);
      ("ManifestConfig", option_to_yojson manifest_config_to_yojson x.manifest_config);
      ("Includes", option_to_yojson filter_list_to_yojson x.includes);
      ("Excludes", option_to_yojson filter_list_to_yojson x.excludes);
      ("Options", option_to_yojson options_to_yojson x.options);
      ("Status", option_to_yojson task_execution_status_to_yojson x.status);
      ("TaskExecutionArn", option_to_yojson task_execution_arn_to_yojson x.task_execution_arn);
    ]

let describe_task_execution_request_to_yojson (x : describe_task_execution_request) =
  assoc_to_yojson [ ("TaskExecutionArn", Some (task_execution_arn_to_yojson x.task_execution_arn)) ]

let destination_network_interface_arns_to_yojson tree =
  list_to_yojson network_interface_arn_to_yojson tree

let describe_task_response_to_yojson (x : describe_task_response) =
  assoc_to_yojson
    [
      ("TaskMode", option_to_yojson task_mode_to_yojson x.task_mode);
      ("ScheduleDetails", option_to_yojson task_schedule_details_to_yojson x.schedule_details);
      ("TaskReportConfig", option_to_yojson task_report_config_to_yojson x.task_report_config);
      ("ManifestConfig", option_to_yojson manifest_config_to_yojson x.manifest_config);
      ("Includes", option_to_yojson filter_list_to_yojson x.includes);
      ("CreationTime", option_to_yojson time_to_yojson x.creation_time);
      ("ErrorDetail", option_to_yojson string__to_yojson x.error_detail);
      ("ErrorCode", option_to_yojson string__to_yojson x.error_code);
      ("Schedule", option_to_yojson task_schedule_to_yojson x.schedule);
      ("Excludes", option_to_yojson filter_list_to_yojson x.excludes);
      ("Options", option_to_yojson options_to_yojson x.options);
      ( "DestinationNetworkInterfaceArns",
        option_to_yojson destination_network_interface_arns_to_yojson
          x.destination_network_interface_arns );
      ( "SourceNetworkInterfaceArns",
        option_to_yojson source_network_interface_arns_to_yojson x.source_network_interface_arns );
      ("CloudWatchLogGroupArn", option_to_yojson log_group_arn_to_yojson x.cloud_watch_log_group_arn);
      ("DestinationLocationArn", option_to_yojson location_arn_to_yojson x.destination_location_arn);
      ("SourceLocationArn", option_to_yojson location_arn_to_yojson x.source_location_arn);
      ( "CurrentTaskExecutionArn",
        option_to_yojson task_execution_arn_to_yojson x.current_task_execution_arn );
      ("Name", option_to_yojson tag_value_to_yojson x.name);
      ("Status", option_to_yojson task_status_to_yojson x.status);
      ("TaskArn", option_to_yojson task_arn_to_yojson x.task_arn);
    ]

let describe_task_request_to_yojson (x : describe_task_request) =
  assoc_to_yojson [ ("TaskArn", Some (task_arn_to_yojson x.task_arn)) ]

let describe_location_smb_response_to_yojson (x : describe_location_smb_response) =
  assoc_to_yojson
    [
      ("CustomSecretConfig", option_to_yojson custom_secret_config_to_yojson x.custom_secret_config);
      ("CmkSecretConfig", option_to_yojson cmk_secret_config_to_yojson x.cmk_secret_config);
      ( "ManagedSecretConfig",
        option_to_yojson managed_secret_config_to_yojson x.managed_secret_config );
      ( "AuthenticationType",
        option_to_yojson smb_authentication_type_to_yojson x.authentication_type );
      ("KerberosPrincipal", option_to_yojson kerberos_principal_to_yojson x.kerberos_principal);
      ("DnsIpAddresses", option_to_yojson dns_ip_list_to_yojson x.dns_ip_addresses);
      ("CreationTime", option_to_yojson time_to_yojson x.creation_time);
      ("MountOptions", option_to_yojson smb_mount_options_to_yojson x.mount_options);
      ("Domain", option_to_yojson smb_domain_to_yojson x.domain);
      ("User", option_to_yojson smb_user_to_yojson x.user);
      ("AgentArns", option_to_yojson agent_arn_list_to_yojson x.agent_arns);
      ("LocationUri", option_to_yojson location_uri_to_yojson x.location_uri);
      ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn);
    ]

let describe_location_smb_request_to_yojson (x : describe_location_smb_request) =
  assoc_to_yojson [ ("LocationArn", Some (location_arn_to_yojson x.location_arn)) ]

let describe_location_s3_response_to_yojson (x : describe_location_s3_response) =
  assoc_to_yojson
    [
      ("CreationTime", option_to_yojson time_to_yojson x.creation_time);
      ("AgentArns", option_to_yojson agent_arn_list_to_yojson x.agent_arns);
      ("S3Config", option_to_yojson s3_config_to_yojson x.s3_config);
      ("S3StorageClass", option_to_yojson s3_storage_class_to_yojson x.s3_storage_class);
      ("LocationUri", option_to_yojson location_uri_to_yojson x.location_uri);
      ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn);
    ]

let describe_location_s3_request_to_yojson (x : describe_location_s3_request) =
  assoc_to_yojson [ ("LocationArn", Some (location_arn_to_yojson x.location_arn)) ]

let describe_location_object_storage_response_to_yojson
    (x : describe_location_object_storage_response) =
  assoc_to_yojson
    [
      ("CustomSecretConfig", option_to_yojson custom_secret_config_to_yojson x.custom_secret_config);
      ("CmkSecretConfig", option_to_yojson cmk_secret_config_to_yojson x.cmk_secret_config);
      ( "ManagedSecretConfig",
        option_to_yojson managed_secret_config_to_yojson x.managed_secret_config );
      ( "ServerCertificate",
        option_to_yojson object_storage_certificate_to_yojson x.server_certificate );
      ("CreationTime", option_to_yojson time_to_yojson x.creation_time);
      ("AgentArns", option_to_yojson agent_arn_list_to_yojson x.agent_arns);
      ("ServerProtocol", option_to_yojson object_storage_server_protocol_to_yojson x.server_protocol);
      ("ServerPort", option_to_yojson object_storage_server_port_to_yojson x.server_port);
      ("AccessKey", option_to_yojson object_storage_access_key_to_yojson x.access_key);
      ("LocationUri", option_to_yojson location_uri_to_yojson x.location_uri);
      ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn);
    ]

let describe_location_object_storage_request_to_yojson
    (x : describe_location_object_storage_request) =
  assoc_to_yojson [ ("LocationArn", Some (location_arn_to_yojson x.location_arn)) ]

let describe_location_nfs_response_to_yojson (x : describe_location_nfs_response) =
  assoc_to_yojson
    [
      ("CreationTime", option_to_yojson time_to_yojson x.creation_time);
      ("MountOptions", option_to_yojson nfs_mount_options_to_yojson x.mount_options);
      ("OnPremConfig", option_to_yojson on_prem_config_to_yojson x.on_prem_config);
      ("LocationUri", option_to_yojson location_uri_to_yojson x.location_uri);
      ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn);
    ]

let describe_location_nfs_request_to_yojson (x : describe_location_nfs_request) =
  assoc_to_yojson [ ("LocationArn", Some (location_arn_to_yojson x.location_arn)) ]

let describe_location_hdfs_response_to_yojson (x : describe_location_hdfs_response) =
  assoc_to_yojson
    [
      ("CustomSecretConfig", option_to_yojson custom_secret_config_to_yojson x.custom_secret_config);
      ("CmkSecretConfig", option_to_yojson cmk_secret_config_to_yojson x.cmk_secret_config);
      ( "ManagedSecretConfig",
        option_to_yojson managed_secret_config_to_yojson x.managed_secret_config );
      ("CreationTime", option_to_yojson time_to_yojson x.creation_time);
      ("AgentArns", option_to_yojson agent_arn_list_to_yojson x.agent_arns);
      ("KerberosPrincipal", option_to_yojson kerberos_principal_to_yojson x.kerberos_principal);
      ("SimpleUser", option_to_yojson hdfs_user_to_yojson x.simple_user);
      ( "AuthenticationType",
        option_to_yojson hdfs_authentication_type_to_yojson x.authentication_type );
      ("QopConfiguration", option_to_yojson qop_configuration_to_yojson x.qop_configuration);
      ("KmsKeyProviderUri", option_to_yojson kms_key_provider_uri_to_yojson x.kms_key_provider_uri);
      ("ReplicationFactor", option_to_yojson hdfs_replication_factor_to_yojson x.replication_factor);
      ("BlockSize", option_to_yojson hdfs_block_size_to_yojson x.block_size);
      ("NameNodes", option_to_yojson hdfs_name_node_list_to_yojson x.name_nodes);
      ("LocationUri", option_to_yojson location_uri_to_yojson x.location_uri);
      ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn);
    ]

let describe_location_hdfs_request_to_yojson (x : describe_location_hdfs_request) =
  assoc_to_yojson [ ("LocationArn", Some (location_arn_to_yojson x.location_arn)) ]

let ec2_security_group_arn_list_to_yojson tree =
  list_to_yojson ec2_security_group_arn_to_yojson tree

let describe_location_fsx_windows_response_to_yojson (x : describe_location_fsx_windows_response) =
  assoc_to_yojson
    [
      ("CustomSecretConfig", option_to_yojson custom_secret_config_to_yojson x.custom_secret_config);
      ("CmkSecretConfig", option_to_yojson cmk_secret_config_to_yojson x.cmk_secret_config);
      ( "ManagedSecretConfig",
        option_to_yojson managed_secret_config_to_yojson x.managed_secret_config );
      ("Domain", option_to_yojson smb_domain_to_yojson x.domain);
      ("User", option_to_yojson smb_user_to_yojson x.user);
      ("CreationTime", option_to_yojson time_to_yojson x.creation_time);
      ( "SecurityGroupArns",
        option_to_yojson ec2_security_group_arn_list_to_yojson x.security_group_arns );
      ("LocationUri", option_to_yojson location_uri_to_yojson x.location_uri);
      ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn);
    ]

let describe_location_fsx_windows_request_to_yojson (x : describe_location_fsx_windows_request) =
  assoc_to_yojson [ ("LocationArn", Some (location_arn_to_yojson x.location_arn)) ]

let describe_location_fsx_open_zfs_response_to_yojson (x : describe_location_fsx_open_zfs_response)
    =
  assoc_to_yojson
    [
      ("CreationTime", option_to_yojson time_to_yojson x.creation_time);
      ("Protocol", option_to_yojson fsx_protocol_to_yojson x.protocol);
      ( "SecurityGroupArns",
        option_to_yojson ec2_security_group_arn_list_to_yojson x.security_group_arns );
      ("LocationUri", option_to_yojson location_uri_to_yojson x.location_uri);
      ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn);
    ]

let describe_location_fsx_open_zfs_request_to_yojson (x : describe_location_fsx_open_zfs_request) =
  assoc_to_yojson [ ("LocationArn", Some (location_arn_to_yojson x.location_arn)) ]

let describe_location_fsx_ontap_response_to_yojson (x : describe_location_fsx_ontap_response) =
  assoc_to_yojson
    [
      ("FsxFilesystemArn", option_to_yojson fsx_filesystem_arn_to_yojson x.fsx_filesystem_arn);
      ( "StorageVirtualMachineArn",
        option_to_yojson storage_virtual_machine_arn_to_yojson x.storage_virtual_machine_arn );
      ( "SecurityGroupArns",
        option_to_yojson ec2_security_group_arn_list_to_yojson x.security_group_arns );
      ("Protocol", option_to_yojson fsx_protocol_to_yojson x.protocol);
      ("LocationUri", option_to_yojson location_uri_to_yojson x.location_uri);
      ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn);
      ("CreationTime", option_to_yojson time_to_yojson x.creation_time);
    ]

let describe_location_fsx_ontap_request_to_yojson (x : describe_location_fsx_ontap_request) =
  assoc_to_yojson [ ("LocationArn", Some (location_arn_to_yojson x.location_arn)) ]

let describe_location_fsx_lustre_response_to_yojson (x : describe_location_fsx_lustre_response) =
  assoc_to_yojson
    [
      ("CreationTime", option_to_yojson time_to_yojson x.creation_time);
      ( "SecurityGroupArns",
        option_to_yojson ec2_security_group_arn_list_to_yojson x.security_group_arns );
      ("LocationUri", option_to_yojson location_uri_to_yojson x.location_uri);
      ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn);
    ]

let describe_location_fsx_lustre_request_to_yojson (x : describe_location_fsx_lustre_request) =
  assoc_to_yojson [ ("LocationArn", Some (location_arn_to_yojson x.location_arn)) ]

let ec2_config_to_yojson (x : ec2_config) =
  assoc_to_yojson
    [
      ("SecurityGroupArns", Some (ec2_security_group_arn_list_to_yojson x.security_group_arns));
      ("SubnetArn", Some (ec2_subnet_arn_to_yojson x.subnet_arn));
    ]

let efs_access_point_arn_to_yojson = string_to_yojson

let describe_location_efs_response_to_yojson (x : describe_location_efs_response) =
  assoc_to_yojson
    [
      ( "InTransitEncryption",
        option_to_yojson efs_in_transit_encryption_to_yojson x.in_transit_encryption );
      ( "FileSystemAccessRoleArn",
        option_to_yojson iam_role_arn_to_yojson x.file_system_access_role_arn );
      ("AccessPointArn", option_to_yojson efs_access_point_arn_to_yojson x.access_point_arn);
      ("CreationTime", option_to_yojson time_to_yojson x.creation_time);
      ("Ec2Config", option_to_yojson ec2_config_to_yojson x.ec2_config);
      ("LocationUri", option_to_yojson location_uri_to_yojson x.location_uri);
      ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn);
    ]

let describe_location_efs_request_to_yojson (x : describe_location_efs_request) =
  assoc_to_yojson [ ("LocationArn", Some (location_arn_to_yojson x.location_arn)) ]

let describe_location_azure_blob_response_to_yojson (x : describe_location_azure_blob_response) =
  assoc_to_yojson
    [
      ("CustomSecretConfig", option_to_yojson custom_secret_config_to_yojson x.custom_secret_config);
      ("CmkSecretConfig", option_to_yojson cmk_secret_config_to_yojson x.cmk_secret_config);
      ( "ManagedSecretConfig",
        option_to_yojson managed_secret_config_to_yojson x.managed_secret_config );
      ("CreationTime", option_to_yojson time_to_yojson x.creation_time);
      ("AgentArns", option_to_yojson agent_arn_list_to_yojson x.agent_arns);
      ("AccessTier", option_to_yojson azure_access_tier_to_yojson x.access_tier);
      ("BlobType", option_to_yojson azure_blob_type_to_yojson x.blob_type);
      ( "AuthenticationType",
        option_to_yojson azure_blob_authentication_type_to_yojson x.authentication_type );
      ("LocationUri", option_to_yojson location_uri_to_yojson x.location_uri);
      ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn);
    ]

let describe_location_azure_blob_request_to_yojson (x : describe_location_azure_blob_request) =
  assoc_to_yojson [ ("LocationArn", Some (location_arn_to_yojson x.location_arn)) ]

let endpoint_type_to_yojson (x : endpoint_type) =
  match x with
  | FIPS_PRIVATE_LINK -> `String "FIPS_PRIVATE_LINK"
  | FIPS -> `String "FIPS"
  | PRIVATE_LINK -> `String "PRIVATE_LINK"
  | PUBLIC -> `String "PUBLIC"

let describe_agent_response_to_yojson (x : describe_agent_response) =
  assoc_to_yojson
    [
      ("Platform", option_to_yojson platform_to_yojson x.platform);
      ("PrivateLinkConfig", option_to_yojson private_link_config_to_yojson x.private_link_config);
      ("EndpointType", option_to_yojson endpoint_type_to_yojson x.endpoint_type);
      ("CreationTime", option_to_yojson time_to_yojson x.creation_time);
      ("LastConnectionTime", option_to_yojson time_to_yojson x.last_connection_time);
      ("Status", option_to_yojson agent_status_to_yojson x.status);
      ("Name", option_to_yojson tag_value_to_yojson x.name);
      ("AgentArn", option_to_yojson agent_arn_to_yojson x.agent_arn);
    ]

let describe_agent_request_to_yojson (x : describe_agent_request) =
  assoc_to_yojson [ ("AgentArn", Some (agent_arn_to_yojson x.agent_arn)) ]

let delete_task_response_to_yojson = unit_to_yojson

let delete_task_request_to_yojson (x : delete_task_request) =
  assoc_to_yojson [ ("TaskArn", Some (task_arn_to_yojson x.task_arn)) ]

let delete_location_response_to_yojson = unit_to_yojson

let delete_location_request_to_yojson (x : delete_location_request) =
  assoc_to_yojson [ ("LocationArn", Some (location_arn_to_yojson x.location_arn)) ]

let delete_agent_response_to_yojson = unit_to_yojson

let delete_agent_request_to_yojson (x : delete_agent_request) =
  assoc_to_yojson [ ("AgentArn", Some (agent_arn_to_yojson x.agent_arn)) ]

let create_task_response_to_yojson (x : create_task_response) =
  assoc_to_yojson [ ("TaskArn", option_to_yojson task_arn_to_yojson x.task_arn) ]

let create_task_request_to_yojson (x : create_task_request) =
  assoc_to_yojson
    [
      ("TaskMode", option_to_yojson task_mode_to_yojson x.task_mode);
      ("TaskReportConfig", option_to_yojson task_report_config_to_yojson x.task_report_config);
      ("ManifestConfig", option_to_yojson manifest_config_to_yojson x.manifest_config);
      ("Includes", option_to_yojson filter_list_to_yojson x.includes);
      ("Tags", option_to_yojson input_tag_list_to_yojson x.tags);
      ("Schedule", option_to_yojson task_schedule_to_yojson x.schedule);
      ("Excludes", option_to_yojson filter_list_to_yojson x.excludes);
      ("Options", option_to_yojson options_to_yojson x.options);
      ("Name", option_to_yojson tag_value_to_yojson x.name);
      ("CloudWatchLogGroupArn", option_to_yojson log_group_arn_to_yojson x.cloud_watch_log_group_arn);
      ("DestinationLocationArn", Some (location_arn_to_yojson x.destination_location_arn));
      ("SourceLocationArn", Some (location_arn_to_yojson x.source_location_arn));
    ]

let create_location_smb_response_to_yojson (x : create_location_smb_response) =
  assoc_to_yojson [ ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn) ]

let create_location_smb_request_to_yojson (x : create_location_smb_request) =
  assoc_to_yojson
    [
      ("KerberosKrb5Conf", option_to_yojson kerberos_krb5_conf_file_to_yojson x.kerberos_krb5_conf);
      ("KerberosKeytab", option_to_yojson kerberos_keytab_file_to_yojson x.kerberos_keytab);
      ("KerberosPrincipal", option_to_yojson kerberos_principal_to_yojson x.kerberos_principal);
      ("DnsIpAddresses", option_to_yojson dns_ip_list_to_yojson x.dns_ip_addresses);
      ( "AuthenticationType",
        option_to_yojson smb_authentication_type_to_yojson x.authentication_type );
      ("Tags", option_to_yojson input_tag_list_to_yojson x.tags);
      ("MountOptions", option_to_yojson smb_mount_options_to_yojson x.mount_options);
      ("AgentArns", Some (agent_arn_list_to_yojson x.agent_arns));
      ("CustomSecretConfig", option_to_yojson custom_secret_config_to_yojson x.custom_secret_config);
      ("CmkSecretConfig", option_to_yojson cmk_secret_config_to_yojson x.cmk_secret_config);
      ("Password", option_to_yojson smb_password_to_yojson x.password);
      ("Domain", option_to_yojson smb_domain_to_yojson x.domain);
      ("User", option_to_yojson smb_user_to_yojson x.user);
      ("ServerHostname", Some (server_hostname_to_yojson x.server_hostname));
      ("Subdirectory", Some (smb_subdirectory_to_yojson x.subdirectory));
    ]

let create_location_s3_response_to_yojson (x : create_location_s3_response) =
  assoc_to_yojson [ ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn) ]

let create_location_s3_request_to_yojson (x : create_location_s3_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson input_tag_list_to_yojson x.tags);
      ("AgentArns", option_to_yojson agent_arn_list_to_yojson x.agent_arns);
      ("S3Config", Some (s3_config_to_yojson x.s3_config));
      ("S3StorageClass", option_to_yojson s3_storage_class_to_yojson x.s3_storage_class);
      ("S3BucketArn", Some (s3_bucket_arn_to_yojson x.s3_bucket_arn));
      ("Subdirectory", option_to_yojson s3_subdirectory_to_yojson x.subdirectory);
    ]

let create_location_object_storage_response_to_yojson (x : create_location_object_storage_response)
    =
  assoc_to_yojson [ ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn) ]

let create_location_object_storage_request_to_yojson (x : create_location_object_storage_request) =
  assoc_to_yojson
    [
      ("CustomSecretConfig", option_to_yojson custom_secret_config_to_yojson x.custom_secret_config);
      ("CmkSecretConfig", option_to_yojson cmk_secret_config_to_yojson x.cmk_secret_config);
      ( "ServerCertificate",
        option_to_yojson object_storage_certificate_to_yojson x.server_certificate );
      ("Tags", option_to_yojson input_tag_list_to_yojson x.tags);
      ("AgentArns", option_to_yojson agent_arn_list_to_yojson x.agent_arns);
      ("SecretKey", option_to_yojson object_storage_secret_key_to_yojson x.secret_key);
      ("AccessKey", option_to_yojson object_storage_access_key_to_yojson x.access_key);
      ("BucketName", Some (object_storage_bucket_name_to_yojson x.bucket_name));
      ("Subdirectory", option_to_yojson s3_subdirectory_to_yojson x.subdirectory);
      ("ServerProtocol", option_to_yojson object_storage_server_protocol_to_yojson x.server_protocol);
      ("ServerPort", option_to_yojson object_storage_server_port_to_yojson x.server_port);
      ("ServerHostname", Some (server_hostname_to_yojson x.server_hostname));
    ]

let create_location_nfs_response_to_yojson (x : create_location_nfs_response) =
  assoc_to_yojson [ ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn) ]

let create_location_nfs_request_to_yojson (x : create_location_nfs_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson input_tag_list_to_yojson x.tags);
      ("MountOptions", option_to_yojson nfs_mount_options_to_yojson x.mount_options);
      ("OnPremConfig", Some (on_prem_config_to_yojson x.on_prem_config));
      ("ServerHostname", Some (server_hostname_to_yojson x.server_hostname));
      ("Subdirectory", Some (nfs_subdirectory_to_yojson x.subdirectory));
    ]

let create_location_hdfs_response_to_yojson (x : create_location_hdfs_response) =
  assoc_to_yojson [ ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn) ]

let create_location_hdfs_request_to_yojson (x : create_location_hdfs_request) =
  assoc_to_yojson
    [
      ("CustomSecretConfig", option_to_yojson custom_secret_config_to_yojson x.custom_secret_config);
      ("CmkSecretConfig", option_to_yojson cmk_secret_config_to_yojson x.cmk_secret_config);
      ("Tags", option_to_yojson input_tag_list_to_yojson x.tags);
      ("AgentArns", Some (agent_arn_list_to_yojson x.agent_arns));
      ("KerberosKrb5Conf", option_to_yojson kerberos_krb5_conf_file_to_yojson x.kerberos_krb5_conf);
      ("KerberosKeytab", option_to_yojson kerberos_keytab_file_to_yojson x.kerberos_keytab);
      ("KerberosPrincipal", option_to_yojson kerberos_principal_to_yojson x.kerberos_principal);
      ("SimpleUser", option_to_yojson hdfs_user_to_yojson x.simple_user);
      ("AuthenticationType", Some (hdfs_authentication_type_to_yojson x.authentication_type));
      ("QopConfiguration", option_to_yojson qop_configuration_to_yojson x.qop_configuration);
      ("KmsKeyProviderUri", option_to_yojson kms_key_provider_uri_to_yojson x.kms_key_provider_uri);
      ("ReplicationFactor", option_to_yojson hdfs_replication_factor_to_yojson x.replication_factor);
      ("BlockSize", option_to_yojson hdfs_block_size_to_yojson x.block_size);
      ("NameNodes", Some (hdfs_name_node_list_to_yojson x.name_nodes));
      ("Subdirectory", option_to_yojson hdfs_subdirectory_to_yojson x.subdirectory);
    ]

let create_location_fsx_windows_response_to_yojson (x : create_location_fsx_windows_response) =
  assoc_to_yojson [ ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn) ]

let create_location_fsx_windows_request_to_yojson (x : create_location_fsx_windows_request) =
  assoc_to_yojson
    [
      ("CustomSecretConfig", option_to_yojson custom_secret_config_to_yojson x.custom_secret_config);
      ("CmkSecretConfig", option_to_yojson cmk_secret_config_to_yojson x.cmk_secret_config);
      ("Password", option_to_yojson smb_password_to_yojson x.password);
      ("Domain", option_to_yojson smb_domain_to_yojson x.domain);
      ("User", Some (smb_user_to_yojson x.user));
      ("Tags", option_to_yojson input_tag_list_to_yojson x.tags);
      ("SecurityGroupArns", Some (ec2_security_group_arn_list_to_yojson x.security_group_arns));
      ("FsxFilesystemArn", Some (fsx_filesystem_arn_to_yojson x.fsx_filesystem_arn));
      ("Subdirectory", option_to_yojson fsx_windows_subdirectory_to_yojson x.subdirectory);
    ]

let create_location_fsx_open_zfs_response_to_yojson (x : create_location_fsx_open_zfs_response) =
  assoc_to_yojson [ ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn) ]

let create_location_fsx_open_zfs_request_to_yojson (x : create_location_fsx_open_zfs_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson input_tag_list_to_yojson x.tags);
      ("Subdirectory", option_to_yojson fsx_open_zfs_subdirectory_to_yojson x.subdirectory);
      ("SecurityGroupArns", Some (ec2_security_group_arn_list_to_yojson x.security_group_arns));
      ("Protocol", Some (fsx_protocol_to_yojson x.protocol));
      ("FsxFilesystemArn", Some (fsx_filesystem_arn_to_yojson x.fsx_filesystem_arn));
    ]

let create_location_fsx_ontap_response_to_yojson (x : create_location_fsx_ontap_response) =
  assoc_to_yojson [ ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn) ]

let create_location_fsx_ontap_request_to_yojson (x : create_location_fsx_ontap_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson input_tag_list_to_yojson x.tags);
      ("Subdirectory", option_to_yojson fsx_ontap_subdirectory_to_yojson x.subdirectory);
      ( "StorageVirtualMachineArn",
        Some (storage_virtual_machine_arn_to_yojson x.storage_virtual_machine_arn) );
      ("SecurityGroupArns", Some (ec2_security_group_arn_list_to_yojson x.security_group_arns));
      ("Protocol", Some (fsx_protocol_to_yojson x.protocol));
    ]

let create_location_fsx_lustre_response_to_yojson (x : create_location_fsx_lustre_response) =
  assoc_to_yojson [ ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn) ]

let create_location_fsx_lustre_request_to_yojson (x : create_location_fsx_lustre_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson input_tag_list_to_yojson x.tags);
      ("Subdirectory", option_to_yojson fsx_lustre_subdirectory_to_yojson x.subdirectory);
      ("SecurityGroupArns", Some (ec2_security_group_arn_list_to_yojson x.security_group_arns));
      ("FsxFilesystemArn", Some (fsx_filesystem_arn_to_yojson x.fsx_filesystem_arn));
    ]

let create_location_efs_response_to_yojson (x : create_location_efs_response) =
  assoc_to_yojson [ ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn) ]

let efs_filesystem_arn_to_yojson = string_to_yojson

let create_location_efs_request_to_yojson (x : create_location_efs_request) =
  assoc_to_yojson
    [
      ( "InTransitEncryption",
        option_to_yojson efs_in_transit_encryption_to_yojson x.in_transit_encryption );
      ( "FileSystemAccessRoleArn",
        option_to_yojson iam_role_arn_to_yojson x.file_system_access_role_arn );
      ("AccessPointArn", option_to_yojson efs_access_point_arn_to_yojson x.access_point_arn);
      ("Tags", option_to_yojson input_tag_list_to_yojson x.tags);
      ("Ec2Config", Some (ec2_config_to_yojson x.ec2_config));
      ("EfsFilesystemArn", Some (efs_filesystem_arn_to_yojson x.efs_filesystem_arn));
      ("Subdirectory", option_to_yojson efs_subdirectory_to_yojson x.subdirectory);
    ]

let create_location_azure_blob_response_to_yojson (x : create_location_azure_blob_response) =
  assoc_to_yojson [ ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn) ]

let azure_blob_container_url_to_yojson = string_to_yojson

let create_location_azure_blob_request_to_yojson (x : create_location_azure_blob_request) =
  assoc_to_yojson
    [
      ("CustomSecretConfig", option_to_yojson custom_secret_config_to_yojson x.custom_secret_config);
      ("CmkSecretConfig", option_to_yojson cmk_secret_config_to_yojson x.cmk_secret_config);
      ("Tags", option_to_yojson input_tag_list_to_yojson x.tags);
      ("AgentArns", option_to_yojson agent_arn_list_to_yojson x.agent_arns);
      ("Subdirectory", option_to_yojson azure_blob_subdirectory_to_yojson x.subdirectory);
      ("AccessTier", option_to_yojson azure_access_tier_to_yojson x.access_tier);
      ("BlobType", option_to_yojson azure_blob_type_to_yojson x.blob_type);
      ( "SasConfiguration",
        option_to_yojson azure_blob_sas_configuration_to_yojson x.sas_configuration );
      ("AuthenticationType", Some (azure_blob_authentication_type_to_yojson x.authentication_type));
      ("ContainerUrl", Some (azure_blob_container_url_to_yojson x.container_url));
    ]

let create_agent_response_to_yojson (x : create_agent_response) =
  assoc_to_yojson [ ("AgentArn", option_to_yojson agent_arn_to_yojson x.agent_arn) ]

let activation_key_to_yojson = string_to_yojson

let create_agent_request_to_yojson (x : create_agent_request) =
  assoc_to_yojson
    [
      ( "SecurityGroupArns",
        option_to_yojson pl_security_group_arn_list_to_yojson x.security_group_arns );
      ("SubnetArns", option_to_yojson pl_subnet_arn_list_to_yojson x.subnet_arns);
      ("VpcEndpointId", option_to_yojson vpc_endpoint_id_to_yojson x.vpc_endpoint_id);
      ("Tags", option_to_yojson input_tag_list_to_yojson x.tags);
      ("AgentName", option_to_yojson tag_value_to_yojson x.agent_name);
      ("ActivationKey", Some (activation_key_to_yojson x.activation_key));
    ]

let cancel_task_execution_response_to_yojson = unit_to_yojson

let cancel_task_execution_request_to_yojson (x : cancel_task_execution_request) =
  assoc_to_yojson [ ("TaskExecutionArn", Some (task_execution_arn_to_yojson x.task_execution_arn)) ]
