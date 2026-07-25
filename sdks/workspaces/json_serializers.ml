open Smaws_Lib.Json.SerializeHelpers
open Types

let aga_mode_for_directory_enum_to_yojson (x : aga_mode_for_directory_enum) =
  match x with ENABLED_AUTO -> `String "ENABLED_AUTO" | DISABLED -> `String "DISABLED"

let aga_mode_for_work_space_enum_to_yojson (x : aga_mode_for_work_space_enum) =
  match x with
  | ENABLED_AUTO -> `String "ENABLED_AUTO"
  | DISABLED -> `String "DISABLED"
  | INHERITED -> `String "INHERITED"

let aga_preferred_protocol_for_directory_to_yojson (x : aga_preferred_protocol_for_directory) =
  match x with TCP -> `String "TCP" | NONE -> `String "NONE"

let aga_preferred_protocol_for_work_space_to_yojson (x : aga_preferred_protocol_for_work_space) =
  match x with TCP -> `String "TCP" | NONE -> `String "NONE" | INHERITED -> `String "INHERITED"

let ar_n_to_yojson = string_to_yojson
let exception_message_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let non_empty_string_to_yojson = string_to_yojson

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson exception_message_to_yojson x.message);
      ("ResourceId", option_to_yojson non_empty_string_to_yojson x.resource_id);
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let aws_account_to_yojson = string_to_yojson

let account_link_status_enum_to_yojson (x : account_link_status_enum) =
  match x with
  | LINKED -> `String "LINKED"
  | LINKING_FAILED -> `String "LINKING_FAILED"
  | LINK_NOT_FOUND -> `String "LINK_NOT_FOUND"
  | PENDING_ACCEPTANCE_BY_TARGET_ACCOUNT -> `String "PENDING_ACCEPTANCE_BY_TARGET_ACCOUNT"
  | REJECTED -> `String "REJECTED"

let link_id_to_yojson = string_to_yojson

let account_link_to_yojson (x : account_link) =
  assoc_to_yojson
    [
      ("AccountLinkId", option_to_yojson link_id_to_yojson x.account_link_id);
      ( "AccountLinkStatus",
        option_to_yojson account_link_status_enum_to_yojson x.account_link_status );
      ("SourceAccountId", option_to_yojson aws_account_to_yojson x.source_account_id);
      ("TargetAccountId", option_to_yojson aws_account_to_yojson x.target_account_id);
    ]

let accept_account_link_invitation_result_to_yojson (x : accept_account_link_invitation_result) =
  assoc_to_yojson [ ("AccountLink", option_to_yojson account_link_to_yojson x.account_link) ]

let client_token_to_yojson = string_to_yojson

let accept_account_link_invitation_request_to_yojson (x : accept_account_link_invitation_request) =
  assoc_to_yojson
    [
      ("LinkId", Some (link_id_to_yojson x.link_id));
      ("ClientToken", option_to_yojson client_token_to_yojson x.client_token);
    ]

let alphanumeric_dash_underscore_non_empty_string_to_yojson = string_to_yojson

let access_endpoint_type_to_yojson (x : access_endpoint_type) =
  match x with STREAMING_WSP -> `String "STREAMING_WSP"

let access_endpoint_to_yojson (x : access_endpoint) =
  assoc_to_yojson
    [
      ("AccessEndpointType", option_to_yojson access_endpoint_type_to_yojson x.access_endpoint_type);
      ( "VpcEndpointId",
        option_to_yojson alphanumeric_dash_underscore_non_empty_string_to_yojson x.vpc_endpoint_id
      );
    ]

let internet_fallback_protocol_to_yojson (x : internet_fallback_protocol) =
  match x with PCOIP -> `String "PCOIP"

let internet_fallback_protocol_list_to_yojson tree =
  list_to_yojson internet_fallback_protocol_to_yojson tree

let access_endpoint_list_to_yojson tree = list_to_yojson access_endpoint_to_yojson tree

let access_endpoint_config_to_yojson (x : access_endpoint_config) =
  assoc_to_yojson
    [
      ("AccessEndpoints", Some (access_endpoint_list_to_yojson x.access_endpoints));
      ( "InternetFallbackProtocols",
        option_to_yojson internet_fallback_protocol_list_to_yojson x.internet_fallback_protocols );
    ]

let access_property_value_to_yojson (x : access_property_value) =
  match x with ALLOW -> `String "ALLOW" | DENY -> `String "DENY"

let account_link_list_to_yojson tree = list_to_yojson account_link_to_yojson tree
let description_to_yojson = string_to_yojson
let workspace_error_code_to_yojson = string_to_yojson
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let dedicated_tenancy_management_cidr_range_to_yojson = string_to_yojson

let dedicated_tenancy_support_result_enum_to_yojson (x : dedicated_tenancy_support_result_enum) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let dedicated_tenancy_modification_state_enum_to_yojson
    (x : dedicated_tenancy_modification_state_enum) =
  match x with
  | PENDING -> `String "PENDING"
  | COMPLETED -> `String "COMPLETED"
  | FAILED -> `String "FAILED"

let account_modification_to_yojson (x : account_modification) =
  assoc_to_yojson
    [
      ( "ModificationState",
        option_to_yojson dedicated_tenancy_modification_state_enum_to_yojson x.modification_state );
      ( "DedicatedTenancySupport",
        option_to_yojson dedicated_tenancy_support_result_enum_to_yojson x.dedicated_tenancy_support
      );
      ( "DedicatedTenancyManagementCidrRange",
        option_to_yojson dedicated_tenancy_management_cidr_range_to_yojson
          x.dedicated_tenancy_management_cidr_range );
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("ErrorCode", option_to_yojson workspace_error_code_to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson description_to_yojson x.error_message);
    ]

let account_modification_list_to_yojson tree = list_to_yojson account_modification_to_yojson tree
let secrets_manager_arn_to_yojson = string_to_yojson
let domain_name_to_yojson = string_to_yojson

let active_directory_config_to_yojson (x : active_directory_config) =
  assoc_to_yojson
    [
      ("DomainName", Some (domain_name_to_yojson x.domain_name));
      ("ServiceAccountSecretArn", Some (secrets_manager_arn_to_yojson x.service_account_secret_arn));
    ]

let active_user_sessions_to_yojson = int_to_yojson
let actual_user_sessions_to_yojson = int_to_yojson
let add_in_name_to_yojson = string_to_yojson
let add_in_url_to_yojson = string_to_yojson
let alias_to_yojson = string_to_yojson
let amazon_uuid_to_yojson = string_to_yojson

let application_to_yojson (x : application) =
  match x with
  | Microsoft_Office_2016 -> `String "Microsoft_Office_2016"
  | Microsoft_Office_2019 -> `String "Microsoft_Office_2019"

let application_associated_resource_type_to_yojson (x : application_associated_resource_type) =
  match x with
  | WORKSPACE -> `String "WORKSPACE"
  | BUNDLE -> `String "BUNDLE"
  | IMAGE -> `String "IMAGE"

let application_associated_resource_type_list_to_yojson tree =
  list_to_yojson application_associated_resource_type_to_yojson tree

let application_list_to_yojson tree = list_to_yojson application_to_yojson tree
let application_not_supported_exception_to_yojson = unit_to_yojson
let string2048_to_yojson = string_to_yojson

let association_error_code_to_yojson (x : association_error_code) =
  match x with
  | INSUFFICIENT_DISKSPACE -> `String "ValidationError.InsufficientDiskSpace"
  | INSUFFICIENT_MEMORY -> `String "ValidationError.InsufficientMemory"
  | UNSUPPORTED_OPERATING_SYSTEM -> `String "ValidationError.UnsupportedOperatingSystem"
  | INTERNAL_SERVER_ERROR -> `String "DeploymentError.InternalServerError"
  | WORKSPACE_UNREACHABLE -> `String "DeploymentError.WorkspaceUnreachable"
  | APPLICATION_OLDVERSIONEXIST_FAILURE -> `String "ValidationError.ApplicationOldVersionExists"

let association_state_reason_to_yojson (x : association_state_reason) =
  assoc_to_yojson
    [
      ("ErrorCode", option_to_yojson association_error_code_to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson string2048_to_yojson x.error_message);
    ]

let association_state_to_yojson (x : association_state) =
  match x with
  | PENDING_INSTALL -> `String "PENDING_INSTALL"
  | PENDING_INSTALL_DEPLOYMENT -> `String "PENDING_INSTALL_DEPLOYMENT"
  | PENDING_UNINSTALL -> `String "PENDING_UNINSTALL"
  | PENDING_UNINSTALL_DEPLOYMENT -> `String "PENDING_UNINSTALL_DEPLOYMENT"
  | INSTALLING -> `String "INSTALLING"
  | UNINSTALLING -> `String "UNINSTALLING"
  | ERROR -> `String "ERROR"
  | COMPLETED -> `String "COMPLETED"
  | REMOVED -> `String "REMOVED"

let work_space_application_id_to_yojson = string_to_yojson

