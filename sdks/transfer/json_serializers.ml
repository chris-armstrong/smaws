open Smaws_Lib.Json.SerializeHelpers
open Types

let workflow_step_type_to_yojson (x : workflow_step_type) =
  match x with
  | DECRYPT -> `String "DECRYPT"
  | DELETE -> `String "DELETE"
  | TAG -> `String "TAG"
  | CUSTOM -> `String "CUSTOM"
  | COPY -> `String "COPY"

let workflow_step_name_to_yojson = string_to_yojson
let s3_bucket_to_yojson = string_to_yojson
let s3_key_to_yojson = string_to_yojson

let s3_input_file_location_to_yojson (x : s3_input_file_location) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson s3_key_to_yojson x.key);
      ("Bucket", option_to_yojson s3_bucket_to_yojson x.bucket);
    ]

let efs_file_system_id_to_yojson = string_to_yojson
let efs_path_to_yojson = string_to_yojson

let efs_file_location_to_yojson (x : efs_file_location) =
  assoc_to_yojson
    [
      ("Path", option_to_yojson efs_path_to_yojson x.path);
      ("FileSystemId", option_to_yojson efs_file_system_id_to_yojson x.file_system_id);
    ]

let input_file_location_to_yojson (x : input_file_location) =
  assoc_to_yojson
    [
      ("EfsFileLocation", option_to_yojson efs_file_location_to_yojson x.efs_file_location);
      ("S3FileLocation", option_to_yojson s3_input_file_location_to_yojson x.s3_file_location);
    ]

let overwrite_existing_to_yojson (x : overwrite_existing) =
  match x with FALSE -> `String "FALSE" | TRUE -> `String "TRUE"

let source_file_location_to_yojson = string_to_yojson

let copy_step_details_to_yojson (x : copy_step_details) =
  assoc_to_yojson
    [
      ("SourceFileLocation", option_to_yojson source_file_location_to_yojson x.source_file_location);
      ("OverwriteExisting", option_to_yojson overwrite_existing_to_yojson x.overwrite_existing);
      ( "DestinationFileLocation",
        option_to_yojson input_file_location_to_yojson x.destination_file_location );
      ("Name", option_to_yojson workflow_step_name_to_yojson x.name);
    ]

let custom_step_target_to_yojson = string_to_yojson
let custom_step_timeout_seconds_to_yojson = int_to_yojson

let custom_step_details_to_yojson (x : custom_step_details) =
  assoc_to_yojson
    [
      ("SourceFileLocation", option_to_yojson source_file_location_to_yojson x.source_file_location);
      ("TimeoutSeconds", option_to_yojson custom_step_timeout_seconds_to_yojson x.timeout_seconds);
      ("Target", option_to_yojson custom_step_target_to_yojson x.target);
      ("Name", option_to_yojson workflow_step_name_to_yojson x.name);
    ]

let delete_step_details_to_yojson (x : delete_step_details) =
  assoc_to_yojson
    [
      ("SourceFileLocation", option_to_yojson source_file_location_to_yojson x.source_file_location);
      ("Name", option_to_yojson workflow_step_name_to_yojson x.name);
    ]

let s3_tag_key_to_yojson = string_to_yojson
let s3_tag_value_to_yojson = string_to_yojson

let s3_tag_to_yojson (x : s3_tag) =
  assoc_to_yojson
    [ ("Value", Some (s3_tag_value_to_yojson x.value)); ("Key", Some (s3_tag_key_to_yojson x.key)) ]

let s3_tags_to_yojson tree = list_to_yojson s3_tag_to_yojson tree

let tag_step_details_to_yojson (x : tag_step_details) =
  assoc_to_yojson
    [
      ("SourceFileLocation", option_to_yojson source_file_location_to_yojson x.source_file_location);
      ("Tags", option_to_yojson s3_tags_to_yojson x.tags);
      ("Name", option_to_yojson workflow_step_name_to_yojson x.name);
    ]

let encryption_type_to_yojson (x : encryption_type) = match x with PGP -> `String "PGP"

let decrypt_step_details_to_yojson (x : decrypt_step_details) =
  assoc_to_yojson
    [
      ("DestinationFileLocation", Some (input_file_location_to_yojson x.destination_file_location));
      ("OverwriteExisting", option_to_yojson overwrite_existing_to_yojson x.overwrite_existing);
      ("SourceFileLocation", option_to_yojson source_file_location_to_yojson x.source_file_location);
      ("Type", Some (encryption_type_to_yojson x.type_));
      ("Name", option_to_yojson workflow_step_name_to_yojson x.name);
    ]

let workflow_step_to_yojson (x : workflow_step) =
  assoc_to_yojson
    [
      ("DecryptStepDetails", option_to_yojson decrypt_step_details_to_yojson x.decrypt_step_details);
      ("TagStepDetails", option_to_yojson tag_step_details_to_yojson x.tag_step_details);
      ("DeleteStepDetails", option_to_yojson delete_step_details_to_yojson x.delete_step_details);
      ("CustomStepDetails", option_to_yojson custom_step_details_to_yojson x.custom_step_details);
      ("CopyStepDetails", option_to_yojson copy_step_details_to_yojson x.copy_step_details);
      ("Type", option_to_yojson workflow_step_type_to_yojson x.type_);
    ]

let workflow_steps_to_yojson tree = list_to_yojson workflow_step_to_yojson tree
let workflow_id_to_yojson = string_to_yojson
let role_to_yojson = string_to_yojson

let workflow_detail_to_yojson (x : workflow_detail) =
  assoc_to_yojson
    [
      ("ExecutionRole", Some (role_to_yojson x.execution_role));
      ("WorkflowId", Some (workflow_id_to_yojson x.workflow_id));
    ]

let on_upload_workflow_details_to_yojson tree = list_to_yojson workflow_detail_to_yojson tree

let on_partial_upload_workflow_details_to_yojson tree =
  list_to_yojson workflow_detail_to_yojson tree

let workflow_details_to_yojson (x : workflow_details) =
  assoc_to_yojson
    [
      ( "OnPartialUpload",
        option_to_yojson on_partial_upload_workflow_details_to_yojson x.on_partial_upload );
      ("OnUpload", option_to_yojson on_upload_workflow_details_to_yojson x.on_upload);
    ]

let workflow_description_to_yojson = string_to_yojson

let web_app_vpc_endpoint_ip_address_type_to_yojson (x : web_app_vpc_endpoint_ip_address_type) =
  match x with DUALSTACK -> `String "DUALSTACK" | IPV4 -> `String "IPV4"

let subnet_id_to_yojson = string_to_yojson
let subnet_ids_to_yojson tree = list_to_yojson subnet_id_to_yojson tree
let vpc_id_to_yojson = string_to_yojson
let security_group_id_to_yojson = string_to_yojson
let security_group_ids_to_yojson tree = list_to_yojson security_group_id_to_yojson tree

let web_app_vpc_config_to_yojson (x : web_app_vpc_config) =
  assoc_to_yojson
    [
      ( "IpAddressType",
        option_to_yojson web_app_vpc_endpoint_ip_address_type_to_yojson x.ip_address_type );
      ("SecurityGroupIds", option_to_yojson security_group_ids_to_yojson x.security_group_ids);
      ("VpcId", option_to_yojson vpc_id_to_yojson x.vpc_id);
      ("SubnetIds", option_to_yojson subnet_ids_to_yojson x.subnet_ids);
    ]

let web_app_unit_count_to_yojson = int_to_yojson

let web_app_units_to_yojson (x : web_app_units) =
  match x with
  | Provisioned arg -> assoc_to_yojson [ ("Provisioned", Some (web_app_unit_count_to_yojson arg)) ]

let web_app_title_to_yojson = string_to_yojson
let web_app_logo_file_to_yojson = blob_to_yojson
let identity_center_instance_arn_to_yojson = string_to_yojson

let identity_center_config_to_yojson (x : identity_center_config) =
  assoc_to_yojson
    [
      ("Role", option_to_yojson role_to_yojson x.role);
      ("InstanceArn", option_to_yojson identity_center_instance_arn_to_yojson x.instance_arn);
    ]

let web_app_identity_provider_details_to_yojson (x : web_app_identity_provider_details) =
  match x with
  | IdentityCenterConfig arg ->
      assoc_to_yojson [ ("IdentityCenterConfig", Some (identity_center_config_to_yojson arg)) ]

let web_app_id_to_yojson = string_to_yojson
let web_app_favicon_file_to_yojson = blob_to_yojson

let web_app_endpoint_type_to_yojson (x : web_app_endpoint_type) =
  match x with VPC -> `String "VPC" | PUBLIC -> `String "PUBLIC"

let web_app_endpoint_policy_to_yojson (x : web_app_endpoint_policy) =
  match x with STANDARD -> `String "STANDARD" | FIPS -> `String "FIPS"

let web_app_endpoint_details_to_yojson (x : web_app_endpoint_details) =
  match x with Vpc arg -> assoc_to_yojson [ ("Vpc", Some (web_app_vpc_config_to_yojson arg)) ]

let web_app_endpoint_to_yojson = string_to_yojson
let web_app_access_endpoint_to_yojson = string_to_yojson
let vpc_lattice_resource_configuration_arn_to_yojson = string_to_yojson
let vpc_endpoint_id_to_yojson = string_to_yojson
let user_password_to_yojson = string_to_yojson
let user_name_to_yojson = string_to_yojson
let server_id_to_yojson = string_to_yojson
let session_id_to_yojson = string_to_yojson

let user_details_to_yojson (x : user_details) =
  assoc_to_yojson
    [
      ("SessionId", option_to_yojson session_id_to_yojson x.session_id);
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("UserName", Some (user_name_to_yojson x.user_name));
    ]

let user_count_to_yojson = int_to_yojson
let url_to_yojson = string_to_yojson

let update_web_app_vpc_config_to_yojson (x : update_web_app_vpc_config) =
  assoc_to_yojson
    [
      ( "IpAddressType",
        option_to_yojson web_app_vpc_endpoint_ip_address_type_to_yojson x.ip_address_type );
      ("SubnetIds", option_to_yojson subnet_ids_to_yojson x.subnet_ids);
    ]

let update_web_app_response_to_yojson (x : update_web_app_response) =
  assoc_to_yojson [ ("WebAppId", Some (web_app_id_to_yojson x.web_app_id)) ]

let update_web_app_identity_center_config_to_yojson (x : update_web_app_identity_center_config) =
  assoc_to_yojson [ ("Role", option_to_yojson role_to_yojson x.role) ]

let update_web_app_identity_provider_details_to_yojson
    (x : update_web_app_identity_provider_details) =
  match x with
  | IdentityCenterConfig arg ->
      assoc_to_yojson
        [ ("IdentityCenterConfig", Some (update_web_app_identity_center_config_to_yojson arg)) ]

let update_web_app_endpoint_details_to_yojson (x : update_web_app_endpoint_details) =
  match x with
  | Vpc arg -> assoc_to_yojson [ ("Vpc", Some (update_web_app_vpc_config_to_yojson arg)) ]

let update_web_app_request_to_yojson (x : update_web_app_request) =
  assoc_to_yojson
    [
      ( "EndpointDetails",
        option_to_yojson update_web_app_endpoint_details_to_yojson x.endpoint_details );
      ("WebAppUnits", option_to_yojson web_app_units_to_yojson x.web_app_units);
      ("AccessEndpoint", option_to_yojson web_app_access_endpoint_to_yojson x.access_endpoint);
      ( "IdentityProviderDetails",
        option_to_yojson update_web_app_identity_provider_details_to_yojson
          x.identity_provider_details );
      ("WebAppId", Some (web_app_id_to_yojson x.web_app_id));
    ]

