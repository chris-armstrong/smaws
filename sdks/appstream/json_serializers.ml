open Smaws_Lib.Json.SerializeHelpers
open Types

let workspace_image_id_to_yojson = string_to_yojson
let string__to_yojson = string_to_yojson
let subnet_id_list_to_yojson tree = list_to_yojson string__to_yojson tree
let security_group_id_list_to_yojson tree = list_to_yojson string__to_yojson tree

let vpc_config_to_yojson (x : vpc_config) =
  assoc_to_yojson
    [
      ("SecurityGroupIds", option_to_yojson security_group_id_list_to_yojson x.security_group_ids);
      ("SubnetIds", option_to_yojson subnet_id_list_to_yojson x.subnet_ids);
    ]

let integer_to_yojson = int_to_yojson

let volume_config_to_yojson (x : volume_config) =
  assoc_to_yojson [ ("VolumeSizeInGb", option_to_yojson integer_to_yojson x.volume_size_in_gb) ]

let visibility_type_to_yojson (x : visibility_type) =
  match x with
  | SHARED -> `String "SHARED"
  | PRIVATE -> `String "PRIVATE"
  | PUBLIC -> `String "PUBLIC"

let username_to_yojson = string_to_yojson

let authentication_type_to_yojson (x : authentication_type) =
  match x with
  | AWS_AD -> `String "AWS_AD"
  | USERPOOL -> `String "USERPOOL"
  | SAML -> `String "SAML"
  | API -> `String "API"

let boolean__to_yojson = bool_to_yojson

let user_stack_association_to_yojson (x : user_stack_association) =
  assoc_to_yojson
    [
      ("SendEmailNotification", option_to_yojson boolean__to_yojson x.send_email_notification);
      ("AuthenticationType", Some (authentication_type_to_yojson x.authentication_type));
      ("UserName", Some (username_to_yojson x.user_name));
      ("StackName", Some (string__to_yojson x.stack_name));
    ]

let user_stack_association_list_to_yojson tree =
  list_to_yojson user_stack_association_to_yojson tree

let user_stack_association_error_code_to_yojson (x : user_stack_association_error_code) =
  match x with
  | INTERNAL_ERROR -> `String "INTERNAL_ERROR"
  | DIRECTORY_NOT_FOUND -> `String "DIRECTORY_NOT_FOUND"
  | USER_NAME_NOT_FOUND -> `String "USER_NAME_NOT_FOUND"
  | STACK_NOT_FOUND -> `String "STACK_NOT_FOUND"

let user_stack_association_error_to_yojson (x : user_stack_association_error) =
  assoc_to_yojson
    [
      ("ErrorMessage", option_to_yojson string__to_yojson x.error_message);
      ("ErrorCode", option_to_yojson user_stack_association_error_code_to_yojson x.error_code);
      ( "UserStackAssociation",
        option_to_yojson user_stack_association_to_yojson x.user_stack_association );
    ]

let user_stack_association_error_list_to_yojson tree =
  list_to_yojson user_stack_association_error_to_yojson tree

let action_to_yojson (x : action) =
  match x with
  | AUTO_TIME_ZONE_REDIRECTION -> `String "AUTO_TIME_ZONE_REDIRECTION"
  | DOMAIN_SMART_CARD_SIGNIN -> `String "DOMAIN_SMART_CARD_SIGNIN"
  | DOMAIN_PASSWORD_SIGNIN -> `String "DOMAIN_PASSWORD_SIGNIN"
  | PRINTING_TO_LOCAL_DEVICE -> `String "PRINTING_TO_LOCAL_DEVICE"
  | FILE_DOWNLOAD -> `String "FILE_DOWNLOAD"
  | FILE_UPLOAD -> `String "FILE_UPLOAD"
  | CLIPBOARD_COPY_TO_LOCAL_DEVICE -> `String "CLIPBOARD_COPY_TO_LOCAL_DEVICE"
  | CLIPBOARD_COPY_FROM_LOCAL_DEVICE -> `String "CLIPBOARD_COPY_FROM_LOCAL_DEVICE"

let permission_to_yojson (x : permission) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let user_setting_to_yojson (x : user_setting) =
  assoc_to_yojson
    [
      ("MaximumLength", option_to_yojson integer_to_yojson x.maximum_length);
      ("Permission", Some (permission_to_yojson x.permission));
      ("Action", Some (action_to_yojson x.action));
    ]

let user_setting_list_to_yojson tree = list_to_yojson user_setting_to_yojson tree
let arn_to_yojson = string_to_yojson
let user_attribute_value_to_yojson = string_to_yojson
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let user_to_yojson (x : user) =
  assoc_to_yojson
    [
      ("AuthenticationType", Some (authentication_type_to_yojson x.authentication_type));
      ("CreatedTime", option_to_yojson timestamp_to_yojson x.created_time);
      ("LastName", option_to_yojson user_attribute_value_to_yojson x.last_name);
      ("FirstName", option_to_yojson user_attribute_value_to_yojson x.first_name);
      ("Status", option_to_yojson string__to_yojson x.status);
      ("Enabled", option_to_yojson boolean__to_yojson x.enabled);
      ("UserName", option_to_yojson username_to_yojson x.user_name);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
    ]

let user_list_to_yojson tree = list_to_yojson user_to_yojson tree
let user_id_to_yojson = string_to_yojson

let user_control_mode_to_yojson (x : user_control_mode) =
  match x with
  | DISABLED -> `String "DISABLED"
  | VIEW_STOP -> `String "VIEW_STOP"
  | VIEW_ONLY -> `String "VIEW_ONLY"

let usb_device_filter_string_to_yojson = string_to_yojson

let usb_device_filter_strings_to_yojson tree =
  list_to_yojson usb_device_filter_string_to_yojson tree

let usage_report_schedule_to_yojson (x : usage_report_schedule) =
  match x with DAILY -> `String "DAILY"

let usage_report_execution_error_code_to_yojson (x : usage_report_execution_error_code) =
  match x with
  | INTERNAL_SERVICE_ERROR -> `String "INTERNAL_SERVICE_ERROR"
  | ACCESS_DENIED -> `String "ACCESS_DENIED"
  | RESOURCE_NOT_FOUND -> `String "RESOURCE_NOT_FOUND"

let last_report_generation_execution_error_to_yojson (x : last_report_generation_execution_error) =
  assoc_to_yojson
    [
      ("ErrorMessage", option_to_yojson string__to_yojson x.error_message);
      ("ErrorCode", option_to_yojson usage_report_execution_error_code_to_yojson x.error_code);
    ]

let last_report_generation_execution_errors_to_yojson tree =
  list_to_yojson last_report_generation_execution_error_to_yojson tree

let usage_report_subscription_to_yojson (x : usage_report_subscription) =
  assoc_to_yojson
    [
      ( "SubscriptionErrors",
        option_to_yojson last_report_generation_execution_errors_to_yojson x.subscription_errors );
      ("LastGeneratedReportDate", option_to_yojson timestamp_to_yojson x.last_generated_report_date);
      ("Schedule", option_to_yojson usage_report_schedule_to_yojson x.schedule);
      ("S3BucketName", option_to_yojson string__to_yojson x.s3_bucket_name);
    ]

let usage_report_subscription_list_to_yojson tree =
  list_to_yojson usage_report_subscription_to_yojson tree

let boolean_object_to_yojson = bool_to_yojson
let url_pattern_to_yojson = string_to_yojson
let url_pattern_list_to_yojson tree = list_to_yojson url_pattern_to_yojson tree

let url_redirection_config_to_yojson (x : url_redirection_config) =
  assoc_to_yojson
    [
      ("DeniedUrls", option_to_yojson url_pattern_list_to_yojson x.denied_urls);
      ("AllowedUrls", option_to_yojson url_pattern_list_to_yojson x.allowed_urls);
      ("Enabled", Some (boolean_object_to_yojson x.enabled));
    ]

let name_to_yojson = string_to_yojson

let theme_state_to_yojson (x : theme_state) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let theme_title_text_to_yojson = string_to_yojson

let theme_styling_to_yojson (x : theme_styling) =
  match x with
  | RED -> `String "RED"
  | PINK -> `String "PINK"
  | BLUE -> `String "BLUE"
  | LIGHT_BLUE -> `String "LIGHT_BLUE"

let theme_footer_link_display_name_to_yojson = string_to_yojson
let theme_footer_link_ur_l_to_yojson = string_to_yojson

let theme_footer_link_to_yojson (x : theme_footer_link) =
  assoc_to_yojson
    [
      ("FooterLinkURL", option_to_yojson theme_footer_link_ur_l_to_yojson x.footer_link_ur_l);
      ("DisplayName", option_to_yojson theme_footer_link_display_name_to_yojson x.display_name);
    ]

let theme_footer_links_to_yojson tree = list_to_yojson theme_footer_link_to_yojson tree

let theme_to_yojson (x : theme) =
  assoc_to_yojson
    [
      ("CreatedTime", option_to_yojson timestamp_to_yojson x.created_time);
      ("ThemeFaviconURL", option_to_yojson string__to_yojson x.theme_favicon_ur_l);
      ("ThemeOrganizationLogoURL", option_to_yojson string__to_yojson x.theme_organization_logo_ur_l);
      ("ThemeFooterLinks", option_to_yojson theme_footer_links_to_yojson x.theme_footer_links);
      ("ThemeStyling", option_to_yojson theme_styling_to_yojson x.theme_styling);
      ("ThemeTitleText", option_to_yojson theme_title_text_to_yojson x.theme_title_text);
      ("State", option_to_yojson theme_state_to_yojson x.state);
      ("StackName", option_to_yojson name_to_yojson x.stack_name);
    ]

let update_theme_for_stack_result_to_yojson (x : update_theme_for_stack_result) =
  assoc_to_yojson [ ("Theme", option_to_yojson theme_to_yojson x.theme) ]

let s3_bucket_to_yojson = string_to_yojson
let s3_key_to_yojson = string_to_yojson

let s3_location_to_yojson (x : s3_location) =
  assoc_to_yojson
    [
      ("S3Key", option_to_yojson s3_key_to_yojson x.s3_key);
      ("S3Bucket", Some (s3_bucket_to_yojson x.s3_bucket));
    ]

let theme_attribute_to_yojson (x : theme_attribute) =
  match x with FOOTER_LINKS -> `String "FOOTER_LINKS"

let theme_attributes_to_yojson tree = list_to_yojson theme_attribute_to_yojson tree

let update_theme_for_stack_request_to_yojson (x : update_theme_for_stack_request) =
  assoc_to_yojson
    [
      ("AttributesToDelete", option_to_yojson theme_attributes_to_yojson x.attributes_to_delete);
      ("State", option_to_yojson theme_state_to_yojson x.state);
      ("FaviconS3Location", option_to_yojson s3_location_to_yojson x.favicon_s3_location);
      ( "OrganizationLogoS3Location",
        option_to_yojson s3_location_to_yojson x.organization_logo_s3_location );
      ("ThemeStyling", option_to_yojson theme_styling_to_yojson x.theme_styling);
      ("TitleText", option_to_yojson theme_title_text_to_yojson x.title_text);
      ("FooterLinks", option_to_yojson theme_footer_links_to_yojson x.footer_links);
      ("StackName", Some (name_to_yojson x.stack_name));
    ]

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

let invalid_account_status_exception_to_yojson (x : invalid_account_status_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let concurrent_modification_exception_to_yojson (x : concurrent_modification_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let storage_connector_type_to_yojson (x : storage_connector_type) =
  match x with
  | ONE_DRIVE -> `String "ONE_DRIVE"
  | GOOGLE_DRIVE -> `String "GOOGLE_DRIVE"
  | HOMEFOLDERS -> `String "HOMEFOLDERS"

let resource_identifier_to_yojson = string_to_yojson
let domain_to_yojson = string_to_yojson
let domain_list_to_yojson tree = list_to_yojson domain_to_yojson tree

let storage_connector_to_yojson (x : storage_connector) =
  assoc_to_yojson
    [
      ( "DomainsRequireAdminConsent",
        option_to_yojson domain_list_to_yojson x.domains_require_admin_consent );
      ("Domains", option_to_yojson domain_list_to_yojson x.domains);
      ("ResourceIdentifier", option_to_yojson resource_identifier_to_yojson x.resource_identifier);
      ("ConnectorType", Some (storage_connector_type_to_yojson x.connector_type));
    ]

let storage_connector_list_to_yojson tree = list_to_yojson storage_connector_to_yojson tree
let redirect_ur_l_to_yojson = string_to_yojson
let feedback_ur_l_to_yojson = string_to_yojson

let stack_error_code_to_yojson (x : stack_error_code) =
  match x with
  | INTERNAL_SERVICE_ERROR -> `String "INTERNAL_SERVICE_ERROR"
  | STORAGE_CONNECTOR_ERROR -> `String "STORAGE_CONNECTOR_ERROR"

let stack_error_to_yojson (x : stack_error) =
  assoc_to_yojson
    [
      ("ErrorMessage", option_to_yojson string__to_yojson x.error_message);
      ("ErrorCode", option_to_yojson stack_error_code_to_yojson x.error_code);
    ]

let stack_errors_to_yojson tree = list_to_yojson stack_error_to_yojson tree
let settings_group_to_yojson = string_to_yojson

