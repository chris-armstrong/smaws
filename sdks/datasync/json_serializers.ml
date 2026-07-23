open Smaws_Lib.Json.SerializeHelpers
open Types

let activation_key_to_yojson = string_to_yojson
let agent_arn_to_yojson = string_to_yojson
let agent_arn_list_to_yojson tree = list_to_yojson agent_arn_to_yojson tree
let agent_version_to_yojson = string_to_yojson

let platform_to_yojson (x : platform) =
  assoc_to_yojson [ ("Version", option_to_yojson agent_version_to_yojson x.version) ]

let agent_status_to_yojson (x : agent_status) =
  match x with ONLINE -> `String "ONLINE" | OFFLINE -> `String "OFFLINE"

let tag_value_to_yojson = string_to_yojson

let agent_list_entry_to_yojson (x : agent_list_entry) =
  assoc_to_yojson
    [
      ("AgentArn", option_to_yojson agent_arn_to_yojson x.agent_arn);
      ("Name", option_to_yojson tag_value_to_yojson x.name);
      ("Status", option_to_yojson agent_status_to_yojson x.status);
      ("Platform", option_to_yojson platform_to_yojson x.platform);
    ]

let agent_list_to_yojson tree = list_to_yojson agent_list_entry_to_yojson tree

let atime_to_yojson (x : atime) =
  match x with NONE -> `String "NONE" | BEST_EFFORT -> `String "BEST_EFFORT"

let azure_access_tier_to_yojson (x : azure_access_tier) =
  match x with HOT -> `String "HOT" | COOL -> `String "COOL" | ARCHIVE -> `String "ARCHIVE"

let azure_blob_authentication_type_to_yojson (x : azure_blob_authentication_type) =
  match x with SAS -> `String "SAS" | NONE -> `String "NONE"

let azure_blob_container_url_to_yojson = string_to_yojson
let azure_blob_sas_token_to_yojson = string_to_yojson

let azure_blob_sas_configuration_to_yojson (x : azure_blob_sas_configuration) =
  assoc_to_yojson [ ("Token", Some (azure_blob_sas_token_to_yojson x.token)) ]

let azure_blob_subdirectory_to_yojson = string_to_yojson
let azure_blob_type_to_yojson (x : azure_blob_type) = match x with BLOCK -> `String "BLOCK"
let bytes_per_second_to_yojson = long_to_yojson
let string__to_yojson = string_to_yojson

let invalid_request_exception_to_yojson (x : invalid_request_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson string__to_yojson x.message);
      ("errorCode", option_to_yojson string__to_yojson x.error_code);
      ("datasyncErrorCode", option_to_yojson string__to_yojson x.datasync_error_code);
    ]

let internal_exception_to_yojson (x : internal_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson string__to_yojson x.message);
      ("errorCode", option_to_yojson string__to_yojson x.error_code);
    ]

let cancel_task_execution_response_to_yojson = unit_to_yojson
let task_execution_arn_to_yojson = string_to_yojson

let cancel_task_execution_request_to_yojson (x : cancel_task_execution_request) =
  assoc_to_yojson [ ("TaskExecutionArn", Some (task_execution_arn_to_yojson x.task_execution_arn)) ]

let kms_key_arn_to_yojson = string_to_yojson
let secret_arn_to_yojson = string_to_yojson

let cmk_secret_config_to_yojson (x : cmk_secret_config) =
  assoc_to_yojson
    [
      ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn);
      ("KmsKeyArn", option_to_yojson kms_key_arn_to_yojson x.kms_key_arn);
    ]

let create_agent_response_to_yojson (x : create_agent_response) =
  assoc_to_yojson [ ("AgentArn", option_to_yojson agent_arn_to_yojson x.agent_arn) ]

let ec2_security_group_arn_to_yojson = string_to_yojson
let pl_security_group_arn_list_to_yojson tree = list_to_yojson ec2_security_group_arn_to_yojson tree
let ec2_subnet_arn_to_yojson = string_to_yojson
let pl_subnet_arn_list_to_yojson tree = list_to_yojson ec2_subnet_arn_to_yojson tree
let vpc_endpoint_id_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_list_entry_to_yojson (x : tag_list_entry) =
  assoc_to_yojson
    [
      ("Key", Some (tag_key_to_yojson x.key));
      ("Value", option_to_yojson tag_value_to_yojson x.value);
    ]

let input_tag_list_to_yojson tree = list_to_yojson tag_list_entry_to_yojson tree

let create_agent_request_to_yojson (x : create_agent_request) =
  assoc_to_yojson
    [
      ("ActivationKey", Some (activation_key_to_yojson x.activation_key));
      ("AgentName", option_to_yojson tag_value_to_yojson x.agent_name);
      ("Tags", option_to_yojson input_tag_list_to_yojson x.tags);
      ("VpcEndpointId", option_to_yojson vpc_endpoint_id_to_yojson x.vpc_endpoint_id);
      ("SubnetArns", option_to_yojson pl_subnet_arn_list_to_yojson x.subnet_arns);
      ( "SecurityGroupArns",
        option_to_yojson pl_security_group_arn_list_to_yojson x.security_group_arns );
    ]

let location_arn_to_yojson = string_to_yojson

let create_location_azure_blob_response_to_yojson (x : create_location_azure_blob_response) =
  assoc_to_yojson [ ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn) ]

let iam_role_arn_or_empty_string_to_yojson = string_to_yojson

let custom_secret_config_to_yojson (x : custom_secret_config) =
  assoc_to_yojson
    [
      ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn);
      ( "SecretAccessRoleArn",
        option_to_yojson iam_role_arn_or_empty_string_to_yojson x.secret_access_role_arn );
    ]

let create_location_azure_blob_request_to_yojson (x : create_location_azure_blob_request) =
  assoc_to_yojson
    [
      ("ContainerUrl", Some (azure_blob_container_url_to_yojson x.container_url));
      ("AuthenticationType", Some (azure_blob_authentication_type_to_yojson x.authentication_type));
      ( "SasConfiguration",
        option_to_yojson azure_blob_sas_configuration_to_yojson x.sas_configuration );
      ("BlobType", option_to_yojson azure_blob_type_to_yojson x.blob_type);
      ("AccessTier", option_to_yojson azure_access_tier_to_yojson x.access_tier);
      ("Subdirectory", option_to_yojson azure_blob_subdirectory_to_yojson x.subdirectory);
      ("AgentArns", option_to_yojson agent_arn_list_to_yojson x.agent_arns);
      ("Tags", option_to_yojson input_tag_list_to_yojson x.tags);
      ("CmkSecretConfig", option_to_yojson cmk_secret_config_to_yojson x.cmk_secret_config);
      ("CustomSecretConfig", option_to_yojson custom_secret_config_to_yojson x.custom_secret_config);
    ]

let create_location_efs_response_to_yojson (x : create_location_efs_response) =
  assoc_to_yojson [ ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn) ]

let efs_in_transit_encryption_to_yojson (x : efs_in_transit_encryption) =
  match x with NONE -> `String "NONE" | TLS1_2 -> `String "TLS1_2"

let iam_role_arn_to_yojson = string_to_yojson
let efs_access_point_arn_to_yojson = string_to_yojson

let ec2_security_group_arn_list_to_yojson tree =
  list_to_yojson ec2_security_group_arn_to_yojson tree

let ec2_config_to_yojson (x : ec2_config) =
  assoc_to_yojson
    [
      ("SubnetArn", Some (ec2_subnet_arn_to_yojson x.subnet_arn));
      ("SecurityGroupArns", Some (ec2_security_group_arn_list_to_yojson x.security_group_arns));
    ]

let efs_filesystem_arn_to_yojson = string_to_yojson
let efs_subdirectory_to_yojson = string_to_yojson

let create_location_efs_request_to_yojson (x : create_location_efs_request) =
  assoc_to_yojson
    [
      ("Subdirectory", option_to_yojson efs_subdirectory_to_yojson x.subdirectory);
      ("EfsFilesystemArn", Some (efs_filesystem_arn_to_yojson x.efs_filesystem_arn));
      ("Ec2Config", Some (ec2_config_to_yojson x.ec2_config));
      ("Tags", option_to_yojson input_tag_list_to_yojson x.tags);
      ("AccessPointArn", option_to_yojson efs_access_point_arn_to_yojson x.access_point_arn);
      ( "FileSystemAccessRoleArn",
        option_to_yojson iam_role_arn_to_yojson x.file_system_access_role_arn );
      ( "InTransitEncryption",
        option_to_yojson efs_in_transit_encryption_to_yojson x.in_transit_encryption );
    ]

let create_location_fsx_lustre_response_to_yojson (x : create_location_fsx_lustre_response) =
  assoc_to_yojson [ ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn) ]

let fsx_lustre_subdirectory_to_yojson = string_to_yojson
let fsx_filesystem_arn_to_yojson = string_to_yojson

let create_location_fsx_lustre_request_to_yojson (x : create_location_fsx_lustre_request) =
  assoc_to_yojson
    [
      ("FsxFilesystemArn", Some (fsx_filesystem_arn_to_yojson x.fsx_filesystem_arn));
      ("SecurityGroupArns", Some (ec2_security_group_arn_list_to_yojson x.security_group_arns));
      ("Subdirectory", option_to_yojson fsx_lustre_subdirectory_to_yojson x.subdirectory);
      ("Tags", option_to_yojson input_tag_list_to_yojson x.tags);
    ]

let create_location_fsx_ontap_response_to_yojson (x : create_location_fsx_ontap_response) =
  assoc_to_yojson [ ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn) ]

let fsx_ontap_subdirectory_to_yojson = string_to_yojson
let storage_virtual_machine_arn_to_yojson = string_to_yojson

let managed_secret_config_to_yojson (x : managed_secret_config) =
  assoc_to_yojson [ ("SecretArn", option_to_yojson secret_arn_to_yojson x.secret_arn) ]