let update_web_app_customization_response_to_yojson (x : update_web_app_customization_response) =
  assoc_to_yojson [ ("WebAppId", Some (web_app_id_to_yojson x.web_app_id)) ]

let update_web_app_customization_request_to_yojson (x : update_web_app_customization_request) =
  assoc_to_yojson
    [
      ("FaviconFile", option_to_yojson web_app_favicon_file_to_yojson x.favicon_file);
      ("LogoFile", option_to_yojson web_app_logo_file_to_yojson x.logo_file);
      ("Title", option_to_yojson web_app_title_to_yojson x.title);
      ("WebAppId", Some (web_app_id_to_yojson x.web_app_id));
    ]

let retry_after_seconds_to_yojson = string_to_yojson

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [ ("RetryAfterSeconds", option_to_yojson retry_after_seconds_to_yojson x.retry_after_seconds) ]

let message_to_yojson = string_to_yojson
let resource_to_yojson = string_to_yojson
let resource_type_to_yojson = string_to_yojson

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("ResourceType", Some (resource_type_to_yojson x.resource_type));
      ("Resource", Some (resource_to_yojson x.resource));
      ("Message", Some (message_to_yojson x.message));
    ]

let invalid_request_exception_to_yojson (x : invalid_request_exception) =
  assoc_to_yojson [ ("Message", Some (message_to_yojson x.message)) ]

let internal_service_error_to_yojson (x : internal_service_error) =
  assoc_to_yojson [ ("Message", Some (message_to_yojson x.message)) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("Message", Some (message_to_yojson x.message)) ]

let service_error_message_to_yojson = string_to_yojson

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson service_error_message_to_yojson x.message) ]

let update_user_response_to_yojson (x : update_user_response) =
  assoc_to_yojson
    [
      ("UserName", Some (user_name_to_yojson x.user_name));
      ("ServerId", Some (server_id_to_yojson x.server_id));
    ]

let home_directory_to_yojson = string_to_yojson

let home_directory_type_to_yojson (x : home_directory_type) =
  match x with LOGICAL -> `String "LOGICAL" | PATH -> `String "PATH"

let map_entry_to_yojson = string_to_yojson
let map_target_to_yojson = string_to_yojson

let map_type_to_yojson (x : map_type) =
  match x with DIRECTORY -> `String "DIRECTORY" | FILE -> `String "FILE"

let home_directory_map_entry_to_yojson (x : home_directory_map_entry) =
  assoc_to_yojson
    [
      ("Type", option_to_yojson map_type_to_yojson x.type_);
      ("Target", Some (map_target_to_yojson x.target));
      ("Entry", Some (map_entry_to_yojson x.entry));
    ]

let home_directory_mappings_to_yojson tree = list_to_yojson home_directory_map_entry_to_yojson tree
let policy_to_yojson = string_to_yojson
let posix_id_to_yojson = long_to_yojson
let secondary_gids_to_yojson tree = list_to_yojson posix_id_to_yojson tree

let posix_profile_to_yojson (x : posix_profile) =
  assoc_to_yojson
    [
      ("SecondaryGids", option_to_yojson secondary_gids_to_yojson x.secondary_gids);
      ("Gid", Some (posix_id_to_yojson x.gid));
      ("Uid", Some (posix_id_to_yojson x.uid));
    ]

let update_user_request_to_yojson (x : update_user_request) =
  assoc_to_yojson
    [
      ("UserName", Some (user_name_to_yojson x.user_name));
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("Role", option_to_yojson role_to_yojson x.role);
      ("PosixProfile", option_to_yojson posix_profile_to_yojson x.posix_profile);
      ("Policy", option_to_yojson policy_to_yojson x.policy);
      ( "HomeDirectoryMappings",
        option_to_yojson home_directory_mappings_to_yojson x.home_directory_mappings );
      ("HomeDirectoryType", option_to_yojson home_directory_type_to_yojson x.home_directory_type);
      ("HomeDirectory", option_to_yojson home_directory_to_yojson x.home_directory);
    ]

let service_unavailable_exception_to_yojson (x : service_unavailable_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson service_error_message_to_yojson x.message) ]

let update_server_response_to_yojson (x : update_server_response) =
  assoc_to_yojson [ ("ServerId", Some (server_id_to_yojson x.server_id)) ]

let certificate_to_yojson = string_to_yojson
let passive_ip_to_yojson = string_to_yojson

let tls_session_resumption_mode_to_yojson (x : tls_session_resumption_mode) =
  match x with
  | ENFORCED -> `String "ENFORCED"
  | ENABLED -> `String "ENABLED"
  | DISABLED -> `String "DISABLED"

let set_stat_option_to_yojson (x : set_stat_option) =
  match x with ENABLE_NO_OP -> `String "ENABLE_NO_OP" | DEFAULT -> `String "DEFAULT"

let as2_transport_to_yojson (x : as2_transport) = match x with HTTP -> `String "HTTP"
let as2_transports_to_yojson tree = list_to_yojson as2_transport_to_yojson tree

let protocol_details_to_yojson (x : protocol_details) =
  assoc_to_yojson
    [
      ("As2Transports", option_to_yojson as2_transports_to_yojson x.as2_transports);
      ("SetStatOption", option_to_yojson set_stat_option_to_yojson x.set_stat_option);
      ( "TlsSessionResumptionMode",
        option_to_yojson tls_session_resumption_mode_to_yojson x.tls_session_resumption_mode );
      ("PassiveIp", option_to_yojson passive_ip_to_yojson x.passive_ip);
    ]

let address_allocation_id_to_yojson = string_to_yojson
let address_allocation_ids_to_yojson tree = list_to_yojson address_allocation_id_to_yojson tree

let endpoint_details_to_yojson (x : endpoint_details) =
  assoc_to_yojson
    [
      ("SecurityGroupIds", option_to_yojson security_group_ids_to_yojson x.security_group_ids);
      ("VpcId", option_to_yojson vpc_id_to_yojson x.vpc_id);
      ("VpcEndpointId", option_to_yojson vpc_endpoint_id_to_yojson x.vpc_endpoint_id);
      ("SubnetIds", option_to_yojson subnet_ids_to_yojson x.subnet_ids);
      ( "AddressAllocationIds",
        option_to_yojson address_allocation_ids_to_yojson x.address_allocation_ids );
    ]

let endpoint_type_to_yojson (x : endpoint_type) =
  match x with
  | VPC_ENDPOINT -> `String "VPC_ENDPOINT"
  | VPC -> `String "VPC"
  | PUBLIC -> `String "PUBLIC"

let host_key_to_yojson = string_to_yojson
let directory_id_to_yojson = string_to_yojson
let function_to_yojson = string_to_yojson

let sftp_authentication_methods_to_yojson (x : sftp_authentication_methods) =
  match x with
  | PUBLIC_KEY_AND_PASSWORD -> `String "PUBLIC_KEY_AND_PASSWORD"
  | PUBLIC_KEY_OR_PASSWORD -> `String "PUBLIC_KEY_OR_PASSWORD"
  | PUBLIC_KEY -> `String "PUBLIC_KEY"
  | PASSWORD -> `String "PASSWORD"

let identity_provider_details_to_yojson (x : identity_provider_details) =
  assoc_to_yojson
    [
      ( "SftpAuthenticationMethods",
        option_to_yojson sftp_authentication_methods_to_yojson x.sftp_authentication_methods );
      ("Function", option_to_yojson function_to_yojson x.\#function);
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
      ("InvocationRole", option_to_yojson role_to_yojson x.invocation_role);
      ("Url", option_to_yojson url_to_yojson x.url);
    ]

let nullable_role_to_yojson = string_to_yojson
let post_authentication_login_banner_to_yojson = string_to_yojson
let pre_authentication_login_banner_to_yojson = string_to_yojson

let protocol_to_yojson (x : protocol) =
  match x with
  | AS2 -> `String "AS2"
  | FTPS -> `String "FTPS"
  | FTP -> `String "FTP"
  | SFTP -> `String "SFTP"

let protocols_to_yojson tree = list_to_yojson protocol_to_yojson tree
let security_policy_name_to_yojson = string_to_yojson
let arn_to_yojson = string_to_yojson
let structured_log_destinations_to_yojson tree = list_to_yojson arn_to_yojson tree

let directory_listing_optimization_to_yojson (x : directory_listing_optimization) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let s3_storage_options_to_yojson (x : s3_storage_options) =
  assoc_to_yojson
    [
      ( "DirectoryListingOptimization",
        option_to_yojson directory_listing_optimization_to_yojson x.directory_listing_optimization
      );
    ]

let ip_address_type_to_yojson (x : ip_address_type) =
  match x with DUALSTACK -> `String "DUALSTACK" | IPV4 -> `String "IPV4"

let identity_provider_type_to_yojson (x : identity_provider_type) =
  match x with
  | AWS_LAMBDA -> `String "AWS_LAMBDA"
  | AWS_DIRECTORY_SERVICE -> `String "AWS_DIRECTORY_SERVICE"
  | API_GATEWAY -> `String "API_GATEWAY"
  | SERVICE_MANAGED -> `String "SERVICE_MANAGED"

let update_server_request_to_yojson (x : update_server_request) =
  assoc_to_yojson
    [
      ( "IdentityProviderType",
        option_to_yojson identity_provider_type_to_yojson x.identity_provider_type );
      ("IpAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ("S3StorageOptions", option_to_yojson s3_storage_options_to_yojson x.s3_storage_options);
      ( "StructuredLogDestinations",
        option_to_yojson structured_log_destinations_to_yojson x.structured_log_destinations );
      ("WorkflowDetails", option_to_yojson workflow_details_to_yojson x.workflow_details);
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("SecurityPolicyName", option_to_yojson security_policy_name_to_yojson x.security_policy_name);
      ("Protocols", option_to_yojson protocols_to_yojson x.protocols);
      ( "PreAuthenticationLoginBanner",
        option_to_yojson pre_authentication_login_banner_to_yojson x.pre_authentication_login_banner
      );
      ( "PostAuthenticationLoginBanner",
        option_to_yojson post_authentication_login_banner_to_yojson
          x.post_authentication_login_banner );
      ("LoggingRole", option_to_yojson nullable_role_to_yojson x.logging_role);
      ( "IdentityProviderDetails",
        option_to_yojson identity_provider_details_to_yojson x.identity_provider_details );
      ("HostKey", option_to_yojson host_key_to_yojson x.host_key);
      ("EndpointType", option_to_yojson endpoint_type_to_yojson x.endpoint_type);
      ("EndpointDetails", option_to_yojson endpoint_details_to_yojson x.endpoint_details);
      ("ProtocolDetails", option_to_yojson protocol_details_to_yojson x.protocol_details);
      ("Certificate", option_to_yojson certificate_to_yojson x.certificate);
    ]

let resource_exists_exception_to_yojson (x : resource_exists_exception) =
  assoc_to_yojson
    [
      ("ResourceType", Some (resource_type_to_yojson x.resource_type));
      ("Resource", Some (resource_to_yojson x.resource));
      ("Message", Some (message_to_yojson x.message));
    ]

let profile_id_to_yojson = string_to_yojson

let update_profile_response_to_yojson (x : update_profile_response) =
  assoc_to_yojson [ ("ProfileId", Some (profile_id_to_yojson x.profile_id)) ]

let certificate_id_to_yojson = string_to_yojson
let certificate_ids_to_yojson tree = list_to_yojson certificate_id_to_yojson tree

let update_profile_request_to_yojson (x : update_profile_request) =
  assoc_to_yojson
    [
      ("CertificateIds", option_to_yojson certificate_ids_to_yojson x.certificate_ids);
      ("ProfileId", Some (profile_id_to_yojson x.profile_id));
    ]

let host_key_id_to_yojson = string_to_yojson

let update_host_key_response_to_yojson (x : update_host_key_response) =
  assoc_to_yojson
    [
      ("HostKeyId", Some (host_key_id_to_yojson x.host_key_id));
      ("ServerId", Some (server_id_to_yojson x.server_id));
    ]

let host_key_description_to_yojson = string_to_yojson

let update_host_key_request_to_yojson (x : update_host_key_request) =
  assoc_to_yojson
    [
      ("Description", Some (host_key_description_to_yojson x.description));
      ("HostKeyId", Some (host_key_id_to_yojson x.host_key_id));
      ("ServerId", Some (server_id_to_yojson x.server_id));
    ]

let sftp_port_to_yojson = int_to_yojson

let update_connector_vpc_lattice_egress_config_to_yojson
    (x : update_connector_vpc_lattice_egress_config) =
  assoc_to_yojson
    [
      ("PortNumber", option_to_yojson sftp_port_to_yojson x.port_number);
      ( "ResourceConfigurationArn",
        option_to_yojson vpc_lattice_resource_configuration_arn_to_yojson
          x.resource_configuration_arn );
    ]

let connector_id_to_yojson = string_to_yojson

let update_connector_response_to_yojson (x : update_connector_response) =
  assoc_to_yojson [ ("ConnectorId", Some (connector_id_to_yojson x.connector_id)) ]

let message_subject_to_yojson = string_to_yojson

let compression_enum_to_yojson (x : compression_enum) =
  match x with DISABLED -> `String "DISABLED" | ZLIB -> `String "ZLIB"

let encryption_alg_to_yojson (x : encryption_alg) =
  match x with
  | NONE -> `String "NONE"
  | DES_EDE3_CBC -> `String "DES_EDE3_CBC"
  | AES256_CBC -> `String "AES256_CBC"
  | AES192_CBC -> `String "AES192_CBC"
  | AES128_CBC -> `String "AES128_CBC"

