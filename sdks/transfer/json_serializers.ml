open Smaws_Lib.Json.SerializeHelpers
open Types

let ssh_public_key_body_to_yojson = string_to_yojson
let service_error_message_to_yojson = string_to_yojson

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson service_error_message_to_yojson x.message) ]

let address_allocation_id_to_yojson = string_to_yojson
let address_allocation_ids_to_yojson tree = list_to_yojson address_allocation_id_to_yojson tree
let agreement_id_to_yojson = string_to_yojson

let agreement_status_type_to_yojson (x : agreement_status_type) =
  match x with ACTIVE -> `String "ACTIVE" | INACTIVE -> `String "INACTIVE"

let arn_to_yojson = string_to_yojson
let server_id_to_yojson = string_to_yojson
let as2_async_mdn_server_ids_to_yojson tree = list_to_yojson server_id_to_yojson tree
let url_to_yojson = string_to_yojson

let as2_async_mdn_connector_config_to_yojson (x : as2_async_mdn_connector_config) =
  assoc_to_yojson
    [
      ("Url", option_to_yojson url_to_yojson x.url);
      ("ServerIds", option_to_yojson as2_async_mdn_server_ids_to_yojson x.server_ids);
    ]

let preserve_content_type_to_yojson (x : preserve_content_type) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let as2_connector_secret_id_to_yojson = string_to_yojson

let mdn_response_to_yojson (x : mdn_response) =
  match x with SYNC -> `String "SYNC" | NONE -> `String "NONE" | ASYNC -> `String "ASYNC"

let mdn_signing_alg_to_yojson (x : mdn_signing_alg) =
  match x with
  | SHA256 -> `String "SHA256"
  | SHA384 -> `String "SHA384"
  | SHA512 -> `String "SHA512"
  | SHA1 -> `String "SHA1"
  | NONE -> `String "NONE"
  | DEFAULT -> `String "DEFAULT"

let signing_alg_to_yojson (x : signing_alg) =
  match x with
  | SHA256 -> `String "SHA256"
  | SHA384 -> `String "SHA384"
  | SHA512 -> `String "SHA512"
  | SHA1 -> `String "SHA1"
  | NONE -> `String "NONE"

let encryption_alg_to_yojson (x : encryption_alg) =
  match x with
  | AES128_CBC -> `String "AES128_CBC"
  | AES192_CBC -> `String "AES192_CBC"
  | AES256_CBC -> `String "AES256_CBC"
  | DES_EDE3_CBC -> `String "DES_EDE3_CBC"
  | NONE -> `String "NONE"

let compression_enum_to_yojson (x : compression_enum) =
  match x with ZLIB -> `String "ZLIB" | DISABLED -> `String "DISABLED"

let message_subject_to_yojson = string_to_yojson
let profile_id_to_yojson = string_to_yojson

let as2_connector_config_to_yojson (x : as2_connector_config) =
  assoc_to_yojson
    [
      ("LocalProfileId", option_to_yojson profile_id_to_yojson x.local_profile_id);
      ("PartnerProfileId", option_to_yojson profile_id_to_yojson x.partner_profile_id);
      ("MessageSubject", option_to_yojson message_subject_to_yojson x.message_subject);
      ("Compression", option_to_yojson compression_enum_to_yojson x.compression);
      ("EncryptionAlgorithm", option_to_yojson encryption_alg_to_yojson x.encryption_algorithm);
      ("SigningAlgorithm", option_to_yojson signing_alg_to_yojson x.signing_algorithm);
      ("MdnSigningAlgorithm", option_to_yojson mdn_signing_alg_to_yojson x.mdn_signing_algorithm);
      ("MdnResponse", option_to_yojson mdn_response_to_yojson x.mdn_response);
      ( "BasicAuthSecretId",
        option_to_yojson as2_connector_secret_id_to_yojson x.basic_auth_secret_id );
      ( "PreserveContentType",
        option_to_yojson preserve_content_type_to_yojson x.preserve_content_type );
      ( "AsyncMdnConfig",
        option_to_yojson as2_async_mdn_connector_config_to_yojson x.async_mdn_config );
    ]

let as2_id_to_yojson = string_to_yojson
let as2_transport_to_yojson (x : as2_transport) = match x with HTTP -> `String "HTTP"
let as2_transports_to_yojson tree = list_to_yojson as2_transport_to_yojson tree
let callback_token_to_yojson = string_to_yojson
let cert_date_to_yojson = timestamp_epoch_seconds_to_yojson
let cert_serial_to_yojson = string_to_yojson
let certificate_to_yojson = string_to_yojson
let certificate_body_type_to_yojson = string_to_yojson
let certificate_chain_type_to_yojson = string_to_yojson
let certificate_id_to_yojson = string_to_yojson
let certificate_ids_to_yojson tree = list_to_yojson certificate_id_to_yojson tree

let certificate_status_type_to_yojson (x : certificate_status_type) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | PENDING_ROTATION -> `String "PENDING_ROTATION"
  | INACTIVE -> `String "INACTIVE"

let certificate_type_to_yojson (x : certificate_type) =
  match x with
  | CERTIFICATE -> `String "CERTIFICATE"
  | CERTIFICATE_WITH_PRIVATE_KEY -> `String "CERTIFICATE_WITH_PRIVATE_KEY"

