open Smaws_Lib.Json.SerializeHelpers
open Types

let string__to_yojson = string_to_yojson

let access_endpoint_type_to_yojson (x : access_endpoint_type) =
  match x with STREAMING -> `String "STREAMING"

let access_endpoint_to_yojson (x : access_endpoint) =
  assoc_to_yojson
    [
      ("EndpointType", Some (access_endpoint_type_to_yojson x.endpoint_type));
      ("VpceId", option_to_yojson string__to_yojson x.vpce_id);
    ]

let access_endpoint_list_to_yojson tree = list_to_yojson access_endpoint_to_yojson tree
let account_name_to_yojson = string_to_yojson
let account_password_to_yojson = string_to_yojson

let action_to_yojson (x : action) =
  match x with
  | CLIPBOARD_COPY_FROM_LOCAL_DEVICE -> `String "CLIPBOARD_COPY_FROM_LOCAL_DEVICE"
  | CLIPBOARD_COPY_TO_LOCAL_DEVICE -> `String "CLIPBOARD_COPY_TO_LOCAL_DEVICE"
  | FILE_UPLOAD -> `String "FILE_UPLOAD"
  | FILE_DOWNLOAD -> `String "FILE_DOWNLOAD"
  | PRINTING_TO_LOCAL_DEVICE -> `String "PRINTING_TO_LOCAL_DEVICE"
  | DOMAIN_PASSWORD_SIGNIN -> `String "DOMAIN_PASSWORD_SIGNIN"
  | DOMAIN_SMART_CARD_SIGNIN -> `String "DOMAIN_SMART_CARD_SIGNIN"
  | AUTO_TIME_ZONE_REDIRECTION -> `String "AUTO_TIME_ZONE_REDIRECTION"

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson
let aws_account_id_to_yojson = string_to_yojson

let admin_app_license_usage_record_to_yojson (x : admin_app_license_usage_record) =
  assoc_to_yojson
    [
      ("UserArn", Some (string__to_yojson x.user_arn));
      ("BillingPeriod", Some (string__to_yojson x.billing_period));
      ("OwnerAWSAccountId", Some (aws_account_id_to_yojson x.owner_aws_account_id));
      ("SubscriptionFirstUsedDate", Some (timestamp_to_yojson x.subscription_first_used_date));
      ("SubscriptionLastUsedDate", Some (timestamp_to_yojson x.subscription_last_used_date));
      ("LicenseType", Some (string__to_yojson x.license_type));
      ("UserId", Some (string__to_yojson x.user_id));
    ]

let admin_app_license_usage_list_to_yojson tree =
  list_to_yojson admin_app_license_usage_record_to_yojson tree

let user_control_mode_to_yojson (x : user_control_mode) =
  match x with
  | VIEW_ONLY -> `String "VIEW_ONLY"
  | VIEW_STOP -> `String "VIEW_STOP"
  | DISABLED -> `String "DISABLED"

let screen_image_format_to_yojson (x : screen_image_format) =
  match x with PNG -> `String "PNG" | JPEG -> `String "JPEG"

let screen_resolution_to_yojson (x : screen_resolution) =
  match x with W_1280xH_720 -> `String "W_1280xH_720"

let boolean_object_to_yojson = bool_to_yojson
let s3_bucket_arn_to_yojson = string_to_yojson

let permission_to_yojson (x : permission) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let agent_action_to_yojson (x : agent_action) =
  match x with
  | COMPUTER_VISION -> `String "COMPUTER_VISION"
  | COMPUTER_INPUT -> `String "COMPUTER_INPUT"
  | FORWARD_MCP_TOOLS -> `String "FORWARD_MCP_TOOLS"

let agent_access_setting_to_yojson (x : agent_access_setting) =
  assoc_to_yojson
    [
      ("AgentAction", Some (agent_action_to_yojson x.agent_action));
      ("Permission", Some (permission_to_yojson x.permission));
    ]

let agent_access_setting_list_to_yojson tree = list_to_yojson agent_access_setting_to_yojson tree

let agent_access_config_to_yojson (x : agent_access_config) =
  assoc_to_yojson
    [
      ("Settings", Some (agent_access_setting_list_to_yojson x.settings));
      ("S3BucketArn", option_to_yojson s3_bucket_arn_to_yojson x.s3_bucket_arn);
      ( "ScreenshotsUploadEnabled",
        option_to_yojson boolean_object_to_yojson x.screenshots_upload_enabled );
      ("ScreenResolution", Some (screen_resolution_to_yojson x.screen_resolution));
      ("ScreenImageFormat", Some (screen_image_format_to_yojson x.screen_image_format));
      ("UserControlMode", option_to_yojson user_control_mode_to_yojson x.user_control_mode);
    ]

let agent_access_config_for_update_to_yojson (x : agent_access_config_for_update) =
  assoc_to_yojson
    [
      ("Settings", option_to_yojson agent_access_setting_list_to_yojson x.settings);
      ("S3BucketArn", option_to_yojson s3_bucket_arn_to_yojson x.s3_bucket_arn);
      ( "ScreenshotsUploadEnabled",
        option_to_yojson boolean_object_to_yojson x.screenshots_upload_enabled );
      ("ScreenResolution", option_to_yojson screen_resolution_to_yojson x.screen_resolution);
      ("ScreenImageFormat", option_to_yojson screen_image_format_to_yojson x.screen_image_format);
      ("UserControlMode", option_to_yojson user_control_mode_to_yojson x.user_control_mode);
    ]

let agent_software_version_to_yojson (x : agent_software_version) =
  match x with
  | CURRENT_LATEST -> `String "CURRENT_LATEST"
  | ALWAYS_LATEST -> `String "ALWAYS_LATEST"

let ami_name_to_yojson = string_to_yojson

let error_details_to_yojson (x : error_details) =
  assoc_to_yojson
    [
      ("ErrorCode", option_to_yojson string__to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson string__to_yojson x.error_message);
    ]

let error_details_list_to_yojson tree = list_to_yojson error_details_to_yojson tree

let app_block_state_to_yojson (x : app_block_state) =
  match x with INACTIVE -> `String "INACTIVE" | ACTIVE -> `String "ACTIVE"

let packaging_type_to_yojson (x : packaging_type) =
  match x with CUSTOM -> `String "CUSTOM" | APPSTREAM2 -> `String "APPSTREAM2"

let integer_to_yojson = int_to_yojson
let s3_key_to_yojson = string_to_yojson
let s3_bucket_to_yojson = string_to_yojson

let s3_location_to_yojson (x : s3_location) =
  assoc_to_yojson
    [
      ("S3Bucket", Some (s3_bucket_to_yojson x.s3_bucket));
      ("S3Key", option_to_yojson s3_key_to_yojson x.s3_key);
    ]

let script_details_to_yojson (x : script_details) =
  assoc_to_yojson
    [
      ("ScriptS3Location", Some (s3_location_to_yojson x.script_s3_location));
      ("ExecutablePath", Some (string__to_yojson x.executable_path));
      ("ExecutableParameters", option_to_yojson string__to_yojson x.executable_parameters);
      ("TimeoutInSeconds", Some (integer_to_yojson x.timeout_in_seconds));
    ]

let arn_to_yojson = string_to_yojson

let app_block_to_yojson (x : app_block) =
  assoc_to_yojson
    [
      ("Name", Some (string__to_yojson x.name));
      ("Arn", Some (arn_to_yojson x.arn));
      ("Description", option_to_yojson string__to_yojson x.description);
      ("DisplayName", option_to_yojson string__to_yojson x.display_name);
      ("SourceS3Location", option_to_yojson s3_location_to_yojson x.source_s3_location);
      ("SetupScriptDetails", option_to_yojson script_details_to_yojson x.setup_script_details);
      ("CreatedTime", option_to_yojson timestamp_to_yojson x.created_time);
      ( "PostSetupScriptDetails",
        option_to_yojson script_details_to_yojson x.post_setup_script_details );
      ("PackagingType", option_to_yojson packaging_type_to_yojson x.packaging_type);
      ("State", option_to_yojson app_block_state_to_yojson x.state);
      ("AppBlockErrors", option_to_yojson error_details_list_to_yojson x.app_block_errors);
    ]

let app_block_builder_state_change_reason_code_to_yojson
    (x : app_block_builder_state_change_reason_code) =
  match x with INTERNAL_ERROR -> `String "INTERNAL_ERROR"

let app_block_builder_state_change_reason_to_yojson (x : app_block_builder_state_change_reason) =
  assoc_to_yojson
    [
      ("Code", option_to_yojson app_block_builder_state_change_reason_code_to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let fleet_error_code_to_yojson (x : fleet_error_code) =
  match x with
  | IAM_SERVICE_ROLE_MISSING_ENI_DESCRIBE_ACTION ->
      `String "IAM_SERVICE_ROLE_MISSING_ENI_DESCRIBE_ACTION"
  | IAM_SERVICE_ROLE_MISSING_ENI_CREATE_ACTION ->
      `String "IAM_SERVICE_ROLE_MISSING_ENI_CREATE_ACTION"
  | IAM_SERVICE_ROLE_MISSING_ENI_DELETE_ACTION ->
      `String "IAM_SERVICE_ROLE_MISSING_ENI_DELETE_ACTION"
  | NETWORK_INTERFACE_LIMIT_EXCEEDED -> `String "NETWORK_INTERFACE_LIMIT_EXCEEDED"
  | INTERNAL_SERVICE_ERROR -> `String "INTERNAL_SERVICE_ERROR"
  | IAM_SERVICE_ROLE_IS_MISSING -> `String "IAM_SERVICE_ROLE_IS_MISSING"
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
  | FLEET_STOPPED -> `String "FLEET_STOPPED"
  | FLEET_INSTANCE_PROVISIONING_FAILURE -> `String "FLEET_INSTANCE_PROVISIONING_FAILURE"
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
  | VALIDATION_ERROR -> `String "VALIDATION_ERROR"

let resource_error_to_yojson (x : resource_error) =
  assoc_to_yojson
    [
      ("ErrorCode", option_to_yojson fleet_error_code_to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson string__to_yojson x.error_message);
      ("ErrorTimestamp", option_to_yojson timestamp_to_yojson x.error_timestamp);
    ]

let resource_errors_to_yojson tree = list_to_yojson resource_error_to_yojson tree

let app_block_builder_state_to_yojson (x : app_block_builder_state) =
  match x with
  | STARTING -> `String "STARTING"
  | RUNNING -> `String "RUNNING"
  | STOPPING -> `String "STOPPING"
  | STOPPED -> `String "STOPPED"

let security_group_id_list_to_yojson tree = list_to_yojson string__to_yojson tree
let subnet_id_list_to_yojson tree = list_to_yojson string__to_yojson tree

let vpc_config_to_yojson (x : vpc_config) =
  assoc_to_yojson
    [
      ("SubnetIds", option_to_yojson subnet_id_list_to_yojson x.subnet_ids);
      ("SecurityGroupIds", option_to_yojson security_group_id_list_to_yojson x.security_group_ids);
    ]

let app_block_builder_platform_type_to_yojson (x : app_block_builder_platform_type) =
  match x with WINDOWS_SERVER_2019 -> `String "WINDOWS_SERVER_2019"

let app_block_builder_to_yojson (x : app_block_builder) =
  assoc_to_yojson
    [
      ("Arn", Some (arn_to_yojson x.arn));
      ("Name", Some (string__to_yojson x.name));
      ("DisplayName", option_to_yojson string__to_yojson x.display_name);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Platform", Some (app_block_builder_platform_type_to_yojson x.platform));
      ("InstanceType", Some (string__to_yojson x.instance_type));
      ( "EnableDefaultInternetAccess",
        option_to_yojson boolean_object_to_yojson x.enable_default_internet_access );
      ("IamRoleArn", option_to_yojson arn_to_yojson x.iam_role_arn);
      ("VpcConfig", Some (vpc_config_to_yojson x.vpc_config));
      ("State", Some (app_block_builder_state_to_yojson x.state));
      ("CreatedTime", option_to_yojson timestamp_to_yojson x.created_time);
      ( "AppBlockBuilderErrors",
        option_to_yojson resource_errors_to_yojson x.app_block_builder_errors );
      ( "StateChangeReason",
        option_to_yojson app_block_builder_state_change_reason_to_yojson x.state_change_reason );
      ("AccessEndpoints", option_to_yojson access_endpoint_list_to_yojson x.access_endpoints);
      ("DisableIMDSV1", option_to_yojson boolean_object_to_yojson x.disable_imds_v1);
    ]

let name_to_yojson = string_to_yojson

let app_block_builder_app_block_association_to_yojson (x : app_block_builder_app_block_association)
    =
  assoc_to_yojson
    [
      ("AppBlockArn", Some (arn_to_yojson x.app_block_arn));
      ("AppBlockBuilderName", Some (name_to_yojson x.app_block_builder_name));
    ]

let app_block_builder_app_block_associations_list_to_yojson tree =
  list_to_yojson app_block_builder_app_block_association_to_yojson tree

let app_block_builder_attribute_to_yojson (x : app_block_builder_attribute) =
  match x with
  | IAM_ROLE_ARN -> `String "IAM_ROLE_ARN"
  | ACCESS_ENDPOINTS -> `String "ACCESS_ENDPOINTS"
  | VPC_CONFIGURATION_SECURITY_GROUP_IDS -> `String "VPC_CONFIGURATION_SECURITY_GROUP_IDS"