let application_settings_response_to_yojson (x : application_settings_response) =
  assoc_to_yojson
    [
      ("S3BucketName", option_to_yojson string__to_yojson x.s3_bucket_name);
      ("SettingsGroup", option_to_yojson settings_group_to_yojson x.settings_group);
      ("Enabled", option_to_yojson boolean__to_yojson x.enabled);
    ]

let access_endpoint_type_to_yojson (x : access_endpoint_type) =
  match x with STREAMING -> `String "STREAMING"

let access_endpoint_to_yojson (x : access_endpoint) =
  assoc_to_yojson
    [
      ("VpceId", option_to_yojson string__to_yojson x.vpce_id);
      ("EndpointType", Some (access_endpoint_type_to_yojson x.endpoint_type));
    ]

let access_endpoint_list_to_yojson tree = list_to_yojson access_endpoint_to_yojson tree
let embed_host_domain_to_yojson = string_to_yojson
let embed_host_domains_to_yojson tree = list_to_yojson embed_host_domain_to_yojson tree

let preferred_protocol_to_yojson (x : preferred_protocol) =
  match x with UDP -> `String "UDP" | TCP -> `String "TCP"

let streaming_experience_settings_to_yojson (x : streaming_experience_settings) =
  assoc_to_yojson
    [ ("PreferredProtocol", option_to_yojson preferred_protocol_to_yojson x.preferred_protocol) ]

let content_redirection_to_yojson (x : content_redirection) =
  assoc_to_yojson
    [ ("HostToClient", option_to_yojson url_redirection_config_to_yojson x.host_to_client) ]

let agent_action_to_yojson (x : agent_action) =
  match x with
  | FORWARD_MCP_TOOLS -> `String "FORWARD_MCP_TOOLS"
  | COMPUTER_INPUT -> `String "COMPUTER_INPUT"
  | COMPUTER_VISION -> `String "COMPUTER_VISION"

let agent_access_setting_to_yojson (x : agent_access_setting) =
  assoc_to_yojson
    [
      ("Permission", Some (permission_to_yojson x.permission));
      ("AgentAction", Some (agent_action_to_yojson x.agent_action));
    ]

let agent_access_setting_list_to_yojson tree = list_to_yojson agent_access_setting_to_yojson tree
let s3_bucket_arn_to_yojson = string_to_yojson

let screen_resolution_to_yojson (x : screen_resolution) =
  match x with W_1280xH_720 -> `String "W_1280xH_720"

let screen_image_format_to_yojson (x : screen_image_format) =
  match x with JPEG -> `String "JPEG" | PNG -> `String "PNG"

let agent_access_config_to_yojson (x : agent_access_config) =
  assoc_to_yojson
    [
      ("UserControlMode", option_to_yojson user_control_mode_to_yojson x.user_control_mode);
      ("ScreenImageFormat", Some (screen_image_format_to_yojson x.screen_image_format));
      ("ScreenResolution", Some (screen_resolution_to_yojson x.screen_resolution));
      ( "ScreenshotsUploadEnabled",
        option_to_yojson boolean_object_to_yojson x.screenshots_upload_enabled );
      ("S3BucketArn", option_to_yojson s3_bucket_arn_to_yojson x.s3_bucket_arn);
      ("Settings", Some (agent_access_setting_list_to_yojson x.settings));
    ]

let stack_to_yojson (x : stack) =
  assoc_to_yojson
    [
      ("AgentAccessConfig", option_to_yojson agent_access_config_to_yojson x.agent_access_config);
      ("ContentRedirection", option_to_yojson content_redirection_to_yojson x.content_redirection);
      ( "StreamingExperienceSettings",
        option_to_yojson streaming_experience_settings_to_yojson x.streaming_experience_settings );
      ("EmbedHostDomains", option_to_yojson embed_host_domains_to_yojson x.embed_host_domains);
      ("AccessEndpoints", option_to_yojson access_endpoint_list_to_yojson x.access_endpoints);
      ( "ApplicationSettings",
        option_to_yojson application_settings_response_to_yojson x.application_settings );
      ("UserSettings", option_to_yojson user_setting_list_to_yojson x.user_settings);
      ("StackErrors", option_to_yojson stack_errors_to_yojson x.stack_errors);
      ("FeedbackURL", option_to_yojson feedback_ur_l_to_yojson x.feedback_ur_l);
      ("RedirectURL", option_to_yojson redirect_ur_l_to_yojson x.redirect_ur_l);
      ("StorageConnectors", option_to_yojson storage_connector_list_to_yojson x.storage_connectors);
      ("CreatedTime", option_to_yojson timestamp_to_yojson x.created_time);
      ("DisplayName", option_to_yojson string__to_yojson x.display_name);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Name", Some (string__to_yojson x.name));
      ("Arn", option_to_yojson arn_to_yojson x.arn);
    ]

let update_stack_result_to_yojson (x : update_stack_result) =
  assoc_to_yojson [ ("Stack", option_to_yojson stack_to_yojson x.stack) ]

let display_name_to_yojson = string_to_yojson
let description_to_yojson = string_to_yojson

let stack_attribute_to_yojson (x : stack_attribute) =
  match x with
  | AGENT_ACCESS_CONFIG -> `String "AGENT_ACCESS_CONFIG"
  | CONTENT_REDIRECTION -> `String "CONTENT_REDIRECTION"
  | STREAMING_EXPERIENCE_SETTINGS -> `String "STREAMING_EXPERIENCE_SETTINGS"
  | ACCESS_ENDPOINTS -> `String "ACCESS_ENDPOINTS"
  | IAM_ROLE_ARN -> `String "IAM_ROLE_ARN"
  | EMBED_HOST_DOMAINS -> `String "EMBED_HOST_DOMAINS"
  | USER_SETTINGS -> `String "USER_SETTINGS"
  | THEME_NAME -> `String "THEME_NAME"
  | FEEDBACK_URL -> `String "FEEDBACK_URL"
  | REDIRECT_URL -> `String "REDIRECT_URL"
  | STORAGE_CONNECTOR_ONE_DRIVE -> `String "STORAGE_CONNECTOR_ONE_DRIVE"
  | STORAGE_CONNECTOR_GOOGLE_DRIVE -> `String "STORAGE_CONNECTOR_GOOGLE_DRIVE"
  | STORAGE_CONNECTOR_HOMEFOLDERS -> `String "STORAGE_CONNECTOR_HOMEFOLDERS"
  | STORAGE_CONNECTORS -> `String "STORAGE_CONNECTORS"

let stack_attributes_to_yojson tree = list_to_yojson stack_attribute_to_yojson tree

let application_settings_to_yojson (x : application_settings) =
  assoc_to_yojson
    [
      ("SettingsGroup", option_to_yojson settings_group_to_yojson x.settings_group);
      ("Enabled", Some (boolean__to_yojson x.enabled));
    ]

let agent_access_config_for_update_to_yojson (x : agent_access_config_for_update) =
  assoc_to_yojson
    [
      ("UserControlMode", option_to_yojson user_control_mode_to_yojson x.user_control_mode);
      ("ScreenImageFormat", option_to_yojson screen_image_format_to_yojson x.screen_image_format);
      ("ScreenResolution", option_to_yojson screen_resolution_to_yojson x.screen_resolution);
      ( "ScreenshotsUploadEnabled",
        option_to_yojson boolean_object_to_yojson x.screenshots_upload_enabled );
      ("S3BucketArn", option_to_yojson s3_bucket_arn_to_yojson x.s3_bucket_arn);
      ("Settings", option_to_yojson agent_access_setting_list_to_yojson x.settings);
    ]

let update_stack_request_to_yojson (x : update_stack_request) =
  assoc_to_yojson
    [
      ( "AgentAccessConfig",
        option_to_yojson agent_access_config_for_update_to_yojson x.agent_access_config );
      ("ContentRedirection", option_to_yojson content_redirection_to_yojson x.content_redirection);
      ( "StreamingExperienceSettings",
        option_to_yojson streaming_experience_settings_to_yojson x.streaming_experience_settings );
      ("EmbedHostDomains", option_to_yojson embed_host_domains_to_yojson x.embed_host_domains);
      ("AccessEndpoints", option_to_yojson access_endpoint_list_to_yojson x.access_endpoints);
      ("ApplicationSettings", option_to_yojson application_settings_to_yojson x.application_settings);
      ("UserSettings", option_to_yojson user_setting_list_to_yojson x.user_settings);
      ("AttributesToDelete", option_to_yojson stack_attributes_to_yojson x.attributes_to_delete);
      ("FeedbackURL", option_to_yojson feedback_ur_l_to_yojson x.feedback_ur_l);
      ("RedirectURL", option_to_yojson redirect_ur_l_to_yojson x.redirect_ur_l);
      ("DeleteStorageConnectors", option_to_yojson boolean__to_yojson x.delete_storage_connectors);
      ("StorageConnectors", option_to_yojson storage_connector_list_to_yojson x.storage_connectors);
      ("Name", Some (string__to_yojson x.name));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("DisplayName", option_to_yojson display_name_to_yojson x.display_name);
    ]

let resource_in_use_exception_to_yojson (x : resource_in_use_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let invalid_role_exception_to_yojson (x : invalid_role_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let incompatible_image_exception_to_yojson (x : incompatible_image_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let update_image_permissions_result_to_yojson = unit_to_yojson
let aws_account_id_to_yojson = string_to_yojson

let image_permissions_to_yojson (x : image_permissions) =
  assoc_to_yojson
    [
      ("allowImageBuilder", option_to_yojson boolean_object_to_yojson x.allow_image_builder);
      ("allowFleet", option_to_yojson boolean_object_to_yojson x.allow_fleet);
    ]

let update_image_permissions_request_to_yojson (x : update_image_permissions_request) =
  assoc_to_yojson
    [
      ("ImagePermissions", Some (image_permissions_to_yojson x.image_permissions));
      ("SharedAccountId", Some (aws_account_id_to_yojson x.shared_account_id));
      ("Name", Some (name_to_yojson x.name));
    ]

let resource_not_available_exception_to_yojson (x : resource_not_available_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let fleet_type_to_yojson (x : fleet_type) =
  match x with
  | ELASTIC -> `String "ELASTIC"
  | ON_DEMAND -> `String "ON_DEMAND"
  | ALWAYS_ON -> `String "ALWAYS_ON"

let compute_capacity_status_to_yojson (x : compute_capacity_status) =
  assoc_to_yojson
    [
      ( "DrainModeUnusedUserSessions",
        option_to_yojson integer_to_yojson x.drain_mode_unused_user_sessions );
      ( "DrainModeActiveUserSessions",
        option_to_yojson integer_to_yojson x.drain_mode_active_user_sessions );
      ("Draining", option_to_yojson integer_to_yojson x.draining);
      ("ActualUserSessions", option_to_yojson integer_to_yojson x.actual_user_sessions);
      ("ActiveUserSessions", option_to_yojson integer_to_yojson x.active_user_sessions);
      ("AvailableUserSessions", option_to_yojson integer_to_yojson x.available_user_sessions);
      ("DesiredUserSessions", option_to_yojson integer_to_yojson x.desired_user_sessions);
      ("Available", option_to_yojson integer_to_yojson x.available);
      ("InUse", option_to_yojson integer_to_yojson x.in_use);
      ("Running", option_to_yojson integer_to_yojson x.running);
      ("Desired", Some (integer_to_yojson x.desired));
    ]

let fleet_state_to_yojson (x : fleet_state) =
  match x with
  | STOPPED -> `String "STOPPED"
  | STOPPING -> `String "STOPPING"
  | RUNNING -> `String "RUNNING"
  | STARTING -> `String "STARTING"