let certificate_usage_type_to_yojson (x : certificate_usage_type) =
  match x with
  | SIGNING -> `String "SIGNING"
  | ENCRYPTION -> `String "ENCRYPTION"
  | TLS -> `String "TLS"

let message_to_yojson = string_to_yojson

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("Message", Some (message_to_yojson x.message)) ]

let sftp_port_to_yojson = int_to_yojson
let vpc_lattice_resource_configuration_arn_to_yojson = string_to_yojson

let connector_vpc_lattice_egress_config_to_yojson (x : connector_vpc_lattice_egress_config) =
  assoc_to_yojson
    [
      ( "ResourceConfigurationArn",
        Some (vpc_lattice_resource_configuration_arn_to_yojson x.resource_configuration_arn) );
      ("PortNumber", option_to_yojson sftp_port_to_yojson x.port_number);
    ]

let connector_egress_config_to_yojson (x : connector_egress_config) =
  match x with
  | VpcLattice arg ->
      assoc_to_yojson [ ("VpcLattice", Some (connector_vpc_lattice_egress_config_to_yojson arg)) ]

let connector_egress_type_to_yojson (x : connector_egress_type) =
  match x with SERVICE_MANAGED -> `String "SERVICE_MANAGED" | VPC_LATTICE -> `String "VPC_LATTICE"

let connector_error_message_to_yojson = string_to_yojson
let failure_code_to_yojson = string_to_yojson

let transfer_table_status_to_yojson (x : transfer_table_status) =
  match x with
  | QUEUED -> `String "QUEUED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | COMPLETED -> `String "COMPLETED"
  | FAILED -> `String "FAILED"

let file_path_to_yojson = string_to_yojson

let connector_file_transfer_result_to_yojson (x : connector_file_transfer_result) =
  assoc_to_yojson
    [
      ("FilePath", Some (file_path_to_yojson x.file_path));
      ("StatusCode", Some (transfer_table_status_to_yojson x.status_code));
      ("FailureCode", option_to_yojson failure_code_to_yojson x.failure_code);
      ("FailureMessage", option_to_yojson message_to_yojson x.failure_message);
    ]

let connector_file_transfer_results_to_yojson tree =
  list_to_yojson connector_file_transfer_result_to_yojson tree

let connector_id_to_yojson = string_to_yojson
let connector_security_policy_name_to_yojson = string_to_yojson

let connector_status_to_yojson (x : connector_status) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | ERRORED -> `String "ERRORED"
  | PENDING -> `String "PENDING"

let connectors_ip_address_type_to_yojson (x : connectors_ip_address_type) =
  match x with IPV4 -> `String "IPV4" | DUALSTACK -> `String "DUALSTACK"

let source_file_location_to_yojson = string_to_yojson

let overwrite_existing_to_yojson (x : overwrite_existing) =
  match x with TRUE -> `String "TRUE" | FALSE -> `String "FALSE"

let efs_path_to_yojson = string_to_yojson
let efs_file_system_id_to_yojson = string_to_yojson

let efs_file_location_to_yojson (x : efs_file_location) =
  assoc_to_yojson
    [
      ("FileSystemId", option_to_yojson efs_file_system_id_to_yojson x.file_system_id);
      ("Path", option_to_yojson efs_path_to_yojson x.path);
    ]

let s3_key_to_yojson = string_to_yojson
let s3_bucket_to_yojson = string_to_yojson

let s3_input_file_location_to_yojson (x : s3_input_file_location) =
  assoc_to_yojson
    [
      ("Bucket", option_to_yojson s3_bucket_to_yojson x.bucket);
      ("Key", option_to_yojson s3_key_to_yojson x.key);
    ]

let input_file_location_to_yojson (x : input_file_location) =
  assoc_to_yojson
    [
      ("S3FileLocation", option_to_yojson s3_input_file_location_to_yojson x.s3_file_location);
      ("EfsFileLocation", option_to_yojson efs_file_location_to_yojson x.efs_file_location);
    ]

let workflow_step_name_to_yojson = string_to_yojson

let copy_step_details_to_yojson (x : copy_step_details) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson workflow_step_name_to_yojson x.name);
      ( "DestinationFileLocation",
        option_to_yojson input_file_location_to_yojson x.destination_file_location );
      ("OverwriteExisting", option_to_yojson overwrite_existing_to_yojson x.overwrite_existing);
      ("SourceFileLocation", option_to_yojson source_file_location_to_yojson x.source_file_location);
    ]

let service_unavailable_exception_to_yojson (x : service_unavailable_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson service_error_message_to_yojson x.message) ]

let resource_type_to_yojson = string_to_yojson
let resource_to_yojson = string_to_yojson

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("Message", Some (message_to_yojson x.message));
      ("Resource", Some (resource_to_yojson x.resource));
      ("ResourceType", Some (resource_type_to_yojson x.resource_type));
    ]

let resource_exists_exception_to_yojson (x : resource_exists_exception) =
  assoc_to_yojson
    [
      ("Message", Some (message_to_yojson x.message));
      ("Resource", Some (resource_to_yojson x.resource));
      ("ResourceType", Some (resource_type_to_yojson x.resource_type));
    ]

let invalid_request_exception_to_yojson (x : invalid_request_exception) =
  assoc_to_yojson [ ("Message", Some (message_to_yojson x.message)) ]

let internal_service_error_to_yojson (x : internal_service_error) =
  assoc_to_yojson [ ("Message", Some (message_to_yojson x.message)) ]

let external_id_to_yojson = string_to_yojson

let create_access_response_to_yojson (x : create_access_response) =
  assoc_to_yojson
    [
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("ExternalId", Some (external_id_to_yojson x.external_id));
    ]

let role_to_yojson = string_to_yojson
let posix_id_to_yojson = long_to_yojson
let secondary_gids_to_yojson tree = list_to_yojson posix_id_to_yojson tree

let posix_profile_to_yojson (x : posix_profile) =
  assoc_to_yojson
    [
      ("Uid", Some (posix_id_to_yojson x.uid));
      ("Gid", Some (posix_id_to_yojson x.gid));
      ("SecondaryGids", option_to_yojson secondary_gids_to_yojson x.secondary_gids);
    ]

let policy_to_yojson = string_to_yojson

let map_type_to_yojson (x : map_type) =
  match x with FILE -> `String "FILE" | DIRECTORY -> `String "DIRECTORY"

let map_target_to_yojson = string_to_yojson
let map_entry_to_yojson = string_to_yojson

let home_directory_map_entry_to_yojson (x : home_directory_map_entry) =
  assoc_to_yojson
    [
      ("Entry", Some (map_entry_to_yojson x.entry));
      ("Target", Some (map_target_to_yojson x.target));
      ("Type", option_to_yojson map_type_to_yojson x.type_);
    ]

let home_directory_mappings_to_yojson tree = list_to_yojson home_directory_map_entry_to_yojson tree

let home_directory_type_to_yojson (x : home_directory_type) =
  match x with PATH -> `String "PATH" | LOGICAL -> `String "LOGICAL"

let home_directory_to_yojson = string_to_yojson

let create_access_request_to_yojson (x : create_access_request) =
  assoc_to_yojson
    [
      ("HomeDirectory", option_to_yojson home_directory_to_yojson x.home_directory);
      ("HomeDirectoryType", option_to_yojson home_directory_type_to_yojson x.home_directory_type);
      ( "HomeDirectoryMappings",
        option_to_yojson home_directory_mappings_to_yojson x.home_directory_mappings );
      ("Policy", option_to_yojson policy_to_yojson x.policy);
      ("PosixProfile", option_to_yojson posix_profile_to_yojson x.posix_profile);
      ("Role", Some (role_to_yojson x.role));
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("ExternalId", Some (external_id_to_yojson x.external_id));
    ]

let retry_after_seconds_to_yojson = string_to_yojson

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [ ("RetryAfterSeconds", option_to_yojson retry_after_seconds_to_yojson x.retry_after_seconds) ]

let create_agreement_response_to_yojson (x : create_agreement_response) =
  assoc_to_yojson [ ("AgreementId", Some (agreement_id_to_yojson x.agreement_id)) ]

let custom_directories_type_to_yojson (x : custom_directories_type) =
  assoc_to_yojson
    [
      ("FailedFilesDirectory", Some (home_directory_to_yojson x.failed_files_directory));
      ("MdnFilesDirectory", Some (home_directory_to_yojson x.mdn_files_directory));
      ("PayloadFilesDirectory", Some (home_directory_to_yojson x.payload_files_directory));
      ("StatusFilesDirectory", Some (home_directory_to_yojson x.status_files_directory));
      ("TemporaryFilesDirectory", Some (home_directory_to_yojson x.temporary_files_directory));
    ]

let enforce_message_signing_type_to_yojson (x : enforce_message_signing_type) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let preserve_filename_type_to_yojson (x : preserve_filename_type) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tags_to_yojson tree = list_to_yojson tag_to_yojson tree
let description_to_yojson = string_to_yojson

let create_agreement_request_to_yojson (x : create_agreement_request) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson description_to_yojson x.description);
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("LocalProfileId", Some (profile_id_to_yojson x.local_profile_id));
      ("PartnerProfileId", Some (profile_id_to_yojson x.partner_profile_id));
      ("BaseDirectory", option_to_yojson home_directory_to_yojson x.base_directory);
      ("AccessRole", Some (role_to_yojson x.access_role));
      ("Status", option_to_yojson agreement_status_type_to_yojson x.status);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("PreserveFilename", option_to_yojson preserve_filename_type_to_yojson x.preserve_filename);
      ( "EnforceMessageSigning",
        option_to_yojson enforce_message_signing_type_to_yojson x.enforce_message_signing );
      ("CustomDirectories", option_to_yojson custom_directories_type_to_yojson x.custom_directories);
    ]

let create_connector_response_to_yojson (x : create_connector_response) =
  assoc_to_yojson [ ("ConnectorId", Some (connector_id_to_yojson x.connector_id)) ]

let max_concurrent_connections_to_yojson = int_to_yojson
let sftp_connector_trusted_host_key_to_yojson = string_to_yojson

let sftp_connector_trusted_host_key_list_to_yojson tree =
  list_to_yojson sftp_connector_trusted_host_key_to_yojson tree

let secret_id_to_yojson = string_to_yojson

let sftp_connector_config_to_yojson (x : sftp_connector_config) =
  assoc_to_yojson
    [
      ("UserSecretId", option_to_yojson secret_id_to_yojson x.user_secret_id);
      ( "TrustedHostKeys",
        option_to_yojson sftp_connector_trusted_host_key_list_to_yojson x.trusted_host_keys );
      ( "MaxConcurrentConnections",
        option_to_yojson max_concurrent_connections_to_yojson x.max_concurrent_connections );
    ]

let create_connector_request_to_yojson (x : create_connector_request) =
  assoc_to_yojson
    [
      ("Url", option_to_yojson url_to_yojson x.url);
      ("As2Config", option_to_yojson as2_connector_config_to_yojson x.as2_config);
      ("AccessRole", Some (role_to_yojson x.access_role));
      ("LoggingRole", option_to_yojson role_to_yojson x.logging_role);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("SftpConfig", option_to_yojson sftp_connector_config_to_yojson x.sftp_config);
      ( "SecurityPolicyName",
        option_to_yojson connector_security_policy_name_to_yojson x.security_policy_name );
      ("EgressConfig", option_to_yojson connector_egress_config_to_yojson x.egress_config);
      ("IpAddressType", option_to_yojson connectors_ip_address_type_to_yojson x.ip_address_type);
    ]

let create_profile_response_to_yojson (x : create_profile_response) =
  assoc_to_yojson [ ("ProfileId", Some (profile_id_to_yojson x.profile_id)) ]

let profile_type_to_yojson (x : profile_type) =
  match x with LOCAL -> `String "LOCAL" | PARTNER -> `String "PARTNER"

let create_profile_request_to_yojson (x : create_profile_request) =
  assoc_to_yojson
    [
      ("As2Id", Some (as2_id_to_yojson x.as2_id));
      ("ProfileType", Some (profile_type_to_yojson x.profile_type));
      ("CertificateIds", option_to_yojson certificate_ids_to_yojson x.certificate_ids);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let create_server_response_to_yojson (x : create_server_response) =
  assoc_to_yojson [ ("ServerId", Some (server_id_to_yojson x.server_id)) ]

let ip_address_type_to_yojson (x : ip_address_type) =
  match x with IPV4 -> `String "IPV4" | DUALSTACK -> `String "DUALSTACK"

let directory_listing_optimization_to_yojson (x : directory_listing_optimization) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let s3_storage_options_to_yojson (x : s3_storage_options) =
  assoc_to_yojson
    [
      ( "DirectoryListingOptimization",
        option_to_yojson directory_listing_optimization_to_yojson x.directory_listing_optimization
      );
    ]

let structured_log_destinations_to_yojson tree = list_to_yojson arn_to_yojson tree
let workflow_id_to_yojson = string_to_yojson

let workflow_detail_to_yojson (x : workflow_detail) =
  assoc_to_yojson
    [
      ("WorkflowId", Some (workflow_id_to_yojson x.workflow_id));
      ("ExecutionRole", Some (role_to_yojson x.execution_role));
    ]

let on_partial_upload_workflow_details_to_yojson tree =
  list_to_yojson workflow_detail_to_yojson tree

let on_upload_workflow_details_to_yojson tree = list_to_yojson workflow_detail_to_yojson tree

let workflow_details_to_yojson (x : workflow_details) =
  assoc_to_yojson
    [
      ("OnUpload", option_to_yojson on_upload_workflow_details_to_yojson x.on_upload);
      ( "OnPartialUpload",
        option_to_yojson on_partial_upload_workflow_details_to_yojson x.on_partial_upload );
    ]

let security_policy_name_to_yojson = string_to_yojson

let set_stat_option_to_yojson (x : set_stat_option) =
  match x with DEFAULT -> `String "DEFAULT" | ENABLE_NO_OP -> `String "ENABLE_NO_OP"

let tls_session_resumption_mode_to_yojson (x : tls_session_resumption_mode) =
  match x with
  | DISABLED -> `String "DISABLED"
  | ENABLED -> `String "ENABLED"
  | ENFORCED -> `String "ENFORCED"

let passive_ip_to_yojson = string_to_yojson

let protocol_details_to_yojson (x : protocol_details) =
  assoc_to_yojson
    [
      ("PassiveIp", option_to_yojson passive_ip_to_yojson x.passive_ip);
      ( "TlsSessionResumptionMode",
        option_to_yojson tls_session_resumption_mode_to_yojson x.tls_session_resumption_mode );
      ("SetStatOption", option_to_yojson set_stat_option_to_yojson x.set_stat_option);
      ("As2Transports", option_to_yojson as2_transports_to_yojson x.as2_transports);
    ]

let protocol_to_yojson (x : protocol) =
  match x with
  | SFTP -> `String "SFTP"
  | FTP -> `String "FTP"
  | FTPS -> `String "FTPS"
  | AS2 -> `String "AS2"

let protocols_to_yojson tree = list_to_yojson protocol_to_yojson tree
let pre_authentication_login_banner_to_yojson = string_to_yojson
let post_authentication_login_banner_to_yojson = string_to_yojson
let nullable_role_to_yojson = string_to_yojson

let identity_provider_type_to_yojson (x : identity_provider_type) =
  match x with
  | SERVICE_MANAGED -> `String "SERVICE_MANAGED"
  | API_GATEWAY -> `String "API_GATEWAY"
  | AWS_DIRECTORY_SERVICE -> `String "AWS_DIRECTORY_SERVICE"
  | AWS_LAMBDA -> `String "AWS_LAMBDA"

let sftp_authentication_methods_to_yojson (x : sftp_authentication_methods) =
  match x with
  | PASSWORD -> `String "PASSWORD"
  | PUBLIC_KEY -> `String "PUBLIC_KEY"
  | PUBLIC_KEY_OR_PASSWORD -> `String "PUBLIC_KEY_OR_PASSWORD"
  | PUBLIC_KEY_AND_PASSWORD -> `String "PUBLIC_KEY_AND_PASSWORD"

let function_to_yojson = string_to_yojson
let directory_id_to_yojson = string_to_yojson