let app_block_builder_attributes_to_yojson tree =
  list_to_yojson app_block_builder_attribute_to_yojson tree

let app_block_builder_list_to_yojson tree = list_to_yojson app_block_builder_to_yojson tree
let app_blocks_to_yojson tree = list_to_yojson app_block_to_yojson tree
let launch_parameters_to_yojson = string_to_yojson
let file_path_to_yojson = string_to_yojson
let app_display_name_to_yojson = string_to_yojson
let app_name_to_yojson = string_to_yojson

let application_config_to_yojson (x : application_config) =
  assoc_to_yojson
    [
      ("Name", Some (app_name_to_yojson x.name));
      ("DisplayName", option_to_yojson app_display_name_to_yojson x.display_name);
      ("AbsoluteAppPath", Some (file_path_to_yojson x.absolute_app_path));
      ("AbsoluteIconPath", option_to_yojson file_path_to_yojson x.absolute_icon_path);
      ("AbsoluteManifestPath", option_to_yojson file_path_to_yojson x.absolute_manifest_path);
      ("WorkingDirectory", option_to_yojson file_path_to_yojson x.working_directory);
      ("LaunchParameters", option_to_yojson launch_parameters_to_yojson x.launch_parameters);
    ]

let app_catalog_config_to_yojson tree = list_to_yojson application_config_to_yojson tree

let app_visibility_to_yojson (x : app_visibility) =
  match x with ALL -> `String "ALL" | ASSOCIATED -> `String "ASSOCIATED"

let string_list_to_yojson tree = list_to_yojson string__to_yojson tree

let platform_type_to_yojson (x : platform_type) =
  match x with
  | WINDOWS -> `String "WINDOWS"
  | WINDOWS_SERVER_2016 -> `String "WINDOWS_SERVER_2016"
  | WINDOWS_SERVER_2019 -> `String "WINDOWS_SERVER_2019"
  | WINDOWS_SERVER_2022 -> `String "WINDOWS_SERVER_2022"
  | WINDOWS_SERVER_2025 -> `String "WINDOWS_SERVER_2025"
  | AMAZON_LINUX2 -> `String "AMAZON_LINUX2"
  | RHEL8 -> `String "RHEL8"
  | ROCKY_LINUX8 -> `String "ROCKY_LINUX8"
  | UBUNTU_PRO_2404 -> `String "UBUNTU_PRO_2404"

let platforms_to_yojson tree = list_to_yojson platform_type_to_yojson tree
let metadata_to_yojson tree = map_to_yojson string__to_yojson string__to_yojson tree
let boolean__to_yojson = bool_to_yojson

let application_to_yojson (x : application) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson string__to_yojson x.name);
      ("DisplayName", option_to_yojson string__to_yojson x.display_name);
      ("IconURL", option_to_yojson string__to_yojson x.icon_ur_l);
      ("LaunchPath", option_to_yojson string__to_yojson x.launch_path);
      ("LaunchParameters", option_to_yojson string__to_yojson x.launch_parameters);
      ("Enabled", option_to_yojson boolean__to_yojson x.enabled);
      ("Metadata", option_to_yojson metadata_to_yojson x.metadata);
      ("WorkingDirectory", option_to_yojson string__to_yojson x.working_directory);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("AppBlockArn", option_to_yojson arn_to_yojson x.app_block_arn);
      ("IconS3Location", option_to_yojson s3_location_to_yojson x.icon_s3_location);
      ("Platforms", option_to_yojson platforms_to_yojson x.platforms);
      ("InstanceFamilies", option_to_yojson string_list_to_yojson x.instance_families);
      ("CreatedTime", option_to_yojson timestamp_to_yojson x.created_time);
    ]

let application_attribute_to_yojson (x : application_attribute) =
  match x with
  | LAUNCH_PARAMETERS -> `String "LAUNCH_PARAMETERS"
  | WORKING_DIRECTORY -> `String "WORKING_DIRECTORY"

let application_attributes_to_yojson tree = list_to_yojson application_attribute_to_yojson tree

let application_fleet_association_to_yojson (x : application_fleet_association) =
  assoc_to_yojson
    [
      ("FleetName", Some (string__to_yojson x.fleet_name));
      ("ApplicationArn", Some (arn_to_yojson x.application_arn));
    ]

let application_fleet_association_list_to_yojson tree =
  list_to_yojson application_fleet_association_to_yojson tree

let settings_group_to_yojson = string_to_yojson

let application_settings_to_yojson (x : application_settings) =
  assoc_to_yojson
    [
      ("Enabled", Some (boolean__to_yojson x.enabled));
      ("SettingsGroup", option_to_yojson settings_group_to_yojson x.settings_group);
    ]

let application_settings_response_to_yojson (x : application_settings_response) =
  assoc_to_yojson
    [
      ("Enabled", option_to_yojson boolean__to_yojson x.enabled);
      ("SettingsGroup", option_to_yojson settings_group_to_yojson x.settings_group);
      ("S3BucketName", option_to_yojson string__to_yojson x.s3_bucket_name);
    ]

let applications_to_yojson tree = list_to_yojson application_to_yojson tree
let appstream_agent_version_to_yojson = string_to_yojson
let arn_list_to_yojson tree = list_to_yojson arn_to_yojson tree
let error_message_to_yojson = string_to_yojson

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let operation_not_permitted_exception_to_yojson (x : operation_not_permitted_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_parameter_combination_exception_to_yojson (x : invalid_parameter_combination_exception)
    =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let concurrent_modification_exception_to_yojson (x : concurrent_modification_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let associate_app_block_builder_app_block_result_to_yojson
    (x : associate_app_block_builder_app_block_result) =
  assoc_to_yojson
    [
      ( "AppBlockBuilderAppBlockAssociation",
        option_to_yojson app_block_builder_app_block_association_to_yojson
          x.app_block_builder_app_block_association );
    ]

let associate_app_block_builder_app_block_request_to_yojson
    (x : associate_app_block_builder_app_block_request) =
  assoc_to_yojson
    [
      ("AppBlockArn", Some (arn_to_yojson x.app_block_arn));
      ("AppBlockBuilderName", Some (name_to_yojson x.app_block_builder_name));
    ]

let associate_application_fleet_result_to_yojson (x : associate_application_fleet_result) =
  assoc_to_yojson
    [
      ( "ApplicationFleetAssociation",
        option_to_yojson application_fleet_association_to_yojson x.application_fleet_association );
    ]

let associate_application_fleet_request_to_yojson (x : associate_application_fleet_request) =
  assoc_to_yojson
    [
      ("FleetName", Some (name_to_yojson x.fleet_name));
      ("ApplicationArn", Some (arn_to_yojson x.application_arn));
    ]

let entitlement_not_found_exception_to_yojson (x : entitlement_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let associate_application_to_entitlement_result_to_yojson = unit_to_yojson

let associate_application_to_entitlement_request_to_yojson
    (x : associate_application_to_entitlement_request) =
  assoc_to_yojson
    [
      ("StackName", Some (name_to_yojson x.stack_name));
      ("EntitlementName", Some (name_to_yojson x.entitlement_name));
      ("ApplicationIdentifier", Some (string__to_yojson x.application_identifier));
    ]

let invalid_account_status_exception_to_yojson (x : invalid_account_status_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let incompatible_image_exception_to_yojson (x : incompatible_image_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let associate_fleet_result_to_yojson = unit_to_yojson

let associate_fleet_request_to_yojson (x : associate_fleet_request) =
  assoc_to_yojson
    [
      ("FleetName", Some (string__to_yojson x.fleet_name));
      ("StackName", Some (string__to_yojson x.stack_name));
    ]

let associate_software_to_image_builder_result_to_yojson = unit_to_yojson

let associate_software_to_image_builder_request_to_yojson
    (x : associate_software_to_image_builder_request) =
  assoc_to_yojson
    [
      ("ImageBuilderName", Some (name_to_yojson x.image_builder_name));
      ("SoftwareNames", Some (string_list_to_yojson x.software_names));
    ]

let authentication_type_to_yojson (x : authentication_type) =
  match x with
  | API -> `String "API"
  | SAML -> `String "SAML"
  | USERPOOL -> `String "USERPOOL"
  | AWS_AD -> `String "AWS_AD"

let aws_account_id_list_to_yojson tree = list_to_yojson aws_account_id_to_yojson tree

let user_stack_association_error_code_to_yojson (x : user_stack_association_error_code) =
  match x with
  | STACK_NOT_FOUND -> `String "STACK_NOT_FOUND"
  | USER_NAME_NOT_FOUND -> `String "USER_NAME_NOT_FOUND"
  | DIRECTORY_NOT_FOUND -> `String "DIRECTORY_NOT_FOUND"
  | INTERNAL_ERROR -> `String "INTERNAL_ERROR"

let username_to_yojson = string_to_yojson

let user_stack_association_to_yojson (x : user_stack_association) =
  assoc_to_yojson
    [
      ("StackName", Some (string__to_yojson x.stack_name));
      ("UserName", Some (username_to_yojson x.user_name));
      ("AuthenticationType", Some (authentication_type_to_yojson x.authentication_type));
      ("SendEmailNotification", option_to_yojson boolean__to_yojson x.send_email_notification);
    ]

let user_stack_association_error_to_yojson (x : user_stack_association_error) =
  assoc_to_yojson
    [
      ( "UserStackAssociation",
        option_to_yojson user_stack_association_to_yojson x.user_stack_association );
      ("ErrorCode", option_to_yojson user_stack_association_error_code_to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson string__to_yojson x.error_message);
    ]

let user_stack_association_error_list_to_yojson tree =
  list_to_yojson user_stack_association_error_to_yojson tree

let batch_associate_user_stack_result_to_yojson (x : batch_associate_user_stack_result) =
  assoc_to_yojson
    [ ("errors", option_to_yojson user_stack_association_error_list_to_yojson x.errors) ]

let user_stack_association_list_to_yojson tree =
  list_to_yojson user_stack_association_to_yojson tree

let batch_associate_user_stack_request_to_yojson (x : batch_associate_user_stack_request) =
  assoc_to_yojson
    [
      ( "UserStackAssociations",
        Some (user_stack_association_list_to_yojson x.user_stack_associations) );
    ]

let batch_disassociate_user_stack_result_to_yojson (x : batch_disassociate_user_stack_result) =
  assoc_to_yojson
    [ ("errors", option_to_yojson user_stack_association_error_list_to_yojson x.errors) ]

let batch_disassociate_user_stack_request_to_yojson (x : batch_disassociate_user_stack_request) =
  assoc_to_yojson
    [
      ( "UserStackAssociations",
        Some (user_stack_association_list_to_yojson x.user_stack_associations) );
    ]

let certificate_based_auth_status_to_yojson (x : certificate_based_auth_status) =
  match x with
  | DISABLED -> `String "DISABLED"
  | ENABLED -> `String "ENABLED"
  | ENABLED_NO_DIRECTORY_LOGIN_FALLBACK -> `String "ENABLED_NO_DIRECTORY_LOGIN_FALLBACK"

let certificate_based_auth_properties_to_yojson (x : certificate_based_auth_properties) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson certificate_based_auth_status_to_yojson x.status);
      ("CertificateAuthorityArn", option_to_yojson arn_to_yojson x.certificate_authority_arn);
    ]

let compute_capacity_to_yojson (x : compute_capacity) =
  assoc_to_yojson
    [
      ("DesiredInstances", option_to_yojson integer_to_yojson x.desired_instances);
      ("DesiredSessions", option_to_yojson integer_to_yojson x.desired_sessions);
    ]

let compute_capacity_status_to_yojson (x : compute_capacity_status) =
  assoc_to_yojson
    [
      ("Desired", Some (integer_to_yojson x.desired));
      ("Running", option_to_yojson integer_to_yojson x.running);
      ("InUse", option_to_yojson integer_to_yojson x.in_use);
      ("Available", option_to_yojson integer_to_yojson x.available);
      ("DesiredUserSessions", option_to_yojson integer_to_yojson x.desired_user_sessions);
      ("AvailableUserSessions", option_to_yojson integer_to_yojson x.available_user_sessions);
      ("ActiveUserSessions", option_to_yojson integer_to_yojson x.active_user_sessions);
      ("ActualUserSessions", option_to_yojson integer_to_yojson x.actual_user_sessions);
      ("Draining", option_to_yojson integer_to_yojson x.draining);
      ( "DrainModeActiveUserSessions",
        option_to_yojson integer_to_yojson x.drain_mode_active_user_sessions );
      ( "DrainModeUnusedUserSessions",
        option_to_yojson integer_to_yojson x.drain_mode_unused_user_sessions );
    ]

let url_pattern_to_yojson = string_to_yojson
let url_pattern_list_to_yojson tree = list_to_yojson url_pattern_to_yojson tree