let signing_alg_to_yojson (x : signing_alg) =
  match x with
  | NONE -> `String "NONE"
  | SHA1 -> `String "SHA1"
  | SHA512 -> `String "SHA512"
  | SHA384 -> `String "SHA384"
  | SHA256 -> `String "SHA256"

let mdn_signing_alg_to_yojson (x : mdn_signing_alg) =
  match x with
  | DEFAULT -> `String "DEFAULT"
  | NONE -> `String "NONE"
  | SHA1 -> `String "SHA1"
  | SHA512 -> `String "SHA512"
  | SHA384 -> `String "SHA384"
  | SHA256 -> `String "SHA256"

let mdn_response_to_yojson (x : mdn_response) =
  match x with ASYNC -> `String "ASYNC" | NONE -> `String "NONE" | SYNC -> `String "SYNC"

let as2_connector_secret_id_to_yojson = string_to_yojson

let preserve_content_type_to_yojson (x : preserve_content_type) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let as2_async_mdn_server_ids_to_yojson tree = list_to_yojson server_id_to_yojson tree

let as2_async_mdn_connector_config_to_yojson (x : as2_async_mdn_connector_config) =
  assoc_to_yojson
    [
      ("ServerIds", option_to_yojson as2_async_mdn_server_ids_to_yojson x.server_ids);
      ("Url", option_to_yojson url_to_yojson x.url);
    ]

let as2_connector_config_to_yojson (x : as2_connector_config) =
  assoc_to_yojson
    [
      ( "AsyncMdnConfig",
        option_to_yojson as2_async_mdn_connector_config_to_yojson x.async_mdn_config );
      ( "PreserveContentType",
        option_to_yojson preserve_content_type_to_yojson x.preserve_content_type );
      ( "BasicAuthSecretId",
        option_to_yojson as2_connector_secret_id_to_yojson x.basic_auth_secret_id );
      ("MdnResponse", option_to_yojson mdn_response_to_yojson x.mdn_response);
      ("MdnSigningAlgorithm", option_to_yojson mdn_signing_alg_to_yojson x.mdn_signing_algorithm);
      ("SigningAlgorithm", option_to_yojson signing_alg_to_yojson x.signing_algorithm);
      ("EncryptionAlgorithm", option_to_yojson encryption_alg_to_yojson x.encryption_algorithm);
      ("Compression", option_to_yojson compression_enum_to_yojson x.compression);
      ("MessageSubject", option_to_yojson message_subject_to_yojson x.message_subject);
      ("PartnerProfileId", option_to_yojson profile_id_to_yojson x.partner_profile_id);
      ("LocalProfileId", option_to_yojson profile_id_to_yojson x.local_profile_id);
    ]

let secret_id_to_yojson = string_to_yojson
let sftp_connector_trusted_host_key_to_yojson = string_to_yojson

let sftp_connector_trusted_host_key_list_to_yojson tree =
  list_to_yojson sftp_connector_trusted_host_key_to_yojson tree

let max_concurrent_connections_to_yojson = int_to_yojson

let sftp_connector_config_to_yojson (x : sftp_connector_config) =
  assoc_to_yojson
    [
      ( "MaxConcurrentConnections",
        option_to_yojson max_concurrent_connections_to_yojson x.max_concurrent_connections );
      ( "TrustedHostKeys",
        option_to_yojson sftp_connector_trusted_host_key_list_to_yojson x.trusted_host_keys );
      ("UserSecretId", option_to_yojson secret_id_to_yojson x.user_secret_id);
    ]

let connector_security_policy_name_to_yojson = string_to_yojson

let update_connector_egress_config_to_yojson (x : update_connector_egress_config) =
  match x with
  | VpcLattice arg ->
      assoc_to_yojson
        [ ("VpcLattice", Some (update_connector_vpc_lattice_egress_config_to_yojson arg)) ]

let connectors_ip_address_type_to_yojson (x : connectors_ip_address_type) =
  match x with DUALSTACK -> `String "DUALSTACK" | IPV4 -> `String "IPV4"

let update_connector_request_to_yojson (x : update_connector_request) =
  assoc_to_yojson
    [
      ("IpAddressType", option_to_yojson connectors_ip_address_type_to_yojson x.ip_address_type);
      ("EgressConfig", option_to_yojson update_connector_egress_config_to_yojson x.egress_config);
      ( "SecurityPolicyName",
        option_to_yojson connector_security_policy_name_to_yojson x.security_policy_name );
      ("SftpConfig", option_to_yojson sftp_connector_config_to_yojson x.sftp_config);
      ("LoggingRole", option_to_yojson role_to_yojson x.logging_role);
      ("AccessRole", option_to_yojson role_to_yojson x.access_role);
      ("As2Config", option_to_yojson as2_connector_config_to_yojson x.as2_config);
      ("Url", option_to_yojson url_to_yojson x.url);
      ("ConnectorId", Some (connector_id_to_yojson x.connector_id));
    ]

let update_certificate_response_to_yojson (x : update_certificate_response) =
  assoc_to_yojson [ ("CertificateId", Some (certificate_id_to_yojson x.certificate_id)) ]

let cert_date_to_yojson = timestamp_epoch_seconds_to_yojson
let description_to_yojson = string_to_yojson

let update_certificate_request_to_yojson (x : update_certificate_request) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson description_to_yojson x.description);
      ("InactiveDate", option_to_yojson cert_date_to_yojson x.inactive_date);
      ("ActiveDate", option_to_yojson cert_date_to_yojson x.active_date);
      ("CertificateId", Some (certificate_id_to_yojson x.certificate_id));
    ]

let agreement_id_to_yojson = string_to_yojson

let update_agreement_response_to_yojson (x : update_agreement_response) =
  assoc_to_yojson [ ("AgreementId", Some (agreement_id_to_yojson x.agreement_id)) ]

let agreement_status_type_to_yojson (x : agreement_status_type) =
  match x with INACTIVE -> `String "INACTIVE" | ACTIVE -> `String "ACTIVE"

let preserve_filename_type_to_yojson (x : preserve_filename_type) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let enforce_message_signing_type_to_yojson (x : enforce_message_signing_type) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let custom_directories_type_to_yojson (x : custom_directories_type) =
  assoc_to_yojson
    [
      ("TemporaryFilesDirectory", Some (home_directory_to_yojson x.temporary_files_directory));
      ("StatusFilesDirectory", Some (home_directory_to_yojson x.status_files_directory));
      ("PayloadFilesDirectory", Some (home_directory_to_yojson x.payload_files_directory));
      ("MdnFilesDirectory", Some (home_directory_to_yojson x.mdn_files_directory));
      ("FailedFilesDirectory", Some (home_directory_to_yojson x.failed_files_directory));
    ]

let update_agreement_request_to_yojson (x : update_agreement_request) =
  assoc_to_yojson
    [
      ("CustomDirectories", option_to_yojson custom_directories_type_to_yojson x.custom_directories);
      ( "EnforceMessageSigning",
        option_to_yojson enforce_message_signing_type_to_yojson x.enforce_message_signing );
      ("PreserveFilename", option_to_yojson preserve_filename_type_to_yojson x.preserve_filename);
      ("AccessRole", option_to_yojson role_to_yojson x.access_role);
      ("BaseDirectory", option_to_yojson home_directory_to_yojson x.base_directory);
      ("PartnerProfileId", option_to_yojson profile_id_to_yojson x.partner_profile_id);
      ("LocalProfileId", option_to_yojson profile_id_to_yojson x.local_profile_id);
      ("Status", option_to_yojson agreement_status_type_to_yojson x.status);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("AgreementId", Some (agreement_id_to_yojson x.agreement_id));
    ]

let external_id_to_yojson = string_to_yojson

let update_access_response_to_yojson (x : update_access_response) =
  assoc_to_yojson
    [
      ("ExternalId", Some (external_id_to_yojson x.external_id));
      ("ServerId", Some (server_id_to_yojson x.server_id));
    ]

let update_access_request_to_yojson (x : update_access_request) =
  assoc_to_yojson
    [
      ("ExternalId", Some (external_id_to_yojson x.external_id));
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("Role", option_to_yojson role_to_yojson x.role);
      ("PosixProfile", option_to_yojson posix_profile_to_yojson x.posix_profile);
      ("Policy", option_to_yojson policy_to_yojson x.policy);
      ( "HomeDirectoryMappings",
        option_to_yojson home_directory_mappings_to_yojson x.home_directory_mappings );
      ("HomeDirectoryType", option_to_yojson home_directory_type_to_yojson x.home_directory_type);
      ("HomeDirectory", option_to_yojson home_directory_to_yojson x.home_directory);
    ]

let tag_key_to_yojson = string_to_yojson
let tag_keys_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [ ("TagKeys", Some (tag_keys_to_yojson x.tag_keys)); ("Arn", Some (arn_to_yojson x.arn)) ]

let transfer_table_status_to_yojson (x : transfer_table_status) =
  match x with
  | FAILED -> `String "FAILED"
  | COMPLETED -> `String "COMPLETED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | QUEUED -> `String "QUEUED"

let response_to_yojson = string_to_yojson
let status_code_to_yojson = int_to_yojson