let fleet_error_code_to_yojson (x : fleet_error_code) =
  match x with
  | VALIDATION_ERROR -> `String "VALIDATION_ERROR"
  | DOMAIN_JOIN_INTERNAL_SERVICE_ERROR -> `String "DOMAIN_JOIN_INTERNAL_SERVICE_ERROR"
  | DOMAIN_JOIN_NERR_PASSWORD_EXPIRED -> `String "DOMAIN_JOIN_NERR_PASSWORD_EXPIRED"
  | DOMAIN_JOIN_ERROR_DS_MACHINE_ACCOUNT_QUOTA_EXCEEDED ->
      `String "DOMAIN_JOIN_ERROR_DS_MACHINE_ACCOUNT_QUOTA_EXCEEDED"
  | DOMAIN_JOIN_NERR_WORKSTATION_NOT_STARTED -> `String "DOMAIN_JOIN_NERR_WORKSTATION_NOT_STARTED"
  | DOMAIN_JOIN_NERR_INVALID_WORKGROUP_NAME -> `String "DOMAIN_JOIN_NERR_INVALID_WORKGROUP_NAME"
  | DOMAIN_JOIN_ERROR_NOT_SUPPORTED -> `String "DOMAIN_JOIN_ERROR_NOT_SUPPORTED"
  | DOMAIN_JOIN_ERROR_NO_SUCH_DOMAIN -> `String "DOMAIN_JOIN_ERROR_NO_SUCH_DOMAIN"
  | DOMAIN_JOIN_ERROR_MORE_DATA -> `String "DOMAIN_JOIN_ERROR_MORE_DATA"
  | DOMAIN_JOIN_ERROR_INVALID_PARAMETER -> `String "DOMAIN_JOIN_ERROR_INVALID_PARAMETER"
  | DOMAIN_JOIN_ERROR_LOGON_FAILURE -> `String "DOMAIN_JOIN_ERROR_LOGON_FAILURE"
  | DOMAIN_JOIN_ERROR_ACCESS_DENIED -> `String "DOMAIN_JOIN_ERROR_ACCESS_DENIED"
  | DOMAIN_JOIN_ERROR_FILE_NOT_FOUND -> `String "DOMAIN_JOIN_ERROR_FILE_NOT_FOUND"
  | FLEET_INSTANCE_PROVISIONING_FAILURE -> `String "FLEET_INSTANCE_PROVISIONING_FAILURE"
  | FLEET_STOPPED -> `String "FLEET_STOPPED"
  | IAM_SERVICE_ROLE_MISSING_DESCRIBE_SECURITY_GROUPS_ACTION ->
      `String "IAM_SERVICE_ROLE_MISSING_DESCRIBE_SECURITY_GROUPS_ACTION"
  | IGW_NOT_ATTACHED -> `String "IGW_NOT_ATTACHED"
  | SECURITY_GROUPS_NOT_FOUND -> `String "SECURITY_GROUPS_NOT_FOUND"
  | INVALID_SUBNET_CONFIGURATION -> `String "INVALID_SUBNET_CONFIGURATION"
  | IMAGE_NOT_FOUND -> `String "IMAGE_NOT_FOUND"
  | SUBNET_NOT_FOUND -> `String "SUBNET_NOT_FOUND"
  | IAM_SERVICE_ROLE_MISSING_DESCRIBE_SUBNET_ACTION ->
      `String "IAM_SERVICE_ROLE_MISSING_DESCRIBE_SUBNET_ACTION"
  | SUBNET_HAS_INSUFFICIENT_IP_ADDRESSES -> `String "SUBNET_HAS_INSUFFICIENT_IP_ADDRESSES"
  | STS_DISABLED_IN_REGION -> `String "STS_DISABLED_IN_REGION"
  | MACHINE_ROLE_IS_MISSING -> `String "MACHINE_ROLE_IS_MISSING"
  | IAM_SERVICE_ROLE_IS_MISSING -> `String "IAM_SERVICE_ROLE_IS_MISSING"
  | INTERNAL_SERVICE_ERROR -> `String "INTERNAL_SERVICE_ERROR"
  | NETWORK_INTERFACE_LIMIT_EXCEEDED -> `String "NETWORK_INTERFACE_LIMIT_EXCEEDED"
  | IAM_SERVICE_ROLE_MISSING_ENI_DELETE_ACTION ->
      `String "IAM_SERVICE_ROLE_MISSING_ENI_DELETE_ACTION"
  | IAM_SERVICE_ROLE_MISSING_ENI_CREATE_ACTION ->
      `String "IAM_SERVICE_ROLE_MISSING_ENI_CREATE_ACTION"
  | IAM_SERVICE_ROLE_MISSING_ENI_DESCRIBE_ACTION ->
      `String "IAM_SERVICE_ROLE_MISSING_ENI_DESCRIBE_ACTION"

let fleet_error_to_yojson (x : fleet_error) =
  assoc_to_yojson
    [
      ("ErrorMessage", option_to_yojson string__to_yojson x.error_message);
      ("ErrorCode", option_to_yojson fleet_error_code_to_yojson x.error_code);
    ]

let fleet_errors_to_yojson tree = list_to_yojson fleet_error_to_yojson tree
let directory_name_to_yojson = string_to_yojson
let organizational_unit_distinguished_name_to_yojson = string_to_yojson

let domain_join_info_to_yojson (x : domain_join_info) =
  assoc_to_yojson
    [
      ( "OrganizationalUnitDistinguishedName",
        option_to_yojson organizational_unit_distinguished_name_to_yojson
          x.organizational_unit_distinguished_name );
      ("DirectoryName", option_to_yojson directory_name_to_yojson x.directory_name);
    ]

let stream_view_to_yojson (x : stream_view) =
  match x with DESKTOP -> `String "DESKTOP" | APP -> `String "APP"

let platform_type_to_yojson (x : platform_type) =
  match x with
  | UBUNTU_PRO_2404 -> `String "UBUNTU_PRO_2404"
  | ROCKY_LINUX8 -> `String "ROCKY_LINUX8"
  | RHEL8 -> `String "RHEL8"
  | AMAZON_LINUX2 -> `String "AMAZON_LINUX2"
  | WINDOWS_SERVER_2025 -> `String "WINDOWS_SERVER_2025"
  | WINDOWS_SERVER_2022 -> `String "WINDOWS_SERVER_2022"
  | WINDOWS_SERVER_2019 -> `String "WINDOWS_SERVER_2019"
  | WINDOWS_SERVER_2016 -> `String "WINDOWS_SERVER_2016"
  | WINDOWS -> `String "WINDOWS"

let fleet_to_yojson (x : fleet) =
  assoc_to_yojson
    [
      ("DisableIMDSV1", option_to_yojson boolean_object_to_yojson x.disable_imds_v1);
      ("RootVolumeConfig", option_to_yojson volume_config_to_yojson x.root_volume_config);
      ("MaxSessionsPerInstance", option_to_yojson integer_to_yojson x.max_sessions_per_instance);
      ( "SessionScriptS3Location",
        option_to_yojson s3_location_to_yojson x.session_script_s3_location );
      ( "UsbDeviceFilterStrings",
        option_to_yojson usb_device_filter_strings_to_yojson x.usb_device_filter_strings );
      ("MaxConcurrentSessions", option_to_yojson integer_to_yojson x.max_concurrent_sessions);
      ("Platform", option_to_yojson platform_type_to_yojson x.platform);
      ("StreamView", option_to_yojson stream_view_to_yojson x.stream_view);
      ("IamRoleArn", option_to_yojson arn_to_yojson x.iam_role_arn);
      ( "IdleDisconnectTimeoutInSeconds",
        option_to_yojson integer_to_yojson x.idle_disconnect_timeout_in_seconds );
      ("DomainJoinInfo", option_to_yojson domain_join_info_to_yojson x.domain_join_info);
      ( "EnableDefaultInternetAccess",
        option_to_yojson boolean_object_to_yojson x.enable_default_internet_access );
      ("FleetErrors", option_to_yojson fleet_errors_to_yojson x.fleet_errors);
      ("CreatedTime", option_to_yojson timestamp_to_yojson x.created_time);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("State", Some (fleet_state_to_yojson x.state));
      ( "DisconnectTimeoutInSeconds",
        option_to_yojson integer_to_yojson x.disconnect_timeout_in_seconds );
      ("MaxUserDurationInSeconds", option_to_yojson integer_to_yojson x.max_user_duration_in_seconds);
      ("ComputeCapacityStatus", Some (compute_capacity_status_to_yojson x.compute_capacity_status));
      ("FleetType", option_to_yojson fleet_type_to_yojson x.fleet_type);
      ("InstanceType", Some (string__to_yojson x.instance_type));
      ("ImageArn", option_to_yojson arn_to_yojson x.image_arn);
      ("ImageName", option_to_yojson string__to_yojson x.image_name);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("DisplayName", option_to_yojson string__to_yojson x.display_name);
      ("Name", Some (string__to_yojson x.name));
      ("Arn", Some (arn_to_yojson x.arn));
    ]

let update_fleet_result_to_yojson (x : update_fleet_result) =
  assoc_to_yojson [ ("Fleet", option_to_yojson fleet_to_yojson x.fleet) ]

let compute_capacity_to_yojson (x : compute_capacity) =
  assoc_to_yojson
    [
      ("DesiredSessions", option_to_yojson integer_to_yojson x.desired_sessions);
      ("DesiredInstances", option_to_yojson integer_to_yojson x.desired_instances);
    ]

let fleet_attribute_to_yojson (x : fleet_attribute) =
  match x with
  | VOLUME_CONFIGURATION -> `String "VOLUME_CONFIGURATION"
  | MAX_SESSIONS_PER_INSTANCE -> `String "MAX_SESSIONS_PER_INSTANCE"
  | SESSION_SCRIPT_S3_LOCATION -> `String "SESSION_SCRIPT_S3_LOCATION"
  | USB_DEVICE_FILTER_STRINGS -> `String "USB_DEVICE_FILTER_STRINGS"
  | IAM_ROLE_ARN -> `String "IAM_ROLE_ARN"
  | DOMAIN_JOIN_INFO -> `String "DOMAIN_JOIN_INFO"
  | VPC_CONFIGURATION_SECURITY_GROUP_IDS -> `String "VPC_CONFIGURATION_SECURITY_GROUP_IDS"
  | VPC_CONFIGURATION -> `String "VPC_CONFIGURATION"

let fleet_attributes_to_yojson tree = list_to_yojson fleet_attribute_to_yojson tree

let update_fleet_request_to_yojson (x : update_fleet_request) =
  assoc_to_yojson
    [
      ("DisableIMDSV1", option_to_yojson boolean_object_to_yojson x.disable_imds_v1);
      ("RootVolumeConfig", option_to_yojson volume_config_to_yojson x.root_volume_config);
      ("MaxSessionsPerInstance", option_to_yojson integer_to_yojson x.max_sessions_per_instance);
      ( "SessionScriptS3Location",
        option_to_yojson s3_location_to_yojson x.session_script_s3_location );
      ( "UsbDeviceFilterStrings",
        option_to_yojson usb_device_filter_strings_to_yojson x.usb_device_filter_strings );
      ("MaxConcurrentSessions", option_to_yojson integer_to_yojson x.max_concurrent_sessions);
      ("Platform", option_to_yojson platform_type_to_yojson x.platform);
      ("StreamView", option_to_yojson stream_view_to_yojson x.stream_view);
      ("IamRoleArn", option_to_yojson arn_to_yojson x.iam_role_arn);
      ("AttributesToDelete", option_to_yojson fleet_attributes_to_yojson x.attributes_to_delete);
      ( "IdleDisconnectTimeoutInSeconds",
        option_to_yojson integer_to_yojson x.idle_disconnect_timeout_in_seconds );
      ("DomainJoinInfo", option_to_yojson domain_join_info_to_yojson x.domain_join_info);
      ( "EnableDefaultInternetAccess",
        option_to_yojson boolean_object_to_yojson x.enable_default_internet_access );
      ("DisplayName", option_to_yojson display_name_to_yojson x.display_name);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("DeleteVpcConfig", option_to_yojson boolean__to_yojson x.delete_vpc_config);
      ( "DisconnectTimeoutInSeconds",
        option_to_yojson integer_to_yojson x.disconnect_timeout_in_seconds );
      ("MaxUserDurationInSeconds", option_to_yojson integer_to_yojson x.max_user_duration_in_seconds);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("ComputeCapacity", option_to_yojson compute_capacity_to_yojson x.compute_capacity);
      ("InstanceType", option_to_yojson string__to_yojson x.instance_type);
      ("Name", option_to_yojson name_to_yojson x.name);
      ("ImageArn", option_to_yojson arn_to_yojson x.image_arn);
      ("ImageName", option_to_yojson string__to_yojson x.image_name);
    ]