let url_redirection_config_to_yojson (x : url_redirection_config) =
  assoc_to_yojson
    [
      ("Enabled", Some (boolean_object_to_yojson x.enabled));
      ("AllowedUrls", option_to_yojson url_pattern_list_to_yojson x.allowed_urls);
      ("DeniedUrls", option_to_yojson url_pattern_list_to_yojson x.denied_urls);
    ]

let content_redirection_to_yojson (x : content_redirection) =
  assoc_to_yojson
    [ ("HostToClient", option_to_yojson url_redirection_config_to_yojson x.host_to_client) ]

let resource_not_available_exception_to_yojson (x : resource_not_available_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let resource_already_exists_exception_to_yojson (x : resource_already_exists_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let copy_image_response_to_yojson (x : copy_image_response) =
  assoc_to_yojson
    [ ("DestinationImageName", option_to_yojson name_to_yojson x.destination_image_name) ]

let description_to_yojson = string_to_yojson
let region_name_to_yojson = string_to_yojson

let copy_image_request_to_yojson (x : copy_image_request) =
  assoc_to_yojson
    [
      ("SourceImageName", Some (name_to_yojson x.source_image_name));
      ("DestinationImageName", Some (name_to_yojson x.destination_image_name));
      ("DestinationRegion", Some (region_name_to_yojson x.destination_region));
      ( "DestinationImageDescription",
        option_to_yojson description_to_yojson x.destination_image_description );
    ]

let create_app_block_result_to_yojson (x : create_app_block_result) =
  assoc_to_yojson [ ("AppBlock", option_to_yojson app_block_to_yojson x.app_block) ]

let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tags_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree
let display_name_to_yojson = string_to_yojson

let create_app_block_request_to_yojson (x : create_app_block_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_to_yojson x.name));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("DisplayName", option_to_yojson display_name_to_yojson x.display_name);
      ("SourceS3Location", Some (s3_location_to_yojson x.source_s3_location));
      ("SetupScriptDetails", option_to_yojson script_details_to_yojson x.setup_script_details);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ( "PostSetupScriptDetails",
        option_to_yojson script_details_to_yojson x.post_setup_script_details );
      ("PackagingType", option_to_yojson packaging_type_to_yojson x.packaging_type);
    ]

let request_limit_exceeded_exception_to_yojson (x : request_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_role_exception_to_yojson (x : invalid_role_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let create_app_block_builder_result_to_yojson (x : create_app_block_builder_result) =
  assoc_to_yojson
    [ ("AppBlockBuilder", option_to_yojson app_block_builder_to_yojson x.app_block_builder) ]

let create_app_block_builder_request_to_yojson (x : create_app_block_builder_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_to_yojson x.name));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("DisplayName", option_to_yojson display_name_to_yojson x.display_name);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("Platform", Some (app_block_builder_platform_type_to_yojson x.platform));
      ("InstanceType", Some (string__to_yojson x.instance_type));
      ("VpcConfig", Some (vpc_config_to_yojson x.vpc_config));
      ( "EnableDefaultInternetAccess",
        option_to_yojson boolean_object_to_yojson x.enable_default_internet_access );
      ("IamRoleArn", option_to_yojson arn_to_yojson x.iam_role_arn);
      ("AccessEndpoints", option_to_yojson access_endpoint_list_to_yojson x.access_endpoints);
      ("DisableIMDSV1", option_to_yojson boolean_object_to_yojson x.disable_imds_v1);
    ]

let create_app_block_builder_streaming_url_result_to_yojson
    (x : create_app_block_builder_streaming_url_result) =
  assoc_to_yojson
    [
      ("StreamingURL", option_to_yojson string__to_yojson x.streaming_ur_l);
      ("Expires", option_to_yojson timestamp_to_yojson x.expires);
    ]

let long_to_yojson = long_to_yojson

let create_app_block_builder_streaming_url_request_to_yojson
    (x : create_app_block_builder_streaming_url_request) =
  assoc_to_yojson
    [
      ("AppBlockBuilderName", Some (name_to_yojson x.app_block_builder_name));
      ("Validity", option_to_yojson long_to_yojson x.validity);
    ]

let create_application_result_to_yojson (x : create_application_result) =
  assoc_to_yojson [ ("Application", option_to_yojson application_to_yojson x.application) ]

let create_application_request_to_yojson (x : create_application_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_to_yojson x.name));
      ("DisplayName", option_to_yojson display_name_to_yojson x.display_name);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("IconS3Location", Some (s3_location_to_yojson x.icon_s3_location));
      ("LaunchPath", Some (string__to_yojson x.launch_path));
      ("WorkingDirectory", option_to_yojson string__to_yojson x.working_directory);
      ("LaunchParameters", option_to_yojson string__to_yojson x.launch_parameters);
      ("Platforms", Some (platforms_to_yojson x.platforms));
      ("InstanceFamilies", Some (string_list_to_yojson x.instance_families));
      ("AppBlockArn", Some (arn_to_yojson x.app_block_arn));
      ("Tags", option_to_yojson tags_to_yojson x.tags);
    ]

let service_account_credentials_to_yojson (x : service_account_credentials) =
  assoc_to_yojson
    [
      ("AccountName", Some (account_name_to_yojson x.account_name));
      ("AccountPassword", Some (account_password_to_yojson x.account_password));
    ]

let organizational_unit_distinguished_name_to_yojson = string_to_yojson

let organizational_unit_distinguished_names_list_to_yojson tree =
  list_to_yojson organizational_unit_distinguished_name_to_yojson tree

let directory_name_to_yojson = string_to_yojson

let directory_config_to_yojson (x : directory_config) =
  assoc_to_yojson
    [
      ("DirectoryName", Some (directory_name_to_yojson x.directory_name));
      ( "OrganizationalUnitDistinguishedNames",
        option_to_yojson organizational_unit_distinguished_names_list_to_yojson
          x.organizational_unit_distinguished_names );
      ( "ServiceAccountCredentials",
        option_to_yojson service_account_credentials_to_yojson x.service_account_credentials );
      ("CreatedTime", option_to_yojson timestamp_to_yojson x.created_time);
      ( "CertificateBasedAuthProperties",
        option_to_yojson certificate_based_auth_properties_to_yojson
          x.certificate_based_auth_properties );
    ]

let create_directory_config_result_to_yojson (x : create_directory_config_result) =
  assoc_to_yojson
    [ ("DirectoryConfig", option_to_yojson directory_config_to_yojson x.directory_config) ]

let create_directory_config_request_to_yojson (x : create_directory_config_request) =
  assoc_to_yojson
    [
      ("DirectoryName", Some (directory_name_to_yojson x.directory_name));
      ( "OrganizationalUnitDistinguishedNames",
        Some
          (organizational_unit_distinguished_names_list_to_yojson
             x.organizational_unit_distinguished_names) );
      ( "ServiceAccountCredentials",
        option_to_yojson service_account_credentials_to_yojson x.service_account_credentials );
      ( "CertificateBasedAuthProperties",
        option_to_yojson certificate_based_auth_properties_to_yojson
          x.certificate_based_auth_properties );
    ]

let entitlement_already_exists_exception_to_yojson (x : entitlement_already_exists_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let entitlement_attribute_to_yojson (x : entitlement_attribute) =
  assoc_to_yojson
    [ ("Name", Some (string__to_yojson x.name)); ("Value", Some (string__to_yojson x.value)) ]

let entitlement_attribute_list_to_yojson tree = list_to_yojson entitlement_attribute_to_yojson tree

let entitlement_to_yojson (x : entitlement) =
  assoc_to_yojson
    [
      ("Name", Some (name_to_yojson x.name));
      ("StackName", Some (name_to_yojson x.stack_name));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("AppVisibility", Some (app_visibility_to_yojson x.app_visibility));
      ("Attributes", Some (entitlement_attribute_list_to_yojson x.attributes));
      ("CreatedTime", option_to_yojson timestamp_to_yojson x.created_time);
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
    ]

let create_entitlement_result_to_yojson (x : create_entitlement_result) =
  assoc_to_yojson [ ("Entitlement", option_to_yojson entitlement_to_yojson x.entitlement) ]

let create_entitlement_request_to_yojson (x : create_entitlement_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_to_yojson x.name));
      ("StackName", Some (name_to_yojson x.stack_name));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("AppVisibility", Some (app_visibility_to_yojson x.app_visibility));
      ("Attributes", Some (entitlement_attribute_list_to_yojson x.attributes));
    ]

let photon_ami_id_to_yojson = string_to_yojson

let export_image_task_state_to_yojson (x : export_image_task_state) =
  match x with
  | EXPORTING -> `String "EXPORTING"
  | COMPLETED -> `String "COMPLETED"
  | FAILED -> `String "FAILED"
  | TIMED_OUT -> `String "TIMED_OUT"

let uui_d_to_yojson = string_to_yojson

let export_image_task_to_yojson (x : export_image_task) =
  assoc_to_yojson
    [
      ("TaskId", Some (uui_d_to_yojson x.task_id));
      ("ImageArn", Some (arn_to_yojson x.image_arn));
      ("AmiName", Some (ami_name_to_yojson x.ami_name));
      ("CreatedDate", Some (timestamp_to_yojson x.created_date));
      ("AmiDescription", option_to_yojson description_to_yojson x.ami_description);
      ("State", option_to_yojson export_image_task_state_to_yojson x.state);
      ("AmiId", option_to_yojson photon_ami_id_to_yojson x.ami_id);
      ("TagSpecifications", option_to_yojson tags_to_yojson x.tag_specifications);
      ("ErrorDetails", option_to_yojson error_details_list_to_yojson x.error_details);
    ]

let create_export_image_task_result_to_yojson (x : create_export_image_task_result) =
  assoc_to_yojson
    [ ("ExportImageTask", option_to_yojson export_image_task_to_yojson x.export_image_task) ]

let create_export_image_task_request_to_yojson (x : create_export_image_task_request) =
  assoc_to_yojson
    [
      ("ImageName", Some (name_to_yojson x.image_name));
      ("AmiName", Some (ami_name_to_yojson x.ami_name));
      ("IamRoleArn", Some (arn_to_yojson x.iam_role_arn));
      ("TagSpecifications", option_to_yojson tags_to_yojson x.tag_specifications);
      ("AmiDescription", option_to_yojson description_to_yojson x.ami_description);
    ]

let volume_config_to_yojson (x : volume_config) =
  assoc_to_yojson [ ("VolumeSizeInGb", option_to_yojson integer_to_yojson x.volume_size_in_gb) ]

let usb_device_filter_string_to_yojson = string_to_yojson

let usb_device_filter_strings_to_yojson tree =
  list_to_yojson usb_device_filter_string_to_yojson tree

let stream_view_to_yojson (x : stream_view) =
  match x with APP -> `String "APP" | DESKTOP -> `String "DESKTOP"

let domain_join_info_to_yojson (x : domain_join_info) =
  assoc_to_yojson
    [
      ("DirectoryName", option_to_yojson directory_name_to_yojson x.directory_name);
      ( "OrganizationalUnitDistinguishedName",
        option_to_yojson organizational_unit_distinguished_name_to_yojson
          x.organizational_unit_distinguished_name );
    ]

let fleet_error_to_yojson (x : fleet_error) =
  assoc_to_yojson
    [
      ("ErrorCode", option_to_yojson fleet_error_code_to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson string__to_yojson x.error_message);
    ]

let fleet_errors_to_yojson tree = list_to_yojson fleet_error_to_yojson tree

let fleet_state_to_yojson (x : fleet_state) =
  match x with
  | STARTING -> `String "STARTING"
  | RUNNING -> `String "RUNNING"
  | STOPPING -> `String "STOPPING"
  | STOPPED -> `String "STOPPED"