let smb_user_to_yojson = string_to_yojson
let smb_password_to_yojson = string_to_yojson

let smb_version_to_yojson (x : smb_version) =
  match x with
  | AUTOMATIC -> `String "AUTOMATIC"
  | SMB2 -> `String "SMB2"
  | SMB3 -> `String "SMB3"
  | SMB1 -> `String "SMB1"
  | SMB2_0 -> `String "SMB2_0"

let smb_mount_options_to_yojson (x : smb_mount_options) =
  assoc_to_yojson [ ("Version", option_to_yojson smb_version_to_yojson x.version) ]

let smb_domain_to_yojson = string_to_yojson

let fsx_protocol_smb_to_yojson (x : fsx_protocol_smb) =
  assoc_to_yojson
    [
      ("Domain", option_to_yojson smb_domain_to_yojson x.domain);
      ("MountOptions", option_to_yojson smb_mount_options_to_yojson x.mount_options);
      ("Password", option_to_yojson smb_password_to_yojson x.password);
      ("User", Some (smb_user_to_yojson x.user));
      ( "ManagedSecretConfig",
        option_to_yojson managed_secret_config_to_yojson x.managed_secret_config );
      ("CmkSecretConfig", option_to_yojson cmk_secret_config_to_yojson x.cmk_secret_config);
      ("CustomSecretConfig", option_to_yojson custom_secret_config_to_yojson x.custom_secret_config);
    ]

let nfs_version_to_yojson (x : nfs_version) =
  match x with
  | AUTOMATIC -> `String "AUTOMATIC"
  | NFS3 -> `String "NFS3"
  | NFS4_0 -> `String "NFS4_0"
  | NFS4_1 -> `String "NFS4_1"

let nfs_mount_options_to_yojson (x : nfs_mount_options) =
  assoc_to_yojson [ ("Version", option_to_yojson nfs_version_to_yojson x.version) ]

let fsx_protocol_nfs_to_yojson (x : fsx_protocol_nfs) =
  assoc_to_yojson [ ("MountOptions", option_to_yojson nfs_mount_options_to_yojson x.mount_options) ]

let fsx_protocol_to_yojson (x : fsx_protocol) =
  assoc_to_yojson
    [
      ("NFS", option_to_yojson fsx_protocol_nfs_to_yojson x.nf_s);
      ("SMB", option_to_yojson fsx_protocol_smb_to_yojson x.sm_b);
    ]

let create_location_fsx_ontap_request_to_yojson (x : create_location_fsx_ontap_request) =
  assoc_to_yojson
    [
      ("Protocol", Some (fsx_protocol_to_yojson x.protocol));
      ("SecurityGroupArns", Some (ec2_security_group_arn_list_to_yojson x.security_group_arns));
      ( "StorageVirtualMachineArn",
        Some (storage_virtual_machine_arn_to_yojson x.storage_virtual_machine_arn) );
      ("Subdirectory", option_to_yojson fsx_ontap_subdirectory_to_yojson x.subdirectory);
      ("Tags", option_to_yojson input_tag_list_to_yojson x.tags);
    ]

let create_location_fsx_open_zfs_response_to_yojson (x : create_location_fsx_open_zfs_response) =
  assoc_to_yojson [ ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn) ]

let fsx_open_zfs_subdirectory_to_yojson = string_to_yojson

let create_location_fsx_open_zfs_request_to_yojson (x : create_location_fsx_open_zfs_request) =
  assoc_to_yojson
    [
      ("FsxFilesystemArn", Some (fsx_filesystem_arn_to_yojson x.fsx_filesystem_arn));
      ("Protocol", Some (fsx_protocol_to_yojson x.protocol));
      ("SecurityGroupArns", Some (ec2_security_group_arn_list_to_yojson x.security_group_arns));
      ("Subdirectory", option_to_yojson fsx_open_zfs_subdirectory_to_yojson x.subdirectory);
      ("Tags", option_to_yojson input_tag_list_to_yojson x.tags);
    ]

let create_location_fsx_windows_response_to_yojson (x : create_location_fsx_windows_response) =
  assoc_to_yojson [ ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn) ]

let fsx_windows_subdirectory_to_yojson = string_to_yojson

let create_location_fsx_windows_request_to_yojson (x : create_location_fsx_windows_request) =
  assoc_to_yojson
    [
      ("Subdirectory", option_to_yojson fsx_windows_subdirectory_to_yojson x.subdirectory);
      ("FsxFilesystemArn", Some (fsx_filesystem_arn_to_yojson x.fsx_filesystem_arn));
      ("SecurityGroupArns", Some (ec2_security_group_arn_list_to_yojson x.security_group_arns));
      ("Tags", option_to_yojson input_tag_list_to_yojson x.tags);
      ("User", Some (smb_user_to_yojson x.user));
      ("Domain", option_to_yojson smb_domain_to_yojson x.domain);
      ("Password", option_to_yojson smb_password_to_yojson x.password);
      ("CmkSecretConfig", option_to_yojson cmk_secret_config_to_yojson x.cmk_secret_config);
      ("CustomSecretConfig", option_to_yojson custom_secret_config_to_yojson x.custom_secret_config);
    ]

let create_location_hdfs_response_to_yojson (x : create_location_hdfs_response) =
  assoc_to_yojson [ ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn) ]

let kerberos_krb5_conf_file_to_yojson = blob_to_yojson
let kerberos_keytab_file_to_yojson = blob_to_yojson
let kerberos_principal_to_yojson = string_to_yojson
let hdfs_user_to_yojson = string_to_yojson

let hdfs_authentication_type_to_yojson (x : hdfs_authentication_type) =
  match x with SIMPLE -> `String "SIMPLE" | KERBEROS -> `String "KERBEROS"

let hdfs_data_transfer_protection_to_yojson (x : hdfs_data_transfer_protection) =
  match x with
  | DISABLED -> `String "DISABLED"
  | AUTHENTICATION -> `String "AUTHENTICATION"
  | INTEGRITY -> `String "INTEGRITY"
  | PRIVACY -> `String "PRIVACY"

let hdfs_rpc_protection_to_yojson (x : hdfs_rpc_protection) =
  match x with
  | DISABLED -> `String "DISABLED"
  | AUTHENTICATION -> `String "AUTHENTICATION"
  | INTEGRITY -> `String "INTEGRITY"
  | PRIVACY -> `String "PRIVACY"

let qop_configuration_to_yojson (x : qop_configuration) =
  assoc_to_yojson
    [
      ("RpcProtection", option_to_yojson hdfs_rpc_protection_to_yojson x.rpc_protection);
      ( "DataTransferProtection",
        option_to_yojson hdfs_data_transfer_protection_to_yojson x.data_transfer_protection );
    ]

let kms_key_provider_uri_to_yojson = string_to_yojson
let hdfs_replication_factor_to_yojson = int_to_yojson
let hdfs_block_size_to_yojson = int_to_yojson
let hdfs_server_port_to_yojson = int_to_yojson
let hdfs_server_hostname_to_yojson = string_to_yojson

let hdfs_name_node_to_yojson (x : hdfs_name_node) =
  assoc_to_yojson
    [
      ("Hostname", Some (hdfs_server_hostname_to_yojson x.hostname));
      ("Port", Some (hdfs_server_port_to_yojson x.port));
    ]

let hdfs_name_node_list_to_yojson tree = list_to_yojson hdfs_name_node_to_yojson tree
let hdfs_subdirectory_to_yojson = string_to_yojson

let create_location_hdfs_request_to_yojson (x : create_location_hdfs_request) =
  assoc_to_yojson
    [
      ("Subdirectory", option_to_yojson hdfs_subdirectory_to_yojson x.subdirectory);
      ("NameNodes", Some (hdfs_name_node_list_to_yojson x.name_nodes));
      ("BlockSize", option_to_yojson hdfs_block_size_to_yojson x.block_size);
      ("ReplicationFactor", option_to_yojson hdfs_replication_factor_to_yojson x.replication_factor);
      ("KmsKeyProviderUri", option_to_yojson kms_key_provider_uri_to_yojson x.kms_key_provider_uri);
      ("QopConfiguration", option_to_yojson qop_configuration_to_yojson x.qop_configuration);
      ("AuthenticationType", Some (hdfs_authentication_type_to_yojson x.authentication_type));
      ("SimpleUser", option_to_yojson hdfs_user_to_yojson x.simple_user);
      ("KerberosPrincipal", option_to_yojson kerberos_principal_to_yojson x.kerberos_principal);
      ("KerberosKeytab", option_to_yojson kerberos_keytab_file_to_yojson x.kerberos_keytab);
      ("KerberosKrb5Conf", option_to_yojson kerberos_krb5_conf_file_to_yojson x.kerberos_krb5_conf);
      ("AgentArns", Some (agent_arn_list_to_yojson x.agent_arns));
      ("Tags", option_to_yojson input_tag_list_to_yojson x.tags);
      ("CmkSecretConfig", option_to_yojson cmk_secret_config_to_yojson x.cmk_secret_config);
      ("CustomSecretConfig", option_to_yojson custom_secret_config_to_yojson x.custom_secret_config);
    ]

let create_location_nfs_response_to_yojson (x : create_location_nfs_response) =
  assoc_to_yojson [ ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn) ]

let on_prem_config_to_yojson (x : on_prem_config) =
  assoc_to_yojson [ ("AgentArns", Some (agent_arn_list_to_yojson x.agent_arns)) ]

let server_hostname_to_yojson = string_to_yojson
let nfs_subdirectory_to_yojson = string_to_yojson

let create_location_nfs_request_to_yojson (x : create_location_nfs_request) =
  assoc_to_yojson
    [
      ("Subdirectory", Some (nfs_subdirectory_to_yojson x.subdirectory));
      ("ServerHostname", Some (server_hostname_to_yojson x.server_hostname));
      ("OnPremConfig", Some (on_prem_config_to_yojson x.on_prem_config));
      ("MountOptions", option_to_yojson nfs_mount_options_to_yojson x.mount_options);
      ("Tags", option_to_yojson input_tag_list_to_yojson x.tags);
    ]

let create_location_object_storage_response_to_yojson (x : create_location_object_storage_response)
    =
  assoc_to_yojson [ ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn) ]

let object_storage_certificate_to_yojson = blob_to_yojson
let object_storage_secret_key_to_yojson = string_to_yojson
let object_storage_access_key_to_yojson = string_to_yojson
let object_storage_bucket_name_to_yojson = string_to_yojson
let s3_subdirectory_to_yojson = string_to_yojson

let object_storage_server_protocol_to_yojson (x : object_storage_server_protocol) =
  match x with HTTPS -> `String "HTTPS" | HTTP -> `String "HTTP"

let object_storage_server_port_to_yojson = int_to_yojson

let create_location_object_storage_request_to_yojson (x : create_location_object_storage_request) =
  assoc_to_yojson
    [
      ("ServerHostname", Some (server_hostname_to_yojson x.server_hostname));
      ("ServerPort", option_to_yojson object_storage_server_port_to_yojson x.server_port);
      ("ServerProtocol", option_to_yojson object_storage_server_protocol_to_yojson x.server_protocol);
      ("Subdirectory", option_to_yojson s3_subdirectory_to_yojson x.subdirectory);
      ("BucketName", Some (object_storage_bucket_name_to_yojson x.bucket_name));
      ("AccessKey", option_to_yojson object_storage_access_key_to_yojson x.access_key);
      ("SecretKey", option_to_yojson object_storage_secret_key_to_yojson x.secret_key);
      ("AgentArns", option_to_yojson agent_arn_list_to_yojson x.agent_arns);
      ("Tags", option_to_yojson input_tag_list_to_yojson x.tags);
      ( "ServerCertificate",
        option_to_yojson object_storage_certificate_to_yojson x.server_certificate );
      ("CmkSecretConfig", option_to_yojson cmk_secret_config_to_yojson x.cmk_secret_config);
      ("CustomSecretConfig", option_to_yojson custom_secret_config_to_yojson x.custom_secret_config);
    ]

let create_location_s3_response_to_yojson (x : create_location_s3_response) =
  assoc_to_yojson [ ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn) ]

let s3_config_to_yojson (x : s3_config) =
  assoc_to_yojson
    [ ("BucketAccessRoleArn", Some (iam_role_arn_to_yojson x.bucket_access_role_arn)) ]

let s3_storage_class_to_yojson (x : s3_storage_class) =
  match x with
  | STANDARD -> `String "STANDARD"
  | STANDARD_IA -> `String "STANDARD_IA"
  | ONEZONE_IA -> `String "ONEZONE_IA"
  | INTELLIGENT_TIERING -> `String "INTELLIGENT_TIERING"
  | GLACIER -> `String "GLACIER"
  | DEEP_ARCHIVE -> `String "DEEP_ARCHIVE"
  | OUTPOSTS -> `String "OUTPOSTS"
  | GLACIER_INSTANT_RETRIEVAL -> `String "GLACIER_INSTANT_RETRIEVAL"

let s3_bucket_arn_to_yojson = string_to_yojson

let create_location_s3_request_to_yojson (x : create_location_s3_request) =
  assoc_to_yojson
    [
      ("Subdirectory", option_to_yojson s3_subdirectory_to_yojson x.subdirectory);
      ("S3BucketArn", Some (s3_bucket_arn_to_yojson x.s3_bucket_arn));
      ("S3StorageClass", option_to_yojson s3_storage_class_to_yojson x.s3_storage_class);
      ("S3Config", Some (s3_config_to_yojson x.s3_config));
      ("AgentArns", option_to_yojson agent_arn_list_to_yojson x.agent_arns);
      ("Tags", option_to_yojson input_tag_list_to_yojson x.tags);
    ]

let create_location_smb_response_to_yojson (x : create_location_smb_response) =
  assoc_to_yojson [ ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn) ]

let server_ip_address_to_yojson = string_to_yojson
let dns_ip_list_to_yojson tree = list_to_yojson server_ip_address_to_yojson tree

let smb_authentication_type_to_yojson (x : smb_authentication_type) =
  match x with NTLM -> `String "NTLM" | KERBEROS -> `String "KERBEROS"

let smb_subdirectory_to_yojson = string_to_yojson

let create_location_smb_request_to_yojson (x : create_location_smb_request) =
  assoc_to_yojson
    [
      ("Subdirectory", Some (smb_subdirectory_to_yojson x.subdirectory));
      ("ServerHostname", Some (server_hostname_to_yojson x.server_hostname));
      ("User", option_to_yojson smb_user_to_yojson x.user);
      ("Domain", option_to_yojson smb_domain_to_yojson x.domain);
      ("Password", option_to_yojson smb_password_to_yojson x.password);
      ("CmkSecretConfig", option_to_yojson cmk_secret_config_to_yojson x.cmk_secret_config);
      ("CustomSecretConfig", option_to_yojson custom_secret_config_to_yojson x.custom_secret_config);
      ("AgentArns", Some (agent_arn_list_to_yojson x.agent_arns));
      ("MountOptions", option_to_yojson smb_mount_options_to_yojson x.mount_options);
      ("Tags", option_to_yojson input_tag_list_to_yojson x.tags);
      ( "AuthenticationType",
        option_to_yojson smb_authentication_type_to_yojson x.authentication_type );
      ("DnsIpAddresses", option_to_yojson dns_ip_list_to_yojson x.dns_ip_addresses);
      ("KerberosPrincipal", option_to_yojson kerberos_principal_to_yojson x.kerberos_principal);
      ("KerberosKeytab", option_to_yojson kerberos_keytab_file_to_yojson x.kerberos_keytab);
      ("KerberosKrb5Conf", option_to_yojson kerberos_krb5_conf_file_to_yojson x.kerberos_krb5_conf);
    ]

let task_arn_to_yojson = string_to_yojson

let create_task_response_to_yojson (x : create_task_response) =
  assoc_to_yojson [ ("TaskArn", option_to_yojson task_arn_to_yojson x.task_arn) ]

let task_mode_to_yojson (x : task_mode) =
  match x with BASIC -> `String "BASIC" | ENHANCED -> `String "ENHANCED"

let report_level_to_yojson (x : report_level) =
  match x with
  | ERRORS_ONLY -> `String "ERRORS_ONLY"
  | SUCCESSES_AND_ERRORS -> `String "SUCCESSES_AND_ERRORS"

let report_override_to_yojson (x : report_override) =
  assoc_to_yojson [ ("ReportLevel", option_to_yojson report_level_to_yojson x.report_level) ]

let report_overrides_to_yojson (x : report_overrides) =
  assoc_to_yojson
    [
      ("Transferred", option_to_yojson report_override_to_yojson x.transferred);
      ("Verified", option_to_yojson report_override_to_yojson x.verified);
      ("Deleted", option_to_yojson report_override_to_yojson x.deleted);
      ("Skipped", option_to_yojson report_override_to_yojson x.skipped);
    ]

let object_version_ids_to_yojson (x : object_version_ids) =
  match x with INCLUDE -> `String "INCLUDE" | NONE -> `String "NONE"

let report_output_type_to_yojson (x : report_output_type) =
  match x with SUMMARY_ONLY -> `String "SUMMARY_ONLY" | STANDARD -> `String "STANDARD"

let report_destination_s3_to_yojson (x : report_destination_s3) =
  assoc_to_yojson
    [
      ("Subdirectory", option_to_yojson s3_subdirectory_to_yojson x.subdirectory);
      ("S3BucketArn", Some (s3_bucket_arn_to_yojson x.s3_bucket_arn));
      ("BucketAccessRoleArn", Some (iam_role_arn_to_yojson x.bucket_access_role_arn));
    ]

let report_destination_to_yojson (x : report_destination) =
  assoc_to_yojson [ ("S3", option_to_yojson report_destination_s3_to_yojson x.s3) ]

let task_report_config_to_yojson (x : task_report_config) =
  assoc_to_yojson
    [
      ("Destination", option_to_yojson report_destination_to_yojson x.destination);
      ("OutputType", option_to_yojson report_output_type_to_yojson x.output_type);
      ("ReportLevel", option_to_yojson report_level_to_yojson x.report_level);
      ("ObjectVersionIds", option_to_yojson object_version_ids_to_yojson x.object_version_ids);
      ("Overrides", option_to_yojson report_overrides_to_yojson x.overrides);
    ]

let s3_object_version_id_to_yojson = string_to_yojson

let s3_manifest_config_to_yojson (x : s3_manifest_config) =
  assoc_to_yojson
    [
      ("ManifestObjectPath", Some (s3_subdirectory_to_yojson x.manifest_object_path));
      ("BucketAccessRoleArn", Some (iam_role_arn_to_yojson x.bucket_access_role_arn));
      ("S3BucketArn", Some (s3_bucket_arn_to_yojson x.s3_bucket_arn));
      ( "ManifestObjectVersionId",
        option_to_yojson s3_object_version_id_to_yojson x.manifest_object_version_id );
    ]

let source_manifest_config_to_yojson (x : source_manifest_config) =
  assoc_to_yojson [ ("S3", Some (s3_manifest_config_to_yojson x.s3)) ]

let manifest_format_to_yojson (x : manifest_format) = match x with CSV -> `String "CSV"
let manifest_action_to_yojson (x : manifest_action) = match x with TRANSFER -> `String "TRANSFER"

let manifest_config_to_yojson (x : manifest_config) =
  assoc_to_yojson
    [
      ("Action", option_to_yojson manifest_action_to_yojson x.action);
      ("Format", option_to_yojson manifest_format_to_yojson x.format);
      ("Source", option_to_yojson source_manifest_config_to_yojson x.source);
    ]

let filter_value_to_yojson = string_to_yojson

let filter_type_to_yojson (x : filter_type) =
  match x with SIMPLE_PATTERN -> `String "SIMPLE_PATTERN"