let request_limit_exceeded_exception_to_yojson (x : request_limit_exceeded_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let app_visibility_to_yojson (x : app_visibility) =
  match x with ASSOCIATED -> `String "ASSOCIATED" | ALL -> `String "ALL"

let entitlement_attribute_to_yojson (x : entitlement_attribute) =
  assoc_to_yojson
    [ ("Value", Some (string__to_yojson x.value)); ("Name", Some (string__to_yojson x.name)) ]

let entitlement_attribute_list_to_yojson tree = list_to_yojson entitlement_attribute_to_yojson tree

let entitlement_to_yojson (x : entitlement) =
  assoc_to_yojson
    [
      ("LastModifiedTime", option_to_yojson timestamp_to_yojson x.last_modified_time);
      ("CreatedTime", option_to_yojson timestamp_to_yojson x.created_time);
      ("Attributes", Some (entitlement_attribute_list_to_yojson x.attributes));
      ("AppVisibility", Some (app_visibility_to_yojson x.app_visibility));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("StackName", Some (name_to_yojson x.stack_name));
      ("Name", Some (name_to_yojson x.name));
    ]

let update_entitlement_result_to_yojson (x : update_entitlement_result) =
  assoc_to_yojson [ ("Entitlement", option_to_yojson entitlement_to_yojson x.entitlement) ]

let update_entitlement_request_to_yojson (x : update_entitlement_request) =
  assoc_to_yojson
    [
      ("Attributes", option_to_yojson entitlement_attribute_list_to_yojson x.attributes);
      ("AppVisibility", option_to_yojson app_visibility_to_yojson x.app_visibility);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("StackName", Some (name_to_yojson x.stack_name));
      ("Name", Some (name_to_yojson x.name));
    ]

let entitlement_not_found_exception_to_yojson (x : entitlement_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let organizational_unit_distinguished_names_list_to_yojson tree =
  list_to_yojson organizational_unit_distinguished_name_to_yojson tree

let account_name_to_yojson = string_to_yojson
let account_password_to_yojson = string_to_yojson

let service_account_credentials_to_yojson (x : service_account_credentials) =
  assoc_to_yojson
    [
      ("AccountPassword", Some (account_password_to_yojson x.account_password));
      ("AccountName", Some (account_name_to_yojson x.account_name));
    ]

let certificate_based_auth_status_to_yojson (x : certificate_based_auth_status) =
  match x with
  | ENABLED_NO_DIRECTORY_LOGIN_FALLBACK -> `String "ENABLED_NO_DIRECTORY_LOGIN_FALLBACK"
  | ENABLED -> `String "ENABLED"
  | DISABLED -> `String "DISABLED"

let certificate_based_auth_properties_to_yojson (x : certificate_based_auth_properties) =
  assoc_to_yojson
    [
      ("CertificateAuthorityArn", option_to_yojson arn_to_yojson x.certificate_authority_arn);
      ("Status", option_to_yojson certificate_based_auth_status_to_yojson x.status);
    ]

let directory_config_to_yojson (x : directory_config) =
  assoc_to_yojson
    [
      ( "CertificateBasedAuthProperties",
        option_to_yojson certificate_based_auth_properties_to_yojson
          x.certificate_based_auth_properties );
      ("CreatedTime", option_to_yojson timestamp_to_yojson x.created_time);
      ( "ServiceAccountCredentials",
        option_to_yojson service_account_credentials_to_yojson x.service_account_credentials );
      ( "OrganizationalUnitDistinguishedNames",
        option_to_yojson organizational_unit_distinguished_names_list_to_yojson
          x.organizational_unit_distinguished_names );
      ("DirectoryName", Some (directory_name_to_yojson x.directory_name));
    ]

let update_directory_config_result_to_yojson (x : update_directory_config_result) =
  assoc_to_yojson
    [ ("DirectoryConfig", option_to_yojson directory_config_to_yojson x.directory_config) ]

let update_directory_config_request_to_yojson (x : update_directory_config_request) =
  assoc_to_yojson
    [
      ( "CertificateBasedAuthProperties",
        option_to_yojson certificate_based_auth_properties_to_yojson
          x.certificate_based_auth_properties );
      ( "ServiceAccountCredentials",
        option_to_yojson service_account_credentials_to_yojson x.service_account_credentials );
      ( "OrganizationalUnitDistinguishedNames",
        option_to_yojson organizational_unit_distinguished_names_list_to_yojson
          x.organizational_unit_distinguished_names );
      ("DirectoryName", Some (directory_name_to_yojson x.directory_name));
    ]

let metadata_to_yojson tree = map_to_yojson string__to_yojson string__to_yojson tree
let platforms_to_yojson tree = list_to_yojson platform_type_to_yojson tree
let string_list_to_yojson tree = list_to_yojson string__to_yojson tree

let application_to_yojson (x : application) =
  assoc_to_yojson
    [
      ("CreatedTime", option_to_yojson timestamp_to_yojson x.created_time);
      ("InstanceFamilies", option_to_yojson string_list_to_yojson x.instance_families);
      ("Platforms", option_to_yojson platforms_to_yojson x.platforms);
      ("IconS3Location", option_to_yojson s3_location_to_yojson x.icon_s3_location);
      ("AppBlockArn", option_to_yojson arn_to_yojson x.app_block_arn);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("WorkingDirectory", option_to_yojson string__to_yojson x.working_directory);
      ("Metadata", option_to_yojson metadata_to_yojson x.metadata);
      ("Enabled", option_to_yojson boolean__to_yojson x.enabled);
      ("LaunchParameters", option_to_yojson string__to_yojson x.launch_parameters);
      ("LaunchPath", option_to_yojson string__to_yojson x.launch_path);
      ("IconURL", option_to_yojson string__to_yojson x.icon_ur_l);
      ("DisplayName", option_to_yojson string__to_yojson x.display_name);
      ("Name", option_to_yojson string__to_yojson x.name);
    ]

let update_application_result_to_yojson (x : update_application_result) =
  assoc_to_yojson [ ("Application", option_to_yojson application_to_yojson x.application) ]

let application_attribute_to_yojson (x : application_attribute) =
  match x with
  | WORKING_DIRECTORY -> `String "WORKING_DIRECTORY"
  | LAUNCH_PARAMETERS -> `String "LAUNCH_PARAMETERS"

let application_attributes_to_yojson tree = list_to_yojson application_attribute_to_yojson tree

let update_application_request_to_yojson (x : update_application_request) =
  assoc_to_yojson
    [
      ( "AttributesToDelete",
        option_to_yojson application_attributes_to_yojson x.attributes_to_delete );
      ("AppBlockArn", option_to_yojson arn_to_yojson x.app_block_arn);
      ("LaunchParameters", option_to_yojson string__to_yojson x.launch_parameters);
      ("WorkingDirectory", option_to_yojson string__to_yojson x.working_directory);
      ("LaunchPath", option_to_yojson string__to_yojson x.launch_path);
      ("IconS3Location", option_to_yojson s3_location_to_yojson x.icon_s3_location);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("DisplayName", option_to_yojson display_name_to_yojson x.display_name);
      ("Name", Some (name_to_yojson x.name));
    ]

let app_block_builder_platform_type_to_yojson (x : app_block_builder_platform_type) =
  match x with WINDOWS_SERVER_2019 -> `String "WINDOWS_SERVER_2019"

let app_block_builder_state_to_yojson (x : app_block_builder_state) =
  match x with
  | STOPPED -> `String "STOPPED"
  | STOPPING -> `String "STOPPING"
  | RUNNING -> `String "RUNNING"
  | STARTING -> `String "STARTING"

let resource_error_to_yojson (x : resource_error) =
  assoc_to_yojson
    [
      ("ErrorTimestamp", option_to_yojson timestamp_to_yojson x.error_timestamp);
      ("ErrorMessage", option_to_yojson string__to_yojson x.error_message);
      ("ErrorCode", option_to_yojson fleet_error_code_to_yojson x.error_code);
    ]

let resource_errors_to_yojson tree = list_to_yojson resource_error_to_yojson tree

let app_block_builder_state_change_reason_code_to_yojson
    (x : app_block_builder_state_change_reason_code) =
  match x with INTERNAL_ERROR -> `String "INTERNAL_ERROR"

let app_block_builder_state_change_reason_to_yojson (x : app_block_builder_state_change_reason) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson app_block_builder_state_change_reason_code_to_yojson x.code);
    ]

let app_block_builder_to_yojson (x : app_block_builder) =
  assoc_to_yojson
    [
      ("DisableIMDSV1", option_to_yojson boolean_object_to_yojson x.disable_imds_v1);
      ("AccessEndpoints", option_to_yojson access_endpoint_list_to_yojson x.access_endpoints);
      ( "StateChangeReason",
        option_to_yojson app_block_builder_state_change_reason_to_yojson x.state_change_reason );
      ( "AppBlockBuilderErrors",
        option_to_yojson resource_errors_to_yojson x.app_block_builder_errors );
      ("CreatedTime", option_to_yojson timestamp_to_yojson x.created_time);
      ("State", Some (app_block_builder_state_to_yojson x.state));
      ("VpcConfig", Some (vpc_config_to_yojson x.vpc_config));
      ("IamRoleArn", option_to_yojson arn_to_yojson x.iam_role_arn);
      ( "EnableDefaultInternetAccess",
        option_to_yojson boolean_object_to_yojson x.enable_default_internet_access );
      ("InstanceType", Some (string__to_yojson x.instance_type));
      ("Platform", Some (app_block_builder_platform_type_to_yojson x.platform));
      ("Description", option_to_yojson string__to_yojson x.description);
      ("DisplayName", option_to_yojson string__to_yojson x.display_name);
      ("Name", Some (string__to_yojson x.name));
      ("Arn", Some (arn_to_yojson x.arn));
    ]

let update_app_block_builder_result_to_yojson (x : update_app_block_builder_result) =
  assoc_to_yojson
    [ ("AppBlockBuilder", option_to_yojson app_block_builder_to_yojson x.app_block_builder) ]

let app_block_builder_attribute_to_yojson (x : app_block_builder_attribute) =
  match x with
  | VPC_CONFIGURATION_SECURITY_GROUP_IDS -> `String "VPC_CONFIGURATION_SECURITY_GROUP_IDS"
  | ACCESS_ENDPOINTS -> `String "ACCESS_ENDPOINTS"
  | IAM_ROLE_ARN -> `String "IAM_ROLE_ARN"

let app_block_builder_attributes_to_yojson tree =
  list_to_yojson app_block_builder_attribute_to_yojson tree

let update_app_block_builder_request_to_yojson (x : update_app_block_builder_request) =
  assoc_to_yojson
    [
      ("DisableIMDSV1", option_to_yojson boolean_object_to_yojson x.disable_imds_v1);
      ( "AttributesToDelete",
        option_to_yojson app_block_builder_attributes_to_yojson x.attributes_to_delete );
      ("AccessEndpoints", option_to_yojson access_endpoint_list_to_yojson x.access_endpoints);
      ("IamRoleArn", option_to_yojson arn_to_yojson x.iam_role_arn);
      ( "EnableDefaultInternetAccess",
        option_to_yojson boolean_object_to_yojson x.enable_default_internet_access );
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("InstanceType", option_to_yojson string__to_yojson x.instance_type);
      ("Platform", option_to_yojson platform_type_to_yojson x.platform);
      ("DisplayName", option_to_yojson display_name_to_yojson x.display_name);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Name", Some (name_to_yojson x.name));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
    ]

let uui_d_to_yojson = string_to_yojson
let tag_value_to_yojson = string_to_yojson
let tags_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree
let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [ ("Tags", Some (tags_to_yojson x.tags)); ("ResourceArn", Some (arn_to_yojson x.resource_arn)) ]

let streaming_url_user_id_to_yojson = string_to_yojson

let image_builder_state_to_yojson (x : image_builder_state) =
  match x with
  | PENDING_IMAGE_IMPORT -> `String "PENDING_IMAGE_IMPORT"
  | SYNCING_APPS -> `String "SYNCING_APPS"
  | PENDING_SYNCING_APPS -> `String "PENDING_SYNCING_APPS"
  | PENDING_QUALIFICATION -> `String "PENDING_QUALIFICATION"
  | UPDATING -> `String "UPDATING"
  | FAILED -> `String "FAILED"
  | DELETING -> `String "DELETING"
  | SNAPSHOTTING -> `String "SNAPSHOTTING"
  | REBOOTING -> `String "REBOOTING"
  | STOPPED -> `String "STOPPED"
  | STOPPING -> `String "STOPPING"
  | RUNNING -> `String "RUNNING"
  | UPDATING_AGENT -> `String "UPDATING_AGENT"
  | PENDING -> `String "PENDING"

let image_builder_state_change_reason_code_to_yojson (x : image_builder_state_change_reason_code) =
  match x with
  | IMAGE_UNAVAILABLE -> `String "IMAGE_UNAVAILABLE"
  | INTERNAL_ERROR -> `String "INTERNAL_ERROR"

let image_builder_state_change_reason_to_yojson (x : image_builder_state_change_reason) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson image_builder_state_change_reason_code_to_yojson x.code);
    ]

let network_access_configuration_to_yojson (x : network_access_configuration) =
  assoc_to_yojson
    [
      ("EniId", option_to_yojson string__to_yojson x.eni_id);
      ("EniIpv6Addresses", option_to_yojson string_list_to_yojson x.eni_ipv6_addresses);
      ("EniPrivateIpAddress", option_to_yojson string__to_yojson x.eni_private_ip_address);
    ]

let appstream_agent_version_to_yojson = string_to_yojson

let latest_appstream_agent_version_to_yojson (x : latest_appstream_agent_version) =
  match x with FALSE -> `String "FALSE" | TRUE -> `String "TRUE"

let image_builder_to_yojson (x : image_builder) =
  assoc_to_yojson
    [
      ("DisableIMDSV1", option_to_yojson boolean_object_to_yojson x.disable_imds_v1);
      ( "LatestAppstreamAgentVersion",
        option_to_yojson latest_appstream_agent_version_to_yojson x.latest_appstream_agent_version
      );
      ("RootVolumeConfig", option_to_yojson volume_config_to_yojson x.root_volume_config);
      ("AccessEndpoints", option_to_yojson access_endpoint_list_to_yojson x.access_endpoints);
      ( "AppstreamAgentVersion",
        option_to_yojson appstream_agent_version_to_yojson x.appstream_agent_version );
      ("ImageBuilderErrors", option_to_yojson resource_errors_to_yojson x.image_builder_errors);
      ( "NetworkAccessConfiguration",
        option_to_yojson network_access_configuration_to_yojson x.network_access_configuration );
      ("DomainJoinInfo", option_to_yojson domain_join_info_to_yojson x.domain_join_info);
      ( "EnableDefaultInternetAccess",
        option_to_yojson boolean_object_to_yojson x.enable_default_internet_access );
      ("CreatedTime", option_to_yojson timestamp_to_yojson x.created_time);
      ( "StateChangeReason",
        option_to_yojson image_builder_state_change_reason_to_yojson x.state_change_reason );
      ("State", option_to_yojson image_builder_state_to_yojson x.state);
      ("IamRoleArn", option_to_yojson arn_to_yojson x.iam_role_arn);
      ("Platform", option_to_yojson platform_type_to_yojson x.platform);
      ("InstanceType", option_to_yojson string__to_yojson x.instance_type);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("DisplayName", option_to_yojson string__to_yojson x.display_name);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("ImageArn", option_to_yojson arn_to_yojson x.image_arn);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("Name", Some (string__to_yojson x.name));
    ]

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
      ("RetryFailedDeployments", option_to_yojson boolean__to_yojson x.retry_failed_deployments);
      ("ImageBuilderName", Some (name_to_yojson x.image_builder_name));
    ]