let fleet_type_to_yojson (x : fleet_type) =
  match x with
  | ALWAYS_ON -> `String "ALWAYS_ON"
  | ON_DEMAND -> `String "ON_DEMAND"
  | ELASTIC -> `String "ELASTIC"

let fleet_to_yojson (x : fleet) =
  assoc_to_yojson
    [
      ("Arn", Some (arn_to_yojson x.arn));
      ("Name", Some (string__to_yojson x.name));
      ("DisplayName", option_to_yojson string__to_yojson x.display_name);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("ImageName", option_to_yojson string__to_yojson x.image_name);
      ("ImageArn", option_to_yojson arn_to_yojson x.image_arn);
      ("InstanceType", Some (string__to_yojson x.instance_type));
      ("FleetType", option_to_yojson fleet_type_to_yojson x.fleet_type);
      ("ComputeCapacityStatus", Some (compute_capacity_status_to_yojson x.compute_capacity_status));
      ("MaxUserDurationInSeconds", option_to_yojson integer_to_yojson x.max_user_duration_in_seconds);
      ( "DisconnectTimeoutInSeconds",
        option_to_yojson integer_to_yojson x.disconnect_timeout_in_seconds );
      ("State", Some (fleet_state_to_yojson x.state));
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("CreatedTime", option_to_yojson timestamp_to_yojson x.created_time);
      ("FleetErrors", option_to_yojson fleet_errors_to_yojson x.fleet_errors);
      ( "EnableDefaultInternetAccess",
        option_to_yojson boolean_object_to_yojson x.enable_default_internet_access );
      ("DomainJoinInfo", option_to_yojson domain_join_info_to_yojson x.domain_join_info);
      ( "IdleDisconnectTimeoutInSeconds",
        option_to_yojson integer_to_yojson x.idle_disconnect_timeout_in_seconds );
      ("IamRoleArn", option_to_yojson arn_to_yojson x.iam_role_arn);
      ("StreamView", option_to_yojson stream_view_to_yojson x.stream_view);
      ("Platform", option_to_yojson platform_type_to_yojson x.platform);
      ("MaxConcurrentSessions", option_to_yojson integer_to_yojson x.max_concurrent_sessions);
      ( "UsbDeviceFilterStrings",
        option_to_yojson usb_device_filter_strings_to_yojson x.usb_device_filter_strings );
      ( "SessionScriptS3Location",
        option_to_yojson s3_location_to_yojson x.session_script_s3_location );
      ("MaxSessionsPerInstance", option_to_yojson integer_to_yojson x.max_sessions_per_instance);
      ("RootVolumeConfig", option_to_yojson volume_config_to_yojson x.root_volume_config);
      ("DisableIMDSV1", option_to_yojson boolean_object_to_yojson x.disable_imds_v1);
    ]

let create_fleet_result_to_yojson (x : create_fleet_result) =
  assoc_to_yojson [ ("Fleet", option_to_yojson fleet_to_yojson x.fleet) ]

let create_fleet_request_to_yojson (x : create_fleet_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_to_yojson x.name));
      ("ImageName", option_to_yojson name_to_yojson x.image_name);
      ("ImageArn", option_to_yojson arn_to_yojson x.image_arn);
      ("InstanceType", Some (string__to_yojson x.instance_type));
      ("FleetType", option_to_yojson fleet_type_to_yojson x.fleet_type);
      ("ComputeCapacity", option_to_yojson compute_capacity_to_yojson x.compute_capacity);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("MaxUserDurationInSeconds", option_to_yojson integer_to_yojson x.max_user_duration_in_seconds);
      ( "DisconnectTimeoutInSeconds",
        option_to_yojson integer_to_yojson x.disconnect_timeout_in_seconds );
      ("Description", option_to_yojson description_to_yojson x.description);
      ("DisplayName", option_to_yojson display_name_to_yojson x.display_name);
      ( "EnableDefaultInternetAccess",
        option_to_yojson boolean_object_to_yojson x.enable_default_internet_access );
      ("DomainJoinInfo", option_to_yojson domain_join_info_to_yojson x.domain_join_info);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ( "IdleDisconnectTimeoutInSeconds",
        option_to_yojson integer_to_yojson x.idle_disconnect_timeout_in_seconds );
      ("IamRoleArn", option_to_yojson arn_to_yojson x.iam_role_arn);
      ("StreamView", option_to_yojson stream_view_to_yojson x.stream_view);
      ("Platform", option_to_yojson platform_type_to_yojson x.platform);
      ("MaxConcurrentSessions", option_to_yojson integer_to_yojson x.max_concurrent_sessions);
      ( "UsbDeviceFilterStrings",
        option_to_yojson usb_device_filter_strings_to_yojson x.usb_device_filter_strings );
      ( "SessionScriptS3Location",
        option_to_yojson s3_location_to_yojson x.session_script_s3_location );
      ("MaxSessionsPerInstance", option_to_yojson integer_to_yojson x.max_sessions_per_instance);
      ("RootVolumeConfig", option_to_yojson volume_config_to_yojson x.root_volume_config);
      ("DisableIMDSV1", option_to_yojson boolean_object_to_yojson x.disable_imds_v1);
    ]

let latest_appstream_agent_version_to_yojson (x : latest_appstream_agent_version) =
  match x with TRUE -> `String "TRUE" | FALSE -> `String "FALSE"

let network_access_configuration_to_yojson (x : network_access_configuration) =
  assoc_to_yojson
    [
      ("EniPrivateIpAddress", option_to_yojson string__to_yojson x.eni_private_ip_address);
      ("EniIpv6Addresses", option_to_yojson string_list_to_yojson x.eni_ipv6_addresses);
      ("EniId", option_to_yojson string__to_yojson x.eni_id);
    ]

let image_builder_state_change_reason_code_to_yojson (x : image_builder_state_change_reason_code) =
  match x with
  | INTERNAL_ERROR -> `String "INTERNAL_ERROR"
  | IMAGE_UNAVAILABLE -> `String "IMAGE_UNAVAILABLE"

let image_builder_state_change_reason_to_yojson (x : image_builder_state_change_reason) =
  assoc_to_yojson
    [
      ("Code", option_to_yojson image_builder_state_change_reason_code_to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let image_builder_state_to_yojson (x : image_builder_state) =
  match x with
  | PENDING -> `String "PENDING"
  | UPDATING_AGENT -> `String "UPDATING_AGENT"
  | RUNNING -> `String "RUNNING"
  | STOPPING -> `String "STOPPING"
  | STOPPED -> `String "STOPPED"
  | REBOOTING -> `String "REBOOTING"
  | SNAPSHOTTING -> `String "SNAPSHOTTING"
  | DELETING -> `String "DELETING"
  | FAILED -> `String "FAILED"
  | UPDATING -> `String "UPDATING"
  | PENDING_QUALIFICATION -> `String "PENDING_QUALIFICATION"
  | PENDING_SYNCING_APPS -> `String "PENDING_SYNCING_APPS"
  | SYNCING_APPS -> `String "SYNCING_APPS"
  | PENDING_IMAGE_IMPORT -> `String "PENDING_IMAGE_IMPORT"

let image_builder_to_yojson (x : image_builder) =
  assoc_to_yojson
    [
      ("Name", Some (string__to_yojson x.name));
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("ImageArn", option_to_yojson arn_to_yojson x.image_arn);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("DisplayName", option_to_yojson string__to_yojson x.display_name);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("InstanceType", option_to_yojson string__to_yojson x.instance_type);
      ("Platform", option_to_yojson platform_type_to_yojson x.platform);
      ("IamRoleArn", option_to_yojson arn_to_yojson x.iam_role_arn);
      ("State", option_to_yojson image_builder_state_to_yojson x.state);
      ( "StateChangeReason",
        option_to_yojson image_builder_state_change_reason_to_yojson x.state_change_reason );
      ("CreatedTime", option_to_yojson timestamp_to_yojson x.created_time);
      ( "EnableDefaultInternetAccess",
        option_to_yojson boolean_object_to_yojson x.enable_default_internet_access );
      ("DomainJoinInfo", option_to_yojson domain_join_info_to_yojson x.domain_join_info);
      ( "NetworkAccessConfiguration",
        option_to_yojson network_access_configuration_to_yojson x.network_access_configuration );
      ("ImageBuilderErrors", option_to_yojson resource_errors_to_yojson x.image_builder_errors);
      ( "AppstreamAgentVersion",
        option_to_yojson appstream_agent_version_to_yojson x.appstream_agent_version );
      ("AccessEndpoints", option_to_yojson access_endpoint_list_to_yojson x.access_endpoints);
      ("RootVolumeConfig", option_to_yojson volume_config_to_yojson x.root_volume_config);
      ( "LatestAppstreamAgentVersion",
        option_to_yojson latest_appstream_agent_version_to_yojson x.latest_appstream_agent_version
      );
      ("DisableIMDSV1", option_to_yojson boolean_object_to_yojson x.disable_imds_v1);
    ]

let create_image_builder_result_to_yojson (x : create_image_builder_result) =
  assoc_to_yojson [ ("ImageBuilder", option_to_yojson image_builder_to_yojson x.image_builder) ]

let create_image_builder_request_to_yojson (x : create_image_builder_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_to_yojson x.name));
      ("ImageName", option_to_yojson string__to_yojson x.image_name);
      ("ImageArn", option_to_yojson arn_to_yojson x.image_arn);
      ("InstanceType", Some (string__to_yojson x.instance_type));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("DisplayName", option_to_yojson display_name_to_yojson x.display_name);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("IamRoleArn", option_to_yojson arn_to_yojson x.iam_role_arn);
      ( "EnableDefaultInternetAccess",
        option_to_yojson boolean_object_to_yojson x.enable_default_internet_access );
      ("DomainJoinInfo", option_to_yojson domain_join_info_to_yojson x.domain_join_info);
      ( "AppstreamAgentVersion",
        option_to_yojson appstream_agent_version_to_yojson x.appstream_agent_version );
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("AccessEndpoints", option_to_yojson access_endpoint_list_to_yojson x.access_endpoints);
      ("RootVolumeConfig", option_to_yojson volume_config_to_yojson x.root_volume_config);
      ("SoftwaresToInstall", option_to_yojson string_list_to_yojson x.softwares_to_install);
      ("SoftwaresToUninstall", option_to_yojson string_list_to_yojson x.softwares_to_uninstall);
      ("DisableIMDSV1", option_to_yojson boolean_object_to_yojson x.disable_imds_v1);
    ]

let create_image_builder_streaming_url_result_to_yojson
    (x : create_image_builder_streaming_url_result) =
  assoc_to_yojson
    [
      ("StreamingURL", option_to_yojson string__to_yojson x.streaming_ur_l);
      ("Expires", option_to_yojson timestamp_to_yojson x.expires);
    ]

let create_image_builder_streaming_url_request_to_yojson
    (x : create_image_builder_streaming_url_request) =
  assoc_to_yojson
    [
      ("Name", Some (string__to_yojson x.name));
      ("Validity", option_to_yojson long_to_yojson x.validity);
    ]

let dry_run_operation_exception_to_yojson (x : dry_run_operation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let image_type_to_yojson (x : image_type) =
  match x with CUSTOM -> `String "CUSTOM" | NATIVE -> `String "NATIVE" | BYOL -> `String "BYOL"

let image_shared_with_others_to_yojson (x : image_shared_with_others) =
  match x with TRUE -> `String "TRUE" | FALSE -> `String "FALSE"

let dynamic_app_providers_enabled_to_yojson (x : dynamic_app_providers_enabled) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let image_permissions_to_yojson (x : image_permissions) =
  assoc_to_yojson
    [
      ("allowFleet", option_to_yojson boolean_object_to_yojson x.allow_fleet);
      ("allowImageBuilder", option_to_yojson boolean_object_to_yojson x.allow_image_builder);
    ]

let image_state_change_reason_code_to_yojson (x : image_state_change_reason_code) =
  match x with
  | INTERNAL_ERROR -> `String "INTERNAL_ERROR"
  | IMAGE_BUILDER_NOT_AVAILABLE -> `String "IMAGE_BUILDER_NOT_AVAILABLE"
  | IMAGE_COPY_FAILURE -> `String "IMAGE_COPY_FAILURE"
  | IMAGE_UPDATE_FAILURE -> `String "IMAGE_UPDATE_FAILURE"
  | IMAGE_IMPORT_FAILURE -> `String "IMAGE_IMPORT_FAILURE"

let image_state_change_reason_to_yojson (x : image_state_change_reason) =
  assoc_to_yojson
    [
      ("Code", option_to_yojson image_state_change_reason_code_to_yojson x.code);
      ("Message", option_to_yojson string__to_yojson x.message);
    ]

let visibility_type_to_yojson (x : visibility_type) =
  match x with
  | PUBLIC -> `String "PUBLIC"
  | PRIVATE -> `String "PRIVATE"
  | SHARED -> `String "SHARED"

let image_state_to_yojson (x : image_state) =
  match x with
  | PENDING -> `String "PENDING"
  | AVAILABLE -> `String "AVAILABLE"
  | FAILED -> `String "FAILED"
  | COPYING -> `String "COPYING"
  | DELETING -> `String "DELETING"
  | CREATING -> `String "CREATING"
  | IMPORTING -> `String "IMPORTING"
  | VALIDATING -> `String "VALIDATING"

let image_to_yojson (x : image) =
  assoc_to_yojson
    [
      ("Name", Some (string__to_yojson x.name));
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("BaseImageArn", option_to_yojson arn_to_yojson x.base_image_arn);
      ("DisplayName", option_to_yojson string__to_yojson x.display_name);
      ("State", option_to_yojson image_state_to_yojson x.state);
      ("Visibility", option_to_yojson visibility_type_to_yojson x.visibility);
      ("ImageBuilderSupported", option_to_yojson boolean__to_yojson x.image_builder_supported);
      ("ImageBuilderName", option_to_yojson string__to_yojson x.image_builder_name);
      ("Platform", option_to_yojson platform_type_to_yojson x.platform);
      ("Description", option_to_yojson string__to_yojson x.description);
      ( "StateChangeReason",
        option_to_yojson image_state_change_reason_to_yojson x.state_change_reason );
      ("Applications", option_to_yojson applications_to_yojson x.applications);
      ("CreatedTime", option_to_yojson timestamp_to_yojson x.created_time);
      ( "PublicBaseImageReleasedDate",
        option_to_yojson timestamp_to_yojson x.public_base_image_released_date );
      ( "AppstreamAgentVersion",
        option_to_yojson appstream_agent_version_to_yojson x.appstream_agent_version );
      ("ImagePermissions", option_to_yojson image_permissions_to_yojson x.image_permissions);
      ("ImageErrors", option_to_yojson resource_errors_to_yojson x.image_errors);
      ( "LatestAppstreamAgentVersion",
        option_to_yojson latest_appstream_agent_version_to_yojson x.latest_appstream_agent_version
      );
      ( "SupportedInstanceFamilies",
        option_to_yojson string_list_to_yojson x.supported_instance_families );
      ( "DynamicAppProvidersEnabled",
        option_to_yojson dynamic_app_providers_enabled_to_yojson x.dynamic_app_providers_enabled );
      ( "ImageSharedWithOthers",
        option_to_yojson image_shared_with_others_to_yojson x.image_shared_with_others );
      ("ManagedSoftwareIncluded", option_to_yojson boolean__to_yojson x.managed_software_included);
      ("ImageType", option_to_yojson image_type_to_yojson x.image_type);
    ]