let filter_rule_to_yojson (x : filter_rule) =
  assoc_to_yojson
    [
      ("FilterType", option_to_yojson filter_type_to_yojson x.filter_type);
      ("Value", option_to_yojson filter_value_to_yojson x.value);
    ]

let filter_list_to_yojson tree = list_to_yojson filter_rule_to_yojson tree

let schedule_status_to_yojson (x : schedule_status) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let schedule_expression_cron_to_yojson = string_to_yojson

let task_schedule_to_yojson (x : task_schedule) =
  assoc_to_yojson
    [
      ("ScheduleExpression", Some (schedule_expression_cron_to_yojson x.schedule_expression));
      ("Status", option_to_yojson schedule_status_to_yojson x.status);
    ]

let object_tags_to_yojson (x : object_tags) =
  match x with PRESERVE -> `String "PRESERVE" | NONE -> `String "NONE"

let smb_security_descriptor_copy_flags_to_yojson (x : smb_security_descriptor_copy_flags) =
  match x with
  | NONE -> `String "NONE"
  | OWNER_DACL -> `String "OWNER_DACL"
  | OWNER_DACL_SACL -> `String "OWNER_DACL_SACL"

let transfer_mode_to_yojson (x : transfer_mode) =
  match x with CHANGED -> `String "CHANGED" | ALL -> `String "ALL"

let log_level_to_yojson (x : log_level) =
  match x with OFF -> `String "OFF" | BASIC -> `String "BASIC" | TRANSFER -> `String "TRANSFER"