let test_identity_provider_response_to_yojson (x : test_identity_provider_response) =
  assoc_to_yojson
    [
      ("Url", Some (url_to_yojson x.url));
      ("Message", option_to_yojson message_to_yojson x.message);
      ("StatusCode", Some (status_code_to_yojson x.status_code));
      ("Response", option_to_yojson response_to_yojson x.response);
    ]

let source_ip_to_yojson = string_to_yojson

let test_identity_provider_request_to_yojson (x : test_identity_provider_request) =
  assoc_to_yojson
    [
      ("UserPassword", option_to_yojson user_password_to_yojson x.user_password);
      ("UserName", Some (user_name_to_yojson x.user_name));
      ("SourceIp", option_to_yojson source_ip_to_yojson x.source_ip);
      ("ServerProtocol", option_to_yojson protocol_to_yojson x.server_protocol);
      ("ServerId", Some (server_id_to_yojson x.server_id));
    ]

let status_to_yojson = string_to_yojson
let sftp_connector_host_key_to_yojson = string_to_yojson

let sftp_connector_connection_details_to_yojson (x : sftp_connector_connection_details) =
  assoc_to_yojson [ ("HostKey", option_to_yojson sftp_connector_host_key_to_yojson x.host_key) ]

let test_connection_response_to_yojson (x : test_connection_response) =
  assoc_to_yojson
    [
      ( "SftpConnectionDetails",
        option_to_yojson sftp_connector_connection_details_to_yojson x.sftp_connection_details );
      ("StatusMessage", option_to_yojson message_to_yojson x.status_message);
      ("Status", option_to_yojson status_to_yojson x.status);
      ("ConnectorId", option_to_yojson connector_id_to_yojson x.connector_id);
    ]

let test_connection_request_to_yojson (x : test_connection_request) =
  assoc_to_yojson [ ("ConnectorId", Some (connector_id_to_yojson x.connector_id)) ]

let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Value", Some (tag_value_to_yojson x.value)); ("Key", Some (tag_key_to_yojson x.key)) ]

let tags_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson [ ("Tags", Some (tags_to_yojson x.tags)); ("Arn", Some (arn_to_yojson x.arn)) ]

let stop_server_request_to_yojson (x : stop_server_request) =
  assoc_to_yojson [ ("ServerId", Some (server_id_to_yojson x.server_id)) ]

let start_server_request_to_yojson (x : start_server_request) =
  assoc_to_yojson [ ("ServerId", Some (server_id_to_yojson x.server_id)) ]

let move_id_to_yojson = string_to_yojson

let start_remote_move_response_to_yojson (x : start_remote_move_response) =
  assoc_to_yojson [ ("MoveId", Some (move_id_to_yojson x.move_id)) ]

let file_path_to_yojson = string_to_yojson

let start_remote_move_request_to_yojson (x : start_remote_move_request) =
  assoc_to_yojson
    [
      ("TargetPath", Some (file_path_to_yojson x.target_path));
      ("SourcePath", Some (file_path_to_yojson x.source_path));
      ("ConnectorId", Some (connector_id_to_yojson x.connector_id));
    ]

let delete_id_to_yojson = string_to_yojson

let start_remote_delete_response_to_yojson (x : start_remote_delete_response) =
  assoc_to_yojson [ ("DeleteId", Some (delete_id_to_yojson x.delete_id)) ]

let start_remote_delete_request_to_yojson (x : start_remote_delete_request) =
  assoc_to_yojson
    [
      ("DeletePath", Some (file_path_to_yojson x.delete_path));
      ("ConnectorId", Some (connector_id_to_yojson x.connector_id));
    ]

let transfer_id_to_yojson = string_to_yojson

let start_file_transfer_response_to_yojson (x : start_file_transfer_response) =
  assoc_to_yojson [ ("TransferId", Some (transfer_id_to_yojson x.transfer_id)) ]

let file_paths_to_yojson tree = list_to_yojson file_path_to_yojson tree
let custom_http_header_key_type_to_yojson = string_to_yojson
let custom_http_header_value_type_to_yojson = string_to_yojson

let custom_http_header_to_yojson (x : custom_http_header) =
  assoc_to_yojson
    [
      ("Value", option_to_yojson custom_http_header_value_type_to_yojson x.value);
      ("Key", option_to_yojson custom_http_header_key_type_to_yojson x.key);
    ]

let custom_http_headers_to_yojson tree = list_to_yojson custom_http_header_to_yojson tree

let start_file_transfer_request_to_yojson (x : start_file_transfer_request) =
  assoc_to_yojson
    [
      ("CustomHttpHeaders", option_to_yojson custom_http_headers_to_yojson x.custom_http_headers);
      ("RemoteDirectoryPath", option_to_yojson file_path_to_yojson x.remote_directory_path);
      ("LocalDirectoryPath", option_to_yojson file_path_to_yojson x.local_directory_path);
      ("RetrieveFilePaths", option_to_yojson file_paths_to_yojson x.retrieve_file_paths);
      ("SendFilePaths", option_to_yojson file_paths_to_yojson x.send_file_paths);
      ("ConnectorId", Some (connector_id_to_yojson x.connector_id));
    ]

let listing_id_to_yojson = string_to_yojson
let output_file_name_to_yojson = string_to_yojson

let start_directory_listing_response_to_yojson (x : start_directory_listing_response) =
  assoc_to_yojson
    [
      ("OutputFileName", Some (output_file_name_to_yojson x.output_file_name));
      ("ListingId", Some (listing_id_to_yojson x.listing_id));
    ]

let max_items_to_yojson = int_to_yojson

let start_directory_listing_request_to_yojson (x : start_directory_listing_request) =
  assoc_to_yojson
    [
      ("OutputDirectoryPath", Some (file_path_to_yojson x.output_directory_path));
      ("MaxItems", option_to_yojson max_items_to_yojson x.max_items);
      ("RemoteDirectoryPath", Some (file_path_to_yojson x.remote_directory_path));
      ("ConnectorId", Some (connector_id_to_yojson x.connector_id));
    ]

let send_workflow_step_state_response_to_yojson = unit_to_yojson
let execution_id_to_yojson = string_to_yojson
let callback_token_to_yojson = string_to_yojson

let custom_step_status_to_yojson (x : custom_step_status) =
  match x with FAILURE -> `String "FAILURE" | SUCCESS -> `String "SUCCESS"

let send_workflow_step_state_request_to_yojson (x : send_workflow_step_state_request) =
  assoc_to_yojson
    [
      ("Status", Some (custom_step_status_to_yojson x.status));
      ("Token", Some (callback_token_to_yojson x.token));
      ("ExecutionId", Some (execution_id_to_yojson x.execution_id));
      ("WorkflowId", Some (workflow_id_to_yojson x.workflow_id));
    ]

let invalid_next_token_exception_to_yojson (x : invalid_next_token_exception) =
  assoc_to_yojson [ ("Message", Some (message_to_yojson x.message)) ]

let next_token_to_yojson = string_to_yojson

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
    ]

let max_results_to_yojson = int_to_yojson

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("Arn", Some (arn_to_yojson x.arn));
    ]

let security_policy_names_to_yojson tree = list_to_yojson security_policy_name_to_yojson tree