let start_image_builder_result_to_yojson (x : start_image_builder_result) =
  assoc_to_yojson [ ("ImageBuilder", option_to_yojson image_builder_to_yojson x.image_builder) ]

let start_image_builder_request_to_yojson (x : start_image_builder_request) =
  assoc_to_yojson
    [
      ( "AppstreamAgentVersion",
        option_to_yojson appstream_agent_version_to_yojson x.appstream_agent_version );
      ("Name", Some (string__to_yojson x.name));
    ]

let start_fleet_result_to_yojson = unit_to_yojson

let start_fleet_request_to_yojson (x : start_fleet_request) =
  assoc_to_yojson [ ("Name", Some (string__to_yojson x.name)) ]

let start_app_block_builder_result_to_yojson (x : start_app_block_builder_result) =
  assoc_to_yojson
    [ ("AppBlockBuilder", option_to_yojson app_block_builder_to_yojson x.app_block_builder) ]

let start_app_block_builder_request_to_yojson (x : start_app_block_builder_request) =
  assoc_to_yojson [ ("Name", Some (name_to_yojson x.name)) ]

let stack_list_to_yojson tree = list_to_yojson stack_to_yojson tree

let software_deployment_status_to_yojson (x : software_deployment_status) =
  match x with
  | FAILED_TO_UNINSTALL -> `String "FAILED_TO_UNINSTALL"
  | FAILED_TO_INSTALL -> `String "FAILED_TO_INSTALL"
  | PENDING_UNINSTALLATION -> `String "PENDING_UNINSTALLATION"
  | STAGED_FOR_UNINSTALLATION -> `String "STAGED_FOR_UNINSTALLATION"
  | INSTALLED -> `String "INSTALLED"
  | PENDING_INSTALLATION -> `String "PENDING_INSTALLATION"
  | STAGED_FOR_INSTALLATION -> `String "STAGED_FOR_INSTALLATION"

let error_details_to_yojson (x : error_details) =
  assoc_to_yojson
    [
      ("ErrorMessage", option_to_yojson string__to_yojson x.error_message);
      ("ErrorCode", option_to_yojson string__to_yojson x.error_code);
    ]

let error_details_list_to_yojson tree = list_to_yojson error_details_to_yojson tree

let software_associations_to_yojson (x : software_associations) =
  assoc_to_yojson
    [
      ("DeploymentError", option_to_yojson error_details_list_to_yojson x.deployment_error);
      ("Status", option_to_yojson software_deployment_status_to_yojson x.status);
      ("SoftwareName", option_to_yojson string__to_yojson x.software_name);
    ]

let software_associations_list_to_yojson tree = list_to_yojson software_associations_to_yojson tree

let shared_image_permissions_to_yojson (x : shared_image_permissions) =
  assoc_to_yojson
    [
      ("imagePermissions", Some (image_permissions_to_yojson x.image_permissions));
      ("sharedAccountId", Some (aws_account_id_to_yojson x.shared_account_id));
    ]

let shared_image_permissions_list_to_yojson tree =
  list_to_yojson shared_image_permissions_to_yojson tree

let session_state_to_yojson (x : session_state) =
  match x with
  | EXPIRED -> `String "EXPIRED"
  | PENDING -> `String "PENDING"
  | ACTIVE -> `String "ACTIVE"

let session_connection_state_to_yojson (x : session_connection_state) =
  match x with NOT_CONNECTED -> `String "NOT_CONNECTED" | CONNECTED -> `String "CONNECTED"

let instance_drain_status_to_yojson (x : instance_drain_status) =
  match x with
  | NOT_APPLICABLE -> `String "NOT_APPLICABLE"
  | DRAINING -> `String "DRAINING"
  | ACTIVE -> `String "ACTIVE"

let session_to_yojson (x : session) =
  assoc_to_yojson
    [
      ( "InstanceDrainStatus",
        option_to_yojson instance_drain_status_to_yojson x.instance_drain_status );
      ("InstanceId", option_to_yojson string__to_yojson x.instance_id);
      ( "NetworkAccessConfiguration",
        option_to_yojson network_access_configuration_to_yojson x.network_access_configuration );
      ("AuthenticationType", option_to_yojson authentication_type_to_yojson x.authentication_type);
      ("MaxExpirationTime", option_to_yojson timestamp_to_yojson x.max_expiration_time);
      ("StartTime", option_to_yojson timestamp_to_yojson x.start_time);
      ("ConnectionState", option_to_yojson session_connection_state_to_yojson x.connection_state);
      ("State", Some (session_state_to_yojson x.state));
      ("FleetName", Some (string__to_yojson x.fleet_name));
      ("StackName", Some (string__to_yojson x.stack_name));
      ("UserId", Some (user_id_to_yojson x.user_id));
      ("Id", Some (string__to_yojson x.id));
    ]

let session_list_to_yojson tree = list_to_yojson session_to_yojson tree

let script_details_to_yojson (x : script_details) =
  assoc_to_yojson
    [
      ("TimeoutInSeconds", Some (integer_to_yojson x.timeout_in_seconds));
      ("ExecutableParameters", option_to_yojson string__to_yojson x.executable_parameters);
      ("ExecutablePath", Some (string__to_yojson x.executable_path));
      ("ScriptS3Location", Some (s3_location_to_yojson x.script_s3_location));
    ]

let instance_type_to_yojson = string_to_yojson

let runtime_validation_config_to_yojson (x : runtime_validation_config) =
  assoc_to_yojson
    [ ("IntendedInstanceType", option_to_yojson instance_type_to_yojson x.intended_instance_type) ]

let resource_already_exists_exception_to_yojson (x : resource_already_exists_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let region_name_to_yojson = string_to_yojson
let photon_ami_id_to_yojson = string_to_yojson

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tags_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ResourceArn", Some (arn_to_yojson x.resource_arn)) ]

let ami_name_to_yojson = string_to_yojson

let export_image_task_state_to_yojson (x : export_image_task_state) =
  match x with
  | TIMED_OUT -> `String "TIMED_OUT"
  | FAILED -> `String "FAILED"
  | COMPLETED -> `String "COMPLETED"
  | EXPORTING -> `String "EXPORTING"

let export_image_task_to_yojson (x : export_image_task) =
  assoc_to_yojson
    [
      ("ErrorDetails", option_to_yojson error_details_list_to_yojson x.error_details);
      ("TagSpecifications", option_to_yojson tags_to_yojson x.tag_specifications);
      ("AmiId", option_to_yojson photon_ami_id_to_yojson x.ami_id);
      ("State", option_to_yojson export_image_task_state_to_yojson x.state);
      ("AmiDescription", option_to_yojson description_to_yojson x.ami_description);
      ("CreatedDate", Some (timestamp_to_yojson x.created_date));
      ("AmiName", Some (ami_name_to_yojson x.ami_name));
      ("ImageArn", Some (arn_to_yojson x.image_arn));
      ("TaskId", Some (uui_d_to_yojson x.task_id));
    ]

let export_image_tasks_to_yojson tree = list_to_yojson export_image_task_to_yojson tree

let list_export_image_tasks_result_to_yojson (x : list_export_image_tasks_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("ExportImageTasks", option_to_yojson export_image_tasks_to_yojson x.export_image_tasks);
    ]

let filter_name_to_yojson = string_to_yojson
let filter_value_to_yojson = string_to_yojson
let filter_values_to_yojson tree = list_to_yojson filter_value_to_yojson tree

let filter_to_yojson (x : filter) =
  assoc_to_yojson
    [
      ("Values", Some (filter_values_to_yojson x.values));
      ("Name", Some (filter_name_to_yojson x.name));
    ]

let filters_to_yojson tree = list_to_yojson filter_to_yojson tree
let max_results_to_yojson = int_to_yojson

let list_export_image_tasks_request_to_yojson (x : list_export_image_tasks_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("Filters", option_to_yojson filters_to_yojson x.filters);
    ]

let entitled_application_to_yojson (x : entitled_application) =
  assoc_to_yojson [ ("ApplicationIdentifier", Some (string__to_yojson x.application_identifier)) ]

let entitled_application_list_to_yojson tree = list_to_yojson entitled_application_to_yojson tree

let list_entitled_applications_result_to_yojson (x : list_entitled_applications_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "EntitledApplications",
        option_to_yojson entitled_application_list_to_yojson x.entitled_applications );
    ]

let list_entitled_applications_request_to_yojson (x : list_entitled_applications_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("EntitlementName", Some (name_to_yojson x.entitlement_name));
      ("StackName", Some (name_to_yojson x.stack_name));
    ]

let list_associated_stacks_result_to_yojson (x : list_associated_stacks_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Names", option_to_yojson string_list_to_yojson x.names);
    ]

let list_associated_stacks_request_to_yojson (x : list_associated_stacks_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("FleetName", Some (string__to_yojson x.fleet_name));
    ]

let list_associated_fleets_result_to_yojson (x : list_associated_fleets_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Names", option_to_yojson string_list_to_yojson x.names);
    ]

let list_associated_fleets_request_to_yojson (x : list_associated_fleets_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("StackName", Some (string__to_yojson x.stack_name));
    ]

let get_export_image_task_result_to_yojson (x : get_export_image_task_result) =
  assoc_to_yojson
    [ ("ExportImageTask", option_to_yojson export_image_task_to_yojson x.export_image_task) ]

let get_export_image_task_request_to_yojson (x : get_export_image_task_request) =
  assoc_to_yojson [ ("TaskId", option_to_yojson uui_d_to_yojson x.task_id) ]

let expire_session_result_to_yojson = unit_to_yojson

let expire_session_request_to_yojson (x : expire_session_request) =
  assoc_to_yojson [ ("SessionId", Some (string__to_yojson x.session_id)) ]

let enable_user_result_to_yojson = unit_to_yojson

let enable_user_request_to_yojson (x : enable_user_request) =
  assoc_to_yojson
    [
      ("AuthenticationType", Some (authentication_type_to_yojson x.authentication_type));
      ("UserName", Some (username_to_yojson x.user_name));
    ]

let drain_session_instance_result_to_yojson = unit_to_yojson

let drain_session_instance_request_to_yojson (x : drain_session_instance_request) =
  assoc_to_yojson [ ("SessionId", Some (string__to_yojson x.session_id)) ]

let disassociate_software_from_image_builder_result_to_yojson = unit_to_yojson

let disassociate_software_from_image_builder_request_to_yojson
    (x : disassociate_software_from_image_builder_request) =
  assoc_to_yojson
    [
      ("SoftwareNames", Some (string_list_to_yojson x.software_names));
      ("ImageBuilderName", Some (name_to_yojson x.image_builder_name));
    ]

let disassociate_fleet_result_to_yojson = unit_to_yojson

let disassociate_fleet_request_to_yojson (x : disassociate_fleet_request) =
  assoc_to_yojson
    [
      ("StackName", Some (string__to_yojson x.stack_name));
      ("FleetName", Some (string__to_yojson x.fleet_name));
    ]

let disassociate_application_from_entitlement_result_to_yojson = unit_to_yojson

let disassociate_application_from_entitlement_request_to_yojson
    (x : disassociate_application_from_entitlement_request) =
  assoc_to_yojson
    [
      ("ApplicationIdentifier", Some (string__to_yojson x.application_identifier));
      ("EntitlementName", Some (name_to_yojson x.entitlement_name));
      ("StackName", Some (name_to_yojson x.stack_name));
    ]

let disassociate_application_fleet_result_to_yojson = unit_to_yojson

let disassociate_application_fleet_request_to_yojson (x : disassociate_application_fleet_request) =
  assoc_to_yojson
    [
      ("ApplicationArn", Some (arn_to_yojson x.application_arn));
      ("FleetName", Some (name_to_yojson x.fleet_name));
    ]

let disassociate_app_block_builder_app_block_result_to_yojson = unit_to_yojson

let disassociate_app_block_builder_app_block_request_to_yojson
    (x : disassociate_app_block_builder_app_block_request) =
  assoc_to_yojson
    [
      ("AppBlockBuilderName", Some (name_to_yojson x.app_block_builder_name));
      ("AppBlockArn", Some (arn_to_yojson x.app_block_arn));
    ]

let disable_user_result_to_yojson = unit_to_yojson

let disable_user_request_to_yojson (x : disable_user_request) =
  assoc_to_yojson
    [
      ("AuthenticationType", Some (authentication_type_to_yojson x.authentication_type));
      ("UserName", Some (username_to_yojson x.user_name));
    ]

let describe_user_stack_associations_result_to_yojson (x : describe_user_stack_associations_result)
    =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "UserStackAssociations",
        option_to_yojson user_stack_association_list_to_yojson x.user_stack_associations );
    ]

let describe_user_stack_associations_request_to_yojson
    (x : describe_user_stack_associations_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("AuthenticationType", option_to_yojson authentication_type_to_yojson x.authentication_type);
      ("UserName", option_to_yojson username_to_yojson x.user_name);
      ("StackName", option_to_yojson string__to_yojson x.stack_name);
    ]

let describe_users_result_to_yojson (x : describe_users_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Users", option_to_yojson user_list_to_yojson x.users);
    ]

let describe_users_request_to_yojson (x : describe_users_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson integer_to_yojson x.max_results);
      ("AuthenticationType", Some (authentication_type_to_yojson x.authentication_type));
    ]

let describe_usage_report_subscriptions_result_to_yojson
    (x : describe_usage_report_subscriptions_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "UsageReportSubscriptions",
        option_to_yojson usage_report_subscription_list_to_yojson x.usage_report_subscriptions );
    ]

let describe_usage_report_subscriptions_request_to_yojson
    (x : describe_usage_report_subscriptions_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson integer_to_yojson x.max_results);
    ]

let describe_theme_for_stack_result_to_yojson (x : describe_theme_for_stack_result) =
  assoc_to_yojson [ ("Theme", option_to_yojson theme_to_yojson x.theme) ]

let describe_theme_for_stack_request_to_yojson (x : describe_theme_for_stack_request) =
  assoc_to_yojson [ ("StackName", Some (name_to_yojson x.stack_name)) ]

let describe_stacks_result_to_yojson (x : describe_stacks_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Stacks", option_to_yojson stack_list_to_yojson x.stacks);
    ]

let describe_stacks_request_to_yojson (x : describe_stacks_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Names", option_to_yojson string_list_to_yojson x.names);
    ]

let describe_software_associations_result_to_yojson (x : describe_software_associations_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "SoftwareAssociations",
        option_to_yojson software_associations_list_to_yojson x.software_associations );
      ("AssociatedResource", option_to_yojson arn_to_yojson x.associated_resource);
    ]

let describe_software_associations_request_to_yojson (x : describe_software_associations_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson integer_to_yojson x.max_results);
      ("AssociatedResource", Some (arn_to_yojson x.associated_resource));
    ]

let describe_sessions_result_to_yojson (x : describe_sessions_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Sessions", option_to_yojson session_list_to_yojson x.sessions);
    ]

let describe_sessions_request_to_yojson (x : describe_sessions_request) =
  assoc_to_yojson
    [
      ("InstanceId", option_to_yojson string__to_yojson x.instance_id);
      ("AuthenticationType", option_to_yojson authentication_type_to_yojson x.authentication_type);
      ("Limit", option_to_yojson integer_to_yojson x.limit);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("UserId", option_to_yojson user_id_to_yojson x.user_id);
      ("FleetName", Some (name_to_yojson x.fleet_name));
      ("StackName", Some (name_to_yojson x.stack_name));
    ]

let image_state_to_yojson (x : image_state) =
  match x with
  | VALIDATING -> `String "VALIDATING"
  | IMPORTING -> `String "IMPORTING"
  | CREATING -> `String "CREATING"
  | DELETING -> `String "DELETING"
  | COPYING -> `String "COPYING"
  | FAILED -> `String "FAILED"
  | AVAILABLE -> `String "AVAILABLE"
  | PENDING -> `String "PENDING"

let image_state_change_reason_code_to_yojson (x : image_state_change_reason_code) =
  match x with
  | IMAGE_IMPORT_FAILURE -> `String "IMAGE_IMPORT_FAILURE"
  | IMAGE_UPDATE_FAILURE -> `String "IMAGE_UPDATE_FAILURE"
  | IMAGE_COPY_FAILURE -> `String "IMAGE_COPY_FAILURE"
  | IMAGE_BUILDER_NOT_AVAILABLE -> `String "IMAGE_BUILDER_NOT_AVAILABLE"
  | INTERNAL_ERROR -> `String "INTERNAL_ERROR"