let task_queueing_to_yojson (x : task_queueing) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let posix_permissions_to_yojson (x : posix_permissions) =
  match x with NONE -> `String "NONE" | PRESERVE -> `String "PRESERVE"

let preserve_devices_to_yojson (x : preserve_devices) =
  match x with NONE -> `String "NONE" | PRESERVE -> `String "PRESERVE"

let preserve_deleted_files_to_yojson (x : preserve_deleted_files) =
  match x with PRESERVE -> `String "PRESERVE" | REMOVE -> `String "REMOVE"

let gid_to_yojson (x : gid) =
  match x with
  | NONE -> `String "NONE"
  | INT_VALUE -> `String "INT_VALUE"
  | NAME -> `String "NAME"
  | BOTH -> `String "BOTH"

let uid_to_yojson (x : uid) =
  match x with
  | NONE -> `String "NONE"
  | INT_VALUE -> `String "INT_VALUE"
  | NAME -> `String "NAME"
  | BOTH -> `String "BOTH"

let mtime_to_yojson (x : mtime) =
  match x with NONE -> `String "NONE" | PRESERVE -> `String "PRESERVE"

let overwrite_mode_to_yojson (x : overwrite_mode) =
  match x with ALWAYS -> `String "ALWAYS" | NEVER -> `String "NEVER"