let list_security_policies_response_to_yojson (x : list_security_policies_response) =
  assoc_to_yojson
    [
      ("SecurityPolicyNames", Some (security_policy_names_to_yojson x.security_policy_names));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_security_policies_request_to_yojson (x : list_security_policies_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let host_key_fingerprint_to_yojson = string_to_yojson
let host_key_type_to_yojson = string_to_yojson
let date_imported_to_yojson = timestamp_epoch_seconds_to_yojson

let listed_host_key_to_yojson (x : listed_host_key) =
  assoc_to_yojson
    [
      ("DateImported", option_to_yojson date_imported_to_yojson x.date_imported);
      ("Type", option_to_yojson host_key_type_to_yojson x.type_);
      ("Description", option_to_yojson host_key_description_to_yojson x.description);
      ("Fingerprint", option_to_yojson host_key_fingerprint_to_yojson x.fingerprint);
      ("HostKeyId", option_to_yojson host_key_id_to_yojson x.host_key_id);
      ("Arn", Some (arn_to_yojson x.arn));
    ]

let listed_host_keys_to_yojson tree = list_to_yojson listed_host_key_to_yojson tree

let list_host_keys_response_to_yojson (x : list_host_keys_response) =
  assoc_to_yojson
    [
      ("HostKeys", Some (listed_host_keys_to_yojson x.host_keys));
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_host_keys_request_to_yojson (x : list_host_keys_request) =
  assoc_to_yojson
    [
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let failure_code_to_yojson = string_to_yojson

let connector_file_transfer_result_to_yojson (x : connector_file_transfer_result) =
  assoc_to_yojson
    [
      ("FailureMessage", option_to_yojson message_to_yojson x.failure_message);
      ("FailureCode", option_to_yojson failure_code_to_yojson x.failure_code);
      ("StatusCode", Some (transfer_table_status_to_yojson x.status_code));
      ("FilePath", Some (file_path_to_yojson x.file_path));
    ]

let connector_file_transfer_results_to_yojson tree =
  list_to_yojson connector_file_transfer_result_to_yojson tree

let list_file_transfer_results_response_to_yojson (x : list_file_transfer_results_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "FileTransferResults",
        Some (connector_file_transfer_results_to_yojson x.file_transfer_results) );
    ]

let list_file_transfer_results_request_to_yojson (x : list_file_transfer_results_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("TransferId", Some (transfer_id_to_yojson x.transfer_id));
      ("ConnectorId", Some (connector_id_to_yojson x.connector_id));
    ]

let s3_version_id_to_yojson = string_to_yojson
let s3_etag_to_yojson = string_to_yojson

let s3_file_location_to_yojson (x : s3_file_location) =
  assoc_to_yojson
    [
      ("Etag", option_to_yojson s3_etag_to_yojson x.etag);
      ("VersionId", option_to_yojson s3_version_id_to_yojson x.version_id);
      ("Key", option_to_yojson s3_key_to_yojson x.key);
      ("Bucket", option_to_yojson s3_bucket_to_yojson x.bucket);
    ]

let file_location_to_yojson (x : file_location) =
  assoc_to_yojson
    [
      ("EfsFileLocation", option_to_yojson efs_file_location_to_yojson x.efs_file_location);
      ("S3FileLocation", option_to_yojson s3_file_location_to_yojson x.s3_file_location);
    ]

let service_metadata_to_yojson (x : service_metadata) =
  assoc_to_yojson [ ("UserDetails", Some (user_details_to_yojson x.user_details)) ]

let execution_status_to_yojson (x : execution_status) =
  match x with
  | HANDLING_EXCEPTION -> `String "HANDLING_EXCEPTION"
  | EXCEPTION -> `String "EXCEPTION"
  | COMPLETED -> `String "COMPLETED"
  | IN_PROGRESS -> `String "IN_PROGRESS"

let listed_execution_to_yojson (x : listed_execution) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson execution_status_to_yojson x.status);
      ("ServiceMetadata", option_to_yojson service_metadata_to_yojson x.service_metadata);
      ("InitialFileLocation", option_to_yojson file_location_to_yojson x.initial_file_location);
      ("ExecutionId", option_to_yojson execution_id_to_yojson x.execution_id);
    ]

let listed_executions_to_yojson tree = list_to_yojson listed_execution_to_yojson tree

let list_executions_response_to_yojson (x : list_executions_response) =
  assoc_to_yojson
    [
      ("Executions", Some (listed_executions_to_yojson x.executions));
      ("WorkflowId", Some (workflow_id_to_yojson x.workflow_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_executions_request_to_yojson (x : list_executions_request) =
  assoc_to_yojson
    [
      ("WorkflowId", Some (workflow_id_to_yojson x.workflow_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let listed_access_to_yojson (x : listed_access) =
  assoc_to_yojson
    [
      ("ExternalId", option_to_yojson external_id_to_yojson x.external_id);
      ("Role", option_to_yojson role_to_yojson x.role);
      ("HomeDirectoryType", option_to_yojson home_directory_type_to_yojson x.home_directory_type);
      ("HomeDirectory", option_to_yojson home_directory_to_yojson x.home_directory);
    ]

let listed_accesses_to_yojson tree = list_to_yojson listed_access_to_yojson tree

let list_accesses_response_to_yojson (x : list_accesses_response) =
  assoc_to_yojson
    [
      ("Accesses", Some (listed_accesses_to_yojson x.accesses));
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_accesses_request_to_yojson (x : list_accesses_request) =
  assoc_to_yojson
    [
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let ssh_public_key_id_to_yojson = string_to_yojson

let import_ssh_public_key_response_to_yojson (x : import_ssh_public_key_response) =
  assoc_to_yojson
    [
      ("UserName", Some (user_name_to_yojson x.user_name));
      ("SshPublicKeyId", Some (ssh_public_key_id_to_yojson x.ssh_public_key_id));
      ("ServerId", Some (server_id_to_yojson x.server_id));
    ]

let ssh_public_key_body_to_yojson = string_to_yojson

let import_ssh_public_key_request_to_yojson (x : import_ssh_public_key_request) =
  assoc_to_yojson
    [
      ("UserName", Some (user_name_to_yojson x.user_name));
      ("SshPublicKeyBody", Some (ssh_public_key_body_to_yojson x.ssh_public_key_body));
      ("ServerId", Some (server_id_to_yojson x.server_id));
    ]

let import_host_key_response_to_yojson (x : import_host_key_response) =
  assoc_to_yojson
    [
      ("HostKeyId", Some (host_key_id_to_yojson x.host_key_id));
      ("ServerId", Some (server_id_to_yojson x.server_id));
    ]

let import_host_key_request_to_yojson (x : import_host_key_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("Description", option_to_yojson host_key_description_to_yojson x.description);
      ("HostKeyBody", Some (host_key_to_yojson x.host_key_body));
      ("ServerId", Some (server_id_to_yojson x.server_id));
    ]

let fips_to_yojson = bool_to_yojson
let security_policy_option_to_yojson = string_to_yojson
let security_policy_options_to_yojson tree = list_to_yojson security_policy_option_to_yojson tree

let security_policy_resource_type_to_yojson (x : security_policy_resource_type) =
  match x with CONNECTOR -> `String "CONNECTOR" | SERVER -> `String "SERVER"

let security_policy_protocol_to_yojson (x : security_policy_protocol) =
  match x with FTPS -> `String "FTPS" | SFTP -> `String "SFTP"

let security_policy_protocols_to_yojson tree =
  list_to_yojson security_policy_protocol_to_yojson tree

let described_security_policy_to_yojson (x : described_security_policy) =
  assoc_to_yojson
    [
      ("Protocols", option_to_yojson security_policy_protocols_to_yojson x.protocols);
      ("Type", option_to_yojson security_policy_resource_type_to_yojson x.type_);
      ( "SshHostKeyAlgorithms",
        option_to_yojson security_policy_options_to_yojson x.ssh_host_key_algorithms );
      ("TlsCiphers", option_to_yojson security_policy_options_to_yojson x.tls_ciphers);
      ("SshMacs", option_to_yojson security_policy_options_to_yojson x.ssh_macs);
      ("SshKexs", option_to_yojson security_policy_options_to_yojson x.ssh_kexs);
      ("SshCiphers", option_to_yojson security_policy_options_to_yojson x.ssh_ciphers);
      ("SecurityPolicyName", Some (security_policy_name_to_yojson x.security_policy_name));
      ("Fips", option_to_yojson fips_to_yojson x.fips);
    ]

let describe_security_policy_response_to_yojson (x : describe_security_policy_response) =
  assoc_to_yojson
    [ ("SecurityPolicy", Some (described_security_policy_to_yojson x.security_policy)) ]

let describe_security_policy_request_to_yojson (x : describe_security_policy_request) =
  assoc_to_yojson
    [ ("SecurityPolicyName", Some (security_policy_name_to_yojson x.security_policy_name)) ]

let described_host_key_to_yojson (x : described_host_key) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("DateImported", option_to_yojson date_imported_to_yojson x.date_imported);
      ("Type", option_to_yojson host_key_type_to_yojson x.type_);
      ("Description", option_to_yojson host_key_description_to_yojson x.description);
      ("HostKeyFingerprint", option_to_yojson host_key_fingerprint_to_yojson x.host_key_fingerprint);
      ("HostKeyId", option_to_yojson host_key_id_to_yojson x.host_key_id);
      ("Arn", Some (arn_to_yojson x.arn));
    ]

let describe_host_key_response_to_yojson (x : describe_host_key_response) =
  assoc_to_yojson [ ("HostKey", Some (described_host_key_to_yojson x.host_key)) ]

let describe_host_key_request_to_yojson (x : describe_host_key_request) =
  assoc_to_yojson
    [
      ("HostKeyId", Some (host_key_id_to_yojson x.host_key_id));
      ("ServerId", Some (server_id_to_yojson x.server_id));
    ]

let log_group_name_to_yojson = string_to_yojson

let logging_configuration_to_yojson (x : logging_configuration) =
  assoc_to_yojson
    [
      ("LogGroupName", option_to_yojson log_group_name_to_yojson x.log_group_name);
      ("LoggingRole", option_to_yojson role_to_yojson x.logging_role);
    ]

let step_result_outputs_json_to_yojson = string_to_yojson

let execution_error_type_to_yojson (x : execution_error_type) =
  match x with
  | INTERNAL_SERVER_ERROR -> `String "INTERNAL_SERVER_ERROR"
  | TIMEOUT -> `String "TIMEOUT"
  | BAD_REQUEST -> `String "BAD_REQUEST"
  | NOT_FOUND -> `String "NOT_FOUND"
  | ALREADY_EXISTS -> `String "ALREADY_EXISTS"
  | THROTTLED -> `String "THROTTLED"
  | CUSTOM_STEP_FAILED -> `String "CUSTOM_STEP_FAILED"
  | PERMISSION_DENIED -> `String "PERMISSION_DENIED"

let execution_error_message_to_yojson = string_to_yojson

let execution_error_to_yojson (x : execution_error) =
  assoc_to_yojson
    [
      ("Message", Some (execution_error_message_to_yojson x.message));
      ("Type", Some (execution_error_type_to_yojson x.type_));
    ]

let execution_step_result_to_yojson (x : execution_step_result) =
  assoc_to_yojson
    [
      ("Error", option_to_yojson execution_error_to_yojson x.error);
      ("Outputs", option_to_yojson step_result_outputs_json_to_yojson x.outputs);
      ("StepType", option_to_yojson workflow_step_type_to_yojson x.step_type);
    ]

let execution_step_results_to_yojson tree = list_to_yojson execution_step_result_to_yojson tree

let execution_results_to_yojson (x : execution_results) =
  assoc_to_yojson
    [
      ("OnExceptionSteps", option_to_yojson execution_step_results_to_yojson x.on_exception_steps);
      ("Steps", option_to_yojson execution_step_results_to_yojson x.steps);
    ]

let described_execution_to_yojson (x : described_execution) =
  assoc_to_yojson
    [
      ("Results", option_to_yojson execution_results_to_yojson x.results);
      ("Status", option_to_yojson execution_status_to_yojson x.status);
      ("PosixProfile", option_to_yojson posix_profile_to_yojson x.posix_profile);
      ( "LoggingConfiguration",
        option_to_yojson logging_configuration_to_yojson x.logging_configuration );
      ("ExecutionRole", option_to_yojson role_to_yojson x.execution_role);
      ("ServiceMetadata", option_to_yojson service_metadata_to_yojson x.service_metadata);
      ("InitialFileLocation", option_to_yojson file_location_to_yojson x.initial_file_location);
      ("ExecutionId", option_to_yojson execution_id_to_yojson x.execution_id);
    ]

let describe_execution_response_to_yojson (x : describe_execution_response) =
  assoc_to_yojson
    [
      ("Execution", Some (described_execution_to_yojson x.execution));
      ("WorkflowId", Some (workflow_id_to_yojson x.workflow_id));
    ]

let describe_execution_request_to_yojson (x : describe_execution_request) =
  assoc_to_yojson
    [
      ("WorkflowId", Some (workflow_id_to_yojson x.workflow_id));
      ("ExecutionId", Some (execution_id_to_yojson x.execution_id));
    ]

let described_access_to_yojson (x : described_access) =
  assoc_to_yojson
    [
      ("ExternalId", option_to_yojson external_id_to_yojson x.external_id);
      ("Role", option_to_yojson role_to_yojson x.role);
      ("PosixProfile", option_to_yojson posix_profile_to_yojson x.posix_profile);
      ("Policy", option_to_yojson policy_to_yojson x.policy);
      ("HomeDirectoryType", option_to_yojson home_directory_type_to_yojson x.home_directory_type);
      ( "HomeDirectoryMappings",
        option_to_yojson home_directory_mappings_to_yojson x.home_directory_mappings );
      ("HomeDirectory", option_to_yojson home_directory_to_yojson x.home_directory);
    ]

let describe_access_response_to_yojson (x : describe_access_response) =
  assoc_to_yojson
    [
      ("Access", Some (described_access_to_yojson x.access));
      ("ServerId", Some (server_id_to_yojson x.server_id));
    ]

let describe_access_request_to_yojson (x : describe_access_request) =
  assoc_to_yojson
    [
      ("ExternalId", Some (external_id_to_yojson x.external_id));
      ("ServerId", Some (server_id_to_yojson x.server_id));
    ]

let delete_ssh_public_key_request_to_yojson (x : delete_ssh_public_key_request) =
  assoc_to_yojson
    [
      ("UserName", Some (user_name_to_yojson x.user_name));
      ("SshPublicKeyId", Some (ssh_public_key_id_to_yojson x.ssh_public_key_id));
      ("ServerId", Some (server_id_to_yojson x.server_id));
    ]

let delete_host_key_request_to_yojson (x : delete_host_key_request) =
  assoc_to_yojson
    [
      ("HostKeyId", Some (host_key_id_to_yojson x.host_key_id));
      ("ServerId", Some (server_id_to_yojson x.server_id));
    ]

let delete_access_request_to_yojson (x : delete_access_request) =
  assoc_to_yojson
    [
      ("ExternalId", Some (external_id_to_yojson x.external_id));
      ("ServerId", Some (server_id_to_yojson x.server_id));
    ]

let create_access_response_to_yojson (x : create_access_response) =
  assoc_to_yojson
    [
      ("ExternalId", Some (external_id_to_yojson x.external_id));
      ("ServerId", Some (server_id_to_yojson x.server_id));
    ]

let create_access_request_to_yojson (x : create_access_request) =
  assoc_to_yojson
    [
      ("ExternalId", Some (external_id_to_yojson x.external_id));
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("Role", Some (role_to_yojson x.role));
      ("PosixProfile", option_to_yojson posix_profile_to_yojson x.posix_profile);
      ("Policy", option_to_yojson policy_to_yojson x.policy);
      ( "HomeDirectoryMappings",
        option_to_yojson home_directory_mappings_to_yojson x.home_directory_mappings );
      ("HomeDirectoryType", option_to_yojson home_directory_type_to_yojson x.home_directory_type);
      ("HomeDirectory", option_to_yojson home_directory_to_yojson x.home_directory);
    ]

let state_to_yojson (x : state) =
  match x with
  | STOP_FAILED -> `String "STOP_FAILED"
  | START_FAILED -> `String "START_FAILED"
  | STOPPING -> `String "STOPPING"
  | STARTING -> `String "STARTING"
  | ONLINE -> `String "ONLINE"
  | OFFLINE -> `String "OFFLINE"

let ssh_public_key_to_yojson (x : ssh_public_key) =
  assoc_to_yojson
    [
      ("SshPublicKeyId", Some (ssh_public_key_id_to_yojson x.ssh_public_key_id));
      ("SshPublicKeyBody", Some (ssh_public_key_body_to_yojson x.ssh_public_key_body));
      ("DateImported", Some (date_imported_to_yojson x.date_imported));
    ]

let ssh_public_keys_to_yojson tree = list_to_yojson ssh_public_key_to_yojson tree
let ssh_public_key_count_to_yojson = int_to_yojson
let service_managed_egress_ip_address_to_yojson = string_to_yojson

let service_managed_egress_ip_addresses_to_yojson tree =
  list_to_yojson service_managed_egress_ip_address_to_yojson tree

let profile_type_to_yojson (x : profile_type) =
  match x with PARTNER -> `String "PARTNER" | LOCAL -> `String "LOCAL"

let private_key_type_to_yojson = string_to_yojson

let listed_workflow_to_yojson (x : listed_workflow) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("Description", option_to_yojson workflow_description_to_yojson x.description);
      ("WorkflowId", option_to_yojson workflow_id_to_yojson x.workflow_id);
    ]

let listed_workflows_to_yojson tree = list_to_yojson listed_workflow_to_yojson tree

let listed_web_app_to_yojson (x : listed_web_app) =
  assoc_to_yojson
    [
      ("EndpointType", option_to_yojson web_app_endpoint_type_to_yojson x.endpoint_type);
      ("WebAppEndpoint", option_to_yojson web_app_endpoint_to_yojson x.web_app_endpoint);
      ("AccessEndpoint", option_to_yojson web_app_access_endpoint_to_yojson x.access_endpoint);
      ("WebAppId", Some (web_app_id_to_yojson x.web_app_id));
      ("Arn", Some (arn_to_yojson x.arn));
    ]

let listed_web_apps_to_yojson tree = list_to_yojson listed_web_app_to_yojson tree

let listed_user_to_yojson (x : listed_user) =
  assoc_to_yojson
    [
      ("UserName", option_to_yojson user_name_to_yojson x.user_name);
      ("SshPublicKeyCount", option_to_yojson ssh_public_key_count_to_yojson x.ssh_public_key_count);
      ("Role", option_to_yojson role_to_yojson x.role);
      ("HomeDirectoryType", option_to_yojson home_directory_type_to_yojson x.home_directory_type);
      ("HomeDirectory", option_to_yojson home_directory_to_yojson x.home_directory);
      ("Arn", Some (arn_to_yojson x.arn));
    ]

let listed_users_to_yojson tree = list_to_yojson listed_user_to_yojson tree
let domain_to_yojson (x : domain) = match x with EFS -> `String "EFS" | S3 -> `String "S3"

let listed_server_to_yojson (x : listed_server) =
  assoc_to_yojson
    [
      ("UserCount", option_to_yojson user_count_to_yojson x.user_count);
      ("State", option_to_yojson state_to_yojson x.state);
      ("ServerId", option_to_yojson server_id_to_yojson x.server_id);
      ("LoggingRole", option_to_yojson role_to_yojson x.logging_role);
      ("EndpointType", option_to_yojson endpoint_type_to_yojson x.endpoint_type);
      ( "IdentityProviderType",
        option_to_yojson identity_provider_type_to_yojson x.identity_provider_type );
      ("Domain", option_to_yojson domain_to_yojson x.domain);
      ("Arn", Some (arn_to_yojson x.arn));
    ]

let listed_servers_to_yojson tree = list_to_yojson listed_server_to_yojson tree
let as2_id_to_yojson = string_to_yojson

let listed_profile_to_yojson (x : listed_profile) =
  assoc_to_yojson
    [
      ("ProfileType", option_to_yojson profile_type_to_yojson x.profile_type);
      ("As2Id", option_to_yojson as2_id_to_yojson x.as2_id);
      ("ProfileId", option_to_yojson profile_id_to_yojson x.profile_id);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
    ]

let listed_profiles_to_yojson tree = list_to_yojson listed_profile_to_yojson tree

let listed_connector_to_yojson (x : listed_connector) =
  assoc_to_yojson
    [
      ("Url", option_to_yojson url_to_yojson x.url);
      ("ConnectorId", option_to_yojson connector_id_to_yojson x.connector_id);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
    ]

let listed_connectors_to_yojson tree = list_to_yojson listed_connector_to_yojson tree

let certificate_usage_type_to_yojson (x : certificate_usage_type) =
  match x with
  | TLS -> `String "TLS"
  | ENCRYPTION -> `String "ENCRYPTION"
  | SIGNING -> `String "SIGNING"

let certificate_status_type_to_yojson (x : certificate_status_type) =
  match x with
  | INACTIVE -> `String "INACTIVE"
  | PENDING_ROTATION -> `String "PENDING_ROTATION"
  | ACTIVE -> `String "ACTIVE"

let certificate_type_to_yojson (x : certificate_type) =
  match x with
  | CERTIFICATE_WITH_PRIVATE_KEY -> `String "CERTIFICATE_WITH_PRIVATE_KEY"
  | CERTIFICATE -> `String "CERTIFICATE"

let listed_certificate_to_yojson (x : listed_certificate) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Type", option_to_yojson certificate_type_to_yojson x.type_);
      ("InactiveDate", option_to_yojson cert_date_to_yojson x.inactive_date);
      ("ActiveDate", option_to_yojson cert_date_to_yojson x.active_date);
      ("Status", option_to_yojson certificate_status_type_to_yojson x.status);
      ("Usage", option_to_yojson certificate_usage_type_to_yojson x.usage);
      ("CertificateId", option_to_yojson certificate_id_to_yojson x.certificate_id);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
    ]

let listed_certificates_to_yojson tree = list_to_yojson listed_certificate_to_yojson tree

let listed_agreement_to_yojson (x : listed_agreement) =
  assoc_to_yojson
    [
      ("PartnerProfileId", option_to_yojson profile_id_to_yojson x.partner_profile_id);
      ("LocalProfileId", option_to_yojson profile_id_to_yojson x.local_profile_id);
      ("ServerId", option_to_yojson server_id_to_yojson x.server_id);
      ("Status", option_to_yojson agreement_status_type_to_yojson x.status);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("AgreementId", option_to_yojson agreement_id_to_yojson x.agreement_id);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
    ]

let listed_agreements_to_yojson tree = list_to_yojson listed_agreement_to_yojson tree

let list_workflows_response_to_yojson (x : list_workflows_response) =
  assoc_to_yojson
    [
      ("Workflows", Some (listed_workflows_to_yojson x.workflows));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_workflows_request_to_yojson (x : list_workflows_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_web_apps_response_to_yojson (x : list_web_apps_response) =
  assoc_to_yojson
    [
      ("WebApps", Some (listed_web_apps_to_yojson x.web_apps));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_web_apps_request_to_yojson (x : list_web_apps_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_users_response_to_yojson (x : list_users_response) =
  assoc_to_yojson
    [
      ("Users", Some (listed_users_to_yojson x.users));
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_users_request_to_yojson (x : list_users_request) =
  assoc_to_yojson
    [
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_servers_response_to_yojson (x : list_servers_response) =
  assoc_to_yojson
    [
      ("Servers", Some (listed_servers_to_yojson x.servers));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_servers_request_to_yojson (x : list_servers_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_profiles_response_to_yojson (x : list_profiles_response) =
  assoc_to_yojson
    [
      ("Profiles", Some (listed_profiles_to_yojson x.profiles));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_profiles_request_to_yojson (x : list_profiles_request) =
  assoc_to_yojson
    [
      ("ProfileType", option_to_yojson profile_type_to_yojson x.profile_type);
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_connectors_response_to_yojson (x : list_connectors_response) =
  assoc_to_yojson
    [
      ("Connectors", Some (listed_connectors_to_yojson x.connectors));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_connectors_request_to_yojson (x : list_connectors_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_certificates_response_to_yojson (x : list_certificates_response) =
  assoc_to_yojson
    [
      ("Certificates", Some (listed_certificates_to_yojson x.certificates));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_certificates_request_to_yojson (x : list_certificates_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let list_agreements_response_to_yojson (x : list_agreements_response) =
  assoc_to_yojson
    [
      ("Agreements", Some (listed_agreements_to_yojson x.agreements));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_agreements_request_to_yojson (x : list_agreements_request) =
  assoc_to_yojson
    [
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("NextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let import_certificate_response_to_yojson (x : import_certificate_response) =
  assoc_to_yojson [ ("CertificateId", Some (certificate_id_to_yojson x.certificate_id)) ]

let certificate_body_type_to_yojson = string_to_yojson
let certificate_chain_type_to_yojson = string_to_yojson

let import_certificate_request_to_yojson (x : import_certificate_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("InactiveDate", option_to_yojson cert_date_to_yojson x.inactive_date);
      ("ActiveDate", option_to_yojson cert_date_to_yojson x.active_date);
      ("PrivateKey", option_to_yojson private_key_type_to_yojson x.private_key);
      ("CertificateChain", option_to_yojson certificate_chain_type_to_yojson x.certificate_chain);
      ("Certificate", Some (certificate_body_type_to_yojson x.certificate));
      ("Usage", Some (certificate_usage_type_to_yojson x.usage));
    ]

let identity_center_application_arn_to_yojson = string_to_yojson

let described_workflow_to_yojson (x : described_workflow) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("WorkflowId", option_to_yojson workflow_id_to_yojson x.workflow_id);
      ("OnExceptionSteps", option_to_yojson workflow_steps_to_yojson x.on_exception_steps);
      ("Steps", option_to_yojson workflow_steps_to_yojson x.steps);
      ("Description", option_to_yojson workflow_description_to_yojson x.description);
      ("Arn", Some (arn_to_yojson x.arn));
    ]

let described_web_app_vpc_config_to_yojson (x : described_web_app_vpc_config) =
  assoc_to_yojson
    [
      ("VpcEndpointId", option_to_yojson vpc_endpoint_id_to_yojson x.vpc_endpoint_id);
      ("VpcId", option_to_yojson vpc_id_to_yojson x.vpc_id);
      ("SubnetIds", option_to_yojson subnet_ids_to_yojson x.subnet_ids);
    ]

let described_identity_center_config_to_yojson (x : described_identity_center_config) =
  assoc_to_yojson
    [
      ("Role", option_to_yojson role_to_yojson x.role);
      ("InstanceArn", option_to_yojson identity_center_instance_arn_to_yojson x.instance_arn);
      ( "ApplicationArn",
        option_to_yojson identity_center_application_arn_to_yojson x.application_arn );
    ]

let described_web_app_identity_provider_details_to_yojson
    (x : described_web_app_identity_provider_details) =
  match x with
  | IdentityCenterConfig arg ->
      assoc_to_yojson
        [ ("IdentityCenterConfig", Some (described_identity_center_config_to_yojson arg)) ]

let described_web_app_endpoint_details_to_yojson (x : described_web_app_endpoint_details) =
  match x with
  | Vpc arg -> assoc_to_yojson [ ("Vpc", Some (described_web_app_vpc_config_to_yojson arg)) ]

let described_web_app_customization_to_yojson (x : described_web_app_customization) =
  assoc_to_yojson
    [
      ("FaviconFile", option_to_yojson web_app_favicon_file_to_yojson x.favicon_file);
      ("LogoFile", option_to_yojson web_app_logo_file_to_yojson x.logo_file);
      ("Title", option_to_yojson web_app_title_to_yojson x.title);
      ("WebAppId", Some (web_app_id_to_yojson x.web_app_id));
      ("Arn", Some (arn_to_yojson x.arn));
    ]

let described_web_app_to_yojson (x : described_web_app) =
  assoc_to_yojson
    [
      ( "DescribedEndpointDetails",
        option_to_yojson described_web_app_endpoint_details_to_yojson x.described_endpoint_details
      );
      ("EndpointType", option_to_yojson web_app_endpoint_type_to_yojson x.endpoint_type);
      ( "WebAppEndpointPolicy",
        option_to_yojson web_app_endpoint_policy_to_yojson x.web_app_endpoint_policy );
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("WebAppUnits", option_to_yojson web_app_units_to_yojson x.web_app_units);
      ("WebAppEndpoint", option_to_yojson web_app_endpoint_to_yojson x.web_app_endpoint);
      ("AccessEndpoint", option_to_yojson web_app_access_endpoint_to_yojson x.access_endpoint);
      ( "DescribedIdentityProviderDetails",
        option_to_yojson described_web_app_identity_provider_details_to_yojson
          x.described_identity_provider_details );
      ("WebAppId", Some (web_app_id_to_yojson x.web_app_id));
      ("Arn", Some (arn_to_yojson x.arn));
    ]

let described_user_to_yojson (x : described_user) =
  assoc_to_yojson
    [
      ("UserName", option_to_yojson user_name_to_yojson x.user_name);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("SshPublicKeys", option_to_yojson ssh_public_keys_to_yojson x.ssh_public_keys);
      ("Role", option_to_yojson role_to_yojson x.role);
      ("PosixProfile", option_to_yojson posix_profile_to_yojson x.posix_profile);
      ("Policy", option_to_yojson policy_to_yojson x.policy);
      ("HomeDirectoryType", option_to_yojson home_directory_type_to_yojson x.home_directory_type);
      ( "HomeDirectoryMappings",
        option_to_yojson home_directory_mappings_to_yojson x.home_directory_mappings );
      ("HomeDirectory", option_to_yojson home_directory_to_yojson x.home_directory);
      ("Arn", Some (arn_to_yojson x.arn));
    ]

let described_server_to_yojson (x : described_server) =
  assoc_to_yojson
    [
      ("IpAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ( "As2ServiceManagedEgressIpAddresses",
        option_to_yojson service_managed_egress_ip_addresses_to_yojson
          x.as2_service_managed_egress_ip_addresses );
      ("S3StorageOptions", option_to_yojson s3_storage_options_to_yojson x.s3_storage_options);
      ( "StructuredLogDestinations",
        option_to_yojson structured_log_destinations_to_yojson x.structured_log_destinations );
      ("WorkflowDetails", option_to_yojson workflow_details_to_yojson x.workflow_details);
      ("UserCount", option_to_yojson user_count_to_yojson x.user_count);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("State", option_to_yojson state_to_yojson x.state);
      ("ServerId", option_to_yojson server_id_to_yojson x.server_id);
      ("SecurityPolicyName", option_to_yojson security_policy_name_to_yojson x.security_policy_name);
      ("Protocols", option_to_yojson protocols_to_yojson x.protocols);
      ( "PreAuthenticationLoginBanner",
        option_to_yojson pre_authentication_login_banner_to_yojson x.pre_authentication_login_banner
      );
      ( "PostAuthenticationLoginBanner",
        option_to_yojson post_authentication_login_banner_to_yojson
          x.post_authentication_login_banner );
      ("LoggingRole", option_to_yojson nullable_role_to_yojson x.logging_role);
      ( "IdentityProviderType",
        option_to_yojson identity_provider_type_to_yojson x.identity_provider_type );
      ( "IdentityProviderDetails",
        option_to_yojson identity_provider_details_to_yojson x.identity_provider_details );
      ("HostKeyFingerprint", option_to_yojson host_key_fingerprint_to_yojson x.host_key_fingerprint);
      ("EndpointType", option_to_yojson endpoint_type_to_yojson x.endpoint_type);
      ("EndpointDetails", option_to_yojson endpoint_details_to_yojson x.endpoint_details);
      ("Domain", option_to_yojson domain_to_yojson x.domain);
      ("ProtocolDetails", option_to_yojson protocol_details_to_yojson x.protocol_details);
      ("Certificate", option_to_yojson certificate_to_yojson x.certificate);
      ("Arn", Some (arn_to_yojson x.arn));
    ]

let described_profile_to_yojson (x : described_profile) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("CertificateIds", option_to_yojson certificate_ids_to_yojson x.certificate_ids);
      ("As2Id", option_to_yojson as2_id_to_yojson x.as2_id);
      ("ProfileType", option_to_yojson profile_type_to_yojson x.profile_type);
      ("ProfileId", option_to_yojson profile_id_to_yojson x.profile_id);
      ("Arn", Some (arn_to_yojson x.arn));
    ]

let described_connector_vpc_lattice_egress_config_to_yojson
    (x : described_connector_vpc_lattice_egress_config) =
  assoc_to_yojson
    [
      ("PortNumber", option_to_yojson sftp_port_to_yojson x.port_number);
      ( "ResourceConfigurationArn",
        Some (vpc_lattice_resource_configuration_arn_to_yojson x.resource_configuration_arn) );
    ]

let described_connector_egress_config_to_yojson (x : described_connector_egress_config) =
  match x with
  | VpcLattice arg ->
      assoc_to_yojson
        [ ("VpcLattice", Some (described_connector_vpc_lattice_egress_config_to_yojson arg)) ]

let connector_egress_type_to_yojson (x : connector_egress_type) =
  match x with VPC_LATTICE -> `String "VPC_LATTICE" | SERVICE_MANAGED -> `String "SERVICE_MANAGED"

let connector_error_message_to_yojson = string_to_yojson

let connector_status_to_yojson (x : connector_status) =
  match x with
  | PENDING -> `String "PENDING"
  | ERRORED -> `String "ERRORED"
  | ACTIVE -> `String "ACTIVE"

let described_connector_to_yojson (x : described_connector) =
  assoc_to_yojson
    [
      ("IpAddressType", option_to_yojson connectors_ip_address_type_to_yojson x.ip_address_type);
      ("Status", Some (connector_status_to_yojson x.status));
      ("ErrorMessage", option_to_yojson connector_error_message_to_yojson x.error_message);
      ("EgressType", Some (connector_egress_type_to_yojson x.egress_type));
      ("EgressConfig", option_to_yojson described_connector_egress_config_to_yojson x.egress_config);
      ( "SecurityPolicyName",
        option_to_yojson connector_security_policy_name_to_yojson x.security_policy_name );
      ( "ServiceManagedEgressIpAddresses",
        option_to_yojson service_managed_egress_ip_addresses_to_yojson
          x.service_managed_egress_ip_addresses );
      ("SftpConfig", option_to_yojson sftp_connector_config_to_yojson x.sftp_config);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("LoggingRole", option_to_yojson role_to_yojson x.logging_role);
      ("AccessRole", option_to_yojson role_to_yojson x.access_role);
      ("As2Config", option_to_yojson as2_connector_config_to_yojson x.as2_config);
      ("Url", option_to_yojson url_to_yojson x.url);
      ("ConnectorId", option_to_yojson connector_id_to_yojson x.connector_id);
      ("Arn", Some (arn_to_yojson x.arn));
    ]

let cert_serial_to_yojson = string_to_yojson

let described_certificate_to_yojson (x : described_certificate) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Type", option_to_yojson certificate_type_to_yojson x.type_);
      ("NotAfterDate", option_to_yojson cert_date_to_yojson x.not_after_date);
      ("NotBeforeDate", option_to_yojson cert_date_to_yojson x.not_before_date);
      ("Serial", option_to_yojson cert_serial_to_yojson x.serial);
      ("InactiveDate", option_to_yojson cert_date_to_yojson x.inactive_date);
      ("ActiveDate", option_to_yojson cert_date_to_yojson x.active_date);
      ("CertificateChain", option_to_yojson certificate_chain_type_to_yojson x.certificate_chain);
      ("Certificate", option_to_yojson certificate_body_type_to_yojson x.certificate);
      ("Status", option_to_yojson certificate_status_type_to_yojson x.status);
      ("Usage", option_to_yojson certificate_usage_type_to_yojson x.usage);
      ("CertificateId", option_to_yojson certificate_id_to_yojson x.certificate_id);
      ("Arn", Some (arn_to_yojson x.arn));
    ]

let described_agreement_to_yojson (x : described_agreement) =
  assoc_to_yojson
    [
      ("CustomDirectories", option_to_yojson custom_directories_type_to_yojson x.custom_directories);
      ( "EnforceMessageSigning",
        option_to_yojson enforce_message_signing_type_to_yojson x.enforce_message_signing );
      ("PreserveFilename", option_to_yojson preserve_filename_type_to_yojson x.preserve_filename);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("AccessRole", option_to_yojson role_to_yojson x.access_role);
      ("BaseDirectory", option_to_yojson home_directory_to_yojson x.base_directory);
      ("PartnerProfileId", option_to_yojson profile_id_to_yojson x.partner_profile_id);
      ("LocalProfileId", option_to_yojson profile_id_to_yojson x.local_profile_id);
      ("ServerId", option_to_yojson server_id_to_yojson x.server_id);
      ("Status", option_to_yojson agreement_status_type_to_yojson x.status);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("AgreementId", option_to_yojson agreement_id_to_yojson x.agreement_id);
      ("Arn", Some (arn_to_yojson x.arn));
    ]

let describe_workflow_response_to_yojson (x : describe_workflow_response) =
  assoc_to_yojson [ ("Workflow", Some (described_workflow_to_yojson x.workflow)) ]

let describe_workflow_request_to_yojson (x : describe_workflow_request) =
  assoc_to_yojson [ ("WorkflowId", Some (workflow_id_to_yojson x.workflow_id)) ]

let describe_web_app_response_to_yojson (x : describe_web_app_response) =
  assoc_to_yojson [ ("WebApp", Some (described_web_app_to_yojson x.web_app)) ]

let describe_web_app_request_to_yojson (x : describe_web_app_request) =
  assoc_to_yojson [ ("WebAppId", Some (web_app_id_to_yojson x.web_app_id)) ]

let describe_web_app_customization_response_to_yojson (x : describe_web_app_customization_response)
    =
  assoc_to_yojson
    [
      ( "WebAppCustomization",
        Some (described_web_app_customization_to_yojson x.web_app_customization) );
    ]

let describe_web_app_customization_request_to_yojson (x : describe_web_app_customization_request) =
  assoc_to_yojson [ ("WebAppId", Some (web_app_id_to_yojson x.web_app_id)) ]

let describe_user_response_to_yojson (x : describe_user_response) =
  assoc_to_yojson
    [
      ("User", Some (described_user_to_yojson x.user));
      ("ServerId", Some (server_id_to_yojson x.server_id));
    ]

let describe_user_request_to_yojson (x : describe_user_request) =
  assoc_to_yojson
    [
      ("UserName", Some (user_name_to_yojson x.user_name));
      ("ServerId", Some (server_id_to_yojson x.server_id));
    ]

let describe_server_response_to_yojson (x : describe_server_response) =
  assoc_to_yojson [ ("Server", Some (described_server_to_yojson x.server)) ]

let describe_server_request_to_yojson (x : describe_server_request) =
  assoc_to_yojson [ ("ServerId", Some (server_id_to_yojson x.server_id)) ]

let describe_profile_response_to_yojson (x : describe_profile_response) =
  assoc_to_yojson [ ("Profile", Some (described_profile_to_yojson x.profile)) ]

let describe_profile_request_to_yojson (x : describe_profile_request) =
  assoc_to_yojson [ ("ProfileId", Some (profile_id_to_yojson x.profile_id)) ]

let describe_connector_response_to_yojson (x : describe_connector_response) =
  assoc_to_yojson [ ("Connector", Some (described_connector_to_yojson x.connector)) ]

let describe_connector_request_to_yojson (x : describe_connector_request) =
  assoc_to_yojson [ ("ConnectorId", Some (connector_id_to_yojson x.connector_id)) ]

let describe_certificate_response_to_yojson (x : describe_certificate_response) =
  assoc_to_yojson [ ("Certificate", Some (described_certificate_to_yojson x.certificate)) ]

let describe_certificate_request_to_yojson (x : describe_certificate_request) =
  assoc_to_yojson [ ("CertificateId", Some (certificate_id_to_yojson x.certificate_id)) ]

let describe_agreement_response_to_yojson (x : describe_agreement_response) =
  assoc_to_yojson [ ("Agreement", Some (described_agreement_to_yojson x.agreement)) ]

let describe_agreement_request_to_yojson (x : describe_agreement_request) =
  assoc_to_yojson
    [
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("AgreementId", Some (agreement_id_to_yojson x.agreement_id));
    ]

let delete_workflow_request_to_yojson (x : delete_workflow_request) =
  assoc_to_yojson [ ("WorkflowId", Some (workflow_id_to_yojson x.workflow_id)) ]

let delete_web_app_request_to_yojson (x : delete_web_app_request) =
  assoc_to_yojson [ ("WebAppId", Some (web_app_id_to_yojson x.web_app_id)) ]

let delete_web_app_customization_request_to_yojson (x : delete_web_app_customization_request) =
  assoc_to_yojson [ ("WebAppId", Some (web_app_id_to_yojson x.web_app_id)) ]

let delete_user_request_to_yojson (x : delete_user_request) =
  assoc_to_yojson
    [
      ("UserName", Some (user_name_to_yojson x.user_name));
      ("ServerId", Some (server_id_to_yojson x.server_id));
    ]

let delete_server_request_to_yojson (x : delete_server_request) =
  assoc_to_yojson [ ("ServerId", Some (server_id_to_yojson x.server_id)) ]

let delete_profile_request_to_yojson (x : delete_profile_request) =
  assoc_to_yojson [ ("ProfileId", Some (profile_id_to_yojson x.profile_id)) ]

let delete_connector_request_to_yojson (x : delete_connector_request) =
  assoc_to_yojson [ ("ConnectorId", Some (connector_id_to_yojson x.connector_id)) ]

let delete_certificate_request_to_yojson (x : delete_certificate_request) =
  assoc_to_yojson [ ("CertificateId", Some (certificate_id_to_yojson x.certificate_id)) ]

let delete_agreement_request_to_yojson (x : delete_agreement_request) =
  assoc_to_yojson
    [
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("AgreementId", Some (agreement_id_to_yojson x.agreement_id));
    ]

let create_workflow_response_to_yojson (x : create_workflow_response) =
  assoc_to_yojson [ ("WorkflowId", Some (workflow_id_to_yojson x.workflow_id)) ]

let create_workflow_request_to_yojson (x : create_workflow_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("OnExceptionSteps", option_to_yojson workflow_steps_to_yojson x.on_exception_steps);
      ("Steps", Some (workflow_steps_to_yojson x.steps));
      ("Description", option_to_yojson workflow_description_to_yojson x.description);
    ]

let create_web_app_response_to_yojson (x : create_web_app_response) =
  assoc_to_yojson [ ("WebAppId", Some (web_app_id_to_yojson x.web_app_id)) ]

let create_web_app_request_to_yojson (x : create_web_app_request) =
  assoc_to_yojson
    [
      ("EndpointDetails", option_to_yojson web_app_endpoint_details_to_yojson x.endpoint_details);
      ( "WebAppEndpointPolicy",
        option_to_yojson web_app_endpoint_policy_to_yojson x.web_app_endpoint_policy );
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("WebAppUnits", option_to_yojson web_app_units_to_yojson x.web_app_units);
      ("AccessEndpoint", option_to_yojson web_app_access_endpoint_to_yojson x.access_endpoint);
      ( "IdentityProviderDetails",
        Some (web_app_identity_provider_details_to_yojson x.identity_provider_details) );
    ]

let create_user_response_to_yojson (x : create_user_response) =
  assoc_to_yojson
    [
      ("UserName", Some (user_name_to_yojson x.user_name));
      ("ServerId", Some (server_id_to_yojson x.server_id));
    ]

let create_user_request_to_yojson (x : create_user_request) =
  assoc_to_yojson
    [
      ("UserName", Some (user_name_to_yojson x.user_name));
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("SshPublicKeyBody", option_to_yojson ssh_public_key_body_to_yojson x.ssh_public_key_body);
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("Role", Some (role_to_yojson x.role));
      ("PosixProfile", option_to_yojson posix_profile_to_yojson x.posix_profile);
      ("Policy", option_to_yojson policy_to_yojson x.policy);
      ( "HomeDirectoryMappings",
        option_to_yojson home_directory_mappings_to_yojson x.home_directory_mappings );
      ("HomeDirectoryType", option_to_yojson home_directory_type_to_yojson x.home_directory_type);
      ("HomeDirectory", option_to_yojson home_directory_to_yojson x.home_directory);
    ]

let create_server_response_to_yojson (x : create_server_response) =
  assoc_to_yojson [ ("ServerId", Some (server_id_to_yojson x.server_id)) ]

let create_server_request_to_yojson (x : create_server_request) =
  assoc_to_yojson
    [
      ("IpAddressType", option_to_yojson ip_address_type_to_yojson x.ip_address_type);
      ("S3StorageOptions", option_to_yojson s3_storage_options_to_yojson x.s3_storage_options);
      ( "StructuredLogDestinations",
        option_to_yojson structured_log_destinations_to_yojson x.structured_log_destinations );
      ("WorkflowDetails", option_to_yojson workflow_details_to_yojson x.workflow_details);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("SecurityPolicyName", option_to_yojson security_policy_name_to_yojson x.security_policy_name);
      ("ProtocolDetails", option_to_yojson protocol_details_to_yojson x.protocol_details);
      ("Protocols", option_to_yojson protocols_to_yojson x.protocols);
      ( "PreAuthenticationLoginBanner",
        option_to_yojson pre_authentication_login_banner_to_yojson x.pre_authentication_login_banner
      );
      ( "PostAuthenticationLoginBanner",
        option_to_yojson post_authentication_login_banner_to_yojson
          x.post_authentication_login_banner );
      ("LoggingRole", option_to_yojson nullable_role_to_yojson x.logging_role);
      ( "IdentityProviderType",
        option_to_yojson identity_provider_type_to_yojson x.identity_provider_type );
      ( "IdentityProviderDetails",
        option_to_yojson identity_provider_details_to_yojson x.identity_provider_details );
      ("HostKey", option_to_yojson host_key_to_yojson x.host_key);
      ("EndpointType", option_to_yojson endpoint_type_to_yojson x.endpoint_type);
      ("EndpointDetails", option_to_yojson endpoint_details_to_yojson x.endpoint_details);
      ("Domain", option_to_yojson domain_to_yojson x.domain);
      ("Certificate", option_to_yojson certificate_to_yojson x.certificate);
    ]

let create_profile_response_to_yojson (x : create_profile_response) =
  assoc_to_yojson [ ("ProfileId", Some (profile_id_to_yojson x.profile_id)) ]

let create_profile_request_to_yojson (x : create_profile_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("CertificateIds", option_to_yojson certificate_ids_to_yojson x.certificate_ids);
      ("ProfileType", Some (profile_type_to_yojson x.profile_type));
      ("As2Id", Some (as2_id_to_yojson x.as2_id));
    ]

let create_connector_response_to_yojson (x : create_connector_response) =
  assoc_to_yojson [ ("ConnectorId", Some (connector_id_to_yojson x.connector_id)) ]

let connector_vpc_lattice_egress_config_to_yojson (x : connector_vpc_lattice_egress_config) =
  assoc_to_yojson
    [
      ("PortNumber", option_to_yojson sftp_port_to_yojson x.port_number);
      ( "ResourceConfigurationArn",
        Some (vpc_lattice_resource_configuration_arn_to_yojson x.resource_configuration_arn) );
    ]

let connector_egress_config_to_yojson (x : connector_egress_config) =
  match x with
  | VpcLattice arg ->
      assoc_to_yojson [ ("VpcLattice", Some (connector_vpc_lattice_egress_config_to_yojson arg)) ]

let create_connector_request_to_yojson (x : create_connector_request) =
  assoc_to_yojson
    [
      ("IpAddressType", option_to_yojson connectors_ip_address_type_to_yojson x.ip_address_type);
      ("EgressConfig", option_to_yojson connector_egress_config_to_yojson x.egress_config);
      ( "SecurityPolicyName",
        option_to_yojson connector_security_policy_name_to_yojson x.security_policy_name );
      ("SftpConfig", option_to_yojson sftp_connector_config_to_yojson x.sftp_config);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("LoggingRole", option_to_yojson role_to_yojson x.logging_role);
      ("AccessRole", Some (role_to_yojson x.access_role));
      ("As2Config", option_to_yojson as2_connector_config_to_yojson x.as2_config);
      ("Url", option_to_yojson url_to_yojson x.url);
    ]

let create_agreement_response_to_yojson (x : create_agreement_response) =
  assoc_to_yojson [ ("AgreementId", Some (agreement_id_to_yojson x.agreement_id)) ]

let create_agreement_request_to_yojson (x : create_agreement_request) =
  assoc_to_yojson
    [
      ("CustomDirectories", option_to_yojson custom_directories_type_to_yojson x.custom_directories);
      ( "EnforceMessageSigning",
        option_to_yojson enforce_message_signing_type_to_yojson x.enforce_message_signing );
      ("PreserveFilename", option_to_yojson preserve_filename_type_to_yojson x.preserve_filename);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("Status", option_to_yojson agreement_status_type_to_yojson x.status);
      ("AccessRole", Some (role_to_yojson x.access_role));
      ("BaseDirectory", option_to_yojson home_directory_to_yojson x.base_directory);
      ("PartnerProfileId", Some (profile_id_to_yojson x.partner_profile_id));
      ("LocalProfileId", Some (profile_id_to_yojson x.local_profile_id));
      ("ServerId", Some (server_id_to_yojson x.server_id));
      ("Description", option_to_yojson description_to_yojson x.description);
    ]