let create_imported_image_result_to_yojson (x : create_imported_image_result) =
  assoc_to_yojson [ ("Image", option_to_yojson image_to_yojson x.image) ]

let instance_type_to_yojson = string_to_yojson

let runtime_validation_config_to_yojson (x : runtime_validation_config) =
  assoc_to_yojson
    [ ("IntendedInstanceType", option_to_yojson instance_type_to_yojson x.intended_instance_type) ]

let image_import_display_name_to_yojson = string_to_yojson
let image_import_description_to_yojson = string_to_yojson
let workspace_image_id_to_yojson = string_to_yojson

let create_imported_image_request_to_yojson (x : create_imported_image_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_to_yojson x.name));
      ("SourceAmiId", option_to_yojson photon_ami_id_to_yojson x.source_ami_id);
      ("WorkspaceImageId", option_to_yojson workspace_image_id_to_yojson x.workspace_image_id);
      ("IamRoleArn", option_to_yojson arn_to_yojson x.iam_role_arn);
      ("Description", option_to_yojson image_import_description_to_yojson x.description);
      ("DisplayName", option_to_yojson image_import_display_name_to_yojson x.display_name);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ( "RuntimeValidationConfig",
        option_to_yojson runtime_validation_config_to_yojson x.runtime_validation_config );
      ( "AgentSoftwareVersion",
        option_to_yojson agent_software_version_to_yojson x.agent_software_version );
      ("AppCatalogConfig", option_to_yojson app_catalog_config_to_yojson x.app_catalog_config);
      ("DryRun", option_to_yojson boolean__to_yojson x.dry_run);
    ]

let preferred_protocol_to_yojson (x : preferred_protocol) =
  match x with TCP -> `String "TCP" | UDP -> `String "UDP"

let streaming_experience_settings_to_yojson (x : streaming_experience_settings) =
  assoc_to_yojson
    [ ("PreferredProtocol", option_to_yojson preferred_protocol_to_yojson x.preferred_protocol) ]

let embed_host_domain_to_yojson = string_to_yojson
let embed_host_domains_to_yojson tree = list_to_yojson embed_host_domain_to_yojson tree

let user_setting_to_yojson (x : user_setting) =
  assoc_to_yojson
    [
      ("Action", Some (action_to_yojson x.action));
      ("Permission", Some (permission_to_yojson x.permission));
      ("MaximumLength", option_to_yojson integer_to_yojson x.maximum_length);
    ]

let user_setting_list_to_yojson tree = list_to_yojson user_setting_to_yojson tree

let stack_error_code_to_yojson (x : stack_error_code) =
  match x with
  | STORAGE_CONNECTOR_ERROR -> `String "STORAGE_CONNECTOR_ERROR"
  | INTERNAL_SERVICE_ERROR -> `String "INTERNAL_SERVICE_ERROR"

let stack_error_to_yojson (x : stack_error) =
  assoc_to_yojson
    [
      ("ErrorCode", option_to_yojson stack_error_code_to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson string__to_yojson x.error_message);
    ]

let stack_errors_to_yojson tree = list_to_yojson stack_error_to_yojson tree
let feedback_ur_l_to_yojson = string_to_yojson
let redirect_ur_l_to_yojson = string_to_yojson
let domain_to_yojson = string_to_yojson
let domain_list_to_yojson tree = list_to_yojson domain_to_yojson tree
let resource_identifier_to_yojson = string_to_yojson

let storage_connector_type_to_yojson (x : storage_connector_type) =
  match x with
  | HOMEFOLDERS -> `String "HOMEFOLDERS"
  | GOOGLE_DRIVE -> `String "GOOGLE_DRIVE"
  | ONE_DRIVE -> `String "ONE_DRIVE"

let storage_connector_to_yojson (x : storage_connector) =
  assoc_to_yojson
    [
      ("ConnectorType", Some (storage_connector_type_to_yojson x.connector_type));
      ("ResourceIdentifier", option_to_yojson resource_identifier_to_yojson x.resource_identifier);
      ("Domains", option_to_yojson domain_list_to_yojson x.domains);
      ( "DomainsRequireAdminConsent",
        option_to_yojson domain_list_to_yojson x.domains_require_admin_consent );
    ]

let storage_connector_list_to_yojson tree = list_to_yojson storage_connector_to_yojson tree

let stack_to_yojson (x : stack) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("Name", Some (string__to_yojson x.name));
      ("Description", option_to_yojson string__to_yojson x.description);
      ("DisplayName", option_to_yojson string__to_yojson x.display_name);
      ("CreatedTime", option_to_yojson timestamp_to_yojson x.created_time);
      ("StorageConnectors", option_to_yojson storage_connector_list_to_yojson x.storage_connectors);
      ("RedirectURL", option_to_yojson redirect_ur_l_to_yojson x.redirect_ur_l);
      ("FeedbackURL", option_to_yojson feedback_ur_l_to_yojson x.feedback_ur_l);
      ("StackErrors", option_to_yojson stack_errors_to_yojson x.stack_errors);
      ("UserSettings", option_to_yojson user_setting_list_to_yojson x.user_settings);
      ( "ApplicationSettings",
        option_to_yojson application_settings_response_to_yojson x.application_settings );
      ("AccessEndpoints", option_to_yojson access_endpoint_list_to_yojson x.access_endpoints);
      ("EmbedHostDomains", option_to_yojson embed_host_domains_to_yojson x.embed_host_domains);
      ( "StreamingExperienceSettings",
        option_to_yojson streaming_experience_settings_to_yojson x.streaming_experience_settings );
      ("ContentRedirection", option_to_yojson content_redirection_to_yojson x.content_redirection);
      ("AgentAccessConfig", option_to_yojson agent_access_config_to_yojson x.agent_access_config);
    ]

let create_stack_result_to_yojson (x : create_stack_result) =
  assoc_to_yojson [ ("Stack", option_to_yojson stack_to_yojson x.stack) ]

let create_stack_request_to_yojson (x : create_stack_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_to_yojson x.name));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("DisplayName", option_to_yojson display_name_to_yojson x.display_name);
      ("StorageConnectors", option_to_yojson storage_connector_list_to_yojson x.storage_connectors);
      ("RedirectURL", option_to_yojson redirect_ur_l_to_yojson x.redirect_ur_l);
      ("FeedbackURL", option_to_yojson feedback_ur_l_to_yojson x.feedback_ur_l);
      ("UserSettings", option_to_yojson user_setting_list_to_yojson x.user_settings);
      ("ApplicationSettings", option_to_yojson application_settings_to_yojson x.application_settings);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("AccessEndpoints", option_to_yojson access_endpoint_list_to_yojson x.access_endpoints);
      ("EmbedHostDomains", option_to_yojson embed_host_domains_to_yojson x.embed_host_domains);
      ( "StreamingExperienceSettings",
        option_to_yojson streaming_experience_settings_to_yojson x.streaming_experience_settings );
      ("ContentRedirection", option_to_yojson content_redirection_to_yojson x.content_redirection);
      ("AgentAccessConfig", option_to_yojson agent_access_config_to_yojson x.agent_access_config);
    ]

let create_streaming_url_result_to_yojson (x : create_streaming_url_result) =
  assoc_to_yojson
    [
      ("StreamingURL", option_to_yojson string__to_yojson x.streaming_ur_l);
      ("Expires", option_to_yojson timestamp_to_yojson x.expires);
    ]

let streaming_url_user_id_to_yojson = string_to_yojson

let create_streaming_url_request_to_yojson (x : create_streaming_url_request) =
  assoc_to_yojson
    [
      ("StackName", Some (string__to_yojson x.stack_name));
      ("FleetName", Some (string__to_yojson x.fleet_name));
      ("UserId", Some (streaming_url_user_id_to_yojson x.user_id));
      ("ApplicationId", option_to_yojson string__to_yojson x.application_id);
      ("Validity", option_to_yojson long_to_yojson x.validity);
      ("SessionContext", option_to_yojson string__to_yojson x.session_context);
    ]

let theme_footer_link_ur_l_to_yojson = string_to_yojson
let theme_footer_link_display_name_to_yojson = string_to_yojson

let theme_footer_link_to_yojson (x : theme_footer_link) =
  assoc_to_yojson
    [
      ("DisplayName", option_to_yojson theme_footer_link_display_name_to_yojson x.display_name);
      ("FooterLinkURL", option_to_yojson theme_footer_link_ur_l_to_yojson x.footer_link_ur_l);
    ]

let theme_footer_links_to_yojson tree = list_to_yojson theme_footer_link_to_yojson tree

let theme_styling_to_yojson (x : theme_styling) =
  match x with
  | LIGHT_BLUE -> `String "LIGHT_BLUE"
  | BLUE -> `String "BLUE"
  | PINK -> `String "PINK"
  | RED -> `String "RED"

let theme_title_text_to_yojson = string_to_yojson

let theme_state_to_yojson (x : theme_state) =
  match x with ENABLED -> `String "ENABLED" | DISABLED -> `String "DISABLED"

let theme_to_yojson (x : theme) =
  assoc_to_yojson
    [
      ("StackName", option_to_yojson name_to_yojson x.stack_name);
      ("State", option_to_yojson theme_state_to_yojson x.state);
      ("ThemeTitleText", option_to_yojson theme_title_text_to_yojson x.theme_title_text);
      ("ThemeStyling", option_to_yojson theme_styling_to_yojson x.theme_styling);
      ("ThemeFooterLinks", option_to_yojson theme_footer_links_to_yojson x.theme_footer_links);
      ("ThemeOrganizationLogoURL", option_to_yojson string__to_yojson x.theme_organization_logo_ur_l);
      ("ThemeFaviconURL", option_to_yojson string__to_yojson x.theme_favicon_ur_l);
      ("CreatedTime", option_to_yojson timestamp_to_yojson x.created_time);
    ]

let create_theme_for_stack_result_to_yojson (x : create_theme_for_stack_result) =
  assoc_to_yojson [ ("Theme", option_to_yojson theme_to_yojson x.theme) ]

let create_theme_for_stack_request_to_yojson (x : create_theme_for_stack_request) =
  assoc_to_yojson
    [
      ("StackName", Some (name_to_yojson x.stack_name));
      ("FooterLinks", option_to_yojson theme_footer_links_to_yojson x.footer_links);
      ("TitleText", Some (theme_title_text_to_yojson x.title_text));
      ("ThemeStyling", Some (theme_styling_to_yojson x.theme_styling));
      ("OrganizationLogoS3Location", Some (s3_location_to_yojson x.organization_logo_s3_location));
      ("FaviconS3Location", Some (s3_location_to_yojson x.favicon_s3_location));
    ]

let create_updated_image_result_to_yojson (x : create_updated_image_result) =
  assoc_to_yojson
    [
      ("image", option_to_yojson image_to_yojson x.image);
      ("canUpdateImage", option_to_yojson boolean__to_yojson x.can_update_image);
    ]

let create_updated_image_request_to_yojson (x : create_updated_image_request) =
  assoc_to_yojson
    [
      ("existingImageName", Some (name_to_yojson x.existing_image_name));
      ("newImageName", Some (name_to_yojson x.new_image_name));
      ("newImageDescription", option_to_yojson description_to_yojson x.new_image_description);
      ("newImageDisplayName", option_to_yojson display_name_to_yojson x.new_image_display_name);
      ("newImageTags", option_to_yojson tags_to_yojson x.new_image_tags);
      ("dryRun", option_to_yojson boolean__to_yojson x.dry_run);
    ]

let usage_report_schedule_to_yojson (x : usage_report_schedule) =
  match x with DAILY -> `String "DAILY"

let create_usage_report_subscription_result_to_yojson (x : create_usage_report_subscription_result)
    =
  assoc_to_yojson
    [
      ("S3BucketName", option_to_yojson string__to_yojson x.s3_bucket_name);
      ("Schedule", option_to_yojson usage_report_schedule_to_yojson x.schedule);
    ]

let create_usage_report_subscription_request_to_yojson = unit_to_yojson
let create_user_result_to_yojson = unit_to_yojson
let user_attribute_value_to_yojson = string_to_yojson