let application_resource_association_to_yojson (x : application_resource_association) =
  assoc_to_yojson
    [
      ("ApplicationId", option_to_yojson work_space_application_id_to_yojson x.application_id);
      ("AssociatedResourceId", option_to_yojson non_empty_string_to_yojson x.associated_resource_id);
      ( "AssociatedResourceType",
        option_to_yojson application_associated_resource_type_to_yojson x.associated_resource_type
      );
      ("Created", option_to_yojson timestamp_to_yojson x.created);
      ("LastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("State", option_to_yojson association_state_to_yojson x.state);
      ("StateReason", option_to_yojson association_state_reason_to_yojson x.state_reason);
    ]

let application_resource_association_list_to_yojson tree =
  list_to_yojson application_resource_association_to_yojson tree

let settings_group_to_yojson = string_to_yojson

let application_settings_status_enum_to_yojson (x : application_settings_status_enum) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let application_settings_request_to_yojson (x : application_settings_request) =
  assoc_to_yojson
    [
      ("Status", Some (application_settings_status_enum_to_yojson x.status));
      ("SettingsGroup", option_to_yojson settings_group_to_yojson x.settings_group);
    ]

let s3_bucket_name_to_yojson = string_to_yojson

let application_settings_response_to_yojson (x : application_settings_response) =
  assoc_to_yojson
    [
      ("Status", Some (application_settings_status_enum_to_yojson x.status));
      ("SettingsGroup", option_to_yojson settings_group_to_yojson x.settings_group);
      ("S3BucketName", option_to_yojson s3_bucket_name_to_yojson x.s3_bucket_name);
    ]

let resource_associated_exception_to_yojson (x : resource_associated_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let exception_error_code_to_yojson = string_to_yojson

let operation_not_supported_exception_to_yojson (x : operation_not_supported_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson exception_message_to_yojson x.message);
      ("reason", option_to_yojson exception_error_code_to_yojson x.reason);
    ]

let invalid_resource_state_exception_to_yojson (x : invalid_resource_state_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_parameter_values_exception_to_yojson (x : invalid_parameter_values_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let connection_identifier_to_yojson = string_to_yojson

let associate_connection_alias_result_to_yojson (x : associate_connection_alias_result) =
  assoc_to_yojson
    [
      ( "ConnectionIdentifier",
        option_to_yojson connection_identifier_to_yojson x.connection_identifier );
    ]

let connection_alias_id_to_yojson = string_to_yojson

let associate_connection_alias_request_to_yojson (x : associate_connection_alias_request) =
  assoc_to_yojson
    [
      ("AliasId", Some (connection_alias_id_to_yojson x.alias_id));
      ("ResourceId", Some (non_empty_string_to_yojson x.resource_id));
    ]

let resource_limit_exceeded_exception_to_yojson (x : resource_limit_exceeded_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let associate_ip_groups_result_to_yojson = unit_to_yojson
let ip_group_id_to_yojson = string_to_yojson
let ip_group_id_list_to_yojson tree = list_to_yojson ip_group_id_to_yojson tree
let directory_id_to_yojson = string_to_yojson

let associate_ip_groups_request_to_yojson (x : associate_ip_groups_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("GroupIds", Some (ip_group_id_list_to_yojson x.group_ids));
    ]

let resource_in_use_exception_to_yojson (x : resource_in_use_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson exception_message_to_yojson x.message);
      ("ResourceId", option_to_yojson non_empty_string_to_yojson x.resource_id);
    ]

let resource_already_exists_exception_to_yojson (x : resource_already_exists_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let operating_system_not_compatible_exception_to_yojson = unit_to_yojson
let incompatible_applications_exception_to_yojson = unit_to_yojson
let compute_not_compatible_exception_to_yojson = unit_to_yojson
let workspace_id_to_yojson = string_to_yojson

let work_space_associated_resource_type_to_yojson (x : work_space_associated_resource_type) =
  match x with APPLICATION -> `String "APPLICATION"

let workspace_resource_association_to_yojson (x : workspace_resource_association) =
  assoc_to_yojson
    [
      ("AssociatedResourceId", option_to_yojson non_empty_string_to_yojson x.associated_resource_id);
      ( "AssociatedResourceType",
        option_to_yojson work_space_associated_resource_type_to_yojson x.associated_resource_type );
      ("Created", option_to_yojson timestamp_to_yojson x.created);
      ("LastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("State", option_to_yojson association_state_to_yojson x.state);
      ("StateReason", option_to_yojson association_state_reason_to_yojson x.state_reason);
      ("WorkspaceId", option_to_yojson workspace_id_to_yojson x.workspace_id);
    ]

let associate_workspace_application_result_to_yojson (x : associate_workspace_application_result) =
  assoc_to_yojson
    [ ("Association", option_to_yojson workspace_resource_association_to_yojson x.association) ]

let associate_workspace_application_request_to_yojson (x : associate_workspace_application_request)
    =
  assoc_to_yojson
    [
      ("WorkspaceId", Some (workspace_id_to_yojson x.workspace_id));
      ("ApplicationId", Some (work_space_application_id_to_yojson x.application_id));
    ]

let association_status_to_yojson (x : association_status) =
  match x with
  | NOT_ASSOCIATED -> `String "NOT_ASSOCIATED"
  | ASSOCIATED_WITH_OWNER_ACCOUNT -> `String "ASSOCIATED_WITH_OWNER_ACCOUNT"
  | ASSOCIATED_WITH_SHARED_ACCOUNT -> `String "ASSOCIATED_WITH_SHARED_ACCOUNT"
  | PENDING_ASSOCIATION -> `String "PENDING_ASSOCIATION"
  | PENDING_DISASSOCIATION -> `String "PENDING_DISASSOCIATION"

let authentication_type_to_yojson (x : authentication_type) = match x with SAML -> `String "SAML"
let authorize_ip_rules_result_to_yojson = unit_to_yojson
let ip_rule_desc_to_yojson = string_to_yojson
let ip_rule_to_yojson = string_to_yojson

let ip_rule_item_to_yojson (x : ip_rule_item) =
  assoc_to_yojson
    [
      ("ipRule", option_to_yojson ip_rule_to_yojson x.ip_rule);
      ("ruleDesc", option_to_yojson ip_rule_desc_to_yojson x.rule_desc);
    ]

let ip_rule_list_to_yojson tree = list_to_yojson ip_rule_item_to_yojson tree

let authorize_ip_rules_request_to_yojson (x : authorize_ip_rules_request) =
  assoc_to_yojson
    [
      ("GroupId", Some (ip_group_id_to_yojson x.group_id));
      ("UserRules", Some (ip_rule_list_to_yojson x.user_rules));
    ]

let available_user_sessions_to_yojson = int_to_yojson
let boolean_object_to_yojson = bool_to_yojson

let bundle_associated_resource_type_to_yojson (x : bundle_associated_resource_type) =
  match x with APPLICATION -> `String "APPLICATION"

let bundle_associated_resource_type_list_to_yojson tree =
  list_to_yojson bundle_associated_resource_type_to_yojson tree

let bundle_id_to_yojson = string_to_yojson
let bundle_id_list_to_yojson tree = list_to_yojson bundle_id_to_yojson tree

let bundle_type_to_yojson (x : bundle_type) =
  match x with REGULAR -> `String "REGULAR" | STANDBY -> `String "STANDBY"

let workspace_bundle_state_to_yojson (x : workspace_bundle_state) =
  match x with
  | AVAILABLE -> `String "AVAILABLE"
  | PENDING -> `String "PENDING"
  | ERROR -> `String "ERROR"

let compute_to_yojson (x : compute) =
  match x with
  | VALUE -> `String "VALUE"
  | STANDARD -> `String "STANDARD"
  | PERFORMANCE -> `String "PERFORMANCE"
  | POWER -> `String "POWER"
  | GRAPHICS -> `String "GRAPHICS"
  | POWERPRO -> `String "POWERPRO"
  | GENERALPURPOSE_4XLARGE -> `String "GENERALPURPOSE_4XLARGE"
  | GENERALPURPOSE_8XLARGE -> `String "GENERALPURPOSE_8XLARGE"
  | GRAPHICSPRO -> `String "GRAPHICSPRO"
  | GRAPHICS_G4DN -> `String "GRAPHICS_G4DN"
  | GRAPHICSPRO_G4DN -> `String "GRAPHICSPRO_G4DN"
  | GRAPHICS_G6_XLARGE -> `String "GRAPHICS_G6_XLARGE"
  | GRAPHICS_G6_2XLARGE -> `String "GRAPHICS_G6_2XLARGE"
  | GRAPHICS_G6_4XLARGE -> `String "GRAPHICS_G6_4XLARGE"
  | GRAPHICS_G6_8XLARGE -> `String "GRAPHICS_G6_8XLARGE"
  | GRAPHICS_G6_16XLARGE -> `String "GRAPHICS_G6_16XLARGE"
  | GRAPHICS_GR6_4XLARGE -> `String "GRAPHICS_GR6_4XLARGE"
  | GRAPHICS_GR6_8XLARGE -> `String "GRAPHICS_GR6_8XLARGE"
  | GRAPHICS_G6F_LARGE -> `String "GRAPHICS_G6F_LARGE"
  | GRAPHICS_G6F_XLARGE -> `String "GRAPHICS_G6F_XLARGE"
  | GRAPHICS_G6F_2XLARGE -> `String "GRAPHICS_G6F_2XLARGE"
  | GRAPHICS_G6F_4XLARGE -> `String "GRAPHICS_G6F_4XLARGE"
  | GRAPHICS_GR6F_4XLARGE -> `String "GRAPHICS_GR6F_4XLARGE"

let compute_type_to_yojson (x : compute_type) =
  assoc_to_yojson [ ("Name", option_to_yojson compute_to_yojson x.name) ]

let user_storage_to_yojson (x : user_storage) =
  assoc_to_yojson [ ("Capacity", Some (non_empty_string_to_yojson x.capacity)) ]

let root_storage_to_yojson (x : root_storage) =
  assoc_to_yojson [ ("Capacity", Some (non_empty_string_to_yojson x.capacity)) ]

let workspace_image_id_to_yojson = string_to_yojson
let bundle_owner_to_yojson = string_to_yojson

let workspace_bundle_to_yojson (x : workspace_bundle) =
  assoc_to_yojson
    [
      ("BundleId", option_to_yojson bundle_id_to_yojson x.bundle_id);
      ("Name", option_to_yojson non_empty_string_to_yojson x.name);
      ("Owner", option_to_yojson bundle_owner_to_yojson x.owner);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("ImageId", option_to_yojson workspace_image_id_to_yojson x.image_id);
      ("RootStorage", option_to_yojson root_storage_to_yojson x.root_storage);
      ("UserStorage", option_to_yojson user_storage_to_yojson x.user_storage);
      ("ComputeType", option_to_yojson compute_type_to_yojson x.compute_type);
      ("LastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("CreationTime", option_to_yojson timestamp_to_yojson x.creation_time);
      ("State", option_to_yojson workspace_bundle_state_to_yojson x.state);
      ("BundleType", option_to_yojson bundle_type_to_yojson x.bundle_type);
    ]

let bundle_list_to_yojson tree = list_to_yojson workspace_bundle_to_yojson tree

let bundle_resource_association_to_yojson (x : bundle_resource_association) =
  assoc_to_yojson
    [
      ("AssociatedResourceId", option_to_yojson non_empty_string_to_yojson x.associated_resource_id);
      ( "AssociatedResourceType",
        option_to_yojson bundle_associated_resource_type_to_yojson x.associated_resource_type );
      ("BundleId", option_to_yojson bundle_id_to_yojson x.bundle_id);
      ("Created", option_to_yojson timestamp_to_yojson x.created);
      ("LastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("State", option_to_yojson association_state_to_yojson x.state);
      ("StateReason", option_to_yojson association_state_reason_to_yojson x.state_reason);
    ]

let bundle_resource_association_list_to_yojson tree =
  list_to_yojson bundle_resource_association_to_yojson tree

let desired_user_sessions_to_yojson = int_to_yojson

let capacity_to_yojson (x : capacity) =
  assoc_to_yojson
    [ ("DesiredUserSessions", Some (desired_user_sessions_to_yojson x.desired_user_sessions)) ]

let capacity_status_to_yojson (x : capacity_status) =
  assoc_to_yojson
    [
      ("AvailableUserSessions", Some (available_user_sessions_to_yojson x.available_user_sessions));
      ("DesiredUserSessions", Some (desired_user_sessions_to_yojson x.desired_user_sessions));
      ("ActualUserSessions", Some (actual_user_sessions_to_yojson x.actual_user_sessions));
      ("ActiveUserSessions", Some (active_user_sessions_to_yojson x.active_user_sessions));
    ]

let certificate_authority_arn_to_yojson = string_to_yojson

let certificate_based_auth_status_enum_to_yojson (x : certificate_based_auth_status_enum) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let certificate_based_auth_properties_to_yojson (x : certificate_based_auth_properties) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson certificate_based_auth_status_enum_to_yojson x.status);
      ( "CertificateAuthorityArn",
        option_to_yojson certificate_authority_arn_to_yojson x.certificate_authority_arn );
    ]

let client_device_type_to_yojson (x : client_device_type) =
  match x with
  | DEVICE_TYPE_WINDOWS -> `String "DeviceTypeWindows"
  | DEVICE_TYPE_OSX -> `String "DeviceTypeOsx"
  | DEVICE_TYPE_ANDROID -> `String "DeviceTypeAndroid"
  | DEVICE_TYPE_IOS -> `String "DeviceTypeIos"
  | DEVICE_TYPE_LINUX -> `String "DeviceTypeLinux"
  | DEVICE_TYPE_WEB -> `String "DeviceTypeWeb"

let client_device_type_list_to_yojson tree = list_to_yojson client_device_type_to_yojson tree
let client_email_to_yojson = string_to_yojson
let client_locale_to_yojson = string_to_yojson
let client_login_message_to_yojson = string_to_yojson

let log_upload_enum_to_yojson (x : log_upload_enum) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let reconnect_enum_to_yojson (x : reconnect_enum) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let client_properties_to_yojson (x : client_properties) =
  assoc_to_yojson
    [
      ("ReconnectEnabled", option_to_yojson reconnect_enum_to_yojson x.reconnect_enabled);
      ("LogUploadEnabled", option_to_yojson log_upload_enum_to_yojson x.log_upload_enabled);
    ]

let client_properties_result_to_yojson (x : client_properties_result) =
  assoc_to_yojson
    [
      ("ResourceId", option_to_yojson non_empty_string_to_yojson x.resource_id);
      ("ClientProperties", option_to_yojson client_properties_to_yojson x.client_properties);
    ]

let client_properties_list_to_yojson tree = list_to_yojson client_properties_result_to_yojson tree
let client_url_to_yojson = string_to_yojson
let compute_list_to_yojson tree = list_to_yojson compute_to_yojson tree
let computer_name_to_yojson = string_to_yojson

let connect_client_add_in_to_yojson (x : connect_client_add_in) =
  assoc_to_yojson
    [
      ("AddInId", option_to_yojson amazon_uuid_to_yojson x.add_in_id);
      ("ResourceId", option_to_yojson directory_id_to_yojson x.resource_id);
      ("Name", option_to_yojson add_in_name_to_yojson x.name);
      ("URL", option_to_yojson add_in_url_to_yojson x.ur_l);
    ]

let connect_client_add_in_list_to_yojson tree = list_to_yojson connect_client_add_in_to_yojson tree

let connection_alias_association_to_yojson (x : connection_alias_association) =
  assoc_to_yojson
    [
      ("AssociationStatus", option_to_yojson association_status_to_yojson x.association_status);
      ("AssociatedAccountId", option_to_yojson aws_account_to_yojson x.associated_account_id);
      ("ResourceId", option_to_yojson non_empty_string_to_yojson x.resource_id);
      ( "ConnectionIdentifier",
        option_to_yojson connection_identifier_to_yojson x.connection_identifier );
    ]

let connection_alias_association_list_to_yojson tree =
  list_to_yojson connection_alias_association_to_yojson tree

let connection_alias_state_to_yojson (x : connection_alias_state) =
  match x with
  | CREATING -> `String "CREATING"
  | CREATED -> `String "CREATED"
  | DELETING -> `String "DELETING"

let connection_string_to_yojson = string_to_yojson

let connection_alias_to_yojson (x : connection_alias) =
  assoc_to_yojson
    [
      ("ConnectionString", option_to_yojson connection_string_to_yojson x.connection_string);
      ("AliasId", option_to_yojson connection_alias_id_to_yojson x.alias_id);
      ("State", option_to_yojson connection_alias_state_to_yojson x.state);
      ("OwnerAccountId", option_to_yojson aws_account_to_yojson x.owner_account_id);
      ("Associations", option_to_yojson connection_alias_association_list_to_yojson x.associations);
    ]

let connection_alias_id_list_to_yojson tree = list_to_yojson connection_alias_id_to_yojson tree
let connection_alias_list_to_yojson tree = list_to_yojson connection_alias_to_yojson tree

let connection_alias_permission_to_yojson (x : connection_alias_permission) =
  assoc_to_yojson
    [
      ("SharedAccountId", Some (aws_account_to_yojson x.shared_account_id));
      ("AllowAssociation", Some (boolean_object_to_yojson x.allow_association));
    ]

let connection_alias_permissions_to_yojson tree =
  list_to_yojson connection_alias_permission_to_yojson tree

let connection_state_to_yojson (x : connection_state) =
  match x with
  | CONNECTED -> `String "CONNECTED"
  | DISCONNECTED -> `String "DISCONNECTED"
  | UNKNOWN -> `String "UNKNOWN"

let resource_unavailable_exception_to_yojson (x : resource_unavailable_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson exception_message_to_yojson x.message);
      ("ResourceId", option_to_yojson non_empty_string_to_yojson x.resource_id);
    ]

let copy_workspace_image_result_to_yojson (x : copy_workspace_image_result) =
  assoc_to_yojson [ ("ImageId", option_to_yojson workspace_image_id_to_yojson x.image_id) ]

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("Key", Some (tag_key_to_yojson x.key));
      ("Value", option_to_yojson tag_value_to_yojson x.value);
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree
let region_to_yojson = string_to_yojson
let workspace_image_description_to_yojson = string_to_yojson
let workspace_image_name_to_yojson = string_to_yojson

let copy_workspace_image_request_to_yojson (x : copy_workspace_image_request) =
  assoc_to_yojson
    [
      ("Name", Some (workspace_image_name_to_yojson x.name));
      ("Description", option_to_yojson workspace_image_description_to_yojson x.description);
      ("SourceImageId", Some (workspace_image_id_to_yojson x.source_image_id));
      ("SourceRegion", Some (region_to_yojson x.source_region));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_account_link_invitation_result_to_yojson (x : create_account_link_invitation_result) =
  assoc_to_yojson [ ("AccountLink", option_to_yojson account_link_to_yojson x.account_link) ]

let create_account_link_invitation_request_to_yojson (x : create_account_link_invitation_request) =
  assoc_to_yojson
    [
      ("TargetAccountId", Some (aws_account_to_yojson x.target_account_id));
      ("ClientToken", option_to_yojson client_token_to_yojson x.client_token);
    ]

let resource_creation_failed_exception_to_yojson (x : resource_creation_failed_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let create_connect_client_add_in_result_to_yojson (x : create_connect_client_add_in_result) =
  assoc_to_yojson [ ("AddInId", option_to_yojson amazon_uuid_to_yojson x.add_in_id) ]

let create_connect_client_add_in_request_to_yojson (x : create_connect_client_add_in_request) =
  assoc_to_yojson
    [
      ("ResourceId", Some (directory_id_to_yojson x.resource_id));
      ("Name", Some (add_in_name_to_yojson x.name));
      ("URL", Some (add_in_url_to_yojson x.ur_l));
    ]

let create_connection_alias_result_to_yojson (x : create_connection_alias_result) =
  assoc_to_yojson [ ("AliasId", option_to_yojson connection_alias_id_to_yojson x.alias_id) ]

let create_connection_alias_request_to_yojson (x : create_connection_alias_request) =
  assoc_to_yojson
    [
      ("ConnectionString", Some (connection_string_to_yojson x.connection_string));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_ip_group_result_to_yojson (x : create_ip_group_result) =
  assoc_to_yojson [ ("GroupId", option_to_yojson ip_group_id_to_yojson x.group_id) ]

let ip_group_desc_to_yojson = string_to_yojson
let ip_group_name_to_yojson = string_to_yojson

let create_ip_group_request_to_yojson (x : create_ip_group_request) =
  assoc_to_yojson
    [
      ("GroupName", Some (ip_group_name_to_yojson x.group_name));
      ("GroupDesc", option_to_yojson ip_group_desc_to_yojson x.group_desc);
      ("UserRules", option_to_yojson ip_rule_list_to_yojson x.user_rules);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let workspace_state_to_yojson (x : workspace_state) =
  match x with
  | PENDING -> `String "PENDING"
  | AVAILABLE -> `String "AVAILABLE"
  | IMPAIRED -> `String "IMPAIRED"
  | UNHEALTHY -> `String "UNHEALTHY"
  | REBOOTING -> `String "REBOOTING"
  | STARTING -> `String "STARTING"
  | REBUILDING -> `String "REBUILDING"
  | RESTORING -> `String "RESTORING"
  | MAINTENANCE -> `String "MAINTENANCE"
  | ADMIN_MAINTENANCE -> `String "ADMIN_MAINTENANCE"
  | TERMINATING -> `String "TERMINATING"
  | TERMINATED -> `String "TERMINATED"
  | SUSPENDED -> `String "SUSPENDED"
  | UPDATING -> `String "UPDATING"
  | STOPPING -> `String "STOPPING"
  | STOPPED -> `String "STOPPED"
  | ERROR -> `String "ERROR"

let user_name_to_yojson = string_to_yojson

let pending_create_standby_workspaces_request_to_yojson
    (x : pending_create_standby_workspaces_request) =
  assoc_to_yojson
    [
      ("UserName", option_to_yojson user_name_to_yojson x.user_name);
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
      ("State", option_to_yojson workspace_state_to_yojson x.state);
      ("WorkspaceId", option_to_yojson workspace_id_to_yojson x.workspace_id);
    ]

let pending_create_standby_workspaces_request_list_to_yojson tree =
  list_to_yojson pending_create_standby_workspaces_request_to_yojson tree

let data_replication_to_yojson (x : data_replication) =
  match x with
  | NO_REPLICATION -> `String "NO_REPLICATION"
  | PRIMARY_AS_SOURCE -> `String "PRIMARY_AS_SOURCE"

let volume_encryption_key_to_yojson = string_to_yojson

let standby_workspace_to_yojson (x : standby_workspace) =
  assoc_to_yojson
    [
      ("PrimaryWorkspaceId", Some (workspace_id_to_yojson x.primary_workspace_id));
      ( "VolumeEncryptionKey",
        option_to_yojson volume_encryption_key_to_yojson x.volume_encryption_key );
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("DataReplication", option_to_yojson data_replication_to_yojson x.data_replication);
    ]

let failed_create_standby_workspaces_request_to_yojson
    (x : failed_create_standby_workspaces_request) =
  assoc_to_yojson
    [
      ( "StandbyWorkspaceRequest",
        option_to_yojson standby_workspace_to_yojson x.standby_workspace_request );
      ("ErrorCode", option_to_yojson workspace_error_code_to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson description_to_yojson x.error_message);
    ]

let failed_create_standby_workspaces_request_list_to_yojson tree =
  list_to_yojson failed_create_standby_workspaces_request_to_yojson tree

let create_standby_workspaces_result_to_yojson (x : create_standby_workspaces_result) =
  assoc_to_yojson
    [
      ( "FailedStandbyRequests",
        option_to_yojson failed_create_standby_workspaces_request_list_to_yojson
          x.failed_standby_requests );
      ( "PendingStandbyRequests",
        option_to_yojson pending_create_standby_workspaces_request_list_to_yojson
          x.pending_standby_requests );
    ]

let standby_workspaces_list_to_yojson tree = list_to_yojson standby_workspace_to_yojson tree

let create_standby_workspaces_request_to_yojson (x : create_standby_workspaces_request) =
  assoc_to_yojson
    [
      ("PrimaryRegion", Some (region_to_yojson x.primary_region));
      ("StandbyWorkspaces", Some (standby_workspaces_list_to_yojson x.standby_workspaces));
    ]

let create_tags_result_to_yojson = unit_to_yojson

let create_tags_request_to_yojson (x : create_tags_request) =
  assoc_to_yojson
    [
      ("ResourceId", Some (non_empty_string_to_yojson x.resource_id));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let create_updated_workspace_image_result_to_yojson (x : create_updated_workspace_image_result) =
  assoc_to_yojson [ ("ImageId", option_to_yojson workspace_image_id_to_yojson x.image_id) ]

let create_updated_workspace_image_request_to_yojson (x : create_updated_workspace_image_request) =
  assoc_to_yojson
    [
      ("Name", Some (workspace_image_name_to_yojson x.name));
      ("Description", Some (workspace_image_description_to_yojson x.description));
      ("SourceImageId", Some (workspace_image_id_to_yojson x.source_image_id));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let create_workspace_bundle_result_to_yojson (x : create_workspace_bundle_result) =
  assoc_to_yojson
    [ ("WorkspaceBundle", option_to_yojson workspace_bundle_to_yojson x.workspace_bundle) ]

let workspace_bundle_description_to_yojson = string_to_yojson
let workspace_bundle_name_to_yojson = string_to_yojson

let create_workspace_bundle_request_to_yojson (x : create_workspace_bundle_request) =
  assoc_to_yojson
    [
      ("BundleName", Some (workspace_bundle_name_to_yojson x.bundle_name));
      ("BundleDescription", Some (workspace_bundle_description_to_yojson x.bundle_description));
      ("ImageId", Some (workspace_image_id_to_yojson x.image_id));
      ("ComputeType", Some (compute_type_to_yojson x.compute_type));
      ("UserStorage", Some (user_storage_to_yojson x.user_storage));
      ("RootStorage", option_to_yojson root_storage_to_yojson x.root_storage);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let workspace_image_required_tenancy_to_yojson (x : workspace_image_required_tenancy) =
  match x with DEFAULT -> `String "DEFAULT" | DEDICATED -> `String "DEDICATED"

let workspace_image_state_to_yojson (x : workspace_image_state) =
  match x with
  | AVAILABLE -> `String "AVAILABLE"
  | PENDING -> `String "PENDING"
  | ERROR -> `String "ERROR"

let operating_system_type_to_yojson (x : operating_system_type) =
  match x with WINDOWS -> `String "WINDOWS" | LINUX -> `String "LINUX"

let operating_system_to_yojson (x : operating_system) =
  assoc_to_yojson [ ("Type", option_to_yojson operating_system_type_to_yojson x.type_) ]

let create_workspace_image_result_to_yojson (x : create_workspace_image_result) =
  assoc_to_yojson
    [
      ("ImageId", option_to_yojson workspace_image_id_to_yojson x.image_id);
      ("Name", option_to_yojson workspace_image_name_to_yojson x.name);
      ("Description", option_to_yojson workspace_image_description_to_yojson x.description);
      ("OperatingSystem", option_to_yojson operating_system_to_yojson x.operating_system);
      ("State", option_to_yojson workspace_image_state_to_yojson x.state);
      ( "RequiredTenancy",
        option_to_yojson workspace_image_required_tenancy_to_yojson x.required_tenancy );
      ("Created", option_to_yojson timestamp_to_yojson x.created);
      ("OwnerAccountId", option_to_yojson aws_account_to_yojson x.owner_account_id);
    ]

let create_workspace_image_request_to_yojson (x : create_workspace_image_request) =
  assoc_to_yojson
    [
      ("Name", Some (workspace_image_name_to_yojson x.name));
      ("Description", Some (workspace_image_description_to_yojson x.description));
      ("WorkspaceId", Some (workspace_id_to_yojson x.workspace_id));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let standby_workspaces_properties_to_yojson (x : standby_workspaces_properties) =
  assoc_to_yojson
    [
      ("StandbyWorkspaceId", option_to_yojson workspace_id_to_yojson x.standby_workspace_id);
      ("DataReplication", option_to_yojson data_replication_to_yojson x.data_replication);
      ("RecoverySnapshotTime", option_to_yojson timestamp_to_yojson x.recovery_snapshot_time);
    ]

let standby_workspaces_properties_list_to_yojson tree =
  list_to_yojson standby_workspaces_properties_to_yojson tree

let data_replication_settings_to_yojson (x : data_replication_settings) =
  assoc_to_yojson
    [
      ("DataReplication", option_to_yojson data_replication_to_yojson x.data_replication);
      ("RecoverySnapshotTime", option_to_yojson timestamp_to_yojson x.recovery_snapshot_time);
    ]

let standby_workspace_relationship_type_to_yojson (x : standby_workspace_relationship_type) =
  match x with PRIMARY -> `String "PRIMARY" | STANDBY -> `String "STANDBY"

let related_workspace_properties_to_yojson (x : related_workspace_properties) =
  assoc_to_yojson
    [
      ("WorkspaceId", option_to_yojson workspace_id_to_yojson x.workspace_id);
      ("Region", option_to_yojson region_to_yojson x.region);
      ("State", option_to_yojson workspace_state_to_yojson x.state);
      ("Type", option_to_yojson standby_workspace_relationship_type_to_yojson x.type_);
    ]

let related_workspaces_to_yojson tree = list_to_yojson related_workspace_properties_to_yojson tree

let modification_state_enum_to_yojson (x : modification_state_enum) =
  match x with
  | UPDATE_INITIATED -> `String "UPDATE_INITIATED"
  | UPDATE_IN_PROGRESS -> `String "UPDATE_IN_PROGRESS"
  | UPDATE_FAILED -> `String "UPDATE_FAILED"

let modification_resource_enum_to_yojson (x : modification_resource_enum) =
  match x with
  | ROOT_VOLUME -> `String "ROOT_VOLUME"
  | USER_VOLUME -> `String "USER_VOLUME"
  | COMPUTE_TYPE -> `String "COMPUTE_TYPE"
  | PROTOCOL -> `String "PROTOCOL"

let modification_state_to_yojson (x : modification_state) =
  assoc_to_yojson
    [
      ("Resource", option_to_yojson modification_resource_enum_to_yojson x.resource);
      ("State", option_to_yojson modification_state_enum_to_yojson x.state);
    ]

let modification_state_list_to_yojson tree = list_to_yojson modification_state_to_yojson tree

let global_accelerator_for_work_space_to_yojson (x : global_accelerator_for_work_space) =
  assoc_to_yojson
    [
      ("Mode", Some (aga_mode_for_work_space_enum_to_yojson x.mode));
      ( "PreferredProtocol",
        option_to_yojson aga_preferred_protocol_for_work_space_to_yojson x.preferred_protocol );
    ]

let operating_system_name_to_yojson (x : operating_system_name) =
  match x with
  | AMAZON_LINUX_2 -> `String "AMAZON_LINUX_2"
  | UBUNTU_18_04 -> `String "UBUNTU_18_04"
  | UBUNTU_20_04 -> `String "UBUNTU_20_04"
  | UBUNTU_22_04 -> `String "UBUNTU_22_04"
  | UNKNOWN -> `String "UNKNOWN"
  | WINDOWS_10 -> `String "WINDOWS_10"
  | WINDOWS_11 -> `String "WINDOWS_11"
  | WINDOWS_7 -> `String "WINDOWS_7"
  | WINDOWS_SERVER_2016 -> `String "WINDOWS_SERVER_2016"
  | WINDOWS_SERVER_2019 -> `String "WINDOWS_SERVER_2019"
  | WINDOWS_SERVER_2022 -> `String "WINDOWS_SERVER_2022"
  | WINDOWS_SERVER_2025 -> `String "WINDOWS_SERVER_2025"
  | RHEL_8 -> `String "RHEL_8"
  | ROCKY_8 -> `String "ROCKY_8"

let protocol_to_yojson (x : protocol) =
  match x with PCOIP -> `String "PCOIP" | WSP -> `String "WSP"

let protocol_list_to_yojson tree = list_to_yojson protocol_to_yojson tree
let user_volume_size_gib_to_yojson = int_to_yojson
let root_volume_size_gib_to_yojson = int_to_yojson
let running_mode_auto_stop_timeout_in_minutes_to_yojson = int_to_yojson

let running_mode_to_yojson (x : running_mode) =
  match x with
  | AUTO_STOP -> `String "AUTO_STOP"
  | ALWAYS_ON -> `String "ALWAYS_ON"
  | MANUAL -> `String "MANUAL"

let workspace_properties_to_yojson (x : workspace_properties) =
  assoc_to_yojson
    [
      ("RunningMode", option_to_yojson running_mode_to_yojson x.running_mode);
      ( "RunningModeAutoStopTimeoutInMinutes",
        option_to_yojson running_mode_auto_stop_timeout_in_minutes_to_yojson
          x.running_mode_auto_stop_timeout_in_minutes );
      ("RootVolumeSizeGib", option_to_yojson root_volume_size_gib_to_yojson x.root_volume_size_gib);
      ("UserVolumeSizeGib", option_to_yojson user_volume_size_gib_to_yojson x.user_volume_size_gib);
      ("ComputeTypeName", option_to_yojson compute_to_yojson x.compute_type_name);
      ("Protocols", option_to_yojson protocol_list_to_yojson x.protocols);
      ( "OperatingSystemName",
        option_to_yojson operating_system_name_to_yojson x.operating_system_name );
      ( "GlobalAccelerator",
        option_to_yojson global_accelerator_for_work_space_to_yojson x.global_accelerator );
    ]

let workspace_name_to_yojson = string_to_yojson
let subnet_id_to_yojson = string_to_yojson
let ipv6_address_to_yojson = string_to_yojson
let ip_address_to_yojson = string_to_yojson

let workspace_to_yojson (x : workspace) =
  assoc_to_yojson
    [
      ("WorkspaceId", option_to_yojson workspace_id_to_yojson x.workspace_id);
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
      ("UserName", option_to_yojson user_name_to_yojson x.user_name);
      ("IpAddress", option_to_yojson ip_address_to_yojson x.ip_address);
      ("Ipv6Address", option_to_yojson ipv6_address_to_yojson x.ipv6_address);
      ("State", option_to_yojson workspace_state_to_yojson x.state);
      ("BundleId", option_to_yojson bundle_id_to_yojson x.bundle_id);
      ("SubnetId", option_to_yojson subnet_id_to_yojson x.subnet_id);
      ("ErrorMessage", option_to_yojson description_to_yojson x.error_message);
      ("ErrorCode", option_to_yojson workspace_error_code_to_yojson x.error_code);
      ("ComputerName", option_to_yojson computer_name_to_yojson x.computer_name);
      ( "VolumeEncryptionKey",
        option_to_yojson volume_encryption_key_to_yojson x.volume_encryption_key );
      ( "UserVolumeEncryptionEnabled",
        option_to_yojson boolean_object_to_yojson x.user_volume_encryption_enabled );
      ( "RootVolumeEncryptionEnabled",
        option_to_yojson boolean_object_to_yojson x.root_volume_encryption_enabled );
      ("WorkspaceName", option_to_yojson workspace_name_to_yojson x.workspace_name);
      ("WorkspaceProperties", option_to_yojson workspace_properties_to_yojson x.workspace_properties);
      ( "ModificationStates",
        option_to_yojson modification_state_list_to_yojson x.modification_states );
      ("RelatedWorkspaces", option_to_yojson related_workspaces_to_yojson x.related_workspaces);
      ( "DataReplicationSettings",
        option_to_yojson data_replication_settings_to_yojson x.data_replication_settings );
      ( "StandbyWorkspacesProperties",
        option_to_yojson standby_workspaces_properties_list_to_yojson
          x.standby_workspaces_properties );
    ]

let workspace_list_to_yojson tree = list_to_yojson workspace_to_yojson tree
let error_type_to_yojson = string_to_yojson

let workspace_request_to_yojson (x : workspace_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("UserName", Some (user_name_to_yojson x.user_name));
      ("BundleId", Some (bundle_id_to_yojson x.bundle_id));
      ( "VolumeEncryptionKey",
        option_to_yojson volume_encryption_key_to_yojson x.volume_encryption_key );
      ( "UserVolumeEncryptionEnabled",
        option_to_yojson boolean_object_to_yojson x.user_volume_encryption_enabled );
      ( "RootVolumeEncryptionEnabled",
        option_to_yojson boolean_object_to_yojson x.root_volume_encryption_enabled );
      ("WorkspaceProperties", option_to_yojson workspace_properties_to_yojson x.workspace_properties);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("WorkspaceName", option_to_yojson workspace_name_to_yojson x.workspace_name);
      ("Ipv6Address", option_to_yojson ipv6_address_to_yojson x.ipv6_address);
    ]

let failed_create_workspace_request_to_yojson (x : failed_create_workspace_request) =
  assoc_to_yojson
    [
      ("WorkspaceRequest", option_to_yojson workspace_request_to_yojson x.workspace_request);
      ("ErrorCode", option_to_yojson error_type_to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson description_to_yojson x.error_message);
    ]

let failed_create_workspace_requests_to_yojson tree =
  list_to_yojson failed_create_workspace_request_to_yojson tree

let create_workspaces_result_to_yojson (x : create_workspaces_result) =
  assoc_to_yojson
    [
      ( "FailedRequests",
        option_to_yojson failed_create_workspace_requests_to_yojson x.failed_requests );
      ("PendingRequests", option_to_yojson workspace_list_to_yojson x.pending_requests);
    ]

let workspace_request_list_to_yojson tree = list_to_yojson workspace_request_to_yojson tree

let create_workspaces_request_to_yojson (x : create_workspaces_request) =
  assoc_to_yojson [ ("Workspaces", Some (workspace_request_list_to_yojson x.workspaces)) ]

let pools_running_mode_to_yojson (x : pools_running_mode) =
  match x with AUTO_STOP -> `String "AUTO_STOP" | ALWAYS_ON -> `String "ALWAYS_ON"

let max_user_duration_in_seconds_to_yojson = int_to_yojson
let idle_disconnect_timeout_in_seconds_to_yojson = int_to_yojson
let disconnect_timeout_in_seconds_to_yojson = int_to_yojson

let timeout_settings_to_yojson (x : timeout_settings) =
  assoc_to_yojson
    [
      ( "DisconnectTimeoutInSeconds",
        option_to_yojson disconnect_timeout_in_seconds_to_yojson x.disconnect_timeout_in_seconds );
      ( "IdleDisconnectTimeoutInSeconds",
        option_to_yojson idle_disconnect_timeout_in_seconds_to_yojson
          x.idle_disconnect_timeout_in_seconds );
      ( "MaxUserDurationInSeconds",
        option_to_yojson max_user_duration_in_seconds_to_yojson x.max_user_duration_in_seconds );
    ]

let error_message_to_yojson = string_to_yojson

let workspaces_pool_error_code_to_yojson (x : workspaces_pool_error_code) =
  match x with
  | IAM_SERVICE_ROLE_IS_MISSING -> `String "IAM_SERVICE_ROLE_IS_MISSING"
  | IAM_SERVICE_ROLE_MISSING_ENI_DESCRIBE_ACTION ->
      `String "IAM_SERVICE_ROLE_MISSING_ENI_DESCRIBE_ACTION"
  | IAM_SERVICE_ROLE_MISSING_ENI_CREATE_ACTION ->
      `String "IAM_SERVICE_ROLE_MISSING_ENI_CREATE_ACTION"
  | IAM_SERVICE_ROLE_MISSING_ENI_DELETE_ACTION ->
      `String "IAM_SERVICE_ROLE_MISSING_ENI_DELETE_ACTION"
  | NETWORK_INTERFACE_LIMIT_EXCEEDED -> `String "NETWORK_INTERFACE_LIMIT_EXCEEDED"
  | INTERNAL_SERVICE_ERROR -> `String "INTERNAL_SERVICE_ERROR"
  | MACHINE_ROLE_IS_MISSING -> `String "MACHINE_ROLE_IS_MISSING"
  | STS_DISABLED_IN_REGION -> `String "STS_DISABLED_IN_REGION"
  | SUBNET_HAS_INSUFFICIENT_IP_ADDRESSES -> `String "SUBNET_HAS_INSUFFICIENT_IP_ADDRESSES"
  | IAM_SERVICE_ROLE_MISSING_DESCRIBE_SUBNET_ACTION ->
      `String "IAM_SERVICE_ROLE_MISSING_DESCRIBE_SUBNET_ACTION"
  | SUBNET_NOT_FOUND -> `String "SUBNET_NOT_FOUND"
  | IMAGE_NOT_FOUND -> `String "IMAGE_NOT_FOUND"
  | INVALID_SUBNET_CONFIGURATION -> `String "INVALID_SUBNET_CONFIGURATION"
  | SECURITY_GROUPS_NOT_FOUND -> `String "SECURITY_GROUPS_NOT_FOUND"
  | IGW_NOT_ATTACHED -> `String "IGW_NOT_ATTACHED"
  | IAM_SERVICE_ROLE_MISSING_DESCRIBE_SECURITY_GROUPS_ACTION ->
      `String "IAM_SERVICE_ROLE_MISSING_DESCRIBE_SECURITY_GROUPS_ACTION"
  | WORKSPACES_POOL_STOPPED -> `String "WORKSPACES_POOL_STOPPED"
  | WORKSPACES_POOL_INSTANCE_PROVISIONING_FAILURE ->
      `String "WORKSPACES_POOL_INSTANCE_PROVISIONING_FAILURE"
  | DOMAIN_JOIN_ERROR_FILE_NOT_FOUND -> `String "DOMAIN_JOIN_ERROR_FILE_NOT_FOUND"
  | DOMAIN_JOIN_ERROR_ACCESS_DENIED -> `String "DOMAIN_JOIN_ERROR_ACCESS_DENIED"
  | DOMAIN_JOIN_ERROR_LOGON_FAILURE -> `String "DOMAIN_JOIN_ERROR_LOGON_FAILURE"
  | DOMAIN_JOIN_ERROR_INVALID_PARAMETER -> `String "DOMAIN_JOIN_ERROR_INVALID_PARAMETER"
  | DOMAIN_JOIN_ERROR_MORE_DATA -> `String "DOMAIN_JOIN_ERROR_MORE_DATA"
  | DOMAIN_JOIN_ERROR_NO_SUCH_DOMAIN -> `String "DOMAIN_JOIN_ERROR_NO_SUCH_DOMAIN"
  | DOMAIN_JOIN_ERROR_NOT_SUPPORTED -> `String "DOMAIN_JOIN_ERROR_NOT_SUPPORTED"
  | DOMAIN_JOIN_NERR_INVALID_WORKGROUP_NAME -> `String "DOMAIN_JOIN_NERR_INVALID_WORKGROUP_NAME"
  | DOMAIN_JOIN_NERR_WORKSTATION_NOT_STARTED -> `String "DOMAIN_JOIN_NERR_WORKSTATION_NOT_STARTED"
  | DOMAIN_JOIN_ERROR_DS_MACHINE_ACCOUNT_QUOTA_EXCEEDED ->
      `String "DOMAIN_JOIN_ERROR_DS_MACHINE_ACCOUNT_QUOTA_EXCEEDED"
  | DOMAIN_JOIN_NERR_PASSWORD_EXPIRED -> `String "DOMAIN_JOIN_NERR_PASSWORD_EXPIRED"
  | DOMAIN_JOIN_INTERNAL_SERVICE_ERROR -> `String "DOMAIN_JOIN_INTERNAL_SERVICE_ERROR"
  | DOMAIN_JOIN_ERROR_SECRET_ACTION_PERMISSION_IS_MISSING ->
      `String "DOMAIN_JOIN_ERROR_SECRET_ACTION_PERMISSION_IS_MISSING"
  | DOMAIN_JOIN_ERROR_SECRET_DECRYPTION_FAILURE ->
      `String "DOMAIN_JOIN_ERROR_SECRET_DECRYPTION_FAILURE"
  | DOMAIN_JOIN_ERROR_SECRET_STATE_INVALID -> `String "DOMAIN_JOIN_ERROR_SECRET_STATE_INVALID"
  | DOMAIN_JOIN_ERROR_SECRET_NOT_FOUND -> `String "DOMAIN_JOIN_ERROR_SECRET_NOT_FOUND"
  | DOMAIN_JOIN_ERROR_SECRET_VALUE_KEY_NOT_FOUND ->
      `String "DOMAIN_JOIN_ERROR_SECRET_VALUE_KEY_NOT_FOUND"
  | DOMAIN_JOIN_ERROR_SECRET_INVALID -> `String "DOMAIN_JOIN_ERROR_SECRET_INVALID"
  | BUNDLE_NOT_FOUND -> `String "BUNDLE_NOT_FOUND"
  | DIRECTORY_NOT_FOUND -> `String "DIRECTORY_NOT_FOUND"
  | INSUFFICIENT_PERMISSIONS_ERROR -> `String "INSUFFICIENT_PERMISSIONS_ERROR"
  | DEFAULT_OU_IS_MISSING -> `String "DEFAULT_OU_IS_MISSING"

let workspaces_pool_error_to_yojson (x : workspaces_pool_error) =
  assoc_to_yojson
    [
      ("ErrorCode", option_to_yojson workspaces_pool_error_code_to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
    ]

let workspaces_pool_errors_to_yojson tree = list_to_yojson workspaces_pool_error_to_yojson tree

let workspaces_pool_state_to_yojson (x : workspaces_pool_state) =
  match x with
  | CREATING -> `String "CREATING"
  | DELETING -> `String "DELETING"
  | RUNNING -> `String "RUNNING"
  | STARTING -> `String "STARTING"
  | STOPPED -> `String "STOPPED"
  | STOPPING -> `String "STOPPING"
  | UPDATING -> `String "UPDATING"

let update_description_to_yojson = string_to_yojson
let workspaces_pool_name_to_yojson = string_to_yojson
let workspaces_pool_id_to_yojson = string_to_yojson

let workspaces_pool_to_yojson (x : workspaces_pool) =
  assoc_to_yojson
    [
      ("PoolId", Some (workspaces_pool_id_to_yojson x.pool_id));
      ("PoolArn", Some (ar_n_to_yojson x.pool_arn));
      ("CapacityStatus", Some (capacity_status_to_yojson x.capacity_status));
      ("PoolName", Some (workspaces_pool_name_to_yojson x.pool_name));
      ("Description", option_to_yojson update_description_to_yojson x.description);
      ("State", Some (workspaces_pool_state_to_yojson x.state));
      ("CreatedAt", Some (timestamp_to_yojson x.created_at));
      ("BundleId", Some (bundle_id_to_yojson x.bundle_id));
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("Errors", option_to_yojson workspaces_pool_errors_to_yojson x.errors);
      ( "ApplicationSettings",
        option_to_yojson application_settings_response_to_yojson x.application_settings );
      ("TimeoutSettings", option_to_yojson timeout_settings_to_yojson x.timeout_settings);
      ("RunningMode", Some (pools_running_mode_to_yojson x.running_mode));
    ]

let create_workspaces_pool_result_to_yojson (x : create_workspaces_pool_result) =
  assoc_to_yojson
    [ ("WorkspacesPool", option_to_yojson workspaces_pool_to_yojson x.workspaces_pool) ]

let create_workspaces_pool_request_to_yojson (x : create_workspaces_pool_request) =
  assoc_to_yojson
    [
      ("PoolName", Some (workspaces_pool_name_to_yojson x.pool_name));
      ("Description", Some (update_description_to_yojson x.description));
      ("BundleId", Some (bundle_id_to_yojson x.bundle_id));
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("Capacity", Some (capacity_to_yojson x.capacity));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "ApplicationSettings",
        option_to_yojson application_settings_request_to_yojson x.application_settings );
      ("TimeoutSettings", option_to_yojson timeout_settings_to_yojson x.timeout_settings);
      ("RunningMode", option_to_yojson pools_running_mode_to_yojson x.running_mode);
    ]

let custom_image_protocol_to_yojson (x : custom_image_protocol) =
  match x with PCOIP -> `String "PCOIP" | DCV -> `String "DCV" | BYOP -> `String "BYOP"

let image_error_message_to_yojson = string_to_yojson
let error_code_to_yojson = string_to_yojson

let custom_workspace_image_import_error_details_to_yojson
    (x : custom_workspace_image_import_error_details) =
  assoc_to_yojson
    [
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson image_error_message_to_yojson x.error_message);
    ]

let custom_workspace_image_import_error_details_list_to_yojson tree =
  list_to_yojson custom_workspace_image_import_error_details_to_yojson tree

let custom_workspace_image_import_state_to_yojson (x : custom_workspace_image_import_state) =
  match x with
  | PENDING -> `String "PENDING"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | PROCESSING_SOURCE_IMAGE -> `String "PROCESSING_SOURCE_IMAGE"
  | IMAGE_TESTING_START -> `String "IMAGE_TESTING_START"
  | UPDATING_OPERATING_SYSTEM -> `String "UPDATING_OPERATING_SYSTEM"
  | IMAGE_COMPATIBILITY_CHECKING -> `String "IMAGE_COMPATIBILITY_CHECKING"
  | IMAGE_TESTING_GENERALIZATION -> `String "IMAGE_TESTING_GENERALIZATION"
  | CREATING_TEST_INSTANCE -> `String "CREATING_TEST_INSTANCE"
  | INSTALLING_COMPONENTS -> `String "INSTALLING_COMPONENTS"
  | GENERALIZING -> `String "GENERALIZING"
  | VALIDATING -> `String "VALIDATING"
  | PUBLISHING -> `String "PUBLISHING"
  | COMPLETED -> `String "COMPLETED"
  | ERROR -> `String "ERROR"

let dedicated_tenancy_account_type_to_yojson (x : dedicated_tenancy_account_type) =
  match x with
  | SOURCE_ACCOUNT -> `String "SOURCE_ACCOUNT"
  | TARGET_ACCOUNT -> `String "TARGET_ACCOUNT"

let dedicated_tenancy_cidr_range_list_to_yojson tree =
  list_to_yojson dedicated_tenancy_management_cidr_range_to_yojson tree

let dedicated_tenancy_support_enum_to_yojson (x : dedicated_tenancy_support_enum) =
  match x with ENABLED -> `String "ENABLED"

let login_message_to_yojson tree =
  map_to_yojson client_locale_to_yojson client_login_message_to_yojson tree

let default_client_branding_attributes_to_yojson (x : default_client_branding_attributes) =
  assoc_to_yojson
    [
      ("LogoUrl", option_to_yojson client_url_to_yojson x.logo_url);
      ("SupportEmail", option_to_yojson client_email_to_yojson x.support_email);
      ("SupportLink", option_to_yojson client_url_to_yojson x.support_link);
      ("ForgotPasswordLink", option_to_yojson client_url_to_yojson x.forgot_password_link);
      ("LoginMessage", option_to_yojson login_message_to_yojson x.login_message);
    ]

let default_logo_to_yojson = blob_to_yojson

let default_import_client_branding_attributes_to_yojson
    (x : default_import_client_branding_attributes) =
  assoc_to_yojson
    [
      ("Logo", option_to_yojson default_logo_to_yojson x.logo);
      ("SupportEmail", option_to_yojson client_email_to_yojson x.support_email);
      ("SupportLink", option_to_yojson client_url_to_yojson x.support_link);
      ("ForgotPasswordLink", option_to_yojson client_url_to_yojson x.forgot_password_link);
      ("LoginMessage", option_to_yojson login_message_to_yojson x.login_message);
    ]

let default_ou_to_yojson = string_to_yojson
let security_group_id_to_yojson = string_to_yojson

let default_workspace_creation_properties_to_yojson (x : default_workspace_creation_properties) =
  assoc_to_yojson
    [
      ("EnableInternetAccess", option_to_yojson boolean_object_to_yojson x.enable_internet_access);
      ("DefaultOu", option_to_yojson default_ou_to_yojson x.default_ou);
      ( "CustomSecurityGroupId",
        option_to_yojson security_group_id_to_yojson x.custom_security_group_id );
      ( "UserEnabledAsLocalAdministrator",
        option_to_yojson boolean_object_to_yojson x.user_enabled_as_local_administrator );
      ("EnableMaintenanceMode", option_to_yojson boolean_object_to_yojson x.enable_maintenance_mode);
      ("InstanceIamRoleArn", option_to_yojson ar_n_to_yojson x.instance_iam_role_arn);
    ]

let deletable_certificate_based_auth_property_to_yojson
    (x : deletable_certificate_based_auth_property) =
  match x with
  | CERTIFICATE_BASED_AUTH_PROPERTIES_CERTIFICATE_AUTHORITY_ARN ->
      `String "CERTIFICATE_BASED_AUTH_PROPERTIES_CERTIFICATE_AUTHORITY_ARN"

let deletable_certificate_based_auth_properties_list_to_yojson tree =
  list_to_yojson deletable_certificate_based_auth_property_to_yojson tree

let deletable_saml_property_to_yojson (x : deletable_saml_property) =
  match x with
  | SAML_PROPERTIES_USER_ACCESS_URL -> `String "SAML_PROPERTIES_USER_ACCESS_URL"
  | SAML_PROPERTIES_RELAY_STATE_PARAMETER_NAME ->
      `String "SAML_PROPERTIES_RELAY_STATE_PARAMETER_NAME"

let deletable_saml_properties_list_to_yojson tree =
  list_to_yojson deletable_saml_property_to_yojson tree

let delete_account_link_invitation_result_to_yojson (x : delete_account_link_invitation_result) =
  assoc_to_yojson [ ("AccountLink", option_to_yojson account_link_to_yojson x.account_link) ]

let delete_account_link_invitation_request_to_yojson (x : delete_account_link_invitation_request) =
  assoc_to_yojson
    [
      ("LinkId", Some (link_id_to_yojson x.link_id));
      ("ClientToken", option_to_yojson client_token_to_yojson x.client_token);
    ]

let delete_client_branding_result_to_yojson = unit_to_yojson

let delete_client_branding_request_to_yojson (x : delete_client_branding_request) =
  assoc_to_yojson
    [
      ("ResourceId", Some (directory_id_to_yojson x.resource_id));
      ("Platforms", Some (client_device_type_list_to_yojson x.platforms));
    ]

let delete_connect_client_add_in_result_to_yojson = unit_to_yojson

let delete_connect_client_add_in_request_to_yojson (x : delete_connect_client_add_in_request) =
  assoc_to_yojson
    [
      ("AddInId", Some (amazon_uuid_to_yojson x.add_in_id));
      ("ResourceId", Some (directory_id_to_yojson x.resource_id));
    ]

let delete_connection_alias_result_to_yojson = unit_to_yojson

let delete_connection_alias_request_to_yojson (x : delete_connection_alias_request) =
  assoc_to_yojson [ ("AliasId", Some (connection_alias_id_to_yojson x.alias_id)) ]

let delete_ip_group_result_to_yojson = unit_to_yojson

let delete_ip_group_request_to_yojson (x : delete_ip_group_request) =
  assoc_to_yojson [ ("GroupId", Some (ip_group_id_to_yojson x.group_id)) ]

let delete_tags_result_to_yojson = unit_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree

let delete_tags_request_to_yojson (x : delete_tags_request) =
  assoc_to_yojson
    [
      ("ResourceId", Some (non_empty_string_to_yojson x.resource_id));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let delete_workspace_bundle_result_to_yojson = unit_to_yojson

let delete_workspace_bundle_request_to_yojson (x : delete_workspace_bundle_request) =
  assoc_to_yojson [ ("BundleId", option_to_yojson bundle_id_to_yojson x.bundle_id) ]

let delete_workspace_image_result_to_yojson = unit_to_yojson

let delete_workspace_image_request_to_yojson (x : delete_workspace_image_request) =
  assoc_to_yojson [ ("ImageId", Some (workspace_image_id_to_yojson x.image_id)) ]

let workspace_resource_association_list_to_yojson tree =
  list_to_yojson workspace_resource_association_to_yojson tree

let work_space_application_deployment_to_yojson (x : work_space_application_deployment) =
  assoc_to_yojson
    [
      ("Associations", option_to_yojson workspace_resource_association_list_to_yojson x.associations);
    ]

let deploy_workspace_applications_result_to_yojson (x : deploy_workspace_applications_result) =
  assoc_to_yojson
    [ ("Deployment", option_to_yojson work_space_application_deployment_to_yojson x.deployment) ]

let deploy_workspace_applications_request_to_yojson (x : deploy_workspace_applications_request) =
  assoc_to_yojson
    [
      ("WorkspaceId", Some (workspace_id_to_yojson x.workspace_id));
      ("Force", option_to_yojson boolean_object_to_yojson x.force);
    ]

let deregister_workspace_directory_result_to_yojson = unit_to_yojson

let deregister_workspace_directory_request_to_yojson (x : deregister_workspace_directory_request) =
  assoc_to_yojson [ ("DirectoryId", Some (directory_id_to_yojson x.directory_id)) ]

let message_to_yojson = string_to_yojson

let describe_account_result_to_yojson (x : describe_account_result) =
  assoc_to_yojson
    [
      ( "DedicatedTenancySupport",
        option_to_yojson dedicated_tenancy_support_result_enum_to_yojson x.dedicated_tenancy_support
      );
      ( "DedicatedTenancyManagementCidrRange",
        option_to_yojson dedicated_tenancy_management_cidr_range_to_yojson
          x.dedicated_tenancy_management_cidr_range );
      ( "DedicatedTenancyAccountType",
        option_to_yojson dedicated_tenancy_account_type_to_yojson x.dedicated_tenancy_account_type
      );
      ("Message", option_to_yojson message_to_yojson x.message);
    ]

let describe_account_request_to_yojson = unit_to_yojson
let pagination_token_to_yojson = string_to_yojson

let describe_account_modifications_result_to_yojson (x : describe_account_modifications_result) =
  assoc_to_yojson
    [
      ( "AccountModifications",
        option_to_yojson account_modification_list_to_yojson x.account_modifications );
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let describe_account_modifications_request_to_yojson (x : describe_account_modifications_request) =
  assoc_to_yojson [ ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token) ]

let describe_application_associations_result_to_yojson
    (x : describe_application_associations_result) =
  assoc_to_yojson
    [
      ( "Associations",
        option_to_yojson application_resource_association_list_to_yojson x.associations );
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let limit_to_yojson = int_to_yojson

let describe_application_associations_request_to_yojson
    (x : describe_application_associations_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson limit_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("ApplicationId", Some (work_space_application_id_to_yojson x.application_id));
      ( "AssociatedResourceTypes",
        Some (application_associated_resource_type_list_to_yojson x.associated_resource_types) );
    ]

let operating_system_name_list_to_yojson tree = list_to_yojson operating_system_name_to_yojson tree

let work_space_application_state_to_yojson (x : work_space_application_state) =
  match x with
  | PENDING -> `String "PENDING"
  | ERROR -> `String "ERROR"
  | AVAILABLE -> `String "AVAILABLE"
  | UNINSTALL_ONLY -> `String "UNINSTALL_ONLY"

let work_space_application_owner_to_yojson = string_to_yojson

let work_space_application_license_type_to_yojson (x : work_space_application_license_type) =
  match x with LICENSED -> `String "LICENSED" | UNLICENSED -> `String "UNLICENSED"

let work_space_application_to_yojson (x : work_space_application) =
  assoc_to_yojson
    [
      ("ApplicationId", option_to_yojson work_space_application_id_to_yojson x.application_id);
      ("Created", option_to_yojson timestamp_to_yojson x.created);
      ("Description", option_to_yojson string2048_to_yojson x.description);
      ("LicenseType", option_to_yojson work_space_application_license_type_to_yojson x.license_type);
      ("Name", option_to_yojson non_empty_string_to_yojson x.name);
      ("Owner", option_to_yojson work_space_application_owner_to_yojson x.owner);
      ("State", option_to_yojson work_space_application_state_to_yojson x.state);
      ( "SupportedComputeTypeNames",
        option_to_yojson compute_list_to_yojson x.supported_compute_type_names );
      ( "SupportedOperatingSystemNames",
        option_to_yojson operating_system_name_list_to_yojson x.supported_operating_system_names );
    ]

let work_space_application_list_to_yojson tree =
  list_to_yojson work_space_application_to_yojson tree

let describe_applications_result_to_yojson (x : describe_applications_result) =
  assoc_to_yojson
    [
      ("Applications", option_to_yojson work_space_application_list_to_yojson x.applications);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let work_space_application_id_list_to_yojson tree =
  list_to_yojson work_space_application_id_to_yojson tree

let describe_applications_request_to_yojson (x : describe_applications_request) =
  assoc_to_yojson
    [
      ("ApplicationIds", option_to_yojson work_space_application_id_list_to_yojson x.application_ids);
      ("ComputeTypeNames", option_to_yojson compute_list_to_yojson x.compute_type_names);
      ("LicenseType", option_to_yojson work_space_application_license_type_to_yojson x.license_type);
      ( "OperatingSystemNames",
        option_to_yojson operating_system_name_list_to_yojson x.operating_system_names );
      ("Owner", option_to_yojson work_space_application_owner_to_yojson x.owner);
      ("MaxResults", option_to_yojson limit_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let describe_bundle_associations_result_to_yojson (x : describe_bundle_associations_result) =
  assoc_to_yojson
    [ ("Associations", option_to_yojson bundle_resource_association_list_to_yojson x.associations) ]

let describe_bundle_associations_request_to_yojson (x : describe_bundle_associations_request) =
  assoc_to_yojson
    [
      ("BundleId", Some (bundle_id_to_yojson x.bundle_id));
      ( "AssociatedResourceTypes",
        Some (bundle_associated_resource_type_list_to_yojson x.associated_resource_types) );
    ]

let ios_client_branding_attributes_to_yojson (x : ios_client_branding_attributes) =
  assoc_to_yojson
    [
      ("LogoUrl", option_to_yojson client_url_to_yojson x.logo_url);
      ("Logo2xUrl", option_to_yojson client_url_to_yojson x.logo2x_url);
      ("Logo3xUrl", option_to_yojson client_url_to_yojson x.logo3x_url);
      ("SupportEmail", option_to_yojson client_email_to_yojson x.support_email);
      ("SupportLink", option_to_yojson client_url_to_yojson x.support_link);
      ("ForgotPasswordLink", option_to_yojson client_url_to_yojson x.forgot_password_link);
      ("LoginMessage", option_to_yojson login_message_to_yojson x.login_message);
    ]

let describe_client_branding_result_to_yojson (x : describe_client_branding_result) =
  assoc_to_yojson
    [
      ( "DeviceTypeWindows",
        option_to_yojson default_client_branding_attributes_to_yojson x.device_type_windows );
      ( "DeviceTypeOsx",
        option_to_yojson default_client_branding_attributes_to_yojson x.device_type_osx );
      ( "DeviceTypeAndroid",
        option_to_yojson default_client_branding_attributes_to_yojson x.device_type_android );
      ("DeviceTypeIos", option_to_yojson ios_client_branding_attributes_to_yojson x.device_type_ios);
      ( "DeviceTypeLinux",
        option_to_yojson default_client_branding_attributes_to_yojson x.device_type_linux );
      ( "DeviceTypeWeb",
        option_to_yojson default_client_branding_attributes_to_yojson x.device_type_web );
    ]

let describe_client_branding_request_to_yojson (x : describe_client_branding_request) =
  assoc_to_yojson [ ("ResourceId", Some (directory_id_to_yojson x.resource_id)) ]

let describe_client_properties_result_to_yojson (x : describe_client_properties_result) =
  assoc_to_yojson
    [
      ( "ClientPropertiesList",
        option_to_yojson client_properties_list_to_yojson x.client_properties_list );
    ]

let resource_id_list_to_yojson tree = list_to_yojson non_empty_string_to_yojson tree

let describe_client_properties_request_to_yojson (x : describe_client_properties_request) =
  assoc_to_yojson [ ("ResourceIds", Some (resource_id_list_to_yojson x.resource_ids)) ]

let describe_connect_client_add_ins_result_to_yojson (x : describe_connect_client_add_ins_result) =
  assoc_to_yojson
    [
      ("AddIns", option_to_yojson connect_client_add_in_list_to_yojson x.add_ins);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let describe_connect_client_add_ins_request_to_yojson (x : describe_connect_client_add_ins_request)
    =
  assoc_to_yojson
    [
      ("ResourceId", Some (directory_id_to_yojson x.resource_id));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson limit_to_yojson x.max_results);
    ]

let describe_connection_alias_permissions_result_to_yojson
    (x : describe_connection_alias_permissions_result) =
  assoc_to_yojson
    [
      ("AliasId", option_to_yojson connection_alias_id_to_yojson x.alias_id);
      ( "ConnectionAliasPermissions",
        option_to_yojson connection_alias_permissions_to_yojson x.connection_alias_permissions );
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let describe_connection_alias_permissions_request_to_yojson
    (x : describe_connection_alias_permissions_request) =
  assoc_to_yojson
    [
      ("AliasId", Some (connection_alias_id_to_yojson x.alias_id));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson limit_to_yojson x.max_results);
    ]

let describe_connection_aliases_result_to_yojson (x : describe_connection_aliases_result) =
  assoc_to_yojson
    [
      ("ConnectionAliases", option_to_yojson connection_alias_list_to_yojson x.connection_aliases);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let describe_connection_aliases_request_to_yojson (x : describe_connection_aliases_request) =
  assoc_to_yojson
    [
      ("AliasIds", option_to_yojson connection_alias_id_list_to_yojson x.alias_ids);
      ("ResourceId", option_to_yojson non_empty_string_to_yojson x.resource_id);
      ("Limit", option_to_yojson limit_to_yojson x.limit);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let ec2_image_id_to_yojson = string_to_yojson
let image_build_version_arn_to_yojson = string_to_yojson
let ec2_import_task_id_to_yojson = string_to_yojson

let image_source_identifier_to_yojson (x : image_source_identifier) =
  match x with
  | Ec2ImportTaskId arg ->
      assoc_to_yojson [ ("Ec2ImportTaskId", Some (ec2_import_task_id_to_yojson arg)) ]
  | ImageBuildVersionArn arg ->
      assoc_to_yojson [ ("ImageBuildVersionArn", Some (image_build_version_arn_to_yojson arg)) ]
  | Ec2ImageId arg -> assoc_to_yojson [ ("Ec2ImageId", Some (ec2_image_id_to_yojson arg)) ]

let percentage_to_yojson = int_to_yojson
let workflow_state_message_to_yojson = string_to_yojson
let infrastructure_configuration_arn_to_yojson = string_to_yojson

let describe_custom_workspace_image_import_result_to_yojson
    (x : describe_custom_workspace_image_import_result) =
  assoc_to_yojson
    [
      ("ImageId", option_to_yojson workspace_image_id_to_yojson x.image_id);
      ( "InfrastructureConfigurationArn",
        option_to_yojson infrastructure_configuration_arn_to_yojson
          x.infrastructure_configuration_arn );
      ("State", option_to_yojson custom_workspace_image_import_state_to_yojson x.state);
      ("StateMessage", option_to_yojson workflow_state_message_to_yojson x.state_message);
      ("ProgressPercentage", option_to_yojson percentage_to_yojson x.progress_percentage);
      ("Created", option_to_yojson timestamp_to_yojson x.created);
      ("LastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("ImageSource", option_to_yojson image_source_identifier_to_yojson x.image_source);
      ( "ImageBuilderInstanceId",
        option_to_yojson non_empty_string_to_yojson x.image_builder_instance_id );
      ( "ErrorDetails",
        option_to_yojson custom_workspace_image_import_error_details_list_to_yojson x.error_details
      );
    ]

let describe_custom_workspace_image_import_request_to_yojson
    (x : describe_custom_workspace_image_import_request) =
  assoc_to_yojson [ ("ImageId", Some (workspace_image_id_to_yojson x.image_id)) ]

let image_associated_resource_type_to_yojson (x : image_associated_resource_type) =
  match x with APPLICATION -> `String "APPLICATION"

let image_resource_association_to_yojson (x : image_resource_association) =
  assoc_to_yojson
    [
      ("AssociatedResourceId", option_to_yojson non_empty_string_to_yojson x.associated_resource_id);
      ( "AssociatedResourceType",
        option_to_yojson image_associated_resource_type_to_yojson x.associated_resource_type );
      ("Created", option_to_yojson timestamp_to_yojson x.created);
      ("LastUpdatedTime", option_to_yojson timestamp_to_yojson x.last_updated_time);
      ("ImageId", option_to_yojson workspace_image_id_to_yojson x.image_id);
      ("State", option_to_yojson association_state_to_yojson x.state);
      ("StateReason", option_to_yojson association_state_reason_to_yojson x.state_reason);
    ]

let image_resource_association_list_to_yojson tree =
  list_to_yojson image_resource_association_to_yojson tree

let describe_image_associations_result_to_yojson (x : describe_image_associations_result) =
  assoc_to_yojson
    [ ("Associations", option_to_yojson image_resource_association_list_to_yojson x.associations) ]

let image_associated_resource_type_list_to_yojson tree =
  list_to_yojson image_associated_resource_type_to_yojson tree

let describe_image_associations_request_to_yojson (x : describe_image_associations_request) =
  assoc_to_yojson
    [
      ("ImageId", Some (workspace_image_id_to_yojson x.image_id));
      ( "AssociatedResourceTypes",
        Some (image_associated_resource_type_list_to_yojson x.associated_resource_types) );
    ]

let workspaces_ip_group_to_yojson (x : workspaces_ip_group) =
  assoc_to_yojson
    [
      ("groupId", option_to_yojson ip_group_id_to_yojson x.group_id);
      ("groupName", option_to_yojson ip_group_name_to_yojson x.group_name);
      ("groupDesc", option_to_yojson ip_group_desc_to_yojson x.group_desc);
      ("userRules", option_to_yojson ip_rule_list_to_yojson x.user_rules);
    ]

let workspaces_ip_groups_list_to_yojson tree = list_to_yojson workspaces_ip_group_to_yojson tree

let describe_ip_groups_result_to_yojson (x : describe_ip_groups_result) =
  assoc_to_yojson
    [
      ("Result", option_to_yojson workspaces_ip_groups_list_to_yojson x.result_);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let describe_ip_groups_request_to_yojson (x : describe_ip_groups_request) =
  assoc_to_yojson
    [
      ("GroupIds", option_to_yojson ip_group_id_list_to_yojson x.group_ids);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson limit_to_yojson x.max_results);
    ]

let describe_tags_result_to_yojson (x : describe_tags_result) =
  assoc_to_yojson [ ("TagList", option_to_yojson tag_list_to_yojson x.tag_list) ]

let describe_tags_request_to_yojson (x : describe_tags_request) =
  assoc_to_yojson [ ("ResourceId", Some (non_empty_string_to_yojson x.resource_id)) ]

let describe_workspace_associations_result_to_yojson (x : describe_workspace_associations_result) =
  assoc_to_yojson
    [
      ("Associations", option_to_yojson workspace_resource_association_list_to_yojson x.associations);
    ]

let work_space_associated_resource_type_list_to_yojson tree =
  list_to_yojson work_space_associated_resource_type_to_yojson tree

let describe_workspace_associations_request_to_yojson (x : describe_workspace_associations_request)
    =
  assoc_to_yojson
    [
      ("WorkspaceId", Some (workspace_id_to_yojson x.workspace_id));
      ( "AssociatedResourceTypes",
        Some (work_space_associated_resource_type_list_to_yojson x.associated_resource_types) );
    ]

let describe_workspace_bundles_result_to_yojson (x : describe_workspace_bundles_result) =
  assoc_to_yojson
    [
      ("Bundles", option_to_yojson bundle_list_to_yojson x.bundles);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let describe_workspace_bundles_request_to_yojson (x : describe_workspace_bundles_request) =
  assoc_to_yojson
    [
      ("BundleIds", option_to_yojson bundle_id_list_to_yojson x.bundle_ids);
      ("Owner", option_to_yojson bundle_owner_to_yojson x.owner);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let global_accelerator_for_directory_to_yojson (x : global_accelerator_for_directory) =
  assoc_to_yojson
    [
      ("Mode", Some (aga_mode_for_directory_enum_to_yojson x.mode));
      ( "PreferredProtocol",
        option_to_yojson aga_preferred_protocol_for_directory_to_yojson x.preferred_protocol );
    ]

let storage_connector_status_enum_to_yojson (x : storage_connector_status_enum) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let storage_connector_type_enum_to_yojson (x : storage_connector_type_enum) =
  match x with HOME_FOLDER -> `String "HOME_FOLDER"

let storage_connector_to_yojson (x : storage_connector) =
  assoc_to_yojson
    [
      ("ConnectorType", Some (storage_connector_type_enum_to_yojson x.connector_type));
      ("Status", Some (storage_connector_status_enum_to_yojson x.status));
    ]

let storage_connectors_to_yojson tree = list_to_yojson storage_connector_to_yojson tree
let maximum_length_to_yojson = int_to_yojson

let user_setting_permission_enum_to_yojson (x : user_setting_permission_enum) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let user_setting_action_enum_to_yojson (x : user_setting_action_enum) =
  match x with
  | CLIPBOARD_COPY_FROM_LOCAL_DEVICE -> `String "CLIPBOARD_COPY_FROM_LOCAL_DEVICE"
  | CLIPBOARD_COPY_TO_LOCAL_DEVICE -> `String "CLIPBOARD_COPY_TO_LOCAL_DEVICE"
  | PRINTING_TO_LOCAL_DEVICE -> `String "PRINTING_TO_LOCAL_DEVICE"
  | SMART_CARD -> `String "SMART_CARD"

let user_setting_to_yojson (x : user_setting) =
  assoc_to_yojson
    [
      ("Action", Some (user_setting_action_enum_to_yojson x.action));
      ("Permission", Some (user_setting_permission_enum_to_yojson x.permission));
      ("MaximumLength", option_to_yojson maximum_length_to_yojson x.maximum_length);
    ]

let user_settings_to_yojson tree = list_to_yojson user_setting_to_yojson tree

let streaming_experience_preferred_protocol_enum_to_yojson
    (x : streaming_experience_preferred_protocol_enum) =
  match x with TCP -> `String "TCP" | UDP -> `String "UDP"

let streaming_properties_to_yojson (x : streaming_properties) =
  assoc_to_yojson
    [
      ( "StreamingExperiencePreferredProtocol",
        option_to_yojson streaming_experience_preferred_protocol_enum_to_yojson
          x.streaming_experience_preferred_protocol );
      ("UserSettings", option_to_yojson user_settings_to_yojson x.user_settings);
      ("StorageConnectors", option_to_yojson storage_connectors_to_yojson x.storage_connectors);
      ( "GlobalAccelerator",
        option_to_yojson global_accelerator_for_directory_to_yojson x.global_accelerator );
    ]

let idc_config_to_yojson (x : idc_config) =
  assoc_to_yojson
    [
      ("InstanceArn", option_to_yojson ar_n_to_yojson x.instance_arn);
      ("ApplicationArn", option_to_yojson ar_n_to_yojson x.application_arn);
    ]

let workspace_type_to_yojson (x : workspace_type) =
  match x with PERSONAL -> `String "PERSONAL" | POOLS -> `String "POOLS"

let user_identity_type_to_yojson (x : user_identity_type) =
  match x with
  | CUSTOMER_MANAGED -> `String "CUSTOMER_MANAGED"
  | AWS_DIRECTORY_SERVICE -> `String "AWS_DIRECTORY_SERVICE"
  | AWS_IAM_IDENTITY_CENTER -> `String "AWS_IAM_IDENTITY_CENTER"

let workspace_directory_description_to_yojson = string_to_yojson
let workspace_directory_name_to_yojson = string_to_yojson
let microsoft_entra_config_tenant_id_to_yojson = string_to_yojson

let microsoft_entra_config_to_yojson (x : microsoft_entra_config) =
  assoc_to_yojson
    [
      ("TenantId", option_to_yojson microsoft_entra_config_tenant_id_to_yojson x.tenant_id);
      ( "ApplicationConfigSecretArn",
        option_to_yojson secrets_manager_arn_to_yojson x.application_config_secret_arn );
    ]

let endpoint_encryption_mode_to_yojson (x : endpoint_encryption_mode) =
  match x with STANDARD_TLS -> `String "STANDARD_TLS" | FIPS_VALIDATED -> `String "FIPS_VALIDATED"

let saml_user_access_url_to_yojson = string_to_yojson

let saml_status_enum_to_yojson (x : saml_status_enum) =
  match x with
  | DISABLED -> `String "DISABLED"
  | ENABLED -> `String "ENABLED"
  | ENABLED_WITH_DIRECTORY_LOGIN_FALLBACK -> `String "ENABLED_WITH_DIRECTORY_LOGIN_FALLBACK"

let saml_properties_to_yojson (x : saml_properties) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson saml_status_enum_to_yojson x.status);
      ("UserAccessUrl", option_to_yojson saml_user_access_url_to_yojson x.user_access_url);
      ( "RelayStateParameterName",
        option_to_yojson non_empty_string_to_yojson x.relay_state_parameter_name );
    ]

let selfservice_permissions_to_yojson (x : selfservice_permissions) =
  assoc_to_yojson
    [
      ("RestartWorkspace", option_to_yojson reconnect_enum_to_yojson x.restart_workspace);
      ("IncreaseVolumeSize", option_to_yojson reconnect_enum_to_yojson x.increase_volume_size);
      ("ChangeComputeType", option_to_yojson reconnect_enum_to_yojson x.change_compute_type);
      ("SwitchRunningMode", option_to_yojson reconnect_enum_to_yojson x.switch_running_mode);
      ("RebuildWorkspace", option_to_yojson reconnect_enum_to_yojson x.rebuild_workspace);
    ]

let tenancy_to_yojson (x : tenancy) =
  match x with DEDICATED -> `String "DEDICATED" | SHARED -> `String "SHARED"

let workspace_access_properties_to_yojson (x : workspace_access_properties) =
  assoc_to_yojson
    [
      ("DeviceTypeWindows", option_to_yojson access_property_value_to_yojson x.device_type_windows);
      ("DeviceTypeOsx", option_to_yojson access_property_value_to_yojson x.device_type_osx);
      ("DeviceTypeWeb", option_to_yojson access_property_value_to_yojson x.device_type_web);
      ("DeviceTypeIos", option_to_yojson access_property_value_to_yojson x.device_type_ios);
      ("DeviceTypeAndroid", option_to_yojson access_property_value_to_yojson x.device_type_android);
      ( "DeviceTypeChromeOs",
        option_to_yojson access_property_value_to_yojson x.device_type_chrome_os );
      ( "DeviceTypeZeroClient",
        option_to_yojson access_property_value_to_yojson x.device_type_zero_client );
      ("DeviceTypeLinux", option_to_yojson access_property_value_to_yojson x.device_type_linux);
      ( "DeviceTypeWorkSpacesThinClient",
        option_to_yojson access_property_value_to_yojson x.device_type_work_spaces_thin_client );
      ( "AccessEndpointConfig",
        option_to_yojson access_endpoint_config_to_yojson x.access_endpoint_config );
    ]

let workspace_directory_state_to_yojson (x : workspace_directory_state) =
  match x with
  | REGISTERING -> `String "REGISTERING"
  | REGISTERED -> `String "REGISTERED"
  | DEREGISTERING -> `String "DEREGISTERING"
  | DEREGISTERED -> `String "DEREGISTERED"
  | ERROR -> `String "ERROR"

let workspace_directory_type_to_yojson (x : workspace_directory_type) =
  match x with
  | SIMPLE_AD -> `String "SIMPLE_AD"
  | AD_CONNECTOR -> `String "AD_CONNECTOR"
  | CUSTOMER_MANAGED -> `String "CUSTOMER_MANAGED"
  | AWS_IAM_IDENTITY_CENTER -> `String "AWS_IAM_IDENTITY_CENTER"

let dns_ipv6_addresses_to_yojson tree = list_to_yojson ipv6_address_to_yojson tree
let dns_ip_addresses_to_yojson tree = list_to_yojson ip_address_to_yojson tree
let subnet_ids_to_yojson tree = list_to_yojson subnet_id_to_yojson tree
let registration_code_to_yojson = string_to_yojson
let directory_name_to_yojson = string_to_yojson

let workspace_directory_to_yojson (x : workspace_directory) =
  assoc_to_yojson
    [
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
      ("Alias", option_to_yojson alias_to_yojson x.alias);
      ("DirectoryName", option_to_yojson directory_name_to_yojson x.directory_name);
      ("RegistrationCode", option_to_yojson registration_code_to_yojson x.registration_code);
      ("SubnetIds", option_to_yojson subnet_ids_to_yojson x.subnet_ids);
      ("DnsIpAddresses", option_to_yojson dns_ip_addresses_to_yojson x.dns_ip_addresses);
      ("DnsIpv6Addresses", option_to_yojson dns_ipv6_addresses_to_yojson x.dns_ipv6_addresses);
      ("CustomerUserName", option_to_yojson user_name_to_yojson x.customer_user_name);
      ("IamRoleId", option_to_yojson ar_n_to_yojson x.iam_role_id);
      ("DirectoryType", option_to_yojson workspace_directory_type_to_yojson x.directory_type);
      ( "WorkspaceSecurityGroupId",
        option_to_yojson security_group_id_to_yojson x.workspace_security_group_id );
      ("State", option_to_yojson workspace_directory_state_to_yojson x.state);
      ( "WorkspaceCreationProperties",
        option_to_yojson default_workspace_creation_properties_to_yojson
          x.workspace_creation_properties );
      ("ipGroupIds", option_to_yojson ip_group_id_list_to_yojson x.ip_group_ids);
      ( "WorkspaceAccessProperties",
        option_to_yojson workspace_access_properties_to_yojson x.workspace_access_properties );
      ("Tenancy", option_to_yojson tenancy_to_yojson x.tenancy);
      ( "SelfservicePermissions",
        option_to_yojson selfservice_permissions_to_yojson x.selfservice_permissions );
      ("SamlProperties", option_to_yojson saml_properties_to_yojson x.saml_properties);
      ( "CertificateBasedAuthProperties",
        option_to_yojson certificate_based_auth_properties_to_yojson
          x.certificate_based_auth_properties );
      ( "EndpointEncryptionMode",
        option_to_yojson endpoint_encryption_mode_to_yojson x.endpoint_encryption_mode );
      ( "MicrosoftEntraConfig",
        option_to_yojson microsoft_entra_config_to_yojson x.microsoft_entra_config );
      ( "WorkspaceDirectoryName",
        option_to_yojson workspace_directory_name_to_yojson x.workspace_directory_name );
      ( "WorkspaceDirectoryDescription",
        option_to_yojson workspace_directory_description_to_yojson x.workspace_directory_description
      );
      ("UserIdentityType", option_to_yojson user_identity_type_to_yojson x.user_identity_type);
      ("WorkspaceType", option_to_yojson workspace_type_to_yojson x.workspace_type);
      ("IDCConfig", option_to_yojson idc_config_to_yojson x.idc_config);
      ( "ActiveDirectoryConfig",
        option_to_yojson active_directory_config_to_yojson x.active_directory_config );
      ("StreamingProperties", option_to_yojson streaming_properties_to_yojson x.streaming_properties);
      ("ErrorMessage", option_to_yojson description_to_yojson x.error_message);
    ]

let directory_list_to_yojson tree = list_to_yojson workspace_directory_to_yojson tree

let describe_workspace_directories_result_to_yojson (x : describe_workspace_directories_result) =
  assoc_to_yojson
    [
      ("Directories", option_to_yojson directory_list_to_yojson x.directories);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let describe_workspace_directories_filter_value_to_yojson = string_to_yojson

let describe_workspace_directories_filter_values_to_yojson tree =
  list_to_yojson describe_workspace_directories_filter_value_to_yojson tree

let describe_workspace_directories_filter_name_to_yojson
    (x : describe_workspace_directories_filter_name) =
  match x with
  | USER_IDENTITY_TYPE -> `String "USER_IDENTITY_TYPE"
  | WORKSPACE_TYPE -> `String "WORKSPACE_TYPE"

let describe_workspace_directories_filter_to_yojson (x : describe_workspace_directories_filter) =
  assoc_to_yojson
    [
      ("Name", Some (describe_workspace_directories_filter_name_to_yojson x.name));
      ("Values", Some (describe_workspace_directories_filter_values_to_yojson x.values));
    ]

let describe_workspace_directories_filter_list_to_yojson tree =
  list_to_yojson describe_workspace_directories_filter_to_yojson tree

let workspace_directory_name_list_to_yojson tree =
  list_to_yojson workspace_directory_name_to_yojson tree

let directory_id_list_to_yojson tree = list_to_yojson directory_id_to_yojson tree

let describe_workspace_directories_request_to_yojson (x : describe_workspace_directories_request) =
  assoc_to_yojson
    [
      ("DirectoryIds", option_to_yojson directory_id_list_to_yojson x.directory_ids);
      ( "WorkspaceDirectoryNames",
        option_to_yojson workspace_directory_name_list_to_yojson x.workspace_directory_names );
      ("Limit", option_to_yojson limit_to_yojson x.limit);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("Filters", option_to_yojson describe_workspace_directories_filter_list_to_yojson x.filters);
    ]

let image_permission_to_yojson (x : image_permission) =
  assoc_to_yojson
    [ ("SharedAccountId", option_to_yojson aws_account_to_yojson x.shared_account_id) ]

let image_permissions_to_yojson tree = list_to_yojson image_permission_to_yojson tree

let describe_workspace_image_permissions_result_to_yojson
    (x : describe_workspace_image_permissions_result) =
  assoc_to_yojson
    [
      ("ImageId", option_to_yojson workspace_image_id_to_yojson x.image_id);
      ("ImagePermissions", option_to_yojson image_permissions_to_yojson x.image_permissions);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let describe_workspace_image_permissions_request_to_yojson
    (x : describe_workspace_image_permissions_request) =
  assoc_to_yojson
    [
      ("ImageId", Some (workspace_image_id_to_yojson x.image_id));
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson limit_to_yojson x.max_results);
    ]

let workspace_image_error_detail_code_to_yojson (x : workspace_image_error_detail_code) =
  match x with
  | OUTDATED_POWERSHELL_VERSION -> `String "OutdatedPowershellVersion"
  | OFFICE_INSTALLED -> `String "OfficeInstalled"
  | PCOIP_AGENT_INSTALLED -> `String "PCoIPAgentInstalled"
  | WINDOWS_UPDATES_ENABLED -> `String "WindowsUpdatesEnabled"
  | AUTO_MOUNT_DISABLED -> `String "AutoMountDisabled"
  | WORKSPACES_BYOL_ACCOUNT_NOT_FOUND -> `String "WorkspacesBYOLAccountNotFound"
  | WORKSPACES_BYOL_ACCOUNT_DISABLED -> `String "WorkspacesBYOLAccountDisabled"
  | DHCP_DISABLED -> `String "DHCPDisabled"
  | DISK_FREE_SPACE -> `String "DiskFreeSpace"
  | ADDITIONAL_DRIVES_ATTACHED -> `String "AdditionalDrivesAttached"
  | OS_NOT_SUPPORTED -> `String "OSNotSupported"
  | DOMAIN_JOINED -> `String "DomainJoined"
  | AZURE_DOMAIN_JOINED -> `String "AzureDomainJoined"
  | FIREWALL_ENABLED -> `String "FirewallEnabled"
  | VMWARE_TOOLS_INSTALLED -> `String "VMWareToolsInstalled"
  | DISK_SIZE_EXCEEDED -> `String "DiskSizeExceeded"
  | INCOMPATIBLE_PARTITIONING -> `String "IncompatiblePartitioning"
  | PENDING_REBOOT -> `String "PendingReboot"
  | AUTO_LOGON_ENABLED -> `String "AutoLogonEnabled"
  | REALTIME_UNIVERSAL_DISABLED -> `String "RealTimeUniversalDisabled"
  | MULTIPLE_BOOT_PARTITION -> `String "MultipleBootPartition"
  | SIXTY_FOUR_BIT_OS -> `String "Requires64BitOS"
  | ZERO_REARM_COUNT -> `String "ZeroRearmCount"
  | IN_PLACE_UPGRADE -> `String "InPlaceUpgrade"
  | ANTI_VIRUS_INSTALLED -> `String "AntiVirusInstalled"
  | UEFI_NOT_SUPPORTED -> `String "UEFINotSupported"
  | UNKNOWN_ERROR -> `String "UnknownError"
  | APPX_PACKAGES_INSTALLED -> `String "AppXPackagesInstalled"
  | RESERVED_STORAGE_IN_USE -> `String "ReservedStorageInUse"
  | ADDITIONAL_DRIVES_PRESENT -> `String "AdditionalDrivesPresent"
  | WINDOWS_UPDATES_REQUIRED -> `String "WindowsUpdatesRequired"
  | SYSPREP_FILE_MISSING -> `String "SysPrepFileMissing"
  | USER_PROFILE_MISSING -> `String "UserProfileMissing"
  | INSUFFICIENT_DISK_SPACE -> `String "InsufficientDiskSpace"
  | ENVIRONMENT_VARIABLES_PATH_MISSING_ENTRIES -> `String "EnvironmentVariablesPathMissingEntries"
  | DOMAIN_ACCOUNT_SERVICES_FOUND -> `String "DomainAccountServicesFound"
  | INVALID_IP -> `String "InvalidIp"
  | REMOTE_DESKTOP_SERVICES_DISABLED -> `String "RemoteDesktopServicesDisabled"
  | WINDOWS_MODULES_INSTALLER_DISABLED -> `String "WindowsModulesInstallerDisabled"
  | AMAZON_SSM_AGENT_ENABLED -> `String "AmazonSsmAgentEnabled"
  | UNSUPPORTED_SECURITY_PROTOCOL -> `String "UnsupportedSecurityProtocol"
  | MULTIPLE_USER_PROFILES -> `String "MultipleUserProfiles"
  | STAGED_APPX_PACKAGE -> `String "StagedAppxPackage"
  | UNSUPPORTED_OS_UPGRADE -> `String "UnsupportedOsUpgrade"
  | INSUFFICIENT_REARM_COUNT -> `String "InsufficientRearmCount"
  | INCOMPATIBLE_PROTOCOL -> `String "ProtocolOSIncompatibility"
  | INCOMPATIBLE_MEMORY_INTEGRITY -> `String "MemoryIntegrityIncompatibility"
  | RESTRICTED_DRIVE_LETTER -> `String "RestrictedDriveLetterInUse"

let error_details_to_yojson (x : error_details) =
  assoc_to_yojson
    [
      ("ErrorCode", option_to_yojson workspace_image_error_detail_code_to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson description_to_yojson x.error_message);
    ]

let error_details_list_to_yojson tree = list_to_yojson error_details_to_yojson tree

let update_result_to_yojson (x : update_result) =
  assoc_to_yojson
    [
      ("UpdateAvailable", option_to_yojson boolean_object_to_yojson x.update_available);
      ("Description", option_to_yojson update_description_to_yojson x.description);
    ]

let workspace_image_error_code_to_yojson = string_to_yojson

let workspace_image_to_yojson (x : workspace_image) =
  assoc_to_yojson
    [
      ("ImageId", option_to_yojson workspace_image_id_to_yojson x.image_id);
      ("Name", option_to_yojson workspace_image_name_to_yojson x.name);
      ("Description", option_to_yojson workspace_image_description_to_yojson x.description);
      ("OperatingSystem", option_to_yojson operating_system_to_yojson x.operating_system);
      ("State", option_to_yojson workspace_image_state_to_yojson x.state);
      ( "RequiredTenancy",
        option_to_yojson workspace_image_required_tenancy_to_yojson x.required_tenancy );
      ("ErrorCode", option_to_yojson workspace_image_error_code_to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson description_to_yojson x.error_message);
      ("Created", option_to_yojson timestamp_to_yojson x.created);
      ("OwnerAccountId", option_to_yojson aws_account_to_yojson x.owner_account_id);
      ("Updates", option_to_yojson update_result_to_yojson x.updates);
      ("ErrorDetails", option_to_yojson error_details_list_to_yojson x.error_details);
    ]

let workspace_image_list_to_yojson tree = list_to_yojson workspace_image_to_yojson tree

let describe_workspace_images_result_to_yojson (x : describe_workspace_images_result) =
  assoc_to_yojson
    [
      ("Images", option_to_yojson workspace_image_list_to_yojson x.images);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let image_type_to_yojson (x : image_type) =
  match x with OWNED -> `String "OWNED" | SHARED -> `String "SHARED"

let workspace_image_id_list_to_yojson tree = list_to_yojson workspace_image_id_to_yojson tree

let describe_workspace_images_request_to_yojson (x : describe_workspace_images_request) =
  assoc_to_yojson
    [
      ("ImageIds", option_to_yojson workspace_image_id_list_to_yojson x.image_ids);
      ("ImageType", option_to_yojson image_type_to_yojson x.image_type);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson limit_to_yojson x.max_results);
    ]

let snapshot_to_yojson (x : snapshot) =
  assoc_to_yojson [ ("SnapshotTime", option_to_yojson timestamp_to_yojson x.snapshot_time) ]

let snapshot_list_to_yojson tree = list_to_yojson snapshot_to_yojson tree

let describe_workspace_snapshots_result_to_yojson (x : describe_workspace_snapshots_result) =
  assoc_to_yojson
    [
      ("RebuildSnapshots", option_to_yojson snapshot_list_to_yojson x.rebuild_snapshots);
      ("RestoreSnapshots", option_to_yojson snapshot_list_to_yojson x.restore_snapshots);
    ]

let describe_workspace_snapshots_request_to_yojson (x : describe_workspace_snapshots_request) =
  assoc_to_yojson [ ("WorkspaceId", Some (workspace_id_to_yojson x.workspace_id)) ]

let describe_workspaces_result_to_yojson (x : describe_workspaces_result) =
  assoc_to_yojson
    [
      ("Workspaces", option_to_yojson workspace_list_to_yojson x.workspaces);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let workspace_id_list_to_yojson tree = list_to_yojson workspace_id_to_yojson tree

let describe_workspaces_request_to_yojson (x : describe_workspaces_request) =
  assoc_to_yojson
    [
      ("WorkspaceIds", option_to_yojson workspace_id_list_to_yojson x.workspace_ids);
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
      ("UserName", option_to_yojson user_name_to_yojson x.user_name);
      ("BundleId", option_to_yojson bundle_id_to_yojson x.bundle_id);
      ("Limit", option_to_yojson limit_to_yojson x.limit);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("WorkspaceName", option_to_yojson workspace_name_to_yojson x.workspace_name);
    ]

let workspace_connection_status_to_yojson (x : workspace_connection_status) =
  assoc_to_yojson
    [
      ("WorkspaceId", option_to_yojson workspace_id_to_yojson x.workspace_id);
      ("ConnectionState", option_to_yojson connection_state_to_yojson x.connection_state);
      ( "ConnectionStateCheckTimestamp",
        option_to_yojson timestamp_to_yojson x.connection_state_check_timestamp );
      ( "LastKnownUserConnectionTimestamp",
        option_to_yojson timestamp_to_yojson x.last_known_user_connection_timestamp );
    ]

let workspace_connection_status_list_to_yojson tree =
  list_to_yojson workspace_connection_status_to_yojson tree

let describe_workspaces_connection_status_result_to_yojson
    (x : describe_workspaces_connection_status_result) =
  assoc_to_yojson
    [
      ( "WorkspacesConnectionStatus",
        option_to_yojson workspace_connection_status_list_to_yojson x.workspaces_connection_status
      );
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let describe_workspaces_connection_status_request_to_yojson
    (x : describe_workspaces_connection_status_request) =
  assoc_to_yojson
    [
      ("WorkspaceIds", option_to_yojson workspace_id_list_to_yojson x.workspace_ids);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let workspaces_pool_user_id_to_yojson = string_to_yojson

let network_access_configuration_to_yojson (x : network_access_configuration) =
  assoc_to_yojson
    [
      ("EniPrivateIpAddress", option_to_yojson non_empty_string_to_yojson x.eni_private_ip_address);
      ("EniId", option_to_yojson non_empty_string_to_yojson x.eni_id);
    ]

let session_instance_id_to_yojson = string_to_yojson

let session_connection_state_to_yojson (x : session_connection_state) =
  match x with CONNECTED -> `String "CONNECTED" | NOT_CONNECTED -> `String "NOT_CONNECTED"

let workspaces_pool_session_to_yojson (x : workspaces_pool_session) =
  assoc_to_yojson
    [
      ("AuthenticationType", option_to_yojson authentication_type_to_yojson x.authentication_type);
      ("ConnectionState", option_to_yojson session_connection_state_to_yojson x.connection_state);
      ("SessionId", Some (amazon_uuid_to_yojson x.session_id));
      ("InstanceId", option_to_yojson session_instance_id_to_yojson x.instance_id);
      ("PoolId", Some (workspaces_pool_id_to_yojson x.pool_id));
      ("ExpirationTime", option_to_yojson timestamp_to_yojson x.expiration_time);
      ( "NetworkAccessConfiguration",
        option_to_yojson network_access_configuration_to_yojson x.network_access_configuration );
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("UserId", Some (workspaces_pool_user_id_to_yojson x.user_id));
    ]

let workspaces_pool_sessions_to_yojson tree = list_to_yojson workspaces_pool_session_to_yojson tree

let describe_workspaces_pool_sessions_result_to_yojson
    (x : describe_workspaces_pool_sessions_result) =
  assoc_to_yojson
    [
      ("Sessions", option_to_yojson workspaces_pool_sessions_to_yojson x.sessions);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let limit50_to_yojson = int_to_yojson

let describe_workspaces_pool_sessions_request_to_yojson
    (x : describe_workspaces_pool_sessions_request) =
  assoc_to_yojson
    [
      ("PoolId", Some (workspaces_pool_id_to_yojson x.pool_id));
      ("UserId", option_to_yojson workspaces_pool_user_id_to_yojson x.user_id);
      ("Limit", option_to_yojson limit50_to_yojson x.limit);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let workspaces_pools_to_yojson tree = list_to_yojson workspaces_pool_to_yojson tree

let describe_workspaces_pools_result_to_yojson (x : describe_workspaces_pools_result) =
  assoc_to_yojson
    [
      ("WorkspacesPools", option_to_yojson workspaces_pools_to_yojson x.workspaces_pools);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let describe_workspaces_pools_filter_operator_to_yojson
    (x : describe_workspaces_pools_filter_operator) =
  match x with
  | EQUALS -> `String "EQUALS"
  | NOTEQUALS -> `String "NOTEQUALS"
  | CONTAINS -> `String "CONTAINS"
  | NOTCONTAINS -> `String "NOTCONTAINS"

let describe_workspaces_pools_filter_value_to_yojson = string_to_yojson

let describe_workspaces_pools_filter_values_to_yojson tree =
  list_to_yojson describe_workspaces_pools_filter_value_to_yojson tree

let describe_workspaces_pools_filter_name_to_yojson (x : describe_workspaces_pools_filter_name) =
  match x with POOLNAME -> `String "PoolName"

let describe_workspaces_pools_filter_to_yojson (x : describe_workspaces_pools_filter) =
  assoc_to_yojson
    [
      ("Name", Some (describe_workspaces_pools_filter_name_to_yojson x.name));
      ("Values", Some (describe_workspaces_pools_filter_values_to_yojson x.values));
      ("Operator", Some (describe_workspaces_pools_filter_operator_to_yojson x.operator));
    ]

let describe_workspaces_pools_filters_to_yojson tree =
  list_to_yojson describe_workspaces_pools_filter_to_yojson tree

let workspaces_pool_ids_to_yojson tree = list_to_yojson workspaces_pool_id_to_yojson tree

let describe_workspaces_pools_request_to_yojson (x : describe_workspaces_pools_request) =
  assoc_to_yojson
    [
      ("PoolIds", option_to_yojson workspaces_pool_ids_to_yojson x.pool_ids);
      ("Filters", option_to_yojson describe_workspaces_pools_filters_to_yojson x.filters);
      ("Limit", option_to_yojson limit_to_yojson x.limit);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let disassociate_connection_alias_result_to_yojson = unit_to_yojson

let disassociate_connection_alias_request_to_yojson (x : disassociate_connection_alias_request) =
  assoc_to_yojson [ ("AliasId", Some (connection_alias_id_to_yojson x.alias_id)) ]

let disassociate_ip_groups_result_to_yojson = unit_to_yojson

let disassociate_ip_groups_request_to_yojson (x : disassociate_ip_groups_request) =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ("GroupIds", Some (ip_group_id_list_to_yojson x.group_ids));
    ]

let disassociate_workspace_application_result_to_yojson
    (x : disassociate_workspace_application_result) =
  assoc_to_yojson
    [ ("Association", option_to_yojson workspace_resource_association_to_yojson x.association) ]

let disassociate_workspace_application_request_to_yojson
    (x : disassociate_workspace_application_request) =
  assoc_to_yojson
    [
      ("WorkspaceId", Some (workspace_id_to_yojson x.workspace_id));
      ("ApplicationId", Some (work_space_application_id_to_yojson x.application_id));
    ]

let failed_workspace_change_request_to_yojson (x : failed_workspace_change_request) =
  assoc_to_yojson
    [
      ("WorkspaceId", option_to_yojson workspace_id_to_yojson x.workspace_id);
      ("ErrorCode", option_to_yojson error_type_to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson description_to_yojson x.error_message);
    ]

let failed_reboot_workspace_requests_to_yojson tree =
  list_to_yojson failed_workspace_change_request_to_yojson tree

let failed_rebuild_workspace_requests_to_yojson tree =
  list_to_yojson failed_workspace_change_request_to_yojson tree

let failed_start_workspace_requests_to_yojson tree =
  list_to_yojson failed_workspace_change_request_to_yojson tree

let failed_stop_workspace_requests_to_yojson tree =
  list_to_yojson failed_workspace_change_request_to_yojson tree

let failed_terminate_workspace_requests_to_yojson tree =
  list_to_yojson failed_workspace_change_request_to_yojson tree

let get_account_link_result_to_yojson (x : get_account_link_result) =
  assoc_to_yojson [ ("AccountLink", option_to_yojson account_link_to_yojson x.account_link) ]

let get_account_link_request_to_yojson (x : get_account_link_request) =
  assoc_to_yojson
    [
      ("LinkId", option_to_yojson link_id_to_yojson x.link_id);
      ("LinkedAccountId", option_to_yojson aws_account_to_yojson x.linked_account_id);
    ]

let image_compute_type_to_yojson (x : image_compute_type) =
  match x with
  | BASE -> `String "BASE"
  | GRAPHICS_G4DN -> `String "GRAPHICS_G4DN"
  | GRAPHICS_G6 -> `String "GRAPHICS_G6"

let import_client_branding_result_to_yojson (x : import_client_branding_result) =
  assoc_to_yojson
    [
      ( "DeviceTypeWindows",
        option_to_yojson default_client_branding_attributes_to_yojson x.device_type_windows );
      ( "DeviceTypeOsx",
        option_to_yojson default_client_branding_attributes_to_yojson x.device_type_osx );
      ( "DeviceTypeAndroid",
        option_to_yojson default_client_branding_attributes_to_yojson x.device_type_android );
      ("DeviceTypeIos", option_to_yojson ios_client_branding_attributes_to_yojson x.device_type_ios);
      ( "DeviceTypeLinux",
        option_to_yojson default_client_branding_attributes_to_yojson x.device_type_linux );
      ( "DeviceTypeWeb",
        option_to_yojson default_client_branding_attributes_to_yojson x.device_type_web );
    ]

let ios3_x_logo_to_yojson = blob_to_yojson
let ios2_x_logo_to_yojson = blob_to_yojson
let ios_logo_to_yojson = blob_to_yojson

let ios_import_client_branding_attributes_to_yojson (x : ios_import_client_branding_attributes) =
  assoc_to_yojson
    [
      ("Logo", option_to_yojson ios_logo_to_yojson x.logo);
      ("Logo2x", option_to_yojson ios2_x_logo_to_yojson x.logo2x);
      ("Logo3x", option_to_yojson ios3_x_logo_to_yojson x.logo3x);
      ("SupportEmail", option_to_yojson client_email_to_yojson x.support_email);
      ("SupportLink", option_to_yojson client_url_to_yojson x.support_link);
      ("ForgotPasswordLink", option_to_yojson client_url_to_yojson x.forgot_password_link);
      ("LoginMessage", option_to_yojson login_message_to_yojson x.login_message);
    ]

let import_client_branding_request_to_yojson (x : import_client_branding_request) =
  assoc_to_yojson
    [
      ("ResourceId", Some (directory_id_to_yojson x.resource_id));
      ( "DeviceTypeWindows",
        option_to_yojson default_import_client_branding_attributes_to_yojson x.device_type_windows
      );
      ( "DeviceTypeOsx",
        option_to_yojson default_import_client_branding_attributes_to_yojson x.device_type_osx );
      ( "DeviceTypeAndroid",
        option_to_yojson default_import_client_branding_attributes_to_yojson x.device_type_android
      );
      ( "DeviceTypeIos",
        option_to_yojson ios_import_client_branding_attributes_to_yojson x.device_type_ios );
      ( "DeviceTypeLinux",
        option_to_yojson default_import_client_branding_attributes_to_yojson x.device_type_linux );
      ( "DeviceTypeWeb",
        option_to_yojson default_import_client_branding_attributes_to_yojson x.device_type_web );
    ]

let import_custom_workspace_image_result_to_yojson (x : import_custom_workspace_image_result) =
  assoc_to_yojson
    [
      ("ImageId", option_to_yojson workspace_image_id_to_yojson x.image_id);
      ("State", option_to_yojson custom_workspace_image_import_state_to_yojson x.state);
    ]

let os_version_to_yojson (x : os_version) =
  match x with Windows_10 -> `String "Windows_10" | Windows_11 -> `String "Windows_11"

let platform_to_yojson (x : platform) = match x with WINDOWS -> `String "WINDOWS"

let import_custom_workspace_image_request_to_yojson (x : import_custom_workspace_image_request) =
  assoc_to_yojson
    [
      ("ImageName", Some (workspace_image_name_to_yojson x.image_name));
      ("ImageDescription", Some (workspace_image_description_to_yojson x.image_description));
      ("ComputeType", Some (image_compute_type_to_yojson x.compute_type));
      ("Protocol", Some (custom_image_protocol_to_yojson x.protocol));
      ("ImageSource", Some (image_source_identifier_to_yojson x.image_source));
      ( "InfrastructureConfigurationArn",
        Some (infrastructure_configuration_arn_to_yojson x.infrastructure_configuration_arn) );
      ("Platform", Some (platform_to_yojson x.platform));
      ("OsVersion", Some (os_version_to_yojson x.os_version));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let import_workspace_image_result_to_yojson (x : import_workspace_image_result) =
  assoc_to_yojson [ ("ImageId", option_to_yojson workspace_image_id_to_yojson x.image_id) ]

let workspace_image_ingestion_process_to_yojson (x : workspace_image_ingestion_process) =
  match x with
  | BYOL_REGULAR -> `String "BYOL_REGULAR"
  | BYOL_GRAPHICS -> `String "BYOL_GRAPHICS"
  | BYOL_GRAPHICSPRO -> `String "BYOL_GRAPHICSPRO"
  | BYOL_GRAPHICS_G4DN -> `String "BYOL_GRAPHICS_G4DN"
  | BYOL_REGULAR_WSP -> `String "BYOL_REGULAR_WSP"
  | BYOL_GRAPHICS_G4DN_WSP -> `String "BYOL_GRAPHICS_G4DN_WSP"
  | BYOL_REGULAR_BYOP -> `String "BYOL_REGULAR_BYOP"
  | BYOL_GRAPHICS_G4DN_BYOP -> `String "BYOL_GRAPHICS_G4DN_BYOP"

let import_workspace_image_request_to_yojson (x : import_workspace_image_request) =
  assoc_to_yojson
    [
      ("Ec2ImageId", Some (ec2_image_id_to_yojson x.ec2_image_id));
      ("IngestionProcess", Some (workspace_image_ingestion_process_to_yojson x.ingestion_process));
      ("ImageName", Some (workspace_image_name_to_yojson x.image_name));
      ("ImageDescription", Some (workspace_image_description_to_yojson x.image_description));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("Applications", option_to_yojson application_list_to_yojson x.applications);
    ]

let invalid_parameter_combination_exception_to_yojson (x : invalid_parameter_combination_exception)
    =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let ip_revoked_rule_list_to_yojson tree = list_to_yojson ip_rule_to_yojson tree
let link_status_filter_list_to_yojson tree = list_to_yojson account_link_status_enum_to_yojson tree

let list_account_links_result_to_yojson (x : list_account_links_result) =
  assoc_to_yojson
    [
      ("AccountLinks", option_to_yojson account_link_list_to_yojson x.account_links);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_account_links_request_to_yojson (x : list_account_links_request) =
  assoc_to_yojson
    [
      ("LinkStatusFilter", option_to_yojson link_status_filter_list_to_yojson x.link_status_filter);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson limit_to_yojson x.max_results);
    ]

let list_available_management_cidr_ranges_result_to_yojson
    (x : list_available_management_cidr_ranges_result) =
  assoc_to_yojson
    [
      ( "ManagementCidrRanges",
        option_to_yojson dedicated_tenancy_cidr_range_list_to_yojson x.management_cidr_ranges );
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let management_cidr_range_max_results_to_yojson = int_to_yojson
let management_cidr_range_constraint_to_yojson = string_to_yojson

let list_available_management_cidr_ranges_request_to_yojson
    (x : list_available_management_cidr_ranges_request) =
  assoc_to_yojson
    [
      ( "ManagementCidrRangeConstraint",
        Some (management_cidr_range_constraint_to_yojson x.management_cidr_range_constraint) );
      ("MaxResults", option_to_yojson management_cidr_range_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let operation_in_progress_exception_to_yojson (x : operation_in_progress_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let migrate_workspace_result_to_yojson (x : migrate_workspace_result) =
  assoc_to_yojson
    [
      ("SourceWorkspaceId", option_to_yojson workspace_id_to_yojson x.source_workspace_id);
      ("TargetWorkspaceId", option_to_yojson workspace_id_to_yojson x.target_workspace_id);
    ]

let migrate_workspace_request_to_yojson (x : migrate_workspace_request) =
  assoc_to_yojson
    [
      ("SourceWorkspaceId", Some (workspace_id_to_yojson x.source_workspace_id));
      ("BundleId", Some (bundle_id_to_yojson x.bundle_id));
    ]

let modify_account_result_to_yojson (x : modify_account_result) =
  assoc_to_yojson [ ("Message", option_to_yojson message_to_yojson x.message) ]

let modify_account_request_to_yojson (x : modify_account_request) =
  assoc_to_yojson
    [
      ( "DedicatedTenancySupport",
        option_to_yojson dedicated_tenancy_support_enum_to_yojson x.dedicated_tenancy_support );
      ( "DedicatedTenancyManagementCidrRange",
        option_to_yojson dedicated_tenancy_management_cidr_range_to_yojson
          x.dedicated_tenancy_management_cidr_range );
    ]

let modify_certificate_based_auth_properties_result_to_yojson = unit_to_yojson

let modify_certificate_based_auth_properties_request_to_yojson
    (x : modify_certificate_based_auth_properties_request) =
  assoc_to_yojson
    [
      ("ResourceId", Some (directory_id_to_yojson x.resource_id));
      ( "CertificateBasedAuthProperties",
        option_to_yojson certificate_based_auth_properties_to_yojson
          x.certificate_based_auth_properties );
      ( "PropertiesToDelete",
        option_to_yojson deletable_certificate_based_auth_properties_list_to_yojson
          x.properties_to_delete );
    ]

let modify_client_properties_result_to_yojson = unit_to_yojson

let modify_client_properties_request_to_yojson (x : modify_client_properties_request) =
  assoc_to_yojson
    [
      ("ResourceId", Some (non_empty_string_to_yojson x.resource_id));
      ("ClientProperties", Some (client_properties_to_yojson x.client_properties));
    ]

let modify_endpoint_encryption_mode_response_to_yojson = unit_to_yojson

let modify_endpoint_encryption_mode_request_to_yojson (x : modify_endpoint_encryption_mode_request)
    =
  assoc_to_yojson
    [
      ("DirectoryId", Some (directory_id_to_yojson x.directory_id));
      ( "EndpointEncryptionMode",
        Some (endpoint_encryption_mode_to_yojson x.endpoint_encryption_mode) );
    ]

let modify_saml_properties_result_to_yojson = unit_to_yojson

let modify_saml_properties_request_to_yojson (x : modify_saml_properties_request) =
  assoc_to_yojson
    [
      ("ResourceId", Some (directory_id_to_yojson x.resource_id));
      ("SamlProperties", option_to_yojson saml_properties_to_yojson x.saml_properties);
      ( "PropertiesToDelete",
        option_to_yojson deletable_saml_properties_list_to_yojson x.properties_to_delete );
    ]

let modify_selfservice_permissions_result_to_yojson = unit_to_yojson

let modify_selfservice_permissions_request_to_yojson (x : modify_selfservice_permissions_request) =
  assoc_to_yojson
    [
      ("ResourceId", Some (directory_id_to_yojson x.resource_id));
      ("SelfservicePermissions", Some (selfservice_permissions_to_yojson x.selfservice_permissions));
    ]

let modify_streaming_properties_result_to_yojson = unit_to_yojson

let modify_streaming_properties_request_to_yojson (x : modify_streaming_properties_request) =
  assoc_to_yojson
    [
      ("ResourceId", Some (directory_id_to_yojson x.resource_id));
      ("StreamingProperties", option_to_yojson streaming_properties_to_yojson x.streaming_properties);
    ]

let modify_workspace_access_properties_result_to_yojson = unit_to_yojson

let modify_workspace_access_properties_request_to_yojson
    (x : modify_workspace_access_properties_request) =
  assoc_to_yojson
    [
      ("ResourceId", Some (directory_id_to_yojson x.resource_id));
      ( "WorkspaceAccessProperties",
        Some (workspace_access_properties_to_yojson x.workspace_access_properties) );
    ]

let modify_workspace_creation_properties_result_to_yojson = unit_to_yojson

let workspace_creation_properties_to_yojson (x : workspace_creation_properties) =
  assoc_to_yojson
    [
      ("EnableInternetAccess", option_to_yojson boolean_object_to_yojson x.enable_internet_access);
      ("DefaultOu", option_to_yojson default_ou_to_yojson x.default_ou);
      ( "CustomSecurityGroupId",
        option_to_yojson security_group_id_to_yojson x.custom_security_group_id );
      ( "UserEnabledAsLocalAdministrator",
        option_to_yojson boolean_object_to_yojson x.user_enabled_as_local_administrator );
      ("EnableMaintenanceMode", option_to_yojson boolean_object_to_yojson x.enable_maintenance_mode);
      ("InstanceIamRoleArn", option_to_yojson ar_n_to_yojson x.instance_iam_role_arn);
    ]

let modify_workspace_creation_properties_request_to_yojson
    (x : modify_workspace_creation_properties_request) =
  assoc_to_yojson
    [
      ("ResourceId", Some (directory_id_to_yojson x.resource_id));
      ( "WorkspaceCreationProperties",
        Some (workspace_creation_properties_to_yojson x.workspace_creation_properties) );
    ]

let unsupported_workspace_configuration_exception_to_yojson
    (x : unsupported_workspace_configuration_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let modify_workspace_properties_result_to_yojson = unit_to_yojson

let modify_workspace_properties_request_to_yojson (x : modify_workspace_properties_request) =
  assoc_to_yojson
    [
      ("WorkspaceId", Some (workspace_id_to_yojson x.workspace_id));
      ("WorkspaceProperties", option_to_yojson workspace_properties_to_yojson x.workspace_properties);
      ("DataReplication", option_to_yojson data_replication_to_yojson x.data_replication);
    ]

let modify_workspace_state_result_to_yojson = unit_to_yojson

let target_workspace_state_to_yojson (x : target_workspace_state) =
  match x with AVAILABLE -> `String "AVAILABLE" | ADMIN_MAINTENANCE -> `String "ADMIN_MAINTENANCE"

let modify_workspace_state_request_to_yojson (x : modify_workspace_state_request) =
  assoc_to_yojson
    [
      ("WorkspaceId", Some (workspace_id_to_yojson x.workspace_id));
      ("WorkspaceState", Some (target_workspace_state_to_yojson x.workspace_state));
    ]

let reboot_request_to_yojson (x : reboot_request) =
  assoc_to_yojson [ ("WorkspaceId", Some (workspace_id_to_yojson x.workspace_id)) ]

let reboot_workspace_requests_to_yojson tree = list_to_yojson reboot_request_to_yojson tree

let reboot_workspaces_result_to_yojson (x : reboot_workspaces_result) =
  assoc_to_yojson
    [
      ( "FailedRequests",
        option_to_yojson failed_reboot_workspace_requests_to_yojson x.failed_requests );
    ]

let reboot_workspaces_request_to_yojson (x : reboot_workspaces_request) =
  assoc_to_yojson
    [
      ( "RebootWorkspaceRequests",
        Some (reboot_workspace_requests_to_yojson x.reboot_workspace_requests) );
    ]

let rebuild_request_to_yojson (x : rebuild_request) =
  assoc_to_yojson [ ("WorkspaceId", Some (workspace_id_to_yojson x.workspace_id)) ]

let rebuild_workspace_requests_to_yojson tree = list_to_yojson rebuild_request_to_yojson tree

let rebuild_workspaces_result_to_yojson (x : rebuild_workspaces_result) =
  assoc_to_yojson
    [
      ( "FailedRequests",
        option_to_yojson failed_rebuild_workspace_requests_to_yojson x.failed_requests );
    ]

let rebuild_workspaces_request_to_yojson (x : rebuild_workspaces_request) =
  assoc_to_yojson
    [
      ( "RebuildWorkspaceRequests",
        Some (rebuild_workspace_requests_to_yojson x.rebuild_workspace_requests) );
    ]

let workspaces_default_role_not_found_exception_to_yojson
    (x : workspaces_default_role_not_found_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let unsupported_network_configuration_exception_to_yojson
    (x : unsupported_network_configuration_exception) =
  assoc_to_yojson [ ("message", option_to_yojson exception_message_to_yojson x.message) ]

let register_workspace_directory_result_to_yojson (x : register_workspace_directory_result) =
  assoc_to_yojson
    [
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
      ("State", option_to_yojson workspace_directory_state_to_yojson x.state);
    ]

let register_workspace_directory_request_to_yojson (x : register_workspace_directory_request) =
  assoc_to_yojson
    [
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
      ("SubnetIds", option_to_yojson subnet_ids_to_yojson x.subnet_ids);
      ("EnableSelfService", option_to_yojson boolean_object_to_yojson x.enable_self_service);
      ("Tenancy", option_to_yojson tenancy_to_yojson x.tenancy);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "WorkspaceDirectoryName",
        option_to_yojson workspace_directory_name_to_yojson x.workspace_directory_name );
      ( "WorkspaceDirectoryDescription",
        option_to_yojson workspace_directory_description_to_yojson x.workspace_directory_description
      );
      ("UserIdentityType", option_to_yojson user_identity_type_to_yojson x.user_identity_type);
      ("IdcInstanceArn", option_to_yojson ar_n_to_yojson x.idc_instance_arn);
      ( "MicrosoftEntraConfig",
        option_to_yojson microsoft_entra_config_to_yojson x.microsoft_entra_config );
      ("WorkspaceType", option_to_yojson workspace_type_to_yojson x.workspace_type);
      ( "ActiveDirectoryConfig",
        option_to_yojson active_directory_config_to_yojson x.active_directory_config );
    ]

let reject_account_link_invitation_result_to_yojson (x : reject_account_link_invitation_result) =
  assoc_to_yojson [ ("AccountLink", option_to_yojson account_link_to_yojson x.account_link) ]

let reject_account_link_invitation_request_to_yojson (x : reject_account_link_invitation_request) =
  assoc_to_yojson
    [
      ("LinkId", Some (link_id_to_yojson x.link_id));
      ("ClientToken", option_to_yojson client_token_to_yojson x.client_token);
    ]

let restore_workspace_result_to_yojson = unit_to_yojson

let restore_workspace_request_to_yojson (x : restore_workspace_request) =
  assoc_to_yojson [ ("WorkspaceId", Some (workspace_id_to_yojson x.workspace_id)) ]

let revoke_ip_rules_result_to_yojson = unit_to_yojson

let revoke_ip_rules_request_to_yojson (x : revoke_ip_rules_request) =
  assoc_to_yojson
    [
      ("GroupId", Some (ip_group_id_to_yojson x.group_id));
      ("UserRules", Some (ip_revoked_rule_list_to_yojson x.user_rules));
    ]

let start_request_to_yojson (x : start_request) =
  assoc_to_yojson [ ("WorkspaceId", option_to_yojson workspace_id_to_yojson x.workspace_id) ]

let start_workspace_requests_to_yojson tree = list_to_yojson start_request_to_yojson tree

let start_workspaces_result_to_yojson (x : start_workspaces_result) =
  assoc_to_yojson
    [
      ( "FailedRequests",
        option_to_yojson failed_start_workspace_requests_to_yojson x.failed_requests );
    ]

let start_workspaces_request_to_yojson (x : start_workspaces_request) =
  assoc_to_yojson
    [
      ( "StartWorkspaceRequests",
        Some (start_workspace_requests_to_yojson x.start_workspace_requests) );
    ]

let start_workspaces_pool_result_to_yojson = unit_to_yojson

let start_workspaces_pool_request_to_yojson (x : start_workspaces_pool_request) =
  assoc_to_yojson [ ("PoolId", Some (workspaces_pool_id_to_yojson x.pool_id)) ]

let stop_request_to_yojson (x : stop_request) =
  assoc_to_yojson [ ("WorkspaceId", option_to_yojson workspace_id_to_yojson x.workspace_id) ]

let stop_workspace_requests_to_yojson tree = list_to_yojson stop_request_to_yojson tree

let stop_workspaces_result_to_yojson (x : stop_workspaces_result) =
  assoc_to_yojson
    [
      ("FailedRequests", option_to_yojson failed_stop_workspace_requests_to_yojson x.failed_requests);
    ]

let stop_workspaces_request_to_yojson (x : stop_workspaces_request) =
  assoc_to_yojson
    [
      ("StopWorkspaceRequests", Some (stop_workspace_requests_to_yojson x.stop_workspace_requests));
    ]

let stop_workspaces_pool_result_to_yojson = unit_to_yojson

let stop_workspaces_pool_request_to_yojson (x : stop_workspaces_pool_request) =
  assoc_to_yojson [ ("PoolId", Some (workspaces_pool_id_to_yojson x.pool_id)) ]

let terminate_request_to_yojson (x : terminate_request) =
  assoc_to_yojson [ ("WorkspaceId", Some (workspace_id_to_yojson x.workspace_id)) ]

let terminate_workspace_requests_to_yojson tree = list_to_yojson terminate_request_to_yojson tree

let terminate_workspaces_result_to_yojson (x : terminate_workspaces_result) =
  assoc_to_yojson
    [
      ( "FailedRequests",
        option_to_yojson failed_terminate_workspace_requests_to_yojson x.failed_requests );
    ]

let terminate_workspaces_request_to_yojson (x : terminate_workspaces_request) =
  assoc_to_yojson
    [
      ( "TerminateWorkspaceRequests",
        Some (terminate_workspace_requests_to_yojson x.terminate_workspace_requests) );
    ]

let terminate_workspaces_pool_result_to_yojson = unit_to_yojson

let terminate_workspaces_pool_request_to_yojson (x : terminate_workspaces_pool_request) =
  assoc_to_yojson [ ("PoolId", Some (workspaces_pool_id_to_yojson x.pool_id)) ]

let terminate_workspaces_pool_session_result_to_yojson = unit_to_yojson

let terminate_workspaces_pool_session_request_to_yojson
    (x : terminate_workspaces_pool_session_request) =
  assoc_to_yojson [ ("SessionId", Some (amazon_uuid_to_yojson x.session_id)) ]

let update_connect_client_add_in_result_to_yojson = unit_to_yojson

let update_connect_client_add_in_request_to_yojson (x : update_connect_client_add_in_request) =
  assoc_to_yojson
    [
      ("AddInId", Some (amazon_uuid_to_yojson x.add_in_id));
      ("ResourceId", Some (directory_id_to_yojson x.resource_id));
      ("Name", option_to_yojson add_in_name_to_yojson x.name);
      ("URL", option_to_yojson add_in_url_to_yojson x.ur_l);
    ]

let update_connection_alias_permission_result_to_yojson = unit_to_yojson

let update_connection_alias_permission_request_to_yojson
    (x : update_connection_alias_permission_request) =
  assoc_to_yojson
    [
      ("AliasId", Some (connection_alias_id_to_yojson x.alias_id));
      ( "ConnectionAliasPermission",
        Some (connection_alias_permission_to_yojson x.connection_alias_permission) );
    ]

let update_rules_of_ip_group_result_to_yojson = unit_to_yojson

let update_rules_of_ip_group_request_to_yojson (x : update_rules_of_ip_group_request) =
  assoc_to_yojson
    [
      ("GroupId", Some (ip_group_id_to_yojson x.group_id));
      ("UserRules", Some (ip_rule_list_to_yojson x.user_rules));
    ]

let update_workspace_bundle_result_to_yojson = unit_to_yojson

let update_workspace_bundle_request_to_yojson (x : update_workspace_bundle_request) =
  assoc_to_yojson
    [
      ("BundleId", option_to_yojson bundle_id_to_yojson x.bundle_id);
      ("ImageId", option_to_yojson workspace_image_id_to_yojson x.image_id);
    ]

let update_workspace_image_permission_result_to_yojson = unit_to_yojson

let update_workspace_image_permission_request_to_yojson
    (x : update_workspace_image_permission_request) =
  assoc_to_yojson
    [
      ("ImageId", Some (workspace_image_id_to_yojson x.image_id));
      ("AllowCopyImage", Some (boolean_object_to_yojson x.allow_copy_image));
      ("SharedAccountId", Some (aws_account_to_yojson x.shared_account_id));
    ]

let update_workspaces_pool_result_to_yojson (x : update_workspaces_pool_result) =
  assoc_to_yojson
    [ ("WorkspacesPool", option_to_yojson workspaces_pool_to_yojson x.workspaces_pool) ]

let update_workspaces_pool_request_to_yojson (x : update_workspaces_pool_request) =
  assoc_to_yojson
    [
      ("PoolId", Some (workspaces_pool_id_to_yojson x.pool_id));
      ("Description", option_to_yojson update_description_to_yojson x.description);
      ("BundleId", option_to_yojson bundle_id_to_yojson x.bundle_id);
      ("DirectoryId", option_to_yojson directory_id_to_yojson x.directory_id);
      ("Capacity", option_to_yojson capacity_to_yojson x.capacity);
      ( "ApplicationSettings",
        option_to_yojson application_settings_request_to_yojson x.application_settings );
      ("TimeoutSettings", option_to_yojson timeout_settings_to_yojson x.timeout_settings);
      ("RunningMode", option_to_yojson pools_running_mode_to_yojson x.running_mode);
    ]