let identity_provider_details_to_yojson (x : identity_provider_details) =
  assoc_to_yojson
    [
      ("Url", option_to_yojson url_to_yojson x.url);
      ("InvocationRole", option_to_yojson role_to_yojson x.invocation_role);
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
      ("Function", option_to_yojson function_to_yojson x.\#function);
      ( "SftpAuthenticationMethods",
        option_to_yojson sftp_authentication_methods_to_yojson x.sftp_authentication_methods );
    ]

let host_key_to_yojson = string_to_yojson

let endpoint_type_to_yojson (x : endpoint_type) =
  match x with
  | PUBLIC -> `String "PUBLIC"
  | VPC -> `String "VPC"
  | VPC_ENDPOINT -> `String "VPC_ENDPOINT"

let security_group_id_to_yojson = string_to_yojson
let security_group_ids_to_yojson tree = list_to_yojson security_group_id_to_yojson tree
let vpc_id_to_yojson = string_to_yojson
let vpc_endpoint_id_to_yojson = string_to_yojson
let subnet_id_to_yojson = string_to_yojson
let subnet_ids_to_yojson tree = list_to_yojson subnet_id_to_yojson tree

let endpoint_details_to_yojson (x : endpoint_details) =
  assoc_to_yojson
    [
      ( "AddressAllocationIds",
        option_to_yojson address_allocation_ids_to_yojson x.address_allocation_ids );
      ("SubnetIds", option_to_yojson subnet_ids_to_yojson x.subnet_ids);
      ("VpcEndpointId", option_to_yojson vpc_endpoint_id_to_yojson x.vpc_endpoint_id);
      ("VpcId", option_to_yojson vpc_id_to_yojson x.vpc_id);
      ("SecurityGroupIds", option_to_yojson security_group_ids_to_yojson x.security_group_ids);
    ]

let domain_to_yojson (x : domain) = match x with S3 -> `String "S3" | EFS -> `String "EFS"

let create_server_request_to_yojson (x : create_server_request) =
  assoc_to_yojson
    [
      ("Certificate", option_to_yojson certificate_to_yojson x.certificate);
      ("Domain", option_to_yojson domain_to_yojson x.domain);
      ("EndpointDetails", option_to_yojson endpoint_details_to_yojson x.endpoint_details);
      ("EndpointType", option_to_yojson endpoint_type_to_yojson x.endpoint_type);
      ("HostKey", option_to_yojson host_key_to_yojson x.host_key);
      ( "IdentityProviderDetails",
        option_to_yojson identity_provider_details_to_yojson x.identity_provider_details );
      ( "IdentityProviderType",
        option_to_yojson identity_provider_type_to_yojson x.identity_provider_type );
      ("LoggingRole", option_to_yojson nullable_role_to_yojson x.logging_role);
      ( "PostAuthenticationLoginBanner",
        option_to_yojson post_authentication_login_banner_to_yojson
          x.post_authentication_login_banner );
      ( "PreAuthenticationLoginBanner",
        option_to_yojson pre_authentication_login_banner_to_yojson x.pre_authentication_login_banner
      );
      ("Protocols", option_to_yojson protocols_to_yojson x.protocols);
      ("ProtocolDetails", option_to_yojson protocol_details_to_yojson x.protocol_details);
      ("SecurityPolicyName", option_to_yojson security_policy_name_to_yojson x.security_policy_name);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("WorkflowDetails", option_to_yojson workflow_details_to_yojson x.workflow_details);
      ( "StructuredLogDestinations",
        option_to_yojson structured_log_destinations_to_yojson x.structured_log_destinations );
      ("S3StorageOptions", option_to_yojson s3_storage_options_to_yojson x.s3_storage_options);
      ("IpAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
    ]

let user_name_to_yojson = string_to_yojson

let create_user_response_to_yojson (x : create_user_response) =
  assoc_to_yojson
    [
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("UserName", Some (user_name_to_yojson x.user_name));
    ]

let create_user_request_to_yojson (x : create_user_request) =
  assoc_to_yojson
    [
      ("HomeDirectory", option_to_yojson home_directory_to_yojson x.home_directory);
      ("HomeDirectoryType", option_to_yojson home_directory_type_to_yojson x.home_directory_type);
      ( "HomeDirectoryMappings",
        option_to_yojson home_directory_mappings_to_yojson x.home_directory_mappings );
      ("Policy", option_to_yojson policy_to_yojson x.policy);
      ("PosixProfile", option_to_yojson posix_profile_to_yojson x.posix_profile);
      ("Role", Some (role_to_yojson x.role));
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("SshPublicKeyBody", option_to_yojson ssh_public_key_body_to_yojson x.ssh_public_key_body);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("UserName", Some (user_name_to_yojson x.user_name));
    ]

let web_app_id_to_yojson = string_to_yojson

let create_web_app_response_to_yojson (x : create_web_app_response) =
  assoc_to_yojson [ ("WebAppId", Some (web_app_id_to_yojson x.web_app_id)) ]

let web_app_vpc_endpoint_ip_address_type_to_yojson (x : web_app_vpc_endpoint_ip_address_type) =
  match x with IPV4 -> `String "IPV4" | DUALSTACK -> `String "DUALSTACK"

let web_app_vpc_config_to_yojson (x : web_app_vpc_config) =
  assoc_to_yojson
    [
      ("SubnetIds", option_to_yojson subnet_ids_to_yojson x.subnet_ids);
      ("VpcId", option_to_yojson vpc_id_to_yojson x.vpc_id);
      ("SecurityGroupIds", option_to_yojson security_group_ids_to_yojson x.security_group_ids);
      ( "IpAddressType",
        option_to_yojson web_app_vpc_endpoint_ip_address_type_to_yojson x.ip_address_type );
    ]

let web_app_endpoint_details_to_yojson (x : web_app_endpoint_details) =
  match x with Vpc arg -> assoc_to_yojson [ ("Vpc", Some (web_app_vpc_config_to_yojson arg)) ]

let web_app_endpoint_policy_to_yojson (x : web_app_endpoint_policy) =
  match x with FIPS -> `String "FIPS" | STANDARD -> `String "STANDARD"

let web_app_unit_count_to_yojson = int_to_yojson

let web_app_units_to_yojson (x : web_app_units) =
  match x with
  | Provisioned arg -> assoc_to_yojson [ ("Provisioned", Some (web_app_unit_count_to_yojson arg)) ]

let web_app_access_endpoint_to_yojson = string_to_yojson
let identity_center_instance_arn_to_yojson = string_to_yojson

let identity_center_config_to_yojson (x : identity_center_config) =
  assoc_to_yojson
    [
      ("InstanceArn", option_to_yojson identity_center_instance_arn_to_yojson x.instance_arn);
      ("Role", option_to_yojson role_to_yojson x.role);
    ]

let web_app_identity_provider_details_to_yojson (x : web_app_identity_provider_details) =
  match x with
  | IdentityCenterConfig arg ->
      assoc_to_yojson [ ("IdentityCenterConfig", Some (identity_center_config_to_yojson arg)) ]

let create_web_app_request_to_yojson (x : create_web_app_request) =
  assoc_to_yojson
    [
      ( "IdentityProviderDetails",
        Some (web_app_identity_provider_details_to_yojson x.identity_provider_details) );
      ("AccessEndpoint", option_to_yojson web_app_access_endpoint_to_yojson x.access_endpoint);
      ("WebAppUnits", option_to_yojson web_app_units_to_yojson x.web_app_units);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ( "WebAppEndpointPolicy",
        option_to_yojson web_app_endpoint_policy_to_yojson x.web_app_endpoint_policy );
      ("EndpointDetails", option_to_yojson web_app_endpoint_details_to_yojson x.endpoint_details);
    ]

let create_workflow_response_to_yojson (x : create_workflow_response) =
  assoc_to_yojson [ ("WorkflowId", Some (workflow_id_to_yojson x.workflow_id)) ]

let encryption_type_to_yojson (x : encryption_type) = match x with PGP -> `String "PGP"

let decrypt_step_details_to_yojson (x : decrypt_step_details) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson workflow_step_name_to_yojson x.name);
      ("Type", Some (encryption_type_to_yojson x.type_));
      ("SourceFileLocation", option_to_yojson source_file_location_to_yojson x.source_file_location);
      ("OverwriteExisting", option_to_yojson overwrite_existing_to_yojson x.overwrite_existing);
      ("DestinationFileLocation", Some (input_file_location_to_yojson x.destination_file_location));
    ]

let s3_tag_value_to_yojson = string_to_yojson
let s3_tag_key_to_yojson = string_to_yojson

let s3_tag_to_yojson (x : s3_tag) =
  assoc_to_yojson
    [ ("Key", Some (s3_tag_key_to_yojson x.key)); ("Value", Some (s3_tag_value_to_yojson x.value)) ]

let s3_tags_to_yojson tree = list_to_yojson s3_tag_to_yojson tree

let tag_step_details_to_yojson (x : tag_step_details) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson workflow_step_name_to_yojson x.name);
      ("Tags", option_to_yojson s3_tags_to_yojson x.tags);
      ("SourceFileLocation", option_to_yojson source_file_location_to_yojson x.source_file_location);
    ]

let delete_step_details_to_yojson (x : delete_step_details) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson workflow_step_name_to_yojson x.name);
      ("SourceFileLocation", option_to_yojson source_file_location_to_yojson x.source_file_location);
    ]

let custom_step_timeout_seconds_to_yojson = int_to_yojson
let custom_step_target_to_yojson = string_to_yojson

let custom_step_details_to_yojson (x : custom_step_details) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson workflow_step_name_to_yojson x.name);
      ("Target", option_to_yojson custom_step_target_to_yojson x.target);
      ("TimeoutSeconds", option_to_yojson custom_step_timeout_seconds_to_yojson x.timeout_seconds);
      ("SourceFileLocation", option_to_yojson source_file_location_to_yojson x.source_file_location);
    ]