let message_action_to_yojson (x : message_action) =
  match x with SUPPRESS -> `String "SUPPRESS" | RESEND -> `String "RESEND"

let create_user_request_to_yojson (x : create_user_request) =
  assoc_to_yojson
    [
      ("UserName", Some (username_to_yojson x.user_name));
      ("MessageAction", option_to_yojson message_action_to_yojson x.message_action);
      ("FirstName", option_to_yojson user_attribute_value_to_yojson x.first_name);
      ("LastName", option_to_yojson user_attribute_value_to_yojson x.last_name);
      ("AuthenticationType", Some (authentication_type_to_yojson x.authentication_type));
    ]

let resource_in_use_exception_to_yojson (x : resource_in_use_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let delete_app_block_result_to_yojson = unit_to_yojson

let delete_app_block_request_to_yojson (x : delete_app_block_request) =
  assoc_to_yojson [ ("Name", Some (name_to_yojson x.name)) ]

let delete_app_block_builder_result_to_yojson = unit_to_yojson

let delete_app_block_builder_request_to_yojson (x : delete_app_block_builder_request) =
  assoc_to_yojson [ ("Name", Some (name_to_yojson x.name)) ]

let delete_application_result_to_yojson = unit_to_yojson

let delete_application_request_to_yojson (x : delete_application_request) =
  assoc_to_yojson [ ("Name", Some (name_to_yojson x.name)) ]

let delete_directory_config_result_to_yojson = unit_to_yojson

let delete_directory_config_request_to_yojson (x : delete_directory_config_request) =
  assoc_to_yojson [ ("DirectoryName", Some (directory_name_to_yojson x.directory_name)) ]

let delete_entitlement_result_to_yojson = unit_to_yojson

let delete_entitlement_request_to_yojson (x : delete_entitlement_request) =
  assoc_to_yojson
    [ ("Name", Some (name_to_yojson x.name)); ("StackName", Some (name_to_yojson x.stack_name)) ]

let delete_fleet_result_to_yojson = unit_to_yojson

let delete_fleet_request_to_yojson (x : delete_fleet_request) =
  assoc_to_yojson [ ("Name", Some (string__to_yojson x.name)) ]

let delete_image_result_to_yojson (x : delete_image_result) =
  assoc_to_yojson [ ("Image", option_to_yojson image_to_yojson x.image) ]

let delete_image_request_to_yojson (x : delete_image_request) =
  assoc_to_yojson [ ("Name", Some (name_to_yojson x.name)) ]

let delete_image_builder_result_to_yojson (x : delete_image_builder_result) =
  assoc_to_yojson [ ("ImageBuilder", option_to_yojson image_builder_to_yojson x.image_builder) ]

let delete_image_builder_request_to_yojson (x : delete_image_builder_request) =
  assoc_to_yojson [ ("Name", Some (name_to_yojson x.name)) ]

let delete_image_permissions_result_to_yojson = unit_to_yojson

let delete_image_permissions_request_to_yojson (x : delete_image_permissions_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_to_yojson x.name));
      ("SharedAccountId", Some (aws_account_id_to_yojson x.shared_account_id));
    ]

let delete_stack_result_to_yojson = unit_to_yojson

let delete_stack_request_to_yojson (x : delete_stack_request) =
  assoc_to_yojson [ ("Name", Some (string__to_yojson x.name)) ]

let delete_theme_for_stack_result_to_yojson = unit_to_yojson

let delete_theme_for_stack_request_to_yojson (x : delete_theme_for_stack_request) =
  assoc_to_yojson [ ("StackName", Some (name_to_yojson x.stack_name)) ]

let delete_usage_report_subscription_result_to_yojson = unit_to_yojson
let delete_usage_report_subscription_request_to_yojson = unit_to_yojson
let delete_user_result_to_yojson = unit_to_yojson

let delete_user_request_to_yojson (x : delete_user_request) =
  assoc_to_yojson
    [
      ("UserName", Some (username_to_yojson x.user_name));
      ("AuthenticationType", Some (authentication_type_to_yojson x.authentication_type));
    ]