let verify_mode_to_yojson (x : verify_mode) =
  match x with
  | POINT_IN_TIME_CONSISTENT -> `String "POINT_IN_TIME_CONSISTENT"
  | ONLY_FILES_TRANSFERRED -> `String "ONLY_FILES_TRANSFERRED"
  | NONE -> `String "NONE"

let options_to_yojson (x : options) =
  assoc_to_yojson
    [
      ("VerifyMode", option_to_yojson verify_mode_to_yojson x.verify_mode);
      ("OverwriteMode", option_to_yojson overwrite_mode_to_yojson x.overwrite_mode);
      ("Atime", option_to_yojson atime_to_yojson x.atime);
      ("Mtime", option_to_yojson mtime_to_yojson x.mtime);
      ("Uid", option_to_yojson uid_to_yojson x.uid);
      ("Gid", option_to_yojson gid_to_yojson x.gid);
      ( "PreserveDeletedFiles",
        option_to_yojson preserve_deleted_files_to_yojson x.preserve_deleted_files );
      ("PreserveDevices", option_to_yojson preserve_devices_to_yojson x.preserve_devices);
      ("PosixPermissions", option_to_yojson posix_permissions_to_yojson x.posix_permissions);
      ("BytesPerSecond", option_to_yojson bytes_per_second_to_yojson x.bytes_per_second);
      ("TaskQueueing", option_to_yojson task_queueing_to_yojson x.task_queueing);
      ("LogLevel", option_to_yojson log_level_to_yojson x.log_level);
      ("TransferMode", option_to_yojson transfer_mode_to_yojson x.transfer_mode);
      ( "SecurityDescriptorCopyFlags",
        option_to_yojson smb_security_descriptor_copy_flags_to_yojson
          x.security_descriptor_copy_flags );
      ("ObjectTags", option_to_yojson object_tags_to_yojson x.object_tags);
    ]

let log_group_arn_to_yojson = string_to_yojson

let create_task_request_to_yojson (x : create_task_request) =
  assoc_to_yojson
    [
      ("SourceLocationArn", Some (location_arn_to_yojson x.source_location_arn));
      ("DestinationLocationArn", Some (location_arn_to_yojson x.destination_location_arn));
      ("CloudWatchLogGroupArn", option_to_yojson log_group_arn_to_yojson x.cloud_watch_log_group_arn);
      ("Name", option_to_yojson tag_value_to_yojson x.name);
      ("Options", option_to_yojson options_to_yojson x.options);
      ("Excludes", option_to_yojson filter_list_to_yojson x.excludes);
      ("Schedule", option_to_yojson task_schedule_to_yojson x.schedule);
      ("Tags", option_to_yojson input_tag_list_to_yojson x.tags);
      ("Includes", option_to_yojson filter_list_to_yojson x.includes);
      ("ManifestConfig", option_to_yojson manifest_config_to_yojson x.manifest_config);
      ("TaskReportConfig", option_to_yojson task_report_config_to_yojson x.task_report_config);
      ("TaskMode", option_to_yojson task_mode_to_yojson x.task_mode);
    ]

let delete_agent_response_to_yojson = unit_to_yojson

let delete_agent_request_to_yojson (x : delete_agent_request) =
  assoc_to_yojson [ ("AgentArn", Some (agent_arn_to_yojson x.agent_arn)) ]

let delete_location_response_to_yojson = unit_to_yojson

let delete_location_request_to_yojson (x : delete_location_request) =
  assoc_to_yojson [ ("LocationArn", Some (location_arn_to_yojson x.location_arn)) ]

let delete_task_response_to_yojson = unit_to_yojson

let delete_task_request_to_yojson (x : delete_task_request) =
  assoc_to_yojson [ ("TaskArn", Some (task_arn_to_yojson x.task_arn)) ]

let endpoint_to_yojson = string_to_yojson

let private_link_config_to_yojson (x : private_link_config) =
  assoc_to_yojson
    [
      ("VpcEndpointId", option_to_yojson vpc_endpoint_id_to_yojson x.vpc_endpoint_id);
      ("PrivateLinkEndpoint", option_to_yojson endpoint_to_yojson x.private_link_endpoint);
      ("SubnetArns", option_to_yojson pl_subnet_arn_list_to_yojson x.subnet_arns);
      ( "SecurityGroupArns",
        option_to_yojson pl_security_group_arn_list_to_yojson x.security_group_arns );
    ]

let endpoint_type_to_yojson (x : endpoint_type) =
  match x with
  | PUBLIC -> `String "PUBLIC"
  | PRIVATE_LINK -> `String "PRIVATE_LINK"
  | FIPS -> `String "FIPS"
  | FIPS_PRIVATE_LINK -> `String "FIPS_PRIVATE_LINK"

let time_to_yojson = timestamp_epoch_seconds_to_yojson

let describe_agent_response_to_yojson (x : describe_agent_response) =
  assoc_to_yojson
    [
      ("AgentArn", option_to_yojson agent_arn_to_yojson x.agent_arn);
      ("Name", option_to_yojson tag_value_to_yojson x.name);
      ("Status", option_to_yojson agent_status_to_yojson x.status);
      ("LastConnectionTime", option_to_yojson time_to_yojson x.last_connection_time);
      ("CreationTime", option_to_yojson time_to_yojson x.creation_time);
      ("EndpointType", option_to_yojson endpoint_type_to_yojson x.endpoint_type);
      ("PrivateLinkConfig", option_to_yojson private_link_config_to_yojson x.private_link_config);
      ("Platform", option_to_yojson platform_to_yojson x.platform);
    ]

let describe_agent_request_to_yojson (x : describe_agent_request) =
  assoc_to_yojson [ ("AgentArn", Some (agent_arn_to_yojson x.agent_arn)) ]

let location_uri_to_yojson = string_to_yojson

let describe_location_azure_blob_response_to_yojson (x : describe_location_azure_blob_response) =
  assoc_to_yojson
    [
      ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn);
      ("LocationUri", option_to_yojson location_uri_to_yojson x.location_uri);
      ( "AuthenticationType",
        option_to_yojson azure_blob_authentication_type_to_yojson x.authentication_type );
      ("BlobType", option_to_yojson azure_blob_type_to_yojson x.blob_type);
      ("AccessTier", option_to_yojson azure_access_tier_to_yojson x.access_tier);
      ("AgentArns", option_to_yojson agent_arn_list_to_yojson x.agent_arns);
      ("CreationTime", option_to_yojson time_to_yojson x.creation_time);
      ( "ManagedSecretConfig",
        option_to_yojson managed_secret_config_to_yojson x.managed_secret_config );
      ("CmkSecretConfig", option_to_yojson cmk_secret_config_to_yojson x.cmk_secret_config);
      ("CustomSecretConfig", option_to_yojson custom_secret_config_to_yojson x.custom_secret_config);
    ]

let describe_location_azure_blob_request_to_yojson (x : describe_location_azure_blob_request) =
  assoc_to_yojson [ ("LocationArn", Some (location_arn_to_yojson x.location_arn)) ]

let describe_location_efs_response_to_yojson (x : describe_location_efs_response) =
  assoc_to_yojson
    [
      ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn);
      ("LocationUri", option_to_yojson location_uri_to_yojson x.location_uri);
      ("Ec2Config", option_to_yojson ec2_config_to_yojson x.ec2_config);
      ("CreationTime", option_to_yojson time_to_yojson x.creation_time);
      ("AccessPointArn", option_to_yojson efs_access_point_arn_to_yojson x.access_point_arn);
      ( "FileSystemAccessRoleArn",
        option_to_yojson iam_role_arn_to_yojson x.file_system_access_role_arn );
      ( "InTransitEncryption",
        option_to_yojson efs_in_transit_encryption_to_yojson x.in_transit_encryption );
    ]

let describe_location_efs_request_to_yojson (x : describe_location_efs_request) =
  assoc_to_yojson [ ("LocationArn", Some (location_arn_to_yojson x.location_arn)) ]

let describe_location_fsx_lustre_response_to_yojson (x : describe_location_fsx_lustre_response) =
  assoc_to_yojson
    [
      ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn);
      ("LocationUri", option_to_yojson location_uri_to_yojson x.location_uri);
      ( "SecurityGroupArns",
        option_to_yojson ec2_security_group_arn_list_to_yojson x.security_group_arns );
      ("CreationTime", option_to_yojson time_to_yojson x.creation_time);
    ]

let describe_location_fsx_lustre_request_to_yojson (x : describe_location_fsx_lustre_request) =
  assoc_to_yojson [ ("LocationArn", Some (location_arn_to_yojson x.location_arn)) ]

let describe_location_fsx_ontap_response_to_yojson (x : describe_location_fsx_ontap_response) =
  assoc_to_yojson
    [
      ("CreationTime", option_to_yojson time_to_yojson x.creation_time);
      ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn);
      ("LocationUri", option_to_yojson location_uri_to_yojson x.location_uri);
      ("Protocol", option_to_yojson fsx_protocol_to_yojson x.protocol);
      ( "SecurityGroupArns",
        option_to_yojson ec2_security_group_arn_list_to_yojson x.security_group_arns );
      ( "StorageVirtualMachineArn",
        option_to_yojson storage_virtual_machine_arn_to_yojson x.storage_virtual_machine_arn );
      ("FsxFilesystemArn", option_to_yojson fsx_filesystem_arn_to_yojson x.fsx_filesystem_arn);
    ]

let describe_location_fsx_ontap_request_to_yojson (x : describe_location_fsx_ontap_request) =
  assoc_to_yojson [ ("LocationArn", Some (location_arn_to_yojson x.location_arn)) ]

let describe_location_fsx_open_zfs_response_to_yojson (x : describe_location_fsx_open_zfs_response)
    =
  assoc_to_yojson
    [
      ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn);
      ("LocationUri", option_to_yojson location_uri_to_yojson x.location_uri);
      ( "SecurityGroupArns",
        option_to_yojson ec2_security_group_arn_list_to_yojson x.security_group_arns );
      ("Protocol", option_to_yojson fsx_protocol_to_yojson x.protocol);
      ("CreationTime", option_to_yojson time_to_yojson x.creation_time);
    ]

let describe_location_fsx_open_zfs_request_to_yojson (x : describe_location_fsx_open_zfs_request) =
  assoc_to_yojson [ ("LocationArn", Some (location_arn_to_yojson x.location_arn)) ]

let describe_location_fsx_windows_response_to_yojson (x : describe_location_fsx_windows_response) =
  assoc_to_yojson
    [
      ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn);
      ("LocationUri", option_to_yojson location_uri_to_yojson x.location_uri);
      ( "SecurityGroupArns",
        option_to_yojson ec2_security_group_arn_list_to_yojson x.security_group_arns );
      ("CreationTime", option_to_yojson time_to_yojson x.creation_time);
      ("User", option_to_yojson smb_user_to_yojson x.user);
      ("Domain", option_to_yojson smb_domain_to_yojson x.domain);
      ( "ManagedSecretConfig",
        option_to_yojson managed_secret_config_to_yojson x.managed_secret_config );
      ("CmkSecretConfig", option_to_yojson cmk_secret_config_to_yojson x.cmk_secret_config);
      ("CustomSecretConfig", option_to_yojson custom_secret_config_to_yojson x.custom_secret_config);
    ]

let describe_location_fsx_windows_request_to_yojson (x : describe_location_fsx_windows_request) =
  assoc_to_yojson [ ("LocationArn", Some (location_arn_to_yojson x.location_arn)) ]

let describe_location_hdfs_response_to_yojson (x : describe_location_hdfs_response) =
  assoc_to_yojson
    [
      ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn);
      ("LocationUri", option_to_yojson location_uri_to_yojson x.location_uri);
      ("NameNodes", option_to_yojson hdfs_name_node_list_to_yojson x.name_nodes);
      ("BlockSize", option_to_yojson hdfs_block_size_to_yojson x.block_size);
      ("ReplicationFactor", option_to_yojson hdfs_replication_factor_to_yojson x.replication_factor);
      ("KmsKeyProviderUri", option_to_yojson kms_key_provider_uri_to_yojson x.kms_key_provider_uri);
      ("QopConfiguration", option_to_yojson qop_configuration_to_yojson x.qop_configuration);
      ( "AuthenticationType",
        option_to_yojson hdfs_authentication_type_to_yojson x.authentication_type );
      ("SimpleUser", option_to_yojson hdfs_user_to_yojson x.simple_user);
      ("KerberosPrincipal", option_to_yojson kerberos_principal_to_yojson x.kerberos_principal);
      ("AgentArns", option_to_yojson agent_arn_list_to_yojson x.agent_arns);
      ("CreationTime", option_to_yojson time_to_yojson x.creation_time);
      ( "ManagedSecretConfig",
        option_to_yojson managed_secret_config_to_yojson x.managed_secret_config );
      ("CmkSecretConfig", option_to_yojson cmk_secret_config_to_yojson x.cmk_secret_config);
      ("CustomSecretConfig", option_to_yojson custom_secret_config_to_yojson x.custom_secret_config);
    ]

let describe_location_hdfs_request_to_yojson (x : describe_location_hdfs_request) =
  assoc_to_yojson [ ("LocationArn", Some (location_arn_to_yojson x.location_arn)) ]

let describe_location_nfs_response_to_yojson (x : describe_location_nfs_response) =
  assoc_to_yojson
    [
      ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn);
      ("LocationUri", option_to_yojson location_uri_to_yojson x.location_uri);
      ("OnPremConfig", option_to_yojson on_prem_config_to_yojson x.on_prem_config);
      ("MountOptions", option_to_yojson nfs_mount_options_to_yojson x.mount_options);
      ("CreationTime", option_to_yojson time_to_yojson x.creation_time);
    ]

let describe_location_nfs_request_to_yojson (x : describe_location_nfs_request) =
  assoc_to_yojson [ ("LocationArn", Some (location_arn_to_yojson x.location_arn)) ]

let describe_location_object_storage_response_to_yojson
    (x : describe_location_object_storage_response) =
  assoc_to_yojson
    [
      ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn);
      ("LocationUri", option_to_yojson location_uri_to_yojson x.location_uri);
      ("AccessKey", option_to_yojson object_storage_access_key_to_yojson x.access_key);
      ("ServerPort", option_to_yojson object_storage_server_port_to_yojson x.server_port);
      ("ServerProtocol", option_to_yojson object_storage_server_protocol_to_yojson x.server_protocol);
      ("AgentArns", option_to_yojson agent_arn_list_to_yojson x.agent_arns);
      ("CreationTime", option_to_yojson time_to_yojson x.creation_time);
      ( "ServerCertificate",
        option_to_yojson object_storage_certificate_to_yojson x.server_certificate );
      ( "ManagedSecretConfig",
        option_to_yojson managed_secret_config_to_yojson x.managed_secret_config );
      ("CmkSecretConfig", option_to_yojson cmk_secret_config_to_yojson x.cmk_secret_config);
      ("CustomSecretConfig", option_to_yojson custom_secret_config_to_yojson x.custom_secret_config);
    ]

let describe_location_object_storage_request_to_yojson
    (x : describe_location_object_storage_request) =
  assoc_to_yojson [ ("LocationArn", Some (location_arn_to_yojson x.location_arn)) ]

let describe_location_s3_response_to_yojson (x : describe_location_s3_response) =
  assoc_to_yojson
    [
      ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn);
      ("LocationUri", option_to_yojson location_uri_to_yojson x.location_uri);
      ("S3StorageClass", option_to_yojson s3_storage_class_to_yojson x.s3_storage_class);
      ("S3Config", option_to_yojson s3_config_to_yojson x.s3_config);
      ("AgentArns", option_to_yojson agent_arn_list_to_yojson x.agent_arns);
      ("CreationTime", option_to_yojson time_to_yojson x.creation_time);
    ]

let describe_location_s3_request_to_yojson (x : describe_location_s3_request) =
  assoc_to_yojson [ ("LocationArn", Some (location_arn_to_yojson x.location_arn)) ]

let describe_location_smb_response_to_yojson (x : describe_location_smb_response) =
  assoc_to_yojson
    [
      ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn);
      ("LocationUri", option_to_yojson location_uri_to_yojson x.location_uri);
      ("AgentArns", option_to_yojson agent_arn_list_to_yojson x.agent_arns);
      ("User", option_to_yojson smb_user_to_yojson x.user);
      ("Domain", option_to_yojson smb_domain_to_yojson x.domain);
      ("MountOptions", option_to_yojson smb_mount_options_to_yojson x.mount_options);
      ("CreationTime", option_to_yojson time_to_yojson x.creation_time);
      ("DnsIpAddresses", option_to_yojson dns_ip_list_to_yojson x.dns_ip_addresses);
      ("KerberosPrincipal", option_to_yojson kerberos_principal_to_yojson x.kerberos_principal);
      ( "AuthenticationType",
        option_to_yojson smb_authentication_type_to_yojson x.authentication_type );
      ( "ManagedSecretConfig",
        option_to_yojson managed_secret_config_to_yojson x.managed_secret_config );
      ("CmkSecretConfig", option_to_yojson cmk_secret_config_to_yojson x.cmk_secret_config);
      ("CustomSecretConfig", option_to_yojson custom_secret_config_to_yojson x.custom_secret_config);
    ]

let describe_location_smb_request_to_yojson (x : describe_location_smb_request) =
  assoc_to_yojson [ ("LocationArn", Some (location_arn_to_yojson x.location_arn)) ]

let schedule_disabled_by_to_yojson (x : schedule_disabled_by) =
  match x with USER -> `String "USER" | SERVICE -> `String "SERVICE"

let schedule_disabled_reason_to_yojson = string_to_yojson

let task_schedule_details_to_yojson (x : task_schedule_details) =
  assoc_to_yojson
    [
      ("StatusUpdateTime", option_to_yojson time_to_yojson x.status_update_time);
      ("DisabledReason", option_to_yojson schedule_disabled_reason_to_yojson x.disabled_reason);
      ("DisabledBy", option_to_yojson schedule_disabled_by_to_yojson x.disabled_by);
    ]

let network_interface_arn_to_yojson = string_to_yojson

let destination_network_interface_arns_to_yojson tree =
  list_to_yojson network_interface_arn_to_yojson tree

let source_network_interface_arns_to_yojson tree =
  list_to_yojson network_interface_arn_to_yojson tree

let task_status_to_yojson (x : task_status) =
  match x with
  | AVAILABLE -> `String "AVAILABLE"
  | CREATING -> `String "CREATING"
  | QUEUED -> `String "QUEUED"
  | RUNNING -> `String "RUNNING"
  | UNAVAILABLE -> `String "UNAVAILABLE"