let image_state_change_reason_to_yojson (x : image_state_change_reason) =
  assoc_to_yojson
    [
      ("Message", option_to_yojson string__to_yojson x.message);
      ("Code", option_to_yojson image_state_change_reason_code_to_yojson x.code);
    ]

let applications_to_yojson tree = list_to_yojson application_to_yojson tree

let dynamic_app_providers_enabled_to_yojson (x : dynamic_app_providers_enabled) =
  match x with DISABLED -> `String "DISABLED" | ENABLED -> `String "ENABLED"

let image_shared_with_others_to_yojson (x : image_shared_with_others) =
  match x with FALSE -> `String "FALSE" | TRUE -> `String "TRUE"

let image_type_to_yojson (x : image_type) =
  match x with BYOL -> `String "BYOL" | NATIVE -> `String "NATIVE" | CUSTOM -> `String "CUSTOM"

let image_to_yojson (x : image) =
  assoc_to_yojson
    [
      ("ImageType", option_to_yojson image_type_to_yojson x.image_type);
      ("ManagedSoftwareIncluded", option_to_yojson boolean__to_yojson x.managed_software_included);
      ( "ImageSharedWithOthers",
        option_to_yojson image_shared_with_others_to_yojson x.image_shared_with_others );
      ( "DynamicAppProvidersEnabled",
        option_to_yojson dynamic_app_providers_enabled_to_yojson x.dynamic_app_providers_enabled );
      ( "SupportedInstanceFamilies",
        option_to_yojson string_list_to_yojson x.supported_instance_families );
      ( "LatestAppstreamAgentVersion",
        option_to_yojson latest_appstream_agent_version_to_yojson x.latest_appstream_agent_version
      );
      ("ImageErrors", option_to_yojson resource_errors_to_yojson x.image_errors);
      ("ImagePermissions", option_to_yojson image_permissions_to_yojson x.image_permissions);
      ( "AppstreamAgentVersion",
        option_to_yojson appstream_agent_version_to_yojson x.appstream_agent_version );
      ( "PublicBaseImageReleasedDate",
        option_to_yojson timestamp_to_yojson x.public_base_image_released_date );
      ("CreatedTime", option_to_yojson timestamp_to_yojson x.created_time);
      ("Applications", option_to_yojson applications_to_yojson x.applications);
      ( "StateChangeReason",
        option_to_yojson image_state_change_reason_to_yojson x.state_change_reason );
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Platform", option_to_yojson platform_type_to_yojson x.platform);
      ("ImageBuilderName", option_to_yojson string__to_yojson x.image_builder_name);
      ("ImageBuilderSupported", option_to_yojson boolean__to_yojson x.image_builder_supported);
      ("Visibility", option_to_yojson visibility_type_to_yojson x.visibility);
      ("State", option_to_yojson image_state_to_yojson x.state);
      ("DisplayName", option_to_yojson string__to_yojson x.display_name);
      ("BaseImageArn", option_to_yojson arn_to_yojson x.base_image_arn);
      ("Arn", option_to_yojson arn_to_yojson x.arn);
      ("Name", Some (string__to_yojson x.name));
    ]

let image_list_to_yojson tree = list_to_yojson image_to_yojson tree

let describe_images_result_to_yojson (x : describe_images_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Images", option_to_yojson image_list_to_yojson x.images);
    ]

let arn_list_to_yojson tree = list_to_yojson arn_to_yojson tree
let describe_images_max_results_to_yojson = int_to_yojson

let describe_images_request_to_yojson (x : describe_images_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson describe_images_max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Type", option_to_yojson visibility_type_to_yojson x.type_);
      ("Arns", option_to_yojson arn_list_to_yojson x.arns);
      ("Names", option_to_yojson string_list_to_yojson x.names);
    ]

let describe_image_permissions_result_to_yojson (x : describe_image_permissions_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "SharedImagePermissionsList",
        option_to_yojson shared_image_permissions_list_to_yojson x.shared_image_permissions_list );
      ("Name", option_to_yojson name_to_yojson x.name);
    ]

let aws_account_id_list_to_yojson tree = list_to_yojson aws_account_id_to_yojson tree

let describe_image_permissions_request_to_yojson (x : describe_image_permissions_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "SharedAwsAccountIds",
        option_to_yojson aws_account_id_list_to_yojson x.shared_aws_account_ids );
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("Name", Some (name_to_yojson x.name));
    ]

let image_builder_list_to_yojson tree = list_to_yojson image_builder_to_yojson tree

let describe_image_builders_result_to_yojson (x : describe_image_builders_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("ImageBuilders", option_to_yojson image_builder_list_to_yojson x.image_builders);
    ]

let describe_image_builders_request_to_yojson (x : describe_image_builders_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson integer_to_yojson x.max_results);
      ("Names", option_to_yojson string_list_to_yojson x.names);
    ]

let fleet_list_to_yojson tree = list_to_yojson fleet_to_yojson tree

let describe_fleets_result_to_yojson (x : describe_fleets_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Fleets", option_to_yojson fleet_list_to_yojson x.fleets);
    ]

let describe_fleets_request_to_yojson (x : describe_fleets_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Names", option_to_yojson string_list_to_yojson x.names);
    ]

let entitlement_list_to_yojson tree = list_to_yojson entitlement_to_yojson tree

let describe_entitlements_result_to_yojson (x : describe_entitlements_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Entitlements", option_to_yojson entitlement_list_to_yojson x.entitlements);
    ]

let describe_entitlements_request_to_yojson (x : describe_entitlements_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("StackName", Some (name_to_yojson x.stack_name));
      ("Name", option_to_yojson name_to_yojson x.name);
    ]

let directory_config_list_to_yojson tree = list_to_yojson directory_config_to_yojson tree

let describe_directory_configs_result_to_yojson (x : describe_directory_configs_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("DirectoryConfigs", option_to_yojson directory_config_list_to_yojson x.directory_configs);
    ]

let directory_name_list_to_yojson tree = list_to_yojson directory_name_to_yojson tree

let describe_directory_configs_request_to_yojson (x : describe_directory_configs_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson integer_to_yojson x.max_results);
      ("DirectoryNames", option_to_yojson directory_name_list_to_yojson x.directory_names);
    ]

let admin_app_license_usage_record_to_yojson (x : admin_app_license_usage_record) =
  assoc_to_yojson
    [
      ("UserId", Some (string__to_yojson x.user_id));
      ("LicenseType", Some (string__to_yojson x.license_type));
      ("SubscriptionLastUsedDate", Some (timestamp_to_yojson x.subscription_last_used_date));
      ("SubscriptionFirstUsedDate", Some (timestamp_to_yojson x.subscription_first_used_date));
      ("OwnerAWSAccountId", Some (aws_account_id_to_yojson x.owner_aws_account_id));
      ("BillingPeriod", Some (string__to_yojson x.billing_period));
      ("UserArn", Some (string__to_yojson x.user_arn));
    ]

let admin_app_license_usage_list_to_yojson tree =
  list_to_yojson admin_app_license_usage_record_to_yojson tree

let describe_app_license_usage_result_to_yojson (x : describe_app_license_usage_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "AppLicenseUsages",
        option_to_yojson admin_app_license_usage_list_to_yojson x.app_license_usages );
    ]

let describe_app_license_usage_request_to_yojson (x : describe_app_license_usage_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson integer_to_yojson x.max_results);
      ("BillingPeriod", Some (string__to_yojson x.billing_period));
    ]

let describe_applications_result_to_yojson (x : describe_applications_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Applications", option_to_yojson applications_to_yojson x.applications);
    ]

let describe_applications_request_to_yojson (x : describe_applications_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Arns", option_to_yojson arn_list_to_yojson x.arns);
    ]

let application_fleet_association_to_yojson (x : application_fleet_association) =
  assoc_to_yojson
    [
      ("ApplicationArn", Some (arn_to_yojson x.application_arn));
      ("FleetName", Some (string__to_yojson x.fleet_name));
    ]

let application_fleet_association_list_to_yojson tree =
  list_to_yojson application_fleet_association_to_yojson tree

let describe_application_fleet_associations_result_to_yojson
    (x : describe_application_fleet_associations_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "ApplicationFleetAssociations",
        option_to_yojson application_fleet_association_list_to_yojson
          x.application_fleet_associations );
    ]

let describe_application_fleet_associations_request_to_yojson
    (x : describe_application_fleet_associations_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson integer_to_yojson x.max_results);
      ("ApplicationArn", option_to_yojson arn_to_yojson x.application_arn);
      ("FleetName", option_to_yojson name_to_yojson x.fleet_name);
    ]

let packaging_type_to_yojson (x : packaging_type) =
  match x with APPSTREAM2 -> `String "APPSTREAM2" | CUSTOM -> `String "CUSTOM"

let app_block_state_to_yojson (x : app_block_state) =
  match x with ACTIVE -> `String "ACTIVE" | INACTIVE -> `String "INACTIVE"

let app_block_to_yojson (x : app_block) =
  assoc_to_yojson
    [
      ("AppBlockErrors", option_to_yojson error_details_list_to_yojson x.app_block_errors);
      ("State", option_to_yojson app_block_state_to_yojson x.state);
      ("PackagingType", option_to_yojson packaging_type_to_yojson x.packaging_type);
      ( "PostSetupScriptDetails",
        option_to_yojson script_details_to_yojson x.post_setup_script_details );
      ("CreatedTime", option_to_yojson timestamp_to_yojson x.created_time);
      ("SetupScriptDetails", option_to_yojson script_details_to_yojson x.setup_script_details);
      ("SourceS3Location", option_to_yojson s3_location_to_yojson x.source_s3_location);
      ("DisplayName", option_to_yojson string__to_yojson x.display_name);
      ("Description", option_to_yojson string__to_yojson x.description);
      ("Arn", Some (arn_to_yojson x.arn));
      ("Name", Some (string__to_yojson x.name));
    ]

let app_blocks_to_yojson tree = list_to_yojson app_block_to_yojson tree

let describe_app_blocks_result_to_yojson (x : describe_app_blocks_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("AppBlocks", option_to_yojson app_blocks_to_yojson x.app_blocks);
    ]

let describe_app_blocks_request_to_yojson (x : describe_app_blocks_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Arns", option_to_yojson arn_list_to_yojson x.arns);
    ]

let app_block_builder_list_to_yojson tree = list_to_yojson app_block_builder_to_yojson tree

let describe_app_block_builders_result_to_yojson (x : describe_app_block_builders_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("AppBlockBuilders", option_to_yojson app_block_builder_list_to_yojson x.app_block_builders);
    ]

let describe_app_block_builders_request_to_yojson (x : describe_app_block_builders_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson integer_to_yojson x.max_results);
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("Names", option_to_yojson string_list_to_yojson x.names);
    ]

let app_block_builder_app_block_association_to_yojson (x : app_block_builder_app_block_association)
    =
  assoc_to_yojson
    [
      ("AppBlockBuilderName", Some (name_to_yojson x.app_block_builder_name));
      ("AppBlockArn", Some (arn_to_yojson x.app_block_arn));
    ]

let app_block_builder_app_block_associations_list_to_yojson tree =
  list_to_yojson app_block_builder_app_block_association_to_yojson tree

let describe_app_block_builder_app_block_associations_result_to_yojson
    (x : describe_app_block_builder_app_block_associations_result) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ( "AppBlockBuilderAppBlockAssociations",
        option_to_yojson app_block_builder_app_block_associations_list_to_yojson
          x.app_block_builder_app_block_associations );
    ]

let describe_app_block_builder_app_block_associations_request_to_yojson
    (x : describe_app_block_builder_app_block_associations_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson string__to_yojson x.next_token);
      ("MaxResults", option_to_yojson integer_to_yojson x.max_results);
      ("AppBlockBuilderName", option_to_yojson name_to_yojson x.app_block_builder_name);
      ("AppBlockArn", option_to_yojson arn_to_yojson x.app_block_arn);
    ]

let delete_user_result_to_yojson = unit_to_yojson

let delete_user_request_to_yojson (x : delete_user_request) =
  assoc_to_yojson
    [
      ("AuthenticationType", Some (authentication_type_to_yojson x.authentication_type));
      ("UserName", Some (username_to_yojson x.user_name));
    ]

let delete_usage_report_subscription_result_to_yojson = unit_to_yojson
let delete_usage_report_subscription_request_to_yojson = unit_to_yojson
let delete_theme_for_stack_result_to_yojson = unit_to_yojson

let delete_theme_for_stack_request_to_yojson (x : delete_theme_for_stack_request) =
  assoc_to_yojson [ ("StackName", Some (name_to_yojson x.stack_name)) ]

let delete_stack_result_to_yojson = unit_to_yojson

let delete_stack_request_to_yojson (x : delete_stack_request) =
  assoc_to_yojson [ ("Name", Some (string__to_yojson x.name)) ]

let delete_image_permissions_result_to_yojson = unit_to_yojson

let delete_image_permissions_request_to_yojson (x : delete_image_permissions_request) =
  assoc_to_yojson
    [
      ("SharedAccountId", Some (aws_account_id_to_yojson x.shared_account_id));
      ("Name", Some (name_to_yojson x.name));
    ]

let delete_image_builder_result_to_yojson (x : delete_image_builder_result) =
  assoc_to_yojson [ ("ImageBuilder", option_to_yojson image_builder_to_yojson x.image_builder) ]

let delete_image_builder_request_to_yojson (x : delete_image_builder_request) =
  assoc_to_yojson [ ("Name", Some (name_to_yojson x.name)) ]

let delete_image_result_to_yojson (x : delete_image_result) =
  assoc_to_yojson [ ("Image", option_to_yojson image_to_yojson x.image) ]

let delete_image_request_to_yojson (x : delete_image_request) =
  assoc_to_yojson [ ("Name", Some (name_to_yojson x.name)) ]

let delete_fleet_result_to_yojson = unit_to_yojson

let delete_fleet_request_to_yojson (x : delete_fleet_request) =
  assoc_to_yojson [ ("Name", Some (string__to_yojson x.name)) ]

let delete_entitlement_result_to_yojson = unit_to_yojson

let delete_entitlement_request_to_yojson (x : delete_entitlement_request) =
  assoc_to_yojson
    [ ("StackName", Some (name_to_yojson x.stack_name)); ("Name", Some (name_to_yojson x.name)) ]

let delete_directory_config_result_to_yojson = unit_to_yojson

let delete_directory_config_request_to_yojson (x : delete_directory_config_request) =
  assoc_to_yojson [ ("DirectoryName", Some (directory_name_to_yojson x.directory_name)) ]

let delete_application_result_to_yojson = unit_to_yojson

let delete_application_request_to_yojson (x : delete_application_request) =
  assoc_to_yojson [ ("Name", Some (name_to_yojson x.name)) ]

let delete_app_block_builder_result_to_yojson = unit_to_yojson

let delete_app_block_builder_request_to_yojson (x : delete_app_block_builder_request) =
  assoc_to_yojson [ ("Name", Some (name_to_yojson x.name)) ]

let delete_app_block_result_to_yojson = unit_to_yojson

let delete_app_block_request_to_yojson (x : delete_app_block_request) =
  assoc_to_yojson [ ("Name", Some (name_to_yojson x.name)) ]

let create_user_result_to_yojson = unit_to_yojson

let message_action_to_yojson (x : message_action) =
  match x with RESEND -> `String "RESEND" | SUPPRESS -> `String "SUPPRESS"

let create_user_request_to_yojson (x : create_user_request) =
  assoc_to_yojson
    [
      ("AuthenticationType", Some (authentication_type_to_yojson x.authentication_type));
      ("LastName", option_to_yojson user_attribute_value_to_yojson x.last_name);
      ("FirstName", option_to_yojson user_attribute_value_to_yojson x.first_name);
      ("MessageAction", option_to_yojson message_action_to_yojson x.message_action);
      ("UserName", Some (username_to_yojson x.user_name));
    ]

let create_usage_report_subscription_result_to_yojson (x : create_usage_report_subscription_result)
    =
  assoc_to_yojson
    [
      ("Schedule", option_to_yojson usage_report_schedule_to_yojson x.schedule);
      ("S3BucketName", option_to_yojson string__to_yojson x.s3_bucket_name);
    ]

let create_usage_report_subscription_request_to_yojson = unit_to_yojson

let create_updated_image_result_to_yojson (x : create_updated_image_result) =
  assoc_to_yojson
    [
      ("canUpdateImage", option_to_yojson boolean__to_yojson x.can_update_image);
      ("image", option_to_yojson image_to_yojson x.image);
    ]

let create_updated_image_request_to_yojson (x : create_updated_image_request) =
  assoc_to_yojson
    [
      ("dryRun", option_to_yojson boolean__to_yojson x.dry_run);
      ("newImageTags", option_to_yojson tags_to_yojson x.new_image_tags);
      ("newImageDisplayName", option_to_yojson display_name_to_yojson x.new_image_display_name);
      ("newImageDescription", option_to_yojson description_to_yojson x.new_image_description);
      ("newImageName", Some (name_to_yojson x.new_image_name));
      ("existingImageName", Some (name_to_yojson x.existing_image_name));
    ]

let create_theme_for_stack_result_to_yojson (x : create_theme_for_stack_result) =
  assoc_to_yojson [ ("Theme", option_to_yojson theme_to_yojson x.theme) ]

let create_theme_for_stack_request_to_yojson (x : create_theme_for_stack_request) =
  assoc_to_yojson
    [
      ("FaviconS3Location", Some (s3_location_to_yojson x.favicon_s3_location));
      ("OrganizationLogoS3Location", Some (s3_location_to_yojson x.organization_logo_s3_location));
      ("ThemeStyling", Some (theme_styling_to_yojson x.theme_styling));
      ("TitleText", Some (theme_title_text_to_yojson x.title_text));
      ("FooterLinks", option_to_yojson theme_footer_links_to_yojson x.footer_links);
      ("StackName", Some (name_to_yojson x.stack_name));
    ]

let create_streaming_url_result_to_yojson (x : create_streaming_url_result) =
  assoc_to_yojson
    [
      ("Expires", option_to_yojson timestamp_to_yojson x.expires);
      ("StreamingURL", option_to_yojson string__to_yojson x.streaming_ur_l);
    ]

let long_to_yojson = long_to_yojson

let create_streaming_url_request_to_yojson (x : create_streaming_url_request) =
  assoc_to_yojson
    [
      ("SessionContext", option_to_yojson string__to_yojson x.session_context);
      ("Validity", option_to_yojson long_to_yojson x.validity);
      ("ApplicationId", option_to_yojson string__to_yojson x.application_id);
      ("UserId", Some (streaming_url_user_id_to_yojson x.user_id));
      ("FleetName", Some (string__to_yojson x.fleet_name));
      ("StackName", Some (string__to_yojson x.stack_name));
    ]

let create_stack_result_to_yojson (x : create_stack_result) =
  assoc_to_yojson [ ("Stack", option_to_yojson stack_to_yojson x.stack) ]

let create_stack_request_to_yojson (x : create_stack_request) =
  assoc_to_yojson
    [
      ("AgentAccessConfig", option_to_yojson agent_access_config_to_yojson x.agent_access_config);
      ("ContentRedirection", option_to_yojson content_redirection_to_yojson x.content_redirection);
      ( "StreamingExperienceSettings",
        option_to_yojson streaming_experience_settings_to_yojson x.streaming_experience_settings );
      ("EmbedHostDomains", option_to_yojson embed_host_domains_to_yojson x.embed_host_domains);
      ("AccessEndpoints", option_to_yojson access_endpoint_list_to_yojson x.access_endpoints);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("ApplicationSettings", option_to_yojson application_settings_to_yojson x.application_settings);
      ("UserSettings", option_to_yojson user_setting_list_to_yojson x.user_settings);
      ("FeedbackURL", option_to_yojson feedback_ur_l_to_yojson x.feedback_ur_l);
      ("RedirectURL", option_to_yojson redirect_ur_l_to_yojson x.redirect_ur_l);
      ("StorageConnectors", option_to_yojson storage_connector_list_to_yojson x.storage_connectors);
      ("DisplayName", option_to_yojson display_name_to_yojson x.display_name);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Name", Some (name_to_yojson x.name));
    ]

let dry_run_operation_exception_to_yojson (x : dry_run_operation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let create_imported_image_result_to_yojson (x : create_imported_image_result) =
  assoc_to_yojson [ ("Image", option_to_yojson image_to_yojson x.image) ]

let image_import_description_to_yojson = string_to_yojson
let image_import_display_name_to_yojson = string_to_yojson

let agent_software_version_to_yojson (x : agent_software_version) =
  match x with
  | ALWAYS_LATEST -> `String "ALWAYS_LATEST"
  | CURRENT_LATEST -> `String "CURRENT_LATEST"

let app_name_to_yojson = string_to_yojson
let app_display_name_to_yojson = string_to_yojson
let file_path_to_yojson = string_to_yojson
let launch_parameters_to_yojson = string_to_yojson

let application_config_to_yojson (x : application_config) =
  assoc_to_yojson
    [
      ("LaunchParameters", option_to_yojson launch_parameters_to_yojson x.launch_parameters);
      ("WorkingDirectory", option_to_yojson file_path_to_yojson x.working_directory);
      ("AbsoluteManifestPath", option_to_yojson file_path_to_yojson x.absolute_manifest_path);
      ("AbsoluteIconPath", option_to_yojson file_path_to_yojson x.absolute_icon_path);
      ("AbsoluteAppPath", Some (file_path_to_yojson x.absolute_app_path));
      ("DisplayName", option_to_yojson app_display_name_to_yojson x.display_name);
      ("Name", Some (app_name_to_yojson x.name));
    ]

let app_catalog_config_to_yojson tree = list_to_yojson application_config_to_yojson tree

let create_imported_image_request_to_yojson (x : create_imported_image_request) =
  assoc_to_yojson
    [
      ("DryRun", option_to_yojson boolean__to_yojson x.dry_run);
      ("AppCatalogConfig", option_to_yojson app_catalog_config_to_yojson x.app_catalog_config);
      ( "AgentSoftwareVersion",
        option_to_yojson agent_software_version_to_yojson x.agent_software_version );
      ( "RuntimeValidationConfig",
        option_to_yojson runtime_validation_config_to_yojson x.runtime_validation_config );
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("DisplayName", option_to_yojson image_import_display_name_to_yojson x.display_name);
      ("Description", option_to_yojson image_import_description_to_yojson x.description);
      ("IamRoleArn", option_to_yojson arn_to_yojson x.iam_role_arn);
      ("WorkspaceImageId", option_to_yojson workspace_image_id_to_yojson x.workspace_image_id);
      ("SourceAmiId", option_to_yojson photon_ami_id_to_yojson x.source_ami_id);
      ("Name", Some (name_to_yojson x.name));
    ]

let create_image_builder_streaming_url_result_to_yojson
    (x : create_image_builder_streaming_url_result) =
  assoc_to_yojson
    [
      ("Expires", option_to_yojson timestamp_to_yojson x.expires);
      ("StreamingURL", option_to_yojson string__to_yojson x.streaming_ur_l);
    ]

let create_image_builder_streaming_url_request_to_yojson
    (x : create_image_builder_streaming_url_request) =
  assoc_to_yojson
    [
      ("Validity", option_to_yojson long_to_yojson x.validity);
      ("Name", Some (string__to_yojson x.name));
    ]

let create_image_builder_result_to_yojson (x : create_image_builder_result) =
  assoc_to_yojson [ ("ImageBuilder", option_to_yojson image_builder_to_yojson x.image_builder) ]

let create_image_builder_request_to_yojson (x : create_image_builder_request) =
  assoc_to_yojson
    [
      ("DisableIMDSV1", option_to_yojson boolean_object_to_yojson x.disable_imds_v1);
      ("SoftwaresToUninstall", option_to_yojson string_list_to_yojson x.softwares_to_uninstall);
      ("SoftwaresToInstall", option_to_yojson string_list_to_yojson x.softwares_to_install);
      ("RootVolumeConfig", option_to_yojson volume_config_to_yojson x.root_volume_config);
      ("AccessEndpoints", option_to_yojson access_endpoint_list_to_yojson x.access_endpoints);
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ( "AppstreamAgentVersion",
        option_to_yojson appstream_agent_version_to_yojson x.appstream_agent_version );
      ("DomainJoinInfo", option_to_yojson domain_join_info_to_yojson x.domain_join_info);
      ( "EnableDefaultInternetAccess",
        option_to_yojson boolean_object_to_yojson x.enable_default_internet_access );
      ("IamRoleArn", option_to_yojson arn_to_yojson x.iam_role_arn);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("DisplayName", option_to_yojson display_name_to_yojson x.display_name);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("InstanceType", Some (string__to_yojson x.instance_type));
      ("ImageArn", option_to_yojson arn_to_yojson x.image_arn);
      ("ImageName", option_to_yojson string__to_yojson x.image_name);
      ("Name", Some (name_to_yojson x.name));
    ]

let create_fleet_result_to_yojson (x : create_fleet_result) =
  assoc_to_yojson [ ("Fleet", option_to_yojson fleet_to_yojson x.fleet) ]

let create_fleet_request_to_yojson (x : create_fleet_request) =
  assoc_to_yojson
    [
      ("DisableIMDSV1", option_to_yojson boolean_object_to_yojson x.disable_imds_v1);
      ("RootVolumeConfig", option_to_yojson volume_config_to_yojson x.root_volume_config);
      ("MaxSessionsPerInstance", option_to_yojson integer_to_yojson x.max_sessions_per_instance);
      ( "SessionScriptS3Location",
        option_to_yojson s3_location_to_yojson x.session_script_s3_location );
      ( "UsbDeviceFilterStrings",
        option_to_yojson usb_device_filter_strings_to_yojson x.usb_device_filter_strings );
      ("MaxConcurrentSessions", option_to_yojson integer_to_yojson x.max_concurrent_sessions);
      ("Platform", option_to_yojson platform_type_to_yojson x.platform);
      ("StreamView", option_to_yojson stream_view_to_yojson x.stream_view);
      ("IamRoleArn", option_to_yojson arn_to_yojson x.iam_role_arn);
      ( "IdleDisconnectTimeoutInSeconds",
        option_to_yojson integer_to_yojson x.idle_disconnect_timeout_in_seconds );
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("DomainJoinInfo", option_to_yojson domain_join_info_to_yojson x.domain_join_info);
      ( "EnableDefaultInternetAccess",
        option_to_yojson boolean_object_to_yojson x.enable_default_internet_access );
      ("DisplayName", option_to_yojson display_name_to_yojson x.display_name);
      ("Description", option_to_yojson description_to_yojson x.description);
      ( "DisconnectTimeoutInSeconds",
        option_to_yojson integer_to_yojson x.disconnect_timeout_in_seconds );
      ("MaxUserDurationInSeconds", option_to_yojson integer_to_yojson x.max_user_duration_in_seconds);
      ("VpcConfig", option_to_yojson vpc_config_to_yojson x.vpc_config);
      ("ComputeCapacity", option_to_yojson compute_capacity_to_yojson x.compute_capacity);
      ("FleetType", option_to_yojson fleet_type_to_yojson x.fleet_type);
      ("InstanceType", Some (string__to_yojson x.instance_type));
      ("ImageArn", option_to_yojson arn_to_yojson x.image_arn);
      ("ImageName", option_to_yojson name_to_yojson x.image_name);
      ("Name", Some (name_to_yojson x.name));
    ]

let create_export_image_task_result_to_yojson (x : create_export_image_task_result) =
  assoc_to_yojson
    [ ("ExportImageTask", option_to_yojson export_image_task_to_yojson x.export_image_task) ]

let create_export_image_task_request_to_yojson (x : create_export_image_task_request) =
  assoc_to_yojson
    [
      ("AmiDescription", option_to_yojson description_to_yojson x.ami_description);
      ("TagSpecifications", option_to_yojson tags_to_yojson x.tag_specifications);
      ("IamRoleArn", Some (arn_to_yojson x.iam_role_arn));
      ("AmiName", Some (ami_name_to_yojson x.ami_name));
      ("ImageName", Some (name_to_yojson x.image_name));
    ]

let entitlement_already_exists_exception_to_yojson (x : entitlement_already_exists_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let create_entitlement_result_to_yojson (x : create_entitlement_result) =
  assoc_to_yojson [ ("Entitlement", option_to_yojson entitlement_to_yojson x.entitlement) ]

let create_entitlement_request_to_yojson (x : create_entitlement_request) =
  assoc_to_yojson
    [
      ("Attributes", Some (entitlement_attribute_list_to_yojson x.attributes));
      ("AppVisibility", Some (app_visibility_to_yojson x.app_visibility));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("StackName", Some (name_to_yojson x.stack_name));
      ("Name", Some (name_to_yojson x.name));
    ]

let create_directory_config_result_to_yojson (x : create_directory_config_result) =
  assoc_to_yojson
    [ ("DirectoryConfig", option_to_yojson directory_config_to_yojson x.directory_config) ]

let create_directory_config_request_to_yojson (x : create_directory_config_request) =
  assoc_to_yojson
    [
      ( "CertificateBasedAuthProperties",
        option_to_yojson certificate_based_auth_properties_to_yojson
          x.certificate_based_auth_properties );
      ( "ServiceAccountCredentials",
        option_to_yojson service_account_credentials_to_yojson x.service_account_credentials );
      ( "OrganizationalUnitDistinguishedNames",
        Some
          (organizational_unit_distinguished_names_list_to_yojson
             x.organizational_unit_distinguished_names) );
      ("DirectoryName", Some (directory_name_to_yojson x.directory_name));
    ]

let create_application_result_to_yojson (x : create_application_result) =
  assoc_to_yojson [ ("Application", option_to_yojson application_to_yojson x.application) ]

let create_application_request_to_yojson (x : create_application_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("AppBlockArn", Some (arn_to_yojson x.app_block_arn));
      ("InstanceFamilies", Some (string_list_to_yojson x.instance_families));
      ("Platforms", Some (platforms_to_yojson x.platforms));
      ("LaunchParameters", option_to_yojson string__to_yojson x.launch_parameters);
      ("WorkingDirectory", option_to_yojson string__to_yojson x.working_directory);
      ("LaunchPath", Some (string__to_yojson x.launch_path));
      ("IconS3Location", Some (s3_location_to_yojson x.icon_s3_location));
      ("Description", option_to_yojson description_to_yojson x.description);
      ("DisplayName", option_to_yojson display_name_to_yojson x.display_name);
      ("Name", Some (name_to_yojson x.name));
    ]

let create_app_block_builder_streaming_url_result_to_yojson
    (x : create_app_block_builder_streaming_url_result) =
  assoc_to_yojson
    [
      ("Expires", option_to_yojson timestamp_to_yojson x.expires);
      ("StreamingURL", option_to_yojson string__to_yojson x.streaming_ur_l);
    ]

let create_app_block_builder_streaming_url_request_to_yojson
    (x : create_app_block_builder_streaming_url_request) =
  assoc_to_yojson
    [
      ("Validity", option_to_yojson long_to_yojson x.validity);
      ("AppBlockBuilderName", Some (name_to_yojson x.app_block_builder_name));
    ]

let create_app_block_builder_result_to_yojson (x : create_app_block_builder_result) =
  assoc_to_yojson
    [ ("AppBlockBuilder", option_to_yojson app_block_builder_to_yojson x.app_block_builder) ]

let create_app_block_builder_request_to_yojson (x : create_app_block_builder_request) =
  assoc_to_yojson
    [
      ("DisableIMDSV1", option_to_yojson boolean_object_to_yojson x.disable_imds_v1);
      ("AccessEndpoints", option_to_yojson access_endpoint_list_to_yojson x.access_endpoints);
      ("IamRoleArn", option_to_yojson arn_to_yojson x.iam_role_arn);
      ( "EnableDefaultInternetAccess",
        option_to_yojson boolean_object_to_yojson x.enable_default_internet_access );
      ("VpcConfig", Some (vpc_config_to_yojson x.vpc_config));
      ("InstanceType", Some (string__to_yojson x.instance_type));
      ("Platform", Some (app_block_builder_platform_type_to_yojson x.platform));
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("DisplayName", option_to_yojson display_name_to_yojson x.display_name);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Name", Some (name_to_yojson x.name));
    ]

let create_app_block_result_to_yojson (x : create_app_block_result) =
  assoc_to_yojson [ ("AppBlock", option_to_yojson app_block_to_yojson x.app_block) ]

let create_app_block_request_to_yojson (x : create_app_block_request) =
  assoc_to_yojson
    [
      ("PackagingType", option_to_yojson packaging_type_to_yojson x.packaging_type);
      ( "PostSetupScriptDetails",
        option_to_yojson script_details_to_yojson x.post_setup_script_details );
      ("Tags", option_to_yojson tags_to_yojson x.tags);
      ("SetupScriptDetails", option_to_yojson script_details_to_yojson x.setup_script_details);
      ("SourceS3Location", Some (s3_location_to_yojson x.source_s3_location));
      ("DisplayName", option_to_yojson display_name_to_yojson x.display_name);
      ("Description", option_to_yojson description_to_yojson x.description);
      ("Name", Some (name_to_yojson x.name));
    ]

let copy_image_response_to_yojson (x : copy_image_response) =
  assoc_to_yojson
    [ ("DestinationImageName", option_to_yojson name_to_yojson x.destination_image_name) ]

let copy_image_request_to_yojson (x : copy_image_request) =
  assoc_to_yojson
    [
      ( "DestinationImageDescription",
        option_to_yojson description_to_yojson x.destination_image_description );
      ("DestinationRegion", Some (region_name_to_yojson x.destination_region));
      ("DestinationImageName", Some (name_to_yojson x.destination_image_name));
      ("SourceImageName", Some (name_to_yojson x.source_image_name));
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

let batch_associate_user_stack_result_to_yojson (x : batch_associate_user_stack_result) =
  assoc_to_yojson
    [ ("errors", option_to_yojson user_stack_association_error_list_to_yojson x.errors) ]

let batch_associate_user_stack_request_to_yojson (x : batch_associate_user_stack_request) =
  assoc_to_yojson
    [
      ( "UserStackAssociations",
        Some (user_stack_association_list_to_yojson x.user_stack_associations) );
    ]

let associate_software_to_image_builder_result_to_yojson = unit_to_yojson

let associate_software_to_image_builder_request_to_yojson
    (x : associate_software_to_image_builder_request) =
  assoc_to_yojson
    [
      ("SoftwareNames", Some (string_list_to_yojson x.software_names));
      ("ImageBuilderName", Some (name_to_yojson x.image_builder_name));
    ]

let associate_fleet_result_to_yojson = unit_to_yojson

let associate_fleet_request_to_yojson (x : associate_fleet_request) =
  assoc_to_yojson
    [
      ("StackName", Some (string__to_yojson x.stack_name));
      ("FleetName", Some (string__to_yojson x.fleet_name));
    ]

let associate_application_to_entitlement_result_to_yojson = unit_to_yojson

let associate_application_to_entitlement_request_to_yojson
    (x : associate_application_to_entitlement_request) =
  assoc_to_yojson
    [
      ("ApplicationIdentifier", Some (string__to_yojson x.application_identifier));
      ("EntitlementName", Some (name_to_yojson x.entitlement_name));
      ("StackName", Some (name_to_yojson x.stack_name));
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
      ("ApplicationArn", Some (arn_to_yojson x.application_arn));
      ("FleetName", Some (name_to_yojson x.fleet_name));
    ]

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
      ("AppBlockBuilderName", Some (name_to_yojson x.app_block_builder_name));
      ("AppBlockArn", Some (arn_to_yojson x.app_block_arn));
    ]