let workflow_step_type_to_yojson (x : workflow_step_type) =
  match x with
  | COPY -> `String "COPY"
  | CUSTOM -> `String "CUSTOM"
  | TAG -> `String "TAG"
  | DELETE -> `String "DELETE"
  | DECRYPT -> `String "DECRYPT"

let workflow_step_to_yojson (x : workflow_step) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson workflow_step_type_to_yojson x.type_);
      ("CopyStepDetails", option_to_yojson copy_step_details_to_yojson x.copy_step_details);
      ("CustomStepDetails", option_to_yojson custom_step_details_to_yojson x.custom_step_details);
      ("DeleteStepDetails", option_to_yojson delete_step_details_to_yojson x.delete_step_details);
      ("TagStepDetails", option_to_yojson tag_step_details_to_yojson x.tag_step_details);
      ("DecryptStepDetails", option_to_yojson decrypt_step_details_to_yojson x.decrypt_step_details);
    ]

let workflow_steps_to_yojson tree = list_to_yojson workflow_step_to_yojson tree
let workflow_description_to_yojson = string_to_yojson

let create_workflow_request_to_yojson (x : create_workflow_request) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson workflow_description_to_yojson x.description);
      ("Steps", Some (workflow_steps_to_yojson x.steps));
      ("OnExceptionSteps", option_to_yojson workflow_steps_to_yojson x.on_exception_steps);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let custom_http_header_value_type_to_yojson = string_to_yojson
let custom_http_header_key_type_to_yojson = string_to_yojson

let custom_http_header_to_yojson (x : custom_http_header) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson custom_http_header_key_type_to_yojson x.key);
      ("Value", option_to_yojson custom_http_header_value_type_to_yojson x.value);
    ]

let custom_http_headers_to_yojson tree = list_to_yojson custom_http_header_to_yojson tree

let custom_step_status_to_yojson (x : custom_step_status) =
  match x with SUCCESS -> `String "SUCCESS" | FAILURE -> `String "FAILURE"

let date_imported_to_yojson = timestamp_epoch_seconds_to_yojson

let delete_access_request_to_yojson (x : delete_access_request) =
  assoc_to_yojson
    [
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("ExternalId", Some (external_id_to_yojson x.external_id));
    ]

let delete_agreement_request_to_yojson (x : delete_agreement_request) =
  assoc_to_yojson
    [
      ("AgreementId", Some (agreement_id_to_yojson x.agreement_id));
      ("ServerId", Some (server_id_to_yojson x.server_id));
    ]

let delete_certificate_request_to_yojson (x : delete_certificate_request) =
  assoc_to_yojson [ ("CertificateId", Some (certificate_id_to_yojson x.certificate_id)) ]

let delete_connector_request_to_yojson (x : delete_connector_request) =
  assoc_to_yojson [ ("ConnectorId", Some (connector_id_to_yojson x.connector_id)) ]

let host_key_id_to_yojson = string_to_yojson

let delete_host_key_request_to_yojson (x : delete_host_key_request) =
  assoc_to_yojson
    [
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("HostKeyId", Some (host_key_id_to_yojson x.host_key_id));
    ]

let delete_id_to_yojson = string_to_yojson

let delete_profile_request_to_yojson (x : delete_profile_request) =
  assoc_to_yojson [ ("ProfileId", Some (profile_id_to_yojson x.profile_id)) ]

let delete_server_request_to_yojson (x : delete_server_request) =
  assoc_to_yojson [ ("ServerId", Some (server_id_to_yojson x.server_id)) ]

let ssh_public_key_id_to_yojson = string_to_yojson

let delete_ssh_public_key_request_to_yojson (x : delete_ssh_public_key_request) =
  assoc_to_yojson
    [
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("SshPublicKeyId", Some (ssh_public_key_id_to_yojson x.ssh_public_key_id));
      ("UserName", Some (user_name_to_yojson x.user_name));
    ]

let delete_user_request_to_yojson (x : delete_user_request) =
  assoc_to_yojson
    [
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("UserName", Some (user_name_to_yojson x.user_name));
    ]

let delete_web_app_request_to_yojson (x : delete_web_app_request) =
  assoc_to_yojson [ ("WebAppId", Some (web_app_id_to_yojson x.web_app_id)) ]

let delete_web_app_customization_request_to_yojson (x : delete_web_app_customization_request) =
  assoc_to_yojson [ ("WebAppId", Some (web_app_id_to_yojson x.web_app_id)) ]

let delete_workflow_request_to_yojson (x : delete_workflow_request) =
  assoc_to_yojson [ ("WorkflowId", Some (workflow_id_to_yojson x.workflow_id)) ]

let described_access_to_yojson (x : described_access) =
  assoc_to_yojson
    [
      ("HomeDirectory", option_to_yojson home_directory_to_yojson x.home_directory);
      ( "HomeDirectoryMappings",
        option_to_yojson home_directory_mappings_to_yojson x.home_directory_mappings );
      ("HomeDirectoryType", option_to_yojson home_directory_type_to_yojson x.home_directory_type);
      ("Policy", option_to_yojson policy_to_yojson x.policy);
      ("PosixProfile", option_to_yojson posix_profile_to_yojson x.posix_profile);
      ("Role", option_to_yojson role_to_yojson x.role);
      ("ExternalId", option_to_yojson external_id_to_yojson x.external_id);
    ]

let describe_access_response_to_yojson (x : describe_access_response) =
  assoc_to_yojson
    [
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("Access", Some (described_access_to_yojson x.access));
    ]

let describe_access_request_to_yojson (x : describe_access_request) =
  assoc_to_yojson
    [
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("ExternalId", Some (external_id_to_yojson x.external_id));
    ]

let described_agreement_to_yojson (x : described_agreement) =
  assoc_to_yojson
    [
      ("Arn", Some (arn_to_yojson x.arn));
      ("AgreementId", option_to_yojson agreement_id_to_yojson x.agreement_id);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Status", option_to_yojson agreement_status_type_to_yojson x.status);
      ("ServerId", option_to_yojson server_id_to_yojson x.server_id);
      ("LocalProfileId", option_to_yojson profile_id_to_yojson x.local_profile_id);
      ("PartnerProfileId", option_to_yojson profile_id_to_yojson x.partner_profile_id);
      ("BaseDirectory", option_to_yojson home_directory_to_yojson x.base_directory);
      ("AccessRole", option_to_yojson role_to_yojson x.access_role);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("PreserveFilename", option_to_yojson preserve_filename_type_to_yojson x.preserve_filename);
      ( "EnforceMessageSigning",
        option_to_yojson enforce_message_signing_type_to_yojson x.enforce_message_signing );
      ("CustomDirectories", option_to_yojson custom_directories_type_to_yojson x.custom_directories);
    ]

let describe_agreement_response_to_yojson (x : describe_agreement_response) =
  assoc_to_yojson [ ("Agreement", Some (described_agreement_to_yojson x.agreement)) ]

let describe_agreement_request_to_yojson (x : describe_agreement_request) =
  assoc_to_yojson
    [
      ("AgreementId", Some (agreement_id_to_yojson x.agreement_id));
      ("ServerId", Some (server_id_to_yojson x.server_id));
    ]

let described_certificate_to_yojson (x : described_certificate) =
  assoc_to_yojson
    [
      ("Arn", Some (arn_to_yojson x.arn));
      ("CertificateId", option_to_yojson certificate_id_to_yojson x.certificate_id);
      ("Usage", option_to_yojson certificate_usage_type_to_yojson x.usage);
      ("Status", option_to_yojson certificate_status_type_to_yojson x.status);
      ("Certificate", option_to_yojson certificate_body_type_to_yojson x.certificate);
      ("CertificateChain", option_to_yojson certificate_chain_type_to_yojson x.certificate_chain);
      ("ActiveDate", option_to_yojson cert_date_to_yojson x.active_date);
      ("InactiveDate", option_to_yojson cert_date_to_yojson x.inactive_date);
      ("Serial", option_to_yojson cert_serial_to_yojson x.serial);
      ("NotBeforeDate", option_to_yojson cert_date_to_yojson x.not_before_date);
      ("NotAfterDate", option_to_yojson cert_date_to_yojson x.not_after_date);
      ("Type", option_to_yojson certificate_type_to_yojson x.type_);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let describe_certificate_response_to_yojson (x : describe_certificate_response) =
  assoc_to_yojson [ ("Certificate", Some (described_certificate_to_yojson x.certificate)) ]

let describe_certificate_request_to_yojson (x : describe_certificate_request) =
  assoc_to_yojson [ ("CertificateId", Some (certificate_id_to_yojson x.certificate_id)) ]

let described_connector_vpc_lattice_egress_config_to_yojson
    (x : described_connector_vpc_lattice_egress_config) =
  assoc_to_yojson
    [
      ( "ResourceConfigurationArn",
        Some (vpc_lattice_resource_configuration_arn_to_yojson x.resource_configuration_arn) );
      ("PortNumber", option_to_yojson sftp_port_to_yojson x.port_number);
    ]

let described_connector_egress_config_to_yojson (x : described_connector_egress_config) =
  match x with
  | VpcLattice arg ->
      assoc_to_yojson
        [ ("VpcLattice", Some (described_connector_vpc_lattice_egress_config_to_yojson arg)) ]

let service_managed_egress_ip_address_to_yojson = string_to_yojson

let service_managed_egress_ip_addresses_to_yojson tree =
  list_to_yojson service_managed_egress_ip_address_to_yojson tree

let described_connector_to_yojson (x : described_connector) =
  assoc_to_yojson
    [
      ("Arn", Some (arn_to_yojson x.arn));
      ("ConnectorId", option_to_yojson connector_id_to_yojson x.connector_id);
      ("Url", option_to_yojson url_to_yojson x.url);
      ("As2Config", option_to_yojson as2_connector_config_to_yojson x.as2_config);
      ("AccessRole", option_to_yojson role_to_yojson x.access_role);
      ("LoggingRole", option_to_yojson role_to_yojson x.logging_role);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("SftpConfig", option_to_yojson sftp_connector_config_to_yojson x.sftp_config);
      ( "ServiceManagedEgressIpAddresses",
        option_to_yojson service_managed_egress_ip_addresses_to_yojson
          x.service_managed_egress_ip_addresses );
      ( "SecurityPolicyName",
        option_to_yojson connector_security_policy_name_to_yojson x.security_policy_name );
      ("EgressConfig", option_to_yojson described_connector_egress_config_to_yojson x.egress_config);
      ("EgressType", Some (connector_egress_type_to_yojson x.egress_type));
      ("ErrorMessage", option_to_yojson connector_error_message_to_yojson x.error_message);
      ("Status", Some (connector_status_to_yojson x.status));
      ("IpAddressType", option_to_yojson connectors_ip_address_type_to_yojson x.ip_address_type);
    ]

let describe_connector_response_to_yojson (x : describe_connector_response) =
  assoc_to_yojson [ ("Connector", Some (described_connector_to_yojson x.connector)) ]

let describe_connector_request_to_yojson (x : describe_connector_request) =
  assoc_to_yojson [ ("ConnectorId", Some (connector_id_to_yojson x.connector_id)) ]

let execution_error_message_to_yojson = string_to_yojson

let execution_error_type_to_yojson (x : execution_error_type) =
  match x with
  | PERMISSION_DENIED -> `String "PERMISSION_DENIED"
  | CUSTOM_STEP_FAILED -> `String "CUSTOM_STEP_FAILED"
  | THROTTLED -> `String "THROTTLED"
  | ALREADY_EXISTS -> `String "ALREADY_EXISTS"
  | NOT_FOUND -> `String "NOT_FOUND"
  | BAD_REQUEST -> `String "BAD_REQUEST"
  | TIMEOUT -> `String "TIMEOUT"
  | INTERNAL_SERVER_ERROR -> `String "INTERNAL_SERVER_ERROR"

let execution_error_to_yojson (x : execution_error) =
  assoc_to_yojson
    [
      ("Type", Some (execution_error_type_to_yojson x.type_));
      ("Message", Some (execution_error_message_to_yojson x.message));
    ]

let step_result_outputs_json_to_yojson = string_to_yojson

let execution_step_result_to_yojson (x : execution_step_result) =
  assoc_to_yojson
    [
      ("StepType", option_to_yojson workflow_step_type_to_yojson x.step_type);
      ("Outputs", option_to_yojson step_result_outputs_json_to_yojson x.outputs);
      ("Error", option_to_yojson execution_error_to_yojson x.error);
    ]

let execution_step_results_to_yojson tree = list_to_yojson execution_step_result_to_yojson tree

let execution_results_to_yojson (x : execution_results) =
  assoc_to_yojson
    [
      ("Steps", option_to_yojson execution_step_results_to_yojson x.steps);
      ("OnExceptionSteps", option_to_yojson execution_step_results_to_yojson x.on_exception_steps);
    ]

let execution_status_to_yojson (x : execution_status) =
  match x with
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | COMPLETED -> `String "COMPLETED"
  | EXCEPTION -> `String "EXCEPTION"
  | HANDLING_EXCEPTION -> `String "HANDLING_EXCEPTION"

let log_group_name_to_yojson = string_to_yojson