let describe_task_response_to_yojson (x : describe_task_response) =
  assoc_to_yojson
    [
      ("TaskArn", option_to_yojson task_arn_to_yojson x.task_arn);
      ("Status", option_to_yojson task_status_to_yojson x.status);
      ("Name", option_to_yojson tag_value_to_yojson x.name);
      ( "CurrentTaskExecutionArn",
        option_to_yojson task_execution_arn_to_yojson x.current_task_execution_arn );
      ("SourceLocationArn", option_to_yojson location_arn_to_yojson x.source_location_arn);
      ("DestinationLocationArn", option_to_yojson location_arn_to_yojson x.destination_location_arn);
      ("CloudWatchLogGroupArn", option_to_yojson log_group_arn_to_yojson x.cloud_watch_log_group_arn);
      ( "SourceNetworkInterfaceArns",
        option_to_yojson source_network_interface_arns_to_yojson x.source_network_interface_arns );
      ( "DestinationNetworkInterfaceArns",
        option_to_yojson destination_network_interface_arns_to_yojson
          x.destination_network_interface_arns );
      ("Options", option_to_yojson options_to_yojson x.options);
      ("Excludes", option_to_yojson filter_list_to_yojson x.excludes);
      ("Schedule", option_to_yojson task_schedule_to_yojson x.schedule);
      ("ErrorCode", option_to_yojson string__to_yojson x.error_code);
      ("ErrorDetail", option_to_yojson string__to_yojson x.error_detail);
      ("CreationTime", option_to_yojson time_to_yojson x.creation_time);
      ("Includes", option_to_yojson filter_list_to_yojson x.includes);
      ("ManifestConfig", option_to_yojson manifest_config_to_yojson x.manifest_config);
      ("TaskReportConfig", option_to_yojson task_report_config_to_yojson x.task_report_config);
      ("ScheduleDetails", option_to_yojson task_schedule_details_to_yojson x.schedule_details);
      ("TaskMode", option_to_yojson task_mode_to_yojson x.task_mode);
    ]

let describe_task_request_to_yojson (x : describe_task_request) =
  assoc_to_yojson [ ("TaskArn", Some (task_arn_to_yojson x.task_arn)) ]

let long_to_yojson = long_to_yojson

let task_execution_folders_failed_detail_to_yojson (x : task_execution_folders_failed_detail) =
  assoc_to_yojson
    [
      ("List", option_to_yojson long_to_yojson x.list_);
      ("Prepare", option_to_yojson long_to_yojson x.prepare);
      ("Transfer", option_to_yojson long_to_yojson x.transfer);
      ("Verify", option_to_yojson long_to_yojson x.verify);
      ("Delete", option_to_yojson long_to_yojson x.delete);
    ]

let task_execution_folders_listed_detail_to_yojson (x : task_execution_folders_listed_detail) =
  assoc_to_yojson
    [
      ("AtSource", option_to_yojson long_to_yojson x.at_source);
      ("AtDestinationForDelete", option_to_yojson long_to_yojson x.at_destination_for_delete);
    ]

let item_count_to_yojson = long_to_yojson

let task_execution_files_failed_detail_to_yojson (x : task_execution_files_failed_detail) =
  assoc_to_yojson
    [
      ("Prepare", option_to_yojson long_to_yojson x.prepare);
      ("Transfer", option_to_yojson long_to_yojson x.transfer);
      ("Verify", option_to_yojson long_to_yojson x.verify);
      ("Delete", option_to_yojson long_to_yojson x.delete);
    ]

let task_execution_files_listed_detail_to_yojson (x : task_execution_files_listed_detail) =
  assoc_to_yojson
    [
      ("AtSource", option_to_yojson long_to_yojson x.at_source);
      ("AtDestinationForDelete", option_to_yojson long_to_yojson x.at_destination_for_delete);
    ]