let describe_app_block_builder_app_block_associations_result_to_yojson
    (x : describe_app_block_builder_app_block_associations_result) =
  assoc_to_yojson
    [
      ( "AppBlockBuilderAppBlockAssociations",
        option_to_yojson app_block_builder_app_block_associations_list_to_yojson
          x.app_block_builder_app_block_associations );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_app_block_builder_app_block_associations_request_to_yojson
    (x : describe_app_block_builder_app_block_associations_request) =
  assoc_to_yojson
    [
      ("AppBlockArn", option_to_yojson arn_to_yojson x.app_block_arn);
      ("AppBlockBuilderName", option_to_yojson name_to_yojson x.app_block_builder_name);
      ("MaxResults", option_to_yojson integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_app_block_builders_result_to_yojson (x : describe_app_block_builders_result) =
  assoc_to_yojson
    [
      ("AppBlockBuilders", option_to_yojson app_block_builder_list_to_yojson x.app_block_builders);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_app_block_builders_request_to_yojson (x : describe_app_block_builders_request) =
  assoc_to_yojson
    [
      ("Names", option_to_yojson string_list_to_yojson x.names);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson integer_to_yojson x.max_results);
    ]

let describe_app_blocks_result_to_yojson (x : describe_app_blocks_result) =
  assoc_to_yojson
    [
      ("AppBlocks", option_to_yojson app_blocks_to_yojson x.app_blocks);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_app_blocks_request_to_yojson (x : describe_app_blocks_request) =
  assoc_to_yojson
    [
      ("Arns", option_to_yojson arn_list_to_yojson x.arns);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson integer_to_yojson x.max_results);
    ]

let describe_app_license_usage_result_to_yojson (x : describe_app_license_usage_result) =
  assoc_to_yojson
    [
      ( "AppLicenseUsages",
        option_to_yojson admin_app_license_usage_list_to_yojson x.app_license_usages );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_app_license_usage_request_to_yojson (x : describe_app_license_usage_request) =
  assoc_to_yojson
    [
      ("BillingPeriod", Some (string__to_yojson x.billing_period));
      ("MaxResults", option_to_yojson integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_application_fleet_associations_result_to_yojson
    (x : describe_application_fleet_associations_result) =
  assoc_to_yojson
    [
      ( "ApplicationFleetAssociations",
        option_to_yojson application_fleet_association_list_to_yojson
          x.application_fleet_associations );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_application_fleet_associations_request_to_yojson
    (x : describe_application_fleet_associations_request) =
  assoc_to_yojson
    [
      ("FleetName", option_to_yojson name_to_yojson x.fleet_name);
      ("ApplicationArn", option_to_yojson arn_to_yojson x.application_arn);
      ("MaxResults", option_to_yojson integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_applications_result_to_yojson (x : describe_applications_result) =
  assoc_to_yojson
    [
      ("Applications", option_to_yojson applications_to_yojson x.applications);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_applications_request_to_yojson (x : describe_applications_request) =
  assoc_to_yojson
    [
      ("Arns", option_to_yojson arn_list_to_yojson x.arns);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson integer_to_yojson x.max_results);
    ]

let directory_config_list_to_yojson tree = list_to_yojson directory_config_to_yojson tree

let describe_directory_configs_result_to_yojson (x : describe_directory_configs_result) =
  assoc_to_yojson
    [
      ("DirectoryConfigs", option_to_yojson directory_config_list_to_yojson x.directory_configs);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let directory_name_list_to_yojson tree = list_to_yojson directory_name_to_yojson tree

let describe_directory_configs_request_to_yojson (x : describe_directory_configs_request) =
  assoc_to_yojson
    [
      ("DirectoryNames", option_to_yojson directory_name_list_to_yojson x.directory_names);
      ("MaxResults", option_to_yojson integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let entitlement_list_to_yojson tree = list_to_yojson entitlement_to_yojson tree

let describe_entitlements_result_to_yojson (x : describe_entitlements_result) =
  assoc_to_yojson
    [
      ("Entitlements", option_to_yojson entitlement_list_to_yojson x.entitlements);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_entitlements_request_to_yojson (x : describe_entitlements_request) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson name_to_yojson x.name);
      ("StackName", Some (name_to_yojson x.stack_name));
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson integer_to_yojson x.max_results);
    ]

let fleet_list_to_yojson tree = list_to_yojson fleet_to_yojson tree

let describe_fleets_result_to_yojson (x : describe_fleets_result) =
  assoc_to_yojson
    [
      ("Fleets", option_to_yojson fleet_list_to_yojson x.fleets);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_fleets_request_to_yojson (x : describe_fleets_request) =
  assoc_to_yojson
    [
      ("Names", option_to_yojson string_list_to_yojson x.names);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let image_builder_list_to_yojson tree = list_to_yojson image_builder_to_yojson tree

let describe_image_builders_result_to_yojson (x : describe_image_builders_result) =
  assoc_to_yojson
    [
      ("ImageBuilders", option_to_yojson image_builder_list_to_yojson x.image_builders);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_image_builders_request_to_yojson (x : describe_image_builders_request) =
  assoc_to_yojson
    [
      ("Names", option_to_yojson string_list_to_yojson x.names);
      ("MaxResults", option_to_yojson integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let shared_image_permissions_to_yojson (x : shared_image_permissions) =
  assoc_to_yojson
    [
      ("sharedAccountId", Some (aws_account_id_to_yojson x.shared_account_id));
      ("imagePermissions", Some (image_permissions_to_yojson x.image_permissions));
    ]

let shared_image_permissions_list_to_yojson tree =
  list_to_yojson shared_image_permissions_to_yojson tree

let describe_image_permissions_result_to_yojson (x : describe_image_permissions_result) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson name_to_yojson x.name);
      ( "SharedImagePermissionsList",
        option_to_yojson shared_image_permissions_list_to_yojson x.shared_image_permissions_list );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson

let describe_image_permissions_request_to_yojson (x : describe_image_permissions_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_to_yojson x.name));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ( "SharedAwsAccountIds",
        option_to_yojson aws_account_id_list_to_yojson x.shared_aws_account_ids );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let image_list_to_yojson tree = list_to_yojson image_to_yojson tree

let describe_images_result_to_yojson (x : describe_images_result) =
  assoc_to_yojson
    [
      ("Images", option_to_yojson image_list_to_yojson x.images);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_images_max_results_to_yojson = int_to_yojson

let describe_images_request_to_yojson (x : describe_images_request) =
  assoc_to_yojson
    [
      ("Names", option_to_yojson string_list_to_yojson x.names);
      ("Arns", option_to_yojson arn_list_to_yojson x.arns);
      ("Type", option_to_yojson visibility_type_to_yojson x.type_);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson describe_images_max_results_to_yojson x.max_results);
    ]

let instance_drain_status_to_yojson (x : instance_drain_status) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | DRAINING -> `String "DRAINING"
  | NOT_APPLICABLE -> `String "NOT_APPLICABLE"

let session_connection_state_to_yojson (x : session_connection_state) =
  match x with CONNECTED -> `String "CONNECTED" | NOT_CONNECTED -> `String "NOT_CONNECTED"

let session_state_to_yojson (x : session_state) =
  match x with
  | ACTIVE -> `String "ACTIVE"
  | PENDING -> `String "PENDING"
  | EXPIRED -> `String "EXPIRED"

let user_id_to_yojson = string_to_yojson

let session_to_yojson (x : session) =
  assoc_to_yojson
    [
      ("Id", Some (string__to_yojson x.id));
      ("UserId", Some (user_id_to_yojson x.user_id));
      ("StackName", Some (string__to_yojson x.stack_name));
      ("FleetName", Some (string__to_yojson x.fleet_name));
      ("State", Some (session_state_to_yojson x.state));
      ("ConnectionState", option_to_yojson session_connection_state_to_yojson x.connection_state);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("MaxExpirationTime", option_to_yojson timestamp_to_yojson x.max_expiration_time);
      ("AuthenticationType", option_to_yojson authentication_type_to_yojson x.authentication_type);
      ( "NetworkAccessConfiguration",
        option_to_yojson network_access_configuration_to_yojson x.network_access_configuration );
      ("InstanceId", option_to_yojson string__to_yojson x.instance_id);
      ( "InstanceDrainStatus",
        option_to_yojson instance_drain_status_to_yojson x.instance_drain_status );
    ]

let session_list_to_yojson tree = list_to_yojson session_to_yojson tree

let describe_sessions_result_to_yojson (x : describe_sessions_result) =
  assoc_to_yojson
    [
      ("Sessions", option_to_yojson session_list_to_yojson x.sessions);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_sessions_request_to_yojson (x : describe_sessions_request) =
  assoc_to_yojson
    [
      ("StackName", Some (name_to_yojson x.stack_name));
      ("FleetName", Some (name_to_yojson x.fleet_name));
      ("UserId", option_to_yojson user_id_to_yojson x.user_id);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Limit", option_to_yojson integer_to_yojson x.limit);
      ("AuthenticationType", option_to_yojson authentication_type_to_yojson x.authentication_type);
      ("InstanceId", option_to_yojson string__to_yojson x.instance_id);
    ]

let software_deployment_status_to_yojson (x : software_deployment_status) =
  match x with
  | STAGED_FOR_INSTALLATION -> `String "STAGED_FOR_INSTALLATION"
  | PENDING_INSTALLATION -> `String "PENDING_INSTALLATION"
  | INSTALLED -> `String "INSTALLED"
  | STAGED_FOR_UNINSTALLATION -> `String "STAGED_FOR_UNINSTALLATION"
  | PENDING_UNINSTALLATION -> `String "PENDING_UNINSTALLATION"
  | FAILED_TO_INSTALL -> `String "FAILED_TO_INSTALL"
  | FAILED_TO_UNINSTALL -> `String "FAILED_TO_UNINSTALL"

let software_associations_to_yojson (x : software_associations) =
  assoc_to_yojson
    [
      ("SoftwareName", option_to_yojson string__to_yojson x.software_name);
      ("Status", option_to_yojson software_deployment_status_to_yojson x.status);
      ("DeploymentError", option_to_yojson error_details_list_to_yojson x.deployment_error);
    ]

let software_associations_list_to_yojson tree = list_to_yojson software_associations_to_yojson tree

let describe_software_associations_result_to_yojson (x : describe_software_associations_result) =
  assoc_to_yojson
    [
      ("AssociatedResource", option_to_yojson arn_to_yojson x.associated_resource);
      ( "SoftwareAssociations",
        option_to_yojson software_associations_list_to_yojson x.software_associations );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_software_associations_request_to_yojson (x : describe_software_associations_request) =
  assoc_to_yojson
    [
      ("AssociatedResource", Some (arn_to_yojson x.associated_resource));
      ("MaxResults", option_to_yojson integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let stack_list_to_yojson tree = list_to_yojson stack_to_yojson tree

let describe_stacks_result_to_yojson (x : describe_stacks_result) =
  assoc_to_yojson
    [
      ("Stacks", option_to_yojson stack_list_to_yojson x.stacks);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_stacks_request_to_yojson (x : describe_stacks_request) =
  assoc_to_yojson
    [
      ("Names", option_to_yojson string_list_to_yojson x.names);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_theme_for_stack_result_to_yojson (x : describe_theme_for_stack_result) =
  assoc_to_yojson [ ("Theme", option_to_yojson theme_to_yojson x.theme) ]

let describe_theme_for_stack_request_to_yojson (x : describe_theme_for_stack_request) =
  assoc_to_yojson [ ("StackName", Some (name_to_yojson x.stack_name)) ]

let usage_report_execution_error_code_to_yojson (x : usage_report_execution_error_code) =
  match x with
  | RESOURCE_NOT_FOUND -> `String "RESOURCE_NOT_FOUND"
  | ACCESS_DENIED -> `String "ACCESS_DENIED"
  | INTERNAL_SERVICE_ERROR -> `String "INTERNAL_SERVICE_ERROR"

let last_report_generation_execution_error_to_yojson (x : last_report_generation_execution_error) =
  assoc_to_yojson
    [
      ("ErrorCode", option_to_yojson usage_report_execution_error_code_to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson string__to_yojson x.error_message);
    ]

let last_report_generation_execution_errors_to_yojson tree =
  list_to_yojson last_report_generation_execution_error_to_yojson tree

let usage_report_subscription_to_yojson (x : usage_report_subscription) =
  assoc_to_yojson
    [
      ("S3BucketName", option_to_yojson string__to_yojson x.s3_bucket_name);
      ("Schedule", option_to_yojson usage_report_schedule_to_yojson x.schedule);
      ("LastGeneratedReportDate", option_to_yojson timestamp_to_yojson x.last_generated_report_date);
      ( "SubscriptionErrors",
        option_to_yojson last_report_generation_execution_errors_to_yojson x.subscription_errors );
    ]

let usage_report_subscription_list_to_yojson tree =
  list_to_yojson usage_report_subscription_to_yojson tree

let describe_usage_report_subscriptions_result_to_yojson
    (x : describe_usage_report_subscriptions_result) =
  assoc_to_yojson
    [
      ( "UsageReportSubscriptions",
        option_to_yojson usage_report_subscription_list_to_yojson x.usage_report_subscriptions );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_usage_report_subscriptions_request_to_yojson
    (x : describe_usage_report_subscriptions_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_user_stack_associations_result_to_yojson (x : describe_user_stack_associations_result)
    =
  assoc_to_yojson
    [
      ( "UserStackAssociations",
        option_to_yojson user_stack_association_list_to_yojson x.user_stack_associations );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_user_stack_associations_request_to_yojson
    (x : describe_user_stack_associations_request) =
  assoc_to_yojson
    [
      ("StackName", option_to_yojson string__to_yojson x.stack_name);
      ("UserName", option_to_yojson username_to_yojson x.user_name);
      ("AuthenticationType", option_to_yojson authentication_type_to_yojson x.authentication_type);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let user_to_yojson (x : user) =
  assoc_to_yojson
    [
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("UserName", option_to_yojson username_to_yojson x.user_name);
      ("Enabled", option_to_yojson boolean__to_yojson x.enabled);
      ("Status", option_to_yojson string__to_yojson x.status);
      ("FirstName", option_to_yojson user_attribute_value_to_yojson x.first_name);
      ("LastName", option_to_yojson user_attribute_value_to_yojson x.last_name);
      ("CreatedTime", option_to_yojson timestamp_to_yojson x.created_time);
      ("AuthenticationType", Some (authentication_type_to_yojson x.authentication_type));
    ]

let user_list_to_yojson tree = list_to_yojson user_to_yojson tree

let describe_users_result_to_yojson (x : describe_users_result) =
  assoc_to_yojson
    [
      ("Users", option_to_yojson user_list_to_yojson x.users);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let describe_users_request_to_yojson (x : describe_users_request) =
  assoc_to_yojson
    [
      ("AuthenticationType", Some (authentication_type_to_yojson x.authentication_type));
      ("MaxResults", option_to_yojson integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let disable_user_result_to_yojson = unit_to_yojson

let disable_user_request_to_yojson (x : disable_user_request) =
  assoc_to_yojson
    [
      ("UserName", Some (username_to_yojson x.user_name));
      ("AuthenticationType", Some (authentication_type_to_yojson x.authentication_type));
    ]

let disassociate_app_block_builder_app_block_result_to_yojson = unit_to_yojson

let disassociate_app_block_builder_app_block_request_to_yojson
    (x : disassociate_app_block_builder_app_block_request) =
  assoc_to_yojson
    [
      ("AppBlockArn", Some (arn_to_yojson x.app_block_arn));
      ("AppBlockBuilderName", Some (name_to_yojson x.app_block_builder_name));
    ]

let disassociate_application_fleet_result_to_yojson = unit_to_yojson

let disassociate_application_fleet_request_to_yojson (x : disassociate_application_fleet_request) =
  assoc_to_yojson
    [
      ("FleetName", Some (name_to_yojson x.fleet_name));
      ("ApplicationArn", Some (arn_to_yojson x.application_arn));
    ]

let disassociate_application_from_entitlement_result_to_yojson = unit_to_yojson

let disassociate_application_from_entitlement_request_to_yojson
    (x : disassociate_application_from_entitlement_request) =
  assoc_to_yojson
    [
      ("StackName", Some (name_to_yojson x.stack_name));
      ("EntitlementName", Some (name_to_yojson x.entitlement_name));
      ("ApplicationIdentifier", Some (string__to_yojson x.application_identifier));
    ]

let disassociate_fleet_result_to_yojson = unit_to_yojson

let disassociate_fleet_request_to_yojson (x : disassociate_fleet_request) =
  assoc_to_yojson
    [
      ("FleetName", Some (string__to_yojson x.fleet_name));
      ("StackName", Some (string__to_yojson x.stack_name));
    ]

let disassociate_software_from_image_builder_result_to_yojson = unit_to_yojson

let disassociate_software_from_image_builder_request_to_yojson
    (x : disassociate_software_from_image_builder_request) =
  assoc_to_yojson
    [
      ("ImageBuilderName", Some (name_to_yojson x.image_builder_name));
      ("SoftwareNames", Some (string_list_to_yojson x.software_names));
    ]

let drain_session_instance_result_to_yojson = unit_to_yojson

let drain_session_instance_request_to_yojson (x : drain_session_instance_request) =
  assoc_to_yojson [ ("SessionId", Some (string__to_yojson x.session_id)) ]

let enable_user_result_to_yojson = unit_to_yojson

let enable_user_request_to_yojson (x : enable_user_request) =
  assoc_to_yojson
    [
      ("UserName", Some (username_to_yojson x.user_name));
      ("AuthenticationType", Some (authentication_type_to_yojson x.authentication_type));
    ]

let entitled_application_to_yojson (x : entitled_application) =
  assoc_to_yojson [ ("ApplicationIdentifier", Some (string__to_yojson x.application_identifier)) ]

let entitled_application_list_to_yojson tree = list_to_yojson entitled_application_to_yojson tree
let expire_session_result_to_yojson = unit_to_yojson

let expire_session_request_to_yojson (x : expire_session_request) =
  assoc_to_yojson [ ("SessionId", Some (string__to_yojson x.session_id)) ]

let export_image_tasks_to_yojson tree = list_to_yojson export_image_task_to_yojson tree
let filter_value_to_yojson = string_to_yojson
let filter_values_to_yojson tree = list_to_yojson filter_value_to_yojson tree
let filter_name_to_yojson = string_to_yojson

let filter_to_yojson (x : filter) =
  assoc_to_yojson
    [
      ("Name", Some (filter_name_to_yojson x.name));
      ("Values", Some (filter_values_to_yojson x.values));
    ]

let filters_to_yojson tree = list_to_yojson filter_to_yojson tree

let fleet_attribute_to_yojson (x : fleet_attribute) =
  match x with
  | VPC_CONFIGURATION -> `String "VPC_CONFIGURATION"
  | VPC_CONFIGURATION_SECURITY_GROUP_IDS -> `String "VPC_CONFIGURATION_SECURITY_GROUP_IDS"
  | DOMAIN_JOIN_INFO -> `String "DOMAIN_JOIN_INFO"
  | IAM_ROLE_ARN -> `String "IAM_ROLE_ARN"
  | USB_DEVICE_FILTER_STRINGS -> `String "USB_DEVICE_FILTER_STRINGS"
  | SESSION_SCRIPT_S3_LOCATION -> `String "SESSION_SCRIPT_S3_LOCATION"
  | MAX_SESSIONS_PER_INSTANCE -> `String "MAX_SESSIONS_PER_INSTANCE"
  | VOLUME_CONFIGURATION -> `String "VOLUME_CONFIGURATION"

let fleet_attributes_to_yojson tree = list_to_yojson fleet_attribute_to_yojson tree

let get_export_image_task_result_to_yojson (x : get_export_image_task_result) =
  assoc_to_yojson
    [ ("ExportImageTask", option_to_yojson export_image_task_to_yojson x.export_image_task) ]

let get_export_image_task_request_to_yojson (x : get_export_image_task_request) =
  assoc_to_yojson [ ("TaskId", option_to_yojson uui_d_to_yojson x.task_id) ]

let list_associated_fleets_result_to_yojson (x : list_associated_fleets_result) =
  assoc_to_yojson
    [
      ("Names", option_to_yojson string_list_to_yojson x.names);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_associated_fleets_request_to_yojson (x : list_associated_fleets_request) =
  assoc_to_yojson
    [
      ("StackName", Some (string__to_yojson x.stack_name));
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_associated_stacks_result_to_yojson (x : list_associated_stacks_result) =
  assoc_to_yojson
    [
      ("Names", option_to_yojson string_list_to_yojson x.names);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_associated_stacks_request_to_yojson (x : list_associated_stacks_request) =
  assoc_to_yojson
    [
      ("FleetName", Some (string__to_yojson x.fleet_name));
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_entitled_applications_result_to_yojson (x : list_entitled_applications_result) =
  assoc_to_yojson
    [
      ( "EntitledApplications",
        option_to_yojson entitled_application_list_to_yojson x.entitled_applications );
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_entitled_applications_request_to_yojson (x : list_entitled_applications_request) =
  assoc_to_yojson
    [
      ("StackName", Some (name_to_yojson x.stack_name));
      ("EntitlementName", Some (name_to_yojson x.entitlement_name));
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson integer_to_yojson x.max_results);
    ]

let list_export_image_tasks_result_to_yojson (x : list_export_image_tasks_result) =
  assoc_to_yojson
    [
      ("ExportImageTasks", option_to_yojson export_image_tasks_to_yojson x.export_image_tasks);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_export_image_tasks_request_to_yojson (x : list_export_image_tasks_request) =
  assoc_to_yojson
    [
      ("Filters", option_to_yojson filters_to_yojson x.filters);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tags_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (arn_to_yojson x.resource_arn)) ]

let update_theme_for_stack_result_to_yojson (x : update_theme_for_stack_result) =
  assoc_to_yojson [ ("Theme", option_to_yojson theme_to_yojson x.theme) ]

let theme_attribute_to_yojson (x : theme_attribute) =
  match x with FOOTER_LINKS -> `String "FOOTER_LINKS"

let theme_attributes_to_yojson tree = list_to_yojson theme_attribute_to_yojson tree

let update_theme_for_stack_request_to_yojson (x : update_theme_for_stack_request) =
  assoc_to_yojson
    [
      ("StackName", Some (name_to_yojson x.stack_name));
      ("FooterLinks", option_to_yojson theme_footer_links_to_yojson x.footer_links);
      ("TitleText", option_to_yojson theme_title_text_to_yojson x.title_text);
      ("ThemeStyling", option_to_yojson theme_styling_to_yojson x.theme_styling);
      ( "OrganizationLogoS3Location",
        option_to_yojson s3_location_to_yojson x.organization_logo_s3_location );
      ("FaviconS3Location", option_to_yojson s3_location_to_yojson x.favicon_s3_location);
      ("State", option_to_yojson theme_state_to_yojson x.state);
      ("AttributesToDelete", option_to_yojson theme_attributes_to_yojson x.attributes_to_delete);
    ]

let update_stack_result_to_yojson (x : update_stack_result) =
  assoc_to_yojson [ ("Stack", option_to_yojson stack_to_yojson x.stack) ]

let stack_attribute_to_yojson (x : stack_attribute) =
  match x with
  | STORAGE_CONNECTORS -> `String "STORAGE_CONNECTORS"
  | STORAGE_CONNECTOR_HOMEFOLDERS -> `String "STORAGE_CONNECTOR_HOMEFOLDERS"
  | STORAGE_CONNECTOR_GOOGLE_DRIVE -> `String "STORAGE_CONNECTOR_GOOGLE_DRIVE"
  | STORAGE_CONNECTOR_ONE_DRIVE -> `String "STORAGE_CONNECTOR_ONE_DRIVE"
  | REDIRECT_URL -> `String "REDIRECT_URL"
  | FEEDBACK_URL -> `String "FEEDBACK_URL"
  | THEME_NAME -> `String "THEME_NAME"
  | USER_SETTINGS -> `String "USER_SETTINGS"
  | EMBED_HOST_DOMAINS -> `String "EMBED_HOST_DOMAINS"
  | IAM_ROLE_ARN -> `String "IAM_ROLE_ARN"
  | ACCESS_ENDPOINTS -> `String "ACCESS_ENDPOINTS"
  | STREAMING_EXPERIENCE_SETTINGS -> `String "STREAMING_EXPERIENCE_SETTINGS"
  | CONTENT_REDIRECTION -> `String "CONTENT_REDIRECTION"
  | AGENT_ACCESS_CONFIG -> `String "AGENT_ACCESS_CONFIG"

let stack_attributes_to_yojson tree = list_to_yojson stack_attribute_to_yojson tree

let update_stack_request_to_yojson (x : update_stack_request) =
  assoc_to_yojson
    [
      ("DisplayName", option_to_yojson display_name_to_yojson x.display_name);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Name", Some (string__to_yojson x.name));
      ("StorageConnectors", option_to_yojson storage_connector_list_to_yojson x.storage_connectors);
      ("DeleteStorageConnectors", option_to_yojson boolean__to_yojson x.delete_storage_connectors);
      ("RedirectURL", option_to_yojson redirect_ur_l_to_yojson x.redirect_ur_l);
      ("FeedbackURL", option_to_yojson feedback_ur_l_to_yojson x.feedback_ur_l);
      ("AttributesToDelete", option_to_yojson stack_attributes_to_yojson x.attributes_to_delete);
      ("UserSettings", option_to_yojson user_setting_list_to_yojson x.user_settings);
      ("ApplicationSettings", option_to_yojson application_settings_to_yojson x.application_settings);
      ("AccessEndpoints", option_to_yojson access_endpoint_list_to_yojson x.access_endpoints);
      ("EmbedHostDomains", option_to_yojson embed_host_domains_to_yojson x.embed_host_domains);
      ( "StreamingExperienceSettings",
        option_to_yojson streaming_experience_settings_to_yojson x.streaming_experience_settings );
      ("ContentRedirection", option_to_yojson content_redirection_to_yojson x.content_redirection);
      ( "AgentAccessConfig",
        option_to_yojson agent_access_config_for_update_to_yojson x.agent_access_config );
    ]

let update_image_permissions_result_to_yojson = unit_to_yojson

let update_image_permissions_request_to_yojson (x : update_image_permissions_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_to_yojson x.name));
      ("SharedAccountId", Some (aws_account_id_to_yojson x.shared_account_id));
      ("ImagePermissions", Some (image_permissions_to_yojson x.image_permissions));
    ]

let update_fleet_result_to_yojson (x : update_fleet_result) =
  assoc_to_yojson [ ("Fleet", option_to_yojson fleet_to_yojson x.fleet) ]

let update_fleet_request_to_yojson (x : update_fleet_request) =
  assoc_to_yojson
    [
      ("ImageName", option_to_yojson string__to_yojson x.image_name);
      ("ImageArn", option_to_yojson arn_to_yojson x.image_arn);
      ("Name", option_to_yojson name_to_yojson x.name);
      ("InstanceType", option_to_yojson string__to_yojson x.instance_type);
      ("ComputeCapacity", option_to_yojson compute_capacity_to_yojson x.compute_capacity);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("MaxUserDurationInSeconds", option_to_yojson integer_to_yojson x.max_user_duration_in_seconds);
      ( "DisconnectTimeoutInSeconds",
        option_to_yojson integer_to_yojson x.disconnect_timeout_in_seconds );
      ("DeleteVpcConfig", option_to_yojson boolean__to_yojson x.delete_vpc_config);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("DisplayName", option_to_yojson display_name_to_yojson x.display_name);
      ( "EnableDefaultInternetAccess",
        option_to_yojson boolean_object_to_yojson x.enable_default_internet_access );
      ("DomainJoinInfo", option_to_yojson domain_join_info_to_yojson x.domain_join_info);
      ( "IdleDisconnectTimeoutInSeconds",
        option_to_yojson integer_to_yojson x.idle_disconnect_timeout_in_seconds );
      ("AttributesToDelete", option_to_yojson fleet_attributes_to_yojson x.attributes_to_delete);
      ("IamRoleArn", option_to_yojson arn_to_yojson x.iam_role_arn);
      ("StreamView", option_to_yojson stream_view_to_yojson x.stream_view);
      ("Platform", option_to_yojson platform_type_to_yojson x.platform);
      ("MaxConcurrentSessions", option_to_yojson integer_to_yojson x.max_concurrent_sessions);
      ( "UsbDeviceFilterStrings",
        option_to_yojson usb_device_filter_strings_to_yojson x.usb_device_filter_strings );
      ( "SessionScriptS3Location",
        option_to_yojson s3_location_to_yojson x.session_script_s3_location );
      ("MaxSessionsPerInstance", option_to_yojson integer_to_yojson x.max_sessions_per_instance);
      ("RootVolumeConfig", option_to_yojson volume_config_to_yojson x.root_volume_config);
      ("DisableIMDSV1", option_to_yojson boolean_object_to_yojson x.disable_imds_v1);
    ]

let update_entitlement_result_to_yojson (x : update_entitlement_result) =
  assoc_to_yojson [ ("Entitlement", option_to_yojson entitlement_to_yojson x.entitlement) ]

let update_entitlement_request_to_yojson (x : update_entitlement_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_to_yojson x.name));
      ("StackName", Some (name_to_yojson x.stack_name));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("AppVisibility", option_to_yojson app_visibility_to_yojson x.app_visibility);
      ("Attributes", option_to_yojson entitlement_attribute_list_to_yojson x.attributes);
    ]

let update_directory_config_result_to_yojson (x : update_directory_config_result) =
  assoc_to_yojson
    [ ("DirectoryConfig", option_to_yojson directory_config_to_yojson x.directory_config) ]

let update_directory_config_request_to_yojson (x : update_directory_config_request) =
  assoc_to_yojson
    [
      ("DirectoryName", Some (directory_name_to_yojson x.directory_name));
      ( "OrganizationalUnitDistinguishedNames",
        option_to_yojson organizational_unit_distinguished_names_list_to_yojson
          x.organizational_unit_distinguished_names );
      ( "ServiceAccountCredentials",
        option_to_yojson service_account_credentials_to_yojson x.service_account_credentials );
      ( "CertificateBasedAuthProperties",
        option_to_yojson certificate_based_auth_properties_to_yojson
          x.certificate_based_auth_properties );
    ]

let update_application_result_to_yojson (x : update_application_result) =
  assoc_to_yojson [ ("Application", option_to_yojson application_to_yojson x.application) ]

let update_application_request_to_yojson (x : update_application_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_to_yojson x.name));
      ("DisplayName", option_to_yojson display_name_to_yojson x.display_name);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("IconS3Location", option_to_yojson s3_location_to_yojson x.icon_s3_location);
      ("LaunchPath", option_to_yojson string__to_yojson x.launch_path);
      ("WorkingDirectory", option_to_yojson string__to_yojson x.working_directory);
      ("LaunchParameters", option_to_yojson string__to_yojson x.launch_parameters);
      ("AppBlockArn", option_to_yojson arn_to_yojson x.app_block_arn);
      ( "AttributesToDelete",
        option_to_yojson application_attributes_to_yojson x.attributes_to_delete );
    ]

let update_app_block_builder_result_to_yojson (x : update_app_block_builder_result) =
  assoc_to_yojson
    [ ("AppBlockBuilder", option_to_yojson app_block_builder_to_yojson x.app_block_builder) ]

let update_app_block_builder_request_to_yojson (x : update_app_block_builder_request) =
  assoc_to_yojson
    [
      ("Name", Some (name_to_yojson x.name));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("DisplayName", option_to_yojson display_name_to_yojson x.display_name);
      ("Platform", option_to_yojson platform_type_to_yojson x.platform);
      ("InstanceType", option_to_yojson string__to_yojson x.instance_type);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ( "EnableDefaultInternetAccess",
        option_to_yojson boolean_object_to_yojson x.enable_default_internet_access );
      ("IamRoleArn", option_to_yojson arn_to_yojson x.iam_role_arn);
      ("AccessEndpoints", option_to_yojson access_endpoint_list_to_yojson x.access_endpoints);
      ( "AttributesToDelete",
        option_to_yojson app_block_builder_attributes_to_yojson x.attributes_to_delete );
      ("DisableIMDSV1", option_to_yojson boolean_object_to_yojson x.disable_imds_v1);
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [ ("ResourceArn", Some (arn_to_yojson x.resource_arn)); ("Tags", Some (tags_to_yojson x.tags)) ]

let stop_image_builder_result_to_yojson (x : stop_image_builder_result) =
  assoc_to_yojson [ ("ImageBuilder", option_to_yojson image_builder_to_yojson x.image_builder) ]

let stop_image_builder_request_to_yojson (x : stop_image_builder_request) =
  assoc_to_yojson [ ("Name", Some (string__to_yojson x.name)) ]

let stop_fleet_result_to_yojson = unit_to_yojson

let stop_fleet_request_to_yojson (x : stop_fleet_request) =
  assoc_to_yojson [ ("Name", Some (string__to_yojson x.name)) ]

let stop_app_block_builder_result_to_yojson (x : stop_app_block_builder_result) =
  assoc_to_yojson
    [ ("AppBlockBuilder", option_to_yojson app_block_builder_to_yojson x.app_block_builder) ]

let stop_app_block_builder_request_to_yojson (x : stop_app_block_builder_request) =
  assoc_to_yojson [ ("Name", Some (name_to_yojson x.name)) ]

let start_software_deployment_to_image_builder_result_to_yojson = unit_to_yojson

let start_software_deployment_to_image_builder_request_to_yojson
    (x : start_software_deployment_to_image_builder_request) =
  assoc_to_yojson
    [
      ("ImageBuilderName", Some (name_to_yojson x.image_builder_name));
      ("RetryFailedDeployments", option_to_yojson boolean__to_yojson x.retry_failed_deployments);
    ]

let start_image_builder_result_to_yojson (x : start_image_builder_result) =
  assoc_to_yojson [ ("ImageBuilder", option_to_yojson image_builder_to_yojson x.image_builder) ]

let start_image_builder_request_to_yojson (x : start_image_builder_request) =
  assoc_to_yojson
    [
      ("Name", Some (string__to_yojson x.name));
      ( "AppstreamAgentVersion",
        option_to_yojson appstream_agent_version_to_yojson x.appstream_agent_version );
    ]

let start_fleet_result_to_yojson = unit_to_yojson

let start_fleet_request_to_yojson (x : start_fleet_request) =
  assoc_to_yojson [ ("Name", Some (string__to_yojson x.name)) ]

let start_app_block_builder_result_to_yojson (x : start_app_block_builder_result) =
  assoc_to_yojson
    [ ("AppBlockBuilder", option_to_yojson app_block_builder_to_yojson x.app_block_builder) ]

let start_app_block_builder_request_to_yojson (x : start_app_block_builder_request) =
  assoc_to_yojson [ ("Name", Some (name_to_yojson x.name)) ]