let logging_configuration_to_yojson (x : logging_configuration) =
  assoc_to_yojson
    [
      ("LoggingRole", option_to_yojson role_to_yojson x.logging_role);
      ("LogGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
    ]

let session_id_to_yojson = string_to_yojson

let user_details_to_yojson (x : user_details) =
  assoc_to_yojson
    [
      ("UserName", Some (user_name_to_yojson x.user_name));
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("SessionId", option_to_yojson session_id_to_yojson x.session_id);
    ]

let service_metadata_to_yojson (x : service_metadata) =
  assoc_to_yojson [ ("UserDetails", Some (user_details_to_yojson x.user_details)) ]

let s3_etag_to_yojson = string_to_yojson
let s3_version_id_to_yojson = string_to_yojson

let s3_file_location_to_yojson (x : s3_file_location) =
  assoc_to_yojson
    [
      ("Bucket", option_to_yojson s3_bucket_to_yojson x.bucket);
      ("Key", option_to_yojson s3_key_to_yojson x.key);
      ("VersionId", option_to_yojson s3_version_id_to_yojson x.version_id);
      ("Etag", option_to_yojson s3_etag_to_yojson x.etag);
    ]

let file_location_to_yojson (x : file_location) =
  assoc_to_yojson
    [
      ("S3FileLocation", option_to_yojson s3_file_location_to_yojson x.s3_file_location);
      ("EfsFileLocation", option_to_yojson efs_file_location_to_yojson x.efs_file_location);
    ]

let execution_id_to_yojson = string_to_yojson

let described_execution_to_yojson (x : described_execution) =
  assoc_to_yojson
    [
      ("ExecutionId", option_to_yojson execution_id_to_yojson x.execution_id);
      ("InitialFileLocation", option_to_yojson file_location_to_yojson x.initial_file_location);
      ("ServiceMetadata", option_to_yojson service_metadata_to_yojson x.service_metadata);
      ("ExecutionRole", option_to_yojson role_to_yojson x.execution_role);
      ( "LoggingConfiguration",
        option_to_yojson logging_configuration_to_yojson x.logging_configuration );
      ("PosixProfile", option_to_yojson posix_profile_to_yojson x.posix_profile);
      ("Status", option_to_yojson execution_status_to_yojson x.status);
      ("Results", option_to_yojson execution_results_to_yojson x.results);
    ]

let describe_execution_response_to_yojson (x : describe_execution_response) =
  assoc_to_yojson
    [
      ("WorkflowId", Some (workflow_id_to_yojson x.workflow_id));
      ("Execution", Some (described_execution_to_yojson x.execution));
    ]

let describe_execution_request_to_yojson (x : describe_execution_request) =
  assoc_to_yojson
    [
      ("ExecutionId", Some (execution_id_to_yojson x.execution_id));
      ("WorkflowId", Some (workflow_id_to_yojson x.workflow_id));
    ]

let host_key_type_to_yojson = string_to_yojson
let host_key_description_to_yojson = string_to_yojson
let host_key_fingerprint_to_yojson = string_to_yojson

let described_host_key_to_yojson (x : described_host_key) =
  assoc_to_yojson
    [
      ("Arn", Some (arn_to_yojson x.arn));
      ("HostKeyId", option_to_yojson host_key_id_to_yojson x.host_key_id);
      ("HostKeyFingerprint", option_to_yojson host_key_fingerprint_to_yojson x.host_key_fingerprint);
      ("Description", option_to_yojson host_key_description_to_yojson x.description);
      ("Type", option_to_yojson host_key_type_to_yojson x.type_);
      ("DateImported", option_to_yojson date_imported_to_yojson x.date_imported);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let describe_host_key_response_to_yojson (x : describe_host_key_response) =
  assoc_to_yojson [ ("HostKey", Some (described_host_key_to_yojson x.host_key)) ]

let describe_host_key_request_to_yojson (x : describe_host_key_request) =
  assoc_to_yojson
    [
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("HostKeyId", Some (host_key_id_to_yojson x.host_key_id));
    ]

let described_profile_to_yojson (x : described_profile) =
  assoc_to_yojson
    [
      ("Arn", Some (arn_to_yojson x.arn));
      ("ProfileId", option_to_yojson profile_id_to_yojson x.profile_id);
      ("ProfileType", option_to_yojson profile_type_to_yojson x.profile_type);
      ("As2Id", option_to_yojson as2_id_to_yojson x.as2_id);
      ("CertificateIds", option_to_yojson certificate_ids_to_yojson x.certificate_ids);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let describe_profile_response_to_yojson (x : describe_profile_response) =
  assoc_to_yojson [ ("Profile", Some (described_profile_to_yojson x.profile)) ]

let describe_profile_request_to_yojson (x : describe_profile_request) =
  assoc_to_yojson [ ("ProfileId", Some (profile_id_to_yojson x.profile_id)) ]

let security_policy_protocol_to_yojson (x : security_policy_protocol) =
  match x with SFTP -> `String "SFTP" | FTPS -> `String "FTPS"

let security_policy_protocols_to_yojson tree =
  list_to_yojson security_policy_protocol_to_yojson tree

let security_policy_resource_type_to_yojson (x : security_policy_resource_type) =
  match x with SERVER -> `String "SERVER" | CONNECTOR -> `String "CONNECTOR"

let security_policy_option_to_yojson = string_to_yojson
let security_policy_options_to_yojson tree = list_to_yojson security_policy_option_to_yojson tree
let fips_to_yojson = bool_to_yojson

let described_security_policy_to_yojson (x : described_security_policy) =
  assoc_to_yojson
    [
      ("Fips", option_to_yojson fips_to_yojson x.fips);
      ("SecurityPolicyName", Some (security_policy_name_to_yojson x.security_policy_name));
      ("SshCiphers", option_to_yojson security_policy_options_to_yojson x.ssh_ciphers);
      ("SshKexs", option_to_yojson security_policy_options_to_yojson x.ssh_kexs);
      ("SshMacs", option_to_yojson security_policy_options_to_yojson x.ssh_macs);
      ("TlsCiphers", option_to_yojson security_policy_options_to_yojson x.tls_ciphers);
      ( "SshHostKeyAlgorithms",
        option_to_yojson security_policy_options_to_yojson x.ssh_host_key_algorithms );
      ("Type", option_to_yojson security_policy_resource_type_to_yojson x.type_);
      ("Protocols", option_to_yojson security_policy_protocols_to_yojson x.protocols);
    ]

let describe_security_policy_response_to_yojson (x : describe_security_policy_response) =
  assoc_to_yojson
    [ ("SecurityPolicy", Some (described_security_policy_to_yojson x.security_policy)) ]

let describe_security_policy_request_to_yojson (x : describe_security_policy_request) =
  assoc_to_yojson
    [ ("SecurityPolicyName", Some (security_policy_name_to_yojson x.security_policy_name)) ]

let user_count_to_yojson = int_to_yojson

let state_to_yojson (x : state) =
  match x with
  | OFFLINE -> `String "OFFLINE"
  | ONLINE -> `String "ONLINE"
  | STARTING -> `String "STARTING"
  | STOPPING -> `String "STOPPING"
  | START_FAILED -> `String "START_FAILED"
  | STOP_FAILED -> `String "STOP_FAILED"

let described_server_to_yojson (x : described_server) =
  assoc_to_yojson
    [
      ("Arn", Some (arn_to_yojson x.arn));
      ("Certificate", option_to_yojson certificate_to_yojson x.certificate);
      ("ProtocolDetails", option_to_yojson protocol_details_to_yojson x.protocol_details);
      ("Domain", option_to_yojson domain_to_yojson x.domain);
      ("EndpointDetails", option_to_yojson endpoint_details_to_yojson x.endpoint_details);
      ("EndpointType", option_to_yojson endpoint_type_to_yojson x.endpoint_type);
      ("HostKeyFingerprint", option_to_yojson host_key_fingerprint_to_yojson x.host_key_fingerprint);
      ( "IdentityProviderDetails",
        option_to_yojson identity_provider_details_to_yojson x.identity_provider_details );
      ( "IdentityProviderType",
        option_to_yojson identity_provider_type_to_yojson x.identity_provider_type );
      ("LoggingRole", option_to_yojson nullable_role_to_yojson x.logging_role);
      ( "PostAuthenticationLoginBanner",
        option_to_yojson post_authentication_login_banner_to_yojson
          x.post_authentication_login_banner );
      ( "PreAuthenticationLoginBanner",
        option_to_yojson pre_authentication_login_banner_to_yojson x.pre_authentication_login_banner
      );
      ("Protocols", option_to_yojson protocols_to_yojson x.protocols);
      ("SecurityPolicyName", option_to_yojson security_policy_name_to_yojson x.security_policy_name);
      ("ServerId", option_to_yojson server_id_to_yojson x.server_id);
      ("State", option_to_yojson state_to_yojson x.state);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("UserCount", option_to_yojson user_count_to_yojson x.user_count);
      ("WorkflowDetails", option_to_yojson workflow_details_to_yojson x.workflow_details);
      ( "StructuredLogDestinations",
        option_to_yojson structured_log_destinations_to_yojson x.structured_log_destinations );
      ("S3StorageOptions", option_to_yojson s3_storage_options_to_yojson x.s3_storage_options);
      ( "As2ServiceManagedEgressIpAddresses",
        option_to_yojson service_managed_egress_ip_addresses_to_yojson
          x.as2_service_managed_egress_ip_addresses );
      ("IpAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
    ]

let describe_server_response_to_yojson (x : describe_server_response) =
  assoc_to_yojson [ ("Server", Some (described_server_to_yojson x.server)) ]

let describe_server_request_to_yojson (x : describe_server_request) =
  assoc_to_yojson [ ("ServerId", Some (server_id_to_yojson x.server_id)) ]

let ssh_public_key_to_yojson (x : ssh_public_key) =
  assoc_to_yojson
    [
      ("DateImported", Some (date_imported_to_yojson x.date_imported));
      ("SshPublicKeyBody", Some (ssh_public_key_body_to_yojson x.ssh_public_key_body));
      ("SshPublicKeyId", Some (ssh_public_key_id_to_yojson x.ssh_public_key_id));
    ]

let ssh_public_keys_to_yojson tree = list_to_yojson ssh_public_key_to_yojson tree

let described_user_to_yojson (x : described_user) =
  assoc_to_yojson
    [
      ("Arn", Some (arn_to_yojson x.arn));
      ("HomeDirectory", option_to_yojson home_directory_to_yojson x.home_directory);
      ( "HomeDirectoryMappings",
        option_to_yojson home_directory_mappings_to_yojson x.home_directory_mappings );
      ("HomeDirectoryType", option_to_yojson home_directory_type_to_yojson x.home_directory_type);
      ("Policy", option_to_yojson policy_to_yojson x.policy);
      ("PosixProfile", option_to_yojson posix_profile_to_yojson x.posix_profile);
      ("Role", option_to_yojson role_to_yojson x.role);
      ("SshPublicKeys", option_to_yojson ssh_public_keys_to_yojson x.ssh_public_keys);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("UserName", option_to_yojson user_name_to_yojson x.user_name);
    ]

let describe_user_response_to_yojson (x : describe_user_response) =
  assoc_to_yojson
    [
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("User", Some (described_user_to_yojson x.user));
    ]

let describe_user_request_to_yojson (x : describe_user_request) =
  assoc_to_yojson
    [
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("UserName", Some (user_name_to_yojson x.user_name));
    ]

let described_web_app_vpc_config_to_yojson (x : described_web_app_vpc_config) =
  assoc_to_yojson
    [
      ("SubnetIds", option_to_yojson subnet_ids_to_yojson x.subnet_ids);
      ("VpcId", option_to_yojson vpc_id_to_yojson x.vpc_id);
      ("VpcEndpointId", option_to_yojson vpc_endpoint_id_to_yojson x.vpc_endpoint_id);
    ]

let described_web_app_endpoint_details_to_yojson (x : described_web_app_endpoint_details) =
  match x with
  | Vpc arg -> assoc_to_yojson [ ("Vpc", Some (described_web_app_vpc_config_to_yojson arg)) ]

let web_app_endpoint_type_to_yojson (x : web_app_endpoint_type) =
  match x with PUBLIC -> `String "PUBLIC" | VPC -> `String "VPC"

let web_app_endpoint_to_yojson = string_to_yojson
let identity_center_application_arn_to_yojson = string_to_yojson

let described_identity_center_config_to_yojson (x : described_identity_center_config) =
  assoc_to_yojson
    [
      ( "ApplicationArn",
        option_to_yojson identity_center_application_arn_to_yojson x.application_arn );
      ("InstanceArn", option_to_yojson identity_center_instance_arn_to_yojson x.instance_arn);
      ("Role", option_to_yojson role_to_yojson x.role);
    ]

let described_web_app_identity_provider_details_to_yojson
    (x : described_web_app_identity_provider_details) =
  match x with
  | IdentityCenterConfig arg ->
      assoc_to_yojson
        [ ("IdentityCenterConfig", Some (described_identity_center_config_to_yojson arg)) ]

let described_web_app_to_yojson (x : described_web_app) =
  assoc_to_yojson
    [
      ("Arn", Some (arn_to_yojson x.arn));
      ("WebAppId", Some (web_app_id_to_yojson x.web_app_id));
      ( "DescribedIdentityProviderDetails",
        option_to_yojson described_web_app_identity_provider_details_to_yojson
          x.described_identity_provider_details );
      ("AccessEndpoint", option_to_yojson web_app_access_endpoint_to_yojson x.access_endpoint);
      ("WebAppEndpoint", option_to_yojson web_app_endpoint_to_yojson x.web_app_endpoint);
      ("WebAppUnits", option_to_yojson web_app_units_to_yojson x.web_app_units);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ( "WebAppEndpointPolicy",
        option_to_yojson web_app_endpoint_policy_to_yojson x.web_app_endpoint_policy );
      ("EndpointType", option_to_yojson web_app_endpoint_type_to_yojson x.endpoint_type);
      ( "DescribedEndpointDetails",
        option_to_yojson described_web_app_endpoint_details_to_yojson x.described_endpoint_details
      );
    ]

let describe_web_app_response_to_yojson (x : describe_web_app_response) =
  assoc_to_yojson [ ("WebApp", Some (described_web_app_to_yojson x.web_app)) ]

let describe_web_app_request_to_yojson (x : describe_web_app_request) =
  assoc_to_yojson [ ("WebAppId", Some (web_app_id_to_yojson x.web_app_id)) ]

let web_app_favicon_file_to_yojson = blob_to_yojson
let web_app_logo_file_to_yojson = blob_to_yojson
let web_app_title_to_yojson = string_to_yojson

let described_web_app_customization_to_yojson (x : described_web_app_customization) =
  assoc_to_yojson
    [
      ("Arn", Some (arn_to_yojson x.arn));
      ("WebAppId", Some (web_app_id_to_yojson x.web_app_id));
      ("Title", option_to_yojson web_app_title_to_yojson x.title);
      ("LogoFile", option_to_yojson web_app_logo_file_to_yojson x.logo_file);
      ("FaviconFile", option_to_yojson web_app_favicon_file_to_yojson x.favicon_file);
    ]

let describe_web_app_customization_response_to_yojson (x : describe_web_app_customization_response)
    =
  assoc_to_yojson
    [
      ( "WebAppCustomization",
        Some (described_web_app_customization_to_yojson x.web_app_customization) );
    ]

let describe_web_app_customization_request_to_yojson (x : describe_web_app_customization_request) =
  assoc_to_yojson [ ("WebAppId", Some (web_app_id_to_yojson x.web_app_id)) ]

let described_workflow_to_yojson (x : described_workflow) =
  assoc_to_yojson
    [
      ("Arn", Some (arn_to_yojson x.arn));
      ("Description", option_to_yojson workflow_description_to_yojson x.description);
      ("Steps", option_to_yojson workflow_steps_to_yojson x.steps);
      ("OnExceptionSteps", option_to_yojson workflow_steps_to_yojson x.on_exception_steps);
      ("WorkflowId", option_to_yojson workflow_id_to_yojson x.workflow_id);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let describe_workflow_response_to_yojson (x : describe_workflow_response) =
  assoc_to_yojson [ ("Workflow", Some (described_workflow_to_yojson x.workflow)) ]

let describe_workflow_request_to_yojson (x : describe_workflow_request) =
  assoc_to_yojson [ ("WorkflowId", Some (workflow_id_to_yojson x.workflow_id)) ]

let file_paths_to_yojson tree = list_to_yojson file_path_to_yojson tree

let import_certificate_response_to_yojson (x : import_certificate_response) =
  assoc_to_yojson [ ("CertificateId", Some (certificate_id_to_yojson x.certificate_id)) ]

let private_key_type_to_yojson = string_to_yojson

let import_certificate_request_to_yojson (x : import_certificate_request) =
  assoc_to_yojson
    [
      ("Usage", Some (certificate_usage_type_to_yojson x.usage));
      ("Certificate", Some (certificate_body_type_to_yojson x.certificate));
      ("CertificateChain", option_to_yojson certificate_chain_type_to_yojson x.certificate_chain);
      ("PrivateKey", option_to_yojson private_key_type_to_yojson x.private_key);
      ("ActiveDate", option_to_yojson cert_date_to_yojson x.active_date);
      ("InactiveDate", option_to_yojson cert_date_to_yojson x.inactive_date);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let import_host_key_response_to_yojson (x : import_host_key_response) =
  assoc_to_yojson
    [
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("HostKeyId", Some (host_key_id_to_yojson x.host_key_id));
    ]

let import_host_key_request_to_yojson (x : import_host_key_request) =
  assoc_to_yojson
    [
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("HostKeyBody", Some (host_key_to_yojson x.host_key_body));
      ("Description", option_to_yojson host_key_description_to_yojson x.description);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let import_ssh_public_key_response_to_yojson (x : import_ssh_public_key_response) =
  assoc_to_yojson
    [
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("SshPublicKeyId", Some (ssh_public_key_id_to_yojson x.ssh_public_key_id));
      ("UserName", Some (user_name_to_yojson x.user_name));
    ]

let import_ssh_public_key_request_to_yojson (x : import_ssh_public_key_request) =
  assoc_to_yojson
    [
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("SshPublicKeyBody", Some (ssh_public_key_body_to_yojson x.ssh_public_key_body));
      ("UserName", Some (user_name_to_yojson x.user_name));
    ]

let invalid_next_token_exception_to_yojson (x : invalid_next_token_exception) =
  assoc_to_yojson [ ("Message", Some (message_to_yojson x.message)) ]

let listed_access_to_yojson (x : listed_access) =
  assoc_to_yojson
    [
      ("HomeDirectory", option_to_yojson home_directory_to_yojson x.home_directory);
      ("HomeDirectoryType", option_to_yojson home_directory_type_to_yojson x.home_directory_type);
      ("Role", option_to_yojson role_to_yojson x.role);
      ("ExternalId", option_to_yojson external_id_to_yojson x.external_id);
    ]

let listed_accesses_to_yojson tree = list_to_yojson listed_access_to_yojson tree
let next_token_to_yojson = string_to_yojson

let list_accesses_response_to_yojson (x : list_accesses_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("Accesses", Some (listed_accesses_to_yojson x.accesses));
    ]

let max_results_to_yojson = int_to_yojson

let list_accesses_request_to_yojson (x : list_accesses_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ServerId", Some (server_id_to_yojson x.server_id));
    ]

let listed_agreement_to_yojson (x : listed_agreement) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("AgreementId", option_to_yojson agreement_id_to_yojson x.agreement_id);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Status", option_to_yojson agreement_status_type_to_yojson x.status);
      ("ServerId", option_to_yojson server_id_to_yojson x.server_id);
      ("LocalProfileId", option_to_yojson profile_id_to_yojson x.local_profile_id);
      ("PartnerProfileId", option_to_yojson profile_id_to_yojson x.partner_profile_id);
    ]

let listed_agreements_to_yojson tree = list_to_yojson listed_agreement_to_yojson tree

let list_agreements_response_to_yojson (x : list_agreements_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Agreements", Some (listed_agreements_to_yojson x.agreements));
    ]

let list_agreements_request_to_yojson (x : list_agreements_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ServerId", Some (server_id_to_yojson x.server_id));
    ]

let listed_certificate_to_yojson (x : listed_certificate) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("CertificateId", option_to_yojson certificate_id_to_yojson x.certificate_id);
      ("Usage", option_to_yojson certificate_usage_type_to_yojson x.usage);
      ("Status", option_to_yojson certificate_status_type_to_yojson x.status);
      ("ActiveDate", option_to_yojson cert_date_to_yojson x.active_date);
      ("InactiveDate", option_to_yojson cert_date_to_yojson x.inactive_date);
      ("Type", option_to_yojson certificate_type_to_yojson x.type_);
      ("Description", option_to_yojson description_to_yojson x.description);
    ]

let listed_certificates_to_yojson tree = list_to_yojson listed_certificate_to_yojson tree

let list_certificates_response_to_yojson (x : list_certificates_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Certificates", Some (listed_certificates_to_yojson x.certificates));
    ]

let list_certificates_request_to_yojson (x : list_certificates_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let listed_connector_to_yojson (x : listed_connector) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("ConnectorId", option_to_yojson connector_id_to_yojson x.connector_id);
      ("Url", option_to_yojson url_to_yojson x.url);
    ]

let listed_connectors_to_yojson tree = list_to_yojson listed_connector_to_yojson tree

let list_connectors_response_to_yojson (x : list_connectors_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Connectors", Some (listed_connectors_to_yojson x.connectors));
    ]

let list_connectors_request_to_yojson (x : list_connectors_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let listed_execution_to_yojson (x : listed_execution) =
  assoc_to_yojson
    [
      ("ExecutionId", option_to_yojson execution_id_to_yojson x.execution_id);
      ("InitialFileLocation", option_to_yojson file_location_to_yojson x.initial_file_location);
      ("ServiceMetadata", option_to_yojson service_metadata_to_yojson x.service_metadata);
      ("Status", option_to_yojson execution_status_to_yojson x.status);
    ]

let listed_executions_to_yojson tree = list_to_yojson listed_execution_to_yojson tree

let list_executions_response_to_yojson (x : list_executions_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("WorkflowId", Some (workflow_id_to_yojson x.workflow_id));
      ("Executions", Some (listed_executions_to_yojson x.executions));
    ]

let list_executions_request_to_yojson (x : list_executions_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("WorkflowId", Some (workflow_id_to_yojson x.workflow_id));
    ]

let list_file_transfer_results_response_to_yojson (x : list_file_transfer_results_response) =
  assoc_to_yojson
    [
      ( "FileTransferResults",
        Some (connector_file_transfer_results_to_yojson x.file_transfer_results) );
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let transfer_id_to_yojson = string_to_yojson

let list_file_transfer_results_request_to_yojson (x : list_file_transfer_results_request) =
  assoc_to_yojson
    [
      ("ConnectorId", Some (connector_id_to_yojson x.connector_id));
      ("TransferId", Some (transfer_id_to_yojson x.transfer_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let listed_host_key_to_yojson (x : listed_host_key) =
  assoc_to_yojson
    [
      ("Arn", Some (arn_to_yojson x.arn));
      ("HostKeyId", option_to_yojson host_key_id_to_yojson x.host_key_id);
      ("Fingerprint", option_to_yojson host_key_fingerprint_to_yojson x.fingerprint);
      ("Description", option_to_yojson host_key_description_to_yojson x.description);
      ("Type", option_to_yojson host_key_type_to_yojson x.type_);
      ("DateImported", option_to_yojson date_imported_to_yojson x.date_imported);
    ]

let listed_host_keys_to_yojson tree = list_to_yojson listed_host_key_to_yojson tree

let list_host_keys_response_to_yojson (x : list_host_keys_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("HostKeys", Some (listed_host_keys_to_yojson x.host_keys));
    ]

let list_host_keys_request_to_yojson (x : list_host_keys_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ServerId", Some (server_id_to_yojson x.server_id));
    ]

let listed_profile_to_yojson (x : listed_profile) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("ProfileId", option_to_yojson profile_id_to_yojson x.profile_id);
      ("As2Id", option_to_yojson as2_id_to_yojson x.as2_id);
      ("ProfileType", option_to_yojson profile_type_to_yojson x.profile_type);
    ]

let listed_profiles_to_yojson tree = list_to_yojson listed_profile_to_yojson tree

let list_profiles_response_to_yojson (x : list_profiles_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Profiles", Some (listed_profiles_to_yojson x.profiles));
    ]

let list_profiles_request_to_yojson (x : list_profiles_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ProfileType", option_to_yojson profile_type_to_yojson x.profile_type);
    ]

let security_policy_names_to_yojson tree = list_to_yojson security_policy_name_to_yojson tree

let list_security_policies_response_to_yojson (x : list_security_policies_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("SecurityPolicyNames", Some (security_policy_names_to_yojson x.security_policy_names));
    ]

let list_security_policies_request_to_yojson (x : list_security_policies_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let listed_server_to_yojson (x : listed_server) =
  assoc_to_yojson
    [
      ("Arn", Some (arn_to_yojson x.arn));
      ("Domain", option_to_yojson domain_to_yojson x.domain);
      ( "IdentityProviderType",
        option_to_yojson identity_provider_type_to_yojson x.identity_provider_type );
      ("EndpointType", option_to_yojson endpoint_type_to_yojson x.endpoint_type);
      ("LoggingRole", option_to_yojson role_to_yojson x.logging_role);
      ("ServerId", option_to_yojson server_id_to_yojson x.server_id);
      ("State", option_to_yojson state_to_yojson x.state);
      ("UserCount", option_to_yojson user_count_to_yojson x.user_count);
    ]

let listed_servers_to_yojson tree = list_to_yojson listed_server_to_yojson tree

let list_servers_response_to_yojson (x : list_servers_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Servers", Some (listed_servers_to_yojson x.servers));
    ]

let list_servers_request_to_yojson (x : list_servers_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson
    [
      ("Arn", Some (arn_to_yojson x.arn));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let ssh_public_key_count_to_yojson = int_to_yojson

let listed_user_to_yojson (x : listed_user) =
  assoc_to_yojson
    [
      ("Arn", Some (arn_to_yojson x.arn));
      ("HomeDirectory", option_to_yojson home_directory_to_yojson x.home_directory);
      ("HomeDirectoryType", option_to_yojson home_directory_type_to_yojson x.home_directory_type);
      ("Role", option_to_yojson role_to_yojson x.role);
      ("SshPublicKeyCount", option_to_yojson ssh_public_key_count_to_yojson x.ssh_public_key_count);
      ("UserName", option_to_yojson user_name_to_yojson x.user_name);
    ]

let listed_users_to_yojson tree = list_to_yojson listed_user_to_yojson tree

let list_users_response_to_yojson (x : list_users_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("Users", Some (listed_users_to_yojson x.users));
    ]

let list_users_request_to_yojson (x : list_users_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("ServerId", Some (server_id_to_yojson x.server_id));
    ]

let listed_web_app_to_yojson (x : listed_web_app) =
  assoc_to_yojson
    [
      ("Arn", Some (arn_to_yojson x.arn));
      ("WebAppId", Some (web_app_id_to_yojson x.web_app_id));
      ("AccessEndpoint", option_to_yojson web_app_access_endpoint_to_yojson x.access_endpoint);
      ("WebAppEndpoint", option_to_yojson web_app_endpoint_to_yojson x.web_app_endpoint);
      ("EndpointType", option_to_yojson web_app_endpoint_type_to_yojson x.endpoint_type);
    ]

let listed_web_apps_to_yojson tree = list_to_yojson listed_web_app_to_yojson tree

let list_web_apps_response_to_yojson (x : list_web_apps_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("WebApps", Some (listed_web_apps_to_yojson x.web_apps));
    ]

let list_web_apps_request_to_yojson (x : list_web_apps_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let listed_workflow_to_yojson (x : listed_workflow) =
  assoc_to_yojson
    [
      ("WorkflowId", option_to_yojson workflow_id_to_yojson x.workflow_id);
      ("Description", option_to_yojson workflow_description_to_yojson x.description);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
    ]

let listed_workflows_to_yojson tree = list_to_yojson listed_workflow_to_yojson tree

let list_workflows_response_to_yojson (x : list_workflows_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Workflows", Some (listed_workflows_to_yojson x.workflows));
    ]

let list_workflows_request_to_yojson (x : list_workflows_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let listing_id_to_yojson = string_to_yojson
let max_items_to_yojson = int_to_yojson
let move_id_to_yojson = string_to_yojson
let output_file_name_to_yojson = string_to_yojson
let response_to_yojson = string_to_yojson
let send_workflow_step_state_response_to_yojson = unit_to_yojson

let send_workflow_step_state_request_to_yojson (x : send_workflow_step_state_request) =
  assoc_to_yojson
    [
      ("WorkflowId", Some (workflow_id_to_yojson x.workflow_id));
      ("ExecutionId", Some (execution_id_to_yojson x.execution_id));
      ("Token", Some (callback_token_to_yojson x.token));
      ("Status", Some (custom_step_status_to_yojson x.status));
    ]

let sftp_connector_host_key_to_yojson = string_to_yojson

let sftp_connector_connection_details_to_yojson (x : sftp_connector_connection_details) =
  assoc_to_yojson [ ("HostKey", option_to_yojson sftp_connector_host_key_to_yojson x.host_key) ]

let source_ip_to_yojson = string_to_yojson

let start_directory_listing_response_to_yojson (x : start_directory_listing_response) =
  assoc_to_yojson
    [
      ("ListingId", Some (listing_id_to_yojson x.listing_id));
      ("OutputFileName", Some (output_file_name_to_yojson x.output_file_name));
    ]

let start_directory_listing_request_to_yojson (x : start_directory_listing_request) =
  assoc_to_yojson
    [
      ("ConnectorId", Some (connector_id_to_yojson x.connector_id));
      ("RemoteDirectoryPath", Some (file_path_to_yojson x.remote_directory_path));
      ("MaxItems", option_to_yojson max_items_to_yojson x.max_items);
      ("OutputDirectoryPath", Some (file_path_to_yojson x.output_directory_path));
    ]

let start_file_transfer_response_to_yojson (x : start_file_transfer_response) =
  assoc_to_yojson [ ("TransferId", Some (transfer_id_to_yojson x.transfer_id)) ]

let start_file_transfer_request_to_yojson (x : start_file_transfer_request) =
  assoc_to_yojson
    [
      ("ConnectorId", Some (connector_id_to_yojson x.connector_id));
      ("SendFilePaths", option_to_yojson file_paths_to_yojson x.send_file_paths);
      ("RetrieveFilePaths", option_to_yojson file_paths_to_yojson x.retrieve_file_paths);
      ("LocalDirectoryPath", option_to_yojson file_path_to_yojson x.local_directory_path);
      ("RemoteDirectoryPath", option_to_yojson file_path_to_yojson x.remote_directory_path);
      ("CustomHttpHeaders", option_to_yojson custom_http_headers_to_yojson x.custom_http_headers);
    ]

let start_remote_delete_response_to_yojson (x : start_remote_delete_response) =
  assoc_to_yojson [ ("DeleteId", Some (delete_id_to_yojson x.delete_id)) ]

let start_remote_delete_request_to_yojson (x : start_remote_delete_request) =
  assoc_to_yojson
    [
      ("ConnectorId", Some (connector_id_to_yojson x.connector_id));
      ("DeletePath", Some (file_path_to_yojson x.delete_path));
    ]

let start_remote_move_response_to_yojson (x : start_remote_move_response) =
  assoc_to_yojson [ ("MoveId", Some (move_id_to_yojson x.move_id)) ]

let start_remote_move_request_to_yojson (x : start_remote_move_request) =
  assoc_to_yojson
    [
      ("ConnectorId", Some (connector_id_to_yojson x.connector_id));
      ("SourcePath", Some (file_path_to_yojson x.source_path));
      ("TargetPath", Some (file_path_to_yojson x.target_path));
    ]

let start_server_request_to_yojson (x : start_server_request) =
  assoc_to_yojson [ ("ServerId", Some (server_id_to_yojson x.server_id)) ]

let status_to_yojson = string_to_yojson
let status_code_to_yojson = int_to_yojson

let stop_server_request_to_yojson (x : stop_server_request) =
  assoc_to_yojson [ ("ServerId", Some (server_id_to_yojson x.server_id)) ]

let tag_keys_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson [ ("Arn", Some (arn_to_yojson x.arn)); ("Tags", Some (tags_to_yojson x.tags)) ]

let test_connection_response_to_yojson (x : test_connection_response) =
  assoc_to_yojson
    [
      ("ConnectorId", option_to_yojson connector_id_to_yojson x.connector_id);
      ("Status", option_to_yojson status_to_yojson x.status);
      ("StatusMessage", option_to_yojson message_to_yojson x.status_message);
      ( "SftpConnectionDetails",
        option_to_yojson sftp_connector_connection_details_to_yojson x.sftp_connection_details );
    ]

let test_connection_request_to_yojson (x : test_connection_request) =
  assoc_to_yojson [ ("ConnectorId", Some (connector_id_to_yojson x.connector_id)) ]

let test_identity_provider_response_to_yojson (x : test_identity_provider_response) =
  assoc_to_yojson
    [
      ("Response", option_to_yojson response_to_yojson x.response);
      ("StatusCode", Some (status_code_to_yojson x.status_code));
      ("Message", option_to_yojson message_to_yojson x.message);
      ("Url", Some (url_to_yojson x.url));
    ]

let user_password_to_yojson = string_to_yojson

let test_identity_provider_request_to_yojson (x : test_identity_provider_request) =
  assoc_to_yojson
    [
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("ServerProtocol", option_to_yojson protocol_to_yojson x.server_protocol);
      ("SourceIp", option_to_yojson source_ip_to_yojson x.source_ip);
      ("UserName", Some (user_name_to_yojson x.user_name));
      ("UserPassword", option_to_yojson user_password_to_yojson x.user_password);
    ]

let update_host_key_response_to_yojson (x : update_host_key_response) =
  assoc_to_yojson
    [
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("HostKeyId", Some (host_key_id_to_yojson x.host_key_id));
    ]

let update_host_key_request_to_yojson (x : update_host_key_request) =
  assoc_to_yojson
    [
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("HostKeyId", Some (host_key_id_to_yojson x.host_key_id));
      ("Description", Some (host_key_description_to_yojson x.description));
    ]

let update_access_response_to_yojson (x : update_access_response) =
  assoc_to_yojson
    [
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("ExternalId", Some (external_id_to_yojson x.external_id));
    ]

let update_access_request_to_yojson (x : update_access_request) =
  assoc_to_yojson
    [
      ("HomeDirectory", option_to_yojson home_directory_to_yojson x.home_directory);
      ("HomeDirectoryType", option_to_yojson home_directory_type_to_yojson x.home_directory_type);
      ( "HomeDirectoryMappings",
        option_to_yojson home_directory_mappings_to_yojson x.home_directory_mappings );
      ("Policy", option_to_yojson policy_to_yojson x.policy);
      ("PosixProfile", option_to_yojson posix_profile_to_yojson x.posix_profile);
      ("Role", option_to_yojson role_to_yojson x.role);
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("ExternalId", Some (external_id_to_yojson x.external_id));
    ]

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [ ("Arn", Some (arn_to_yojson x.arn)); ("TagKeys", Some (tag_keys_to_yojson x.tag_keys)) ]

let update_agreement_response_to_yojson (x : update_agreement_response) =
  assoc_to_yojson [ ("AgreementId", Some (agreement_id_to_yojson x.agreement_id)) ]

let update_agreement_request_to_yojson (x : update_agreement_request) =
  assoc_to_yojson
    [
      ("AgreementId", Some (agreement_id_to_yojson x.agreement_id));
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Status", option_to_yojson agreement_status_type_to_yojson x.status);
      ("LocalProfileId", option_to_yojson profile_id_to_yojson x.local_profile_id);
      ("PartnerProfileId", option_to_yojson profile_id_to_yojson x.partner_profile_id);
      ("BaseDirectory", option_to_yojson home_directory_to_yojson x.base_directory);
      ("AccessRole", option_to_yojson role_to_yojson x.access_role);
      ("PreserveFilename", option_to_yojson preserve_filename_type_to_yojson x.preserve_filename);
      ( "EnforceMessageSigning",
        option_to_yojson enforce_message_signing_type_to_yojson x.enforce_message_signing );
      ("CustomDirectories", option_to_yojson custom_directories_type_to_yojson x.custom_directories);
    ]

let update_certificate_response_to_yojson (x : update_certificate_response) =
  assoc_to_yojson [ ("CertificateId", Some (certificate_id_to_yojson x.certificate_id)) ]

let update_certificate_request_to_yojson (x : update_certificate_request) =
  assoc_to_yojson
    [
      ("CertificateId", Some (certificate_id_to_yojson x.certificate_id));
      ("ActiveDate", option_to_yojson cert_date_to_yojson x.active_date);
      ("InactiveDate", option_to_yojson cert_date_to_yojson x.inactive_date);
      ("Description", option_to_yojson description_to_yojson x.description);
    ]

let update_connector_response_to_yojson (x : update_connector_response) =
  assoc_to_yojson [ ("ConnectorId", Some (connector_id_to_yojson x.connector_id)) ]

let update_connector_vpc_lattice_egress_config_to_yojson
    (x : update_connector_vpc_lattice_egress_config) =
  assoc_to_yojson
    [
      ( "ResourceConfigurationArn",
        option_to_yojson vpc_lattice_resource_configuration_arn_to_yojson
          x.resource_configuration_arn );
      ("PortNumber", option_to_yojson sftp_port_to_yojson x.port_number);
    ]

let update_connector_egress_config_to_yojson (x : update_connector_egress_config) =
  match x with
  | VpcLattice arg ->
      assoc_to_yojson
        [ ("VpcLattice", Some (update_connector_vpc_lattice_egress_config_to_yojson arg)) ]

let update_connector_request_to_yojson (x : update_connector_request) =
  assoc_to_yojson
    [
      ("ConnectorId", Some (connector_id_to_yojson x.connector_id));
      ("Url", option_to_yojson url_to_yojson x.url);
      ("As2Config", option_to_yojson as2_connector_config_to_yojson x.as2_config);
      ("AccessRole", option_to_yojson role_to_yojson x.access_role);
      ("LoggingRole", option_to_yojson role_to_yojson x.logging_role);
      ("SftpConfig", option_to_yojson sftp_connector_config_to_yojson x.sftp_config);
      ( "SecurityPolicyName",
        option_to_yojson connector_security_policy_name_to_yojson x.security_policy_name );
      ("EgressConfig", option_to_yojson update_connector_egress_config_to_yojson x.egress_config);
      ("IpAddressType", option_to_yojson connectors_ip_address_type_to_yojson x.ip_address_type);
    ]

let update_profile_response_to_yojson (x : update_profile_response) =
  assoc_to_yojson [ ("ProfileId", Some (profile_id_to_yojson x.profile_id)) ]

let update_profile_request_to_yojson (x : update_profile_request) =
  assoc_to_yojson
    [
      ("ProfileId", Some (profile_id_to_yojson x.profile_id));
      ("CertificateIds", option_to_yojson certificate_ids_to_yojson x.certificate_ids);
    ]

let update_server_response_to_yojson (x : update_server_response) =
  assoc_to_yojson [ ("ServerId", Some (server_id_to_yojson x.server_id)) ]

let update_server_request_to_yojson (x : update_server_request) =
  assoc_to_yojson
    [
      ("Certificate", option_to_yojson certificate_to_yojson x.certificate);
      ("ProtocolDetails", option_to_yojson protocol_details_to_yojson x.protocol_details);
      ("EndpointDetails", option_to_yojson endpoint_details_to_yojson x.endpoint_details);
      ("EndpointType", option_to_yojson endpoint_type_to_yojson x.endpoint_type);
      ("HostKey", option_to_yojson host_key_to_yojson x.host_key);
      ( "IdentityProviderDetails",
        option_to_yojson identity_provider_details_to_yojson x.identity_provider_details );
      ("LoggingRole", option_to_yojson nullable_role_to_yojson x.logging_role);
      ( "PostAuthenticationLoginBanner",
        option_to_yojson post_authentication_login_banner_to_yojson
          x.post_authentication_login_banner );
      ( "PreAuthenticationLoginBanner",
        option_to_yojson pre_authentication_login_banner_to_yojson x.pre_authentication_login_banner
      );
      ("Protocols", option_to_yojson protocols_to_yojson x.protocols);
      ("SecurityPolicyName", option_to_yojson security_policy_name_to_yojson x.security_policy_name);
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("WorkflowDetails", option_to_yojson workflow_details_to_yojson x.workflow_details);
      ( "StructuredLogDestinations",
        option_to_yojson structured_log_destinations_to_yojson x.structured_log_destinations );
      ("S3StorageOptions", option_to_yojson s3_storage_options_to_yojson x.s3_storage_options);
      ("IpAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ( "IdentityProviderType",
        option_to_yojson identity_provider_type_to_yojson x.identity_provider_type );
    ]

let update_user_response_to_yojson (x : update_user_response) =
  assoc_to_yojson
    [
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("UserName", Some (user_name_to_yojson x.user_name));
    ]

let update_user_request_to_yojson (x : update_user_request) =
  assoc_to_yojson
    [
      ("HomeDirectory", option_to_yojson home_directory_to_yojson x.home_directory);
      ("HomeDirectoryType", option_to_yojson home_directory_type_to_yojson x.home_directory_type);
      ( "HomeDirectoryMappings",
        option_to_yojson home_directory_mappings_to_yojson x.home_directory_mappings );
      ("Policy", option_to_yojson policy_to_yojson x.policy);
      ("PosixProfile", option_to_yojson posix_profile_to_yojson x.posix_profile);
      ("Role", option_to_yojson role_to_yojson x.role);
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("UserName", Some (user_name_to_yojson x.user_name));
    ]

let update_web_app_response_to_yojson (x : update_web_app_response) =
  assoc_to_yojson [ ("WebAppId", Some (web_app_id_to_yojson x.web_app_id)) ]

let update_web_app_vpc_config_to_yojson (x : update_web_app_vpc_config) =
  assoc_to_yojson
    [
      ("SubnetIds", option_to_yojson subnet_ids_to_yojson x.subnet_ids);
      ( "IpAddressType",
        option_to_yojson web_app_vpc_endpoint_ip_address_type_to_yojson x.ip_address_type );
    ]

let update_web_app_endpoint_details_to_yojson (x : update_web_app_endpoint_details) =
  match x with
  | Vpc arg -> assoc_to_yojson [ ("Vpc", Some (update_web_app_vpc_config_to_yojson arg)) ]

let update_web_app_identity_center_config_to_yojson (x : update_web_app_identity_center_config) =
  assoc_to_yojson [ ("Role", option_to_yojson role_to_yojson x.role) ]

let update_web_app_identity_provider_details_to_yojson
    (x : update_web_app_identity_provider_details) =
  match x with
  | IdentityCenterConfig arg ->
      assoc_to_yojson
        [ ("IdentityCenterConfig", Some (update_web_app_identity_center_config_to_yojson arg)) ]

let update_web_app_request_to_yojson (x : update_web_app_request) =
  assoc_to_yojson
    [
      ("WebAppId", Some (web_app_id_to_yojson x.web_app_id));
      ( "IdentityProviderDetails",
        option_to_yojson update_web_app_identity_provider_details_to_yojson
          x.identity_provider_details );
      ("AccessEndpoint", option_to_yojson web_app_access_endpoint_to_yojson x.access_endpoint);
      ("WebAppUnits", option_to_yojson web_app_units_to_yojson x.web_app_units);
      ( "EndpointDetails",
        option_to_yojson update_web_app_endpoint_details_to_yojson x.endpoint_details );
    ]

let update_web_app_customization_response_to_yojson (x : update_web_app_customization_response) =
  assoc_to_yojson [ ("WebAppId", Some (web_app_id_to_yojson x.web_app_id)) ]

let update_web_app_customization_request_to_yojson (x : update_web_app_customization_request) =
  assoc_to_yojson
    [
      ("WebAppId", Some (web_app_id_to_yojson x.web_app_id));
      ("Title", option_to_yojson web_app_title_to_yojson x.title);
      ("LogoFile", option_to_yojson web_app_logo_file_to_yojson x.logo_file);
      ("FaviconFile", option_to_yojson web_app_favicon_file_to_yojson x.favicon_file);
    ]