let phase_status_to_yojson (x : phase_status) =
  match x with
  | PENDING -> `String "PENDING"
  | SUCCESS -> `String "SUCCESS"
  | ERROR -> `String "ERROR"

let report_result_to_yojson (x : report_result) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson phase_status_to_yojson x.status);
      ("ErrorCode", option_to_yojson string__to_yojson x.error_code);
      ("ErrorDetail", option_to_yojson string__to_yojson x.error_detail);
    ]

let duration_to_yojson = long_to_yojson

let task_execution_result_detail_to_yojson (x : task_execution_result_detail) =
  assoc_to_yojson
    [
      ("PrepareDuration", option_to_yojson duration_to_yojson x.prepare_duration);
      ("PrepareStatus", option_to_yojson phase_status_to_yojson x.prepare_status);
      ("TotalDuration", option_to_yojson duration_to_yojson x.total_duration);
      ("TransferDuration", option_to_yojson duration_to_yojson x.transfer_duration);
      ("TransferStatus", option_to_yojson phase_status_to_yojson x.transfer_status);
      ("VerifyDuration", option_to_yojson duration_to_yojson x.verify_duration);
      ("VerifyStatus", option_to_yojson phase_status_to_yojson x.verify_status);
      ("ErrorCode", option_to_yojson string__to_yojson x.error_code);
      ("ErrorDetail", option_to_yojson string__to_yojson x.error_detail);
    ]

let task_execution_status_to_yojson (x : task_execution_status) =
  match x with
  | QUEUED -> `String "QUEUED"
  | CANCELLING -> `String "CANCELLING"
  | LAUNCHING -> `String "LAUNCHING"
  | PREPARING -> `String "PREPARING"
  | TRANSFERRING -> `String "TRANSFERRING"
  | VERIFYING -> `String "VERIFYING"
  | SUCCESS -> `String "SUCCESS"
  | ERROR -> `String "ERROR"

let describe_task_execution_response_to_yojson (x : describe_task_execution_response) =
  assoc_to_yojson
    [
      ("TaskExecutionArn", option_to_yojson task_execution_arn_to_yojson x.task_execution_arn);
      ("Status", option_to_yojson task_execution_status_to_yojson x.status);
      ("Options", option_to_yojson options_to_yojson x.options);
      ("Excludes", option_to_yojson filter_list_to_yojson x.excludes);
      ("Includes", option_to_yojson filter_list_to_yojson x.includes);
      ("ManifestConfig", option_to_yojson manifest_config_to_yojson x.manifest_config);
      ("StartTime", option_to_yojson time_to_yojson x.start_time);
      ("EstimatedFilesToTransfer", option_to_yojson long_to_yojson x.estimated_files_to_transfer);
      ("EstimatedBytesToTransfer", option_to_yojson long_to_yojson x.estimated_bytes_to_transfer);
      ("FilesTransferred", option_to_yojson long_to_yojson x.files_transferred);
      ("BytesWritten", option_to_yojson long_to_yojson x.bytes_written);
      ("BytesTransferred", option_to_yojson long_to_yojson x.bytes_transferred);
      ("BytesCompressed", option_to_yojson long_to_yojson x.bytes_compressed);
      ("Result", option_to_yojson task_execution_result_detail_to_yojson x.result_);
      ("TaskReportConfig", option_to_yojson task_report_config_to_yojson x.task_report_config);
      ("FilesDeleted", option_to_yojson long_to_yojson x.files_deleted);
      ("FilesSkipped", option_to_yojson long_to_yojson x.files_skipped);
      ("FilesVerified", option_to_yojson long_to_yojson x.files_verified);
      ("ReportResult", option_to_yojson report_result_to_yojson x.report_result);
      ("EstimatedFilesToDelete", option_to_yojson long_to_yojson x.estimated_files_to_delete);
      ("TaskMode", option_to_yojson task_mode_to_yojson x.task_mode);
      ("FilesPrepared", option_to_yojson long_to_yojson x.files_prepared);
      ("FilesListed", option_to_yojson task_execution_files_listed_detail_to_yojson x.files_listed);
      ("FilesFailed", option_to_yojson task_execution_files_failed_detail_to_yojson x.files_failed);
      ( "EstimatedFoldersToDelete",
        option_to_yojson item_count_to_yojson x.estimated_folders_to_delete );
      ( "EstimatedFoldersToTransfer",
        option_to_yojson item_count_to_yojson x.estimated_folders_to_transfer );
      ("FoldersSkipped", option_to_yojson item_count_to_yojson x.folders_skipped);
      ("FoldersPrepared", option_to_yojson item_count_to_yojson x.folders_prepared);
      ("FoldersTransferred", option_to_yojson item_count_to_yojson x.folders_transferred);
      ("FoldersVerified", option_to_yojson item_count_to_yojson x.folders_verified);
      ("FoldersDeleted", option_to_yojson item_count_to_yojson x.folders_deleted);
      ( "FoldersListed",
        option_to_yojson task_execution_folders_listed_detail_to_yojson x.folders_listed );
      ( "FoldersFailed",
        option_to_yojson task_execution_folders_failed_detail_to_yojson x.folders_failed );
      ("LaunchTime", option_to_yojson time_to_yojson x.launch_time);
      ("EndTime", option_to_yojson time_to_yojson x.end_time);
    ]

let describe_task_execution_request_to_yojson (x : describe_task_execution_request) =
  assoc_to_yojson [ ("TaskExecutionArn", Some (task_execution_arn_to_yojson x.task_execution_arn)) ]

let filter_attribute_value_to_yojson = string_to_yojson
let filter_values_to_yojson tree = list_to_yojson filter_attribute_value_to_yojson tree
let update_task_execution_response_to_yojson = unit_to_yojson

let update_task_execution_request_to_yojson (x : update_task_execution_request) =
  assoc_to_yojson
    [
      ("TaskExecutionArn", Some (task_execution_arn_to_yojson x.task_execution_arn));
      ("Options", Some (options_to_yojson x.options));
    ]

let update_task_response_to_yojson = unit_to_yojson

let update_task_request_to_yojson (x : update_task_request) =
  assoc_to_yojson
    [
      ("TaskArn", Some (task_arn_to_yojson x.task_arn));
      ("Options", option_to_yojson options_to_yojson x.options);
      ("Excludes", option_to_yojson filter_list_to_yojson x.excludes);
      ("Schedule", option_to_yojson task_schedule_to_yojson x.schedule);
      ("Name", option_to_yojson tag_value_to_yojson x.name);
      ("CloudWatchLogGroupArn", option_to_yojson log_group_arn_to_yojson x.cloud_watch_log_group_arn);
      ("Includes", option_to_yojson filter_list_to_yojson x.includes);
      ("ManifestConfig", option_to_yojson manifest_config_to_yojson x.manifest_config);
      ("TaskReportConfig", option_to_yojson task_report_config_to_yojson x.task_report_config);
    ]

let update_location_smb_response_to_yojson = unit_to_yojson

let update_location_smb_request_to_yojson (x : update_location_smb_request) =
  assoc_to_yojson
    [
      ("LocationArn", Some (location_arn_to_yojson x.location_arn));
      ("Subdirectory", option_to_yojson smb_subdirectory_to_yojson x.subdirectory);
      ("ServerHostname", option_to_yojson server_hostname_to_yojson x.server_hostname);
      ("User", option_to_yojson smb_user_to_yojson x.user);
      ("Domain", option_to_yojson smb_domain_to_yojson x.domain);
      ("Password", option_to_yojson smb_password_to_yojson x.password);
      ("CmkSecretConfig", option_to_yojson cmk_secret_config_to_yojson x.cmk_secret_config);
      ("CustomSecretConfig", option_to_yojson custom_secret_config_to_yojson x.custom_secret_config);
      ("AgentArns", option_to_yojson agent_arn_list_to_yojson x.agent_arns);
      ("MountOptions", option_to_yojson smb_mount_options_to_yojson x.mount_options);
      ( "AuthenticationType",
        option_to_yojson smb_authentication_type_to_yojson x.authentication_type );
      ("DnsIpAddresses", option_to_yojson dns_ip_list_to_yojson x.dns_ip_addresses);
      ("KerberosPrincipal", option_to_yojson kerberos_principal_to_yojson x.kerberos_principal);
      ("KerberosKeytab", option_to_yojson kerberos_keytab_file_to_yojson x.kerberos_keytab);
      ("KerberosKrb5Conf", option_to_yojson kerberos_krb5_conf_file_to_yojson x.kerberos_krb5_conf);
    ]

let update_location_s3_response_to_yojson = unit_to_yojson

let update_location_s3_request_to_yojson (x : update_location_s3_request) =
  assoc_to_yojson
    [
      ("LocationArn", Some (location_arn_to_yojson x.location_arn));
      ("Subdirectory", option_to_yojson s3_subdirectory_to_yojson x.subdirectory);
      ("S3StorageClass", option_to_yojson s3_storage_class_to_yojson x.s3_storage_class);
      ("S3Config", option_to_yojson s3_config_to_yojson x.s3_config);
    ]

let update_location_object_storage_response_to_yojson = unit_to_yojson

let update_location_object_storage_request_to_yojson (x : update_location_object_storage_request) =
  assoc_to_yojson
    [
      ("LocationArn", Some (location_arn_to_yojson x.location_arn));
      ("ServerPort", option_to_yojson object_storage_server_port_to_yojson x.server_port);
      ("ServerProtocol", option_to_yojson object_storage_server_protocol_to_yojson x.server_protocol);
      ("Subdirectory", option_to_yojson s3_subdirectory_to_yojson x.subdirectory);
      ("ServerHostname", option_to_yojson server_hostname_to_yojson x.server_hostname);
      ("AccessKey", option_to_yojson object_storage_access_key_to_yojson x.access_key);
      ("SecretKey", option_to_yojson object_storage_secret_key_to_yojson x.secret_key);
      ("AgentArns", option_to_yojson agent_arn_list_to_yojson x.agent_arns);
      ( "ServerCertificate",
        option_to_yojson object_storage_certificate_to_yojson x.server_certificate );
      ("CmkSecretConfig", option_to_yojson cmk_secret_config_to_yojson x.cmk_secret_config);
      ("CustomSecretConfig", option_to_yojson custom_secret_config_to_yojson x.custom_secret_config);
    ]

let update_location_nfs_response_to_yojson = unit_to_yojson

let update_location_nfs_request_to_yojson (x : update_location_nfs_request) =
  assoc_to_yojson
    [
      ("LocationArn", Some (location_arn_to_yojson x.location_arn));
      ("Subdirectory", option_to_yojson nfs_subdirectory_to_yojson x.subdirectory);
      ("ServerHostname", option_to_yojson server_hostname_to_yojson x.server_hostname);
      ("OnPremConfig", option_to_yojson on_prem_config_to_yojson x.on_prem_config);
      ("MountOptions", option_to_yojson nfs_mount_options_to_yojson x.mount_options);
    ]

let update_location_hdfs_response_to_yojson = unit_to_yojson

let update_location_hdfs_request_to_yojson (x : update_location_hdfs_request) =
  assoc_to_yojson
    [
      ("LocationArn", Some (location_arn_to_yojson x.location_arn));
      ("Subdirectory", option_to_yojson hdfs_subdirectory_to_yojson x.subdirectory);
      ("NameNodes", option_to_yojson hdfs_name_node_list_to_yojson x.name_nodes);
      ("BlockSize", option_to_yojson hdfs_block_size_to_yojson x.block_size);
      ("ReplicationFactor", option_to_yojson hdfs_replication_factor_to_yojson x.replication_factor);
      ("KmsKeyProviderUri", option_to_yojson kms_key_provider_uri_to_yojson x.kms_key_provider_uri);
      ("QopConfiguration", option_to_yojson qop_configuration_to_yojson x.qop_configuration);
      ( "AuthenticationType",
        option_to_yojson hdfs_authentication_type_to_yojson x.authentication_type );
      ("SimpleUser", option_to_yojson hdfs_user_to_yojson x.simple_user);
      ("KerberosPrincipal", option_to_yojson kerberos_principal_to_yojson x.kerberos_principal);
      ("KerberosKeytab", option_to_yojson kerberos_keytab_file_to_yojson x.kerberos_keytab);
      ("KerberosKrb5Conf", option_to_yojson kerberos_krb5_conf_file_to_yojson x.kerberos_krb5_conf);
      ("AgentArns", option_to_yojson agent_arn_list_to_yojson x.agent_arns);
      ("CmkSecretConfig", option_to_yojson cmk_secret_config_to_yojson x.cmk_secret_config);
      ("CustomSecretConfig", option_to_yojson custom_secret_config_to_yojson x.custom_secret_config);
    ]

let update_location_fsx_windows_response_to_yojson = unit_to_yojson
let update_smb_domain_to_yojson = string_to_yojson

let update_location_fsx_windows_request_to_yojson (x : update_location_fsx_windows_request) =
  assoc_to_yojson
    [
      ("LocationArn", Some (location_arn_to_yojson x.location_arn));
      ("Subdirectory", option_to_yojson fsx_windows_subdirectory_to_yojson x.subdirectory);
      ("Domain", option_to_yojson update_smb_domain_to_yojson x.domain);
      ("User", option_to_yojson smb_user_to_yojson x.user);
      ("Password", option_to_yojson smb_password_to_yojson x.password);
      ("CmkSecretConfig", option_to_yojson cmk_secret_config_to_yojson x.cmk_secret_config);
      ("CustomSecretConfig", option_to_yojson custom_secret_config_to_yojson x.custom_secret_config);
    ]

let update_location_fsx_open_zfs_response_to_yojson = unit_to_yojson

let update_location_fsx_open_zfs_request_to_yojson (x : update_location_fsx_open_zfs_request) =
  assoc_to_yojson
    [
      ("LocationArn", Some (location_arn_to_yojson x.location_arn));
      ("Protocol", option_to_yojson fsx_protocol_to_yojson x.protocol);
      ("Subdirectory", option_to_yojson smb_subdirectory_to_yojson x.subdirectory);
    ]

let update_location_fsx_ontap_response_to_yojson = unit_to_yojson

let fsx_update_protocol_smb_to_yojson (x : fsx_update_protocol_smb) =
  assoc_to_yojson
    [
      ("Domain", option_to_yojson update_smb_domain_to_yojson x.domain);
      ("MountOptions", option_to_yojson smb_mount_options_to_yojson x.mount_options);
      ("Password", option_to_yojson smb_password_to_yojson x.password);
      ("User", option_to_yojson smb_user_to_yojson x.user);
      ("CmkSecretConfig", option_to_yojson cmk_secret_config_to_yojson x.cmk_secret_config);
      ("CustomSecretConfig", option_to_yojson custom_secret_config_to_yojson x.custom_secret_config);
    ]

let fsx_update_protocol_to_yojson (x : fsx_update_protocol) =
  assoc_to_yojson
    [
      ("NFS", option_to_yojson fsx_protocol_nfs_to_yojson x.nf_s);
      ("SMB", option_to_yojson fsx_update_protocol_smb_to_yojson x.sm_b);
    ]

let update_location_fsx_ontap_request_to_yojson (x : update_location_fsx_ontap_request) =
  assoc_to_yojson
    [
      ("LocationArn", Some (location_arn_to_yojson x.location_arn));
      ("Protocol", option_to_yojson fsx_update_protocol_to_yojson x.protocol);
      ("Subdirectory", option_to_yojson fsx_ontap_subdirectory_to_yojson x.subdirectory);
    ]

let update_location_fsx_lustre_response_to_yojson = unit_to_yojson

let update_location_fsx_lustre_request_to_yojson (x : update_location_fsx_lustre_request) =
  assoc_to_yojson
    [
      ("LocationArn", Some (location_arn_to_yojson x.location_arn));
      ("Subdirectory", option_to_yojson smb_subdirectory_to_yojson x.subdirectory);
    ]

let update_location_efs_response_to_yojson = unit_to_yojson
let updated_efs_iam_role_arn_to_yojson = string_to_yojson
let updated_efs_access_point_arn_to_yojson = string_to_yojson

let update_location_efs_request_to_yojson (x : update_location_efs_request) =
  assoc_to_yojson
    [
      ("LocationArn", Some (location_arn_to_yojson x.location_arn));
      ("Subdirectory", option_to_yojson efs_subdirectory_to_yojson x.subdirectory);
      ("AccessPointArn", option_to_yojson updated_efs_access_point_arn_to_yojson x.access_point_arn);
      ( "FileSystemAccessRoleArn",
        option_to_yojson updated_efs_iam_role_arn_to_yojson x.file_system_access_role_arn );
      ( "InTransitEncryption",
        option_to_yojson efs_in_transit_encryption_to_yojson x.in_transit_encryption );
    ]

let update_location_azure_blob_response_to_yojson = unit_to_yojson

let update_location_azure_blob_request_to_yojson (x : update_location_azure_blob_request) =
  assoc_to_yojson
    [
      ("LocationArn", Some (location_arn_to_yojson x.location_arn));
      ("Subdirectory", option_to_yojson azure_blob_subdirectory_to_yojson x.subdirectory);
      ( "AuthenticationType",
        option_to_yojson azure_blob_authentication_type_to_yojson x.authentication_type );
      ( "SasConfiguration",
        option_to_yojson azure_blob_sas_configuration_to_yojson x.sas_configuration );
      ("BlobType", option_to_yojson azure_blob_type_to_yojson x.blob_type);
      ("AccessTier", option_to_yojson azure_access_tier_to_yojson x.access_tier);
      ("AgentArns", option_to_yojson agent_arn_list_to_yojson x.agent_arns);
      ("CmkSecretConfig", option_to_yojson cmk_secret_config_to_yojson x.cmk_secret_config);
      ("CustomSecretConfig", option_to_yojson custom_secret_config_to_yojson x.custom_secret_config);
    ]

let update_agent_response_to_yojson = unit_to_yojson

let update_agent_request_to_yojson (x : update_agent_request) =
  assoc_to_yojson
    [
      ("AgentArn", Some (agent_arn_to_yojson x.agent_arn));
      ("Name", option_to_yojson tag_value_to_yojson x.name);
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree
let taggable_resource_arn_to_yojson = string_to_yojson

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn));
      ("Keys", Some (tag_key_list_to_yojson x.keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn));
      ("Tags", Some (input_tag_list_to_yojson x.tags));
    ]

let start_task_execution_response_to_yojson (x : start_task_execution_response) =
  assoc_to_yojson
    [ ("TaskExecutionArn", option_to_yojson task_execution_arn_to_yojson x.task_execution_arn) ]

let start_task_execution_request_to_yojson (x : start_task_execution_request) =
  assoc_to_yojson
    [
      ("TaskArn", Some (task_arn_to_yojson x.task_arn));
      ("OverrideOptions", option_to_yojson options_to_yojson x.override_options);
      ("Includes", option_to_yojson filter_list_to_yojson x.includes);
      ("Excludes", option_to_yojson filter_list_to_yojson x.excludes);
      ("ManifestConfig", option_to_yojson manifest_config_to_yojson x.manifest_config);
      ("TaskReportConfig", option_to_yojson task_report_config_to_yojson x.task_report_config);
      ("Tags", option_to_yojson input_tag_list_to_yojson x.tags);
    ]

let next_token_to_yojson = string_to_yojson

let task_list_entry_to_yojson (x : task_list_entry) =
  assoc_to_yojson
    [
      ("TaskArn", option_to_yojson task_arn_to_yojson x.task_arn);
      ("Status", option_to_yojson task_status_to_yojson x.status);
      ("Name", option_to_yojson tag_value_to_yojson x.name);
      ("TaskMode", option_to_yojson task_mode_to_yojson x.task_mode);
    ]

let task_list_to_yojson tree = list_to_yojson task_list_entry_to_yojson tree

let list_tasks_response_to_yojson (x : list_tasks_response) =
  assoc_to_yojson
    [
      ("Tasks", option_to_yojson task_list_to_yojson x.tasks);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let operator_to_yojson (x : operator) =
  match x with
  | EQ -> `String "Equals"
  | NE -> `String "NotEquals"
  | IN -> `String "In"
  | LE -> `String "LessThanOrEqual"
  | LT -> `String "LessThan"
  | GE -> `String "GreaterThanOrEqual"
  | GT -> `String "GreaterThan"
  | CONTAINS -> `String "Contains"
  | NOT_CONTAINS -> `String "NotContains"
  | BEGINS_WITH -> `String "BeginsWith"

let task_filter_name_to_yojson (x : task_filter_name) =
  match x with LocationId -> `String "LocationId" | CreationTime -> `String "CreationTime"

let task_filter_to_yojson (x : task_filter) =
  assoc_to_yojson
    [
      ("Name", Some (task_filter_name_to_yojson x.name));
      ("Values", Some (filter_values_to_yojson x.values));
      ("Operator", Some (operator_to_yojson x.operator));
    ]

let task_filters_to_yojson tree = list_to_yojson task_filter_to_yojson tree
let max_results_to_yojson = int_to_yojson

let list_tasks_request_to_yojson (x : list_tasks_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filters", option_to_yojson task_filters_to_yojson x.filters);
    ]

let task_execution_list_entry_to_yojson (x : task_execution_list_entry) =
  assoc_to_yojson
    [
      ("TaskExecutionArn", option_to_yojson task_execution_arn_to_yojson x.task_execution_arn);
      ("Status", option_to_yojson task_execution_status_to_yojson x.status);
      ("TaskMode", option_to_yojson task_mode_to_yojson x.task_mode);
    ]

let task_execution_list_to_yojson tree = list_to_yojson task_execution_list_entry_to_yojson tree

let list_task_executions_response_to_yojson (x : list_task_executions_response) =
  assoc_to_yojson
    [
      ("TaskExecutions", option_to_yojson task_execution_list_to_yojson x.task_executions);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_task_executions_request_to_yojson (x : list_task_executions_request) =
  assoc_to_yojson
    [
      ("TaskArn", option_to_yojson task_arn_to_yojson x.task_arn);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let output_tag_list_to_yojson tree = list_to_yojson tag_list_entry_to_yojson tree

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson output_tag_list_to_yojson x.tags);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (taggable_resource_arn_to_yojson x.resource_arn));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let location_list_entry_to_yojson (x : location_list_entry) =
  assoc_to_yojson
    [
      ("LocationArn", option_to_yojson location_arn_to_yojson x.location_arn);
      ("LocationUri", option_to_yojson location_uri_to_yojson x.location_uri);
    ]

let location_list_to_yojson tree = list_to_yojson location_list_entry_to_yojson tree

let list_locations_response_to_yojson (x : list_locations_response) =
  assoc_to_yojson
    [
      ("Locations", option_to_yojson location_list_to_yojson x.locations);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let location_filter_name_to_yojson (x : location_filter_name) =
  match x with
  | LocationUri -> `String "LocationUri"
  | LocationType -> `String "LocationType"
  | CreationTime -> `String "CreationTime"

let location_filter_to_yojson (x : location_filter) =
  assoc_to_yojson
    [
      ("Name", Some (location_filter_name_to_yojson x.name));
      ("Values", Some (filter_values_to_yojson x.values));
      ("Operator", Some (operator_to_yojson x.operator));
    ]

let location_filters_to_yojson tree = list_to_yojson location_filter_to_yojson tree

let list_locations_request_to_yojson (x : list_locations_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Filters", option_to_yojson location_filters_to_yojson x.filters);
    ]

let list_agents_response_to_yojson (x : list_agents_response) =
  assoc_to_yojson
    [
      ("Agents", option_to_yojson agent_list_to_yojson x.agents);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_agents_request_to_yojson (x : list_agents_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]
